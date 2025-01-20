uint64_t IOSurfaceAcceleratorSetCustomFilter(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, uint64_t a8)
{
  uint64_t result;
  _OWORD v10[2];

  memset(v10, 0, sizeof(v10));
  result = prepareCustomFilter(a2, a3, a4, a5, a6, a7, a8, (uint64_t)v10);
  if (!result) {
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 4u, v10, 0x20uLL, 0, 0);
  }
  return result;
}

uint64_t prepareCustomFilter(int a1, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    uint64_t v8 = 0;
    *(_DWORD *)a8 = a1;
    *(_DWORD *)(a8 + 4) = a2;
    *(_DWORD *)(a8 + 8) = a3;
    *(_DWORD *)(a8 + 12) = a4;
    *(_DWORD *)(a8 + 16) = a5;
    *(_DWORD *)(a8 + 20) = a6;
    *(void *)(a8 + 24) = a7;
  }
  else
  {
    uint64_t v8 = 3758097090;
    if (log_level_enabled(1u, 0)) {
      log_msg(1, 0, 255, (uint64_t)"prepareCustomFilter", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 986, (uint64_t)"Missing custom filter setting", v9, v11);
    }
  }
  return v8;
}

uint64_t ioSurfaceAcceleratorFinalize(uint64_t a1)
{
  v2 = *(IONotificationPort **)(a1 + 16);
  if (v2) {
    IONotificationPortDestroy(v2);
  }
  uint64_t v3 = *(unsigned int *)(a1 + 36);
  if (v3) {
    uint64_t v3 = IOServiceClose(v3);
  }

  return log_stop(v3);
}

uint64_t IOSurfaceAcceleratorTransformSurface(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6)
{
  memset(v11, 0, sizeof(v11));
  if (a6)
  {
    *(_OWORD *)((char *)v11 + 8) = *(_OWORD *)a6;
    *((void *)&v11[1] + 1) = *(void *)(a6 + 16);
  }
  prepareTransformRectangles(a5, (uint64_t)v11);
  uint64_t result = prepareTransformBuffersAndOptions(a2, a3, a4, 0, (uint64_t)v11);
  if (!result) {
    return transformSurface(a1, (char *)v11, a4);
  }
  return result;
}

uint64_t transformSurface(uint64_t a1, char *inputStruct, CFDictionaryRef theDict)
{
  if (*(_DWORD *)(a1 + 44) == 1)
  {
    long long v30 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    uint64_t v22 = 0;
    memset(outputStruct, 0, sizeof(outputStruct));
    size_t outputStructCnt = 88;
    uint64_t inputStructa = *(void *)inputStruct;
    long long v24 = *(_OWORD *)(inputStruct + 8);
    uint64_t v25 = *((void *)inputStruct + 3);
    int v26 = 0;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"SharpenerMode");
    if (Value)
    {
      CFStringRef v6 = Value;
      int v7 = 1;
      if (CFStringCompare(Value, @"SharpenerMode_Static", 1uLL) == kCFCompareEqualTo) {
        goto LABEL_8;
      }
      if (CFStringCompare(v6, @"SharpenerMode_Dynamic", 1uLL) == kCFCompareEqualTo)
      {
        int v7 = 0;
LABEL_8:
        int v27 = v7;
        HIDWORD(v28) = getpid();
        LODWORD(v28) = srs_getStrength(theDict);
        CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(theDict, @"SharpenerSourceCleaness");
        if (v9)
        {
          CFStringRef v10 = v9;
          if (CFStringCompare(v9, @"SharpenerSourceCleaness_Noisy", 1uLL))
          {
            int v11 = 1;
            if (CFStringCompare(v10, @"SharpenerSourceCleaness_Normal", 1uLL) == kCFCompareEqualTo) {
              goto LABEL_21;
            }
            if (CFStringCompare(v10, @"SharpenerSourceCleaness_Clean", 1uLL))
            {
              if (log_level_enabled(2u, 0)) {
                log_msg(2, 0, 255, (uint64_t)"srs_getSourceCleaness", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 399, (uint64_t)"unknown sharpener cleaness\n", v12, v19);
              }
              goto LABEL_14;
            }
            int v11 = 2;
          }
          else
          {
            int v11 = 0;
          }
LABEL_21:
          DWORD1(v28) = v11;
          CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(theDict, @"SharpenerSourceSharpness");
          if (v15)
          {
            CFStringRef v16 = v15;
            if (CFStringCompare(v15, @"SharpenerSourceSharpness_Blur", 1uLL) == kCFCompareEqualTo)
            {
              int v17 = 0;
              goto LABEL_28;
            }
            int v17 = 1;
            if (CFStringCompare(v16, @"SharpenerSourceSharpness_Sharp", 1uLL) == kCFCompareEqualTo)
            {
LABEL_28:
              DWORD2(v28) = v17;
              return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 1u, &inputStructa, 0x58uLL, outputStruct, &outputStructCnt);
            }
            if (log_level_enabled(2u, 0)) {
              log_msg(2, 0, 255, (uint64_t)"srs_getSourceSharpness", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 426, (uint64_t)"unknown sharpener sharpness\n", v18, v19);
            }
          }
          int v17 = 1;
          goto LABEL_28;
        }
LABEL_14:
        int v11 = 1;
        goto LABEL_21;
      }
      if (log_level_enabled(2u, 0)) {
        log_msg(2, 0, 255, (uint64_t)"srs_getMode", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 335, (uint64_t)"unknown sharpener mode\n", v8, v19);
      }
    }
    int v7 = 1;
    goto LABEL_8;
  }
  mach_port_t v13 = *(_DWORD *)(a1 + 36);

  return IOConnectCallStructMethod(v13, 1u, inputStruct, 0x1B0uLL, 0, 0);
}

__n128 prepareTransformRectangles(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(_OWORD *)(a2 + 40) = *(_OWORD *)a1;
    __n128 result = *(__n128 *)(a1 + 16);
    long long v3 = *(_OWORD *)(a1 + 32);
    *(__n128 *)(a2 + 56) = result;
    *(_OWORD *)(a2 + 96) = v3;
  }
  return result;
}

uint64_t IOSurfaceAcceleratorCreate(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  long long valuePtr = xmmword_21041AED8;
  uint64_t v20 = 500000;
  *a3 = 0;
  if (!kIOSurfaceAcceleratorID) {
    pthread_once(&IOSurfaceAcceleratorGetTypeID_once, (void (*)(void))ioSurfaceAcceleratorClassInitialize);
  }
  io_connect_t connect = 0;
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 24) = 0;
  *(void *)(Instance + 32) = 0;
  *(void *)(Instance + 16) = 0;
  *(_DWORD *)(Instance + 44) = 0;
  if (a2)
  {
    if (CFDictionaryGetValue(a2, @"Sharpener"))
    {
      int Strength = srs_getStrength(a2);
      *(_DWORD *)(Instance + 44) = 1;
      uint32_t v7 = Strength | 0xB00000;
      uint64_t v8 = "AppleSRSDriver";
    }
    else
    {
      uint32_t v7 = 0;
      uint64_t v8 = "AppleM2ScalerCSCDriver";
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"PriorityBand");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    }
    CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a2, @"DutyCycleDuration");
    if (v10) {
      CFNumberGetValue(v10, kCFNumberSInt64Type, (char *)&valuePtr + 8);
    }
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(a2, @"HistogramDuration");
    if (v11) {
      CFNumberGetValue(v11, kCFNumberSInt64Type, &v20);
    }
  }
  else
  {
    uint32_t v7 = 0;
    uint64_t v8 = "AppleM2ScalerCSCDriver";
  }
  if (checkIsVirtualized_once != -1) {
    dispatch_once(&checkIsVirtualized_once, &__block_literal_global);
  }
  mach_port_t v12 = *MEMORY[0x263F0EC88];
  if (checkIsVirtualized_is_virtualized)
  {
    CFDictionaryRef v13 = IOServiceMatching("AppleM2ScalerParavirtDriver");
    io_service_t MatchingService = IOServiceGetMatchingService(v12, v13);
    if (!MatchingService)
    {
      uint64_t v15 = 3758097088;
      fwrite("IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver\n", 0x39uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
LABEL_28:
      CFRelease((CFTypeRef)Instance);
      return v15;
    }
  }
  else
  {
    CFDictionaryRef v16 = IOServiceMatching(v8);
    io_service_t MatchingService = IOServiceGetMatchingService(v12, v16);
    if (!MatchingService)
    {
      uint64_t v15 = 3758097088;
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOServiceMatchingfailed for: %s\n", v8);
      goto LABEL_28;
    }
  }
  uint64_t v15 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], v7, &connect);
  if (v15) {
    goto LABEL_28;
  }
  io_connect_t v17 = connect;
  *(_DWORD *)(Instance + 32) = MatchingService;
  *(_DWORD *)(Instance + 36) = v17;
  *a3 = Instance;
  if (checkIsVirtualized_once != -1) {
    dispatch_once(&checkIsVirtualized_once, &__block_literal_global);
  }
  if (!checkIsVirtualized_is_virtualized
    && IOConnectCallStructMethod(*(_DWORD *)(Instance + 36), 0xAu, &valuePtr, 0x18uLL, 0, 0))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Failed to set client property for: %s\n", v8);
  }
  return 0;
}

uint64_t prepareTransformBuffersAndOptions(__IOSurface *a1, IOSurfaceRef buffer, const __CFDictionary *a3, char a4, uint64_t a5)
{
  if (!buffer || !a1 || !a5)
  {
    uint64_t v12 = 3758097090;
    if (!log_level_enabled(1u, 0)) {
      return v12;
    }
    v14 = "Missing transform buffer reference";
    uint64_t v15 = 1029;
LABEL_134:
    log_msg(1, 0, 255, (uint64_t)"prepareTransformBuffersAndOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", v15, (uint64_t)v14, v13, v61);
    return v12;
  }
  *(void *)(a5 + 88) = 0;
  *(_DWORD *)(a5 + 4) = IOSurfaceGetID(buffer);
  *(_DWORD *)a5 = IOSurfaceGetID(a1);
  *(_DWORD *)(a5 + 72) = IOSurfaceGetWidth(a1);
  *(_DWORD *)(a5 + 76) = IOSurfaceGetHeight(a1);
  *(_DWORD *)(a5 + 112) = IOSurfaceGetWidth(buffer);
  *(_DWORD *)(a5 + 116) = IOSurfaceGetHeight(buffer);
  *(void *)(a5 + 80) = 0;
  if (!a3)
  {
    *(void *)(a5 + 32) |= 0x2000uLL;
LABEL_17:
    CFTypeRef v16 = IOSurfaceCopyValue(buffer, (CFStringRef)*MEMORY[0x263F0ED60]);
    if (v16)
    {
      io_connect_t v17 = v16;
      if (CFEqual(v16, (CFTypeRef)*MEMORY[0x263F0ED88]) || CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED80]))
      {
        uint64_t v12 = 0;
        int v18 = 1;
      }
      else if (CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED78]))
      {
        uint64_t v12 = 0;
        int v18 = 2;
      }
      else if (CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED98]))
      {
        uint64_t v12 = 0;
        int v18 = 3;
      }
      else if (CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED90]))
      {
        uint64_t v12 = 0;
        int v18 = 4;
      }
      else if (CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED70]))
      {
        uint64_t v12 = 0;
        int v18 = 5;
      }
      else if (CFEqual(v17, (CFTypeRef)*MEMORY[0x263F0ED68]))
      {
        uint64_t v12 = 0;
        int v18 = 6;
      }
      else
      {
        uint64_t v12 = 3758097090;
        if (log_level_enabled(1u, 0)) {
          log_msg(1, 0, 255, (uint64_t)"setCositeControl", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 916, (uint64_t)"Invalid cositing control", v60, v61);
        }
        int v18 = 0;
      }
      CFRelease(v17);
    }
    else
    {
      unint64_t v73 = 116;
      uint64_t BulkAttachments = IOSurfaceGetBulkAttachments();
      uint64_t v12 = BulkAttachments;
      if (v73 == 116 && BulkAttachments == 0) {
        char v52 = v75 - 1;
      }
      else {
        char v52 = -1;
      }
      if (v52 > 6u) {
        int v18 = 0;
      }
      else {
        int v18 = dword_21041AEB8[v52];
      }
    }
    if (!v12 && v18) {
      *(void *)(a5 + 32) |= (v18 << 15);
    }
    if (!v12 && (a4 & 1) == 0)
    {
      uint64_t v12 = 0;
      *(void *)(a5 + 32) |= 0x1000uLL;
    }
    return v12;
  }
  *(void *)v71 = 0;
  *(void *)v72 = 0;
  *(void *)v69 = 0;
  *(void *)v70 = 0;
  unsigned int v68 = 0;
  if (getNumber(a3, @"UnwireSurface", &v68)) {
    *(void *)(a5 + 32) |= (unint64_t)v68 << 35;
  }
  unsigned int v67 = 0;
  if (!getNumber(a3, @"Transform", &v67))
  {
LABEL_10:
    unsigned int v66 = 0;
    if (getNumber(a3, @"DitherControl", &v66))
    {
      unsigned int v10 = v66;
      if (v66 >= 4)
      {
        if (log_level_enabled(1u, 0)) {
          log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 375, (uint64_t)"Invalid dither control setting: 0x%x", v11, v66);
        }
        goto LABEL_132;
      }
    }
    else
    {
      unsigned int v10 = 1;
    }
    *(void *)(a5 + 32) |= v10 << 13;
    if (getBoolean(a3, @"CustomFilter")) {
      *(void *)(a5 + 32) |= 0x40uLL;
    }
    if (getBoolean(a3, @"NearestFilter")) {
      *(void *)(a5 + 32) |= 0x80uLL;
    }
    if (getBoolean(a3, @"OptOutBlitClip")) {
      *(void *)(a5 + 32) |= 0x100uLL;
    }
    if (getBoolean(a3, @"LockInScaler")) {
      *(void *)(a5 + 32) |= 0x200uLL;
    }
    if (getBoolean(a3, @"SkipAsyncCallback")) {
      *(void *)(a5 + 32) |= 0x400uLL;
    }
    if (getBoolean(a3, @"FixUpscaling")) {
      *(void *)(a5 + 32) |= 0x1000uLL;
    }
    unsigned int v65 = 0;
    if (getNumber(a3, @"AlphaOverride", &v65))
    {
      *(void *)(a5 + 32) |= 0x40000uLL;
      *(_DWORD *)(a5 + 168) = v65;
    }
    *(void *)(a5 + 204) = 0;
    unsigned int v64 = 0;
    if (getNumber(a3, @"WriteOnlyModeAlpha", &v64))
    {
      *(_WORD *)(a5 + 204) = v64;
      if (getNumber(a3, @"WriteOnlyModeRedLuma", &v64))
      {
        *(_WORD *)(a5 + 206) = v64;
        if (getNumber(a3, @"WriteOnlyModeGreenCb", &v64))
        {
          *(_WORD *)(a5 + 208) = v64;
          if (getNumber(a3, @"WriteOnlyModeBlueCr", &v64))
          {
            *(_WORD *)(a5 + 210) = v64;
            *(void *)(a5 + 32) |= 0x1000000000000uLL;
          }
        }
      }
    }
    if (getBoolean(a3, @"FilmGrainEnable")) {
      *(void *)(a5 + 32) |= 0x2000000000000uLL;
    }
    if (getNumber(a3, @"BorderFillX", &v72[1])
      && getNumber(a3, @"BorderFillY", v72)
      && getNumber(a3, @"BorderFillWidth", &v71[1])
      && getNumber(a3, @"BorderFillHeight", v71)
      && getNumber(a3, @"BorderFillRedY", v70)
      && getNumber(a3, @"BorderFillGreenCb", &v69[1])
      && getNumber(a3, @"BorderFillBlueCr", v69))
    {
      *(void *)(a5 + 32) |= 0x10000000uLL;
      unsigned int v19 = v72[0];
      *(_DWORD *)(a5 + 172) = v72[1];
      *(_DWORD *)(a5 + 176) = v19;
      unsigned int v20 = v71[0];
      *(_DWORD *)(a5 + 180) = v71[1];
      *(_DWORD *)(a5 + 184) = v20;
      unsigned int v21 = v69[1];
      *(_DWORD *)(a5 + 192) = v70[0];
      *(_DWORD *)(a5 + 196) = v21;
      *(_DWORD *)(a5 + 200) = v69[0];
      if (getNumber(a3, @"BorderFillAlpha", &v70[1])) {
        *(_DWORD *)(a5 + 188) = v70[1];
      }
    }
    if (getNumber(a3, @"HistogramBinMode", (unsigned int *)(a5 + 220)))
    {
      *(void *)(a5 + 32) |= 0x20000000uLL;
      getNumber(a3, @"HistogramOffsetX", (unsigned int *)(a5 + 224));
      getNumber(a3, @"HistogramOffsetY", (unsigned int *)(a5 + 228));
      getNumber(a3, @"HistogramWidth", (unsigned int *)(a5 + 232));
      getNumber(a3, @"HistogramHeight", (unsigned int *)(a5 + 236));
      if (*(_DWORD *)(a5 + 220) == 2)
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a3, @"HistogramPixelBins");
        CFIndex Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          CFIndex v24 = Count;
          for (CFIndex i = 0; i != v24; ++i)
          {
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, i);
            if (!ValueAtIndex || (CFNumberRef v27 = ValueAtIndex, v28 = CFGetTypeID(ValueAtIndex), v28 != CFNumberGetTypeID()))
            {
              if (log_level_enabled(1u, 0))
              {
                v55 = "Could not retrieve histogram bin array";
                uint64_t v56 = 557;
                goto LABEL_167;
              }
              goto LABEL_132;
            }
            LODWORD(valuePtr[0]) = 0;
            CFNumberGetValue(v27, kCFNumberSInt32Type, valuePtr);
            uint64_t v29 = LODWORD(valuePtr[0]);
            if (HIWORD(LODWORD(valuePtr[0])))
            {
              if (log_level_enabled(1u, 0)) {
                log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 550, (uint64_t)"Invalid histogram pixel value: %u", v57, v29);
              }
              goto LABEL_132;
            }
            *(_DWORD *)(a5 + 240 + 4 * i) = valuePtr[0];
          }
        }
      }
    }
    unsigned int v63 = 0;
    if (getNumber(a3, @"ZeroFill", &v63) && v63) {
      *(void *)(a5 + 32) |= 0x40000000uLL;
    }
    unsigned int v62 = 0;
    if (getNumber(a3, @"ColorRemapMode", &v62))
    {
      if (v62 >= 5) {
        goto LABEL_132;
      }
      *(void *)(a5 + 32) |= (unint64_t)v62 << 36;
    }
    if (getBoolean(a3, @"DisablePseudoLinearScaling")) {
      *(void *)(a5 + 32) |= 0x80000000uLL;
    }
    if (getBoolean(a3, @"PixelAveraging")) {
      *(void *)(a5 + 32) |= 0x100000000uLL;
    }
    if (getBoolean(a3, @"EdgeMirroring")) {
      *(void *)(a5 + 32) |= 0x200000000uLL;
    }
    if (getBoolean(a3, @"DirectionalScalingEnable")) {
      *(void *)(a5 + 32) |= 0x8000000000uLL;
    }
    if (getBoolean(a3, @"HDREnable")) {
      *(void *)(a5 + 32) |= 0x10000000000uLL;
    }
    if (getBoolean(a3, @"NoiseEstimationEnable")) {
      *(void *)(a5 + 32) |= 0x40000000000uLL;
    }
    if (getBoolean(a3, @"EnhanceEnable")) {
      *(void *)(a5 + 32) |= 0x20000000000uLL;
    }
    if (getBoolean(a3, @"ReadOnly")) {
      *(void *)(a5 + 32) |= 0x80000000000uLL;
    }
    if (getBoolean(a3, @"HtpcLargeHeaders")) {
      *(void *)(a5 + 32) |= 0x100000000000uLL;
    }
    if (getBoolean(a3, @"VraScaling")) {
      *(void *)(a5 + 32) |= 0x200000000000uLL;
    }
    if (getBoolean(a3, @"NoPowerEarlyBail")) {
      *(void *)(a5 + 32) |= 0x400000000000uLL;
    }
    if (getBoolean(a3, @"HighPriority") && log_level_enabled(1u, 0)) {
      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 689, (uint64_t)"HighPriority (kIOSurfaceAcceleratorHighPriorityCString) deprecated!\n", v30, v61);
    }
    if (getBoolean(a3, @"ReducedPrecisionFractionalOffsets")) {
      *(void *)(a5 + 32) |= 0x4000000000000uLL;
    }
    if (getBoolean(a3, @"NoCoalesceAsyncIOFenceWrites")) {
      *(void *)(a5 + 32) |= 0x8000000000000uLL;
    }
    if (getBoolean(a3, @"DestinationSurfaceDisplayBound")) {
      *(void *)(a5 + 32) |= 0x10000000000000uLL;
    }
    valuePtr[0] = 0;
    if (getNumberU64(a3, @"SharedEventSrcRef", valuePtr))
    {
      *(_DWORD *)(a5 + 120) = MEMORY[0x21056E560](valuePtr[0]);
      getNumberU64(a3, @"SharedEventSrcWait", (unint64_t *)(a5 + 128));
      getNumberU64(a3, @"SharedEventSrcSignal", (unint64_t *)(a5 + 136));
    }
    unint64_t v73 = 0;
    if (getNumberU64(a3, @"SharedEventDstRef", &v73))
    {
      *(_DWORD *)(a5 + 144) = MEMORY[0x21056E560](v73);
      getNumberU64(a3, @"SharedEventDstWait", (unint64_t *)(a5 + 152));
      getNumberU64(a3, @"SharedEventDstSignal", (unint64_t *)(a5 + 160));
    }
    for (uint64_t j = 0; j != 160; j += 40)
    {
      uint64_t v32 = a5 + j;
      *(_DWORD *)(v32 + 272) = 0;
      *(_DWORD *)(v32 + 292) = 0;
    }
    CFArrayRef v33 = (const __CFArray *)CFDictionaryGetValue(a3, @"IOSurfaceAcceleratorCommApi");
    if (v33)
    {
      CFArrayRef v34 = v33;
      CFIndex v35 = CFArrayGetCount(v33);
      if (v35 >= 1)
      {
        CFIndex v36 = v35;
        CFIndex v37 = 0;
        while (1)
        {
          CFDataRef v38 = (const __CFData *)CFArrayGetValueAtIndex(v34, v37);
          if (v38)
          {
            CFDataRef v39 = v38;
            CFIndex Length = CFDataGetLength(v38);
            if (Length)
            {
              CFIndex v41 = Length;
              BytePtr = CFDataGetBytePtr(v39);
              if (BytePtr)
              {
                if (v41 != 40)
                {
                  if (log_level_enabled(1u, 0))
                  {
                    v55 = "Invalid Comm data size\n";
                    uint64_t v56 = 787;
                    goto LABEL_167;
                  }
                  goto LABEL_132;
                }
                v43 = BytePtr;
                int v44 = *(_DWORD *)BytePtr;
                unsigned int v45 = *(_DWORD *)BytePtr;
                switch(*(_DWORD *)BytePtr)
                {
                  case 0:
                    break;
                  case 1:
                    unsigned int v45 = 0;
                    int v44 = 568;
                    break;
                  case 2:
                    int v44 = 36872;
                    unsigned int v45 = 1;
                    break;
                  case 3:
                    int v44 = *((_DWORD *)BytePtr + 4);
                    unsigned int v45 = 2;
                    break;
                  case 4:
                    int v44 = *((_DWORD *)BytePtr + 4);
                    unsigned int v45 = 3;
                    break;
                  default:
                    if (log_level_enabled(1u, 0)) {
                      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 831, (uint64_t)"Invalid inbound comm data type: %d\n", v59, *(unsigned int *)v43);
                    }
                    goto LABEL_132;
                }
                uint64_t v46 = a5 + 40 * v45;
                *(_DWORD *)(v46 + 272) = *(_DWORD *)BytePtr;
                *(_DWORD *)(v46 + 288) = v44;
                int v47 = *((_DWORD *)BytePtr + 5);
                int v48 = v47;
                switch(v47)
                {
                  case 0:
                    break;
                  case 1:
                    int v48 = 380;
                    break;
                  case 2:
                    int v48 = 4104;
                    break;
                  case 3:
                    int v48 = *((_DWORD *)BytePtr + 8);
                    break;
                  default:
                    if (log_level_enabled(1u, 0)) {
                      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 856, (uint64_t)"Invalid outbound comm data type: %d\n", v58, *((unsigned int *)v43 + 5));
                    }
                    goto LABEL_132;
                }
                uint64_t v49 = a5 + 40 * v45;
                *(_DWORD *)(v49 + 292) = v47;
                *(_DWORD *)(v49 + 304) = v48;
                *(void *)(v49 + 280) = *((void *)BytePtr + 1);
                *(void *)(v49 + 296) = *((void *)BytePtr + 3);
              }
            }
          }
          if (v36 == ++v37) {
            goto LABEL_17;
          }
        }
      }
    }
    goto LABEL_17;
  }
  if ((v67 & 0xFFFFFFFC & ((v67 & 0xFFFFFFFC) - 1)) == 0)
  {
    *(void *)(a5 + 32) |= v67;
    goto LABEL_10;
  }
  if (log_level_enabled(1u, 0))
  {
    uint64_t v61 = v67;
    v55 = "Invalid flip/rotate settings: 0x%x";
    uint64_t v56 = 351;
LABEL_167:
    log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", v56, (uint64_t)v55, v53, v61);
  }
LABEL_132:
  uint64_t v12 = 3758097090;
  if (log_level_enabled(1u, 0))
  {
    v14 = "Error decoding options dictionary\n";
    uint64_t v15 = 1039;
    goto LABEL_134;
  }
  return v12;
}

CFBooleanRef getBoolean(const __CFDictionary *a1, const __CFString *a2)
{
  CFBooleanRef result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result) {
    return (const __CFBoolean *)(CFBooleanGetValue(result) != 0);
  }
  return result;
}

BOOL getNumber(const __CFDictionary *a1, const __CFString *a2, unsigned int *a3)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  CFNumberRef v5 = Value;
  if (Value) {
    CFNumberGetValue(Value, kCFNumberIntType, a3);
  }
  return v5 != 0;
}

BOOL getNumberU64(const __CFDictionary *a1, const __CFString *a2, unint64_t *a3)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  CFNumberRef v5 = Value;
  if (Value) {
    CFNumberGetValue(Value, kCFNumberLongLongType, a3);
  }
  return v5 != 0;
}

uint64_t ioSurfaceAcceleratorClassInitialize()
{
  kIOSurfaceAcceleratorID = _CFRuntimeRegisterClass();

  return log_start(4, 2u, 0x3FFFFF, 0x37u);
}

uint64_t log_start(uint64_t result, unsigned int a2, int a3, unsigned __int8 a4)
{
  gIosaLogListenerMask = 0;
  gIosaLogListenerRegisteredCFIndex Count = 0;
  if (a2 >= 5) {
    int v4 = 5;
  }
  else {
    int v4 = a2;
  }
  gIosaLogVerbosity = v4;
  gIosaLogModuleMask = a3 & 0x3FFFFF;
  gIosaLogHeaderMask = a4;
  if ((result & 2) != 0)
  {
    gIosaLogListenerMask = 2;
    uint64_t v5 = 1;
    gIosaLogListenerRegisteredCFIndex Count = 1;
    gIosaLogListenerQueue[0] = (uint64_t)printf_listener;
    int v6 = 6;
    if ((result & 4) == 0) {
      return result;
    }
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  int v6 = 4;
  if ((result & 4) != 0)
  {
LABEL_8:
    gIosaLogListenerMask = v6;
    gIosaLogListenerRegisteredCFIndex Count = v5 + 1;
    gIosaLogListenerQueue[v5] = (uint64_t)syslog_listener;
  }
  return result;
}

uint64_t __checkIsVirtualized_block_invoke()
{
  int v6 = 0;
  size_t v5 = 4;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v6, &v5, 0, 0);
  if (result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = v6 == 0;
  }
  char v2 = !v1;
  checkIsVirtualized_is_virtualized = v2;
  if (!v1)
  {
    int v6 = 0;
    size_t v5 = 4;
    uint64_t result = sysctlbyname("debug.iosa.simulated_model", &v6, &v5, 0, 0);
    if (result) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = v6 == 0;
    }
    char v4 = v3;
    checkIsVirtualized_is_virtualized = v4;
  }
  return result;
}

uint64_t log_set_verbosity(uint64_t result)
{
  if (result >= 5) {
    int v1 = 5;
  }
  else {
    int v1 = result;
  }
  gIosaLogVerbosity = v1;
  return result;
}

uint64_t log_set_module_mask(uint64_t result)
{
  gIosaLogModuleMask = result & 0x3FFFFF;
  return result;
}

uint64_t log_set_header_mask(uint64_t result)
{
  gIosaLogHeaderMask = result;
  return result;
}

uint64_t printf_listener(int *a1, const char *a2, va_list a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  log_format_munge(__str, a2, a1);
  return vprintf(__str, a3);
}

void syslog_listener(int *a1, const char *a2, char *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  log_format_munge(__str, a2, a1);
  uint64_t v5 = a1[1];
  if (v5 > 5) {
    int v6 = -1;
  }
  else {
    int v6 = dword_21041AEA0[v5];
  }
  vsyslog(v6, __str, a3);
}

uint64_t log_level_enabled(unsigned int a1, int a2)
{
  if (a2 == 1) {
    return 1;
  }
  else {
    return (gIosaLogVerbosity >= a1) & (gIosaLogModuleMask >> a2);
  }
}

uint64_t log_msg(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!gIosaLogListenerMask) {
    return result;
  }
  char v10 = gIosaLogHeaderMask & a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  LODWORD(v12) = gIosaLogHeaderMask & a3;
  if ((gIosaLogHeaderMask & a3 & 1) == 0)
  {
    if ((gIosaLogHeaderMask & a3 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_17:
    DWORD1(v12) = result;
    if ((gIosaLogHeaderMask & a3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  *(void *)&long long v13 = "IOSA";
  if ((gIosaLogHeaderMask & a3 & 2) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if ((gIosaLogHeaderMask & a3 & 4) != 0) {
LABEL_5:
  }
    DWORD2(v12) = a2;
LABEL_6:
  if ((gIosaLogHeaderMask & a3 & 0x38) != 0)
  {
    *((void *)&v13 + 1) = a4;
    *(void *)&long long v14 = a5;
    *((void *)&v14 + 1) = a6;
  }
  if ((gIosaLogHeaderMask & a3 & 0x40) != 0) {
    uint64_t result = pthread_threadid_np(0, (__uint64_t *)&v15);
  }
  if (v10 < 0)
  {
    uint64_t result = mach_continuous_time();
    *((void *)&v15 + 1) = result;
  }
  if (gIosaLogListenerRegisteredCount)
  {
    unint64_t v11 = 0;
    do
      uint64_t result = ((uint64_t (*)(long long *, uint64_t, uint64_t *))gIosaLogListenerQueue[v11++])(&v12, a7, &a9);
    while (v11 < gIosaLogListenerRegisteredCount);
  }
  return result;
}

uint64_t log_panic_debug_enabled()
{
  return 0;
}

void log_panic_debug(int a1, const char *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v10 = snprintf(__str, 0x200uLL, "[%s][%s:%zu, %s] ", log_module_desc[a1], a3, a4, a2);
  vsnprintf(&__str[v10], 512 - v10, a5, &a9);
  syslog(3, "%s", __str);
  abort();
}

uint64_t log_format_munge(char *__str, const char *a2, int *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v6 = *a3;
  if (*a3)
  {
    int v8 = snprintf(__str, 0xFFuLL, "[%-*s]", 4, *((const char **)a3 + 2));
    if ((v8 - 256) < 0xFFFFFF01) {
      log_format_munge();
    }
    unsigned int v7 = v8;
    int v6 = *a3;
    if ((*a3 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v7 = 0;
    if ((v6 & 2) == 0) {
      goto LABEL_3;
    }
  }
  v7 += snprintf(&__str[v7], 255 - v7, "[%-*s]", 5, log_level_desc[a3[1]]);
  if (v7 - 256 < 0xFFFFFF01) {
    log_format_munge();
  }
  int v6 = *a3;
  if ((*a3 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x80) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    v7 += snprintf(&__str[v7], 255 - v7, "[0x%016llx]", *((void *)a3 + 7));
    if (v7 - 256 < 0xFFFFFF01) {
      log_format_munge();
    }
    int v6 = *a3;
    if ((*a3 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_11:
  v7 += snprintf(&__str[v7], 255 - v7, "[0x%08llx]", *((void *)a3 + 6));
  if (v7 - 256 < 0xFFFFFF01) {
    log_format_munge();
  }
  int v6 = *a3;
  if ((*a3 & 0x80) != 0) {
    goto LABEL_13;
  }
LABEL_5:
  if ((v6 & 4) != 0)
  {
LABEL_15:
    v7 += snprintf(&__str[v7], 255 - v7, "[%-*s]", 12, log_module_desc[a3[2]]);
    if (v7 - 256 < 0xFFFFFF01) {
      log_format_munge();
    }
    int v6 = *a3;
  }
  if ((v6 & 0x38) == 0) {
    goto LABEL_28;
  }
LABEL_17:
  if ((~v6 & 0x18) == 0)
  {
    CFStringRef v9 = (const char *)*((void *)a3 + 4);
    size_t v10 = strlen(v9) - 1;
    size_t v11 = v10;
    while (v11)
    {
      size_t v12 = v11 - 1;
      BOOL v13 = v9[v11] != 47 || v11 >= v10;
      --v11;
      if (!v13)
      {
        size_t v14 = v12 + 2;
        goto LABEL_31;
      }
    }
    size_t v14 = 0;
LABEL_31:
    str_truncate(v24, &v9[v14]);
    str_truncate(v23, *((const char **)a3 + 3));
    if ((v7 & 0x80000000) != 0) {
      log_format_munge();
    }
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s %*s:%-*lu]", 24, v23, 24, v24, 4, *((void *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00) {
      log_format_munge();
    }
    goto LABEL_46;
  }
  if ((v6 & 0x10) != 0)
  {
    CFTypeRef v16 = (const char *)*((void *)a3 + 4);
    size_t v17 = strlen(v16) - 1;
    size_t v18 = v17;
    while (v18)
    {
      size_t v19 = v18 - 1;
      BOOL v20 = v16[v18] != 47 || v18 >= v17;
      --v18;
      if (!v20)
      {
        size_t v21 = v19 + 2;
        goto LABEL_42;
      }
    }
    size_t v21 = 0;
LABEL_42:
    str_truncate(v24, &v16[v21]);
    if ((v7 & 0x80000000) != 0) {
      log_format_munge();
    }
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s:%-*lu]", 24, v24, 4, *((void *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00) {
      log_format_munge();
    }
    goto LABEL_46;
  }
  if ((v6 & 8) != 0)
  {
    str_truncate(v24, *((const char **)a3 + 3));
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s:%-*lu]", 24, v24, 4, *((void *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00) {
      log_format_munge();
    }
  }
  else
  {
LABEL_28:
    if (!v7)
    {
      uint64_t v15 = 0;
      return snprintf(&__str[v15], 255 - v15, "%s", a2);
    }
  }
LABEL_46:
  if (v7 == 255)
  {
    uint64_t v15 = 255;
  }
  else
  {
    uint64_t v15 = v7 + 1;
    __str[v7] = 32;
  }
  return snprintf(&__str[v15], 255 - v15, "%s", a2);
}

char *str_truncate(char *a1, const char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 > 0x18)
  {
    int v8 = &__s[v4];
    strncpy(a1, __s, 0x10uLL);
    a1[16] = 46;
    uint64_t v5 = a1 + 17;
    int v6 = v8 - 7;
    size_t v7 = 7;
  }
  else
  {
    uint64_t v5 = a1;
    int v6 = __s;
    size_t v7 = 24;
  }

  return strncpy(v5, v6, v7);
}

uint64_t IOSurfaceAcceleratorGetTypeID()
{
  uint64_t result = kIOSurfaceAcceleratorID;
  if (!kIOSurfaceAcceleratorID)
  {
    pthread_once(&IOSurfaceAcceleratorGetTypeID_once, (void (*)(void))ioSurfaceAcceleratorClassInitialize);
    return kIOSurfaceAcceleratorID;
  }
  return result;
}

uint64_t IOSurfaceAcceleratorGetServiceObject(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 3758097084;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 32);
      *a3 = *(_DWORD *)(a1 + 36);
    }
  }
  return result;
}

uint64_t srs_getStrength(const __CFDictionary *a1)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"Strength");
  if (!Value) {
    return 0;
  }
  CFStringRef v2 = Value;
  uint64_t v3 = 1;
  if (CFStringCompare(Value, @"StrengthWeak", 1uLL))
  {
    if (CFStringCompare(v2, @"StrengthNormal", 1uLL) == kCFCompareEqualTo) {
      return 0;
    }
    if (CFStringCompare(v2, @"StrengthStrong", 1uLL) == kCFCompareEqualTo) {
      return 3;
    }
    uint64_t v3 = 0;
    if (log_level_enabled(2u, 0))
    {
      log_msg(2, 0, 255, (uint64_t)"srs_getStrength", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 367, (uint64_t)"unknown sharpener strength\n", v4, v6);
      return 0;
    }
  }
  return v3;
}

uint64_t IOSurfaceAcceleratorGetID(mach_port_t *a1, mach_port_t *a2)
{
  uint32_t outputCnt = 1;
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    if (a1[11] == 1)
    {
      uint64_t result = 0;
      a1[10] = 255;
    }
    else
    {
      mach_port_t v5 = a1[10];
      if (v5)
      {
        uint64_t result = 0;
      }
      else
      {
        uint64_t output = 0;
        uint64_t result = IOConnectCallScalarMethod(a1[9], 5u, 0, 0, &output, &outputCnt);
        if (result)
        {
          mach_port_t v5 = a1[10];
        }
        else
        {
          mach_port_t v5 = output;
          a1[10] = output;
        }
      }
      *a2 = v5;
    }
  }
  return result;
}

CFRunLoopSourceRef IOSurfaceAcceleratorGetRunLoopSource(CFRunLoopSourceRef result)
{
  if (result)
  {
    CFRunLoopSourceRef v1 = result;
    uint64_t result = (CFRunLoopSourceRef)*((void *)result + 3);
    if (!result)
    {
      CFStringRef v2 = (IONotificationPort *)*((void *)v1 + 2);
      if (v2 || (CFStringRef v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]), (*((void *)v1 + 2) = v2) != 0))
      {
        uint64_t v3 = *((unsigned int *)v1 + 9);
        uint64_t MachPort = IONotificationPortGetMachPort(v2);
        MEMORY[0x21056E470](v3, 0, MachPort, 0);
        uint64_t result = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v1 + 2));
        *((void *)v1 + 3) = result;
      }
      else
      {
        return (CFRunLoopSourceRef)*((void *)v1 + 3);
      }
    }
  }
  return result;
}

uint64_t IOSurfaceAcceleratorTransferSurface(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return convertToTransform(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t convertToTransform(uint64_t a1, __IOSurface *a2, IOSurfaceRef buffer, const __CFDictionary *a4, uint32x2_t *a5, long long *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  if (a7)
  {
    *((void *)&v13 + 1) = a7;
    *(void *)&long long v14 = a8;
    *((void *)&v14 + 1) = a9;
  }
  if (a5 && a6)
  {
    unint64_t v11 = (a5[2].i32[1] << 14) | ((unint64_t)a5->u32[1] << 16);
    *((void *)&v15 + 1) = (a5[2].i32[0] << 14) | ((unint64_t)a5->u32[0] << 16);
    *(void *)&v16[0] = v11;
    *(uint64x2_t *)((char *)v16 + 8) = vshll_n_u32(a5[1], 0x10uLL);
    long long v17 = *a6;
  }
  uint64_t result = prepareTransformBuffersAndOptions(a2, buffer, a4, 1, (uint64_t)&v13);
  if (!result) {
    return transformSurface(a1, (char *)&v13, a4);
  }
  return result;
}

uint64_t IOSurfaceAcceleratorAbortTransfers(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 36), 2u, 0, 0, 0, 0);
}

uint64_t IOSurfaceAcceleratorTransferSurfaceWithSwap()
{
  return 0;
}

uint64_t IOSurfaceAcceleratorConditionalTransferSurfaceWithSwap(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  return convertToTransform(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorBlitSurface(uint64_t a1, __IOSurface *a2, uint32x2_t *a3, IOSurfaceRef buffer, long long *a5, const __CFDictionary *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return convertToTransform(a1, a2, buffer, a6, a3, a5, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorBlitSurfaceWithSwap()
{
  return 0;
}

uint64_t IOSurfaceAcceleratorAbortCaptures(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 36), 3u, 0, 0, 0, 0);
}

uint64_t IOSurfaceAcceleratorCaptureSurface(uint64_t a1, IOSurfaceRef buffer, const __CFDictionary *a3, int a4, unsigned int a5, unsigned int a6, int a7, int a8, int a9, int a10, long long a11, uint64_t a12)
{
  uint64_t v19 = 3758097090;
  long long inputStruct = a11;
  uint64_t v24 = a12;
  uint64_t v25 = 0;
  IOSurfaceID ID = IOSurfaceGetID(buffer);
  unsigned int v27 = a5;
  unsigned int v28 = a6;
  int v29 = a7;
  int v30 = a8;
  int v31 = a9;
  int v32 = a10;
  int v33 = a4;
  if (a9 + a7 <= a5 && a10 + a8 <= a6)
  {
    if (!a3) {
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    }
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"Transform");
    if (!Value) {
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    }
    int valuePtr = 0;
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if ((valuePtr & 0xFFFFFFFC & ((valuePtr & 0xFFFFFFFC) - 1)) == 0)
    {
      uint64_t v25 = 2 * valuePtr;
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    }
  }
  return v19;
}

uint64_t IOSurfaceAcceleratorSetFilterCoefficients(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = 3758097085;
  fprintf((FILE *)*MEMORY[0x263EF8348], "WARNING: Use of %s is DEPRECATED. Please use IOSurfaceAcceleratorSetCustomFilter SPI instead.\n", "IOReturn IOSurfaceAcceleratorSetFilterCoefficients(IOSurfaceAcceleratorRef, IOSurfaceAcceleratorFilter *)");
  mach_port_t v5 = malloc_type_malloc(0x600uLL, 0xA1BA475EuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    size_t v7 = a2 + 321;
    int v8 = a2 + 129;
    CFStringRef v9 = a2 + 193;
    size_t v10 = a2 + 1;
    char v11 = 1;
    while (1)
    {
      char v12 = v11;
      unsigned int v13 = *a2 & 0xF;
      if (v13 > 7)
      {
        uint64_t v4 = 3758097090;
        goto LABEL_26;
      }
      uint64_t v14 = 0;
      long long v15 = v7;
      CFTypeRef v16 = v6;
      do
      {
        for (uint64_t i = 0; i != 16; ++i)
          v16[i] = v15[i * 4];
        ++v14;
        ++v15;
        v16 += 16;
      }
      while (v14 != 4);
      uint64_t v18 = 0;
      uint64_t v19 = v8;
      do
      {
        for (uint64_t j = 0; j != 16; ++j)
          v16[j] = v19[j * 4];
        ++v18;
        ++v19;
        v16 += 16;
      }
      while (v18 != 4);
      uint64_t v21 = 0;
      long long v22 = v9;
      do
      {
        for (uint64_t k = 0; k != 128; k += 8)
          *v16++ = v22[k];
        ++v21;
        ++v22;
      }
      while (v21 != 8);
      uint64_t v24 = 0;
      uint64_t v25 = v10;
      do
      {
        for (uint64_t m = 0; m != 128; m += 8)
          *v16++ = v25[m];
        ++v24;
        ++v25;
      }
      while (v24 != 8);
      uint64_t v27 = IOSurfaceAcceleratorSetCustomFilter(a1, (0x40000 - (v13 << 15)) >> 3, 4, 16, (0x40000 - (v13 << 15)) >> 3, 8, 16, (uint64_t)v6);
      if (v27) {
        break;
      }
      if ((*a2 & 0x80000000) != 0)
      {
        char v11 = 0;
        a2 += 385;
        v7 += 385;
        v8 += 385;
        v9 += 385;
        v10 += 385;
        if (v12) {
          continue;
        }
      }
      uint64_t v4 = 0;
      goto LABEL_26;
    }
    uint64_t v4 = v27;
LABEL_26:
    free(v6);
  }
  return v4;
}

uint64_t IOSurfaceAcceleratorKernelTests(uint64_t a1, _DWORD *inputStruct)
{
  if (*inputStruct <= 0x3E8u) {
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 6u, inputStruct, 0xFA8uLL, 0, 0);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceAcceleratorGetHistogram(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 3758097084;
  uint64_t result = 3758097090;
  if (a1 && a2)
  {
    unsigned int valuePtr = 0;
    CFDictionaryRef v6 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(*(_DWORD *)(a1 + 32), "IOService", @"IOSurfaceAcceleratorCapabilitiesDict", 0, 0);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      uint64_t inputStruct = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"kSurfaceAcceleratorCapabilitiesHistogramValues");
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        uint64_t v9 = a2 + 4;
        uint64_t inputStruct = a2 + 4;
        uint64_t v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 7u, &inputStruct, 8uLL, 0, 0);
        if (!v3)
        {
          *(void *)(a2 + 1544) = v9;
          unsigned int v10 = valuePtr;
          *(void *)(a2 + 1552) = v9 + 4 * valuePtr;
          *(void *)(a2 + 1560) = v9 + 8 * v10;
          *(_DWORD *)a2 = v10;
        }
      }
      CFRelease(v7);
      return v3;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t IOSurfaceAcceleratorGetFrameworkInfo(void *a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    *a1 = 0;
    return 3758097136;
  }
  return result;
}

uint64_t IOSurfaceAcceleratorGetDiag(uint64_t a1, _DWORD *a2)
{
  uint64_t inputStruct = a2;
  uint64_t v2 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = 3758097089;
      if (*a2 == 1766084715)
      {
        uint64_t v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 8u, &inputStruct, 8uLL, 0, 0);
        if (v2) {
          fprintf((FILE *)*MEMORY[0x263EF8348], "[iosaDiag] IOSurfaceAcceleratorGetDiag returned %x\n", v2);
        }
      }
    }
  }
  return v2;
}

double IOSurfaceAcceleratorGetTransformEstimation(uint64_t a1, IOSurfaceRef buffer, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a6)
  {
    uint64_t v13 = 0;
    long long v14 = 0uLL;
    memset(v15, 0, sizeof(v15));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    inputStruct[0] = v15;
    inputStruct[1] = &v13;
    DWORD2(v16) = IOSurfaceGetWidth(buffer);
    HIDWORD(v16) = IOSurfaceGetHeight(buffer);
    LODWORD(v19) = IOSurfaceGetWidth(a3);
    DWORD1(v19) = IOSurfaceGetHeight(a3);
    prepareTransformRectangles(a5, (uint64_t)v15);
    if (!prepareTransformBuffersAndOptions(buffer, a3, a4, 0, (uint64_t)v15))
    {
      IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 9u, inputStruct, 0x10uLL, 0, 0);
      *(_DWORD *)a6 = v13;
      double result = *(double *)&v14;
      *(_OWORD *)(a6 + 8) = v14;
    }
  }
  return result;
}

uint64_t IOSurfaceAcceleratorParavirtProcessGuestData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 3758097090;
  if (a2 && *(_DWORD *)(a1 + 36))
  {
    if (*(_DWORD *)a2 == 2)
    {
      uint64_t v9 = (const void *)(a2 + 8);
      if (*(void *)(a2 + 16))
      {
        *(void *)(a2 + 16) = 0;
        *(void *)(a2 + 24) = 0;
        *(void *)(a2 + 32) = 0;
      }
      *(_DWORD *)(a2 + 128) = 0;
      *(void *)(a2 + 136) = 0;
      *(void *)(a2 + 144) = 0;
      *(_DWORD *)(a2 + 152) = 0;
      *(void *)(a2 + 160) = 0;
      *(void *)(a2 + 168) = 0;
      mach_port_t v7 = *(_DWORD *)(a1 + 36);
      uint32_t v8 = 1;
      size_t v10 = 432;
      mach_port_t v5 = 0;
      CFDictionaryRef v6 = 0;
    }
    else
    {
      if (*(_DWORD *)a2 != 1) {
        goto LABEL_11;
      }
      mach_port_t v5 = *(void **)(a2 + 16);
      if (!v5) {
        goto LABEL_11;
      }
      CFDictionaryRef v6 = (size_t *)(a2 + 24);
      mach_port_t v7 = *(_DWORD *)(a1 + 36);
      uint32_t v8 = 11;
      uint64_t v9 = 0;
      size_t v10 = 0;
    }
    uint64_t result = IOConnectCallStructMethod(v7, v8, v9, v10, v5, v6);
LABEL_11:
    *(_DWORD *)(a2 + 4) = result;
  }
  return result;
}

CFStringRef ioSurfaceAcceleratorCopyFormatDescription(const void *a1, const __CFDictionary *a2)
{
  CFIndex v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOSurface %p refcnt=%d>", a1, v4);
}

uint64_t ioSurfaceAcceleratorCopyDebugDescription()
{
  return 0;
}

void log_format_munge()
{
  __assert_rtn("operator()", "Log.cpp", 319, "char_count >= 0");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 390, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 415, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 403, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 361, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 353, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 345, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 337, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 329, "( char_count > 0) &&(char_count < length)");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

uint64_t IOSurfaceSharedEventGetMachPort()
{
  return MEMORY[0x270EF4E80]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x270EDBB00](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}