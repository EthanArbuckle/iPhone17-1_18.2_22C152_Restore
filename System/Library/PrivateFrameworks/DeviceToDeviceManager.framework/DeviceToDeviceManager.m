uint64_t D2DInitialize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFBundle *BundleWithIdentifier;
  CFURLRef v7;
  CFURLRef v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  FILE **v12;
  __CFBundle *ValueAtIndex;
  CFDictionaryRef InfoDictionary;
  const void *Value;
  CFStringRef v16;
  CFStringRef v17;
  CFTypeID v18;
  CFTypeID v20;
  FILE *v21;
  const char *v22;
  size_t v23;
  unsigned int (**DataPointerForName)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  FILE *v27;
  const char *v28;
  size_t v29;
  uint64_t v31;
  uint64_t v32;
  unsigned int valuePtr;

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.DeviceToDeviceManager");
  if (!BundleWithIdentifier)
  {
    v26 = 1;
    fwrite("D2D: failed to get the D2D bundle\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    return v26;
  }
  v7 = CFBundleCopyBuiltInPlugInsURL(BundleWithIdentifier);
  if (!v7)
  {
    v27 = (FILE *)*MEMORY[0x263EF8348];
    v28 = "D2D: failed to get the URL for D2D plugins\n";
    v26 = 1;
    v29 = 43;
LABEL_29:
    fwrite(v28, v29, 1uLL, v27);
    return v26;
  }
  v8 = v7;
  loadedPlugins = (uint64_t)CFBundleCreateBundlesFromDirectory((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, @"bundle");
  CFRelease(v8);
  if (!loadedPlugins)
  {
    v27 = (FILE *)*MEMORY[0x263EF8348];
    v28 = "D2D: loading plugins failed.  Continuing with no transports\n";
    v26 = 1;
    v29 = 60;
    goto LABEL_29;
  }
  Count = CFArrayGetCount((CFArrayRef)loadedPlugins);
  if (Count >= 1)
  {
    v10 = Count;
    v31 = a2;
    v32 = a3;
    v11 = 0;
    v12 = (FILE **)MEMORY[0x263EF8348];
    while (1)
    {
      ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex((CFArrayRef)loadedPlugins, v11);
      InfoDictionary = CFBundleGetInfoDictionary(ValueAtIndex);
      Value = CFDictionaryGetValue(InfoDictionary, @"D2DTransportType");
      v16 = (const __CFString *)CFDictionaryGetValue(InfoDictionary, @"D2DTransportPlugin");
      if (!Value) {
        break;
      }
      v17 = v16;
      v18 = CFGetTypeID(Value);
      if (v18 != CFNumberGetTypeID() || v17 == 0) {
        break;
      }
      v20 = CFGetTypeID(v17);
      if (v20 != CFStringGetTypeID()) {
        break;
      }
      valuePtr = 0;
      if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr))
      {
        v21 = *v12;
        v22 = "Failed to get the transport ID\n";
        v23 = 31;
        goto LABEL_16;
      }
      if (valuePtr < 4)
      {
        DataPointerForName = (unsigned int (**)(uint64_t, uint64_t, uint64_t))CFBundleGetDataPointerForName(ValueAtIndex, v17);
        if (DataPointerForName)
        {
          v25 = (uint64_t)DataPointerForName;
          if (*DataPointerForName && !(*DataPointerForName)(a1, v31, v32)) {
            plugins[valuePtr] = v25;
          }
          goto LABEL_17;
        }
        v21 = *v12;
        v22 = "Failed to get the plugin interface structure\n";
        v23 = 45;
        goto LABEL_16;
      }
      fprintf(*v12, "Unknown transport id %d\n", valuePtr);
LABEL_17:
      if (v10 == ++v11) {
        return 0;
      }
    }
    v21 = *v12;
    v22 = "Plugin is missing it's transport ID or Plugin\n";
    v23 = 46;
LABEL_16:
    fwrite(v22, v23, 1uLL, v21);
    goto LABEL_17;
  }
  return 0;
}

uint64_t D2DTerminate()
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v1 = plugins[i];
    if (v1)
    {
      v2 = *(void (**)(void))(v1 + 8);
      if (v2) {
        v2();
      }
    }
  }
  return 0;
}

uint64_t D2DStartAdvertisingPair(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v8 = CFDataCreate(v6, a3, a4);
  CFDataRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v13 = plugins[i];
      if (v13)
      {
        if (*(void *)(v13 + 48))
        {
          v14 = *(void (**)(CFDataRef, CFDataRef))(v13 + 16);
          if (v14) {
            v14(v7, v9);
          }
        }
      }
    }
    CFRelease(v7);
    uint64_t v11 = 0;
LABEL_16:
    CFRelease(v9);
    return v11;
  }
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v11 = 1;
  if (v9) {
    goto LABEL_16;
  }
  return v11;
}

uint64_t D2DStartAdvertisingPairOnTransport(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4, unsigned int a5)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v10 = CFDataCreate(v8, a3, a4);
  CFDataRef v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (a5 <= 3)
    {
      uint64_t v14 = plugins[a5];
      if (v14)
      {
        v15 = *(void (**)(CFDataRef, CFDataRef))(v14 + 16);
        if (v15) {
          v15(v9, v10);
        }
      }
    }
    CFRelease(v9);
    uint64_t v13 = 0;
LABEL_15:
    CFRelease(v11);
    return v13;
  }
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v13 = 1;
  if (v11) {
    goto LABEL_15;
  }
  return v13;
}

uint64_t D2DStopAdvertisingPair(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v8 = CFDataCreate(v6, a3, a4);
  CFDataRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v13 = plugins[i];
      if (v13)
      {
        if (*(void *)(v13 + 56))
        {
          uint64_t v14 = *(void (**)(CFDataRef, CFDataRef))(v13 + 24);
          if (v14) {
            v14(v7, v9);
          }
        }
      }
    }
    CFRelease(v7);
    uint64_t v11 = 0;
LABEL_16:
    CFRelease(v9);
    return v11;
  }
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v11 = 1;
  if (v9) {
    goto LABEL_16;
  }
  return v11;
}

uint64_t D2DStopAdvertisingPairOnTransport(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4, unsigned int a5)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v10 = CFDataCreate(v8, a3, a4);
  CFDataRef v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (a5 <= 3)
    {
      uint64_t v14 = plugins[a5];
      if (v14)
      {
        v15 = *(void (**)(CFDataRef, CFDataRef))(v14 + 24);
        if (v15) {
          v15(v9, v10);
        }
      }
    }
    CFRelease(v9);
    uint64_t v13 = 0;
LABEL_15:
    CFRelease(v11);
    return v13;
  }
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v13 = 1;
  if (v11) {
    goto LABEL_15;
  }
  return v13;
}

uint64_t D2DStartBrowsingForKey(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  if (!v2) {
    return 1;
  }
  CFDataRef v3 = v2;
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v5 = plugins[i];
    if (v5)
    {
      CFAllocatorRef v6 = *(void (**)(CFDataRef))(v5 + 32);
      if (v6) {
        v6(v3);
      }
    }
  }
  CFRelease(v3);
  return 0;
}

uint64_t D2DStartBrowsingForKeyOnTransport(UInt8 *bytes, CFIndex length, unsigned int a3)
{
  CFDataRef v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  if (!v4) {
    return 1;
  }
  CFDataRef v5 = v4;
  if (a3 <= 3)
  {
    uint64_t v6 = plugins[a3];
    if (v6)
    {
      CFDataRef v7 = *(void (**)(CFDataRef))(v6 + 32);
      if (v7) {
        v7(v4);
      }
    }
  }
  CFRelease(v5);
  return 0;
}

uint64_t D2DStopBrowsingForKey(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  if (!v2) {
    return 1;
  }
  CFDataRef v3 = v2;
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v5 = plugins[i];
    if (v5)
    {
      uint64_t v6 = *(void (**)(CFDataRef))(v5 + 40);
      if (v6) {
        v6(v3);
      }
    }
  }
  CFRelease(v3);
  return 0;
}

uint64_t D2DStopBrowsingForKeyOnTransport(UInt8 *bytes, CFIndex length, unsigned int a3)
{
  CFDataRef v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  if (!v4) {
    return 1;
  }
  CFDataRef v5 = v4;
  if (a3 <= 3)
  {
    uint64_t v6 = plugins[a3];
    if (v6)
    {
      CFDataRef v7 = *(void (**)(CFDataRef))(v6 + 40);
      if (v7) {
        v7(v4);
      }
    }
  }
  CFRelease(v5);
  return 0;
}

void D2DStartResolvingPair(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v8 = CFDataCreate(v6, a3, a4);
  CFDataRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v12 = plugins[i];
      if (v12)
      {
        if (*(void *)(v12 + 56))
        {
          uint64_t v13 = *(void (**)(CFDataRef, CFDataRef))(v12 + 48);
          if (v13) {
            v13(v7, v9);
          }
        }
      }
    }
    CFRelease(v7);
LABEL_16:
    CFRelease(v9);
    return;
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v9) {
    goto LABEL_16;
  }
}

void D2DStartResolvingPairOnTransport(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4, unsigned int a5)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v10 = CFDataCreate(v8, a3, a4);
  CFDataRef v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (a5 <= 3)
    {
      uint64_t v13 = plugins[a5];
      if (v13)
      {
        uint64_t v14 = *(void (**)(CFDataRef, CFDataRef))(v13 + 48);
        if (v14) {
          v14(v9, v10);
        }
      }
    }
    CFRelease(v9);
LABEL_15:
    CFRelease(v11);
    return;
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v11) {
    goto LABEL_15;
  }
}

void D2DStopResolvingPair(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v8 = CFDataCreate(v6, a3, a4);
  CFDataRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v12 = plugins[i];
      if (v12)
      {
        uint64_t v13 = *(void (**)(CFDataRef, CFDataRef))(v12 + 56);
        if (v13) {
          v13(v7, v9);
        }
      }
    }
    CFRelease(v7);
LABEL_15:
    CFRelease(v9);
    return;
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v9) {
    goto LABEL_15;
  }
}

void D2DStopResolvingPairOnTransport(UInt8 *bytes, CFIndex length, const UInt8 *a3, CFIndex a4, unsigned int a5)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  CFDataRef v10 = CFDataCreate(v8, a3, a4);
  CFDataRef v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (a5 <= 3)
    {
      uint64_t v13 = plugins[a5];
      if (v13)
      {
        uint64_t v14 = *(void (**)(CFDataRef, CFDataRef))(v13 + 56);
        if (v14) {
          v14(v9, v10);
        }
      }
    }
    CFRelease(v9);
LABEL_15:
    CFRelease(v11);
    return;
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v11) {
    goto LABEL_15;
  }
}

uint64_t D2DRetain(uint64_t a1, unsigned int a2)
{
  if (a2 <= 3 && (uint64_t v2 = plugins[a2]) != 0 && (v3 = *(uint64_t (**)(void))(v2 + 64)) != 0) {
    return v3();
  }
  else {
    return 2;
  }
}

uint64_t D2DRelease(uint64_t a1, unsigned int a2)
{
  if (a2 <= 3 && (uint64_t v2 = plugins[a2]) != 0 && (v3 = *(uint64_t (**)(void))(v2 + 72)) != 0) {
    return v3();
  }
  else {
    return 2;
  }
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4538](bundle);
}

CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x270EE45C0](allocator, directoryURL, bundleType);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x270EE45D0](bundle, symbolName);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}