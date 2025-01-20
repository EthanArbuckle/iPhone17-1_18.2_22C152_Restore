CFStringRef MKTypeToHuman(int a1, const __CFString *a2, const __CFDictionary *a3)
{
  CFStringRef v4;

  v4 = 0;
  MKTypeClassify(a1, a2, &v4, 0, 0, a3);
  return v4;
}

uint64_t MKTypeClassify(int a1, const __CFString *a2, CFStringRef *a3, int *a4, __int16 *a5, const __CFDictionary *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  if (!a2)
  {
    int v15 = 0;
    __int16 v14 = 0;
    uint64_t result = 22;
    if (!a5) {
      goto LABEL_24;
    }
LABEL_23:
    *a5 = v14;
    goto LABEL_24;
  }
  v17 = 0;
  v18 = 0;
  int v11 = MKCFOptionBit(a6, @"Remap Partition Types", 1);
  if (a1 > 15)
  {
    if (a1 == 16)
    {
      CFStringGetCString(a2, buffer, 256, 0x8000100u);
      GPTuuidType2HumanExtended(cStr, buffer, 256, v11, &v18);
      if (a3) {
        *a3 = CFStringCreateWithCString(0, (const char *)cStr, 0x8000100u);
      }
      v16 = v18;
      if (!v18) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
    if (a1 != 32) {
      goto LABEL_7;
    }
  }
  else if (a1 != 1 && a1 != 8)
  {
LABEL_7:
    if (a3)
    {
      CFStringRef v12 = (const __CFString *)CFRetain(a2);
      uint64_t result = 0;
      __int16 v14 = 0;
      *a3 = v12;
      goto LABEL_22;
    }
LABEL_21:
    uint64_t result = 0;
    __int16 v14 = 0;
LABEL_22:
    int v15 = 2;
    if (!a5) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  CFStringGetCString(a2, buffer, 256, 0x8000100u);
  PMTypeToHumanExtended((char *)cStr, buffer, 256, a1, v11, (uint64_t *)&v17);
  if (a3) {
    *a3 = CFStringCreateWithCString(0, (const char *)cStr, 0x8000100u);
  }
  v16 = v17;
  if (!v17) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t result = 0;
  __int16 v14 = *v16;
  int v15 = (unsigned __int16)v16[1];
  if (a5) {
    goto LABEL_23;
  }
LABEL_24:
  if (a4) {
    *a4 = v15;
  }
  return result;
}

uint64_t MKCFOptionBit(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 == CFNumberGetTypeID())
  {
    BOOL v7 = CFBooleanGetValue(v5) == 1;
    goto LABEL_10;
  }
  if (v6 == CFBooleanGetTypeID())
  {
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x263EFFB40])) {
      return a3;
    }
    return 0;
  }
  if (v6 != CFStringGetTypeID()) {
    return 0;
  }
  BOOL v7 = CFStringCompare((CFStringRef)v5, @"YES", 1uLL) == kCFCompareEqualTo;
LABEL_10:
  if (!v7) {
    return 0;
  }
  return a3;
}

__int16 *GPTuuidType2HumanExtended(__int16 *result, const char *a2, int a3, int a4, __int16 **a5)
{
  v8 = a2;
  v9 = (char *)result;
  if (result != (__int16 *)a2) {
    *(unsigned char *)uint64_t result = 0;
  }
  if (!a2)
  {
    v13 = 0;
    goto LABEL_19;
  }
  uint64_t result = lookupDESC(a2);
  v10 = result;
  if (result)
  {
    if (a4)
    {
      if (result == &GPTDescriptors)
      {
        v10 = &GPTDescriptors;
      }
      else
      {
        int v11 = &word_264497238;
        while (strcasecmp((const char *)v10 + 4, (const char *)v11 - 52))
        {
          if (v11 != v10)
          {
            uint64_t v12 = *((void *)v11 + 6);
            v11 += 28;
            if (v12) {
              continue;
            }
          }
          goto LABEL_17;
        }
        v10 = v11 - 28;
      }
    }
LABEL_17:
    v8 = (const char *)*((void *)v10 + 6);
    goto LABEL_18;
  }
  v13 = 0;
  if (v9 != v8)
  {
LABEL_18:
    uint64_t result = (__int16 *)strlcpy(v9, v8, a3);
    v13 = v10;
  }
LABEL_19:
  if (a5) {
    *a5 = v13;
  }
  return result;
}

__int16 *lookupDESC(const char *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  memset(uu, 0, sizeof(uu));
  int v2 = uuid_parse(a1, uu);
  v3 = &GPTDescriptors;
  v4 = "Reserved";
  while (1)
  {
    if (!v2) {
      v4 = (const char *)(v3 + 2);
    }
    if (!strcasecmp(v4, a1)) {
      break;
    }
    v4 = (const char *)*((void *)v3 + 13);
    v3 += 28;
    if (!v4) {
      return 0;
    }
  }
  return v3;
}

uint64_t MKMediaCreateWithPath(uint64_t a1, char *a2, const __CFDictionary *a3, _DWORD *a4)
{
  uint64_t v33 = 0;
  if (!a2)
  {
    uint64_t v8 = 0;
    int v9 = 22;
    goto LABEL_5;
  }
  memset(&v32, 0, sizeof(v32));
  if (stat(a2, &v32))
  {
    uint64_t v8 = 0;
    int v9 = *__error();
LABEL_5:
    int v34 = v9;
    goto LABEL_6;
  }
  if ((v32.st_mode & 0xF000) == 0x8000)
  {
    int v11 = &kMKMediaFileVector;
  }
  else if (devname(v32.st_rdev, 0x6000u))
  {
    int v11 = &kMKMediaBlockDeviceVector;
  }
  else
  {
    int v11 = &kMKMediaCharDeviceVector;
  }
  int v34 = MKCreateMediaDeviceRefcon(&v33, -1, a2);
  if (v34)
  {
    uint64_t v8 = 0;
  }
  else
  {
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (a3) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    __int16 v14 = MutableCopy;
    uint64_t valuePtr = 0;
    int v15 = strnstr(a2, "disk", 0x40uLL);
    if (v15)
    {
      mach_port_t v16 = *MEMORY[0x263F0EC88];
      CFDictionaryRef v17 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, v15);
      io_service_t MatchingService = IOServiceGetMatchingService(v16, v17);
      if (MatchingService)
      {
        io_registry_entry_t v19 = MatchingService;
        CFTypeRef v20 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"Physical Interconnect Location", v12, 3u);
        if (v20)
        {
          int v21 = 1;
          HIDWORD(valuePtr) = 1;
          if (CFEqual(@"Internal", v20)) {
            LODWORD(valuePtr) = 1;
          }
          else {
            int v21 = 0;
          }
          CFRelease(v20);
          LODWORD(v20) = 1;
        }
        else
        {
          int v21 = 0;
        }
        CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, @"Writable", v12, 0);
        if (CFProperty)
        {
          LODWORD(v20) = v20 | 2;
          HIDWORD(valuePtr) = v20;
          if (!CFBooleanGetValue(CFProperty))
          {
            v21 |= 2u;
            LODWORD(valuePtr) = v21;
          }
        }
        CFBooleanRef v23 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, @"Removable", v12, 0);
        if (v23)
        {
          LODWORD(v20) = v20 | 4;
          HIDWORD(valuePtr) = v20;
          if (CFBooleanGetValue(v23))
          {
            v21 |= 4u;
            LODWORD(valuePtr) = v21;
          }
        }
        CFBooleanRef v24 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, @"Ejectable", v12, 0);
        if (v24)
        {
          CFBooleanRef v25 = v24;
          HIDWORD(valuePtr) = v20 | 8;
          if (CFBooleanGetValue(v24)) {
            LODWORD(valuePtr) = v21 | 8;
          }
          CFRelease(v25);
        }
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v12, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (Mutable)
        {
          v27 = Mutable;
          CFNumberRef v28 = CFNumberCreate(0, kCFNumberSInt32Type, (char *)&valuePtr + 4);
          if (v28)
          {
            CFNumberRef v29 = v28;
            CFDictionarySetValue(v27, @"valid", v28);
            CFRelease(v29);
            CFNumberRef v30 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            if (v30)
            {
              CFNumberRef v31 = v30;
              CFDictionarySetValue(v27, @"attributes", v30);
              CFRelease(v31);
            }
          }
          CFDictionarySetValue(v14, @"Characteristics", v27);
          CFRelease(v27);
        }
      }
    }
    uint64_t v8 = MKMediaCreate(a1, v33, (uint64_t)v11, v14, &v34);
    if (v14) {
      CFRelease(v14);
    }
  }
LABEL_6:
  if (a4) {
    *a4 = v34;
  }
  return v8;
}

uint64_t MKCreateMediaDeviceRefcon(void *a1, int a2, const char *a3)
{
  *a1 = 0;
  CFTypeID v6 = malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  *CFTypeID v6 = 1296786550;
  v6[1] = a2;
  if (a3) {
    uint64_t v8 = strdup(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t result = 0;
  *((void *)v7 + 1) = v8;
  *((void *)v7 + 2) = 0;
  *a1 = v7;
  return result;
}

uint64_t MKMediaCreate(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, int *a5)
{
  if (!a3
    || *(_DWORD *)a3
    || !*(void *)(a3 + 8)
    || !*(void *)(a3 + 16)
    || !*(void *)(a3 + 24)
    || !*(void *)(a3 + 32)
    || !*(void *)(a3 + 40)
    || !*(void *)(a3 + 48)
    || !*(void *)(a3 + 56)
    || !*(void *)(a3 + 64))
  {
    uint64_t v6 = 0;
    int updated = 22;
    goto LABEL_4;
  }
  int v17 = 0;
  uint64_t v10 = _MKMediaCreate(a1, a2, a3, (uint64_t)a4, &v17);
  uint64_t v6 = v10;
  int updated = v17;
  if (v17) {
    goto LABEL_25;
  }
  *(void *)(v10 + 136) = 0;
  int updated = pthread_rwlock_init((pthread_rwlock_t *)(v10 + 144), 0);
  if (updated) {
    goto LABEL_25;
  }
  int updated = (*(uint64_t (**)(void, const __CFDictionary *))(v6 + 24))(*(void *)(v6 + 88), a4);
  if (updated) {
    goto LABEL_25;
  }
  if (a4)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a4, @"Characteristics");
    if (Value)
    {
      CFDictionaryRef v12 = Value;
      CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(Value, @"attributes");
      if (v13) {
        CFNumberGetValue(v13, kCFNumberSInt32Type, (void *)(v6 + 124));
      }
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v12, @"valid");
      if (v14) {
        CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(v6 + 128));
      }
    }
  }
  int updated = _MKMediaUpdateGeometryFromDict(v6);
  if (updated)
  {
LABEL_25:
    if (!v6) {
      goto LABEL_4;
    }
LABEL_26:
    uint64_t v15 = *(void *)(v6 + 136);
    if (v15) {
      _MKMediaBufferPoolDestroy(v15);
    }
    pthread_rwlock_destroy((pthread_rwlock_t *)(v6 + 144));
    CFRelease((CFTypeRef)v6);
    uint64_t v6 = 0;
    goto LABEL_4;
  }
  mach_port_t v16 = _MKMediaBufferPoolCreate(4, *(_DWORD *)(v6 + 104));
  *(void *)(v6 + 136) = v16;
  if (v16)
  {
    int updated = 0;
    goto LABEL_4;
  }
  int updated = 12;
  if (v6) {
    goto LABEL_26;
  }
LABEL_4:
  if (a5) {
    *a5 = updated;
  }
  return v6;
}

uint64_t _MKMediaCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  if (!_kMKMediaID)
  {
    _kMKMediaClass = 0;
    unk_267D28100 = "MKMedia";
    qword_267D28108 = 0;
    unk_267D28110 = 0;
    qword_267D28120 = 0;
    unk_267D28128 = 0;
    qword_267D28118 = (uint64_t)_MKMediaCFRuntimeFinalize;
    qword_267D28130 = (uint64_t)_MKMediaCFRuntimeCopyFormattingDesc;
    qword_267D28138 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
    _kMKMediaID = _CFRuntimeRegisterClass();
  }
  if (*(_DWORD *)a3)
  {
    uint64_t result = 0;
    int v9 = 22;
  }
  else
  {
    uint64_t result = _CFRuntimeCreateInstance();
    if (result)
    {
      int v9 = 0;
      *(void *)(result + 88) = a2;
      *(_DWORD *)(result + 16) = *(_DWORD *)a3;
      *(_OWORD *)(result + 24) = *(_OWORD *)(a3 + 8);
      *(_OWORD *)(result + 40) = *(_OWORD *)(a3 + 24);
      *(_OWORD *)(result + 56) = *(_OWORD *)(a3 + 40);
      *(_OWORD *)(result + 72) = *(_OWORD *)(a3 + 56);
    }
    else
    {
      int v9 = 12;
    }
  }
  *a5 = v9;
  return result;
}

uint64_t _MKMediaClassInitialize()
{
  _kMKMediaClass = 0;
  unk_267D28100 = "MKMedia";
  qword_267D28108 = 0;
  unk_267D28110 = 0;
  qword_267D28120 = 0;
  unk_267D28128 = 0;
  qword_267D28118 = (uint64_t)_MKMediaCFRuntimeFinalize;
  qword_267D28130 = (uint64_t)_MKMediaCFRuntimeCopyFormattingDesc;
  qword_267D28138 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
  uint64_t result = _CFRuntimeRegisterClass();
  _kMKMediaID = result;
  return result;
}

uint64_t _MKMediaBlockDeviceInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v21 = 0;
  strcpy(__source, "/dev/");
  if (!a1 || *(_DWORD *)a1 != 1296786550) {
    return 22;
  }
  memset(&v20, 0, sizeof(v20));
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    CFNumberRef v13 = *(const char **)(a1 + 8);
    if (v13)
    {
      if (stat(v13, &v20)) {
        return *__error();
      }
      CFNumberRef v14 = devname(v20.st_rdev, 0x2000u);
      if (!v14) {
        return 2;
      }
      uint64_t v15 = v14;
      size_t v16 = strlen(v14) + 6;
      int v17 = (char *)malloc_type_malloc(v16, 0xB6C7663DuLL);
      strlcpy(v17, __source, v16);
      strlcat(v17, v15, v16);
      free(*(void **)(a1 + 8));
      *(void *)(a1 + 8) = v17;
      int v18 = _MKMediaOpenFile(v17, theDict, (int *)&v21 + 1, (int *)&v21);
      if (v18 < 0) {
        return *__error();
      }
      *(_DWORD *)(a1 + 4) = v18;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"Writable");
    if (Value) {
      HIDWORD(v21) = CFEqual(Value, (CFTypeRef)*MEMORY[0x263EFFB40]);
    }
  }
  *(void *)(a1 + 8) = strdup("<unknown device>");
LABEL_8:
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 16) = Mutable;
  if (!Mutable) {
    return 12;
  }
  uint64_t v7 = (const void *)*MEMORY[0x263EFFB40];
  uint64_t v8 = (const void *)*MEMORY[0x263EFFB38];
  if (HIDWORD(v21)) {
    int v9 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    int v9 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(Mutable, @"Writable", v9);
  if (v21) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v8;
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Shared Writer", v10);
  CFStringRef v11 = CFStringCreateWithCString(v5, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Path", v11);
  CFRelease(v11);
  return 0;
}

uint64_t _MKMediaOpenFile(const char *a1, CFDictionaryRef theDict, int *a3, int *a4)
{
  uint64_t v7 = (CFTypeRef *)MEMORY[0x263EFFB40];
  if (theDict)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"Writable");
    uint64_t v10 = CFDictionaryGetValue(theDict, @"Shared Writer");
    if (Value && CFEqual(Value, *v7))
    {
      int v11 = 2;
      int v12 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  int v12 = 0;
  int v11 = 0;
LABEL_7:
  *a3 = v12;
  if (v10)
  {
    if (CFEqual(v10, *v7))
    {
      int v13 = 1;
      int v14 = 16;
LABEL_12:
      v11 |= v14;
      *a4 = v13;
      return open(a1, v11, 438);
    }
    if (CFEqual(v10, (CFTypeRef)*MEMORY[0x263EFFB38]))
    {
      int v13 = 0;
      int v14 = 32;
      goto LABEL_12;
    }
  }
  return open(a1, v11, 438);
}

uint64_t _MKMediaUpdateGeometryFromDict(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (*(uint64_t (**)(void, __CFString *))(a1 + 40))(*(void *)(a1 + 88), @"Geometry");
    if (v2)
    {
      v3 = (const void *)v2;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v3)) {
        goto LABEL_16;
      }
      CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)v3, @"Sector Count");
      if (!Value) {
        goto LABEL_16;
      }
      uint64_t v6 = Value;
      CFTypeID v7 = CFNumberGetTypeID();
      if (v7 != CFGetTypeID(v6)) {
        goto LABEL_16;
      }
      CFNumberGetValue((CFNumberRef)v6, kCFNumberSInt64Type, (void *)(a1 + 96));
      uint64_t v8 = CFDictionaryGetValue((CFDictionaryRef)v3, @"Block Size");
      if (!v8) {
        goto LABEL_16;
      }
      int v9 = v8;
      CFTypeID v10 = CFNumberGetTypeID();
      if (v10 != CFGetTypeID(v9)) {
        goto LABEL_16;
      }
      CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt32Type, (void *)(a1 + 104));
      int v11 = CFDictionaryGetValue((CFDictionaryRef)v3, @"Maximum Transfer Sector Count");
      if (v11)
      {
        int v12 = v11;
        CFTypeID v13 = CFNumberGetTypeID();
        if (v13 != CFGetTypeID(v12)) {
          goto LABEL_16;
        }
        CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt64Type, (void *)(a1 + 112));
      }
      if (!*(void *)(a1 + 112)) {
        *(void *)(a1 + 112) = ((unint64_t)*(unsigned int *)(a1 + 104) >> 4) & 0x7FFFFF;
      }
      int v14 = (const void *)(*(uint64_t (**)(void, __CFString *))(a1 + 40))(*(void *)(a1 + 88), @"Writable");
      if (v14)
      {
        uint64_t v15 = v14;
        *(_DWORD *)(a1 + 120) = CFEqual(v14, (CFTypeRef)*MEMORY[0x263EFFB40]) != 0;
        CFRelease(v15);
        uint64_t v16 = 0;
LABEL_17:
        CFRelease(v3);
        return v16;
      }
LABEL_16:
      uint64_t v16 = 22;
      goto LABEL_17;
    }
  }
  return 22;
}

uint64_t MKMediaCopyProperty(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return (*(uint64_t (**)(void))(a1 + 40))(*(void *)(a1 + 88));
  }
  else {
    return 0;
  }
}

const void *_MKMediaBlockDeviceCopyProperty(uint64_t a1, void *key)
{
  if (!key) {
    return 0;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4 && (CFAllocatorRef v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    CFDictionaryRef Value = v5;
    CFMutableDictionaryRef Mutable = 0;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    _MKMediaBlockDeviceGetGeoProperties((_DWORD *)a1, Mutable);
    CFDictionaryRef Value = CFDictionaryGetValue(Mutable, key);
    if (!Value) {
      goto LABEL_8;
    }
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Value;
}

uint64_t _MKMediaBlockDeviceGetGeoProperties(_DWORD *a1, __CFDictionary *a2)
{
  if (!a1) {
    return 22;
  }
  if (*a1 != 1296786550) {
    return 22;
  }
  int v3 = a1[1];
  if (v3 < 0) {
    return 22;
  }
  unsigned int v10 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (ioctl(v3, 0x40046418uLL, &v10)) {
    return *__error();
  }
  unint64_t v5 = v10;
  if (ioctl(a1[1], 0x40086419uLL, &v9)) {
    return *__error();
  }
  unint64_t v6 = v5 >> 9;
  v9 *= v6;
  if (ioctl(a1[1], 0x40086441uLL, &v8)) {
    return *__error();
  }
  else {
    return _MKMediaSetupGeometry(a2, v10, v9, v8 * v6);
  }
}

uint64_t _MKMediaSetupGeometry(__CFDictionary *a1, int a2, uint64_t a3, uint64_t a4)
{
  values[3] = *(void **)MEMORY[0x263EF8340];
  int valuePtr = a2;
  uint64_t v8 = a4;
  uint64_t v9 = a3;
  *(_OWORD *)keys = xmmword_264498698;
  int v12 = @"Maximum Transfer Sector Count";
  if (!a1) {
    return 22;
  }
  values[0] = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberSInt64Type, &v9);
  values[2] = CFNumberCreate(0, kCFNumberSInt64Type, &v8);
  CFDictionaryRef v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  if (!v5) {
    return 12;
  }
  CFDictionaryRef v6 = v5;
  CFDictionarySetValue(a1, @"Geometry", v5);
  CFRelease(v6);
  return 0;
}

char *_MKMediaBufferPoolCreate(int a1, unsigned int a2)
{
  CFDictionaryRef v4 = (char *)malloc_type_malloc(0x90uLL, 0x101004053EA5042uLL);
  *((_DWORD *)v4 + 28) = a1;
  *((_DWORD *)v4 + 29) = a1;
  *((_DWORD *)v4 + 30) = a2;
  if (!pthread_cond_init((pthread_cond_t *)v4, 0))
  {
    if (!pthread_mutex_init((pthread_mutex_t *)(v4 + 48), 0))
    {
      *((void *)v4 + 17) = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
      *((void *)v4 + 16) = malloc_type_calloc(a1, a2, 0xE7FF9EFDuLL);
      return v4;
    }
    pthread_cond_destroy((pthread_cond_t *)v4);
  }
  free(v4);
  return 0;
}

CFBundleRef MKAccessLibrary(__CFString *a1)
{
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.MediaKit");
  if (!BundleWithIdentifier) {
    return 0;
  }
  CFStringRef v3 = a1 ? a1 : @"MKDrivers";
  CFURLRef v4 = CFBundleCopyBundleURL(BundleWithIdentifier);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = v4;
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"Loaders/%@.bundle", v3);
  if (v6
    && ((CFStringRef v7 = v6, v8 = CFURLCreateCopyAppendingPathComponent(0, v5, v6, 1u), CFRelease(v7), v8)
     || (CFURLRef v8 = CFURLCreateWithFileSystemPath(0, v3, kCFURLPOSIXPathStyle, 1u)) != 0))
  {
    CFBundleRef v9 = CFBundleCreate(0, v8);
    CFRelease(v8);
  }
  else
  {
    CFBundleRef v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

CFURLRef MKLoadDB(__CFBundle *a1, const __CFString *a2, int *a3)
{
  if (a1)
  {
    CFURLRef v4 = CFBundleCopyResourceURL(a1, a2, @"plist", 0);
    if (v4)
    {
      CFURLRef v5 = CFReadStreamCreateWithFile(0, v4);
      CFRelease(v4);
      if (v5)
      {
        if (CFReadStreamOpen(v5))
        {
          CFURLRef v4 = (const __CFURL *)CFPropertyListCreateWithStream(0, v5, 0, 0, 0, 0);
          if (v4) {
            int v6 = 0;
          }
          else {
            int v6 = -19;
          }
        }
        else
        {
          CFURLRef v4 = 0;
          int v6 = -23;
        }
        CFReadStreamClose(v5);
        CFRelease(v5);
      }
      else
      {
        CFURLRef v4 = 0;
        int v6 = -23;
      }
    }
    else
    {
      int v6 = -43;
    }
  }
  else
  {
    CFURLRef v4 = 0;
    int v6 = -50;
  }
  if (a3) {
    *a3 = v6;
  }
  return v4;
}

__CFDictionary *MKCFBuildPartition(int a1, int a2, const __CFString *a3, const void *a4, uint64_t a5, uint64_t a6, int *a7, const void *a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  __int16 valuePtr = a2;
  uint64_t v24 = a6;
  uint64_t v25 = a5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    int v22 = -1;
    goto LABEL_24;
  }
  if (a2 && (uint64_t v15 = PMCodeSearch(a2, a1)) != 0)
  {
    a3 = CFStringCreateWithCString(0, v15, 0);
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  *(void *)&uu.byte0 = 0;
  *(void *)&uu.byte8 = 0;
  if (!a3 || !CFStringGetLength(a3))
  {
    CFStringRef v17 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
LABEL_11:
    a3 = v17;
    if (!v17)
    {
      int v22 = -5307;
      if (!a7) {
        return Mutable;
      }
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  if ((v16 & 1) == 0)
  {
    CFStringRef v17 = (const __CFString *)CFRetain(a3);
    goto LABEL_11;
  }
LABEL_12:
  CFDictionarySetValue(Mutable, @"Type", a3);
  CFRelease(a3);
  if (a4) {
    CFDictionarySetValue(Mutable, @"Name", a4);
  }
  if (v25)
  {
    CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt64Type, &v25);
    if (v18)
    {
      CFNumberRef v19 = v18;
      CFDictionarySetValue(Mutable, @"Size", v18);
      CFRelease(v19);
    }
  }
  if (v24)
  {
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt64Type, &v24);
    if (v20)
    {
      CFNumberRef v21 = v20;
      CFDictionarySetValue(Mutable, @"Offset", v20);
      CFRelease(v21);
    }
  }
  MEMORY[0x223C20E30](&uu);
  int v22 = CFDictionarySetUUID(Mutable, @"GUID", &uu);
  if (a8)
  {
    CFDictionarySetValue(Mutable, @"Options", a8);
    if (!a7) {
      return Mutable;
    }
    goto LABEL_25;
  }
LABEL_24:
  if (a7) {
LABEL_25:
  }
    *a7 = v22;
  return Mutable;
}

const char *PMCodeSearch(int a1, int a2)
{
  if (a2 <= 7)
  {
    if (a2 >= 4) {
      return 0;
    }
    return APMCodeSearch(a1);
  }
  if (a2 <= 31)
  {
    if (a2 == 8) {
      return (const char *)MBRCodeSearch(a1);
    }
    if (a2 == 16) {
      return GPTCodeSearch(a1);
    }
    return 0;
  }
  if (a2 == 32) {
    return ISOCodeSearch(a1);
  }
  if (a2 == 128) {
    return APMCodeSearch(a1);
  }
  return 0;
}

const char *GPTCodeSearch(int a1)
{
  if (!a1) {
    return "Reserved";
  }
  uint64_t v2 = &word_264497238;
  do
  {
    uint64_t result = (const char *)*((void *)v2 + 6);
    if (!result) {
      break;
    }
    int v4 = (unsigned __int16)*v2;
    v2 += 28;
  }
  while (v4 != a1);
  return result;
}

uint64_t CFDictionarySetUUID(__CFDictionary *a1, const void *a2, CFUUIDBytes *uu)
{
  if (uuid_is_null(&uu->byte0))
  {
    CFDictionaryRemoveValue(a1, a2);
    return 0;
  }
  CFUUIDRef v6 = uuid2cfstr(uu);
  if (v6)
  {
    CFUUIDRef v7 = v6;
    CFDictionarySetValue(a1, a2, v6);
    CFRelease(v7);
    return 0;
  }
  return 22;
}

CFUUIDRef uuid2cfstr(CFUUIDBytes *a1)
{
  CFUUIDRef result = CFUUIDCreateFromUUIDBytes(0, *a1);
  if (result)
  {
    CFUUIDRef v2 = result;
    CFStringRef v3 = CFUUIDCreateString(0, result);
    CFRelease(v2);
    return (const __CFUUID *)v3;
  }
  return result;
}

uint64_t MKCFPartitionAttributes(const __CFDictionary *a1, int a2, CFDictionaryRef theDict, _OWORD *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a4 && (*(_WORD *)a4 = 0, (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"Type")) != 0))
  {
    unsigned __int16 v10 = 0;
    int v8 = PMCFSetupPartitionType(a2, Value, &v10, v11);
    if (!v8) {
      LOWORD(v8) = MKGetPartitionRequisites(a1, a2, v11, v10, a4);
    }
  }
  else
  {
    LOWORD(v8) = 22;
  }
  return (__int16)v8;
}

uint64_t PMCFSetupPartitionType(int a1, const __CFString *cf, unsigned __int16 *a3, char *a4)
{
  *a3 = 0;
  *a4 = 0;
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CFStringGetTypeID())
  {
    CFStringGetCString(cf, a4, 32, 0);
    unsigned __int16 v9 = (unsigned __int16)PMDescriptorSearch(a4, a1);
    uint64_t result = 0;
    *a3 = v9;
  }
  else if (v8 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, a3);
    int v11 = (char *)PMCodeSearch(*a3, a1);
    strncpypad(a4, v11, 0x20uLL, 0);
    return 0;
  }
  else
  {
    return 22;
  }
  return result;
}

unsigned __int16 *PMDescriptorSearch(char *a1, int a2)
{
  if (a2 <= 7)
  {
    if (a2 >= 4) {
      return 0;
    }
    return APMDescriptorSearch(a1);
  }
  if (a2 <= 31)
  {
    if (a2 == 8) {
      return MBRDescriptorSearch(a1);
    }
    if (a2 == 16) {
      return (unsigned __int16 *)GPTDescriptorSearch((__int16 *)a1);
    }
    return 0;
  }
  if (a2 == 32) {
    return ISODescriptorSearch(a1);
  }
  if (a2 == 128) {
    return APMDescriptorSearch(a1);
  }
  return 0;
}

__int16 *GPTDescriptorSearch(__int16 *result)
{
  if (result)
  {
    uint64_t result = lookupDESC((const char *)result);
    if (result) {
      return (__int16 *)(unsigned __int16)*result;
    }
  }
  return result;
}

uint64_t MKGetPartitionRequisites(const __CFDictionary *a1, int a2, const char *a3, int a4, _OWORD *a5)
{
  if (!a5) {
    return 22;
  }
  *(_WORD *)a5 = 0;
  uint64_t v10 = PMSchemeSearch(a2, 0);
  if (!v10) {
    return 22;
  }
  int v11 = (const char *)v10;
  if (!a3 || !*a3)
  {
    a3 = PMCodeSearch(a4, a2);
    if (!a3) {
      return 0;
    }
  }
  CFStringRef v12 = CFStringCreateWithCString(0, v11, 0);
  if (!v12) {
    return 0;
  }
  CFStringRef v13 = v12;
  CFStringRef v14 = CFStringCreateWithCString(0, a3, 0);
  if (v14)
  {
    CFStringRef v15 = v14;
    uint64_t v16 = MKLookupSchemeFormat(a1, v13, v14, 1, a5);
    CFRelease(v13);
    CFStringRef v13 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  CFRelease(v13);
  return v16;
}

uint64_t PMSchemeSearch(unsigned __int16 a1, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  int v2 = 1;
  CFStringRef v3 = &word_264498710;
  while (v2 != a1)
  {
    int v4 = (unsigned __int16)*v3;
    v3 += 12;
    int v2 = v4;
    if (v4 == 0xFFFF) {
      return 0;
    }
  }
  if (a2) {
    *a2 = *((void *)v3 - 1);
  }
  return *((void *)v3 - 2);
}

uint64_t MKLookupSchemeFormat(CFDictionaryRef theDict, const void *a2, const __CFString *a3, char a4, _OWORD *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t result = 22;
  if (a2 && a3)
  {
    *(_OWORD *)((char *)a5 + 138) = 0u;
    a5[7] = 0u;
    a5[8] = 0u;
    a5[5] = 0u;
    a5[6] = 0u;
    a5[3] = 0u;
    a5[4] = 0u;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
    if (theDict)
    {
      uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, a2);
      if (!result) {
        return result;
      }
      CFDictionaryRef v10 = (const __CFDictionary *)result;
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)result, a3);
      CFArrayRef v12 = Value;
      if (!Value)
      {
        if ((a4 & 1) == 0) {
          return 0;
        }
        uint64_t result = (uint64_t)CFDictionaryGetValue(v10, @"Media");
        if (!result) {
          return result;
        }
        if (CFArrayDictionarySearchWithIndexOptions((const __CFArray *)result, @"LoaderID", a3, 0, 1uLL)) {
          return 0;
        }
        uint64_t result = (uint64_t)CFDictionaryGetValue(v10, @"Default");
        CFArrayRef v12 = (const __CFArray *)result;
        if (!result) {
          return result;
        }
      }
      uint64_t Count = (unsigned __int16)CFArrayGetCount(v12);
      if (Count)
      {
        CFIndex v14 = 0;
        CFStringRef v15 = (char *)a5 + 2;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v14);
          CFDictionaryRef v17 = ValueAtIndex;
          if (Value
            || (CFArrayRef v22 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Exceptions")) == 0
            || (CFArrayRef v23 = v22, CFStringGetCString(a3, buffer, 33, 0), (int)CFStrMatchlist(buffer, v23) <= 0))
          {
            *(void *)(v15 + 30) = 0;
            *(_OWORD *)CFStringRef v15 = 0u;
            *((_OWORD *)v15 + 1) = 0u;
            CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(v17, @"LoaderID");
            if (!v18) {
              return 4294966879;
            }
            CFStringGetCString(v18, v15, 33, 0);
            CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Loader Type");
            if (v19) {
              CFNumberGetValue(v19, kCFNumberSInt16Type, v15 + 34);
            }
            CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Options");
            if (v20) {
              CFNumberGetValue(v20, kCFNumberSInt16Type, v15 + 36);
            }
            unsigned int v21 = (unsigned __int16)++*(_WORD *)a5;
            if (v21 > 3) {
              return 7;
            }
            v15 += 38;
          }
          uint64_t result = 0;
          if (Count == ++v14) {
            return result;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

CFDictionaryRef CFArrayDictionarySearchWithIndexOptions(const __CFArray *a1, const void *a2, const __CFString *a3, CFIndex *a4, CFStringCompareFlags a5)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    CFIndex v11 = 0;
LABEL_13:
    CFDictionaryRef v14 = 0;
    if (a4) {
      goto LABEL_14;
    }
    return v14;
  }
  CFIndex v11 = Count;
  CFIndex v12 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v12);
    if (!ValueAtIndex) {
      goto LABEL_10;
    }
    CFDictionaryRef v14 = ValueAtIndex;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, a2);
    if (!Value) {
      goto LABEL_10;
    }
    CFStringRef v16 = Value;
    if (!a5) {
      break;
    }
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v16)) {
      break;
    }
    if (CFStringCompare(a3, v16, a5) == kCFCompareEqualTo) {
      goto LABEL_16;
    }
LABEL_10:
    if (v11 == ++v12) {
      goto LABEL_13;
    }
  }
  if (!CFEqual(a3, v16)) {
    goto LABEL_10;
  }
LABEL_16:
  CFIndex v11 = v12;
  if (!a4) {
    return v14;
  }
LABEL_14:
  *a4 = v11;
  return v14;
}

CFIndex CFStrMatchlist(const char *a1, CFArrayRef theArray)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!theArray) {
    return 0xFFFFFFFFLL;
  }
  int Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return 0xFFFFFFFFLL;
  }
  CFIndex v5 = 0;
  uint64_t v6 = Count;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v5);
    if (ValueAtIndex)
    {
      if (CFStringGetCString(ValueAtIndex, buffer, 33, 0) && !strncasecmp(a1, buffer, 0x21uLL)) {
        break;
      }
    }
    if (v6 == ++v5) {
      return 0xFFFFFFFFLL;
    }
  }
  return v5;
}

__CFDictionary *MKCFCreateMedia(CFMutableArrayRef *a1, int *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFMutableArrayRef v5 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (v5)
    {
      CFDictionarySetValue(Mutable, @"Schemes", v5);
      CFRelease(v5);
      int v6 = 0;
      if (!a1) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else
  {
    CFMutableArrayRef v5 = 0;
  }
  int v6 = -1;
  if (a1) {
LABEL_7:
  }
    *a1 = v5;
LABEL_8:
  *a2 = v6;
  return Mutable;
}

__CFDictionary *MKCFCreateMap(int a1, __CFArray *a2, const __CFDictionary *a3, __CFBundle *a4, unsigned int a5, int a6, unint64_t a7, const __CFDictionary *a8, uint64_t a9, int *a10)
{
  unsigned int v13 = a5;
  unsigned __int16 valuePtr = a5;
  int v34 = a6;
  cStr = 0;
  CFStringRef v18 = (const char *)PMSchemeSearch(a1, &cStr);
  if (!v18 || (CFStringRef v19 = CFStringCreateWithCString(0, v18, 0)) == 0)
  {
    CFArrayRef v22 = 0;
    int v30 = -5307;
    goto LABEL_21;
  }
  CFStringRef v20 = v19;
  CFDictionaryRef v32 = a8;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFArrayRef v22 = Mutable;
  if (!Mutable) {
    goto LABEL_20;
  }
  CFDictionarySetValue(Mutable, @"ID", v20);
  CFRelease(v20);
  CFStringRef v23 = CFStringCreateWithCString(0, cStr, 0);
  if (!v23) {
    goto LABEL_20;
  }
  CFStringRef v24 = v23;
  CFDictionarySetValue(v22, @"Name", v23);
  CFRelease(v24);
  CFMutableArrayRef v25 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v25) {
    goto LABEL_20;
  }
  CFMutableArrayRef v26 = v25;
  CFDictionarySetValue(v22, @"Sections", v25);
  CFRelease(v26);
  CFArrayAppendValue(a2, v22);
  CFRelease(v22);
  if (!v13)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"Alignment");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
    }
    unsigned int v13 = valuePtr;
  }
  if (v13 >= 2)
  {
    CFNumberRef v28 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(v22, @"Alignment", v28);
    CFRelease(v28);
  }
  if (!a6)
  {
    CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(a3, @"Blocksize");
    if (v29) {
      CFNumberGetValue(v29, kCFNumberSInt32Type, &v34);
    }
  }
  switch(a1)
  {
    case 16:
      int v30 = GPTCFCreateMap(v26, a3, a4, valuePtr, v34, a7, v32, a9);
      break;
    case 8:
      int v30 = MBRCFCreateMap(v26, a3, (unsigned __int16)v34, a7, v32, a9, (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t *))MKMediaDeviceIO);
      break;
    case 1:
      int v30 = APMCFCreateMap(v26, a3, a4, valuePtr, (unsigned __int16)v34, a7, v32, a9, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
      break;
    default:
LABEL_20:
      int v30 = -1;
      break;
  }
LABEL_21:
  if (a10)
  {
    if (v30 == -1) {
      int v30 = *__error();
    }
    *a10 = v30;
  }
  return v22;
}

uint64_t GPTCFCreateMap(__CFArray *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, int a5, unint64_t a6, const __CFDictionary *a7, uint64_t a8)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  unsigned int v71 = 22;
  if (!a2) {
    return v71;
  }
  LODWORD(v11) = a5;
  CFIndex v12 = a3;
  memset(v70, 0, sizeof(v70));
  unsigned int v71 = -43;
  if (a3 || (CFIndex v12 = MKAccessLibrary(0)) != 0)
  {
    CFURLRef v13 = MKLoadDB(v12, @"inventory", (int *)&v71);
    CFDictionaryRef v14 = MKLoadDB(v12, @"database", (int *)&v71);
  }
  else
  {
    CFURLRef v13 = 0;
    CFDictionaryRef v14 = 0;
  }
  MKMediaGetGeometry(a8, (uint64_t)v70);
  if (v11) {
    size_t v11 = v11;
  }
  else {
    size_t v11 = LODWORD(v70[0]);
  }
  if (!a6) {
    a6 = *((void *)&v70[0] + 1) / (unint64_t)(v11 >> 9);
  }
  uint64_t v67 = a8;
  LODWORD(v72[0]) = 0;
  Handle v15 = gptinit((int *)v72);
  if (v15)
  {
    CFStringRef v16 = v15;
    CFDictionaryRef v17 = v14;
    CFURLRef v18 = v13;
    CFDictionaryRef v19 = a7;
    Ptr v20 = *v15;
    unsigned int v21 = (uint64_t *)*((void *)*v15 + 1);
    *((_DWORD *)*v15 + 8) = v11;
    CFArrayRef v22 = malloc_type_calloc(1uLL, v11, 0x82061AF3uLL);
    *unsigned int v21 = (uint64_t)v22;
    if (v22)
    {
      CFStringRef v23 = v22;
      v77[0] = 0;
      v77[1] = 0;
      v22[2] = 0u;
      v22[3] = 0u;
      v22[4] = 0u;
      v22[5] = 0u;
      *CFArrayRef v22 = 0u;
      v22[1] = 0u;
      MEMORY[0x223C20E30](v77);
      uuid_LtoB((uint64_t)(v23 + 7), (uint64_t)v77);
      *CFStringRef v23 = 0x5452415020494645;
      v23[1] = 0x5C00010000;
      v23[10] = 0x8000000080;
      LODWORD(v24) = 0x4000 / v11;
      if (0x4000 / v11 * v11 == 0x4000) {
        uint64_t v24 = v24;
      }
      else {
        uint64_t v24 = (v24 + 1);
      }
      v23[3] = 1;
      v23[4] = a6 - 1;
      v23[9] = 2;
      unint64_t v25 = v24 + 2;
      unint64_t v26 = a6 - v24 - 2;
      v23[5] = v25;
      v23[6] = v26;
      if (v26 < v25)
      {
        int v27 = -5341;
LABEL_19:
        disposegpm(v16);
        a7 = v19;
        CFURLRef v13 = v18;
        CFDictionaryRef v14 = v17;
        goto LABEL_20;
      }
      uint64_t v28 = *v21;
      uuid_LtoB((uint64_t)(v20 + 16), v28 + 56);
      uint64_t v29 = *(void *)(v28 + 40);
      *((void *)v20 + 5) = v29;
      uint64_t v30 = *(void *)(v28 + 48);
      *((void *)v20 + 6) = *(void *)(v28 + 32) + v29 - v30;
      *((void *)v20 + 7) = v30 - v29 + 1;
      *((_DWORD *)v20 + 22) = *(_DWORD *)(v28 + 8);
      *((void *)v20 + 8) = a6;
    }
    else
    {
      int v27 = v72[0];
      if (LODWORD(v72[0])) {
        goto LABEL_19;
      }
    }
    unsigned int v71 = 0;
    a7 = v19;
    CFURLRef v13 = v18;
    CFDictionaryRef v14 = v17;
    goto LABEL_26;
  }
  int v27 = v72[0];
LABEL_20:
  if (v27 == -1) {
    int v27 = *__error();
  }
  unsigned int v71 = v27;
  if (v27) {
    goto LABEL_78;
  }
  CFStringRef v16 = 0;
LABEL_26:
  if ((GPTConvertCreateOptions(a7, 0) & 0x20000000) != 0) {
    goto LABEL_71;
  }
  memset(v72, 0, 154);
  unsigned int v31 = MKLookupSchemeFormat(v14, @"GPT", @"Media", 0, v72);
  if (!v31)
  {
    CFDictionaryRef v32 = BootAttrSearch((unsigned __int16 *)v72, 5);
    if (v32)
    {
      CFDictionaryRef v65 = a7;
      CFStringRef v33 = CFStringCreateWithCString(0, (const char *)v32, 0);
      Ptr v34 = *v16;
      unsigned int v35 = *((_DWORD *)*v16 + 8);
      unsigned int v36 = a4;
      if (v35 >= 0x400) {
        unsigned int v36 = a4 / (v35 >> 9);
      }
      unsigned __int16 v37 = -1;
      __int16 v75 = -1;
      uint64_t v85 = 0;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v82 = 0u;
      memset(v81, 0, sizeof(v81));
      long long v79 = 0u;
      long long v80 = 0u;
      *(_OWORD *)__s = 0u;
      uint64_t v73 = 0;
      unint64_t v74 = 0;
      if (v36 <= 1) {
        unint64_t v38 = 1;
      }
      else {
        unint64_t v38 = v36;
      }
      unsigned int v76 = 22;
      CFDictionaryRef LoaderRecord = fetchLoaderRecord(v12, v33, (unsigned __int16)(v35 >> 9), (uint64_t)__s, (uint64_t)&v73, &v76);
      if (v76)
      {
        BOOL v40 = 0;
      }
      else
      {
        CFDictionaryRef v41 = LoaderRecord;
        int v42 = gpmrtypesearch((uint64_t)v16, (char *)v81, 0);
        unsigned __int16 v37 = v42;
        __int16 v75 = v42;
        BOOL v40 = (v42 & 0x80000000) == 0
           && (int v43 = (unsigned __int16)v42,
               (comparePartitions((uint64_t)&v34[152 * (unsigned __int16)v42 + 96], __s) & 2) != 0)
           && *(void *)&v34[152 * v43 + 216] >= v74;
        CFDictionaryRef LoaderRecord = v41;
      }
      unsigned int v44 = v76;
      if (!v40 && !v76)
      {
        Ptr v45 = *v16;
        unint64_t v46 = *((void *)*v16 + 5);
        unint64_t v47 = v46 / v38;
        if (v46 % v38) {
          ++v47;
        }
        unint64_t v48 = *((void *)&v83 + 1) / v38;
        unint64_t v49 = v47 * v38;
        if (*((void *)&v83 + 1) % v38) {
          ++v48;
        }
        *(void *)&long long v83 = v49;
        *((void *)&v83 + 1) = v48 * v38;
        if (HIDWORD(v73) && *((void *)v45 + 7) < (unint64_t)HIDWORD(v73))
        {
          unsigned int v44 = 28;
          unsigned int v76 = 28;
        }
        else
        {
          CFDictionaryRef v50 = LoaderRecord;
          MEMORY[0x223C20E30](&v82);
          if (v37 != 0xFFFF
            || (v51 = gpmrtypesearch((uint64_t)v16, "Microsoft Reserved", 0), unsigned __int16 v37 = v51, v75 = v51, v51 != -1))
          {
            unsigned int v76 = delentry((const void **)v16, 96, 0x5Eu, v37, 152);
          }
          unsigned int v44 = addPartitionRecord((uint64_t *)v16, (uint64_t)__s, v38, &v75);
          unsigned int v76 = v44;
          CFDictionaryRef LoaderRecord = v50;
          if (!v44)
          {
            Ptr v52 = *v16;
            uint64_t v53 = (uint64_t)&(*v16)[152 * v75];
            char v55 = *(unsigned char *)(v53 + 232);
            v54 = (void *)(v53 + 232);
            if ((v55 & 8) != 0)
            {
              CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v50, @"Loader Name");
              if (Value) {
                CFStringRef v57 = Value;
              }
              else {
                CFStringRef v57 = v33;
              }
              unsigned int v58 = ResolveLoaderPath(v12, v50, v57, (char *)v77);
              unsigned int v76 = v58;
              if (v58)
              {
                unsigned int v44 = v58;
                BOOL v59 = v58 == -43;
                CFDictionaryRef LoaderRecord = v50;
                if (v59)
                {
                  if (*((_DWORD *)v52 + 8) == 512)
                  {
                    unsigned int v44 = -43;
                  }
                  else
                  {
                    unsigned int v44 = 0;
                    unsigned int v76 = 0;
                  }
                }
              }
              else
              {
                unsigned int v44 = GPMPartitionWrite((uint64_t *)v16, v75, (const char *)v77, v67);
                unsigned int v76 = v44;
                CFDictionaryRef LoaderRecord = v50;
                if (!v44) {
                  *v54 &= ~8uLL;
                }
              }
            }
            else
            {
              unsigned int v44 = 0;
            }
          }
        }
      }
      if (LoaderRecord)
      {
        CFRelease(LoaderRecord);
        unsigned int v44 = v76;
      }
      CFRelease(v33);
      a7 = v65;
      if (v44 != 28)
      {
        unsigned int v71 = v44;
        if (v44) {
          goto LABEL_78;
        }
        goto LABEL_72;
      }
    }
LABEL_71:
    unsigned int v71 = 0;
LABEL_72:
    v60 = GPTRecordMapSection((const UInt8 *)v16, 0xFFFFFFFF, (int *)&v71);
    if (v71) {
      goto LABEL_78;
    }
    v61 = v60;
    if (v60)
    {
      CFArrayAppendValue(a1, v60);
      CFRelease(v61);
    }
    CFArrayRef v62 = (const __CFArray *)CFDictionaryGetValue(a2, @"Partitions");
    if (!v62) {
      goto LABEL_78;
    }
    unsigned int v31 = GPTCFCreatePartitions(v61, v62, v12, v63, v14, a4, a7, v67);
  }
  unsigned int v71 = v31;
LABEL_78:
  if (v13) {
    CFRelease(v13);
  }
  if (v14) {
    CFRelease(v14);
  }
  return v71;
}

uint64_t filexml(const void *a1, const __CFString *a2)
{
  if (!a1) {
    return 4294967246;
  }
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, a2, kCFURLPOSIXPathStyle, 0);
  if (!v3) {
    return 4294967246;
  }
  CFURLRef v4 = v3;
  CFMutableArrayRef v5 = CFWriteStreamCreateWithFile(0, v3);
  CFRelease(v4);
  if (!v5) {
    return 4294967246;
  }
  if (CFWriteStreamOpen(v5))
  {
    if (CFPropertyListWrite(a1, v5, kCFPropertyListXMLFormat_v1_0, 0, 0)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 4294967246;
    }
  }
  else
  {
    uint64_t v6 = 4294967273;
  }
  CFWriteStreamClose(v5);
  CFRelease(v5);
  return v6;
}

double MKMediaGetGeometry(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      double result = 0.0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 104);
      uint64_t v3 = *(void *)(a1 + 112);
      *(void *)(a2 + 8) = *(void *)(a1 + 96);
      *(void *)(a2 + 16) = v3;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 120);
    }
  }
  return result;
}

Handle gptinit(int *a1)
{
  Handle v2 = NewHandleClear(96);
  int v3 = MemError();
  if (v2)
  {
    Ptr v4 = *v2;
    CFMutableArrayRef v5 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
    *((void *)v4 + 1) = v5;
    if (v5)
    {
      int v3 = 0;
    }
    else
    {
      disposegpm(v2);
      Handle v2 = 0;
      int v3 = 12;
    }
  }
  *a1 = v3;
  return v2;
}

Handle NewHandleClear(Size byteCount)
{
  return InternalNewHandle(byteCount, 1);
}

Ptr *InternalNewHandle(size_t a1, int a2)
{
  MemErr = -108;
  Ptr v4 = (Ptr *)malloc_type_malloc(0x18uLL, 0x1080040BEB90DD3uLL);
  CFMutableArrayRef v5 = v4;
  if (v4)
  {
    v4[1] = (Ptr)a1;
    *((unsigned char *)v4 + 16) = 0;
    uint64_t v6 = (char *)malloc_type_malloc(a1, 0x824B596DuLL);
    *CFMutableArrayRef v5 = v6;
    if (v6)
    {
      if (a2) {
        bzero(v6, (size_t)v5[1]);
      }
      MemErr = 0;
    }
    else
    {
      DisposeHandle(v5);
      return 0;
    }
  }
  return v5;
}

OSErr MemError(void)
{
  return MemErr;
}

uint64_t uuid_LtoB(uint64_t result, uint64_t a2)
{
  *(_DWORD *)double result = bswap32(*(_DWORD *)a2);
  *(_WORD *)(result + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  if (a2 != result)
  {
    *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
    int v2 = *(_DWORD *)(a2 + 10);
    *(_WORD *)(result + 14) = *(_WORD *)(a2 + 14);
    *(_DWORD *)(result + 10) = v2;
  }
  return result;
}

uint64_t GPTConvertCreateOptions(const __CFDictionary *a1, const __CFDictionary *a2)
{
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (a1)
    {
      int v7 = MKCFOptionBit(a1, @"Content Ephermeral", 0x2000);
      int v8 = MKCFOptionBit(a1, @"Retain existing content", 4);
      int v9 = MKCFOptionBit(a1, @"Write Protect", 0x80000000);
      int v10 = MKCFOptionBit(a1, @"Flexible Allocation", 0x10000000);
      int v11 = MKCFOptionBit(a1, @"Direct Mode", 0x20000000);
      int v12 = MKCFOptionBit(a1, @"No Minimum Size For Loader", 0x800000);
      uint64_t v4 = v7 | v8 | v9 | v10 | v11 | v12 | MKCFOptionBit(a1, @"Allocate Remaining Space", 0x400000) | v4;
    }
    char v5 = 0;
    a1 = a2;
  }
  while ((v6 & 1) != 0);
  return v4;
}

unsigned __int16 *BootAttrSearch(unsigned __int16 *result, int a2)
{
  if (result)
  {
    int v2 = *result;
    if (*result)
    {
      for (i = result + 18; *i != a2; i += 19)
      {
        if (!--v2) {
          return 0;
        }
      }
      return i - 17;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef fetchLoaderRecord(__CFBundle *a1, const void *a2, unsigned int a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  unsigned int v30 = 22;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  int v12 = a1;
  *(void *)(a4 + 144) = 0;
  if (!a1)
  {
    int v12 = MKAccessLibrary(0);
    if (!v12)
    {
      CFDictionaryRef v19 = 0;
      if (!a6) {
        return v19;
      }
      goto LABEL_29;
    }
  }
  CFDictionaryRef v13 = MKLoadDB(v12, @"inventory", (int *)&v30);
  if (!v13)
  {
    CFDictionaryRef v19 = 0;
    if (a1) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFDictionaryRef v14 = v13;
  unsigned int v30 = -417;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v13, @"Loaders");
  if (Value)
  {
    CFDictionaryRef v16 = Value;
    unsigned int v30 = -415;
    if (a3 >= 2)
    {
      uint64_t v29 = a5;
      unsigned int v17 = a3;
      CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, 0);
      CFStringAppendFormat(Mutable, 0, @"%@-%u", a2, v17 << 9);
      CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(v16, Mutable);
      Ptr v20 = Mutable;
      a3 = v17;
      a5 = v29;
      CFRelease(v20);
      if (v19) {
        goto LABEL_8;
      }
    }
    CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(v16, a2);
    if (v19)
    {
LABEL_8:
      unsigned int v21 = GPTUpdateLoaderRecord(v19, a4);
      unsigned int v30 = v21;
      if (a5 && !v21)
      {
        *(void *)a5 = 0;
        *(void *)(a5 + 8) = 0;
        *(void *)(a5 + 8) = *(void *)(a4 + 120);
        CFBooleanRef v22 = (const __CFBoolean *)CFDictionaryGetValue(v19, @"Loader Present");
        if (v22) {
          *(unsigned char *)a5 = CFBooleanGetValue(v22);
        }
        CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(v19, @"Reserve Space");
        if (v23) {
          *(unsigned char *)(a5 + 1) = CFBooleanGetValue(v23);
        }
        CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(v19, @"Foreign Payloads");
        if (v24) {
          *(unsigned char *)(a5 + 2) = CFBooleanGetValue(v24);
        }
        CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v19, @"Minimum Host Size");
        if (v25) {
          CFNumberGetValue(v25, kCFNumberSInt32Type, (void *)(a5 + 4));
        }
        CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v19, @"Minimum Partition Size");
        if (v26) {
          CFNumberGetValue(v26, kCFNumberSInt64Type, (void *)(a5 + 8));
        }
        if (a3)
        {
          *(_DWORD *)(a5 + 4) /= a3;
          *(void *)(a5 + 8) /= (unint64_t)a3;
          unint64_t v27 = *(void *)(a4 + 120) / (unint64_t)a3;
          *(void *)(a4 + 112) /= (unint64_t)a3;
          *(void *)(a4 + 120) = v27;
        }
      }
      CFRetain(v19);
    }
  }
  else
  {
    CFDictionaryRef v19 = 0;
  }
  CFRelease(v14);
  if (!a1) {
LABEL_27:
  }
    CFRelease(v12);
LABEL_28:
  if (a6) {
LABEL_29:
  }
    *a6 = v30;
  return v19;
}

CFNumberRef GPTUpdateLoaderRecord(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Partition Type");
  if (!Value || !CFStringGetCString(Value, buffer, 80, 0x8000100u)) {
    return (const __CFNumber *)22;
  }
  GPTuuidType2HumanExtended((__int16 *)(a2 + 48), buffer, 48, 0, 0);
  CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a1, @"Partition Name");
  if (v5) {
    CFStringGetCString(v5, (char *)a2, 48, 0x8000100u);
  }
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, @"Partition Size");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, (void *)(a2 + 120));
    return 0;
  }
  return result;
}

__int16 *GPTuuidType2Human(__int16 *a1, const char *a2, int a3)
{
  return GPTuuidType2HumanExtended(a1, a2, a3, 0, 0);
}

uint64_t gpmrtypesearch(uint64_t a1, char *a2, int a3)
{
  if (!a1) {
    return -1;
  }
  __int16 v3 = a3;
  if (a3 < 0) {
    return -1;
  }
  unsigned int v4 = *(unsigned __int16 *)(*(void *)a1 + 94);
  if (v4 <= (unsigned __int16)a3)
  {
    return -1;
  }
  else
  {
    for (i = (const char *)(*(void *)a1 + 152 * (unsigned __int16)a3 + 144); strcasecmp(i, a2); i += 152)
    {
      if ((int)v4 <= ++v3) {
        return -1;
      }
    }
  }
  return v3;
}

uint64_t addPartitionRecord(uint64_t *a1, uint64_t a2, unsigned int a3, __int16 *a4)
{
  unint64_t v7 = *(void *)(a2 + 112);
  if (a3)
  {
    unint64_t v8 = v7 / a3;
    if (v7 % a3) {
      ++v8;
    }
    unint64_t v7 = v8 * a3;
    *(void *)(a2 + 112) = v7;
  }
  uint64_t v9 = *(void *)(a2 + 120);
  v19[0] = v7;
  v19[1] = v9;
  unsigned __int16 v10 = srequest(a1, v19, (unsigned __int16)a3, 0, a2, 0, 0);
  uint64_t v11 = *(void *)(a2 + 112);
  if (v11 == -1 || (__int16 v12 = v10, v7) && v11 != v7)
  {
    __int16 v13 = -1;
    uint64_t result = 4294961952;
    if (!a4) {
      return result;
    }
    goto LABEL_9;
  }
  *(void *)(a2 + 136) |= 9uLL;
  *(_WORD *)(a2 + 144) = v10;
  uint64_t v15 = *a1;
  int v16 = *(unsigned __int16 *)(*a1 + 94);
  if (*(_WORD *)(*a1 + 94))
  {
    int v17 = 0;
    unsigned __int16 v18 = v10;
    do
    {
      if (*(unsigned __int16 *)(v15 + 152 * v17 + 240) == v18)
      {
        int v17 = 0;
        *(_WORD *)(a2 + 144) = ++v18;
      }
      else
      {
        ++v17;
      }
    }
    while (v17 < v16);
  }
  uint64_t result = addentry((const void **)a1, (const void *)a2, 0x60uLL, 0x5Eu, v10, 0x98u);
  if (result) {
    __int16 v13 = -1;
  }
  else {
    __int16 v13 = v12;
  }
  if (a4) {
LABEL_9:
  }
    *a4 = v13;
  return result;
}

uint64_t srequest(uint64_t *a1, uint64_t *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, void, uint64_t, void, uint64_t), uint64_t a7)
{
  *(_OWORD *)(a5 + 112) = xmmword_21E15F520;
  uint64_t v10 = *a1;
  if (a3 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = a3;
  }
  unsigned int v46 = *(_DWORD *)(v10 + 32);
  uint64_t v12 = *a2;
  if (*a2)
  {
    uint64_t v13 = *(void *)(v10 + 40);
    if (v12 < (unint64_t)v13 || (uint64_t v14 = *(void *)(v10 + 56) + v13, v12 > (unint64_t)v14))
    {
      LOWORD(v15) = 0;
      return (__int16)v15;
    }
    int v17 = (unint64_t *)(a2 + 1);
    unint64_t v16 = a2[1];
    if (v16) {
      goto LABEL_24;
    }
    if (v12 >= 1)
    {
      uint64_t v45 = a5;
      unint64_t v16 = 0;
      goto LABEL_25;
    }
LABEL_10:
    unsigned int v15 = *(unsigned __int16 *)(v10 + 94);
    if (*(_WORD *)(v10 + 94))
    {
      unsigned int v18 = v15 - 1;
      uint64_t v13 = *(void *)(v10 + 152 * v18 + 216) + *(void *)(v10 + 152 * v18 + 208);
      if ((a4 & 0x20000000) == 0)
      {
        if (a6) {
          v13 += a6(v10 + 152 * v18 + 96, (unsigned __int16)(v46 >> 9), v11, a4, a7);
        }
      }
    }
    uint64_t v19 = v13 / v11;
    if (v13 % v11) {
      ++v19;
    }
    uint64_t v20 = v19 * v11;
    if ((a4 & 0x1000000) != 0) {
      uint64_t v21 = v11;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v22 = v20 - v13;
    if (!v22) {
      uint64_t v22 = v21;
    }
    uint64_t v23 = v22 + v13;
    uint64_t v24 = v14 / v11 * v11;
    BOOL v25 = v24 <= v23;
    uint64_t v26 = v24 - v23;
    if (!v25)
    {
      *(void *)(a5 + 112) = v23;
      *(void *)(a5 + 120) = v26;
    }
    return (__int16)v15;
  }
  int v17 = (unint64_t *)(a2 + 1);
  unint64_t v16 = a2[1];
  uint64_t v13 = *(void *)(v10 + 40);
  if (!v16)
  {
    uint64_t v14 = *(void *)(v10 + 56) + v13;
    goto LABEL_10;
  }
LABEL_24:
  uint64_t v45 = a5;
LABEL_25:
  unsigned int v15 = 0;
  unint64_t v27 = v16 / v11;
  if (v16 % v11) {
    ++v27;
  }
  uint64_t v28 = v27 * v11;
  if ((a4 & 0x1000000) != 0) {
    uint64_t v29 = v11;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v28 - v16;
  if (!v30) {
    uint64_t v30 = v29;
  }
  unint64_t *v17 = v30 + v16;
  BOOL v32 = (a4 & 0x20000000) == 0 && a6 != 0;
  for (i = (void *)(v10 + 216); ; i += 19)
  {
    unsigned int v34 = *(unsigned __int16 *)(v10 + 94);
    if (v15 >= v34) {
      uint64_t v35 = *(void *)(v10 + 56) + *(void *)(v10 + 40);
    }
    else {
      uint64_t v35 = *(i - 1);
    }
    uint64_t v36 = v13 / v11;
    if (v13 % v11) {
      ++v36;
    }
    uint64_t v37 = v36 * v11 - v13;
    if (!v37) {
      uint64_t v37 = v29;
    }
    uint64_t v38 = v37 + v13;
    if (v35 <= v38) {
      goto LABEL_58;
    }
    uint64_t v39 = *a2;
    if (*a2)
    {
      if (v39 > v35) {
        goto LABEL_58;
      }
      if (v39 < v38)
      {
        if ((a4 & 0x10000000) == 0) {
          goto LABEL_58;
        }
        *a2 = v38;
        uint64_t v39 = v38;
      }
      uint64_t v40 = v39 / v11;
      if (v39 % v11) {
        ++v40;
      }
      uint64_t v38 = v40 * v11;
    }
    unint64_t v41 = v35 - v38;
    unint64_t v42 = *v17;
    if (*v17 - 1 < v35 - v38) {
      break;
    }
    if (!v42 || (double)v41 / (double)v42 >= 0.85)
    {
      unint64_t v43 = v41 / v11;
      goto LABEL_64;
    }
LABEL_58:
    if (v15 >= v34) {
      return (__int16)v15;
    }
    uint64_t v13 = *i + v35;
    if (v32) {
      v13 += a6((uint64_t)(i - 15), (unsigned __int16)(v46 >> 9), v11, a4, a7);
    }
    ++v15;
  }
  unint64_t v43 = v42 / v11;
LABEL_64:
  *(void *)(v45 + 112) = v38;
  *(void *)(v45 + 120) = v43 * v11;
  return (__int16)v15;
}

uint64_t addentry(const void **a1, const void *a2, size_t size, unsigned int a4, unsigned int a5, unsigned __int16 a6)
{
  if (a1)
  {
    int v9 = size;
    uint64_t v12 = (char *)*a1;
    if (!v12)
    {
      uint64_t v12 = (char *)malloc_type_calloc(1uLL, size, 0xC2EEFBCCuLL);
      *a1 = v12;
      if (!v12) {
        return *__error();
      }
    }
    size_t v13 = a6 & 0xFFFE;
    unsigned int v14 = *(unsigned __int16 *)&v12[a4];
    if (v14 >= a5) {
      unsigned int v15 = a5;
    }
    else {
      unsigned int v15 = *(unsigned __int16 *)&v12[a4];
    }
    unsigned int v16 = v9 + v15 * v13;
    int v17 = moveblockextended(a1, v16, v13, 0, v9 + v14 * v13);
    if ((_WORD)v17)
    {
      int v18 = v17 << 16;
      if (v17 << 16 == -65536) {
        return *__error();
      }
    }
    else
    {
      memmove((char *)*a1 + v16, a2, v13);
      int v18 = 0;
      *(_WORD *)((char *)*a1 + a4) = v14 + 1;
    }
  }
  else
  {
    int v18 = 1441792;
  }
  return (v18 >> 16);
}

uint64_t moveblockextended(const void **a1, unsigned int a2, int a3, int a4, unsigned int a5)
{
  if (!a1) {
    return 22;
  }
  if (!a3) {
    return 0;
  }
  unsigned int v10 = malloc_size(*a1);
  if (v10 >= a5) {
    unsigned int v11 = a5;
  }
  else {
    unsigned int v11 = v10;
  }
  if (a5) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = v10;
  }
  if (a3 < 0)
  {
    if (v12 - a2 + a3) {
      memmove((char *)*a1 + a2, (char *)*a1 + a2 - a3, v12 - a2 + a3);
    }
    int v17 = reallocf((void *)*a1, v12 + a3);
    if (v17)
    {
      int v18 = v17;
      uint64_t result = 0;
      *a1 = v18;
      return result;
    }
  }
  else
  {
    size_t v13 = (char *)reallocf((void *)*a1, v12 + a3);
    if (v13)
    {
      *a1 = v13;
      size_t v14 = v12 - a2;
      if (v12 != a2)
      {
        unsigned int v15 = &v13[a2];
        memmove(&v15[a3], v15, v14);
        if (a4) {
          bzero(v15, v14);
        }
      }
      return 0;
    }
  }
  return *__error();
}

uint64_t ResolveLoaderPath(__CFBundle *a1, CFDictionaryRef theDict, const __CFString *a3, char *a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"Loader Path");
  if (Value)
  {
    if (CFStringGetCString(Value, a4, 1024, 0)) {
      return 4294967253;
    }
    else {
      return 22;
    }
  }
  else
  {
    CFURLRef v9 = CFBundleCopyResourceURL(a1, a3, @"loader", 0);
    uint64_t v8 = 4294967253;
    if (v9)
    {
      CFURLRef v10 = v9;
      int v11 = CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)a4, 1024);
      CFRelease(v10);
      if (v11) {
        return 0;
      }
      else {
        return 4294967253;
      }
    }
  }
  return v8;
}

uint64_t GPMPartitionWrite(uint64_t *a1, int a2, const char *a3, uint64_t a4)
{
  if (!a1) {
    return 22;
  }
  unint64_t v5 = *(unsigned int *)(*a1 + 32);
  if (!v5) {
    return 22;
  }
  unint64_t v6 = (32 * v5);
  if (!v6) {
    return 22;
  }
  CFURLRef v10 = (char *)malloc_type_malloc((32 * v5), 0x33C70D4CuLL);
  if (!v10) {
    return 12;
  }
  int v11 = v10;
  unint64_t v27 = 0;
  if (a2 < 0 || (uint64_t v12 = *a1, a2 > *(unsigned __int16 *)(v12 + 94)))
  {
    free(v10);
    return 22;
  }
  size_t v13 = gzopen(a3, "rb");
  if (!v13)
  {
    free(v11);
    return *__error();
  }
  size_t v14 = v13;
  uint64_t v15 = v12 + 152 * (unsigned __int16)a2;
  uint64_t v16 = *(void *)(v15 + 208);
  uint64_t v18 = *(void *)(v15 + 216);
  int v17 = (void *)(v15 + 208);
  int v19 = gzread(v13, v11, 32 * v5);
  if (v19)
  {
    uint64_t v20 = 0;
    unint64_t v21 = v18 + v16;
    while (1)
    {
      unint64_t v22 = v19;
      if (v6 > v19) {
        bzero(&v11[v19], v6 - v19);
      }
      if (v22 % v5) {
        uint64_t v23 = v22 / v5 + 1;
      }
      else {
        uint64_t v23 = v22 / v5;
      }
      if (v23 + v20 > v21)
      {
        gzclose(v14);
        free(v11);
        return 1;
      }
      uint64_t v24 = MKMediaWriteBlocks(a4, *v17 + v20, v23, v5, v11, &v27);
      if (v24) {
        break;
      }
      v20 += v27;
      int v19 = gzread(v14, v11, 32 * v5);
      if (!v19) {
        goto LABEL_18;
      }
    }
    uint64_t v25 = v24;
    gzclose(v14);
    free(v11);
    if (v25 == -1) {
      return *__error();
    }
  }
  else
  {
LABEL_18:
    uint64_t v25 = gzclose(v14);
    free(v11);
  }
  return v25;
}

uint64_t MKMediaWriteBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, unint64_t *a6)
{
  unint64_t v7 = a4 >> 9;
  unint64_t v9 = 0;
  uint64_t result = MKMediaWriteSectors(a1, v7 * a2, v7 * a3, a5, &v9);
  if (a6) {
    *a6 = v9 / v7;
  }
  return result;
}

uint64_t MKMediaWriteSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, void *a5)
{
  uint64_t v10 = 0;
  if (!a1) {
    return 22;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t result = 22;
  if (a4)
  {
    unint64_t v8 = *(void *)(a1 + 96);
    if (v8 > a2 && a3 + a2 <= v8)
    {
      if (*(_DWORD *)(a1 + 120))
      {
        if (a3)
        {
          uint64_t result = _MKMediaCommonReadWriteSectors(a1, a2, a3, a4, &v10, 1);
          if (a5) {
            *a5 = v10;
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 19;
      }
    }
  }
  return result;
}

uint64_t _MKMediaCommonReadWriteSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, void *a5, int a6)
{
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  uint64_t v10 = *(void *)(a1 + 136);
  unint64_t v11 = *(unsigned int *)(a1 + 104);
  _MKMediaAlignmentAnalysis(a2, a3, v11, (uint64_t)&v29);
  if ((unint64_t)v30 | v32 || (unint64_t)v31 > *(void *)(a1 + 112))
  {
    uint64_t result = pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 144));
    if (result)
    {
LABEL_4:
      uint64_t v13 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t result = pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 144));
    if (result) {
      goto LABEL_4;
    }
  }
  unint64_t v14 = v11 >> 9;
  if (!(void)v30)
  {
    unint64_t v27 = v14;
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  uint64_t v28 = 0;
  uint64_t Buffer = _MKMediaBufferPoolGetBuffer(v10);
  unsigned int v16 = (*(uint64_t (**)(void, void, unint64_t, uint64_t, uint64_t *))(a1 + 72))(*(void *)(a1 + 88), *((void *)&v29 + 1), v14, Buffer, &v28);
  if (!v16)
  {
    uint64_t v13 = v30;
    uint64_t v17 = (void)v30 << 9;
    if (a6)
    {
      memcpy((void *)(Buffer + (((void)v29 - *((void *)&v29 + 1)) << 9)), a4, (void)v30 << 9);
      unsigned int v16 = (*(uint64_t (**)(void, void, unint64_t, uint64_t, uint64_t *))(a1 + 80))(*(void *)(a1 + 88), *((void *)&v29 + 1), v14, Buffer, &v28);
      if (v16) {
        goto LABEL_8;
      }
      unint64_t v27 = v14;
      uint64_t v13 = v30;
    }
    else
    {
      unint64_t v27 = v14;
      memcpy(a4, (const void *)(Buffer + (((void)v29 - *((void *)&v29 + 1)) << 9)), (void)v30 << 9);
    }
    a4 += v17;
    _MKMediaBufferPoolReturnBuffer(*(void *)(a1 + 136), Buffer);
LABEL_15:
    unint64_t v18 = v31;
    if ((void)v31)
    {
      uint64_t v19 = *((void *)&v30 + 1);
      uint64_t v28 = 0;
      int v26 = a6;
      if (a6) {
        uint64_t v20 = 80;
      }
      else {
        uint64_t v20 = 72;
      }
      do
      {
        if (v18 >= *(void *)(a1 + 112)) {
          unint64_t v21 = *(void *)(a1 + 112);
        }
        else {
          unint64_t v21 = v18;
        }
        unsigned int v16 = (*(uint64_t (**)(void, uint64_t, unint64_t, char *, uint64_t *))(a1 + v20))(*(void *)(a1 + 88), v19, v21, a4, &v28);
        if (v16) {
          break;
        }
        v13 += v21;
        v19 += v21;
        a4 += 512 * v21;
        v18 -= v21;
      }
      while (v18);
      a6 = v26;
    }
    else
    {
      unsigned int v16 = 0;
    }
    if (!v32) {
      goto LABEL_35;
    }
    uint64_t v28 = 0;
    unint64_t v22 = (void *)_MKMediaBufferPoolGetBuffer(v10);
    unsigned int v23 = (*(uint64_t (**)(void, void, unint64_t, void *, uint64_t *))(a1 + 72))(*(void *)(a1 + 88), *((void *)&v31 + 1), v27, v22, &v28);
    if (v23) {
      goto LABEL_28;
    }
    size_t v24 = v32 << 9;
    if (a6)
    {
      memcpy(v22, a4, v24);
      unsigned int v23 = (*(uint64_t (**)(void, void, unint64_t, void *, uint64_t *))(a1 + 80))(*(void *)(a1 + 88), *((void *)&v31 + 1), v27, v22, &v28);
      if (v23)
      {
LABEL_28:
        unsigned int v16 = v23;
LABEL_34:
        _MKMediaBufferPoolReturnBuffer(v10, (uint64_t)v22);
        goto LABEL_35;
      }
    }
    else
    {
      memcpy(a4, v22, v24);
    }
    unsigned int v16 = 0;
    v13 += v32;
    uint64_t v10 = *(void *)(a1 + 136);
    goto LABEL_34;
  }
LABEL_8:
  _MKMediaBufferPoolReturnBuffer(v10, Buffer);
  uint64_t v13 = 0;
LABEL_35:
  LODWORD(result) = pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 144));
  if (result) {
    BOOL v25 = v16 == 0;
  }
  else {
    BOOL v25 = 0;
  }
  if (v25) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v16;
  }
LABEL_41:
  *a5 = v13;
  return result;
}

unint64_t _MKMediaAlignmentAnalysis(unint64_t result, unint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4 = a3 >> 9;
  *(void *)(a4 + 48) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  unint64_t v5 = (v4 - result % v4) % v4;
  *(void *)a4 = result;
  *(void *)(a4 + 8) = result / v4 * v4;
  unint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    unint64_t v7 = v6 / v4 * v4;
    *(void *)(a4 + 24) = v5 + result;
    *(void *)(a4 + 32) = v7;
    *(void *)(a4 + 40) = v7 + v5 + result;
    *(void *)(a4 + 48) = v6 - v7;
    a2 = v5;
  }
  *(void *)(a4 + 16) = a2;
  return result;
}

uint64_t _MKMediaDeviceWriteSectors(uint64_t a1, uint64_t a2, uint64_t a3, void *__buf, void *a5)
{
  uint64_t v6 = a3;
  if ((pwrite(*(_DWORD *)(a1 + 4), __buf, a3 << 9, a2 << 9) & 0x80000000) != 0)
  {
    uint64_t v6 = 0;
    uint64_t result = *__error();
  }
  else
  {
    uint64_t result = 0;
  }
  *a5 = v6;
  return result;
}

__CFDictionary *GPTRecordMapSection(const UInt8 *a1, unsigned int a2, int *a3)
{
  uint64_t v4 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v8 = 0;
    goto LABEL_6;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  unint64_t v8 = Mutable;
  if (!Mutable)
  {
LABEL_6:
    int v10 = -1;
    goto LABEL_7;
  }
  CFDictionarySetValue(Mutable, @"ID", @"MAP");
  int v9 = CFDictionarySetUUID(v8, @"GUID", (CFUUIDBytes *)(v4 + 16));
  if (v9)
  {
    int v10 = v9;
    goto LABEL_7;
  }
  CFNumberRef v12 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v4 + 88));
  if (!v12) {
    goto LABEL_29;
  }
  CFNumberRef v13 = v12;
  CFDictionarySetValue(v8, @"Revision", v12);
  CFRelease(v13);
  unint64_t v14 = (unint64_t)*(unsigned int *)(v4 + 32) >> 9;
  unint64_t valuePtr = *(void *)(v4 + 40) * v14;
  CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (!v15) {
    goto LABEL_29;
  }
  CFNumberRef v16 = v15;
  CFDictionarySetValue(v8, @"Offset", v15);
  CFRelease(v16);
  MKCFRecordSectionSize(v8, *(void *)(v4 + 40) * v14, *(void *)(v4 + 48) * v14, *(void *)(v4 + 56) * v14, *(void *)(v4 + 64) * v14, *(_DWORD *)(v4 + 32));
  uint64_t v17 = *(void *)(v4 + 80);
  unint64_t v18 = (const void **)MEMORY[0x263EFFB40];
  if (v17)
  {
    CFDictionarySetValue(v8, @"Legacy", (const void *)*MEMORY[0x263EFFB40]);
    uint64_t v17 = *(void *)(v4 + 80);
    if ((v17 & 8) == 0)
    {
LABEL_14:
      if ((v17 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_32;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_14;
  }
  CFDictionarySetValue(v8, @"MBR Extension Detect", *v18);
  uint64_t v17 = *(void *)(v4 + 80);
  if ((v17 & 4) == 0)
  {
LABEL_15:
    if ((v17 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_32:
  CFDictionarySetValue(v8, @"MBR Mutation Detect", *v18);
  if ((*(void *)(v4 + 80) & 0x10) != 0) {
LABEL_16:
  }
    CFDictionarySetValue(v8, @"MBR NTFS Prioritized", *v18);
LABEL_17:
  CFMutableArrayRef v19 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v19)
  {
LABEL_29:
    int v10 = 0;
    goto LABEL_7;
  }
  CFMutableArrayRef v20 = v19;
  CFDictionarySetValue(v8, @"Partitions", v19);
  CFRelease(v20);
  if (!*(_WORD *)(v4 + 94) || (uint64_t v21 = *(void *)a1, !*(_WORD *)(*(void *)a1 + 94)))
  {
LABEL_28:
    mkcfstoreref(v8, a1);
    goto LABEL_29;
  }
  unsigned int v22 = 0;
  unsigned __int16 v23 = *(_DWORD *)(v4 + 32);
  uint64_t v24 = v21 + 96;
  unsigned int v29 = v23;
  while (1)
  {
    BOOL v25 = lookupDESC((const char *)(v24 + 48));
    if (v25) {
      __int16 v26 = v25[1];
    }
    else {
      LOBYTE(v26) = 7;
    }
    if ((a2 >> v26)) {
      break;
    }
LABEL_27:
    ++v22;
    v24 += 152;
    if (v22 >= *(unsigned __int16 *)(v21 + 94)) {
      goto LABEL_28;
    }
  }
  unint64_t v27 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v27)
  {
    uint64_t v28 = v27;
    int v10 = GPTUpdatePartitionDictionary(v27, v24, v29);
    CFArrayAppendValue(v20, v28);
    CFRelease(v28);
    if (v10) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
  int v10 = 22;
LABEL_7:
  if (a3) {
    *a3 = v10;
  }
  return v8;
}

void MKCFRecordSectionSize(__CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v22 = a3;
  uint64_t valuePtr = a2;
  uint64_t v20 = a5;
  uint64_t v21 = a4;
  unsigned int v19 = a6;
  if (a1)
  {
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v9)
    {
      CFNumberRef v10 = v9;
      CFDictionarySetValue(a1, @"Media Offset", v9);
      CFRelease(v10);
    }
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt64Type, &v21);
    if (v11)
    {
      CFNumberRef v12 = v11;
      CFDictionarySetValue(a1, @"Media Block Count", v11);
      CFRelease(v12);
    }
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt64Type, &v20);
    if (v13)
    {
      CFNumberRef v14 = v13;
      CFDictionarySetValue(a1, @"Section Block Count", v13);
      CFRelease(v14);
    }
    if (a3)
    {
      CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt64Type, &v22);
      if (v15)
      {
        CFNumberRef v16 = v15;
        CFDictionarySetValue(a1, @"Overhead", v15);
        CFRelease(v16);
      }
    }
    if (a6 >= 0x200)
    {
      CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt32Type, &v19);
      if (v17)
      {
        CFNumberRef v18 = v17;
        CFDictionarySetValue(a1, @"Media Block Size", v17);
        CFRelease(v18);
      }
    }
  }
}

uint64_t GPTUpdatePartitionDictionary(__CFDictionary *a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 22;
  }
  uint64_t result = CFDictionarySetUUID(a1, @"GUID", (CFUUIDBytes *)(a2 + 96));
  if (!result)
  {
    int valuePtr = 0;
    unint64_t v7 = (void *)(a2 + 136);
    if ((*(unsigned char *)(a2 + 136) & 1) == 0)
    {
      int valuePtr = *(unsigned __int16 *)(a2 + 144) + 1;
      CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFDictionarySetValue(a1, @"Partition ID", v8);
        CFRelease(v9);
      }
    }
    CFIndex v10 = strlen((const char *)(a2 + 48));
    if (v10)
    {
      CFStringRef v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a2 + 48), v10, 0x8000100u, 1u);
      if (v11)
      {
        CFStringRef v12 = v11;
        CFDictionarySetValue(a1, @"Type", v11);
        CFRelease(v12);
      }
    }
    CFIndex v13 = strlen((const char *)a2);
    if (v13)
    {
      CFStringRef v14 = CFStringCreateWithBytes(0, (const UInt8 *)a2, v13, 0x8000100u, 1u);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionarySetValue(a1, @"Name", v14);
        CFRelease(v15);
      }
    }
    uint64_t v16 = *(void *)(a2 + 112);
    uint64_t v17 = *(void *)(a2 + 120);
    uint64_t v29 = v17;
    uint64_t v30 = v16;
    if (a3 >= 0x400)
    {
      uint64_t v18 = a3 >> 9;
      v16 *= v18;
      v17 *= v18;
      uint64_t v29 = v17;
      uint64_t v30 = v16;
    }
    if (v16)
    {
      CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt64Type, &v30);
      if (v19)
      {
        CFNumberRef v20 = v19;
        CFDictionarySetValue(a1, @"Offset", v19);
        CFRelease(v20);
      }
    }
    if (v17)
    {
      CFNumberRef v21 = CFNumberCreate(0, kCFNumberSInt64Type, &v29);
      if (v21)
      {
        CFNumberRef v22 = v21;
        CFDictionarySetValue(a1, @"Size", v21);
        CFRelease(v22);
      }
    }
    uint64_t v24 = *(void *)(a2 + 128);
    unsigned __int16 v23 = (const void *)(a2 + 128);
    if (v24)
    {
      CFNumberRef v25 = CFNumberCreate(0, kCFNumberSInt64Type, v23);
      if (v25)
      {
        CFNumberRef v26 = v25;
        CFDictionarySetValue(a1, @"Status", v25);
        CFRelease(v26);
      }
    }
    if (*v7)
    {
      uint64_t result = (uint64_t)CFNumberCreate(0, kCFNumberSInt64Type, v7);
      if (!result) {
        return result;
      }
      unint64_t v27 = (const void *)result;
      CFDictionarySetValue(a1, @"Flags", (const void *)result);
      CFRelease(v27);
    }
    return 0;
  }
  return result;
}

void mkcfstoreref(__CFDictionary *a1, const UInt8 *a2)
{
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(0, a2, 8, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (v3)
  {
    CFDataRef v4 = v3;
    CFDictionarySetValue(a1, @"_Reference", v3);
    CFRelease(v4);
  }
}

uint64_t GPTCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, __CFBundle *a3, uint64_t a4, const __CFDictionary *a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8)
{
  if (!a1) {
    return 4294967246;
  }
  uint64_t Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  CFIndex v16 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v16);
    if (!ValueAtIndex) {
      break;
    }
    uint64_t result = GPTCFCreatePartition(a1, ValueAtIndex, a3, v18, a5, a6, a7, a8);
    if (result) {
      return result;
    }
    if (Count == ++v16) {
      return 0;
    }
  }
  return 4294966881;
}

uint64_t GPTCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, uint64_t a4, const __CFDictionary *a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = a6;
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    unsigned long long v45 = 0u;
    memset(v44, 0, sizeof(v44));
    memset(v43, 0, sizeof(v43));
    CFStringRef v15 = mkcfrecoverref(a1);
    if (!v15) {
      return 22;
    }
    CFIndex v16 = (uint64_t *)v15;
    uint64_t v17 = *(void *)v15;
    if (CFDictionaryGetUUID(a2, @"GUID", (unsigned __int8 *)&v45)
      || uuid_is_null((const unsigned __int8 *)&v45))
    {
      MEMORY[0x223C20E30](&v45);
    }
    uint64_t result = GPTUpdatePartitionRecord(a2, (uint64_t)v43, *(_DWORD *)(v17 + 32));
    if (!result)
    {
      uint64_t result = strcasecmp((const char *)v44, "Apple_Free");
      if (result)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Options");
        unsigned int Options = GPTConvertCreateOptions(a7, Value);
        if ((Options & 0x20000000) == 0
          && (!strcasecmp((const char *)v44, "Microsoft Basic Data")
           || !strcasecmp((const char *)v44, "MS-DOS")
           || !strcasecmp((const char *)v44, "Windows_NTFS")
           || !strcasecmp((const char *)v44, "DOS_FAT_32")
           || !strcasecmp((const char *)v44, "Windows_FAT_32")))
        {
          unsigned int valuePtr = 2048;
        }
        CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Alignment");
        if (v20) {
          CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
        }
        CFArrayRef v21 = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
        unsigned int v22 = valuePtr;
        v40[0] = a3;
        v40[1] = a5;
        unsigned int v23 = *(_DWORD *)(*v16 + 32);
        if ((Options & 4) == 0) {
          Options |= 0x202000u;
        }
        if (v23 >= 0x400) {
          unsigned int v22 = valuePtr / (v23 >> 9);
        }
        uint64_t v24 = v46;
        if (v22 <= 1)
        {
          unint64_t v27 = *((void *)&v46 + 1);
        }
        else
        {
          if ((void)v46)
          {
            if ((unint64_t)v46 % v22) {
              int v25 = (unint64_t)v46 / v22 + 1;
            }
            else {
              int v25 = (unint64_t)v46 / v22;
            }
            unint64_t v26 = v25 * v22 - v46;
            uint64_t v24 = v26 + v46;
            *(void *)&long long v46 = v26 + v46;
          }
          else
          {
            unint64_t v26 = 0;
          }
          if (*((void *)&v46 + 1))
          {
            BOOL v28 = *((void *)&v46 + 1) >= v26;
            unint64_t v29 = *((void *)&v46 + 1) - v26;
            if (v29 == 0 || !v28) {
              return 4294961955;
            }
            unint64_t v27 = v29 / v22 * v22;
            *((void *)&v46 + 1) = v27;
          }
          else
          {
            unint64_t v27 = 0;
          }
        }
        v41[0] = v24;
        v41[1] = v27;
        unsigned __int16 v30 = srequest(v16, v41, (unsigned __int16)v22, Options, (uint64_t)v43, (uint64_t (*)(uint64_t, void, uint64_t, void, uint64_t))loaderReserve, (uint64_t)v40);
        unsigned __int16 v42 = v30;
        if ((void)v46 == -1) {
          return 4294961952;
        }
        __int16 v31 = v30;
        uint64_t v32 = 9;
        if ((Options & 4) != 0) {
          uint64_t v32 = 1;
        }
        *((void *)&v47 + 1) |= v32;
        uint64_t v33 = *v16;
        LOWORD(v48) = v30;
        int v34 = *(unsigned __int16 *)(v33 + 94);
        if (*(_WORD *)(v33 + 94))
        {
          int v35 = 0;
          unsigned __int16 v36 = v30;
          do
          {
            if (*(unsigned __int16 *)(v33 + 152 * v35 + 240) == v36)
            {
              int v35 = 0;
              LOWORD(v48) = ++v36;
            }
            else
            {
              ++v35;
            }
          }
          while (v35 < v34);
        }
        uint64_t result = addentry((const void **)v16, v43, 0x60uLL, 0x5Eu, v30, 0x98u);
        if (!result)
        {
          if ((Options & 0x20000000) != 0
            || (uint64_t result = setupPostloader(v16, (__int16 *)&v42, a3, a5, v22, 0, 1u, Options, 0, a8),
                __int16 v31 = v42,
                result == 28)
            || !result)
          {
            CFStringRef v37 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)&v45);
            CFMutableDictionaryRef Mutable = CFArrayDictionarySearchWithIndexOptions(v21, @"GUID", v37, 0, 0);
            CFRelease(v37);
            if (Mutable) {
              return GPTUpdatePartitionDictionary(Mutable, *v16 + 152 * v31 + 96, *(unsigned __int16 *)(*v16 + 32));
            }
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFArrayAppendValue(v21, Mutable);
            CFRelease(Mutable);
            if (Mutable) {
              return GPTUpdatePartitionDictionary(Mutable, *v16 + 152 * v31 + 96, *(unsigned __int16 *)(*v16 + 32));
            }
            return 22;
          }
        }
      }
    }
  }
  return result;
}

const UInt8 *mkcfrecoverref(const __CFDictionary *a1)
{
  uint64_t result = (const UInt8 *)CFDictionaryGetValue(a1, @"_Reference");
  if (result)
  {
    return CFDataGetBytePtr((CFDataRef)result);
  }
  return result;
}

uint64_t CFDictionaryGetUUID(const __CFDictionary *a1, const void *a2, unsigned __int8 *a3)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 2;
  }
  return cfstr2uuid(a3, Value);
}

uint64_t cfstr2uuid(unsigned __int8 *a1, const __CFString *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    if (!CFStringGetCString(a2, buffer, 38, 0)) {
      return 22;
    }
  }
  else
  {
    uuid_copy(a1, NaNuuid);
  }
  return uuid_parse(buffer, a1);
}

uint64_t GPTUpdatePartitionRecord(const __CFDictionary *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Type");
  if (!Value) {
    return 22;
  }
  CFStringRef v7 = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 != CFStringGetTypeID()) {
    return 22;
  }
  uint64_t v20 = 0;
  if (!CFStringGetCString(v7, buffer, 80, 0x8000100u)) {
    return 22;
  }
  GPTuuidType2HumanExtended((__int16 *)(a2 + 48), buffer, 48, 0, 0);
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a1, @"Name");
  if (v9)
  {
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    CFStringGetCString(v9, (char *)a2, 48, 0x8000100u);
  }
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Offset");
  if (v10)
  {
    CFStringRef v11 = (uint64_t *)(a2 + 112);
    CFNumberGetValue(v10, kCFNumberSInt64Type, (void *)(a2 + 112));
    if ((a3 & 0x1FFFC00) != 0)
    {
      unint64_t v12 = (unsigned __int16)(a3 >> 9);
      if (*v11 % v12) {
        uint64_t v13 = *v11 / v12 + 1;
      }
      else {
        uint64_t v13 = *v11 / v12;
      }
      *CFStringRef v11 = v13;
    }
  }
  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Size");
  if (v14)
  {
    CFStringRef v15 = (uint64_t *)(a2 + 120);
    CFNumberGetValue(v14, kCFNumberSInt64Type, (void *)(a2 + 120));
    if ((a3 & 0x1FFFC00) != 0)
    {
      unint64_t v16 = (unsigned __int16)(a3 >> 9);
      if (*v15 % v16) {
        uint64_t v17 = *v15 / v16 + 1;
      }
      else {
        uint64_t v17 = *v15 / v16;
      }
      *CFStringRef v15 = v17;
    }
  }
  CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Status");
  if (v18)
  {
    CFNumberGetValue(v18, kCFNumberSInt64Type, &v20);
    *(_WORD *)(a2 + 134) = HIWORD(v20);
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"Flags");
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, (void *)(a2 + 136));
    return 0;
  }
  return result;
}

uint64_t loaderReserve(uint64_t a1, unsigned int a2, unsigned int a3, int a4, __CFBundle **a5)
{
  uint64_t v5 = 0;
  uint64_t v30 = *MEMORY[0x263EF8340];
  v24[0] = 0;
  v24[1] = 0;
  if (a1 && a5)
  {
    if (*a5 && a5[1])
    {
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      memset(v26, 0, sizeof(v26));
      memset(v23, 0, 154);
      CFStringRef v11 = CFStringCreateWithCString(0, (const char *)(a1 + 48), 0);
      unsigned int v12 = MKLookupSchemeFormat(a5[1], @"GPT", v11, 1, v23);
      unsigned int v25 = v12;
      CFRelease(v11);
      uint64_t v5 = 0;
      if (!v12 && LOWORD(v23[0]))
      {
        uint64_t v5 = 0;
        unsigned int v13 = 0;
        CFNumberRef v14 = (char *)&v23[2] + 4;
        CFStringRef v15 = (char *)&v23[2] + 4;
        do
        {
          int v16 = *(unsigned __int16 *)v15;
          v15 += 38;
          if (v16 == 6)
          {
            CFStringRef v17 = CFStringCreateWithCString(0, v14 - 34, 0);
            if (v17)
            {
              CFStringRef v18 = v17;
              CFDictionaryRef LoaderRecord = fetchLoaderRecord(*a5, v17, a2, (uint64_t)v26, (uint64_t)v24, &v25);
              CFRelease(v18);
              if (!v25)
              {
                if (LoaderRecord) {
                  CFRelease(LoaderRecord);
                }
                if ((a4 & 0x800000) == 0 && *(void *)(a1 + 120) >= (unint64_t)HIDWORD(v24[0]) && BYTE1(v24[0]))
                {
                  unint64_t v20 = *((void *)&v27 + 1);
                  if (a3)
                  {
                    if (*((void *)&v27 + 1) % (unint64_t)a3) {
                      unint64_t v21 = *((void *)&v27 + 1) / (unint64_t)a3 + 1;
                    }
                    else {
                      unint64_t v21 = *((void *)&v27 + 1) / (unint64_t)a3;
                    }
                    unint64_t v20 = v21 * a3;
                    *((void *)&v27 + 1) = v20;
                  }
                  v5 += v20;
                }
              }
            }
          }
          ++v13;
          CFNumberRef v14 = v15;
        }
        while (v13 < LOWORD(v23[0]));
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

uint64_t setupPostloader(uint64_t *a1, __int16 *a2, __CFBundle *a3, const __CFDictionary *a4, unsigned int a5, int64_t a6, unsigned __int8 a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v11 = *a2;
  __int16 v32 = *a2;
  if (a3)
  {
    uint64_t v17 = *a1;
    CFStringRef v18 = CFStringCreateWithCString(0, (const char *)(*a1 + 152 * v11 + 144), 0);
    if (v18)
    {
      CFStringRef v19 = v18;
      memset(v31, 0, sizeof(v31));
      uint64_t v20 = MKLookupSchemeFormat(a4, @"GPT", v18, 1, v31);
      CFRelease(v19);
      if (v20) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = *(unsigned __int16 *)v31 == 0;
      }
      if (!v21)
      {
        unsigned int v22 = 0;
        *(_OWORD *)uu1 = *(_OWORD *)(v17 + 152 * v11 + 192);
        unsigned int v23 = &v31[2];
        while (1)
        {
          CFStringRef v24 = CFStringCreateWithCString(0, v23, 0);
          if (!v24) {
            goto LABEL_15;
          }
          CFStringRef v25 = v24;
          uint64_t v26 = gpmrsearch(a1, uu1, &v32);
          int v27 = *((unsigned __int16 *)v23 + 17);
          if (v27 == 6) {
            goto LABEL_12;
          }
          uint64_t v20 = v26;
          if (v27 != 5) {
            break;
          }
LABEL_13:
          CFRelease(v25);
          if (v20) {
            goto LABEL_17;
          }
          ++v22;
          v23 += 38;
          if (v22 >= *(unsigned __int16 *)v31) {
            goto LABEL_15;
          }
        }
        if (v27 != 1)
        {
          CFRelease(v25);
          uint64_t v20 = 4294967292;
          goto LABEL_17;
        }
LABEL_12:
        uint64_t v20 = mediaLoaderSupport(a3, v25, a1, uu1, a10, v27, a5, a8, a6, a7, a9, 0);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v20 = 22;
    }
  }
  else
  {
LABEL_15:
    uint64_t v20 = 0;
  }
LABEL_17:
  *a2 = v32;
  return v20;
}

uint64_t gpmrsearch(uint64_t *a1, unsigned __int8 *uu1, _WORD *a3)
{
  *a3 = 0x8000;
  if (!a1) {
    return 22;
  }
  uint64_t v3 = *a1;
  if (!*(_WORD *)(*a1 + 94)) {
    return 4294961953;
  }
  int v6 = 0;
  for (i = (const unsigned __int8 *)(v3 + 192); ; i += 152)
  {
    uint64_t result = uuid_compare(uu1, i);
    if (!result) {
      break;
    }
    if (++v6 >= *(unsigned __int16 *)(v3 + 94)) {
      return 4294961953;
    }
  }
  *a3 = v6;
  return result;
}

uint64_t comparePartitions(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  BOOL v5 = strncasecmp((const char *)a1, __s, v4) == 0;
  int v6 = v5 | (2 * (strcasecmp((const char *)(a1 + 48), __s + 48) == 0));
  unint64_t v7 = *(void *)(a1 + 120);
  unint64_t v8 = *((void *)__s + 15);
  BOOL v9 = v7 == v8;
  BOOL v10 = v7 >= v8;
  int v11 = v9;
  return v6 | (4 * v11) | (32 * v10);
}

uint64_t mediaLoaderSupport(__CFBundle *a1, const __CFString *a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, int a6, unsigned int a7, int a8, int64_t a9, unsigned __int8 a10, uint64_t a11, _DWORD *a12)
{
  unsigned int v12 = a3;
  int v13 = a10;
  uint64_t v108 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  int v98 = 0;
  v95[1] = 0;
  unint64_t v96 = 0;
  uint64_t v107 = 0;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v104 = 0u;
  memset(v103, 0, sizeof(v103));
  memset(__s, 0, sizeof(__s));
  v95[0] = 0;
  unsigned int v99 = 22;
  if (!a3)
  {
    CFDictionaryRef LoaderRecord = 0;
    LOWORD(v22) = 0;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    unsigned int v25 = 0;
    uint64_t v26 = 0;
    LOBYTE(v27) = 0;
    int v28 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = *a3;
  unsigned int v94 = *(_DWORD *)(*a3 + 32) >> 9;
  CFDictionaryRef LoaderRecord = fetchLoaderRecord(a1, a2, (unsigned __int16)v94, (uint64_t)__s, (uint64_t)v95, &v99);
  if (v99) {
    goto LABEL_9;
  }
  CFStringRef v88 = a2;
  if ((a8 & 0x800000) != 0) {
    HIDWORD(v95[0]) = 0;
  }
  unint64_t v21 = a7 <= 1 ? 1 : a7;
  unsigned int v99 = gpmrsearch(v12, a4, (_WORD *)&v98 + 1);
  if (v99)
  {
LABEL_9:
    LOWORD(v22) = 0;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    unsigned int v25 = 0;
    uint64_t v26 = 0;
    LOBYTE(v27) = 0;
    int v28 = 0;
LABEL_10:
    LODWORD(v12) = v94;
    goto LABEL_12;
  }
  int v32 = a6;
  if (a6 == 6)
  {
    LOWORD(v22) = HIWORD(v98) + 1;
  }
  else
  {
    if (a6 != 1)
    {
      LOWORD(v22) = 0;
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      unsigned int v25 = 0;
      uint64_t v26 = 0;
      LOBYTE(v27) = 0;
      int v28 = 0;
      unsigned int v99 = -4;
      goto LABEL_10;
    }
    LOWORD(v22) = HIWORD(v98) - 1;
  }
  uint64_t v82 = a5;
  long long v83 = a1;
  if ((__int16)v22 < 1 || *(unsigned __int16 *)(v18 + 94) <= (unsigned __int16)v22)
  {
    uint64_t v26 = 0;
  }
  else
  {
    __int16 v84 = v22;
    unsigned int v33 = (unsigned __int16)v22;
    uint64_t v26 = v18 + 152 * (unsigned __int16)v22 + 96;
    int v34 = comparePartitions(v26, (char *)__s);
    if ((~v34 & 7) == 0)
    {
      unsigned __int16 v35 = v21;
      uint64_t v23 = *(void *)(v18 + 152 * v33 + 216);
      __int16 v36 = v84;
      goto LABEL_34;
    }
    int v32 = a6;
    if ((v34 & 2) != 0)
    {
      unsigned __int16 v35 = v21;
      uint64_t v23 = *(void *)(v18 + 152 * v33 + 216);
      if (BYTE2(v95[0]))
      {
        unsigned int v25 = 1;
        __int16 v36 = v84;
      }
      else
      {
        __int16 v36 = v84;
        if (v23 == *((void *)&v105 + 1))
        {
LABEL_34:
          if (BYTE1(v95[0])) {
            unsigned int v25 = 4;
          }
          else {
            unsigned int v25 = 1;
          }
          goto LABEL_106;
        }
        unsigned int v25 = 0;
      }
LABEL_106:
      sreqbefore(v12, 0, &v96, v35, (__int16)(v36 + 1));
      LOWORD(v22) = v84;
      LOBYTE(v27) = 0;
      int v28 = 1;
      unint64_t v24 = v96;
      goto LABEL_107;
    }
    LOWORD(v22) = v84;
  }
  uint64_t v37 = *v12;
  CFDictionaryRef theDict = LoaderRecord;
  if (v32 != 6)
  {
    int v38 = (__int16)(HIWORD(v98) - 1);
    LOWORD(v98) = HIWORD(v98) - 1;
    if (v38 >= 1)
    {
      int v81 = a10;
      uint64_t v27 = 0;
      __int16 v85 = v22;
      while (1)
      {
        uint64_t v39 = v27;
        uint64_t v40 = v37;
        unsigned int v41 = (unsigned __int16)v38;
        unsigned __int16 v42 = (char *)(v37 + 152 * (unsigned __int16)v38 + 144);
        unint64_t v43 = lookupDESC(v42);
        if (utf8strcompare(1uLL, v42, v103))
        {
          if (!v43)
          {
            uint64_t v50 = v40 + 152 * v41;
            goto LABEL_69;
          }
          uint64_t v27 = v39;
          if (v43[1] == 2)
          {
            uint64_t v51 = v40 + 152 * v41;
            goto LABEL_71;
          }
          __int16 v44 = v98;
          uint64_t v37 = v40;
        }
        else
        {
          __int16 v44 = v98;
          unsigned int v99 = delentry((const void **)v12, 96, 0x5Eu, (unsigned __int16)v98, 152);
          if (v99)
          {
            uint64_t v23 = 0;
            unint64_t v24 = 0;
            unsigned int v25 = 0;
            int v28 = 0;
            uint64_t v69 = v40 + 152 * v41;
            goto LABEL_141;
          }
          uint64_t v37 = *v12;
          uint64_t v27 = (v39 + 1);
        }
        CFDictionaryRef LoaderRecord = theDict;
        int v38 = (__int16)(v44 - 1);
        LOWORD(v98) = v44 - 1;
        if (v38 <= 0)
        {
          uint64_t v45 = v40 + 152 * v41;
          goto LABEL_60;
        }
      }
    }
    goto LABEL_61;
  }
  signed __int16 v46 = HIWORD(v98) + 1;
  LOWORD(v98) = HIWORD(v98) + 1;
  if (*(unsigned __int16 *)(v37 + 94) <= (__int16)(HIWORD(v98) + 1))
  {
LABEL_61:
    LOBYTE(v27) = 0;
    goto LABEL_73;
  }
  int v81 = a10;
  uint64_t v27 = 0;
  __int16 v85 = v22;
  while (1)
  {
    uint64_t v39 = v27;
    uint64_t v40 = v37;
    int v47 = v46;
    uint64_t v48 = (char *)(v37 + 152 * v46 + 144);
    uint64_t v49 = lookupDESC(v48);
    if (!utf8strcompare(1uLL, v48, v103)) {
      break;
    }
    if (!v49)
    {
      uint64_t v50 = v40 + 152 * v47;
LABEL_69:
      uint64_t v26 = v50 + 96;
      uint64_t v37 = v40;
      int v13 = v81;
      LOWORD(v22) = v85;
      LOBYTE(v27) = v39;
LABEL_72:
      CFDictionaryRef LoaderRecord = theDict;
      goto LABEL_73;
    }
    uint64_t v27 = v39;
    if (v49[1] == 2)
    {
      uint64_t v51 = v40 + 152 * v47;
LABEL_71:
      uint64_t v26 = v51 + 96;
      uint64_t v37 = v40;
      int v13 = v81;
      LOWORD(v22) = v85;
      goto LABEL_72;
    }
    signed __int16 v46 = v98 + 1;
    LOWORD(v98) = v98 + 1;
    uint64_t v37 = v40;
LABEL_58:
    CFDictionaryRef LoaderRecord = theDict;
    if (*(unsigned __int16 *)(v37 + 94) <= v46)
    {
      uint64_t v45 = v40 + 152 * v47;
LABEL_60:
      uint64_t v26 = v45 + 96;
      int v13 = v81;
      LOWORD(v22) = v85;
LABEL_73:
      if (v99)
      {
        uint64_t v23 = 0;
        unint64_t v24 = 0;
        unsigned int v25 = 0;
        int v28 = 0;
        goto LABEL_107;
      }
      uint64_t v87 = v37;
      char theDicta = v27;
      LOWORD(v52) = v22;
      unsigned int v99 = gpmrsearch(v12, a4, (_WORD *)&v98 + 1);
      if (v99)
      {
        uint64_t v23 = 0;
        unint64_t v24 = 0;
        unsigned int v25 = 0;
        goto LABEL_77;
      }
      __int16 v53 = HIWORD(v98);
      if (a6 != 1) {
        __int16 v53 = HIWORD(v98) + 1;
      }
      int v22 = sreqbefore(v12, 0, &v96, (unsigned __int16)v21, v53);
      unint64_t v24 = v96;
      int v54 = SHIWORD(v98);
      uint64_t v26 = v87 + 152 * SHIWORD(v98) + 96;
      if (HIDWORD(v95[0]) && *(void *)(v87 + 152 * SHIWORD(v98) + 216) < (unint64_t)HIDWORD(v95[0]))
      {
        uint64_t v23 = 0;
        unsigned int v25 = 0;
        int v28 = 0;
        *((void *)&v105 + 1) = 0;
        unsigned int v99 = 28;
      }
      else
      {
        unint64_t v55 = v96;
        if ((~a8 & 0x202000) == 0)
        {
          unint64_t v56 = *(void *)(v87 + 152 * SHIWORD(v98) + 216);
          unint64_t v55 = v96;
          if (*((void *)&v105 + 1) < v56)
          {
            unint64_t v55 = v96;
            if (v56 > 0x200000 / v94)
            {
              unint64_t v55 = 0;
              unint64_t v96 = 0;
            }
          }
        }
        if (*((void *)&v105 + 1) % v21) {
          uint64_t v57 = *((void *)&v105 + 1) / v21 + 1;
        }
        else {
          uint64_t v57 = *((void *)&v105 + 1) / v21;
        }
        unint64_t v58 = v57 * v21;
        BOOL v59 = v57 * v21 >= v55;
        int64_t v60 = v57 * v21 - v55;
        if (v60 != 0 && v59)
        {
          unint64_t v96 = v58;
          LOBYTE(v27) = theDicta;
          if (a9)
          {
            BOOL v61 = v60 <= a9 && a6 == 6;
            int v62 = a8;
            if (v61) {
              int v62 = a8 | 0x2004;
            }
            a8 = v62;
          }
          if (v13)
          {
            unsigned int v25 = 1;
            if ((a8 & 0x2000) == 0)
            {
              uint64_t v23 = 0;
              int v28 = 0;
              unsigned int v99 = 1;
              unsigned int v25 = 0;
              goto LABEL_107;
            }
          }
          else
          {
            unsigned int v25 = 8;
          }
          if (a7 >= 2)
          {
            if (a6 == 1 && v13)
            {
              uint64_t v70 = v87 + 152 * SHIWORD(v98);
              unint64_t v71 = *(void *)(v70 + 208);
              uint64_t v72 = *(void *)(v70 + 216);
              unint64_t v73 = v71 / v21;
              if (v71 % v21) {
                ++v73;
              }
              unint64_t v74 = v73 * v21;
              *(void *)(v70 + 208) = v74;
              unint64_t v75 = v72 + v71 - v74;
            }
            else
            {
              unint64_t v75 = *(void *)(v87 + 152 * SHIWORD(v98) + 216);
            }
            *(void *)(v87 + 152 * v54 + 216) = v75 / v21 * v21;
          }
          if (a6 == 1) {
            *(void *)(v87 + 152 * v54 + 208) += v60;
          }
          int v52 = v22;
          *(void *)(v87 + 152 * v54 + 216) -= v60;
          if ((a8 & 4) == 0) {
            *(void *)(v87 + 152 * v54 + 232) |= 8uLL;
          }
          int v63 = v54;
          ++theDicta;
        }
        else
        {
          int v63 = SHIWORD(v98);
          int v52 = v22;
          unsigned int v25 = 0;
        }
        BOOL v77 = !strcasecmp(v103, "Apple_Free") || BYTE1(v95[0]) != 0;
        if (v13)
        {
          LOWORD(v22) = v52;
          if (v77)
          {
            uint64_t v23 = 0;
            int v28 = 0;
            unsigned int v99 = 0;
            unsigned int v25 = 4;
            goto LABEL_79;
          }
          if (a6 == 6) {
            uint64_t v78 = *(void *)(v87 + 152 * v63 + 216) + *(void *)(v87 + 152 * v63 + 208);
          }
          else {
            uint64_t v78 = *(void *)(v87 + 152 * v63 + 208) - *((void *)&v105 + 1);
          }
          *(void *)&long long v105 = v78;
          MEMORY[0x223C20E30](&v104);
          unsigned int v99 = addPartitionRecord(v12, (uint64_t)__s, v21, (__int16 *)&v98);
          if (!v99)
          {
            LOWORD(v22) = v52;
            uint64_t v79 = *v12 + 152 * v52;
            uint64_t v26 = v79 + 96;
            uint64_t v23 = *(void *)(v79 + 216);
            LOBYTE(v27) = theDicta + 1;
            unsigned int v25 = 1;
            int v28 = 1;
            goto LABEL_107;
          }
          uint64_t v23 = 0;
LABEL_77:
          int v28 = 0;
        }
        else
        {
          uint64_t v23 = 0;
          int v28 = 0;
          if (*((void *)&v105 + 1) <= v96 && v77) {
            unsigned int v25 = 4;
          }
          else {
            unsigned int v25 = 2;
          }
        }
        LOWORD(v22) = v52;
      }
LABEL_79:
      LOBYTE(v27) = theDicta;
      goto LABEL_107;
    }
  }
  signed __int16 v46 = v98;
  unsigned int v99 = delentry((const void **)v12, 96, 0x5Eu, (unsigned __int16)v98, 152);
  if (!v99)
  {
    uint64_t v37 = *v12;
    uint64_t v27 = (v39 + 1);
    goto LABEL_58;
  }
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  unsigned int v25 = 0;
  int v28 = 0;
  uint64_t v69 = v40 + 152 * v47;
LABEL_141:
  uint64_t v26 = v69 + 96;
  int v13 = v81;
  LOWORD(v22) = v85;
  LOBYTE(v27) = v39;
  CFDictionaryRef LoaderRecord = theDict;
LABEL_107:
  if (v99 || (v25 & 1) == 0 || !LOBYTE(v95[0]) || !v13 && BYTE2(v95[0])) {
    goto LABEL_10;
  }
  char theDictb = v27;
  __int16 v86 = v22;
  int v64 = v13;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(LoaderRecord, @"Loader Name");
  if (Value) {
    CFStringRef v66 = Value;
  }
  else {
    CFStringRef v66 = v88;
  }
  if (BYTE2(v95[0]))
  {
    __sprintf_chk(v100, 0, 0x40uLL, "%s");
  }
  else
  {
    CFNumberRef v67 = (const __CFNumber *)CFDictionaryGetValue(LoaderRecord, @"Checksum");
    if (v67) {
      CFNumberGetValue(v67, kCFNumberSInt32Type, &valuePtr);
    }
    __sprintf_chk(v100, 0, 0x40uLL, "%s %#x");
  }
  char v68 = strcasecmp(v100, (const char *)v26);
  if (!v64 || a8 < 0)
  {
    LODWORD(v12) = v94;
    LOBYTE(v27) = theDictb;
    if (v68)
    {
LABEL_127:
      int v13 = v64;
      LOWORD(v22) = v86;
      goto LABEL_12;
    }
LABEL_126:
    unsigned int v25 = v25 & 0xFFFFFFFA | 4;
    goto LABEL_127;
  }
  if ((*(unsigned char *)(v26 + 136) & 9) == 0 && !v68)
  {
    LODWORD(v12) = v94;
    LOBYTE(v27) = theDictb;
    goto LABEL_126;
  }
  unsigned int v99 = ResolveLoaderPath(v83, LoaderRecord, v66, v101);
  if (v99 || (unsigned int v99 = GPMPartitionWrite(v12, v86, v101, v82)) != 0)
  {
    int v13 = v64;
    LODWORD(v12) = v94;
    goto LABEL_131;
  }
  long long v80 = v12;
  LODWORD(v12) = v94;
  unsigned int v99 = GPMUpdateVolumeUUID(v80, v86, v94, v82);
  if (!v99)
  {
    *(void *)(v26 + 136) &= ~8uLL;
    __strlcpy_chk();
    LOBYTE(v27) = theDictb + 1;
    goto LABEL_126;
  }
  int v13 = v64;
LABEL_131:
  LOWORD(v22) = v86;
  LOBYTE(v27) = theDictb;
LABEL_12:
  if ((v25 & (BYTE2(v95[0]) != 0)) != 0) {
    unsigned int v25 = v25 & 0xFFFFFFFA | 4;
  }
  if (a11)
  {
    *(_WORD *)a11 = 259;
    *(_DWORD *)(a11 + 4) = v25;
    *(_WORD *)(a11 + 8) = v22 - HIWORD(v98);
    *(void *)(a11 + 16) = *((void *)&v105 + 1) * v12;
    *(void *)(a11 + 24) = v23 * v12;
    *(void *)(a11 + 32) = v24 + v23;
    if (v28)
    {
      *(_DWORD *)(a11 + 4) = v25 | 0x80;
      CFDictionaryRef v29 = LoaderRecord;
      char v30 = v27;
      uuid_unparse_upper((const unsigned __int8 *)(v26 + 96), (char *)(a11 + 40));
      LOBYTE(v27) = v30;
      CFDictionaryRef LoaderRecord = v29;
    }
  }
  uint64_t result = v99;
  if (v13 && !v99 && (v25 & 4) == 0)
  {
    uint64_t result = 1;
    unsigned int v99 = 1;
  }
  if (a12) {
    *a12 = v27 != 0;
  }
  if (LoaderRecord)
  {
    CFRelease(LoaderRecord);
    return v99;
  }
  return result;
}

uint64_t sreqbefore(uint64_t *a1, uint64_t *a2, unint64_t *a3, unsigned int a4, int a5)
{
  if (a5 < 0)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  uint64_t v5 = *a1;
  if (a5)
  {
    int v6 = *(unsigned __int16 *)(v5 + 94);
    if (a5 >= v6) {
      LOWORD(a5) = *(_WORD *)(v5 + 94);
    }
    uint64_t v7 = *(void *)(v5 + 152 * (__int16)a5 + 64) + *(void *)(v5 + 152 * (__int16)a5 + 56);
  }
  else
  {
    uint64_t v7 = *(void *)(v5 + 40);
    int v6 = *(unsigned __int16 *)(v5 + 94);
  }
  if (v6 <= (__int16)a5) {
    unint64_t v9 = *(void *)(v5 + 56) + *(void *)(v5 + 40);
  }
  else {
    unint64_t v9 = *(void *)(v5 + 152 * (__int16)a5 + 208);
  }
  BOOL v10 = v9 >= v7;
  unint64_t v8 = v9 - v7;
  if (!v10) {
    unint64_t v8 = 0;
  }
  if (a4)
  {
LABEL_15:
    if (v7 % a4) {
      uint64_t v11 = v7 / a4 + 1;
    }
    else {
      uint64_t v11 = v7 / a4;
    }
    uint64_t v7 = v11 * a4;
    unint64_t v8 = v8 / a4 * a4;
  }
LABEL_19:
  if (a2) {
    *a2 = v7;
  }
  if (a3) {
    *a3 = v8;
  }
  return (__int16)a5;
}

uint64_t MKCFWriteMedia(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5)
{
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Schemes");
  if (!Value) {
    return 22;
  }
  CFArrayRef v10 = Value;
  uint64_t Count = (unsigned __int16)CFArrayGetCount(Value);
  if (!Count) {
    return 22;
  }
  CFIndex v12 = 0;
  uint64_t v13 = 0;
  do
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
    if (ValueAtIndex)
    {
      unsigned int v15 = MKCFWriteScheme(ValueAtIndex, a2, a3, a4, a5);
      if (v15) {
        BOOL v16 = v13 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = v15;
      }
      if (v16) {
        uint64_t v13 = v15;
      }
      else {
        uint64_t v13 = v13;
      }
    }
    else
    {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    ++v12;
  }
  while (Count != v12);
  if (!v13)
  {
    uint64_t v13 = v17;
    if (v17 == -1) {
      return *__error();
    }
  }
  return v13;
}

uint64_t MKCFWriteScheme(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"ID");
  if (!Value || !CFStringGetCString(Value, buffer, 32, 0)) {
    return 22;
  }
  int v11 = PMSchemeSearchByDescriptor(buffer, 0);
  if (v11 == 16) {
    return GPTCFWriteScheme(a1, a3, a4, a5);
  }
  if ((unsigned __int16)v11 == 8) {
    return MBRCFWriteScheme(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, void))MKMediaDeviceIO);
  }
  if ((unsigned __int16)v11 == 1) {
    return APMCFWriteScheme(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
  }
  return 4294961989;
}

uint64_t PMSchemeSearchByDescriptor(char *a1, void *a2)
{
  size_t v4 = &PMSDescriptors;
  uint64_t v5 = "APM";
  while (strcasecmp(a1, v5))
  {
    uint64_t v5 = (const char *)*((void *)v4 + 4);
    v4 += 12;
    if (!v5)
    {
      size_t v4 = &word_2644987B8;
      break;
    }
  }
  if (a2) {
    *a2 = *((void *)v4 + 2);
  }
  return *v4;
}

uint64_t GPTCFWriteScheme(const __CFDictionary *a1, __CFBundle *a2, const __CFDictionary *a3, uint64_t a4)
{
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Sections");
  if (!Value) {
    return 22;
  }
  CFDictionaryRef v9 = CFArrayDictionarySearchWithIndexOptions(Value, @"ID", @"MAP", 0, 0);
  if (!v9) {
    return 22;
  }
  CFDictionaryRef v10 = v9;
  int v11 = mkcfrecoverref(v9);
  if (!v11) {
    return 22;
  }
  CFIndex v12 = (uint64_t *)v11;
  unsigned int valuePtr = 0;
  CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Alignment");
  if (v13)
  {
    CFNumberGetValue(v13, kCFNumberSInt32Type, &valuePtr);
    unsigned int v14 = valuePtr;
  }
  else
  {
    unsigned int v14 = *(_DWORD *)(*v12 + 32) >> 9;
    unsigned int valuePtr = v14;
  }
  uint64_t result = GPTCFUpdateSection(v10, a2, v14, a3, a4);
  if (!result)
  {
    uint64_t result = GPTWriteMedia(v12, a3, a4);
    if (!result)
    {
      CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue(v10, @"Partitions");
      return GPTUpdatePartitionDictionaries(v12, v16);
    }
  }
  return result;
}

uint64_t GPTCFUpdateSection(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5)
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  unint64_t v8 = a2;
  if (!a2) {
    unint64_t v8 = MKAccessLibrary(0);
  }
  CFDictionaryRef v10 = mkcfrecoverref(a1);
  if (!v10) {
    return 22;
  }
  int v11 = (uint64_t *)v10;
  *(void *)&valuePtr[0] = 0;
  uint64_t v12 = *(void *)v10;
  unint64_t v13 = *(unsigned int *)(*(void *)v10 + 32);
  uint64_t result = CFDictionaryGetUUID(a1, @"GUID", (unsigned __int8 *)(*(void *)v10 + 16));
  if (result) {
    return result;
  }
  unint64_t v15 = v13 >> 9;
  if (a4
    && (unsigned __int8 v16 = MKCFOptionBit(a4, @"Fit Map to Media", 1),
        unsigned __int8 v17 = MKCFOptionBit(a4, @"Fit Map to Container", 1),
        v16 | v17))
  {
    *(void *)&valuePtr[0] = 0;
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t result = MKMediaUpdateProperties(a5);
    if (result) {
      return result;
    }
    CFDictionaryRef v18 = (const __CFDictionary *)MKMediaCopyProperty(a5, @"Geometry");
    if (v18)
    {
      CFDictionaryRef v19 = v18;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v18, @"Sector Count");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberSInt64Type, valuePtr);
      }
      CFRelease(v19);
      unint64_t v21 = *(void *)&valuePtr[0] / v15;
      *(void *)&valuePtr[0] /= v15;
    }
    else
    {
LABEL_23:
      unint64_t v21 = 0;
    }
    uint64_t result = setMediaBlockcount(v11, v21);
    if (!result)
    {
      MKCFRecordSectionSize(a1, *(void *)(v12 + 40) * v15, *(void *)(v12 + 48) * v15, *(void *)(v12 + 56) * v15, *(void *)(v12 + 56) * v15, *(_DWORD *)(v12 + 32));
      goto LABEL_26;
    }
  }
  else
  {
    CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Media Block Count");
    if (v22)
    {
      CFNumberGetValue(v22, kCFNumberSInt64Type, valuePtr);
      unint64_t v23 = *(void *)&valuePtr[0];
    }
    else
    {
      unint64_t v23 = 0;
    }
    unint64_t v24 = v23 / v15;
    *(void *)&valuePtr[0] = v24;
    if (v23 < v15
      || v24 == *(void *)(v12 + 56)
      || (uint64_t result = setMediaBlockcount(v11, v24), !result))
    {
LABEL_26:
      unsigned int UUID = 0;
      unsigned __int16 v122 = 0;
      uint64_t v121 = 0;
      uint64_t v140 = 0;
      *(void *)uu1 = 0;
      uint64_t v138 = 0;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v129 = 0u;
      memset(v128, 0, sizeof(v128));
      CFArrayRef v25 = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
      CFDictionaryRef v116 = a4;
      CFArrayRef theArray = v25;
      if (v8)
      {
        CFDictionaryRef v117 = MKLoadDB(v8, @"inventory", (int *)&UUID);
        CFURLRef v26 = MKLoadDB(v8, @"database", (int *)&UUID);
        if (!a4 || (MKCFOptionBit(a4, @"Direct Mode", 0x20000000) & 0x20000000) == 0)
        {
          uint64_t v142 = 0;
          memset(__s, 0, sizeof(__s));
          v126[0] = 0;
          v126[1] = 0;
          memset(valuePtr, 0, 154);
          CFIndex idx = 0;
          int v127 = 22;
          CFURLRef v27 = MKLoadDB(v8, @"database", &v127);
          if (v27)
          {
            CFDictionaryRef v28 = v27;
            CFURLRef v29 = MKLoadDB(v8, @"inventory", &v127);
            if (v29)
            {
              CFDictionaryRef theDict = v29;
              CFDictionaryRef cf = v28;
              unsigned int v102 = a3;
              CFURLRef v118 = v26;
              uint64_t v112 = a5;
              uint64_t v30 = *v11;
              if (*(_WORD *)(*v11 + 94))
              {
                uint64_t v31 = 0;
                unsigned int v108 = (unsigned __int16)(*(_DWORD *)(v30 + 32) >> 9);
                v109 = (const void **)v11;
                while (1)
                {
                  int v32 = lookupDESC((const char *)(v30 + 152 * (int)v31 + 144));
                  if (!v32) {
                    goto LABEL_38;
                  }
                  if (v32[1] != 2) {
                    goto LABEL_38;
                  }
                  CFStringRef v33 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * (int)v31 + 192));
                  CFDictionaryRef v34 = CFArrayDictionarySearchWithIndexOptions(theArray, @"GUID", v33, 0, 0);
                  CFRelease(v33);
                  if (!v34) {
                    goto LABEL_38;
                  }
                  CFDictionaryRef v35 = (const __CFDictionary *)CFDictionaryGetValue(v34, @"Options");
                  if (v35)
                  {
                    if (MKCFOptionBit(v35, @"Direct Mode", 0x20000000)) {
                      goto LABEL_38;
                    }
                  }
                  CFStringRef v36 = CFStringCreateWithCString(0, (const char *)(v30 + 152 * (int)v31 + 144), 0);
                  int v127 = MKLookupSchemeFormat(cf, @"GPT", v36, 1, valuePtr);
                  CFRelease(v36);
                  if (!CFDictionaryGetValue(theDict, @"Loaders")) {
                    break;
                  }
                  if (LOWORD(valuePtr[0]))
                  {
                    int v114 = 0;
                    uint64_t v37 = (char *)valuePtr + 2;
                    while (1)
                    {
                      CFStringRef v38 = CFStringCreateWithCString(0, v37, 0);
                      CFDictionaryRef LoaderRecord = fetchLoaderRecord(v8, v38, v108, (uint64_t)__s, (uint64_t)v126, (unsigned int *)&v127);
                      CFRelease(v38);
                      if (LoaderRecord) {
                        CFRelease(LoaderRecord);
                      }
                      if (v127) {
                        goto LABEL_92;
                      }
                      int v40 = *((unsigned __int16 *)v37 + 17);
                      if (v40 == 1) {
                        break;
                      }
                      if (v40 == 6)
                      {
                        int v41 = v31 + 1;
                        if ((int)v31 + 1 < *(unsigned __int16 *)(v30 + 94))
                        {
                          int v110 = 0;
                          int v42 = v31;
                          while (1)
                          {
                            uint64_t v43 = v30 + 152 * v41;
                            __int16 v44 = lookupDESC((const char *)(v43 + 144));
                            if (!v44) {
                              goto LABEL_64;
                            }
                            int v45 = (unsigned __int16)v44[1];
                            if (v45 != 4)
                            {
                              int v42 = v41;
                              if (v45 == 2) {
                                goto LABEL_84;
                              }
                              goto LABEL_65;
                            }
                            int v46 = comparePartitions(v43 + 96, (char *)__s);
                            if ((~v46 & 6) == 0 || (v46 & 2) != 0 && BYTE2(v126[0]))
                            {
                              if (!v110)
                              {
                                int v110 = 1;
LABEL_64:
                                int v42 = v41;
                                goto LABEL_65;
                              }
                              ++v110;
                            }
                            CFStringRef v47 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * v41 + 192));
                            CFDictionaryRef v48 = CFArrayDictionarySearchWithIndexOptions(theArray, @"GUID", v47, &idx, 0);
                            CFRelease(v47);
                            if (v48) {
                              CFArrayRemoveValueAtIndex(theArray, idx);
                            }
                            int v11 = (uint64_t *)v109;
                            int v127 = delentry(v109, 96, 0x5Eu, (unsigned __int16)v41, 152);
                            if (v127) {
                              goto LABEL_92;
                            }
LABEL_65:
                            int v41 = v42 + 1;
                            if (v42 + 1 >= *(unsigned __int16 *)(v30 + 94)) {
                              goto LABEL_84;
                            }
                          }
                        }
                        goto LABEL_84;
                      }
LABEL_85:
                      v37 += 38;
                      if (++v114 >= LOWORD(valuePtr[0])) {
                        goto LABEL_38;
                      }
                    }
                    if ((int)v31 < 2)
                    {
LABEL_84:
                      if (v127) {
                        goto LABEL_92;
                      }
                      goto LABEL_85;
                    }
                    int v111 = 0;
                    uint64_t v49 = v31;
                    while (2)
                    {
                      uint64_t v50 = (v49 - 1);
                      uint64_t v51 = v30 + 152 * v50;
                      int v52 = lookupDESC((const char *)(v51 + 144));
                      if (v52)
                      {
                        int v53 = (unsigned __int16)v52[1];
                        if (v53 == 4)
                        {
                          int v54 = comparePartitions(v51 + 96, (char *)__s);
                          if ((~v54 & 6) == 0 || (v54 & 2) != 0 && BYTE2(v126[0]))
                          {
                            if (!v111)
                            {
                              int v111 = 1;
                              goto LABEL_83;
                            }
                            ++v111;
                          }
                          CFStringRef v55 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * v50 + 192));
                          CFDictionaryRef v56 = CFArrayDictionarySearchWithIndexOptions(theArray, @"GUID", v55, &idx, 0);
                          CFRelease(v55);
                          if (v56) {
                            CFArrayRemoveValueAtIndex(theArray, idx);
                          }
                          int v11 = (uint64_t *)v109;
                          int v127 = delentry(v109, 96, 0x5Eu, (unsigned __int16)(v49 - 1), 152);
                          if (v127) {
                            goto LABEL_92;
                          }
                          uint64_t v31 = (v31 - 1);
                          uint64_t v50 = v49;
                          goto LABEL_83;
                        }
                        if (v53 == 2) {
                          goto LABEL_84;
                        }
                      }
LABEL_83:
                      uint64_t v49 = v50;
                      if ((int)v50 <= 1) {
                        goto LABEL_84;
                      }
                      continue;
                    }
                  }
                  if (v127) {
                    goto LABEL_92;
                  }
LABEL_38:
                  uint64_t v31 = (v31 + 1);
                  if ((int)v31 >= *(unsigned __int16 *)(v30 + 94)) {
                    goto LABEL_92;
                  }
                }
                int v127 = -417;
              }
LABEL_92:
              CFRelease(cf);
              a5 = v112;
              CFURLRef v26 = v118;
              CFArrayRef v25 = theArray;
              a3 = v102;
              CFDictionaryRef v57 = theDict;
            }
            else
            {
              CFDictionaryRef v57 = v28;
            }
            CFRelease(v57);
          }
          int v58 = v127;
          if (v127 == -1) {
            int v58 = *__error();
          }
          unsigned int UUID = v58;
          if (v58) {
            return UUID;
          }
        }
      }
      else
      {
        CFDictionaryRef v117 = 0;
        CFURLRef v26 = 0;
      }
      CFDictionaryRef v119 = v26;
      uint64_t v113 = a5;
      int Count = CFArrayGetCount(v25);
      if (Count >= 1)
      {
        int v60 = Count;
        LODWORD(v61) = 0;
        unint64_t v115 = a3 / (*(_DWORD *)(*v11 + 32) >> 9);
        CFTypeRef cfa = (CFTypeRef)*MEMORY[0x263EFFB40];
        while (2)
        {
          CFIndex v61 = (int)v61;
          while (1)
          {
            unsigned int UUID = 22;
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v61);
            if (!ValueAtIndex) {
              goto LABEL_166;
            }
            CFDictionaryRef v63 = ValueAtIndex;
            unsigned int UUID = CFDictionaryGetUUID(ValueAtIndex, @"GUID", uu1);
            if (UUID != 2) {
              break;
            }
            ++v61;
            unsigned int UUID = 0;
            if (v61 >= v60) {
              goto LABEL_166;
            }
          }
          CFDictionaryRef v64 = (const __CFDictionary *)CFDictionaryGetValue(v63, @"Options");
          cStr = (char *)v64;
          if ((unint64_t)v116 | (unint64_t)v64) {
            int theDicta = GPTConvertCreateOptions(v116, v64);
          }
          else {
            int theDicta = 0;
          }
          unsigned int UUID = gpmrsearch(v11, uu1, &v122);
          uint64_t v65 = *v11;
          if (UUID)
          {
            v103 = 0;
            uint64_t v138 = 0;
            long long v136 = 0u;
            long long v137 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            long long v130 = 0u;
            long long v131 = 0u;
            long long v129 = 0u;
          }
          else
          {
            uint64_t v66 = v65 + 152 * (__int16)v122;
            v103 = (char *)(v66 + 96);
            long long v67 = *(_OWORD *)(v66 + 192);
            long long v68 = *(_OWORD *)(v66 + 208);
            long long v69 = *(_OWORD *)(v66 + 224);
            uint64_t v138 = *(void *)(v66 + 240);
            long long v136 = v68;
            long long v137 = v69;
            long long v70 = *(_OWORD *)(v66 + 112);
            long long v129 = *(_OWORD *)(v66 + 96);
            long long v130 = v70;
            long long v71 = *(_OWORD *)(v66 + 128);
            long long v72 = *(_OWORD *)(v66 + 144);
            long long v73 = *(_OWORD *)(v66 + 176);
            long long v133 = *(_OWORD *)(v66 + 160);
            long long v134 = v73;
            long long v131 = v71;
            long long v132 = v72;
            long long v135 = v67;
            long long v136 = 0uLL;
          }
          GPTUpdatePartitionRecord(v63, (uint64_t)&v129, *(_DWORD *)(v65 + 32));
          if (UUID)
          {
            if (UUID != -5343) {
              break;
            }
            if ((theDicta & 0x400000) != 0)
            {
              *((void *)&v136 + 1) = 0;
              CFNumberRef v75 = CFNumberCreate(0, kCFNumberSInt64Type, (char *)&v136 + 8);
              CFDictionarySetValue(v63, @"Size", v75);
              CFRelease(v75);
            }
          }
          else
          {
            unint64_t v76 = *((void *)&v136 + 1);
            if (!((void)v136 + *((void *)&v136 + 1)))
            {
              if ((theDicta & 0x20000000) == 0)
              {
                unsigned int UUID = purgeLoader(v119, v117, (const void **)v11, (__int16)v122, (int *)&v121 + 1, theArray, v61, &v121);
                if (UUID) {
                  break;
                }
                LODWORD(v61) = v61 + ((int)v121 >> 31);
                v60 -= v121 != 0;
                if (v121 < 0)
                {
                  unsigned int UUID = gpmrsearch(v11, uu1, &v122);
                  if (UUID) {
                    break;
                  }
                }
              }
              unsigned int UUID = delentry((const void **)v11, 96, 0x5Eu, v122, 152);
              if (UUID) {
                break;
              }
              CFArrayRemoveValueAtIndex(theArray, (int)v61);
              --v60;
              goto LABEL_138;
            }
            unint64_t v97 = v136;
            if (!strcasecmp((const char *)&v132, v103 + 48))
            {
              if (v76 == *((void *)v103 + 15))
              {
                int v77 = 0;
                uint64_t v78 = v76;
                unint64_t v79 = v97;
              }
              else
              {
                if (v76)
                {
                  int v77 = 0;
                  unint64_t v79 = v97;
                }
                else
                {
                  int v82 = (__int16)v122 + 1;
                  if (v82 >= *(unsigned __int16 *)(v65 + 94)) {
                    uint64_t v83 = *(void *)(v65 + 40) + *(void *)(v65 + 56);
                  }
                  else {
                    uint64_t v83 = *(void *)(v65 + 152 * v82 + 208);
                  }
                  unint64_t v79 = v97;
                  unint64_t v76 = v83 - *((void *)v103 + 14);
                  int v77 = 1;
                }
                uint64_t v78 = v76 / v115 * v115;
                *((void *)&v136 + 1) = v78;
                unint64_t v76 = *((void *)v103 + 15);
              }
              if (v78 == v76) {
                int v84 = v77;
              }
              else {
                int v84 = v77 | 0x3E8;
              }
              int64_t v98 = v78 - v76;
              if (v79 == *((void *)v103 + 14))
              {
                int cStra = v84;
              }
              else
              {
                MEMORY[0x223C20E30](v103 + 96);
                int cStra = v84 + 1;
                uint64_t v78 = *((void *)&v136 + 1);
                unint64_t v79 = v136;
              }
              unsigned int UUID = svalidate(v11, v79, v78, (unsigned __int16)v115, (__int16)v122);
              if (UUID) {
                break;
              }
              unsigned int v85 = cStra;
              if ((void)v137 != *((void *)v103 + 16)) {
                unsigned int v85 = cStra + 1;
              }
              unsigned int cStrb = v85;
              int v86 = strcasecmp((const char *)&v129, v103);
              unsigned int v87 = cStrb;
              if (v86) {
                unsigned int v87 = cStrb + 1;
              }
              if (v87)
              {
                long long v88 = v130;
                *(_OWORD *)v103 = v129;
                *((_OWORD *)v103 + 1) = v88;
                long long v89 = v131;
                long long v90 = v132;
                long long v91 = v134;
                *((_OWORD *)v103 + 4) = v133;
                *((_OWORD *)v103 + 5) = v91;
                *((_OWORD *)v103 + 2) = v89;
                *((_OWORD *)v103 + 3) = v90;
                long long v92 = v135;
                long long v93 = v136;
                long long v94 = v137;
                *((void *)v103 + 18) = v138;
                *((_OWORD *)v103 + 7) = v93;
                *((_OWORD *)v103 + 8) = v94;
                *((_OWORD *)v103 + 6) = v92;
                if ((theDicta & 0x20000000) == 0 && v87 >= 0x3E8)
                {
                  unsigned int v95 = setupPostloader(v11, (__int16 *)&v122, v8, v119, v115, v98, 0, theDicta, (uint64_t)v128, v113);
                  if (v95 == 28) {
                    unsigned int v96 = 0;
                  }
                  else {
                    unsigned int v96 = v95;
                  }
                  unsigned int UUID = v96;
                }
              }
              unsigned int UUID = GPTUpdatePartitionDictionary(v63, *v11 + 152 * (__int16)v122 + 96, *(unsigned __int16 *)(*v11 + 32));
              if (UUID) {
                break;
              }
              goto LABEL_137;
            }
            if ((theDicta & 0x20000000) == 0)
            {
              unsigned int UUID = purgeLoader(v119, v117, (const void **)v11, (__int16)v122, (int *)&v121 + 1, theArray, v61, &v121);
              if (UUID) {
                break;
              }
              LODWORD(v61) = v61 + ((int)v121 >> 31);
              if (v121 < 0)
              {
                unsigned int UUID = gpmrsearch(v11, uu1, &v122);
                if (UUID) {
                  break;
                }
              }
            }
            unsigned int UUID = delentry((const void **)v11, 96, 0x5Eu, v122, 152);
            if (UUID) {
              break;
            }
            if ((theDicta & 0x2000) == 0)
            {
              long long v80 = (__CFDictionary *)cStr;
              if (!cStr)
              {
                CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                CFDictionaryAddValue(v63, @"Options", Mutable);
                CFRelease(Mutable);
                long long v80 = Mutable;
              }
              CFDictionarySetValue(v80, @"Retain existing content", cfa);
            }
          }
          unsigned int UUID = GPTCFCreatePartition(a1, v63, v8, v74, v119, v115, v116, v113);
          if (UUID) {
            break;
          }
          int v60 = CFArrayGetCount(theArray);
          if (UUID) {
            break;
          }
LABEL_137:
          LODWORD(v61) = v61 + 1;
LABEL_138:
          if ((int)v61 < v60) {
            continue;
          }
          break;
        }
      }
LABEL_166:
      if (v117) {
        CFRelease(v117);
      }
      if (v119) {
        CFRelease(v119);
      }
      return UUID;
    }
  }
  return result;
}

uint64_t svalidate(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a1) {
    return 22;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)(*a1 + 152 * a5 + 208);
  if (a5 >= 1
    && ((a2 - v6) & 0x8000000000000000) != 0
    && *(void *)(v5 + 152 * (a5 - 1) + 216) + *(void *)(v5 + 152 * (a5 - 1) + 208) > a2)
  {
    return 4294961955;
  }
  if ((uint64_t)(a3 + a2 - (v6 + *(void *)(v5 + 152 * a5 + 216))) < 1) {
    return 0;
  }
  if (a5 + 1 >= *(unsigned __int16 *)(v5 + 94)) {
    unint64_t v8 = *(void *)(v5 + 40) + *(void *)(v5 + 56);
  }
  else {
    unint64_t v8 = *(void *)(v5 + 152 * (a5 + 1) + 208);
  }
  if (a3 + a2 <= v8) {
    return 0;
  }
  else {
    return 4294961955;
  }
}

uint64_t GPTWriteMedia(uint64_t *a1, const __CFDictionary *a2, uint64_t a3)
{
  h[2] = *(Handle *)MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  unsigned __int8 v66 = MKCFOptionBit(a2, @"Legacy Mode", 1);
  unsigned __int8 v65 = MKCFOptionBit(a2, @"UEFI Mode", 2);
  long long v67 = a1;
  uint64_t v6 = *a1;
  uint64_t v7 = *(uint64_t **)(*a1 + 8);
  unint64_t v71 = 0;
  unsigned int v8 = *(_DWORD *)(v6 + 32);
  CFDictionaryRef v64 = v7;
  uint64_t v9 = *v7;
  uint64_t v10 = (*(_DWORD *)(*v7 + 84) * *(_DWORD *)(*v7 + 80));
  unsigned int v11 = v10 / v8;
  if (v10 % v8) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = *(void *)(v6 + 64) - 1;
  uint64_t v14 = v13 - v12;
  unint64_t v72 = 0;
  unint64_t v15 = (char *)malloc_type_calloc(1uLL, v12 * v8, 0x626992CFuLL);
  if (!v15)
  {
    int v27 = 0;
LABEL_32:
    uint64_t v30 = *__error();
LABEL_33:
    if (v30) {
      return v30;
    }
    *(void *)(v9 + 24) = 1;
    *(void *)(v9 + 32) = v13;
    *(void *)(v9 + 72) = 2;
    *(_DWORD *)(v9 + 88) = v27;
    *(_DWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 16) = mk_crc32((char *)v9, *(unsigned int *)(v9 + 12));
    uint64_t v30 = MKMediaWriteBlocks(a3, 1, 1, v8, (char *)v9, &v71);
    if (v30) {
      return v30;
    }
    *(void *)(v9 + 24) = v13;
    *(void *)(v9 + 32) = 1;
    *(void *)(v9 + 72) = v14;
    *(_DWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 16) = mk_crc32((char *)v9, *(unsigned int *)(v9 + 12));
    uint64_t v30 = MKMediaWriteBlocks(a3, v13, 1, v8, (char *)v9, &v71);
    if (v30) {
      return v30;
    }
    long long v70 = (void *)a3;
    h[0] = 0;
    LOWORD(v72) = 0;
    uint64_t v31 = *v67;
    unint64_t v32 = *(void *)(*v67 + 64);
    if (v32 >= 0xFFFFFFFF) {
      LODWORD(v33) = -1;
    }
    else {
      uint64_t v33 = *(void *)(*v67 + 64);
    }
    uint64_t v30 = PMNewPartitionListInternal((const void ***)h, 0, v33, *(_DWORD *)(v31 + 32), 0, 8, 0);
    if (v30) {
      goto LABEL_102;
    }
    char v34 = v65 | v66;
    if (*(_WORD *)(v31 + 94))
    {
      char v35 = 0;
      int v36 = 0;
      unsigned int v37 = 0;
      uint64_t v38 = v31 + 144;
      do
      {
        unint64_t v39 = *(void *)(v38 + 64);
        if (!HIDWORD(v39) && !((*(void *)(v38 + 72) + v39) >> 32))
        {
          int v40 = MBRInfoSearch((char *)v38);
          if (v40)
          {
            unsigned int v41 = *v40;
            BOOL v42 = v41 > 0xC || ((1 << v41) & 0x1880) == 0;
            if (!v42 || v41 == 131)
            {
              ++v36;
            }
            else if (v41 == 239)
            {
              ++v35;
            }
          }
        }
        if (v37 > 2) {
          break;
        }
        ++v37;
        v38 += 152;
      }
      while (v37 < *(unsigned __int16 *)(v31 + 94));
    }
    else
    {
      int v36 = 0;
      char v35 = 0;
    }
    uint64_t v43 = (uint64_t)*h[0];
    *(_DWORD *)(v43 + 616) = *((_DWORD *)*h[0] + 154) & 0xFFEFFFFF;
    if (!*(void *)(v43 + 968) && v64[1])
    {
      __int16 v44 = malloc_type_calloc(1uLL, 0x200uLL, 0x19F57FABuLL);
      *(void *)(v43 + 968) = v44;
      memcpy(v44, (const void *)v64[1], 0x1BEuLL);
    }
    if (((v65 | v66) & 2) != 0 || !v36 || !v35) {
      goto LABEL_69;
    }
    if (((v65 | v66) & 1) == 0 && (*(void *)(v31 + 80) & 2) != 0) {
      char v34 = *(void *)(v31 + 80);
    }
    if ((v34 & 1) == 0)
    {
LABEL_69:
      if (v32 - 1 >= 0xFFFFFFFF) {
        unsigned int v45 = -1;
      }
      else {
        unsigned int v45 = v32 - 1;
      }
      uint64_t v30 = PMNewPartitionExtended((const void **)h[0], 238, 0, 1u, v45, 0, 0, (unsigned __int16 *)&v72, 0x100000004);
      if (v30)
      {
LABEL_102:
        if (h[0]) {
          PMDisposePartitionRecord(h[0]);
        }
        if (v30 == -1) {
          return *__error();
        }
        return v30;
      }
LABEL_100:
      uint64_t v60 = MBRWriteMedia(h[0], 0x8000000, (uint64_t)v70, (uint64_t (*)(uint64_t, uint64_t, void))MKMediaDeviceIO);
LABEL_101:
      uint64_t v30 = v60;
      goto LABEL_102;
    }
    unsigned int v46 = *(unsigned __int16 *)(v31 + 94);
    if (!*(_WORD *)(v31 + 94)) {
      goto LABEL_100;
    }
    uint64_t v47 = 0;
    unsigned int v48 = 0;
    uint64_t v49 = v31 + 144;
    while (1)
    {
      unint64_t v50 = *(void *)(v49 + 64);
      uint64_t v51 = *(void *)(v49 + 72);
      if (HIDWORD(v50)) {
        BOOL v52 = 0;
      }
      else {
        BOOL v52 = (v51 + v50) >> 32 == 0;
      }
      if (!v52) {
        goto LABEL_80;
      }
      int v54 = MBRInfoSearch((char *)v49);
      if (!v54)
      {
        int v54 = MBRInfoSearch("UNKNOWN");
        if (!v54) {
          break;
        }
      }
      int v55 = *v54;
      BOOL v56 = v55 == 239;
      if (v55 == 239) {
        int v57 = 238;
      }
      else {
        int v57 = *v54;
      }
      if (v55 == 239) {
        int v58 = v50 - 1;
      }
      else {
        int v58 = 0;
      }
      if (v56) {
        unsigned int v59 = 1;
      }
      else {
        unsigned int v59 = v50;
      }
      uint64_t v60 = PMNewPartitionExtended((const void **)h[0], v57, 0, v59, v58 + (int)v51, 0, 0, (unsigned __int16 *)&v72, 0x100000004);
      if (v60) {
        goto LABEL_101;
      }
      if ((*(unsigned char *)(v49 + 88) & 0x80) != 0) {
        *(_DWORD *)&(*h[0])[1072 * (__int16)v72 + 616] |= 0x80000000;
      }
      uint64_t v53 = (v47 + 1);
      unsigned int v46 = *(unsigned __int16 *)(v31 + 94);
      if ((int)v47 >= 3 && v46 > 4) {
        goto LABEL_100;
      }
LABEL_97:
      ++v48;
      v49 += 152;
      uint64_t v47 = v53;
      if (v48 >= v46) {
        goto LABEL_100;
      }
    }
    unsigned int v46 = *(unsigned __int16 *)(v31 + 94);
LABEL_80:
    uint64_t v53 = v47;
    goto LABEL_97;
  }
  uint64_t v62 = v10;
  uint64_t v63 = v12;
  uint64_t v68 = v13;
  long long v69 = v15;
  if (!*(_WORD *)(v6 + 94))
  {
LABEL_21:
    CFURLRef v26 = v69;
    int v27 = mk_crc32(v69, v62);
    uint64_t v28 = MKMediaWriteBlocks(a3, 2, v63, v8, v69, &v72);
    uint64_t v13 = v68;
    if (v68 != v63 && v28 == 0) {
      uint64_t v30 = MKMediaWriteBlocks(a3, v14, v63, v8, v69, &v72);
    }
    else {
      uint64_t v30 = v28;
    }
LABEL_31:
    free(v26);
    if (v30 != -1) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  unsigned int v16 = 0;
  unsigned __int8 v17 = (char *)(v6 + 240);
  uint64_t v18 = (uint64_t)v15;
  while (1)
  {
    h[0] = 0;
    h[1] = 0;
    *(_OWORD *)(v18 + 32) = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
    *(_OWORD *)(v18 + 64) = 0u;
    *(_OWORD *)(v18 + 80) = 0u;
    *(_OWORD *)(v18 + 96) = 0u;
    *(_OWORD *)(v18 + 112) = 0u;
    *(_OWORD *)uint64_t v18 = 0u;
    *(_OWORD *)(v18 + 16) = 0u;
    uuid_LtoB(v18 + 16, (uint64_t)(v17 - 48));
    GPTTypestr2Uuid((unsigned __int8 *)h, v17 - 96);
    uuid_LtoB(v18, (uint64_t)h);
    uint64_t v19 = *((void *)v17 - 4);
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v19 + *((void *)v17 - 3) - 1;
    *(void *)(v18 + 48) = *((void *)v17 - 2);
    int v20 = strlen(v17 - 144);
    int v21 = uniconvert((void *)(v18 + 56), 72, 0x14000100u, 0, (const UInt8 *)v17 - 144, v20, 0x8000100u, 0);
    if (v20 >= 1 && v21 == -1) {
      break;
    }
    if ((*(v17 - 8) & 8) != 0)
    {
      uint64_t v22 = *((void *)v17 - 3) >= 0xC8uLL ? 200 : *((void *)v17 - 3);
      uint64_t v23 = MKMediaEraseBlocks(a3, *((void *)v17 - 4), v22, v8, &v72);
      if (v23
        || (unint64_t v24 = *((void *)v17 - 3), v24 >= 0xC9)
        && (v24 - 200 >= 0xC8 ? (uint64_t v25 = 200) : (uint64_t v25 = v24 - 200),
            uint64_t v23 = MKMediaEraseBlocks(a3, v24 - v25 + *((void *)v17 - 4), v25, v8, &v72),
            v23))
      {
        uint64_t v30 = v23;
        int v27 = 0;
        uint64_t v13 = v68;
        CFURLRef v26 = v69;
        goto LABEL_31;
      }
    }
    *((void *)v17 - 1) &= 0xFFFFFFFFFFFFFFF6;
    *(_WORD *)unsigned __int8 v17 = v16;
    v17 += 152;
    ++v16;
    v18 += 128;
    if (v16 >= *(unsigned __int16 *)(v6 + 94)) {
      goto LABEL_21;
    }
  }
  free(v69);
  return 92;
}

void GPTTypestr2Uuid(unsigned __int8 *a1, char *__s)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = strlen(__s);
  uniconvert(v7, 80, 0x600u, 1u, (const UInt8 *)__s, v4, 0x8000100u, 0);
  uint64_t v5 = lookupDESC(v7);
  if (v5) {
    uint64_t v6 = (const char *)(v5 + 2);
  }
  else {
    uint64_t v6 = v7;
  }
  if (uuid_parse(v6, a1)) {
    uuid_copy(a1, NaNuuid);
  }
}

uint64_t uniconvert(void *a1, int a2, CFStringEncoding a3, Boolean a4, const UInt8 *a5, int a6, CFStringEncoding a7, Boolean a8)
{
  CFIndex v15 = a2;
  bzero(a1, a2);
  CFStringRef v16 = CFStringCreateWithBytes(0, a5, a6, a7, a8);
  if (!v16) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v17 = v16;
  CFIndex usedBufLen = 0;
  v21.length = CFStringGetLength(v16);
  v21.location = 0;
  CFIndex Bytes = CFStringGetBytes(v17, v21, a3, 0x2Du, a4, (UInt8 *)a1, v15, &usedBufLen);
  CFRelease(v17);
  return Bytes;
}

uint64_t MKMediaEraseBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unint64_t *a5)
{
  unint64_t v6 = a4 >> 9;
  unint64_t v8 = 0;
  uint64_t result = MKMediaEraseSectors(a1, v6 * a2, v6 * a3, &v8);
  if (a5) {
    *a5 = v8 / v6;
  }
  return result;
}

uint64_t MKMediaEraseSectors(uint64_t a1, unint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v13 = 0;
  if (*(void *)(a1 + 112) >= a3) {
    size_t v8 = a3;
  }
  else {
    size_t v8 = *(void *)(a1 + 112);
  }
  uint64_t v9 = (char *)malloc_type_calloc(v8, 0x200uLL, 0xD97BF171uLL);
  if (!v9) {
    return 12;
  }
  uint64_t v10 = v9;
  uint64_t v11 = MKMediaWriteMultipleSectors(a1, a2, a3, v9, v8, &v13);
  if (a4) {
    *a4 = v13;
  }
  free(v10);
  return v11;
}

uint64_t MKMediaWriteMultipleSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, unint64_t a5, void *a6)
{
  if (a3)
  {
    unint64_t v9 = a3;
    uint64_t v12 = 0;
    while (1)
    {
      unint64_t v13 = v9 >= a5 ? a5 : v9;
      uint64_t v15 = 0;
      uint64_t result = MKMediaWriteSectors(a1, a2, v13, a4, &v15);
      if (result) {
        break;
      }
      v12 += v15;
      a2 += v13;
      v9 -= v13;
      if (!v9) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
LABEL_10:
    uint64_t result = 0;
  }
  if (a6) {
    *a6 = v12;
  }
  return result;
}

uint64_t mk_crc32(char *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unsigned int v2 = -1;
  do
  {
    char v3 = *a1++;
    unsigned int v2 = crc32table[(v3 ^ v2)] ^ (v2 >> 8);
    --a2;
  }
  while (a2);
  return ~v2;
}

uint64_t mk_crc32calc(char *a1, uint64_t a2, uint64_t a3)
{
  for (; a2; --a2)
  {
    char v3 = *a1++;
    a3 = crc32table[(v3 ^ a3)] ^ (a3 >> 8);
  }
  return a3;
}

uint64_t PMNewPartitionListInternal(const void ***a1, int a2, unsigned int a3, unsigned int a4, int a5, int a6, char a7)
{
  uint64_t v7 = a1;
  size_t v8 = 0;
  LOWORD(a1) = 22;
  if (!a3) {
    goto LABEL_17;
  }
  if (!a4) {
    goto LABEL_17;
  }
  size_t v8 = (const void **)NewHandleClear(528);
  LOWORD(a1) = MemError();
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v15 = *v8;
  v15[256] = 516;
  v15[257] = a6;
  v15[259] = a4;
  if ((a6 - 1) < 3)
  {
    LODWORD(a1) = APMSetupNewPartitionList(v8, a2, a3, a4, a5, a7);
    if (a1) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if (a6 == 8)
  {
    LODWORD(a1) = MBRSetupNewPartitionList(v8, a3, a4);
    if ((a1 & 0xFFFFFFFD) != 0) {
      goto LABEL_17;
    }
    *((_DWORD *)*v8 + 154) |= 0x100000u;
    LODWORD(a1) = PMAccountFreespace(v8, 0, 0);
    if (a1) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if (a6 != 32)
  {
    LOWORD(a1) = -50;
    goto LABEL_17;
  }
  LODWORD(a1) = ISOSetupNewPartitionList(v8, a3, a4);
  if (!a1)
  {
LABEL_13:
    if (*((_WORD *)*v8 + 261)) {
      MEMORY[0x223C20E30]((char *)*v8 + 976);
    }
    LOWORD(a1) = 0;
  }
LABEL_17:
  *uint64_t v7 = v8;
  return (__int16)a1;
}

uint64_t MBRSetupNewPartitionList(const void **a1, unsigned int a2, unsigned __int16 a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_11;
  }
  PMSynthHeader((_OWORD **)a1, a3, a2, 8);
  unint64_t v6 = *a1;
  *((_WORD *)v6 + 259) = a3;
  *((_WORD *)v6 + 260) = 0x7FFF;
  *((_DWORD *)v6 + 127) = 131135;
  unsigned int v7 = a2 / 0x7E;
  if (a2 < 0x1F87E) {
    goto LABEL_10;
  }
  unsigned int v8 = 2;
  while (v8 <= 0xFF)
  {
    v8 *= 2;
    *((_WORD *)v6 + 255) = v8;
    unsigned int v9 = v7 >> 1;
    BOOL v10 = v7 > 0x801;
    v7 >>= 1;
    if (!v10) {
      goto LABEL_8;
    }
  }
  unsigned int v9 = v7;
LABEL_8:
  *((_DWORD *)v6 + 126) = v9;
  if (v8 == 256)
  {
    *((_WORD *)v6 + 255) = 255;
    unsigned int v7 = a2 / 0x3EC1;
LABEL_10:
    *((_DWORD *)v6 + 126) = v7;
  }
LABEL_11:
  bzero(v14, 0x430uLL);
  int v15 = 1;
  int v17 = -1;
  __int16 v18 = 0x8000;
  strncpypad(v16, "MBR", 0x20uLL, 0);
  signed int v11 = addentry(a1, v14, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u) << 16;
  if (v11 == -65536) {
    int v12 = *__error();
  }
  else {
    int v12 = v11 >> 16;
  }
  return (__int16)v12;
}

double PMSynthHeader(_OWORD **a1, unsigned int a2, int a3, __int16 a4)
{
  if (a1)
  {
    int v4 = *a1;
    double result = 0.0;
    v4[30] = 0u;
    v4[31] = 0u;
    v4[28] = 0u;
    v4[29] = 0u;
    v4[26] = 0u;
    v4[27] = 0u;
    v4[24] = 0u;
    v4[25] = 0u;
    v4[22] = 0u;
    v4[23] = 0u;
    v4[20] = 0u;
    v4[21] = 0u;
    v4[18] = 0u;
    v4[19] = 0u;
    v4[16] = 0u;
    v4[17] = 0u;
    v4[14] = 0u;
    v4[15] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    unint64_t v6 = *a1;
    *((_WORD *)v6 + 256) = 516;
    *((_WORD *)v6 + 257) = a4;
    *((_WORD *)v6 + 1) = a2;
    *((_DWORD *)v6 + 1) = a3;
    *((_WORD *)v6 + 250) = a2 >> 9;
  }
  return result;
}

unsigned char *strncpypad(unsigned char *a1, unsigned char *a2, unint64_t a3, int __c)
{
  int v4 = a1;
  if (!a2 || ((LOBYTE(v5) = *a2) != 0 ? (BOOL v6 = a3 == 0) : (BOOL v6 = 1), v6))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    do
    {
      a1[v7] = v5;
      int v5 = a2[++v7];
      if (v5) {
        BOOL v8 = v7 >= a3;
      }
      else {
        BOOL v8 = 1;
      }
    }
    while (!v8);
    a1 += v7;
  }
  BOOL v9 = a3 > v7;
  size_t v10 = a3 - v7;
  if (v9) {
    memset(a1, __c, v10);
  }
  return v4;
}

uint64_t PMAccountFreespace(const void **a1, int a2, unsigned int a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  bzero(&v40, 0x430uLL);
  if (!a1) {
    return -50;
  }
  BOOL v6 = *a1;
  unsigned int v7 = *((__int16 *)*a1 + 257);
  unsigned int v8 = v7 < 4;
  PMInitPartitionRecord(v7, 0, 0, 24320, 0, 0, &v40);
  int v43 = (a2 << 24) | 0x200000;
  int v9 = *((unsigned __int16 *)v6 + 261);
  if (v9 == 1)
  {
    unsigned int v10 = v6[134];
    unsigned int v11 = v6[135] + v10;
    LOWORD(v9) = 1;
  }
  else
  {
    LOWORD(v16) = 0;
    unsigned int v11 = 0;
    unsigned int v17 = (unsigned __int16)v7;
    int v18 = ((unsigned __int16)v7 == 8) & (a3 >> 15);
    unsigned int v10 = -1;
LABEL_13:
    uint64_t v19 = (unsigned __int16)v16;
    if ((unsigned __int16)v16 <= (unsigned __int16)v9) {
      uint64_t v16 = (unsigned __int16)v9;
    }
    else {
      uint64_t v16 = (unsigned __int16)v16;
    }
    uint64_t v20 = (uint64_t)&v6[268 * v19 - 134];
    uint64_t v21 = v19 - 1;
    uint64_t v22 = -v16;
    while (v22 + v21 != -1)
    {
      unsigned int v23 = *(_DWORD *)(v20 + 1076);
      v20 += 1072;
      ++v21;
      if (v23)
      {
        LOWORD(v16) = v21 + 1;
        unsigned int v24 = *(_DWORD *)v20;
        if (v17 <= 7 && !v24) {
          goto LABEL_13;
        }
        if (v24 < v10) {
          unsigned int v10 = *(_DWORD *)v20;
        }
        if ((*(unsigned char *)(v20 + 460) & 3) != 0) {
          goto LABEL_13;
        }
        int v25 = v23 + v24;
        unsigned __int16 v26 = v21 + 1;
LABEL_25:
        uint64_t v27 = v26;
        if (v26 <= (unsigned __int16)v9) {
          uint64_t v28 = (unsigned __int16)v9;
        }
        else {
          uint64_t v28 = v26;
        }
        uint64_t v29 = (uint64_t)&v6[268 * v26 - 134];
        while (v28 != v27)
        {
          ++v27;
          int v30 = *(_DWORD *)(v29 + 1076);
          v29 += 1072;
          if (v30)
          {
            int v31 = *(_DWORD *)v29;
            unsigned int v32 = v30 + *(_DWORD *)v29;
            if (v32 > v11) {
              unsigned int v11 = v30 + *(_DWORD *)v29;
            }
            char v33 = *(unsigned char *)(v29 + 460);
            unsigned __int16 v26 = v27;
            if ((v33 & 3) != 0) {
              goto LABEL_25;
            }
            unsigned int v34 = v31 - v25;
            if (v31 == v25) {
              goto LABEL_13;
            }
            if ((v34 & 0x80000000) != 0)
            {
              if (v17 != 8 || (int v35 = *(unsigned __int16 *)(v20 + 546), v35 != 5) && v35 != 15 && v35 != 133)
              {
                if (v23 >= v25 - v31)
                {
                  if (v25 == v11) {
                    unsigned int v11 = v32;
                  }
                  *(_DWORD *)(v20 + 4) = v34 + v23;
                  *(_DWORD *)(v20 + 76) += v34;
                }
              }
            }
            else if (!v18 || v34 >= *((unsigned __int16 *)v6 + 254))
            {
              if ((a3 & 0x80000) != 0 && v34 <= 0x7F && *(_WORD *)(v20 + 546) != 4097)
              {
                *(_DWORD *)(v20 + 4) = v34 + v23;
                goto LABEL_13;
              }
              if ((a3 & 0x8000) == 0 || v34 >= 0x20)
              {
                __int16 v37 = v21;
                unsigned int v38 = v17;
                int v39 = v18;
                int v41 = v25;
                unsigned int v42 = v31 - v25;
                __int16 v12 = addentry(a1, &v40, 0x210uLL, 0x20Au, (unsigned __int16)(v21 + 1), 0x430u);
                if (v12) {
                  return v12;
                }
                BOOL v6 = *a1;
                LOWORD(v16) = v37 + 2;
                LOWORD(v9) = *((_WORD *)*a1 + 261);
                unsigned int v17 = v38;
                int v18 = v39;
              }
            }
            goto LABEL_13;
          }
        }
        break;
      }
    }
  }
  if ((_WORD)v9 && v10 > v8)
  {
    int v41 = 1;
    unsigned int v42 = v10 - 1;
    __int16 v12 = addentry(a1, &v40, 0x210uLL, 0x20Au, 0, 0x430u);
    if (v12) {
      return v12;
    }
    BOOL v6 = *a1;
  }
  unsigned int v13 = v6[1];
  BOOL v14 = v13 >= v11;
  unsigned int v15 = v13 - v11;
  if (v15 != 0 && v14)
  {
    int v41 = v11;
    unsigned int v42 = v15;
    return (__int16)addentry(a1, &v40, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
  }
  else
  {
    return 0;
  }
}

void PMInitPartitionRecord(int a1, int a2, int a3, int a4, char *a5, unsigned char *a6, _WORD *a7)
{
  bzero(a7, 0x430uLL);
  *a7 = 20557;
  *((_DWORD *)a7 + 126) = -1;
  *((_DWORD *)a7 + 2) = a2;
  *((_DWORD *)a7 + 3) = a3;
  *((_DWORD *)a7 + 21) = a3;
  if (!a4)
  {
    if (!a5)
    {
      a7[277] = 0;
      if (!a6) {
        return;
      }
      goto LABEL_8;
    }
    a7[277] = (unsigned __int16)PMDescriptorSearch(a5, a1);
    goto LABEL_6;
  }
  a5 = (char *)PMCodeSearch(a4, a1);
  a7[277] = a4;
  if (a5) {
LABEL_6:
  }
    strncpypad((unsigned char *)a7 + 48, a5, 0x20uLL, 0);
  if (!a6) {
    return;
  }
LABEL_8:
  strncpypad((unsigned char *)a7 + 16, a6, 0x20uLL, 0);
}

uint64_t MBRCodeSearch(int a1)
{
  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    unsigned int v2 = i + 8;
    if (!*((void *)i + 3)) {
      return *((void *)v2 + 1);
    }
  }
  unsigned int v2 = i;
  return *((void *)v2 + 1);
}

__int16 *MBRInfoSearchByType(int a1)
{
  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    unsigned int v2 = i + 8;
    if (!*((void *)i + 3)) {
      return v2;
    }
  }
  return i;
}

unsigned __int16 *MBRInfoSearch(char *a1)
{
  return PMLookupDESC(a1, 0, (unsigned __int16 *)&MBRDescriptors);
}

unsigned __int16 *PMLookupDESC(char *a1, int a2, unsigned __int16 *a3)
{
  char v3 = 0;
  if (a1)
  {
    int v4 = a3;
    if (a3)
    {
      BOOL v6 = (const char *)*((void *)a3 + 1);
      if (v6)
      {
        char v3 = a3;
        while (strcasecmp(a1, v6))
        {
          BOOL v6 = (const char *)*((void *)v3 + 3);
          v3 += 8;
          if (!v6) {
            return 0;
          }
        }
        if (a2)
        {
          while (*v4 != *v3)
          {
            uint64_t v9 = *((void *)v4 + 3);
            v4 += 8;
            if (!v9) {
              return v3;
            }
          }
          return v4;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

uint64_t PMNewPartitionExtended(const void **a1, int a2, char *a3, unsigned int a4, unsigned int a5, unsigned char *a6, unsigned int a7, unsigned __int16 *a8, uint64_t a9)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    unsigned __int16 v13 = 0x8000;
    __int16 v14 = -50;
    goto LABEL_91;
  }
  unsigned int v11 = *a1;
  unsigned int v12 = *((unsigned __int16 *)*a1 + 1);
  if (v12 < 0x200)
  {
    unsigned __int16 v13 = 0x8000;
    __int16 v14 = -5323;
    goto LABEL_91;
  }
  unsigned int v15 = *((unsigned __int16 *)v11 + 261);
  unsigned int v16 = *((unsigned __int16 *)v11 + 260);
  if (v15 >= v16)
  {
    unsigned __int16 v13 = 0x8000;
    __int16 v14 = -5341;
    goto LABEL_91;
  }
  if (v16 <= a4) {
    unsigned int v20 = a4;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v16 == 0x7FFF) {
    unsigned int v21 = a4;
  }
  else {
    unsigned int v21 = v20;
  }
  unsigned int v22 = v12 >> 9;
  if (a7) {
    unsigned int v23 = a7;
  }
  else {
    unsigned int v23 = v12 >> 9;
  }
  unsigned int v24 = *((__int16 *)v11 + 257);
  if (v24 >= 4)
  {
    if (v24 == 8 && (a9 & 0x100000000) == 0 && v22 == *((unsigned __int16 *)v11 + 250))
    {
      unsigned int v26 = v11[1];
      if ((a9 & 0x2000000) != 0 && v26 <= 0xFC000)
      {
        unsigned int v25 = 0;
        unsigned int v23 = *((unsigned __int16 *)v11 + 254);
      }
      else
      {
        unsigned int v25 = 0;
        if (v26 > 0x200000) {
          unsigned int v23 = 2048;
        }
      }
    }
    else
    {
      unsigned int v25 = 0;
    }
  }
  else
  {
    unsigned int v25 = 1;
  }
  uint64_t v27 = 0;
  int v28 = 0;
  int v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  unsigned __int16 v13 = 0;
  unsigned __int16 v32 = 0;
  BOOL v34 = a2 != 24320 && v22 <= v23;
  unsigned int v35 = v23 / v22;
  int v36 = v11;
  while (1)
  {
    if (v15 <= v13)
    {
      unsigned int v37 = v11[1];
    }
    else
    {
      unsigned int v37 = v36[134];
      if (*((_WORD *)v36 + 541) == 24320 && (v36[249] & 0x20) == 0)
      {
        if (v21 == v37) {
          unsigned __int16 v32 = v13;
        }
        int v28 = 24320;
        goto LABEL_67;
      }
    }
    unsigned int v38 = v37 / v35 * v35;
    if (v21)
    {
      if (v21 >= v25 || (a9 & 0x10000000) == 0) {
        unsigned int v40 = v21;
      }
      else {
        unsigned int v40 = v25;
      }
      if (v40 < v25 || (unsigned int v41 = v40, v40 >= v38))
      {
        unsigned int v41 = v25;
LABEL_64:
        uint64_t v45 = v31;
        uint64_t v27 = v30;
        goto LABEL_65;
      }
    }
    else
    {
      unsigned int v40 = 0;
      unsigned int v41 = v25;
    }
    if (v34)
    {
      int v42 = v41 / v35;
      if (v41 % v35) {
        ++v42;
      }
      unsigned int v43 = v42 * v35 - v41;
      if (((v43 == 0) & BYTE3(a9) & (v28 != 24320)) != 0) {
        unsigned int v43 = v35;
      }
      v41 += v43;
    }
    BOOL v44 = v38 >= v41;
    uint64_t v45 = v38 - v41;
    if (v45 == 0 || !v44) {
      goto LABEL_64;
    }
    if (a5) {
      break;
    }
    if (v21)
    {
      LODWORD(v31) = v45;
LABEL_72:
      int v29 = v41;
      if (v45) {
        goto LABEL_73;
      }
LABEL_81:
      __int16 v14 = -5344;
      goto LABEL_91;
    }
    if (v45 <= v31) {
      goto LABEL_64;
    }
    int v29 = v41;
LABEL_65:
    if (v15 <= v13)
    {
      int v46 = 0;
      LODWORD(v31) = v45;
      LOWORD(v30) = v27;
      goto LABEL_70;
    }
    unsigned int v25 = v36[135] + v36[134];
    int v28 = *((unsigned __int16 *)v36 + 541);
    unsigned int v21 = v40;
    uint64_t v31 = v45;
    uint64_t v30 = v27;
LABEL_67:
    uint64_t v27 = ++v13;
    v36 += 268;
    if (v13 > v15)
    {
      int v46 = 0;
      unsigned int v40 = v21;
      unsigned int v41 = v25;
      goto LABEL_70;
    }
  }
  if ((double)v45 / (double)a5 < 0.99) {
    goto LABEL_64;
  }
  if (v45 < a5) {
    a5 = v45;
  }
  int v46 = v45;
LABEL_70:
  if (v40 | a5)
  {
    LODWORD(v31) = a5;
    LODWORD(v45) = v46;
    goto LABEL_72;
  }
  unsigned __int16 v13 = v30;
  if (!v31) {
    goto LABEL_81;
  }
LABEL_73:
  if (v32) {
    unsigned __int16 v13 = v32 + 1;
  }
  if (v13)
  {
    unsigned int v47 = v13 - 1;
    if (HIWORD(v11[268 * v47 + 270]) != 24320) {
      goto LABEL_83;
    }
    if ((v11[268 * v47 + 249] & 0x20) != 0) {
      goto LABEL_83;
    }
    __int16 v14 = delentry(a1, 528, 0x20Au, --v13, 1072);
    if (!v14) {
      goto LABEL_83;
    }
  }
  else
  {
    unsigned __int16 v13 = 0;
LABEL_83:
    bzero(v57, 0x430uLL);
    __int16 v14 = addentry(a1, v57, 0x210uLL, 0x20Au, v13, 0x430u);
    if (!v14)
    {
      int v48 = v29;
      uint64_t v49 = (char *)*a1;
      uint64_t v50 = (uint64_t)*a1 + 1072 * v13 + 528;
      uint64_t v51 = a6;
      BOOL v52 = &v49[1072 * v13];
      PMInitPartitionRecord(*((__int16 *)v49 + 257), v48, v31, a2, a3, v51, (_WORD *)v50);
      __int16 v53 = PMDefaultPartitionStatus(*((__int16 *)v49 + 257), v50);
      int v54 = *((_DWORD *)v52 + 249);
      *((_DWORD *)v52 + 249) = v54 | 0x10;
      if ((a9 & 4) == 0) {
        *(_DWORD *)(v50 + 88) |= 0x100000u;
      }
      __int16 v14 = v53;
      if (a2 == 24320) {
        *((_DWORD *)v52 + 249) = v54 | 0x30;
      }
      int v55 = &v49[1072 * v13];
      if (PMCategorize(*((__int16 *)v49 + 257), *((unsigned __int16 *)v55 + 541)) == 2
        || *((_WORD *)v55 + 541) == 4097)
      {
        MEMORY[0x223C20E30](v52 + 976);
      }
    }
  }
LABEL_91:
  if (a8) {
    *a8 = v13;
  }
  return v14;
}

uint64_t delentry(const void **a1, int a2, unsigned int a3, unsigned int a4, __int16 a5)
{
  if (a1)
  {
    unsigned int v7 = *(unsigned __int16 *)((char *)*a1 + a3);
    if (v7 <= a4)
    {
      return -110;
    }
    else
    {
      __int16 v8 = moveblockextended(a1, a2 + (a5 & 0xFFFE) * a4, -(a5 & 0xFFFE), 0, a2 + v7 * (a5 & 0xFFFE));
      if (!v8)
      {
        __int16 v8 = 0;
        *(_WORD *)((char *)*a1 + a3) = v7 - 1;
      }
    }
  }
  else
  {
    return 22;
  }
  return v8;
}

uint64_t PMDefaultPartitionStatus(unsigned int a1, uint64_t a2)
{
  if (a1 > 0x20) {
    goto LABEL_6;
  }
  if (((1 << a1) & 0xF) != 0) {
    return APMSetDefaultStatus(a2);
  }
  if (((1 << a1) & 0x100010100) != 0) {
    return 0;
  }
LABEL_6:
  if (a1 == 128) {
    return APMSetDefaultStatus(a2);
  }
  return 4294967292;
}

uint64_t PMCategorize(int a1, int a2)
{
  if (a1 <= 7)
  {
    if (a1 < 4) {
      return APMCategorize(a2);
    }
    return 0;
  }
  if (a1 == 8) {
    return MBRCategorize(a2);
  }
  if (a1 != 16)
  {
    if (a1 == 32) {
      return ISOCategorize(a2);
    }
    return 0;
  }
  return GPTCategorize(a2);
}

uint64_t MBRCategorize(int a1)
{
  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    unsigned int v2 = i + 8;
    if (!*((void *)i + 3)) {
      return (unsigned __int16)v2[1];
    }
  }
  unsigned int v2 = i;
  return (unsigned __int16)v2[1];
}

uint64_t MBRWriteMedia(Handle h, int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void))
{
  uint64_t v39 = 0;
  v40[0] = 0;
  v40[1] = 0;
  if (!h)
  {
    SInt8 v8 = 0;
    LOWORD(v11) = -109;
    goto LABEL_10;
  }
  SInt8 v8 = HGetState(h);
  HLock(h);
  Ptr v9 = *h;
  if (*((_WORD *)*h + 257) != 8) {
    goto LABEL_8;
  }
  if (a2 == 0xFFFF) {
    a2 = 0;
  }
  if ((a2 & 0x100) != 0)
  {
LABEL_8:
    LOWORD(v11) = -50;
    goto LABEL_10;
  }
  int v10 = ((uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t *))a4)(a3, 15, 0, 0, 0, &v39);
  if (v10)
  {
    LOWORD(v11) = v10;
    goto LABEL_10;
  }
  MKScaleGeometry(v40, (int *)&v39 + 1);
  if (!HIDWORD(v39))
  {
    LOWORD(v11) = 22;
    goto LABEL_10;
  }
  PMSortMapII(h, 0);
  size_t v13 = *((unsigned __int16 *)v9 + 1);
  __int16 v14 = malloc_type_calloc(1uLL, v13, 0xA1FF548FuLL);
  if (!v14)
  {
    LOWORD(v11) = 12;
    goto LABEL_10;
  }
  unsigned int v15 = v14;
  if ((a2 & 0x8000000) == 0) {
    ((void (*)(uint64_t, uint64_t, void, void, uint64_t, void))a4)(a3, 4, WORD2(v39), (LODWORD(v40[0]) - 1), 1, 0);
  }
  unsigned int v41 = -1;
  unsigned int v42 = 0;
  __int16 v44 = -1;
  v15[255] = -21931;
  Ptr v16 = *h;
  unsigned __int16 v43 = 0;
  LOWORD(v17) = *((_WORD *)v16 + 261);
  if (!(_WORD)v17)
  {
LABEL_55:
    LOWORD(v32) = ((uint64_t (*)(uint64_t, uint64_t, size_t, void, uint64_t, _WORD *))a4)(a3, 3, v13, 0, 1, v15);
    goto LABEL_56;
  }
  size_t v33 = v13;
  uint64_t v18 = 0;
  unsigned int v36 = 0;
  LODWORD(v19) = 0;
  int v34 = 0;
  int v11 = 0;
  unsigned __int16 v20 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = (uint64_t)(v15 + 223);
  unsigned int v35 = v15;
  while (1)
  {
    unsigned int v21 = &v16[v18];
    unsigned int v22 = *(unsigned __int16 *)&v16[v18 + 1082];
    if (v22 == 0x8000)
    {
      LODWORD(v37) = *((_DWORD *)v21 + 134);
      int v23 = *((_DWORD *)v21 + 154);
      if ((v23 & 0x100000) != 0)
      {
        *((_DWORD *)v21 + 154) = v23 & 0xFFEFFFFF;
        if (v20 + 1 >= (unsigned __int16)v17) {
          unsigned int v24 = *((_DWORD *)v16 + 1);
        }
        else {
          unsigned int v24 = *(_DWORD *)&v16[v18 + 1608] - v37;
        }
        if (v24 >= 0xC8) {
          unsigned int v24 = 200;
        }
      }
      else
      {
        unsigned int v24 = 1;
      }
      unsigned int v36 = v24;
      uint64_t v31 = *(const void **)&v16[v18 + 968];
      if (v31) {
        memcpy(v15, v31, 0x1BEuLL);
      }
      goto LABEL_42;
    }
    *((_DWORD *)v21 + 249) &= ~0x10u;
    if (v22 >> 12 <= 4) {
      break;
    }
LABEL_42:
    unsigned __int16 v43 = ++v20;
    unsigned int v17 = *((unsigned __int16 *)v16 + 261);
    v18 += 1072;
    if (v17 <= v20) {
      goto LABEL_52;
    }
  }
  if (HIDWORD(v37) > 3)
  {
    LOWORD(v11) = -5323;
    goto LABEL_57;
  }
  if (v22 == 5 || (v22 != 133 ? (BOOL v25 = v22 == 15) : (BOOL v25 = 1), v25))
  {
    unsigned int v26 = v42;
    *(_DWORD *)(v38 + 8) = v42;
    uint64_t v27 = (_DWORD *)(v38 + 8);
    *(unsigned char *)(v38 + 4) = 5;
    unsigned int v42 = v26 + 1;
    *(_DWORD *)(v38 + 12) = 1;
    int v28 = (_DWORD *)(v38 + 12);
    unsigned int v29 = *(_DWORD *)&v16[v18 + 536];
  }
  else
  {
    if ((v16[v18 + 619] & 2) == 0)
    {
      int v11 = WriteGutz((uint64_t)v16, (__int16 *)&v43, &v44, v38, (int *)&v42, &v41, a3, a4);
      *(_WORD *)&v16[v18 + 1034] = *((_WORD *)v16 + 250) * ++v34 - 1;
LABEL_34:
      Setupdpp((uint64_t)v16, v38);
      ++HIDWORD(v37);
      v38 += 16;
      unsigned __int16 v20 = v43;
      goto LABEL_42;
    }
    unsigned int v26 = v42;
    *(_DWORD *)(v38 + 8) = v42;
    uint64_t v27 = (_DWORD *)(v38 + 8);
    *(unsigned char *)(v38 + 4) = 5;
    unsigned int v42 = v26 + 1;
    *(_DWORD *)(v38 + 12) = 1;
    int v28 = (_DWORD *)(v38 + 12);
    unsigned int v29 = *(_DWORD *)&v16[v18 + 536];
    if (v26 == v29)
    {
LABEL_47:
      LOWORD(v11) = -5323;
      unsigned int v15 = v35;
      goto LABEL_57;
    }
  }
  if (v26 > v29) {
    goto LABEL_47;
  }
  uint64_t v19 = (v19 + 4);
  int v11 = WriteDOSExtendedChain((unsigned __int16 *)v16, (__int16 *)&v43, v38, v26, v19, a3, a4);
  if (!v11)
  {
    unsigned int v30 = *v28 + *v27;
    if (v42 > v30) {
      unsigned int v30 = v42;
    }
    unsigned int v42 = v30;
    unsigned int v15 = v35;
    goto LABEL_34;
  }
  unsigned int v15 = v35;
LABEL_52:
  if (!v11)
  {
    size_t v13 = v33;
    if (!v36) {
      goto LABEL_55;
    }
    int v32 = ((uint64_t (*)(uint64_t, uint64_t, size_t, void))a4)(a3, 4, v33, v37);
    if (!v32) {
      goto LABEL_55;
    }
LABEL_56:
    LOWORD(v11) = v32;
  }
LABEL_57:
  free(v15);
LABEL_10:
  HSetState(h, v8);
  return (__int16)v11;
}

SInt8 HGetState(Handle h)
{
  if (h)
  {
    __int16 v1 = 0;
    SInt8 v2 = *((unsigned char *)h + 16);
  }
  else
  {
    SInt8 v2 = 0;
    __int16 v1 = -109;
  }
  MemErr = v1;
  return v2;
}

void HLock(Handle h)
{
  if (h)
  {
    __int16 v1 = 0;
    *((unsigned char *)h + 16) |= 0x80u;
  }
  else
  {
    __int16 v1 = -109;
  }
  MemErr = v1;
}

uint64_t MKMediaDeviceIO(const void *a1, char a2, unsigned int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  if (a1 && (CFTypeID v12 = CFGetTypeID(a1), v12 == MKMediaGetTypeID()))
  {
    if (a3) {
      unsigned int v13 = a3;
    }
    else {
      unsigned int v13 = 512;
    }
    if ((v13 & 0x1FF) != 0)
    {
      return -5308;
    }
    else
    {
      unsigned int v16 = a5;
      long long v34 = 0u;
      *(_OWORD *)count = 0u;
      unsigned int v17 = v13 >> 9;
      unint64_t v18 = a4 * (unint64_t)v17;
      unint64_t v19 = v16 * (unint64_t)v17;
      int v20 = a2 & 0xF;
      __int16 updated = -4;
      if (v20 <= 3)
      {
        if (v20 == 2)
        {
          return (__int16)MKMediaReadSectors((uint64_t)a1, v18, v19, (char *)a6, 0);
        }
        else
        {
          if (v20 != 3) {
            return updated;
          }
          return (__int16)MKMediaWriteSectors((uint64_t)a1, v18, v19, (char *)a6, 0);
        }
      }
      if (v20 == 4)
      {
        MKMediaGetGeometry((uint64_t)a1, (uint64_t)&v34);
        unsigned int v22 = (char *)malloc_type_calloc(count[0], 0x200uLL, 0xA9B7D8C4uLL);
        if (v22)
        {
          int v23 = v22;
          __int16 updated = MKMediaWriteMultipleSectors((uint64_t)a1, v18, v19, v22, count[0], 0);
          free(v23);
        }
        else
        {
          return 12;
        }
      }
      else
      {
        if (v20 == 14)
        {
          __int16 updated = MKMediaUpdateProperties((uint64_t)a1);
          if (updated) {
            return updated;
          }
        }
        else if (v20 != 15)
        {
          return updated;
        }
        *(_WORD *)a6 = 2;
        CFDictionaryRef v24 = (const __CFDictionary *)MKMediaCopyProperty((uint64_t)a1, @"Geometry");
        if (v24)
        {
          CFDictionaryRef v25 = v24;
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v24, @"Block Size");
          CFNumberGetValue(Value, kCFNumberSInt32Type, &v34);
          CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v25, @"Sector Count");
          CFNumberGetValue(v27, kCFNumberSInt64Type, (char *)&v34 + 8);
          CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v25, @"Maximum Transfer Sector Count");
          CFNumberGetValue(v28, kCFNumberSInt64Type, count);
          unsigned int v29 = v34;
          if (v34 != a3 && a3 != 0) {
            unsigned int v29 = a3;
          }
          *(_DWORD *)(a6 + 4) = v29;
          unint64_t v31 = v29 >> 9;
          size_t v32 = count[0];
          *(void *)(a6 + 8) = *((void *)&v34 + 1) / v31;
          size_t v33 = v32 / v31;
          if (v33 >> 16) {
            LOWORD(v33) = 0x8000;
          }
          *(_WORD *)(a6 + 16) = v33;
          CFRelease(v25);
          return 0;
        }
        else
        {
          return 22;
        }
      }
    }
  }
  else
  {
    return -50;
  }
  return updated;
}

uint64_t MKMediaGetTypeID()
{
  uint64_t result = _kMKMediaID;
  if (!_kMKMediaID)
  {
    _kMKMediaClass = 0;
    unk_267D28100 = "MKMedia";
    qword_267D28108 = 0;
    unk_267D28110 = 0;
    qword_267D28120 = 0;
    unk_267D28128 = 0;
    qword_267D28118 = (uint64_t)_MKMediaCFRuntimeFinalize;
    qword_267D28130 = (uint64_t)_MKMediaCFRuntimeCopyFormattingDesc;
    qword_267D28138 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
    uint64_t result = _CFRuntimeRegisterClass();
    _kMKMediaID = result;
  }
  return result;
}

unint64_t *MKScaleGeometry(unint64_t *result, int *a2)
{
  unint64_t v2 = *result;
  if (HIDWORD(*result))
  {
    int v3 = *a2;
    while ((v3 & 0x80000000) == 0)
    {
      v3 *= 2;
      *a2 = v3;
      unint64_t v4 = v2 >> 33;
      v2 >>= 1;
      *uint64_t result = v2;
      if (!v4) {
        return result;
      }
    }
    *a2 = 0;
    *uint64_t result = 0;
  }
  return result;
}

void PMSortMapII(Ptr *a1, int a2)
{
  SInt8 v4 = HGetState(a1);
  HLock(a1);
  if (a2 == 1) {
    int v5 = (int (__cdecl *)(const void *, const void *))PMIndexCompare;
  }
  else {
    int v5 = (int (__cdecl *)(const void *, const void *))PMBlockCompare;
  }
  qsort(*a1 + 528, *((unsigned __int16 *)*a1 + 261), 0x430uLL, v5);
  HSetState(a1, v4);
}

uint64_t PMBlockCompare(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(a2 + 8);
  BOOL v4 = v2 == v3;
  if (v2 > v3) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 0;
  }
  else {
    return v5;
  }
}

void HSetState(Handle h, SInt8 flags)
{
  if (h)
  {
    __int16 v2 = 0;
    *((unsigned char *)h + 16) = flags;
  }
  else
  {
    __int16 v2 = -109;
  }
  MemErr = v2;
}

uint64_t WriteGutz(uint64_t a1, __int16 *a2, __int16 *a3, uint64_t a4, int *a5, unsigned int *a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, void))
{
  uint64_t v13 = a1 + 1072 * (unsigned __int16)*a2;
  uint64_t v14 = v13 + 528;
  *(unsigned char *)(a4 + 4) = *(unsigned char *)(v13 + 1082);
  unsigned int v15 = *(_DWORD *)(v13 + 536);
  int v16 = *(_DWORD *)(v13 + 540);
  *(_DWORD *)(a4 + 8) = v15;
  *(_DWORD *)(a4 + 12) = v16;
  if ((*(unsigned char *)(v13 + 618) & 0x10) != 0)
  {
    uint64_t result = a8(a7, 4, *(unsigned __int16 *)(a1 + 2));
    if (result) {
      return result;
    }
    unsigned int v23 = *(_DWORD *)(a4 + 12);
    if (v23 >= 0xC9)
    {
      int v24 = v23 - 200 >= 0xC8 ? 200 : v23 - 200;
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, void, void))a8)(a7, 4, *(unsigned __int16 *)(a1 + 2), v23 - v24 + *(_DWORD *)(a4 + 8));
      if (result) {
        return result;
      }
    }
    *(_DWORD *)(v14 + 88) &= ~0x100000u;
    unsigned int v15 = *(_DWORD *)(a4 + 8);
  }
  uint64_t result = 0;
  unsigned int v18 = *a6;
  if (*a6 >= v15) {
    unsigned int v18 = v15;
  }
  *a6 = v18;
  int v19 = *a5;
  if (*a5 <= (*(_DWORD *)(a4 + 12) + *(_DWORD *)(a4 + 8))) {
    int v19 = *(_DWORD *)(a4 + 12) + *(_DWORD *)(a4 + 8);
  }
  *a5 = v19;
  *(unsigned char *)a4 = 0;
  if (*a3 < 0)
  {
    uint64_t result = 0;
    if ((*(_DWORD *)(v14 + 88) & 0x80000000) != 0)
    {
      *a3 = *a2;
      *(unsigned char *)a4 = 0x80;
    }
  }
  return result;
}

uint64_t Setupdpp(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 8);
  if (!v2
    || ((unsigned int v3 = *(unsigned __int16 *)(result + 508),
         unsigned int v4 = (unsigned __int16)(*(_WORD *)(result + 510) * v3),
         unsigned int v5 = (unsigned __int16)(v2 / v4),
         v5 >= 0x3FF)
      ? (char v6 = -1)
      : (char v6 = v2 / v4),
        v5 > 0x3FE))
  {
    char v7 = -2;
    char v8 = -1;
    goto LABEL_14;
  }
  char v7 = -2;
  char v8 = -1;
  if ((v2 % v3))
  {
LABEL_14:
    LOBYTE(v10) = -1;
    goto LABEL_15;
  }
  BOOL v9 = ((unsigned __int16)(v2 % v4) / v3) == 1 && (unsigned __int16)(v2 / v4) == 0;
  LOBYTE(v10) = -1;
  if (v9)
  {
    unsigned int v10 = ((v2 / v4) >> 2) & 0x3FFFFFC0 | 1;
    char v7 = 1;
    char v8 = v6;
  }
LABEL_15:
  *(unsigned char *)(a2 + 3) = v8;
  *(unsigned char *)(a2 + 1) = v7;
  *(unsigned char *)(a2 + 2) = v10;
  int v11 = v2 + *(_DWORD *)(a2 + 12);
  unsigned int v12 = v11 - 1;
  if (v11 == 1
    || ((unsigned int v13 = *(unsigned __int16 *)(result + 508),
         unsigned int v14 = (unsigned __int16)(*(_WORD *)(result + 510) * v13),
         unsigned int v15 = v12 / v14,
         unsigned int v16 = (unsigned __int16)(v12 / v14),
         v16 >= 0x3FF)
      ? (char v17 = -1)
      : (char v17 = v12 / v14),
        v16 > 0x3FE))
  {
    char v18 = -2;
    char v19 = -1;
    goto LABEL_28;
  }
  char v18 = -2;
  char v19 = -1;
  if ((v12 % v13))
  {
LABEL_28:
    LOBYTE(v21) = -1;
    goto LABEL_29;
  }
  BOOL v20 = ((unsigned __int16)(v12 % v14) / v13) == 1 && (unsigned __int16)(v12 / v14) == 0;
  LOBYTE(v21) = -1;
  if (v20)
  {
    int v21 = (v15 >> 2) & 0x3FFFFFC0 | 1;
    char v18 = 1;
    char v19 = v17;
  }
LABEL_29:
  *(unsigned char *)(a2 + 7) = v19;
  *(unsigned char *)(a2 + 5) = v18;
  *(unsigned char *)(a2 + 6) = v21;
  return result;
}

uint64_t PMDisposePartitionRecord(Handle h)
{
  if (h)
  {
    Ptr v2 = *h;
    if (*((_WORD *)*h + 256) == 516)
    {
      int v3 = *((unsigned __int16 *)v2 + 261);
      int v4 = v3 - 1;
      *((_WORD *)v2 + 261) = v3 - 1;
      if (v3)
      {
        unsigned int v5 = (void **)(v2 + 968);
        do
        {
          if (*v5)
          {
            free(*v5);
            int v4 = *((unsigned __int16 *)v2 + 261);
          }
          v5 += 134;
          int v6 = (unsigned __int16)v4--;
          *((_WORD *)v2 + 261) = v4;
        }
        while (v6);
      }
      DisposeHandle(h);
      return 0;
    }
    else
    {
      return -5351;
    }
  }
  else
  {
    return -109;
  }
}

void DisposeHandle(Handle h)
{
  MemErr = -109;
  if (h)
  {
    Ptr v2 = *h;
    if (v2) {
      free(v2);
    }
    free(h);
    MemErr = 0;
  }
}

uint64_t GPTUpdatePartitionDictionaries(uint64_t *a1, CFArrayRef theArray)
{
  uint64_t v3 = *a1;
  if (*(_WORD *)(*a1 + 94))
  {
    unsigned int v4 = 0;
    unsigned int v5 = (CFUUIDBytes *)(v3 + 192);
    int v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    do
    {
      CFStringRef v7 = (const __CFString *)uuid2cfstr(v5);
      CFDictionaryRef Mutable = CFArrayDictionarySearchWithIndexOptions(theArray, @"GUID", v7, 0, 0);
      CFRelease(v7);
      if (!Mutable)
      {
        BOOL v9 = lookupDESC((const char *)&v5[-3]);
        if (v9) {
          __int16 v10 = v9[1];
        }
        else {
          LOBYTE(v10) = 7;
        }
        if (((1 << v10) & 0x96) == 0) {
          goto LABEL_10;
        }
        CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], v6);
        CFArrayAppendValue(theArray, Mutable);
        CFRelease(Mutable);
        if (!Mutable)
        {
          uint64_t v12 = 0xFFFFFFFFLL;
          goto LABEL_14;
        }
      }
      uint64_t v11 = GPTUpdatePartitionDictionary(Mutable, (uint64_t)&v5[-6], *(unsigned __int16 *)(v3 + 32));
      if (v11)
      {
        uint64_t v12 = v11;
        goto LABEL_14;
      }
LABEL_10:
      ++v4;
      unsigned int v5 = (CFUUIDBytes *)((char *)v5 + 152);
    }
    while (v4 < *(unsigned __int16 *)(v3 + 94));
  }
  uint64_t v12 = 0;
LABEL_14:
  v14.length = CFArrayGetCount(theArray);
  v14.location = 0;
  CFArraySortValues(theArray, v14, (CFComparatorFunction)CFRankPartition, 0);
  return v12;
}

CFComparisonResult CFRankPartition(const __CFDictionary *a1, const __CFDictionary *a2, void *a3)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"Offset");
  if (!Value) {
    return 1;
  }
  CFNumberRef v6 = Value;
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Offset");
  if (!v7) {
    return -1;
  }
  return CFNumberCompare(v6, v7, a3);
}

uint64_t MKCFDisposeMedia(const __CFDictionary *a1)
{
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Schemes");
  if (!Value) {
    return 22;
  }
  CFArrayRef v3 = Value;
  uint64_t Count = (unsigned __int16)CFArrayGetCount(Value);
  if (Count)
  {
    CFIndex v5 = 0;
    uint64_t v6 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v5);
      if (ValueAtIndex)
      {
        CFArrayRef v8 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Sections");
        if (v8)
        {
          CFDictionaryRef v9 = CFArrayDictionarySearchWithIndexOptions(v8, @"ID", @"MAP", 0, 0);
          if (v9)
          {
            unsigned int v10 = MKCFDisposeMediaMap(v9);
            if (v6) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = v10 == 0;
            }
            if (v11) {
              uint64_t v6 = v6;
            }
            else {
              uint64_t v6 = v10;
            }
          }
        }
      }
      ++v5;
    }
    while (Count != v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  CFRelease(a1);
  return v6;
}

uint64_t MKCFDisposeMediaMap(const __CFDictionary *a1)
{
  int valuePtr = 0;
  if (!a1) {
    return 22;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"Revision");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  }
  CFArrayRef v3 = (Ptr *)mkcfrecoverref(a1);
  if (valuePtr == 0x10000) {
    return disposegpm(v3);
  }
  else {
    return PMDisposePartitionRecord(v3);
  }
}

uint64_t disposegpm(Ptr *a1)
{
  if (!a1 || !*a1) {
    return 0;
  }
  uint64_t v2 = gptdispose((uint64_t)a1);
  DisposeHandle(a1);
  return v2;
}

uint64_t disposegpmr()
{
  return 0;
}

uint64_t gptdispose(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(*(void *)a1 + 8);
    if (v1)
    {
      if (*(void *)v1) {
        free(*(void **)v1);
      }
      uint64_t v2 = *(void **)(v1 + 8);
      if (v2) {
        free(v2);
      }
      free((void *)v1);
    }
  }
  return 0;
}

uint64_t _MKMediaCFRuntimeFinalize(uint64_t a1)
{
  (*(void (**)(void))(a1 + 32))(*(void *)(a1 + 88));
  uint64_t v2 = *(void *)(a1 + 136);
  if (v2)
  {
    _MKMediaBufferPoolDestroy(v2);
    *(void *)(a1 + 136) = 0;
  }
  uint64_t result = pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 144));
  *(void *)(a1 + 88) = 0;
  return result;
}

void _MKMediaDeviceDeinitialize(void *a1)
{
}

void _MKMediaCommonDeinitialize(void *a1)
{
  if (a1 && *(_DWORD *)a1 == 1296786550)
  {
    int v2 = *((_DWORD *)a1 + 1);
    if ((v2 & 0x80000000) == 0)
    {
      CFNumberRef Value = CFDictionaryGetValue(*((CFDictionaryRef *)a1 + 2), @"Writable");
      if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x263EFFB40])) {
        ioctl(v2, 0x20006416uLL);
      }
      close(v2);
    }
    unsigned int v4 = (void *)*((void *)a1 + 1);
    if (v4)
    {
      free(v4);
      *((void *)a1 + 1) = 0;
    }
    CFIndex v5 = (const void *)*((void *)a1 + 2);
    if (v5) {
      CFRelease(v5);
    }
    free(a1);
  }
}

void _MKMediaBufferPoolDestroy(uint64_t a1)
{
  free(*(void **)(a1 + 128));
  free(*(void **)(a1 + 136));
  pthread_cond_destroy((pthread_cond_t *)a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 48));
  free((void *)a1);
}

uint64_t MKCFCheckBootDevice(char *a1, _OWORD *a2)
{
  v34[2] = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 0;
  int v29 = 0;
  unsigned __int16 v28 = 0;
  v34[0] = 0;
  v34[1] = 0;
  CFTypeRef cf = 0;
  unsigned int UUID = -43;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  if ((int)MKBSDSlice(a1, (uint64_t)&valuePtr, (uint64_t)&v29, 0) >= 2)
  {
    __sprintf_chk(v33, 0, 0x21uLL, "/dev/rdisk%i", valuePtr);
    __sprintf_chk(bsdName, 0, 0x20uLL, "disk%is%i", valuePtr, v29);
    if (v29)
    {
      unsigned int UUID = DevEntryCopyRegistryProperties(bsdName, (CFMutableDictionaryRef *)&cf);
      if (!UUID)
      {
        CFArrayRef v3 = MKAccessLibrary(0);
        if (v3)
        {
          unsigned int v4 = v3;
          CFURLRef v5 = MKLoadDB(v3, @"database", (int *)&UUID);
          if (!v5)
          {
LABEL_13:
            CFRelease(v4);
            goto LABEL_14;
          }
          CFURLRef v6 = v5;
          CFURLRef v7 = MKLoadDB(v4, @"inventory", (int *)&UUID);
          if (!v7)
          {
            CFURLRef v8 = v6;
LABEL_12:
            CFRelease(v8);
            goto LABEL_13;
          }
          CFURLRef v8 = v7;
          CFDictionaryRef v9 = (const void *)MKMediaCreateWithPath(0, v33, 0, &UUID);
          if (UUID
            || (CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0
            || (CFDictionaryRef v12 = Mutable,
                CFDictionarySetValue(Mutable, @"Include most", (const void *)*MEMORY[0x263EFFB40]),
                unsigned int v13 = MKCFReadMedia(v12, v9, (int *)&UUID),
                CFRelease(v12),
                !v13))
          {
LABEL_8:
            if (v9) {
              CFRelease(v9);
            }
            CFRelease(v6);
            goto LABEL_12;
          }
          CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v13, @"Schemes");
          if (Value)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
            if (ValueAtIndex)
            {
              CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Sections");
              if (v16)
              {
                CFDictionaryRef v17 = CFArrayDictionarySearchWithIndexOptions(v16, @"ID", @"MAP", 0, 0);
                if (v17)
                {
                  CFDictionaryRef v18 = v17;
                  CFArrayRef v19 = (const __CFArray *)CFDictionaryGetValue(v17, @"Partitions");
                  if (v19)
                  {
                    CFArrayRef v20 = v19;
                    CFStringRef v21 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Partition ID");
                    if (v21)
                    {
                      CFDictionaryRef v22 = CFArrayDictionarySearchWithIndexOptions(v20, @"Partition ID", v21, 0, 0);
                      if (v22)
                      {
                        unsigned int UUID = CFDictionaryGetUUID(v22, @"GUID", (unsigned __int8 *)v34);
                        if (!UUID)
                        {
                          CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Revision");
                          if (v23) {
                            CFNumberGetValue(v23, kCFNumberSInt32Type, (char *)&valuePtr + 4);
                          }
                          int v24 = (uint64_t *)mkcfrecoverref(v18);
                          if (HIDWORD(valuePtr) == 0x10000)
                          {
                            unsigned int v26 = GPTCheckPartBootable(v4, v24, (unsigned __int8 *)v34, (uint64_t)a2, (uint64_t)v9);
                            goto LABEL_36;
                          }
                          if (HIDWORD(valuePtr))
                          {
                            unsigned int UUID = 22;
                            goto LABEL_38;
                          }
                          uint64_t v25 = *v24;
                          unsigned int UUID = PMSlice2Index((_WORD *)*v24, (unsigned __int16)v29, &v28);
                          if (!UUID)
                          {
                            unsigned int v26 = MKBootDisposition(v6, v8, v25, v28, (uint64_t)a2);
LABEL_36:
                            unsigned int UUID = v26;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_38:
          MKCFDisposeMedia(v13);
          goto LABEL_8;
        }
      }
    }
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  uint64_t result = UUID;
  if (UUID == -1) {
    return *__error();
  }
  return result;
}

char *MKBSDSlice(char *result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (result)
  {
    int v7 = (int)result;
    uint64_t result = strstr(result, "disk");
    if (result)
    {
      CFURLRef v8 = result;
      uint64_t result = (char *)sscanf(result, "disk%is", a2);
      if (result)
      {
        int v9 = (int)result;
        unsigned int v10 = strrchr(v8, 115);
        int v11 = (int)v10;
        uint64_t result = (char *)(sscanf(v10, "s%i", a3) + v9);
        if (a4)
        {
          int v12 = v11 - v7;
          if ((int)result < 2) {
            int v12 = 0;
          }
          *a4 = v12;
        }
      }
    }
  }
  return result;
}

uint64_t DevEntryCopyRegistryProperties(char *bsdName, CFMutableDictionaryRef *a2)
{
  CFMutableDictionaryRef properties = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, bsdName);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    uint64_t v7 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    IOObjectRelease(v6);
  }
  else
  {
    uint64_t v7 = 2;
  }
  *a2 = properties;
  return v7;
}

uint64_t DevEntryToIOMediaObject(char *bsdName, io_service_t *a2)
{
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, bsdName);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  *a2 = MatchingService;
  return 2 * (MatchingService == 0);
}

__CFDictionary *MKCFReadMedia(const __CFDictionary *a1, const void *a2, int *a3)
{
  CFDictionaryRef MutableCopy = a1;
  Handle h = 0;
  CFMutableArrayRef theArray = 0;
  if (!a1)
  {
    int v6 = 0;
    goto LABEL_5;
  }
  int v6 = MKCFOptionBit(a1, @"Diagnostics mode", 1);
  if (!v6)
  {
LABEL_5:
    CFDictionaryRef v7 = 0;
    goto LABEL_6;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, MutableCopy);
  CFDictionaryRemoveValue(MutableCopy, @"Prefer GPT Map Entry");
  CFDictionaryRef v7 = MutableCopy;
LABEL_6:
  int v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)__nel = 0u;
  long long v37 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v34 = 0;
  CFURLRef v8 = 0;
  v49[0] = MKMediaSchemesDetect(__nel, (uint64_t)a2, v6, a2);
  if (v49[0]) {
    goto LABEL_51;
  }
  if (!v6) {
    qsort((char *)__nel + 4, LOWORD(__nel[0]), 0x30uLL, (int (__cdecl *)(const void *, const void *))RankScheme);
  }
  MKMediaGetGeometry((uint64_t)a2, (uint64_t)v35);
  v49[0] = 5;
  if ((v35[0] & 0x1FF) != 0)
  {
LABEL_50:
    CFURLRef v8 = 0;
    goto LABEL_51;
  }
  v49[0] = -5324;
  unint64_t v9 = *((void *)&v35[0] + 1);
  if (MutableCopy)
  {
    unint64_t v30 = *((void *)&v35[0] + 1);
    int v29 = MKCFOptionBit(MutableCopy, @"Raw Read Mode", 256);
    int v28 = MKCFOptionBit(MutableCopy, @"Extended Mode", 512);
    int v27 = MKCFOptionBit(MutableCopy, @"Generate Freespace Records", 16);
    int v10 = MKCFOptionBit(MutableCopy, @"Merge Adjacent Freespace Records", 128);
    int v11 = MKCFOptionBit(MutableCopy, @"Fit Map to Media", 8);
    int v12 = MKCFOptionBit(MutableCopy, @"synthesize Volumes", 64);
    int v13 = MKCFOptionBit(MutableCopy, @"Skip Zero Length Entries", 32);
    int v14 = MKCFOptionBit(MutableCopy, @"Skip Free & Vold Entries", 0x40000);
    int v15 = MKCFOptionBit(MutableCopy, @"Merge Trailing Freespace Record", 0x80000);
    int v16 = (v29 | v28 | v27 | v10 | v11 | v12 | v13 | v14 | v15 | MKCFOptionBit(MutableCopy, @"Ignore Shims", 0x8000)) & 0xFFFFF1FF | 0xA00;
    unint64_t v9 = v30;
  }
  else
  {
    int v16 = 2560;
  }
  size_t v32 = 0;
  int v17 = HIDWORD(v9) == 0;
  CFDictionaryRef v18 = (char *)__nel + 4;
  if (!LOWORD(__nel[0]))
  {
    CFNumberRef v23 = 0;
    CFURLRef v8 = 0;
    goto LABEL_42;
  }
  CFURLRef v8 = 0;
  unsigned int v19 = 0;
  unsigned int v20 = v16 | (v17 << 10);
  while (1)
  {
    CFStringRef v21 = (const char *)PMSchemeSearch(*((_WORD *)v18 + 2), &v34);
    int v22 = *((_DWORD *)v18 + 1);
    if (v22 <= 15)
    {
      if (v22 == 1)
      {
        v49[0] = APMReadMedia((const void ***)&h, v20 | 0x100000, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))MKMediaDeviceIO);
        if (v49[0]) {
          goto LABEL_27;
        }
        CFNumberRef v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
        if (v23)
        {
          int v24 = APMCFRecordSections(h, MutableCopy, v32);
LABEL_34:
          v49[0] = v24;
          if (v24) {
            goto LABEL_42;
          }
          goto LABEL_35;
        }
      }
      else
      {
        if (v22 != 8) {
          goto LABEL_56;
        }
        v49[0] = MBRReadMedia((const void ***)&h, v20, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t *))MKMediaDeviceIO);
        if (v49[0])
        {
LABEL_27:
          CFNumberRef v23 = 0;
          goto LABEL_42;
        }
        CFNumberRef v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
        if (v23)
        {
          int v24 = MBRCFRecordSections(h, MutableCopy, v32);
          goto LABEL_34;
        }
      }
      goto LABEL_35;
    }
    if (v22 != 16)
    {
      if (v22 != 32)
      {
LABEL_56:
        CFNumberRef v23 = 0;
        v49[0] = -5307;
        goto LABEL_42;
      }
      v49[0] = ISOReadMedia((const void ***)&h, v20, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, uint64_t, unsigned char *))MKMediaDeviceIO);
      if (v49[0]) {
        goto LABEL_27;
      }
      CFNumberRef v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
      if (v23)
      {
        int v24 = ISOCFRecordSections((const UInt8 *)h, v32);
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    v49[0] = GPTReadMedia((uint64_t **)&h, MutableCopy, (uint64_t)a2);
    if (v49[0]) {
      break;
    }
    CFNumberRef v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
    if (v23)
    {
      int v24 = GPTCFRecordSections((const UInt8 *)h, MutableCopy, v32);
      goto LABEL_34;
    }
LABEL_35:
    if (!v8)
    {
      CFURLRef v8 = MKCFCreateMedia(&theArray, v49);
      if (v49[0]) {
        goto LABEL_42;
      }
    }
    CFArrayAppendValue(theArray, v23);
    if (v23) {
      CFRelease(v23);
    }
    Handle h = 0;
    ++v19;
    v18 += 48;
    if (v19 >= LOWORD(__nel[0])) {
      goto LABEL_51;
    }
  }
  CFNumberRef v23 = 0;
LABEL_42:
  if (h)
  {
    if (*((_DWORD *)v18 + 1) == 16) {
      disposegpm(h);
    }
    else {
      DisposeHandle(h);
    }
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v8)
  {
    MKCFDisposeMedia(v8);
    goto LABEL_50;
  }
LABEL_51:
  if (v7) {
    CFRelease(v7);
  }
  int v25 = v49[0];
  if (v49[0] == -1) {
    int v25 = *__error();
  }
  *a3 = v25;
  return v8;
}

uint64_t MKMediaSchemesDetect(_WORD *a1, uint64_t a2, int a3, const void *a4)
{
  unint64_t v14 = 0;
  memset(size, 0, sizeof(size));
  *a1 = 0;
  int v7 = MKMediaDeviceIO(a4, 15, 0, 0, 0, (uint64_t)size);
  __int16 v8 = v7;
  if (!v7)
  {
    if ((size[0] & 0x1FF00000000) != 0) {
      return 5;
    }
    unint64_t v9 = (char *)malloc_type_malloc(HIDWORD(size[0]), 0x9CF4B269uLL);
    if (!v9) {
      return -1;
    }
    int v10 = v9;
    __int16 v8 = MKMediaReadBlocks((uint64_t)a4, 0, 1, HIDWORD(size[0]), v9, &v14);
    if (v8)
    {
LABEL_22:
      free(v10);
      return v8;
    }
    int v15 = 0;
    MKAPMSchemeDetect(v10, (uint64_t)size, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _WORD *))MKMediaDeviceIO, &v15);
    if (v15 < 5000)
    {
      char v11 = -1;
    }
    else
    {
      AddDetectedScheme(a1, v15, 1);
      if (a3) {
        char v11 = -1;
      }
      else {
        char v11 = -7;
      }
      if ((v11 & 4) == 0)
      {
LABEL_20:
        int v15 = 0;
        __int16 v8 = MKISOSchemeDetect((uint64_t)a4, &v15);
        if (v15 >= 5000) {
          AddDetectedScheme(a1, v15, 32);
        }
        goto LABEL_22;
      }
    }
    int v15 = 0;
    GPTSchemeDetect((uint64_t)v10, (uint64_t)size, (uint64_t)a4, (unsigned int *)&v15);
    if (v15 >= 5000)
    {
      AddDetectedScheme(a1, v15, 16);
      if (!a3) {
        char v11 = 0;
      }
    }
    if ((v11 & 2) != 0)
    {
      int v15 = 0;
      MKMBRSchemeDetect((uint64_t)v10, (uint64_t)size, (uint64_t)a4, (uint64_t)MKMediaDeviceIO, &v15);
      if (v15 >= 5000) {
        AddDetectedScheme(a1, v15, 8);
      }
    }
    goto LABEL_20;
  }
  return v8;
}

uint64_t MKMediaReadBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, unint64_t *a6)
{
  unint64_t v7 = a4 >> 9;
  unint64_t v9 = 0;
  uint64_t result = MKMediaReadSectors(a1, v7 * a2, v7 * a3, a5, &v9);
  if (a6) {
    *a6 = v9 / v7;
  }
  return result;
}

uint64_t MKMediaReadSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, void *a5)
{
  uint64_t v10 = 0;
  if (!a1) {
    return 22;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v6 = 22;
  if (a4)
  {
    unint64_t v7 = *(void *)(a1 + 96);
    if (v7 > a2 && a3 + a2 <= v7)
    {
      if (a3)
      {
        uint64_t v6 = _MKMediaCommonReadWriteSectors(a1, a2, a3, a4, &v10, 0);
        if (a5) {
          *a5 = v10;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

uint64_t _MKMediaDeviceReadSectors(uint64_t a1, uint64_t a2, uint64_t a3, void *__buf, void *a5)
{
  uint64_t v6 = a3;
  if ((pread(*(_DWORD *)(a1 + 4), __buf, a3 << 9, a2 << 9) & 0x80000000) != 0)
  {
    uint64_t v6 = 0;
    uint64_t result = *__error();
  }
  else
  {
    uint64_t result = 0;
  }
  *a5 = v6;
  return result;
}

uint64_t MKAPMSchemeDetect(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _WORD *), int *a5)
{
  uint64_t result = 0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  *a5 = 0;
  if (*(void *)(a2 + 8) < 0x40uLL) {
    return result;
  }
  if (*a1 != 21061)
  {
    uint64_t v12 = 8;
LABEL_6:
    int v13 = 2;
    uint64_t v14 = v12;
    do
    {
      uint64_t result = a4(a3, 2, 512, v14, 1, v20);
      if (result) {
        break;
      }
      if (v20[0] == 19792)
      {
        uint64_t result = 0;
        int v18 = 5250;
        goto LABEL_26;
      }
      uint64_t v14 = (v14 + v12);
      --v13;
    }
    while (v13);
    if (*a5 > 4999) {
      return result;
    }
    goto LABEL_11;
  }
  __int16 v11 = a1[1];
  uint64_t v12 = v11 >> 1;
  if (v11 >> 1) {
    goto LABEL_6;
  }
  uint64_t result = 0;
LABEL_11:
  unsigned int v15 = *(_DWORD *)(a2 + 4);
  if (v15 < 0x400)
  {
    unsigned __int16 v17 = 1;
LABEL_18:
    if (v17 <= 7u)
    {
      uint64_t v19 = v17;
      do
      {
        uint64_t result = a4(a3, 2, 512, v19, 1, v20);
        if (result) {
          break;
        }
        if (v20[0] == 19792)
        {
          uint64_t result = 0;
          goto LABEL_25;
        }
        uint64_t result = 0;
        uint64_t v19 = (v19 + 1);
      }
      while (v19 != 8);
    }
  }
  else
  {
    unsigned int v16 = v15 >> 9;
    unsigned __int16 v17 = 1;
    while (*a1 != 19792)
    {
      a1 += 256;
      if (v16 <= ++v17) {
        goto LABEL_18;
      }
    }
LABEL_25:
    int v18 = 5000;
LABEL_26:
    *a5 = v18;
  }
  return result;
}

uint64_t GPTSchemeDetect(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  size_t v5 = *(unsigned int *)(a2 + 4);
  if (v5 > 0x20000 || (v5 & 0x1FF) != 0) {
    return 22;
  }
  uint64_t v10 = malloc_type_calloc(1uLL, v5, 0x6D19D5A3uLL);
  if (!v10) {
    return 12;
  }
  __int16 v11 = v10;
  long long v14 = 0u;
  long long v15 = 0u;
  LODWORD(v14) = *(_DWORD *)(a2 + 4);
  uint64_t v12 = *(unsigned __int16 *)(a2 + 16);
  *((void *)&v14 + 1) = *(void *)(a2 + 8);
  *(void *)&long long v15 = v12;
  DWORD2(v15) = 0;
  uint64_t v7 = GPTReadHeader((uint64_t)&v14, a3, a4, (uint64_t)v10);
  free(v11);
  return v7;
}

uint64_t GPTReadHeader(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  unsigned int v8 = *(_DWORD *)a1;
  unsigned int v11 = 0;
  GPTReadHeaderBlock(1, v8, a2, &v11, a4);
  unsigned int v9 = v11;
  if (v11)
  {
    if (v11 < 0x9C5)
    {
      unsigned int v11 = 0;
      uint64_t result = GPTReadHeaderBlock(*(void *)(a1 + 8) - 1, v8, a2, &v11, a4);
      unsigned int v9 = v11;
    }
    else
    {
      uint64_t result = 0;
      unsigned int v9 = v11 + 1000;
    }
  }
  else
  {
    uint64_t result = 0;
  }
  *a3 = v9;
  return result;
}

uint64_t GPTReadHeaderBlock(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (!a4) {
    return 22;
  }
  unint64_t v12 = 0;
  uint64_t result = MKMediaReadBlocks(a3, a1, 1, a2, (char *)a5, &v12);
  if (!result)
  {
    if (*(void *)a5 == 0x5452415020494645)
    {
      uint64_t result = 0;
      uint64_t v9 = *(unsigned int *)(a5 + 12);
      if (v9 >= 0x5C && v9 <= a2)
      {
        *a4 += 2500;
        int v10 = *(_DWORD *)(a5 + 16);
        *(_DWORD *)(a5 + 16) = 0;
        int v11 = mk_crc32((char *)a5, v9);
        uint64_t result = 0;
        if (v10 == v11)
        {
          uint64_t result = 0;
          *a4 += 2500;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

size_t AddDetectedScheme(_WORD *a1, int a2, int a3)
{
  __source = 0;
  int v3 = (unsigned __int16)*a1;
  *a1 = v3 + 1;
  CFDictionaryRef v4 = &a1[24 * v3];
  *((_DWORD *)v4 + 1) = a2;
  *((_DWORD *)v4 + 2) = a3;
  PMSchemeSearch(a3, &__source);
  __strlcpy_chk();
  return strlcpy((char *)v4 + 20, __source, 0x20uLL);
}

uint64_t MKISOSchemeDetect(uint64_t a1, _DWORD *a2)
{
  return MKDetectISO(a1, a2, 0, 0);
}

uint64_t MKDetectISO(uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t a4)
{
  if (a3) {
    *a3 = 0;
  }
  *a2 = 0;
  if (a4)
  {
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  unsigned int v8 = (char *)malloc_type_malloc(0x800uLL, 0xB1C1210uLL);
  if (!v8) {
    return *(__int16 *)__error();
  }
  uint64_t v9 = v8;
  if ((unsigned __int16)MKMediaReadBlocks(a1, 16, 1, 0x800u, v8, 0)) {
    goto LABEL_7;
  }
  LODWORD(v11) = 16;
  while (1)
  {
    if (!strncmp(v9 + 1, "CD001", 5uLL))
    {
      int v12 = *v9;
      if (v12 == 255) {
        goto LABEL_7;
      }
      if (v12 == 1)
      {
        if (!a4) {
          goto LABEL_26;
        }
        *(_DWORD *)(a4 + 44) = bswap32(*((_DWORD *)v9 + 21));
        *(_WORD *)(a4 + 40) = bswap32(*((unsigned __int16 *)v9 + 65)) >> 16;
        *(_DWORD *)(a4 + 36) = 1;
        int v13 = v9 + 40;
        goto LABEL_25;
      }
LABEL_18:
      if (v11 > 0x17) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
    if (strncmp(v9 + 5, "CDROM", 5uLL)) {
      goto LABEL_18;
    }
    if (v9[4] == 1) {
      break;
    }
    if (*v9 == 255 || v11 >= 0x18) {
      goto LABEL_7;
    }
LABEL_19:
    uint64_t v11 = (v11 + 1);
    if ((unsigned __int16)MKMediaReadBlocks(a1, v11, 1, 0x800u, v9, 0)) {
      goto LABEL_7;
    }
  }
  if (!a4) {
    goto LABEL_26;
  }
  *(_DWORD *)(a4 + 44) = bswap32(*((unsigned __int16 *)v9 + 43));
  *(_WORD *)(a4 + 40) = 2048;
  *(_DWORD *)(a4 + 36) = 5;
  int v13 = v9 + 44;
LABEL_25:
  strncpy((char *)a4, v13, 0x20uLL);
LABEL_26:
  if (a3) {
    *a3 = 7;
  }
  *a2 = 5000;
LABEL_7:
  free(v9);
  return 0;
}

uint64_t GPTReadMedia(uint64_t **a1, const __CFDictionary *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  *(_OWORD *)size = 0u;
  long long v38 = 0u;
  unsigned int v40 = 22;
  char v5 = MKCFOptionBit(a2, @"Prefer GPT Map Entry", 4);
  MKMediaGetGeometry(a3, (uint64_t)size);
  unint64_t v6 = LODWORD(size[0]);
  Handle v7 = gptinit((int *)&v40);
  if (!v7)
  {
    uint64_t MBR = v40;
    goto LABEL_9;
  }
  unsigned int v8 = (uint64_t *)v7;
  Ptr v9 = *v7;
  int v10 = (uint64_t *)*((void *)*v7 + 1);
  size_t v11 = LODWORD(size[0]);
  *((_DWORD *)*v7 + 8) = size[0];
  int v12 = malloc_type_calloc(1uLL, v11, 0xF4937A85uLL);
  uint64_t *v10 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t MBR = v40;
    if (v40) {
      goto LABEL_8;
    }
LABEL_31:
    *a1 = v8;
    return MBR;
  }
  int v39 = 0;
  uint64_t MBR = GPTReadHeader((uint64_t)size, a3, (unsigned int *)&v39, (uint64_t)v12);
  unsigned int v40 = MBR;
  if (!MBR)
  {
    if (v39 < 2000)
    {
      uint64_t MBR = 4294961953;
      goto LABEL_8;
    }
    if (v39 >> 3 < 0x271)
    {
      uint64_t MBR = 4294961972;
      goto LABEL_8;
    }
    uint64_t v14 = *v10;
    uuid_LtoB((uint64_t)(v9 + 16), *v10 + 56);
    uint64_t v15 = *(void *)(v14 + 40);
    *((void *)v9 + 5) = v15;
    uint64_t v16 = *(void *)(v14 + 48);
    *((void *)v9 + 6) = *(void *)(v14 + 32) + v15 - v16;
    *((void *)v9 + 7) = v16 - v15 + 1;
    *((_DWORD *)v9 + 22) = *(_DWORD *)(v14 + 8);
    *((void *)v9 + 8) = size[1] / (v6 >> 9);
    uint64_t v17 = *v10;
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    int v18 = *(_DWORD *)(v17 + 80);
    if ((v18 - 1025) < 0xFFFFFC07
      || (int v19 = *(_DWORD *)(v17 + 84), (v19 - 4097) < 0xFFFFF07F))
    {
      uint64_t MBR = 22;
      goto LABEL_8;
    }
    unsigned int v20 = *(_DWORD *)(*v8 + 32);
    unint64_t v21 = (v19 * v18);
    unsigned int v22 = v21 / v20;
    long long v34 = (void *)v21;
    if (v21 % v20) {
      ++v22;
    }
    unsigned int v23 = v22 * v20;
    int v24 = (char *)malloc_type_calloc(1uLL, v22 * v20, 0x83E98CEEuLL);
    if (!v24)
    {
      uint64_t MBR = 0xFFFFFFFFLL;
      goto LABEL_8;
    }
    int v25 = v24;
    int v36 = v18;
    unint64_t v42 = 0;
    long long v41 = 0uLL;
    uint64_t MBR = MKMediaReadBlocks(a3, *(void *)(v17 + 72), v23 / v20, v20, v24, &v42);
    if (!MBR)
    {
      int v26 = *(_DWORD *)(v17 + 88);
      if (mk_crc32(v25, (uint64_t)v34) == v26)
      {
        int v27 = 0;
        unsigned int v35 = v25;
        int v28 = (const UInt8 *)(v25 + 56);
        do
        {
          if (!uuid_is_null(v28 - 56))
          {
            *(void *)CFUUIDBytes uu = 0;
            uint64_t v55 = 0;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            uint64_t v53 = 0;
            uniconvert(&v44, 48, 0x8000100u, 0, v28, 72, 0x14000100u, 1u);
            uuid_LtoB((uint64_t)&v50, (uint64_t)(v28 - 40));
            uuid_LtoB((uint64_t)uu, (uint64_t)(v28 - 56));
            GPTUuid2Typestr(&v47, 48, uu);
            unint64_t v29 = *((void *)v28 - 3);
            *(void *)&long long v51 = v29;
            unint64_t v30 = *((void *)v28 - 2);
            if (v29 >= v30)
            {
              syslog(4, "MediaKit detected BAD GPT map entry at index: %d start offset: %llu greater than end offset: %llu\n", v27, v29, v30);
              unint64_t v29 = v51;
            }
            *((void *)&v51 + 1) = v30 + 1 - v29;
            *(void *)&long long v52 = *((void *)v28 - 1);
            if (v30 + 1 != v29)
            {
              *(void *)&long long v41 = v29;
              *((void *)&v41 + 1) = v30 + 1 - v29;
              unsigned __int16 v31 = srequest(v8, (uint64_t *)&v41, 1u, 0, (uint64_t)&v44, 0, 0);
              if ((void)v51 == -1)
              {
                uuid_unparse_upper((const unsigned __int8 *)&v50, out);
                syslog(4, "Overlapping Partition \"%s\" at %llu:%llu\n", out, (void)v51, *((void *)&v51 + 1));
                long long v51 = v41;
              }
              LOWORD(v53) = v27;
              uint64_t v32 = addentry((const void **)v8, &v44, 0x60uLL, 0x5Eu, v31, 0x98u);
              if (v32)
              {
                uint64_t MBR = v32;
                int v25 = v35;
                goto LABEL_35;
              }
            }
          }
          ++v27;
          v28 += 128;
        }
        while (v36 != v27);
        free(v35);
        uint64_t MBR = GPTSubReadMBR((uint64_t)v8, (uint64_t)v10, v5, a3);
        if (MBR) {
          goto LABEL_8;
        }
        goto LABEL_31;
      }
      uint64_t MBR = 4294961947;
    }
LABEL_35:
    free(v25);
  }
LABEL_8:
  disposegpm((Ptr *)v8);
LABEL_9:
  *a1 = 0;
  if (MBR == -1) {
    return *__error();
  }
  return MBR;
}

void GPTUuid2Typestr(void *a1, int a2, unsigned __int8 *uu)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, sizeof(v10));
  uuid_unparse_upper(uu, v10);
  unint64_t v6 = &off_264497268;
  while (strcasecmp((const char *)v6 - 100, v10))
  {
    Handle v7 = *v6;
    v6 += 7;
    if (!v7) {
      goto LABEL_7;
    }
  }
  unsigned int v8 = *(v6 - 7);
  if (v8)
  {
    int v9 = strlen(v8);
    uniconvert(a1, a2, 0x8000100u, 0, (const UInt8 *)v8, v9, 0x600u, 0);
    return;
  }
LABEL_7:
  uuid_unparse_upper(uu, (char *)a1);
}

__CFDictionary *MKCFCreateScheme(const char *a1, const char *a2, CFTypeRef *a3)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFStringRef v7 = CFStringCreateWithCString(0, a1, 0);
    if (!v7) {
      goto LABEL_6;
    }
    CFStringRef v8 = v7;
    CFDictionarySetValue(Mutable, @"ID", v7);
    CFRelease(v8);
    CFStringRef v9 = CFStringCreateWithCString(0, a2, 0);
    if (!v9) {
      goto LABEL_6;
    }
    CFStringRef v10 = v9;
    CFDictionarySetValue(Mutable, @"Name", v9);
    CFRelease(v10);
    CFMutableArrayRef v11 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    *a3 = v11;
    if (v11)
    {
      CFDictionarySetValue(Mutable, @"Sections", v11);
      CFRelease(*a3);
    }
    else
    {
LABEL_6:
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

uint64_t GPTCFRecordSections(const UInt8 *a1, const __CFDictionary *a2, __CFArray *a3)
{
  if (!a2) {
    goto LABEL_3;
  }
  int v6 = MKCFOptionBit(a2, @"Include most", 150);
  int v7 = MKCFOptionBit(a2, @"Include all", 254) | v6;
  int v8 = MKCFOptionBit(a2, @"Include drivers", 2);
  int v9 = v7 | v8 | MKCFOptionBit(a2, @"Include data", 4);
  int v10 = MKCFOptionBit(a2, @"Include free space", 8);
  int v11 = v10 | MKCFOptionBit(a2, @"Include loaders", 16);
  int v12 = v9 | v11 | MKCFOptionBit(a2, @"Include patch", 32);
  int v13 = MKCFOptionBit(a2, @"Include aux", 64);
  unsigned int v14 = v12 | v13 | MKCFOptionBit(a2, @"Include unknowns", 128);
  if (!v14) {
LABEL_3:
  }
    unsigned int v14 = 20;
  unsigned int v17 = 0;
  uint64_t v15 = GPTRecordMapSection(a1, v14, (int *)&v17);
  uint64_t result = v17;
  if (!v17)
  {
    if (v15)
    {
      CFArrayAppendValue(a3, v15);
      CFRelease(v15);
      return v17;
    }
  }
  return result;
}

uint64_t GPTCheckPartBootable(__CFBundle *a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_WORD *)a4 = 259;
  v37[0] = 22;
  if (a2)
  {
    int v10 = a1;
    if (a1 || (int v10 = MKAccessLibrary(0)) != 0)
    {
      __int16 v36 = 0;
      memset(v35, 0, 154);
      CFURLRef v11 = MKLoadDB(v10, @"database", v37);
      if (v11)
      {
        CFDictionaryRef v12 = v11;
        CFURLRef v13 = MKLoadDB(v10, @"inventory", v37);
        if (v13)
        {
          uint64_t v33 = a5;
          CFURLRef cf = v13;
          v37[0] = gpmrsearch(a2, a3, &v36);
          if (!v37[0])
          {
            unsigned int v15 = *(_DWORD *)(*a2 + 32);
            BOOL v16 = v15 >= 0x400;
            unsigned int v17 = 8 / (v15 >> 9);
            if (!v16) {
              unsigned int v17 = 8;
            }
            unsigned int v32 = v17;
            CFStringRef v18 = CFStringCreateWithCString(0, (const char *)(*a2 + 152 * v36 + 144), 0);
            if (v18)
            {
              CFStringRef v19 = v18;
              v37[0] = MKLookupSchemeFormat(v12, @"GPT", v18, 1, v35);
              CFRelease(v19);
              *(_DWORD *)(a4 + 4) = 4;
              if (!v37[0])
              {
                if (LOWORD(v35[0]))
                {
                  uint64_t v20 = 0;
                  int v21 = 38 * LOWORD(v35[0]);
                  do
                  {
                    int v22 = *(unsigned __int16 *)((char *)&v35[2] + v20 + 4);
                    if (v22 == 6 || v22 == 1) {
                      *(_DWORD *)(a4 + 4) = 0;
                    }
                    v20 += 38;
                  }
                  while (v21 != v20);
                  unsigned int v24 = 0;
                  int v25 = (char *)&v35[2] + 6;
                  while (1)
                  {
                    CFStringRef v26 = CFStringCreateWithCString(0, v25 - 36, 0);
                    if (!v26) {
                      goto LABEL_7;
                    }
                    CFStringRef v27 = v26;
                    int v28 = *((unsigned __int16 *)v25 - 1);
                    if (v28 == 6) {
                      break;
                    }
                    if (v28 != 5)
                    {
                      if (v28 == 1) {
                        break;
                      }
                      v37[0] = -4;
                    }
LABEL_38:
                    CFRelease(v27);
                    if (!v37[0])
                    {
                      ++v24;
                      v25 += 38;
                      if (v24 < LOWORD(v35[0])) {
                        continue;
                      }
                    }
                    goto LABEL_7;
                  }
                  int v29 = mediaLoaderSupport(v10, v26, a2, a3, v33, v28, v32, 0, 0, 0, a4, 0);
                  if (v29 == 28) {
                    int v30 = 0;
                  }
                  else {
                    int v30 = v29;
                  }
                  v37[0] = v30;
                  int v31 = *(_DWORD *)(a4 + 4);
                  if (v31 != 4 && (*(_WORD *)v25 & 1) != 0) {
                    *(_DWORD *)(a4 + 4) = v31 | 4;
                  }
                  goto LABEL_38;
                }
              }
            }
          }
LABEL_7:
          CFRelease(cf);
        }
        CFRelease(v12);
      }
      if (!a1 && v10) {
        CFRelease(v10);
      }
    }
  }
  return v37[0];
}

CFComparisonResult utf8strcompare(CFStringCompareFlags a1, char *__s, const char *a3)
{
  size_t v6 = strlen(__s);
  CFStringRef v7 = CFStringCreateWithBytes(0, (const UInt8 *)__s, v6, 0x8000100u, 0);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  size_t v9 = strlen(a3);
  CFStringRef v10 = CFStringCreateWithBytes(0, (const UInt8 *)a3, v9, 0x8000100u, 0);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFComparisonResult v12 = CFStringCompare(v8, v10, a1);
    CFRelease(v8);
    CFStringRef v8 = v11;
  }
  else
  {
    CFComparisonResult v12 = kCFCompareEqualTo;
  }
  CFRelease(v8);
  return v12;
}

CFStringRef MKHumanToType(int a1, CFStringRef theString)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!theString) {
    return 0;
  }
  if (a1 == 16)
  {
    CFStringGetCString(theString, buffer, 256, 0x8000100u);
    GPTuuidHuman2Type(cStr, buffer, 256);
    if (cStr[0]) {
      return CFStringCreateWithCString(0, cStr, 0x8000100u);
    }
    return 0;
  }
  return (CFStringRef)CFRetain(theString);
}

size_t GPTuuidHuman2Type(char *a1, const char *a2, int a3)
{
  size_t v6 = lookupDESC(a2);
  if (v6) {
    CFStringRef v7 = (const char *)(v6 + 2);
  }
  else {
    CFStringRef v7 = a2;
  }
  return strlcpy(a1, v7, a3);
}

uint64_t PMTypeToHumanExtended(char *a1, char *a2, int a3, int a4, int a5, uint64_t *a6)
{
  CFStringRef v8 = a2;
  CFStringRef v10 = &APMDescriptors;
  if (a4 == 8) {
    CFStringRef v10 = &MBRDescriptors;
  }
  if (a4 == 32) {
    CFStringRef v11 = (unsigned __int16 *)&ISODescriptors;
  }
  else {
    CFStringRef v11 = (unsigned __int16 *)v10;
  }
  uint64_t result = (uint64_t)PMLookupDESC(a2, a5, v11);
  uint64_t v13 = result;
  if (result)
  {
    CFStringRef v8 = *(const char **)(result + 8);
  }
  else if (a1 == v8)
  {
    goto LABEL_10;
  }
  uint64_t result = strlcpy(a1, v8, a3);
LABEL_10:
  if (a6) {
    *a6 = v13;
  }
  return result;
}

uint64_t MKMBRSchemeDetect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  *a5 = 0;
  if (*(unsigned __int16 *)(a1 + 510) == 43605)
  {
    uint64_t v5 = 0;
    while (1)
    {
      int v6 = *(_DWORD *)(a1 + v5 + 458);
      if (v6)
      {
        unint64_t v7 = *(unsigned int *)(a1 + v5 + 454);
        if (!v5 || v7)
        {
          unint64_t v8 = *(void *)(a2 + 8);
          unint64_t v9 = (v6 + v7);
          if (v8 > v7 && v8 >= v9) {
            break;
          }
        }
      }
      v5 += 16;
      if (v5 == 64) {
        return 0;
      }
    }
    *a5 = 5000;
  }
  return 0;
}

uint64_t MBRReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, uint64_t *))
{
  uint64_t v12 = 0;
  v13[0] = 0;
  v13[1] = 0;
  if (a2 == 0xFFFF) {
    unsigned int v7 = 3584;
  }
  else {
    unsigned int v7 = a2;
  }
  uint64_t result = a4(a3, 15, 0, 0, 0, &v12);
  if (result)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unsigned __int16 v10 = WORD2(v12);
    MKScaleGeometry(v13, (int *)&v12 + 1);
    if ((HIDWORD(v12) - 32769) >= 0xFFFF8000)
    {
      unint64_t v9 = (const void **)NewHandleClear(528);
      uint64_t result = MemError();
      if (v9)
      {
        CFStringRef v11 = *v9;
        v11[128] = 33554948;
        *((_WORD *)v11 + 259) = WORD2(v12);
        *((_WORD *)v11 + 250) = v10 >> 9;
        uint64_t result = VReadDosPartitions(v9, v7, 0, (uint64_t)&v12, a3, (uint64_t)a4);
        if (!result)
        {
          if ((v7 & 0x800) == 0
            || (PMSortMapII((Ptr *)v9, 0), (v7 & 0x10) == 0)
            || (uint64_t result = PMAccountFreespace(v9, 0, v7), !result))
          {
            if ((v7 & 0x80) != 0) {
              uint64_t result = PMRationalise(v9);
            }
            else {
              uint64_t result = 0;
            }
          }
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
      uint64_t result = 22;
    }
  }
  *a1 = v9;
  return result;
}

uint64_t VReadDosPartitions(const void **a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __int16 v9 = a2;
  unsigned __int16 v10 = 1;
  int v12 = 0;
  uint64_t v13 = a1;
  uint64_t v11 = 0;
  uint64_t v14 = a5;
  uint64_t v15 = a6;
  uint64_t result = MBRSetupNewPartitionList(a1, *(_DWORD *)(a4 + 8), *(_DWORD *)(a4 + 4));
  if (!result)
  {
    uint64_t result = ReadDosPBR((uint64_t)&v9, a3);
    *((_DWORD *)*a1 + 133) = v10;
  }
  return result;
}

uint64_t ReadDosPBR(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*(unsigned __int16 *)(a1 + 4) <= 0x20u)
  {
    size_t v5 = *(unsigned __int16 *)(**(void **)(a1 + 16) + 2);
    int v6 = (unsigned __int16 *)malloc_type_malloc(v5, 0x3A8C2F31uLL);
    if (v6)
    {
      unsigned int v7 = v6;
      int v8 = (*(uint64_t (**)(void, uint64_t, size_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 32))(*(void *)(a1 + 24), 2, v5, a2, 1, v6);
      if (v8)
      {
        int v2 = v8;
        free(v7);
        if (v2 == -1) {
          int v2 = *__error();
        }
      }
      else
      {
        if (v7[255] == 43605)
        {
          unsigned __int16 v9 = 0;
          uint64_t v10 = **(void **)(a1 + 16);
          uint64_t v11 = (char *)(v7 + 223);
          *(void *)(v10 + 1072 * *(unsigned __int16 *)(v10 + 522) - 104) = v7;
          do
          {
            int v12 = v11[4];
            if (v11[4])
            {
              int v13 = *((_DWORD *)v11 + 3);
              if (v13)
              {
                uint64_t v14 = *((unsigned int *)v11 + 2);
                if (v14 || !(*(unsigned __int16 *)(a1 + 4) | v9))
                {
                  BOOL v15 = v12 == 5 || v12 == 15;
                  BOOL v16 = v15 || v12 == 133;
                  unsigned int v17 = &MBRDescriptors;
                  while ((unsigned __int16)*v17 != v12)
                  {
                    CFStringRef v18 = v17 + 8;
                    uint64_t v19 = *((void *)v17 + 3);
                    v17 += 8;
                    if (!v19) {
                      goto LABEL_24;
                    }
                  }
                  CFStringRef v18 = v17;
LABEL_24:
                  int v20 = (unsigned __int16)v18[1];
                  bzero(v28, 0x430uLL);
                  if (v16)
                  {
                    int v29 = *(_DWORD *)(a1 + 8) + v14;
                    int v35 = 2;
                    __int16 v37 = -1;
                    ++*(_WORD *)(a1 + 2);
                  }
                  else
                  {
                    int v29 = v14 + a2;
                    if (*(_WORD *)(a1 + 4)) {
                      int v35 = 1;
                    }
                    __int16 v37 = *(_WORD *)(a1 + 6) + *(_WORD *)(v10 + 500) + *(_WORD *)(v10 + 500) * v9 - 1;
                  }
                  __int16 v38 = v12;
                  int v32 = v13;
                  int v33 = 0;
                  int v30 = v13;
                  __int16 v36 = -1;
                  int v21 = (char *)PMCodeSearch(v12, 8);
                  strncpypad(v31, v21, 0x20uLL, 0);
                  if (*v11 < 0) {
                    v33 |= 0x80000000;
                  }
                  if (*(_WORD *)(a1 + 4)) {
                    v33 |= 0x2000000u;
                  }
                  if (v20 == 2) {
                    MEMORY[0x223C20E30](&v34);
                  }
                  if ((unsigned __int16)addentry(*(const void ***)(a1 + 16), v28, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u)) {
                    break;
                  }
                  uint64_t v10 = **(void **)(a1 + 16);
                  if (v16)
                  {
                    __int16 v22 = *(_WORD *)(a1 + 4);
                    if (v22)
                    {
                      uint64_t v14 = (*(_DWORD *)(a1 + 8) + v14);
                      unsigned int v23 = (_WORD *)(v10 + 500);
                      __int16 v24 = *(_WORD *)(a1 + 6);
                    }
                    else
                    {
                      *(_DWORD *)(a1 + 8) = v14;
                      __int16 v24 = 4 * *(_WORD *)(v10 + 500);
                      unsigned int v23 = (_WORD *)(a1 + 6);
                    }
                    *(_WORD *)(a1 + 6) = v24 + *v23;
                    *(_WORD *)(a1 + 4) = v22 + 1;
                    int DosPBR = ReadDosPBR(a1, v14);
                    --*(_WORD *)(a1 + 4);
                    if (DosPBR) {
                      break;
                    }
                  }
                }
              }
            }
            unsigned int v26 = v9++;
            v11 += 16;
          }
          while (v26 < 3);
        }
        else
        {
          free(v7);
        }
        LOWORD(v2) = 0;
      }
    }
    else
    {
      LOWORD(v2) = 12;
    }
  }
  else
  {
    LOWORD(v2) = 31;
  }
  return (__int16)v2;
}

uint64_t MBRCFRecordSections(Ptr *a1, const __CFDictionary *a2, __CFArray *a3)
{
  int v17 = 0;
  if (!a2
    || (int v6 = MKCFOptionBit(a2, @"Include most", 150),
        int v7 = MKCFOptionBit(a2, @"Include all", 254) | v6,
        int v8 = MKCFOptionBit(a2, @"Include data", 4),
        int v9 = v7 | v8 | MKCFOptionBit(a2, @"Include free space", 8),
        int v10 = MKCFOptionBit(a2, @"Include loaders", 16),
        int v11 = v10 | MKCFOptionBit(a2, @"Include aux", 64),
        (unsigned int v12 = v9 | v11 | MKCFOptionBit(a2, @"Include unknowns", 128)) == 0))
  {
    unsigned int v12 = 20;
  }
  int v13 = MBRCFRecordMapSection(a1, v12, &v17);
  __int16 v14 = v17;
  if (!v17)
  {
    BOOL v15 = v13;
    if (v13)
    {
      CFArrayAppendValue(a3, v13);
      CFRelease(v15);
      return (__int16)v17;
    }
  }
  return v14;
}

__CFDictionary *MBRCFRecordMapSection(Ptr *a1, unsigned int a2, _DWORD *a3)
{
  Ptr v4 = *a1;
  if (*a1)
  {
    __int16 v27 = 0;
    LODWORD(Mutable) = PMSpecificIndex(a1, 0x8000, 0, &v27);
    if (Mutable)
    {
      int v8 = 0;
    }
    else
    {
      int v10 = &v4[1072 * v27];
      if (uuid_is_null((const unsigned __int8 *)v10 + 976)) {
        MEMORY[0x223C20E30](v10 + 976);
      }
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      int v8 = Mutable;
      if (Mutable)
      {
        int v11 = v10 + 528;
        CFDictionarySetValue(Mutable, @"ID", @"MAP");
        unsigned int valuePtr = *((_DWORD *)v10 + 134);
        CFDictionaryRef Mutable = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        if (Mutable)
        {
          unsigned int v12 = Mutable;
          CFDictionarySetValue(v8, @"Offset", Mutable);
          CFRelease(v12);
          unsigned int v13 = *((_DWORD *)v11 + 3) + valuePtr;
          if (*((_WORD *)v4 + 261))
          {
            int v14 = 0;
            int v15 = 0;
            signed __int16 v16 = 0;
            Ptr v17 = v4 + 616;
            do
            {
              if (v27 != v16)
              {
                int v18 = *((unsigned __int16 *)v17 + 233);
                BOOL v19 = v18 == 5 || v18 == 15;
                if (!v19 && v18 != 133)
                {
                  if ((v17[3] & 2) != 0) {
                    ++v14;
                  }
                  else {
                    ++v15;
                  }
                }
              }
              ++v16;
              v17 += 1072;
            }
            while (*((unsigned __int16 *)v4 + 261) > v16);
            v13 += v14;
            if (v14 > 0) {
              int v20 = 3;
            }
            else {
              int v20 = 4;
            }
          }
          else
          {
            int v15 = 0;
            int v20 = 4;
          }
          BOOL v21 = __OFSUB__(v15, v20);
          int v22 = v15 - v20;
          if ((v22 < 0) ^ v21 | (v22 == 0)) {
            int v22 = 0;
          }
          unsigned int v25 = v13 + v22;
          CFDictionaryRef Mutable = CFNumberCreate(0, kCFNumberSInt32Type, &v25);
          if (Mutable)
          {
            unsigned int v23 = Mutable;
            CFDictionarySetValue(v8, @"Overhead", Mutable);
            CFRelease(v23);
            MKCFRecordSectionSize(v8, valuePtr, v25, (*((_DWORD *)v4 + 1) - v25) * *((unsigned __int16 *)v4 + 250), *((_DWORD *)v4 + 1) * *((unsigned __int16 *)v4 + 250), *((unsigned __int16 *)v4 + 259));
            CFDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
            if (Mutable)
            {
              __int16 v24 = Mutable;
              CFDictionarySetValue(v8, @"Partitions", Mutable);
              CFRelease(v24);
              LODWORD(Mutable) = MBRCFRecordPartitions((uint64_t *)a1, v24, 1, a2, 0);
              if (!Mutable)
              {
                mkcfstoreref(v8, (const UInt8 *)a1);
                LODWORD(Mutable) = 0;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int v8 = 0;
    LODWORD(Mutable) = -1;
  }
  if (a3) {
    *a3 = Mutable;
  }
  return v8;
}

uint64_t PMSpecificIndex(Ptr *a1, int a2, int a3, __int16 *a4)
{
  SInt8 v8 = HGetState(a1);
  HLock(a1);
  uint64_t v9 = PMPSpecificIndex((uint64_t)*a1, a2, a3, a4);
  HSetState(a1, v8);
  return v9;
}

uint64_t PMPSpecificIndex(uint64_t a1, int a2, int a3, __int16 *a4)
{
  int v7 = PMCodeSearch(a2, *(__int16 *)(a1 + 514));
  __int16 v8 = -1;
  __int16 v9 = -5343;
  if ((a3 & 0x80000000) == 0)
  {
    int v10 = v7;
    if (v7)
    {
      int v11 = *(unsigned __int16 *)(a1 + 522);
      if (*(_WORD *)(a1 + 522))
      {
        __int16 v8 = 0;
        while (1)
        {
          if (!strncasecmp((const char *)(a1 + 1072 * v8 + 576), v10, 0x20uLL))
          {
            if ((__int16)a3 < 1)
            {
              __int16 v9 = 0;
              if (a4) {
                goto LABEL_13;
              }
              return v9;
            }
            LOWORD(a3) = a3 - 1;
          }
          if (v11 <= ++v8)
          {
            __int16 v8 = -1;
            __int16 v9 = -5343;
            if (a4) {
              goto LABEL_13;
            }
            return v9;
          }
        }
      }
      __int16 v8 = -1;
    }
  }
  if (a4) {
LABEL_13:
  }
    *a4 = v8;
  return v9;
}

uint64_t MBRCFRecordPartitions(uint64_t *a1, const __CFArray *a2, int a3, unsigned int a4, _WORD *a5)
{
  uint64_t v5 = *a1;
  if (!*(_WORD *)(*a1 + 522)) {
    return 0;
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t result = 0;
  do
  {
    int v14 = &MBRDescriptors;
    while (*v14 != *(_WORD *)(v5 + 1072 * v11 + 1082))
    {
      int v15 = v14 + 8;
      uint64_t v16 = *((void *)v14 + 3);
      v14 += 8;
      if (!v16) {
        goto LABEL_8;
      }
    }
    int v15 = v14;
LABEL_8:
    if ((a4 >> v15[1]))
    {
      uint64_t result = MBRCFRecordPartition(a2, a1, a3, (__int16)v11);
      if ((result & 1) != 0 && v12 == 0) {
        uint64_t v12 = result;
      }
      else {
        uint64_t v12 = v12;
      }
      if (a5) {
        ++*a5;
      }
    }
    ++v11;
  }
  while (v11 < *(unsigned __int16 *)(v5 + 522));
  if (!result) {
    return v12;
  }
  return result;
}

uint64_t MBRCFRecordPartition(const __CFArray *a1, uint64_t *a2, int a3, int a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *a2 + 1072 * a4;
  if (uuid_is_null((const unsigned __int8 *)(v8 + 976)))
  {
    MEMORY[0x223C20E30](v8 + 976);
  }
  else
  {
    CFStringRef v11 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v8 + 976));
    CFDictionaryRef v10 = CFArrayDictionarySearchWithIndexOptions(a1, @"GUID", v11, 0, 0);
    CFRelease(v11);
    if (v10) {
      goto LABEL_7;
    }
  }
  if (!a3) {
    return 0;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return 12;
  }
  CFDictionaryRef v10 = Mutable;
  CFArrayAppendValue(a1, Mutable);
  CFRelease(v10);
LABEL_7:
  if (v7)
  {
    uint64_t result = CFDictionarySetUUID(v10, @"GUID", (CFUUIDBytes *)(v8 + 976));
    if (result) {
      return result;
    }
    int v13 = a4;
    CFNumberRef v14 = PMCFCreatePartitionType(8, *(unsigned __int16 *)(v7 + 1072 * a4 + 1082), (char *)(v8 + 576));
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFDictionarySetValue(v10, @"Type", v14);
      CFRelease(v15);
      if (*(unsigned char *)(v8 + 544))
      {
        uint64_t v16 = strntrim((const char *)(v8 + 544), 32);
        CFStringRef v17 = CFStringCreateWithCString(0, v16, 0);
        if (v17)
        {
          CFStringRef v18 = v17;
          CFDictionarySetValue(v10, @"Name", v17);
          CFRelease(v18);
        }
      }
      uint64_t v29 = 0;
      unint64_t v19 = (unint64_t)*(unsigned __int16 *)(v7 + 2) >> 9;
      unint64_t valuePtr = *(unsigned int *)(v8 + 536) * (unint64_t)v19;
      unint64_t v20 = *(unsigned int *)(v8 + 540) * (unint64_t)v19;
      unint64_t v30 = v20;
      if (valuePtr)
      {
        CFNumberRef v21 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
        if (v21)
        {
          CFNumberRef v22 = v21;
          CFDictionarySetValue(v10, @"Offset", v21);
          CFRelease(v22);
        }
      }
      if (v20)
      {
        CFNumberRef v23 = CFNumberCreate(0, kCFNumberSInt64Type, &v30);
        if (v23)
        {
          CFNumberRef v24 = v23;
          CFDictionarySetValue(v10, @"Size", v23);
          CFRelease(v24);
        }
      }
      if (*(_DWORD *)(v8 + 616))
      {
        uint64_t v29 = *(unsigned int *)(v8 + 616);
        CFNumberRef v25 = CFNumberCreate(0, kCFNumberSInt64Type, &v29);
        if (v25)
        {
          CFNumberRef v26 = v25;
          CFDictionarySetValue(v10, @"Status", v25);
          CFRelease(v26);
        }
      }
      if ((*(__int16 *)(v7 + 1072 * v13 + 1034) & 0x80000000) == 0)
      {
        unsigned int v27 = *(unsigned __int16 *)(v7 + 1072 * v13 + 1034) + 1;
        __int16 v32 = v27 / v19;
        if (v19 <= v27)
        {
          uint64_t result = (uint64_t)CFNumberCreate(0, kCFNumberSInt16Type, &v32);
          if (!result) {
            return result;
          }
          int v28 = (const void *)result;
          CFDictionarySetValue(v10, @"Partition ID", (const void *)result);
          CFRelease(v28);
        }
      }
      return 0;
    }
  }
  return 22;
}

CFNumberRef PMCFCreatePartitionType(int a1, int a2, char *a3)
{
  unsigned __int16 valuePtr = a2;
  if (a2)
  {
    int v3 = PMCodeSearch(a2, a1);
    if (!v3) {
      return CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    }
  }
  else
  {
    int v3 = a3;
    if (!a3) {
      return 0;
    }
    unsigned __int16 valuePtr = (unsigned __int16)PMDescriptorSearch(a3, a1);
  }
  if (!*v3) {
    return CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
  }
  return (CFNumberRef)CFStringCreateWithCString(0, v3, 0);
}

uint64_t PMSlice2Index(_WORD *a1, int a2, _WORD *a3)
{
  __int16 v3 = 22;
  if (a1 && a3)
  {
    if (a1[261])
    {
      int v4 = 0;
      uint64_t v5 = a1 + 517;
      while (1)
      {
        int v6 = *v5;
        if (v6 != -1 && (v6 + 1) / ((unsigned __int16)a1[259] >> 9) == a2) {
          break;
        }
        int v7 = *(v5 - 1);
        if (v7 != -1)
        {
          int v8 = v7 >= -1 ? v7 + 1 : v7 + 4;
          if (a2 == v8 >> 2) {
            break;
          }
        }
        v5 += 536;
        if ((unsigned __int16)a1[261] == ++v4)
        {
          __int16 v3 = -5343;
          LOWORD(v4) = a1[261];
          goto LABEL_16;
        }
      }
      __int16 v3 = 0;
    }
    else
    {
      LOWORD(v4) = 0;
      __int16 v3 = -5343;
    }
LABEL_16:
    *a3 = v4;
  }
  return v3;
}

uint64_t MKBootDisposition(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)a5 = 0u;
  *(_WORD *)a5 = 259;
  if (a3)
  {
    if (*(unsigned __int16 *)(a3 + 522) <= a4)
    {
      LOWORD(v9) = -5343;
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      *(_DWORD *)(a5 + 4) = 0;
      int v9 = MKGetPartitionRequisites(a1, *(__int16 *)(a3 + 514), (const char *)(a3 + 1072 * a4 + 576), *(unsigned __int16 *)(a3 + 1072 * a4 + 1082), v33);
      if (!v9)
      {
        if (*(_WORD *)v33)
        {
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Loaders");
          if (Value)
          {
            *(_DWORD *)(a5 + 4) = 0;
            if (*(_WORD *)v33)
            {
              CFDictionaryRef v11 = Value;
              int v12 = 0;
              uint64_t v13 = a3 + 528 + 1072 * (__int16)(a4 - 1);
              for (i = &v33[38]; ; i += 38)
              {
                CFStringRef v15 = CFStringCreateWithCString(0, i - 36, 0);
                if (!v15
                  || (CFStringRef v16 = v15, v17 = (const __CFDictionary *)CFDictionaryGetValue(v11, v15), CFRelease(v16), !v17))
                {
                  LOWORD(v9) = -415;
                  return (__int16)v9;
                }
                int v18 = *((unsigned __int16 *)i - 1);
                if ((v18 - 2) < 2 || v18 == 4)
                {
                  LOWORD(v9) = 0;
                  *(_DWORD *)(a5 + 4) |= 0x11u;
                }
                else if (v18 == 1)
                {
                  uint64_t v41 = 0;
                  long long v40 = 0u;
                  memset(v39, 0, sizeof(v39));
                  int v37 = 0;
                  int v36 = 0;
                  unsigned int valuePtr = 0;
                  unsigned int v35 = 0;
                  *(_DWORD *)(a5 + 4) &= 0xFFFFFFFA;
                  int v9 = MKGetPartitionInfo(v17, *(__int16 *)(a3 + 514), (uint64_t)v39);
                  if (!v9)
                  {
                    unsigned int v19 = DWORD2(v40);
                    *(void *)(a5 + 16) = DWORD2(v40);
                    __int16 v38 = a4 - 1;
                    if (!strcasecmp((const char *)(v13 + 48), (const char *)&v39[2] + 1)
                      && *(_DWORD *)(v13 + 12) >= v19)
                    {
                      CFNumberRef v24 = PMCodeSearch(24320, *(__int16 *)(a3 + 514));
                      int v9 = strncasecmp((const char *)&v39[2] + 1, v24, 0x20uLL);
                      int v25 = *(_DWORD *)(a5 + 4);
                      if (!v9)
                      {
                        *(_DWORD *)(a5 + 4) = v25 | 4;
                        *(_WORD *)(a5 + 8) = 0;
                        goto LABEL_47;
                      }
                      *(_DWORD *)(a5 + 4) = v25 | 1;
                      CFBooleanRef v26 = (const __CFBoolean *)CFDictionaryGetValue(v17, @"Loader Present");
                      if (!v26 || CFBooleanGetValue(v26))
                      {
                        if (strcasecmp((const char *)(v13 + 472), i - 36)) {
                          goto LABEL_43;
                        }
                        CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Checksum");
                        if (v27)
                        {
                          CFNumberGetValue(v27, kCFNumberSInt32Type, &v36);
                          if (v36)
                          {
                            if (v36 != *(_DWORD *)(v13 + 116)) {
                              goto LABEL_43;
                            }
                          }
                        }
                        CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Major Vers");
                        if (v28)
                        {
                          CFNumberGetValue(v28, kCFNumberSInt16Type, (char *)&v37 + 2);
                          if (HIWORD(v37))
                          {
                            if (HIWORD(v37) != *(unsigned __int16 *)(v13 + 464)) {
                              goto LABEL_43;
                            }
                          }
                        }
                        CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Minor Vers");
                        if (v29)
                        {
                          CFNumberGetValue(v29, kCFNumberSInt16Type, &v37);
                          if ((_WORD)v37)
                          {
                            if ((unsigned __int16)v37 != *(unsigned __int16 *)(v13 + 466)) {
                              goto LABEL_43;
                            }
                          }
                        }
                      }
                      LOWORD(v9) = 0;
                      *(_DWORD *)(a5 + 4) = *(_DWORD *)(a5 + 4) & 0xFFFFFFFA | 4;
                      __int16 v30 = -1;
                    }
                    else
                    {
                      CFArrayRef v20 = (const __CFArray *)CFDictionaryGetValue(v17, @"Partition Type Throw Aways");
                      int v9 = MKScavangeDross(a3, v20, (uint64_t)v39, (__int16)a4, &v38, &v35);
                      if (v9) {
                        goto LABEL_47;
                      }
                      if (v35 < DWORD2(v40))
                      {
                        CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(v17, @"Minimum Host Size");
                        if (v21
                          && (CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr),
                              unsigned int v22 = PMConvertBlocks(*(unsigned int *)(a3 + 528 + 1072 * a4 + 12), *(unsigned __int16 *)(a3 + 2), 0x200u), valuePtr)&& v22 < valuePtr)
                        {
                          if (*(_WORD *)i)
                          {
                            LOWORD(v9) = 0;
                            int v23 = *(_DWORD *)(a5 + 4) | 4;
LABEL_46:
                            *(_DWORD *)(a5 + 4) = v23;
                            goto LABEL_47;
                          }
                        }
                        else
                        {
                          int v31 = *(_DWORD *)(a5 + 4);
                          *(_DWORD *)(a5 + 4) = v31 | 8;
                          if (*(_WORD *)i)
                          {
                            LOWORD(v9) = 0;
                            int v23 = v31 | 0xC;
                            goto LABEL_46;
                          }
                        }
LABEL_43:
                        LOWORD(v9) = 0;
                        goto LABEL_47;
                      }
                      LOWORD(v9) = 0;
                      *(_DWORD *)(a5 + 4) |= 3u;
                      __int16 v30 = v38 - a4;
                    }
                    *(_WORD *)(a5 + 8) = v30;
                  }
                }
                else
                {
                  LOWORD(v9) = 22;
                }
LABEL_47:
                if (++v12 >= *(unsigned __int16 *)v33) {
                  return (__int16)v9;
                }
              }
            }
          }
          LOWORD(v9) = -417;
        }
        else
        {
          LOWORD(v9) = 0;
          *(_DWORD *)(a5 + 4) |= 4u;
        }
      }
    }
  }
  else
  {
    LOWORD(v9) = -50;
  }
  return (__int16)v9;
}

const char *APMCodeSearch(int a1)
{
  if (a1 == 4097) {
    return "Apple_partition_map";
  }
  __int16 v3 = &off_264496F08;
  do
  {
    uint64_t result = *v3;
    if (!*v3) {
      break;
    }
    int v4 = *((unsigned __int16 *)v3 - 4);
    v3 += 2;
  }
  while (v4 != a1);
  return result;
}

unsigned __int16 *APMDescriptorSearch(char *a1)
{
  uint64_t result = PMLookupDESC(a1, 0, (unsigned __int16 *)&APMDescriptors);
  if (result) {
    return (unsigned __int16 *)*result;
  }
  return result;
}

uint64_t APMCFCreateMap(__CFArray *a1, const __CFDictionary *a2, __CFBundle *a3, int a4, unint64_t a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  int v41 = 0;
  unsigned int v43 = 22;
  *(void *)uint64_t v39 = 0;
  unsigned __int16 valuePtr = 1;
  __int16 v42 = 1;
  if (a2)
  {
    unsigned int v43 = -43;
    CFDictionaryRef v17 = a3;
    if (a3 || (CFDictionaryRef v17 = MKAccessLibrary(0)) != 0)
    {
      uint64_t v37 = 0;
      v38[0] = 0;
      v38[1] = 0;
      CFDictionaryRef v18 = MKLoadDB(v17, @"inventory", (int *)&v43);
      if (v18)
      {
        CFDictionaryRef v36 = a7;
        CFURLRef v19 = MKLoadDB(v17, @"database", (int *)&v43);
        if (!v43)
        {
          unsigned int v43 = a9(a8, 15, a5, 0, 0, (char *)&v37);
          if (!v43)
          {
            unsigned __int16 v34 = WORD2(v37);
            if (a6)
            {
              if (!a5) {
                LOWORD(a5) = 512;
              }
            }
            else
            {
              MKScaleGeometry(v38, (int *)&v37 + 1);
              a6 = v38[0];
              if (a5 && HIDWORD(v37) < a5) {
                a6 = PMConvertBlocks(LODWORD(v38[0]), WORD2(v37), a5);
              }
              else {
                LOWORD(a5) = WORD2(v37);
              }
            }
            int v21 = (unsigned __int16)a5 >> 9;
            if (a4) {
              int v21 = a4;
            }
            unsigned int v35 = v21;
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"PMFormats");
            if (Value || (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"Map Format")) != 0) {
              CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
            }
            CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Dual Format");
            v24 = (v23 || (CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Dualmode")) != 0)
               && CFBooleanGetValue(v23) != 0;
            CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Map Size");
            if (v25) {
              CFNumberGetValue(v25, kCFNumberSInt32Type, &v41);
            }
            char v26 = MKCFOptionBit(a2, @"Force 512 Byte Map", 1);
            unsigned int v43 = PMNewPartitionListInternal((const void ***)v39, v41, a6, (unsigned __int16)a5, v24, valuePtr, v26);
            if (!v43)
            {
              *(_WORD *)(**(void **)v39 + 500) = v34 >> 9;
              CFArrayRef v27 = (const __CFArray *)CFDictionaryGetValue(a2, @"Drivers");
              CFArrayRef v28 = (const __CFArray *)CFDictionaryGetValue(a2, @"Patches");
              CFArrayRef v29 = (const __CFArray *)CFDictionaryGetValue(a2, @"Partitions");
              CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Revision");
              if (v30) {
                CFNumberGetValue(v30, kCFNumberSInt16Type, &v42);
              }
              if ((!v27
                 || (unsigned int v43 = MKBuildDrivers(*(Ptr **)v39, v18, v27, v17, v35, 0, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a9)) == 0)&& (!v28|| (unsigned int v43 = MKCreatePatchPartition(*(const void ***)v39, v29, v18, v28, v17, v35, 0, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))a9)) == 0))
              {
                int v31 = APMCFRecordMapSection(*(Ptr **)v39, 0x94u, &v43);
                if (!v43)
                {
                  int v33 = v31;
                  if (v31)
                  {
                    CFArrayAppendValue(a1, v31);
                    CFRelease(v33);
                  }
                  if (v29) {
                    unsigned int v43 = APMCFCreatePartitions(v33, v29, v17, v18, v32, v35, v36, a8, a9);
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        CFURLRef v19 = 0;
      }
      if (!a3) {
        CFRelease(v17);
      }
      if (v18) {
        CFRelease(v18);
      }
      if (v19) {
        CFRelease(v19);
      }
    }
  }
  return v43;
}

uint64_t APMSetupNewPartitionList(const void **a1, int a2, int a3, unsigned int a4, int a5, char a6)
{
  int v8 = *a1;
  *((_WORD *)*a1 + 258) = a5 != 0;
  if (a2) {
    unsigned __int16 v9 = a2;
  }
  else {
    unsigned __int16 v9 = 63;
  }
  if (a6 & 2 | a2) {
    v9 /= (unsigned __int16)(a4 >> 9);
  }
  v8[260] = v9;
  _WORD *v8 = 17746;
  if (a5) {
    __int16 v10 = 512;
  }
  else {
    __int16 v10 = a4;
  }
  if (a6) {
    unsigned __int16 v11 = 512;
  }
  else {
    unsigned __int16 v11 = v10;
  }
  v8[1] = v11;
  *((_DWORD *)v8 + 1) = a4 / v11 * a3;
  v8[250] = v11 >> 9;
  uint64_t result = PMGenPartitionType(a1, 4097, 1, v9, v11, (a5 << 24) | 3u, "Apple", 0, 0);
  if (!result)
  {
    return PMAccountFreespace(a1, a5, 0);
  }
  return result;
}

uint64_t PMGenPartitionType(const void **a1, int a2, int a3, int a4, unsigned int a5, int a6, unsigned char *a7, int a8, unsigned __int16 a9)
{
  CFStringRef v16 = (char *)PMCodeSearch(a2, *((__int16 *)*a1 + 257));
  if (!v16) {
    return 4294961954;
  }
  return PMGenPartition(a1, v16, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t PMGenPartition(const void **a1, char *a2, int a3, int a4, unsigned int a5, int a6, unsigned char *a7, int a8, unsigned __int16 a9)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  memset(v34, 0, sizeof(v34));
  PMInitPartitionRecord(*((__int16 *)*a1 + 257), a3, a4, 0, a2, a7, v34);
  uint64_t v13 = (unsigned __int16 *)*a1;
  if (a6)
  {
    __int16 v14 = 0;
    DWORD2(v35) = a6;
    if (!a5) {
      goto LABEL_7;
    }
LABEL_5:
    unsigned int v15 = v13[1];
    if (v15 != a5) {
      PMConvertRecord(v34, (__int16)v13[257], v62, a5 >> 9, v15 >> 9);
    }
    goto LABEL_7;
  }
  __int16 v14 = PMDefaultPartitionStatus((__int16)v13[257], (uint64_t)v34);
  if (a5) {
    goto LABEL_5;
  }
LABEL_7:
  if (!a8) {
    return (__int16)addentry(a1, v34, 0x210uLL, 0x20Au, a9, 0x430u);
  }
  CFStringRef v16 = *a1;
  uint64_t v17 = *((unsigned __int16 *)*a1 + 261);
  if (!*((_WORD *)*a1 + 261))
  {
    unsigned int v19 = HIDWORD(v34[0]);
    goto LABEL_47;
  }
  BOOL v18 = 0;
  unsigned int v20 = DWORD2(v34[0]);
  unsigned int v19 = HIDWORD(v34[0]);
  do
  {
    if (*((_WORD *)v16 + 541) != 24320)
    {
      unsigned int v21 = v16[134];
      if (v21 >= v20) {
        unsigned int v22 = v20;
      }
      else {
        unsigned int v22 = v16[134];
      }
      if (v21 <= v20) {
        unsigned int v23 = v20;
      }
      else {
        unsigned int v23 = v16[134];
      }
      if (v21 >= v20) {
        int v24 = (_DWORD *)((unint64_t)v34 | 0xC);
      }
      else {
        int v24 = v16 + 135;
      }
      unsigned int v25 = *v24 + v22;
      if (v25 < v23) {
        goto LABEL_42;
      }
      int v26 = v23 - v22;
      if (v21 >= v20) {
        CFArrayRef v27 = v16 + 135;
      }
      else {
        CFArrayRef v27 = (_DWORD *)((unint64_t)v34 | 0xC);
      }
      unsigned int v28 = *v27 + v23;
      int v29 = v25 - v28;
      if (v25 <= v28) {
        int v29 = v28 - v25;
      }
      unsigned int v30 = v26 <= v29 ? v29 : v26;
      if ((v30 & 0x80000000) != 0)
      {
LABEL_42:
        BOOL v18 = 0;
        if (!v19) {
          break;
        }
        goto LABEL_43;
      }
      if (v25 >= v28) {
        unsigned int v25 = v28;
      }
      if (v26 >= v29) {
        unsigned int v25 = v22;
      }
      BOOL v31 = v20 == v25 && v19 == v30;
      BOOL v18 = !v31;
      *((void *)&v34[0] + 1) = __PAIR64__(v30, v25);
      unsigned int v19 = v30;
      unsigned int v20 = v25;
      if (!v30) {
        break;
      }
    }
LABEL_43:
    v16 += 268;
    --v17;
  }
  while (v17);
  if (v18) {
    DWORD2(v35) |= 0x1000u;
  }
LABEL_47:
  if (v62 == 24320 || v19 != 0) {
    return (__int16)addentry(a1, v34, 0x210uLL, 0x20Au, a9, 0x430u);
  }
  return v14;
}

__CFDictionary *APMCFRecordMapSection(Ptr *a1, unsigned int a2, _DWORD *a3)
{
  __int16 v13 = 0;
  Ptr v4 = *a1;
  if (*a1)
  {
    __int16 v14 = 0;
    LODWORD(Mutable) = PMSpecificIndex(a1, 4097, 0, &v14);
    if (Mutable)
    {
      int v8 = 0;
    }
    else
    {
      __int16 v10 = &v4[1072 * v14];
      if (uuid_is_null((const unsigned __int8 *)v10 + 976)) {
        MEMORY[0x223C20E30](v10 + 976);
      }
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      int v8 = Mutable;
      if (Mutable)
      {
        uint64_t v11 = (uint64_t)(v10 + 528);
        LODWORD(Mutable) = APMUpdatePartitionDictionary(Mutable, v11, (uint64_t)v4);
        if (!Mutable)
        {
          CFDictionarySetValue(v8, @"ID", @"MAP");
          MKCFRecordSectionSize(v8, *(unsigned int *)(v11 + 8), *(unsigned int *)(v11 + 8), (*((_DWORD *)v4 + 1) - *(_DWORD *)(v11 + 8)), *((unsigned int *)v4 + 1), *((unsigned __int16 *)v4 + 259));
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
          if (Mutable)
          {
            int v12 = Mutable;
            CFDictionarySetValue(v8, @"Partitions", Mutable);
            CFRelease(v12);
            if (!*((_WORD *)v4 + 261)
              || (LODWORD(Mutable) = APMCFRecordPartitions((uint64_t *)a1, v12, a2, &v13), !Mutable))
            {
              mkcfstoreref(v8, (const UInt8 *)a1);
              LODWORD(Mutable) = 0;
            }
          }
        }
      }
    }
  }
  else
  {
    int v8 = 0;
    LODWORD(Mutable) = -1;
  }
  if (a3) {
    *a3 = Mutable;
  }
  return v8;
}

uint64_t APMUpdatePartitionDictionary(__CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t result = 22;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = CFDictionarySetUUID(a1, @"GUID", (CFUUIDBytes *)(a2 + 448));
      if (!result)
      {
        CFNumberRef v7 = PMCFCreatePartitionType(1, *(unsigned __int16 *)(a2 + 554), (char *)(a2 + 48));
        if (v7)
        {
          CFNumberRef v8 = v7;
          CFDictionarySetValue(a1, @"Type", v7);
          CFRelease(v8);
          if (*(unsigned char *)(a2 + 16))
          {
            unsigned __int16 v9 = strntrim((const char *)(a2 + 16), 32);
            CFStringRef v10 = CFStringCreateWithCString(0, v9, 0);
            if (v10)
            {
              CFStringRef v11 = v10;
              CFDictionarySetValue(a1, @"Name", v10);
              CFRelease(v11);
            }
          }
          unint64_t v12 = (unint64_t)*(unsigned __int16 *)(a3 + 2) >> 9;
          unint64_t v13 = *(unsigned int *)(a2 + 8) * (unint64_t)v12;
          unint64_t v14 = *(unsigned int *)(a2 + 12) * (unint64_t)v12;
          uint64_t v48 = v14;
          uint64_t v49 = v13;
          unint64_t v15 = *(unsigned int *)(a2 + 84) * (unint64_t)v12;
          unint64_t v47 = v15;
          if (*(_WORD *)(a2 + 554) == 4097)
          {
            if (v13 != 1)
            {
              uint64_t v48 = v13 + v14 - 1;
              uint64_t v49 = 1;
            }
            unint64_t v15 = 0;
            unint64_t v47 = 0;
          }
          __int16 valuePtr = pmindex2slice(a3, a2);
          if (valuePtr)
          {
            CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
            if (v16)
            {
              CFNumberRef v17 = v16;
              CFDictionarySetValue(a1, @"Partition ID", v16);
              CFRelease(v17);
            }
          }
          if (v49)
          {
            CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt64Type, &v49);
            if (v18)
            {
              CFNumberRef v19 = v18;
              CFDictionarySetValue(a1, @"Offset", v18);
              CFRelease(v19);
            }
          }
          if (*(_DWORD *)(a2 + 80))
          {
            CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 80));
            if (v20)
            {
              CFNumberRef v21 = v20;
              CFDictionarySetValue(a1, @"Logical Offset", v20);
              CFRelease(v21);
            }
          }
          if (v48)
          {
            CFNumberRef v22 = CFNumberCreate(0, kCFNumberSInt64Type, &v48);
            if (v22)
            {
              CFNumberRef v23 = v22;
              CFDictionarySetValue(a1, @"Size", v22);
              CFRelease(v23);
            }
          }
          if (v15)
          {
            if (v15 != v48)
            {
              CFNumberRef v24 = CFNumberCreate(0, kCFNumberSInt64Type, &v47);
              if (v24)
              {
                CFNumberRef v25 = v24;
                CFDictionarySetValue(a1, @"Logical Size", v24);
                CFRelease(v25);
              }
            }
          }
          if (*(_DWORD *)(a2 + 88))
          {
            CFNumberRef v26 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 88));
            if (v26)
            {
              CFNumberRef v27 = v26;
              CFDictionarySetValue(a1, @"Status", v26);
              CFRelease(v27);
            }
          }
          if (*(_DWORD *)(a2 + 92))
          {
            CFNumberRef v28 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 92));
            if (v28)
            {
              CFNumberRef v29 = v28;
              CFDictionarySetValue(a1, @"Logical Boot Offset", v28);
              CFRelease(v29);
            }
          }
          if (*(_DWORD *)(a2 + 96))
          {
            CFNumberRef v30 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 96));
            if (v30)
            {
              CFNumberRef v31 = v30;
              CFDictionarySetValue(a1, @"Boot Size", v30);
              CFRelease(v31);
            }
          }
          if (*(_DWORD *)(a2 + 116))
          {
            CFNumberRef v32 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 116));
            if (v32)
            {
              CFNumberRef v33 = v32;
              CFDictionarySetValue(a1, @"Boot Checksum", v32);
              CFRelease(v33);
            }
          }
          if (*(unsigned char *)(a2 + 120))
          {
            unsigned __int16 v34 = strntrim((const char *)(a2 + 120), 16);
            CFStringRef v35 = CFStringCreateWithCString(0, v34, 0);
            if (v35)
            {
              CFStringRef v36 = v35;
              CFDictionarySetValue(a1, @"Processor ID", v35);
              CFRelease(v36);
            }
          }
          uint64_t v37 = *(unsigned int *)(a2 + 136);
          if (v37)
          {
            OSType2Ascii(v37, v51, 2);
            long long v38 = strntrim(v51, 16);
            CFStringRef v39 = CFStringCreateWithCString(0, v38, 0);
            if (v39)
            {
              CFStringRef v40 = v39;
              CFDictionarySetValue(a1, @"Boot Signature", v39);
              CFRelease(v40);
            }
          }
          if (*(_WORD *)(a2 + 464))
          {
            CFNumberRef v41 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a2 + 464));
            if (v41)
            {
              CFNumberRef v42 = v41;
              CFDictionarySetValue(a1, @"Major Version", v41);
              CFRelease(v42);
            }
          }
          if (*(_WORD *)(a2 + 466))
          {
            CFNumberRef v43 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a2 + 466));
            if (v43)
            {
              CFNumberRef v44 = v43;
              CFDictionarySetValue(a1, @"Minor Version", v43);
              CFRelease(v44);
            }
          }
          uint64_t result = 0;
          if (*(unsigned char *)(a2 + 472) && *(unsigned __int8 *)(a2 + 472) != 255)
          {
            long long v45 = strntrim((const char *)(a2 + 472), 32);
            uint64_t result = (uint64_t)CFStringCreateWithCString(0, v45, 0);
            if (result)
            {
              long long v46 = (const void *)result;
              CFDictionarySetValue(a1, @"Content Hint", (const void *)result);
              CFRelease(v46);
              return 0;
            }
          }
        }
        else
        {
          return 22;
        }
      }
    }
  }
  return result;
}

const char *strntrim(const char *a1, int a2)
{
  size_t v4 = strnlen(a1, a2);
  if (a2 >= 1 && v4)
  {
    if (a1[v4 - 1] <= 32 && &a1[v4 - 1] >= a1)
    {
      int v6 = &a1[v4 - 2];
      do
      {
        *((unsigned char *)v6 + 1) = 0;
        BOOL v7 = *v6 <= 32 && v6 >= a1;
        --v6;
      }
      while (v7);
    }
    a1[a2 - 1] = 0;
  }
  return a1;
}

uint64_t pmindex2slice(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(a2 + 506);
  if (v2 == -1)
  {
    int v5 = *(__int16 *)(a2 + 504);
    if (v5 != -1) {
      return ((v5 + 1) >> 2) & ~(v5 >> 31);
    }
    return 0;
  }
  if (v2 < 0) {
    return 0;
  }
  unsigned int v3 = v2 + 1;
  if (*(_WORD *)(a1 + 516)) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = *(unsigned __int16 *)(a1 + 518) >> 9;
  }
  return v3 / v4;
}

uint64_t APMCFRecordPartitions(uint64_t *a1, const __CFArray *a2, unsigned int a3, _WORD *a4)
{
  uint64_t v4 = *a1;
  if (*(_WORD *)(*a1 + 522))
  {
    unint64_t v9 = 0;
    do
    {
      CFStringRef v10 = &APMDescriptors;
      while (*v10 != *(_WORD *)(v4 + 1072 * v9 + 1082))
      {
        uint64_t v11 = *((void *)v10 + 3);
        v10 += 8;
        if (!v11)
        {
          CFStringRef v10 = (__int16 *)&unk_2644971E0;
          break;
        }
      }
      if ((a3 >> v10[1]))
      {
        uint64_t result = APMCFRecordPartition(a2, a1, (__int16)v9);
        if (result) {
          return result;
        }
        if (a4) {
          ++*a4;
        }
      }
      ++v9;
    }
    while (v9 < *(unsigned __int16 *)(v4 + 522));
  }
  return 0;
}

uint64_t APMCategorize(int a1)
{
  uint64_t v1 = &APMDescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    uint64_t v2 = *((void *)v1 + 3);
    v1 += 8;
    if (!v2)
    {
      uint64_t v1 = (__int16 *)&unk_2644971E0;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t APMCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, __CFBundle *a3, const __CFDictionary *a4, int a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  if (!a1) {
    return 4294967246;
  }
  uint64_t Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  CFIndex v17 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v17);
    if (!ValueAtIndex) {
      break;
    }
    uint64_t result = APMCFCreatePartition(a1, ValueAtIndex, a3, a4, v19, a6, a7, a8, a9);
    if (result) {
      return result;
    }
    if (Count == ++v17) {
      return 0;
    }
  }
  return 4294966881;
}

uint64_t APMCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  CFNumberRef v16 = mkcfrecoverref(a1);
  if (!v16) {
    return 4294967246;
  }
  CFIndex v17 = (Ptr *)v16;
  unsigned __int16 v42 = 0;
  long long v44 = 0u;
  memset(v45, 0, sizeof(v45));
  memset(v46, 0, 464);
  uint64_t v18 = *(void *)v16;
  unsigned int v41 = *(unsigned __int16 *)(*(void *)v16 + 2) >> 9;
  uint64_t result = PMPrimaryInfoUpdate(a2, *(__int16 *)(*(void *)v16 + 514), v41, &v44, 1);
  if (!result)
  {
    if (v47 != 12544 || (uint64_t result = PMSpecificIndex(v17, 12544, 0, (__int16 *)&v42), !((unsigned __int16)result | v42)))
    {
      uint64_t v37 = v18;
      uint64_t v38 = a8;
      CFDictionaryRef v39 = a4;
      CFStringRef v40 = (const void **)v17;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Options");
      uint64_t v21 = 0;
      char v22 = 1;
      do
      {
        char v23 = v22;
        if (Value)
        {
          int v24 = MKCFOptionBit(Value, @"Avoid last 10 blocks", 1);
          int v25 = MKCFOptionBit(Value, @"Retain existing content", 4) | v24;
          int v26 = MKCFOptionBit(Value, @"Allocate Remaining Space", 0x400000);
          int v27 = v25 | v26 | MKCFOptionBit(Value, @"Write Protect", 0x80000000);
          int v28 = MKCFOptionBit(Value, @"Flexible Allocation", 0x10000000);
          int v29 = v28 | MKCFOptionBit(Value, @"Direct Mode", 0x20000000);
          v21 |= v27 | v29 | MKCFOptionBit(Value, @"No Minimum Size For Loader", 0x800000);
        }
        char v22 = 0;
        CFDictionaryRef Value = a7;
      }
      while ((v23 & 1) != 0);
      unsigned int v30 = a6;
      if (!a6) {
        unsigned int v30 = *(unsigned __int16 *)(v37 + 518) >> 9;
      }
      if ((v21 & 0x400000) != 0)
      {
        unsigned int v31 = 0;
        HIDWORD(v44) = 0;
      }
      else
      {
        unsigned int v31 = HIDWORD(v44);
      }
      uint64_t result = PMNewPartitionExtended(v40, v47, (char *)v46, DWORD2(v44), v31, v45, v30, &v42, v21);
      if (!result)
      {
        CFNumberRef v32 = *v40;
        CFNumberRef v33 = (char *)*v40 + 1072 * (__int16)v42 + 528;
        uint64_t result = PMSecondaryInfoUpdate(a2, v41, (uint64_t)v33, 1);
        if (!result)
        {
          if ((v21 & 1) != 0 && v32[1] == v33[3] + v33[2])
          {
            unsigned int v34 = (v33[3] - PMConvertBlocks(10, 0x200u, *((unsigned __int16 *)v32 + 1))) / v30 * v30;
            v33[3] = v34;
            if (v33[21]) {
              v33[21] = v34;
            }
          }
          CFArrayRef v35 = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
          if (!a3) {
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          }
          if ((v21 & 0x20000000) != 0) {
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          }
          CFStringRef v36 = (const __CFString *)CFDictionaryGetValue(a2, @"Partition Loader");
          if (!v36) {
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          }
          CFStringGetCString(v36, v43, 32, 0);
          uint64_t result = MKCreateLoaderPartition(v40, a3, v39, v30, (unsigned __int16)v21, (__int16)v42, v43, 1, v38, a9);
          if (result == 28) {
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          }
          if (!result)
          {
            uint64_t result = APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
            if (!result) {
              return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)++v42);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t PMPrimaryInfoUpdate(CFDictionaryRef theDict, int a2, unsigned int a3, void *a4, int a5)
{
  uint64_t result = 22;
  if (theDict && a4)
  {
    if (a5) {
      bzero(a4, 0x430uLL);
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"Type");
    if (Value)
    {
      uint64_t result = PMCFSetupPartitionType(a2, Value, (unsigned __int16 *)a4 + 277, (char *)a4 + 48);
      if (!result)
      {
        CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(theDict, @"Name");
        if (v11) {
          CFStringGetCString(v11, (char *)a4 + 16, 32, 0);
        }
        uint64_t valuePtr = 0;
        CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Offset");
        if (v12) {
          CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr);
        }
        unint64_t v17 = 0;
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Size");
        if (v13)
        {
          CFNumberGetValue(v13, kCFNumberSInt64Type, &v17);
          unint64_t v14 = v17;
        }
        else
        {
          unint64_t v14 = 0;
        }
        uint64_t result = 0;
        if (valuePtr % a3) {
          int v15 = valuePtr / a3 + 1;
        }
        else {
          int v15 = valuePtr / a3;
        }
        if (v14 % a3) {
          int v16 = v14 / a3 + 1;
        }
        else {
          int v16 = v14 / a3;
        }
        *((_DWORD *)a4 + 2) = v15;
        *((_DWORD *)a4 + 3) = v16;
      }
    }
    else
    {
      return 22;
    }
  }
  return result;
}

uint64_t APMSetDefaultStatus(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 554);
  if (v2 > 0x4006)
  {
    if (*(unsigned __int16 *)(a1 + 554) > 0x401Fu)
    {
      if (v2 != 16416 && v2 != 16417)
      {
        if (v2 == 24320)
        {
          int v4 = 0;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if (v2 == 16391) {
      goto LABEL_20;
    }
    int v5 = 16395;
LABEL_19:
    if (v2 != v5) {
      goto LABEL_23;
    }
LABEL_20:
    int v4 = 1073741875;
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(a1 + 554) > 0x37FFu)
  {
    if (v2 == 14336)
    {
      int v4 = 35;
      goto LABEL_21;
    }
    if (v2 == 0x4000) {
      goto LABEL_20;
    }
    int v5 = 16386;
    goto LABEL_19;
  }
  if (v2 - 12544 < 2 || v2 == 4097)
  {
    int v4 = 3;
    goto LABEL_21;
  }
LABEL_23:
  if (strstr((char *)(a1 + 48), "Driver")) {
    int v4 = 3;
  }
  else {
    int v4 = 1073741875;
  }
LABEL_21:
  *(_DWORD *)(a1 + 88) |= v4;
  return 0;
}

BOOL PMDrvrIdentify(char *a1)
{
  return strstr(a1, "Driver") != 0;
}

uint64_t PMSecondaryInfoUpdate(const __CFDictionary *a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t UUID = CFDictionaryGetUUID(a1, @"GUID", (unsigned __int8 *)(a3 + 448));
  if (!UUID)
  {
    unint64_t valuePtr = 0;
    uint64_t v24 = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"Logical Size");
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr)
      {
        if (valuePtr % a2) {
          int v10 = valuePtr / a2 + 1;
        }
        else {
          int v10 = valuePtr / a2;
        }
        *(_DWORD *)(a3 + 84) = v10;
      }
    }
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Logical Offset");
    if (v11) {
      CFNumberGetValue(v11, kCFNumberSInt32Type, (void *)(a3 + 80));
    }
    CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Status");
    if (v12)
    {
      CFNumberGetValue(v12, kCFNumberSInt64Type, &v24);
      int v13 = v24;
      if (a4)
      {
        int v13 = v24 | *(_DWORD *)(a3 + 88);
        v24 |= *(unsigned int *)(a3 + 88);
      }
      *(_DWORD *)(a3 + 88) = v13;
    }
    CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Logical Boot Offset");
    if (v14) {
      CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(a3 + 92));
    }
    CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Boot Size");
    if (v15) {
      CFNumberGetValue(v15, kCFNumberSInt32Type, (void *)(a3 + 96));
    }
    CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Boot Checksum");
    if (v16) {
      CFNumberGetValue(v16, kCFNumberSInt32Type, (void *)(a3 + 116));
    }
    CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(a1, @"Processor ID");
    if (v17) {
      CFStringGetCString(v17, (char *)(a3 + 120), 16, 0);
    }
    CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(a1, @"Boot Signature");
    if (v18)
    {
      v25.location = 0;
      v25.lengtHandle h = 4;
      CFStringGetBytes(v18, v25, 0, 0, 0, (UInt8 *)(a3 + 136), 4, 0);
    }
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Major Version");
    if (v19) {
      CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(a3 + 464));
    }
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Minor Version");
    if (v20) {
      CFNumberGetValue(v20, kCFNumberSInt16Type, (void *)(a3 + 466));
    }
    CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(a1, @"Content Hint");
    if (v21) {
      CFStringGetCString(v21, (char *)(a3 + 472), 32, 0);
    }
  }
  return UUID;
}

uint64_t PMConvertBlocks(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2)
  {
    if (a2 != a3) {
      return (a2 >> 9) * result / (a3 >> 9);
    }
  }
  return result;
}

uint64_t APMCFRecordPartition(const __CFArray *a1, uint64_t *a2, int a3)
{
  uint64_t v4 = *a2;
  int v5 = (CFUUIDBytes *)(*a2 + 1072 * a3);
  if (uuid_is_null(&v5[61].byte0))
  {
    MEMORY[0x223C20E30](&v5[61]);
  }
  else
  {
    CFStringRef v8 = (const __CFString *)uuid2cfstr(v5 + 61);
    CFDictionaryRef Mutable = CFArrayDictionarySearchWithIndexOptions(a1, @"GUID", v8, 0, 0);
    CFRelease(v8);
    if (Mutable) {
      goto LABEL_6;
    }
  }
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFArrayAppendValue(a1, Mutable);
  CFRelease(Mutable);
  if (!Mutable) {
    return 22;
  }
LABEL_6:
  return APMUpdatePartitionDictionary(Mutable, (uint64_t)&v5[33], v4);
}

uint64_t APMCFWriteScheme(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Sections");
  if (!Value) {
    return 22;
  }
  CFDictionaryRef v13 = CFArrayDictionarySearchWithIndexOptions(Value, @"ID", @"MAP", 0, 0);
  if (!v13) {
    return 22;
  }
  CFDictionaryRef v14 = v13;
  CFNumberRef v15 = mkcfrecoverref(v13);
  if (!v15) {
    return 22;
  }
  CFNumberRef v16 = (Ptr *)v15;
  int valuePtr = 0;
  CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Alignment");
  if (v17)
  {
    CFNumberGetValue(v17, kCFNumberSInt16Type, &valuePtr);
    unsigned int v18 = (unsigned __int16)valuePtr;
  }
  else
  {
    unsigned int v18 = *((unsigned __int16 *)*v16 + 259) >> 9;
    LOWORD(valuePtr) = *((_WORD *)*v16 + 259) >> 9;
  }
  uint64_t result = APMCFUpdateSection(v14, a3, v18, a4, a5, a6);
  if (!result)
  {
    if (!a2
      || (uint64_t result = MKMediaUpdateExtended((uint64_t *)v16, a2, a3, (unsigned __int16)valuePtr, 2, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a6, (_WORD *)&valuePtr + 1), !result))
    {
      if (a4)
      {
        int v20 = MKCFOptionBit(a4, @"Generate Freespace Records", 16);
        int v21 = MKCFOptionBit(a4, @"Merge Adjacent Freespace Records", 128) | v20;
        int v22 = MKCFOptionBit(a4, @"Fit Map to Media", 8);
        int v23 = v21 | v22 | MKCFOptionBit(a4, @"Merge Trailing Freespace Record", 0x80000);
        int v24 = MKCFOptionBit(a4, @"Ignore Shims", 0x8000);
        int v25 = v24 | MKCFOptionBit(a4, @"Protect NV Area", 0x8000000);
        int v26 = v23 | v25 | MKCFOptionBit(a4, @"Restrict Freespace", 0x4000);
        int v27 = MKCFOptionBit(a4, @"Patch Update", 0x10000);
        int v28 = v27 | MKCFOptionBit(a4, @"DDM Update", 0x20000);
        unsigned int v29 = v26 | v28 | MKCFOptionBit(a4, @"Fit Map to Container", 0x40000000);
      }
      else
      {
        unsigned int v29 = 49296;
      }
      unsigned int v30 = APMWriteMedia(v16, v29, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))a6);
      if (v30)
      {
        unsigned int v31 = v30;
        unsigned int v32 = 0;
      }
      else
      {
        CFArrayRef v33 = (const __CFArray *)CFDictionaryGetValue(v14, @"Partitions");
        Ptr v34 = *v16;
        if (*((_WORD *)*v16 + 261))
        {
          unsigned int v32 = 0;
          unsigned int v35 = 0;
          do
          {
            unsigned int v36 = APMCFRecordPartition(v33, (uint64_t *)v16, (__int16)v35);
            if ((v36 & 1) != 0 && v32 == 0) {
              unsigned int v32 = v36;
            }
            ++v35;
          }
          while (v35 < *((unsigned __int16 *)v34 + 261));
          unsigned int v31 = v36;
        }
        else
        {
          unsigned int v32 = 0;
          unsigned int v31 = 0;
        }
        v39.lengtHandle h = CFArrayGetCount(v33);
        v39.location = 0;
        CFArraySortValues(v33, v39, (CFComparatorFunction)CFRankPartition, 0);
      }
      if (v31) {
        return v31;
      }
      else {
        return v32;
      }
    }
  }
  return result;
}

uint64_t APMCFUpdateSection(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  v82[2] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  int v10 = a2;
  if (!a2) {
    int v10 = MKAccessLibrary(0);
  }
  CFNumberRef v12 = mkcfrecoverref(a1);
  if (!v12) {
    return 22;
  }
  CFDictionaryRef v13 = (uint64_t *)v12;
  LOWORD(v82[0]) = 0;
  v79[0] = 0uLL;
  uint64_t result = CFDictionaryGetUUID(a1, @"GUID", (unsigned __int8 *)v79);
  if (!result)
  {
    uint64_t result = PMGuidSearch((uint64_t)v13, v79, v82);
    if (!result)
    {
      unsigned int v15 = a3;
      CFDictionaryRef v16 = a4;
      uint64_t v17 = a5;
      uint64_t v18 = *v13;
      CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Media Block Size");
      if (v19) {
        CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(v18 + 518));
      }
      unsigned int v20 = *(unsigned __int16 *)(v18 + 2) >> 9;
      int v21 = (void *)(v18 + 1072 * SLOWORD(v82[0]) + 528);
      PMPrimaryInfoUpdate(a1, *(__int16 *)(v18 + 514), v20, v21, 0);
      uint64_t result = PMSecondaryInfoUpdate(a1, v20, (uint64_t)v21, 0);
      a5 = v17;
      a4 = v16;
      a3 = v15;
    }
    if (!result)
    {
      unsigned int UUID = 0;
      __int16 v77 = 0;
      int v76 = 0;
      v82[1] = 0;
      v82[0] = 0;
      memset(v80, 0, 464);
      memset(v79, 0, sizeof(v79));
      BOOL v75 = 0;
      if (v10)
      {
        CFURLRef v22 = MKLoadDB(v10, @"inventory", (int *)&UUID);
        if (!v22) {
          return UUID;
        }
        CFDictionaryRef v23 = v22;
        CFURLRef v24 = MKLoadDB(v10, @"database", (int *)&UUID);
        if (!v24) {
          return UUID;
        }
        CFDictionaryRef v25 = v24;
        unsigned int UUID = MKPurgeLoaders(v10, v13, &v75);
        if (UUID) {
          return UUID;
        }
        long long v70 = a6;
        CFDictionaryRef v71 = v25;
        CFDictionaryRef cf = v23;
        uint64_t v69 = a5;
      }
      else
      {
        uint64_t v69 = a5;
        long long v70 = a6;
        CFDictionaryRef cf = 0;
        CFDictionaryRef v71 = 0;
      }
      CFArrayRef theArray = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
      int Count = CFArrayGetCount(theArray);
      unsigned int UUID = 0;
      int v72 = Count;
      if (Count >= 1)
      {
        int v27 = 0;
        int valuePtr = (void *)((unint64_t)v79 | 0xC);
        value = (void *)*MEMORY[0x263EFFB40];
        while (2)
        {
          CFIndex v28 = v27;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v28);
            if (!ValueAtIndex) {
              goto LABEL_84;
            }
            CFDictionaryRef v30 = ValueAtIndex;
            unsigned int v31 = *(unsigned __int16 *)(*v13 + 2) >> 9;
            unsigned int UUID = PMPrimaryInfoUpdate(ValueAtIndex, *(__int16 *)(*v13 + 514), v31, v79, 1);
            if (UUID) {
              goto LABEL_84;
            }
            unsigned int v32 = &APMDescriptors;
            while (*v32 != v81)
            {
              uint64_t v33 = *((void *)v32 + 3);
              v32 += 8;
              if (!v33)
              {
                unsigned int v32 = (__int16 *)&unk_2644971E0;
                break;
              }
            }
            if (((1 << v32[1]) & 0x3A) == 0) {
              break;
            }
            if (++v28 >= v72) {
              goto LABEL_84;
            }
          }
          unsigned int UUID = CFDictionaryGetUUID(v30, @"GUID", (unsigned __int8 *)v82);
          if (!UUID) {
            unsigned int UUID = PMGuidSearch((uint64_t)v13, v82, &v77);
          }
          CFDictionaryRef v34 = (const __CFDictionary *)CFDictionaryGetValue(v30, @"Options");
          CFDictionaryRef v36 = v34;
          CFMutableDictionaryRef theDict = v34;
          if (v34)
          {
            int v65 = MKCFOptionBit(v34, @"Allocate Remaining Space", 0x400000);
            LODWORD(v36) = MKCFOptionBit(v36, @"Direct Mode", 0x20000000) | v65;
            unsigned int v37 = UUID;
            if (UUID == -5343 && (v36 & 0x400000) != 0)
            {
LABEL_41:
              unsigned int v38 = APMCFCreatePartition(a1, v30, v10, cf, v35, a3, a4, v69, v70);
              unsigned int UUID = v38;
              goto LABEL_42;
            }
          }
          else
          {
            unsigned int v37 = UUID;
          }
          if (v37)
          {
            if (v37 != -5343 || HIDWORD(v79[0]) == -DWORD2(v79[0])) {
              goto LABEL_84;
            }
            goto LABEL_41;
          }
          if (!(DWORD2(v79[0]) + HIDWORD(v79[0])))
          {
            if ((v36 & 0x20000000) != 0)
            {
              int v27 = v28;
            }
            else
            {
              unsigned int UUID = MKPurgeLoader(v71, cf, (const void **)v13, v77, 0, theArray, v28, &v76);
              if (UUID) {
                goto LABEL_84;
              }
              int v27 = v28 + (v76 >> 31);
              v72 -= v76 != 0;
              unsigned int v38 = PMGuidSearch((uint64_t)v13, v82, &v77);
              unsigned int UUID = v38;
              LODWORD(v28) = v27;
              if (v38) {
                goto LABEL_42;
              }
            }
            unsigned int v38 = PMRemovePartition((const void **)v13, (unsigned __int16)v77, 1);
            unsigned int UUID = v38;
            if (!v38)
            {
              CFArrayRemoveValueAtIndex(theArray, v27);
              int v39 = --v72;
LABEL_44:
              if (v27 < v39) {
                continue;
              }
              goto LABEL_84;
            }
            LODWORD(v28) = v27;
            goto LABEL_42;
          }
          break;
        }
        uint64_t v40 = *v13 + 1072 * v77;
        if ((*(unsigned char *)(v40 + 996) & 0x10) != 0)
        {
LABEL_43:
          int v27 = v28 + 1;
          int v39 = v72;
          goto LABEL_44;
        }
        uint64_t v41 = *((void *)&v79[0] + 1);
        uint64_t v66 = *v13;
        unsigned int v60 = v77;
        unsigned int v62 = (unsigned __int16)v77;
        long long v58 = (_DWORD *)(v40 + 528);
        if (!strncasecmp((const char *)(v40 + 576), (const char *)v80, 0x20uLL))
        {
          int v43 = HIDWORD(v41);
          int theDicta = v58[21];
          int v56 = v58[3];
          CFDictionaryRef v57 = a4;
          if (HIDWORD(v41))
          {
            signed __int16 v44 = v62;
            unsigned int v45 = v41;
          }
          else
          {
            if ((int)(v60 + 1) >= *(unsigned __int16 *)(v66 + 522))
            {
              int v48 = *(_DWORD *)(v66 + 4);
            }
            else
            {
              uint64_t v47 = v66 + 1072 * (int)(v60 + 1);
              int v48 = *(_DWORD *)(v47 + 536);
              if (*(_WORD *)(v47 + 1082) == 24320) {
                v48 += *(_DWORD *)(v47 + 540);
              }
            }
            HIDWORD(v79[0]) = (v48 - v58[2]) / a3 * a3;
            CFNumberRef v49 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
            CFDictionarySetValue(v30, @"Size", v49);
            CFRelease(v49);
            unsigned int v45 = DWORD2(v79[0]);
            int v43 = HIDWORD(v79[0]);
            signed __int16 v44 = v77;
          }
          unsigned int v38 = SValidate(v13, v45, v43, v44);
          unsigned int UUID = v38;
          if (!v38)
          {
            unsigned int v50 = v58[3];
            unsigned int v51 = HIDWORD(v79[0]);
            int v52 = v50 - HIDWORD(v79[0]);
            if (v50 < HIDWORD(v79[0])) {
              int v52 = 0;
            }
            int v59 = DWORD2(v79[0]);
            int v61 = v52;
            if (theDicta == v56)
            {
              CFNumberRef v53 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
              CFDictionarySetValue(v30, @"Logical Size", v53);
              CFRelease(v53);
            }
            unsigned int UUID = PMPrimaryInfoUpdate(v30, *(__int16 *)(v66 + 514), v31, v58, 0);
            unsigned int v38 = PMSecondaryInfoUpdate(v30, v31, (uint64_t)v58, 0);
            unsigned int UUID = v38;
            if (v51 < v50)
            {
              __int16 v54 = v77 + 1;
              if (*(unsigned __int16 *)(v66 + 522) > (__int16)(v77 + 1)
                && *(_WORD *)(v66 + 1072 * v54 + 1082) == 24320)
              {
                uint64_t v55 = v66 + 1072 * v54;
                *(_DWORD *)(v55 + 536) -= v61;
                *(_DWORD *)(v55 + 540) += v61;
                unsigned int v38 = UUID;
              }
              else
              {
                unsigned int v38 = PMGenPartitionType((const void **)v13, 24320, v59 + v51, v61, *(unsigned __int16 *)(v66 + 2), 0x200000, 0, 0, v77);
                unsigned int UUID = v38;
              }
            }
            a4 = v57;
          }
        }
        else
        {
          if ((v36 & 0x20000000) != 0)
          {
            unsigned int v42 = v62;
          }
          else
          {
            unsigned int UUID = MKPurgeLoader(v71, cf, (const void **)v13, v60, 0, theArray, v28, &v76);
            if (UUID) {
              goto LABEL_84;
            }
            LODWORD(v28) = v28 + (v76 >> 31);
            v72 -= v76 != 0;
            unsigned int v38 = PMGuidSearch((uint64_t)v13, v82, &v77);
            unsigned int UUID = v38;
            if (v38) {
              goto LABEL_42;
            }
            unsigned int v42 = (unsigned __int16)v77;
          }
          unsigned int v38 = PMRemovePartition((const void **)v13, v42, 0);
          unsigned int UUID = v38;
          if (!v38)
          {
            CFMutableDictionaryRef Mutable = theDict;
            if (!theDict)
            {
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionaryAddValue(v30, @"Options", Mutable);
              CFRelease(Mutable);
            }
            CFDictionarySetValue(Mutable, @"Retain existing content", value);
            goto LABEL_41;
          }
        }
LABEL_42:
        if (v38) {
          goto LABEL_84;
        }
        goto LABEL_43;
      }
LABEL_84:
      if (cf) {
        CFRelease(cf);
      }
      if (v71) {
        CFRelease(v71);
      }
      return UUID;
    }
  }
  return result;
}

uint64_t PMGuidSearch(uint64_t a1, void *a2, _WORD *a3)
{
  *a3 = 0x8000;
  if (a1)
  {
    if (*(_WORD *)(*(void *)a1 + 522))
    {
      uint64_t v3 = 0;
      for (i = (void *)(*(void *)a1 + 976); *a2 != *i || a2[1] != i[1]; i += 134)
      {
        if (*(unsigned __int16 *)(*(void *)a1 + 522) == ++v3) {
          return -5343;
        }
      }
      __int16 v6 = 0;
      *a3 = v3;
    }
    else
    {
      return -5343;
    }
  }
  else
  {
    return 22;
  }
  return v6;
}

uint64_t MKPurgeLoaders(__CFBundle *a1, uint64_t *a2, BOOL *a3)
{
  int v5 = a1;
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v42 = 0;
  long long v41 = 0u;
  memset(v40, 0, sizeof(v40));
  unsigned int v39 = 22;
  __int16 v6 = a1;
  memset(v38, 0, sizeof(v38));
  if (!a1)
  {
    __int16 v6 = MKAccessLibrary(0);
    if (!v6)
    {
      int v12 = 0;
      goto LABEL_58;
    }
  }
  CFURLRef v7 = MKLoadDB(v6, @"database", (int *)&v39);
  if (!v7)
  {
    int v12 = 0;
    if (!v5) {
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  CFURLRef v8 = v7;
  CFURLRef v9 = MKLoadDB(v6, @"inventory", (int *)&v39);
  if (!v9)
  {
    int v12 = 0;
    CFDictionaryRef v28 = v8;
    goto LABEL_56;
  }
  CFDictionaryRef theDict = v9;
  CFDictionaryRef cf = v8;
  unsigned int v31 = v6;
  unsigned int v32 = v5;
  uint64_t v10 = *a2;
  if (!*(_WORD *)(*a2 + 522))
  {
    int v12 = 0;
    goto LABEL_55;
  }
  int v11 = 0;
  int v12 = 0;
  while (1)
  {
    uint64_t v13 = v10 + 1072 * v11;
    if (PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v13 + 1082)) != 2) {
      goto LABEL_46;
    }
    unsigned int v39 = MKGetPartitionRequisites(cf, *(__int16 *)(v10 + 514), (const char *)(v10 + 1072 * v11 + 576), *(unsigned __int16 *)(v13 + 1082), v38);
    if (v39) {
      goto LABEL_55;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Loaders");
    if (!Value) {
      break;
    }
    if (*(_WORD *)v38)
    {
      unsigned int v14 = 0;
      unsigned int v15 = &v38[2];
      while (1)
      {
        CFStringRef v16 = CFStringCreateWithCString(0, v15, 0);
        CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(Value, v16);
        CFRelease(v16);
        if (!v17)
        {
          unsigned int v29 = -415;
          goto LABEL_54;
        }
        unsigned int v39 = MKGetPartitionInfo(v17, *(__int16 *)(v10 + 514), (uint64_t)v40);
        if (v39) {
          goto LABEL_55;
        }
        int v18 = *((unsigned __int16 *)v15 + 17);
        if (v18 == 1) {
          break;
        }
        if (v18 == 6)
        {
          int v19 = v11 + 1;
          if (v11 + 1 < *(unsigned __int16 *)(v10 + 522))
          {
            int v35 = 0;
            int v20 = v11;
            while (1)
            {
              uint64_t v21 = v10 + 1072 * v19;
              int v22 = PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v21 + 1082));
              if (v22 != 4)
              {
                int v20 = v19;
                if (v22 == 2) {
                  goto LABEL_42;
                }
                goto LABEL_26;
              }
              uint64_t v23 = v21 + 528;
              if (!strcasecmp((const char *)(v23 + 48), (const char *)&v40[2] + 1)
                && *(_DWORD *)(v23 + 12) == DWORD2(v41))
              {
                if (!v35)
                {
                  int v35 = 1;
                  int v20 = v19;
                  goto LABEL_26;
                }
                ++v35;
              }
              unsigned int v39 = PMSetTypeExtended(v23, 24320, *(__int16 *)(v10 + 514), &unk_21E15F94E);
              *(_DWORD *)(v10 + 1072 * v19 + 996) &= ~0x20u;
              ++v12;
LABEL_26:
              int v19 = v20 + 1;
              if (v20 + 1 >= *(unsigned __int16 *)(v10 + 522)) {
                goto LABEL_42;
              }
            }
          }
          goto LABEL_42;
        }
LABEL_43:
        ++v14;
        v15 += 38;
        if (v14 >= *(unsigned __int16 *)v38) {
          goto LABEL_46;
        }
      }
      if (v11 < 2)
      {
LABEL_42:
        if (v39) {
          goto LABEL_55;
        }
        goto LABEL_43;
      }
      int v36 = 0;
      int v24 = v11;
      while (1)
      {
        uint64_t v25 = v10 + 1072 * (v24 - 1);
        int v26 = PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v25 + 1082));
        if (v26 != 4)
        {
          --v24;
          if (v26 == 2) {
            goto LABEL_42;
          }
          goto LABEL_39;
        }
        uint64_t v27 = v25 + 528;
        if (!strcasecmp((const char *)(v27 + 48), (const char *)&v40[2] + 1) && *(_DWORD *)(v27 + 12) == DWORD2(v41))
        {
          if (!v36)
          {
            int v36 = 1;
            --v24;
            goto LABEL_39;
          }
          ++v36;
        }
        unsigned int v39 = PMSetTypeExtended(v27, 24320, *(__int16 *)(v10 + 514), &unk_21E15F94E);
        *(_DWORD *)(v10 + 1072 * (v24 - 1) + 996) &= ~0x20u;
        --v11;
        ++v12;
LABEL_39:
        if (v24 <= 1) {
          goto LABEL_42;
        }
      }
    }
    if (v39) {
      goto LABEL_55;
    }
LABEL_46:
    if (++v11 >= *(unsigned __int16 *)(v10 + 522)) {
      goto LABEL_55;
    }
  }
  unsigned int v29 = -417;
LABEL_54:
  unsigned int v39 = v29;
LABEL_55:
  CFRelease(cf);
  int v5 = v32;
  __int16 v6 = v31;
  CFDictionaryRef v28 = theDict;
LABEL_56:
  CFRelease(v28);
  if (!v5) {
LABEL_57:
  }
    CFRelease(v6);
LABEL_58:
  if (a3) {
    *a3 = v12 != 0;
  }
  uint64_t result = v39;
  if (v39 == -1) {
    return *__error();
  }
  return result;
}

uint64_t MKMediaUpdateExtended(uint64_t *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, char a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t), _WORD *a8)
{
  unsigned int v9 = 0;
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int v40 = 22;
  if (!a1)
  {
    __int16 v11 = 0;
    goto LABEL_41;
  }
  __int16 v11 = 0;
  if (!a2) {
    goto LABEL_41;
  }
  unsigned int v40 = -43;
  unsigned int v14 = a3;
  if (a3 || (unsigned int v14 = MKAccessLibrary(0)) != 0)
  {
    CFDictionaryRef v15 = MKLoadDB(v14, @"inventory", (int *)&v40);
    CFDictionaryRef v16 = v15;
    unsigned int v32 = a3;
    uint64_t v33 = a8;
    if (v15)
    {
      unsigned int v40 = 0;
      CFDictionaryRef theDict = (const __CFDictionary *)CFDictionaryGetValue(v15, @"Drivers");
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"Patches");
      uint64_t v18 = *a1;
      if (*(_WORD *)(*a1 + 522))
      {
        uint64_t v19 = 0;
        __int16 v11 = 0;
        unsigned int v9 = 0;
        CFArrayRef v31 = Value;
        BOOL v21 = (a5 & 1) == 0 || Value == 0;
        BOOL v34 = v21;
        uint64_t v22 = v18 + 576;
        uint64_t v24 = a6;
        uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
        while (1)
        {
          int v25 = *(unsigned __int16 *)(v22 + 506);
          if (v25 == 14336)
          {
            if ((a5 & 2) == 0) {
              goto LABEL_27;
            }
            unsigned int v26 = MKUpdateLoader(a1, (__int16)v19, v14, v16, v24, v23);
          }
          else
          {
            if (v25 == 12544)
            {
              if (!v34)
              {
                unsigned int v26 = RebuildPatches(a1, (__int16)v19, v16, v31, v14, a4, v24, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))v23);
                unsigned int v40 = v26;
                if (v26) {
                  goto LABEL_28;
                }
                goto LABEL_29;
              }
LABEL_27:
              unsigned int v26 = v40;
              if (v40)
              {
LABEL_28:
                if (v26 != -1306) {
                  goto LABEL_34;
                }
                goto LABEL_29;
              }
              goto LABEL_29;
            }
            if (!theDict || !PMDrvrIdentify((char *)v22)) {
              goto LABEL_27;
            }
            OSType2Ascii(*(unsigned int *)(v22 + 88), v41, 2);
            CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"%s.%s", v22, v41);
            CFDictionaryRef v28 = (const __CFDictionary *)CFDictionaryGetValue(theDict, v27);
            CFRelease(v27);
            if (!v28)
            {
              unsigned int v9 = -415;
              uint64_t v24 = a6;
              uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
              goto LABEL_30;
            }
            CFDictionaryRef v29 = v28;
            uint64_t v24 = a6;
            uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
            unsigned int v26 = MKBuildDriver((Ptr *)a1, v29, v14, a4, a6, a7);
          }
          unsigned int v40 = v26;
          if (v26) {
            goto LABEL_28;
          }
          ++v11;
LABEL_29:
          unsigned int v40 = 0;
LABEL_30:
          v22 += 1072;
          if (++v19 >= (unint64_t)*(unsigned __int16 *)(v18 + 522)) {
            goto LABEL_34;
          }
        }
      }
    }
    unsigned int v9 = 0;
    __int16 v11 = 0;
LABEL_34:
    if (!v32 && v14) {
      CFRelease(v14);
    }
    a8 = v33;
    if (v16)
    {
      CFRelease(v16);
      if (!v33) {
        goto LABEL_43;
      }
LABEL_42:
      *a8 = v11;
      goto LABEL_43;
    }
LABEL_41:
    if (!a8) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  unsigned int v9 = 0;
  __int16 v11 = 0;
  if (a8) {
    goto LABEL_42;
  }
LABEL_43:
  if (v40) {
    return v40;
  }
  else {
    return v9;
  }
}

uint64_t APMWriteMedia(Handle h, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  uint64_t v184 = *MEMORY[0x263EF8340];
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v127 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v120 = 0u;
  if (!h) {
    return -109;
  }
  uint64_t v183 = 0;
  long long v181 = 0uLL;
  long long v182 = 0uLL;
  long long v179 = 0uLL;
  long long v180 = 0uLL;
  long long v177 = 0uLL;
  long long v178 = 0uLL;
  long long v175 = 0uLL;
  long long v176 = 0uLL;
  long long v173 = 0uLL;
  long long v174 = 0uLL;
  long long v171 = 0uLL;
  long long v172 = 0uLL;
  long long v169 = 0uLL;
  long long v170 = 0uLL;
  long long v167 = 0uLL;
  long long v168 = 0uLL;
  long long v165 = 0uLL;
  long long v166 = 0uLL;
  long long v163 = 0uLL;
  long long v164 = 0uLL;
  long long v161 = 0uLL;
  long long v162 = 0uLL;
  long long v159 = 0uLL;
  long long v160 = 0uLL;
  long long v157 = 0uLL;
  long long v158 = 0uLL;
  long long v155 = 0uLL;
  long long v156 = 0uLL;
  long long v153 = 0uLL;
  long long v154 = 0uLL;
  long long v152 = 0uLL;
  uint64_t v118 = 0;
  v119[0] = 0;
  if (a2 == 0xFFFF) {
    unsigned int v5 = 16;
  }
  else {
    unsigned int v5 = a2;
  }
  v119[1] = 0;
  if ((v5 & 0x100) != 0)
  {
    SInt8 v8 = 0;
    goto LABEL_11;
  }
  SInt8 v8 = HGetState(h);
  Ptr v9 = *h;
  unsigned int v10 = *((unsigned __int16 *)*h + 257);
  if (!*((_WORD *)*h + 257))
  {
    unsigned int v10 = 1;
    *((_WORD *)v9 + 257) = 1;
    goto LABEL_13;
  }
  if (v10 > 3)
  {
LABEL_11:
    __int16 v11 = -50;
    goto LABEL_17;
  }
LABEL_13:
  char v12 = v9[516];
  int v13 = a4(a3, 15, 0, 0, 0, (Ptr)&v118);
  if (v13)
  {
    __int16 v11 = v13;
    goto LABEL_17;
  }
  SInt8 v117 = v8;
  unsigned __int16 v14 = WORD2(v118);
  MKScaleGeometry(v119, (int *)&v118 + 1);
  PMSortMapII(h, 0);
  int v15 = VRebuildFreespace((const void **)h, v5, (uint64_t)&v118);
  if (v15)
  {
    __int16 v11 = v15;
    SInt8 v8 = v117;
    goto LABEL_17;
  }
  int v17 = v12 & 1;
  uint64_t v18 = (unsigned __int16 *)*h;
  v18[250] = v14 >> 9;
  unsigned int v19 = v18[1];
  unsigned int v20 = v18[259];
  int v21 = v18[261];
  if (v18[261])
  {
    unsigned __int16 v22 = 0;
    int v23 = 0;
    unsigned __int16 v24 = 0;
    __int16 v25 = 0;
    SInt8 v8 = v117;
    while (1)
    {
      unsigned int v26 = &v18[536 * v25];
      unint64_t v27 = *((unsigned int *)v26 + 154);
      if (v12)
      {
        int v28 = byte_21E15F0F8[(v27 >> 24) & 3];
        if (v28 == 2)
        {
          ++v22;
          goto LABEL_24;
        }
        if (v28 == 1)
        {
          ++v23;
          goto LABEL_24;
        }
        if (v28) {
          goto LABEL_24;
        }
      }
      else
      {
        *((_DWORD *)v26 + 154) = v27 & 0xFCFFFFFF;
      }
      ++v24;
LABEL_24:
      if (v21 <= ++v25) {
        goto LABEL_33;
      }
    }
  }
  unsigned __int16 v24 = 0;
  LOWORD(v23) = 0;
  unsigned __int16 v22 = 0;
  SInt8 v8 = v117;
LABEL_33:
  unsigned int v29 = v20 >> 9;
  if ((v12 & 1) == 0)
  {
    if (v18[260] >= v24)
    {
      unsigned int v113 = v20 >> 9;
      unsigned int v114 = 0;
      int v43 = 0;
      BOOL v104 = 0;
      unsigned int v107 = v20 >> 9;
      goto LABEL_62;
    }
LABEL_60:
    __int16 v11 = -5341;
    goto LABEL_17;
  }
  if (v29 != 4 && v29 != 1)
  {
    __int16 v11 = -5319;
    goto LABEL_17;
  }
  if (v29 == 1) {
    unsigned int v30 = 4;
  }
  else {
    unsigned int v30 = 1;
  }
  if (v30 >= v29) {
    unsigned int v31 = v29;
  }
  else {
    unsigned int v31 = v30;
  }
  unsigned int v113 = v31;
  if (v30 <= v29) {
    unsigned int v32 = v29;
  }
  else {
    unsigned int v32 = v30;
  }
  BOOL v104 = v10 < 2;
  unsigned __int16 v33 = v23 + v24;
  unsigned __int16 v34 = v22 + v23;
  int v35 = ((unsigned __int16)(v23 + v24) - 1) / (int)(v32 - 1);
  unsigned __int16 v36 = v23 + v24 + v35;
  unsigned __int16 v37 = v22 + v23 + v35;
  BOOL v49 = (__int16)(v35 - v23) < 1;
  unsigned __int16 v38 = v24 + v35;
  unsigned __int16 v39 = v22 + v35;
  if (v49)
  {
    unsigned __int16 v38 = v33;
    unsigned __int16 v40 = v34;
  }
  else
  {
    unsigned __int16 v40 = v39;
  }
  if (v10 <= 1) {
    unsigned __int16 v24 = v38;
  }
  else {
    unsigned __int16 v24 = v36;
  }
  if (v10 <= 1) {
    unsigned __int16 v22 = v40;
  }
  else {
    unsigned __int16 v22 = v37;
  }
  unsigned int v41 = v24 + 1;
  if (v41 % v32) {
    int v42 = v41 / v32 + 1;
  }
  else {
    int v42 = v41 / v32;
  }
  if (v18[260] < v22) {
    goto LABEL_60;
  }
  unsigned int v114 = v32;
  unsigned int v107 = v29;
  int v43 = v42 - 1;
LABEL_62:
  unsigned int v99 = v19;
  int v103 = v17;
  unsigned __int16 v106 = v22;
  HLock(h);
  Ptr v44 = *h;
  Ptr v111 = *h;
  if (!*((_WORD *)*h + 261))
  {
    unsigned int v45 = 0;
    int v112 = 0;
    goto LABEL_110;
  }
  int v115 = v43;
  unsigned int v45 = 0;
  int v112 = 0;
  uint64_t v46 = 0;
  __int16 v47 = 0;
  int v100 = v24;
  signed int v48 = v114;
  if (v103) {
    BOOL v49 = v114 > 1;
  }
  else {
    BOOL v49 = 0;
  }
  int v50 = v49;
  int v102 = v50;
  unsigned __int16 v101 = v24;
  v109 = a4;
  while (1)
  {
    unsigned int v51 = &v44[1072 * v47];
    int v52 = v51 + 1032;
    *((_DWORD *)v51 + 258) = -1;
    int v53 = *((unsigned __int16 *)v51 + 541);
    unint64_t v54 = *((unsigned int *)v51 + 154);
    int v55 = byte_21E15F0F8[(v54 >> 24) & 3];
    if (v55 == 2)
    {
      *int v52 = ++v115 * v48 - 1;
    }
    else
    {
      int v56 = v51 + 1034;
      if (v55 == 1)
      {
        if (v104 && (v53 != 4097 ? (BOOL v59 = (__int16)((v112 + 1) * v48 - 1) < v100) : (BOOL v59 = 0), v59))
        {
          *int v56 = ++v112 * v48 - 1;
        }
        else
        {
          uint64_t v60 = (v46 + 1);
          __int16 v61 = (v46 + 1) * v113 - 1;
          if (v48 >= 2 && !((v61 + 1) % v48))
          {
            uint64_t v60 = (v46 + 2);
            __int16 v61 = (v46 + 2) * v113 - 1;
          }
          *int v56 = v61;
          *int v52 = ++v115 * v48 - 1;
          uint64_t v46 = v60;
        }
      }
      else if (!byte_21E15F0F8[(v54 >> 24) & 3])
      {
        uint64_t v57 = (v46 + 1);
        __int16 v58 = (v46 + 1) * v113 - 1;
        if (v102 && !((v58 + 1) % v48))
        {
          uint64_t v57 = (v46 + 2);
          __int16 v58 = (v46 + 2) * v113 - 1;
        }
        *int v56 = v58;
        uint64_t v46 = v57;
      }
    }
    if ((v54 & 0x100000) == 0 || v53 == 4097) {
      goto LABEL_106;
    }
    if (!v45) {
      break;
    }
    int v62 = *v45;
LABEL_95:
    int v64 = v45[1];
    int v65 = v64 + 1;
    if (v64 + 1 >= v62)
    {
      uint64_t v66 = v46;
      int v67 = v62 + 32;
      uint64_t v68 = v45;
      unsigned int v45 = (int *)malloc_type_realloc(v45, 8 * (v62 + 32) + 8, 0x786A645AuLL);
      if (!v45) {
        goto LABEL_172;
      }
      *unsigned int v45 = v67;
      int v64 = v45[1];
      int v65 = v64 + 1;
      unsigned __int16 v24 = v101;
      signed int v48 = v114;
      uint64_t v46 = v66;
      a4 = v109;
      Ptr v44 = v111;
    }
    v45[1] = v65;
    uint64_t v69 = &v45[2 * v64];
    unsigned int v70 = *((_DWORD *)v51 + 135);
    if (v70 >= 0xC8) {
      int v71 = 200;
    }
    else {
      int v71 = *((_DWORD *)v51 + 135);
    }
    v69[3] = v71;
    int v72 = *((_DWORD *)v51 + 134);
    v69[2] = v72;
    if (v70 >= 0xC9)
    {
      v45[1] = v64 + 2;
      long long v73 = &v45[2 * v65];
      if (v70 - 200 >= 0xC8) {
        int v74 = 200;
      }
      else {
        int v74 = v70 - 200;
      }
      v73[2] = v72 + v70 - v74;
      v73[3] = v74;
    }
LABEL_106:
    if (*((unsigned __int16 *)v44 + 261) <= ++v47) {
      goto LABEL_110;
    }
  }
  uint64_t v63 = v46;
  unsigned int v45 = (int *)malloc_type_calloc(1uLL, 0x108uLL, 0x467D371FuLL);
  if (v45)
  {
    int v62 = 32;
    *unsigned int v45 = 32;
    signed int v48 = v114;
    uint64_t v46 = v63;
    a4 = v109;
    goto LABEL_95;
  }
  uint64_t v68 = 0;
LABEL_172:
  int v75 = *__error();
  if ((_WORD)v75)
  {
    __int16 v77 = 0;
    SInt8 v8 = v117;
    goto LABEL_178;
  }
  unsigned int v45 = v68;
  unsigned __int16 v24 = v101;
  a4 = v109;
  Ptr v44 = v111;
LABEL_110:
  int64_t v98 = v45;
  if ((v5 & 0x20000) != 0) {
    APMDDMGenerate(v44, v103, v99 >> 9, v107);
  }
  PMDDMNormalise((uint64_t)h, v99 >> 9, v107);
  int v75 = a4(a3, 4, 512, 0, (__int16)(*((_WORD *)v44 + 260) - ((v5 & 0x8000000) >> 27)), 0);
  SInt8 v8 = v117;
  unsigned __int16 v76 = v106;
  if (v75)
  {
    __int16 v77 = 0;
    uint64_t v68 = v98;
  }
  else
  {
    int v105 = v99 >> 9;
    if ((v5 & 0x8000000) == 0) {
      a4(a3, 4, WORD2(v118), (LODWORD(v119[0]) - 1), 1, 0);
    }
    if (*((_WORD *)v44 + 261))
    {
      __int16 v78 = 0;
      __int16 v97 = 0;
      while (1)
      {
        int v116 = v78;
        unint64_t v79 = &v44[1072 * v78];
        int v80 = *((unsigned __int16 *)v79 + 541);
        int v110 = *((_DWORD *)v79 + 154);
        *((_DWORD *)v79 + 249) &= ~0x10u;
        apmirec2xrec((uint64_t)(v79 + 528), (uint64_t)&v152);
        if (v80 == 4097 && (BYTE10(v157) & 0x80) != 0) {
          HIDWORD(v183) = 1297238867;
        }
        strclean(&v153, 0x20uLL, 0);
        strclean(&v155, 0x20uLL, 0);
        strclean((unsigned char *)&v159 + 8, 0x10uLL, 0);
        int v81 = *(unsigned __int16 *)&v44[1072 * v116 + 1034];
        if ((v81 & 0x8000) != 0)
        {
          unsigned int v83 = v99 >> 9;
        }
        else
        {
          unsigned int v108 = v81 + 1;
          if (v103) {
            BOOL v82 = (unsigned __int16)(v81 + 1) % v114 == 0;
          }
          else {
            BOOL v82 = 0;
          }
          unsigned int v83 = DiskBlockFactor(v10, v82, v80, v113, v114, v107);
          APMConvertBlocking(&v152, v80, v105, v83);
          if (v80 == 12544 && ((v110 & 0x1000000) == 0 || v83 == v107)) {
            __int16 v97 = PMPTCHQuantify((uint64_t)&v152, v83, v83, a3, a4);
          }
          DWORD1(v152) = v24;
          if (*(void *)&v44[1072 * v116 + 968]) {
            int v84 = *(char **)&v44[1072 * v116 + 968];
          }
          else {
            int v84 = (char *)&v120;
          }
          PMRecord_NtoB((uint64_t)v84, (uint64_t)&v152);
          int v75 = a4(a3, 3, 512, v108, 1, v84);
          if (v75)
          {
            SInt8 v8 = v117;
            goto LABEL_176;
          }
          unsigned __int16 v76 = v106;
        }
        int v85 = *(__int16 *)&v44[1072 * v116 + 1032];
        if (v85 < 0)
        {
          SInt8 v8 = v117;
          Ptr v44 = v111;
        }
        else
        {
          if (v80 == 24320 && v10 == 1) {
            unsigned int v87 = v113;
          }
          else {
            unsigned int v87 = v114;
          }
          APMConvertBlocking(&v152, v80, v83, v87);
          if (v80 == 12544)
          {
            SInt8 v8 = v117;
            if ((v110 & 0x1000000) == 0 || v87 == v107) {
              __int16 v97 = PMPTCHQuantify((uint64_t)&v152, v87, v87, a3, a4);
            }
          }
          else
          {
            SInt8 v8 = v117;
          }
          uint64_t v88 = (unsigned __int16)v85 + 1;
          DWORD1(v152) = v106;
          Ptr v44 = v111;
          if (*(void *)&v111[1072 * v116 + 968]) {
            long long v89 = *(char **)&v111[1072 * v116 + 968];
          }
          else {
            long long v89 = (char *)&v120;
          }
          PMRecord_NtoB((uint64_t)v89, (uint64_t)&v152);
          int v75 = a4(a3, 3, 512, v88, 1, v89);
          if (v75) {
            goto LABEL_176;
          }
          unsigned __int16 v76 = v106;
        }
        __int16 v78 = v116 + 1;
        if (*((unsigned __int16 *)v44 + 261) <= (__int16)(v116 + 1)) {
          goto LABEL_156;
        }
      }
    }
    __int16 v97 = 0;
LABEL_156:
    if (v103)
    {
      uint64_t v183 = 0;
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      int v90 = v24;
      int v91 = v76;
      long long v152 = 0u;
      if (v76 <= v24) {
        int v91 = v24;
      }
      DWORD1(v152) = v91;
      strncpypad(&v155, "Apple_Free", 0x20uLL, 0);
      while (1)
      {
        int v92 = (__int16)(++v112 * v114 - 1);
        if (v92 >= v90) {
          break;
        }
        PMRecord_NtoB((uint64_t)&v120, (uint64_t)&v152);
        int v75 = a4(a3, 3, 512, (v92 + 1), 1, (Ptr)&v120);
        if (v75) {
          goto LABEL_176;
        }
      }
    }
    uint64_t v68 = v98;
    if (v98 && v98[1] >= 1)
    {
      int v93 = 0;
      uint64_t v94 = 2;
      while (1)
      {
        int v75 = a4(a3, 4, (unsigned __int16)v99 & 0xFE00, v98[v94], v98[v94 + 1], 0);
        if (v75) {
          break;
        }
        ++v93;
        v94 += 2;
        if (v93 >= v98[1]) {
          goto LABEL_168;
        }
      }
    }
    else
    {
LABEL_168:
      int v95 = *((unsigned __int16 *)v111 + 259);
      if (*((unsigned __int16 *)v111 + 1) != v95)
      {
        *((_DWORD *)v111 + 1) = *((_DWORD *)v111 + 1) * v105 / v107;
        *((_WORD *)v111 + 1) = v95;
      }
      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v127 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v120 = 0u;
      DDMRecord_NtoB((uint64_t)&v120, (unsigned __int16 *)v111);
      LOWORD(v75) = a4(a3, 3, 512, 0, 1, (Ptr)&v120);
LABEL_176:
      uint64_t v68 = v98;
    }
    __int16 v77 = v97;
  }
LABEL_178:
  if ((_WORD)v75) {
    BOOL v96 = 1;
  }
  else {
    BOOL v96 = v77 == 0;
  }
  if (v96) {
    __int16 v11 = v75;
  }
  else {
    __int16 v11 = v77;
  }
  if (v68) {
    free(v68);
  }
LABEL_17:
  HSetState(h, v8);
  return v11;
}

uint64_t VRebuildFreespace(const void **a1, unsigned int a2, uint64_t a3)
{
  if (!a1)
  {
    LOWORD(v9) = -109;
    return (__int16)v9;
  }
  PMDeleteRecords(a1, word_21E15F690);
  PMSortMapII((Ptr *)a1, 0);
  unsigned int v6 = *((unsigned __int16 *)*a1 + 258);
  BOOL v7 = (a2 & 0x4000) == 0;
  int v8 = v7 & v6;
  if ((a2 & 0x10) != 0)
  {
    int v9 = PMAccountFreespace(a1, v7 & v6, a2);
    if (v9) {
      return (__int16)v9;
    }
  }
  return DeviceAdjustSpace(a1, v8, a3, a2);
}

uint64_t PMDeleteRecords(const void **a1, _WORD *a2)
{
  unsigned __int16 v4 = 0;
  unsigned __int16 v5 = 0;
  unsigned int v6 = a2 + 1;
  while (*((unsigned __int16 *)*a1 + 261) > v5)
  {
    unsigned int v7 = (unsigned __int16)*a2;
    if (!*a2) {
      goto LABEL_9;
    }
    unsigned int v8 = 0;
    int v9 = v6;
    while (*((unsigned __int16 *)*a1 + 536 * v5 + 541) != *v9)
    {
      ++v8;
      ++v9;
      if (v8 >= v7)
      {
        unsigned int v7 = 0;
        goto LABEL_9;
      }
    }
    unsigned int v7 = (unsigned __int16)delentry(a1, 528, 0x20Au, v5, 1072);
    if (!v7)
    {
      ++v4;
    }
    else
    {
LABEL_9:
      ++v5;
      if (v7) {
        return v4;
      }
    }
  }
  return v4;
}

uint64_t DeviceAdjustSpace(const void **a1, int a2, uint64_t a3, int a4)
{
  if ((a4 & 0x40000008) != 0)
  {
    if (a1)
    {
      int v6 = *(_DWORD *)(a3 + 4);
      unsigned int v7 = *(_DWORD *)(a3 + 8);
      unsigned int v8 = *a1;
      unsigned int v9 = *((unsigned __int16 *)*a1 + 1);
      if ((_WORD)v6) {
        BOOL v10 = v9 == (unsigned __int16)*(_DWORD *)(a3 + 4);
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        unsigned int v7 = ((unsigned __int16)v6 >> 9) * v7 / (v9 >> 9);
      }
      if ((a4 & 8) != 0)
      {
        unsigned __int16 v13 = v8[261];
        while (1)
        {
          if (!--v13) {
            goto LABEL_9;
          }
          unsigned __int16 v14 = (char *)&v8[536 * v13];
          unsigned int v15 = *((_DWORD *)v14 + 134);
          unsigned int v16 = *((_DWORD *)v14 + 135) + v15;
          if (v7 == v16) {
            goto LABEL_9;
          }
          int v17 = v14 + 528;
          int v18 = (unsigned __int16)v8[536 * v13 + 541];
          if (v7 > v16) {
            break;
          }
          BOOL v19 = v7 >= v15;
          unsigned int v20 = v7 - v15;
          if (v20 != 0 && v19)
          {
            if (v18 == 24320)
            {
              __int16 v11 = 0;
              goto LABEL_26;
            }
            __int16 v11 = 0;
            unsigned int v7 = v16;
            goto LABEL_10;
          }
          if (v18 != 24320) {
            goto LABEL_9;
          }
          __int16 v11 = delentry(a1, 528, 0x20Au, v13, 1072);
          unsigned int v8 = *a1;
          if (v11) {
            goto LABEL_10;
          }
        }
        if (v18 == 24320)
        {
          __int16 v11 = 0;
          unsigned int v20 = v7 - v15;
LABEL_26:
          *((_DWORD *)v17 + 3) = v20;
          goto LABEL_10;
        }
        __int16 v11 = PMGenPartitionType(a1, 24320, v16, v7 - v16, 0, (a2 << 24) | 0x200000u, 0, 0, 0xFFFFu);
        unsigned int v8 = *a1;
      }
      else
      {
LABEL_9:
        __int16 v11 = 0;
      }
LABEL_10:
      *((_DWORD *)v8 + 1) = v7;
    }
    else
    {
      return -50;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

uint64_t PMDDMNormalise(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 != a3)
  {
    unsigned int v3 = *(unsigned __int16 *)(*(void *)result + 16);
    if (*(_WORD *)(*(void *)result + 16))
    {
      unsigned int v4 = 0;
      unsigned __int16 v5 = (unsigned int *)(*(void *)result + 18);
      do
      {
        unint64_t v6 = *v5 * (unint64_t)a2;
        unsigned int v7 = *((unsigned __int16 *)v5 + 2) * a2;
        if (v6 % a3) {
          unsigned int v8 = v6 / a3 + 1;
        }
        else {
          unsigned int v8 = v6 / a3;
        }
        *unsigned __int16 v5 = v8;
        int v9 = v7 / a3;
        if (v7 % a3) {
          LOWORD(v9) = v9 + 1;
        }
        *((_WORD *)v5 + 2) = v9;
        ++v4;
        v5 += 2;
      }
      while (v4 < v3);
    }
  }
  return result;
}

unsigned char *strclean(unsigned char *a1, unint64_t a2, int __c)
{
  unsigned int v3 = a1;
  unint64_t v4 = 0;
  if (*a1) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    do
    {
      unint64_t v6 = &a1[v4++];
      if (v6[1]) {
        BOOL v7 = v4 >= a2;
      }
      else {
        BOOL v7 = 1;
      }
    }
    while (!v7);
    a1 += v4;
  }
  BOOL v7 = a2 >= v4;
  size_t v8 = a2 - v4;
  if (v8 != 0 && v7) {
    memset(a1, __c, v8);
  }
  return v3;
}

uint64_t DiskBlockFactor(int a1, int a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  if (a3 == 0x4000) {
    unsigned int v6 = a4;
  }
  else {
    unsigned int v6 = a6;
  }
  if (a3 == 24320) {
    unsigned int v6 = a4;
  }
  if (a3 == 4097) {
    unsigned int v7 = a4;
  }
  else {
    unsigned int v7 = v6;
  }
  if (a2) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = a4;
  }
  if (a2 != 1) {
    unsigned int v7 = v8;
  }
  if (a2 == 2) {
    unsigned int v7 = a5;
  }
  if (a3 == 24320) {
    unsigned int v9 = a4;
  }
  else {
    unsigned int v9 = a5;
  }
  if (a3 == 0x4000) {
    unsigned int v10 = a4;
  }
  else {
    unsigned int v10 = a6;
  }
  if (a2) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = a4;
  }
  if (a2 != 1) {
    unsigned int v10 = v11;
  }
  if (a2 != 2) {
    unsigned int v9 = v10;
  }
  if (a2) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = a4;
  }
  if (a2 == 1) {
    unsigned int v12 = a6;
  }
  if (a2 == 2) {
    unsigned int v12 = a5;
  }
  if (a1 != 1) {
    unsigned int v9 = v12;
  }
  if (a1) {
    return v9;
  }
  else {
    return v7;
  }
}

_DWORD *APMConvertBlocking(_DWORD *result, int a2, int a3, unsigned int a4)
{
  if (a3 != a4 && a3 && a4)
  {
    result[22] = result[22] & 0xFFBFFFFF | ((a4 == 1) << 22);
    unsigned int v4 = result[2] * a3;
    unsigned int v5 = result[3] * a3;
    if (a2 == 4097)
    {
      int v6 = (v4 + v5 - 1) / a4;
      result[2] = 1;
      result[3] = v6;
LABEL_13:
      result[21] = v6;
      return result;
    }
    if (v4 % a4) {
      int v7 = v4 / a4 + 1;
    }
    else {
      int v7 = v4 / a4;
    }
    if (v5 % a4) {
      int v6 = v5 / a4 + 1;
    }
    else {
      int v6 = v5 / a4;
    }
    result[2] = v7;
    result[3] = v6;
    if (result[21]) {
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t PMRecord_NtoB(uint64_t result, uint64_t a2)
{
  unsigned int v3 = (_DWORD *)result;
  *(void *)(result + 496) = 0;
  *(_OWORD *)(result + 464) = 0u;
  *(_OWORD *)(result + 480) = 0u;
  *(_OWORD *)(result + 432) = 0u;
  *(_OWORD *)(result + 448) = 0u;
  *(_OWORD *)(result + 400) = 0u;
  *(_OWORD *)(result + 416) = 0u;
  *(_OWORD *)(result + 368) = 0u;
  *(_OWORD *)(result + 384) = 0u;
  *(_OWORD *)(result + 336) = 0u;
  *(_OWORD *)(result + 352) = 0u;
  *(_OWORD *)(result + 304) = 0u;
  *(_OWORD *)(result + 320) = 0u;
  *(_OWORD *)(result + 272) = 0u;
  *(_OWORD *)(result + 288) = 0u;
  *(_OWORD *)(result + 240) = 0u;
  *(_OWORD *)(result + 256) = 0u;
  *(_OWORD *)(result + 208) = 0u;
  *(_OWORD *)(result + 224) = 0u;
  *(_OWORD *)(result + 176) = 0u;
  *(_OWORD *)(result + 192) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(_OWORD *)(result + 160) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)uint64_t result = 0u;
  *(_WORD *)uint64_t result = 19792;
  *(int8x8_t *)(result + 4) = vrev32_s8(*(int8x8_t *)(a2 + 4));
  *(_DWORD *)(result + 12) = bswap32(*(_DWORD *)(a2 + 12));
  *(int8x16_t *)(result + 80) = vrev32q_s8(*(int8x16_t *)(a2 + 80));
  *(_DWORD *)(result + 96) = bswap32(*(_DWORD *)(a2 + 96));
  *(_DWORD *)(result + 116) = bswap32(*(_DWORD *)(a2 + 116));
  if (result != a2)
  {
    __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    uint64_t result = __strlcpy_chk();
  }
  v3[34] = bswap32(*(_DWORD *)(a2 + 136));
  v3[37] = *(_DWORD *)(a2 + 148);
  v3[74] = bswap32(*(_DWORD *)(a2 + 296));
  v3[125] = bswap32(*(_DWORD *)(a2 + 500));
  return result;
}

uint64_t APMReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  unsigned int v8 = (const void **)NewHandleClear(528);
  uint64_t result = MemError();
  if (v8)
  {
    if ((a2 & 0x100) != 0) {
      uint64_t result = APMReadRawMediaMap(v8, v10, a3, a4);
    }
    else {
      uint64_t result = APMReadMediaMap((uint64_t *)v8, a2, a3, a4);
    }
  }
  *a1 = v8;
  return result;
}

uint64_t APMReadMediaMap(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  __int16 v70 = 0;
  long long v128 = 0u;
  memset(v127, 0, sizeof(v127));
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v104 = 0u;
  memset(v103, 0, sizeof(v103));
  uint64_t v102 = 0;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  uint64_t v68 = 0;
  v69[0] = 0;
  v69[1] = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  int v67 = 0;
  if (a2 == 0xFFFF) {
    unsigned int v5 = 3584;
  }
  else {
    unsigned int v5 = a2;
  }
  memset(v130, 0, 512);
  int v6 = a4(a3, 2, 512, 0, 1, v130);
  LOWORD(v7) = v6;
  BOOL v59 = (const void **)a1;
  if (v6 || v130[0] != 21061)
  {
    if (v6) {
      goto LABEL_132;
    }
  }
  else
  {
    DDMRecord_BtoN(*a1, v130);
  }
  uint64_t v8 = *a1;
  int v9 = a4(a3, 15, 0, 0, 0, (unsigned __int16 *)&v68);
  LOWORD(v7) = v9;
  if (!v9)
  {
    *(_WORD *)(v8 + 500) = HIDWORD(v68) >> 9;
    MKScaleGeometry(v69, (int *)&v68 + 1);
    unsigned int v10 = *(unsigned __int16 *)(v8 + 2);
    if (!*(_WORD *)(v8 + 2))
    {
      unsigned int v10 = HIDWORD(v68);
      *(_WORD *)(v8 + 2) = WORD2(v68);
    }
    int v11 = (unsigned __int16)v10 >> 9;
    int v12 = ((v10 >> 9) & 0x60) != 0 ? (unsigned __int16)v10 >> 9 : 31;
    unsigned int v13 = (v5 & 0x200) != 0 ? 2 : 1;
    int v14 = APMMapAnalysis((uint64_t)&v65, (v12 + 1), v13, v11, a3, a4);
    LOWORD(v7) = v14;
    if (!v14)
    {
      unsigned int v15 = (uint64_t *)v59;
      unsigned int v16 = *v59;
      unsigned int v60 = (v65 & 1) == 0;
      v16[256] = 516;
      v16[259] = v16[1];
      unsigned int v58 = v11;
      if ((v5 & 0x400) != 0)
      {
        v16[1] = 512;
        unsigned int v58 = 1;
      }
      int v17 = WORD1(v65);
      if (!WORD1(v65))
      {
        int v18 = 0;
        char v27 = 0;
        __int16 v49 = 0;
        goto LABEL_110;
      }
      unsigned int v56 = v11;
      unsigned int v62 = v5;
      int v18 = 0;
      __int16 v54 = 0;
      unsigned __int16 v19 = 0;
      __int16 v20 = 0;
      LOWORD(v7) = 0;
      while (1)
      {
        uint64_t v102 = 0;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v71 = 0u;
        uint64_t v21 = v20;
        unsigned int v22 = v19 + 1;
        unint64_t v23 = (unint64_t)(&v65 + v20);
        unsigned int v24 = *(unsigned __int16 *)(v23 + 6);
        if (v22 % v24) {
          int v25 = v22 / v24 + 1;
        }
        else {
          int v25 = v22 / v24;
        }
        unsigned int v26 = (unsigned __int16 *)(v23 + 8);
        if (*(unsigned __int16 *)(v23 + 8) < (unsigned __int16)v25)
        {
          char v27 = 0;
          goto LABEL_106;
        }
        char v57 = 0;
        int v28 = (_WORD *)(v23 | 6);
        int v61 = v21;
        int v55 = (unsigned __int16 *)&v66 + 4 * v21 + 1;
        while (1)
        {
          uint64_t v29 = *v15;
          unsigned __int16 v19 = *v28 * v25;
          int v18 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x219055CuLL);
          if (!v18) {
            break;
          }
          int v30 = a4(a3, 2, 512, v19, 1, v18);
          if (v30) {
            goto LABEL_103;
          }
          if (!PMRecord_BtoN((uint64_t)&v71, v18)) {
            goto LABEL_100;
          }
          DWORD2(v76) &= 0xF000FFFF;
          unsigned int v31 = PMLookupDESC((char *)&v74, 0, (unsigned __int16 *)&APMDescriptors);
          if (v31)
          {
            LODWORD(v32) = *v31;
            if ((v32 - 24577) <= 2)
            {
              unint64_t v32 = 0x310150025F00uLL >> (16 * (v32 - 1));
              unsigned __int16 v33 = &off_264496F08;
              do
              {
                unsigned __int16 v34 = *v33;
                if (!*v33) {
                  break;
                }
                int v35 = *((unsigned __int16 *)v33 - 4);
                v33 += 2;
              }
              while (v35 != (unsigned __int16)v32);
              strncpypad(&v74, v34, 0x20uLL, 0);
            }
            if ((unsigned __int16)v32 > 0x400Bu)
            {
              switch((unsigned __int16)v32)
              {
                case 0x400Cu:
                  char v57 = 4;
                  LOWORD(v32) = 16396;
                  break;
                case 0x5002u:
                  unsigned int v60 = 3;
                  if ((v62 & 0x40000) != 0) {
                    goto LABEL_100;
                  }
                  LOWORD(v32) = 20482;
                  break;
                case 0x5F00u:
                  int v40 = v60;
                  if (!HIDWORD(v71)) {
                    int v40 = 2;
                  }
                  unsigned int v60 = v40;
                  if ((v62 & 0x40000) != 0) {
                    goto LABEL_100;
                  }
                  LOWORD(v32) = 24320;
                  if (v61)
                  {
                    if (!v40)
                    {
LABEL_99:
                      unsigned int v60 = 0;
                      goto LABEL_100;
                    }
                  }
                  break;
              }
            }
            else
            {
              switch((unsigned __int16)v32)
              {
                case 0x1001u:
                  if (HIDWORD(v102) == 1297238867) {
                    DWORD2(v76) |= 0x800000u;
                  }
                  __int16 v41 = *v55;
                  HIDWORD(v71) = *v55;
                  if (!v61)
                  {
                    uint64_t v29 = *v15;
                    *(_WORD *)(*v15 + 520) = *v28 + *v28 * v41 - 1;
                  }
                  if (!v60)
                  {
                    unsigned int v60 = 0;
                    DWORD2(v76) |= 0x1000000u;
                  }
                  LOWORD(v32) = 4097;
                  break;
                case 0x3100u:
                  WORD1(v102) = *v28;
                  LOWORD(v32) = 12544;
                  break;
                case 0x4000u:
                  if (!v60)
                  {
                    if (v61) {
                      goto LABEL_99;
                    }
                    unsigned int v60 = 0;
                    DWORD2(v76) |= 0x1000000u;
                  }
                  LOWORD(v32) = 0x4000;
                  break;
              }
            }
          }
          else
          {
            LOWORD(v32) = 0;
          }
          if ((v62 & 0x20) != 0 && !HIDWORD(v71)) {
            goto LABEL_100;
          }
          unsigned __int16 v36 = &APMDescriptors;
          while ((unsigned __int16)*v36 != (unsigned __int16)v32)
          {
            uint64_t v37 = *((void *)v36 + 3);
            v36 += 8;
            if (!v37)
            {
              unsigned __int16 v36 = (__int16 *)&unk_2644971E0;
              break;
            }
          }
          int v38 = (unsigned __int16)v36[1];
          apmxrec2irec((uint64_t)&v71, (char *)v103);
          if (v61)
          {
            unint64_t v39 = DWORD2(v104) | 0x2000000u;
LABEL_52:
            DWORD2(v104) = v39;
            goto LABEL_77;
          }
          if (WORD1(v65) <= 1u)
          {
            unint64_t v39 = DWORD2(v104);
          }
          else
          {
            unint64_t v39 = DWORD2(v104);
            if (!(v19 % HIWORD(v66)))
            {
              unint64_t v39 = DWORD2(v104) | 0x1000000u;
              goto LABEL_52;
            }
          }
LABEL_77:
          __int16 v129 = v32;
          unsigned int v42 = byte_21E15F0F8[(v39 >> 24) & 3];
          if (v42 < 2)
          {
            WORD5(v128) = v19 - 1;
            __int16 v43 = -1;
LABEL_81:
            WORD4(v128) = v43;
            goto LABEL_82;
          }
          if (v42 == 2)
          {
            WORD5(v128) = -1;
            __int16 v43 = v19 - 1;
            goto LABEL_81;
          }
LABEL_82:
          int v44 = v103[2];
          if (!v103[2]) {
            goto LABEL_86;
          }
          int v45 = DiskBlockFactor(v60, v42, (unsigned __int16)v32, (unsigned __int16)*v28, (unsigned __int16)*v28, v56);
          if (v45 != v58)
          {
            PMConvertRecord(v103, v60, (__int16)v32, v45, v58);
            int v44 = v103[2];
          }
          if (!PMPSearchBlock(v29, v44, &v70))
          {
            int v46 = v70;
            *(_DWORD *)(v29 + 1072 * v70 + 616) |= 0x1000000u;
            if ((unsigned __int16)v32 == 12544 && (unsigned __int16)*v28 == v56) {
              *(_WORD *)(v29 + 1072 * v46 + 1036) = WORD6(v128);
            }
            __int16 v47 = v19 - 1;
            unsigned int v15 = (uint64_t *)v59;
            uint64_t v48 = v29 + 1072 * v46;
            if (v61 < 1) {
              *(_WORD *)(v48 + 1034) = v47;
            }
            else {
              *(_WORD *)(v48 + 1032) = v47;
            }
            ++v54;
          }
          else
          {
LABEL_86:
            *((void *)&v126 + 1) = v18;
            if ((unsigned __int16)v32 == 4097 || v38 == 2) {
              MEMORY[0x223C20E30](v127);
            }
            unsigned int v15 = (uint64_t *)v59;
            LOWORD(v30) = addentry(v59, v103, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
            if ((_WORD)v30)
            {
LABEL_103:
              LOWORD(v7) = v30;
              goto LABEL_105;
            }
            int v18 = 0;
          }
LABEL_100:
          LOWORD(v25) = v25 + 1;
          if (*v26 < (unsigned __int16)v25)
          {
            LOWORD(v7) = 0;
            goto LABEL_105;
          }
        }
        LOWORD(v7) = -1;
LABEL_105:
        int v17 = WORD1(v65);
        char v27 = v57;
        LOWORD(v21) = v61;
LABEL_106:
        __int16 v20 = v21 + 1;
        if (v17 <= (__int16)(v21 + 1))
        {
          unsigned int v5 = v62;
          int v11 = v56;
          __int16 v49 = v54;
          if (!(_WORD)v7)
          {
LABEL_110:
            *(_WORD *)(*v15 + 514) = v60;
            if (!(v5 & 0x100000 | v27 & 4)) {
              PMISODetect(v15, a3, (uint64_t)a4);
            }
            if ((v5 & 0x800) != 0)
            {
              PMSortMapII((Ptr *)v15, 0);
              if ((v5 & 0x10) != 0)
              {
                int v50 = PMAccountFreespace((const void **)v15, 0, v5);
                if (v50)
                {
                  LOWORD(v7) = v50;
                  goto LABEL_130;
                }
              }
              if ((v5 & 0x400) != 0) {
                PMTrimOverlaps((uint64_t)v15);
              }
            }
            if ((v5 & 0x80) != 0) {
              PMRationalise((const void **)v15);
            }
            uint64_t v51 = *v15;
            unsigned __int16 v52 = *(_WORD *)(*v15 + 2);
            if (!v52)
            {
              unsigned __int16 v52 = WORD2(v68);
              if ((v5 & 0x400) != 0) {
                unsigned __int16 v52 = 512;
              }
              *(_WORD *)(v51 + 2) = v52;
            }
            if (!*(_DWORD *)(v51 + 4)) {
              *(_DWORD *)(v51 + 4) = PMConvertBlocks(LODWORD(v69[0]), WORD2(v68), v52);
            }
            if ((v5 & 0x400) != 0)
            {
              PMDDMNormalise((uint64_t)v15, v11, v58);
              *(_DWORD *)(*v15 + 4) *= v11;
            }
            LOWORD(v7) = DeviceAdjustSpace((const void **)v15, 0, (uint64_t)&v68, v5);
            if (v49) {
              *(_WORD *)(*v15 + 516) |= 1u;
            }
          }
LABEL_130:
          if (v18) {
            free(v18);
          }
          break;
        }
      }
    }
  }
LABEL_132:
  if ((_WORD)v7 == 0xFFFF) {
    int v7 = *__error();
  }
  return (__int16)v7;
}

uint64_t DDMRecord_BtoN(uint64_t result, unsigned __int16 *a2)
{
  *(_WORD *)uint64_t result = bswap32(*a2) >> 16;
  *(_WORD *)(result + 2) = bswap32(a2[1]) >> 16;
  *(_DWORD *)(result + 4) = bswap32(*((_DWORD *)a2 + 1));
  *(_WORD *)(result + 8) = bswap32(a2[4]) >> 16;
  *(_WORD *)(result + 10) = bswap32(a2[5]) >> 16;
  *(_DWORD *)(result + 12) = bswap32(*((_DWORD *)a2 + 3));
  unsigned int v2 = bswap32(a2[8]) >> 16;
  if (v2 >= 0x11) {
    unsigned int v2 = 0;
  }
  *(_WORD *)(result + 16) = v2;
  if (v2)
  {
    int v3 = 0;
    unsigned int v4 = a2 + 9;
    uint64_t v5 = result + 18;
    do
    {
      *(_DWORD *)uint64_t v5 = bswap32(*(_DWORD *)v4);
      *(_WORD *)(v5 + 4) = bswap32(v4[2]) >> 16;
      *(_WORD *)(v5 + 6) = bswap32(v4[3]) >> 16;
      ++v3;
      v4 += 4;
      v5 += 8;
    }
    while (v2 > (unsigned __int16)v3);
  }
  return result;
}

uint64_t APMMapAnalysis(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  int v7 = 0;
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  if (a2 >= 2)
  {
    unsigned int v8 = a3;
    uint64_t v41 = 0;
    memset(v40, 0, sizeof(v40));
    memset(v39, 0, sizeof(v39));
    if (*(unsigned __int16 *)(a1 + 2) < a3)
    {
      int v11 = a4;
      uint64_t v12 = a2;
      int v7 = 0;
      uint64_t v13 = 1;
      unsigned int v14 = 1;
      while (1)
      {
        LODWORD(v15) = a6(a5, 2, 512, v13, 1, v43);
        if (v15) {
          return (__int16)v15;
        }
        LODWORD(v15) = PMRecord_BtoN((uint64_t)v39, v43);
        if (v15)
        {
          uint64_t v16 = 1 << (v13 - 1);
          if (v14 >= 0x20) {
            LODWORD(v16) = 0;
          }
          v7 |= v16;
          unsigned int v15 = PMLookupDESC((char *)v40, 0, (unsigned __int16 *)&APMDescriptors);
          if (v15)
          {
            if (*v15 == 4097)
            {
              uint64_t v17 = *(unsigned __int16 *)(a1 + 2);
              uint64_t v18 = a1 + 8 * v17;
              int v19 = 1;
              *(_WORD *)(v18 + 6) = 1;
              __int16 v20 = (unsigned __int16 *)(v18 + 6);
              *(v20 - 1) = v14;
              __int16 v21 = WORD2(v39[0]);
              v20[1] = WORD2(v39[0]);
              if ((v14 & 1) == 0)
              {
                LOWORD(v22) = v14;
                do
                {
                  int v23 = v22 & 2;
                  int v22 = (__int16)v22 >> 1;
                  int v19 = (__int16)(2 * v19);
                }
                while (v19 <= 7 && v23 == 0);
              }
              if (v11 <= v19) {
                __int16 v25 = v19;
              }
              else {
                __int16 v25 = v11;
              }
              if (v11 != 4) {
                LOWORD(v19) = v25;
              }
              unsigned __int16 v26 = v19;
              if ((__int16)v19 < 1)
              {
                LODWORD(v15) = 0;
                uint64_t v30 = v12;
              }
              else
              {
                uint64_t v36 = v17;
                __int16 v27 = v21 - 1;
                while (1)
                {
                  LODWORD(v15) = a6(a5, 2, 512, (unsigned __int16)(v26 * v27), 1, (unsigned __int16 *)v42);
                  if (v15) {
                    goto LABEL_30;
                  }
                  if (v42[0] == 19792 || v42[0] == 19712) {
                    break;
                  }
                  unsigned int v29 = v26;
                  v26 >>= 1;
                  if (v29 <= 1)
                  {
                    LODWORD(v15) = 0;
LABEL_30:
                    uint64_t v30 = v12;
                    goto LABEL_50;
                  }
                }
                *__int16 v20 = v26;
                unsigned int v32 = HIDWORD(v39[0]);
                if (!HIDWORD(v39[0])) {
                  unsigned int v32 = DWORD1(v39[0]);
                }
                if (v32 >= 0x3F) {
                  unsigned int v32 = 63;
                }
                *(_WORD *)(a1 + 8 * v36 + 10) = v32;
                if (v32 >= v12) {
                  unsigned int v33 = v12;
                }
                else {
                  unsigned int v33 = v32;
                }
                if (v26 == 1) {
                  uint64_t v30 = (unsigned __int16)v33;
                }
                else {
                  uint64_t v30 = v12;
                }
                if (v26 == 1) {
                  LODWORD(v12) = v33;
                }
                LODWORD(v15) = 0;
LABEL_50:
                int v11 = a4;
              }
              ++*(_WORD *)(a1 + 2);
              unsigned int v31 = v12;
              uint64_t v12 = v30;
              unsigned int v8 = a3;
              goto LABEL_33;
            }
            LODWORD(v15) = 0;
          }
        }
        unsigned int v31 = v12;
LABEL_33:
        if (++v14 < v31)
        {
          ++v13;
          if (*(unsigned __int16 *)(a1 + 2) < v8) {
            continue;
          }
        }
        goto LABEL_53;
      }
    }
    LODWORD(v15) = 0;
    int v7 = 0;
LABEL_53:
    if (v15) {
      return (__int16)v15;
    }
  }
  if (*(_WORD *)(a1 + 2) != 1)
  {
    if (*(_WORD *)(a1 + 2)) {
      LOWORD(v15) = 0;
    }
    else {
      LOWORD(v15) = -5339;
    }
    return (__int16)v15;
  }
  int v34 = *(unsigned __int16 *)(a1 + 6);
  if (v34 == 4)
  {
    if (v7)
    {
      *(_WORD *)a1 |= 1u;
      *(void *)(a1 + 12) = *(void *)(a1 + 4);
      *(_WORD *)(a1 + 6) = 1;
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  if (v34 != 1)
  {
LABEL_64:
    LOWORD(v15) = 0;
    return (__int16)v15;
  }
  LOWORD(v15) = 0;
  if (*(_WORD *)(a1 + 4) != 1 && (v7 & 0x8080808u) >= 9)
  {
    *(_WORD *)a1 |= 1u;
    *(void *)(a1 + 12) = *(void *)(a1 + 4);
    *(_WORD *)(a1 + 14) = 4;
LABEL_66:
    LOWORD(v15) = 0;
    *(_WORD *)(a1 + 2) = 2;
  }
  return (__int16)v15;
}

BOOL PMRecord_BtoN(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v2 = *a2;
  if (v2 == 19792 || v2 == 19712)
  {
    *(_WORD *)a1 = __rev16(v2);
    *(_WORD *)(a1 + 2) = bswap32(a2[1]) >> 16;
    *(int8x8_t *)(a1 + 4) = vrev32_s8(*(int8x8_t *)(a2 + 2));
    *(_DWORD *)(a1 + 12) = bswap32(*((_DWORD *)a2 + 3));
    *(int8x16_t *)(a1 + 80) = vrev32q_s8(*((int8x16_t *)a2 + 5));
    *(int8x16_t *)(a1 + 96) = vrev32q_s8(*((int8x16_t *)a2 + 6));
    *(int8x8_t *)(a1 + 112) = vrev32_s8(*(int8x8_t *)(a2 + 56));
    if ((unsigned __int16 *)a1 != a2)
    {
      *((unsigned char *)a2 + 79) = 0;
      __strlcpy_chk();
      *((unsigned char *)a2 + 47) = 0;
      __strlcpy_chk();
      *((unsigned char *)a2 + 135) = 0;
      __strlcpy_chk();
      *((unsigned char *)a2 + 497) = 0;
      __strlcpy_chk();
      *(_DWORD *)(a1 + 148) = *((_DWORD *)a2 + 37);
    }
    *(_DWORD *)(a1 + 136) = bswap32(*((_DWORD *)a2 + 34));
    *(_DWORD *)(a1 + 296) = bswap32(*((_DWORD *)a2 + 74));
    *(_DWORD *)(a1 + 500) = bswap32(*((_DWORD *)a2 + 125));
  }
  return v2 == 19792 || v2 == 19712;
}

uint64_t apmxrec2irec(uint64_t a1, char *a2)
{
  bzero(a2, 0x430uLL);
  *(_WORD *)a2 = 20557;
  *((void *)a2 + 1) = *(void *)(a1 + 8);
  *((void *)a2 + 10) = *(void *)(a1 + 80);
  *((_DWORD *)a2 + 22) = *(_DWORD *)(a1 + 88) & 0xF000FFFF;
  *(void *)(a2 + 92) = *(void *)(a1 + 92);
  *((_DWORD *)a2 + 29) = *(_DWORD *)(a1 + 116);
  __strlcpy_chk();
  __strlcpy_chk();
  __strlcpy_chk();
  uint64_t result = __strlcpy_chk();
  *((_DWORD *)a2 + 34) = *(_DWORD *)(a1 + 136);
  *((_DWORD *)a2 + 116) = *(_DWORD *)(a1 + 148);
  *((_DWORD *)a2 + 128) = *(_DWORD *)(a1 + 500);
  *((_WORD *)a2 + 254) = *(_WORD *)(a1 + 498);
  return result;
}

uint64_t PMPSearchBlock(uint64_t a1, int a2, __int16 *a3)
{
  if (!a1)
  {
    __int16 v3 = -1;
    __int16 v4 = -50;
    if (!a3) {
      return v4;
    }
    goto LABEL_9;
  }
  if (!*(_WORD *)(a1 + 522))
  {
LABEL_6:
    __int16 v3 = -1;
    __int16 v4 = -5343;
    if (!a3) {
      return v4;
    }
    goto LABEL_9;
  }
  __int16 v3 = 0;
  while (*(_DWORD *)(a1 + 1072 * v3 + 536) != a2)
  {
    if (*(unsigned __int16 *)(a1 + 522) <= ++v3) {
      goto LABEL_6;
    }
  }
  __int16 v4 = 0;
  if (a3) {
LABEL_9:
  }
    *a3 = v3;
  return v4;
}

uint64_t PMTrimOverlaps(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)result;
  unsigned int v2 = *(unsigned __int16 *)(*(void *)result + 522);
  if (v2 >= 3)
  {
    unsigned int v3 = v2 - 2;
    do
    {
      unsigned int v4 = v1[402] - v1[134];
      if (v1[135] > v4) {
        v1[135] = v4;
      }
      v1 += 268;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t APMCFRecordSections(Ptr *a1, const __CFDictionary *a2, __CFArray *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (a2)
  {
    int v6 = MKCFOptionBit(a2, @"Include ddm section", 1);
    unsigned int v7 = MKCFOptionBit(a2, @"Include ddm parts", 2) | v6;
    int v8 = MKCFOptionBit(a2, @"Include most", 150);
    int v9 = MKCFOptionBit(a2, @"Include all", 254) | v8;
    int v10 = MKCFOptionBit(a2, @"Include drivers", 2);
    int v11 = v9 | v10 | MKCFOptionBit(a2, @"Include data", 4);
    int v12 = MKCFOptionBit(a2, @"Include free space", 8);
    int v13 = v12 | MKCFOptionBit(a2, @"Include loaders", 16);
    int v14 = v11 | v13 | MKCFOptionBit(a2, @"Include patch", 32);
    int v15 = MKCFOptionBit(a2, @"Include aux", 64);
    int v16 = v14 | v15 | MKCFOptionBit(a2, @"Include unknowns", 128);
    if (v16) {
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  int v16 = 20;
LABEL_6:
  int v45 = 0;
  if (v7 <= 1) {
    int v17 = 1;
  }
  else {
    int v17 = v7;
  }
  if ((~v17 & 3) != 0) {
    unsigned int v18 = v16;
  }
  else {
    unsigned int v18 = v16 & 0xFFFFFFCD;
  }
  int v19 = APMCFRecordMapSection(a1, v18, &v45);
  LOWORD(v20) = v45;
  if (v45) {
    return (__int16)v20;
  }
  int v22 = v19;
  if (v19)
  {
    CFArrayAppendValue(a3, v19);
    CFRelease(v22);
  }
  Ptr v23 = *a1;
  if (!*a1)
  {
    LOWORD(v20) = -1;
    return (__int16)v20;
  }
  unsigned int v24 = v23 + 16;
  if (!*((_WORD *)v23 + 8)
    || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0)
  {
    LOWORD(v20) = 0;
    return (__int16)v20;
  }
  unsigned __int16 v26 = Mutable;
  __int16 v47 = 0;
  CFDictionarySetValue(Mutable, @"ID", @"DDM");
  CFDictionarySetValue(v26, @"Name", @"Driver Descriptor Map");
  int valuePtr = 0;
  CFNumberRef v27 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v27) {
    goto LABEL_32;
  }
  CFNumberRef v28 = v27;
  CFDictionarySetValue(v26, @"Offset", v27);
  CFRelease(v28);
  CFNumberRef v29 = CFNumberCreate(0, kCFNumberSInt16Type, v23 + 16);
  if (!v29
    || (CFNumberRef v30 = v29,
        CFDictionarySetValue(v26, @"Count", v29),
        CFRelease(v30),
        (CFMutableArrayRef v31 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70])) == 0))
  {
LABEL_32:
    int v45 = 0;
LABEL_33:
    CFArrayAppendValue(a3, v26);
    CFRelease(v26);
    LOWORD(v20) = v45;
    return (__int16)v20;
  }
  CFMutableArrayRef v32 = v31;
  CFDictionarySetValue(v26, @"Drivers", v31);
  CFRelease(v32);
  if (*v24)
  {
    unint64_t v33 = 0;
    int v34 = (unsigned __int16 *)(v23 + 18);
    while (1)
    {
      CFMutableDictionaryRef v35 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!v35) {
        break;
      }
      uint64_t v36 = v35;
      CFNumberRef v37 = CFNumberCreate(0, kCFNumberSInt32Type, v34);
      if (!v37) {
        break;
      }
      CFNumberRef v38 = v37;
      CFDictionarySetValue(v36, @"Offset", v37);
      CFRelease(v38);
      CFNumberRef v39 = CFNumberCreate(0, kCFNumberSInt16Type, v34 + 2);
      if (!v39) {
        break;
      }
      CFNumberRef v40 = v39;
      CFDictionarySetValue(v36, @"Size", v39);
      CFRelease(v40);
      OSType2Ascii(v34[3], cStr, 2);
      CFStringRef v41 = CFStringCreateWithCString(0, cStr, 0);
      if (!v41) {
        break;
      }
      CFStringRef v42 = v41;
      CFDictionarySetValue(v36, @"OS", v41);
      CFRelease(v42);
      CFArrayAppendValue(v32, v36);
      CFRelease(v36);
      ++v33;
      v34 += 4;
      if (v33 >= (unsigned __int16)*v24) {
        goto LABEL_29;
      }
    }
    int v20 = -1;
  }
  else
  {
LABEL_29:
    int v20 = 0;
  }
  if (v17)
  {
    CFMutableArrayRef v43 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    if (v43)
    {
      CFMutableArrayRef v44 = v43;
      CFDictionarySetValue(v26, @"Partitions", v43);
      CFRelease(v44);
      int v20 = APMCFRecordPartitions((uint64_t *)a1, v44, 0x32u, &v47);
    }
  }
  int v45 = v20;
  if (!v20) {
    goto LABEL_33;
  }
  return (__int16)v20;
}

unsigned __int16 *MBRDescriptorSearch(char *a1)
{
  uint64_t result = PMLookupDESC(a1, 0, (unsigned __int16 *)&MBRDescriptors);
  if (result) {
    return (unsigned __int16 *)*result;
  }
  return result;
}

uint64_t MBRCFCreateMap(__CFArray *a1, const __CFDictionary *a2, unsigned int a3, unsigned int a4, const __CFDictionary *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, void, void, void, uint64_t *))
{
  int v22 = 0;
  unsigned __int16 valuePtr = 8;
  __int16 v24 = 1;
  if (!a2) {
    return 22;
  }
  unsigned int v25 = 0;
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v20 = 0;
  uint64_t result = a7(a6, 15, 0, 0, 0, &v20);
  if (!result)
  {
    unsigned __int16 v13 = WORD2(v20);
    if (a4)
    {
      if (!a3) {
        LOWORD(a3) = 512;
      }
    }
    else
    {
      MKScaleGeometry(v21, (int *)&v20 + 1);
      a4 = v21[0];
      if (a3 && HIDWORD(v20) < a3) {
        a4 = PMConvertBlocks(LODWORD(v21[0]), WORD2(v20), a3);
      }
      else {
        LOWORD(a3) = WORD2(v20);
      }
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"PMFormats");
    if (Value || (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"Map Format")) != 0) {
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
    }
    CFBooleanRef v15 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Dual Format");
    v16 = (v15 || (CFBooleanRef v15 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"Dualmode")) != 0)
       && CFBooleanGetValue(v15) != 0;
    uint64_t result = PMNewPartitionListInternal((const void ***)&v22, 0, a4, (unsigned __int16)a3, v16, valuePtr, 0);
    unsigned int v25 = result;
    if (!result)
    {
      *((_WORD *)*v22 + 250) = v13 >> 9;
      CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(a2, @"Partitions");
      CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Revision");
      if (v18) {
        CFNumberGetValue(v18, kCFNumberSInt16Type, &v24);
      }
      int v19 = MBRCFRecordMapSection(v22, 0x94u, &v25);
      uint64_t result = v25;
      if (!v25)
      {
        if (v19)
        {
          CFArrayAppendValue(a1, v19);
          CFRelease(v19);
        }
        if (v17) {
          return MBRCFCreatePartitions(v19, v17, (unsigned __int16)a3 >> 9, a5);
        }
        else {
          return v25;
        }
      }
    }
  }
  return result;
}

uint64_t MBRCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, unsigned int a3, const __CFDictionary *a4)
{
  if (!a1) {
    return 4294967246;
  }
  uint64_t Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  CFIndex v9 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v9);
    if (!ValueAtIndex) {
      break;
    }
    uint64_t result = MBRCFCreatePartition(a1, ValueAtIndex, a3, a4);
    if (result) {
      return result;
    }
    if (Count == ++v9) {
      return 0;
    }
  }
  return 4294966881;
}

uint64_t MBRCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, unsigned int a3, const __CFDictionary *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v8 = mkcfrecoverref(a1);
  if (!v8) {
    return 4294967246;
  }
  CFIndex v9 = (const void **)v8;
  __int16 v15 = 0;
  bzero(v16, 0x430uLL);
  unsigned int v10 = *((unsigned __int16 *)*v9 + 1) >> 9;
  uint64_t result = PMPrimaryInfoUpdate(a2, *((__int16 *)*v9 + 257), v10, v16, 1);
  if (!result)
  {
    if (v21)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Options");
      uint64_t v13 = MBRCFSetupWriteOptions(Value, a4);
      uint64_t result = PMNewPartitionExtended(v9, v21, v20, v17, v18, v19, a3, (unsigned __int16 *)&v15, v13);
      if (!result)
      {
        uint64_t result = PMSecondaryInfoUpdate(a2, v10, (uint64_t)*v9 + 1072 * v15 + 528, 1);
        if (!result)
        {
          CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
          return MBRCFRecordPartition(v14, (uint64_t *)v9, 1, v15);
        }
      }
    }
    else if (!strcasecmp(v20, "Apple_Free"))
    {
      return 0;
    }
    else
    {
      return 4294961954;
    }
  }
  return result;
}

uint64_t MBRCFSetupWriteOptions(const __CFDictionary *a1, const __CFDictionary *a2)
{
  if (!((unint64_t)a1 | (unint64_t)a2)) {
    return 49296;
  }
  CFDictionaryRef v3 = a1;
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (v3)
    {
      int v7 = MKCFOptionBit(v3, @"Minimum One Block Gap", 0x1000000);
      int v8 = MKCFOptionBit(v3, @"Sectors/Track Alignment", 0x2000000) | v7;
      int v9 = MKCFOptionBit(v3, @"Boot Select", 0x4000000);
      int v10 = v8 | v9 | MKCFOptionBit(v3, @"Protect NV Area", 0x8000000);
      int v11 = MKCFOptionBit(v3, @"Retain existing content", 4);
      v4 |= v10 | v11 | MKCFOptionBit(v3, @"Direct Mode", 0x20000000);
    }
    char v5 = 0;
    CFDictionaryRef v3 = a2;
  }
  while ((v6 & 1) != 0);
  return v4;
}

uint64_t MBRCFWriteScheme(const __CFDictionary *a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, void))
{
  if (!a1) {
    return 22;
  }
  int v10 = MBRCFSetupWriteOptions(a4, 0);
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Sections");
  if (!Value) {
    return 22;
  }
  CFDictionaryRef v12 = CFArrayDictionarySearchWithIndexOptions(Value, @"ID", @"MAP", 0, 0);
  if (!v12) {
    return 22;
  }
  CFDictionaryRef v13 = v12;
  CFArrayRef v14 = mkcfrecoverref(v12);
  if (!v14) {
    return 22;
  }
  __int16 v15 = v14;
  unsigned __int16 valuePtr = 0;
  CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Alignment");
  if (v16)
  {
    CFNumberGetValue(v16, kCFNumberSInt16Type, &valuePtr);
    unsigned int v18 = valuePtr;
  }
  else
  {
    unsigned int v18 = *(unsigned __int16 *)(*(void *)v15 + 518) >> 9;
    unsigned __int16 valuePtr = *(_WORD *)(*(void *)v15 + 518) >> 9;
  }
  uint64_t result = MBRCFUpdateSection(v13, v17, v18, a4);
  if (!result)
  {
    uint64_t v20 = (Ptr *)mkcfrecoverref(v13);
    uint64_t result = MBRWriteMedia(v20, v10, a5, a6);
    if (!result)
    {
      CFArrayRef v21 = (const __CFArray *)CFDictionaryGetValue(v13, @"Partitions");
      uint64_t result = MBRCFRecordPartitions((uint64_t *)v20, v21, 0, 0xFFFFFFFF, 0);
      if (!result)
      {
        v23.lengtHandle h = CFArrayGetCount(v21);
        v23.location = 0;
        CFArraySortValues(v21, v23, (CFComparatorFunction)CFRankPartition, 0);
        return 0;
      }
    }
  }
  return result;
}

uint64_t MBRCFUpdateSection(const __CFDictionary *a1, uint64_t a2, unsigned int a3, const __CFDictionary *a4)
{
  v52[2] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  int v7 = mkcfrecoverref(a1);
  if (!v7) {
    return 22;
  }
  int v8 = (uint64_t *)v7;
  uint64_t v9 = *(void *)v7;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"Media Block Size");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt16Type, (void *)(v9 + 518));
  }
  __int16 v50 = 0;
  v52[1] = 0;
  v52[0] = 0;
  memset(v51, 0, 512);
  CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(a1, @"Partitions");
  unsigned __int16 Count = CFArrayGetCount(v11);
  if (!Count)
  {
LABEL_48:
    LOWORD(UUID) = 0;
    return (__int16)UUID;
  }
  unsigned __int16 v13 = Count;
  unsigned int v49 = a3;
  CFDictionaryRef v48 = a4;
  CFIndex v14 = 0;
  int v47 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v14);
    if (!ValueAtIndex)
    {
      LOWORD(UUID) = 22;
      return (__int16)UUID;
    }
    CFDictionaryRef v16 = ValueAtIndex;
    unsigned int v17 = *(unsigned __int16 *)(*v8 + 2) >> 9;
    int v18 = PMPrimaryInfoUpdate(ValueAtIndex, *(__int16 *)(*v8 + 514), v17, v51, 1);
    if (v18) {
      break;
    }
    int UUID = CFDictionaryGetUUID(v16, @"GUID", (unsigned __int8 *)v52);
    if (!UUID) {
      int UUID = PMGuidSearch((uint64_t)v8, v52, &v50);
    }
    CFDictionaryRef v20 = (const __CFDictionary *)CFDictionaryGetValue(v16, @"Options");
    if (v20)
    {
      uint64_t v21 = MKCFOptionBit(v20, @"Allocate Remaining Space", 0x400000);
      BOOL v22 = UUID == -5343;
      if (UUID == -5343 && (v21 & 0x400000) != 0)
      {
        HIDWORD(v51[0]) = 0;
LABEL_23:
        int v26 = MBRCFCreatePartition(a1, v16, v49, v48);
LABEL_24:
        int UUID = v26;
LABEL_25:
        if (UUID) {
          return (__int16)UUID;
        }
        goto LABEL_26;
      }
    }
    else
    {
      BOOL v22 = UUID == -5343;
    }
    if (UUID)
    {
      if (!(HIDWORD(v51[0]) + DWORD2(v51[0]))) {
        BOOL v22 = 0;
      }
      if (!v22) {
        return (__int16)UUID;
      }
      goto LABEL_23;
    }
    unsigned int v23 = DWORD2(v51[0]);
    int v24 = HIDWORD(v51[0]);
    if (DWORD2(v51[0]) + HIDWORD(v51[0]))
    {
      uint64_t v27 = *v8;
      signed __int16 v28 = v50;
      uint64_t v29 = *v8 + 1072 * v50;
      if ((*(unsigned char *)(v29 + 996) & 0x10) == 0)
      {
        uint64_t v30 = v29 + 528;
        uint64_t v45 = *v8;
        int v46 = (_DWORD *)(v29 + 528);
        if (!HIDWORD(v51[0]))
        {
          int v31 = v50 + 1;
          if (v31 >= *(unsigned __int16 *)(v27 + 522))
          {
            int v33 = *(_DWORD *)(v27 + 4);
          }
          else
          {
            uint64_t v32 = v27 + 1072 * v31;
            int v33 = *(_DWORD *)(v32 + 536);
            if (*(_WORD *)(v32 + 1082) == 24320) {
              v33 += *(_DWORD *)(v32 + 540);
            }
          }
          HIDWORD(v51[0]) = (v33 - *(_DWORD *)(v30 + 8)) / v49 * v49;
          CFNumberRef v34 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)((unint64_t)v51 | 0xC));
          CFDictionarySetValue(v16, @"Size", v34);
          CFRelease(v34);
          unsigned int v23 = DWORD2(v51[0]);
          int v24 = HIDWORD(v51[0]);
          signed __int16 v28 = v50;
        }
        int v26 = SValidate(v8, v23, v24, v28);
        if (v26) {
          goto LABEL_24;
        }
        unsigned int v35 = v46[3];
        int v36 = v47;
        if (HIDWORD(v51[0]) < v35) {
          int v36 = DWORD2(v51[0]) + HIDWORD(v51[0]);
        }
        int v47 = v36;
        unsigned int v43 = HIDWORD(v51[0]);
        unsigned int v44 = v46[3];
        int v37 = v35 - HIDWORD(v51[0]);
        if (v35 < HIDWORD(v51[0])) {
          int v37 = 0;
        }
        int v42 = v37;
        int v18 = PMPrimaryInfoUpdate(v16, *(__int16 *)(v45 + 514), v17, v46, 0);
        if (v18) {
          break;
        }
        int v38 = PMSecondaryInfoUpdate(v16, v17, (uint64_t)v46, 0);
        int UUID = v38;
        if (v43 >= v44 || v38) {
          goto LABEL_25;
        }
        __int16 v39 = v50 + 1;
        if (*(unsigned __int16 *)(v45 + 522) <= (__int16)(v50 + 1) || *(_WORD *)(v45 + 1072 * v39 + 1082) != 24320)
        {
          int v26 = PMGenPartitionType((const void **)v8, 24320, v47, v42, *(unsigned __int16 *)(v45 + 2), 0x200000, 0, 0, v50);
          goto LABEL_24;
        }
        uint64_t v40 = v45 + 1072 * v39;
        *(_DWORD *)(v40 + 536) -= v42;
        *(_DWORD *)(v40 + 540) += v42;
      }
LABEL_26:
      if (++v14 >= (unint64_t)v13) {
        goto LABEL_48;
      }
    }
    else
    {
      __int16 v25 = PMRemovePartition((const void **)v8, (unsigned __int16)v50, 1);
      CFArrayRemoveValueAtIndex(v11, v14);
      if (--v13 <= (unsigned __int16)v14)
      {
        LOWORD(UUID) = v25;
        return (__int16)UUID;
      }
    }
  }
  LOWORD(UUID) = v18;
  return (__int16)UUID;
}

uint64_t MKCreateLoaderPartition(const void **a1, __CFBundle *a2, CFDictionaryRef theDict, unsigned int a4, int a5, int a6, char *a7, int a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  unsigned int v27 = -5343;
  if (a6 >= 1)
  {
    CFDictionaryRef v14 = theDict;
    CFDictionaryRef v17 = 0;
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
    if (theDict || (v27 = -43, CFDictionaryRef v14 = MKLoadDB(a2, @"inventory", (int *)&v27), (v17 = v14) != 0))
    {
      unsigned int v27 = -417;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v14, @"Loaders");
      if (Value)
      {
        CFDictionaryRef v19 = Value;
        unsigned int v27 = -415;
        CFStringRef v20 = CFStringCreateWithCString(0, a7, 0);
        if (v20)
        {
          CFStringRef v21 = v20;
          CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v19, v20);
          CFRelease(v21);
          if (v22)
          {
            unsigned int v27 = MKGetPartitionInfo(v22, *((__int16 *)*a1 + 257), (uint64_t)v28);
            if (!v27)
            {
              CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(v22, @"Minimum Host Size");
              if (v23)
              {
                CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr);
                uint64_t v24 = valuePtr;
              }
              else
              {
                uint64_t v24 = 0;
              }
              unsigned int v27 = PMCreateLoader(a1, a4, a6, v24, a7, a8, (uint64_t)v28);
              if (!v27) {
                unsigned int v27 = MKUpdateLoader((uint64_t *)a1, a6, a2, v14, a9, a10);
              }
            }
          }
        }
      }
      if (v17) {
        CFRelease(v17);
      }
    }
  }
  return v27;
}

uint64_t MKGetPartitionInfo(const __CFDictionary *a1, int a2, uint64_t a3)
{
  *(void *)(a3 + 96) = 0;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Partition Type");
  if (!Value) {
    return 4294966879;
  }
  uint64_t result = PMCFSetupPartitionType(a2, Value, (unsigned __int16 *)(a3 + 100), (char *)(a3 + 33));
  if (!result)
  {
    CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a1, @"Partition Name");
    if (v8) {
      CFStringGetCString(v8, (char *)a3, 33, 0);
    }
    CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Partition Size");
    if (v9) {
      CFNumberGetValue(v9, kCFNumberSInt32Type, (void *)(a3 + 88));
    }
    CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(a1, @"Partition Signature");
    if (v10)
    {
      v13.location = 0;
      v13.lengtHandle h = 4;
      CFStringGetBytes(v10, v13, 0, 0, 0, (UInt8 *)(a3 + 84), 4, 0);
    }
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Partition Position");
    if (v11) {
      CFNumberGetValue(v11, kCFNumberSInt32Type, (void *)(a3 + 92));
    }
    CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Partition Options");
    if (v12) {
      CFNumberGetValue(v12, kCFNumberSInt32Type, (void *)(a3 + 96));
    }
    uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"Partition Processor");
    if (result)
    {
      CFStringGetCString((CFStringRef)result, (char *)(a3 + 66), 17, 0);
      return 0;
    }
  }
  return result;
}

uint64_t PMCreateLoader(const void **a1, unsigned int a2, int a3, uint64_t a4, unsigned char *a5, int a6, uint64_t a7)
{
  if (!a7) {
    return 22;
  }
  CFNumberRef v9 = (__int16 *)*a1;
  int v10 = (__int16)(a3 - 1);
  uint64_t v11 = (uint64_t)*a1 + 1072 * (__int16)(a3 - 1);
  unsigned int v12 = *((unsigned __int16 *)*a1 + 1);
  if (a2) {
    unsigned int v13 = a2;
  }
  else {
    unsigned int v13 = v12 >> 9;
  }
  unsigned int v14 = PMConvertBlocks(*(unsigned int *)(a7 + 88), 0x200u, v12);
  unsigned int v15 = PMConvertBlocks(a4, 0x200u, v12);
  int v16 = v14 / v13;
  if (v14 % v13) {
    ++v16;
  }
  unsigned int v17 = v16 * v13;
  if (!strcasecmp((const char *)(v11 + 576), (const char *)(a7 + 33)) && *(_DWORD *)(v11 + 540) == v17) {
    return 0;
  }
  if (v9[536 * v10 + 541] == 24320 && *(_DWORD *)(v11 + 540) >= v17)
  {
    signed __int16 v28 = PMCodeSearch(24320, v9[257]);
    uint64_t result = strncasecmp((const char *)(a7 + 33), v28, 0x20uLL);
    if (!result) {
      return result;
    }
    int v29 = *(_DWORD *)(v11 + 536);
    unsigned int v30 = *(_DWORD *)(v11 + 540) - v17;
    *(_DWORD *)(v11 + 540) = v30;
    int v25 = v29 + v30;
    unsigned int v27 = a1;
    int v19 = a3;
  }
  else
  {
    int v19 = a3;
    CFStringRef v20 = &v9[536 * a3];
    unsigned int v21 = *((_DWORD *)v20 + 135);
    unsigned int v22 = v21 - v17;
    if (v21 <= v17 || v21 < v15) {
      return 28;
    }
    if (!a6) {
      return 1;
    }
    uint64_t v24 = v20 + 264;
    int v25 = v24[2];
    void v24[2] = v25 + v17;
    v24[3] = v22;
    int v26 = v24[22] | 0x100000;
    v24[21] = v22;
    v24[22] = v26;
    unsigned int v27 = a1;
  }
  uint64_t result = PMGenPartition(v27, (char *)(a7 + 33), v25, v17, v12, 0, (unsigned char *)a7, 0, v19);
  if (!result)
  {
    uint64_t v31 = (uint64_t)*v27 + 1072 * v19;
    uint64_t result = PMSetupLoader(v31 + 528, a5, a7);
    *(_DWORD *)(v31 + 996) |= 0x10u;
    *(_DWORD *)(v31 + 2068) |= 8u;
  }
  return result;
}

uint64_t PMSetupLoader(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  uint64_t result = 22;
  if (a1 && a3)
  {
    *(_DWORD *)(a1 + 136) = *(_DWORD *)(a3 + 84);
    strncpypad((unsigned char *)(a1 + 120), (unsigned char *)(a3 + 66), 0x10uLL, 0);
    strncpypad((unsigned char *)(a1 + 472), a2, 0x20uLL, 0);
    if (!*(unsigned char *)(a1 + 16)) {
      strncpypad((unsigned char *)(a1 + 16), a2, 0x20uLL, 0);
    }
    uint64_t result = 0;
    *(_DWORD *)(a1 + 468) |= 0x20u;
  }
  return result;
}

uint64_t MKUpdateLoader(uint64_t *a1, int a2, __CFBundle *a3, CFDictionaryRef theDict, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  __int16 v37 = 0;
  uint64_t v36 = 0;
  int v35 = 0;
  uint64_t v6 = *a1;
  uint64_t v7 = *a1 + 1072 * a2;
  if (!*(unsigned char *)(v7 + 1000))
  {
    LOWORD(v24) = 0;
    return (__int16)v24;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Loaders");
  if (!Value || (CFDictionaryRef v14 = Value, (v15 = CFStringCreateWithCString(0, (const char *)(v7 + 1000), 0)) == 0))
  {
    LOWORD(v24) = -417;
    return (__int16)v24;
  }
  CFStringRef v16 = v15;
  CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(v14, v15);
  if (v17)
  {
    CFDictionaryRef v18 = v17;
    CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(v17, @"Loader Present");
    if (v19 && !CFBooleanGetValue(v19))
    {
      int v24 = 0;
    }
    else
    {
      CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Major Vers");
      if (v20) {
        CFNumberGetValue(v20, kCFNumberSInt16Type, &valuePtr);
      }
      CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Minor Vers");
      if (v21) {
        CFNumberGetValue(v21, kCFNumberSInt16Type, &v37);
      }
      CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Checksum");
      if (v22)
      {
        CFNumberGetValue(v22, kCFNumberSInt32Type, (char *)&v36 + 4);
        int v23 = HIDWORD(v36);
      }
      else
      {
        int v23 = 0;
      }
      int v25 = (unsigned int *)(v7 + 528);
      if ((v23 || (_WORD)valuePtr || v37)
        && (!v23 || v23 == *(_DWORD *)(v7 + 644))
        && (!(_WORD)valuePtr || (unsigned __int16)valuePtr == *(unsigned __int16 *)(v6 + 1072 * a2 + 992))
        && (!v37 || v37 == *(_WORD *)(v6 + 1072 * a2 + 994)))
      {
        int v24 = -1306;
      }
      else
      {
        int v26 = CFDictionaryGetValue(v18, @"Loader Name");
        if (v26)
        {
          unsigned int v27 = v26;
          CFRelease(v16);
          CFStringRef v16 = (const __CFString *)CFRetain(v27);
        }
        int v24 = ResolveLoaderPath(a3, v18, v16, v39);
        if (!v24)
        {
          uint64_t v28 = *(unsigned __int16 *)(v6 + 2);
          uint64_t v29 = v25[2];
          int v30 = v25[3] >= 0xC8 ? 200 : v25[3];
          int v35 = v30;
          int v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a6)(a5, 4, v28, v29);
          if (!v24)
          {
            int v24 = PMWriteContentInternal(v6, a2, v39, 0, 0x7D0000u, &v35, a5, a6);
            v25[21] = v35;
            if (!v24)
            {
              int v24 = PMChecksumExtended((uint64_t)a1, a2, 0, (uint64_t)&v36, 0x7D0000u, 0, 1, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))a6);
              if (!v24)
              {
                int v31 = v36;
                if (!HIDWORD(v36) || HIDWORD(v36) == v36)
                {
                  uint64_t v32 = *a1 + 1072 * a2;
                  *(_WORD *)(v32 + 992) = valuePtr;
                  *(_WORD *)(v32 + 994) = v37;
                  *(_DWORD *)(v32 + 644) = v31;
                  CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Post Action Code");
                  if (v33)
                  {
                    CFNumberGetValue(v33, kCFNumberSInt16Type, (char *)&valuePtr + 2);
                    if (HIWORD(valuePtr)) {
                      int v24 = 22;
                    }
                    else {
                      int v24 = 0;
                    }
                  }
                  else
                  {
                    int v24 = 0;
                  }
                }
                else
                {
                  int v24 = -5349;
                }
              }
            }
          }
        }
        if (!v16) {
          goto LABEL_47;
        }
      }
    }
  }
  else
  {
    int v24 = -415;
  }
  CFRelease(v16);
LABEL_47:
  if (v24 == -1) {
    int v24 = *__error();
  }
  return (__int16)v24;
}

uint64_t PMWriteContentInternal(uint64_t a1, int a2, const char *a3, int a4, unsigned int a5, _DWORD *a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  unint64_t v13 = *(unsigned __int16 *)(a1 + 2);
  if (a5) {
    unsigned int v14 = a5;
  }
  else {
    unsigned int v14 = 8192000;
  }
  if (v14 % v13) {
    unsigned int v15 = v14 / v13 + 1;
  }
  else {
    unsigned int v15 = v14 / v13;
  }
  size_t v16 = v15 * v13;
  CFDictionaryRef v17 = (char *)malloc_type_calloc(1uLL, v16, 0xC3F79865uLL);
  if (!v17)
  {
    int v25 = 0;
    LOWORD(v32) = 0;
    unsigned __int16 v31 = -1;
    CFNumberRef v33 = a6;
    if (!a6) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  CFDictionaryRef v18 = v17;
  if (a2 >= *(unsigned __int16 *)(a1 + 522))
  {
    int v25 = 0;
    LOWORD(v32) = 0;
    unsigned __int16 v31 = -5343;
LABEL_25:
    CFNumberRef v33 = a6;
    goto LABEL_29;
  }
  uint64_t v19 = a1 + 1072 * a2;
  int v20 = *(_DWORD *)(v19 + 536);
  int v21 = *(_DWORD *)(v19 + 540);
  CFNumberRef v22 = gzopen(a3, "rb");
  if (!v22)
  {
    int v25 = 0;
    LOWORD(v32) = 0;
    unsigned __int16 v31 = -1;
    goto LABEL_25;
  }
  int v23 = v22;
  int v24 = gzread(v22, v18, v16);
  int v25 = 0;
  if (v24)
  {
    unint64_t v26 = (v21 + v20);
    uint64_t v27 = (v20 + a4);
    while (1)
    {
      unint64_t v28 = v24;
      if (v16 != v24) {
        bzero(&v18[v24], v16 - v24);
      }
      if (v28 % v13) {
        uint64_t v29 = v28 / v13 + 1;
      }
      else {
        uint64_t v29 = v28 / v13;
      }
      if (v29 + v27 > v26)
      {
        unsigned __int16 v31 = -5344;
        goto LABEL_28;
      }
      int v30 = a8(a7, 3, v13, v27, v29, v18);
      if (v30) {
        break;
      }
      v25 += v29;
      int v24 = gzread(v23, v18, v16);
      v27 += v29;
      if (!v24) {
        goto LABEL_20;
      }
    }
    unsigned __int16 v31 = v30;
  }
  else
  {
LABEL_20:
    unsigned __int16 v31 = 0;
  }
LABEL_28:
  CFNumberRef v33 = a6;
  LOWORD(v32) = gzclose(v23);
LABEL_29:
  free(v18);
  if (v33) {
LABEL_30:
  }
    *CFNumberRef v33 = v25;
LABEL_31:
  if (v31)
  {
    LOWORD(v32) = v31;
    if (v31 == 0xFFFF) {
      int v32 = *__error();
    }
  }
  return (__int16)v32;
}

uint64_t PMChecksumExtended(uint64_t a1, int a2, unint64_t a3, uint64_t a4, unsigned int a5, int a6, char a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  if (a1)
  {
    uint64_t v15 = *(unsigned __int16 *)(*(void *)a1 + 2);
    if (a5) {
      unsigned int v16 = a5;
    }
    else {
      unsigned int v16 = 8192000;
    }
    if (v16 % v15) {
      unsigned int v17 = v16 / v15 + 1;
    }
    else {
      unsigned int v17 = v16 / v15;
    }
    unsigned int v18 = v17 * v15;
    uint64_t v19 = malloc_type_calloc(1uLL, v17 * v15, 0x97874038uLL);
    if (!v19)
    {
LABEL_38:
      int v37 = *__error();
      return (__int16)v37;
    }
    int v20 = v19;
    if (a2 >= *(unsigned __int16 *)(*(void *)a1 + 522)) {
      goto LABEL_35;
    }
    uint64_t v21 = *(void *)a1 + 1072 * a2;
    uint64_t v22 = v21 + 528;
    uint64_t v23 = *(unsigned int *)(v21 + 536);
    if ((a7 & 1) == 0 || (unsigned int v24 = *(_DWORD *)(v22 + 84)) == 0) {
      unsigned int v24 = *(_DWORD *)(v22 + 12);
    }
    unint64_t v25 = v24;
    uint64_t v26 = v23 + a6;
    unint64_t v27 = v25 - a6;
    if (!a6)
    {
      uint64_t v26 = v23;
      unint64_t v27 = v25;
    }
    unint64_t v28 = v25 + a6;
    BOOL v29 = a6 >= 0;
    if (a6 < 0) {
      uint64_t v30 = v23;
    }
    else {
      uint64_t v30 = v26;
    }
    if (v29) {
      unint64_t v31 = v27;
    }
    else {
      unint64_t v31 = v28;
    }
    int v32 = MKBlockChecksum;
    if (a3 == 1) {
      int v32 = MKBlockChecksum2;
    }
    CFNumberRef v33 = a3 >= 0xA
        ? (void (*)(uint64_t, void *, void))a3
        : (void (*)(uint64_t, void *, void))v32;
    if (v31)
    {
      unint64_t v34 = v18 / v15;
      while (1)
      {
        uint64_t v35 = v31 >= v34 ? v34 : v31;
        int v36 = a9(a8, 2, v15, v30, v35, v20);
        if (v36) {
          break;
        }
        v33(a4, v20, (v35 * v15));
        v30 += v35;
        v31 -= v35;
        if (!v31)
        {
          LOWORD(v37) = 0;
          goto LABEL_36;
        }
      }
      int v37 = v36;
      free(v20);
      if (v37 == -1) {
        goto LABEL_38;
      }
    }
    else
    {
LABEL_35:
      LOWORD(v37) = -5343;
LABEL_36:
      free(v20);
    }
  }
  else
  {
    LOWORD(v37) = -50;
  }
  return (__int16)v37;
}

uint64_t MKBlockChecksum(_DWORD *a1, unsigned int *a2, unsigned int a3)
{
  uint64_t v3 = *a1;
  if (a2 && a3 >= 4)
  {
    uint64_t v4 = (unsigned int *)((char *)a2 + (a3 & 0xFFFFFFFC));
    do
    {
      HIDWORD(v5) = v3;
      LODWORD(v5) = v3;
      unsigned int v6 = *a2++;
      uint64_t v3 = bswap32(v6) + (v5 >> 31);
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

char *OSType2Ascii(uint64_t a1, char *a2, char a3)
{
  HIDWORD(v7) = a1;
  *a2 = 0;
  if (a1 || (a3 & 1) == 0)
  {
    uint64_t v4 = 0;
    while (*((char *)&v7 + v4 + 4) > 47)
    {
      if (++v4 == 4)
      {
        sprintf(a2, "%4.4s");
        return a2;
      }
    }
    if ((a3 & 2) != 0) {
      unint64_t v5 = "0x%08x";
    }
    else {
      unint64_t v5 = "%08x";
    }
    sprintf(a2, v5, a1, v7);
  }
  return a2;
}

uint64_t MKCFUpdateScheme(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"ID");
  if (!Value) {
    return 22;
  }
  if (!CFStringGetCString(Value, buffer, 32, 0)) {
    return 22;
  }
  CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(a1, @"Sections");
  if (!v11) {
    return 22;
  }
  CFDictionaryRef v12 = CFArrayDictionarySearchWithIndexOptions(v11, @"ID", @"MAP", 0, 0);
  if (!v12) {
    return 22;
  }
  CFDictionaryRef v13 = v12;
  if (a4) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a4);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFDictionaryRef v17 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, @"Write Protect", (const void *)*MEMORY[0x263EFFB40]);
    int v18 = PMSchemeSearchByDescriptor(buffer, 0);
    if (v18 == 16)
    {
      uint64_t v19 = GPTCFUpdateSection(v13, a2, a3, v17, a5);
    }
    else if ((unsigned __int16)v18 == 8)
    {
      uint64_t v19 = MBRCFUpdateSection(v13, (uint64_t)a2, a3, v17);
    }
    else
    {
      if ((unsigned __int16)v18 != 1)
      {
        uint64_t v15 = 4294961989;
        goto LABEL_21;
      }
      uint64_t v19 = APMCFUpdateSection(v13, a2, a3, v17, a5, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
    }
    uint64_t v15 = v19;
LABEL_21:
    CFRelease(v17);
    return v15;
  }
  return 12;
}

uint64_t MKCFPrepareBootDevice(char *a1, __CFString *a2, const __CFString *a3, int a4, unsigned int a5, _DWORD *a6, unsigned char *a7)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v43 = 0;
  unsigned long long v50 = 0uLL;
  unsigned __int16 v41 = 0;
  *(_OWORD *)buffer = 0u;
  long long v49 = 0u;
  memset(v47, 0, sizeof(v47));
  BOOL v40 = 0;
  int valuePtr = 0;
  unsigned int UUID = 22;
  LOBYTE(v13) = 0;
  if ((int)MKBSDSlice(a1, (uint64_t)&v43 + 4, (uint64_t)&v43, 0) < 2) {
    goto LABEL_15;
  }
  __sprintf_chk(v53, 0, 0x20uLL, "disk%i", HIDWORD(v43));
  __sprintf_chk(v52, 0, 0x20uLL, "/dev/r%s", v53);
  __sprintf_chk(bsdName, 0, 0x20uLL, "disk%is%i", HIDWORD(v43), v43);
  if (!v43 || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0)
  {
    LOBYTE(v13) = 0;
    goto LABEL_15;
  }
  uint64_t v15 = Mutable;
  unsigned int v16 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(Mutable, @"Writable", (const void *)*MEMORY[0x263EFFB40]);
  if ((a4 & 2) != 0) {
    CFDictionarySetValue(v15, @"Shared Writer", v16);
  }
  unsigned int UUID = DevEntryCopyRegistryProperties(bsdName, (CFMutableDictionaryRef *)&cf);
  if (UUID)
  {
    LOBYTE(v13) = 0;
    CFDictionaryRef v17 = v15;
LABEL_14:
    CFRelease(v17);
    goto LABEL_15;
  }
  CFStringRef v18 = (const __CFString *)MKMediaCreateWithPath(0, v52, v15, &UUID);
  if (UUID)
  {
    LOBYTE(v13) = 0;
    CFDictionaryRef v17 = 0;
    goto LABEL_11;
  }
  int v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v17 = v20;
  if (v20)
  {
    CFDictionarySetValue(v20, @"Include most", v16);
    uint64_t v21 = MKCFReadMedia(v17, v18, (int *)&UUID);
    if (v21)
    {
      unsigned int UUID = -5343;
      CFDictionaryRef v39 = v21;
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v21, @"Schemes");
      if (!Value) {
        goto LABEL_32;
      }
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
      if (!ValueAtIndex) {
        goto LABEL_32;
      }
      CFArrayRef v24 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Sections");
      if (!v24) {
        goto LABEL_32;
      }
      CFDictionaryRef v25 = CFArrayDictionarySearchWithIndexOptions(v24, @"ID", @"MAP", 0, 0);
      if (!v25) {
        goto LABEL_32;
      }
      CFDictionaryRef theDict = v25;
      CFArrayRef v13 = (const __CFArray *)CFDictionaryGetValue(v25, @"Partitions");
      if (!v13)
      {
LABEL_33:
        MKCFDisposeMedia(v39);
        goto LABEL_11;
      }
      CFStringRef v26 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Partition ID");
      if (!v26
        || (CFDictionaryRef v27 = CFArrayDictionarySearchWithIndexOptions(v13, @"Partition ID", v26, 0, 0)) == 0
        || (CFDictionaryRef v35 = v27,
            CFRelease(cf),
            CFTypeRef cf = 0,
            (unsigned int UUID = CFDictionaryGetUUID(v35, @"GUID", (unsigned __int8 *)&v50)) != 0))
      {
LABEL_32:
        LOBYTE(v13) = 0;
        goto LABEL_33;
      }
      CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Revision");
      if (v28) {
        CFNumberGetValue(v28, kCFNumberSInt32Type, &valuePtr);
      }
      CFArrayRef v36 = v13;
      int theDicta = (uint64_t *)mkcfrecoverref(theDict);
      if (valuePtr == 0x10000)
      {
        LOBYTE(v13) = 0;
        unsigned int UUID = GPTMakePartBootable(0, theDicta, (unsigned __int8 *)&v50, a2, a3, (uint64_t)v18, a4, a5, &v40);
        if (UUID || !v40) {
          goto LABEL_58;
        }
        unsigned int UUID = GPTWriteMedia(theDicta, 0, (uint64_t)v18);
        if (UUID) {
          goto LABEL_55;
        }
        unsigned int v30 = GPTUpdatePartitionDictionaries(theDicta, v36);
      }
      else
      {
        if (valuePtr)
        {
          LOBYTE(v13) = 0;
          unsigned int UUID = 0;
LABEL_58:
          CFRelease(v18);
          if (!UUID)
          {
            unsigned int UUID = -5343;
            CFStringRef v18 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)&v50);
            if (!v18) {
              goto LABEL_33;
            }
            CFDictionaryRef v31 = CFArrayDictionarySearchWithIndexOptions(v36, @"GUID", v18, 0, 0);
            CFRelease(v18);
            if (v31)
            {
              int v32 = CFDictionaryGetValue(v31, @"Partition ID");
              if (v32)
              {
                unsigned int UUID = DevEntryCopyChildPropertiesMatchingProperty(v53, @"Partition ID", v32, &cf);
                if (!UUID)
                {
                  CFStringRef v33 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
                  CFStringGetCString(v33, __s, 32, 0x8000100u);
                  unint64_t v34 = strrchr(__s, 115);
                  CFStringRef v18 = 0;
                  LODWORD(v43) = atoi(v34 + 1);
                  goto LABEL_33;
                }
              }
            }
          }
          CFStringRef v18 = 0;
          goto LABEL_33;
        }
        if (a2)
        {
          unsigned int UUID = PMCFSetupPartitionType(*(__int16 *)(*theDicta + 514), a2, &v41, (char *)v47);
          if (UUID) {
            a2 = 0;
          }
          else {
            a2 = (__CFString *)v47;
          }
        }
        if (a3)
        {
          BOOL v29 = buffer;
          CFStringGetCString(a3, buffer, 32, 0);
        }
        else
        {
          BOOL v29 = 0;
        }
        LOBYTE(v13) = 0;
        unsigned int UUID = MKMakePartBootable(0, (const void **)theDicta, &v50, v41, (char *)a2, v29, a4, (uint64_t)v18, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO, &v40);
        if (UUID || !v40) {
          goto LABEL_58;
        }
        unsigned int UUID = VWritePartitions((Ptr *)theDicta, 0xFFFFu, 0xC090u, (uint64_t)v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))MKMediaDeviceIO);
        if (UUID)
        {
LABEL_55:
          LOBYTE(v13) = 0;
          goto LABEL_58;
        }
        unsigned int v30 = MKCFRecordPartitions(theDicta, v36);
      }
      unsigned int UUID = v30;
      LOBYTE(v13) = 1;
      goto LABEL_58;
    }
    LOBYTE(v13) = 0;
  }
  else
  {
    LOBYTE(v13) = 0;
    unsigned int UUID = 12;
  }
LABEL_11:
  if (v18) {
    CFRelease(v18);
  }
  CFRelease(v15);
  if (v17) {
    goto LABEL_14;
  }
LABEL_15:
  if (cf) {
    CFRelease(cf);
  }
  if (a6) {
    *a6 = v43;
  }
  if (a7) {
    *a7 = (_BYTE)v13;
  }
  return UUID;
}

uint64_t GPTMakePartBootable(__CFBundle *a1, uint64_t *a2, unsigned __int8 *a3, __CFString *a4, const __CFString *a5, uint64_t a6, int a7, unsigned int a8, BOOL *a9)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unsigned int v47 = 22;
  *a9 = 0;
  unsigned int v16 = a1;
  if (!a1)
  {
    unsigned int v16 = MKAccessLibrary(0);
    if (!v16)
    {
      LODWORD(a4) = 0;
      goto LABEL_14;
    }
  }
  __int16 v46 = 0;
  int v45 = 0;
  memset(v44, 0, 154);
  CFURLRef v17 = MKLoadDB(v16, @"database", (int *)&v47);
  if (!v17)
  {
    LODWORD(a4) = 0;
    if (!a1) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  CFURLRef v18 = v17;
  CFURLRef v19 = MKLoadDB(v16, @"inventory", (int *)&v47);
  if (v19)
  {
    CFURLRef cf = v19;
    unsigned int v47 = gpmrsearch(a2, a3, &v46);
    if (v47)
    {
      LODWORD(a4) = 0;
LABEL_7:
      CFRelease(v18);
      CFURLRef v18 = cf;
      goto LABEL_11;
    }
    int v41 = a7;
    uint64_t v21 = *a2;
    int v22 = v46;
    unsigned int v23 = *(_DWORD *)(*a2 + 32);
    BOOL v24 = v23 >= 0x400;
    int v25 = a8 / (v23 >> 9);
    if (!v24) {
      int v25 = a8;
    }
    unsigned int v40 = v25;
    int v38 = v46;
    uint64_t v39 = *a2;
    if (a4)
    {
      uint64_t v26 = *a2;
      int v27 = v46;
      CFStringGetCString(a4, (char *)buffer, 96, 0x8000100u);
      GPTuuidType2HumanExtended(buffer, (const char *)buffer, 96, 0, 0);
      int v28 = utf8strcompare(1uLL, (char *)(v26 + 152 * v27 + 144), (const char *)buffer);
      if (!a5)
      {
        if (!v28)
        {
          LODWORD(a4) = 0;
          goto LABEL_32;
        }
        goto LABEL_27;
      }
      int v22 = v38;
      uint64_t v21 = v39;
    }
    else
    {
      int v28 = 0;
      if (!a5)
      {
LABEL_33:
        CFStringRef v29 = CFStringCreateWithCString(0, (const char *)(v21 + 152 * v22 + 144), 0);
        if (!v29)
        {
          unsigned int v47 = -1;
          goto LABEL_7;
        }
        CFStringRef v30 = v29;
        unsigned int v47 = MKLookupSchemeFormat(v18, @"GPT", v29, 1, v44);
        CFRelease(v30);
        if (v47 || !LOWORD(v44[0])) {
          goto LABEL_7;
        }
        unsigned int v31 = 0;
        int v32 = (char *)v44 + 2;
        while (1)
        {
          CFStringRef v33 = CFStringCreateWithCString(0, v32, 0);
          if (!v33) {
            goto LABEL_7;
          }
          CFStringRef v34 = v33;
          int v35 = *((unsigned __int16 *)v32 + 17);
          if (v35 == 6) {
            break;
          }
          if (v35 != 5)
          {
            if (v35 == 1) {
              break;
            }
            unsigned int v47 = -4;
          }
LABEL_47:
          CFRelease(v34);
          if (!v47)
          {
            ++v31;
            v32 += 38;
            if (v31 < LOWORD(v44[0])) {
              continue;
            }
          }
          goto LABEL_7;
        }
        unsigned int v36 = mediaLoaderSupport(v16, v33, a2, a3, a6, v35, v40, v41, 0, 1u, 0, &v45);
        if (v36 == 28) {
          unsigned int v37 = 0;
        }
        else {
          unsigned int v37 = v36;
        }
        unsigned int v47 = v37;
        if (!v37) {
          LODWORD(a4) = (v45 & 1) + a4;
        }
        goto LABEL_47;
      }
    }
    a4 = (__CFString *)(v21 + 152 * v22 + 96);
    CFStringGetCString(a5, v49, 96, 0x8000100u);
    LODWORD(a4) = utf8strcompare(1uLL, (char *)a4, v49);
    if (v28)
    {
      __strlcpy_chk();
      if (!a4) {
        goto LABEL_28;
      }
    }
    else if (!a4)
    {
      goto LABEL_32;
    }
LABEL_27:
    __strlcpy_chk();
LABEL_28:
    if ((v41 & 4) == 0)
    {
      int v22 = v38;
      uint64_t v21 = v39;
      *(void *)(v39 + 152 * v38 + 232) |= 8uLL;
      LODWORD(a4) = 1;
      goto LABEL_33;
    }
    LODWORD(a4) = 1;
LABEL_32:
    int v22 = v38;
    uint64_t v21 = v39;
    goto LABEL_33;
  }
  LODWORD(a4) = 0;
LABEL_11:
  CFRelease(v18);
  if (!a1) {
LABEL_12:
  }
    CFRelease(v16);
LABEL_14:
  *a9 = (int)a4 > 0;
  return v47;
}

uint64_t DevEntryCopyChildPropertiesMatchingProperty(char *bsdName, const __CFString *a2, const void *a3, void *a4)
{
  io_iterator_t iterator = 0;
  CFMutableDictionaryRef v21 = 0;
  mach_port_t v7 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v8 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, bsdName);
  uint64_t MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!MatchingService)
  {
    uint64_t v12 = 2;
    goto LABEL_15;
  }
  io_object_t v10 = MatchingService;
  uint64_t v11 = MEMORY[0x223C206F0](MatchingService, "IOService", &iterator);
  if (v11)
  {
    uint64_t v12 = v11;
    LODWORD(v13) = 0;
    goto LABEL_13;
  }
  uint64_t v14 = IOIteratorNext(iterator);
  if (!v14)
  {
LABEL_9:
    IOObjectRelease(iterator);
    LODWORD(v13) = 0;
    io_iterator_t iterator = 0;
LABEL_10:
    uint64_t v12 = 22;
    goto LABEL_13;
  }
  uint64_t v13 = v14;
  while (!IOObjectConformsTo(v13, "IOPartitionScheme"))
  {
    IOObjectRelease(v13);
    uint64_t v13 = IOIteratorNext(iterator);
    if (!v13) {
      goto LABEL_9;
    }
  }
  IOObjectRelease(iterator);
  io_iterator_t iterator = 0;
  uint64_t v15 = MEMORY[0x223C206F0](v13, "IOService", &iterator);
  if (!v15)
  {
    io_object_t v17 = IOIteratorNext(iterator);
    if (v17)
    {
      io_registry_entry_t v18 = v17;
      CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v12 = 22;
      while (1)
      {
        CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v18, a2, v19, 0);
        if (CFProperty)
        {
          if (CFEqual(CFProperty, a3)) {
            break;
          }
        }
        IOObjectRelease(v18);
        io_registry_entry_t v18 = IOIteratorNext(iterator);
        if (!v18) {
          goto LABEL_13;
        }
      }
      uint64_t v12 = IORegistryEntryCreateCFProperties(v18, &v21, v19, 0);
      IOObjectRelease(v18);
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  uint64_t v12 = v15;
LABEL_13:
  IOObjectRelease(v10);
  if (v13) {
    IOObjectRelease(v13);
  }
LABEL_15:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  *a4 = v21;
  return v12;
}

uint64_t MKMediaCreateWithSubRange(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, _DWORD *a5)
{
  int v15 = 22;
  if (!a2
    || ((unint64_t v9 = *(void *)(a2 + 96), v9 > a3) ? (v10 = a4 + a3 > v9) : (v10 = 1),
        v10 || (unint64_t v11 = (unint64_t)*(unsigned int *)(a2 + 104) >> 9, v15 = -5308, a3 % v11) || a4 % v11))
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = (uint64_t)malloc_type_malloc(0x28uLL, 0x1060040762F0DD2uLL);
    if (result)
    {
      uint64_t v14 = (void *)result;
      *(_DWORD *)uint64_t result = 1296790386;
      *(void *)(result + 8) = CFRetain((CFTypeRef)a2);
      v14[2] = a3;
      v14[3] = a4;
      v14[4] = 0;
      int v15 = 0;
      uint64_t result = MKMediaCreate(a1, (uint64_t)v14, (uint64_t)&kMKMediaSubRangeVector, 0, &v15);
      if (result) {
        *(void *)(result + 124) = *(void *)(a2 + 124);
      }
    }
    else
    {
      int v15 = 12;
    }
  }
  if (a5) {
    *a5 = v15;
  }
  return result;
}

uint64_t _MKMediaSubRangeInitialize(uint64_t a1)
{
  if (!a1) {
    return 22;
  }
  if (*(_DWORD *)a1 != 1296790386) {
    return 22;
  }
  long long v8 = 0u;
  long long v9 = 0u;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 32) = Mutable;
  if (!Mutable) {
    return *__error();
  }
  uint64_t v3 = Mutable;
  MKMediaGetGeometry(*(void *)(a1 + 8), (uint64_t)&v8);
  uint64_t v4 = (const void **)MEMORY[0x263EFFB40];
  if (!DWORD2(v9)) {
    uint64_t v4 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(v3, @"Writable", *v4);
  uint64_t valuePtr = *(void *)(a1 + 16);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"Subrange Offset", v5);
  CFRelease(v5);
  return 0;
}

const void *_MKMediaSubRangeCopyProperty(uint64_t a1, void *key)
{
  if (!key) {
    return 0;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 32);
  if (v4 && (CFNumberRef v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    CFArrayRef Value = v5;
    CFMutableDictionaryRef Mutable = 0;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    _MKMediaSubRangeGetGeoProperties(a1, Mutable);
    CFArrayRef Value = CFDictionaryGetValue(Mutable, key);
    if (!Value) {
      goto LABEL_8;
    }
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Value;
}

uint64_t _MKMediaSubRangeGetGeoProperties(uint64_t a1, __CFDictionary *a2)
{
  if (!a1) {
    return 22;
  }
  if (*(_DWORD *)a1 != 1296790386) {
    return 22;
  }
  long long v7 = 0u;
  long long v8 = 0u;
  MKMediaGetGeometry(*(void *)(a1 + 8), (uint64_t)&v7);
  unint64_t v4 = *(void *)(a1 + 24);
  if ((unint64_t)v8 >= v4) {
    uint64_t v5 = *(void *)(a1 + 24);
  }
  else {
    uint64_t v5 = v8;
  }
  return _MKMediaSetupGeometry(a2, v7, v4, v5);
}

uint64_t MKFileSystemDetect(uint64_t a1, int *a2, int *a3, _DWORD *a4)
{
  *a2 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  long long v8 = (char *)malloc_type_malloc(0x1000uLL, 0x739AAA81uLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  long long v9 = (unsigned __int8 *)v8;
  uint64_t Blocks = MKMediaReadBlocks(a1, 0, 1, 0x1000u, v8, 0);
  if (!Blocks)
  {
    uint64_t v11 = MKDetectHFS(a1, v9, a2, a3, a4);
    if (*a2 <= 4999
      && (uint64_t v11 = MKDetectAPFS(a1, (uint64_t)v9, a2, a3, a4), *a2 <= 4999)
      && (uint64_t v11 = MKDetectEFATFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (uint64_t v11 = MKDetectFATFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (uint64_t v11 = MKDetectNTFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (uint64_t v11 = MKDetectISO(a1, a2, a4, 0), *a2 <= 4999))
    {
      uint64_t Blocks = 0;
      *a2 = 0;
    }
    else
    {
      uint64_t Blocks = v11;
    }
  }
  free(v9);
  return Blocks;
}

uint64_t _MKMediaSubRangeReadSectors(uint64_t a1, uint64_t a2, unint64_t a3, char *a4, void *a5)
{
  return MKMediaReadSectors(*(void *)(a1 + 8), *(void *)(a1 + 16) + a2, a3, a4, a5);
}

uint64_t MKDetectHFS(uint64_t a1, _WORD *a2, _DWORD *a3, int *a4, _DWORD *a5)
{
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
  BOOL v10 = (char *)malloc_type_malloc(0x200uLL, 0xA7D2099DuLL);
  if (v10)
  {
    uint64_t v11 = v10;
    if (*a2 == 19276) {
      *a3 += 1000;
    }
    uint64_t Blocks = MKMediaReadBlocks(a1, 2, 1, 0x200u, v10, 0);
    if (Blocks) {
      goto LABEL_20;
    }
    unsigned int v13 = bswap32(*(unsigned __int16 *)v11) >> 16;
    switch(v13)
    {
      case 0x4858u:
        int v14 = 4;
        break;
      case 0x482Bu:
        int v14 = 2;
        break;
      case 0x4244u:
        if (*((_WORD *)v11 + 62) == 11080) {
          int v14 = 3;
        }
        else {
          int v14 = 1;
        }
        break;
      default:
LABEL_20:
        free(v11);
        return Blocks;
    }
    *a3 = 5000;
    if (a5) {
      *a5 = 1;
    }
    if (a4) {
      *a4 = v14;
    }
    goto LABEL_20;
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKHFSProcessVolumeUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  data[1] = *MEMORY[0x263EF8340];
  memset(&v11, 0, sizeof(v11));
  uint64_t result = MKMediaReadBlocks(a1, 2, 1, 0x200u, (char *)v12, 0);
  if (result) {
    return result;
  }
  unsigned int v7 = bswap32(v12[0]) >> 16;
  if (v7 == 18520 || v7 == 18475)
  {
    int v9 = 0;
    goto LABEL_9;
  }
  if (v7 != 16964) {
    return 4294967239;
  }
  TAO_HFSMasterDirectoryBlock_BigToHost(v12);
  if (v16 != 18475) {
    return 4294967173;
  }
  int v9 = v14 + (v13 >> 9) * v17;
  uint64_t result = MKMediaReadBlocks(a1, (v9 + 2), 1, 0x200u, (char *)v12, 0);
  if (!result)
  {
LABEL_9:
    double v10 = TAO_HFSPlusVolumeHeader_BigToHost(v12);
    if (a2)
    {
      if (a2 != 1)
      {
        if (a2 != 2) {
          return 22;
        }
        MEMORY[0x223C20E30](a3, v10);
      }
      uint64_t v15 = *(void *)(a3 + 4);
      TAO_HFSPlusVolumeHeader_BigToHost(v12);
      a2 = MKMediaWriteBlocks(a1, (v9 + 2), 1, 0x200u, (char *)v12, 0);
    }
    data[0] = v15;
    CC_MD5_Init(&v11);
    CC_MD5_Update(&v11, &unk_21E15F540, 0x10u);
    CC_MD5_Update(&v11, data, 8u);
    CC_MD5_Final((unsigned __int8 *)a3, &v11);
    *(unsigned char *)(a3 + 6) = *(unsigned char *)(a3 + 6) & 0xF | 0x30;
    *(unsigned char *)(a3 + 8) = *(unsigned char *)(a3 + 8) & 0x3F | 0x80;
    return a2;
  }
  return result;
}

double TAO_HFSPlusVolumeHeader_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *(int8x16_t *)(a1 + 18) = vrev32q_s8(*(int8x16_t *)(a1 + 18));
  *(int8x16_t *)(a1 + 26) = vrev32q_s8(*(int8x16_t *)(a1 + 26));
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  *((void *)a1 + 9) = bswap64(*((void *)a1 + 9));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 56));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 96));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 136));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 176));
  *(void *)&double result = TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 TAO_HFSPlusForkData_BigToHost(uint64_t a1)
{
  uint64_t v1 = 0;
  *(void *)a1 = bswap64(*(void *)a1);
  *(int8x8_t *)(a1 + 8) = vrev32_s8(*(int8x8_t *)(a1 + 8));
  do
  {
    unsigned int v2 = (float *)(a1 + 16 + v1);
    float32x4x2_t v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
    v1 += 32;
  }
  while (v1 != 64);
  return (__n128)v4.val[0];
}

__n128 TAO_HFSPlusExtentRecord_BigToHost(uint64_t a1)
{
  for (uint64_t i = 0; i != 64; i += 32)
  {
    unsigned int v2 = (float *)(a1 + i);
    float32x4x2_t v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
  }
  return (__n128)v4.val[0];
}

int8x8_t TAO_HFSPlusExtentDescriptor_BigToHost(int8x8_t *a1)
{
  int8x8_t result = vrev32_s8(*a1);
  *a1 = result;
  return result;
}

uint64_t _MKMediaSubRangeWriteSectors(uint64_t a1, uint64_t a2, unint64_t a3, char *a4, void *a5)
{
  return MKMediaWriteSectors(*(void *)(a1 + 8), *(void *)(a1 + 16) + a2, a3, a4, a5);
}

void _MKMediaSubRangeDeinitialize(void *a1)
{
  if (a1 && *(_DWORD *)a1 == 1296790386)
  {
    unsigned int v2 = (const void *)a1[1];
    if (v2)
    {
      CFRelease(v2);
      a1[1] = 0;
    }
    uint64_t v3 = (const void *)a1[4];
    if (v3) {
      CFRelease(v3);
    }
    free(a1);
  }
}

uint64_t MKCFUpdateMedia(const __CFDictionary *a1, __CFBundle *a2, unsigned __int16 a3, const __CFDictionary *a4, uint64_t a5)
{
  unsigned __int16 valuePtr = a3;
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Schemes");
  if (!Value) {
    return 22;
  }
  CFArrayRef v9 = Value;
  uint64_t Count = (unsigned __int16)CFArrayGetCount(Value);
  if (!Count) {
    return 22;
  }
  CFIndex v11 = 0;
  uint64_t v12 = 0;
  do
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v11);
    if (ValueAtIndex)
    {
      unsigned __int16 v14 = ValueAtIndex;
      if (valuePtr != 1)
      {
        if (valuePtr)
        {
          CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
          CFDictionarySetValue(v14, @"Alignment", v17);
          CFRelease(v17);
        }
        else
        {
          CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Alignment");
          if (v15) {
            CFNumberGetValue(v15, kCFNumberSInt16Type, &valuePtr);
          }
        }
      }
      unsigned int v18 = MKCFUpdateScheme(v14, a2, valuePtr, a4, a5);
      if (v18) {
        BOOL v19 = v12 == 0;
      }
      else {
        BOOL v19 = 0;
      }
      if (v19) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v18;
      }
      if (v19) {
        uint64_t v12 = v18;
      }
      else {
        uint64_t v12 = v12;
      }
    }
    else
    {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
    ++v11;
  }
  while (Count != v11);
  if (!v12)
  {
    uint64_t v12 = v16;
    if (v16 == -1) {
      return *__error();
    }
  }
  return v12;
}

uint64_t IOEngineInitialize()
{
  NumJobs = 0;
  qsort(&InfoLookupTable, 0x11uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))InfoLookupRecCompare);
  return 0;
}

CFComparisonResult InfoLookupRecCompare(CFStringRef *a1, CFStringRef *a2)
{
  return CFStringCompare(*a1, *a2, 0);
}

uint64_t IOJobSetup(uint64_t *a1, const __CFDictionary *a2, uint64_t a3)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  pthread_t v100 = 0;
  long long v101 = 0;
  memset(&v106, 0, sizeof(v106));
  v105.__sig = 0;
  *(void *)v105.__opaque = 0;
  unsigned int v6 = malloc_type_calloc(1uLL, 0x230uLL, 0x10A0040A93B80A1uLL);
  if (!v6)
  {
    *a1 = 0;
    return *__error();
  }
  uint64_t v7 = (uint64_t)v6;
  v6[42] = 0;
  *((_WORD *)v6 + 80) = 512;
  v6[133] = 0;
  *((void *)v6 + 22) = -1;
  *((_WORD *)v6 + 268) = 0;
  v6[138] = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"Block Size");
  if (!Value) {
    goto LABEL_76;
  }
  CFNumberRef v9 = Value;
  CFTypeID v10 = CFGetTypeID(Value);
  if (v10 != CFNumberGetTypeID()) {
    goto LABEL_76;
  }
  __int16 v104 = 0;
  int valuePtr = 0;
  uint64_t v102 = 0;
  CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
  *(_DWORD *)(v7 + 240) = valuePtr;
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Buffer Size");
  if (!v11) {
    goto LABEL_76;
  }
  CFNumberRef v12 = v11;
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFNumberGetTypeID()) {
    goto LABEL_76;
  }
  CFNumberGetValue(v12, kCFNumberSInt32Type, (void *)(v7 + 244));
  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Buffer Count");
  if (!v14) {
    goto LABEL_76;
  }
  CFNumberRef v15 = v14;
  CFTypeID v16 = CFGetTypeID(v14);
  if (v16 != CFNumberGetTypeID()) {
    goto LABEL_76;
  }
  CFNumberRef v17 = (_WORD *)(v7 + 250);
  CFNumberGetValue(v15, kCFNumberSInt16Type, (void *)(v7 + 250));
  CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Thread Count");
  if (v18)
  {
    CFNumberRef v19 = v18;
    CFTypeID v20 = CFGetTypeID(v18);
    if (v20 != CFNumberGetTypeID()) {
      goto LABEL_76;
    }
    CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(v7 + 248));
  }
  CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Percent Threshold");
  if (v21)
  {
    CFNumberRef v22 = v21;
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 != CFNumberGetTypeID()) {
      goto LABEL_76;
    }
    CFNumberGetValue(v22, kCFNumberSInt16Type, (void *)(v7 + 252));
  }
  CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(a2, @"Time Threshold");
  if (v24)
  {
    CFNumberRef v25 = v24;
    CFTypeID v26 = CFGetTypeID(v24);
    if (v26 != CFNumberGetTypeID()) {
      goto LABEL_76;
    }
    CFNumberGetValue(v25, kCFNumberSInt16Type, (void *)(v7 + 254));
  }
  if (!*(_WORD *)(v7 + 252) && !*(_WORD *)(v7 + 254)) {
    *(_WORD *)(v7 + 252) = 1;
  }
  *(_DWORD *)(v7 + 280) = 0;
  int v27 = CFDictionaryGetValue(a2, @"Allow Skips");
  if (!v27) {
    goto LABEL_24;
  }
  int v28 = v27;
  CFTypeID v29 = CFGetTypeID(v27);
  if (v29 != CFBooleanGetTypeID())
  {
LABEL_76:
    char v69 = 0;
    uint64_t v37 = 22;
    goto LABEL_77;
  }
  if (CFEqual(v28, (CFTypeRef)*MEMORY[0x263EFFB40]))
  {
    *(_DWORD *)(v7 + 280) = 500;
    CFStringRef v30 = malloc_type_calloc(1uLL, 0x5DC8uLL, 0x574AE41AuLL);
    *(void *)(v7 + 288) = v30;
    if (!v30)
    {
LABEL_70:
      uint64_t v37 = *__error();
      goto LABEL_71;
    }
  }
LABEL_24:
  CFArrayRef v31 = (const __CFArray *)CFDictionaryGetValue(a2, @"Instructions");
  if (!v31) {
    goto LABEL_76;
  }
  CFArrayRef v32 = v31;
  CFTypeID v33 = CFGetTypeID(v31);
  if (v33 != CFArrayGetTypeID()) {
    goto LABEL_76;
  }
  int valuePtr = CFArrayGetCount(v32);
  CFStringRef v34 = malloc_type_calloc(1uLL, (48 * valuePtr) | 8, 0xD6EE9DCFuLL);
  *(void *)(v7 + 256) = v34;
  if (!v34) {
    goto LABEL_70;
  }
  *CFStringRef v34 = valuePtr;
  if (valuePtr < 1) {
    goto LABEL_73;
  }
  CFIndex v35 = 0;
  unsigned int v36 = (CFTypeRef *)(v34 + 6);
  uint64_t v37 = 22;
  while (1)
  {
    CFIndex v98 = v35;
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v32, v35);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v39 = ValueAtIndex;
    CFTypeID v40 = CFGetTypeID(ValueAtIndex);
    if (v40 != CFDictionaryGetTypeID()) {
      break;
    }
    long long v99 = v36;
    CFNumberRef v41 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Instruction Code");
    if (!v41) {
      break;
    }
    CFNumberRef v42 = v41;
    CFTypeID v43 = CFGetTypeID(v41);
    if (v43 != CFNumberGetTypeID()) {
      break;
    }
    CFNumberGetValue(v42, kCFNumberSInt16Type, &v104);
    *((_DWORD *)v99 - 4) = v104;
    CFNumberRef v44 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Block Count");
    if (!v44) {
      break;
    }
    CFNumberRef v45 = v44;
    CFTypeID v46 = CFGetTypeID(v44);
    if (v46 != CFNumberGetTypeID()) {
      break;
    }
    CFNumberGetValue(v45, kCFNumberSInt64Type, &v102);
    unsigned int v47 = v99;
    v99[1] = v102;
    CFNumberRef v48 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Source Offset");
    if (v48)
    {
      CFNumberRef v49 = v48;
      CFTypeID v50 = CFGetTypeID(v48);
      if (v50 != CFNumberGetTypeID()) {
        break;
      }
      CFNumberGetValue(v49, kCFNumberSInt64Type, &v102);
      unsigned int v47 = v99;
      v99[2] = v102;
    }
    else
    {
      unsigned int v51 = *((_DWORD *)v99 - 4);
      if (v51 <= 8 && ((1 << v51) & 0x1BA) != 0) {
        break;
      }
    }
    CFNumberRef v52 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Target Offset");
    if (v52)
    {
      CFNumberRef v53 = v52;
      CFTypeID v54 = CFGetTypeID(v52);
      if (v54 != CFNumberGetTypeID()) {
        break;
      }
      CFNumberGetValue(v53, kCFNumberSInt64Type, &v102);
      unsigned int v47 = v99;
      v99[3] = v102;
      unsigned int v55 = *((_DWORD *)v99 - 4);
    }
    else
    {
      unsigned int v55 = *((_DWORD *)v47 - 4);
      if (v55 <= 0xA && ((1 << v55) & 0x5A6) != 0) {
        break;
      }
    }
    if (v55 == 7 || v55 == 4)
    {
      CFNumberRef v56 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Checksum Type");
      if (!v56) {
        break;
      }
      CFNumberRef v57 = v56;
      CFTypeID v58 = CFGetTypeID(v56);
      if (v58 != CFNumberGetTypeID()) {
        break;
      }
      CFNumberGetValue(v57, kCFNumberSInt16Type, &v104);
      uint64_t v59 = IOSetParams(v7, v98);
      if (v59)
      {
        uint64_t v37 = v59;
        break;
      }
      uint64_t v37 = 0;
      if (*(_DWORD *)(v7 + 552) == -1) {
        *(_DWORD *)(v7 + 552) = v98;
      }
      unsigned int v47 = v99;
    }
    unsigned int v60 = CFDictionaryGetValue(v39, @"Source Device");
    if (v60)
    {
      int v61 = v60;
      CFTypeID v62 = CFGetTypeID(v60);
      if (v62 != MKMediaGetTypeID()) {
        break;
      }
      unsigned int v47 = v99;
      *(v99 - 1) = CFRetain(v61);
    }
    else
    {
      unsigned int v63 = *((_DWORD *)v47 - 4);
      if (v63 <= 8 && ((1 << v63) & 0x1BA) != 0) {
        break;
      }
    }
    int v64 = CFDictionaryGetValue(v39, @"Target Device");
    if (v64)
    {
      uint64_t v65 = v64;
      CFTypeID v66 = CFGetTypeID(v64);
      if (v66 != MKMediaGetTypeID()) {
        break;
      }
      unsigned int v47 = v99;
      *long long v99 = CFRetain(v65);
    }
    else
    {
      unsigned int v67 = *((_DWORD *)v47 - 4);
      if (v67 <= 0xA && ((1 << v67) & 0x5A6) != 0) {
        break;
      }
    }
    CFIndex v35 = v98 + 1;
    int v68 = valuePtr;
    unsigned int v36 = v47 + 6;
    if (v98 + 1 >= valuePtr)
    {
      LODWORD(v98) = v98 + 1;
      goto LABEL_68;
    }
  }
  int v68 = valuePtr;
LABEL_68:
  if ((int)v98 >= v68)
  {
LABEL_73:
    *(int8x16_t *)(v7 + 264) = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
    goto LABEL_74;
  }
  if (v37 == -1) {
    goto LABEL_70;
  }
LABEL_71:
  if (v37)
  {
LABEL_72:
    char v69 = 0;
    goto LABEL_77;
  }
LABEL_74:
  unsigned int v71 = *(_DWORD *)(v7 + 240);
  unsigned int v70 = *(_DWORD *)(v7 + 244);
  if (v70 < v71 || v70 % v71) {
    goto LABEL_76;
  }
  uint64_t v80 = pthread_mutexattr_init(&v105);
  if (v80)
  {
    uint64_t v37 = v80;
    goto LABEL_72;
  }
  uint64_t v81 = pthread_mutexattr_settype(&v105, 2);
  if (v81 || (uint64_t v81 = pthread_mutex_init((pthread_mutex_t *)v7, &v105), v81))
  {
    uint64_t v37 = v81;
    char v69 = 1;
    goto LABEL_77;
  }
  uint64_t v82 = pthread_cond_init((pthread_cond_t *)(v7 + 64), 0);
  if (v82)
  {
    uint64_t v37 = v82;
    char v69 = 3;
    goto LABEL_77;
  }
  uint64_t v83 = pthread_cond_init((pthread_cond_t *)(v7 + 112), 0);
  if (v83)
  {
    uint64_t v37 = v83;
    char v69 = 7;
    goto LABEL_77;
  }
  uint64_t v84 = pthread_mutex_init((pthread_mutex_t *)(v7 + 416), 0);
  if (v84)
  {
    uint64_t v37 = v84;
    char v69 = 15;
    goto LABEL_77;
  }
  uint64_t v85 = pthread_cond_init((pthread_cond_t *)(v7 + 480), 0);
  if (v85)
  {
    uint64_t v37 = v85;
    char v69 = 31;
    goto LABEL_77;
  }
  if (*v17)
  {
    int v86 = 0;
    do
    {
      uint64_t v87 = IONewBuffer(&v101, *(_DWORD *)(v7 + 244));
      if (v87) {
        goto LABEL_136;
      }
      stkputbtm(v7 + 296, v101);
    }
    while (++v86 < (unsigned __int16)*v17);
  }
  long long v88 = *(_DWORD **)(v7 + 256);
  int v89 = *v88;
  if (*v88)
  {
    uint64_t v90 = *(void *)(v7 + 200);
    long long v91 = (uint64_t *)(v88 + 8);
    do
    {
      uint64_t v92 = *v91;
      v91 += 6;
      v90 += v92;
      --v89;
    }
    while (v89);
    *(void *)(v7 + 200) = v90;
  }
  else
  {
    uint64_t v90 = *(void *)(v7 + 200);
  }
  if (v90)
  {
    uint64_t v87 = pthread_attr_init(&v106);
    if (v87)
    {
LABEL_136:
      uint64_t v37 = v87;
      char v69 = 63;
      goto LABEL_77;
    }
    uint64_t v93 = pthread_attr_setdetachstate(&v106, 2);
    if (v93)
    {
LABEL_139:
      uint64_t v37 = v93;
      char v69 = 127;
    }
    else
    {
      unsigned __int16 v94 = *(_WORD *)(v7 + 248);
      unsigned __int16 v95 = *(_WORD *)(v7 + 250);
      if ((unsigned __int16)(v94 - 1) >= v95)
      {
        *(_WORD *)(v7 + 248) = v95;
        unsigned __int16 v94 = v95;
      }
      if (*(unsigned __int16 *)(v7 + 164) >= v94)
      {
LABEL_146:
        uint64_t v37 = 0;
        ++NumJobs;
        char v69 = 127;
LABEL_102:
        pthread_attr_destroy(&v106);
        int v77 = v69 & 0x10;
        uint64_t v78 = v7;
        goto LABEL_103;
      }
      while (1)
      {
        long long v96 = malloc_type_malloc(0x10uLL, 0x10200400CC4F872uLL);
        if (!v96) {
          break;
        }
        v96[1] = v7;
        *(_WORD *)long long v96 = *(_WORD *)(v7 + 164) + 1;
        uint64_t v93 = pthread_create(&v100, &v106, (void *(__cdecl *)(void *))ThreadExecutive, v96);
        if (v93) {
          goto LABEL_139;
        }
        unsigned __int16 v97 = *(_WORD *)(v7 + 164) + 1;
        *(_WORD *)(v7 + 164) = v97;
        if (*(unsigned __int16 *)(v7 + 248) <= v97) {
          goto LABEL_146;
        }
      }
      char v69 = 127;
      uint64_t v37 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    char v69 = 63;
    uint64_t v37 = 4294967246;
  }
LABEL_77:
  if (*(_WORD *)(v7 + 164))
  {
    pthread_mutex_lock((pthread_mutex_t *)v7);
    *(void *)(v7 + 264) = 0;
    *(_DWORD *)(v7 + 532) = v37;
    if (*(_DWORD *)(v7 + 168) != 4)
    {
      *(_DWORD *)(v7 + 168) = 4;
      pthread_cond_broadcast((pthread_cond_t *)(v7 + 64));
    }
    while (*(_WORD *)(v7 + 164))
      pthread_cond_wait((pthread_cond_t *)(v7 + 112), (pthread_mutex_t *)v7);
    pthread_mutex_unlock((pthread_mutex_t *)v7);
  }
  long long v72 = *(void **)(v7 + 288);
  if (v72) {
    free(v72);
  }
  long long v73 = *(CFTypeRef **)(v7 + 256);
  if (v73)
  {
    if (*(_DWORD *)v73)
    {
      int v74 = 0;
      long long v75 = v73 + 3;
      do
      {
        long long v76 = *(v75 - 1);
        if (v76) {
          CFRelease(v76);
        }
        if (*v75) {
          CFRelease(*v75);
        }
        ++v74;
        long long v73 = *(CFTypeRef **)(v7 + 256);
        v75 += 6;
      }
      while (*(_DWORD *)v73 > (unsigned __int16)v74);
    }
    free(v73);
  }
  if ((v69 & 2) != 0)
  {
    pthread_mutex_destroy((pthread_mutex_t *)v7);
    if ((v69 & 4) == 0)
    {
LABEL_96:
      if ((v69 & 8) == 0) {
        goto LABEL_97;
      }
      goto LABEL_110;
    }
  }
  else if ((v69 & 4) == 0)
  {
    goto LABEL_96;
  }
  pthread_cond_destroy((pthread_cond_t *)(v7 + 64));
  if ((v69 & 8) == 0)
  {
LABEL_97:
    if ((v69 & 0x10) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
LABEL_110:
  pthread_cond_destroy((pthread_cond_t *)(v7 + 112));
  if ((v69 & 0x10) != 0) {
LABEL_98:
  }
    pthread_mutex_destroy((pthread_mutex_t *)(v7 + 416));
LABEL_99:
  int v77 = v69 & 0x10;
  if ((v69 & 0x20) != 0) {
    pthread_cond_destroy((pthread_cond_t *)(v7 + 480));
  }
  stkclear(v7 + 296, v7, (uint64_t (*)(void))DisposeProbe);
  uint64_t v7 = 0;
  uint64_t v78 = 0;
  if ((v69 & 8) != 0) {
    goto LABEL_102;
  }
LABEL_103:
  if (v77) {
    pthread_mutexattr_destroy(&v105);
  }
  *a1 = v78;
  if (v37 == -1) {
    return *__error();
  }
  return v37;
}

uint64_t stkputbtm(uint64_t result, void *a2)
{
  if (a2)
  {
    unsigned int v2 = *(void **)(result + 16);
    *(void *)(result + 16) = a2;
    *a2 = 0;
    if (!v2) {
      unsigned int v2 = (void *)(result + 8);
    }
    *unsigned int v2 = a2;
    ++*(_WORD *)(result + 2);
  }
  return result;
}

uint64_t IOJobInitiate(pthread_mutex_t *a1, int a2)
{
  if (!a1 || *(_DWORD *)&a1[2].__opaque[32]) {
    return 1;
  }
  pthread_mutex_lock(a1);
  if (*(_DWORD *)&a1[2].__opaque[32] != 1)
  {
    *(_DWORD *)&a1[2].__opaque[32] = 1;
    pthread_cond_broadcast((pthread_cond_t *)&a1[1]);
  }
  pthread_mutex_unlock(a1);
  if (!a2) {
    return 0;
  }
  return IOJobWait((uint64_t)a1, 0);
}

uint64_t ThreadExecutive(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *((void *)a1 + 1);
  if (!v2) {
    goto LABEL_253;
  }
  pthread_mutex_lock(*((pthread_mutex_t **)a1 + 1));
  unsigned __int16 v126 = 0;
  time_t v125 = 0;
  uint64_t v3 = v2 + 296;
  uint64_t v127 = v2 + 368;
  uint64_t v4 = v2 + 320;
  uint64_t v129 = v2 + 392;
  uint64_t v128 = v2 + 344;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        while (2)
        {
          switch(*(_DWORD *)(v2 + 168))
          {
            case 1:
              *(void *)(v2 + 184) = time(0);
              *(_WORD *)(v2 + 232) = -1;
              float32x4x2_t v5 = *(uint64_t (**)(uint64_t, void))(v2 + 264);
              if (v5)
              {
                int v6 = v5(v2, *(void *)(v2 + 272));
                *(_DWORD *)(v2 + 532) = v6;
              }
              else
              {
                int v6 = *(_DWORD *)(v2 + 532);
              }
              int v46 = *(_DWORD *)(v2 + 168);
              if (v6) {
                goto LABEL_193;
              }
              if (v46 == 2) {
                continue;
              }
              int v44 = 2;
              goto LABEL_195;
            case 2:
              if (!*(_WORD *)(v2 + 298) || (*(_WORD *)(v2 + 162) & 1) != 0) {
                goto LABEL_95;
              }
              break;
            case 3:
              if (*(_WORD *)(v2 + 164) != 1) {
                goto LABEL_251;
              }
              CFNumberRef v42 = *(uint64_t (**)(uint64_t, void))(v2 + 264);
              if (v42)
              {
                int v43 = v42(v2, *(void *)(v2 + 272));
                if (!*(_DWORD *)(v2 + 532)) {
                  *(_DWORD *)(v2 + 532) = v43;
                }
              }
              if (*(_DWORD *)(v2 + 168) == 5) {
                continue;
              }
              int v44 = 5;
              goto LABEL_195;
            case 4:
              CFNumberRef v45 = *(void (**)(uint64_t, void))(v2 + 264);
              if (!v45) {
                goto LABEL_86;
              }
              v45(v2, *(void *)(v2 + 272));
              goto LABEL_85;
            case 5:
              *(void *)(v2 + 192) = time(0);
              long long v121 = *(void (**)(uint64_t, void))(v2 + 264);
              if (v121) {
                v121(v2, *(void *)(v2 + 272));
              }
              goto LABEL_251;
            default:
              goto LABEL_196;
          }
          break;
        }
LABEL_8:
        uint64_t v7 = stkgettop(v3);
        if (!v7)
        {
LABEL_76:
          IOAdvertising(v4, (pthread_cond_t *)(v2 + 64));
          goto LABEL_95;
        }
        uint64_t v8 = (uint64_t)v7;
        unsigned int v9 = *(_DWORD *)(v2 + 240);
        *((_DWORD *)v7 + 18) = v9;
        v7[19] = *(void *)(v2 + 544);
        CFTypeID v10 = *(unsigned int **)(v2 + 256);
        unsigned int v11 = *(_DWORD *)(v2 + 172);
        if (v11 >= *v10)
        {
LABEL_91:
          stkputbtm(v3, v7);
          goto LABEL_92;
        }
        uint64_t v12 = 12 * (int)v11;
        while (1)
        {
          unsigned int v13 = v10[v12 + 2];
          if (v13 != 6) {
            break;
          }
          if (*(_WORD *)(v2 + 322) || *(_WORD *)(v2 + 536))
          {
            stkputbtm(v3, v7);
            goto LABEL_95;
          }
LABEL_16:
          *(_DWORD *)(v2 + 172) = ++v11;
          v12 += 12;
          if (*v10 <= v11) {
            goto LABEL_91;
          }
        }
        unint64_t v14 = *(void *)&v10[v12 + 8];
        if (!v14) {
          goto LABEL_16;
        }
        CFNumberRef v15 = &v10[v12];
        uint64_t v16 = *((void *)v15 + 5);
        v7[5] = v16;
        unint64_t v17 = *((_DWORD *)v7 + 26) / v9;
        *((_DWORD *)v7 + 6) = v13;
        BOOL v18 = v14 > v17;
        if (v14 < v17) {
          unint64_t v17 = v14;
        }
        v7[4] = v17;
        uint64_t v19 = *((void *)v15 + 6);
        v7[6] = v19;
        *(_OWORD *)(v7 + 7) = *((_OWORD *)v15 + 1);
        *((void *)v15 + 5) = v16 + v17;
        *((void *)v15 + 6) = v19 + v17;
        __int16 v20 = !v18;
        *((void *)v15 + 4) = v14 - v17;
        *((_WORD *)v7 + 4) = v7[1] & 0xFFFE | v20;
        *((_DWORD *)v7 + 3) = v11;
        *((_WORD *)v7 + 8) = 0;
        v7[16] = 0;
        int v21 = (unsigned __int16)InstructionTable;
        if (!InstructionTable)
        {
LABEL_136:
          *(void *)(v8 + 120) = 0;
          uint64_t v3 = v2 + 296;
          stkputbtm(v2 + 296, (void *)v8);
          int v63 = 2;
          uint64_t v4 = v2 + 320;
LABEL_192:
          *(_DWORD *)(v2 + 532) = v63;
          int v46 = *(_DWORD *)(v2 + 168);
LABEL_193:
          if (v46 != 4)
          {
            int v44 = 4;
LABEL_195:
            *(_DWORD *)(v2 + 168) = v44;
            pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
          }
          continue;
        }
        break;
      }
      CFNumberRef v22 = &word_267D27E54;
      while ((unsigned __int16)*v22 != (unsigned __int16)v13)
      {
        --v21;
        v22 += 26;
        if (!(_WORD)v21) {
          goto LABEL_136;
        }
      }
      *(void *)(v8 + 120) = v22;
      unint64_t v23 = (unsigned __int16)v22[20];
      if (v22[20])
      {
        uint64_t v24 = 0;
        BOOL v25 = 1;
        do
        {
          if (StepTable)
          {
            CFTypeID v26 = &word_26B54B06A;
            int v27 = (unsigned __int16)StepTable;
            while (*(v26 - 17) != v22[v24 + 21])
            {
              --v27;
              v26 += 24;
              if (!(_WORD)v27) {
                goto LABEL_36;
              }
            }
            if ((*v26 & 2) != 0) {
              break;
            }
          }
LABEL_36:
          BOOL v25 = ++v24 < v23;
        }
        while (v24 != v23);
        if (v25 && *(_DWORD *)(v2 + 180) == -1) {
          *(_DWORD *)(v2 + 180) = v11;
        }
      }
      int v28 = (_DWORD *)(v2 + 376);
      while (1)
      {
        int v28 = *(_DWORD **)v28;
        if (!v28) {
          break;
        }
        if (v28[2] == v11)
        {
          long long v130 = v28;
          CFTypeID v29 = v28;
          goto LABEL_47;
        }
      }
      long long v130 = 0;
      if (*(_DWORD *)(v2 + 176) >= (signed int)v11) {
        goto LABEL_74;
      }
      *(_DWORD *)(v2 + 176) = v11;
      int v30 = BuildiCache((uint64_t)v22, &v130);
      if (v30)
      {
        int v63 = v30;
        goto LABEL_238;
      }
      CFTypeID v29 = v130;
      if (!v130) {
        goto LABEL_74;
      }
LABEL_47:
      if (*((_WORD *)v29 + 12))
      {
LABEL_48:
        if (!v28 && v29)
        {
          *((_DWORD *)v29 + 2) = *(_DWORD *)(v8 + 12);
          goto LABEL_73;
        }
        goto LABEL_74;
      }
      unsigned int v31 = *(_DWORD *)(v8 + 24);
      BOOL v18 = v31 > 7;
      int v32 = (1 << v31) & 0xB0;
      if (v18 || v32 == 0) {
        CFStringRef v34 = (uint64_t *)(v8 + 48);
      }
      else {
        CFStringRef v34 = (uint64_t *)(v8 + 40);
      }
      uint64_t v124 = *v34;
      if (v28) {
        stkdequeue(v127, v29);
      }
      uint64_t v35 = *(void *)(v8 + 120);
      v131[0] = 0;
      if (!*(_WORD *)(v35 + 40))
      {
LABEL_72:
        if (!v28) {
          goto LABEL_48;
        }
LABEL_73:
        stkputbtm(v127, v29);
LABEL_74:
        *(void *)(v8 + 136) = v130;
        int v41 = SetupStep(v8);
        if (v41)
        {
          int v63 = v41;
          uint64_t v3 = v2 + 296;
          uint64_t v4 = v2 + 320;
          goto LABEL_239;
        }
        uint64_t v4 = v2 + 320;
        stkputbtm(v2 + 320, (void *)v8);
        uint64_t v3 = v2 + 296;
        if (!*(_WORD *)(v2 + 298)) {
          goto LABEL_76;
        }
        goto LABEL_8;
      }
      long long v123 = v1;
      uint64_t v36 = 0;
      while (1)
      {
        int v37 = (unsigned __int16)StepTable;
        if (StepTable)
        {
          int v38 = &off_26B54B070;
          while (*((unsigned __int16 *)v38 - 20) != *(unsigned __int16 *)(v35 + 2 * v36 + 42))
          {
            --v37;
            v38 += 6;
            if (!(_WORD)v37) {
              goto LABEL_70;
            }
          }
          if (*((_WORD *)v38 - 3))
          {
            LOWORD(v131[0]) = v36;
            v131[1] = v124;
            int v39 = addentry((const void **)&v130, v131, 0x20uLL, 0x18u, 0xFFFFu, 0x10u);
            if (v39) {
              break;
            }
            uint64_t v40 = v130[2];
            if (v40)
            {
              int v39 = ((uint64_t (*)(uint64_t, void))*v38)(v40, 0);
              if (v39) {
                break;
              }
            }
          }
        }
LABEL_70:
        if (++v36 >= (unint64_t)*(unsigned __int16 *)(v35 + 40))
        {
          CFTypeID v29 = v130;
          uint64_t v1 = v123;
          goto LABEL_72;
        }
      }
      int v63 = v39;
      uint64_t v1 = v123;
LABEL_238:
      uint64_t v3 = v2 + 296;
      uint64_t v4 = v2 + 320;
      *(void *)(v8 + 136) = v130;
LABEL_239:
      stkputbtm(v3, (void *)v8);
      if (v63 != -29291)
      {
        if (v63 != -39) {
          goto LABEL_190;
        }
LABEL_92:
        *(_WORD *)(v2 + 162) |= 1u;
        if (*(unsigned __int16 *)(v2 + 298) >= *(unsigned __int16 *)(v2 + 250)) {
          goto LABEL_85;
        }
      }
LABEL_95:
      unsigned int v47 = stkgettop(v4);
      if (!v47)
      {
LABEL_196:
        pthread_cond_wait((pthread_cond_t *)(v2 + 64), (pthread_mutex_t *)v2);
        continue;
      }
      break;
    }
    CFNumberRef v48 = v47;
    ++*(_WORD *)(v2 + 536);
    *((_WORD *)v47 + 5) = *v1;
    if ((*(unsigned char *)(v47[16] + 34) & 2) != 0)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 416));
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      stkputbtm(v129, v48);
      while (*(unsigned char *)(v2 + 528))
        pthread_cond_wait((pthread_cond_t *)(v2 + 480), (pthread_mutex_t *)(v2 + 416));
      CFNumberRef v48 = stkgettop(v129);
      *(unsigned char *)(v2 + 528) = 1;
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 416));
      uint64_t v51 = v48[17];
      if (v51) {
        uint64_t v52 = *(void *)(v51 + 16);
      }
      else {
        uint64_t v52 = 0;
      }
      int v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v48[16] + 40))(v52, 1);
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 416));
      *(unsigned char *)(v2 + 528) = 0;
      pthread_cond_signal((pthread_cond_t *)(v2 + 480));
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 416));
    }
    else
    {
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      uint64_t v49 = v48[17];
      if (v49) {
        uint64_t v50 = *(void *)(v49 + 16);
      }
      else {
        uint64_t v50 = 0;
      }
      int v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v48[16] + 40))(v50, 1);
    }
    pthread_mutex_lock((pthread_mutex_t *)v2);
    if (!v53)
    {
LABEL_119:
      int v61 = *(_DWORD *)(v2 + 532);
      goto LABEL_120;
    }
    if (v53 != 35)
    {
LABEL_116:
      int v61 = *(_DWORD *)(v2 + 532);
      if (v61) {
        goto LABEL_120;
      }
      *(_DWORD *)(v2 + 532) = v53;
      int v61 = v53;
      if (*(_DWORD *)(v2 + 168) == 4) {
        goto LABEL_120;
      }
      *(_DWORD *)(v2 + 168) = 4;
      pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
      goto LABEL_119;
    }
    unsigned int v54 = *(_DWORD *)(v2 + 280);
    if (!v54)
    {
      int v53 = 22;
      goto LABEL_116;
    }
    unsigned int v55 = *(_DWORD **)(v2 + 288);
    uint64_t v56 = *v55;
    if (v56 >= v54)
    {
      int v53 = 12;
      uint64_t v4 = v2 + 320;
      goto LABEL_116;
    }
    unint64_t v57 = (unint64_t)&v55[12 * v56 + 2];
    int v58 = *((_DWORD *)v48 + 6);
    if (v57 - 48 < (unint64_t)(v55 + 2))
    {
      uint64_t v59 = 0;
      unsigned int v60 = &v55[12 * v56 + 2];
LABEL_177:
      _DWORD *v60 = v58;
      unint64_t v106 = v57 + 48 * v59;
      *(void *)(v106 + 40) = v48[6];
      long long v107 = *((_OWORD *)v48 + 2);
      *(_OWORD *)(v106 + 24) = v107;
      *(_OWORD *)(v106 + 8) = *(_OWORD *)(v48 + 7);
      *unsigned int v55 = v56 + 1;
      uint64_t v86 = v107;
      goto LABEL_178;
    }
    uint64_t v71 = 0;
    long long v72 = v48 + 5;
    long long v73 = v48 + 6;
    uint64_t v74 = 12 * v56;
    uint64_t v75 = -1;
    size_t v76 = -48;
    uint64_t v77 = (uint64_t)&v55[12 * v56 + 2];
    while (2)
    {
      int v78 = v55[v74 - 10];
      if (v58 != 2)
      {
        if (v78 != 2)
        {
          long long v79 = (void *)(v77 - 16);
          uint64_t v80 = v48 + 5;
          goto LABEL_143;
        }
LABEL_144:
        uint64_t v77 = v57 + 48 * v75--;
        v76 += 48;
        v74 -= 12;
        ++v71;
        if (&v55[v74 - 10] < v55 + 2)
        {
          uint64_t v59 = -v71;
          unsigned int v60 = &v55[v74 + 2];
          goto LABEL_165;
        }
        continue;
      }
      break;
    }
    if (v78 != 2) {
      goto LABEL_146;
    }
    long long v79 = &v55[v74];
    uint64_t v80 = v48 + 6;
LABEL_143:
    if (*v80 < *v79) {
      goto LABEL_144;
    }
LABEL_146:
    uint64_t v59 = -v71;
    unsigned int v60 = &v55[v74 + 2];
    if (v58 != v78)
    {
LABEL_165:
      if ((unint64_t)v60 >= v57) {
        goto LABEL_177;
      }
      if (v58 == *v60)
      {
        if (v58 == 1)
        {
          uint64_t v86 = v48[4];
          uint64_t v89 = v48[5];
          unint64_t v95 = v57 + 48 * v59;
          uint64_t v96 = *(void *)(v95 + 32);
          uint64_t v92 = (uint64_t *)(v95 + 32);
          if (v86 + v89 == v96)
          {
            uint64_t v97 = *v73;
            uint64_t v98 = *v73 + v86;
            unint64_t v99 = v57 + 48 * v59;
            uint64_t v101 = *(void *)(v99 + 40);
            pthread_t v100 = (void *)(v99 + 40);
            if (v98 == v101)
            {
              *pthread_t v100 = v97;
LABEL_175:
              *uint64_t v92 = v89;
              uint64_t v3 = v2 + 296;
              uint64_t v4 = v2 + 320;
              *(void *)(v57 + 48 * v59 + 24) += v86;
              goto LABEL_179;
            }
          }
        }
        else
        {
          if (v58 == 2)
          {
            uint64_t v89 = v48[6];
            uint64_t v86 = v48[4];
            uint64_t v90 = v86 + v89;
            unint64_t v91 = v57 + 48 * v59;
            uint64_t v94 = *(void *)(v91 + 40);
            uint64_t v92 = (uint64_t *)(v91 + 40);
            uint64_t v93 = v94;
          }
          else
          {
            uint64_t v86 = v48[4];
            uint64_t v89 = v48[5];
            uint64_t v90 = v86 + v89;
            unint64_t v102 = v57 + 48 * v59;
            uint64_t v103 = *(void *)(v102 + 32);
            uint64_t v92 = (uint64_t *)(v102 + 32);
            uint64_t v93 = v103;
          }
          if (v90 == v93) {
            goto LABEL_175;
          }
        }
      }
      __int16 v104 = v1;
      uint64_t v105 = v59;
      memmove(v60 + 12, v60, v57 - (void)v60);
      uint64_t v59 = v105;
      uint64_t v1 = v104;
      int v58 = *((_DWORD *)v48 + 6);
      LODWORD(v56) = *v55;
      goto LABEL_177;
    }
    if (v58 == 1)
    {
      uint64_t v84 = *(void *)&v55[v74 - 4];
      if (*v72 == v84 + *(void *)&v55[v74 - 2])
      {
        uint64_t v81 = *v73;
        uint64_t v85 = *(void *)&v55[v74] + v84;
        goto LABEL_159;
      }
      goto LABEL_165;
    }
    if (v58 == 2)
    {
      uint64_t v81 = *v73;
      uint64_t v82 = &v55[v74];
      uint64_t v83 = *(void *)&v55[v74];
    }
    else
    {
      uint64_t v81 = *v72;
      uint64_t v82 = &v55[v74];
      uint64_t v83 = *(void *)&v55[v74 - 2];
    }
    uint64_t v84 = *((void *)v82 - 2);
    uint64_t v85 = v84 + v83;
LABEL_159:
    if (v81 != v85) {
      goto LABEL_165;
    }
    uint64_t v86 = v48[4];
    uint64_t v87 = v86 + v84;
    *(void *)&v55[v74 - 4] = v87;
    if (v59 < 0 && v58 == *v60)
    {
      if (v58 == 1)
      {
        long long v88 = &v55[v74];
        if (*(void *)&v55[v74 - 2] + v87 == *(void *)&v55[v74 + 10])
        {
LABEL_243:
          uint64_t v119 = *v88 + v87;
          uint64_t v120 = v88[6];
          goto LABEL_245;
        }
      }
      else
      {
        if (v58 == 2)
        {
          long long v88 = &v55[v74];
          goto LABEL_243;
        }
        uint64_t v119 = *(void *)&v55[v74 - 2] + v87;
        uint64_t v120 = *(void *)&v55[v74 + 10];
LABEL_245:
        if (v119 == v120)
        {
          *(void *)&v55[v74 - 4] = *(void *)&v55[v74 + 8] + v87;
          if (v71 != 1)
          {
            memmove(&v55[v74 + 2], &v55[v74 + 14], v76);
            LODWORD(v56) = *v55;
            uint64_t v86 = v48[4];
          }
          *unsigned int v55 = v56 - 1;
        }
      }
    }
LABEL_178:
    uint64_t v3 = v2 + 296;
    uint64_t v4 = v2 + 320;
LABEL_179:
    *(void *)(v2 + 216) += v86;
    int v61 = *(_DWORD *)(v2 + 532);
    if (!v61)
    {
      *(_DWORD *)(v2 + 532) = 35;
      ++*((_WORD *)v48 + 8);
LABEL_181:
      unint64_t v108 = *(void *)(v2 + 200);
      uint64_t v109 = *(void *)(v2 + 208) + v48[11];
      *(void *)(v2 + 208) = v109;
      *(_WORD *)(v2 + 234) = 100 * v109 / v108;
LABEL_182:
      stkputbtm(v3, v48);
      if (*(_DWORD *)(v2 + 172) >= **(_DWORD **)(v2 + 256)
        && *(unsigned __int16 *)(v2 + 298) >= *(unsigned __int16 *)(v2 + 250))
      {
        int v63 = -39;
      }
      else
      {
        IOAdvertising(v3, (pthread_cond_t *)(v2 + 64));
        int v63 = 0;
      }
      if (*(_DWORD *)(v2 + 532) == 35) {
        *(_DWORD *)(v2 + 532) = 0;
      }
      break;
    }
LABEL_120:
    signed __int16 v62 = *((_WORD *)v48 + 8) + 1;
    *((_WORD *)v48 + 8) = v62;
    if (v61 == 35) {
      goto LABEL_181;
    }
    if (v61) {
      goto LABEL_182;
    }
    if (*(unsigned __int16 *)(v48[15] + 40) <= v62) {
      goto LABEL_181;
    }
    v48[16] = 0;
    int v63 = SetupStep((uint64_t)v48);
    if (!v63)
    {
      if ((*(_WORD *)(v48[16] + 34) & 2) == 0)
      {
        stkputbtm(v4, v48);
        IOAdvertising(v4, (pthread_cond_t *)(v2 + 64));
        goto LABEL_135;
      }
      uint64_t v64 = v48[18];
      if (v64)
      {
        int v65 = *((_DWORD *)v48 + 3);
        if (v65 == *(_DWORD *)(v2 + 180) && (uint64_t v66 = v48[10], v66 == *(void *)(v64 + 8)))
        {
          int v116 = *((unsigned __int16 *)v48 + 8);
          *(void *)(v64 + 8) = v48[11] + v66;
          if (v48[1]) {
            *(_DWORD *)(v2 + 180) = v65 + 1;
          }
          stkputbtm(v4, v48);
          long long v117 = *(void **)(v2 + 352);
          while (v117)
          {
            long long v118 = v117;
            long long v117 = (void *)*v117;
            if (*((_DWORD *)v118 + 3) == *(_DWORD *)(v2 + 180)
              && *((__int16 *)v118 + 8) == v116
              && v118[10] == *(void *)(v118[18] + 8))
            {
              if (stkdequeue(v128, v118)) {
                break;
              }
              *(void *)(v118[18] + 8) += v118[11];
              if (v118[1]) {
                ++*(_DWORD *)(v2 + 180);
              }
              stkputbtm(v4, v118);
            }
          }
          IOAdvertising(v4, (pthread_cond_t *)(v2 + 64));
          uint64_t v3 = v2 + 296;
        }
        else
        {
          uint64_t v67 = *(void *)(v2 + 352);
          if (v67)
          {
            int v68 = 0;
            while (1)
            {
              char v69 = (void *)v67;
              int v70 = *(_DWORD *)(v67 + 12);
              if (v65 <= v70 && (v65 != v70 || v48[10] <= v69[10])) {
                break;
              }
              uint64_t v67 = *v69;
              int v68 = v69;
              if (!*v69)
              {
                stkputbtm(v128, v48);
                goto LABEL_135;
              }
            }
            if (v68)
            {
              int v63 = stkenqueue(v128, v48, v68);
              break;
            }
          }
          stkputtop(v128, v48);
        }
LABEL_135:
        int v63 = 0;
        --*(_WORD *)(v2 + 536);
LABEL_197:
        if (*(_DWORD *)(v2 + 532)) {
          goto LABEL_218;
        }
        if (*(_WORD *)(v2 + 252))
        {
          unsigned __int16 v126 = *(__int16 *)(v2 + 234) / (int)*(unsigned __int16 *)(v2 + 252) * *(_WORD *)(v2 + 252);
          int v110 = *(__int16 *)(v2 + 232);
          BOOL v111 = v126 > v110;
          if (!*(_WORD *)(v2 + 254))
          {
            if (v126 > v110)
            {
              LODWORD(v112) = 0;
              time_t v113 = v125;
              goto LABEL_209;
            }
LABEL_207:
            uint64_t v3 = v2 + 296;
            goto LABEL_218;
          }
        }
        else
        {
          if (!*(_WORD *)(v2 + 254)) {
            goto LABEL_218;
          }
          BOOL v111 = 0;
        }
        time_t v113 = time(0);
        uint64_t v112 = *(unsigned __int16 *)(v2 + 254);
        if (v113 < *(void *)(v2 + 224) + v112 && !v111)
        {
          time_t v125 = v113;
          goto LABEL_207;
        }
        if (*(_WORD *)(v2 + 252)) {
LABEL_209:
        }
          *(_WORD *)(v2 + 232) = v126;
        if (v112) {
          *(void *)(v2 + 224) = v113;
        }
        time_t v125 = v113;
        long long v114 = *(uint64_t (**)(uint64_t, void))(v2 + 264);
        if (v114)
        {
          int v115 = v114(v2, *(void *)(v2 + 272));
          *(_DWORD *)(v2 + 532) = v115;
        }
        else
        {
          int v115 = *(_DWORD *)(v2 + 532);
        }
        uint64_t v3 = v2 + 296;
        if (v115 && *(_DWORD *)(v2 + 168) != 4)
        {
          *(_DWORD *)(v2 + 168) = 4;
          pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
        }
LABEL_218:
        if (v63 == -39 && !*(_DWORD *)(v2 + 532))
        {
LABEL_85:
          if (*(_DWORD *)(v2 + 168) != 3)
          {
LABEL_86:
            int v44 = 3;
            goto LABEL_195;
          }
        }
        continue;
      }
      stkputbtm(v3, v48);
      *(_DWORD *)(v2 + 532) = 22;
      if (*(_DWORD *)(v2 + 168) != 4)
      {
        *(_DWORD *)(v2 + 168) = 4;
        pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
      }
      --*(_WORD *)(v2 + 536);
      int v63 = 22;
      goto LABEL_192;
    }
    break;
  }
  --*(_WORD *)(v2 + 536);
  if (!v63 || v63 == -39) {
    goto LABEL_197;
  }
LABEL_190:
  if (v63 == 55) {
    goto LABEL_196;
  }
  if (v63 != -1) {
    goto LABEL_192;
  }
LABEL_251:
  --*(_WORD *)(v2 + 164);
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  if (!*(_WORD *)(v2 + 164)) {
    pthread_cond_broadcast((pthread_cond_t *)(v2 + 112));
  }
LABEL_253:
  free(v1);
  return 0;
}

uint64_t IOJobWait(uint64_t a1, unsigned int a2)
{
  v6.tv_nsec = 0;
  if (!a1) {
    return 22;
  }
  v6.tv_sec = time(0) + a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  if (*(_WORD *)(a1 + 164))
  {
    do
    {
      if (a2)
      {
        uint64_t v4 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)a1, &v6);
        if (v4 == 60) {
          break;
        }
      }
      else
      {
        uint64_t v4 = pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)a1);
      }
    }
    while (*(_WORD *)(a1 + 164));
  }
  else
  {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (*(_DWORD *)(a1 + 532) && (v4 == 60 || !v4)) {
    return *(unsigned int *)(a1 + 532);
  }
  return v4;
}

uint64_t IOJobCopySingleInfo(pthread_mutex_t *a1, const void *a2, CFTypeRef *a3)
{
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v10[0] = (uint64_t)Mutable;
  v10[1] = (uint64_t)a1;
  pthread_mutex_lock(a1);
  DictKeyFiller(a2, v10);
  pthread_mutex_unlock(a1);
  CFNumberRef Value = CFDictionaryGetValue(Mutable, a2);
  if (Value)
  {
    uint64_t v8 = 0;
    *a3 = CFRetain(Value);
    if (!Mutable) {
      return v8;
    }
    goto LABEL_7;
  }
  uint64_t v8 = 22;
  if (Mutable) {
LABEL_7:
  }
    CFRelease(Mutable);
  return v8;
}

uint64_t *DictKeyFiller(const void *a1, uint64_t *a2)
{
  int8x8_t result = (uint64_t *)bsearch(a1, &InfoLookupTable, 0x11uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))InfoLookupKeyRecCompare);
  if (result)
  {
    uint64_t v4 = *result;
    float32x4x2_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))result[1];
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
    return (uint64_t *)v5(v6, v4, v7);
  }
  return result;
}

CFComparisonResult InfoLookupKeyRecCompare(const __CFString *a1, CFStringRef *a2)
{
  return CFStringCompare(a1, *a2, 0);
}

void InfoFillerGetState(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  int valuePtr = *(_DWORD *)(a1 + 168);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetPercentDone(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt16Type, (const void *)(a1 + 234));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

uint64_t *stkgettop(uint64_t a1)
{
  int8x8_t result = *(uint64_t **)(a1 + 8);
  if (result)
  {
    uint64_t v3 = *result;
    *(void *)(a1 + 8) = *result;
    *int8x8_t result = 0;
    if (!v3) {
      *(void *)(a1 + 16) = 0;
    }
    --*(_WORD *)(a1 + 2);
  }
  return result;
}

uint64_t BuildiCache(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a1 + 36)) {
    goto LABEL_2;
  }
  unint64_t v9 = *(unsigned __int16 *)(a1 + 40);
  if (*(_WORD *)(a1 + 40))
  {
    uint64_t v10 = 0;
    BOOL v11 = 1;
    do
    {
      if (StepTable)
      {
        uint64_t v12 = &word_26B54B06A;
        int v13 = (unsigned __int16)StepTable;
        while (*(v12 - 17) != *(_WORD *)(a1 + 2 * v10 + 42))
        {
          --v13;
          v12 += 24;
          if (!(_WORD)v13) {
            goto LABEL_15;
          }
        }
        if (*v12) {
          break;
        }
      }
LABEL_15:
      BOOL v11 = ++v10 < v9;
    }
    while (v10 != v9);
    if (v11)
    {
LABEL_2:
      uint64_t v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00404E4CC0B5uLL);
      if (v4)
      {
        CFNumberRef v5 = v4;
        size_t v6 = *(unsigned int *)(a1 + 36);
        if (!v6) {
          goto LABEL_18;
        }
        uint64_t v7 = malloc_type_calloc(1uLL, v6, 0xEC977C63uLL);
        v5[2] = v7;
        if (v7) {
          goto LABEL_18;
        }
        free(v5);
      }
      *a2 = 0;
      return *__error();
    }
  }
  CFNumberRef v5 = 0;
LABEL_18:
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t SetupStep(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 120);
  if (v1)
  {
    if (*(void *)(a1 + 128)) {
      goto LABEL_3;
    }
    int v5 = (unsigned __int16)StepTable;
    if (StepTable)
    {
      int v6 = *(unsigned __int16 *)(v1 + 2 * *(__int16 *)(a1 + 16) + 42);
      uint64_t v7 = &word_26B54B048;
      while ((unsigned __int16)*v7 != v6)
      {
        --v5;
        v7 += 24;
        if (!(_WORD)v5) {
          goto LABEL_13;
        }
      }
      *(void *)(a1 + 128) = v7;
LABEL_3:
      *(void *)(a1 + 144) = 0;
      uint64_t v2 = *(void *)(a1 + 136);
      if (v2)
      {
        int v3 = *(unsigned __int16 *)(v2 + 24);
        if (*(_WORD *)(v2 + 24))
        {
          uint64_t v4 = (unsigned __int16 *)(v2 + 32);
          while (*v4 != *(__int16 *)(a1 + 16))
          {
            --v3;
            v4 += 8;
            if (!(_WORD)v3) {
              goto LABEL_16;
            }
          }
          *(void *)(a1 + 144) = v4;
        }
      }
LABEL_16:
      *(void *)(a1 + 88) = *(void *)(a1 + 32);
      if (*(_WORD *)(a1 + 16) == 1)
      {
        unsigned int v10 = *(_DWORD *)(a1 + 24);
        BOOL v11 = v10 > 7;
        int v12 = (1 << v10) & 0xB0;
        BOOL v13 = v11 || v12 == 0;
        unint64_t v14 = (uint64_t *)(a1 + 40);
        if (v13) {
          unint64_t v14 = (uint64_t *)(a1 + 48);
        }
        uint64_t v15 = *v14;
      }
      else
      {
        if (!*(_WORD *)(a1 + 16))
        {
          *(void *)(a1 + 80) = *(void *)(a1 + 40);
          unint64_t v9 = (void *)(a1 + 56);
LABEL_28:
          uint64_t v8 = 0;
          *(void *)(a1 + 96) = *v9;
          return v8;
        }
        uint64_t v15 = *(void *)(a1 + 48);
      }
      *(void *)(a1 + 80) = v15;
      unint64_t v9 = (void *)(a1 + 64);
      goto LABEL_28;
    }
LABEL_13:
    *(void *)(a1 + 128) = 0;
  }
  return 22;
}

uint64_t IOAdvertising(uint64_t result, pthread_cond_t *a2)
{
  if (*(_WORD *)(result + 2))
  {
    if (*(_WORD *)(result + 2) == 1) {
      return pthread_cond_signal(a2);
    }
    else {
      return pthread_cond_broadcast(a2);
    }
  }
  return result;
}

uint64_t IORV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1) {
    return MKMediaReadBlocks(*(void *)(a9 + 96), *(void *)(a9 + 80), *(void *)(a9 + 88), *(_DWORD *)(a9 + 72), *(char **)(a9 + 112), 0);
  }
  else {
    return 0;
  }
}

uint64_t IOWV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1) {
    return MKMediaWriteBlocks(*(void *)(a9 + 96), *(void *)(a9 + 80), *(void *)(a9 + 88), *(_DWORD *)(a9 + 72), *(char **)(a9 + 112), 0);
  }
  else {
    return 0;
  }
}

uint64_t IOJobDispose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = pthread_mutex_trylock((pthread_mutex_t *)result);
    if (result != 16)
    {
      uint64_t v2 = *(_DWORD **)(v1 + 256);
      if (v2)
      {
        if (*v2)
        {
          uint64_t v3 = 0;
          unint64_t v4 = 0;
          do
          {
            if (*(void *)&v2[v3 + 4])
            {
              CFRelease(*(CFTypeRef *)&v2[v3 + 4]);
              uint64_t v2 = *(_DWORD **)(v1 + 256);
            }
            if (*(void *)&v2[v3 + 6])
            {
              CFRelease(*(CFTypeRef *)&v2[v3 + 6]);
              uint64_t v2 = *(_DWORD **)(v1 + 256);
            }
            ++v4;
            v3 += 12;
          }
          while (v4 < *v2);
        }
        free(v2);
      }
      int v5 = *(void **)(v1 + 288);
      if (v5) {
        free(v5);
      }
      int v6 = *(void **)(v1 + 544);
      if (v6) {
        free(v6);
      }
      stkclear(v1 + 296, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 320, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 344, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 368, v1, (uint64_t (*)(void))iCacheDispose);
      pthread_cond_destroy((pthread_cond_t *)(v1 + 64));
      pthread_cond_destroy((pthread_cond_t *)(v1 + 112));
      pthread_mutex_unlock((pthread_mutex_t *)v1);
      uint64_t v7 = pthread_mutex_destroy((pthread_mutex_t *)v1);
      free((void *)v1);
      --NumJobs;
      return v7;
    }
  }
  return result;
}

uint64_t stkclear(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    while (1)
    {
      int v6 = (void *)*v4;
      *(void *)(a1 + 8) = *v4;
      --*(_WORD *)(a1 + 2);
      if (v6)
      {
        if (a3) {
          goto LABEL_4;
        }
LABEL_8:
        unint64_t v4 = v6;
        if (!v6) {
          return 0;
        }
      }
      else
      {
        *(void *)(a1 + 16) = 0;
        if (!a3) {
          goto LABEL_8;
        }
LABEL_4:
        uint64_t v7 = a3();
        if (v7) {
          return v7;
        }
        unint64_t v4 = v6;
        if (!v6) {
          return v7;
        }
      }
    }
  }
  return 0;
}

uint64_t DisposeProbe(uint64_t a1)
{
  return 0;
}

uint64_t IOEngineDeinitialize()
{
  return 16 * (NumJobs != 0);
}

uint64_t purgeLoader(const __CFDictionary *a1, const __CFDictionary *a2, const void **a3, unsigned int a4, int *a5, __CFArray *a6, int a7, _DWORD *a8)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((a4 & 0x80000000) != 0
    || (int v12 = (const char *)*a3,
        uint64_t v39 = 0,
        memset(__s, 0, sizeof(__s)),
        memset(v37, 0, 154),
        *((unsigned __int16 *)v12 + 47) <= a4)
    || (CFStringRef v17 = CFStringCreateWithCString(0, &v12[152 * a4 + 144], 0)) == 0)
  {
    int v20 = 0;
    unsigned int v19 = 22;
    goto LABEL_7;
  }
  CFStringRef v18 = v17;
  CFIndex idx = 0;
  unsigned int v19 = MKLookupSchemeFormat(a1, @"GPT", v17, 1, v37);
  CFRelease(v18);
  if (v19)
  {
    int v20 = 0;
    goto LABEL_7;
  }
  if (!LOWORD(v37[0])) {
    goto LABEL_37;
  }
  if (!a2 || (CFDictionaryRef theDict = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Loaders")) == 0)
  {
    int v20 = 0;
    unsigned int v19 = -417;
LABEL_7:
    int v21 = 0;
    if (a5) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  unsigned int v23 = LOWORD(v37[0]);
  if (!LOWORD(v37[0]))
  {
LABEL_37:
    int v20 = 0;
LABEL_38:
    unsigned int v19 = 2;
    goto LABEL_7;
  }
  CFStringRef v34 = a6;
  unsigned int v24 = 0;
  BOOL v25 = (char *)&v37[2] + 4;
  int v33 = a7;
  do
  {
    int v26 = *(unsigned __int16 *)v25;
    if (v26 == 6)
    {
      if (*((unsigned __int16 *)v12 + 47) - 1 <= (int)a4) {
        goto LABEL_31;
      }
      int v20 = 1;
    }
    else
    {
      if (v26 != 1 || a4 == 0) {
        goto LABEL_31;
      }
      int v20 = -1;
    }
    CFStringRef v28 = CFStringCreateWithCString(0, v25 - 34, 0);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v28);
    CFRelease(v28);
    if (!Value
      || GPTUpdateLoaderRecord(Value, (uint64_t)__s)
      || (~comparePartitions((uint64_t)&v12[152 * (v20 + a4) + 96], (char *)__s) & 6) == 0)
    {
      goto LABEL_33;
    }
    unsigned int v23 = LOWORD(v37[0]);
LABEL_31:
    ++v24;
    v25 += 38;
  }
  while (v24 < v23);
  int v20 = 0;
LABEL_33:
  if (v24 >= LOWORD(v37[0])) {
    goto LABEL_38;
  }
  unsigned int v30 = v20 + a4;
  if (v34
    && (CFStringRef v31 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt64Type, (char *)*a3 + 152 * (int)v30 + 208),
        CFDictionaryRef v32 = CFArrayDictionarySearchWithIndexOptions(v34, @"Offset", v31, &idx, 0),
        CFRelease(v31),
        v32))
  {
    int v21 = idx - v33;
    CFArrayRemoveValueAtIndex(v34, idx);
  }
  else
  {
    int v21 = 0;
  }
  unsigned int v19 = delentry(a3, 96, 0x5Eu, (unsigned __int16)v30, 152);
  if (!a5) {
    goto LABEL_9;
  }
LABEL_8:
  *a5 = v20;
LABEL_9:
  if (a8) {
    *a8 = v21;
  }
  if (v19 == 2) {
    return 0;
  }
  else {
    return v19;
  }
}

uint64_t IOZV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1) {
    bzero(*(void **)(a9 + 112), *(void *)(a9 + 88) * *(unsigned int *)(a9 + 72));
  }
  return 0;
}

uint64_t MKMediaUpdateProperties(uint64_t a1)
{
  if (a1) {
    return _MKMediaUpdateGeometryFromDict(a1);
  }
  return a1;
}

uint64_t setMediaBlockcount(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **(void **)(*a1 + 8);
  if (!v3) {
    return 22;
  }
  int v4 = *(unsigned __int16 *)(v2 + 94);
  if (*(_WORD *)(v2 + 94))
  {
    unint64_t v5 = 0;
    int v6 = (void *)(v2 + 216);
    do
    {
      if (*v6 + *(v6 - 1) > v5) {
        unint64_t v5 = *v6 + *(v6 - 1);
      }
      v6 += 19;
      --v4;
    }
    while (v4);
    uint64_t v7 = v5 + 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  unsigned int v9 = *(_DWORD *)(v3 + 84) * *(_DWORD *)(v3 + 80);
  unsigned int v10 = *(_DWORD *)(v2 + 32);
  unsigned int v11 = v9 / v10;
  if (v9 % v10) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = v11;
  }
  unint64_t v13 = v7 + v12;
  if (a2)
  {
    if (v13 > a2) {
      return 4294961955;
    }
  }
  else
  {
    a2 = v13;
  }
  *(void *)(v2 + 64) = a2;
  *(void *)(v3 + 24) = 1;
  *(void *)(v3 + 32) = a2 - 1;
  *(void *)(v3 + 72) = 2;
  unint64_t v14 = v12 + 2;
  unint64_t v15 = a2 - v12 - 2;
  *(void *)(v3 + 40) = v14;
  *(void *)(v3 + 48) = v15;
  if (v15 < v14) {
    return 4294961955;
  }
  uuid_LtoB(v2 + 16, v3 + 56);
  uint64_t result = 0;
  uint64_t v16 = *(void *)(v3 + 40);
  uint64_t v17 = *(void *)(v3 + 48);
  uint64_t v18 = *(void *)(v3 + 32) + v16 - v17;
  *(void *)(v2 + 40) = v16;
  *(void *)(v2 + 48) = v18;
  *(void *)(v2 + 56) = v17 - v16 + 1;
  *(_DWORD *)(v2 + 88) = *(_DWORD *)(v3 + 8);
  return result;
}

uint64_t MKScavangeDross(uint64_t a1, const __CFArray *a2, uint64_t a3, int a4, _WORD *a5, unsigned int *a6)
{
  if (!a1)
  {
    unsigned int v10 = 0;
    LOWORD(v7) = -1;
    uint64_t result = 22;
    goto LABEL_17;
  }
  __int16 v6 = a4;
  int v7 = (__int16)(a4 - 1);
  if (((a4 - 1) & 0x8000) != 0)
  {
    uint64_t result = 0;
    unsigned int v10 = 0;
    goto LABEL_17;
  }
  uint64_t v17 = a6;
  uint64_t v18 = a5;
  unsigned int v10 = 0;
  while (1)
  {
    int v11 = v7;
    unsigned int v12 = (unsigned __int16)v7;
    uint64_t v13 = a1 + 1072 * (unsigned __int16)v7;
    uint64_t v14 = v13 + 528;
    unint64_t v15 = (const char *)(v13 + 576);
    if (!strncasecmp((const char *)(v13 + 576), (const char *)(a3 + 33), 0x20uLL)) {
      break;
    }
    if ((!a2 || CFStrMatchlist(v15, a2) == -1)
      && PMCategorize(*(__int16 *)(a1 + 514), *(unsigned __int16 *)(a1 + 1072 * v12 + 1082)) - 3 > 1)
    {
      uint64_t result = 0;
      LOWORD(v7) = v6;
      goto LABEL_16;
    }
    v10 += *(_DWORD *)(v14 + 12);
LABEL_10:
    int v7 = v11 - 1;
    __int16 v6 = v11;
    if ((__int16)v11 <= 0)
    {
      uint64_t result = 0;
      LOWORD(v7) = -1;
      goto LABEL_16;
    }
  }
  v10 += *(_DWORD *)(v14 + 12);
  if (v10 < *(_DWORD *)(a3 + 88)) {
    goto LABEL_10;
  }
  uint64_t result = 0;
  LOWORD(v7) = v11;
LABEL_16:
  a6 = v17;
  a5 = v18;
LABEL_17:
  if (a6) {
    *a6 = v10;
  }
  *a5 = v7;
  return result;
}

uint64_t SValidate(uint64_t *a1, unsigned int a2, int a3, int a4)
{
  if (a1)
  {
    uint64_t v4 = *a1;
    uint64_t v5 = *a1 + 1072 * a4;
    unsigned int v6 = *(_DWORD *)(v5 + 536);
    if (v6 <= a2)
    {
      __int16 v7 = 0;
    }
    else
    {
      if (!a4 || *(_WORD *)(v4 + 1072 * (a4 - 1) + 1082) != 24320) {
        return -5341;
      }
      if (*(_DWORD *)(v4 + 1072 * (a4 - 1) + 536) <= a2) {
        __int16 v7 = 0;
      }
      else {
        __int16 v7 = -5341;
      }
    }
    if ((int)(a3 + a2) > (int)(*(_DWORD *)(v5 + 540) + v6))
    {
      if (a4 + 1 >= *(unsigned __int16 *)(v4 + 522))
      {
        int v9 = *(_DWORD *)(v4 + 4);
      }
      else
      {
        uint64_t v8 = v4 + 1072 * (a4 + 1);
        int v9 = *(_DWORD *)(v8 + 536);
        if (*(_WORD *)(v8 + 1082) == 24320) {
          v9 += *(_DWORD *)(v8 + 540);
        }
      }
      if ((int)(a3 + a2) <= v9) {
        return 0;
      }
      else {
        return -5341;
      }
    }
  }
  else
  {
    return 22;
  }
  return v7;
}

uint64_t MKPurgeLoader(const __CFDictionary *a1, const __CFDictionary *a2, const void **a3, unsigned int a4, int *a5, const __CFArray *a6, int a7, _DWORD *a8)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ((a4 & 0x80000000) != 0 || (unsigned int v12 = (const char *)*a3, *((unsigned __int16 *)*a3 + 261) <= a4))
  {
    int v17 = 0;
    LODWORD(result) = 22;
    goto LABEL_6;
  }
  CFIndex idx = 0;
  memset(v34, 0, sizeof(v34));
  uint64_t v35 = 0;
  memset(v33, 0, 154);
  LODWORD(result) = MKGetPartitionRequisites(a1, *((__int16 *)v12 + 257), &v12[1072 * a4 + 576], *(unsigned __int16 *)&v12[1072 * a4 + 1082], v33);
  if (result)
  {
    int v17 = 0;
    goto LABEL_6;
  }
  CFDictionaryRef theDict = (const __CFDictionary *)CFDictionaryGetValue(a2, @"Loaders");
  if (!theDict)
  {
    int v17 = 0;
    LODWORD(result) = -417;
    goto LABEL_6;
  }
  int v30 = a7;
  unsigned int v18 = LOWORD(v33[0]);
  if (LOWORD(v33[0]))
  {
    CFArrayRef v29 = a6;
    unsigned int v19 = 0;
    int v20 = (char *)&v33[2] + 4;
    while (1)
    {
      int v21 = *(unsigned __int16 *)v20;
      if (v21 == 6)
      {
        if (*((unsigned __int16 *)v12 + 261) - 1 <= (int)a4) {
          goto LABEL_29;
        }
        int v17 = 1;
      }
      else
      {
        if (v21 != 1 || a4 == 0) {
          goto LABEL_29;
        }
        int v17 = -1;
      }
      CFStringRef v23 = CFStringCreateWithCString(0, v20 - 34, 0);
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v23);
      CFRelease(v23);
      if (!Value)
      {
        LODWORD(result) = -415;
LABEL_6:
        LODWORD(a6) = 0;
        goto LABEL_7;
      }
      LODWORD(result) = MKGetPartitionInfo(Value, *((__int16 *)v12 + 257), (uint64_t)v34);
      if (result) {
        goto LABEL_6;
      }
      int v25 = strcasecmp(&v12[1072 * (v17 + a4) + 576], &v34[33]);
      unsigned int v18 = LOWORD(v33[0]);
      if (!v25) {
        goto LABEL_31;
      }
LABEL_29:
      ++v19;
      v20 += 38;
      if (v19 >= v18)
      {
        int v17 = 0;
LABEL_31:
        a6 = v29;
        goto LABEL_34;
      }
    }
  }
  unsigned int v19 = 0;
  int v17 = 0;
LABEL_34:
  if (v19 >= v18)
  {
    LODWORD(result) = 2;
    goto LABEL_6;
  }
  if (a6)
  {
    CFStringRef v26 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, (char *)*a3 + 1072 * (int)(v17 + a4) + 536);
    CFDictionaryRef v27 = CFArrayDictionarySearchWithIndexOptions(a6, @"Offset", v26, &idx, 0);
    CFRelease(v26);
    if (v27)
    {
      CFStringRef v28 = a6;
      LODWORD(a6) = idx - v30;
      CFArrayRemoveValueAtIndex(v28, idx);
    }
    else
    {
      LODWORD(a6) = 0;
    }
  }
  if (v17) {
    LODWORD(result) = PMRemovePartition(a3, (unsigned __int16)(v17 + a4), 0);
  }
  else {
    LODWORD(result) = 0;
  }
LABEL_7:
  if (a5) {
    *a5 = v17;
  }
  if (a8) {
    *a8 = a6;
  }
  if (result == 2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t PMRemovePartition(const void **a1, unsigned int a2, int a3)
{
  if (!a1 || (uint64_t v5 = (char *)*a1, *((unsigned __int16 *)*a1 + 261) <= a2))
  {
    LOWORD(v10) = -50;
    return (__int16)v10;
  }
  __int16 v7 = &v5[1072 * a2];
  uint64_t v8 = (uint64_t)(v7 + 528);
  int v9 = *((_DWORD *)v7 + 249);
  bzero(v7 + 608, 0x3E0uLL);
  int v10 = PMSetTypeExtended(v8, 24320, *((__int16 *)v5 + 257), &unk_21E15F94E);
  if (!a3 || a2 < 2 || v10) {
    return (__int16)v10;
  }
  int v11 = *((__int16 *)v5 + 257);
  if (v11 == 8)
  {
    int v13 = *(unsigned __int16 *)(v8 - 518);
    if (v13 != 5 && v13 != 133 && v13 != 15) {
      goto LABEL_20;
    }
LABEL_19:
    int v10 = PMSetTypeExtended(v8 - 1072, 24320, v11, &unk_21E15F94E);
    if (!v10) {
      goto LABEL_20;
    }
    return (__int16)v10;
  }
  if (v11 == 1 && (v9 & 8) != 0 && *(_WORD *)(v8 - 518) == 14336) {
    goto LABEL_19;
  }
LABEL_20:
  return PMRationalise(a1);
}

uint64_t PMSetTypeExtended(uint64_t a1, int a2, int a3, unsigned char *a4)
{
  if (a1)
  {
    *(_WORD *)(a1 + 554) = a2;
    unsigned int v6 = (unsigned char *)(a1 + 48);
    __int16 v7 = (char *)PMCodeSearch(a2, a3);
    strncpypad(v6, v7, 0x20uLL, 0);
    if (a4) {
      strncpypad((unsigned char *)(a1 + 16), a4, 0x20uLL, 0);
    }
    return 0;
  }
  else
  {
    return -50;
  }
}

uint64_t PMRationalise(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*((unsigned __int16 *)*a1 + 261) < 2u)
    {
      return 0;
    }
    else
    {
      int v3 = 0;
      unsigned int v4 = 1;
      do
      {
        int v5 = v3 + 1;
        while (1)
        {
          uint64_t v6 = (uint64_t)&v2[536 * (unsigned __int16)v3 + 264];
          if (*(_WORD *)(v6 + 554) != 24320) {
            break;
          }
          int v7 = *(_DWORD *)(v6 + 12);
          if (v7)
          {
            if (v2[536 * v5 + 541] != 24320) {
              break;
            }
            uint64_t v8 = (uint64_t)&v2[536 * v5 + 264];
            int v9 = *(_DWORD *)(v8 + 12);
            if (!v9 || *(_DWORD *)(v6 + 8) >= *(_DWORD *)(v8 + 8)) {
              break;
            }
            if ((*(unsigned char *)(v6 + 90) & 0x20) != 0)
            {
              strncpypad((unsigned char *)(v6 + 16), (unsigned char *)(v8 + 16), 0x20uLL, 0);
              *(_DWORD *)(v6 + 88) = *(_DWORD *)(v8 + 88);
              int v9 = *(_DWORD *)(v8 + 12);
              int v7 = *(_DWORD *)(v6 + 12);
            }
            *(_DWORD *)(v6 + 12) = v7 + v9;
            unsigned int v10 = (unsigned __int16)(v3 + 1);
          }
          else
          {
            unsigned int v10 = (unsigned __int16)v3;
          }
          __int16 v11 = delentry(a1, 528, 0x20Au, v10, 1072);
          if (v11) {
            return v11;
          }
          uint64_t v2 = *a1;
          if (v4 >= *((unsigned __int16 *)*a1 + 261)) {
            return 0;
          }
        }
        __int16 v11 = 0;
        int v3 = (unsigned __int16)(v3 + 1);
        unsigned int v4 = v3 + 1;
      }
      while (v3 + 1 < (unsigned __int16)v2[261]);
    }
  }
  else
  {
    return -50;
  }
  return v11;
}

uint64_t _MKMediaCharDeviceInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v21 = 0;
  strcpy(__source, "/dev/");
  if (!a1 || *(_DWORD *)a1 != 1296786550) {
    return 22;
  }
  memset(&v20, 0, sizeof(v20));
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    int v13 = *(const char **)(a1 + 8);
    if (v13)
    {
      if (stat(v13, &v20)) {
        return *__error();
      }
      uint64_t v14 = devname(v20.st_rdev, 0x2000u);
      if (!v14) {
        return 2;
      }
      unint64_t v15 = v14;
      size_t v16 = strlen(v14) + 6;
      int v17 = (char *)malloc_type_malloc(v16, 0xA40E3D0uLL);
      strlcpy(v17, __source, v16);
      strlcat(v17, v15, v16);
      free(*(void **)(a1 + 8));
      *(void *)(a1 + 8) = v17;
      int v18 = _MKMediaOpenFile(v17, theDict, (int *)&v21 + 1, (int *)&v21);
      if (v18 < 0) {
        return *__error();
      }
      *(_DWORD *)(a1 + 4) = v18;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"Writable");
    if (Value) {
      HIDWORD(v21) = CFEqual(Value, (CFTypeRef)*MEMORY[0x263EFFB40]);
    }
  }
  *(void *)(a1 + 8) = strdup("<unknown device>");
LABEL_8:
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 16) = Mutable;
  if (!Mutable) {
    return 12;
  }
  int v7 = (const void *)*MEMORY[0x263EFFB40];
  uint64_t v8 = (const void *)*MEMORY[0x263EFFB38];
  if (HIDWORD(v21)) {
    int v9 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    int v9 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(Mutable, @"Writable", v9);
  if (v21) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = v8;
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Shared Writer", v10);
  CFStringRef v11 = CFStringCreateWithCString(v5, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Path", v11);
  CFRelease(v11);
  return 0;
}

const void *_MKMediaFileCopyProperty(uint64_t a1, void *key)
{
  if (!key) {
    return 0;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4 && (CFAllocatorRef v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    CFDictionaryRef Value = v5;
    CFDictionaryRef Mutable = 0;
  }
  else
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    _MKMediaFileGetGeoProperties((_DWORD *)a1, Mutable);
    CFDictionaryRef Value = CFDictionaryGetValue(Mutable, key);
    if (!Value) {
      goto LABEL_8;
    }
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Value;
}

uint64_t _MKMediaFileGetGeoProperties(_DWORD *a1, __CFDictionary *a2)
{
  if (!a1) {
    return 22;
  }
  if (*a1 != 1296786550) {
    return 22;
  }
  int v2 = a1[1];
  if (v2 < 0) {
    return 22;
  }
  memset(&v6, 0, sizeof(v6));
  if (fstat(v2, &v6)) {
    return *__error();
  }
  if (v6.st_size) {
    off_t v5 = v6.st_size / 512;
  }
  else {
    off_t v5 = -1;
  }
  return _MKMediaSetupGeometry(a2, 512, v5, 0x10000);
}

uint64_t MKMakePartBootable(__CFBundle *a1, const void **a2, void *a3, int a4, char *a5, char *a6, unsigned int a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *), BOOL *a10)
{
  int v17 = a10;
  uint64_t v83 = *MEMORY[0x263EF8340];
  __int16 v75 = 0;
  unsigned int valuePtr = 0;
  unsigned int v78 = 22;
  int v18 = a1;
  if (!a1)
  {
    int v18 = MKAccessLibrary(0);
    if (!v18)
    {
      *a10 = 0;
      return 22;
    }
  }
  uint64_t v70 = a8;
  uint64_t v76 = 0;
  __int16 v74 = 0;
  memset(v80, 0, sizeof(v80));
  long long v81 = 0u;
  uint64_t v82 = 0;
  memset(v73, 0, sizeof(v73));
  BOOL v72 = 0;
  CFURLRef v19 = MKLoadDB(v18, @"database", (int *)&v78);
  if (v19)
  {
    CFDictionaryRef v20 = v19;
    CFURLRef v21 = MKLoadDB(v18, @"inventory", (int *)&v78);
    if (!v21)
    {
      int v23 = 0;
      CFDictionaryRef v22 = v20;
LABEL_15:
      CFRelease(v22);
      int v17 = a10;
      if (a1) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    CFDictionaryRef v22 = v21;
    unsigned int v69 = a7;
    int v23 = 0;
    unsigned int v78 = PMAccountFreespace(a2, 0, 0x8000u);
    if (v78) {
      goto LABEL_11;
    }
    unsigned int v78 = PMGuidSearch((uint64_t)a2, a3, &v74);
    if (v78
      || ((unsigned int v24 = (__int16 *)*a2, v67 = v74, !a4)
        ? (!a5
         ? (char *)(LOWORD(a4) = 0)
         : !*a5
         ? (LOWORD(a4) = 0, a5 = 0)
         : (char *)(LOWORD(a4) = (unsigned __int16)PMDescriptorSearch(a5, v24[257])))
        : (a5 = (char *)PMCodeSearch(a4, v24[257])),
          v78))
    {
      int v23 = 0;
      goto LABEL_11;
    }
    uint64_t v26 = (uint64_t)&v24[536 * v67 + 264];
    uint64_t v66 = v24;
    if (a5)
    {
      CFDictionaryRef theDict = (CFDictionaryRef)&v24[536 * v67 + 264];
      uint64_t v27 = (uint64_t)&v24[536 * v67 + 288];
      if (!strncasecmp((const char *)(v26 + 48), a5, 0x20uLL))
      {
        int v63 = a2;
        int v23 = 0;
        uint64_t v26 = (uint64_t)theDict;
      }
      else
      {
        int v61 = (unsigned char *)v27;
        int v23 = 0;
        unsigned int v78 = MKPurgeLoader(v20, v22, a2, v74, (int *)&v76, 0, 0, 0);
        if (v78) {
          goto LABEL_11;
        }
        int v63 = a2;
        v66[536 * v67 + 541] = a4;
        *((_DWORD *)theDict + 21) = *((_DWORD *)theDict + 3);
        strncpypad(v61, a5, 0x20uLL, 0);
        unsigned int v78 = PMDefaultPartitionStatus(v66[257], (uint64_t)theDict);
        if ((v69 & 4) == 0) {
          *((_DWORD *)theDict + 22) |= 0x100000u;
        }
        int v23 = 1;
        uint64_t v26 = (uint64_t)theDict;
      }
    }
    else
    {
      int v63 = a2;
      int v23 = 0;
    }
    if (a6)
    {
      uint64_t v28 = v26;
      CFArrayRef v29 = (unsigned char *)(v26 + 16);
      if (strncasecmp((const char *)(v26 + 16), a6, 0x20uLL))
      {
        strncpypad(v29, a6, 0x20uLL, 0);
        ++v23;
      }
      uint64_t v26 = v28;
    }
    unsigned int v78 = MKGetPartitionRequisites(v20, v66[257], (const char *)(v26 + 48), (unsigned __int16)v66[536 * v67 + 541], v73);
    if (v78) {
      goto LABEL_11;
    }
    int v30 = *(unsigned __int16 *)v73;
    if (!*(_WORD *)v73)
    {
LABEL_43:
      int v32 = 1;
      goto LABEL_44;
    }
    CFStringRef v31 = &v73[36];
    while (*(_WORD *)v31 != 1)
    {
      v31 += 38;
      if (!--v30) {
        goto LABEL_43;
      }
    }
    unsigned int v78 = -417;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v22, @"Loaders");
    if (!Value) {
      goto LABEL_11;
    }
    CFDictionaryRef v38 = Value;
    uint64_t v39 = (char *)(v31 - 34);
    unsigned int v78 = -415;
    CFStringRef v40 = CFStringCreateWithCString(0, v31 - 34, 0);
    CFDictionaryRef v41 = (const __CFDictionary *)CFDictionaryGetValue(v38, v40);
    CFStringRef v42 = v40;
    CFDictionaryRef v43 = v41;
    CFRelease(v42);
    if (!v43) {
      goto LABEL_11;
    }
    unsigned int v78 = MKGetPartitionInfo(v43, v66[257], (uint64_t)v80);
    if (v78) {
      goto LABEL_11;
    }
    CFArrayRef v44 = (const __CFArray *)CFDictionaryGetValue(v43, @"Partition Type Throw Aways");
    unsigned int v78 = MKScavangeDross((uint64_t)v66, v44, (uint64_t)v80, v74, &v75, (unsigned int *)&v76 + 1);
    if (v78) {
      goto LABEL_11;
    }
    CFDictionaryRef theDicta = v43;
    int v68 = v39;
    if (v74 <= v75) {
      goto LABEL_85;
    }
    int v45 = v75;
    if (v75 + 1 == v74)
    {
      int v46 = &v66[536 * v75];
      uint64_t v47 = (uint64_t)(v46 + 264);
      if (!strcasecmp((const char *)v46 + 576, &v80[33]) && *(_DWORD *)(v47 + 12) == DWORD2(v81))
      {
        if (v66[536 * v45 + 541] == 24320)
        {
          int v48 = 0;
LABEL_83:
          char v62 = 1;
          goto LABEL_84;
        }
        if (strcasecmp((const char *)&v66[536 * v45 + 500], v68))
        {
          unsigned int v78 = PMSetupLoader(v47, v68, (uint64_t)v80);
          if (v78) {
            goto LABEL_11;
          }
          ++v23;
        }
        int v60 = *(_DWORD *)(v47 + 88);
        char v62 = 0;
        int v48 = 0;
        unsigned int v78 = PMDefaultPartitionStatus(v66[257], v47);
        if (v60 != *(_DWORD *)(v47 + 88)) {
          ++v23;
        }
      }
      else
      {
        unsigned int v78 = PMSetTypeExtended(v47, 24320, v66[257], &unk_21E15F94E);
        if (v78) {
          goto LABEL_11;
        }
        unsigned int v78 = PMRationalise(v63);
        if (v78) {
          goto LABEL_11;
        }
        ++v23;
        char v62 = 1;
LABEL_80:
        int v48 = 1;
      }
LABEL_84:
      unsigned int v55 = PMGuidSearch((uint64_t)v63, a3, &v74);
      unsigned int v78 = v55;
      if (!v48)
      {
        uint64_t v66 = (__int16 *)*v63;
        if (v62) {
          goto LABEL_99;
        }
        __int16 v59 = v75;
LABEL_95:
        if (v66[536 * v59 + 541] != 24320)
        {
          unsigned int v55 = MKUpdateLoader((uint64_t *)v63, v59, v18, v22, v70, a9);
          unsigned int v78 = v55;
          if (!v55)
          {
            int v32 = 0;
            ++v23;
LABEL_44:
            if ((v69 & 0x1000) != 0)
            {
              BOOL v36 = v32 == 0;
              int v33 = &v75;
              if (!v36) {
                int v33 = &v74;
              }
              v23 += PMSetBootPartition((uint64_t)v66, *v33);
              int v34 = *(unsigned __int16 *)v73;
              if (*(_WORD *)v73)
              {
                uint64_t v35 = &v73[36];
                while (*(_WORD *)v35 != 3)
                {
                  v35 += 38;
                  if (!--v34) {
                    goto LABEL_51;
                  }
                }
                unsigned int v78 = -417;
                CFDictionaryRef v49 = (const __CFDictionary *)CFDictionaryGetValue(v22, @"Loaders");
                if (!v49) {
                  goto LABEL_11;
                }
                CFDictionaryRef v50 = v49;
                unsigned int v78 = -415;
                CFStringRef v51 = CFStringCreateWithCString(0, v35 - 34, 0);
                CFDictionaryRef v52 = (const __CFDictionary *)CFDictionaryGetValue(v50, v51);
                if (!v52) {
                  goto LABEL_11;
                }
                unsigned int v78 = ResolveLoaderPath(v18, v52, v51, v79);
                CFRelease(v51);
                if (v78) {
                  goto LABEL_11;
                }
                unsigned int v78 = MBRSetBootloaderFile((uint64_t)v66, v79);
                if (v78) {
                  goto LABEL_11;
                }
                ++v23;
              }
            }
LABEL_51:
            unsigned int v78 = MKPurgeLoaders(v18, (uint64_t *)v63, &v72);
            if (v78) {
              BOOL v36 = 1;
            }
            else {
              BOOL v36 = !v72;
            }
            if (!v36) {
              ++v23;
            }
LABEL_11:
            CFRelease(v20);
            goto LABEL_15;
          }
          if ((unsigned __int16)v55 == 64230)
          {
            int v32 = 0;
            unsigned int v78 = 0;
            goto LABEL_44;
          }
        }
LABEL_99:
        if (v55) {
          goto LABEL_11;
        }
        int v32 = 0;
        goto LABEL_44;
      }
LABEL_85:
      CFNumberRef v56 = (const __CFNumber *)CFDictionaryGetValue(theDicta, @"Minimum Host Size");
      if (v56)
      {
        CFNumberGetValue(v56, kCFNumberSInt32Type, &valuePtr);
        uint64_t v57 = valuePtr;
      }
      else
      {
        uint64_t v57 = 0;
      }
      unsigned int v58 = PMCreateLoader(v63, 0, v74, v57, v68, (v69 >> 13) & 1, (uint64_t)v80);
      unsigned int v78 = v58;
      if (v58)
      {
        if (v58 != 28) {
          goto LABEL_11;
        }
        int v32 = 0;
        unsigned int v78 = 0;
        uint64_t v66 = (__int16 *)*v63;
        goto LABEL_44;
      }
      unsigned int v78 = PMRationalise(v63);
      if (v78) {
        goto LABEL_11;
      }
      unsigned int v55 = PMGuidSearch((uint64_t)v63, a3, &v74);
      unsigned int v78 = v55;
      __int16 v59 = v74 - 1;
      __int16 v75 = v74 - 1;
      ++v23;
      uint64_t v66 = (__int16 *)*v63;
      goto LABEL_95;
    }
    int v48 = 0;
    uint64_t v53 = (uint64_t)&v66[536 * v75 + 264];
    int v54 = v23;
    while (1)
    {
      unsigned int v78 = PMSetTypeExtended(v53, 24320, v66[257], &unk_21E15F94E);
      if (v78)
      {
        char v62 = 1;
        int v23 = v54;
        goto LABEL_84;
      }
      unsigned int v78 = PMRationalise(v63);
      if (v78) {
        break;
      }
      ++v48;
      ++v54;
      --v74;
      v53 += 1072;
      if (v75 >= v74)
      {
        char v62 = 1;
        int v23 = v54;
        goto LABEL_80;
      }
    }
    v23 += v48;
    goto LABEL_83;
  }
  int v23 = 0;
  if (a1) {
    goto LABEL_17;
  }
LABEL_16:
  CFRelease(v18);
LABEL_17:
  uint64_t result = v78;
  BOOL *v17 = v23 != 0;
  if (result == -1) {
    return *__error();
  }
  return result;
}

uint64_t PMSetBootPartition(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 522);
  if (*(_WORD *)(a1 + 522))
  {
    uint64_t result = 0;
    for (uint64_t i = (unsigned int *)(a1 + 616); ; i += 268)
    {
      unsigned int v6 = *i;
      if (a2)
      {
        if ((v6 & 0x80000000) != 0)
        {
          unsigned int v7 = v6 & 0x7FFFFFFF;
LABEL_8:
          unsigned int *i = v7;
          uint64_t result = (result + 1);
        }
      }
      else if ((v6 & 0x80000000) == 0)
      {
        unsigned int v7 = v6 | 0xC0000000;
        goto LABEL_8;
      }
      --a2;
      if (!--v2) {
        return result;
      }
    }
  }
  return 0;
}

uint64_t VWritePartitions(Ptr *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  if (!a1) {
    return -109;
  }
  Ptr v5 = *a1;
  if (!*((_WORD *)*a1 + 1) || !*((_WORD *)v5 + 259)) {
    return -50;
  }
  if (a2 >= 0x21) {
    a2 = *((__int16 *)v5 + 257);
  }
  if (a2 - 1 < 3) {
    return APMWriteMedia(a1, a3, a4, a5);
  }
  if (a2 != 8)
  {
    if (a2 == 32) {
      return ISOWriteMedia(a1, a3, a4, a5);
    }
    return -5317;
  }
  return MBRWriteMedia(a1, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void))a5);
}

CFStringRef _MKMediaCFRuntimeCopyDebugDesc(uint64_t a1)
{
  int v2 = *(uint64_t (**)(void, void, uint64_t))(a1 + 64);
  if (!v2) {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%s <%p>", "MKMedia", a1);
  }
  CFStringRef result = (CFStringRef)v2(*(void *)(a1 + 88), 0, 1);
  if (!result) {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%s <%p>", "MKMedia", a1);
  }
  return result;
}

CFStringRef _MKMediaDeviceDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"<MKMediaRef>: %s", *(void *)(a1 + 8));
}

uint64_t DDMDrvrRecord_BtoN(uint64_t result, uint64_t a2)
{
  *(_DWORD *)CFStringRef result = bswap32(*(_DWORD *)a2);
  *(_WORD *)(result + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  return result;
}

int8x16_t PMPtchDescriptor_BtoN(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = bswap32(*(_DWORD *)a2);
  *(_WORD *)(a1 + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(a1 + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  int8x16_t result = vrev32q_s8(*(int8x16_t *)(a2 + 8));
  *(int8x16_t *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + 24));
  if (a1 != a2)
  {
    long long v3 = *(_OWORD *)(a2 + 28);
    long long v4 = *(_OWORD *)(a2 + 44);
    *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
    *(_OWORD *)(a1 + 44) = v4;
    *(_OWORD *)(a1 + 28) = v3;
    int8x16_t result = *(int8x16_t *)(a2 + 61);
    long long v5 = *(_OWORD *)(a2 + 77);
    *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
    *(_OWORD *)(a1 + 77) = v5;
    *(int8x16_t *)(a1 + 61) = result;
  }
  return result;
}

_WORD *PMPtchList_BtoN(_WORD *result, unsigned __int16 *a2)
{
  *int8x16_t result = bswap32(*a2) >> 16;
  result[1] = bswap32(a2[1]) >> 16;
  return result;
}

int8x8_t PMPtchHeader_BtoN(char *__dst, char *__src)
{
  if (__dst != __src) {
    memcpy(__dst, __src, 0x200EuLL);
  }
  *(_WORD *)__dst = bswap32(*(unsigned __int16 *)__src) >> 16;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(__src + 2));
  *(int8x8_t *)(__dst + 2) = result;
  *((_WORD *)__dst + 5) = bswap32(*((unsigned __int16 *)__src + 5)) >> 16;
  *((_WORD *)__dst + 6) = bswap32(*((unsigned __int16 *)__src + 6)) >> 16;
  return result;
}

int8x16_t PMPtchDescriptor_NtoB(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = bswap32(*(_DWORD *)a2);
  *(_WORD *)(a1 + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(a1 + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  int8x16_t result = vrev32q_s8(*(int8x16_t *)(a2 + 8));
  *(int8x16_t *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + 24));
  if (a1 != a2)
  {
    long long v3 = *(_OWORD *)(a2 + 28);
    long long v4 = *(_OWORD *)(a2 + 44);
    *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
    *(_OWORD *)(a1 + 44) = v4;
    *(_OWORD *)(a1 + 28) = v3;
    int8x16_t result = *(int8x16_t *)(a2 + 61);
    long long v5 = *(_OWORD *)(a2 + 77);
    *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
    *(_OWORD *)(a1 + 77) = v5;
    *(int8x16_t *)(a1 + 61) = result;
  }
  return result;
}

_WORD *PMPtchList_NtoB(_WORD *result, unsigned __int16 *a2)
{
  *int8x16_t result = bswap32(*a2) >> 16;
  result[1] = bswap32(a2[1]) >> 16;
  return result;
}

char *APMDDMGenerate(char *result, int a2, char a3, int a4)
{
  long long v4 = result + 18;
  *((_WORD *)result + 8) = 0;
  int v5 = *((unsigned __int16 *)result + 261);
  if (*((_WORD *)result + 261))
  {
    uint64_t v8 = result;
    unsigned __int16 v9 = 0;
    __int16 v10 = 0;
    unsigned int v24 = (a3 & 0x7F) << 9;
    do
    {
      int v11 = v10;
      unsigned int v12 = &v8[1072 * v10];
      int8x16_t result = strstr(v12 + 576, "Driver");
      if (result)
      {
        if (!a2
          || (a4 == 1 ? (BOOL v13 = (v12[619] & 3) == 2) : (BOOL v13 = 0),
              !v13 ? (char v14 = 0) : (char v14 = 1),
              (v12[619] & 3) == 0 ? (BOOL v15 = a4 == 4) : (BOOL v15 = 0),
              !v15 && (v14 & 1) == 0))
        {
          int v16 = *(unsigned __int16 *)&v8[1072 * v11 + 1082];
          unsigned int v17 = v16 - 12288;
          if ((v16 - 12288) > 4)
          {
            LOWORD(v18) = 0;
LABEL_31:
            *((_DWORD *)v12 + 154) &= 0x703u;
LABEL_32:
            if ((_WORD)v18)
            {
              *(_DWORD *)long long v4 = *((_DWORD *)v12 + 134);
              unsigned int v22 = *((_DWORD *)v12 + 156);
              if (v22 % v24) {
                __int16 v23 = v22 / v24 + 1;
              }
              else {
                __int16 v23 = v22 / v24;
              }
              *((_WORD *)v4 + 2) = v23;
              *((_WORD *)v4 + 3) = v18;
              v4 += 8;
              *((_WORD *)v8 + 8) = ++v9;
            }
            goto LABEL_37;
          }
          int v18 = word_21E15F0FC[(__int16)v17];
          if (!v9) {
            goto LABEL_31;
          }
          __int16 v19 = 0;
          signed __int16 v20 = 0;
          do
          {
            BOOL v21 = v19 == 0;
            if (*(unsigned __int16 *)&v8[8 * v20 + 24] == (__int16)v18) {
              ++v19;
            }
            if (*(unsigned __int16 *)&v8[8 * v20 + 24] == (__int16)v18 && v21) {
              int v18 = -v18;
            }
            ++v20;
          }
          while (v9 > v20);
          *((_DWORD *)v12 + 154) &= 0x703u;
          if (!a2 || !v19) {
            goto LABEL_32;
          }
          if (a4 == 1)
          {
            if (v16 != 12290 && v16 != 12292) {
              goto LABEL_32;
            }
          }
          else if (v17 > 3 || v16 == 12290)
          {
            goto LABEL_32;
          }
        }
      }
LABEL_37:
      __int16 v10 = v11 + 1;
    }
    while (v5 > (__int16)(v11 + 1));
  }
  *(void *)long long v4 = 0;
  return result;
}

uint64_t apmirec2xrec(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 496) = 0;
  *(_OWORD *)(a2 + 464) = 0u;
  *(_OWORD *)(a2 + 480) = 0u;
  *(_OWORD *)(a2 + 432) = 0u;
  *(_OWORD *)(a2 + 448) = 0u;
  *(_OWORD *)(a2 + 400) = 0u;
  *(_OWORD *)(a2 + 416) = 0u;
  *(_OWORD *)(a2 + 368) = 0u;
  *(_OWORD *)(a2 + 384) = 0u;
  *(_OWORD *)(a2 + 336) = 0u;
  *(_OWORD *)(a2 + 352) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_WORD *)a2 = 20557;
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  *(void *)(a2 + 80) = *(void *)(a1 + 80);
  *(_DWORD *)(a2 + 88) = *(_DWORD *)(a1 + 88) & 0xF000FFFF;
  *(void *)(a2 + 92) = *(void *)(a1 + 92);
  *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 116);
  __strlcpy_chk();
  __strlcpy_chk();
  __strlcpy_chk();
  uint64_t result = __strlcpy_chk();
  *(_DWORD *)(a2 + 136) = *(_DWORD *)(a1 + 136);
  *(_DWORD *)(a2 + 148) = *(_DWORD *)(a1 + 464);
  *(_DWORD *)(a2 + 500) = *(_DWORD *)(a1 + 512);
  *(_WORD *)(a2 + 498) = *(_WORD *)(a1 + 508);
  return result;
}

uint64_t PMPTCHQuantify(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  if (a1)
  {
    uint64_t v7 = *(unsigned __int16 *)(a1 + 498);
    if (v7 == a3)
    {
      return 0;
    }
    else
    {
      int v12 = *(_DWORD *)(a1 + 8);
      Ptr v13 = NewPtrClear((unint64_t)(v7 & 0x7F) << 9);
      OSErr v14 = MemError();
      if (v13)
      {
        uint64_t v15 = (v12 * a2);
        int v16 = a5(a4, 2, 512, v15, v7, v13);
        __int16 v8 = v16;
        if (!v16)
        {
          unsigned int v17 = bswap32(*(unsigned __int16 *)v13) >> 16;
          *(_WORD *)Ptr v13 = v17;
          unsigned int v18 = *((unsigned __int16 *)v13 + 1);
          unsigned int v19 = __rev16(v18);
          *((_WORD *)v13 + 1) = v19;
          if (v19 <= 0x20 && (unsigned int v20 = *(_DWORD *)(a1 + 12), v20 >= v17))
          {
            if (v18)
            {
              unsigned int v29 = v15;
              int v22 = 0;
              int v23 = 0;
              unsigned int v24 = v20 * a2;
              while (1)
              {
                int v25 = &v13[v22 + 4];
                PMPtchDescriptor_BtoN((uint64_t)v25, (uint64_t)v25);
                unsigned int v26 = *((_DWORD *)v25 + 3) * v7;
                unsigned int v27 = v26 + (*((_DWORD *)v25 + 4) >> 9);
                if ((*((_DWORD *)v25 + 4) & 0x1FF) != 0) {
                  ++v27;
                }
                if (v27 > v24) {
                  break;
                }
                if (v24 >= v26) {
                  unsigned int v24 = *((_DWORD *)v25 + 3) * v7;
                }
                *((_DWORD *)v25 + 3) = v26 / a3;
                v22 += *((_DWORD *)v25 + 6);
                PMPtchDescriptor_NtoB((uint64_t)v25, (uint64_t)v25);
                ++v23;
                unsigned int v18 = *((unsigned __int16 *)v13 + 1);
                if (v18 <= (unsigned __int16)v23)
                {
                  unsigned int v17 = *(unsigned __int16 *)v13;
                  uint64_t v15 = v29;
                  goto LABEL_22;
                }
              }
              __int16 v8 = -5344;
            }
            else
            {
LABEL_22:
              *(_WORD *)Ptr v13 = __rev16(v17);
              *((_WORD *)v13 + 1) = __rev16(v18);
              int v28 = a5(a4, 3, 512, v15, v7, v13);
              __int16 v8 = v28;
              if (!v28) {
                *(_WORD *)(a1 + 498) = a3;
              }
            }
          }
          else
          {
            __int16 v8 = -5325;
          }
        }
        DisposePtr(v13);
      }
      else
      {
        return v14;
      }
    }
  }
  else
  {
    return -50;
  }
  return v8;
}

uint64_t DDMRecord_NtoB(uint64_t result, unsigned __int16 *a2)
{
  *(_WORD *)uint64_t result = bswap32(*a2) >> 16;
  *(_WORD *)(result + 2) = bswap32(a2[1]) >> 16;
  *(_DWORD *)(result + 4) = bswap32(*((_DWORD *)a2 + 1));
  *(_WORD *)(result + 8) = bswap32(a2[4]) >> 16;
  *(_WORD *)(result + 10) = bswap32(a2[5]) >> 16;
  *(_DWORD *)(result + 12) = bswap32(*((_DWORD *)a2 + 3));
  *(_WORD *)(result + 16) = bswap32(a2[8]) >> 16;
  unsigned int v2 = a2[8];
  if (a2[8])
  {
    unsigned int v3 = 0;
    long long v4 = a2 + 9;
    uint64_t v5 = result + 18;
    do
    {
      *(_DWORD *)uint64_t v5 = bswap32(*(_DWORD *)v4);
      *(_WORD *)(v5 + 4) = bswap32(v4[2]) >> 16;
      *(_WORD *)(v5 + 6) = bswap32(v4[3]) >> 16;
      ++v3;
      v4 += 4;
      v5 += 8;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t APMReadRawMediaMap(const void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  v18[0] = 0;
  v18[1] = 0;
  int v19 = 0;
  int v7 = PMConvertBlocks(63, *((unsigned __int16 *)*a1 + 1), 0x200u);
  int v8 = APMMapAnalysis((uint64_t)v18, (unsigned __int16)v7, 2u, 0, a3, a4);
  __int16 v9 = v8;
  if (!v8)
  {
    __int16 v10 = (v18[0] & 1) == 0;
    if (v7 << 16 <= 0x10000)
    {
      __int16 v9 = 0;
    }
    else
    {
      uint64_t v11 = 1;
      while (1)
      {
        int v12 = malloc_type_malloc(0x200uLL, 0x1F5F1FA8uLL);
        if (!v12) {
          break;
        }
        Ptr v13 = v12;
        int v14 = a4(a3, 2, 512, v11, 1, (unsigned __int16 *)v12);
        if (v14) {
          goto LABEL_23;
        }
        if (PMRecord_BtoN((uint64_t)v20, (unsigned __int16 *)v13))
        {
          apmxrec2irec((uint64_t)v20, (char *)v22);
          uint64_t v15 = PMLookupDESC(v23, 0, (unsigned __int16 *)&APMDescriptors);
          if (v15)
          {
            int v16 = *v15;
            switch(v16)
            {
              case 24320:
                if (!v22[3]) {
                  __int16 v10 = 2;
                }
                LOWORD(v16) = 24320;
                break;
              case 20482:
                __int16 v10 = 3;
                LOWORD(v16) = 20482;
                break;
              case 12544:
                WORD6(v28) = 1;
                LOWORD(v16) = 12544;
                break;
            }
          }
          else
          {
            LOWORD(v16) = 0;
          }
          __int16 v29 = v16;
          WORD5(v28) = v11 - 1;
          WORD4(v28) = -1;
          *((void *)&v24 + 1) = v13;
          LOWORD(v14) = addentry(a1, v22, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
          if ((_WORD)v14)
          {
LABEL_23:
            __int16 v9 = v14;
LABEL_24:
            free(v13);
            goto LABEL_26;
          }
          Ptr v13 = 0;
        }
        uint64_t v11 = (v11 + 1);
        if ((__int16)v7 <= (int)(unsigned __int16)v11)
        {
          __int16 v9 = 0;
          if (!v13) {
            goto LABEL_26;
          }
          goto LABEL_24;
        }
      }
      __int16 v9 = -1;
    }
LABEL_26:
    *((_WORD *)*a1 + 257) = v10;
  }
  return v9;
}

uint64_t PMSetDriver(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a1)
  {
    uint64_t v6 = *a1;
    if (*(unsigned __int16 *)(*a1 + 522) <= a2)
    {
      LOWORD(v16) = -5343;
    }
    else
    {
      uint64_t v10 = *(unsigned __int16 *)(v6 + 2);
      uint64_t v11 = v6 + 1072 * a2;
      if (*(unsigned char *)(v11 + 576) && !strstr((char *)(v11 + 576), "Driver"))
      {
        LOWORD(v16) = -5342;
      }
      else
      {
        int v12 = (unsigned int *)(v11 + 528);
        uint64_t v13 = *(void *)(a3 + 96);
        if ((*(_WORD *)a3 & 0x200) != 0 && *(_WORD *)(v13 + 12) == 9251 && !*(_DWORD *)(v13 + 22)) {
          *(_DWORD *)(v13 + 22) = bswap32(*(_DWORD *)(a3 + 8));
        }
        unsigned int v14 = DrvrChecksum((unsigned __int8 *)v13, *(unsigned __int16 *)(a3 + 8));
        unsigned int v15 = *(_DWORD *)(a3 + 8);
        if (v12[29] == v14 && v15 == v12[24])
        {
          LOWORD(v16) = -1306;
        }
        else if (v15 <= v12[3] * v10)
        {
          uint64_t v17 = v12[2];
          int v16 = a5(a4, 4, v10, v17);
          if (!v16)
          {
            unsigned int v18 = *(_DWORD *)(a3 + 8);
            unsigned int v19 = v18 / v10;
            if (v18 % v10) {
              uint64_t v20 = v19 + 1;
            }
            else {
              uint64_t v20 = v19;
            }
            int v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a5)(a4, 3, v10, v17, v20, *(void *)(a3 + 96));
            if (!v16)
            {
              v12[24] = *(_DWORD *)(a3 + 8);
              v12[29] = v14;
              v12[22] = *(_WORD *)a3 & 0x700 | 3;
              __strlcpy_chk();
              LOWORD(v16) = 0;
              *(_DWORD *)(v6 + 1072 * a2 + 664) = *(_DWORD *)(a3 + 4);
            }
          }
        }
        else
        {
          LOWORD(v16) = -1310;
        }
      }
    }
  }
  else
  {
    LOWORD(v16) = -109;
  }
  return (__int16)v16;
}

uint64_t PMWriteDriver(Ptr *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (!a1)
  {
    LOWORD(v19) = -109;
    return (__int16)v19;
  }
  __int16 v9 = (char *)(a2 + 12);
  int v10 = *(_DWORD *)(a2 + 4);
  unsigned __int16 v24 = 0x8000;
  SInt8 v11 = HGetState(a1);
  HLock(a1);
  uint64_t v12 = *((unsigned __int16 *)*a1 + 261);
  if (*((_WORD *)*a1 + 261))
  {
    uint64_t v13 = 0;
    uint64_t v14 = (uint64_t)(*a1 + 576);
    while (!strstr((char *)v14, "Driver")
         || v10 && *(_DWORD *)(v14 + 88) != v10
         || strncasecmp((const char *)v14, v9, 0x20uLL))
    {
      ++v13;
      v14 += 1072;
      if (v12 == v13) {
        goto LABEL_9;
      }
    }
    unsigned __int16 v24 = v13;
    HSetState(a1, v11);
    LOWORD(v19) = -1306;
    goto LABEL_18;
  }
LABEL_9:
  HSetState(a1, v11);
  Ptr v15 = *a1;
  unsigned int v16 = *(_DWORD *)(a2 + 8);
  if (v16 <= a3) {
    unsigned int v16 = a3;
  }
  unsigned int v17 = *((unsigned __int16 *)v15 + 259);
  if (v16 % v17) {
    int v18 = v16 / v17 + 1;
  }
  else {
    int v18 = v16 / v17;
  }
  int v19 = PMNewPartitionExtended((const void **)a1, 0, v9, 0, v18 * v17 / *((unsigned __int16 *)v15 + 1), (unsigned char *)(a2 + 44), a4, &v24, 0);
  if (!v19)
  {
LABEL_18:
    if (*(void *)(a2 + 96)) {
      LOWORD(v19) = PMSetDriver((uint64_t *)a1, v24, a2, a5, a6);
    }
  }
  return (__int16)v19;
}

uint64_t PMAddpatch(uint64_t a1, int a2, _DWORD *a3, unsigned __int8 *a4, unsigned int a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  __int16 v7 = -50;
  if (a1 && a3 && a2 >= 1 && a3[4])
  {
    uint64_t v12 = *(void *)a1 + 1072 * (unsigned __int16)a2;
    if (*(unsigned __int16 *)(v12 + 1036) <= 1u) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = *(unsigned __int16 *)(v12 + 1036);
    }
    unsigned int v14 = *(unsigned __int16 *)(*(void *)a1 + 2);
    int v15 = *(_DWORD *)(v12 + 536);
    Ptr v16 = NewPtrClear((unint64_t)(v13 & 0x7F) << 9);
    OSErr v17 = MemError();
    if (v16)
    {
      unsigned int v18 = v14 >> 9;
      uint64_t v19 = v15 * v18;
      int v20 = a7(a6, 2, 512, v19, v13, v16);
      __int16 v7 = v20;
      if (!v20)
      {
        unsigned int v22 = bswap32(*(unsigned __int16 *)v16);
        *(_WORD *)Ptr v16 = HIWORD(v22);
        unsigned int v23 = *((unsigned __int16 *)v16 + 1);
        unsigned int v24 = __rev16(v23);
        *((_WORD *)v16 + 1) = v24;
        unsigned int v25 = *(_DWORD *)(v12 + 540);
        __int16 v7 = -5325;
        if (v25 >= HIWORD(v22) && v24 <= 0x20)
        {
          unsigned int v53 = v19;
          uint64_t v54 = a6;
          unsigned int v55 = a7;
          unsigned __int16 v56 = (_WORD)v13 << 9;
          uint64_t v52 = v13;
          unsigned int v26 = v25 * v18 / v13;
          if (v23)
          {
            int v27 = 0;
            int v28 = 0;
            unsigned int v29 = 0;
            do
            {
              uint64_t v30 = &v16[v28 + 4];
              PMPtchDescriptor_BtoN((uint64_t)v30, (uint64_t)v30);
              unsigned int v31 = *((_DWORD *)v30 + 3);
              if (v31)
              {
                if (v26 >= v31) {
                  unsigned int v26 = *((_DWORD *)v30 + 3);
                }
                v27 += *((_DWORD *)v30 + 4);
                if (*(_DWORD *)v30 == *a3) {
                  break;
                }
              }
              v28 += *((_DWORD *)v30 + 6);
              ++v29;
            }
            while (v29 < *((unsigned __int16 *)v16 + 1));
          }
          else
          {
            int v28 = 0;
            int v27 = 0;
          }
          int v32 = DrvrChecksum(a4, *((unsigned __int16 *)a3 + 8));
          size_t v33 = ((2 * (*((unsigned char *)a3 + 61) & 1) + *((unsigned __int8 *)a3 + 61)) & 0x1FEu) + 62;
          a3[5] = v32;
          a3[6] = v33;
          int v34 = &v16[v28 + 4];
          memcpy(v34, a3, v33);
          unsigned int v35 = *((_DWORD *)v34 + 4);
          if (v35 % v56) {
            unsigned int v36 = v35 / v56 + 1;
          }
          else {
            unsigned int v36 = v35 / v56;
          }
          if (a5 <= 1) {
            unsigned int v37 = 1;
          }
          else {
            unsigned int v37 = a5;
          }
          int v38 = v36 / v37;
          if (v36 % v37) {
            ++v38;
          }
          unsigned int v39 = v26 - v38 * v37;
          *((_DWORD *)v34 + 3) = v39;
          unsigned int v51 = v36;
          Ptr v40 = NewPtrClear(v36 * v56);
          OSErr v41 = MemError();
          if (v40)
          {
            if (v26 >= v39) {
              unsigned int v26 = v39;
            }
            memcpy(v40, a4, *((unsigned int *)v34 + 4));
            unsigned int v42 = a3[6] + v28;
            if (v42 % v56) {
              unsigned int v43 = v42 / v56 + 1;
            }
            else {
              unsigned int v43 = v42 / v56;
            }
            __int16 v7 = -5344;
            if (v43 <= 1 && v26 > v43)
            {
              v55(v54, 3, v56, *((_DWORD *)v34 + 3) + v53 / v52, v51, v40);
              int v44 = (unsigned __int16)(*((_WORD *)v16 + 1))++ + 1;
              unsigned int v45 = *((_DWORD *)v34 + 4) + v27;
              if (v45 % v56) {
                unsigned int v46 = v45 / v56 + 1;
              }
              else {
                unsigned int v46 = v45 / v56;
              }
              *(_WORD *)Ptr v16 = v46;
              if ((v44 & 0x10000) != 0)
              {
                unsigned int v47 = 0;
              }
              else
              {
                int v48 = 0;
                int v49 = 0;
                do
                {
                  uint64_t v50 = (uint64_t)&v16[v48 + 4];
                  v48 += *(_DWORD *)(v50 + 24);
                  PMPtchDescriptor_NtoB(v50, v50);
                  ++v49;
                  unsigned int v47 = *((unsigned __int16 *)v16 + 1);
                }
                while (v47 > (unsigned __int16)v49);
                unsigned int v46 = *(unsigned __int16 *)v16;
              }
              *(_WORD *)Ptr v16 = bswap32(v46) >> 16;
              *((_WORD *)v16 + 1) = __rev16(v47);
              __int16 v7 = v55(v54, 3, 512, v53, v52, v16);
            }
            DisposePtr(v40);
          }
          else
          {
            __int16 v7 = v41;
          }
        }
      }
      DisposePtr(v16);
    }
    else
    {
      return v17;
    }
  }
  return v7;
}

CFArrayRef APMCFCreateMapRuns(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_2644971F0;
  int valuePtr = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  int valuePtr = 1;
  CFTypeRef cf = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
  CFTypeRef v8 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFRelease(values);
  CFRelease(cf);
  CFArrayRef v5 = CFArrayCreate(v4, &v8, 1, MEMORY[0x263EFFF70]);
  CFRelease(v8);
  *a3 = 0;
  return v5;
}

uint64_t ApplyToHFSPlusCatalogRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  return ApplyToHFSPlusBTreeRecords(a1, a2, a3, 0);
}

uint64_t ApplyToHFSPlusBTreeRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3, int a4)
{
  v58[30] = *MEMORY[0x263EF8340];
  uint64_t v48 = 0;
  unsigned int Sectors = MKReadHFSMDBVHB((uint64_t)a1, (int *)&v48, v55, 0, 0);
  if (Sectors) {
    return Sectors;
  }
  if (v48 < 2) {
    return -123;
  }
  if (v48 == 3) {
    uint64_t v8 = MKMediaCreateWithEmbeddedHFSPlus((uint64_t)a1, (int *)&Sectors);
  }
  else {
    uint64_t v8 = (uint64_t)CFRetain(a1);
  }
  __int16 v9 = (const void *)v8;
  if (!Sectors)
  {
    unint64_t v10 = v56;
    SInt8 v11 = a4 == 1 ? &v57 : v58;
    uint64_t v12 = a4 == 1 ? 3 : 4;
    unsigned int Sectors = MKHFSPlusMapFileBlock(v11, 0, 0, 0, (char *)&v48 + 4, 0);
    if (!Sectors)
    {
      unint64_t v13 = v10 >> 9;
      unsigned int Sectors = MKMediaReadSectors((uint64_t)v9, HIDWORD(v48) * (unint64_t)(v10 >> 9), 1uLL, (char *)&v51, 0);
      if (!Sectors)
      {
        TAO_BTNodeDescriptor_BigToHost(&v51);
        TAO_BTHeaderRec_BigToHost(v52);
        uint64_t v14 = (unsigned __int16)size;
        if ((_WORD)size)
        {
          int v15 = (int8x8_t *)malloc_type_calloc(1uLL, (unsigned __int16)size, 0x70EE92C1uLL);
          if (v15)
          {
            Ptr v16 = v15;
            uint64_t v47 = a3;
            int v46 = v53;
            unsigned int v44 = v14;
            uint64_t v38 = (uint64_t)v15 + v14 - 2;
            unsigned int v39 = v13;
            int v43 = a4;
            uint64_t v41 = (uint64_t)v11;
            uint64_t v42 = (uint64_t)v9;
            unsigned int v40 = v12;
            do
            {
              if (!v46) {
                break;
              }
              unsigned int Sectors = ReadWriteBTreeNode((uint64_t)v11, v44, v13, 0, v46, v16, (uint64_t)v9, v12);
              if (Sectors) {
                break;
              }
              int v45 = v16->i32[0];
              char v17 = 0;
              if (a4)
              {
                unint64_t v18 = 0;
                char v50 = 0;
                uint64_t v19 = (unsigned __int16 *)v38;
                while (v18 < v16[1].u16[1])
                {
                  unsigned int v20 = bswap32(*v19);
                  uint64_t v21 = (unsigned __int16 *)((char *)v16 + HIWORD(v20));
                  TAO_HFSPlusExtentKey_BigToHost(v21);
                  uint64_t v22 = (uint64_t)v16 + (unsigned __int16)(*v21 + HIWORD(v20) + 2);
                  __n128 v23 = TAO_HFSPlusExtentRecord_BigToHost(v22);
                  unsigned int v24 = a2(v21, v22, v47, &v50, v23);
                  unsigned int v25 = v24;
                  if (!v24 || v24 == -128)
                  {
                    ++v18;
                    if (v50) {
                      char v17 = 1;
                    }
                    TAO_HFSPlusExtentRecord_BigToHost(v22);
                    TAO_HFSPlusExtentKey_BigToHost(v21);
                    --v19;
                    if (!v25) {
                      continue;
                    }
                  }
                  goto LABEL_51;
                }
              }
              else
              {
                unint64_t v26 = 0;
                char v50 = 0;
                int v27 = (unsigned __int16 *)v38;
                while (v26 < v16[1].u16[1])
                {
                  unsigned int v28 = bswap32(*v27);
                  unsigned int v29 = (unsigned __int16 *)((char *)v16 + HIWORD(v28));
                  TAO_HFSPlusCatalogKey_BigToHost(v29);
                  unsigned int v31 = (unsigned __int16 *)((char *)v16 + (unsigned __int16)(*v29 + HIWORD(v28) + 2));
                  int v32 = (int)bswap32(*v31) >> 16;
                  if ((v32 - 3) < 2)
                  {
                    TAO_HFSPlusCatalogThread_BigToHost(v31);
                    uint64_t v33 = v47;
                  }
                  else
                  {
                    uint64_t v33 = v47;
                    if (v32 == 2)
                    {
                      v30.n128_f64[0] = TAO_HFSPlusCatalogFile_BigToHost(v31);
                    }
                    else if (v32 == 1)
                    {
                      v30.n128_u64[0] = (unint64_t)TAO_HFSPlusCatalogFolder_BigToHost(v31);
                    }
                  }
                  unsigned int v34 = a2(v29, (uint64_t)v31, v33, &v50, v30);
                  unsigned int v25 = v34;
                  if (!v34 || v34 == -128)
                  {
                    if (v50) {
                      char v17 = 1;
                    }
                    if ((v32 - 3) < 2)
                    {
                      TAO_HFSPlusCatalogThread_HostToBig(v31);
                    }
                    else if (v32 == 2)
                    {
                      TAO_HFSPlusCatalogFile_BigToHost(v31);
                    }
                    else if (v32 == 1)
                    {
                      TAO_HFSPlusCatalogFolder_BigToHost(v31);
                    }
                    TAO_HFSPlusCatalogKey_HostToBig(v29);
                    --v27;
                    ++v26;
                    if (!v25) {
                      continue;
                    }
                  }
                  goto LABEL_51;
                }
              }
              unsigned int v25 = 0;
LABEL_51:
              SInt8 v11 = (uint64_t *)v41;
              __int16 v9 = (const void *)v42;
              uint64_t v12 = v40;
              LODWORD(v13) = v39;
              unsigned int Sectors = v25;
              a4 = v43;
              if (v25)
              {
                if (v25 != -128) {
                  break;
                }
              }
              if (v17)
              {
                unsigned int v35 = ReadWriteBTreeNode(v41, v44, v39, 1, v46, v16, v42, v40);
                if (v35)
                {
                  unsigned int Sectors = v35;
                  break;
                }
                unsigned int v25 = Sectors;
              }
              int v46 = v45;
            }
            while (!v25);
            free(v16);
            goto LABEL_63;
          }
          unsigned int v36 = 12;
        }
        else
        {
          unsigned int v36 = 22;
        }
        unsigned int Sectors = v36;
      }
    }
  }
LABEL_63:
  if (v9) {
    CFRelease(v9);
  }
  return Sectors;
}

uint64_t ApplyToHFSPlusExtentRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  return ApplyToHFSPlusBTreeRecords(a1, a2, a3, 1);
}

uint64_t ReadWriteBTreeNode(uint64_t a1, unsigned int a2, unsigned int a3, int a4, int a5, int8x8_t *a6, uint64_t a7, uint64_t a8)
{
  if (a4) {
    TAO_BTNodeDescriptor_BigToHost(a6);
  }
  unsigned int v30 = 0;
  unint64_t v15 = a2 >> 9;
  if (a8 == 3) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = a7;
  }
  unsigned int v28 = a6;
  if (v15 <= a3)
  {
    uint64_t result = MKHFSPlusMapFileBlock(a1, a8, 0, (int)v15 * a5 / a3, &v30, v16);
    if (!result)
    {
      unint64_t v27 = (int)v15 * a5 % a3 + v30 * (unint64_t)a3;
      if (a4)
      {
        return MKMediaWriteSectors(a7, v27, v15, (char *)a6, 0);
      }
      else
      {
        uint64_t result = MKMediaReadSectors(a7, v27, v15, (char *)a6, 0);
        if (!result)
        {
LABEL_22:
          TAO_BTNodeDescriptor_BigToHost(v28);
          return 0;
        }
      }
    }
  }
  else
  {
    unsigned int v17 = 0;
    int v18 = 0;
    unsigned int v19 = v15 / a3;
    unsigned int v20 = v15 / a3 * a5;
    unint64_t v21 = a3;
    unsigned int v22 = a3 << 9;
    if (v19 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v19;
    }
    while (1)
    {
      uint64_t result = MKHFSPlusMapFileBlock(a1, a8, 0, v20 + v18, &v30, v16);
      if (result) {
        break;
      }
      unint64_t v25 = v30 * (unint64_t)v21;
      unint64_t v26 = (char *)v28 + v17;
      uint64_t result = a4 ? MKMediaWriteSectors(a7, v25, v21, v26, 0) : MKMediaReadSectors(a7, v25, v21, v26, 0);
      if (result) {
        break;
      }
      ++v18;
      v17 += v22;
      if (!--v23)
      {
        if (a4) {
          return 0;
        }
        goto LABEL_22;
      }
    }
  }
  return result;
}

uint64_t MKRecordEFATFSRuns(uint64_t a1, int a2, void (*a3)(uint64_t, uint64_t, void), uint64_t a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  memset(v55, 0, sizeof(v55));
  long long v59 = 0u;
  memset(v60, 0, sizeof(v60));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  MKMediaGetGeometry(a1, (uint64_t)v55);
  LOWORD(v56) = 5;
  unsigned __int16 v7 = v55[0];
  LODWORD(v57) = LODWORD(v55[0]) >> 9;
  *((void *)&v57 + 1) = *((void *)&v55[0] + 1);
  *(_OWORD *)size_t size = 0u;
  long long v53 = 0u;
  memset(v54, 0, sizeof(v54));
  int v8 = 12 * LODWORD(v55[0]);
  LOWORD(size[0]) = v55[0];
  __int16 v9 = (char *)malloc_type_malloc((12 * LODWORD(v55[0])), 0x331B4A4CuLL);
  if (v9)
  {
    unsigned int v10 = v7;
    while (1)
    {
      SInt8 v11 = v9;
      if (v10 - 4097 < 0xFFFFF1FF)
      {
        uint64_t v15 = 4294967173;
        goto LABEL_30;
      }
      uint64_t Blocks = MKMediaReadBlocks(a1, 0, 12, v10, v9, 0);
      if (Blocks) {
        break;
      }
      unsigned int v13 = v11[108];
      unsigned int v10 = (unsigned __int16)(1 << v13);
      LOWORD(size[0]) = 1 << v13;
      if (v8 == 12 * v10)
      {
        uint64_t v14 = v11;
LABEL_14:
        if (v13 <= 0xF)
        {
          int v17 = 0;
          uint64_t v18 = 0;
          uint64_t v16 = 11 * (unsigned __int16)(1 << v13);
          do
          {
            if (v18 != 112 && (v18 & 0x7FFFFFFFFFFFFFFELL) != 0x6A)
            {
              HIDWORD(v19) = v17;
              LODWORD(v19) = v17;
              int v17 = (v19 >> 1) + v14[v18];
            }
            ++v18;
          }
          while (v16 != v18);
        }
        else
        {
          uint64_t v16 = 0;
          int v17 = 0;
        }
        unsigned int v20 = &v14[v16];
        while (v20 < &v14[12 * (unsigned __int16)(1 << v13)])
        {
          int v21 = *(_DWORD *)v20;
          v20 += 4;
          if (v21 != v17) {
            goto LABEL_26;
          }
        }
        int v22 = v11[109];
        if (v22 + v11[108] > 0x19)
        {
LABEL_26:
          uint64_t v15 = 22;
          goto LABEL_29;
        }
        WORD1(size[0]) = (unsigned __int16)(1 << v13) >> 9;
        unsigned int v39 = v10 << v22;
        WORD2(size[0]) = v39 / v10;
        unsigned int v40 = v11[110];
        HIWORD(size[0]) = v11[110];
        WORD4(v54[1]) = *((_WORD *)v11 + 53);
        unsigned int v41 = BYTE8(v54[1]) & 1;
        WORD1(size[1]) = v41 + 1;
        *(_OWORD *)((char *)v54 + 8) = *((_OWORD *)v11 + 4);
        int v42 = *((_DWORD *)v11 + 21);
        DWORD1(v54[0]) = *((_DWORD *)v11 + 20);
        LOWORD(size[1]) = v42;
        unsigned int v44 = *((_DWORD *)v11 + 22);
        unsigned int v43 = *((_DWORD *)v11 + 23);
        HIDWORD(size[1]) = v39;
        *(void *)&long long v53 = __PAIR64__(v44, v43);
        unsigned int v45 = *((_DWORD *)v11 + 24);
        DWORD2(v53) = v45;
        if (v45 >= v43) {
          int v46 = 22;
        }
        else {
          int v46 = 0;
        }
        if (v45 >= 2) {
          unsigned int v47 = v46;
        }
        else {
          unsigned int v47 = 22;
        }
        if (v41 >= v40) {
          unsigned int v47 = 22;
        }
        if (v40 - 3 >= 0xFFFFFFFE) {
          uint64_t v15 = v47;
        }
        else {
          uint64_t v15 = 22;
        }
        goto LABEL_29;
      }
      if (!malloc_type_realloc(v11, 12 * (unsigned __int16)(1 << v13), 0x4352D10FuLL))
      {
        SInt8 v11 = 0;
        goto LABEL_28;
      }
      __int16 v9 = (char *)malloc_type_malloc(12 * (unsigned __int16)(1 << v13), 0x331B4A4CuLL);
      int v8 = 12 * (unsigned __int16)(1 << v13);
      if (!v9)
      {
        uint64_t v14 = 0;
        goto LABEL_14;
      }
    }
    uint64_t v15 = Blocks;
    if (Blocks == -1) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }
  SInt8 v11 = 0;
LABEL_28:
  uint64_t v15 = *__error();
  uint64_t v14 = v11;
LABEL_29:
  SInt8 v11 = v14;
  if (v14) {
LABEL_30:
  }
    free(v11);
  if (v15)
  {
    uint64_t v23 = 0;
    unsigned int v24 = 0;
  }
  else
  {
    HIDWORD(v56) = LOWORD(size[0]) >> 9;
    uint64_t v25 = v53 * WORD2(size[0]);
    *(void *)&long long v58 = *(void *)&v54[1] * WORD1(size[0]);
    *((void *)&v58 + 1) = (v25 + DWORD1(v53)) * WORD1(size[0]);
    *((void *)&v59 + 1) = (v25 + DWORD1(v53)) * WORD1(size[0]);
    if ((BYTE8(v54[1]) & 2) != 0) {
      *(void *)&v60[0] |= 2uLL;
    }
    if ((BYTE8(v54[1]) & 4) != 0) {
      *(void *)&v60[0] |= 0x10uLL;
    }
    float v26 = (float)*((unint64_t *)&v57 + 1) / (float)((v25 + DWORD1(v53)) * WORD1(size[0]));
    if (v26 > 10000.0 || v26 < 0.0001)
    {
      a3(a4, 4, 0);
      return 22;
    }
    uint64_t v23 = (char *)malloc_type_malloc(HIDWORD(size[1]), 0x80F14BBEuLL);
    if (!v23 || (unint64_t v27 = (char *)malloc_type_malloc(HIDWORD(size[1]), 0xC6969CDuLL)) == 0)
    {
      a3(a4, 4, 0);
      unsigned int v24 = 0;
      goto LABEL_70;
    }
    unsigned int v24 = v27;
    uint64_t v51 = 0;
    uint64_t v49 = a4;
    unsigned int v28 = DWORD2(v53);
    while (v28 < (int)v53 + 2)
    {
      uint64_t v29 = MKMediaReadBlocks(a1, ((v28 - 2) * WORD2(size[0]) + (unint64_t)DWORD1(v53)) * WORD1(size[0]), WORD2(size[0]) * (unint64_t)WORD1(size[0]), 0x200u, v23, 0);
      if (v29)
      {
        uint64_t v15 = v29;
        goto LABEL_85;
      }
      if (HIDWORD(size[1]))
      {
        unsigned int v30 = v23;
        do
        {
          int v31 = *v30;
          if (v31 == 129)
          {
            if (WORD1(size[1]) == (v30[1] & 1) + 1)
            {
              HIDWORD(v53) = *((_DWORD *)v30 + 5);
              unint64_t v32 = *((void *)v30 + 3);
              if (v32 % HIDWORD(size[1])) {
                int v33 = v32 / HIDWORD(size[1]) + 1;
              }
              else {
                int v33 = v32 / HIDWORD(size[1]);
              }
              LODWORD(v54[0]) = v33;
            }
          }
          else if (v31 == 131)
          {
            int v34 = v30[1];
            if ((v34 - 13) >= 0xFFFFFFF4) {
              uniconvert((char *)v60 + 12, 256, 0x8000100u, 0, (const UInt8 *)v30 + 2, 2 * v34, 0x14000100u, 1u);
            }
          }
          else if (!*v30)
          {
            goto LABEL_86;
          }
          v30 += 32;
        }
        while (v30 < &v23[HIDWORD(size[1])]);
      }
      unsigned int v35 = a3;
      unsigned int v36 = 4 * v28 / HIDWORD(size[1]);
      if (v51 != v36 + DWORD1(v54[0]) * WORD1(size[1]))
      {
        uint64_t v37 = MKMediaReadBlocks(a1, v36 + DWORD1(v54[0]) * WORD1(size[1]), (unsigned __int16)(HIDWORD(size[1]) / LOWORD(size[0])), LOWORD(size[0]), v24, 0);
        uint64_t v51 = v36 + DWORD1(v54[0]) * WORD1(size[1]);
        if (v37)
        {
          uint64_t v15 = v37;
          a3 = v35;
LABEL_85:
          if ((v15 & 0x80000000) != 0)
          {
            a4 = v49;
            goto LABEL_33;
          }
          break;
        }
      }
      unsigned int v28 = *(_DWORD *)&v24[4 * v28 % HIDWORD(size[1])];
      a3 = v35;
      if (v28 + 1 < 2) {
        break;
      }
    }
LABEL_86:
    a4 = v49;
    uint64_t v48 = ((uint64_t (*)(uint64_t, void, void))a3)(v49, 0, 0);
    if (v48)
    {
      uint64_t v15 = v48;
    }
    else
    {
      uint64_t v15 = exFATTidemark((uint64_t)&v56, (uint64_t)size, a2, a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))a3, v49);
      a3(v49, 3, &v56);
    }
  }
LABEL_33:
  a3(a4, 4, 0);
  if (v15 != -1)
  {
    if (!v23) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_70:
  uint64_t v15 = *__error();
  if (v23) {
LABEL_35:
  }
    free(v23);
LABEL_36:
  if (v24) {
    free(v24);
  }
  return v15;
}

uint64_t exFATTidemark(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  uint64_t v54 = 0;
  int v60 = 0;
  uint64_t v59 = 0;
  unint64_t v55 = 0;
  unint64_t v56 = 0;
  LOWORD(v6) = 22;
  if (!a1 || !a2) {
    return (__int16)v6;
  }
  unint64_t v61 = 0;
  size_t v12 = *(unsigned int *)(a2 + 12);
  unsigned int v13 = (char *)malloc_type_malloc(v12, 0xA249D01FuLL);
  if (v13)
  {
    LODWORD(v59) = 8 * v12;
    HIDWORD(v59) = v12 >> 3;
    int v60 = 64;
    unint64_t v55 = 0;
    LOWORD(v54) = 1;
    int v14 = *(_DWORD *)(a2 + 16);
    unsigned int v15 = v14 + 1;
    if ((a3 & 3) != 0)
    {
      uint64_t v52 = a6;
      unsigned int v16 = *(unsigned __int16 *)(a2 + 2);
      unsigned int v17 = *(unsigned __int16 *)(a2 + 4);
      int v18 = bmaddr(v15, &v59);
      uint64_t v19 = *(unsigned int *)(a2 + 20);
      int v20 = *(unsigned __int16 *)(a2 + 4);
      uint64_t v21 = *(unsigned __int16 *)(a2 + 2);
      uint64_t v22 = v21 * v19;
      unint64_t v56 = v22;
      int v50 = v18;
      if (v18 < 0)
      {
LABEL_27:
        if (v22)
        {
          unint64_t v34 = v55;
          int v35 = (unsigned __int16)v54;
          if (!(_WORD)v54 && (uint64_t)(*(void *)(a1 + 32) - (v22 + v55)) >= 1)
          {
            uint64_t v22 = *(void *)(a1 + 32) - v55;
            unint64_t v56 = v22;
          }
          if ((((unsigned __int16)v54 + 1) & a3) != 0)
          {
            int v6 = a5(v52, 1, &v54);
            if (v6) {
              goto LABEL_63;
            }
            unint64_t v34 = v55;
            uint64_t v22 = v56;
            int v35 = (unsigned __int16)v54;
          }
          unint64_t v36 = v34 + v22;
          unint64_t v55 = v36;
          if (v35 == 1 && v36 > *(void *)(a1 + 56)) {
            *(void *)(a1 + 56) = v36 - 1;
          }
        }
        if ((a3 & 1) == 0
          || (unint64_t v37 = *(void *)(a1 + 32), v37 <= v55)
          || (LOWORD(v54) = 0, v56 = v37 - v55, (int v6 = a5(v52, 1, &v54)) == 0))
        {
          LOWORD(v6) = 0;
          *(_DWORD *)(a1 + 72) = *(void *)(a1 + 56) / (*(void *)(a1 + 40) - *(void *)(a1 + 48)) - 1;
          goto LABEL_65;
        }
LABEL_63:
        if (v6 != -1) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      uint64_t v51 = a4;
      unint64_t v23 = v17 * (unint64_t)v16;
      unint64_t v24 = (((v14 - 1) * v20) + v19) * v21;
      uint64_t v25 = (unsigned __int16)(v12 >> 9);
      int v26 = 0;
      uint64_t v48 = v25;
      while (1)
      {
        int v27 = MKMediaReadBlocks(v51, ((v26 + *(_DWORD *)(a2 + 28) - 2) * *(unsigned __int16 *)(a2 + 4)+ (unint64_t)*(unsigned int *)(a2 + 20))* *(unsigned __int16 *)(a2 + 2), v25, 0x200u, v13, &v61);
        if (v27) {
          break;
        }
        int v49 = v26;
        int v28 = HIDWORD(v59);
        if (SHIDWORD(v59) >= 1)
        {
          uint64_t v29 = 0;
          int v30 = v60;
          while (v30 < 1)
          {
LABEL_24:
            if ((int)++v29 >= v28) {
              goto LABEL_25;
            }
          }
          int v31 = 0;
          int v32 = (unsigned __int16)v54;
          uint64_t v22 = v56;
          while (1)
          {
            uint64_t v33 = (*(void *)&v13[8 * v29] >> v31) & 1;
            if (v33 != v32)
            {
              if (v22)
              {
                if (((v32 + 1) & a3) != 0)
                {
                  int v27 = a5(v52, 1, &v54);
                  if (v27) {
                    goto LABEL_62;
                  }
                  uint64_t v22 = v56;
                  int v32 = (unsigned __int16)v54;
                }
                v55 += v22;
                unint64_t v56 = 0;
              }
              if (v32 == 1) {
                *(void *)(a1 + 56) = v55 - 1;
              }
              uint64_t v22 = 0;
              LOWORD(v54) = v33;
              int v32 = v33;
            }
            if (v22 + v55 > v24) {
              goto LABEL_27;
            }
            v22 += v23;
            unint64_t v56 = v22;
            int v30 = v60;
            if (++v31 >= v60)
            {
              int v28 = HIDWORD(v59);
              goto LABEL_24;
            }
          }
        }
LABEL_25:
        int v26 = v49 + 1;
        uint64_t v25 = v48;
        if (v49 >= v50)
        {
          uint64_t v22 = v56;
          goto LABEL_27;
        }
      }
    }
    else
    {
      if ((a3 & 0x40000) == 0)
      {
        LOWORD(v6) = 0;
LABEL_66:
        free(v13);
        return (__int16)v6;
      }
      unint64_t v38 = bmaddr(v15, &v59);
      int v40 = v38;
      unint64_t v57 = v38;
      int v58 = v39;
      if ((v38 & 0x80000000) != 0)
      {
LABEL_61:
        LOWORD(v6) = 0;
        *(void *)(a1 + 56) = (*(unsigned __int16 *)(a2 + 4)
                              + *(unsigned __int16 *)(a2 + 4) * alblock(&v57, &v59)
                              + (unint64_t)*(unsigned int *)(a2 + 20))
                             * *(unsigned __int16 *)(a2 + 2)
                             - 1;
        goto LABEL_65;
      }
      uint64_t v41 = v39;
      unint64_t v42 = HIDWORD(v38);
      while (1)
      {
        int v27 = MKMediaReadBlocks(a4, ((v40 + *(_DWORD *)(a2 + 28) - 2) * *(unsigned __int16 *)(a2 + 4)+ (unint64_t)*(unsigned int *)(a2 + 20))* *(unsigned __int16 *)(a2 + 2), (unsigned __int16)(v12 >> 9), 0x200u, v13, &v61);
        if (v27) {
          break;
        }
        if ((v42 & 0x80000000) == 0)
        {
          uint64_t v43 = (v60 - 1);
          uint64_t v44 = v42;
          while (1)
          {
            unint64_t v45 = *(void *)&v13[8 * v44];
            if (v45)
            {
              if ((v41 & 0x80000000) == 0) {
                break;
              }
            }
LABEL_53:
            LODWORD(v41) = v60 - 1;
            BOOL v46 = v44-- <= 0;
            if (v46)
            {
              int v58 = v60 - 1;
              goto LABEL_57;
            }
          }
          while (((v45 >> v41) & 1) == 0)
          {
            BOOL v46 = (int)v41 <= 0;
            LODWORD(v41) = v41 - 1;
            if (v46) {
              goto LABEL_53;
            }
          }
          HIDWORD(v57) = v44;
          int v58 = v41;
          goto LABEL_61;
        }
        uint64_t v43 = v41;
LABEL_57:
        LODWORD(v42) = HIDWORD(v59) - 1;
        LODWORD(v57) = v40 - 1;
        HIDWORD(v57) = HIDWORD(v59) - 1;
        uint64_t v41 = v43;
        BOOL v46 = v40-- <= 0;
        if (v46) {
          goto LABEL_61;
        }
      }
    }
LABEL_62:
    int v6 = v27;
    goto LABEL_63;
  }
LABEL_64:
  int v6 = *__error();
LABEL_65:
  if (v13) {
    goto LABEL_66;
  }
  return (__int16)v6;
}

const char *MKEFATFSIdentity()
{
  return "ExFAT";
}

uint64_t MKDetectEFATFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  *a3 = 0;
  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    *a3 = 500;
    if (*a2 == 235 && a2[1] == 118 && a2[2] == 144)
    {
      *a3 = 1000;
      if (*(void *)(a2 + 3) == 0x2020205441465845)
      {
        *a3 = 5000;
        if (a5) {
          *a5 = 5;
        }
      }
    }
  }
  return 0;
}

CFMutableDictionaryRef MKCFCreateEFATFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  int v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    *int v6 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(v7 + 8) = Mutable;
    int v9 = MKRecordEFATFSRuns(a1, *(_DWORD *)v7, (void (*)(uint64_t, uint64_t, void))MKCFRecordFSInfo, v7);
    if (v9) {
      BOOL v10 = Mutable == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      int v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  return Mutable;
}

uint64_t MKFSDescriptorIdentity(char *a1, _WORD *a2)
{
  unsigned int v3 = (const char *)fsIdentifiers[0];
  if (!fsIdentifiers[0]) {
    goto LABEL_5;
  }
  uint64_t v5 = 1;
  while (1)
  {
    size_t v6 = strlen(v3);
    if (!strncasecmp(a1, v3, v6)) {
      break;
    }
    unsigned int v3 = (const char *)fsIdentifiers[v5++];
    if (!v3) {
      goto LABEL_5;
    }
  }
  switch(v5)
  {
    case 3:
      uint64_t result = MKFATFSDescriptorIdentity(a1);
      break;
    case 2:
      uint64_t result = disposegpmr();
      break;
    case 1:
      uint64_t result = MKHFSDescriptorIdentity(a1);
      break;
    default:
LABEL_5:
      uint64_t result = 0;
      break;
  }
  if (a2) {
    *a2 = result;
  }
  return result;
}

const char *MKFSIdentity(int a1, unsigned int a2)
{
  switch(a1)
  {
    case 1:
      uint64_t result = (const char *)MKHFSIdentity(a2);
      break;
    case 2:
      uint64_t result = MKAPFSIdentity();
      break;
    case 3:
      uint64_t result = (const char *)MKFATFSIdentity(a2);
      break;
    case 4:
      uint64_t result = MKNTFSIdentity();
      break;
    case 5:
      uint64_t result = MKEFATFSIdentity();
      break;
    case 7:
      uint64_t result = MKISOFSIdentity();
      break;
    default:
      uint64_t result = "Unknown Filesystem";
      break;
  }
  return result;
}

CFDictionaryRef FSConvertOptions(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    int v2 = MKCFOptionBit(result, @"Record Runs", 3);
    int v3 = MKCFOptionBit(v1, @"Record On Bits", 2) | v2;
    int v4 = MKCFOptionBit(v1, @"Record Off Bits", 1);
    int v5 = v3 | v4 | MKCFOptionBit(v1, @"Ignore Embedded", 0x10000);
    int v6 = MKCFOptionBit(v1, @"Record Container", 0x20000);
    int v7 = v6 | MKCFOptionBit(v1, @"Record Tidemark", 0x40000);
    return (const __CFDictionary *)(v5 | v7 | MKCFOptionBit(v1, @"Record Markers", 4));
  }
  return result;
}

unint64_t bmaddr(unsigned int a1, _DWORD *a2)
{
  return (a1 / *a2) | ((unint64_t)(a1 % *a2 / a2[2]) << 32);
}

uint64_t alblock(_DWORD *a1, _DWORD *a2)
{
  return (*a2 * *a1 + a2[2] * a1[1] + a1[2]);
}

uint64_t MKRecordFSCopyInstructions(CFArrayRef *__dst, int a2, _WORD *__src)
{
  switch(a2)
  {
    case 3:
      memcpy(__dst, __src, 0x150uLL);
      break;
    case 1:
      if (*__src)
      {
        if (*__src != 1) {
          return 0;
        }
        if (*((_DWORD *)__dst + 93)) {
          int v5 = 7;
        }
        else {
          int v5 = 1;
        }
      }
      else
      {
        int v5 = 2;
      }
      __int16 valuePtr = 0;
      uint64_t v23 = 0;
      CFIndex Count = CFArrayGetCount(__dst[42]);
      if (!Count) {
        goto LABEL_17;
      }
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(__dst[42], Count - 1);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Instruction Code");
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Source Offset");
      CFNumberGetValue(v9, kCFNumberSInt64Type, &v23);
      uint64_t v10 = v23;
      CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Block Count");
      CFNumberGetValue(v11, kCFNumberSInt64Type, &v23);
      if (!*((unsigned char *)__dst + 368)) {
        goto LABEL_17;
      }
      if (v5 == valuePtr && *((void *)__src + 1) == v23 + v10)
      {
        v23 += *((void *)__src + 2);
        CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &v23);
        CFDictionaryReplaceValue(ValueAtIndex, @"Block Count", v12);
      }
      else
      {
LABEL_17:
        CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        __int16 valuePtr = v5;
        CFNumberRef v15 = CFNumberCreate(v13, kCFNumberSInt16Type, &valuePtr);
        CFDictionaryAddValue(Mutable, @"Instruction Code", v15);
        CFRelease(v15);
        if (*((_DWORD *)__dst + 93))
        {
          __int16 valuePtr = *((_DWORD *)__dst + 93);
          CFNumberRef v16 = CFNumberCreate(v13, kCFNumberSInt16Type, &valuePtr);
          CFDictionaryAddValue(Mutable, @"Checksum Type", v16);
          CFRelease(v16);
        }
        uint64_t v23 = *((void *)__src + 2);
        CFNumberRef v17 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, @"Block Count", v17);
        CFRelease(v17);
        uint64_t v23 = *((void *)__src + 1);
        CFNumberRef v18 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, @"Source Offset", v18);
        CFRelease(v18);
        v23 += (uint64_t)__dst[45];
        CFNumberRef v19 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, @"Target Offset", v19);
        CFRelease(v19);
        CFArrayRef v20 = __dst[43];
        if (v20) {
          CFDictionaryAddValue(Mutable, @"Source Device", v20);
        }
        CFArrayRef v21 = __dst[44];
        if (v21) {
          CFDictionaryAddValue(Mutable, @"Target Device", v21);
        }
        CFArrayAppendValue(__dst[42], Mutable);
      }
      break;
    case 0:
      __dst[42] = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      break;
  }
  return 0;
}

CFDictionaryRef MKCFDecomposeFSInfoRecord(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a2) {
    return (const __CFDictionary *)22;
  }
  unsigned int valuePtr = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Filesystem");
  CFStringGetCString(Value, buffer, 32, 0);
  *(_WORD *)a2 = MKFSDescriptorIdentity(buffer, (_WORD *)(a2 + 2));
  CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(a1, @"Volume name");
  if (v5) {
    CFStringGetCString(v5, (char *)(a2 + 76), 256, 0x8000100u);
  }
  CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Volume offset");
  if (v6) {
    CFNumberGetValue(v6, kCFNumberSInt32Type, (void *)(a2 + 4));
  }
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"phi");
  if (v7) {
    CFNumberGetValue(v7, kCFNumberSInt32Type, (void *)(a2 + 8));
  }
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Physical block size");
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    *(_DWORD *)(a2 + 16) = valuePtr >> 9;
  }
  CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Physical size");
  if (v9) {
    CFNumberGetValue(v9, kCFNumberSInt64Type, (void *)(a2 + 24));
  }
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Media size");
  if (v10) {
    CFNumberGetValue(v10, kCFNumberSInt64Type, (void *)(a2 + 32));
  }
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Volume size");
  if (v11) {
    CFNumberGetValue(v11, kCFNumberSInt64Type, (void *)(a2 + 40));
  }
  CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Volume block size");
  if (v12)
  {
    CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
    *(_DWORD *)(a2 + 12) = valuePtr >> 9;
  }
  CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Tidemark");
  if (v13) {
    CFNumberGetValue(v13, kCFNumberSInt64Type, (void *)(a2 + 56));
  }
  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(a1, @"Fragmentation Index");
  if (v14) {
    CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(a2 + 72));
  }
  CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"Attributes");
  if (result)
  {
    CFDictionaryRef v16 = result;
    *(void *)(a2 + 64) |= MKCFOptionBit(result, @"Read only", 1);
    *(void *)(a2 + 64) |= MKCFOptionBit(v16, @"Dirty", 2);
    *(void *)(a2 + 64) |= MKCFOptionBit(v16, @"Journaled", 4);
    unsigned int v17 = MKCFOptionBit(v16, @"Case sensitive", 8);
    CFDictionaryRef result = 0;
    *(void *)(a2 + 64) |= v17;
  }
  return result;
}

uint64_t MKCFRecordFSInfo(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v25 = v4;
  uint64_t v26 = v3;
  uint64_t v27 = v5;
  uint64_t v28 = v6;
  switch(a2)
  {
    case 0:
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      *(void *)(a1 + 16) = Mutable;
      if (Mutable)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), @"Data Runs", Mutable);
        CFNumberRef v10 = *(__CFDictionary **)(a1 + 16);
        goto LABEL_15;
      }
      return *__error();
    case 1:
      if (((*(_DWORD *)a1 >> *(_WORD *)a3) & 1) == 0) {
        return 0;
      }
      CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!v12) {
        return 0xFFFFFFFFLL;
      }
      CFNumberRef v13 = v12;
      CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt16Type, a3);
      if (!v14) {
        return 0xFFFFFFFFLL;
      }
      CFNumberRef v15 = v14;
      CFDictionarySetValue(v13, @"Type", v14);
      CFRelease(v15);
      uint64_t valuePtr = a3[1] + *(void *)(a1 + 24);
      CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      if (!v16) {
        return 0xFFFFFFFFLL;
      }
      CFNumberRef v17 = v16;
      CFDictionarySetValue(v13, @"Origin", v16);
      CFRelease(v17);
      unsigned int v18 = *(unsigned __int16 *)a3;
      if (v18 >= 2)
      {
        if (v18 == 2)
        {
          uint64_t v23 = a3[2];
          if (v23 > 1448037418)
          {
            if (v23 == 1448037419)
            {
              uint64_t v20 = @"Volume Start";
            }
            else
            {
              if (v23 != 1448037421) {
                goto LABEL_32;
              }
              uint64_t v20 = @"Volume End";
            }
          }
          else if (v23 == 1162691115)
          {
            uint64_t v20 = @"Embedded Start";
          }
          else
          {
            if (v23 != 1162691117) {
              goto LABEL_32;
            }
            uint64_t v20 = @"Embedded End";
          }
          CFArrayRef v21 = @"Marker";
          goto LABEL_31;
        }
      }
      else
      {
        CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt64Type, a3 + 2);
        if (v19)
        {
          uint64_t v20 = (__CFString *)v19;
          CFArrayRef v21 = @"Length";
LABEL_31:
          CFDictionarySetValue(v13, v21, v20);
          CFRelease(v20);
        }
      }
LABEL_32:
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), v13);
      goto LABEL_14;
    case 2:
      uint64_t v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!v22) {
        return 0xFFFFFFFFLL;
      }
      CFNumberRef v13 = v22;
      MKCFCreateFSInfoRecord((const char *)a3, v22);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), @"Container", v13);
LABEL_14:
      CFNumberRef v10 = v13;
LABEL_15:
      CFRelease(v10);
      return 0;
    case 3:
      MKCFCreateFSInfoRecord((const char *)a3, *(__CFDictionary **)(a1 + 8));
      return 0;
    default:
      return 0;
  }
}

void MKCFCreateFSInfoRecord(const char *a1, __CFDictionary *a2)
{
  uint64_t v4 = MKFSIdentity(*(unsigned __int16 *)a1, *((unsigned __int16 *)a1 + 1));
  if (v4)
  {
    CFStringRef v5 = CFStringCreateWithCString(0, v4, 0);
    if (!v5) {
      return;
    }
    CFStringRef v6 = v5;
    CFDictionarySetValue(a2, @"Filesystem", v5);
    CFRelease(v6);
  }
  if (a1[76])
  {
    CFStringRef v7 = CFStringCreateWithCString(0, a1 + 76, 0x8000100u);
    if (!v7) {
      return;
    }
    CFStringRef v8 = v7;
    CFDictionarySetValue(a2, @"Volume name", v7);
    CFRelease(v8);
  }
  int valuePtr = *((_DWORD *)a1 + 4) << 9;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    CFDictionarySetValue(a2, @"Physical block size", v9);
    CFRelease(v10);
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 24);
    if (v11)
    {
      CFNumberRef v12 = v11;
      CFDictionarySetValue(a2, @"Physical size", v11);
      CFRelease(v12);
      CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 32);
      if (v13)
      {
        CFNumberRef v14 = v13;
        CFDictionarySetValue(a2, @"Media size", v13);
        CFRelease(v14);
        if (*((_DWORD *)a1 + 1))
        {
          CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 4);
          if (!v15) {
            return;
          }
          CFNumberRef v16 = v15;
          CFDictionarySetValue(a2, @"Volume offset", v15);
          CFRelease(v16);
        }
        if (*((_DWORD *)a1 + 2))
        {
          CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 8);
          if (!v17) {
            return;
          }
          CFNumberRef v18 = v17;
          CFDictionarySetValue(a2, @"phi", v17);
          CFRelease(v18);
        }
        CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 40);
        if (v19)
        {
          CFNumberRef v20 = v19;
          CFDictionarySetValue(a2, @"Volume size", v19);
          CFRelease(v20);
          int valuePtr = *((_DWORD *)a1 + 3) << 9;
          CFNumberRef v21 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          if (v21)
          {
            CFNumberRef v22 = v21;
            CFDictionarySetValue(a2, @"Volume block size", v21);
            CFRelease(v22);
            if (*((void *)a1 + 7))
            {
              CFNumberRef v23 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 56);
              if (!v23) {
                return;
              }
              CFNumberRef v24 = v23;
              CFDictionarySetValue(a2, @"Tidemark", v23);
              CFRelease(v24);
            }
            if (*((int *)a1 + 18) >= 1)
            {
              CFNumberRef v25 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 72);
              if (!v25) {
                return;
              }
              CFNumberRef v26 = v25;
              CFDictionarySetValue(a2, @"Fragmentation Index", v25);
              CFRelease(v26);
            }
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            if (Mutable)
            {
              CFMutableDictionaryRef v28 = Mutable;
              CFDictionarySetValue(a2, @"Attributes", Mutable);
              CFRelease(v28);
              uint64_t v29 = (const void *)*MEMORY[0x263EFFB40];
              int v30 = (const void *)*MEMORY[0x263EFFB38];
              if (*((void *)a1 + 8)) {
                int v31 = (const void *)*MEMORY[0x263EFFB40];
              }
              else {
                int v31 = (const void *)*MEMORY[0x263EFFB38];
              }
              CFDictionarySetValue(v28, @"Read only", v31);
              if ((*((void *)a1 + 8) & 2) != 0) {
                int v32 = v29;
              }
              else {
                int v32 = v30;
              }
              CFDictionarySetValue(v28, @"Dirty", v32);
              if ((*((void *)a1 + 8) & 4) != 0) {
                uint64_t v33 = v29;
              }
              else {
                uint64_t v33 = v30;
              }
              CFDictionarySetValue(v28, @"Journaled", v33);
              if ((*((void *)a1 + 8) & 8) != 0) {
                unint64_t v34 = v29;
              }
              else {
                unint64_t v34 = v30;
              }
              CFDictionarySetValue(v28, @"Case sensitive", v34);
              if ((*((void *)a1 + 8) & 0x10) != 0) {
                int v35 = v29;
              }
              else {
                int v35 = v30;
              }
              CFDictionarySetValue(v28, @"Corrupted", v35);
            }
          }
        }
      }
    }
  }
}

uint64_t MKRecordFSRuns(const void *a1, int a2, unsigned __int16 (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t v10 = 0;
  int v9 = 0;
  uint64_t result = MKFileSystemDetect((uint64_t)a1, (int *)&v10 + 1, (int *)&v10, &v9);
  if (!result)
  {
    switch(v9)
    {
      case 1:
        uint64_t result = MKRecordHFSRuns(a1, a2, a3, a4);
        break;
      case 2:
        uint64_t result = MKRecordAPFSRuns((uint64_t)a1, a2, (uint64_t (*)(void, uint64_t, void *))a3, a4);
        break;
      case 3:
        uint64_t result = MKRecordFATFSRuns((uint64_t)a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))a3, a4);
        break;
      case 4:
        uint64_t result = MKRecordNTFSRuns();
        break;
      case 5:
        uint64_t result = MKRecordEFATFSRuns((uint64_t)a1, a2, (void (*)(uint64_t, uint64_t, void))a3, a4);
        break;
      default:
        uint64_t result = 4294967292;
        break;
    }
  }
  return result;
}

CFMutableDictionaryRef MKCFCreateFSInfo(const void *a1, const __CFDictionary *a2, _DWORD *a3)
{
  CFStringRef v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if (a2)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"Start Offset");
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(v7 + 24));
        if (CFDictionaryGetCount(a2) == 1) {
          a2 = 0;
        }
      }
    }
    *(_DWORD *)uint64_t v7 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(v7 + 8) = Mutable;
    int v10 = MKRecordFSRuns(a1, *(_DWORD *)v7, (unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v10) {
      BOOL v11 = Mutable == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v10 != -1)
      {
LABEL_16:
        *a3 = v10;
        return Mutable;
      }
LABEL_15:
      int v10 = *__error();
      goto LABEL_16;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_15;
    }
  }
  return Mutable;
}

uint64_t pwriteoffline(int a1, char *a2, size_t a3, uint64_t a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  memset(&v48, 0, 512);
  memset(&v41, 0, sizeof(v41));
  uint64_t v40 = 0;
  int v8 = fstatfs(a1, &v48);
  size_t v9 = a3;
  if (v8) {
    goto LABEL_2;
  }
  if ((v48.f_flags & 1) == 0)
  {
    int v8 = 13;
LABEL_6:
    size_t v9 = a3;
    goto LABEL_7;
  }
  int v8 = fstat(a1, &v41);
  size_t v9 = a3;
  if (v8) {
    goto LABEL_2;
  }
  if (!v41.st_size)
  {
    int v8 = -39;
    goto LABEL_6;
  }
  if (a4 + a3 > v41.st_size)
  {
    int v8 = 28;
    goto LABEL_6;
  }
  memset(&v42[1], 0, 32);
  if ((v41.st_size & 0x1FF) != 0) {
    off_t v11 = v41.st_size / 512 + 1;
  }
  else {
    off_t v11 = v41.st_size / 512;
  }
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  uint64_t v45 = 0;
  v42[0] = 512;
  if (!v11) {
    goto LABEL_41;
  }
  off_t v12 = 0;
  uint64_t v38 = 0;
  int v13 = 0;
  int v14 = 0;
  LODWORD(v15) = 0;
  *(void *)BOOL v46 = 0;
  memset(v47, 0, 12);
  while (1)
  {
    int v16 = v15;
    if (lseek(a1, v12, 0) == -1 || fcntl(a1, 49, v46)) {
      break;
    }
    unint64_t v15 = (*(void *)((char *)v47 + 4) + (*(void *)((char *)v47 + 4) < 0 ? 0x1FFuLL : 0)) >> 9;
    if (v16 + 1 != (*(void *)((char *)v47 + 4) / 512))
    {
      if (v14)
      {
        if (HIDWORD(v38) >= 9)
        {
          int v8 = 34;
          goto LABEL_6;
        }
        CFNumberRef v17 = &v42[2 * HIDWORD(v38)];
        v17[3] = v14;
        v17[4] = v13;
        LODWORD(v38) = v38 + v13;
        ++HIDWORD(v38);
        int v14 = v15;
        int v13 = 0;
      }
      else
      {
        int v13 = 0;
        int v14 = *(void *)((char *)v47 + 4) / 512;
      }
    }
    ++v13;
    v12 += 512;
    if (!--v11)
    {
      int v18 = v38;
      int v19 = HIDWORD(v38);
      *(void *)&v42[1] = v38;
      if (!v14) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  int v18 = v38;
  int v19 = HIDWORD(v38);
  *(void *)&v42[1] = v38;
  int v8 = *__error();
  if (v8) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v14 == 0;
  }
  if (!v20)
  {
LABEL_40:
    CFNumberRef v21 = &v42[2 * v19];
    v21[3] = v14;
    v21[4] = v13;
    v42[1] = v18 + v13;
    v42[2] = v19 + 1;
    goto LABEL_41;
  }
  if (v8 == -1) {
    int v8 = *__error();
  }
  size_t v9 = a3;
  if (!v8)
  {
LABEL_41:
    if ((int)MKBSDSlice(v48.f_mntfromname, (uint64_t)&v40 + 4, (uint64_t)&v40, 0) < 2)
    {
      int v8 = 22;
      goto LABEL_6;
    }
    __sprintf_chk(v46, 0, 0x400uLL, "/dev/rdisk%is%i", HIDWORD(v40), v40);
    int v22 = open(v46, 2, 438);
    if (v22 < 0) {
      return -1;
    }
    int v23 = v22;
    if (a3)
    {
      CFNumberRef v24 = 0;
      CFNumberRef v25 = &v42[4];
      size_t v9 = a3;
      while (1)
      {
        while (1)
        {
          uint64_t v26 = a4 + 511;
          if (a4 >= 0) {
            uint64_t v26 = a4;
          }
          uint64_t v27 = v42[2];
          if (!v42[2]) {
            goto LABEL_71;
          }
          int v28 = 0;
          unint64_t v29 = v26 >> 9;
          unint64_t v30 = a4 - (v26 & 0xFFFFFFFFFFFFFE00);
          unint64_t v31 = v9 >> 9;
          int v32 = v25;
          while (1)
          {
            int v33 = *v32;
            if (v29 < (*v32 + v28)) {
              break;
            }
            v32 += 2;
            v28 += v33;
            if (!--v27) {
              goto LABEL_71;
            }
          }
          uint64_t v34 = (*(v32 - 1) + v29 - v28);
          if (!v34)
          {
LABEL_71:
            int v8 = 22;
            goto LABEL_72;
          }
          if (!v30) {
            break;
          }
          uint64_t v39 = v25;
          if (!v24)
          {
            CFNumberRef v24 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x4B593C2CuLL);
            if (!v24) {
              goto LABEL_84;
            }
          }
          off_t v36 = v34 << 9;
          if (pread(v23, v24, 0x200uLL, v34 << 9) != 512) {
            goto LABEL_83;
          }
          size_t v37 = v9 >= (512 - v30) ? (512 - v30) : v9;
          memcpy(&v24[v30], a2, v37);
          if (pwrite(v23, v24, 0x200uLL, v36) != 512) {
            goto LABEL_83;
          }
          a4 += v37;
          a2 += v37;
          v9 -= v37;
          CFNumberRef v25 = v39;
          if (!v9) {
            goto LABEL_81;
          }
        }
        if (v9 < 0x200) {
          break;
        }
        if (v31 >= (v33 - (v29 - v28))) {
          unint64_t v31 = (v33 - (v29 - v28));
        }
        ssize_t v35 = pwrite(v23, v24, v31 << 9, v34 << 9);
        if (v35 < 0)
        {
          int v8 = -1;
          goto LABEL_72;
        }
        a2 += v35;
        a4 += v35;
        v9 -= v35;
        if (!v9)
        {
          int v8 = 0;
LABEL_72:
          if (!v24) {
            goto LABEL_75;
          }
LABEL_73:
          free(v24);
          goto LABEL_75;
        }
      }
      if (v24 || (CFNumberRef v24 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0xF4DA82A6uLL)) != 0)
      {
        if (pread(v23, v24, 0x200uLL, v34 << 9) == 512
          && (memcpy(v24, a2, v9), pwrite(v23, v24, 0x200uLL, v34 << 9) == 512))
        {
LABEL_81:
          size_t v9 = 0;
          int v8 = 0;
        }
        else
        {
LABEL_83:
          int v8 = -1;
        }
        goto LABEL_73;
      }
LABEL_84:
      int v8 = -1;
    }
    else
    {
      size_t v9 = 0;
      int v8 = 0;
    }
LABEL_75:
    close(v23);
  }
LABEL_2:
  if ((v8 - 1) <= 0xFFFFFFFD) {
LABEL_7:
  }
    *__error() = v8;
  if (v8) {
    return -1;
  }
  else {
    return a3 - v9;
  }
}

uint64_t salloc(uint64_t *a1, uint64_t *a2, unsigned int a3, uint64_t (*a4)(uint64_t, void, uint64_t, void, uint64_t), uint64_t a5, int *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  memset(v12, 0, sizeof(v12));
  unsigned __int16 v8 = srequest(a1, a2, a3, 0, (uint64_t)v12, a4, a5);
  unsigned __int16 v9 = v8;
  if ((void)v13 == -1)
  {
    int v10 = -5344;
    if (!a6) {
      return v9;
    }
    goto LABEL_3;
  }
  int v10 = addentry((const void **)a1, v12, 0x60uLL, 0x5Eu, v8, 0x98u);
  if (a6) {
LABEL_3:
  }
    *a6 = v10;
  return v9;
}

uint64_t sfree(const void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (char *)*a1;
  unsigned int v4 = *((unsigned __int16 *)*a1 + 47);
  if (!*((_WORD *)*a1 + 47)) {
    return 22;
  }
  unsigned int v8 = 0;
  unsigned __int16 v9 = v3 + 216;
  uint64_t result = 22;
  do
  {
    if (*(v9 - 1) == a2)
    {
      if (*v9 != a3) {
        return result;
      }
      uint64_t result = delentry(a1, 96, 0x5Eu, (unsigned __int16)v8, 152);
      unsigned int v4 = *((unsigned __int16 *)v3 + 47);
    }
    v9 += 19;
    ++v8;
  }
  while (v8 < v4);
  return result;
}

uint64_t GPTCategorize(int a1)
{
  CFDictionaryRef v1 = &GPTDescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    uint64_t v2 = *((void *)v1 + 13);
    v1 += 28;
    if (!v2)
    {
      CFDictionaryRef v1 = (__int16 *)&unk_264497E08;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t GPTSubReadMBR(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unint64_t v39 = 0;
  uint64_t v8 = *(void *)a1;
  if (*(_WORD *)(*(void *)a1 + 94))
  {
    unsigned int v9 = 0;
    int v10 = (char *)(v8 + 144);
    while (1)
    {
      off_t v11 = MBRInfoSearch(v10);
      if (v11)
      {
        unsigned int v12 = *v11;
        BOOL v13 = v12 > 0xC || ((1 << v12) & 0x1880) == 0;
        if (!v13 || v12 == 131) {
          break;
        }
      }
      unsigned int v14 = v9 + 1;
      if (v9 <= 2)
      {
        v10 += 152;
        ++v9;
        if (v14 < *(unsigned __int16 *)(v8 + 94)) {
          continue;
        }
      }
      goto LABEL_15;
    }
    *(void *)(v8 + 80) |= 2uLL;
    unsigned int v14 = v9;
  }
  else
  {
    unsigned int v14 = 0;
  }
LABEL_15:
  uint64_t v15 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x712DA73CuLL);
  *(void *)(a2 + 8) = v15;
  if (!v15) {
    return 12;
  }
  uint64_t result = MKMediaReadBlocks(a4, 0, 1, 0x200u, v15, &v39);
  if (result) {
    return result;
  }
  uint64_t v17 = *(void *)(a2 + 8);
  if (*(unsigned __int16 *)(v17 + 510) != 43605) {
    return 0;
  }
  unsigned int v18 = 0;
  int v19 = 0;
  int v20 = 0;
  CFNumberRef v21 = (char *)(v17 + 446);
  do
  {
    if (*((_DWORD *)v21 + 3) && (!v18 || *((_DWORD *)v21 + 2)))
    {
      int v22 = v21[4];
      if (v22 == 238)
      {
        ++v19;
        goto LABEL_51;
      }
      int v23 = MBRInfoSearchByType(v22);
      CFNumberRef v24 = v23;
      if (v18 == 3 && v23[1] == 6) {
        *(void *)(v8 + 80) |= 8uLL;
      }
      int v25 = (unsigned __int16)*v23;
      if (*v23)
      {
        if (v25 != 255)
        {
          ++v20;
          unint64_t v26 = *((unsigned int *)v21 + 2);
          unint64_t v39 = *((unsigned int *)v21 + 3);
          int v27 = *(unsigned __int16 *)(v8 + 94);
          if (*(_WORD *)(v8 + 94))
          {
            int v28 = (void *)(v8 + 208);
            while (*v28 != v26)
            {
              v28 += 19;
              if (!--v27) {
                goto LABEL_33;
              }
            }
            unint64_t v30 = v28 - 14;
            goto LABEL_41;
          }
LABEL_33:
          if (v25 == 7 && (v14 == 3 && v18 == 3 || v14 == 2 && v18 == 2))
          {
            GPTuuidType2HumanExtended(v40, *((const char **)v23 + 1), 96, 1, 0);
            int v29 = gpmrtypesearch(a1, (char *)v40, 2);
            unsigned int v14 = v29;
            if (v29 <= 1)
            {
              *(void *)(v8 + 80) |= 4uLL;
              goto LABEL_51;
            }
            if ((a3 & 4) == 0)
            {
              int v32 = (void *)(v8 + 152 * v29);
              unint64_t v30 = v32 + 12;
              unint64_t v33 = v32[8] + v32[7];
              if (v33 <= v26)
              {
                uint64_t v34 = (void *)(v8 + 56);
                if (v29 + 1 < *(unsigned __int16 *)(v8 + 94)) {
                  uint64_t v34 = v30 + 33;
                }
                unint64_t v35 = *v34 - v33;
                unint64_t v36 = v39;
                if (v39 <= v35)
                {
                  uint64_t v37 = v8 + 152 * v29;
                  *(void *)(v37 + 208) = v26;
                  *(void *)(v37 + 216) = v36;
                  *(void *)(v8 + 80) |= 0x10uLL;
                }
              }
LABEL_41:
              uint64_t v31 = v30[17];
              v30[17] = v31 & 0xFFFFFFFFFFFFFF7FLL;
              if (*v21 < 0) {
                v30[17] = v31 | 0x80;
              }
              if (*v24 != 7) {
                __strlcpy_chk();
              }
            }
          }
        }
      }
    }
LABEL_51:
    v21 += 16;
  }
  while (v18++ < 3);
  uint64_t result = 0;
  if (v19)
  {
    if (v20)
    {
      uint64_t result = 0;
      *(void *)(v8 + 80) |= 1uLL;
    }
  }
  return result;
}

__CFArray *GPTCFCreateMapRuns(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(_OWORD *)size_t size = 0u;
  long long v21 = 0u;
  *(_OWORD *)keys = xmmword_264497E40;
  values = 0;
  CFTypeRef cf = 0;
  int v19 = 0;
  uint64_t v17 = 0;
  uint64_t valuePtr = 0;
  MKMediaGetGeometry(a1, (uint64_t)size);
  unint64_t v5 = LODWORD(size[0]);
  CFStringRef v6 = malloc_type_calloc(1uLL, LODWORD(size[0]), 0xABEE5DE3uLL);
  uint64_t v7 = __error();
  if (v6)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    int v10 = GPTReadHeaderBlock(1, size[0], a1, &v19, (uint64_t)v6);
    if (!v10)
    {
      unint64_t v11 = v5 >> 9;
      uint64_t valuePtr = 0;
      values = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
      unint64_t v12 = (v6[21] * v6[20]);
      uint64_t v13 = ((*((_WORD *)v6 + 42) * *((_WORD *)v6 + 40)) & 0x1FF) != 0 ? (v12 >> 9) + 1 : v12 >> 9;
      uint64_t v17 = v13 + *((void *)v6 + 9) * v11;
      CFTypeRef cf = CFNumberCreate(v8, kCFNumberSInt64Type, &v17);
      CFDictionaryRef v14 = CFDictionaryCreate(v8, (const void **)keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFRelease(values);
      CFRelease(cf);
      CFArrayAppendValue(Mutable, v14);
      CFRelease(v14);
      int v10 = GPTReadHeaderBlock(size[1] / v11 - 1, size[0], a1, &v19, (uint64_t)v6);
      if (!v10)
      {
        uint64_t valuePtr = *((void *)v6 + 9) * v11;
        values = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
        uint64_t v17 = v11 + v11 * (*((void *)v6 + 3) - *((void *)v6 + 9));
        CFTypeRef cf = CFNumberCreate(v8, kCFNumberSInt64Type, &v17);
        CFDictionaryRef v15 = CFDictionaryCreate(v8, (const void **)keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFRelease(values);
        CFRelease(cf);
        CFArrayAppendValue(Mutable, v15);
        CFRelease(v15);
      }
    }
    free(v6);
    if (v10 && Mutable)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    int v10 = *v7;
  }
  *a3 = v10;
  return Mutable;
}

uint64_t GPMUpdateVolumeUUID(uint64_t *a1, int a2, unsigned int a3, uint64_t a4)
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t result = 22;
  unsigned int v14 = 22;
  if (a1)
  {
    if ((a2 & 0x80000000) == 0)
    {
      uint64_t v6 = *a1;
      if (a2 <= *(unsigned __int16 *)(v6 + 94))
      {
        v15[0] = 0;
        v15[1] = 0;
        uint64_t v7 = v6 + 152 * (unsigned __int16)a2;
        uint64_t v8 = *(void *)(v7 + 208);
        uint64_t v9 = *(void *)(v7 + 216);
        if (v8 && v9 != 0)
        {
          int v13 = 0;
          uint64_t v12 = 0;
          unint64_t v11 = (const void *)MKMediaCreateWithSubRange(0, a4, v8 * a3, v9 * a3, &v14);
          uint64_t result = v14;
          if (!v14)
          {
            uint64_t result = MKFileSystemDetect((uint64_t)v11, &v13, (int *)&v12 + 1, &v12);
            unsigned int v14 = result;
            if (!result && v12 == 1 && SHIDWORD(v12) >= 2)
            {
              uint64_t result = MKHFSProcessVolumeUUID((uint64_t)v11, 2, (uint64_t)v15);
              unsigned int v14 = result;
            }
          }
          if (v11)
          {
            CFRelease(v11);
            return v14;
          }
        }
      }
    }
  }
  return result;
}

uint64_t MKHFSPlusMapFileBlock(uint64_t a1, int a2, unsigned __int8 a3, unsigned int a4, int *a5, const void *a6)
{
  if (*(_DWORD *)(a1 + 12) <= a4) {
    return 4294967257;
  }
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  do
  {
    unsigned int v9 = *(_DWORD *)(a1 + v7 + 20) + v8;
    if (v9 > a4)
    {
      int v11 = a4 - v8 + *(_DWORD *)(a1 + v7 + 16);
      goto LABEL_13;
    }
    v7 += 8;
    unsigned int v8 = v9;
  }
  while (v7 != 64);
  if (!a6) {
    return 84;
  }
  int v13 = 0;
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  LODWORD(result) = ApplyToHFSPlusExtentRecords(a6, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))FindFileBlock, (uint64_t)v12);
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 22;
  }
  if (result == -128)
  {
    int v11 = v13;
LABEL_13:
    uint64_t result = 0;
    *a5 = v11;
  }
  return result;
}

uint64_t FindFileBlock(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && (v4 = *(_DWORD *)(a3 + 8), unsigned int v5 = *(_DWORD *)(a1 + 8), v6 = v4 >= v5, v7 = v4 - v5, v6))
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    while (1)
    {
      unsigned int v10 = *(_DWORD *)(a2 + v8 + 4) + v9;
      if (v10 > v7) {
        break;
      }
      v8 += 8;
      unsigned int v9 = v10;
      if (v8 == 64) {
        goto LABEL_8;
      }
    }
    *(_DWORD *)(a3 + 12) = v7 - v9 + *(_DWORD *)(a2 + v8);
    uint64_t result = 4294967168;
  }
  else
  {
LABEL_8:
    uint64_t result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t MKHFSDescriptorIdentity(char *a1)
{
  CFDictionaryRef v1 = (const char *)hfsdescriptors[0];
  if (hfsdescriptors[0])
  {
    uint64_t v3 = 0;
    do
    {
      if (!strcasecmp(a1, v1)) {
        break;
      }
      CFDictionaryRef v1 = (const char *)hfsdescriptors[++v3];
    }
    while (v1);
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

uint64_t MKHFSIdentity(unsigned int a1)
{
  if (a1 >= 5) {
    unsigned int v1 = 0;
  }
  else {
    unsigned int v1 = a1;
  }
  return hfsdescriptors[v1];
}

uint64_t MKRecordHFSRuns(const void *a1, int a2, unsigned __int16 (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  memset(v30, 0, sizeof(v30));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  uint64_t Blocks = MKMediaReadBlocks((uint64_t)a1, 2, 1, 0x200u, (char *)v31, 0);
  if (!Blocks)
  {
    double Geometry = MKMediaGetGeometry((uint64_t)a1, (uint64_t)v25);
    LOWORD(v26) = 1;
    LODWORD(v27) = LODWORD(v25[0]) >> 9;
    *((void *)&v27 + 1) = *((void *)&v25[0] + 1);
    *(void *)&long long v28 = *((void *)&v25[0] + 1);
    uint64_t Blocks = ((uint64_t (*)(uint64_t, void, void, double))a3)(a4, 0, 0, Geometry);
    if (!Blocks)
    {
      unsigned int v10 = bswap32(v31[0]) >> 16;
      switch(v10)
      {
        case 0x4244u:
          WORD1(v26) = 1;
          TAO_HFSMasterDirectoryBlock_BigToHost(v31);
          if (v35 >= 0x200)
          {
            unsigned int v19 = v35 >> 9;
            HIDWORD(v26) = v35 >> 9;
            uint64_t Blocks = 22;
            if (v34 < 8u) {
              break;
            }
            unint64_t v20 = v19 * v34;
            if ((unint64_t)v28 < v20) {
              break;
            }
            unint64_t v21 = v36 + v20;
            LODWORD(v22) = v19 * v37;
            uint64_t v22 = v22 >= v20 ? v20 : v22;
            *((void *)&v28 + 1) = v21 + 2;
            *(void *)&long long v29 = v22;
            *((void *)&v29 + 1) = v21 - 1;
            DWORD2(v26) = v36;
            float v23 = (float)*((unint64_t *)&v27 + 1) / (float)(v21 + 2);
            if (v23 > 10000.0 || v23 < 0.0001) {
              break;
            }
            if ((v33 & 0x8080) != 0) {
              *(void *)&v30[0] |= 1uLL;
            }
            if ((v33 & 0x900) != 0x100) {
              *(void *)&v30[0] |= 2uLL;
            }
            if ((a2 & 0x10000) != 0 || v43 != 18475)
            {
              if ((v42 & 0xFFFFFF) == 0x636E65) {
                CFStringEncoding SystemEncoding = HIBYTE(v42);
              }
              else {
                CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
              }
              if (!uniconvert((char *)v30 + 12, 256, 0x8000100u, 0, v38, 27, SystemEncoding, 0)) {
                uniconvert((char *)v30 + 12, 256, 0x8000100u, 0, v38, 27, 0, 0);
              }
              uint64_t Blocks = HFSSuperTidemark((uint64_t)&v26, a2, (uint64_t)v31, a1, a3, a4);
              if (Blocks) {
                break;
              }
              unint64_t v16 = *((void *)&v29 + 1) - v36 + 1;
              unint64_t v17 = v20 - v29;
LABEL_52:
              DWORD2(v30[0]) = v16 / v17;
              uint64_t Blocks = ((uint64_t (*)(uint64_t, uint64_t, long long *))a3)(a4, 3, &v26);
              break;
            }
            uint64_t Blocks = ((uint64_t (*)(uint64_t, uint64_t, long long *))a3)(a4, 2, &v26);
            if (!Blocks)
            {
              WORD1(v26) = 3;
              DWORD1(v26) = v36 + HIDWORD(v26) * v44;
              *(void *)&long long v28 = HIDWORD(v26) * v45;
LABEL_11:
              uint64_t Blocks = MKMediaReadBlocks((uint64_t)a1, (DWORD1(v26) + 2), 1, 0x200u, (char *)v31, 0);
              if (Blocks) {
                break;
              }
              TAO_HFSPlusVolumeHeader_BigToHost(v31);
              if ((v32 & 0x8080) != 0) {
                *(void *)&v30[0] |= 1uLL;
              }
              if ((v32 & 0x900) != 0x100) {
                *(void *)&v30[0] |= 2uLL;
              }
              if ((v32 & 0x2000) != 0) {
                *(void *)&v30[0] |= 4uLL;
              }
              uint64_t Blocks = 22;
              if (v39 < 0x200) {
                break;
              }
              uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v39);
              v12.i16[0] = vaddlv_u8(v12);
              if (v12.i32[0] > 1u) {
                break;
              }
              if (v40 < 8) {
                break;
              }
              unint64_t v13 = (unint64_t)v39 >> 9;
              HIDWORD(v26) = v39 >> 9;
              if (v39 >> 9 > v40) {
                break;
              }
              uint64_t v14 = (v13 << (v39 < 0x400));
              *((void *)&v28 + 1) = v40 * (unint64_t)v13;
              *(void *)&long long v29 = v41 * (unint64_t)v13;
              *((void *)&v29 + 1) = ~v14 + *((void *)&v28 + 1) + DWORD1(v26);
              float v15 = (float)*((unint64_t *)&v27 + 1) / (float)*((unint64_t *)&v28 + 1);
              if (v15 > 10000.0) {
                break;
              }
              if (v15 < 0.0001) {
                break;
              }
              uint64_t Blocks = MKReadHFSParams(a1, (uint64_t)v31, (uint64_t)&v26);
              if (Blocks) {
                break;
              }
              uint64_t Blocks = HFSSuperTidemark((uint64_t)&v26, a2, (uint64_t)v31, a1, a3, a4);
              if (Blocks) {
                break;
              }
              unint64_t v16 = *((void *)&v29 + 1) - DWORD1(v26) + 1;
              unint64_t v17 = *((void *)&v28 + 1) - v29 - v14;
              goto LABEL_52;
            }
          }
          else
          {
            uint64_t Blocks = 22;
          }
          break;
        case 0x482Bu:
          __int16 v11 = 2;
          goto LABEL_10;
        case 0x4858u:
          __int16 v11 = 4;
LABEL_10:
          WORD1(v26) = v11;
          goto LABEL_11;
        default:
          WORD1(v26) = 0;
          uint64_t Blocks = 4294967239;
          break;
      }
      a3(a4, 4, 0);
    }
  }
  return Blocks;
}

uint64_t HFSSuperTidemark(uint64_t a1, int a2, uint64_t a3, const void *a4, unsigned __int16 (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  unsigned int v82 = 0;
  int v78 = 0;
  uint64_t v76 = 0;
  unint64_t v77 = 0;
  uint64_t v74 = 0;
  unint64_t v75 = 0;
  if (a1)
  {
    int v11 = *(_DWORD *)(a1 + 12);
    uint8x8_t v12 = (char *)malloc_type_malloc((v11 << 9), 0x40573006uLL);
    if (v12)
    {
      unint64_t v13 = v12;
      uint64_t v70 = a4;
      int v79 = v11 << 12;
      int v80 = (v11 << 6) & 0x1FFFFFFF;
      int v81 = 64;
      unsigned int v14 = *(unsigned __int16 *)(a1 + 2);
      if (v14 == 1)
      {
        uint64_t v15 = *(unsigned __int16 *)(a3 + 18) - 1;
        uint64_t v71 = a3;
        uint64_t v16 = *(unsigned __int16 *)(a3 + 28);
        uint64_t v17 = v15 + 1;
        unsigned int v18 = *(_DWORD *)(a1 + 12);
        a3 = -1;
      }
      else
      {
        uint64_t v15 = (*(_DWORD *)(a3 + 44) - 1);
        unsigned int v18 = *(_DWORD *)(a1 + 12);
        uint64_t v20 = -2;
        if (v18 > 1) {
          uint64_t v20 = -1;
        }
        uint64_t v16 = *(unsigned int *)(a1 + 4);
        uint64_t v17 = v15 + v20 + 1;
        uint64_t v71 = -1;
      }
      unint64_t v83 = 0;
      BOOL v72 = v13;
      if ((a2 & 3) == 0)
      {
        if ((a2 & 0x40000) == 0)
        {
          LOWORD(v19) = 0;
LABEL_122:
          free(v72);
          return (__int16)v19;
        }
        if (v18 <= 1) {
          int v46 = -2;
        }
        else {
          int v46 = -1;
        }
        if (v14 <= 1) {
          int v47 = 0;
        }
        else {
          int v47 = v46;
        }
        unint64_t v48 = bmaddr((int)v15 + v47, &v79);
        signed int v49 = v48;
        unsigned int v51 = v50;
        unint64_t v77 = v48;
        int v78 = v50;
        if ((v48 & 0x80000000) == 0)
        {
          unint64_t v52 = HIDWORD(v48);
          do
          {
            if (*(unsigned __int16 *)(a1 + 2) < 2u)
            {
              uint64_t v54 = *(unsigned int *)(a1 + 12);
              unint64_t v55 = (v54 * v49) + (unint64_t)*(unsigned __int16 *)(v71 + 14);
              uint64_t v53 = (uint64_t)v70;
            }
            else
            {
              uint64_t v53 = (uint64_t)v70;
              LOWORD(v19) = MKHFSPlusMapFileBlock(a3 + 112, 6, 0, v49, (int *)&v82, v70);
              if ((_WORD)v19) {
                goto LABEL_122;
              }
              uint64_t v54 = *(unsigned int *)(a1 + 12);
              unint64_t v55 = v54 * (unint64_t)v82;
              unint64_t v13 = v72;
            }
            LOWORD(v19) = MKMediaReadBlocks(v53, v55 + *(unsigned int *)(a1 + 4), v54, 0x200u, v13, &v83);
            if ((_WORD)v19) {
              goto LABEL_122;
            }
            if ((v52 & 0x80000000) == 0)
            {
              int v56 = v81 - 1;
              uint64_t v57 = v52;
              unint64_t v13 = v72;
              while (1)
              {
                unint64_t v58 = *(void *)&v72[8 * v57];
                if (v58)
                {
                  unint64_t v59 = bswap64(v58);
                  *(void *)&v72[8 * v57] = v59;
                  if ((v51 & 0x80000000) == 0) {
                    break;
                  }
                }
LABEL_103:
                unsigned int v51 = v56;
                BOOL v44 = v57-- <= 0;
                if (v44)
                {
                  int v78 = v56;
                  unsigned int v51 = v56;
                  goto LABEL_107;
                }
              }
              uint64_t v60 = v51;
              char v61 = v56 - v51;
              while (((v59 >> v61) & 1) == 0)
              {
                ++v61;
                BOOL v44 = v60-- <= 0;
                if (v44) {
                  goto LABEL_103;
                }
              }
              HIDWORD(v77) = v57;
              int v78 = v60;
              break;
            }
            unint64_t v13 = v72;
LABEL_107:
            LODWORD(v52) = v80 - 1;
            LODWORD(v77) = v49 - 1;
            HIDWORD(v77) = v80 - 1;
            BOOL v44 = v49-- <= 0;
          }
          while (!v44);
        }
        int v65 = *(_DWORD *)(a1 + 4);
        LOWORD(v19) = 0;
        unint64_t v64 = v65 + *(_DWORD *)(a1 + 12) + *(_DWORD *)(a1 + 12) * alblock(&v77, &v79) - 1;
LABEL_121:
        *(void *)(a1 + 56) = v64;
        goto LABEL_122;
      }
      int v69 = bmaddr(v15, &v79);
      if (*(_WORD *)(a1 + 2) == 1)
      {
        int v23 = a2;
        if ((a2 & 2) != 0)
        {
          LOWORD(v74) = 1;
          uint64_t v24 = *(unsigned __int16 *)(v71 + 28);
          unint64_t v75 = 0;
          uint64_t v76 = v24;
          LOWORD(v19) = a5(a6, 1, &v74);
          if ((_WORD)v19) {
            goto LABEL_122;
          }
        }
        int v19 = 0;
        unint64_t v25 = *(unsigned __int16 *)(v71 + 28);
      }
      else
      {
        int v19 = 0;
        unint64_t v25 = *(unsigned int *)(a1 + 4);
        int v23 = a2;
        if ((~a2 & 0x20002) == 0 && v25)
        {
          LOWORD(v74) = 1;
          unint64_t v75 = 0;
          uint64_t v76 = v25;
          int v19 = a5(a6, 1, &v74);
          LODWORD(v25) = *(_DWORD *)(a1 + 4);
        }
        unint64_t v25 = v25;
      }
      unint64_t v75 = v25;
      uint64_t v76 = 0;
      if ((v23 & 4) != 0)
      {
        LOWORD(v74) = 2;
        uint64_t v76 = 1448037419;
        int v19 = a5(a6, 1, &v74);
        uint64_t v76 = 0;
      }
      unint64_t v26 = v16 + v17 * v18;
      LODWORD(v77) = 0;
      if (v69 < 0)
      {
        unint64_t v27 = 0;
      }
      else
      {
        unint64_t v27 = 0;
        LODWORD(v21) = 0;
        uint64_t v67 = a3 + 112;
        uint64_t v22 = v72;
        long long v28 = v70;
        while (1)
        {
          int v68 = v21;
          if (*(unsigned __int16 *)(a1 + 2) < 2u)
          {
            uint64_t v29 = *(unsigned int *)(a1 + 12);
            unint64_t v30 = (v29 * v21) + (unint64_t)*(unsigned __int16 *)(v71 + 14);
          }
          else
          {
            int v19 = (unsigned __int16)MKHFSPlusMapFileBlock(v67, 6, 0, v21, (int *)&v82, v28);
            if (v19) {
              break;
            }
            uint64_t v29 = *(unsigned int *)(a1 + 12);
            unint64_t v30 = v29 * (unint64_t)v82;
            uint64_t v22 = v72;
          }
          int v19 = (unsigned __int16)MKMediaReadBlocks((uint64_t)v28, v30 + *(unsigned int *)(a1 + 4), v29, 0x200u, v22, &v83);
          if (v19) {
            break;
          }
          HIDWORD(v77) = 0;
          int v31 = v80;
          if (v80 >= 1)
          {
            uint64_t v32 = 0;
            int v33 = v81;
            uint64_t v22 = v72;
            while (1)
            {
              *(void *)&v22[8 * v32] = bswap64(*(void *)&v22[8 * v32]);
              int v78 = 0;
              if (v33 >= 1) {
                break;
              }
LABEL_48:
              HIDWORD(v77) = ++v32;
              if ((int)v32 >= v31) {
                goto LABEL_51;
              }
            }
            unsigned __int16 v34 = a5;
            uint64_t v35 = a6;
            int v36 = 1;
            char v37 = -1;
            unsigned __int16 v38 = v74;
            while (1)
            {
              uint64_t v39 = (*(void *)&v22[8 * v32] >> (v33 + v37)) & 1;
              if (v38 == v39)
              {
                unint64_t v40 = v75;
                uint64_t v41 = v76;
              }
              else
              {
                uint64_t v42 = v76;
                if (v76)
                {
                  if (((v38 + 1) & a2) != 0)
                  {
                    int v19 = v34(v35, 1, &v74);
                    if (v19) {
                      goto LABEL_54;
                    }
                    uint64_t v42 = v76;
                    unsigned __int16 v38 = v74;
                    uint64_t v22 = v72;
                  }
                  unint64_t v40 = v75 + v42;
                  unint64_t v75 = v40;
                  uint64_t v76 = 0;
                }
                else
                {
                  unint64_t v40 = v75;
                }
                uint64_t v41 = 0;
                if (v38 == 1) {
                  unint64_t v27 = v40;
                }
                LOWORD(v74) = v39;
                unsigned __int16 v38 = v39;
              }
              if (v41 + v40 >= v26) {
                break;
              }
              uint64_t v76 = v41 + *(unsigned int *)(a1 + 12);
              int v78 = v36;
              int v33 = v81;
              --v37;
              BOOL v44 = v36++ < v81;
              if (!v44)
              {
                int v31 = v80;
                a6 = v35;
                a5 = v34;
                int v23 = a2;
                goto LABEL_48;
              }
            }
            int v19 = 0;
LABEL_54:
            a6 = v35;
            a5 = v34;
            int v23 = a2;
            break;
          }
          uint64_t v22 = v72;
LABEL_51:
          LODWORD(v77) = v68 + 1;
          long long v28 = v70;
          uint64_t v21 = (v68 + 1);
          if (v68 >= v69)
          {
            int v19 = 0;
            break;
          }
        }
      }
      if (v76)
      {
        if ((((unsigned __int16)v74 + 1) & v23) != 0) {
          int v19 = ((unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        }
        if (v19) {
          goto LABEL_122;
        }
        unint64_t v43 = v75 + v76;
        unint64_t v75 = v43;
        uint64_t v76 = 0;
        BOOL v44 = v43 <= v26 && v43 > v27;
        if (!v44) {
          unint64_t v43 = v27;
        }
        if ((unsigned __int16)v74 == 1) {
          unint64_t v27 = v43;
        }
        LOWORD(v19) = 0;
      }
      if ((v23 & 4) != 0)
      {
        LOWORD(v74) = 2;
        uint64_t v76 = 1448037421;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        uint64_t v76 = 0;
      }
      unint64_t v45 = *(unsigned int *)(a1 + 4) + *(void *)(a1 + 32) - 2;
      if ((v23 & 1) != 0 && v75 < v45)
      {
        LOWORD(v74) = 0;
        uint64_t v76 = v45 + ~v75;
        if (v76) {
          LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        }
      }
      if ((v23 & 2) != 0 && v75 <= v45)
      {
        LOWORD(v74) = 1;
        unint64_t v75 = v45;
        uint64_t v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      if (v23)
      {
        LOWORD(v74) = 0;
        unint64_t v75 = *(unsigned int *)(a1 + 4) + *(void *)(a1 + 32) - 1;
        uint64_t v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        if ((v23 & 0x20000) == 0) {
          goto LABEL_118;
        }
        uint64_t v62 = *(unsigned int *)(a1 + 4);
        if (!v62) {
          goto LABEL_118;
        }
        LOWORD(v74) = 0;
        uint64_t v63 = *(void *)(a1 + 24);
        unint64_t v75 = *(void *)(a1 + 32) + v62;
        uint64_t v76 = v63 - v75 - 2;
        if (v75 < v63 - 2) {
          LOWORD(v19) = a5(a6, 1, &v74);
        }
      }
      else if ((v23 & 0x20000) == 0 || !*(_DWORD *)(a1 + 4))
      {
LABEL_118:
        unint64_t v64 = v27 - 1;
        goto LABEL_121;
      }
      if ((v23 & 2) != 0)
      {
        LOWORD(v74) = 1;
        unint64_t v75 = *(void *)(a1 + 24) - 2;
        uint64_t v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      if (v23)
      {
        LOWORD(v74) = 0;
        unint64_t v75 = *(void *)(a1 + 24) - 1;
        uint64_t v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      goto LABEL_118;
    }
    LOWORD(v19) = -1;
  }
  else
  {
    LOWORD(v19) = 22;
  }
  return (__int16)v19;
}

uint64_t MKReadHFSParams(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 22;
  if (!a1 || !a2) {
    return v3;
  }
  unsigned int v7 = 2 * *(_DWORD *)(a2 + 40);
  uint64_t v8 = (int8x8_t *)malloc_type_malloc(v7, 0x21233CF9uLL);
  if (!v8) {
    return *__error();
  }
  unsigned int v9 = v8;
  unsigned int v34 = 0;
  uint64_t v10 = a2 + 272;
  unsigned int v11 = *(_DWORD *)(a2 + 40);
  uint64_t Blocks = MKHFSPlusMapFileBlock(a2 + 272, 4, 0, 0, (int *)&v34, a1);
  if (Blocks) {
    goto LABEL_6;
  }
  unsigned int v13 = v11 >> 9;
  uint64_t Blocks = MKMediaReadBlocks((uint64_t)a1, *(_DWORD *)(a3 + 4) + v34 * (v11 >> 9), 1, 0x200u, (char *)v9, 0);
  if (Blocks) {
    goto LABEL_6;
  }
  if (v9[1].i8[0] != 1)
  {
    uint64_t v3 = 4294967246;
    goto LABEL_7;
  }
  int8x8_t v16 = (int8x8_t)TAO_BTHeaderRec_BigToHost((unsigned __int16 *)&v9[1] + 3).u64[0];
  uint64_t Blocks = MKHFSValidate_BTHDR((uint64_t)&v9[1] + 6, v16);
  if (Blocks)
  {
LABEL_6:
    uint64_t v3 = Blocks;
LABEL_7:
    unsigned int v14 = v9;
    goto LABEL_8;
  }
  size_t v17 = v9[4].u16[0];
  unsigned int v14 = v9;
  if (v7 < v17)
  {
    free(v9);
    unsigned int v14 = (int8x8_t *)malloc_type_malloc(v17, 0x6E5270ADuLL);
    if (!v14) {
      return *__error();
    }
  }
  if (v9[6].u8[3] == 188) {
    *(void *)(a3 + 64) |= 8uLL;
  }
  size_t v30 = v17;
  LODWORD(v18) = v17 >> 9;
  unsigned int v19 = (v17 >> 9) / v13;
  unsigned int v33 = v11 >> 9;
  if ((v17 >> 9) % v13) {
    uint64_t v20 = v19 + 1;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v20)
  {
    unsigned int v21 = 0;
    int v22 = 0;
    unsigned int v23 = v9[3].i32[0] * v18;
    int v24 = v23 / v33;
    int v32 = v23 % v33;
    if (v33 >= v18) {
      uint64_t v18 = v18;
    }
    else {
      uint64_t v18 = v33;
    }
    uint64_t v31 = v18;
    unsigned int v25 = v11 & 0xFFFFFE00;
    while (1)
    {
      uint64_t v26 = MKHFSPlusMapFileBlock(v10, 4, 0, v24 + v22, (int *)&v34, a1);
      if (v26) {
        break;
      }
      unsigned int v34 = *(_DWORD *)(a3 + 4) + v32 + v34 * v33;
      uint64_t v26 = MKMediaReadBlocks((uint64_t)a1, v34, v31, 0x200u, (char *)v14 + v21, 0);
      if (v26) {
        break;
      }
      ++v22;
      v21 += v25;
      if (!--v20) {
        goto LABEL_28;
      }
    }
    uint64_t v3 = v26;
  }
  else
  {
LABEL_28:
    TAO_BTNodeDescriptor_BigToHost(v14);
    if (!v14[1].i16[1]) {
      goto LABEL_36;
    }
    unint64_t v27 = bswap32(*(unsigned __int16 *)((char *)&v14->u16[-1] + v17)) >> 16;
    uint64_t v3 = 22;
    if (v27 < 0xE || v30 - 518 < v27) {
      goto LABEL_8;
    }
    long long v28 = (char *)v14 + v27;
    TAO_HFSPlusCatalogKey_BigToHost((unsigned __int16 *)((char *)v14 + v27));
    if (*(_DWORD *)(v28 + 2) != 1)
    {
LABEL_36:
      uint64_t v3 = 4294967246;
      goto LABEL_8;
    }
    unsigned int v29 = *((unsigned __int16 *)v28 + 3);
    if (v29 <= 0xFF)
    {
      uniconvert((void *)(a3 + 76), 256, 0x8000100u, 0, (const UInt8 *)v28 + 8, 2 * v29, 0x100u, 0);
      uint64_t v3 = 0;
    }
  }
LABEL_8:
  free(v14);
  if (v3 == -1) {
    return *__error();
  }
  return v3;
}

CFMutableDictionaryRef MKCFCreateHFSInfo(const void *a1, const __CFDictionary *a2, _DWORD *a3)
{
  BOOL v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    *BOOL v6 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(v7 + 8) = Mutable;
    int v9 = MKRecordHFSRuns(a1, *(_DWORD *)v7, (unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v9) {
      BOOL v10 = Mutable == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      int v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  return Mutable;
}

uint64_t HFSAllocFileIO(const void *a1, unsigned __int16 *a2, char **a3, int a4)
{
  if (!a3) {
    return 22;
  }
  unsigned int v4 = a3;
  uint64_t v5 = (uint64_t)a2;
  int v7 = *a2;
  if (v7 == 18520 || v7 == 18475)
  {
    unsigned int v9 = *((_DWORD *)a2 + 10);
    unsigned int v10 = *((_DWORD *)a2 + 11) >> 3;
    if (v10 % v9) {
      unsigned int v11 = v10 / v9 + 1;
    }
    else {
      unsigned int v11 = v10 / v9;
    }
    unsigned int v12 = v11 * v9;
    unsigned int v13 = a2 + 64;
    uint64_t v14 = (uint64_t)a2;
    uint64_t v5 = -1;
  }
  else
  {
    if (v7 != 16964)
    {
      unint64_t v27 = 0;
      uint64_t v17 = 4294967173;
      goto LABEL_43;
    }
    unsigned int v13 = 0;
    unsigned int v9 = *((_DWORD *)a2 + 5);
    unsigned int v10 = a2[9] >> 3;
    if (v10 % v9) {
      unsigned int v11 = v10 / v9 + 1;
    }
    else {
      unsigned int v11 = v10 / v9;
    }
    unsigned int v12 = v11 * v9;
    uint64_t v14 = -1;
  }
  if (!a4)
  {
    uint64_t v15 = (char *)malloc_type_malloc(v12, 0x617773D5uLL);
    int8x8_t v16 = v15;
    if (!v15)
    {
      unint64_t v27 = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      goto LABEL_44;
    }
    goto LABEL_21;
  }
  if (!*a3) {
    return 22;
  }
  bzero(&(*a3)[v10 + 1], ~(unint64_t)v10 + v12);
  uint64_t v15 = 0;
  int8x8_t v16 = *v4;
LABEL_21:
  unsigned int v29 = v4;
  size_t v30 = v15;
  uint64_t v32 = v5;
  int v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = v9 >> 9;
  unsigned int v35 = 0;
  uint64_t v34 = 0;
  uint64_t v31 = v14 + 112;
  unint64_t v21 = v11;
  while (1)
  {
    if (v19 >= v21)
    {
      uint64_t v17 = 0;
      unsigned int v4 = v29;
      unint64_t v27 = v30;
      goto LABEL_43;
    }
    if (v7 == 16964)
    {
      unint64_t v22 = *(unsigned __int16 *)(v32 + 14) + v19 * v20;
      unint64_t v23 = v21;
      goto LABEL_31;
    }
    uint64_t v24 = MKHFSPlusMapFileBlock(v31, 6, 0, v19, (int *)&v35, a1);
    if (v24) {
      break;
    }
    unint64_t v22 = v35 * (unint64_t)v20;
    if (v13)
    {
      unint64_t v23 = (*((_DWORD *)v13 + 1) * v20);
      if (v18++ <= 6) {
        v13 += 4;
      }
      else {
        unsigned int v13 = 0;
      }
    }
    else
    {
      unint64_t v23 = v20;
    }
LABEL_31:
    if (a4) {
      uint64_t v26 = MKMediaWriteSectors((uint64_t)a1, v22, v23, v16, &v34);
    }
    else {
      uint64_t v26 = MKMediaReadSectors((uint64_t)a1, v22, v23, v16, &v34);
    }
    uint64_t v17 = v26;
    v19 += v23 / v20;
    v16 += 512 * v34;
    if (v26) {
      goto LABEL_40;
    }
  }
  uint64_t v17 = v24;
LABEL_40:
  if (v30) {
    free(v30);
  }
  unint64_t v27 = 0;
  unsigned int v4 = v29;
LABEL_43:
  if (!a4) {
LABEL_44:
  }
    const char *v4 = v27;
  return v17;
}

uint64_t HFSAllocateSpace(const void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (*(void *)a3 == a4) {
    return 0;
  }
  unint64_t v20 = 0;
  uint64_t v4 = HFSAllocFileIO(a1, (unsigned __int16 *)a2, (char **)&v20, 0);
  if (!v4)
  {
    unint64_t v9 = *(unsigned int *)(a2 + 40);
    if (a4 % v9) {
      int v10 = a4 / v9 + 1;
    }
    else {
      int v10 = a4 / v9;
    }
    unsigned int v11 = *(_DWORD *)(a3 + 12);
    unsigned int v12 = *(_DWORD *)(a3 + 16);
    if (*(void *)a3 <= a4)
    {
      int v14 = *(_DWORD *)(a2 + 44);
      if (BitsClear((uint64_t)v20, v12 + v11, v10 - v11))
      {
        *(_DWORD *)(a3 + 20) = v10;
        *(_DWORD *)(a3 + 12) = v10;
        *(void *)a3 = a4;
        uint64_t v15 = v20;
        unsigned int v16 = v12 + v11;
        unsigned int v17 = v10 - v11;
      }
      else
      {
        SetBits(v20, v12, v11, 0);
        unsigned int v18 = ScanForZeros((uint64_t)v20, v14, v10);
        if (v18 == -1) {
          return 28;
        }
        unsigned int v16 = v18;
        *(_DWORD *)(a3 + 16) = v18;
        *(_DWORD *)(a3 + 20) = v10;
        *(_DWORD *)(a3 + 12) = v10;
        *(void *)a3 = a4;
        uint64_t v15 = v20;
        unsigned int v17 = v10;
      }
      SetBits(v15, v16, v17, 1);
      int v13 = *(_DWORD *)(a2 + 48) - (v10 - v11);
    }
    else
    {
      if (!v10) {
        *(_DWORD *)(a3 + 16) = 0;
      }
      *(_DWORD *)(a3 + 20) = v10;
      *(_DWORD *)(a3 + 12) = v10;
      *(void *)a3 = a4;
      SetBits(v20, v12 + v10, v11 - v10, 0);
      int v13 = *(_DWORD *)(a2 + 48) + v11 - v10;
    }
    *(_DWORD *)(a2 + 48) = v13;
    uint64_t v4 = HFSAllocFileIO(a1, (unsigned __int16 *)a2, (char **)&v20, 1);
    free(v20);
  }
  return v4;
}

uint64_t MKHFSValidate_BTHDR(uint64_t a1, int8x8_t a2)
{
  a2.i32[0] = *(unsigned __int16 *)(a1 + 18);
  int v2 = vaddlv_u8((uint8x8_t)vcnt_s8(a2));
  if ((unsigned __int16)(*(_WORD *)(a1 + 18) - 512) <= 0x7E00u)
  {
    BOOL v3 = v2 != 0;
    BOOL v4 = v2 == 1;
  }
  else
  {
    BOOL v3 = 1;
    BOOL v4 = 0;
  }
  if (!v4 && v3) {
    return 22;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 22);
  if (*(_DWORD *)(a1 + 10) >= v5) {
    return 22;
  }
  uint64_t v6 = 22;
  if (*(_DWORD *)(a1 + 14) < v5)
  {
    if (*(_DWORD *)(a1 + 26) <= v5) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v6;
}

unsigned __int16 *TAO_HFSMasterDirectoryBlock_BigToHost(unsigned __int16 *result)
{
  uint64_t v1 = 0;
  *uint64_t result = bswap32(*result) >> 16;
  result[9] = bswap32(result[9]) >> 16;
  result[14] = bswap32(result[14]) >> 16;
  *(_DWORD *)(result + 15) = bswap32(*(_DWORD *)(result + 15));
  result[17] = bswap32(result[17]) >> 16;
  *((_DWORD *)result + 16) = bswap32(*((_DWORD *)result + 16));
  result[34] = bswap32(result[34]) >> 16;
  *(_DWORD *)(result + 39) = bswap32(*(_DWORD *)(result + 39));
  result[41] = bswap32(result[41]) >> 16;
  result[62] = bswap32(result[62]) >> 16;
  result[63] = bswap32(result[63]) >> 16;
  result[64] = bswap32(result[64]) >> 16;
  *(_DWORD *)(result + 65) = bswap32(*(_DWORD *)(result + 65));
  *(int8x8_t *)(result + 1) = vrev32_s8(*(int8x8_t *)(result + 1));
  *(int8x8_t *)(result + 5) = vrev16_s8(*(int8x8_t *)(result + 5));
  *(int8x8_t *)(result + 10) = vrev32_s8(*(int8x8_t *)(result + 10));
  *(int8x8_t *)(result + 35) = vrev32_s8(*(int8x8_t *)(result + 35));
  *(int8x16_t *)(result + 42) = vrev32q_s8(*(int8x16_t *)(result + 42));
  *(int8x16_t *)(result + 50) = vrev32q_s8(*(int8x16_t *)(result + 50));
  *(int8x8_t *)(result + 58) = vrev32_s8(*(int8x8_t *)(result + 58));
  do
  {
    int v2 = &result[v1];
    v2[67] = bswap32(result[v1 + 67]) >> 16;
    v2[68] = bswap32(result[v1 + 68]) >> 16;
    v1 += 2;
  }
  while (v1 != 6);
  uint64_t v3 = 0;
  *(_DWORD *)(result + 73) = bswap32(*(_DWORD *)(result + 73));
  do
  {
    BOOL v4 = &result[v3];
    v4[75] = bswap32(result[v3 + 75]) >> 16;
    v4[76] = bswap32(result[v3 + 76]) >> 16;
    v3 += 2;
  }
  while (v3 != 6);
  return result;
}

unsigned __int16 *TAO_HFSExtentDescriptor_BigToHost(unsigned __int16 *result)
{
  *uint64_t result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  return result;
}

uint64_t TAO_HFSExtentRecord_BigToHost(uint64_t result)
{
  for (uint64_t i = 0; i != 12; i += 4)
  {
    int v2 = (_WORD *)(result + i);
    *int v2 = bswap32(*(unsigned __int16 *)(result + i)) >> 16;
    v2[1] = bswap32(*(unsigned __int16 *)(result + i + 2)) >> 16;
  }
  return result;
}

uint64_t TAO_HFSExtentKey_BigToHost(uint64_t result)
{
  *(_DWORD *)(result + 2) = bswap32(*(_DWORD *)(result + 2));
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(result + 6)) >> 16;
  return result;
}

uint64_t TAO_HFSCatalogKey_BigToHost(uint64_t result)
{
  *(_DWORD *)(result + 2) = bswap32(*(_DWORD *)(result + 2));
  return result;
}

int8x16_t TAO_HFSCatalogFolder_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  a1[2] = bswap32(a1[2]) >> 16;
  *(int8x16_t *)(a1 + 3) = vrev32q_s8(*(int8x16_t *)(a1 + 3));
  _TAO_DInfo_BigToHost((int8x16_t *)(a1 + 11));
  a1[20] = bswap32(a1[20]) >> 16;
  a1[19] = bswap32(a1[19]) >> 16;
  *(_DWORD *)(a1 + 21) = bswap32(*(_DWORD *)(a1 + 21));
  a1[24] = bswap32(a1[24]) >> 16;
  int8x16_t result = vrev32q_s8(*(int8x16_t *)(a1 + 25));
  *(int8x16_t *)(a1 + 25) = result;
  *(_DWORD *)(a1 + 33) = bswap32(*(_DWORD *)(a1 + 33));
  return result;
}

int8x16_t _TAO_DInfo_BigToHost(int8x16_t *a1)
{
  int8x16_t result = vrev16q_s8(*a1);
  *a1 = result;
  return result;
}

unsigned __int16 *_TAO_DXInfo_BigToHost(unsigned __int16 *result)
{
  result[1] = bswap32(result[1]) >> 16;
  *int8x16_t result = bswap32(*result) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  return result;
}

unsigned __int16 *TAO_HFSCatalogFile_BigToHost(unsigned __int16 *result)
{
  uint64_t v1 = 0;
  *int8x16_t result = bswap32(*result) >> 16;
  *((_DWORD *)result + 5) = bswap32(*((_DWORD *)result + 5));
  result[12] = bswap32(result[12]) >> 16;
  result[17] = bswap32(result[17]) >> 16;
  *((_DWORD *)result + 13) = bswap32(*((_DWORD *)result + 13));
  result[33] = bswap32(result[33]) >> 16;
  *((_DWORD *)result + 17) = bswap32(*((_DWORD *)result + 17));
  result[36] = bswap32(result[36]) >> 16;
  *(int8x8_t *)(result + 2) = vrev32_s8(*(int8x8_t *)(result + 2));
  *(int8x8_t *)(result + 6) = vrev16_s8(*(int8x8_t *)(result + 6));
  *(int8x8_t *)(result + 13) = vrev32_s8(*(int8x8_t *)(result + 13));
  *(int8x16_t *)(result + 18) = vrev32q_s8(*(int8x16_t *)(result + 18));
  *((int8x8_t *)result + 7) = vrev16_s8(*(int8x8_t *)(result + 28));
  do
  {
    int v2 = &result[v1];
    v2[37] = bswap32(result[v1 + 37]) >> 16;
    v2[38] = bswap32(result[v1 + 38]) >> 16;
    v1 += 2;
  }
  while (v1 != 6);
  for (uint64_t i = 0; i != 6; i += 2)
  {
    BOOL v4 = &result[i];
    v4[43] = bswap32(result[i + 43]) >> 16;
    v4[44] = bswap32(result[i + 44]) >> 16;
  }
  *(_DWORD *)(result + 49) = bswap32(*(_DWORD *)(result + 49));
  return result;
}

int8x8_t TAO_FInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result = vrev32_s8(*a1);
  int8x8_t v2 = vrev16_s8(a1[1]);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int8x8_t _TAO_FXInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result = vrev16_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i32[1] = bswap32(a1[1].u32[1]);
  return result;
}

int8x8_t TAO_HFSCatalogThread_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 1));
  *(int8x8_t *)(a1 + 1) = result;
  *(_DWORD *)(a1 + 5) = bswap32(*(_DWORD *)(a1 + 5));
  return result;
}

int8x16_t TAO_JournalInfoBlock_BigToHost(uint64_t a1)
{
  uint64_t v1 = 0;
  *(_DWORD *)a1 = bswap32(*(_DWORD *)a1);
  do
  {
    *(int8x16_t *)(a1 + 4 + v1) = vrev32q_s8(*(int8x16_t *)(a1 + 4 + v1));
    v1 += 16;
  }
  while (v1 != 32);
  int8x16_t result = vrev64q_s8(*(int8x16_t *)(a1 + 36));
  *(int8x16_t *)(a1 + 36) = result;
  return result;
}

int8x8_t TAO_HFSPlusExtentKey_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 2));
  *(int8x8_t *)(a1 + 2) = result;
  return result;
}

int8x8_t TAO_HFSPlusBSDInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result = vrev32_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i32[1] = bswap32(a1[1].u32[1]);
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogKey_BigToHost(unsigned __int16 *result)
{
  *int8x8_t result = bswap32(*result) >> 16;
  *(_DWORD *)(result + 1) = bswap32(*(_DWORD *)(result + 1));
  LODWORD(v1) = bswap32(result[3]) >> 16;
  result[3] = v1;
  if (v1 >= 0xFF) {
    uint64_t v1 = 255;
  }
  else {
    uint64_t v1 = v1;
  }
  if (v1)
  {
    int8x8_t v2 = result + 4;
    do
    {
      *int8x8_t v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

_WORD *TAO_HFSUniStr255_BigToHost(_WORD *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = bswap32((unsigned __int16)*result) >> 16;
    *int8x8_t result = v2;
    unint64_t v3 = (a2 - 2) >> 1;
    if (v3 >= v2) {
      LOWORD(v3) = v2;
    }
    if ((_WORD)v3)
    {
      unint64_t v3 = (unsigned __int16)v3;
      BOOL v4 = result + 1;
      do
      {
        _WORD *v4 = bswap32((unsigned __int16)*v4) >> 16;
        ++v4;
        --v3;
      }
      while (v3);
    }
  }
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogKey_HostToBig(unsigned __int16 *result)
{
  *int8x8_t result = bswap32(*result) >> 16;
  *(_DWORD *)(result + 1) = bswap32(*(_DWORD *)(result + 1));
  LODWORD(v1) = result[3];
  result[3] = __rev16(v1);
  if (v1 >= 0xFF) {
    uint64_t v1 = 255;
  }
  else {
    uint64_t v1 = v1;
  }
  if (v1)
  {
    unint64_t v2 = result + 4;
    do
    {
      *unint64_t v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

_WORD *TAO_HFSUniStr255_HostToBig(_WORD *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = (unsigned __int16)*result;
    *int8x8_t result = __rev16(v2);
    unint64_t v3 = (a2 - 2) >> 1;
    if (v3 >= v2) {
      LOWORD(v3) = v2;
    }
    if ((_WORD)v3)
    {
      unint64_t v3 = (unsigned __int16)v3;
      BOOL v4 = result + 1;
      do
      {
        _WORD *v4 = bswap32((unsigned __int16)*v4) >> 16;
        ++v4;
        --v3;
      }
      while (v3);
    }
  }
  return result;
}

int8x8_t TAO_HFSPlusCatalogFolder_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *((_DWORD *)a1 + 9) = bswap32(*((_DWORD *)a1 + 9));
  a1[21] = bswap32(a1[21]) >> 16;
  *((_DWORD *)a1 + 11) = bswap32(*((_DWORD *)a1 + 11));
  _TAO_DInfo_BigToHost((int8x16_t *)a1 + 3);
  a1[33] = bswap32(a1[33]) >> 16;
  a1[32] = bswap32(a1[32]) >> 16;
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  a1[37] = bswap32(a1[37]) >> 16;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 38));
  *(int8x8_t *)(a1 + 38) = result;
  *((_DWORD *)a1 + 21) = bswap32(*((_DWORD *)a1 + 21));
  return result;
}

double TAO_HFSPlusCatalogFile_BigToHost(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *((_DWORD *)a1 + 9) = bswap32(*((_DWORD *)a1 + 9));
  a1[21] = bswap32(a1[21]) >> 16;
  *(int8x8_t *)(a1 + 22) = vrev32_s8(*(int8x8_t *)(a1 + 22));
  *((_DWORD *)a1 + 13) = bswap32(*((_DWORD *)a1 + 13));
  *(int8x16_t *)(a1 + 28) = vrev16q_s8(*(int8x16_t *)(a1 + 28));
  a1[37] = bswap32(a1[37]) >> 16;
  *(int8x8_t *)(a1 + 38) = vrev32_s8(*(int8x8_t *)(a1 + 38));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 44));
  *(void *)&double result = TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 84)).n128_u64[0];
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogThread_BigToHost(unsigned __int16 *result)
{
  *double result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  LODWORD(v1) = bswap32(result[4]) >> 16;
  result[4] = v1;
  if (v1 >= 0xFF) {
    uint64_t v1 = 255;
  }
  else {
    uint64_t v1 = v1;
  }
  if (v1)
  {
    unint64_t v2 = result + 5;
    do
    {
      *unint64_t v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogThread_HostToBig(unsigned __int16 *result)
{
  *double result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  LODWORD(v1) = result[4];
  result[4] = __rev16(v1);
  if (v1 >= 0xFF) {
    uint64_t v1 = 255;
  }
  else {
    uint64_t v1 = v1;
  }
  if (v1)
  {
    unint64_t v2 = result + 5;
    do
    {
      *unint64_t v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

unsigned int *TAO_HFSPlusAttrData_BigToHost(unsigned int *result)
{
  *double result = bswap32(*result);
  result[3] = bswap32(result[3]);
  return result;
}

double TAO_HFSPlusAttrForkData_BigToHost(int8x8_t *a1)
{
  *a1 = vrev32_s8(*a1);
  *(void *)&double result = TAO_HFSPlusForkData_BigToHost((uint64_t)&a1[1]).n128_u64[0];
  return result;
}

__n128 TAO_HFSPlusAttrExtents_BigToHost(int8x8_t *a1)
{
  uint64_t v1 = 0;
  *a1 = vrev32_s8(*a1);
  unint64_t v2 = a1 + 1;
  do
  {
    unint64_t v3 = (float *)&v2[v1];
    float32x4x2_t v5 = vld2q_f32(v3);
    v6.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v5.val[0]);
    v6.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v5.val[1]);
    vst2q_f32(v3, v6);
    v1 += 4;
  }
  while (v1 != 8);
  return (__n128)v5.val[0];
}

void TAO_HFSPlusAttrRecord_BigToHost(unsigned int *a1)
{
  unsigned int v2 = *a1;
  unsigned int v3 = bswap32(*a1);
  switch(v3)
  {
    case 0x30u:
      uint64_t v4 = 0;
      a1[1] = bswap32(a1[1]);
      do
      {
        float32x4x2_t v5 = (float *)&a1[v4 + 2];
        float32x4x2_t v7 = vld2q_f32(v5);
        v8.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v7.val[0]);
        v8.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v7.val[1]);
        vst2q_f32(v5, v8);
        v4 += 8;
      }
      while (v4 != 16);
      unsigned int v2 = 48;
      break;
    case 0x20u:
      unsigned int v6 = bswap32(a1[1]);
      *a1 = 32;
      a1[1] = v6;
      TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 2));
      unsigned int v2 = *a1;
      break;
    case 0x10u:
      a1[3] = bswap32(a1[3]);
      unsigned int v2 = 16;
      break;
  }
  *a1 = bswap32(v2);
}

void TAO_HFSPlusAttrRecord_HostToBig(unsigned int *a1)
{
  unsigned int v2 = *a1;
  if (*a1 == 48)
  {
    uint64_t v3 = 0;
    a1[1] = bswap32(a1[1]);
    do
    {
      uint64_t v4 = (float *)&a1[v3 + 2];
      float32x4x2_t v6 = vld2q_f32(v4);
      v7.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v6.val[0]);
      v7.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v6.val[1]);
      vst2q_f32(v4, v7);
      v3 += 8;
    }
    while (v3 != 16);
    unsigned int v2 = 805306368;
  }
  else if (v2 == 32)
  {
    unsigned int v5 = bswap32(a1[1]);
    *a1 = 0x20000000;
    a1[1] = v5;
    TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 2));
    unsigned int v2 = *a1;
  }
  else if (v2 == 16)
  {
    a1[3] = bswap32(a1[3]);
    unsigned int v2 = 0x10000000;
  }
  *a1 = bswap32(v2);
}

int8x8_t TAO_BTNodeDescriptor_BigToHost(int8x8_t *a1)
{
  int8x8_t result = vrev32_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i16[2] = bswap32(a1[1].u16[2]) >> 16;
  return result;
}

int8x16_t TAO_BTHeaderRec_BigToHost(unsigned __int16 *a1)
{
  uint64_t v1 = 0;
  *a1 = bswap32(*a1) >> 16;
  a1[9] = bswap32(a1[9]) >> 16;
  a1[10] = bswap32(a1[10]) >> 16;
  a1[15] = bswap32(a1[15]) >> 16;
  *((_DWORD *)a1 + 8) = bswap32(*((_DWORD *)a1 + 8));
  *(_DWORD *)(a1 + 19) = bswap32(*(_DWORD *)(a1 + 19));
  *(int8x16_t *)(a1 + 1) = vrev32q_s8(*(int8x16_t *)(a1 + 1));
  *(int8x8_t *)(a1 + 11) = vrev32_s8(*(int8x8_t *)(a1 + 11));
  unsigned int v2 = a1 + 21;
  do
  {
    int8x16_t result = vrev32q_s8(*(int8x16_t *)&v2[v1]);
    *(int8x16_t *)&v2[v1] = result;
    v1 += 8;
  }
  while (v1 != 32);
  return result;
}

size_t readn(int a1, char *a2, size_t a3)
{
  if (a3)
  {
    size_t v6 = a3;
    while (1)
    {
      ssize_t v7 = read(a1, a2, v6);
      if (v7 < 0)
      {
        if (*__error() != 4) {
          return -1;
        }
        ssize_t v7 = 0;
      }
      else if (!v7)
      {
        return a3 - v6;
      }
      a2 += v7;
      v6 -= v7;
      if (!v6) {
        return a3 - v6;
      }
    }
  }
  size_t v6 = 0;
  return a3 - v6;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if (__nbyte)
  {
    size_t v6 = __nbyte;
    do
    {
      ssize_t v7 = write(__fd, __buf, v6);
      if (v7 <= 0)
      {
        if (*__error() != 4) {
          return -1;
        }
        ssize_t v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

_DWORD *TAOpopenl(char *a1, const char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v21 = &a9;
  int v12 = 8;
  do
  {
    int v13 = v21++;
    v12 += 8;
  }
  while (*v13);
  int v14 = (char **)malloc_type_malloc(v12, 0x443D267uLL);
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v22 = (char **)&a9;
    *int v14 = a3;
    uint64_t v16 = 1;
    do
    {
      unsigned int v17 = v22++;
      unsigned int v18 = *v17;
      v14[v16++] = v18;
    }
    while (v18);
    unint64_t v19 = TAOpopenv(a1, a2, v14);
    free(v15);
  }
  else
  {
    unint64_t v19 = 0;
    *__error() = 12;
  }
  return v19;
}

_DWORD *TAOpopenv(char *a1, const char *a2, char *const *a3)
{
  unsigned int v5 = a1;
  uint64_t v17 = *MEMORY[0x263EF8340];
  size_t v6 = strchr(a1, 43);
  if (v6)
  {
    if (socketpair(1, 1, 0, &v15) < 0) {
      return 0;
    }
    unsigned int v5 = "r+";
  }
  else
  {
    int v12 = *(unsigned __int8 *)v5;
    if (v12 != 119 && v12 != 114 || v5[1] || pipe(&v15) < 0) {
      return 0;
    }
  }
  ssize_t v7 = malloc_type_malloc(0x18uLL, 0x10A00408A00E5F2uLL);
  if (!v7)
  {
    close(v15);
    close(v16);
    return v7;
  }
  pid_t v8 = fork();
  if (v8 == -1)
  {
    close(v15);
    close(v16);
    free(v7);
    return 0;
  }
  pid_t v9 = v8;
  if (!v8)
  {
    if (*v5 == 114)
    {
      close(v15);
      if (v16 != 1)
      {
        dup2(v16, 1);
        close(v16);
      }
      if (v6) {
        dup2(1, 0);
      }
    }
    else
    {
      if (v15)
      {
        dup2(v15, 0);
        close(v15);
      }
      close(v16);
    }
    execv(a2, a3);
    int v14 = __error();
    _exit(*v14);
  }
  if (*v5 == 114)
  {
    int v10 = fdopen(v15, v5);
    int v11 = v16;
  }
  else
  {
    int v10 = fdopen(v16, v5);
    int v11 = v15;
  }
  close(v11);
  *(void *)ssize_t v7 = v10;
  v7[2] = v9;
  return v7;
}

uint64_t TAOpclose(void *a1)
{
  unsigned int v2 = *(FILE **)a1;
  pid_t v3 = *((_DWORD *)a1 + 2);
  int v6 = 0;
  fclose(v2);
  do
    pid_t v4 = wait4(v3, &v6, 0, 0);
  while (v4 == -1 && *__error() == 4);
  free(a1);
  if (v4 == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

uint64_t TAOlaccess(const char *a1, int a2)
{
  int v9 = 0;
  pid_t v8 = 0;
  if (TAObuildgrouplist(&v9, &v8)) {
    return 1;
  }
  uid_t v5 = geteuid();
  int v6 = v8;
  uint64_t v7 = TAOlaccess2(a1, a2, v5, v9, (int *)v8);
  free(v6);
  return v7;
}

uint64_t TAObuildgrouplist(int *a1, gid_t **a2)
{
  pid_t v4 = (gid_t *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  if (!v4) {
    return 1;
  }
  uid_t v5 = v4;
  int v6 = getgroups(16, v4);
  if (v6 < 0) {
    return 1;
  }
  int v7 = v6;
  uint64_t result = 0;
  *a1 = v7;
  *a2 = v5;
  return result;
}

uint64_t TAOlaccess2(const char *a1, int a2, int a3, int a4, int *a5)
{
  memset(&v13, 0, sizeof(v13));
  if (lstat(a1, &v13) < 0) {
    return *__error();
  }
  if (v13.st_uid == a3)
  {
    if (((~(v13.st_mode >> 6) | 0xFFFFFFF8) & a2) != 0) {
      return 13;
    }
    else {
      return 0;
    }
  }
  else
  {
    if (a4 < 1)
    {
LABEL_11:
      unsigned int v12 = 0;
    }
    else
    {
      uint64_t v10 = a4;
      while (1)
      {
        int v11 = *a5++;
        if (v11 == v13.st_gid) {
          break;
        }
        if (!--v10) {
          goto LABEL_11;
        }
      }
      if (((~(v13.st_mode >> 3) | 0xFFFFFFF8) & a2) == 0) {
        return 0;
      }
      unsigned int v12 = 13;
    }
    if (((~LOBYTE(v13.st_mode) | 0xFFFFFFF8) & a2) != 0) {
      return 13;
    }
    else {
      return v12;
    }
  }
}

uint64_t TAOsystemv(const char *a1, char *const *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unsigned int v2 = (FILE **)TAOpopenv("r", a1, a2);
  if (fgets(v5, 1024, *v2))
  {
    pid_t v3 = (FILE **)MEMORY[0x263EF8358];
    do
      fputs(v5, *v3);
    while (fgets(v5, 1024, *v2));
  }
  return TAOpclose(v2);
}

uint64_t IONewBuffer(const void ***a1, unsigned int a2)
{
  pid_t v4 = (const void **)malloc_type_malloc(0xA0uLL, 0x10F0040F7EB2C67uLL);
  if (!v4) {
    goto LABEL_10;
  }
  uid_t v5 = v4;
  *((_DWORD *)v4 + 26) = a2;
  size_t v6 = a2;
  int v7 = malloc_type_valloc(a2, 0xD1DF45F9uLL);
  v5[14] = v7;
  if (!v7)
  {
    free(v5);
LABEL_10:
    *a1 = 0;
    return *__error();
  }
  uint64_t v8 = mprotect(v7, a2, 3);
  if (!v8)
  {
    uint64_t v8 = mlock(v5[14], v6);
    if (!v8)
    {
      *a1 = v5;
      return v8;
    }
  }
  int v9 = (void *)v5[14];
  if (v9) {
    free(v9);
  }
  free(v5);
  *a1 = 0;
  if (v8 == -1) {
    return *__error();
  }
  return v8;
}

uint64_t IOJobCopyInfo(pthread_mutex_t *a1, const __CFArray *a2, CFMutableDictionaryRef *a3)
{
  *a3 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v8[0] = Mutable;
  v8[1] = a1;
  pthread_mutex_lock(a1);
  v9.lengtHandle h = CFArrayGetCount(a2);
  v9.location = 0;
  CFArrayApplyFunction(a2, v9, (CFArrayApplierFunction)DictKeyFiller, v8);
  pthread_mutex_unlock(a1);
  *a3 = Mutable;
  return 0;
}

uint64_t iCacheDispose(void *a1)
{
  unsigned int v2 = (void *)a1[2];
  if (v2) {
    free(v2);
  }
  free(a1);
  return 0;
}

void InfoFillerGetStateName(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  unsigned int v5 = *(_DWORD *)(a1 + 168);
  if (v5 >= 6) {
    unsigned int v5 = 6;
  }
  CFStringRef v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], off_264497E50[v5], 0x600u);
  CFDictionaryAddValue(a3, a2, v6);
  CFRelease(v6);
}

void InfoFillerGetCurInstrNum(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, (const void *)(a1 + 172));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTotalBlocks(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  uint64_t valuePtr = *(void *)(a1 + 200);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetProcessed(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  uint64_t valuePtr = *(void *)(a1 + 208);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetStatusCode(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  int valuePtr = *(_DWORD *)(a1 + 532);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTime(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  if (*(_DWORD *)(a1 + 168) >= 2u)
  {
    time_t v7 = *(void *)(a1 + 192);
    if (!v7) {
      time_t v7 = time(0);
    }
    uint64_t v5 = v7 - *(void *)(a1 + 184);
  }
  else
  {
    uint64_t v5 = -1;
  }
  uint64_t valuePtr = v5;
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v8);
  CFRelease(v8);
}

void InfoFillerGetThreadCount(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt16Type, (const void *)(a1 + 248));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBufferCount(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt16Type, (const void *)(a1 + 250));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBufferSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, (const void *)(a1 + 244));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBlockSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  int valuePtr = *(_DWORD *)(a1 + 240);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetPercentThreshold(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt16Type, (const void *)(a1 + 252));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTimeThreshold(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt16Type, (const void *)(a1 + 254));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetChecksum(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 544))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    *(_OWORD *)bytes = 0u;
    long long v22 = 0u;
    unsigned int v6 = *(_DWORD *)(a1 + 552);
    time_t v7 = (uint64_t *)(a1 + 376);
    CFNumberRef v8 = (uint64_t *)(a1 + 376);
    while (1)
    {
      CFNumberRef v8 = (uint64_t *)*v8;
      if (!v8) {
        break;
      }
      if (*((_DWORD *)v8 + 2) == v6)
      {
        CFRange v9 = *(unsigned int **)(a1 + 256);
        if (*v9 > v6)
        {
          int v10 = (unsigned __int16)InstructionTable;
          if (InstructionTable)
          {
            int v11 = LOWORD(v9[12 * v6 + 2]);
            for (uint64_t i = &word_267D27E54; (unsigned __int16)*i != v11; i += 26)
            {
              if (!(_WORD)--v10) {
                return;
              }
            }
            if (*((_DWORD *)i + 9))
            {
              LODWORD(v13) = (unsigned __int16)i[20];
              if (i[20])
              {
                unint64_t v14 = 0;
                char v15 = 0;
                do
                {
                  while (1)
                  {
                    if (StepTable)
                    {
                      int v16 = &off_26B54B070;
                      int v17 = (unsigned __int16)StepTable;
                      while (*((unsigned __int16 *)v16 - 20) != (unsigned __int16)i[v14 + 21])
                      {
                        --v17;
                        v16 += 6;
                        if (!(_WORD)v17) {
                          goto LABEL_20;
                        }
                      }
                      if (*((_WORD *)v16 - 3)) {
                        break;
                      }
                    }
LABEL_20:
                    if (++v14 >= v13)
                    {
                      if (v15) {
                        goto LABEL_26;
                      }
                      return;
                    }
                  }
                  if (((unsigned int (*)(uint64_t, uint64_t))*v16)(v8[2], 4)) {
                    return;
                  }
                  unint64_t v13 = (unsigned __int16)i[20];
                  ++v14;
                  char v15 = 1;
                }
                while (v14 < v13);
LABEL_26:
                while (1)
                {
                  time_t v7 = (uint64_t *)*v7;
                  if (!v7) {
                    break;
                  }
                  if (*((_DWORD *)v7 + 2) == *(_DWORD *)(a1 + 552))
                  {
                    int v18 = *(_DWORD *)v7[2] - 4;
                    if (v18 >= 5)
                    {
                      *(_DWORD *)bytes = bswap32(*(unsigned int *)bytes);
                      CFIndex v19 = 4;
                    }
                    else
                    {
                      CFIndex v19 = qword_21E15F558[v18];
                    }
                    CFDataRef v20 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v19);
                    CFDictionaryAddValue(a3, a2, v20);
                    CFRelease(v20);
                    return;
                  }
                }
              }
            }
          }
        }
        return;
      }
    }
  }
}

void InfoFillerGetSkipSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  uint64_t valuePtr = *(void *)(a1 + 216);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetSkipInstrs(uint64_t a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v18 = 0;
  __int16 valuePtr = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (*(_DWORD *)(a1 + 280))
  {
    unsigned int v6 = *(_DWORD **)(a1 + 288);
    if (*v6)
    {
      unsigned int v7 = 0;
      CFNumberRef v8 = v6 + 2;
      do
      {
        CFRange v9 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        __int16 valuePtr = *v8;
        CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
        CFDictionaryAddValue(v9, @"Instruction Code", v10);
        CFRelease(v10);
        int v11 = (const void *)*((void *)v8 + 1);
        if (v11) {
          CFDictionaryAddValue(v9, @"Source Device", v11);
        }
        unsigned int v12 = (const void *)*((void *)v8 + 2);
        if (v12) {
          CFDictionaryAddValue(v9, @"Target Device", v12);
        }
        uint64_t v18 = *((void *)v8 + 3);
        CFNumberRef v13 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, @"Block Count", v13);
        CFRelease(v13);
        uint64_t v18 = *((void *)v8 + 4);
        CFNumberRef v14 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, @"Source Offset", v14);
        CFRelease(v14);
        uint64_t v18 = *((void *)v8 + 5);
        CFNumberRef v15 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, @"Target Offset", v15);
        CFRelease(v15);
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v9);
        ++v7;
        v8 += 12;
      }
      while (v7 < **(_DWORD **)(a1 + 288));
    }
  }
  CFDictionaryAddValue(a3, @"Skip Instructions", Mutable);
  CFRelease(Mutable);
}

uint64_t IOCV(_DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 *a9, uint64_t a10)
{
  switch(a2)
  {
    case 4:
      if (*(void *)(a10 + 544))
      {
        unsigned int v12 = &ChecksumDescriptors;
        CFNumberRef v13 = &off_26CEFEC70;
        do
        {
          int v15 = *((_DWORD *)v13 + 8);
          v13 += 4;
          int v14 = v15;
        }
        while (v15 != -1 && v14 != *a1);
        if (v14 != -1) {
          unsigned int v12 = (int *)v13;
        }
        (*((void (**)(__int16 *))v12 + 3))(a9);
        return 0;
      }
      return 22;
    case 3:
      int v17 = *a9;
      *a1 = v17;
      if (!*(void *)(a10 + 544))
      {
        uint64_t v18 = &off_26CEFEC70;
        do
        {
          int v20 = *((_DWORD *)v18 + 8);
          v18 += 4;
          int v19 = v20;
        }
        while (v20 != -1 && v19 != v17);
        if (v19 == -1) {
          long long v22 = &ChecksumDescriptors;
        }
        else {
          long long v22 = (int *)v18;
        }
        long long v23 = malloc_type_malloc(*((void *)v22 + 1), 0xA8079641uLL);
        *(void *)(a10 + 544) = v23;
        if (!v23) {
          return 12;
        }
        (*((void (**)(void))v22 + 2))();
      }
      break;
    case 1:
      CFNumberRef v10 = (CC_SHA1_CTX *)*((void *)a9 + 19);
      if (v10)
      {
        int v11 = *((_DWORD *)a9 + 18) * *((_DWORD *)a9 + 22);
        switch(*a1)
        {
          case 2:
            MKBlockChecksum2(v10, *((unsigned __int8 **)a9 + 14), v11);
            break;
          case 3:
            MKImageChecksum(v10, *((unsigned __int8 **)a9 + 14), v11);
            break;
          case 4:
            CC_SHA1_Update(v10, *((const void **)a9 + 14), v11);
            break;
          case 5:
            CC_SHA224_Update((CC_SHA256_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 6:
            CC_SHA256_Update((CC_SHA256_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 7:
            CC_SHA384_Update((CC_SHA512_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 8:
            CC_SHA512_Update((CC_SHA512_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          default:
            MKBlockChecksum(v10, *((unsigned int **)a9 + 14), v11);
            break;
        }
        return 0;
      }
      return 22;
  }
  return 0;
}

uint64_t IOCP()
{
  return 0;
}

_DWORD *ClearFourByteChecksumInitialAction(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *CopyFourByteChecksumFinalAction(_DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t IOSetParams(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(unsigned int **)(a1 + 256);
  if (*v2 <= a2) {
    return 22;
  }
  int v3 = (unsigned __int16)InstructionTable;
  if (!InstructionTable) {
    return 2;
  }
  int v6 = LOWORD(v2[12 * a2 + 2]);
  for (uint64_t i = &word_267D27E54; (unsigned __int16)*i != v6; i += 26)
  {
    if (!(_WORD)--v3) {
      return 2;
    }
  }
  CFRange v9 = (uint64_t *)(a1 + 376);
  while (1)
  {
    CFRange v9 = (uint64_t *)*v9;
    if (!v9) {
      break;
    }
    if (*((_DWORD *)v9 + 2) == a2)
    {
      uint64_t result = 6;
      CFNumberRef v10 = v9;
      if (!*((_DWORD *)i + 9)) {
        return result;
      }
      goto LABEL_16;
    }
  }
  int v16 = 0;
  if (!*((_DWORD *)i + 9)) {
    return 6;
  }
  uint64_t result = BuildiCache((uint64_t)i, &v16);
  CFNumberRef v10 = v16;
  if (!v16) {
    return result;
  }
LABEL_16:
  *((_DWORD *)v10 + 2) = a2;
  unsigned int v11 = (unsigned __int16)i[20];
  if (i[20])
  {
    unint64_t v12 = 0;
    int v13 = (unsigned __int16)StepTable;
    do
    {
      if ((_WORD)v13)
      {
        int v14 = &word_26B54B06A;
        int v15 = v13;
        while (*(v14 - 17) != i[v12 + 21])
        {
          --v15;
          v14 += 24;
          if (!(_WORD)v15) {
            goto LABEL_27;
          }
        }
        if (*v14)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 3))(v10[2], 3);
          if (result) {
            return result;
          }
          int v13 = (unsigned __int16)StepTable;
          unsigned int v11 = (unsigned __int16)i[20];
        }
      }
      else
      {
        int v13 = 0;
      }
LABEL_27:
      ++v12;
    }
    while (v12 < v11);
  }
  if (!v9 && !result)
  {
    stkputbtm(a1 + 368, v10);
    return 0;
  }
  return result;
}

const char *MKISOFSIdentity()
{
  return "ISO9660";
}

const char *ISOCodeSearch(int a1)
{
  if (a1 == 32769) {
    return "ISO SYSTEM AREA";
  }
  int v3 = &off_264497EA0;
  do
  {
    uint64_t result = *v3;
    if (!*v3) {
      break;
    }
    int v4 = *((unsigned __int16 *)v3 - 4);
    v3 += 2;
  }
  while (v4 != a1);
  return result;
}

unsigned __int16 *ISODescriptorSearch(char *a1)
{
  uint64_t result = PMLookupDESC(a1, 0, (unsigned __int16 *)&ISODescriptors);
  if (result) {
    return (unsigned __int16 *)*result;
  }
  return result;
}

uint64_t ISOCategorize(int a1)
{
  uint64_t v1 = &ISODescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    uint64_t v2 = *((void *)v1 + 3);
    v1 += 8;
    if (!v2)
    {
      uint64_t v1 = (__int16 *)&unk_264497EF8;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t ISOSetupNewPartitionList(const void **a1, int a2, unsigned __int16 a3)
{
  if ((a3 & 0x1FF) != 0) {
    return 5;
  }
  int v4 = *a1;
  v4[128] = 2097668;
  *((_WORD *)v4 + 259) = a3;
  *((_WORD *)v4 + 260) = 0x7FFF;
  *((_WORD *)v4 + 1) = a3;
  v4[1] = a2;
  *((_WORD *)v4 + 250) = a3 >> 9;
  return PMGenPartitionType(a1, 32769, 0, 16, 0x800u, 0, 0, 0, 0xFFFFu);
}

uint64_t defaultvd2pmrecord(uint64_t a1, unsigned __int8 *a2)
{
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 554) = *a2;
  return 0;
}

uint64_t VReadISOPartitionsII(const void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void, uint64_t, unsigned char *))
{
  if ((*(_WORD *)(a3 + 4) & 0x1FF) != 0)
  {
    LOWORD(v5) = 5;
    return (__int16)v5;
  }
  CFNumberRef v10 = malloc_type_malloc(0x800uLL, 0x454C6FD9uLL);
  if (!v10) {
    goto LABEL_31;
  }
  unsigned int v11 = v10;
  unint64_t v12 = (char *)malloc_type_calloc(1uLL, 0x430uLL, 0x10800402BBFFE52uLL);
  if (!v12)
  {
    free(v11);
    goto LABEL_31;
  }
  int v13 = v12;
  unsigned __int16 v14 = 0;
  unsigned int v27 = 0x800u / *(_DWORD *)(a3 + 4);
  long long v28 = v12 + 16;
  unsigned int v29 = v12 + 48;
  uint64_t v26 = v12 + 448;
  for (unsigned int i = -1; i < 0x20; ++i)
  {
    int v16 = a5(a4, 2, 2048, i + 17, 1, v11);
    if (v16) {
      break;
    }
    bzero(v13, 0x430uLL);
    if (strncmp(v11 + 1, "CD001", 5uLL)) {
      break;
    }
    *((_WORD *)v13 + 253) = i + 1;
    *((_WORD *)v13 + 252) = -1;
    *((_DWORD *)v13 + 117) = 2;
    unsigned int v17 = *v11;
    if (v17 > 1)
    {
      if (v17 != 2)
      {
        if (v17 == 255) {
          break;
        }
        continue;
      }
    }
    else
    {
      if (!*v11)
      {
        *((void *)v13 + 1) = *(unsigned int *)(v11 + 71);
        *((_WORD *)v13 + 277) = 0;
        long long v22 = (char *)PMCodeSearch(0, 32);
        strncpypad(v29, v22, 0x20uLL, 0);
        strncpypad(v28, v11 + 7, 0x20uLL, 0);
        long long v23 = malloc_type_malloc(0x800uLL, 0xE1A58C47uLL);
        *((void *)v13 + 55) = v23;
        if (!v23)
        {
LABEL_28:
          LOWORD(v24) = -1;
LABEL_29:
          int v5 = (__int16)v24;
          goto LABEL_30;
        }
        memcpy(v23, v11, 0x800uLL);
        goto LABEL_17;
      }
      if (v17 != 1) {
        continue;
      }
      *((_WORD *)*a1 + 259) = *((_WORD *)v11 + 64);
      *((_DWORD *)v13 + 117) = 0;
    }
    unsigned int v18 = (*((_DWORD *)v11 + 20) - 16) * v27;
    *((_DWORD *)v13 + 2) = 16 * v27;
    *((_DWORD *)v13 + 3) = v18;
    *((_WORD *)v13 + 277) = v17;
    *(void *)(v13 + 84) = v18;
    int v19 = (char *)PMCodeSearch(v17, 32);
    strncpypad(v29, v19, 0x20uLL, 0);
    int v20 = (char *)strntrim(v11 + 40, 32);
    strncpypad(v28, v20, 0x20uLL, 0);
    unint64_t v21 = malloc_type_malloc(0x800uLL, 0xABE66CEDuLL);
    *((void *)v13 + 55) = v21;
    if (!v21) {
      goto LABEL_28;
    }
    memcpy(v21, v11, 0x800uLL);
    MEMORY[0x223C20E30](v26);
LABEL_17:
    if (!v14)
    {
      int v24 = ISOSetupNewPartitionList(a1, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 4));
      if (v24) {
        goto LABEL_29;
      }
    }
    LOWORD(v24) = addentry(a1, v13, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
    if ((_WORD)v24) {
      goto LABEL_29;
    }
    ++v14;
  }
  if ((unsigned __int16)v16 | v14) {
    int v5 = v16;
  }
  else {
    int v5 = -5343;
  }
LABEL_30:
  free(v11);
  free(v13);
  if (v5 == -1) {
LABEL_31:
  }
    int v5 = *__error();
  return (__int16)v5;
}

uint64_t ISOWriteMedia(Ptr *a1, int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void, uint64_t, uint64_t, unsigned char *))
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFNumberRef v8 = malloc_type_calloc(1uLL, 0x800uLL, 0x43E38DCAuLL);
    if (v8)
    {
      CFRange v9 = v8;
      SInt8 v10 = HGetState(a1);
      HLock(a1);
      Ptr v11 = *a1;
      if (*((_WORD *)*a1 + 257) != 32 || a2 != 0xFFFF && (a2 & 0x100) != 0)
      {
        LOWORD(v12) = -50;
        goto LABEL_7;
      }
      uint64_t v25 = v9;
      unsigned int v26 = *((unsigned __int16 *)v11 + 259);
      if (*((_WORD *)v11 + 261))
      {
        unsigned int v14 = 0;
        Ptr v15 = v11 + 544;
        uint64_t v16 = 16;
        int v12 = -50;
        while (1)
        {
          int v17 = *((unsigned __int16 *)v15 + 269);
          if ((v17 - 1) < 2) {
            break;
          }
          if (!*((_WORD *)v15 + 269))
          {
            if (v16 != 17)
            {
              LOWORD(v12) = -5323;
              CFRange v9 = v25;
              goto LABEL_7;
            }
            uint64_t v24 = *((void *)v15 + 53);
            *(unsigned char *)uint64_t v24 = 0;
            *(_DWORD *)(v24 + 1) = 808469571;
            *(_WORD *)(v24 + 5) = 305;
            strncpypad((unsigned char *)(v24 + 7), "EL TORITO SPECIFICATION", 0x20uLL, 0);
            *(_DWORD *)(v24 + 71) = *((_DWORD *)v15 - 2);
            goto LABEL_25;
          }
          if (v17 == 255) {
            goto LABEL_30;
          }
          uint64_t v18 = *((void *)v15 + 53);
          if (v18)
          {
            *(unsigned char *)uint64_t v18 = v17;
            *(_DWORD *)(v18 + 1) = 808469571;
            *(_WORD *)(v18 + 5) = 305;
LABEL_25:
            int v12 = a4(a3, 3, v26, v16, 1, *((unsigned char **)v15 + 53));
            if (v12) {
              goto LABEL_30;
            }
            uint64_t v16 = (v16 + 1);
          }
          ++v14;
          v15 += 1072;
          if (v14 >= *((unsigned __int16 *)v11 + 261)) {
            goto LABEL_30;
          }
        }
        uint64_t v19 = *((void *)v15 + 53);
        *(unsigned char *)uint64_t v19 = v17;
        *(_DWORD *)(v19 + 1) = 808469571;
        *(_WORD *)(v19 + 5) = 305;
        strncpypad((unsigned char *)(v19 + 40), v15, 0x20uLL, 32);
        strncpypad((unsigned char *)(v19 + 8), "Mac OS X", 0x20uLL, 32);
        if (*(char *)(v19 + 318) <= 32) {
          strncpypad((unsigned char *)(v19 + 318), "Apple Computer Inc.", 0x20uLL, 32);
        }
        strncpypad((unsigned char *)(v19 + 446), "ei7dkb", 0x80uLL, 32);
        unsigned int v20 = *((_DWORD *)v15 - 1);
        *(_DWORD *)(v19 + 80) = v20;
        *(_DWORD *)(v19 + 84) = bswap32(v20);
        *(void *)(v19 + 120) = 0x100000101000001;
        unsigned int v21 = *((unsigned __int16 *)v11 + 259);
        *(_WORD *)(v19 + 128) = v21;
        *(_WORD *)(v19 + 130) = bswap32(v21) >> 16;
        time_t v27 = time(0);
        long long v22 = localtime(&v27);
        uint64_t tm_gmtoff = v22->tm_gmtoff;
        __sprintf_chk(v28, 0, 0x21uLL, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d00-", v22->tm_year + 1900, v22->tm_mon + 1, v22->tm_mday, v22->tm_hour, v22->tm_min, v22->tm_sec);
        char v29 = ((((unsigned __int128)(tm_gmtoff * (__int128)0x48D159E26AF37C05) >> 64) & 0x8000000000000000) != 0)
            + ((unsigned __int16)((unsigned __int128)(tm_gmtoff * (__int128)0x48D159E26AF37C05) >> 64) >> 8);
        if (!*(_DWORD *)(v19 + 813))
        {
          *(_OWORD *)(v19 + 813) = *(_OWORD *)v28;
          *(unsigned char *)(v19 + 829) = v29;
        }
        *(unsigned char *)(v19 + 846) = v29;
        *(_OWORD *)(v19 + 830) = *(_OWORD *)v28;
        *(unsigned char *)(v19 + 881) = 1;
        goto LABEL_25;
      }
      int v12 = -50;
      uint64_t v16 = 16;
LABEL_30:
      CFRange v9 = v25;
      if (!v12)
      {
        *(_DWORD *)(v25 + 1) = 808469571;
        *(_WORD *)(v25 + 5) = 305;
        *uint64_t v25 = -1;
        LOWORD(v12) = a4(a3, 3, v26, v16, 1, v25);
      }
LABEL_7:
      free(v9);
    }
    else
    {
      SInt8 v10 = 0;
      LOWORD(v12) = -1;
    }
  }
  else
  {
    SInt8 v10 = 0;
    LOWORD(v12) = -109;
  }
  HSetState(a1, v10);
  return (__int16)v12;
}

uint64_t ISOReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void, uint64_t, unsigned char *))
{
  memset(v12, 0, sizeof(v12));
  if (a2 == 0xFFFF) {
    unsigned int v7 = 3584;
  }
  else {
    unsigned int v7 = a2;
  }
  uint64_t result = a4(a3, 15, 2048, 0, 0, v12);
  if (result)
  {
    CFRange v9 = 0;
  }
  else
  {
    CFRange v9 = (const void **)NewHandleClear(528);
    uint64_t result = MemError();
    if (v9)
    {
      Ptr v11 = *v9;
      v11[128] = 33554948;
      *((_WORD *)v11 + 259) = WORD2(v12[0]);
      uint64_t result = VReadISOPartitionsII(v9, v10, (uint64_t)v12, a3, a4);
      if (!result)
      {
        if ((v7 & 0x10) == 0 || (uint64_t result = PMAccountFreespace(v9, 0, v7), !result))
        {
          if ((v7 & 0x80) != 0) {
            uint64_t result = PMRationalise(v9);
          }
          else {
            uint64_t result = 0;
          }
        }
      }
    }
  }
  *a1 = v9;
  return result;
}

uint64_t ISOCFRecordSections(const UInt8 *a1, __CFArray *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  if (!a2) {
    return v2;
  }
  uint64_t v4 = *(void *)a1;
  if (!*(void *)a1) {
    return v2;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return v2;
  }
  unsigned int v7 = Mutable;
  CFDictionarySetValue(Mutable, @"ID", @"MAP");
  int v8 = *(unsigned __int16 *)(v4 + 2) >> 9;
  int v9 = *(_DWORD *)(v4 + 4);
  unsigned int valuePtr = 16 * v8;
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v10) {
    goto LABEL_33;
  }
  CFNumberRef v11 = v10;
  CFDictionarySetValue(v7, @"Offset", v10);
  CFRelease(v11);
  MKCFRecordSectionSize(v7, valuePtr, valuePtr, (v9 * v8), (v9 * v8), *(unsigned __int16 *)(v4 + 518));
  CFMutableArrayRef v12 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (!v12) {
    goto LABEL_33;
  }
  CFMutableArrayRef v13 = v12;
  CFDictionarySetValue(v7, @"Partitions", v12);
  CFRelease(v13);
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v14 = *(void *)a1;
  unsigned int v15 = *(unsigned __int16 *)(*(void *)a1 + 522);
  if (!*(_WORD *)(*(void *)a1 + 522))
  {
LABEL_28:
    mkcfstoreref(v7, a1);
    uint64_t v2 = 0;
    goto LABEL_33;
  }
  uint64_t v16 = 0;
  unsigned int v37 = *(unsigned __int16 *)(v14 + 2) >> 9;
  __int16 v41 = 0;
  while (1)
  {
    uint64_t v17 = v14 + 1072 * v16;
    uint64_t v18 = v17 + 528;
    int v19 = *(unsigned __int16 *)(v17 + 1082);
    unsigned int v20 = &ISODescriptors;
    while ((unsigned __int16)*v20 != v19)
    {
      uint64_t v21 = *((void *)v20 + 3);
      v20 += 8;
      if (!v21)
      {
        unsigned int v20 = (__int16 *)&unk_264497EF8;
        break;
      }
    }
    if (v20[1] != 2) {
      goto LABEL_27;
    }
    long long v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!v22)
    {
      uint64_t v2 = 0xFFFFFFFFLL;
      goto LABEL_33;
    }
    long long v23 = v22;
    uint64_t v24 = CFDictionarySetUUID(v22, @"GUID", (CFUUIDBytes *)(v14 + 1072 * v16 + 976));
    if (v24) {
      break;
    }
    if (*(__int16 *)(v14 + 1072 * v16 + 1034) < 0)
    {
      __int16 v41 = 0;
    }
    else
    {
      unsigned int v25 = *(unsigned __int16 *)(v14 + 1072 * v16 + 1034) + 1;
      __int16 v41 = v25 / v37;
      if (v37 <= v25)
      {
        CFNumberRef v26 = CFNumberCreate(0, kCFNumberSInt16Type, &v41);
        if (v26)
        {
          CFNumberRef v27 = v26;
          CFDictionarySetValue(v23, @"Partition ID", v26);
          CFRelease(v27);
        }
      }
    }
    if (*(unsigned char *)(v18 + 16))
    {
      CFStringRef v28 = CFStringCreateWithCString(0, (const char *)(v18 + 16), 0);
      if (!v28) {
        goto LABEL_29;
      }
      CFStringRef v29 = v28;
      CFDictionarySetValue(v23, @"Name", v28);
      CFRelease(v29);
    }
    CFStringRef v30 = CFStringCreateWithCString(0, (const char *)(v18 + 48), 0);
    if (!v30) {
      goto LABEL_29;
    }
    CFStringRef v31 = v30;
    CFDictionarySetValue(v23, @"Type", v30);
    CFRelease(v31);
    uint64_t v40 = *(_DWORD *)(v18 + 8) * v37;
    uint64_t v39 = *(_DWORD *)(v18 + 12) * v37;
    CFNumberRef v32 = CFNumberCreate(0, kCFNumberSInt64Type, &v40);
    if (!v32
      || (CFNumberRef v33 = v32,
          CFDictionarySetValue(v23, @"Offset", v32),
          CFRelease(v33),
          (CFNumberRef v34 = CFNumberCreate(0, kCFNumberSInt64Type, &v39)) == 0))
    {
LABEL_29:
      uint64_t v2 = 22;
      goto LABEL_32;
    }
    CFNumberRef v35 = v34;
    CFDictionarySetValue(v23, @"Size", v34);
    CFRelease(v35);
    CFArrayAppendValue(v13, v23);
    CFRelease(v23);
    unsigned int v15 = *(unsigned __int16 *)(v14 + 522);
LABEL_27:
    if (++v16 >= (unint64_t)v15) {
      goto LABEL_28;
    }
  }
  uint64_t v2 = v24;
LABEL_32:
  CFRelease(v23);
LABEL_33:
  CFArrayAppendValue(a2, v7);
  CFRelease(v7);
  return v2;
}

uint64_t stksearch(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  unsigned int v3 = -1;
  do
  {
    uint64_t v2 = (void *)*v2;
    ++v3;
    if (v2) {
      BOOL v4 = v2 == a2;
    }
    else {
      BOOL v4 = 1;
    }
  }
  while (!v4);
  if (v2) {
    return v3;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *stklocate(uint64_t a1, int a2)
{
  uint64_t result = *(void **)(a1 + 8);
  int v3 = a2 + 1;
  do
  {
    if (!--v3) {
      break;
    }
    uint64_t result = (void *)*result;
  }
  while (result);
  return result;
}

uint64_t stkputtop(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 16);
    *a2 = *(void *)(result + 8);
    *(void *)(result + 8) = a2;
    if (!v2) {
      *(void *)(result + 16) = a2;
    }
    ++*(_WORD *)(result + 2);
  }
  return result;
}

uint64_t stkenqueue(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    if (!a3)
    {
      int v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = a2;
      *a2 = 0;
      if (!v3) {
        int v3 = (void *)(a1 + 8);
      }
      goto LABEL_12;
    }
    if (a3 == (void *)-1)
    {
      int v3 = (void *)(a1 + 16);
      uint64_t v4 = *(void *)(a1 + 16);
      *a2 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = a2;
      if (!v4) {
        goto LABEL_12;
      }
    }
    else
    {
      *a2 = *a3;
      *a3 = a2;
      if (!*a2)
      {
        int v3 = (void *)(a1 + 16);
LABEL_12:
        void *v3 = a2;
      }
    }
    uint64_t v5 = 0;
    ++*(_WORD *)(a1 + 2);
    return v5;
  }
  return 22;
}

uint64_t stkdequeue(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = 0;
    int v3 = (void *)(a1 + 8);
    do
    {
      uint64_t v4 = v2;
      int v3 = (void *)*v3;
      if (v3) {
        BOOL v5 = v3 == a2;
      }
      else {
        BOOL v5 = 1;
      }
      uint64_t v2 = v3;
    }
    while (!v5);
    if (v3)
    {
      int v6 = (void *)*v3;
      if (v4)
      {
        void *v4 = v6;
        if (!v6) {
          goto LABEL_15;
        }
      }
      else
      {
        *(void *)(a1 + 8) = v6;
        if (!v6)
        {
          uint64_t v4 = 0;
LABEL_15:
          *(void *)(a1 + 16) = v4;
        }
      }
      uint64_t v7 = 0;
      --*(_WORD *)(a1 + 2);
      return v7;
    }
  }
  return 22;
}

uint64_t stkiterate(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = *(void **)(a1 + 8);
  while (v4)
  {
    BOOL v5 = (void *)*v4;
    uint64_t v6 = a3();
    uint64_t v4 = v5;
    if (v6) {
      return v6;
    }
  }
  return 0;
}

uint64_t stkdestroy(uint64_t a1)
{
  if (!a1) {
    return 22;
  }
  uint64_t v1 = *(void **)(a1 + 8);
  if (v1)
  {
    __int16 v2 = *(_WORD *)(a1 + 2);
    do
    {
      uint64_t v1 = (void *)*v1;
      --v2;
    }
    while (v1);
    *(_WORD *)(a1 + 2) = v2;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  return (uint64_t)v1;
}

uint64_t stkinit(void *a1)
{
  if (!a1) {
    return 22;
  }
  uint64_t result = 0;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

double DOSPBR_LtoN(char *__dst, char *__src)
{
  if (__dst != __src) {
    memcpy(__dst, __src, 0x200uLL);
  }
  uint64_t v4 = 0;
  *((_WORD *)__dst + 255) = *((_WORD *)__src + 255);
  do
  {
    double result = *(double *)&__src[v4 + 454];
    *(double *)&__dst[v4 + 454] = result;
    v4 += 16;
  }
  while (v4 != 64);
  return result;
}

uint64_t MBRFSDetect(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, int *a5)
{
  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    int v5 = *a5;
    *a5 += 2500;
    int v6 = *a2;
    if (v6 == 233 || v6 == 235 && a2[2] == 144) {
      *a5 = v5 + 5000;
    }
  }
  return 0;
}

uint64_t MBRSetBootloader(uint64_t a1, uint64_t a2, unint64_t a3, void *__src)
{
  if (!a1) {
    return 22;
  }
  uint64_t result = 22;
  if ((a2 & 0x8000000000000000) == 0 && *(_WORD *)(a1 + 514) == 8)
  {
    if (*(__int16 *)(a1 + 1082) == -32768)
    {
      uint64_t v9 = *(void *)(a1 + 968);
      if (v9 || (CFNumberRef v11 = malloc_type_calloc(1uLL, 0x200uLL, 0xE62774D3uLL), (*(void *)(a1 + 968) = v11) == 0))
      {
        if (446 - a2 >= a3) {
          size_t v10 = a3;
        }
        else {
          size_t v10 = 446 - a2;
        }
        memcpy((void *)(v9 + a2), __src, v10);
        return 0;
      }
      else
      {
        return *__error();
      }
    }
    else
    {
      return 4294961973;
    }
  }
  return result;
}

uint64_t MBRGetBootloader(uint64_t a1, void *a2)
{
  *a2 = 0;
  if (!a1 || *(_WORD *)(a1 + 514) != 8) {
    return 22;
  }
  if (*(__int16 *)(a1 + 1082) != -32768) {
    return 4294961973;
  }
  if (!*(void *)(a1 + 968)) {
    return 0;
  }
  uint64_t v4 = malloc_type_calloc(1uLL, 0x200uLL, 0x5A024F34uLL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  memcpy(v4, *(const void **)(a1 + 968), 0x1BEuLL);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t MBRSetBootloaderFile(uint64_t a1, char *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = open(a2, 0, 0);
  if (v3 < 0) {
    return *__error();
  }
  int v4 = v3;
  ssize_t v5 = read(v3, __src, 0x1BEuLL);
  if (v5 == -1)
  {
    close(v4);
    return *__error();
  }
  uint64_t v6 = MBRSetBootloader(a1, 0, v5, __src);
  close(v4);
  if (v6 == -1) {
    return *__error();
  }
  return v6;
}

uint64_t WriteDOSExtendedChain(unsigned __int16 *a1, __int16 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, size_t))
{
  size_t v14 = a1[1];
  unsigned int v15 = malloc_type_calloc(1uLL, v14, 0x46A3296AuLL);
  if (!v15) {
    return 12;
  }
  uint64_t v16 = v15;
  int v17 = 0;
  unsigned int v38 = -1;
  unsigned int v39 = 0;
  __int16 v40 = -1;
  int v18 = (unsigned __int16)*a2;
  *((_WORD *)v15 + 255) = -21931;
  if ((unsigned __int16)*a2 >= a1[261])
  {
LABEL_25:
    *(_DWORD *)(a3 + 12) = v17 - *(_DWORD *)(a3 + 8);
    __int16 v32 = a7(a6, 3, v14);
    goto LABEL_26;
  }
  unsigned int v34 = a4;
  int v36 = a7;
  uint64_t v37 = a6;
  __int16 v19 = 0;
  uint64_t v20 = (uint64_t)v15 + 446;
  uint64_t v21 = (uint64_t)&a1[536 * v18 + 308];
  uint64_t v35 = a3;
  while (1)
  {
    unsigned int v22 = *(unsigned __int16 *)(v21 + 466);
    if (v22 == 5 || (v22 != 133 ? (BOOL v23 = v22 == 15) : (BOOL v23 = 1), v23))
    {
      uint64_t v24 = *(const void **)(v21 + 352);
      if (v24) {
        memcpy(v16, v24, 0x1BEuLL);
      }
      goto LABEL_23;
    }
    if (v22 >> 12 <= 4) {
      break;
    }
LABEL_23:
    unsigned __int16 v31 = *a2 + 1;
    *a2 = v31;
    v21 += 1072;
    if (a1[261] <= v31)
    {
LABEL_24:
      int v17 = v39;
      a6 = v37;
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)(v21 + 3) & 2) == 0) {
    goto LABEL_24;
  }
  if (v19)
  {
    *(unsigned char *)(v20 + 4) = 5;
    unsigned int v25 = v39;
    unsigned int v26 = v39 + 1;
    *(_DWORD *)(v20 + 8) = v39;
    *(_DWORD *)(v20 + 12) = 1;
    if (v25 >= *(_DWORD *)(v21 - 80))
    {
      *(_DWORD *)(v35 + 12) = v26 - *(_DWORD *)(v35 + 8);
      __int16 v32 = -5323;
      goto LABEL_26;
    }
    int v27 = WriteDOSExtendedChain(a1, a2, v20, v34, a5, v37, a7);
    if (v27)
    {
      __int16 v32 = v27;
      goto LABEL_32;
    }
    int v28 = *(_DWORD *)(v20 + 8);
    unsigned int v29 = *(_DWORD *)(v20 + 12) + v28;
    if (v26 > v29) {
      unsigned int v29 = v26;
    }
    unsigned int v39 = v29;
    *(_DWORD *)(v20 + 8) = v28 - v34;
    a3 = v35;
    goto LABEL_22;
  }
  int v30 = WriteGutz((uint64_t)a1, a2, &v40, v20, (int *)&v39, &v38, v37, a7);
  a5 = (a5 + 1);
  *(_WORD *)(v21 + 418) = a1[250] * a5 - 1;
  if (!v30)
  {
    *(_DWORD *)(v20 + 8) -= *(_DWORD *)(a3 + 8);
LABEL_22:
    a7 = v36;
    Setupdpp((uint64_t)a1, v20);
    ++v19;
    v20 += 16;
    goto LABEL_23;
  }
  __int16 v32 = v30;
  unsigned int v26 = v39;
LABEL_32:
  *(_DWORD *)(v35 + 12) = v26 - *(_DWORD *)(v35 + 8);
LABEL_26:
  free(v16);
  return v32;
}

CFArrayRef MBRCFCreateMapRuns(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = xmmword_264498688;
  int Sectors = MKMediaReadSectors(a1, 0, 1uLL, v18, 0);
  if (!Sectors)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 63;
    while (1)
    {
      if (*(_DWORD *)&v18[v6 + 458])
      {
        int v8 = v18[v6 + 450];
        BOOL v9 = v8 == 5 || v8 == 15;
        if (v9 || v8 == 133)
        {
          CFArrayRef v5 = 0;
          int Sectors = -4;
          goto LABEL_15;
        }
        if (v7 >= *(unsigned int *)&v18[v6 + 454]) {
          unint64_t v7 = *(unsigned int *)&v18[v6 + 454];
        }
      }
      v6 += 16;
      if (v6 == 64)
      {
        unint64_t v12 = v7;
        uint64_t valuePtr = 0;
        CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
        CFTypeRef cf = CFNumberCreate(v10, kCFNumberSInt64Type, &v12);
        CFTypeRef v14 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFRelease(values);
        CFRelease(cf);
        CFArrayRef v5 = CFArrayCreate(v10, &v14, 1, MEMORY[0x263EFFF70]);
        CFRelease(v14);
        int Sectors = 0;
        goto LABEL_15;
      }
    }
  }
  CFArrayRef v5 = 0;
LABEL_15:
  *a3 = Sectors;
  return v5;
}

uint64_t MBRCFSetBootcode(const __CFDictionary *a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (!a1) {
    return 22;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Sections");
  if (!Value) {
    return 22;
  }
  CFDictionaryRef v8 = CFArrayDictionarySearchWithIndexOptions(Value, @"ID", @"MAP", 0, 0);
  BOOL v9 = mkcfrecoverref(v8);
  if (!v9) {
    return 22;
  }
  uint64_t v10 = *(void *)v9;
  return MBRSetBootloader(v10, a2, a3, a4);
}

uint64_t MKBSDCreateDeviceInfo(const char *a1, CFMutableDictionaryRef *a2)
{
  CFMutableDictionaryRef properties = 0;
  *a2 = 0;
  mach_port_t mainPort = 0;
  io_iterator_t existing = 0;
  uint64_t MatchingServices = MEMORY[0x223C20690](*MEMORY[0x263EF87F0], &mainPort);
  if (!MatchingServices)
  {
    CFDictionaryRef v6 = IOBSDNameMatching(mainPort, 0, a1);
    if (v6)
    {
      uint64_t MatchingServices = IOServiceGetMatchingServices(mainPort, v6, &existing);
      if (!MatchingServices)
      {
        uint64_t v7 = IOIteratorNext(existing);
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t MatchingServices = IORegistryEntryCreateCFProperties(v7, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          if (!MatchingServices)
          {
            *a2 = CFDictionaryCreateMutableCopy(0, 0, properties);
            CFRelease(properties);
            CFMutableDictionaryRef properties = 0;
            if (*a2)
            {
              CFDictionaryRemoveValue(*a2, @"Content Hint");
              uint64_t MatchingServices = AppendDeviceInfo(v8, *a2);
              IOObjectRelease(v8);
              if (MatchingServices)
              {
                CFRelease(*a2);
                *a2 = 0;
              }
            }
            else
            {
              uint64_t MatchingServices = 0;
            }
          }
        }
        else
        {
          uint64_t MatchingServices = 2;
        }
        IOObjectRelease(existing);
      }
    }
    else
    {
      return 2;
    }
  }
  return MatchingServices;
}

uint64_t AppendDeviceInfo(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 2;
  }
  uint64_t v3 = a1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v5 = (const __CFString *)IORegistryEntrySearchCFProperty(a1, "IOService", @"Physical Interconnect", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
  if (!v5)
  {
    CFDictionaryAddValue(a2, @"Device Type", @"Number 47 Bus");
    goto LABEL_30;
  }
  CFDictionaryAddValue(a2, @"Device Type", v5);
  CFTypeRef v6 = IORegistryEntrySearchCFProperty(v3, "IOService", @"Physical Interconnect Location", v4, 3u);
  if (v6)
  {
    uint64_t v7 = v6;
    CFDictionaryAddValue(a2, @"Physical Interconnect Location", v6);
    CFRelease(v7);
  }
  if (CFStringCompare(v5, @"Virtual Interface", 1uLL) == kCFCompareEqualTo) {
    goto LABEL_30;
  }
  if (CFStringCompare(v5, @"SCSI", 1uLL) == kCFCompareEqualTo)
  {
    CFTypeRef v14 = IORegistryEntrySearchCFProperty(v3, "IOService", @"IOUnit", v4, 3u);
    if (!v14) {
      goto LABEL_30;
    }
    CFNumberRef v11 = v14;
    unint64_t v12 = @"Device ID";
    goto LABEL_18;
  }
  if (CFStringCompare(v5, @"ATA", 1uLL) == kCFCompareEqualTo)
  {
    CFTypeRef v16 = IORegistryEntrySearchCFProperty(v3, "IOService", @"unit number", v4, 3u);
    if (!v16)
    {
      CFTypeRef v16 = IORegistryEntrySearchCFProperty(v3, "IOService", @"IOUnit", v4, 3u);
      if (!v16) {
        goto LABEL_30;
      }
    }
    CFDictionaryAddValue(a2, @"Device ID", v16);
    CFRelease(v16);
    CFDataRef v17 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IOService", @"AAPL,bus-id", v4, 3u);
    if (!v17) {
      goto LABEL_30;
    }
    CFDataRef v18 = v17;
    BytePtr = CFDataGetBytePtr(v17);
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt32Type, BytePtr);
    CFRelease(v18);
    if (!v20) {
      goto LABEL_30;
    }
LABEL_28:
    CFDictionaryAddValue(a2, @"Device Bus", v20);
    CFNumberRef v15 = v20;
    goto LABEL_29;
  }
  if (CFStringCompare(v5, @"ATAPI", 1uLL) == kCFCompareEqualTo)
  {
    CFTypeRef v21 = IORegistryEntrySearchCFProperty(v3, "IOService", @"unit number", v4, 3u);
    if (!v21)
    {
      CFTypeRef v21 = IORegistryEntrySearchCFProperty(v3, "IOService", @"IOUnit", v4, 3u);
      if (!v21) {
        goto LABEL_30;
      }
    }
    CFDictionaryAddValue(a2, @"Device ID", v21);
    CFRelease(v21);
    CFDataRef v22 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IOService", @"AAPL,bus-id", v4, 3u);
    if (!v22) {
      goto LABEL_30;
    }
    CFDataRef v23 = v22;
    uint64_t v24 = CFDataGetBytePtr(v22);
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt32Type, v24);
    CFRelease(v23);
    goto LABEL_28;
  }
  if (CFStringCompare(v5, @"FIREWIRE", 1uLL))
  {
    if (CFStringCompare(v5, @"USB", 1uLL) == kCFCompareEqualTo)
    {
      CFTypeRef v8 = IORegistryEntrySearchCFProperty(v3, "IOService", @"USB Address", v4, 3u);
      if (v8)
      {
        BOOL v9 = v8;
        CFDictionaryAddValue(a2, @"Device ID", v8);
        CFRelease(v9);
        CFTypeRef v10 = IORegistryEntrySearchCFProperty(v3, "IOService", @"busNumber", v4, 3u);
        if (v10)
        {
          CFNumberRef v11 = v10;
          unint64_t v12 = @"Device Bus";
LABEL_18:
          CFDictionaryAddValue(a2, v12, v11);
          CFNumberRef v15 = (CFNumberRef)v11;
LABEL_29:
          CFRelease(v15);
        }
      }
    }
  }
  else
  {
    CFTypeRef v33 = IORegistryEntrySearchCFProperty(v3, "IOService", @"IOUnit", v4, 3u);
    if (v33)
    {
      unsigned int v34 = v33;
      CFDictionaryAddValue(a2, @"Device ID", v33);
      CFRelease(v34);
      CFTypeRef v35 = IORegistryEntrySearchCFProperty(v3, "IOService", @"FireWire Node ID", v4, 3u);
      if (v35)
      {
        int v36 = v35;
        CFDictionaryAddValue(a2, @"Device Node ID", v35);
        CFRelease(v36);
        CFTypeRef v37 = IORegistryEntrySearchCFProperty(v3, "IOService", @"GUID", v4, 3u);
        if (v37)
        {
          CFNumberRef v11 = v37;
          unint64_t v12 = @"Device Absolute ID";
          goto LABEL_18;
        }
      }
    }
  }
LABEL_30:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  *(_OWORD *)unsigned int v39 = 0u;
  long long v40 = 0u;
  io_registry_entry_t parent = 0;
  uint64_t v13 = MEMORY[0x223C20710](v3, "IOService", v39);
  if (v13) {
    goto LABEL_40;
  }
  unsigned int v25 = index(v39, 58);
  CFStringRef v26 = CFStringCreateWithCString(0, v25 + 1, 0x600u);
  if (v26)
  {
    CFStringRef v27 = v26;
    CFDictionaryAddValue(a2, @"IOS Path", v26);
    CFRelease(v27);
  }
  if (IORegistryEntryInPlane(v3, "IODeviceTree"))
  {
LABEL_36:
    uint64_t v13 = MEMORY[0x223C20710](v3, "IODeviceTree", v39);
    if (!v13)
    {
      unsigned int v29 = index(v39, 58);
      CFStringRef v30 = CFStringCreateWithCString(0, v29 + 1, 0x600u);
      if (v30)
      {
        CFStringRef v31 = v30;
        CFDictionaryAddValue(a2, @"OF Path", v30);
        CFRelease(v31);
      }
      uint64_t v13 = 0;
    }
LABEL_40:
    if (!v5) {
      return v13;
    }
LABEL_41:
    CFRelease(v5);
    return v13;
  }
  while (1)
  {
    uint64_t ParentEntry = IORegistryEntryGetParentEntry(v3, "IOService", &parent);
    if (ParentEntry) {
      break;
    }
    uint64_t v3 = parent;
    if (IORegistryEntryInPlane(parent, "IODeviceTree")) {
      goto LABEL_36;
    }
  }
  uint64_t v13 = ParentEntry;
  if (v5) {
    goto LABEL_41;
  }
  return v13;
}

uint64_t MKBSDCFCreateDeviceInfo(const __CFString *a1, CFMutableDictionaryRef *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  CFStringGetCString(a1, buffer, 32, 0x600u);
  return MKBSDCreateDeviceInfo(buffer, a2);
}

uint64_t MKMediaListCreate(CFMutableArrayRef *a1, char a2)
{
  *(void *)io_iterator_t existing = 0;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  *a1 = Mutable;
  if (!Mutable) {
    return 12;
  }
  uint64_t result = MEMORY[0x223C20690](*MEMORY[0x263EF87F0], existing);
  if (result) {
    return result;
  }
  CFTypeRef v6 = IOServiceMatching("IOMedia");
  if (!v6) {
    return 12;
  }
  CFDictionaryRef v7 = v6;
  if (a2) {
    CFDictionaryAddValue(v6, @"Whole", (const void *)*MEMORY[0x263EFFB40]);
  }
  uint64_t result = IOServiceGetMatchingServices(existing[0], v7, &existing[1]);
  if (!result)
  {
    io_object_t v8 = IOIteratorNext(existing[1]);
    if (v8)
    {
      io_registry_entry_t v9 = v8;
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      do
      {
        CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v9, @"BSD Name", v10, 0);
        if (CFProperty)
        {
          CFStringRef v12 = CFProperty;
          if ((a2 & 2) != 0)
          {
            uint64_t v13 = CFStringCreateMutable(0, 0);
            CFStringAppendCString(v13, "/dev/", 0x600u);
            CFStringAppend(v13, v12);
            CFRelease(v12);
            CFStringRef v12 = v13;
          }
          CFArrayAppendValue(*a1, v12);
          CFRelease(v12);
        }
        IOObjectRelease(v9);
        io_registry_entry_t v9 = IOIteratorNext(existing[1]);
      }
      while (v9);
    }
    uint64_t result = existing[1];
    if (existing[1])
    {
      IOObjectRelease(existing[1]);
      return 0;
    }
  }
  return result;
}

uint64_t PMIndex2Slice(uint64_t a1, int a2)
{
  return pmindex2slice(a1, a1 + 1072 * a2 + 528);
}

uint64_t MKFetchMediaSetup(const void *a1, CFBundleRef bundle, CFTypeRef *a3)
{
  uint64_t v3 = 4294967246;
  if (!a1 || !a3) {
    return v3;
  }
  if (!bundle)
  {
    CFNumberRef v11 = MKAccessLibrary(0);
    if (!v11) {
      return 4294961987;
    }
    CFStringRef v12 = v11;
    CFURLRef v6 = CFBundleCopyResourceURL(v11, @"defaults", @"plist", 0);
    CFRelease(v12);
    if (v6) {
      goto LABEL_5;
    }
    return 4294967253;
  }
  CFURLRef v6 = CFBundleCopyResourceURL(bundle, @"defaults", @"plist", 0);
  if (!v6) {
    return 4294967253;
  }
LABEL_5:
  CFDictionaryRef v7 = CFReadStreamCreateWithFile(0, v6);
  CFRelease(v6);
  if (!v7) {
    return 4294967273;
  }
  if (CFReadStreamOpen(v7))
  {
    CFDictionaryRef v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v7, 0, 0, 0, 0);
    CFDictionaryRef v9 = v8;
    if (v8)
    {
      CFArrayRef Value = CFDictionaryGetValue(v8, a1);
      *a3 = Value;
      if (Value)
      {
        uint64_t v3 = 0;
        *a3 = CFRetain(Value);
      }
      else
      {
        uint64_t v3 = 4294966881;
      }
    }
    else
    {
      uint64_t v3 = 4294967277;
    }
  }
  else
  {
    CFDictionaryRef v9 = 0;
    uint64_t v3 = 4294967273;
  }
  CFReadStreamClose(v7);
  CFRelease(v7);
  if (v9) {
    CFRelease(v9);
  }
  return v3;
}

uint64_t MKGetMediaDefaults(const void *a1, __CFBundle *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  CFDictionaryRef theDict = 0;
  *a4 = 0;
  *a3 = 0;
  if (!a1) {
    return 4294967246;
  }
  uint64_t result = MKFetchMediaSetup(a1, a2, (CFTypeRef *)&theDict);
  if (theDict)
  {
    CFArrayRef Value = CFDictionaryGetValue(theDict, @"Drivers");
    *a3 = Value;
    if (Value) {
      *a3 = CFRetain(Value);
    }
    CFDictionaryRef v8 = CFDictionaryGetValue(theDict, @"Patches");
    *a4 = v8;
    if (v8) {
      *a4 = CFRetain(v8);
    }
    uint64_t result = (uint64_t)theDict;
    if (theDict)
    {
      CFRelease(theDict);
      return 0;
    }
  }
  return result;
}

__CFDictionary *MKMakePartDictExtended(int a1, const char *a2, const char *a3, int a4, uint64_t a5, int *a6, int a7)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  __int16 valuePtr = a1;
  int v22 = a7;
  int v23 = a4;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFStringRef v14 = CFStringCreateWithCString(0, a2, 0);
    CFDictionarySetValue(Mutable, @"Partition Name", v14);
    CFRelease(v14);
    if (a1) {
      CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    }
    else {
      CFNumberRef v15 = CFStringCreateWithCString(0, a3, 0);
    }
    CFDataRef v17 = v15;
    CFDictionarySetValue(Mutable, @"Partition Type", v15);
    CFRelease(v17);
    CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt32Type, &v23);
    CFDictionarySetValue(Mutable, @"Partition Size", v18);
    CFRelease(v18);
    if (a5)
    {
      OSType2Ascii(a5, cStr, 3);
      CFStringRef v19 = CFStringCreateWithCString(0, cStr, 0);
      CFDictionarySetValue(Mutable, @"Partition Signature", v19);
      CFRelease(v19);
    }
    if (a7)
    {
      CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt32Type, &v22);
      CFDictionarySetValue(Mutable, @"Partition Options", v20);
      CFRelease(v20);
    }
    int v16 = 0;
  }
  else
  {
    int v16 = *__error();
  }
  *a6 = v16;
  return Mutable;
}

uint64_t MKBuildDrivers(Ptr *a1, CFDictionaryRef theDict, const __CFArray *a3, __CFBundle *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  CFDictionaryRef v8 = a1;
  LOWORD(a1) = -50;
  if (v8 && theDict)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Drivers");
    if (Value)
    {
      CFDictionaryRef v15 = Value;
      uint64_t Count = (unsigned __int16)CFArrayGetCount(a3);
      if (Count)
      {
        CFIndex v17 = 0;
        while (1)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a3, v17);
          if (!ValueAtIndex) {
            break;
          }
          CFDictionaryRef v19 = (const __CFDictionary *)CFDictionaryGetValue(v15, ValueAtIndex);
          if (!v19) {
            break;
          }
          LODWORD(a1) = MKBuildDriver(v8, v19, a4, a5, a7, a8);
          if (a1) {
            return (__int16)a1;
          }
          if (Count == ++v17) {
            goto LABEL_10;
          }
        }
        LOWORD(a1) = -415;
      }
      else
      {
LABEL_10:
        LOWORD(a1) = 0;
      }
    }
    else
    {
      LOWORD(a1) = -417;
    }
  }
  return (__int16)a1;
}

uint64_t MKBuildDriver(Ptr *a1, CFDictionaryRef theDict, __CFBundle *a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  Ptr v41 = 0;
  memset(v40, 0, sizeof(v40));
  memset(&v36, 0, sizeof(v36));
  unsigned int valuePtr = 0;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"Partition Name");
  if (!Value
    || !CFStringGetCString(Value, (char *)&v40[2] + 12, 32, 0)
    || (CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(theDict, @"Partition Type")) == 0
    || !CFStringGetCString(v13, (char *)((unint64_t)v40 | 0xC), 32, 0))
  {
    int v17 = -1;
    int v18 = -417;
    goto LABEL_9;
  }
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(theDict, @"Driver Signature");
  if (v14)
  {
    CFStringRef v15 = v14;
    *(_DWORD *)buffer = 0;
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 == CFStringGetTypeID())
    {
      v43.location = 0;
      v43.lengtHandle h = 4;
      CFStringGetBytes(v15, v43, 0, 0, 0, buffer, 4, 0);
    }
    else if (v16 == CFDataGetTypeID())
    {
      v44.location = 0;
      v44.lengtHandle h = 4;
      CFDataGetBytes((CFDataRef)v15, v44, buffer);
    }
    DWORD1(v40[0]) = bswap32(*(unsigned int *)buffer);
  }
  CFBooleanRef v20 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Driver Present");
  if (v20) {
    int v21 = CFBooleanGetValue(v20);
  }
  else {
    int v21 = 0;
  }
  CFStringRef v22 = (const __CFString *)CFDictionaryGetValue(theDict, @"Cpu");
  if (v22) {
    CFStringGetCString(v22, (char *)&v40[4] + 12, 16, 0);
  }
  CFBooleanRef v23 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Chain Compatible");
  if (v23 && CFBooleanGetValue(v23)) {
    LOWORD(v40[0]) |= 0x100u;
  }
  CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Chain Driver");
  if (v24 && CFBooleanGetValue(v24)) {
    LOWORD(v40[0]) |= 0x200u;
  }
  CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Partition Size");
  if (!v25)
  {
    unsigned int v26 = 0;
    goto LABEL_34;
  }
  CFNumberGetValue(v25, kCFNumberSInt32Type, &valuePtr);
  unsigned int v26 = valuePtr;
  if (valuePtr <= 0x7FF) {
LABEL_34:
  }
    unsigned int valuePtr = v26 << 9;
  OSType2Ascii(DWORD1(v40[0]), v38, 2);
  CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"%s.%s", (unint64_t)v40 | 0xC, v38, *(void *)&v36.st_dev, v36.st_ino, *(void *)&v36.st_uid, *(void *)&v36.st_rdev, v36.st_atimespec.tv_sec, v36.st_atimespec.tv_nsec, v36.st_mtimespec.tv_sec, v36.st_mtimespec.tv_nsec, v36.st_ctimespec.tv_sec, v36.st_ctimespec.tv_nsec, v36.st_birthtimespec.tv_sec, v36.st_birthtimespec.tv_nsec);
  if (!v27)
  {
    int v17 = -1;
    goto LABEL_41;
  }
  CFStringRef v28 = v27;
  CFURLRef v29 = CFBundleCopyResourceURL(a3, v27, @"drvr", 0);
  CFRelease(v28);
  if (!v29)
  {
    int v17 = -1;
    if (!v21)
    {
LABEL_48:
      int v18 = PMWriteDriver(a1, (uint64_t)v40, valuePtr, a4, a5, a6);
      goto LABEL_9;
    }
LABEL_41:
    int v18 = -43;
    goto LABEL_9;
  }
  CFURLGetFileSystemRepresentation(v29, 1u, buffer, 1024);
  CFRelease(v29);
  int v30 = stat((const char *)buffer, &v36);
  if (v30
    || ((DWORD2(v40[0]) = v36.st_size, unsigned int v31 = *((unsigned __int16 *)*a1 + 1), !(LODWORD(v36.st_size) % v31))
      ? (int v32 = LODWORD(v36.st_size) / v31)
      : (int v32 = LODWORD(v36.st_size) / v31 + 1),
        int v33 = v32 * v31,
        Ptr v41 = NewPtr(v32 * v31),
        int v30 = MemError(),
        !v41))
  {
    int v18 = v30;
    int v17 = -1;
    goto LABEL_9;
  }
  bzero(&v41[DWORD2(v40[0])], (v33 - DWORD2(v40[0])));
  int v34 = open((const char *)buffer, 0, 0);
  int v17 = v34;
  if (v34 != -1)
  {
    int v35 = read(v34, v41, DWORD2(v40[0]));
    if (DWORD2(v40[0]) == v35) {
      goto LABEL_48;
    }
  }
  int v18 = -1;
LABEL_9:
  if (v41) {
    DisposePtr(v41);
  }
  if (v17 != -1) {
    close(v17);
  }
  if (v18 == -1) {
    int v18 = *__error();
  }
  return (__int16)v18;
}

uint64_t MKCreatePatchPartition(const void **a1, CFArrayRef theArray, CFDictionaryRef theDict, const __CFArray *a4, __CFBundle *a5, unsigned int a6, int a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  CFDictionaryRef v9 = a1;
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int valuePtr = 0;
  strcpy(v30, "Patch Partition");
  LOWORD(a1) = -50;
  if (v9 && theDict)
  {
    __int16 v29 = 0;
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        CFIndex v15 = Count;
        CFIndex v16 = 0;
        int v17 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v16);
          if (!ValueAtIndex) {
            break;
          }
          CFDictionaryRef v19 = ValueAtIndex;
          CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"Partition Type");
          if (Value && CFEqual(Value, @"Apple_Patches"))
          {
            CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v19, @"Partition Size");
            if (v25)
            {
              CFNumberGetValue(v25, kCFNumberSInt32Type, &valuePtr);
              uint64_t v23 = valuePtr;
              if (valuePtr) {
                goto LABEL_15;
              }
            }
            break;
          }
          CFIndex v16 = (__int16)++v17;
        }
        while (v15 > (__int16)v17);
      }
    }
    CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Patches");
    if (v21)
    {
      CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(v21, @"Partition Size");
      if (v22) {
        CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr);
      }
    }
    uint64_t v23 = valuePtr;
    if (!valuePtr)
    {
      uint64_t v23 = 128;
      unsigned int valuePtr = 128;
    }
LABEL_15:
    unsigned int valuePtr = PMConvertBlocks(v23, 0x200u, *((unsigned __int16 *)*v9 + 1));
    LODWORD(a1) = PMNewPartitionExtended(v9, 12544, 0, 0, valuePtr, v30, a6, (unsigned __int16 *)&v29, 0);
    if (!a1) {
      LOWORD(a1) = RebuildPatches((uint64_t *)v9, v29, theDict, a4, a5, a6, a8, a9);
    }
  }
  return (__int16)a1;
}

uint64_t RebuildPatches(uint64_t *a1, int a2, const __CFDictionary *a3, const __CFArray *a4, __CFBundle *a5, unsigned int a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a2 < 1) {
    return 4294967246;
  }
  *(_WORD *)(*a1 + 1072 * (unsigned __int16)a2 + 1036) = *(_WORD *)(*a1 + 518) >> 9;
  uint64_t result = VErasePartition(a1, (unsigned __int16)a2, 0, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a8);
  if (result) {
    return result;
  }
  Ptr p = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  *(_OWORD *)long long v49 = 0u;
  *(_OWORD *)long long v50 = 0u;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, @"Patches");
  if (!Value)
  {
    LOWORD(v36) = -417;
    return (__int16)v36;
  }
  CFDictionaryRef v18 = Value;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count < 1)
  {
    LOWORD(v20) = 0;
    goto LABEL_57;
  }
  unsigned int v45 = a6;
  CFIndex v19 = 0;
  uint64_t v20 = 0;
  bundle = a5;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a4, v19);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v18, ValueAtIndex);
    if (!v22) {
      break;
    }
    CFDictionaryRef v23 = v22;
    memset(&v47, 0, sizeof(v47));
    *(_OWORD *)long long v49 = 0u;
    *(_OWORD *)long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    Ptr p = 0;
    CFStringRef v24 = (const __CFString *)CFDictionaryGetValue(v22, @"Patch Name");
    if (!v24) {
      goto LABEL_17;
    }
    CFStringGetPascalString(v24, (StringPtr)&v50[1] + 4, 33, 0);
    CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(v23, @"Patch Signature");
    if (!v25
      || (v58.location = 0,
          v58.lengtHandle h = 4,
          CFStringGetBytes(v25, v58, 0, 0, 0, v49, 4, 0),
          (CFStringRef v26 = (const __CFString *)CFDictionaryGetValue(v23, @"Patch Vendor")) == 0)
      || (CFStringGetPascalString(v26, (StringPtr)&v52 + 13, 33, 0),
          (CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Major Vers")) == 0))
    {
LABEL_17:
      int v33 = -1;
      uint64_t v34 = 4294966879;
      goto LABEL_18;
    }
    CFNumberGetValue(v27, kCFNumberSInt16Type, &v49[4]);
    CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Minor Vers");
    if (v28) {
      CFNumberGetValue(v28, kCFNumberSInt16Type, &v49[6]);
    }
    CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(v23, @"Flags");
    if (v29)
    {
      CFStringRef v30 = v29;
      *(_DWORD *)long long v48 = -1;
      CFTypeID v31 = CFGetTypeID(v29);
      if (v31 == CFStringGetTypeID())
      {
        CFStringGetCString(v30, __str, 16, 0);
        unsigned int v32 = strtoul(__str, 0, 0);
      }
      else if (v31 == CFDataGetTypeID())
      {
        v59.location = 0;
        v59.lengtHandle h = 4;
        CFDataGetBytes((CFDataRef)v30, v59, v48);
        unsigned int v32 = bswap32(*(unsigned int *)v48);
      }
      else
      {
        unsigned int v32 = -1;
      }
      *(_DWORD *)&v49[8] = v32;
    }
    CFStringRef v37 = CFStringCreateWithFormat(0, 0, @"Apple_Patches.%4.4s", v49);
    CFURLRef v38 = CFBundleCopyResourceURL(bundle, v37, @"ptch", 0);
    CFRelease(v37);
    if (!v38 || (int v39 = CFURLGetFileSystemRepresentation(v38, 1u, (UInt8 *)__str, 1024), CFRelease(v38), !v39))
    {
      int v33 = -1;
      uint64_t v34 = 4294967253;
      goto LABEL_18;
    }
    uint64_t v40 = stat(__str, &v47);
    if (v40)
    {
      uint64_t v34 = v40;
      int v33 = -1;
      goto LABEL_18;
    }
    LODWORD(v50[0]) = v47.st_size;
    Ptr p = NewPtr(LODWORD(v47.st_size));
    uint64_t v41 = MemError();
    if (p)
    {
      int v42 = open(__str, 0, 0);
      int v33 = v42;
      if (v42 == -1)
      {
        uint64_t v34 = 0xFFFFFFFFLL;
LABEL_18:
        if (p)
        {
          DisposePtr(p);
          Ptr p = 0;
        }
        goto LABEL_20;
      }
      int v43 = read(v42, p, LODWORD(v50[0]));
      if (LODWORD(v50[0]) == v43) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v34 = v41;
      int v33 = -1;
    }
    if (v34) {
      goto LABEL_18;
    }
LABEL_20:
    if (v33 != -1) {
      close(v33);
    }
    if (v34 == -1) {
      uint64_t v34 = *(unsigned __int16 *)__error();
    }
    if ((_WORD)v34)
    {
      uint64_t v35 = v34;
      LOWORD(v36) = v34;
      if ((unsigned __int16)v34 != 65493) {
        goto LABEL_54;
      }
    }
    else
    {
      int v36 = PMAddpatch((uint64_t)a1, a2, v49, (unsigned __int8 *)p, v45, a7, a8);
      if (p)
      {
        DisposePtr(p);
        Ptr p = 0;
      }
      uint64_t v35 = v20;
      if (v36) {
        goto LABEL_54;
      }
    }
    ++v19;
    uint64_t v20 = v35;
    if (Count == v19)
    {
      LOWORD(v36) = v34;
      LOWORD(v20) = v35;
      goto LABEL_54;
    }
  }
  LOWORD(v36) = -415;
LABEL_54:
  if (p) {
    DisposePtr(p);
  }
  if (!(_WORD)v36) {
LABEL_57:
  }
    LOWORD(v36) = v20;
  return (__int16)v36;
}

uint64_t MKMediaLayout(Ptr *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, char a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unsigned int v41 = -50;
  if (!a1) {
    return v41;
  }
  unsigned int v41 = -43;
  CFStringRef v14 = a3;
  if (!a3)
  {
    CFStringRef v14 = MKAccessLibrary(0);
    if (!v14) {
      return v41;
    }
  }
  CFDictionaryRef v15 = MKLoadDB(v14, @"inventory", (int *)&v41);
  if (!v15)
  {
    CFURLRef v16 = 0;
    goto LABEL_38;
  }
  char v37 = a5;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  CFURLRef v16 = MKLoadDB(v14, @"database", (int *)&v41);
  unsigned int v41 = 0;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"Drivers");
  CFArrayRef v18 = (const __CFArray *)CFDictionaryGetValue(a2, @"Patches");
  CFArrayRef v19 = (const __CFArray *)CFDictionaryGetValue(a2, @"Partitions");
  if (Value && (unsigned int v41 = MKBuildDrivers(a1, v15, Value, v14, a4, 0, v39, v40)) != 0
    || v18
    && (unsigned int v41 = MKCreatePatchPartition((const void **)a1, v19, v15, v18, v14, a4, 0, v39, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))v40)) != 0)
  {
LABEL_38:
    if (a3) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  if (!v19 || (uint64_t Count = (unsigned __int16)CFArrayGetCount(v19)) == 0)
  {
LABEL_35:
    unsigned int v41 = 0;
    if (a3) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  CFIndex v20 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, v20);
    if (!ValueAtIndex) {
      break;
    }
    CFDictionaryRef v22 = ValueAtIndex;
    __int16 v42 = 0;
    uint64_t v46 = 0;
    long long v45 = 0u;
    memset(v44, 0, sizeof(v44));
    Ptr v23 = *a1;
    unsigned int v24 = MKGetPartitionInfo(ValueAtIndex, *((__int16 *)*a1 + 257), (uint64_t)v44);
    if (v24) {
      goto LABEL_47;
    }
    unsigned int v25 = DWORD2(v45);
    if (!DWORD2(v45))
    {
      unint64_t v26 = *((unsigned __int16 *)v23 + 261);
      if (v26 >= 2 && (int v27 = v26 - 1, *(_WORD *)&v23[1072 * v27 + 1082] == 24320))
      {
        unsigned int v25 = *(_DWORD *)&v23[1072 * v27 + 540];
        DWORD2(v45) = v25;
      }
      else
      {
        unsigned int v25 = 0;
      }
    }
    int v28 = WORD2(v46);
    if (WORD2(v46) == 12544)
    {
      if (!PMSpecificIndex(a1, 12544, 0, &v42) && v42) {
        goto LABEL_34;
      }
      int v28 = WORD2(v46);
      unsigned int v25 = DWORD2(v45);
    }
    unsigned int v24 = PMNewPartitionExtended((const void **)a1, v28, (char *)&v44[2] + 1, HIDWORD(v45), v25, v44, a4, (unsigned __int16 *)&v42, v46);
    if (v24) {
      goto LABEL_24;
    }
    Ptr v29 = *a1;
    if (*((__int16 *)*a1 + 257) <= 3)
    {
      int v30 = v42;
      if ((v37 & 1) != 0
        && *((_DWORD *)v29 + 1) == *(_DWORD *)&v29[1072 * v42 + 540] + *(_DWORD *)&v29[1072 * v42 + 536])
      {
        uint64_t v35 = (uint64_t)&v29[1072 * v42 + 528];
        int v36 = v42;
        int v31 = PMConvertBlocks(10, 0x200u, *((unsigned __int16 *)v29 + 1));
        int v30 = v36;
        unsigned int v32 = (*(_DWORD *)(v35 + 12) - v31) / a4 * a4;
        *(_DWORD *)(v35 + 12) = v32;
        *(_DWORD *)(v35 + 84) = v32;
      }
      if (DWORD1(v45)) {
        *(_DWORD *)&v29[1072 * v30 + 664] = DWORD1(v45);
      }
      CFStringRef v33 = (const __CFString *)CFDictionaryGetValue(v22, @"Partition Loader");
      if (v33)
      {
        CFStringGetCString(v33, v43, 34, 0);
        unsigned int v24 = MKCreateLoaderPartition((const void **)a1, v14, v15, a4, 0, v42, v43, 1, v39, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))v40);
        if (v24 != 28)
        {
LABEL_24:
          if (v24) {
            goto LABEL_47;
          }
        }
      }
    }
LABEL_34:
    if (Count == ++v20) {
      goto LABEL_35;
    }
  }
  unsigned int v24 = -415;
LABEL_47:
  unsigned int v41 = v24;
  if (!a3)
  {
LABEL_39:
    if (v14) {
      CFRelease(v14);
    }
  }
LABEL_41:
  if (v15) {
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
  return v41;
}

Handle NewHandle(Size byteCount)
{
  return InternalNewHandle(byteCount, 0);
}

void SetHandleSize(Handle h, Size newSize)
{
  if (!h || (char)h[2] < 0)
  {
    __int16 v6 = -109;
  }
  else
  {
    Ptr v3 = *h;
    if (*h)
    {
      uint64_t v5 = (char *)malloc_type_realloc(v3, newSize, 0x2CEBCF70uLL);
      if (!newSize || v5)
      {
        __int16 v6 = 0;
        *Handle h = v5;
        h[1] = (Ptr)newSize;
      }
      else
      {
        __int16 v6 = -108;
      }
    }
    else
    {
      __int16 v6 = -111;
    }
  }
  MemErr = v6;
}

Size GetHandleSize(Size h)
{
  if (h)
  {
    __int16 v1 = 0;
    Handle h = *(void *)(h + 8);
  }
  else
  {
    __int16 v1 = -109;
  }
  MemErr = v1;
  return h;
}

void HUnlock(Handle h)
{
  if (h)
  {
    __int16 v1 = 0;
    *((unsigned char *)h + 16) &= ~0x80u;
  }
  else
  {
    __int16 v1 = -109;
  }
  MemErr = v1;
}

Ptr NewPtr(Size byteCount)
{
  Ptr result = (Ptr)malloc_type_malloc(byteCount, 0x5F07003AuLL);
  if (result) {
    __int16 v2 = 0;
  }
  else {
    __int16 v2 = -108;
  }
  MemErr = v2;
  return result;
}

Ptr NewPtrClear(Size byteCount)
{
  __int16 v2 = (char *)malloc_type_malloc(byteCount, 0x7F9C0747uLL);
  Ptr v3 = v2;
  if (v2)
  {
    bzero(v2, byteCount);
    MemErr = 0;
  }
  return v3;
}

void DisposePtr(Ptr p)
{
  if (p)
  {
    free(p);
    __int16 v1 = 0;
  }
  else
  {
    __int16 v1 = -113;
  }
  MemErr = v1;
}

uint64_t MKBlockChecksum2(_DWORD *a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = *a1;
  if (a2 && a3)
  {
    CFAllocatorRef v4 = &a2[a3];
    do
    {
      HIDWORD(v5) = v3;
      LODWORD(v5) = v3;
      int v6 = *a2++;
      uint64_t v3 = (v5 >> 31) + v6;
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

uint64_t MKImageChecksum(_DWORD *a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3 = *a1;
  if (a2)
  {
    CFAllocatorRef v4 = &a2[a3];
    do
    {
      int v5 = *a2++;
      uint64_t v3 = (v3 + v5);
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

uint64_t DrvrChecksum(unsigned __int8 *a1, int a2)
{
  if (a1)
  {
    if (!a2) {
      goto LABEL_6;
    }
    int v2 = 0;
    do
    {
      --a2;
      unsigned __int8 v3 = *a1++;
      unsigned int v4 = v2 + v3;
      int v2 = (v4 >> 15) & 1 | (2 * v4);
    }
    while ((_WORD)a2);
    if (!(_WORD)v4) {
LABEL_6:
    }
      LOWORD(v2) = -1;
  }
  else
  {
    LOWORD(v2) = 0;
  }
  return (unsigned __int16)v2;
}

__CFDictionary *TAOCopyHFSPlusParametersDict(const __CFDictionary *a1, _DWORD *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  *(_OWORD *)__str = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  *(_OWORD *)long long v45 = 0u;
  long long v46 = 0u;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"volume sectors");
  if (!Value) {
    goto LABEL_80;
  }
  CFNumberRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFNumberGetTypeID()) {
    goto LABEL_80;
  }
  memset(v43, 0, sizeof(v43));
  uint64_t v39 = 0;
  uint64_t valuePtr = 0;
  CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
  CFDictionaryRef v7 = CFDictionaryGetValue(a1, @"journal size");
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a1, @"block size");
  if (v8)
  {
    CFNumberRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v9, kCFNumberSInt64Type, &v39);
      if (snprintf(__str, 0x20uLL, "%llu", v39) > 0x1F) {
        goto LABEL_80;
      }
    }
  }
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"attr node size");
  CFNumberRef v12 = v11;
  if (v11)
  {
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v12, kCFNumberSInt64Type, &v39);
      LODWORD(v12) = snprintf(v45, 0x40uLL, "a=%llu", v39);
      if (v12 > 0x3F) {
        goto LABEL_80;
      }
    }
    else
    {
      LODWORD(v12) = 0;
    }
  }
  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(a1, @"cat node size");
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v15, kCFNumberSInt64Type, &v39);
      if (v12)
      {
        unsigned int v17 = v12 + 1;
        v45[v12] = 44;
      }
      else
      {
        unsigned int v17 = 0;
      }
      int v18 = snprintf(&v45[v17], 64 - v17, "c=%llu", v39);
      if (64 - (unint64_t)v17 <= v18) {
        goto LABEL_80;
      }
      LODWORD(v12) = v18 + v17;
    }
  }
  CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ext node size");
  if (v19)
  {
    CFNumberRef v20 = v19;
    CFTypeID v21 = CFGetTypeID(v19);
    if (v21 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v20, kCFNumberSInt64Type, &v39);
      if (v12)
      {
        int v22 = v12 + 1;
        v45[(int)v12] = 44;
      }
      else
      {
        int v22 = 0;
      }
      if (64 - v22 <= (unint64_t)snprintf(&v45[v22], 64 - v22, "e=%llu", v39))
      {
LABEL_80:
        CFMutableArrayRef Mutable = 0;
        goto LABEL_81;
      }
    }
  }
  *(void *)&v43[0] = "/sbin/newfs_hfs";
  if (v7)
  {
    *((void *)&v43[0] + 1) = "-J";
    unsigned int v23 = 2;
  }
  else
  {
    unsigned int v23 = 1;
  }
  if (__str[0])
  {
    unsigned int v24 = v23 + 1;
    *((void *)v43 + v23) = "-b";
    v23 += 2;
    *((void *)v43 + v24) = __str;
  }
  if (v45[0])
  {
    unsigned int v25 = v23 + 1;
    *((void *)v43 + v23) = "-n";
    v23 += 2;
    *((void *)v43 + v25) = v45;
  }
  *((void *)v43 + v23) = "-N";
  snprintf(v51, 0x20uLL, "%llub", valuePtr);
  *((void *)v43 + v23 + 1) = v51;
  *((void *)&v43[1] + v23) = 0;
  int v26 = dup(2);
  if (v26 < 0)
  {
    CFMutableArrayRef Mutable = 0;
    LODWORD(v7) = *__error();
    if (!a2) {
      return Mutable;
    }
    goto LABEL_83;
  }
  int v27 = v26;
  int v28 = open("/dev/null", 1, 384);
  if (v28 < 0) {
    goto LABEL_77;
  }
  int v29 = v28;
  if (dup2(v28, 2) == -1)
  {
    LODWORD(v7) = *__error();
    close(v29);
LABEL_86:
    dup2(v27, 2);
    close(v27);
    CFMutableArrayRef Mutable = 0;
    if (!a2) {
      return Mutable;
    }
    goto LABEL_83;
  }
  close(v29);
  int v30 = (FILE **)TAOpopenv("r", *(const char **)&v43[0], (char *const *)v43);
  if (!v30)
  {
LABEL_77:
    LODWORD(v7) = *__error();
    goto LABEL_86;
  }
  int v31 = v30;
  CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  while (fgets(__s1, 128, *v31))
  {
    int v34 = strnlen(__s1, 0x80uLL) - 1;
    if (__s1[v34] == 10)
    {
      __s1[v34] = 0;
      uint64_t v35 = @"block size";
      if (sscanf(__s1, " block-size:%32s", v52) == 1) {
        goto LABEL_49;
      }
      uint64_t v35 = @"total blocks";
      if (sscanf(__s1, " total blocks:%32s", v52) == 1) {
        goto LABEL_49;
      }
      uint64_t v35 = @"journal size";
      if (sscanf(__s1, " journal-size:%32s", v52) == 1) {
        goto LABEL_49;
      }
      uint64_t v35 = @"cat node size";
      if (sscanf(__s1, " catalog b-tree node size:%32s", v52) == 1) {
        goto LABEL_49;
      }
      uint64_t v35 = @"cat clump size";
      if (sscanf(__s1, " initial catalog file size:%32s", v52) == 1
        || (uint64_t v35 = @"ext node size", sscanf(__s1, " extents b-tree node size:%32s", v52) == 1)
        || (uint64_t v35 = @"ext clump size", sscanf(__s1, " initial extents file size:%32s", v52) == 1)
        || (uint64_t v35 = @"alloc clump size", sscanf(__s1, " initial allocation file size:%32s", v52) == 1)
        || (uint64_t v35 = @"data clump size", sscanf(__s1, " data fork clump size:%32s", v52) == 1)
        || (uint64_t v35 = @"resource clump size", sscanf(__s1, " resource fork clump size:%32s", v52) == 1)
        || (uint64_t v35 = @"attr node size", sscanf(__s1, " attributes b-tree node size:%32s", v52) == 1)
        || (uint64_t v35 = @"attr clump size", sscanf(__s1, " initial attributes file size:%32s", v52) == 1))
      {
LABEL_49:
        __endptr = 0;
        unint64_t v36 = strtoull(v52, &__endptr, 10);
        unint64_t v42 = v36;
        if (__endptr)
        {
          switch(*__endptr)
          {
            case 'B':
LABEL_52:
              v36 <<= 9;
              goto LABEL_58;
            case 'C':
            case 'D':
            case 'F':
            case 'H':
            case 'I':
            case 'J':
            case 'L':
            case 'N':
            case 'O':
              break;
            case 'E':
LABEL_53:
              v36 <<= 10;
              goto LABEL_54;
            case 'G':
              goto LABEL_55;
            case 'K':
              goto LABEL_57;
            case 'M':
              goto LABEL_56;
            case 'P':
LABEL_54:
              v36 <<= 10;
LABEL_55:
              v36 <<= 10;
LABEL_56:
              v36 <<= 10;
LABEL_57:
              v36 <<= 10;
LABEL_58:
              unint64_t v42 = v36;
              break;
            default:
              switch(*__endptr)
              {
                case 'b':
                  goto LABEL_52;
                case 'e':
                  goto LABEL_53;
                case 'g':
                  goto LABEL_55;
                case 'k':
                  goto LABEL_57;
                case 'm':
                  goto LABEL_56;
                case 'p':
                  goto LABEL_54;
                default:
                  goto LABEL_59;
              }
          }
        }
LABEL_59:
        if (v36)
        {
          CFNumberRef v37 = CFNumberCreate(v32, kCFNumberSInt64Type, &v42);
          CFDictionarySetValue(Mutable, v35, v37);
          CFRelease(v37);
        }
      }
    }
  }
  TAOpclose(v31);
  dup2(v27, 2);
  close(v27);
  if (CFDictionaryGetValue(Mutable, @"block size")
    && CFDictionaryGetValue(Mutable, @"total blocks")
    && CFDictionaryGetValue(Mutable, @"cat node size")
    && CFDictionaryGetValue(Mutable, @"cat clump size")
    && CFDictionaryGetValue(Mutable, @"ext node size")
    && CFDictionaryGetValue(Mutable, @"ext clump size")
    && CFDictionaryGetValue(Mutable, @"alloc clump size")
    && CFDictionaryGetValue(Mutable, @"data clump size")
    && CFDictionaryGetValue(Mutable, @"resource clump size"))
  {
    if (!v7) {
      goto LABEL_82;
    }
    if (CFDictionaryGetValue(Mutable, @"journal size"))
    {
      LODWORD(v7) = 0;
      if (!a2) {
        return Mutable;
      }
      goto LABEL_83;
    }
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    goto LABEL_80;
  }
LABEL_81:
  LODWORD(v7) = 22;
LABEL_82:
  if (a2) {
LABEL_83:
  }
    *a2 = v7;
  return Mutable;
}

uint64_t MKFATFSDescriptorIdentity(char *a1)
{
  __int16 v1 = (const char *)fatfsdescriptors[0];
  if (fatfsdescriptors[0])
  {
    uint64_t v3 = 0;
    do
    {
      if (!strcasecmp(a1, v1)) {
        break;
      }
      __int16 v1 = (const char *)fatfsdescriptors[++v3];
    }
    while (v1);
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

uint64_t MKFATFSIdentity(unsigned int a1)
{
  if (a1 >= 4) {
    unsigned int v1 = 0;
  }
  else {
    unsigned int v1 = a1;
  }
  return fatfsdescriptors[v1];
}

uint64_t MKDetectFATFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v8 = 0;
  *a3 = 0;
  if ((*(_WORD *)(a2 + 11) & 0x7F) == 0)
  {
    if (*((unsigned __int16 *)a2 + 255) != 43605) {
      return 0;
    }
    *a3 = 500;
    int v9 = *a2;
    if (v9 != 233 && (v9 != 235 || a2[2] != 144)) {
      return 0;
    }
    *a3 = 1000;
    if (*a2 == 235 && a2[1] == 235 && a2[2] == 144) {
      return 0;
    }
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    uint64_t v10 = _MKFATFSReadBPB(a1, (uint64_t)v12);
    uint64_t v8 = 0;
    if (v10 != -123 && v10 != 22)
    {
      if (v10) {
        return v10;
      }
      *a3 += 4000;
      if (a4) {
        *a4 = v12[0];
      }
      if (a5)
      {
        uint64_t v8 = 0;
        *a5 = 3;
        return v8;
      }
      return 0;
    }
  }
  return v8;
}

uint64_t _MKFATFSReadBPB(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  *(void *)(a2 + 96) = 0;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t result = MKMediaReadSectors(a1, 0, 1uLL, (char *)&v31, 0);
  if (result) {
    return result;
  }
  if (v31 != 233)
  {
    uint64_t result = 22;
    if (v31 != 235 || BYTE2(v31) != 144) {
      return result;
    }
  }
  unint64_t v5 = v35;
  *(_WORD *)(a2 + 12) = v35;
  unint64_t v6 = v34;
  *(_WORD *)(a2 + 8) = v34;
  int v7 = v36;
  *(_WORD *)(a2 + 14) = v36;
  int v8 = v37;
  *(_WORD *)(a2 + 16) = v37;
  int v9 = v38;
  *(_WORD *)(a2 + 18) = v38;
  uint64_t v10 = v39;
  int v11 = v41;
  int v12 = v42;
  *(_DWORD *)(a2 + 28) = v41;
  *(_DWORD *)(a2 + 32) = v12;
  *(_WORD *)(a2 + 24) = v40;
  *(_WORD *)(a2 + 4) = 512;
  unint64_t v13 = v6 >> 9;
  *(_WORD *)(a2 + 6) = v6 >> 9;
  if (!v9)
  {
    if (v10 || v11 | v46) {
      return 22;
    }
    *(void *)(a2 + 76) = 0x100040FFFFFFFLL;
    int v11 = v44;
    *(_DWORD *)(a2 + 28) = v44;
    if ((v45 & 0x80) != 0) {
      *(_WORD *)(a2 + 84) = v45 & 0xF;
    }
  }
  uint64_t v14 = v43;
  if (v10) {
    uint64_t v14 = v10;
  }
  if (!v14
    || ((v5 - 1) & 0x80) != 0
    || ((v5 - 1) & v5) != 0
    || (unsigned __int16)(v6 - 4097) < 0xF1FFu)
  {
    return 22;
  }
  uint64_t result = 22;
  if (((v6 - 1) & v6) != 0) {
    return result;
  }
  unsigned int v15 = v6 * v5;
  if ((v6 * v5) > 0x8000) {
    return result;
  }
  unsigned int v16 = v7 + v11 * v8;
  int v17 = *(_DWORD *)(a2 + 76);
  if (v17 == 0xFFFFFFF)
  {
    int v18 = v48;
    int v19 = (unsigned __int16)v47;
    *(_WORD *)(a2 + 38) = v47;
    unsigned int v20 = v16 * v13
        + ((unint64_t)(v19 - 2) << (*(_DWORD *)(a2 + 64)
                                                       - *(_DWORD *)(a2 + 72)));
    *(_DWORD *)(a2 + 40) = v18;
    *(_DWORD *)(a2 + 44) = v20;
    *(_DWORD *)(a2 + 20) = v14 * v13;
    *(_DWORD *)(a2 + 48) = (v14 - (unint64_t)v16) / v5;
    *(_DWORD *)(a2 + 52) = v16 * v13;
    int v21 = 3;
LABEL_31:
    *(_DWORD *)a2 = v21;
    int v24 = 128;
    goto LABEL_32;
  }
  unsigned int v20 = v16 * v13;
  uint64_t v22 = ((int)v6 + 32 * v9 - 1) / v6 + v16;
  *(_DWORD *)(a2 + 20) = v14 * v13;
  unint64_t v23 = (v14 - v22) / v5;
  *(_DWORD *)(a2 + 44) = v16 * v13;
  *(_DWORD *)(a2 + 48) = v23;
  *(_DWORD *)(a2 + 52) = v22 * v13;
  if (v17 == 0xFFFF) {
    goto LABEL_30;
  }
  if (v17 != 4095)
  {
    if (v17)
    {
      *(_DWORD *)a2 = 0;
      int v24 = 128;
      uint64_t result = 4294967173;
      goto LABEL_32;
    }
    if (v23 <= 0xFF4)
    {
      *(void *)(a2 + 76) = 0x2000300000FFFLL;
      goto LABEL_27;
    }
    *(void *)(a2 + 76) = 0x100020000FFFFLL;
LABEL_30:
    int v21 = 2;
    goto LABEL_31;
  }
LABEL_27:
  *(_DWORD *)a2 = 1;
  int v24 = 96;
LABEL_32:
  *(_DWORD *)(a2 + 88) = v24 * v6;
  *(_DWORD *)(a2 + 72) = 9;
  *(_WORD *)(a2 + 10) = v15;
  unsigned int v25 = __clz(__rbit32(v15));
  if ((_WORD)v15) {
    unsigned int v26 = v25 + 1;
  }
  else {
    unsigned int v26 = 0;
  }
  *(_DWORD *)(a2 + 64) = v26 - 1;
  *(_DWORD *)(a2 + 68) = (unsigned __int16)v15 - 1;
  if (((unsigned __int16)v15 & (v15 - 1)) == 0)
  {
    uint64_t result = MKMediaReadSectors(a1, v20, 1uLL, (char *)&v31, 0);
    if (!result)
    {
      if ((v34 & 8) != 0 && (_BYTE)v31 && v31 != 229)
      {
        if (v31 == 5) {
          LOBYTE(v31) = -27;
        }
        strntrim((const char *)&v31, 8);
        strntrim((const char *)&v32, 3);
        *(void *)(a2 + 92) = v31;
        if ((_BYTE)v32)
        {
          size_t v27 = a2 + 92 + strlcat((char *)(a2 + 92), ".", 0xCuLL);
          *(_WORD *)size_t v27 = v32;
          *(unsigned char *)(v27 + 2) = v33;
        }
      }
      if (!*(_WORD *)(a2 + 40)) {
        return 0;
      }
      uint64_t result = MKMediaReadSectors(a1, *(unsigned __int16 *)(a2 + 40), 1uLL, (char *)&v31, 0);
      if (!result)
      {
        if (v31 != 1096897106 || v49 != 1631679090 || v52 != -1437270016) {
          return 0;
        }
        uint64_t result = 0;
        int v28 = *(unsigned __int16 *)(a2 + 12);
        if (v50 == -1) {
          int v29 = 0;
        }
        else {
          int v29 = v50 * v28;
        }
        int v30 = v51 * v28;
        *(_DWORD *)(a2 + 56) = v29;
        *(_DWORD *)(a2 + 60) = v30;
      }
    }
  }
  return result;
}

__CFDictionary *MKFATFSCreateProperties(uint64_t a1, const __CFDictionary *a2, int *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, sizeof(v13));
  int v6 = _MKFATFSReadBPB(a1, (uint64_t)v14);
  if (v6)
  {
    CFMutableArrayRef Mutable = 0;
    goto LABEL_12;
  }
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    goto LABEL_11;
  }
  int v8 = LOWORD(v14[0]);
  if (LOWORD(v14[0]) >= 4u) {
    int v8 = 0;
  }
  CFStringRef v9 = CFStringCreateWithCString(0, (const char *)fatfsdescriptors[v8], 0x8000100u);
  if (v9)
  {
    CFStringRef v10 = v9;
    CFDictionarySetValue(Mutable, @"FAT Variant", v9);
    CFRelease(v10);
    if (MKCFOptionBit(a2, @"High Tide Mark", 1))
    {
      int v6 = FATSuperTidemark((uint64_t)v13, 0x40000, (uint64_t)v14, a1, 0, 0);
      if (v6) {
        goto LABEL_12;
      }
      CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, (char *)&v13[3] + 8);
      CFDictionarySetValue(Mutable, @"High Tide Mark", v11);
      CFRelease(v11);
    }
    int v6 = 0;
  }
  else
  {
LABEL_11:
    int v6 = -1;
  }
LABEL_12:
  if (a3)
  {
    if (v6 == -1) {
      int v6 = *__error();
    }
    *a3 = v6;
  }
  return Mutable;
}

uint64_t FATSuperTidemark(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  uint64_t v39 = 0;
  *(void *)(a1 + 48) = *(unsigned int *)(a3 + 56);
  unint64_t v9 = ((unint64_t)*(unsigned int *)(a3 + 48) << (*(_DWORD *)(a3 + 64)
                                                       - *(_DWORD *)(a3 + 72)))
     + *(unsigned int *)(a3 + 52);
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 56) = v9 - 1;
  CFStringRef v10 = (char *)malloc_type_calloc(*(unsigned int *)(a3 + 88), 1uLL, 0x100004077774924uLL);
  if (!v10)
  {
    *(_DWORD *)(a1 + 72) = *(void *)(a1 + 56) / (*(void *)(a1 + 40) - *(void *)(a1 + 48));
    LOWORD(Sectors) = 12;
    return (__int16)Sectors;
  }
  CFNumberRef v11 = v10;
  unsigned int v12 = *(unsigned __int16 *)(a3 + 12);
  unsigned int v13 = *(unsigned __int16 *)(a3 + 6);
  LOWORD(v39) = 1;
  int v15 = *(_DWORD *)(a3 + 48);
  uint64_t v14 = *(unsigned int *)(a3 + 52);
  unint64_t v40 = 0;
  uint64_t v41 = v14;
  if (v15)
  {
    int v16 = 0;
    unsigned int v17 = 0;
    unint64_t v18 = v13 * (unint64_t)v12;
    int Sectors = 12;
    while (1)
    {
      unsigned int v20 = (v16 + 2) * *(unsigned __int16 *)(a3 + 80) / *(unsigned __int16 *)(a3 + 82);
      unsigned int v21 = *(_DWORD *)(a3 + 88);
      unsigned int v22 = v20 / v21;
      uint64_t v23 = v20 % v21;
      if (!v16 || !v23)
      {
        unint64_t v24 = v21 / *(unsigned __int16 *)(a3 + 8);
        uint64_t v25 = *(unsigned int *)(a3 + 28);
        unint64_t v26 = v25 - v22 * (unint64_t)v24;
        if (v26 >= v24) {
          unint64_t v26 = v24;
        }
        int Sectors = MKMediaReadSectors(a4, (*(unsigned __int16 *)(a3 + 14)+ v25 * *(unsigned __int16 *)(a3 + 84)+ v22 * (unint64_t)v24)* *(unsigned __int16 *)(a3 + 6), v26 * *(unsigned __int16 *)(a3 + 6), v11, 0);
        if (Sectors) {
          break;
        }
      }
      int v27 = *(_DWORD *)(a3 + 76);
      if (v27 == 0xFFFFFFF) {
        unsigned int v28 = *(_DWORD *)&v11[v23];
      }
      else {
        unsigned int v28 = *(unsigned __int16 *)&v11[v23];
      }
      if (v27 == 4095 && (v16 & 1) != 0) {
        v28 >>= 4;
      }
      int v30 = (v28 & v27) != 0;
      int v31 = (unsigned __int16)v39;
      uint64_t v14 = v41;
      if ((unsigned __int16)v39 != v30)
      {
        if (v41)
        {
          if (!(_WORD)v39) {
            *(void *)(a1 + 48) += v41;
          }
          if ((a2 & 3) != 0 && ((v31 + 1) & a2) != 0)
          {
            int Sectors = a5(a6, 1, &v39);
            uint64_t v14 = v41;
            if (Sectors) {
              goto LABEL_33;
            }
            int v31 = (unsigned __int16)v39;
          }
          unint64_t v32 = v40 + v14;
          unint64_t v40 = v32;
          if (v31 == 1 && v32 > v17) {
            unsigned int v17 = v32;
          }
        }
        uint64_t v14 = 0;
        LOWORD(v39) = v30;
      }
      v14 += v18;
      uint64_t v41 = v14;
      if (++v16 >= *(_DWORD *)(a3 + 48)) {
        goto LABEL_33;
      }
    }
    if (!v41) {
      goto LABEL_43;
    }
  }
  else
  {
    unsigned int v17 = 0;
    int Sectors = 12;
LABEL_33:
    if (!v14) {
      goto LABEL_43;
    }
  }
  if ((((unsigned __int16)v39 + 1) & a2) != 0) {
    int Sectors = a5(a6, 1, &v39);
  }
  if (Sectors)
  {
    unint64_t v33 = *(void *)(a1 + 56);
    goto LABEL_44;
  }
  unint64_t v34 = v40 + v41;
  unint64_t v40 = v34;
  uint64_t v41 = 0;
  if (v34 <= v17) {
    LODWORD(v34) = v17;
  }
  int Sectors = 0;
  if ((unsigned __int16)v39 == 1) {
    unsigned int v17 = v34;
  }
LABEL_43:
  unint64_t v33 = v17;
  *(void *)(a1 + 56) = v17;
LABEL_44:
  *(_DWORD *)(a1 + 72) = v33 / (*(void *)(a1 + 40) - *(void *)(a1 + 48));
  free(v11);
  if (Sectors == -1) {
    int Sectors = *__error();
  }
  return (__int16)Sectors;
}

uint64_t MKRecordFATFSRuns(uint64_t a1, int a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(v23, 0, sizeof(v23));
  long long v27 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  MKMediaGetGeometry(a1, (uint64_t)v23);
  uint64_t v8 = _MKFATFSReadBPB(a1, (uint64_t)&v29);
  if (!v8)
  {
    if (a2 < 0)
    {
      CFStringRef v10 = (FILE *)*MEMORY[0x263EF8348];
      CFNumberRef v11 = (char *)malloc_type_malloc(0x400uLL, 0x7F18E33FuLL);
      if (v11)
      {
        unsigned int v12 = v11;
        int FileDescriptor = MKMediaGetFileDescriptor(a1);
        if (fcntl(FileDescriptor, 50, v12) != -1)
        {
          uint64_t v14 = "s";
          int v15 = v32 * WORD6(v29);
          if (v15 == 1) {
            int v16 = (const char *)&unk_21E15F94E;
          }
          else {
            int v16 = "s";
          }
          if (v32 == 1) {
            uint64_t v14 = (const char *)&unk_21E15F94E;
          }
          fprintf(v10, "%s: %u sector%s in %u FAT%u cluster%s (%u bytes/cluster)\n", v12, v15, v16, v32, dword_21E15F5A0[v29], v14, WORD4(v29) * WORD6(v29));
          fprintf(v10, "bps=%u spc=%u res=%u nft=%u", WORD4(v29), WORD6(v29), HIWORD(v29), (unsigned __int16)v30);
          if (WORD1(v30)) {
            fprintf(v10, " rde=%u", WORD1(v30));
          }
          if ((v29 - 1) >= 2)
          {
            if (v29 == 3)
            {
              fprintf(v10, " mid=%#x", WORD4(v30));
              fprintf(v10, " spt=%u hds=%u hid=%u", (unsigned __int16)v31, WORD1(v31), WORD2(v31));
              fprintf(v10, " bsec=%u bspf=%u rdcl=%u", DWORD1(v30) / WORD3(v29), HIDWORD(v30), WORD3(v31));
              fwrite(" infs=", 6uLL, 1uLL, v10);
              if (WORD4(v31) == 0xFFFFLL) {
                fprintf(v10, "%#x");
              }
              else {
                fprintf(v10, "%u");
              }
              fwrite(" bkbs=", 6uLL, 1uLL, v10);
              if (WORD5(v31) == 0xFFFFLL) {
                unsigned int v17 = "%#x";
              }
              else {
                unsigned int v17 = "%u";
              }
              fprintf(v10, v17, WORD5(v31), v21, v22);
            }
          }
          else
          {
            fprintf(v10, " sec=%u mid=%#x spf=%u", DWORD1(v30) / WORD3(v29), WORD4(v30), HIDWORD(v30));
            fprintf(v10, " spt=%u hds=%u hid=%u");
          }
          printf("\nvl=\"%s\"\n", (const char *)&v34 + 12);
        }
        free(v12);
      }
    }
    LOWORD(v24) = 3;
    WORD1(v24) = v29;
    HIDWORD(v24) = WORD3(v29);
    LODWORD(v25) = LODWORD(v23[0]) >> 9;
    unint64_t v18 = *((void *)&v23[0] + 1);
    *((void *)&v25 + 1) = *((void *)&v23[0] + 1);
    *(void *)&long long v26 = *((void *)&v23[0] + 1);
    unint64_t v19 = ((unint64_t)v32 << (v33 - BYTE8(v33))) + DWORD1(v32);
    *((void *)&v26 + 1) = v19;
    *(void *)&long long v27 = DWORD2(v32);
    *((void *)&v27 + 1) = v19 - 1;
    if (BYTE12(v34))
    {
      uniconvert((char *)v28 + 12, 256, 0x8000100u, 0, (const UInt8 *)&v34 + 12, 12, 0x500u, 1u);
      unint64_t v18 = *((void *)&v25 + 1);
      unint64_t v19 = *((void *)&v26 + 1);
    }
    float v20 = (float)v18 / (float)v19;
    uint64_t v8 = 22;
    if (v20 <= 1000.0 && v20 >= 0.001)
    {
      uint64_t v8 = a3(a4, 0, 0);
      if (!v8)
      {
        if ((a2 & 0x40003) == 0 || (uint64_t v8 = FATSuperTidemark((uint64_t)&v24, a2, (uint64_t)&v29, a1, a3, a4), !v8)) {
          uint64_t v8 = a3(a4, 3, (uint64_t *)&v24);
        }
        a3(a4, 4, 0);
      }
    }
  }
  return v8;
}

CFMutableDictionaryRef MKCFCreateFATFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  int v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    *int v6 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(v7 + 8) = Mutable;
    int v9 = MKRecordFATFSRuns(a1, *(_DWORD *)v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v9) {
      BOOL v10 = Mutable == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      int v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  return Mutable;
}

CFTypeRef CopyDeviceTreeProperty(const __CFString *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/");
  if (!v2) {
    return 0;
  }
  io_object_t v3 = v2;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, a1, 0, 0);
  IOObjectRelease(v3);
  return CFProperty;
}

uint64_t DevEntryCopyRegistryProperty(char *bsdName, const __CFString *a2, void *a3)
{
  mach_port_t v5 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v6 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, bsdName);
  io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
  if (MatchingService)
  {
    io_object_t v8 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    IOObjectRelease(v8);
    uint64_t result = 0;
  }
  else
  {
    CFTypeRef CFProperty = 0;
    uint64_t result = 2;
  }
  *a3 = CFProperty;
  return result;
}

uint64_t DevEntryCopyPropertiesForChildMatchingClass(char *bsdName, const char *a2, void *a3)
{
  io_iterator_t iterator = 0;
  CFMutableDictionaryRef v13 = 0;
  mach_port_t v5 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v6 = IOBSDNameMatching(*MEMORY[0x263F0EC88], 0, bsdName);
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v6);
  if (MatchingService)
  {
    io_object_t v8 = MatchingService;
    uint64_t v9 = MEMORY[0x223C206F0](MatchingService, "IOService", &iterator);
    if (!v9)
    {
      io_object_t v10 = IOIteratorNext(iterator);
      if (v10)
      {
        io_object_t v11 = v10;
        while (!IOObjectConformsTo(v11, a2))
        {
          IOObjectRelease(v11);
          io_object_t v11 = IOIteratorNext(iterator);
          if (!v11) {
            goto LABEL_7;
          }
        }
        IORegistryEntryCreateCFProperties(v11, &v13, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        uint64_t v9 = 0;
      }
      else
      {
LABEL_7:
        uint64_t v9 = 22;
      }
    }
    IOObjectRelease(v8);
  }
  else
  {
    uint64_t v9 = 2;
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  *a3 = v13;
  return v9;
}

uint64_t MachineBoots9()
{
  CFDataRef v0 = (const __CFData *)CopyDeviceTreeProperty(@"compatible");
  BytePtr = (const char *)CFDataGetBytePtr(v0);
  LengtHandle h = CFDataGetLength(v0);
  if (Length < 1)
  {
LABEL_6:
    uint64_t v6 = 0;
  }
  else
  {
    CFIndex v3 = Length;
    LODWORD(v4) = 0;
    while (strcmp(BytePtr, "MacRISC") && strcmp(BytePtr, "MacRISC2"))
    {
      size_t v5 = strlen(BytePtr);
      BytePtr += v5 + 1;
      CFIndex v4 = (int)v5 + 1 + (int)v4;
      if (v4 >= v3) {
        goto LABEL_6;
      }
    }
    uint64_t v6 = 1;
  }
  CFRelease(v0);
  return v6;
}

uint64_t MKHFSResizeVolume(unint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v27 = 0;
  unint64_t valuePtr = 0;
  int v26 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  unsigned int v23 = 0;
  CFDictionaryRef v6 = (const __CFDictionary *)MKMediaCopyProperty((uint64_t)a2, @"Geometry");
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"Sector Count");
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  unsigned int v29 = -34;
  if (valuePtr >= a1)
  {
    unsigned int v29 = MKFileSystemDetect((uint64_t)a2, (int *)&v27 + 1, (int *)&v27, &v26);
    if (!v29)
    {
      unsigned int v29 = 22;
      if (v26 == 1)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionaryAddValue(Mutable, @"Record Tidemark", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionaryRef v9 = MKCFCreateHFSInfo(a2, Mutable, &v29);
        CFRelease(Mutable);
        if (v9)
        {
          CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Tidemark");
          CFNumberGetValue(v10, kCFNumberSInt64Type, &v25);
          ++v25;
          CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Volume block size");
          CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)&v24 + 4);
          switch((int)v27)
          {
            case 1:
              unsigned int v29 = -34;
              if (v25 + 2 <= a1)
              {
                unsigned int v13 = MKHFSStdResize(a1, (uint64_t)a2);
                goto LABEL_21;
              }
              break;
            case 2:
            case 4:
              unsigned int v29 = -34;
              unint64_t v12 = 2;
              if (HIDWORD(v24) >= 0x400) {
                unint64_t v12 = (unint64_t)HIDWORD(v24) >> 9;
              }
              if (v12 + v25 <= a1 && (unint64_t)HIDWORD(v24) >> 9 << 32 >= a1)
              {
                unsigned int v13 = MKHFSPlusResize(a1, a2);
                goto LABEL_21;
              }
              break;
            case 3:
              unsigned int v14 = HIDWORD(v24) >> 9;
              CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v9, @"Volume offset");
              CFNumberGetValue(v15, kCFNumberSInt32Type, &v24);
              CFDictionaryRef v16 = (const __CFDictionary *)CFDictionaryGetValue(v9, @"Container");
              CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v16, @"Volume block size");
              CFNumberGetValue(v17, kCFNumberSInt32Type, &v23);
              unsigned int v29 = -34;
              if (v14 <= 2) {
                uint64_t v18 = 2;
              }
              else {
                uint64_t v18 = v14;
              }
              unint64_t v19 = v25 - v24 + v18;
              unint64_t v20 = (unint64_t)v23 >> 9;
              if (v19 % v20) {
                uint64_t v21 = v19 / v20 + 1;
              }
              else {
                uint64_t v21 = v19 / v20;
              }
              if (v24 + v21 * v20 + 2 <= a1)
              {
                unsigned int v13 = MKHFSWrappedResize(a1, (uint64_t)a2, a3);
LABEL_21:
                unsigned int v29 = v13;
              }
              break;
            default:
              break;
          }
          CFRelease(v9);
        }
      }
    }
  }
  return v29;
}

uint64_t MKHFSStdResize(unint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t Sectors = MKMediaReadSectors(a2, 2uLL, 1uLL, (char *)v17, 0);
  if (!Sectors)
  {
    TAO_HFSMasterDirectoryBlock_BigToHost(v17);
    unsigned int v5 = (v22 - v18) << 12;
    if (v5 >= 0x10000) {
      unsigned int v5 = 0x10000;
    }
    unint64_t v6 = (unsigned __int16)((unint64_t)v21 >> 9);
    if (((v5 * v6) | 0x15) >= a1)
    {
      unint64_t v7 = a1 - 2;
      unint64_t v8 = (a1 - 2 - v22) / v6;
      if ((v8 & 7) != 0) {
        unsigned int v9 = ((unsigned __int16)v8 >> 3) + 1;
      }
      else {
        unsigned int v9 = (unsigned __int16)v8 >> 3;
      }
      size_t v10 = ((_WORD)v9 + (((v9 & 0x1FF) != 0) << 9)) & 0x7E00;
      CFNumberRef v11 = (char *)malloc_type_calloc(1uLL, v10, 0x37D4924EuLL);
      if (v11)
      {
        unint64_t v12 = v11;
        unsigned int v13 = v20;
        if ((unsigned __int16)v8 < v20) {
          unsigned int v13 = (unsigned __int16)v8;
        }
        unsigned int v14 = v13 >> 12;
        if ((v13 & 0xFFF) != 0) {
          unint64_t v15 = v14 + 1;
        }
        else {
          unint64_t v15 = v14;
        }
        uint64_t Sectors = MKMediaReadSectors(a2, v18, v15, v11, 0);
        if (!Sectors)
        {
          if (8 * v9 > (unsigned __int16)v8) {
            SetBits(v12, (unsigned __int16)v8, 8 * v9 - (unsigned __int16)v8, 0);
          }
          if ((v9 & 0x1FF) != 0) {
            bzero(&v12[v9], 512 - (v9 & 0x1FF));
          }
          v23 += v8 - v20;
          unsigned __int16 v20 = v8;
          if ((unsigned __int16)v8 < v19) {
            unsigned __int16 v19 = 0;
          }
          TAO_HFSMasterDirectoryBlock_BigToHost(v17);
          uint64_t Sectors = MKMediaWriteSectors(a2, 2uLL, 1uLL, (char *)v17, 0);
          if (!Sectors)
          {
            uint64_t Sectors = MKMediaWriteSectors(a2, v7, 1uLL, (char *)v17, 0);
            if (!Sectors)
            {
              TAO_HFSMasterDirectoryBlock_BigToHost(v17);
              uint64_t Sectors = MKMediaWriteSectors(a2, v18, v10, v12, 0);
              if (!Sectors) {
                uint64_t Sectors = MKMediaEraseSectors(a2, v10 + v18, v22 - (v10 + v18), 0);
              }
            }
          }
        }
        free(v12);
      }
      else
      {
        return 12;
      }
    }
    else
    {
      return 4294967262;
    }
  }
  return Sectors;
}

uint64_t MKHFSPlusResize(unint64_t a1, const void *a2)
{
  v52[21] = *MEMORY[0x263EF8340];
  unint64_t valuePtr = a1;
  memset(v52, 0, 160);
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  memset(v49, 0, sizeof(v49));
  memset(v48, 0, sizeof(v48));
  uint64_t v43 = 0;
  unint64_t v44 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v48, 0);
  if (!Sectors)
  {
    TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFNumberRef v6 = CFNumberCreate(v4, kCFNumberSInt64Type, &valuePtr);
    CFDictionaryAddValue(Mutable, @"volume sectors", v6);
    CFRelease(v6);
    if ((v48[1] & 0x2000) != 0)
    {
      unint64_t v44 = 0;
      CFNumberRef v7 = CFNumberCreate(v4, kCFNumberSInt64Type, &v44);
      CFDictionaryAddValue(Mutable, @"journal size", v7);
      CFRelease(v7);
    }
    CFNumberRef v8 = CFNumberCreate(v4, kCFNumberSInt32Type, &v48[10]);
    CFDictionaryAddValue(Mutable, @"block size", v8);
    CFRelease(v8);
    uint64_t Sectors = GetBTreeNodeSize((uint64_t)a2, v52, v48[10], (_DWORD *)&v43 + 1);
    if (!Sectors)
    {
      if (HIDWORD(v43))
      {
        CFNumberRef v9 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
        CFDictionaryAddValue(Mutable, @"attr node size", v9);
        CFRelease(v9);
      }
      uint64_t Sectors = GetBTreeNodeSize((uint64_t)a2, v51, v48[10], (_DWORD *)&v43 + 1);
      if (!Sectors)
      {
        CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
        CFDictionaryAddValue(Mutable, @"cat node size", v10);
        CFRelease(v10);
        uint64_t Sectors = GetBTreeNodeSize((uint64_t)a2, v50, v48[10], (_DWORD *)&v43 + 1);
        if (!Sectors)
        {
          CFNumberRef v11 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
          CFDictionaryAddValue(Mutable, @"ext node size", v11);
          CFRelease(v11);
          unint64_t v12 = TAOCopyHFSPlusParametersDict(Mutable, &v43);
          unsigned int v13 = v12;
          if (v43) {
            CFDictionaryRef v14 = 0;
          }
          else {
            CFDictionaryRef v14 = v12;
          }
          if (!v14)
          {
LABEL_28:
            unsigned int v29 = v48[11];
            unint64_t v30 = valuePtr / ((unint64_t)v48[10] >> 9);
            unsigned int v31 = v30 >> 3;
            if ((v30 & 7) != 0) {
              size_t v32 = v31 + 1;
            }
            else {
              size_t v32 = v31;
            }
            CFDictionaryRef v16 = (char *)malloc_type_calloc(1uLL, v32, 0x1435ADE7uLL);
            if (!v16)
            {
              uint64_t Sectors = 12;
              goto LABEL_56;
            }
            uint64_t Sectors = ReadWriteFileToFromBuffer(a2, v16, v32, (uint64_t)v49, v48[10] >> 9, 0);
            if (Sectors) {
              goto LABEL_56;
            }
            if (8 * (int)v32 > v30) {
              SetBits(v16, v30, 8 * v32 - v30, 0);
            }
            if (v29 < v30)
            {
              int v33 = 8 * LODWORD(v49[0]);
              if (8 * v49[0] >= (unint64_t)v30) {
                int v33 = v30;
              }
              SetBits(v16, v29, v33 - v29, 0);
            }
            v48[12] += v30 - v48[11];
            v48[11] = v30;
            if (v48[13] > v30) {
              v48[13] = 0;
            }
            if (v48[10] > 0x200u) {
              int v34 = 1;
            }
            else {
              int v34 = 2;
            }
            if (v29 < v30) {
              SetBits(v16, v29 - v34, 1u, 0);
            }
            SetBits(v16, v30 - v34, 1u, 1);
            if (v49[0] < v32)
            {
              uint64_t Sectors = GrowAllocFile((uint64_t)v48, v16, v30, a2);
              if (Sectors)
              {
LABEL_56:
                if (!v14) {
                  goto LABEL_58;
                }
                goto LABEL_57;
              }
            }
            if (!v14 || (v48[1] & 0x2000) == 0)
            {
LABEL_50:
              TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
              uint64_t Sectors = MKMediaWriteSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v48, 0);
              if (!Sectors)
              {
                uint64_t Sectors = MKMediaWriteSectors((uint64_t)a2, valuePtr - 2, 1uLL, (char *)v48, 0);
                if (!Sectors)
                {
                  TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
                  uint64_t Sectors = ReadWriteFileToFromBuffer(a2, v16, v32, (uint64_t)v49, v48[10] >> 9, 1);
                }
              }
              goto LABEL_56;
            }
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v14, @"journal size");
            if (Value)
            {
              CFNumberRef v37 = Value;
              CFTypeID v38 = CFGetTypeID(Value);
              if (v38 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v37, kCFNumberSInt64Type, &v44);
                uint64_t v39 = MKMediaReadSectors((uint64_t)a2, ((v48[10] >> 9) * v48[3]), 1uLL, v46, 0);
                if (v39)
                {
LABEL_64:
                  uint64_t Sectors = v39;
                  goto LABEL_57;
                }
                TAO_JournalInfoBlock_BigToHost((uint64_t)v46);
                if (v44 == v47) {
                  goto LABEL_50;
                }
                ChangeJournalSize((uint64_t)v48, v44, v16, v30, (uint64_t)v46);
                uint64_t v41 = v46;
                LODWORD(v42) = v48[10];
                unsigned int v40 = ApplyToHFSPlusCatalogRecords(a2, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))UpdateDotJournalFile, (uint64_t)&v41);
                if (v40) {
                  uint64_t Sectors = v40;
                }
                else {
                  uint64_t Sectors = 22;
                }
                if (Sectors == -128)
                {
                  TAO_JournalInfoBlock_BigToHost((uint64_t)v46);
                  uint64_t v39 = MKMediaWriteSectors((uint64_t)a2, ((v48[10] >> 9) * v48[3]), 1uLL, v46, 0);
                  if (!v39) {
                    goto LABEL_50;
                  }
                  goto LABEL_64;
                }
LABEL_57:
                CFRelease(v13);
LABEL_58:
                if (v16) {
                  free(v16);
                }
                return Sectors;
              }
            }
LABEL_54:
            uint64_t Sectors = 22;
            goto LABEL_57;
          }
          unint64_t v15 = (char *)CFDictionaryGetValue(v14, @"cat clump size");
          CFDictionaryRef v16 = v15;
          if (!v15) {
            goto LABEL_54;
          }
          CFTypeID v17 = CFGetTypeID(v15);
          if (v17 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v51[1]);
            unsigned __int16 v18 = (char *)CFDictionaryGetValue(v14, @"ext clump size");
            CFDictionaryRef v16 = v18;
            if (!v18) {
              goto LABEL_54;
            }
            CFTypeID v19 = CFGetTypeID(v18);
            if (v19 == CFNumberGetTypeID())
            {
              CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v50[1]);
              CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v14, @"attr clump size");
              if (v52[0])
              {
                CFNumberRef v21 = v20;
                if (v20)
                {
                  CFTypeID v22 = CFGetTypeID(v20);
                  if (v22 != CFNumberGetTypeID()) {
                    goto LABEL_53;
                  }
                  CFNumberGetValue(v21, kCFNumberSInt32Type, &v52[1]);
                }
              }
              __int16 v23 = (char *)CFDictionaryGetValue(v14, @"alloc clump size");
              CFDictionaryRef v16 = v23;
              if (!v23) {
                goto LABEL_54;
              }
              CFTypeID v24 = CFGetTypeID(v23);
              if (v24 == CFNumberGetTypeID())
              {
                CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v49[1]);
                uint64_t v25 = (char *)CFDictionaryGetValue(v14, @"data clump size");
                CFDictionaryRef v16 = v25;
                if (!v25) {
                  goto LABEL_54;
                }
                CFTypeID v26 = CFGetTypeID(v25);
                if (v26 == CFNumberGetTypeID())
                {
                  CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v48[15]);
                  uint64_t v27 = (char *)CFDictionaryGetValue(v14, @"resource clump size");
                  CFDictionaryRef v16 = v27;
                  if (!v27) {
                    goto LABEL_54;
                  }
                  CFTypeID v28 = CFGetTypeID(v27);
                  if (v28 == CFNumberGetTypeID())
                  {
                    CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v48[14]);
                    goto LABEL_28;
                  }
                }
              }
            }
          }
LABEL_53:
          CFDictionaryRef v16 = 0;
          goto LABEL_54;
        }
      }
    }
  }
  return Sectors;
}

uint64_t MKHFSWrappedResize(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned int v18 = 0;
  uint64_t Sectors = MKMediaReadSectors(a2, 2uLL, 1uLL, (char *)&v19, 0);
  if (!Sectors)
  {
    TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19);
    if ((WORD6(v20) - HIWORD(v19)) << 12 >= 0x10000) {
      int v7 = 0x10000;
    }
    else {
      int v7 = (WORD6(v20) - HIWORD(v19)) << 12;
    }
    unint64_t v8 = (unint64_t)DWORD1(v20) >> 9;
    if (WORD6(v20) + v7 * v8 + 2 >= a1)
    {
      unint64_t v9 = a1 - 2;
      unint64_t v10 = (a1 - 2 - WORD6(v20)) / v8;
      if ((v10 & 7) != 0) {
        size_t v11 = ((unsigned __int16)v10 >> 3) + 1;
      }
      else {
        size_t v11 = (unsigned __int16)v10 >> 3;
      }
      size_t v12 = ((_WORD)v11 + (((v11 & 0x1FF) != 0) << 9)) & 0x7E00;
      unsigned int v13 = malloc_type_malloc(v12, 0x8152B5EEuLL);
      if (v13)
      {
        CFDictionaryRef v14 = v13;
        memset(v13, 255, v11);
        if (8 * (int)v11 > (unsigned __int16)v10) {
          SetBits(v14, (unsigned __int16)v10, 8 * v11 - (unsigned __int16)v10, 0);
        }
        if ((v11 & 0x1FF) != 0) {
          bzero(&v14[v11], 512 - (v11 & 0x1FF));
        }
        LOWORD(v27) = v10 - WORD1(v20) + v27;
        WORD1(v20) = v10;
        if ((unsigned __int16)v10 < (unsigned __int16)v20) {
          LOWORD(v20) = 0;
        }
        TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19);
        uint64_t Sectors = MKMediaWriteSectors(a2, 2uLL, 1uLL, (char *)&v19, 0);
        if (Sectors
          || (uint64_t Sectors = MKMediaWriteSectors(a2, v9, 1uLL, (char *)&v19, 0), Sectors)
          || (TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19),
              uint64_t Sectors = MKMediaWriteSectors(a2, HIWORD(v19), v12, v14, 0),
              Sectors)
          || (uint64_t Sectors = MKMediaEraseSectors(a2, v12 + HIWORD(v19), WORD6(v20) - (v12 + HIWORD(v19)), 0),
              Sectors))
        {
          free(v14);
        }
        else
        {
          unint64_t v16 = (DWORD1(v20) >> 9) * (unsigned __int16)v27;
          CFTypeID v17 = (const void *)MKMediaCreateWithSubRange(*MEMORY[0x263EFFB08], a2, WORD6(v20) + (DWORD1(v20) >> 9) * HIWORD(v26), v16, &v18);
          uint64_t Sectors = v18;
          if (!v18) {
            uint64_t Sectors = MKHFSResizeVolume(v16, v17, a3);
          }
          free(v14);
          if (v17) {
            CFRelease(v17);
          }
        }
      }
      else
      {
        return 12;
      }
    }
    else
    {
      return 4294967262;
    }
  }
  return Sectors;
}

uint64_t MKHFSGetResizeLimits(uint64_t a1, const void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int Sectors = 22;
  if (a1)
  {
    int v31 = 0;
    uint64_t valuePtr = 0;
    uint64_t v30 = 0;
    unsigned int v28 = 0;
    unsigned int Sectors = MKFileSystemDetect((uint64_t)a2, &v31, (int *)&v30 + 1, &v30);
    if (!Sectors)
    {
      unsigned int Sectors = 22;
      if (v30 == 1)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionaryAddValue(Mutable, @"Record Tidemark", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionaryRef v5 = MKCFCreateHFSInfo(a2, Mutable, &Sectors);
        CFRelease(Mutable);
        if (v5)
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"Tidemark");
          CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
          ++valuePtr;
          int v7 = HIDWORD(v30);
          *(_DWORD *)(a1 + 28) = HIDWORD(v30);
          switch(v7)
          {
            case 1:
              unsigned int Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v36, 0);
              if (!Sectors)
              {
                TAO_HFSMasterDirectoryBlock_BigToHost(v36);
                unsigned int v14 = v39 >> 9;
                *(_DWORD *)(a1 + 24) = v39 >> 9;
                uint64_t v15 = v40;
                unsigned int v16 = (v40 - v37) << 12;
                if (v16 >= 0x10000) {
                  unsigned int v16 = 0x10000;
                }
                *(void *)a1 = v40 + v14 * v38 + 2;
                *(void *)(a1 + 8) = (v16 * v14) | 0x15;
                unint64_t v17 = v15 + valuePtr;
                goto LABEL_26;
              }
              break;
            case 2:
            case 4:
              unsigned int Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v33, 0);
              if (!Sectors)
              {
                TAO_HFSPlusVolumeHeader_BigToHost(v33);
                unsigned int v8 = v34;
                int v9 = v35;
                unint64_t v10 = (unint64_t)v34 >> 9;
                *(_DWORD *)(a1 + 24) = v10;
                *(void *)a1 = (v9 * v10);
                *(void *)(a1 + 8) = v10 << 32;
                BOOL v11 = v8 >= 0x400;
                uint64_t v12 = 2;
                if (v11) {
                  uint64_t v12 = v10;
                }
                unint64_t v13 = valuePtr + v12;
                goto LABEL_27;
              }
              break;
            case 3:
              unsigned int Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v36, 0);
              if (!Sectors)
              {
                TAO_HFSMasterDirectoryBlock_BigToHost(v36);
                CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v5, @"Volume offset");
                CFNumberGetValue(v18, kCFNumberSInt32Type, &v28);
                unsigned int Sectors = MKMediaReadSectors((uint64_t)a2, v28 + 2, 1uLL, (char *)v33, 0);
                if (!Sectors)
                {
                  TAO_HFSPlusVolumeHeader_BigToHost(v33);
                  unsigned int v19 = v34;
                  unsigned int v20 = v34 >> 9;
                  *(_DWORD *)(a1 + 24) = v34 >> 9;
                  uint64_t v21 = v40;
                  unint64_t v22 = (unint64_t)v39 >> 9;
                  unsigned int v23 = (v40 - v37) << 12;
                  if (v23 >= 0x10000) {
                    unsigned int v23 = 0x10000;
                  }
                  *(void *)a1 = v40 + 2 + v22 * v38;
                  *(void *)(a1 + 8) = v21 + 2 + v23 * v22;
                  if (v19 >= 0x400) {
                    uint64_t v24 = v20;
                  }
                  else {
                    uint64_t v24 = 2;
                  }
                  unint64_t v25 = valuePtr - v28 + v24;
                  if (v25 % v22) {
                    uint64_t v26 = v25 / v22 + 1;
                  }
                  else {
                    uint64_t v26 = v25 / v22;
                  }
                  unint64_t v17 = v21 + v26 * v22 + v22 * v41;
LABEL_26:
                  unint64_t v13 = v17 + 2;
LABEL_27:
                  *(void *)(a1 + 16) = v13;
                }
              }
              break;
            default:
              break;
          }
          CFRelease(v5);
        }
      }
    }
  }
  return Sectors;
}

unsigned char *SetBits(unsigned char *result, unsigned int a2, unsigned int a3, int a4)
{
  unsigned int v5 = a3;
  unsigned int v6 = a2;
  int v7 = result;
  if ((a2 & 7) != 0)
  {
    unsigned int v8 = 8 - (a2 & 7);
    int v9 = -1 << v8;
    if (v8 > a3) {
      int v10 = 8 - (a2 & 7);
    }
    else {
      int v10 = a3;
    }
    if (v8 > a3) {
      LOBYTE(v9) = (-1 << v8) & 0xFE | ~(-1 << (v8 - a3));
    }
    unint64_t v11 = (unint64_t)a2 >> 3;
    if (a4) {
      char v12 = result[v11] | ~(_BYTE)v9;
    }
    else {
      char v12 = result[v11] & v9;
    }
    result[v11] = v12;
    unsigned int v6 = v8 + a2;
    unsigned int v5 = v10 - v8;
  }
  unsigned int v13 = v5 - 8;
  if (v5 >= 8)
  {
    unsigned int v14 = &result[v6 >> 3];
    if (a4) {
      int v15 = -1;
    }
    else {
      int v15 = 0;
    }
    uint64_t result = memset(v14, v15, (v13 >> 3) + 1);
    v6 += (v13 & 0xFFFFFFF8) + 8;
    v5 &= 7u;
  }
  if (v5)
  {
    int v16 = -1 << (8 - v5);
    unint64_t v17 = (unint64_t)v6 >> 3;
    if (a4) {
      char v18 = v7[v17] | v16;
    }
    else {
      char v18 = v7[v17] & ~(_BYTE)v16;
    }
    v7[v17] = v18;
  }
  return result;
}

BOOL BitsClear(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if ((a2 & 7) != 0)
  {
    unsigned int v3 = 8 - (a2 & 7);
    int v4 = -1 << v3;
    if (v3 > a3) {
      int v5 = 8 - (a2 & 7);
    }
    else {
      int v5 = a3;
    }
    if (v3 > a3) {
      LOBYTE(v4) = (-1 << v3) & 0xFE | ~(-1 << (v3 - a3));
    }
    if ((*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) & (~(_BYTE)v4 | 0xFFFFFF00)) != 0) {
      return 0;
    }
    a2 += v3;
    a3 = v5 - v3;
  }
  if (a3 >= 8)
  {
    unsigned int v6 = (unsigned __int8 *)(a1 + (a2 >> 3));
    while (!*v6++)
    {
      a2 += 8;
      a3 -= 8;
      if (a3 <= 7) {
        return !a3 || !(*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) >> (8 - a3));
      }
    }
    return 0;
  }
  return !a3 || !(*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) >> (8 - a3));
}

uint64_t ScanForZeros(uint64_t a1, int a2, int a3)
{
  int v3 = (a2 & 0xFFFFFFE0) - a3;
  uint64_t v4 = 0;
  BOOL v9 = __CFADD__(v3, 1);
  unsigned int v5 = v3 + 1;
  if (!v9)
  {
    do
    {
      if ((v4 & 0x1F) == 0) {
        goto LABEL_51;
      }
      unsigned int v6 = bswap32(*(_DWORD *)(a1 + 4 * (v4 >> 5)));
      unsigned int v7 = 0x80000000 >> (v4 & 0x1F);
      BOOL v8 = v4 < v5;
      BOOL v9 = (v7 & v6) == 0 || v4 >= v5;
      if (v9)
      {
        unsigned int v7 = 1;
      }
      else
      {
        do
        {
          int v10 = v6 & (v7 >> 1);
          v7 >>= 1;
          uint64_t v4 = (v4 + 1);
          BOOL v8 = v4 < v5;
        }
        while (v10 && v4 < v5);
      }
      if (!v7 || !v8)
      {
LABEL_51:
        while (v4 < v5)
        {
          unsigned int v11 = *(_DWORD *)(a1 + 4 * (v4 >> 5));
          if (v11 != -1)
          {
            unsigned int v12 = bswap32(v11);
            if ((v12 & 0x80000000) != 0 && v4 < v5)
            {
              unsigned int v13 = 0x80000000;
              do
              {
                uint64_t v4 = (v4 + 1);
                if ((v12 & (v13 >> 1)) == 0) {
                  break;
                }
                v13 >>= 1;
              }
              while (v4 < v5);
            }
            break;
          }
          uint64_t v4 = (v4 + 32);
        }
        if (v4 >= v5) {
          break;
        }
      }
      unsigned int v14 = v4 + a3;
      uint64_t v15 = v4;
      char v16 = v4 & 0x1F;
      if ((v4 & 0x1F) == 0) {
        goto LABEL_36;
      }
      unsigned int v17 = bswap32(*(_DWORD *)(a1 + 4 * (v4 >> 5)));
      unsigned int v18 = 0x80000000 >> v16;
      uint64_t v15 = v4;
      if (((0x80000000 >> v16) & v17) != 0 || v4 >= v14)
      {
        if (v4 >= v14) {
          break;
        }
      }
      else
      {
        do
        {
          unsigned int v20 = v18;
          uint64_t v15 = (v15 + 1);
          if (v18 < 2) {
            break;
          }
          if ((v17 & (v18 >> 1)) != 0) {
            break;
          }
          v18 >>= 1;
        }
        while (v15 < v14);
        if (v15 >= v14) {
          break;
        }
        if (v20 < 2)
        {
LABEL_36:
          while (v15 < v14)
          {
            unsigned int v21 = *(_DWORD *)(a1 + 4 * (v15 >> 5));
            if (v21)
            {
              unsigned int v22 = bswap32(v21);
              if ((v22 & 0x80000000) == 0 && v15 < v14)
              {
                unsigned int v23 = 0x80000000;
                do
                {
                  uint64_t v15 = (v15 + 1);
                  if ((v22 & (v23 >> 1)) != 0) {
                    break;
                  }
                  v23 >>= 1;
                }
                while (v15 < v14);
              }
              break;
            }
            uint64_t v15 = (v15 + 32);
          }
          if (v15 >= v14) {
            break;
          }
        }
      }
      uint64_t v4 = v15;
    }
    while (v15 < v5);
  }
  if (v4 >= v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v4;
  }
}

uint64_t GetBTreeNodeSize(uint64_t a1, uint64_t *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a2;
  if (*a2)
  {
    uint64_t result = MKMediaReadSectors(a1, *((_DWORD *)a2 + 4) * (a3 >> 9), 1uLL, v7, 0);
    if (result) {
      return result;
    }
    TAO_BTHeaderRec_BigToHost(v8);
    LODWORD(v5) = v8[9];
  }
  uint64_t result = 0;
  *a4 = v5;
  return result;
}

uint64_t GrowAllocFile(uint64_t a1, unsigned char *a2, unsigned int a3, const void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int v8 = a3 >> 3;
  if ((a3 & 7) != 0) {
    ++v8;
  }
  unsigned int v9 = *(_DWORD *)(a1 + 40);
  unsigned int v10 = *(_DWORD *)(a1 + 120);
  if (v8 <= v10)
  {
    int v12 = *(_DWORD *)(a1 + 124);
    unsigned int v16 = v10 / v9 - v12;
  }
  else
  {
    int v11 = v8 / v9;
    if (v8 % v9) {
      ++v11;
    }
    int v12 = *(_DWORD *)(a1 + 124);
    unsigned int v13 = v11 - v12;
    unsigned int v14 = v10 / v9;
    int v15 = v13 / v14;
    if (v13 % v14) {
      ++v15;
    }
    unsigned int v16 = v15 * v14;
  }
  uint64_t v17 = 0;
  int v18 = 0;
  memset(v38, 0, sizeof(v38));
  uint64_t v36 = 0;
  unsigned __int16 v37 = 0;
  uint64_t v35 = 0;
  do
  {
    v18 += *(_DWORD *)(a1 + 132 + v17);
    if (v18 == v12)
    {
      int v20 = 0;
      unsigned int v21 = (_OWORD *)(a1 + 128);
      goto LABEL_19;
    }
    v17 += 8;
  }
  while (v17 != 64);
  LODWORD(v35) = 6;
  LODWORD(v36) = v12;
  unsigned __int16 v37 = v38;
  LODWORD(result) = ApplyToHFSPlusExtentRecords(a4, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))LastExtentFinder, (uint64_t)&v35);
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 22;
  }
  if (result == -128)
  {
    int v20 = v36;
    int v12 = *(_DWORD *)(a1 + 124);
    unsigned int v21 = v38;
LABEL_19:
    uint64_t v22 = 0;
    uint64_t v23 = 4;
    int v24 = v20;
    do
    {
      v24 += *(_DWORD *)((char *)v21 + v23);
      if (v24 == v12) {
        break;
      }
      ++v22;
      v23 += 8;
    }
    while (v22 != 8);
    unint64_t v25 = (char *)v21 + 8 * v22;
    int v27 = *((_DWORD *)v25 + 1);
    uint64_t v26 = v25 + 4;
    unsigned int v28 = v27 + *((_DWORD *)v21 + 2 * v22);
    if (BitsClear((uint64_t)a2, v28, v16))
    {
      SetBits(a2, v28, v16, 1);
      *v26 += v16;
      if (!v20) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v29 = 0;
      int v30 = v20;
      do
      {
        SetBits(a2, *(_DWORD *)((char *)v21 + v29), *(_DWORD *)((char *)v21 + v29 + 4), 0);
        v30 += *(_DWORD *)((char *)v21 + v29 + 4);
        int v31 = *(_DWORD *)(a1 + 124);
        if (v30 == v31) {
          break;
        }
        BOOL v32 = v29 == 56;
        v29 += 8;
      }
      while (!v32);
      unsigned int v33 = v31 - v20 + v16;
      unsigned int v34 = ScanForZeros((uint64_t)a2, a3, v33);
      if (v34 == -1) {
        return 4294967262;
      }
      unint64_t v21[2] = 0u;
      v21[3] = 0u;
      *unsigned int v21 = 0u;
      v21[1] = 0u;
      *(_DWORD *)unsigned int v21 = v34;
      *((_DWORD *)v21 + 1) = v33;
      SetBits(a2, v34, v33, 1);
      if (!v20)
      {
LABEL_35:
        uint64_t result = 0;
        *(_DWORD *)(a1 + 124) += v16;
        *(void *)(a1 + 112) += *(_DWORD *)(a1 + 40) * v16;
        *(_DWORD *)(a1 + 48) -= v16;
        return result;
      }
    }
    LODWORD(result) = ApplyToHFSPlusExtentRecords(a4, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))LastExtentWriter, (uint64_t)&v35);
    if (result) {
      uint64_t result = result;
    }
    else {
      uint64_t result = 22;
    }
    if (result == -128) {
      goto LABEL_35;
    }
  }
  return result;
}

unsigned char *ChangeJournalSize(uint64_t a1, unint64_t a2, unsigned char *a3, int a4, uint64_t a5)
{
  unint64_t v9 = *(void *)(a5 + 44);
  unint64_t v10 = *(unsigned int *)(a1 + 40);
  if (v9 % v10) {
    unsigned int v11 = v9 / v10 + 1;
  }
  else {
    unsigned int v11 = v9 / v10;
  }
  if (a2 % v10) {
    int v12 = a2 / v10 + 1;
  }
  else {
    int v12 = a2 / v10;
  }
  unint64_t v13 = *(void *)(a5 + 36);
  if (v13 % v10) {
    unsigned int v14 = v13 / v10 + 1;
  }
  else {
    unsigned int v14 = v13 / v10;
  }
  if (v9 <= a2)
  {
    if (BitsClear((uint64_t)a3, v14 + v11, v12 - v11))
    {
      *(void *)(a5 + 44) = a2;
      unsigned int v21 = a3;
      unsigned int v22 = v14 + v11;
      unsigned int v23 = v12 - v11;
    }
    else
    {
      SetBits(a3, v14, v11, 0);
      unsigned int v24 = ScanForZeros((uint64_t)a3, a4, v12);
      if (v24 == -1)
      {
        uint64_t result = SetBits(a3, v14, v11, 1);
        int v12 = v11;
        goto LABEL_18;
      }
      unsigned int v22 = v24;
      *(void *)(a5 + 36) = *(unsigned int *)(a1 + 40) * (unint64_t)v24;
      *(void *)(a5 + 44) = a2;
      unsigned int v21 = a3;
      unsigned int v23 = v12;
    }
    uint64_t result = SetBits(v21, v22, v23, 1);
LABEL_18:
    unsigned int v17 = v11 - v12;
    unsigned int v25 = *(_DWORD *)(a1 + 48);
    int v18 = (_DWORD *)(a1 + 48);
    unsigned int v15 = v25;
    goto LABEL_19;
  }
  *(void *)(a5 + 44) = a2;
  unsigned int v15 = v11 - v12;
  uint64_t result = SetBits(a3, v14 + v12, v15, 0);
  unsigned int v19 = *(_DWORD *)(a1 + 48);
  int v18 = (_DWORD *)(a1 + 48);
  unsigned int v17 = v19;
LABEL_19:
  _DWORD *v18 = v17 + v15;
  *(_DWORD *)a5 |= 4u;
  return result;
}

uint64_t UpdateDotJournalFile(uint64_t a1, uint64_t a2, unsigned int *a3, char *a4)
{
  if (*(_DWORD *)(a1 + 2) == 2 && *(_WORD *)a2 == 2)
  {
    CFStringRef v7 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UniChar *)(a1 + 8), *(unsigned __int16 *)(a1 + 6));
    uint64_t result = CFEqual(v7, @".journal");
    if (result)
    {
      *(void *)(a2 + 88) = *(void *)(*(void *)a3 + 44);
      *(_DWORD *)(a2 + 100) = *(void *)(*(void *)a3 + 44) / (unint64_t)a3[2];
      *(_DWORD *)(a2 + 104) = *(void *)(*(void *)a3 + 36) / (unint64_t)a3[2];
      *(_DWORD *)(a2 + 108) = *(void *)(*(void *)a3 + 44) / (unint64_t)a3[2];
      uint64_t result = 4294967168;
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
    uint64_t result = 0;
  }
  *a4 = v9;
  return result;
}

uint64_t ReadWriteFileToFromBuffer(const void *a1, char *a2, unint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  char v9 = a1;
  uint64_t v46 = *MEMORY[0x263EF8340];
  size_t v10 = *(unsigned int *)(a4 + 12);
  size_t v11 = a5 << 9;
  size_t v12 = a3 / v11;
  long long v13 = *(_OWORD *)(a4 + 32);
  v45[0] = *(_OWORD *)(a4 + 16);
  v45[1] = v13;
  long long v14 = *(_OWORD *)(a4 + 64);
  if (a3 / v11 >= v10) {
    LODWORD(v15) = v10;
  }
  else {
    size_t v15 = a3 / v11;
  }
  _OWORD v45[2] = *(_OWORD *)(a4 + 48);
  v45[3] = v14;
  if (!v15)
  {
    uint64_t v17 = 0;
    int v19 = 0;
    unsigned int v16 = 0;
LABEL_22:
    if (v12 >= v10 || (size_t v25 = a3 - v12 * v11) == 0)
    {
      int v27 = 0;
      if (!a6) {
        goto LABEL_65;
      }
      goto LABEL_36;
    }
    uint64_t v26 = malloc_type_calloc(1uLL, v11, 0x3DC9522DuLL);
    if (!v26) {
      return 12;
    }
    int v27 = v26;
    if (v19 == *((_DWORD *)v45 + 2 * v17 + 1))
    {
      if (++v17 == 8)
      {
        uint64_t v42 = 6;
        uint64_t v43 = v16;
        long long v44 = v45;
        unsigned int v28 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v42);
        uint64_t v17 = 0;
        uint64_t v23 = v28 ? v28 : 22;
        if (v23 != -128) {
          goto LABEL_67;
        }
      }
      int v19 = 0;
      char v9 = a1;
    }
    int v29 = *((_DWORD *)v45 + 2 * v17) + v19;
    if (a6)
    {
      memcpy(v27, a2, v25);
      uint64_t Sectors = MKMediaWriteSectors((uint64_t)v9, v29 * a5, a5, (char *)v27, 0);
      if (!Sectors)
      {
LABEL_64:
        ++v16;
        ++v19;
        char v9 = a1;
        if (!a6) {
          goto LABEL_65;
        }
LABEL_36:
        unsigned int v31 = *(_DWORD *)(a4 + 12);
        if (v16 < v31)
        {
          if (v19 == *((_DWORD *)v45 + 2 * v17 + 1))
          {
            if (++v17 == 8)
            {
              uint64_t v42 = 6;
              uint64_t v43 = v16;
              long long v44 = v45;
              unsigned int v32 = ApplyToHFSPlusExtentRecords(v9, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v42);
              if (v32) {
                uint64_t v23 = v32;
              }
              else {
                uint64_t v23 = 22;
              }
              if (v23 != -128) {
                goto LABEL_66;
              }
              uint64_t v17 = 0;
              unsigned int v31 = *(_DWORD *)(a4 + 12);
            }
            int v19 = 0;
          }
          if (v16 < v31)
          {
            while (1)
            {
              unsigned int v33 = v31 - v16;
              unsigned int v34 = *((_DWORD *)v45 + 2 * v17 + 1) - v19 >= v33 ? v33 : *((_DWORD *)v45 + 2 * v17 + 1) - v19;
              uint64_t v35 = MKMediaEraseSectors((uint64_t)a1, (*((_DWORD *)v45 + 2 * v17) + v19) * a5, v34 * a5, 0);
              if (v35) {
                break;
              }
              v16 += v34;
              unsigned int v31 = *(_DWORD *)(a4 + 12);
              if (v16 < v31 && ++v17 == 8)
              {
                uint64_t v42 = 6;
                uint64_t v43 = v16;
                long long v44 = v45;
                unsigned int v36 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v42);
                if (v36) {
                  uint64_t v23 = v36;
                }
                else {
                  uint64_t v23 = 22;
                }
                if (v23 != -128) {
                  goto LABEL_66;
                }
                uint64_t v17 = 0;
                unsigned int v31 = *(_DWORD *)(a4 + 12);
              }
              int v19 = 0;
              uint64_t v23 = 0;
              if (v16 >= v31) {
                goto LABEL_66;
              }
            }
            uint64_t v23 = v35;
LABEL_66:
            if (!v27) {
              return v23;
            }
LABEL_67:
            free(v27);
            return v23;
          }
        }
LABEL_65:
        uint64_t v23 = 0;
        goto LABEL_66;
      }
    }
    else
    {
      uint64_t Sectors = MKMediaReadSectors((uint64_t)v9, v29 * a5, a5, (char *)v27, 0);
      if (!Sectors)
      {
        memcpy(a2, v27, v25);
        goto LABEL_64;
      }
    }
    uint64_t v23 = Sectors;
    goto LABEL_67;
  }
  size_t v38 = a3 / v11;
  unint64_t v39 = a3;
  unsigned int v16 = 0;
  uint64_t v17 = 0;
  int v18 = v45;
  while (1)
  {
    int v19 = *((_DWORD *)v45 + 2 * v17 + 1) >= v15 - v16 ? v15 - v16 : *((_DWORD *)v45 + 2 * v17 + 1);
    unint64_t v20 = *v18 * a5;
    unint64_t v21 = v19 * a5;
    uint64_t v22 = a6 ? MKMediaWriteSectors((uint64_t)v9, v20, v21, a2, 0) : MKMediaReadSectors((uint64_t)v9, v20, v21, a2, 0);
    uint64_t v23 = v22;
    if (v22) {
      return v23;
    }
    a2 += (v11 * v19);
    v16 += v19;
    if (v16 >= v15)
    {
      char v9 = a1;
      size_t v10 = *(unsigned int *)(a4 + 12);
      size_t v12 = v38;
      a3 = v39;
      goto LABEL_22;
    }
    if (++v17 == 8)
    {
      uint64_t v42 = 6;
      uint64_t v43 = v16;
      long long v44 = v45;
      unsigned int v24 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v42);
      uint64_t v17 = 0;
      uint64_t v23 = v24 ? v24 : 22;
      if (v23 != -128) {
        return v23;
      }
    }
    int v18 = (_DWORD *)v45 + 2 * v17;
    char v9 = a1;
  }
}

uint64_t GetFileExtentRecord(uint64_t a1, long long *a2, uint64_t a3, unsigned char *a4)
{
  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && *(_DWORD *)(a3 + 8) == *(_DWORD *)(a1 + 8))
  {
    uint64_t v4 = *(_OWORD **)(a3 + 16);
    long long v5 = *a2;
    long long v6 = a2[1];
    long long v7 = a2[3];
    v4[2] = a2[2];
    v4[3] = v7;
    _OWORD *v4 = v5;
    v4[1] = v6;
    uint64_t result = 4294967168;
  }
  else
  {
    uint64_t result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t LastExtentFinder(uint64_t a1, long long *a2, uint64_t a3, unsigned char *a4)
{
  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3 && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4))
  {
    uint64_t v4 = 4;
    int v5 = *(_DWORD *)(a1 + 8);
    while (1)
    {
      v5 += *(_DWORD *)((char *)a2 + v4);
      if (v5 == *(_DWORD *)(a3 + 8)) {
        break;
      }
      v4 += 8;
      if (v4 == 68) {
        goto LABEL_6;
      }
    }
    *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
    long long v7 = *(_OWORD **)(a3 + 16);
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[3];
    v7[2] = a2[2];
    v7[3] = v10;
    *long long v7 = v8;
    v7[1] = v9;
    uint64_t result = 4294967168;
  }
  else
  {
LABEL_6:
    uint64_t result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t LastExtentWriter(uint64_t a1, _OWORD *a2, uint64_t a3, unsigned char *a4)
{
  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a3 + 8))
  {
    uint64_t v4 = *(long long **)(a3 + 16);
    long long v5 = *v4;
    long long v6 = v4[1];
    long long v7 = v4[3];
    a2[2] = v4[2];
    a2[3] = v7;
    *a2 = v5;
    a2[1] = v6;
    uint64_t result = 4294967168;
  }
  else
  {
    uint64_t result = 0;
  }
  *a4 = 1;
  return result;
}

uint64_t MKReadHFSMDBVHB(uint64_t a1, int *a2, unsigned char *a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t result = 4294967246;
  if (!a1 || !a2) {
    return result;
  }
  *a2 = 0;
  size_t v11 = a3 ? a3 : v21;
  uint64_t result = MKMediaReadSectors(a1, 2uLL, 1uLL, v11, 0);
  if (result) {
    return result;
  }
  if (*(_WORD *)v11 != 17474)
  {
    unint64_t v15 = 0;
    unint64_t v17 = 0;
LABEL_18:
    unsigned int v18 = *(unsigned __int16 *)v11;
    if (*a2 == 3)
    {
      if (v18 != 11080) {
        return 4294967173;
      }
      goto LABEL_28;
    }
    unsigned int v19 = __rev16(v18);
    if (v19 == 18475)
    {
      int v20 = 2;
    }
    else
    {
      if (v19 != 18520)
      {
        if (!*a2) {
          return 4294967173;
        }
        goto LABEL_28;
      }
      int v20 = 4;
    }
    *a2 = v20;
LABEL_28:
    TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v11);
    if (*a2 != 3) {
      return 0;
    }
    if (a4) {
      *a4 = v15;
    }
    if (!a5) {
      return 0;
    }
    uint64_t result = 0;
    *a5 = v17;
    return result;
  }
  TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)v11);
  size_t v12 = v21;
  if (a3) {
    long long v13 = a3;
  }
  else {
    long long v13 = v21;
  }
  if (*((_WORD *)v13 + 62) != 18475)
  {
    uint64_t result = 0;
    *a2 = 1;
    return result;
  }
  *a2 = 3;
  if (a3) {
    size_t v12 = a3;
  }
  unint64_t v14 = (unint64_t)*((unsigned int *)v12 + 5) >> 9;
  unint64_t v15 = *((unsigned __int16 *)v12 + 14) + *((unsigned __int16 *)v12 + 63) * (unint64_t)v14;
  unsigned int v16 = *((unsigned __int16 *)v12 + 64);
  uint64_t result = MKMediaReadSectors(a1, v15 + 2, 1uLL, v11, 0);
  if (!result)
  {
    unint64_t v17 = v16 * (unint64_t)v14;
    goto LABEL_18;
  }
  return result;
}

uint64_t MKWriteHFSMDBVHB(uint64_t a1, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t result = 4294967246;
  if (a1 && __src)
  {
    memset(v13, 0, sizeof(v13));
    memcpy(__dst, __src, sizeof(__dst));
    MKMediaGetGeometry(a1, (uint64_t)v13);
    switch(__dst[0])
    {
      case 0x4858u:
        uint64_t v10 = *((void *)&v13[0] + 1);
        TAO_HFSPlusVolumeHeader_BigToHost(__dst);
        break;
      case 0x482Bu:
        uint64_t v11 = a5 + a4;
        if (a2 == 3) {
          unint64_t v12 = a4 + 2;
        }
        else {
          unint64_t v12 = 2;
        }
        if (a2 == 3) {
          uint64_t v10 = v11;
        }
        else {
          uint64_t v10 = *((void *)&v13[0] + 1);
        }
        TAO_HFSPlusVolumeHeader_BigToHost(__dst);
        goto LABEL_16;
      case 0x4244u:
        uint64_t v10 = *((void *)&v13[0] + 1);
        TAO_HFSMasterDirectoryBlock_BigToHost(__dst);
        break;
      default:
        return 4294967173;
    }
    unint64_t v12 = 2;
LABEL_16:
    uint64_t result = MKMediaWriteSectors(a1, v12, 1uLL, (char *)__dst, 0);
    if (!result) {
      return MKMediaWriteSectors(a1, v10 - 2, 1uLL, (char *)__dst, 0);
    }
  }
  return result;
}

uint64_t MKHFSReadFile(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, char *a6)
{
  return _MKHFSReadWriteFile(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t _MKHFSReadWriteFile(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, char *a6, int a7)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = *(unsigned int *)(a2 + 40);
  if (a4 % v13) {
    uint64_t v14 = a4 / v13 + 1;
  }
  else {
    uint64_t v14 = a4 / v13;
  }
  if (a5 % v13) {
    unint64_t v15 = a5 / v13 + 1;
  }
  else {
    unint64_t v15 = a5 / v13;
  }
  if (a7) {
    unsigned int v16 = MKMediaWriteBlocks;
  }
  else {
    unsigned int v16 = MKMediaReadBlocks;
  }
  LODWORD(result) = 22;
  uint64_t v18 = *(unsigned int *)(a2 + 40);
  do
  {
    uint64_t v19 = v14 - v12;
    if (v14 < v12) {
      goto LABEL_18;
    }
    uint64_t v20 = *(unsigned int *)(a3 + v11 + 20);
    if (v14 >= v12 + v20) {
      goto LABEL_18;
    }
    uint64_t v21 = v19 + *(unsigned int *)(a3 + v11 + 16);
    unint64_t v22 = v20 - v19;
    uint64_t v23 = v15 >= v22 ? v22 : v15;
    LODWORD(result) = v16(a1, v21, v23, v18, a6, 0);
    if (result) {
      break;
    }
    v14 += v23;
    v15 -= v23;
    uint64_t v18 = *(unsigned int *)(a2 + 40);
    a6 += v23 * v18;
LABEL_18:
    v12 += *(unsigned int *)(a3 + v11 + 20);
    v11 += 8;
  }
  while (v11 != 64);
  if (v15) {
    unsigned int v24 = 27;
  }
  else {
    unsigned int v24 = 0;
  }
  if (result) {
    return result;
  }
  else {
    return v24;
  }
}

uint64_t MKHFSWriteFile(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, char *a6)
{
  return _MKHFSReadWriteFile(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t MKDetectAPFS(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (*(_DWORD *)(a2 + 32) == 1112758350)
  {
    *a3 = 5000;
    if (a5) {
      *a5 = 2;
    }
  }
  return 0;
}

const char *MKAPFSIdentity()
{
  return "APFS";
}

uint64_t MKRecordAPFSRuns(uint64_t a1, int a2, uint64_t (*a3)(void, uint64_t, void *), uint64_t a4)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v38 = 0;
  memset(v37, 0, sizeof(v37));
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v36[0] = 0;
  v36[1] = a1;
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v33 = 0;
  unint64_t valuePtr = 0;
  double Geometry = MKMediaGetGeometry(a1, (uint64_t)v37);
  LODWORD(v38) = LODWORD(v37[0]) >> 9;
  LOWORD(v39) = 2;
  LODWORD(v40) = LODWORD(v37[0]) >> 9;
  *((void *)&v40 + 1) = *((void *)&v37[0] + 1);
  uint64_t v8 = ((uint64_t (*)(uint64_t, void, void, double))a3)(a4, 0, 0, Geometry);
  if (!v8)
  {
    CFDictionaryRef FreespaceInfo = (const __CFDictionary *)APFSContainerGetFreespaceInfo();
    if (!FreespaceInfo) {
      return 12;
    }
    CFDictionaryRef v10 = FreespaceInfo;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(FreespaceInfo, (const void *)*MEMORY[0x263F20AC0]);
    if (CFStringCompare(Value, @"APFS", 1uLL))
    {
      uint64_t v8 = 4294961996;
    }
    else
    {
      CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F20AA0]);
      CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr);
      HIDWORD(v39) = valuePtr >> 9;
      CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F20AC8]);
      CFNumberGetValue(v13, kCFNumberSInt64Type, &v41);
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F20AD0]);
      CFNumberGetValue(v14, kCFNumberSInt64Type, (char *)&v42 + 8);
      *((void *)&v41 + 1) = v41;
      if (HIDWORD(v39) >= 2)
      {
        *((void *)&v42 + 1) *= HIDWORD(v39);
        *(void *)&long long v41 = v41 * HIDWORD(v39);
        *((void *)&v41 + 1) = v41;
      }
      CFArrayRef v15 = (const __CFArray *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F20AB8]);
      if (v15)
      {
        LOWORD(v34) = 0;
        LOWORD(v31) = 1;
        if ((a2 & 3) != 0)
        {
          CFArrayRef v16 = v15;
          uint64_t Count = (unsigned __int16)CFArrayGetCount(v15);
          if (Count)
          {
            CFIndex v17 = 0;
            key = (void *)*MEMORY[0x263F20AA8];
            uint64_t v18 = (const void *)*MEMORY[0x263F20AB0];
            do
            {
              CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v17);
              if (!ValueAtIndex) {
                break;
              }
              CFDictionaryRef v20 = ValueAtIndex;
              CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, key);
              CFNumberGetValue(v21, kCFNumberSInt64Type, &v35);
              CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(v20, v18);
              CFNumberGetValue(v22, kCFNumberSInt64Type, v36);
              if (HIDWORD(v39) >= 2)
              {
                v35 *= HIDWORD(v39);
                v36[0] *= HIDWORD(v39);
              }
              if ((((unsigned __int16)v31 + 1) & a2) != 0)
              {
                uint64_t v33 = v35 - v32;
                if (v35 != v32)
                {
                  uint64_t v23 = a3(a4, 1, &v31);
                  if (v23) {
                    goto LABEL_29;
                  }
                  unint64_t v24 = v32 + v33;
                  unint64_t v32 = v24;
                  if (v24 > *((void *)&v42 + 1)) {
                    *((void *)&v42 + 1) = v24;
                  }
                }
              }
              if ((((unsigned __int16)v34 + 1) & a2) != 0)
              {
                uint64_t v23 = a3(a4, 1, &v34);
                if (v23) {
                  goto LABEL_29;
                }
              }
              *(void *)&long long v42 = v42 + v36[0];
              unint64_t v32 = v35 + v36[0];
              ++v17;
            }
            while (Count != v17);
            int v25 = (unsigned __int16)v31 + 1;
          }
          else
          {
            int v25 = 2;
          }
          if ((v25 & a2) != 0)
          {
            uint64_t v33 = v41 - v32;
            if ((void)v41 != v32)
            {
              uint64_t v8 = a3(a4, 1, &v31);
              if (v8) {
                goto LABEL_30;
              }
              unint64_t v27 = v32 + v33;
              unint64_t v32 = v27;
              if (v27 > *((void *)&v42 + 1)) {
                *((void *)&v42 + 1) = v27;
              }
            }
          }
        }
        DWORD2(v43) = *((void *)&v42 + 1) / (*((void *)&v41 + 1) - (void)v42);
        uint64_t v23 = a3(a4, 3, &v39);
LABEL_29:
        uint64_t v8 = v23;
        goto LABEL_30;
      }
      uint64_t v8 = 2;
    }
LABEL_30:
    CFRelease(v10);
  }
  if (v8 == -1) {
    return *__error();
  }
  return v8;
}

uint64_t MKAPFS_IO(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v15 = 0;
  if (!a1) {
    return 22;
  }
  if (a2 != 1)
  {
    if (a2 != 2) {
      return 4294961996;
    }
    if (a3)
    {
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      MKMediaGetAttributes(*(void *)a1, (double *)&v15);
      long long v5 = (const void *)MKMediaCopyProperty(*(void *)a1, @"Writable");
      if (v5)
      {
        long long v6 = v5;
        int v7 = CFEqual(v5, (CFTypeRef)*MEMORY[0x263EFFB40]);
        CFRelease(v6);
      }
      else
      {
        int v7 = 0;
      }
      uint64_t result = 0;
      *(_DWORD *)a3 = *(_DWORD *)(a1 + 8);
      *(void *)(a3 + 8) = *(void *)(a1 + 16) / (unint64_t)*(unsigned int *)(a1 + 40);
      if (v15 & HIDWORD(v15)) {
        unsigned int v14 = 1;
      }
      else {
        unsigned int v14 = (v7 == 0) & ((v15 & HIDWORD(v15)) >> 4);
      }
      *(_DWORD *)(a3 + 20) = v7;
      *(_DWORD *)(a3 + 24) = v14;
      return result;
    }
    return 22;
  }
  if (!a3) {
    return 22;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  uint64_t v9 = *(void *)a3 / v8;
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(char **)(a3 + 16);
  uint64_t v12 = *(void *)(a3 + 8) / v8;
  return MKMediaReadBlocks(v10, v9, v12, v8, v11, 0);
}

CFMutableDictionaryRef MKCFCreateAPFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  long long v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    *long long v6 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(v7 + 8) = Mutable;
    int v9 = MKRecordAPFSRuns(a1, *(_DWORD *)v7, (uint64_t (*)(void, uint64_t, void *))MKCFRecordFSInfo, v7);
    if (v9) {
      BOOL v10 = Mutable == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      int v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  return Mutable;
}

uint64_t _MKMediaFileInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v14 = 0;
  if (!a1 || *(_DWORD *)a1 != 1296786550) {
    return 22;
  }
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    uint64_t v12 = *(const char **)(a1 + 8);
    if (v12)
    {
      int v13 = _MKMediaOpenFile(v12, theDict, (int *)&v14 + 1, (int *)&v14);
      if (v13 < 0) {
        return *__error();
      }
      *(_DWORD *)(a1 + 4) = v13;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"Writable");
    if (Value) {
      HIDWORD(v14) = CFEqual(Value, (CFTypeRef)*MEMORY[0x263EFFB40]);
    }
  }
  *(void *)(a1 + 8) = strdup("<unknown file>");
LABEL_8:
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 16) = Mutable;
  if (!Mutable) {
    return 12;
  }
  long long v6 = (const void *)*MEMORY[0x263EFFB40];
  uint64_t v7 = (const void *)*MEMORY[0x263EFFB38];
  if (HIDWORD(v14)) {
    uint64_t v8 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v8 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(Mutable, @"Writable", v8);
  if (v14) {
    int v9 = v6;
  }
  else {
    int v9 = v7;
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Shared Writer", v9);
  CFStringRef v10 = CFStringCreateWithCString(v4, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Path", v10);
  CFRelease(v10);
  return 0;
}

void _MKMediaFileDeinitialize(void *a1)
{
}

__CFDictionary *_MKMediaFileCopyProperties(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 16);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v2) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  long long v5 = MutableCopy;
  _MKMediaFileGetGeoProperties((_DWORD *)a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaDeviceSetProperty()
{
  return 0;
}

__CFDictionary *_MKMediaBlockDeviceCopyProperties(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 16);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v2) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  long long v5 = MutableCopy;
  _MKMediaBlockDeviceGetGeoProperties((_DWORD *)a1, MutableCopy);
  return v5;
}

__CFDictionary *_MKMediaSubRangeCopyProperties(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v2) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  long long v5 = MutableCopy;
  _MKMediaSubRangeGetGeoProperties(a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaSubRangeSetProperty()
{
  return 0;
}

CFStringRef _MKMediaSubRangeDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"<MKMediaRef>: [sub range of %@]", *(void *)(a1 + 8));
}

CFStringRef _MKMediaCFRuntimeCopyFormattingDesc(uint64_t a1, CFDictionaryRef formatOptions)
{
  CFAllocatorRef v4 = *(uint64_t (**)(void, CFDictionaryRef, void))(a1 + 64);
  if (!v4) {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], formatOptions, @"%s <%p>", "MKMedia", a1);
  }
  CFStringRef result = (CFStringRef)v4(*(void *)(a1 + 88), formatOptions, 0);
  if (!result) {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], formatOptions, @"%s <%p>", "MKMedia", a1);
  }
  return result;
}

uint64_t MKMediaCreateWithFileDescriptor(uint64_t a1, int a2, const __CFDictionary *a3, _DWORD *a4)
{
  if (a2 == -1)
  {
    uint64_t result = 0;
    int v10 = 22;
    goto LABEL_14;
  }
  memset(&v12, 0, sizeof(v12));
  if (fstat(a2, &v12))
  {
    uint64_t v8 = __error();
    uint64_t result = 0;
    int v10 = *v8;
    goto LABEL_14;
  }
  if ((v12.st_mode & 0xF000) == 0x8000)
  {
    uint64_t v11 = &kMKMediaFileVector;
  }
  else if (devname(v12.st_rdev, 0x6000u))
  {
    uint64_t v11 = &kMKMediaBlockDeviceVector;
  }
  else
  {
    uint64_t v11 = &kMKMediaCharDeviceVector;
  }
  uint64_t result = (uint64_t)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (!result)
  {
    int v10 = 12;
LABEL_14:
    int v13 = v10;
    if (!a4) {
      return result;
    }
    goto LABEL_15;
  }
  *(_DWORD *)uint64_t result = 1296786550;
  *(_DWORD *)(result + 4) = a2;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  int v13 = 0;
  uint64_t result = MKMediaCreate(a1, result, (uint64_t)v11, a3, &v13);
  if (a4) {
LABEL_15:
  }
    *a4 = v13;
  return result;
}

uint64_t MKMediaCopyProperties(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(result + 48))(*(void *)(result + 88));
  }
  return result;
}

uint64_t MKMediaSetProperty(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return (*(uint64_t (**)(void))(a1 + 56))(*(void *)(a1 + 88));
  }
  else {
    return 22;
  }
}

uint64_t _MKMediaBufferPoolGetBuffer(uint64_t a1)
{
  CFDictionaryRef v2 = (pthread_mutex_t *)(a1 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48))) {
    return 0;
  }
  while (!*(_DWORD *)(a1 + 116))
  {
    if (pthread_cond_wait((pthread_cond_t *)a1, v2)) {
      return 0;
    }
  }
  uint64_t v4 = *(unsigned int *)(a1 + 112);
  if ((int)v4 < 1)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    uint64_t v5 = 0;
    while (*(_DWORD *)(*(void *)(a1 + 136) + 4 * v5))
    {
      if (v4 == ++v5) {
        goto LABEL_12;
      }
    }
  }
  if (v5 == v4)
  {
LABEL_12:
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 128) + (*(_DWORD *)(a1 + 120) * v5);
    *(_DWORD *)(*(void *)(a1 + 136) + 4 * v5) = 1;
    --*(_DWORD *)(a1 + 116);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t _MKMediaBufferPoolReturnBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 48);
  uint64_t result = pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  if (!result)
  {
    *(_DWORD *)(*(void *)(a1 + 136) + (((a2 - *(void *)(a1 + 128)) / *(unsigned int *)(a1 + 120)) << 32 >> 30)) = 0;
    ++*(_DWORD *)(a1 + 116);
    pthread_mutex_unlock(v4);
    return pthread_cond_signal((pthread_cond_t *)a1);
  }
  return result;
}

uint64_t MKMediaGetFileDescriptor(uint64_t a1)
{
  if (a1 && (unsigned int v1 = *(_DWORD **)(a1 + 88)) != 0 && *v1 == 1296786550) {
    return v1[1];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

double MKMediaGetAttributes(uint64_t a1, double *a2)
{
  if (a1)
  {
    if (a2)
    {
      double result = *(double *)(a1 + 124);
      *a2 = result;
    }
  }
  return result;
}

uint64_t RankScheme(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

CFDictionaryRef CFArrayDictionarySearch(const __CFArray *a1, const void *a2, const __CFString *a3)
{
  return CFArrayDictionarySearchWithIndexOptions(a1, a2, a3, 0, 0);
}

uint64_t MKCFCreatePartitions(int a1, const __CFDictionary *a2, CFArrayRef theArray, __CFBundle *a4, const __CFDictionary *a5, const __CFDictionary *a6, unsigned int a7, const __CFDictionary *a8, uint64_t a9)
{
  switch(a1)
  {
    case 16:
      return GPTCFCreatePartitions(a2, theArray, a4, (uint64_t)a5, a6, a7, a8, a9);
    case 8:
      return MBRCFCreatePartitions(a2, theArray, a7, a8);
    case 1:
      return APMCFCreatePartitions(a2, theArray, a4, a5, (int)a6, a7, a8, a9, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
  }
  return 4294961989;
}

uint64_t MKCFRecordPartitions(uint64_t *a1, const __CFArray *a2)
{
  __int16 v4 = 0;
  int v2 = *(__int16 *)(*a1 + 514);
  if (v2 == 8) {
    return MBRCFRecordPartitions(a1, a2, 1, 0xFEu, &v4);
  }
  if (v2 == 1) {
    return APMCFRecordPartitions(a1, a2, 0xFEu, &v4);
  }
  return 22;
}

uint64_t MKCFSetPartitionGroupStatus(CFDictionaryRef theDict, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!theDict) {
    return 22;
  }
  uint64_t v26 = 0;
  uint64_t valuePtr = 0;
  do
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"Schemes");
    if (!Value) {
      return *__error();
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
  }
  while (!ValueAtIndex);
  CFArrayRef v10 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Sections");
  if (!v10) {
    return *__error();
  }
  CFDictionaryRef v11 = CFArrayDictionarySearchWithIndexOptions(v10, @"ID", @"MAP", 0, 0);
  if (!v11) {
    return *__error();
  }
  CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(v11, @"Partitions");
  if (!v12) {
    return *__error();
  }
  CFArrayRef v13 = v12;
  if (a4) {
    uint64_t v14 = a4;
  }
  else {
    uint64_t v14 = ~a3;
  }
  CFIndex Count = CFArrayGetCount(v12);
  if (Count >= 1)
  {
    CFIndex v16 = Count;
    CFIndex v17 = 0;
    while (1)
    {
      CFDictionaryRef v18 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v17);
      if (v18) {
        break;
      }
LABEL_23:
      if (v16 == ++v17) {
        return 0;
      }
    }
    CFDictionaryRef v19 = v18;
    CFDictionaryRef v20 = CFDictionaryGetValue(v18, @"GUID");
    CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(v19, @"Status");
    uint64_t v26 = 0;
    uint64_t valuePtr = 0;
    if (v21)
    {
      CFNumberGetValue(v21, kCFNumberSInt64Type, &valuePtr);
      uint64_t v22 = valuePtr & v14;
      uint64_t v26 = valuePtr & v14;
      if (!a2) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v22 = 0;
      if (!a2) {
        goto LABEL_20;
      }
    }
    int v23 = CFEqual(v20, a2);
    uint64_t v22 = v26;
    if (v23)
    {
      uint64_t v22 = v26 | a3;
      v26 |= a3;
    }
LABEL_20:
    if (v22 != valuePtr)
    {
      uint64_t result = (uint64_t)CFNumberCreate(0, kCFNumberSInt64Type, &v26);
      if (!result) {
        return result;
      }
      int v25 = (const void *)result;
      CFDictionarySetValue(v19, @"Status", (const void *)result);
      CFRelease(v25);
    }
    goto LABEL_23;
  }
  return 0;
}

__CFArray *MKCFCreateMapRuns(const void *a1, uint64_t a2, _DWORD *a3)
{
  int v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)__nel = 0u;
  long long v7 = 0u;
  int v19 = MKMediaSchemesDetect(__nel, a2, 0, a1);
  if (v19)
  {
    uint64_t result = 0;
  }
  else
  {
    qsort((char *)__nel + 4, LOWORD(__nel[0]), 0x30uLL, (int (__cdecl *)(const void *, const void *))RankScheme);
    switch(LODWORD(__nel[1]))
    {
      case 0x10:
        uint64_t result = GPTCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      case 8:
        uint64_t result = MBRCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      case 1:
        uint64_t result = APMCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      default:
        uint64_t result = 0;
        int v19 = -5307;
        break;
    }
  }
  *a3 = v19;
  return result;
}

uint64_t MKCFWriteMediaContent(uint64_t a1, CFDictionaryRef theDict, const __CFString *a3, unint64_t a4, size_t a5, char *a6)
{
  CFStringRef v9 = a3;
  unsigned int v33 = 0;
  unint64_t v31 = 0;
  unint64_t valuePtr = 0;
  long long v11 = 0uLL;
  memset(v30, 0, sizeof(v30));
  if (a3)
  {
    if (!theDict) {
      return 22;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"Schemes");
    if (!Value) {
      return 22;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
    if (!ValueAtIndex) {
      return 22;
    }
    CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"Sections");
    if (!v14) {
      return 22;
    }
    CFDictionaryRef v15 = CFArrayDictionarySearchWithIndexOptions(v14, @"ID", @"MAP", 0, 0);
    if (!v15) {
      return 22;
    }
    CFArrayRef v16 = (const __CFArray *)CFDictionaryGetValue(v15, @"Partitions");
    if (!v16) {
      return 22;
    }
    CFDictionaryRef v17 = CFArrayDictionarySearchWithIndexOptions(v16, @"GUID", v9, 0, 0);
    if (!v17) {
      return 4294961953;
    }
    CFDictionaryRef v18 = v17;
    MKMediaGetGeometry(a1, (uint64_t)v30);
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Offset");
    if (!v19) {
      return 22;
    }
    CFNumberGetValue(v19, kCFNumberSInt64Type, &valuePtr);
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v18, @"Size");
    if (!v20) {
      return 22;
    }
    CFNumberGetValue(v20, kCFNumberSInt64Type, &v31);
    a1 = MKMediaCreateWithSubRange(0, a1, valuePtr, v31, &v33);
    uint64_t v21 = v33;
    CFStringRef v9 = (const __CFString *)a1;
    long long v11 = 0uLL;
    if (v33) {
      goto LABEL_31;
    }
  }
  unint64_t v36 = 0;
  *(_OWORD *)size_t size = v11;
  long long v35 = v11;
  MKMediaGetGeometry(a1, (uint64_t)size);
  size_t v22 = LODWORD(size[0]);
  int v23 = (char *)malloc_type_calloc(1uLL, LODWORD(size[0]), 0xBA10234DuLL);
  if (!v23) {
    goto LABEL_30;
  }
  unint64_t v24 = v23;
  if (!a5)
  {
    free(v23);
    goto LABEL_30;
  }
  while (1)
  {
    size_t v25 = a4 % v22;
    if (!(a4 % v22)) {
      break;
    }
    uint64_t Blocks = MKMediaReadBlocks(a1, a4 / v22, 1, v22, v24, 0);
    if (Blocks
      || ((v27 = &v24[v25], a5 >= v22 - v25) ? (size_t v28 = v22 - v25) : (size_t v28 = a5),
          memcpy(v27, a6, v28),
          uint64_t Blocks = MKMediaWriteBlocks(a1, a4 / v22, 1, v22, v24, 0),
          Blocks))
    {
LABEL_28:
      uint64_t v21 = Blocks;
      goto LABEL_29;
    }
LABEL_24:
    a6 += v28;
    a4 += v28;
    a5 -= v28;
    if (!a5) {
      goto LABEL_25;
    }
  }
  if (a5 >= v22)
  {
    uint64_t Blocks = MKMediaWriteBlocks(a1, a4 / v22, a5 / v22, v22, a6, &v36);
    if (Blocks) {
      goto LABEL_28;
    }
    size_t v28 = v36 * v22;
    goto LABEL_24;
  }
  uint64_t v21 = MKMediaReadBlocks(a1, a4 / v22, 1, v22, v24, 0);
  if (!v21)
  {
    memcpy(v24, a6, a5);
    uint64_t v21 = MKMediaWriteBlocks(a1, a4 / v22, 1, v22, v24, 0);
    if (!v21)
    {
LABEL_25:
      free(v24);
      uint64_t v21 = 0;
      goto LABEL_31;
    }
  }
LABEL_29:
  free(v24);
  if (v21 == -1) {
LABEL_30:
  }
    uint64_t v21 = *__error();
LABEL_31:
  if (v9) {
    CFRelease(v9);
  }
  if (v21 == -1) {
    return *__error();
  }
  return v21;
}

uint64_t MKCFSetBootcode(CFDictionaryRef theDict, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (theDict)
  {
    while (1)
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"Schemes");
      if (!Value) {
        break;
      }
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
      if (ValueAtIndex)
      {
        CFDictionaryRef v10 = ValueAtIndex;
        CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ID");
        if (v11 && CFStringGetCString(v11, buffer, 32, 0))
        {
          if (PMSchemeSearchByDescriptor(buffer, 0) != 8) {
            return 4294967292;
          }
          uint64_t result = MBRCFSetBootcode(v10, a2, a3, a4);
          if (result == -1) {
            return *__error();
          }
          return result;
        }
        return 22;
      }
    }
  }
  return 22;
}

uint64_t MKReportMedia(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3, FILE *a4)
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  if (!a1) {
    return 22;
  }
  if (a4) {
    long long v7 = a4;
  }
  else {
    long long v7 = (FILE *)*MEMORY[0x263EF8358];
  }
  if (MKCFOptionBit(a2, @"Simple Report", 1))
  {
    int v8 = 0;
    LOWORD(v98) = 1;
LABEL_11:
    int v9 = v8 | MKCFOptionBit(a2, @"Show Ending Offset", 1);
    int v10 = MKCFOptionBit(a2, @"Show UUID", 2);
    int v11 = v9 | v10 | MKCFOptionBit(a2, @"Show Freespace", 4);
    HIDWORD(v98) = v11 | MKCFOptionBit(a2, @"Show Shims", 8);
    goto LABEL_12;
  }
  if (MKCFOptionBit(a2, @"Report Format #1", 1))
  {
    int v8 = 0;
    LOWORD(v98) = 2;
    goto LABEL_11;
  }
  if (MKCFOptionBit(a2, @"Report Format #2", 1))
  {
    LOWORD(v98) = 3;
    int v8 = 5;
    goto LABEL_11;
  }
LABEL_12:
  if (!a3) {
    return 22;
  }
  long long v100 = 0u;
  memset(v101, 0, sizeof(v101));
  CFDictionaryRef v12 = (const __CFDictionary *)MKMediaCopyProperties(a3);
  if (!v12) {
    return 22;
  }
  CFDictionaryRef v13 = v12;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v12, @"Geometry");
  if (Value)
  {
    CFDictionaryRef v15 = Value;
    CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Block Size");
    if (v16) {
      CFNumberGetValue(v16, kCFNumberSInt32Type, (char *)&v100 + 8);
    }
    CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v15, @"Sector Count");
    if (v17) {
      CFNumberGetValue(v17, kCFNumberSInt64Type, &v100);
    }
    CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v15, @"Maximum Transfer Sector Count");
    if (v18) {
      CFNumberGetValue(v18, kCFNumberSInt64Type, v101);
    }
  }
  int v19 = MKCFOptionBit(v13, @"Writable", 1);
  LODWORD(v101[1]) |= v19;
  CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(v13, @"Path");
  if (v20) {
    CFStringGetCString(v20, (char *)&v101[1] + 4, 64, 0);
  }
  CFRelease(v13);
  unint64_t v21 = DWORD2(v100);
  fputc(10, v7);
  scalenumstr((void)v100 << 9, v97);
  fprintf(v7, "MEDIA: \"%s\"; Size %s", (const char *)&v101[1] + 4, v97);
  if ((unsigned __int16)v98 > 1u)
  {
    fprintf(v7, " [%lld x %ld]", (unint64_t)v100 / (unsigned __int16)(v21 >> 9), DWORD2(v100));
    if ((v101[0] & 0xFFFFFFFFFFFEFFFFLL) != 0) {
      fprintf(v7, "; Max Transfer Blocks %lld");
    }
  }
  else
  {
    fprintf(v7, "; Blocksize %ld");
  }
  fputc(10, v7);
  buffer[0] = 0;
  CFArrayRef v24 = (const __CFArray *)CFDictionaryGetValue(a1, @"Schemes");
  if (!v24) {
    return 0;
  }
  CFArrayRef v25 = v24;
  uint64_t Count = (unsigned __int16)CFArrayGetCount(v24);
  if (!Count) {
    return 0;
  }
  CFIndex v26 = 0;
  int v27 = 0;
  uint64_t v87 = 0;
  CFArrayRef v81 = v25;
  while (1)
  {
    v102[0] = 0;
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v25, v26);
    if (!ValueAtIndex)
    {
      if (++v26 == Count) {
        goto LABEL_165;
      }
      goto LABEL_162;
    }
    CFDictionaryRef v29 = ValueAtIndex;
    CFStringRef v30 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ID");
    if (!v30) {
      goto LABEL_165;
    }
    CFStringGetCString(v30, buffer, 32, 0x600u);
    int v31 = PMSchemeSearchByDescriptor(buffer, &v87);
    CFStringRef v32 = (const __CFString *)CFDictionaryGetValue(v29, @"Name");
    if (!v32) {
      goto LABEL_165;
    }
    CFStringGetCString(v32, v102, 32, 0x600u);
    fprintf(v7, "SCHEME: %i %s", v27 + 1, buffer);
    if ((unsigned __int16)v98 >= 2u)
    {
      fprintf(v7, ", \"%s\" [%d]", v102, v31);
      unsigned int v33 = v87;
      if (v87)
      {
        if (strcasecmp(v87, v102)) {
          fprintf(v7, " **official name varies. \"%s\"", v33);
        }
      }
    }
    fputc(10, v7);
    LOWORD(v99) = v31;
    __int16 v92 = 0;
    int valuePtr = 0;
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    uint64_t v88 = 0;
    uint64_t v110 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v108, 0, sizeof(v108));
    memset(v107, 0, sizeof(v107));
    memset(out, 0, 38);
    CFArrayRef v34 = (const __CFArray *)CFDictionaryGetValue(v29, @"Sections");
    if (v34)
    {
      CFArrayRef v35 = v34;
      int v36 = CFArrayGetCount(v34);
      int v84 = v36;
      if (v36 >= 1)
      {
        CFIndex v37 = 0;
        memset(uu, 0, sizeof(uu));
        uint64_t v85 = v36;
        CFArrayRef v86 = v35;
        CFIndex v82 = v26;
        while (1)
        {
          CFDictionaryRef v38 = (const __CFDictionary *)CFArrayGetValueAtIndex(v35, v37);
          if (v38) {
            break;
          }
          uint64_t UUID = 0;
          ++v37;
          CFArrayRef v35 = v86;
LABEL_156:
          if (v37 == v85) {
            goto LABEL_161;
          }
        }
        CFDictionaryRef v39 = v38;
        if (CFDictionaryGetUUID(v38, @"GUID", uu)) {
          uuid_clear(uu);
        }
        else {
          uuid_unparse(uu, out);
        }
        CFStringRef v40 = (const __CFString *)CFDictionaryGetValue(v39, @"ID");
        if (v40) {
          CFStringGetCString(v40, (char *)v109, 40, 0x600u);
        }
        CFStringRef v41 = (const __CFString *)CFDictionaryGetValue(v39, @"Type");
        if (v41) {
          CFStringGetCString(v41, (char *)v107, 32, 0);
        }
        CFStringRef v42 = (const __CFString *)CFDictionaryGetValue(v39, @"Name");
        if (v42) {
          CFStringGetCString(v42, (char *)v108, 32, 0);
        }
        CFNumberRef v43 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Overhead");
        if (v43) {
          CFNumberGetValue(v43, kCFNumberSInt32Type, &valuePtr);
        }
        fprintf(v7, "SECTION: %i", ++v37);
        if (v84 != 1) {
          fprintf(v7, " of %i", v84);
        }
        fprintf(v7, " Type:'%s'", (const char *)v109);
        if (strcasecmp("MAP", (const char *)v109))
        {
          fprintf(v7, "; \"%s\"", (const char *)v109);
          if (LOBYTE(v107[0])) {
            fprintf(v7, ", Name:\"%s\"", (const char *)v108);
          }
          CFArrayRef v35 = v86;
          if (!strcasecmp("DDM", (const char *)v109)) {
            fwrite("\n[ Not implemented ]", 0x14uLL, 1uLL, v7);
          }
          uint64_t UUID = 0;
          goto LABEL_155;
        }
        __int16 v92 = 512;
        CFNumberRef v44 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Media Block Size");
        if (v44) {
          CFNumberGetValue(v44, kCFNumberSInt16Type, &v92);
        }
        CFNumberRef v45 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Media Offset");
        if (v45) {
          CFNumberGetValue(v45, kCFNumberSInt64Type, &v88);
        }
        CFNumberRef v46 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Media Block Count");
        if (v46) {
          CFNumberGetValue(v46, kCFNumberSInt64Type, &v89);
        }
        CFNumberRef v47 = (const __CFNumber *)CFDictionaryGetValue(v39, @"Section Block Count");
        if (v47) {
          CFNumberGetValue(v47, kCFNumberSInt64Type, &v90);
        }
        if (v89)
        {
          scalenumstr(v89 << 9, v105);
          fprintf(v7, "; Size %s [%lld x %d]", v105, v90, 512);
        }
        if ((unsigned __int16)v98 >= 2u)
        {
          fprintf(v7, "; Offset %lld Blocks (%lld", v88, v89);
          if (valuePtr) {
            fprintf(v7, " + %u", valuePtr);
          }
          fwrite(") x 512", 7uLL, 1uLL, v7);
          if ((unsigned __int16)v98 >= 2u && v92 != 512) {
            fprintf(v7, "; [Actual Blocksize %i]", v92);
          }
        }
        if ((v98 & 0x200000000) != 0) {
          fprintf(v7, "; UUID: %s\n", out);
        }
        fputc(10, v7);
        CFArrayRef v48 = (const __CFArray *)CFDictionaryGetValue(v39, @"Partitions");
        if (v48)
        {
          CFArrayRef v49 = v48;
          int v50 = CFArrayGetCount(v48);
          int v51 = v50;
          if (v50)
          {
            if ((unsigned __int16)v98 < 2u)
            {
              fprintf(v7, "ID Type                 Size   Name             (%d)\n", v50);
              long long v52 = "-- -------------------- ------ --------------------\n";
              size_t v53 = 52;
            }
            else
            {
              fwrite("ID Type                 Offset       Size         ", 0x32uLL, 1uLL, v7);
              if ((v98 & 0x100000000) != 0) {
                fwrite("End          ", 0xDuLL, 1uLL, v7);
              }
              fprintf(v7, "Name                      (%i)\n", v51);
              fwrite("-- -------------------- ------------ ------------", 0x31uLL, 1uLL, v7);
              if ((v98 & 0x100000000) != 0) {
                fwrite(" ------------", 0xDuLL, 1uLL, v7);
              }
              long long v52 = " -------------------- --------\n";
              size_t v53 = 31;
            }
            fwrite(v52, v53, 1uLL, v7);
            int v96 = 0;
            uint64_t v94 = 0;
            unint64_t v95 = 0;
            uint64_t v113 = 0;
            *(void *)uint64_t v112 = 0;
            int v93 = 0;
            unint64_t v54 = v88;
            if (v51 >= 1)
            {
              CFIndex v55 = 0;
              uint64_t v56 = v51;
              while (1)
              {
                LOBYTE(v116) = 0;
                v115[0] = 0;
                v114[0] = 0;
                int v96 = 0;
                uint64_t v94 = 0;
                unint64_t v95 = 0;
                int v93 = 0;
                CFDictionaryRef v57 = (const __CFDictionary *)CFArrayGetValueAtIndex(v49, v55);
                if (v57) {
                  break;
                }
                uint64_t UUID = 0xFFFFFFFFLL;
LABEL_141:
                if (v56 == ++v55) {
                  goto LABEL_144;
                }
              }
              CFDictionaryRef v58 = v57;
              CFNumberRef v59 = (const __CFNumber *)CFDictionaryGetValue(v57, @"Partition ID");
              if (v59) {
                CFNumberGetValue(v59, kCFNumberIntType, &v96);
              }
              CFStringRef v60 = (const __CFString *)CFDictionaryGetValue(v58, @"Type");
              if (v60)
              {
                CFStringRef v61 = v60;
                CFTypeID TypeID = CFStringGetTypeID();
                if (TypeID == CFGetTypeID(v61))
                {
                  CFStringGetCString(v61, v115, 64, 0x600u);
                  uint64_t UUID = MKTypeClassify((unsigned __int16)v99, v61, 0, &v93, 0, 0);
                  goto LABEL_102;
                }
                long long v116 = *(_OWORD *)"Bad type";
                long long v117 = unk_21E15F642;
                long long v118 = xmmword_21E15F652;
                long long v119 = unk_21E15F662;
                int v93 = 7;
                uint64_t UUID = 0xFFFFFFFFLL;
LABEL_105:
                CFStringRef v64 = (const __CFString *)CFDictionaryGetValue(v58, @"Name");
                if (v64)
                {
                  CFStringRef v65 = v64;
                  CFTypeID v66 = CFStringGetTypeID();
                  if (v66 == CFGetTypeID(v65))
                  {
                    CFStringGetCString(v65, (char *)&v116, 64, 0x600u);
                    goto LABEL_110;
                  }
                  long long v63 = "Bad name";
LABEL_109:
                  long long v67 = *((_OWORD *)v63 + 1);
                  long long v116 = *(_OWORD *)v63;
                  long long v117 = v67;
                  long long v68 = *((_OWORD *)v63 + 3);
                  long long v118 = *((_OWORD *)v63 + 2);
                  long long v119 = v68;
                }
LABEL_110:
                CFNumberRef v69 = (const __CFNumber *)CFDictionaryGetValue(v58, @"Offset");
                if (v69)
                {
                  CFNumberRef v70 = v69;
                  CFTypeID v71 = CFNumberGetTypeID();
                  if (v71 == CFGetTypeID(v70)) {
                    CFNumberGetValue(v70, kCFNumberSInt64Type, &v95);
                  }
                }
                CFNumberRef v72 = (const __CFNumber *)CFDictionaryGetValue(v58, @"Size");
                if (v72)
                {
                  CFNumberRef v73 = v72;
                  CFTypeID v74 = CFNumberGetTypeID();
                  if (v74 == CFGetTypeID(v73)) {
                    CFNumberGetValue(v73, kCFNumberSInt64Type, &v94);
                  }
                }
                uint64_t v75 = v95;
                if (v95 <= v54) {
                  unint64_t v76 = v54;
                }
                else {
                  unint64_t v76 = v95;
                }
                if ((unsigned __int16)v98 < 2u)
                {
                  int v78 = v96;
                  scalenumstr(v94 << 9, v111);
                  fprintf(v7, "%2i %-20.20s %6s", v78, v115, v111);
                  if ((_BYTE)v116 && strcasecmp("untitled", (const char *)&v116)) {
                    fprintf(v7, " %-20.20s");
                  }
                }
                else
                {
                  if ((v98 & 0x400000000) != 0
                    && (uint64_t)(v76 - v54) >= 1
                    && (v76 - v54 > 0x1F || (v98 & 0x800000000) != 0))
                  {
                    fprintf(v7, "   %-20s %12llu %12llu", "Free", v54, v76 - v54);
                    if ((v98 & 0x100000000) != 0) {
                      fprintf(v7, " %12llu", v76 - 1);
                    }
                    fputc(10, v7);
                    uint64_t v75 = v95;
                  }
                  fprintf(v7, "%2i %-20.20s %12llu %12llu", v96, v115, v75, v94);
                  if ((v98 & 0x100000000) != 0)
                  {
                    uint64_t v77 = v94 - 1;
                    if (!v94) {
                      uint64_t v77 = 0;
                    }
                    fprintf(v7, " %12llu", v77 + v95);
                  }
                  if ((_BYTE)v116 && strcasecmp("untitled", (const char *)&v116)) {
                    fprintf(v7, " %-20.20s", (const char *)&v116);
                  }
                  if ((v98 & 0x200000000) != 0)
                  {
                    uint64_t UUID = CFDictionaryGetUUID(v58, @"GUID", v112);
                    uuid_unparse(v112, v114);
                    if (!uuid_is_null(v112)) {
                      fprintf(v7, " %36s");
                    }
                  }
                }
                fputc(10, v7);
                unint64_t v54 = v94 + v95;
                goto LABEL_141;
              }
              uint64_t UUID = 0xFFFFFFFFLL;
LABEL_102:
              if (v93 != 3) {
                goto LABEL_105;
              }
              long long v63 = "Explicit Record";
              goto LABEL_109;
            }
            uint64_t UUID = 0;
LABEL_144:
            if ((unsigned __int16)v98 < 2u)
            {
              CFArrayRef v25 = v81;
              CFIndex v26 = v82;
            }
            else
            {
              CFArrayRef v25 = v81;
              CFIndex v26 = v82;
              if ((v98 & 0x400000000) != 0)
              {
                uint64_t v79 = v89 + v88;
                uint64_t v80 = v89 + v88 - v54;
                if (v80 >= 1 && ((unint64_t)v80 > 0xF || (v98 & 0x800000000) != 0))
                {
                  fprintf(v7, "   %-20s %12llu %12llu", "Free", v54, v89 + v88 - v54);
                  if ((v98 & 0x100000000) != 0) {
                    fprintf(v7, " %12llu", v79 - 1);
                  }
                  fputc(10, v7);
                }
              }
            }
          }
          else
          {
            uint64_t UUID = 0;
          }
        }
        else
        {
          uint64_t UUID = 22;
        }
        CFArrayRef v35 = v86;
LABEL_155:
        fputc(10, v7);
        goto LABEL_156;
      }
    }
    uint64_t UUID = 22;
LABEL_161:
    if (++v26 == Count) {
      break;
    }
LABEL_162:
    int v27 = v26;
  }
  if (UUID == -1)
  {
LABEL_165:
    uint64_t UUID = *__error();
    if (UUID == -1) {
      return *__error();
    }
  }
  return UUID;
}

char *scalenumstr(unint64_t a1, char *a2)
{
  if (a1 < 0x401)
  {
    uint64_t v4 = 0;
  }
  else
  {
    unsigned __int16 v3 = 0;
    do
    {
      if ((a1 & 0x3FF) <= 0x200) {
        a1 >>= 10;
      }
      else {
        a1 = (a1 >> 10) + 1;
      }
      v3 += 3;
    }
    while (a1 > 0x400);
    uint64_t v4 = v3 / 3u;
  }
  sprintf(a2, "%hd %s", a1, (const char *)*(&off_2644986B0 + v4));
  return a2;
}

uint64_t MKShowMedia(const __CFDictionary *a1, uint64_t a2, FILE *a3)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"Report Format #2", (const void *)*MEMORY[0x263EFFB40]);
  uint64_t v7 = MKReportMedia(a1, Mutable, a2, a3);
  CFRelease(Mutable);
  return v7;
}

uint64_t MKMediaCreateWithEmbeddedHFSPlus(uint64_t result, int *a2)
{
  int v8 = -50;
  if (result)
  {
    uint64_t v3 = result;
    int v7 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    int v4 = MKReadHFSMDBVHB(result, &v7, 0, &v6, &v5);
    uint64_t result = 0;
    int v8 = v4;
    if (!v4)
    {
      if (v7 == 3)
      {
        uint64_t result = MKMediaCreateWithSubRange(*MEMORY[0x263EFFB08], v3, v6, v5, &v8);
        if (result) {
          int v8 = 0;
        }
      }
      else
      {
        uint64_t result = 0;
        int v8 = -123;
      }
    }
  }
  if (a2) {
    *a2 = v8;
  }
  return result;
}

uint64_t MKStartupFileCreate(const void *a1, CFDictionaryRef theDict)
{
  v26[10] = *MEMORY[0x263EF8340];
  uint64_t valuePtr = -1;
  if (!theDict) {
    return 4294967246;
  }
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"Data");
  CFDataRef v5 = Value;
  if (Value)
  {
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 != CFDataGetTypeID()) {
      return 4294967246;
    }
  }
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Size");
  if (v7)
  {
    CFNumberRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 != CFNumberGetTypeID() || !CFNumberGetValue(v8, kCFNumberSInt64Type, &valuePtr)) {
      return 4294967246;
    }
  }
  int64_t v10 = valuePtr;
  if (v5)
  {
    LengtHandle h = CFDataGetLength(v5);
    if (v10 != -1)
    {
      if (v10 >= Length)
      {
        int64_t v10 = valuePtr;
        goto LABEL_15;
      }
      return 4294967246;
    }
    uint64_t valuePtr = Length;
    int64_t v10 = Length;
  }
  else if (valuePtr == -1)
  {
    return 4294967246;
  }
LABEL_15:
  int v23 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  uint64_t result = MKReadHFSMDBVHB((uint64_t)a1, &v23, __src, &v21, &v20);
  unsigned int v22 = result;
  if (result) {
    return result;
  }
  if (v23 == 4) {
    goto LABEL_19;
  }
  if (v23 != 3)
  {
    if (v23 != 2) {
      return 4294967173;
    }
LABEL_19:
    CFDictionaryRef v13 = CFRetain(a1);
    goto LABEL_20;
  }
  CFDictionaryRef v13 = (const void *)MKMediaCreateWithSubRange(*MEMORY[0x263EFFB08], (uint64_t)a1, v21, v20, &v22);
  uint64_t result = v22;
  if (!v22)
  {
LABEL_20:
    uint64_t result = HFSAllocateSpace(v13, (uint64_t)__src, (uint64_t)v26, v10);
    unsigned int v22 = result;
    if (!result)
    {
      uint64_t v14 = v10 / v25;
      if (v10 % v25) {
        ++v14;
      }
      unint64_t v15 = v14 * v25;
      if (!v15) {
        goto LABEL_27;
      }
      CFNumberRef v16 = malloc_type_calloc(v14 * v25, 1uLL, 0x100004077774924uLL);
      if (v5)
      {
        BytePtr = CFDataGetBytePtr(v5);
        size_t v18 = CFDataGetLength(v5);
        memcpy(v16, BytePtr, v18);
      }
      uint64_t result = MKHFSWriteFile((uint64_t)v13, (uint64_t)__src, (uint64_t)v26, 0, v15, (char *)v16);
      unsigned int v22 = result;
      if (!result)
      {
LABEL_27:
        uint64_t result = MKWriteHFSMDBVHB((uint64_t)v13, v23, __src, v21, v20);
        unsigned int v22 = result;
      }
    }
  }
  if (v13)
  {
    CFRelease(v13);
    return v22;
  }
  return result;
}

uint64_t MKBSDMountinfo(const char *a1, statfs **a2)
{
  CFTypeID v9 = 0;
  *a2 = 0;
  int v4 = getmntinfo(&v9, 2);
  if (v4 < 1)
  {
LABEL_5:
    int v7 = *__error();
  }
  else
  {
    CFDataRef v5 = v9;
    int v6 = v4 + 1;
    while (strcmp(v5->f_mntfromname, a1))
    {
      CFTypeID v9 = ++v5;
      if (--v6 <= 1) {
        goto LABEL_5;
      }
    }
    LOWORD(v7) = 0;
    *a2 = v5;
  }
  return (__int16)v7;
}

uint64_t MKBSDMountpoint(const char *a1, char *a2)
{
  CFDataRef v5 = 0;
  uint64_t v3 = MKBSDMountinfo(a1, &v5);
  if (v5) {
    strlcpy(a2, v5->f_mntfromname, 0x400uLL);
  }
  return v3;
}

uint64_t addentry32(const void **a1, const void *a2, size_t size, unsigned int a4, int a5)
{
  if (a1)
  {
    int v7 = size;
    int64_t v10 = (char *)*a1;
    uint64_t v11 = size;
    if (!v10)
    {
      int64_t v10 = (char *)malloc_type_calloc(1uLL, size, 0xE5CC5226uLL);
      *a1 = v10;
      if (!v10) {
        return *__error();
      }
    }
    size_t v12 = a5 & 0xFFFFFFFE;
    unsigned int v13 = *(_DWORD *)&v10[v11 - 4];
    if (v13 >= a4) {
      unsigned int v14 = a4;
    }
    else {
      unsigned int v14 = *(_DWORD *)&v10[v11 - 4];
    }
    unsigned int v15 = v7 + v14 * v12;
    int v16 = moveblockextended(a1, v15, v12, 0, v7 + v13 * v12);
    if ((_WORD)v16)
    {
      int v17 = v16 << 16;
      if (v16 << 16 == -65536) {
        return *__error();
      }
    }
    else
    {
      memmove((char *)*a1 + v15, a2, v12);
      int v17 = 0;
      *(_DWORD *)((char *)*a1 + v11 - 4) = v13 + 1;
    }
  }
  else
  {
    int v17 = 1441792;
  }
  return (v17 >> 16);
}

uint64_t delentry32(const void ***a1, unsigned int a2, unsigned int a3, int a4)
{
  if (a1)
  {
    int v6 = *a1;
    unsigned int v7 = *(_DWORD *)((char *)v6 + a2 - 4);
    if (v7 <= a3)
    {
      return -110;
    }
    else
    {
      __int16 v8 = moveblockextended(v6, a2 + (a4 & 0xFFFFFFFE) * a3, -(a4 & 0xFFFFFFFE), 0, a2 + v7 * (a4 & 0xFFFFFFFE));
      if (!v8)
      {
        __int16 v8 = 0;
        *(_DWORD *)((char *)*a1 + a2 - 4) = v7 - 1;
      }
    }
  }
  else
  {
    return 22;
  }
  return v8;
}

uint64_t ntfs_show_attr(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  puts("\nAttribute");
  printf("type            %8X\n", *(_DWORD *)a1);
  printf("record length   %8X\n", *(_DWORD *)(a1 + 4));
  uint64_t v3 = "non-resident";
  if (!v2) {
    uint64_t v3 = "resident";
  }
  printf("flags           %8X %12s\n", *(unsigned __int8 *)(a1 + 8), v3);
  if (*(unsigned char *)(a1 + 9))
  {
    printf("name %2i        %s\n", *(unsigned __int8 *)(a1 + 9), (const char *)(a1 + *(unsigned __int8 *)(a1 + 10)));
    printf("name length     %8X\n", *(unsigned __int8 *)(a1 + 9));
    printf("name offset     %8X\n", *(unsigned __int8 *)(a1 + 10));
  }
  if (*(unsigned char *)(a1 + 12)) {
    printf("compression     %8X\n", *(unsigned __int8 *)(a1 + 12));
  }
  if (*(_WORD *)(a1 + 14)) {
    printf("index           %8X\n", *(unsigned __int16 *)(a1 + 14));
  }
  if (v2)
  {
    printf("vcnstart        %8lli\n", *(void *)(a1 + 16));
    printf("vcnend          %8lli\n", *(void *)(a1 + 24));
    uint64_t result = printf("offset          %8i\n", *(unsigned __int16 *)(a1 + 32));
    if (*(_WORD *)(a1 + 34)) {
      uint64_t result = printf("cmpr algo       %8i\n", *(unsigned __int16 *)(a1 + 34));
    }
    if (*(_DWORD *)(a1 + 36)) {
      uint64_t result = printf("reserved        %8i\n", *(_DWORD *)(a1 + 36));
    }
    if (*(void *)(a1 + 40)) {
      uint64_t result = printf("allocated       %8lli\n", *(void *)(a1 + 40));
    }
    if (*(void *)(a1 + 48)) {
      uint64_t result = printf("length          %8lli\n", *(void *)(a1 + 48));
    }
    if (*(void *)(a1 + 56)) {
      return printf("initialized     %8lli\n");
    }
  }
  else
  {
    printf("length          %8i\n", *(unsigned __int16 *)(a1 + 16));
    if (*(_WORD *)(a1 + 18)) {
      printf("reserved        %8i\n", *(unsigned __int16 *)(a1 + 18));
    }
    uint64_t result = printf("offset          %8i\n", *(unsigned __int16 *)(a1 + 20));
    if (*(_WORD *)(a1 + 22)) {
      return printf("indexed         %8i\n");
    }
  }
  return result;
}

const char *MKNTFSIdentity()
{
  return "NTFS";
}

uint64_t MKDetectNTFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  *a3 = 0;
  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    *a3 = 1000;
    int v5 = *a2;
    if ((v5 == 233 || v5 == 235 && a2[2] == 144) && *(void *)(a2 + 3) == 0x202020205346544ELL)
    {
      *a3 = 5000;
      if (a5) {
        *a5 = 4;
      }
    }
  }
  return 0;
}

uint64_t MKRecordNTFSRuns()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  int v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))v3;
  int v6 = v5;
  uint64_t v7 = v0;
  uint64_t v72 = *MEMORY[0x263EF8340];
  CFIndex v55 = 0;
  uint64_t v56 = 0;
  unint64_t v54 = 0;
  memset(v53, 0, sizeof(v53));
  uint64_t v50 = 0;
  unint64_t v51 = 0;
  uint64_t v52 = 0;
  long long v60 = 0u;
  memset(v61, 0, 272);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  uint64_t Blocks = MKMediaReadBlocks(v0, 0, 1, 0x800u, v62, 0);
  uint64_t v9 = Blocks;
  if (!Blocks)
  {
    int v49 = 0;
    MKDetectNTFS(Blocks, (unsigned __int8 *)v62, &v49, 0, 0);
    if (v49 < 5000)
    {
      uint64_t v9 = 4294967173;
      goto LABEL_4;
    }
    MKMediaGetGeometry(v7, (uint64_t)v53);
    LOWORD(v57) = 4;
    LODWORD(v58) = LODWORD(v53[0]) >> 9;
    *((void *)&v58 + 1) = *((void *)&v53[0] + 1) * ((unint64_t)LODWORD(v53[0]) >> 9);
    *(void *)&long long v59 = *((void *)&v58 + 1);
    unsigned int v12 = v64;
    uint64_t v9 = 22;
    if ((unsigned __int16)(v64 + 0x7FFF) >= 0x81FFu && ((v64 - 1) & v64) == 0)
    {
      if (v65)
      {
        if (v65 <= 0x80u && ((v65 - 1) & v65) == 0)
        {
          unsigned int v13 = v65 * v64;
          if (v13 <= 0x10000)
          {
            uint64_t v14 = v65 / (v64 >> 9);
            unint64_t v15 = v67 / v65;
            HIDWORD(v57) = v64 >> 9;
            *((void *)&v59 + 1) = v15 * v14;
            if (v15 * v14 >= 0x40)
            {
              float v16 = (float)(*((void *)&v53[0] + 1) * ((unint64_t)LODWORD(v53[0]) >> 9)) / (float)(v15 * v14);
              if (v16 <= 1000.0 && v16 >= 0.001 && v68 <= v15 && v69 <= v15)
              {
                if (v70 < 0)
                {
                  if ((unsigned __int16)-v70 > 0xEu) {
                    goto LABEL_4;
                  }
                  unsigned int v17 = 1 << -v70;
                }
                else
                {
                  if (v70 > 0x40) {
                    goto LABEL_4;
                  }
                  unsigned int v17 = v13 * v70;
                }
                if ((v17 & (v17 - 1)) == 0)
                {
                  if (v71 < 0)
                  {
                    if ((unsigned __int16)-v71 > 0x10u) {
                      goto LABEL_4;
                    }
                    int v18 = 1 << -v71;
                  }
                  else
                  {
                    if (v71 > 0x40) {
                      goto LABEL_4;
                    }
                    int v18 = v13 * v71;
                  }
                  if ((v18 & (v18 - 1)) == 0)
                  {
                    unsigned int v19 = v17 / v64;
                    if (v17 % v64) {
                      LOWORD(v19) = v19 + 1;
                    }
                    uint64_t v20 = (unsigned __int16)v19;
                    int64_t v47 = v68 * v14;
                    uint64_t v9 = MKMediaReadBlocks(v7, v68 * v14 + 2 * v20 + (unsigned __int16)v19, v20, v64, v62, 0);
                    if (!v9)
                    {
                      unint64_t v45 = v17;
                      if (ntfs_fixup((uint64_t)v62, v17, v12))
                      {
LABEL_38:
                        uint64_t v9 = 22;
                        goto LABEL_4;
                      }
                      int v21 = v66;
                      unsigned int v22 = (unsigned __int8 *)&v62[(unsigned __int16)v17];
                      int v23 = &v22[-2 * (v63 & 0x7FFF)];
                      CFArrayRef v24 = (unsigned __int8 *)&v62[v66];
                      if (v24 < v23)
                      {
                        while (1)
                        {
                          if (*(_DWORD *)v24 == -1) {
                            goto LABEL_46;
                          }
                          if (*(_DWORD *)v24 == 96) {
                            break;
                          }
                          v21 += *((unsigned __int16 *)v24 + 2);
                          CFArrayRef v24 = (unsigned __int8 *)&v62[(unsigned __int16)v21];
                          if (v24 >= v23) {
                            goto LABEL_46;
                          }
                        }
                        unsigned int v25 = &v24[*((unsigned __int16 *)v24 + 10)];
                        uint64_t v26 = *((unsigned __int16 *)v24 + 8);
                        if (&v25[v26] > (const UInt8 *)&v72) {
                          goto LABEL_38;
                        }
                        uniconvert(&v61[3], 256, 0x8000100u, 0, v25, v26, 0x14000100u, 1u);
                      }
LABEL_46:
                      uint64_t v9 = MKMediaReadBlocks(v7, v47 + (6 * v20), v20, v12, v62, 0);
                      if (!v9)
                      {
                        if (ntfs_fixup((uint64_t)v62, v45, v12)) {
                          goto LABEL_38;
                        }
                        int v27 = v66;
                        size_t v28 = &v22[-2 * (v63 & 0x7FFF)];
                        CFDictionaryRef v29 = (unsigned __int8 *)&v62[v66];
                        if (v29 < v28)
                        {
                          uint64_t v9 = 2;
                          while (1)
                          {
                            if (*(_DWORD *)v29 == -1) {
                              goto LABEL_54;
                            }
                            if (*(_DWORD *)v29 == 128) {
                              break;
                            }
                            v27 += *((unsigned __int16 *)v29 + 2);
                            CFDictionaryRef v29 = (unsigned __int8 *)&v62[(unsigned __int16)v27];
                            if (v29 >= v28) {
                              goto LABEL_4;
                            }
                          }
                          uint64_t v30 = *((unsigned __int16 *)v29 + 16);
                          if (*((unsigned __int16 *)v29 + 2) <= v30) {
                            goto LABEL_38;
                          }
                          ntfs_runtovrun(&v55, &v54, &v56, &v29[v30]);
                          uint64_t v9 = v4(v2, 0, 0);
                          if (v9) {
                            goto LABEL_4;
                          }
                          CFNumberRef v46 = v55;
                          uint64_t v31 = *(void *)v55;
                          CFArrayRef v48 = (char *)malloc_type_malloc(0x2000uLL, 0x484A0BFDuLL);
                          if (!v48)
                          {
                            uint64_t v9 = 0xFFFFFFFFLL;
                            goto LABEL_4;
                          }
                          unint64_t v32 = *((void *)v29 + 6);
                          if ((v32 & 0x1FF) != 0) {
                            uint64_t v33 = ((v32 >> 9) & 0xFFFFFFFFFFFFFLL) + 1;
                          }
                          else {
                            uint64_t v33 = (v32 >> 9) & 0xFFFFFFFFFFFFFLL;
                          }
                          unint64_t v44 = v33;
                          if ((v6 & 0x40003) == 0) {
                            goto LABEL_92;
                          }
                          if (v33)
                          {
                            uint64_t v42 = v31 * v14;
                            unint64_t v43 = 0;
LABEL_64:
                            uint64_t v34 = MKMediaReadBlocks(v7, v43 + v42, 16, 0x200u, v48, 0);
                            if (v34)
                            {
LABEL_95:
                              uint64_t v9 = v34;
LABEL_85:
                              if (v52)
                              {
                                if ((((unsigned __int16)v50 + 1) & v6) != 0) {
                                  uint64_t v9 = v4(v2, 1, &v50);
                                }
                                if (v9)
                                {
LABEL_93:
                                  v4(v2, 4, 0);
                                  free(v48);
                                  int64_t v10 = v46;
                                  if (v46) {
                                    goto LABEL_5;
                                  }
                                  goto LABEL_6;
                                }
                                unint64_t v41 = v51 + v52;
                                v51 += v52;
                                uint64_t v52 = 0;
                                if ((unsigned __int16)v50 == 1 && v41 > *((void *)&v60 + 1)) {
                                  *((void *)&v60 + 1) = v41;
                                }
                              }
LABEL_92:
                              v61[2] = *((void *)&v60 + 1) / (*((void *)&v59 + 1) - (void)v60);
                              uint64_t v9 = v4(v2, 3, (uint64_t *)&v57);
                              goto LABEL_93;
                            }
                            uint64_t v35 = 0;
                            int v36 = (unsigned __int16)v50;
                            uint64_t v37 = v52;
LABEL_66:
                            uint64_t v38 = 0;
                            while (1)
                            {
                              uint64_t v39 = (*(void *)&v48[8 * v35] >> v38) & 1;
                              if (v39 != v36)
                              {
                                if (v37)
                                {
                                  if (!v36) {
                                    *(void *)&long long v60 = v60 + v37;
                                  }
                                  if (((v36 + 1) & v6) != 0)
                                  {
                                    uint64_t v34 = v4(v2, 1, &v50);
                                    if (v34) {
                                      goto LABEL_95;
                                    }
                                    uint64_t v37 = v52;
                                    int v36 = (unsigned __int16)v50;
                                  }
                                  unint64_t v40 = v51 + v37;
                                  unint64_t v51 = v40;
                                  uint64_t v52 = 0;
                                  if (v36 == 1 && v40 > *((void *)&v60 + 1)) {
                                    *((void *)&v60 + 1) = v40;
                                  }
                                }
                                uint64_t v37 = 0;
                                LOWORD(v50) = v39;
                                int v36 = v39;
                              }
                              if (v37 + v51 >= *((void *)&v59 + 1)) {
                                break;
                              }
                              v37 += v14;
                              uint64_t v52 = v37;
                              if (++v38 == 64)
                              {
                                if (++v35 != 1024) {
                                  goto LABEL_66;
                                }
                                uint64_t v9 = 0;
                                v43 += 16;
                                if (v44 > v43) {
                                  goto LABEL_64;
                                }
                                goto LABEL_85;
                              }
                            }
                          }
                          uint64_t v9 = 0;
                          goto LABEL_85;
                        }
LABEL_54:
                        uint64_t v9 = 2;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_4:
  v4(v2, 4, 0);
  int64_t v10 = v55;
  if (v55) {
LABEL_5:
  }
    free(v10);
LABEL_6:
  if (v54) {
    free(v54);
  }
  if (v9 == -1) {
    return *__error();
  }
  return v9;
}

uint64_t ntfs_fixup(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (*(_DWORD *)a1 == 1162627398)
  {
    unsigned int v3 = *(unsigned __int16 *)(a1 + 6);
    if ((v3 - 1) * a3 == a2)
    {
      unint64_t v4 = *(unsigned __int16 *)(a1 + 4);
      if (v4 >= a2)
      {
        printf("ntfs_fixup: invalid offset: %x");
      }
      else
      {
        if (v3 < 2) {
          return 0;
        }
        int v5 = (unsigned __int16 *)(a1 + v4);
        int v6 = *v5;
        uint64_t v7 = (_WORD *)(a1 + a3 - 2);
        uint64_t v8 = 1;
        while ((unsigned __int16)*v7 == v6)
        {
          *uint64_t v7 = v5[v8];
          uint64_t v7 = (_WORD *)((char *)v7 + a3);
          if (v3 == ++v8) {
            return 0;
          }
        }
        printf("ntfs_fixup: fixup %d doesn't match\n");
      }
    }
    else
    {
      printf("ntfs_fixup: bad fixups number: %d for %ld bytes block\n");
    }
  }
  else
  {
    printf("ntfs_fixup: magic doesn't match: %08x != %08x\n");
  }
  return 22;
}

void *ntfs_runtovrun(void *a1, void *a2, void *a3, unsigned char *a4)
{
  unsigned int v8 = *a4;
  if (*a4)
  {
    size_t v9 = 0;
    int v10 = 0;
    do
    {
      v10 += (v8 >> 4) + (v8 & 0xF) + 1;
      ++v9;
      unsigned int v8 = a4[v10];
    }
    while (a4[v10]);
  }
  else
  {
    size_t v9 = 0;
  }
  uint64_t v11 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  uint64_t result = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  unsigned int v13 = *a4;
  if (*a4)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    int v16 = 0;
    do
    {
      result[v15] = 0;
      if ((v13 & 0xF) != 0)
      {
        int v17 = 0;
        uint64_t v18 = 0;
        do
        {
          v18 += a4[++v16] << v17;
          result[v15] = v18;
          v17 += 8;
        }
        while (8 * (v13 & 0xF) != v17);
      }
      int v19 = v16 + 1;
      if (v13 >= 0x10)
      {
        unsigned int v21 = v13 >> 4;
        if ((char)a4[v16 + (v13 >> 4)] < 0)
        {
          uint64_t v27 = 0;
          uint64_t v23 = -1 << (8 * v21);
          if (v21 <= 1) {
            unsigned int v24 = 1;
          }
          else {
            unsigned int v24 = v21;
          }
          int v28 = v19;
          do
          {
            uint64_t v29 = a4[v28++];
            v23 |= v29 << v27;
            v27 += 8;
          }
          while (8 * v24 != v27);
        }
        else
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          if (v21 <= 1) {
            unsigned int v24 = 1;
          }
          else {
            unsigned int v24 = v21;
          }
          int v25 = v19;
          do
          {
            uint64_t v26 = a4[v25++];
            v23 |= v26 << v22;
            v22 += 8;
          }
          while (8 * v24 != v22);
        }
        v19 += v24;
        v14 += v23;
        if (v23) {
          uint64_t v20 = v14;
        }
        else {
          uint64_t v20 = 0;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      v11[v15++] = v20;
      unsigned int v13 = a4[v19];
      int v16 = v19;
    }
    while (a4[v19]);
  }
  else
  {
    uint64_t v15 = 0;
  }
  *a1 = v11;
  *a2 = result;
  *a3 = v15;
  return result;
}

CFMutableDictionaryRef MKCFCreateNTFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  int v5 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v5)
  {
    int v6 = v5;
    *int v5 = FSConvertOptions(a2);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v6[1] = Mutable;
    int v8 = MKRecordNTFSRuns();
    if (v8) {
      BOOL v9 = Mutable == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    free(v6);
    if (a3)
    {
      if (v8 != -1)
      {
LABEL_12:
        *a3 = v8;
        return Mutable;
      }
LABEL_11:
      int v8 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    CFMutableDictionaryRef Mutable = 0;
    if (a3) {
      goto LABEL_11;
    }
  }
  return Mutable;
}

uint64_t PMCategoryStr(char *a1, _WORD *a2)
{
  int v3 = APMDescriptorSearch(a1);
  __int16 v4 = v3;
  uint64_t result = APMCategorize(v3);
  if (a2) {
    *a2 = v4;
  }
  return result;
}

uint64_t VBIOO(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))a1)(*(void *)(a1 + 8), a2, a3, (*(_DWORD *)(a1 + 16) + a4));
}

unint64_t PMConvertBlocks64(unint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2)
  {
    if (a2 != a3) {
      return (a2 >> 9) * result / (a3 >> 9);
    }
  }
  return result;
}

_DWORD *PMConvertRecord(_DWORD *result, unsigned int a2, int a3, int a4, unsigned int a5)
{
  if (a4 != a5 && a4 && a5)
  {
    result[22] = result[22] & 0xFFBFFFFF | ((a5 == 1) << 22);
    unsigned int v5 = result[2] * a4;
    unsigned int v6 = result[3] * a4;
    if (a2 <= 3 && a3 == 4097)
    {
      int v7 = (v5 + v6 - 1) / a5;
      result[2] = 1;
      result[3] = v7;
LABEL_14:
      result[21] = v7;
      return result;
    }
    if (v5 % a5) {
      int v8 = v5 / a5 + 1;
    }
    else {
      int v8 = v5 / a5;
    }
    if (v6 % a5) {
      int v7 = v6 / a5 + 1;
    }
    else {
      int v7 = v6 / a5;
    }
    result[2] = v8;
    result[3] = v7;
    if (result[21]) {
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t PMSearchBlock(uint64_t *a1, int a2, __int16 *a3)
{
  if (a3) {
    *a3 = -1;
  }
  if (!a1) {
    return -109;
  }
  uint64_t v3 = *a1;
  if (!*a1)
  {
    __int16 v4 = -1;
    __int16 v5 = -50;
    if (!a3) {
      return v5;
    }
    goto LABEL_13;
  }
  if (!*(_WORD *)(v3 + 522))
  {
LABEL_9:
    __int16 v4 = -1;
    __int16 v5 = -5343;
    if (!a3) {
      return v5;
    }
    goto LABEL_13;
  }
  __int16 v4 = 0;
  while (*(_DWORD *)(v3 + 1072 * v4 + 536) != a2)
  {
    if (*(unsigned __int16 *)(v3 + 522) <= ++v4) {
      goto LABEL_9;
    }
  }
  __int16 v5 = 0;
  if (a3) {
LABEL_13:
  }
    *a3 = v4;
  return v5;
}

uint64_t PMIndexCompare(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 506);
  if (v2 == 0xFFFF) {
    int v2 = *(unsigned __int16 *)(a1 + 504);
  }
  int v3 = *(unsigned __int16 *)(a2 + 506);
  if (v3 == 0xFFFF) {
    int v3 = *(unsigned __int16 *)(a2 + 504);
  }
  if (v2 != 0xFFFF && v3 != 0xFFFF) {
    return ((__int16)v2 - (__int16)v3);
  }
  unsigned int v5 = *(_DWORD *)(a1 + 8);
  unsigned int v6 = *(_DWORD *)(a2 + 8);
  BOOL v7 = v5 == v6;
  if (v5 > v6) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = -1;
  }
  if (v7) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t PMISODetect(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  __int16 v15 = 0;
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  int v13 = 0;
  int v14 = 0;
  __int16 v12 = 0;
  unsigned int v4 = *(unsigned __int16 *)(*a1 + 2);
  unsigned int v5 = (const void *)MKMediaCreateWithBIOVector(0, a2, a3, 0, &v15);
  __int16 v6 = v15;
  if (!v15)
  {
    __int16 v6 = MKDetectISO((uint64_t)v5, &v13, &v14, (uint64_t)v16);
    __int16 v15 = v6;
    if (v13)
    {
      if (!v6)
      {
        int v7 = HIDWORD(v17);
        if (WORD4(v17) && WORD4(v17) != v4) {
          int v7 = HIDWORD(v17) * (WORD4(v17) >> 9) / (v4 >> 9);
        }
        uint64_t v8 = *a1;
        int v9 = PMPSpecificIndex(*a1, 4097, 0, &v12);
        __int16 v15 = v9;
        if (v9)
        {
          int v10 = 0;
        }
        else
        {
          int v10 = *(_DWORD *)(v8 + 1072 * v12 + 540) + *(_DWORD *)(v8 + 1072 * v12 + 536);
          v7 -= v10;
        }
        __int16 v6 = PMGenPartitionType((const void **)a1, 16393, v10, v7, v4, 2097171, v16, 0, 0xFFFFu);
        __int16 v15 = v6;
      }
    }
  }
  if (v5)
  {
    CFRelease(v5);
    return v15;
  }
  return v6;
}

uint64_t VReadPartitions(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v42 = 0;
  uint64_t v41 = 0;
  int v40 = 0;
  uint64_t v37 = 0;
  unint64_t v38 = 0;
  uint64_t v39 = 0;
  v44[0] = *(_OWORD *)"Single Volume";
  v44[1] = unk_21E15F6B2;
  if (a2 == 0xFFFF) {
    uint64_t v7 = 3584;
  }
  else {
    uint64_t v7 = a2;
  }
  int v8 = a4(a3, 15, 0, 0, 0, (unsigned __int16 *)&v37);
  if (v8) {
    goto LABEL_5;
  }
  if ((v7 & 0x400) != 0)
  {
    unint64_t v12 = v38;
    unsigned int v11 = HIDWORD(v37);
    if ((v38 * ((unint64_t)HIDWORD(v37) >> 9)) >> 32)
    {
      int v9 = 0;
      LOWORD(v8) = -5308;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v11 = HIDWORD(v37);
    unint64_t v12 = v38;
  }
  unsigned int v13 = v11;
  if (HIDWORD(v12))
  {
    unsigned int v13 = v11;
    while ((v13 & 0x80000000) == 0)
    {
      v13 *= 2;
      HIDWORD(v37) = v13;
      unint64_t v14 = v12 >> 33;
      v12 >>= 1;
      unint64_t v38 = v12;
      if (!v14) {
        goto LABEL_15;
      }
    }
    unsigned int v13 = 0;
    HIDWORD(v37) = 0;
    unint64_t v38 = 0;
    __int16 v43 = 5;
LABEL_18:
    if (v13 <= 0x400) {
      unsigned __int16 v15 = 1024;
    }
    else {
      unsigned __int16 v15 = v13;
    }
    Size v16 = v15;
    long long v17 = NewPtr(v16);
    LOWORD(v8) = MemError();
    __int16 v43 = v8;
    if (!v17) {
      goto LABEL_5;
    }
    int v18 = a4(a3, 130, v16, 0, 1, (unsigned __int16 *)v17);
    __int16 v43 = v18;
    if (v18)
    {
      int v9 = 0;
LABEL_27:
      DisposePtr(v17);
      LOWORD(v8) = v43;
      goto LABEL_6;
    }
    int v19 = (const void *)MKMediaCreateWithBIOVector(0, a3, (uint64_t)a4, 0, &v43);
    int v9 = 0;
    if (v43) {
      goto LABEL_25;
    }
    int v9 = (const void **)NewHandleClear(528);
    __int16 v43 = MemError();
    if (!v9) {
      goto LABEL_25;
    }
    uint64_t v20 = *v9;
    v20[128] = 33554948;
    unsigned __int16 v21 = WORD2(v37);
    *((_WORD *)v20 + 259) = WORD2(v37);
    if ((v7 & 0x400) != 0) {
      __int16 v22 = 512;
    }
    else {
      __int16 v22 = v21;
    }
    *((_WORD *)v20 + 1) = v22;
    int v23 = v21 | 0x200;
    int v24 = (v21 >> 9) * v38;
    if (v23 == 512) {
      int v24 = v38;
    }
    v20[1] = v24;
    *((_WORD *)v20 + 250) = (unsigned __int16)v11 >> 9;
    int v40 = 0;
    LODWORD(v41) = 0;
    __int16 v43 = GPTSchemeDetect((uint64_t)v17, (uint64_t)&v37, (uint64_t)v19, (unsigned int *)&v41);
    if (v43) {
      goto LABEL_25;
    }
    int v25 = MKMBRSchemeDetect((uint64_t)v17, (uint64_t)&v37, a3, (uint64_t)a4, &v41);
    __int16 v43 = v25;
    if (v25) {
      goto LABEL_25;
    }
    if ((int)v41 < 5000) {
      goto LABEL_43;
    }
    __int16 v43 = MKISOSchemeDetect((uint64_t)v19, &v40);
    if (v43) {
      goto LABEL_25;
    }
    if (v40 > 4999 || (int)v41 < 5000)
    {
LABEL_43:
      LODWORD(v41) = 0;
      int v27 = MKAPMSchemeDetect(v17, (uint64_t)&v37, a3, a4, (int *)&v41);
      __int16 v43 = v27;
      if (v27) {
        goto LABEL_25;
      }
      if ((int)v41 >= 5000)
      {
        if ((v7 & 0x100) != 0) {
          __int16 v28 = APMReadRawMediaMap(v9, v7, a3, a4);
        }
        else {
          __int16 v28 = APMReadMediaMap((uint64_t *)v9, v7, a3, a4);
        }
        goto LABEL_67;
      }
      if ((v7 & 0x40) != 0)
      {
        LODWORD(v41) = 0;
        if ((v7 & 0x400) != 0)
        {
          v38 *= (unint64_t)HIDWORD(v37) >> 9;
          HIDWORD(v37) = 512;
        }
        __int16 v43 = MKFileSystemDetect((uint64_t)v19, (int *)&v41, &v42, (_DWORD *)&v41 + 1);
        if (v43) {
          goto LABEL_25;
        }
        unsigned int v30 = WORD2(v37);
        int v31 = v38;
        unint64_t v32 = *v9;
        v32[2] = 0u;
        v32[3] = 0u;
        v32[4] = 0u;
        v32[5] = 0u;
        v32[6] = 0u;
        v32[7] = 0u;
        v32[8] = 0u;
        v32[9] = 0u;
        v32[10] = 0u;
        v32[11] = 0u;
        v32[12] = 0u;
        v32[13] = 0u;
        v32[14] = 0u;
        v32[15] = 0u;
        v32[16] = 0u;
        v32[17] = 0u;
        v32[18] = 0u;
        v32[19] = 0u;
        v32[20] = 0u;
        v32[21] = 0u;
        v32[22] = 0u;
        v32[23] = 0u;
        v32[24] = 0u;
        v32[25] = 0u;
        v32[26] = 0u;
        v32[27] = 0u;
        v32[28] = 0u;
        v32[29] = 0u;
        v32[30] = 0u;
        v32[31] = 0u;
        *unint64_t v32 = 0u;
        v32[1] = 0u;
        uint64_t v33 = *v9;
        v33[128] = 8389124;
        *((_WORD *)v33 + 1) = v30;
        v33[1] = v31;
        *((_WORD *)v33 + 250) = v30 >> 9;
        if ((int)v41 >= 5000)
        {
          int v34 = 20225;
          switch(HIDWORD(v41))
          {
            case 1:
              if (v42 == 4) {
                int v34 = 16395;
              }
              else {
                int v34 = 0x4000;
              }
              break;
            case 3:
              break;
            case 4:
              int v34 = 16398;
              break;
            case 6:
              int v34 = 16386;
              break;
            default:
              goto LABEL_65;
          }
          int v36 = PMGenPartitionType(v9, v34, 0, v38, WORD2(v37), 2097168, v44, 0, 0xFFFFu);
          __int16 v43 = v36;
          if (!v36) {
            PMISODetect((uint64_t *)v9, a3, (uint64_t)a4);
          }
          goto LABEL_25;
        }
LABEL_65:
        if (PMISODetect((uint64_t *)v9, a3, (uint64_t)a4))
        {
          *((_WORD *)*v9 + 257) = 1;
          __int16 v28 = PMGenPartitionType(v9, 16394, 0, v38, WORD2(v37), 2097168, "Whole Device", 0, 0xFFFFu);
          goto LABEL_67;
        }
        goto LABEL_25;
      }
      int v29 = VReadISOPartitionsII(v9, v7, (uint64_t)&v37, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, uint64_t, unsigned char *))a4);
      __int16 v43 = v29;
      if (v29)
      {
        __int16 v43 = -5345;
        goto LABEL_25;
      }
    }
    else
    {
      int v26 = VReadDosPartitions(v9, v7, 0, (uint64_t)&v37, a3, (uint64_t)a4);
      __int16 v43 = v26;
      if (v26) {
        goto LABEL_25;
      }
      if ((v7 & 0x800) == 0)
      {
LABEL_60:
        if ((v7 & 0x80) == 0) {
          goto LABEL_25;
        }
        goto LABEL_64;
      }
      PMSortMapII((Ptr *)v9, 0);
    }
    if ((v7 & 0x10) == 0) {
      goto LABEL_60;
    }
    int v35 = PMAccountFreespace(v9, 0, v7);
    __int16 v43 = v35;
    if ((v7 & 0x80) != 0 && !v35)
    {
LABEL_64:
      __int16 v28 = PMRationalise(v9);
LABEL_67:
      __int16 v43 = v28;
    }
LABEL_25:
    if (v19) {
      CFRelease(v19);
    }
    goto LABEL_27;
  }
LABEL_15:
  LOWORD(v8) = 5;
  __int16 v43 = 5;
  if ((v13 & 0x1FF) == 0) {
    goto LABEL_18;
  }
LABEL_5:
  int v9 = 0;
LABEL_6:
  *a1 = v9;
  return (__int16)v8;
}

uint64_t VErasePartition(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  if (!a1) {
    return -50;
  }
  uint64_t v5 = *a1;
  if (*(unsigned __int16 *)(*a1 + 522) <= a2) {
    return -5343;
  }
  uint64_t v7 = *(unsigned __int16 *)(v5 + 2);
  int v8 = (unsigned int *)(v5 + 1072 * a2);
  v8[154] &= ~0x100000u;
  uint64_t v9 = v8[134];
  unsigned int v10 = v8[135];
  if (v10 >= a3) {
    unsigned int v11 = a3;
  }
  else {
    unsigned int v11 = v10;
  }
  if (a3) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v10;
  }
  return a5(a4, 4, v7, v9, v12, 0);
}

uint64_t PMNewPartitionListExtended(const void ***a1, unsigned int a2, unsigned int a3, int a4, int a5, char a6)
{
  return PMNewPartitionListInternal(a1, 0, a2, a3, a4, a5, a6);
}

uint64_t PMWriteContentExtended(uint64_t *a1, int a2, const char *a3, int a4, unsigned int a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  if (a1) {
    return PMWriteContentInternal(*a1, a2, a3, a4, a5, 0, a6, a7);
  }
  else {
    return 4294967246;
  }
}

uint64_t PMMediaWrite(uint64_t *a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  if (!a1) {
    return -50;
  }
  uint64_t v6 = *a1;
  if (a2 >= *(unsigned __int16 *)(*a1 + 522)) {
    return -50;
  }
  unsigned int v8 = *(unsigned __int16 *)(v6 + 2);
  uint64_t v9 = v6 + 1072 * a2;
  if (a3 % v8) {
    unsigned int v10 = a3 / v8 + 1;
  }
  else {
    unsigned int v10 = a3 / v8;
  }
  if (v10 > *(_DWORD *)(v9 + 540)) {
    return -5341;
  }
  return a6(a5, 3);
}

uint64_t FindSTOC(_DWORD *a1, unsigned int a2, unsigned int a3, unsigned __int16 **a4)
{
  if (a2 && *a1 != bswap32(a2))
  {
    return -43;
  }
  else
  {
    unsigned int v4 = (unsigned __int16 *)(a1 + 8);
    unsigned int v5 = a1[1];
    if (v5)
    {
      uint64_t v6 = (unsigned __int16 *)((char *)v4 + bswap32(v5));
      unsigned int v7 = __rev16(a3);
      while (1)
      {
        if (*v4 == v7)
        {
          __int16 v8 = 0;
          if (a4) {
            goto LABEL_14;
          }
          return v8;
        }
        if (!v4[1]) {
          break;
        }
        unsigned int v4 = (unsigned __int16 *)((char *)v4 + __rev16(v4[1]));
        if (v4 >= v6) {
          goto LABEL_8;
        }
      }
      __int16 v8 = -39;
      if (!a4) {
        return v8;
      }
    }
    else
    {
LABEL_8:
      __int16 v8 = -192;
      if (!a4) {
        return v8;
      }
    }
LABEL_14:
    *a4 = v4;
  }
  return v8;
}

uint64_t STOCRead(unsigned int a1, unsigned int a2, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, void, uint64_t, uint64_t, size_t *))
{
  memset(size, 0, sizeof(size));
  unsigned __int16 v21 = 0;
  int v12 = a6(a5, 15, 0, 0, 0, size);
  __int16 v13 = v12;
  if (!v12)
  {
    unint64_t v14 = malloc_type_malloc(HIDWORD(size[0]), 0xAEEAE90CuLL);
    if (v14)
    {
      unsigned __int16 v15 = v14;
      int v16 = a6(a5, 2, WORD2(size[0]), a4, 1, (size_t *)v14);
      __int16 v13 = v16;
      if (!v16)
      {
        int STOC = FindSTOC(v15, a1, a2, &v21);
        __int16 v13 = STOC;
        if (!STOC)
        {
          int v18 = v21;
          *a3 = bswap32(*v21) >> 16;
          uint64_t v19 = bswap32(v18[1]) >> 16;
          a3[1] = v19;
          memcpy(a3 + 2, v18 + 2, v19 - 4);
        }
      }
      free(v15);
    }
    else
    {
      return -1;
    }
  }
  return v13;
}

uint64_t STOCWrite(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, void, uint64_t, uint64_t, size_t *))
{
  memset(size, 0, sizeof(size));
  int v18 = 0;
  int v10 = a5(a4, 15, 0, 0, 0, size);
  __int16 v11 = v10;
  if (!v10)
  {
    int v12 = (char *)malloc_type_malloc(HIDWORD(size[0]), 0x936E04E7uLL);
    if (!v12) {
      return -1;
    }
    __int16 v13 = v12;
    int v14 = a5(a4, 2, WORD2(size[0]), a3, 1, (size_t *)v12);
    __int16 v11 = v14;
    if (v14) {
      goto LABEL_4;
    }
    int STOC = FindSTOC(v13, a2, *a1, &v18);
    __int16 v11 = STOC;
    if (STOC)
    {
      if (STOC == -43)
      {
        *(_DWORD *)__int16 v13 = bswap32(a2);
        *((_DWORD *)v13 + 1) = bswap32(HIDWORD(size[0]));
        *((_DWORD *)v13 + 2) = 256;
        *((void *)v13 + 2) = time(0);
        long long v17 = (unsigned __int16 *)(v13 + 32);
        int v18 = (unsigned __int16 *)(v13 + 32);
LABEL_15:
        if (bswap32(*((_DWORD *)v13 + 1)) + v13 - v17 < a1[1]) {
          goto LABEL_16;
        }
LABEL_17:
        unsigned __int16 *v17 = bswap32(*a1) >> 16;
        v17[1] = bswap32(a1[1]) >> 16;
        memcpy(v17 + 2, a1 + 2, a1[1] - 4);
        *((void *)v13 + 3) = bswap32(time(0));
        __int16 v11 = a5(a4, 3, WORD2(size[0]), a3, 1, (size_t *)v13);
        goto LABEL_4;
      }
      if (STOC == -192)
      {
        long long v17 = v18;
        goto LABEL_15;
      }
    }
    else if (a1[1] > v18[1])
    {
LABEL_16:
      __int16 v11 = -5344;
      goto LABEL_4;
    }
    if (STOC)
    {
LABEL_4:
      free(v13);
      return v11;
    }
    long long v17 = v18;
    goto LABEL_17;
  }
  return v11;
}

uint64_t MKMediaDeviceOpenExtended(char *a1, char a2, uint64_t a3, uint64_t *a4)
{
  unsigned int v7 = (const void **)MEMORY[0x263EFFB38];
  int v13 = 0;
  uint64_t v8 = *MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v10 = Mutable;
  __int16 v11 = (const void **)MEMORY[0x263EFFB40];
  if ((a2 & 2) == 0) {
    __int16 v11 = v7;
  }
  CFDictionaryAddValue(Mutable, @"Writable", *v11);
  *a4 = MKMediaCreateWithPath(v8, a1, v10, &v13);
  return (__int16)v13;
}

uint64_t MKMediaDeviceOpen(char *a1, char a2, uint64_t *a3)
{
  return MKMediaDeviceOpenExtended(a1, a2, (uint64_t)a3, a3);
}

uint64_t MKMediaDeviceClose(const void *a1)
{
  if (a1)
  {
    CFRelease(a1);
    return 0;
  }
  else
  {
    return -5327;
  }
}

uint64_t _MKMediaBIOVectorInitialize(uint64_t a1, const __CFDictionary *a2)
{
  if (!a1) {
    return 22;
  }
  if (*(_DWORD *)a1 != 1296786038) {
    return 22;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 24) = Mutable;
  if (!Mutable) {
    return 12;
  }
  if (!a2)
  {
    int v14 = (const void *)*MEMORY[0x263EFFB40];
    int v16 = (const void *)*MEMORY[0x263EFFB38];
    BOOL v15 = 1;
LABEL_19:
    long long v17 = v16;
    goto LABEL_20;
  }
  CFDataRef Value = CFDictionaryGetValue(a2, @"Writable");
  BOOL v8 = Value
    && (uint64_t v6 = Value, TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(v6))
    && CFEqual(v6, (CFTypeRef)*MEMORY[0x263EFFB40]) != 0;
  CFDictionaryRef v10 = CFDictionaryGetValue(a2, @"Shared Writer");
  if (v10)
  {
    __int16 v11 = v10;
    CFTypeID v12 = CFBooleanGetTypeID();
    CFTypeID v13 = CFGetTypeID(v11);
    int v14 = (const void *)*MEMORY[0x263EFFB40];
    if (v12 == v13)
    {
      BOOL v15 = CFEqual(v11, (CFTypeRef)*MEMORY[0x263EFFB40]) == 0;
      goto LABEL_18;
    }
  }
  else
  {
    int v14 = (const void *)*MEMORY[0x263EFFB40];
  }
  BOOL v15 = 1;
LABEL_18:
  CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a1 + 24);
  int v16 = (const void *)*MEMORY[0x263EFFB38];
  long long v17 = v14;
  if (!v8) {
    goto LABEL_19;
  }
LABEL_20:
  CFDictionaryAddValue(Mutable, @"Writable", v17);
  if (v15) {
    int v18 = v16;
  }
  else {
    int v18 = v14;
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), @"Shared Writer", v18);
  return 0;
}

void _MKMediaBIOVectorDeinitialize(void *a1)
{
  if (a1 && *(_DWORD *)a1 == 1296786038)
  {
    int v2 = (const void *)a1[3];
    if (v2) {
      CFRelease(v2);
    }
    free(a1);
  }
}

const void *_MKMediaBIOVectorCopyProperty(uint64_t a1, void *key)
{
  if (!key) {
    return 0;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 24);
  if (v4 && (unsigned int v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    CFDataRef Value = v5;
    CFMutableDictionaryRef Mutable = 0;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    _MKMediaBIOVectorGetGeoProperties(a1, Mutable);
    CFDataRef Value = CFDictionaryGetValue(Mutable, key);
    if (!Value) {
      goto LABEL_8;
    }
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Value;
}

__CFDictionary *_MKMediaBIOVectorCopyProperties(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 24);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v2) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  unsigned int v5 = MutableCopy;
  _MKMediaBIOVectorGetGeoProperties(a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaBIOVectorSetProperty()
{
  return 0;
}

CFStringRef _MKMediaBIOVectorDescription(uint64_t a1, const __CFDictionary *a2)
{
  memset(&v8, 0, sizeof(v8));
  int v4 = dladdr(*(const void **)(a1 + 8), &v8);
  dli_sname = v8.dli_sname;
  if (v4) {
    BOOL v6 = v8.dli_sname == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    dli_sname = "unknown";
    v8.dli_sname = "unknown";
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"<MKMediaRef>: [BIOVector %s<%p> refcon %p]", dli_sname, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _MKMediaBIOVectorReadSectors(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if ((a3 | a2) >> 32) {
    return 22;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 8))(*(void *)(a1 + 16), 2, 512, a2, a3, a4);
  if (a5)
  {
    if (!result) {
      *a5 = a3;
    }
  }
  return result;
}

uint64_t _MKMediaBIOVectorWriteSectors(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if ((a3 | a2) >> 32) {
    return 22;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 8))(*(void *)(a1 + 16), 3, 512, a2, a3, a4);
  if (a5)
  {
    if (!result) {
      *a5 = a3;
    }
  }
  return result;
}

uint64_t MKMediaCreateWithBIOVector(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, _WORD *a5)
{
  int v11 = 22;
  if (a3)
  {
    uint64_t result = (uint64_t)malloc_type_malloc(0x20uLL, 0x10A00402946438FuLL);
    if (result)
    {
      *(_DWORD *)uint64_t result = 1296786038;
      *(void *)(result + 8) = a3;
      *(void *)(result + 16) = a2;
      *(void *)(result + 24) = 0;
      int v11 = 0;
      uint64_t result = MKMediaCreate(a1, result, (uint64_t)&_MKMediaBIOVectorVector, a4, &v11);
      if (!a5) {
        return result;
      }
    }
    else
    {
      int v11 = 12;
      if (!a5) {
        return result;
      }
    }
  }
  else
  {
    uint64_t result = 0;
    if (!a5) {
      return result;
    }
  }
  *a5 = v11;
  return result;
}

uint64_t _MKMediaBIOVectorGetGeoProperties(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && *(_DWORD *)a1 == 1296786038)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    int v3 = (*(uint64_t (**)(void, uint64_t, void, void, void, uint64_t *))(a1 + 8))(*(void *)(a1 + 16), 15, 0, 0, 0, &v5);
    if (!v3) {
      LOWORD(v3) = _MKMediaSetupGeometry(a2, SHIDWORD(v5), (v6 * (unint64_t)HIDWORD(v5)) >> 9, (HIDWORD(v5) * (unsigned __int16)v7) >> 9);
    }
    if ((_WORD)v3 == 0xFFFF) {
      return *__error();
    }
  }
  else
  {
    LOWORD(v3) = 22;
  }
  return (__int16)v3;
}

uint64_t APFSContainerGetFreespaceInfo()
{
  return MEMORY[0x270F08AC8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B10](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B18](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B20](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
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

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
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

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
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

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
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

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
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

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

Boolean CFStringGetPascalString(CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return MEMORY[0x270EF4A28](*(void *)&entry, plane, path);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x270EF4A48](*(void *)&entry, plane);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _exit(int a1)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

char *__cdecl devname(dev_t a1, mode_t a2)
{
  return (char *)MEMORY[0x270ED9178](*(void *)&a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

int execv(const char *__path, char *const *__argv)
{
  return MEMORY[0x270ED9830](__path, __argv);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

pid_t fork(void)
{
  return MEMORY[0x270ED99F8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x270ED9C38](*(void *)&a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x270ED9C98](a1, *(void *)&a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x270F9C6D0](file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x270F9C710](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x270F9C718](file, buf, *(void *)&len);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x270ED9E98](a1, *(void *)&a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA590](a1, a2);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x270EDA5E8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x270EDB528](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x270EDBB40](*(void *)&a1, a2, *(void *)&a3, a4);
}