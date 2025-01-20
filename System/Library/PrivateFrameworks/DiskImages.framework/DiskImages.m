uint64_t DIHLDiskImageAttach()
{
  return 4294967246;
}

uint64_t DIGetBundleRef()
{
  if (pthread_mutex_lock(&stru_267D20230)) {
    return 0;
  }
  if (!qword_267D202C0)
  {
    *__error() = 0;
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.DiskImagesFramework");
    qword_267D202C0 = (uint64_t)BundleWithIdentifier;
    if (BundleWithIdentifier)
    {
      CFRetain(BundleWithIdentifier);
    }
    else if (dword_267D202C8)
    {
      v1 = __error();
      sub_21DC37AC8("DIGetBundleRef returned NULL, error %d\n", *v1);
    }
  }
  if (pthread_mutex_unlock(&stru_267D20230)) {
    return 0;
  }
  else {
    return qword_267D202C0;
  }
}

void sub_21DC019E4(void *context, CFDictionaryRef theDict, unint64_t a3)
{
  if (a3 <= 2) {
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)off_26CE86E70[a3], context);
  }
}

void sub_21DC01A10(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFDictionarySetValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

void DIAddPermission(__CFDictionary *a1, int a2)
{
  if (a1)
  {
    if (a2 == 3)
    {
      v2 = (const void **)MEMORY[0x263EFFB40];
      goto LABEL_7;
    }
    if (a2 == 1)
    {
      v2 = (const void **)MEMORY[0x263EFFB38];
LABEL_7:
      CFDictionarySetValue(a1, @"writeable", *v2);
      return;
    }
    CFDictionaryRemoveValue(a1, @"writeable");
  }
}

uint64_t DI_kextExists()
{
  mach_port_t v0 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v1 = IOServiceMatching("IOHDIXController");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService) {
    return 3758097088;
  }
  IOObjectRelease(MatchingService);
  return 0;
}

uint64_t DIInitialize()
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (sub_21DC01FB0()) {
    return 0;
  }
  int v32 = 0;
  if (pthread_mutex_lock(&stru_267D201F0)) {
    return *__error();
  }
  if (byte_267D202B8)
  {
LABEL_63:
    uint64_t result = pthread_mutex_unlock(&stru_267D201F0);
    if (!result) {
      return result;
    }
    return *__error();
  }
  *__error() = 0;
  if (DIGetBundleRef())
  {
    dword_267D202BC = getpid();
    int v32 = dword_267D202BC;
    sysctlbyname("vfs.generic.noremotehang", 0, 0, &v32, 4uLL);
    CFStringRef v1 = (const __CFString *)sub_21DC02040();
    if (!sub_21DC02048(v1, 0))
    {
      if (v1) {
        CFRelease(v1);
      }
      CFStringRef v1 = (const __CFString *)sub_21DC02040();
      sub_21DC02048(v1, 0);
    }
    if (v1) {
      CFRelease(v1);
    }
    CFStringRef v2 = (const __CFString *)sub_21DC02040();
    if (sub_21DC02048(v2, 0))
    {
      int v3 = v32;
      v4 = getprogname();
      if (v4)
      {
        v5 = v4;
        if (snprintf(__str, 0x400uLL, "%s%s", "/tmp/", "DiskImages-debug/") <= 1023
          && (mkdir(__str, 0x3FFu) != -1 || *__error() == 17)
          && snprintf(v34, 0x400uLL, "%s%s.%d.txt", __str, v5, v3) <= 1023)
        {
          int v6 = open(v34, 2818, 384);
          if (v6 == -1)
          {
            sub_21DC3C828();
            if (!v2) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
          int v7 = v6;
          dup2(v6, 1);
          dup2(v7, 2);
          if (v7 >= 3) {
            close(v7);
          }
        }
      }
    }
    if (!v2)
    {
LABEL_23:
      if (qword_267D20278)
      {
        CFRelease((CFTypeRef)qword_267D20278);
        qword_267D20278 = 0;
      }
      qword_267D20278 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      int v8 = sub_21DC02284();
      if (v8 >= 1)
      {
        uint64_t v9 = v8;
        v10 = &off_26B546B70;
        do
        {
          if (*v10)
          {
            v11 = (const void *)(*v10)();
            sub_21DC02390(v11);
            if (v11) {
              CFRelease(v11);
            }
          }
          v10 += 7;
          --v9;
        }
        while (v9);
      }
      int v12 = sub_21DC02520(1);
      if (v12 >= 1)
      {
        uint64_t v13 = v12;
        v14 = off_26B546C18;
        do
        {
          if (*v14)
          {
            v15 = (const void *)(*v14)();
            sub_21DC02390(v15);
            if (v15) {
              CFRelease(v15);
            }
          }
          v14 += 7;
          --v13;
        }
        while (v13);
      }
      int v16 = sub_21DC02520(2);
      if (v16 >= 1)
      {
        uint64_t v17 = v16;
        v18 = &off_26B546C88;
        do
        {
          if (*v18)
          {
            v19 = (const void *)(*v18)();
            sub_21DC02390(v19);
            if (v19) {
              CFRelease(v19);
            }
          }
          v18 += 7;
          --v17;
        }
        while (v17);
      }
      int v20 = sub_21DC02520(3);
      if (v20 >= 1)
      {
        uint64_t v21 = v20;
        v22 = (uint64_t (**)(void))&qword_267D20280;
        do
        {
          if (*v22)
          {
            v23 = (const void *)(*v22)();
            sub_21DC02390(v23);
            if (v23) {
              CFRelease(v23);
            }
          }
          v22 += 7;
          --v21;
        }
        while (v21);
      }
      int v24 = sub_21DC02860();
      if (v24 >= 1)
      {
        uint64_t v25 = v24;
        v26 = (uint64_t (**)(void))&qword_26B546CF8;
        do
        {
          if (*v26)
          {
            v27 = (const void *)(*v26)();
            sub_21DC02390(v27);
            if (v27) {
              CFRelease(v27);
            }
          }
          v26 += 11;
          --v25;
        }
        while (v25);
      }
      *__error() = 0;
      CFStringRef v28 = (const __CFString *)sub_21DC02040();
      int v29 = sub_21DC02048(v28, 0);
      byte_267D20270 = v29;
      if (getenv("DISKIMAGEOBJECTTRACKING")) {
        int v30 = 1;
      }
      else {
        int v30 = v29;
      }
      byte_267D20270 = v30;
      if (v28)
      {
        CFRelease(v28);
        int v30 = byte_267D20270;
      }
      if (v30)
      {
        printf("\x1B[7mDIInitialize: starting DiskImageObject tracking\n\x1B[0m");
        sub_21DC2C5FC();
      }
      int v32 = -v32;
      sysctlbyname("vfs.generic.noremotehang", 0, 0, &v32, 4uLL);
      byte_267D202B8 = 1;
      goto LABEL_63;
    }
LABEL_22:
    CFRelease(v2);
    goto LABEL_23;
  }
  unsigned int v31 = *__error();
  pthread_mutex_unlock(&stru_267D201F0);
  if (v31) {
    return v31;
  }
  else {
    return 119;
  }
}

uint64_t sub_21DC01FB0()
{
  if (pthread_mutex_lock(&stru_267D201F0)) {
    return 0;
  }
  if (byte_267D202B8 == 1)
  {
    if (dword_267D202BC)
    {
      if (getpid() == dword_267D202BC)
      {
        unsigned int v0 = 1;
        goto LABEL_9;
      }
      dword_267D202BC = 0;
    }
    unsigned int v0 = 0;
    byte_267D202B8 = 0;
  }
  else
  {
    unsigned int v0 = 0;
  }
LABEL_9:
  if (pthread_mutex_unlock(&stru_267D201F0)) {
    return 0;
  }
  else {
    return v0;
  }
}

uint64_t sub_21DC02040()
{
  return 0;
}

uint64_t sub_21DC02048(const __CFString *a1, unsigned __int8 a2)
{
  unsigned __int8 v6 = a2;
  int v3 = sub_21DC0208C(a1, &v6);
  unsigned __int8 v4 = v6;
  if (!v3) {
    return a2;
  }
  return v4;
}

uint64_t sub_21DC0208C(const __CFString *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFBooleanGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v5 = 1;
      if (CFStringCompare(a1, @"YES", 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 1;
        return v5;
      }
      uint64_t v5 = 1;
      if (CFStringCompare(a1, @"TRUE", 1uLL) == kCFCompareEqualTo
        || (uint64_t v5 = 1, CFStringCompare(a1, @"1", 1uLL) == kCFCompareEqualTo))
      {
        *a2 = 1;
        return v5;
      }
      if (CFStringCompare(a1, @"NO", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, @"FALSE", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, @"0", 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 0;
        return 1;
      }
    }
    else
    {
      CFTypeID v7 = CFGetTypeID(a1);
      if (v7 == CFNumberGetTypeID())
      {
        double valuePtr = 0.0;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr))
        {
          *a2 = valuePtr != 0.0;
          return 1;
        }
      }
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

uint64_t sub_21DC02204(char *bsdName)
{
  if (!bsdName) {
    return 0;
  }
  mach_port_t v1 = *MEMORY[0x263F0EC90];
  CFStringRef v2 = IOBSDNameMatching(*MEMORY[0x263F0EC90], 0, bsdName);
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFDictionarySetValue(v2, @"IOProviderClass", @"IOMedia");
  return IOServiceGetMatchingService(v1, v3);
}

uint64_t sub_21DC02284()
{
  if (!off_26B546B98) {
    return 0;
  }
  LODWORD(result) = 0;
  mach_port_t v1 = &off_26B546BD0;
  do
  {
    uint64_t result = (result + 1);
    CFStringRef v2 = *v1;
    v1 += 7;
  }
  while (v2);
  return result;
}

__CFDictionary *sub_21DC022B4()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_21DC3A890(v1, (int)@"BSD backing store", @"BSD backing store");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CBackingStore");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CBSDBackingStore");
    if (v2) {
      CFRelease(v2);
    }
  }
  return Mutable;
}

void sub_21DC02390(const void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFDictionaryGetTypeID())
    {
      CFDictionaryRef v3 = (__CFArray *)qword_267D20278;
      CFArrayAppendValue(v3, a1);
    }
    else
    {
      CFTypeID v4 = CFGetTypeID(a1);
      if (v4 == CFArrayGetTypeID())
      {
        uint64_t v5 = (__CFArray *)qword_267D20278;
        v6.length = CFArrayGetCount((CFArrayRef)a1);
        v6.location = 0;
        CFArrayAppendArray(v5, (CFArrayRef)a1, v6);
      }
    }
  }
}

__CFDictionary *sub_21DC02444()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_21DC3A890(v1, (int)@"vectored backing store", @"vectored backing store");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CBackingStore");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CVectoredBackingStore");
    if (v2) {
      CFRelease(v2);
    }
  }
  return Mutable;
}

uint64_t sub_21DC02520(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  int v1 = off_264477E48[a1 - 1];
  if (!v1[5]) {
    return 0;
  }
  LODWORD(result) = 0;
  CFDictionaryRef v3 = (uint64_t *)(v1 + 12);
  do
  {
    uint64_t result = (result + 1);
    uint64_t v4 = *v3;
    v3 += 7;
  }
  while (v4);
  return result;
}

__CFArray *sub_21DC02560()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFTypeRef v2 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v3 = DIGetBundleRef();
  CFTypeRef v4 = sub_21DC3A890(v3, (int)@"128-bit AES encryption", @"128-bit AES encryption");
  CFDictionaryAddValue(v2, @"plugin-class", @"CFileEncoding");
  CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
  CFDictionaryAddValue(v2, @"plugin-name", v4);
  CFDictionaryAddValue(v2, @"plugin-key", @"AES-128");
  uint64_t v5 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(v2, @"plugin-encryption", (const void *)*MEMORY[0x263EFFB40]);
  if (v4) {
    CFRelease(v4);
  }
  CFArrayAppendValue(Mutable, v2);
  if (v2) {
    CFRelease(v2);
  }
  CFRange v6 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v7 = DIGetBundleRef();
  CFTypeRef v8 = sub_21DC3A890(v7, (int)@"256-bit AES encryption (recommended)", @"256-bit AES encryption (recommended)");
  CFDictionaryAddValue(v6, @"plugin-class", @"CFileEncoding");
  CFDictionaryAddValue(v6, @"plugin-type", @"builtin");
  CFDictionaryAddValue(v6, @"plugin-name", v8);
  CFDictionaryAddValue(v6, @"plugin-key", @"AES-256");
  CFDictionaryAddValue(v6, @"plugin-encryption", v5);
  if (v8) {
    CFRelease(v8);
  }
  CFArrayAppendValue(Mutable, v6);
  if (v6) {
    CFRelease(v6);
  }
  return Mutable;
}

__CFDictionary *sub_21DC02768()
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_21DC3A890(v1, (int)@"UDIF encoding", @"UDIF encoding");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CFileEncoding");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CUDIFEncoding");
    CFDictionaryAddValue(Mutable, @"plugin-encryption", (const void *)*MEMORY[0x263EFFB38]);
    if (v2) {
      CFRelease(v2);
    }
  }
  return Mutable;
}

uint64_t sub_21DC02860()
{
  if (!off_26B546D40) {
    return 0;
  }
  LODWORD(result) = 0;
  int v1 = &off_26B546D98;
  do
  {
    uint64_t result = (result + 1);
    CFTypeRef v2 = *v1;
    v1 += 11;
  }
  while (v2);
  return result;
}

__CFDictionary *sub_21DC02890()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
    int v3 = DIGetBundleRef();
    CFTypeRef v4 = sub_21DC3A890(v3, (int)@"UDIF disk image", @"UDIF disk image");
    CFDictionaryAddValue(v2, @"plugin-name", v4);
    if (v4) {
      CFRelease(v4);
    }
    CFDictionaryAddValue(v2, @"plugin-key", @"CUDIFDiskImage");
    uint64_t v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    CFRange v6 = (const void *)*MEMORY[0x263EFFB38];
    sub_21DC2E00C(v5, @"read-only", @"CUDIFDiskImage", @"read-only format", @"UDRO", @"dmg", (const void *)*MEMORY[0x263EFFB38]);
    int v7 = (const void *)*MEMORY[0x263EFFB40];
    sub_21DC2E00C(v5, @"compressed (ADC)", @"CUDIFDiskImage", @"compressed format with ADC", @"UDCO", @"dmg", (const void *)*MEMORY[0x263EFFB40]);
    sub_21DC2E00C(v5, @"compressed", @"CUDIFDiskImage", @"compressed format with zlib", @"UDZO", @"dmg", v6);
    sub_21DC2E00C(v5, @"compressed (lzfse)", @"CUDIFDiskImage", @"compressed format with lzfse", @"ULFO", @"dmg", v7);
    sub_21DC2E00C(v5, @"entire device", @"CUDIFDiskImage", @"complete format", @"UFBI", @"dmg", v7);
    sub_21DC2E00C(v5, @"iPod image", @"CUDIFDiskImage", @"complete format", @"IPOD", @"ipodimage", v7);
    CFDictionaryAddValue(v2, @"plugin-diskimage-convert", v5);
    if (v5) {
      CFRelease(v5);
    }
    CFTypeRef v8 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    sub_21DC2E294(v8, @"CRC-32 image checksum", @"CUDIFDiskImage", @"UDIF CRC-32 image checksum", @"UDIF-CRC32", v6);
    sub_21DC2E294(v8, @"MD5 image checksum", @"CUDIFDiskImage", @"UDIF MD5 image checksum", @"UDIF-MD5", v7);
    sub_21DC2E294(v8, @"iPod image checksum", @"CUDIFDiskImage", @"iPod image checksum", @"IPOD", v7);
    CFDictionaryAddValue(v2, @"plugin-diskimage-checksum", v8);
    if (v8) {
      CFRelease(v8);
    }
  }
  return v2;
}

__CFDictionary *sub_21DC02B94()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
    int v3 = DIGetBundleRef();
    CFTypeRef v4 = sub_21DC3A890(v3, (int)@"sparse disk image", @"sparse disk image");
    CFDictionaryAddValue(v2, @"plugin-name", v4);
    if (v4) {
      CFRelease(v4);
    }
    CFDictionaryAddValue(v2, @"plugin-key", @"CSparseDiskImage");
    uint64_t v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    CFRange v6 = (const void *)*MEMORY[0x263EFFB40];
    sub_21DC2E00C(v5, @"sparse", @"CSparseDiskImage", @"sparse format", @"UDSP", @"sparseimage", (const void *)*MEMORY[0x263EFFB40]);
    CFDictionaryAddValue(v2, @"plugin-diskimage-convert", v5);
    if (v5) {
      CFRelease(v5);
    }
    int v7 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    sub_21DC2E130(v7, @"sparse disk image", @"CSparseDiskImage", @"name of disk image we create", @"SPARSE", @"sparseimage", (const void *)*MEMORY[0x263EFFB38], v6, 0);
    CFDictionaryAddValue(v2, @"plugin-diskimage-create", v7);
    if (v7) {
      CFRelease(v7);
    }
  }
  return v2;
}

__CFDictionary *sub_21DC02D70()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v2 = DIGetBundleRef();
    CFTypeRef v3 = sub_21DC3A890(v2, (int)@"raw disk image", @"raw disk image");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v3);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CRawDiskImage");
    if (v3) {
      CFRelease(v3);
    }
    CFTypeRef v4 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    uint64_t v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    CFRange v6 = (const void *)*MEMORY[0x263EFFB38];
    sub_21DC2E00C(v5, @"read/write", @"CUDIFDiskImage", @"type of disk image we create", @"UDRW", @"dmg", (const void *)*MEMORY[0x263EFFB38]);
    sub_21DC2E00C(v5, @"DVD/CD master", @"CUDIFDiskImage", @"type of disk image we create", @"UDTO", @"cdr", v6);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert", v5);
    int v7 = CFArrayCreateMutable(v0, 0, v4);
    CFTypeRef v8 = (const void *)*MEMORY[0x263EFFB40];
    sub_21DC2E294(v7, @"CRC-32", @"CRawDiskImage", @"raw CRC-32 checksum", @"CRC32", (const void *)*MEMORY[0x263EFFB40]);
    sub_21DC2E294(v7, @"MD5", @"CRawDiskImage", @"raw MD5 checksum", @"MD5", v8);
    sub_21DC2E294(v7, @"SHA", @"CRawDiskImage", @"raw SHA checksum", @"SHA", v8);
    sub_21DC2E294(v7, @"SHA-1", @"CRawDiskImage", @"raw SHA-1 checksum", @"SHA1", v8);
    sub_21DC2E294(v7, @"SHA-256", @"CRawDiskImage", @"raw SHA-256 checksum", @"SHA256", v8);
    sub_21DC2E294(v7, @"SHA-384", @"CRawDiskImage", @"raw SHA-384 checksum", @"SHA384", v8);
    sub_21DC2E294(v7, @"SHA-512", @"CRawDiskImage", @"raw SHA-512 checksum", @"SHA512", v8);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum", v7);
    if (v7) {
      CFRelease(v7);
    }
    uint64_t v9 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    sub_21DC2E130(v9, @"read/write disk image", @"CRawDiskImage", @"type of disk image we create", @"UDIF", @"dmg", v6, v6, 0);
    sub_21DC2E130(v9, @"DVD/CD master", @"CRawDiskImage", @"type of disk image we create", @"UDTO", @"cdr", v6, v6, 0);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-create", v9);
    if (v9) {
      CFRelease(v9);
    }
    v10 = CFArrayCreateMutable(v0, 0, MEMORY[0x263EFFF70]);
    v11 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    int v12 = DIGetBundleRef();
    CFTypeRef v13 = sub_21DC3A890(v12, (int)@"hybrid image (HFS+/ISO/UDF)", @"hybrid image (HFS+/ISO/UDF)");
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-name", v13);
    if (v13) {
      CFRelease(v13);
    }
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-key", @"UNIV");
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-extension", @"dmg");
    CFArrayAppendValue(v10, v11);
    if (v11) {
      CFRelease(v11);
    }
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-iff", v10);
    if (v10) {
      CFRelease(v10);
    }
  }
  return Mutable;
}

uint64_t DIResolveURLToBackingStore(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, CFTypeRef *a5)
{
  CFStringRef appendedString = 0;
  uint64_t v17 = 0;
  v15 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v10 = 22;
  if (a1 && a4)
  {
    if (!sub_21DC01FB0()) {
      return 119;
    }
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (!Mutable) {
      return 999;
    }
    int v12 = Mutable;
    uint64_t v10 = DIBackingStoreNewWithCFURL(a1, a2, (uint64_t)&v17, (uint64_t)&appendedString);
    if (appendedString) {
      CFStringAppend(v12, appendedString);
    }
    if (!v10)
    {
      if (!a3)
      {
LABEL_34:
        uint64_t v10 = 0;
LABEL_35:
        if (appendedString)
        {
          CFRelease(appendedString);
          CFStringRef appendedString = 0;
        }
        *a4 = v17;
        if (a5)
        {
          *a5 = v12;
          if (!CFStringGetLength(v12) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0;
          }
        }
        else
        {
          CFRelease(v12);
        }
        return v10;
      }
      unsigned int v13 = 0;
      while (1)
      {
        if ((a3 >> v13))
        {
          do
          {
            if (appendedString)
            {
              CFRelease(appendedString);
              CFStringRef appendedString = 0;
            }
            uint64_t v10 = sub_21DC05454(v13, (uint64_t)v17, a2, (uint64_t)&v15, (uint64_t)&appendedString);
            if (appendedString) {
              CFStringAppend(v12, appendedString);
            }
            if (v10 != 110)
            {
              if (v10) {
                goto LABEL_30;
              }
              if (v17) {
                DIDiskImageObjectRelease(v17);
              }
              uint64_t v17 = v15;
            }
          }
          while (!(v10 | v13));
          uint64_t v10 = 0;
LABEL_30:
          if (appendedString)
          {
            CFRelease(appendedString);
            CFStringRef appendedString = 0;
          }
          if (v10) {
            break;
          }
        }
        if (++v13 == 3) {
          goto LABEL_34;
        }
      }
    }
    if (v17)
    {
      DIDiskImageObjectRelease(v17);
      uint64_t v17 = 0;
    }
    goto LABEL_35;
  }
  return v10;
}

uint64_t DIBackingStoreNewWithCFURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!off_26B546B98) {
    return 110;
  }
  int v8 = 0;
  unsigned int v9 = 0;
  uint64_t v10 = &off_26B546BD0;
  unsigned int v11 = -1;
  do
  {
    int v12 = (uint64_t (*)(uint64_t, uint64_t))*(v10 - 11);
    if (v12)
    {
      int v13 = v12(a1, a2);
      if (v13 > v8)
      {
        unsigned int v11 = v9;
        int v8 = v13;
      }
    }
    ++v9;
    v14 = *v10;
    v10 += 7;
  }
  while (v14);
  if ((v11 & 0x80000000) != 0) {
    return 110;
  }
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26B546B70 + 7 * v11 + 2);
  if (!v15) {
    return 78;
  }
  return v15(a1, a2, a3, a4);
}

uint64_t sub_21DC034AC(const __CFURL *a1, CFDictionaryRef theDict)
{
  if (!a1 || (sub_21DC035B8(theDict, @"backingstore-class", @"CBSDBackingStore") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"backingstore-class", @"CBSDBackingStore") > 0) {
    return 1000;
  }
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0)
     || CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0)))
  {
    return 4294966296;
  }
  CFStringRef v5 = CFURLCopyScheme(a1);
  if (!v5) {
    return 4294966296;
  }
  CFStringRef v6 = v5;
  if (CFStringCompare(v5, @"file", 0) || CFURLHasDirectoryPath(a1))
  {
    uint64_t v4 = 4294966296;
  }
  else if (sub_21DC03698(a1, &v8))
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 100;
  }
  CFRelease(v6);
  return v4;
}

uint64_t sub_21DC035B8(CFDictionaryRef theDict, const void *a2, const __CFString *a3)
{
  uint64_t result = 0;
  if (theDict)
  {
    if (a2)
    {
      if (a3)
      {
        value = 0;
        uint64_t result = CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value);
        if (result)
        {
          CFTypeID v6 = CFGetTypeID(value);
          if (v6 == CFStringGetTypeID())
          {
            if (CFStringCompare((CFStringRef)value, a3, 0)) {
              return 0xFFFFFFFFLL;
            }
            else {
              return 1;
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21DC03648(const __CFDictionary *a1, const void *a2, unsigned __int8 a3)
{
  if (a1)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      unsigned __int8 v6 = a3;
      if (sub_21DC0208C(Value, &v6)) {
        return v6;
      }
    }
  }
  return a3;
}

uint64_t sub_21DC03698(const __CFURL *a1, stat *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  CFTypeRef v3 = (const char *)sub_21DC036F4(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = (char *)v3;
  uint64_t v5 = stat(v3, a2);
  if ((v5 & 0x80000000) != 0) {
    uint64_t v5 = *__error();
  }
  free(v4);
  return v5;
}

CFStringRef sub_21DC036F4(const __CFURL *a1)
{
  CFStringRef result = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (result)
  {
    CFStringRef v2 = result;
    CFTypeRef v3 = sub_21DC0373C(result, 0x8000100u);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

void *sub_21DC0373C(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  unsigned __int8 v6 = malloc_type_malloc(v5, 0x1F3DE694uLL);
  if (v6 && !CFStringGetCString(a1, (char *)v6, v5, a2))
  {
    free(v6);
    return 0;
  }
  return v6;
}

uint64_t sub_21DC037B8(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"backingstore-class", @"CVectoredBackingStore") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"backingstore-class", @"CVectoredBackingStore") > 0) {
    return 1000;
  }
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0)
     || CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0)))
  {
    return 4294966296;
  }
  CFStringRef v6 = CFURLCopyScheme(a1);
  uint64_t v4 = 4294966296;
  if (v6)
  {
    CFStringRef v7 = v6;
    if (CFStringCompare(v6, @"vectored", 0)) {
      uint64_t v4 = 4294966296;
    }
    else {
      uint64_t v4 = 9999;
    }
    CFRelease(v7);
  }
  return v4;
}

uint64_t sub_21DC03898(const __CFURL *a1, uint64_t a2, void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  if (!a1)
  {
    uint64_t v7 = 22;
LABEL_9:
    *a3 = 0;
    return v7;
  }
  uint64_t v5 = sub_21DC03698(a1, &v10);
  if (v5)
  {
    uint64_t v7 = v5;
    if ((v5 & 0x80000000) != 0)
    {
      unsigned int v9 = *__error();
      if (v9) {
        uint64_t v7 = v9;
      }
      else {
        uint64_t v7 = 999;
      }
    }
    goto LABEL_9;
  }
  int v6 = v10.st_mode & 0xF000;
  uint64_t v7 = 102;
  if (v6 != 4096 && v6 != 0x4000) {
    operator new();
  }
  return v7;
}

void sub_21DC03B04(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10F1C40D1CC5EF5);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC03B28(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3 = sub_21DC03BC4(a1, a2);
  *(void *)uint64_t v3 = &unk_26CE84398;
  *(void *)(v3 + 336) = 0;
  *(void *)(v3 + 344) = 0;
  *(_DWORD *)(v3 + 320) = -1;
  *(void *)(v3 + 280) = 0;
  *(_DWORD *)(v3 + 288) = 0;
  *(void *)(v3 + 296) = 0;
  *(unsigned char *)(v3 + 304) = 0;
  *(void *)(v3 + 328) = 0;
  *(void *)(v3 + 312) = 0;
  *(unsigned char *)(v3 + 369) = 0;
  sub_21DC04008(v3, @"thread-safe", (const void *)*MEMORY[0x263EFFB40]);
  return a1;
}

void sub_21DC03BAC(_Unwind_Exception *a1)
{
  sub_21DC04B3C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC03BC4(uint64_t a1, const __CFDictionary *a2)
{
  sub_21DC03C98(a1);
  void *v4 = &unk_26CE87648;
  int v8 = 0x100000;
  int valuePtr = 4;
  v4[25] = 0;
  v4[26] = 0;
  if (a2)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"bs-cache-depth");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    }
    CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a2, @"bs-cache-entry-size");
    if (v6) {
      CFNumberGetValue(v6, kCFNumberSInt32Type, &v8);
    }
  }
  sub_21DC03E34(a1);
  return a1;
}

void sub_21DC03C80(_Unwind_Exception *a1)
{
  sub_21DC04D5C(v1);
  _Unwind_Resume(a1);
}

double sub_21DC03C98(uint64_t a1)
{
  uint64_t v1 = sub_21DC03CF0(a1);
  *(void *)uint64_t v1 = &unk_26CE840C0;
  *(_DWORD *)(v1 + 104) = 0;
  *(void *)(v1 + 184) = 0;
  *(unsigned char *)(v1 + 192) = 0;
  *(void *)(v1 + 112) = 0;
  *(void *)(v1 + 120) = 0;
  *(unsigned char *)(v1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 164) = 0u;
  return result;
}

uint64_t sub_21DC03CF0(uint64_t a1)
{
  *(void *)a1 = &unk_26CE846C8;
  *(void *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 8) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 16), 0);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = Mutable;
  DIDiskImageObjectRetain_0((char *)a1);
  if (qword_267D202D0) {
    CFArrayAppendValue((CFMutableArrayRef)qword_267D202D0, (const void *)a1);
  }
  return a1;
}

uint64_t DIDiskImageObjectRetain_0(char *a1)
{
  CFStringRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = (*((_DWORD *)a1 + 2) + 1);
  *((_DWORD *)a1 + 2) = v3;
  if (qword_267D202D0)
  {
    uint64_t v4 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v5 = (const char *)(*(uint64_t (**)(char *))(*(void *)a1 + 16))(a1);
    fprintf(v4, "\x1B[34m\x1B[43mCDiskImageObject::retain: object %s %p refCount is %d.\x1B[0m\n", v5, a1, v3);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t sub_21DC03E34(uint64_t result)
{
  if (!*(void *)(result + 208))
  {
    pthread_mutex_init((pthread_mutex_t *)(result + 216), 0);
    operator new();
  }
  return result;
}

void sub_21DC03EB8(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C4079B348B8);
  _Unwind_Resume(a1);
}

void *sub_21DC03EDC(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  a1[4] = a2;
  a1[5] = a3;
  *a1 = &unk_26CE87930;
  a1[1] = a5;
  uint64_t v7 = malloc_type_calloc((2 * a4) | 1, 0x18uLL, 0x1010040A79CA2DEuLL);
  a1[2] = 0;
  a1[3] = v7;
  if (a4 >= 1) {
    operator new();
  }
  return a1;
}

void sub_21DC03FE4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10F1C4066F82E81);
  _Unwind_Resume(a1);
}

BOOL sub_21DC04008(uint64_t a1, void *key, const void *a3)
{
  if (key)
  {
    uint64_t v4 = *(__CFDictionary **)(a1 + 96);
    if (a3) {
      CFDictionarySetValue(v4, key, a3);
    }
    else {
      CFDictionaryRemoveValue(v4, key);
    }
  }
  return key != 0;
}

uint64_t sub_21DC0404C(uint64_t a1, const __CFURL *a2)
{
  sub_21DC04178((void *)a1, a2);
  uint64_t v4 = sub_21DC03698(a2, &v10);
  if (!v4)
  {
    __darwin_time_t tv_sec = v10.st_mtimespec.tv_sec;
    *(void *)(a1 + 280) = v10.st_ino;
    *(_DWORD *)(a1 + 288) = v10.st_dev;
    *(void *)(a1 + 200) = v10.st_size;
    CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%ld", tv_sec);
    if (v6) {
      (*(void (**)(uint64_t, __CFString *, CFStringRef))(*(void *)a1 + 32))(a1, @"bs-modtime", v6);
    }
    uint64_t v7 = *(void **)(a1 + 296);
    if (v7)
    {
      free(v7);
      *(void *)(a1 + 296) = 0;
    }
    CFStringRef v8 = sub_21DC036F4(a2);
    *(void *)(a1 + 296) = v8;
    if (!v8)
    {
      uint64_t v4 = 999;
      if (!v6) {
        return v4;
      }
      goto LABEL_8;
    }
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 728))(a1);
    if (v6) {
LABEL_8:
    }
      CFRelease(v6);
  }
  return v4;
}

uint64_t sub_21DC04178(void *a1, CFURLRef anURL)
{
  if (!anURL) {
    return 22;
  }
  CFURLRef v2 = anURL;
  CFStringRef v4 = CFURLCopyUserName(anURL);
  if (!v4) {
    goto LABEL_7;
  }
  CFStringRef v5 = v4;
  CFURLRef v6 = (const __CFURL *)sub_21DC1BB74((uint64_t)v2, 0, 0);
  if (!v6)
  {
    CFRelease(v5);
LABEL_7:
    values = v2;
    CFRetain(v2);
    goto LABEL_8;
  }
  CFURLRef v7 = v6;
  values = v6;
  CFRelease(v5);
  CFURLRef v2 = v7;
LABEL_8:
  unsigned int v9 = (const void *)a1[18];
  if (v9) {
    CFRelease(v9);
  }
  a1[18] = v2;
  CFStringRef v10 = CFURLCopyPath(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 512))(a1, v10);
  if (v10) {
    CFRelease(v10);
  }
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 520))(a1, PathComponent);
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  CFStringRef v12 = CFURLCopyPathExtension(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 528))(a1, v12);
  if (v12) {
    CFRelease(v12);
  }
  CFArrayRef v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, MEMORY[0x263EFFF70]);
  (*(void (**)(void *, CFArrayRef))(*a1 + 536))(a1, v13);
  if (v13) {
    CFRelease(v13);
  }
  return 0;
}

void sub_21DC04374(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 136);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 136) = cf;
  if (cf)
  {
    CFRetain(cf);
  }
}

void sub_21DC043CC(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 112);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 112) = cf;
  if (cf)
  {
    CFRetain(cf);
  }
}

void sub_21DC04424(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 120);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 120) = cf;
  if (cf)
  {
    CFRetain(cf);
  }
}

void sub_21DC0447C(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFStringRef v4 = *(const void **)(a1 + 152);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 152) = cf;
}

uint64_t sub_21DC044BC(uint64_t a1)
{
  CFStringRef v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"d%d:i%llu", *(unsigned int *)(a1 + 288), *(void *)(a1 + 280));
  if (!v2) {
    return 999;
  }
  CFStringRef v3 = v2;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 552))(a1, v2);
  CFRelease(v3);
  return 0;
}

void sub_21DC0455C(uint64_t a1, CFTypeRef cf)
{
  CFRetain(cf);
  CFStringRef v4 = *(const void **)(a1 + 160);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 160) = cf;
}

uint64_t sub_21DC04598(uint64_t result)
{
  if (result)
  {
    double result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, @"writeable");
    if (result)
    {
      if (CFBooleanGetValue((CFBooleanRef)result)) {
        return 3;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_21DC045D4(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (sub_21DC03648(a2, @"skip-flushing", 0)) {
    *(unsigned char *)(a1 + 304) = 1;
  }
  if (sub_21DC03648(a2, @"di-bsd-log-io", 0))
  {
    CFStringRef v4 = basename(*(char **)(a1 + 296));
    pid_t v5 = getpid();
    snprintf(__str, 0x400uLL, "/tmp/%s-%d.log", v4, v5);
    syslog(5, "CBSDBackingStore: using log file: %s\n", __str);
    *(void *)(a1 + 328) = fopen(__str, "a");
  }
  if (sub_21DC03648(a2, @"mp-apple-quarantine", 0)) {
    sub_21DC04008(a1, @"mp-apple-quarantine", (const void *)*MEMORY[0x263EFFB40]);
  }
  if (sub_21DC03648(a2, @"bs-cache", 1u)) {
    sub_21DC03E34(a1);
  }
  else {
    sub_21DC04BA8(a1);
  }
  return 0;
}

uint64_t sub_21DC0472C(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t DIDiskImageObjectRelease(char *a1)
{
  return sub_21DC0474C(a1);
}

uint64_t sub_21DC0474C(char *a1)
{
  os_log_create("com.apple.diskimages", "DIDiskimageObject");
  if (!a1) {
    return 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  int v2 = *((_DWORD *)a1 + 2);
  *((_DWORD *)a1 + 2) = v2 - 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if (!qword_267D202D0)
  {
    if (v2 != 1) {
      return 0;
    }
LABEL_9:
    (*(void (**)(char *))(*(void *)a1 + 8))(a1);
    return 1;
  }
  if (v2 < 2)
  {
    CFStringRef v4 = (FILE *)*MEMORY[0x263EF8348];
    pid_t v5 = (const char *)(*(uint64_t (**)(char *))(*(void *)a1 + 16))(a1);
    if (v2 != 1)
    {
      fprintf(v4, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p \x1B[5m\x1B[7mrefCount is %d.\x1B[0m\n");
      return 0;
    }
    fprintf(v4, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d. \x1B[7mfreeing object.\x1B[0m\n", v5, a1, 0);
    goto LABEL_9;
  }
  CFStringRef v3 = (FILE *)*MEMORY[0x263EF8348];
  (*(void (**)(char *))(*(void *)a1 + 16))(a1);
  fprintf(v3, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d.\x1B[0m\n");
  return 0;
}

void sub_21DC048B8(uint64_t a1)
{
  sub_21DC04924(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC04900(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10F1C40D1CC5EF5);
  _Unwind_Resume(a1);
}

void *sub_21DC04924(uint64_t a1)
{
  int v2 = (void (**)(void, uint64_t))&unk_26CE84398;
  *(void *)a1 = &unk_26CE84398;
  CFStringRef v3 = *(FILE **)(a1 + 328);
  if (v3)
  {
    fclose(v3);
    int v2 = *(void (***)(void, uint64_t))a1;
  }
  v2[35](a1, 1);
  *(void *)(a1 + 280) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(void *)(a1 + 200) = 0;
  CFStringRef v4 = *(void **)(a1 + 296);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 296) = 0;
  }
  pid_t v5 = *(const void **)(a1 + 312);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 312) = 0;
  }
  return sub_21DC04B3C((void *)a1);
}

void sub_21DC049E0(_Unwind_Exception *a1)
{
  sub_21DC04B3C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC049F8(uint64_t *a1)
{
  (*(void (**)(uint64_t *))(*a1 + 584))(a1);
  if (((*(uint64_t (**)(uint64_t *))(*a1 + 568))(a1) & 1) == 0 && *((_DWORD *)a1 + 80) != -1)
  {
    if (a1[26] && (*(unsigned int (**)(uint64_t *))(*a1 + 72))(a1)) {
      sub_21DC05D9C(a1[26], a1[25]);
    }
    close(*((_DWORD *)a1 + 80));
    if (a1[26] && !stat((const char *)a1[37], &v3)) {
      *((_OWORD *)a1 + 22) = v3.st_mtimespec;
    }
    *((_DWORD *)a1 + 80) = -1;
  }
  return 0;
}

uint64_t sub_21DC04B08(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 168);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + 168) = v4;
  }
  return result;
}

BOOL sub_21DC04B2C(uint64_t a1)
{
  return *(_DWORD *)(a1 + 168) > 0;
}

void *sub_21DC04B3C(void *a1)
{
  *a1 = &unk_26CE87648;
  sub_21DC04BA8((uint64_t)a1);
  return sub_21DC04D5C((uint64_t)a1);
}

void sub_21DC04B90(_Unwind_Exception *a1)
{
  sub_21DC04D5C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC04BA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 208);
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 8))(result);
    uint64_t result = pthread_mutex_destroy((pthread_mutex_t *)(a1 + 216));
  }
  *(void *)(a1 + 208) = 0;
  return result;
}

void sub_21DC04C00(uint64_t a1)
{
  sub_21DC04C6C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC04C48(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C4079B348B8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC04C6C(uint64_t a1)
{
  *(void *)a1 = &unk_26CE87930;
  for (i = *(void **)(a1 + 16); i; i = *(void **)(a1 + 16))
  {
    *(void *)(a1 + 16) = i[9];
    (*(void (**)(void *))(*i + 8))(i);
  }
  free(*(void **)(a1 + 24));
  return a1;
}

void sub_21DC04CF0(uint64_t a1)
{
  *(void *)a1 = &unk_26CE87950;
  free(*(void **)(a1 + 40));
  *(void *)(a1 + 40) = 0;
  JUMPOUT(0x223C15E40);
}

void *sub_21DC04D5C(uint64_t a1)
{
  *(void *)a1 = &unk_26CE840C0;
  *(_DWORD *)(a1 + 104) = 0;
  int v2 = *(const void **)(a1 + 136);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 136) = 0;
  }
  stat v3 = *(const void **)(a1 + 112);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 112) = 0;
  }
  int v4 = *(const void **)(a1 + 120);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 120) = 0;
  }
  pid_t v5 = *(const void **)(a1 + 160);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 160) = 0;
  }
  CFURLRef v6 = *(const void **)(a1 + 144);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 144) = 0;
  }
  CFURLRef v7 = *(const void **)(a1 + 152);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v8 = *(char **)(a1 + 184);
  if (v8)
  {
    DIDiskImageObjectRelease(v8);
    *(void *)(a1 + 184) = 0;
  }
  return sub_21DC04E48((void *)a1);
}

void sub_21DC04E20(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

BOOL sub_21DC04E38(uint64_t a1)
{
  return *(_DWORD *)(a1 + 176) > 0;
}

void *sub_21DC04E48(void *a1)
{
  *a1 = &unk_26CE846C8;
  int v2 = (pthread_mutex_t *)(a1 + 2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 2));
  pthread_mutex_unlock(v2);
  CFArrayRef v3 = (const __CFArray *)qword_267D202D0;
  if (qword_267D202D0)
  {
    v7.length = CFArrayGetCount((CFArrayRef)qword_267D202D0);
    v7.location = 0;
    FirstIndexOfCFNumberRef Value = CFArrayGetFirstIndexOfValue(v3, v7, a1);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_267D202D0, FirstIndexOfValue);
    }
  }
  pid_t v5 = (const void *)a1[12];
  if (v5)
  {
    CFRelease(v5);
    a1[12] = 0;
  }
  pthread_mutex_destroy(v2);
  return a1;
}

uint64_t DIResolveURLToDiskImage(uint64_t a1, const __CFDictionary *a2, unsigned int a3, void *a4, CFTypeRef *a5)
{
  v18 = 0;
  v19 = 0;
  CFStringRef appendedString = 0;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v10 = 22;
  if (a1 && a4)
  {
    if (sub_21DC01FB0())
    {
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (Mutable)
      {
        CFArrayRef v13 = Mutable;
        if (a2) {
          CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v11, 0, a2);
        }
        else {
          CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        }
        v15 = MutableCopy;
        if (CFDictionaryGetValue(MutableCopy, @"shadow-file")) {
          DIAddPermission(v15, 1);
        }
        uint64_t v10 = DIResolveURLToBackingStore(a1, (uint64_t)v15, a3, &v19, (CFTypeRef *)&appendedString);
        if (appendedString) {
          CFStringAppend(v13, appendedString);
        }
        if (!v10)
        {
          if (appendedString)
          {
            CFRelease(appendedString);
            CFStringRef appendedString = 0;
          }
          uint64_t v10 = sub_21DC07384((uint64_t)v19, a2, &v18, (CFTypeRef *)&appendedString);
          if (appendedString) {
            CFStringAppend(v13, appendedString);
          }
          if (v10 && v18)
          {
            DIDiskImageObjectRelease(v18);
            v18 = 0;
          }
        }
        if (v19)
        {
          DIDiskImageObjectRelease(v19);
          v19 = 0;
        }
        if (v15) {
          CFRelease(v15);
        }
        if (appendedString)
        {
          CFRelease(appendedString);
          CFStringRef appendedString = 0;
        }
        *a4 = v18;
        if (a5)
        {
          *a5 = v13;
          if (!CFStringGetLength(v13) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0;
          }
        }
        else
        {
          CFRelease(v13);
        }
      }
      else
      {
        return 999;
      }
    }
    else
    {
      return 119;
    }
  }
  return v10;
}

uint64_t sub_21DC050DC(uint64_t a1, int a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    if (!a2) {
      return 0;
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1) == a2) {
      return 0;
    }
    return 13;
  }
  CFStringRef v5 = (const __CFString *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"exclusive-open-locks-are-optional");
  int v6 = sub_21DC02048(v5, 0);
  *(unsigned char *)(a1 + 368) = v6;
  if (a2)
  {
    if (a2 == 3)
    {
      CFRange v7 = *(const char **)(a1 + 296);
      int v8 = 2;
    }
    else
    {
      if (a2 != 1) {
        return 22;
      }
      CFRange v7 = *(const char **)(a1 + 296);
      int v8 = 0;
    }
    int v9 = sub_21DC05354(v7, v8, v6, 438);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_15;
    }
LABEL_23:
    uint64_t result = *__error();
    if (result) {
      return result;
    }
    goto LABEL_16;
  }
  int v9 = sub_21DC05354(*(const char **)(a1 + 296), 2, v6, 438);
  if (v9 < 0)
  {
    int v9 = sub_21DC05354(*(const char **)(a1 + 296), 0, *(unsigned __int8 *)(a1 + 368), 438);
    if (v9 < 0)
    {
      a2 = 3;
      goto LABEL_23;
    }
    a2 = 1;
  }
  else
  {
    a2 = 3;
  }
LABEL_15:
  close(v9);
LABEL_16:
  return sub_21DC05448(a1, a2);
}

const void *sub_21DC05264(void *a1, CFTypeRef cf1)
{
  if (CFEqual(cf1, @"bs-persistentID"))
  {
    if (!a1[39])
    {
      uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 752))(a1);
      if (v4)
      {
        CFStringRef v5 = (const void *)v4;
        a1[39] = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"i:%llu on %@", a1[35], v4);
        CFRelease(v5);
      }
    }
    return (const void *)a1[39];
  }
  else
  {
    return sub_21DC05340((uint64_t)a1, cf1);
  }
}

const void *sub_21DC05340(uint64_t a1, const void *a2)
{
  if (a2) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 96), a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC05354(const char *a1, int a2, int a3, uint64_t a4)
{
  if ((a2 & 3) == 2) {
    int v8 = 36;
  }
  else {
    int v8 = 20;
  }
  uint64_t v9 = open(a1, v8 | a2, a4);
  uint64_t v10 = v9;
  if ((v9 & 0x80000000) != 0)
  {
    int v12 = *__error();
    if (v12 == 45 || a3 && v12 == 35)
    {
      uint64_t v10 = open(a1, a2 & 0xFFFFFFCB, a4);
      if ((v10 & 0x80000000) != 0)
      {
        int v13 = *__error();
        *__error() = v13;
      }
    }
    else
    {
      *__error() = v12;
    }
  }
  else
  {
    int v11 = fcntl(v9, 3, 0);
    if ((v11 & 0x80000000) == 0) {
      fcntl(v10, 4, v11 & 0xFFFFFFFB);
    }
  }
  return v10;
}

uint64_t sub_21DC05448(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 104) = a2;
  return 0;
}

uint64_t sub_21DC05454(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > 2) {
    return 110;
  }
  CFStringRef v5 = off_264477E30[a1];
  if (!v5[5]) {
    return 110;
  }
  unsigned int v10 = 0;
  int v11 = 0;
  uint64_t v12 = (int)a1;
  int v13 = (uint64_t *)(v5 + 12);
  unsigned int v14 = -1;
  do
  {
    v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 11);
    if (v15)
    {
      int v16 = v15(a2, a3);
      if (v16 > v11)
      {
        unsigned int v14 = v10;
        int v11 = v16;
      }
    }
    ++v10;
    uint64_t v17 = *v13;
    v13 += 7;
  }
  while (v17);
  if ((v14 & 0x80000000) != 0) {
    return 110;
  }
  v18 = off_264477E30[v12][7 * v14 + 2];
  if (!v18) {
    return 78;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v18)(a2, a3, a4, a5);
}

uint64_t sub_21DC0555C(_DWORD *a1)
{
  if ((*(uint64_t (**)(_DWORD *))(*(void *)a1 + 568))(a1)) {
    goto LABEL_14;
  }
  int v2 = a1[80];
  if (v2 != -1) {
    goto LABEL_13;
  }
  if ((*(unsigned int (**)(_DWORD *))(*(void *)a1 + 72))(a1)) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  if (*((unsigned char *)a1 + 192)) {
    v3 |= 0x80u;
  }
  if (*((unsigned char *)a1 + 369)) {
    int v4 = v3 | 0x100;
  }
  else {
    int v4 = v3;
  }
  int v5 = sub_21DC05354(*((const char **)a1 + 37), v4, *((unsigned __int8 *)a1 + 368), 438);
  a1[80] = v5;
  if ((v5 & 0x80000000) == 0)
  {
    sub_21DC056A4();
    int v2 = a1[80];
LABEL_13:
    fcntl(v2, 48, 1);
LABEL_14:
    (*(void (**)(_DWORD *))(*(void *)a1 + 576))(a1);
    return 0;
  }
  a1[80] = -1;
  uint64_t result = *__error();
  if (!result) {
    goto LABEL_14;
  }
  return result;
}

BOOL sub_21DC05694(uint64_t a1)
{
  return *(_DWORD *)(a1 + 104) == 3;
}

uint64_t sub_21DC056A4()
{
  return 0;
}

uint64_t sub_21DC056AC(uint64_t result)
{
  return result;
}

uint64_t sub_21DC056BC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  unsigned int v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    pid_t v11 = getpid();
    fprintf(v10, "read\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }
  return sub_21DC05754(a1, a2, a3, a4, a5);
}

uint64_t sub_21DC05754(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v31 = 0;
  unsigned int v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  unint64_t v11 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    uint64_t v12 = 9;
    goto LABEL_14;
  }
  uint64_t v12 = 22;
  if (!a4 || !a5)
  {
LABEL_14:
    pthread_mutex_unlock(v10);
    if (!a4) {
      return v12;
    }
    goto LABEL_18;
  }
  uint64_t v12 = 29;
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 200);
    if (v13 >= a2 && v13 - a2 >= a3)
    {
      uint64_t v14 = *(void *)(a1 + 208);
      if (v14)
      {
        int v30 = 0;
        int v15 = sub_21DC05A0C(v14, a2, a3, &v30, 0);
        if (v15 >= 1)
        {
          int v16 = v15;
          unint64_t v29 = a3;
          unint64_t v17 = 0;
          v18 = v30;
          int v19 = v15;
          int v20 = v30;
          do
          {
            memmove((void *)(a5 + *v20 - a2), (const void *)v20[2], v20[1]);
            v17 += v20[1];
            v20 += 3;
            --v19;
          }
          while (v19);
          unint64_t v21 = v29;
          if (v17 == v29)
          {
            uint64_t v12 = 0;
            goto LABEL_34;
          }
          uint64_t v26 = a2;
          while (1)
          {
            uint64_t v23 = *v18;
            uint64_t v24 = *v18 - v26;
            if (*v18 > v26)
            {
              uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 712))(a1);
              if (v25)
              {
                uint64_t v12 = v25;
LABEL_33:
                unint64_t v21 = v17;
                goto LABEL_34;
              }
              v17 += v24;
              uint64_t v23 = *v18;
            }
            uint64_t v26 = v18[1] + v23;
            v18 += 3;
            if (!--v16) {
              goto LABEL_27;
            }
          }
        }
        unint64_t v17 = 0;
        if (!a3) {
          goto LABEL_32;
        }
        unint64_t v29 = a3;
        uint64_t v26 = a2;
LABEL_27:
        unint64_t v27 = v29 + a2 - v26;
        if (v29 + a2 <= v26)
        {
LABEL_32:
          uint64_t v12 = 0;
          goto LABEL_33;
        }
        uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 712))(a1);
        if (v12) {
          unint64_t v28 = 0;
        }
        else {
          unint64_t v28 = v27;
        }
        unint64_t v21 = v17 + v28;
LABEL_34:
        unint64_t v11 = v21;
        goto LABEL_14;
      }
      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, unint64_t *, uint64_t))(*(void *)a1 + 688))(a1, a2, a3, &v31, a5);
    }
  }
  pthread_mutex_unlock(v10);
  unint64_t v11 = v31;
LABEL_18:
  *a4 = v11;
  return v12;
}

uint64_t sub_21DC05A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, int a5)
{
  int v5 = *(uint64_t **)(a1 + 24);
  if (a4) {
    *a4 = v5;
  }
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  do
  {
    if (*(unsigned char *)(v7 + 8)) {
      ++*(_DWORD *)(v7 + 12);
    }
    uint64_t v7 = *(void *)(v7 + 72);
  }
  while (v7);
  uint64_t v8 = 0;
  do
  {
    if (*(unsigned char *)(v6 + 8))
    {
      uint64_t v9 = *(void *)(v6 + 32);
      if (v9 >= a2)
      {
        uint64_t v10 = *(void *)(v6 + 24);
        if (v10 < a3 + a2)
        {
          if (v10 <= a2) {
            uint64_t v11 = a2;
          }
          else {
            uint64_t v11 = *(void *)(v6 + 24);
          }
          if (v9 >= a3 + a2 - 1) {
            uint64_t v9 = a3 + a2 - 1;
          }
          if (a5) {
            *(unsigned char *)(v6 + 16) = 1;
          }
          *(_DWORD *)(v6 + 12) = 0;
          uint64_t *v5 = v11;
          v5[1] = v9 - v11 + 1;
          v5[2] = *(void *)(v6 + 40) + v11 - v10;
          uint64_t v8 = (v8 + 1);
          v5 += 3;
        }
      }
    }
    uint64_t v6 = *(void *)(v6 + 72);
  }
  while (v6);
  if (v8) {
    qsort(*(void **)(a1 + 24), (int)v8, 0x18uLL, (int (__cdecl *)(const void *, const void *))sub_21DC0AFC4);
  }
  return v8;
}

uint64_t sub_21DC05B04(void *a1, uint64_t a2, size_t a3, char *a4)
{
  int v4 = a4;
  size_t v5 = a3;
  uint64_t v6 = a2;
  size_t v8 = *(void *)(a1[26] + 8);
  uint64_t v16 = 0;
  if (v8 <= a3)
  {
    size_t v9 = a3 / v8 * v8;
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, size_t, uint64_t *, char *))(*a1 + 688))(a1, a2, v9, &v16, a4);
    if (result) {
      return result;
    }
    v5 -= v9;
    v6 += v9;
    v4 += v9;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v11 = sub_21DC05C98(a1[26]);
  uint64_t v12 = v11;
  if (!*(unsigned char *)(v11 + 8) || !*(unsigned char *)(v11 + 16) || (uint64_t result = sub_21DC12EF4(v11), !result))
  {
    *(unsigned char *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(unsigned char *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    uint64_t v13 = a1[26];
    uint64_t v14 = sub_21DC05CE8(v13, v6, a1[25] - 1);
    if (!v14)
    {
      for (uint64_t i = *(void *)(v13 + 16); i; uint64_t i = *(void *)(i + 72))
        ;
    }
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t *, void))(*a1 + 688))(a1, v6, v14, &v16, *(void *)(v12 + 40));
    if (!result)
    {
      *(_DWORD *)(v12 + 12) = 0;
      *(void *)(v12 + 24) = v6;
      *(void *)(v12 + 32) = v6 + v14 - 1;
      *(unsigned char *)(v12 + 16) = 0;
      *(unsigned char *)(v12 + 8) = 1;
      memmove(v4, *(const void **)(v12 + 40), v5);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC05C98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  int v3 = -1;
  while (*(unsigned char *)(v1 + 8))
  {
    int v4 = *(_DWORD *)(v1 + 12);
    if (*(unsigned char *)(v1 + 16)) {
      ++v4;
    }
    if (v4 > v3)
    {
      uint64_t result = v1;
      int v3 = v4;
    }
    uint64_t v1 = *(void *)(v1 + 72);
    if (!v1) {
      return result;
    }
  }
  return v1;
}

uint64_t sub_21DC05CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (a3 - a2 >= v4) {
    uint64_t v5 = a2 + v4 - 1;
  }
  else {
    uint64_t v5 = a3;
  }
  for (; v3; uint64_t v3 = *(void *)(v3 + 72))
  {
    if (*(unsigned char *)(v3 + 8) && *(void *)(v3 + 32) >= a2)
    {
      uint64_t v6 = *(void *)(v3 + 24);
      if (v6 <= a2) {
        uint64_t v7 = a2;
      }
      else {
        uint64_t v7 = *(void *)(v3 + 24);
      }
      uint64_t v8 = v7 - 1;
      if (v6 <= v5) {
        uint64_t v5 = v8;
      }
    }
  }
  return v5 - a2 + 1;
}

uint64_t sub_21DC05D44(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ++*(void *)(a1 + 336);
  ssize_t v6 = pread(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0) {
    return *__error();
  }
  ssize_t v7 = v6;
  uint64_t result = 0;
  *a4 = v7;
  return result;
}

uint64_t sub_21DC05D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_21DC05DEC(a1, a2);
  if (!v2) {
    return 0;
  }
  while (1)
  {
    if (*(unsigned char *)(v2 + 8))
    {
      if (*(unsigned char *)(v2 + 16))
      {
        uint64_t result = sub_21DC12EF4(v2);
        if (result) {
          break;
        }
      }
    }
    uint64_t v2 = *(void *)(v2 + 72);
    if (!v2) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC05DEC(uint64_t result, uint64_t a2)
{
  for (uint64_t i = *(void *)(result + 16); i; uint64_t i = *(void *)(i + 72))
  {
    if (*(unsigned char *)(i + 8))
    {
      if (*(void *)(i + 24) >= a2)
      {
        *(unsigned char *)(i + 8) = 0;
        *(_DWORD *)(i + 12) = 0;
        *(void *)(i + 24) = 0;
        *(void *)(i + 32) = 0;
        *(unsigned char *)(i + 16) = 0;
      }
      else if (*(void *)(i + 32) >= a2)
      {
        *(void *)(i + 32) = a2 - 1;
      }
    }
  }
  return result;
}

uint64_t sub_21DC05E40(uint64_t a1, const __CFDictionary *a2)
{
  if (sub_21DC03648(a2, @"DIIsPotentiallyValidDiskImage", 0)
    || (sub_21DC035B8(a2, @"fileencoding-class", @"CEncryptedEncoding") & 0x80000000) != 0)
  {
    return 4294966296;
  }
  int v6 = sub_21DC035B8(a2, @"fileencoding-class", @"CEncryptedEncoding");
  uint64_t v4 = 1000;
  if (v6 <= 0)
  {
    if (sub_21DC05EDC(a1, 0)) {
      return 1000;
    }
    else {
      return 4294966296;
    }
  }
  return v4;
}

BOOL sub_21DC05EDC(uint64_t a1, CFUUIDRef *a2)
{
  uint64_t v3 = sub_21DC05F58(a1);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFStringRef v5 = (const __CFString *)sub_21DC166D0(v3, @"uuid");
  BOOL v6 = v5 != 0;
  if (a2 && v5) {
    *a2 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x263EFFB08], v5);
  }
  CFRelease(v4);
  return v6;
}

__CFDictionary *sub_21DC05F58(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (a1 && !(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1))
  {
    unint64_t v44 = 0;
    if ((*(unsigned int (**)(uint64_t, unint64_t *))(*(void *)a1 + 296))(a1, &v44)
      || (v44 & 0x8000000000000000) != 0)
    {
      goto LABEL_5;
    }
    uint64_t v43 = 0;
    if (v44 >= 0x4FC)
    {
      if ((*(unsigned int (**)(uint64_t, unint64_t, uint64_t, uint64_t *, CFUUIDBytes *))(*(void *)a1 + 328))(a1, v44 - 1276, 1276, &v43, &v47))
      {
        goto LABEL_5;
      }
      if (!sub_21DC066B8((uint64_t)&v47) && v49[2] == 1701733234 && v49[1] == 1667527521 && v49[0] == 1)
      {
        CFNumberRef v7 = CFNumberCreate(v2, kCFNumberSInt32Type, v49);
        CFDictionarySetValue(Mutable, @"encrypted-file-version", v7);
        CFRelease(v7);
        CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(v2, v47);
        CFStringRef v9 = CFUUIDCreateString(v2, v8);
        CFDictionarySetValue(Mutable, @"uuid", v9);
        if (v9) {
          CFRelease(v9);
        }
        if (v8) {
          CFRelease(v8);
        }
        CFNumberRef v10 = CFNumberCreate(v2, kCFNumberSInt32Type, &v48);
        CFDictionarySetValue(Mutable, @"blocksize", v10);
        if (v10) {
          CFRelease(v10);
        }
        goto LABEL_64;
      }
    }
    if (!(*(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *, _DWORD *))(*(void *)a1 + 328))(a1, 0, 72, &v43, v39)&& !sub_21DC06788((uint64_t)v39))
    {
      char v5 = 0;
      if (v39[0] != 1701733234 || v39[1] != 1667527521)
      {
LABEL_6:
        int v4 = 1;
        if (v5) {
          goto LABEL_9;
        }
        goto LABEL_7;
      }
      CFNumberRef v11 = CFNumberCreate(v2, kCFNumberSInt32Type, &v40);
      CFDictionarySetValue(Mutable, @"version", v11);
      CFRelease(v11);
      CFUUIDRef v12 = CFUUIDCreateFromUUIDBytes(v2, v41);
      CFStringRef v13 = CFUUIDCreateString(v2, v12);
      CFDictionarySetValue(Mutable, @"uuid", v13);
      if (v13) {
        CFRelease(v13);
      }
      if (v12) {
        CFRelease(v12);
      }
      CFNumberRef v14 = CFNumberCreate(v2, kCFNumberSInt32Type, v42);
      CFDictionarySetValue(Mutable, @"blocksize", v14);
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v15 = *(void *)&v42[12];
      unsigned int v38 = 0;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(void *)a1 + 328))(a1, 72, 4, &v43, &v38))
      {
        unsigned int v16 = bswap32(v38);
        unsigned int v38 = v16;
        if (v16 <= 0x800)
        {
          uint64_t v17 = 20 * v16 + 4;
          v18 = (unsigned int *)malloc_type_malloc(v17, 0xA09FD7B8uLL);
          if (v18)
          {
            int v19 = v18;
            if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(void *)a1 + 328))(a1, 72, v17, &v43, v18))
            {
              sub_21DC28CD4(v19, v17);
              int v36 = 0;
              int valuePtr = 0;
              v33 = v19;
              theArray = CFArrayCreateMutable(v2, 0, MEMORY[0x263EFFF70]);
              unint64_t v20 = *v19;
              if (v20)
              {
                int v21 = 0;
                int v22 = 0;
                unint64_t v23 = 0;
                uint64_t v24 = v19 + 2;
                do
                {
                  int v25 = *((_DWORD *)v24 - 1);
                  if (v15 >= *v24) {
                    uint64_t v15 = *v24;
                  }
                  if (v25 == 2)
                  {
                    uint64_t v26 = v24[1];
                    ++v22;
                    int v35 = v21;
                    int v36 = v22;
                    if (v26 != 564) {
                      goto LABEL_62;
                    }
                    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 328))(a1)) {
                      goto LABEL_62;
                    }
                    LODWORD(length[0]) = bswap32(length[0]);
                    int8x16_t v27 = vrev32q_s8(v46);
                    int8x16_t v46 = v27;
                    if (LODWORD(length[0]) > 0x20 || v27.i32[3] > 0x200u) {
                      goto LABEL_62;
                    }
                    unint64_t v28 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    CFDataRef v29 = CFDataCreate(v2, (const UInt8 *)length + 4, LODWORD(length[0]));
                    CFDictionarySetValue(v28, @"public-key-hash", v29);
                    CFRelease(v29);
                    CFArrayAppendValue(theArray, v28);
                    CFRelease(v28);
                    unint64_t v20 = *v33;
                    int v21 = v35;
                  }
                  else if (v25 == 1)
                  {
                    int valuePtr = ++v21;
                  }
                  ++v23;
                  uint64_t v24 = (void *)((char *)v24 + 20);
                }
                while (v23 < v20);
              }
              CFNumberRef v30 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(Mutable, @"passphrase-count", v30);
              if (v30) {
                CFRelease(v30);
              }
              CFNumberRef v31 = CFNumberCreate(v2, kCFNumberSInt32Type, &v36);
              CFDictionarySetValue(Mutable, @"private-key-count", v31);
              if (v31) {
                CFRelease(v31);
              }
              if (v36) {
                CFDictionarySetValue(Mutable, @"private-keys", theArray);
              }
              if (theArray) {
                CFRelease(theArray);
              }
              length[0] = (v15 - 76) / 0x14uLL;
              CFNumberRef v32 = CFNumberCreate(v2, kCFNumberSInt64Type, length);
              CFDictionarySetValue(Mutable, @"max-key-count", v32);
              if (v32) {
                CFRelease(v32);
              }
LABEL_62:
              int v19 = v33;
            }
            free(v19);
          }
        }
      }
LABEL_64:
      char v5 = 1;
      goto LABEL_6;
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  int v4 = 0;
LABEL_7:
  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableStringRef Mutable = 0;
  }
LABEL_9:
  if (v4) {
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
  }
  return Mutable;
}

uint64_t sub_21DC06698(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22;
  }
  uint64_t result = 0;
  *a2 = *(void *)(a1 + 200);
  return result;
}

uint64_t sub_21DC066B8(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 52));
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 52) = v2;
  int8x16_t v3 = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(int8x16_t *)(a1 + 88) = v3;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 136));
  *(_DWORD *)(a1 + 136) = v4;
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  unsigned int v5 = bswap32(*(_DWORD *)(a1 + 436));
  *(_DWORD *)(a1 + 436) = v5;
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  unsigned int v6 = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 736) = v6;
  unsigned int v7 = bswap32(*(_DWORD *)(a1 + 996));
  *(_DWORD *)(a1 + 996) = v7;
  *(void *)(a1 + 1256) = bswap64(*(void *)(a1 + 1256));
  *(int8x8_t *)(a1 + 1264) = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  if (v7 > 0x100 || v6 > 0x100 || v5 > 0x100 || v4 > 0x100 || v3.i32[3] > 0x400u || v2 > 0x20) {
    return 107;
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC06788(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 32));
  *(_DWORD *)(a1 + 32) = v2;
  *(_DWORD *)(a1 + 52) = bswap32(*(_DWORD *)(a1 + 52));
  *(int8x16_t *)(a1 + 56) = vrev64q_s8(*(int8x16_t *)(a1 + 56));
  if (v2 > 0x400 || v1.i32[2] > 0x400u) {
    return 107;
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC067D8(uint64_t a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"fileencoding-class", @"CUDIFEncoding") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"fileencoding-class", @"CUDIFEncoding") > 0) {
    return 1000;
  }
  int v5 = sub_21DC03648(theDict, @"expandable", 0);
  uint64_t v4 = 4294966296;
  if (!v5)
  {
    char v7 = 0;
    if (sub_21DC0688C(a1, &v7)) {
      return 900;
    }
    else {
      return 4294966296;
    }
  }
  return v4;
}

uint64_t sub_21DC0688C(uint64_t a1, unsigned char *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v4 = 0;
  if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 296))(a1, &v6) && v6 >= 512)
  {
    if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1))
    {
      if (sub_21DC06A44(a1, &v7, v6 - 512))
      {
        uint64_t v4 = 0;
        goto LABEL_14;
      }
      if (v7 == 1802464377 && v8 == 4)
      {
        uint64_t v4 = 1;
        if (!a2)
        {
LABEL_14:
          (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
          return v4;
        }
      }
      else
      {
        uint64_t v4 = 0;
        if (sub_21DC06A44(a1, &v7, 0) || v7 != 1802464377 || v8 != 4) {
          goto LABEL_14;
        }
        if (!a2) {
          goto LABEL_10;
        }
        LOBYTE(v4) = 0;
      }
      *a2 = v4;
LABEL_10:
      uint64_t v4 = 1;
      goto LABEL_14;
    }
    return 0;
  }
  return v4;
}

uint64_t sub_21DC06A44(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(a1);
  if (!v6)
  {
    uint64_t v8 = 0;
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned char *))(*(void *)a1 + 328))(a1, a3, 512, &v8, __src);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
    if (!v6)
    {
      sub_21DC06B8C((uint64_t)__src);
      memcpy(a2, __src, 0x200uLL);
    }
  }
  return v6;
}

int8x8_t sub_21DC06B8C(uint64_t a1)
{
  int8x16_t v1 = vrev64q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  *(int8x16_t *)(a1 + 32) = vrev64q_s8(*(int8x16_t *)(a1 + 32));
  *(void *)(a1 + 48) = bswap64(*(void *)(a1 + 48));
  *(int8x8_t *)(a1 + 56) = vrev32_s8(*(int8x8_t *)(a1 + 56));
  *(int8x8_t *)(a1 + 80) = vrev32_s8(*(int8x8_t *)(a1 + 80));
  *(int8x16_t *)(a1 + 216) = vrev64q_s8(*(int8x16_t *)(a1 + 216));
  *(int8x16_t *)(a1 + 296) = vrev64q_s8(*(int8x16_t *)(a1 + 296));
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 352));
  *(int8x8_t *)(a1 + 352) = result;
  *(_DWORD *)(a1 + 488) = bswap32(*(_DWORD *)(a1 + 488));
  *(void *)(a1 + 492) = bswap64(*(void *)(a1 + 492));
  return result;
}

uint64_t sub_21DC06C10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  if (!a1) {
    return 22;
  }
  char v7 = 0;
  sub_21DC04598(a2);
  if (sub_21DC0688C(a1, &v7)) {
    operator new();
  }
  return 110;
}

void sub_21DC06D2C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40C363EFF1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC06D50(uint64_t a1)
{
  sub_21DC06DD4(a1);
  *unsigned int v2 = &unk_26CE86848;
  *(unsigned char *)(a1 + 779) = 0;
  bzero(v2 + 29, 0x220uLL);
  sub_21DC04008(a1, @"thread-safe", (const void *)*MEMORY[0x263EFFB40]);
  return a1;
}

void sub_21DC06DBC(_Unwind_Exception *a1)
{
  sub_21DC11718(v1);
  _Unwind_Resume(a1);
}

void sub_21DC06DD4(uint64_t a1)
{
  sub_21DC06E10(a1);
  void *v1 = &unk_26CE861F0;
  v1[27] = 0;
  v1[28] = 0;
  v1[26] = 0;
}

void sub_21DC06E10(uint64_t a1)
{
  sub_21DC03C98(a1);
  void *v1 = &unk_26CE85F08;
  v1[25] = 0;
}

uint64_t sub_21DC06E48(uint64_t a1, char *a2)
{
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t))(*(void *)a2 + 80))(a2, 1);
  if (v4) {
    return v4;
  }
  uint64_t v19 = 0;
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t *))(*(void *)a2 + 296))(a2, &v19);
  if (v4) {
    return v4;
  }
  uint64_t v4 = (*(uint64_t (**)(char *))(*(void *)a2 + 272))(a2);
  if (v4) {
    return v4;
  }
  int v5 = (_DWORD *)(a1 + 232);
  uint64_t v6 = sub_21DC06A44((uint64_t)a2, (void *)(a1 + 232), v19 - 512);
  if (v6) {
    goto LABEL_23;
  }
  if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
  {
    char v7 = 0;
    char v8 = 1;
LABEL_12:
    *(unsigned char *)(a1 + 776) = v8;
    *(unsigned char *)(a1 + 777) = v7;
    uint64_t v10 = *(void *)(a1 + 256);
    uint64_t v9 = *(void *)(a1 + 264);
    *(void *)(a1 + 752) = v9;
    *(void *)(a1 + 744) = v10;
    sub_21DC07144(a1, v9);
    int v11 = *(_DWORD *)(a1 + 244);
    *(unsigned char *)(a1 + 778) = v11 & 1;
    if (v11)
    {
      uint64_t v14 = *(void *)(a1 + 272);
      uint64_t v12 = *(void *)(a1 + 280);
      *(void *)(a1 + 768) = v12;
      *(void *)(a1 + 760) = v14;
    }
    else
    {
      uint64_t v12 = 0;
      *(_OWORD *)(a1 + 760) = 0u;
    }
    sub_21DC0714C(a1, v12);
    if (*(_DWORD *)(a1 + 288) >= 2u) {
      int v15 = 1684371059;
    }
    else {
      int v15 = 1684371049;
    }
    sub_21DC07154(a1, v15);
    uint64_t v16 = (*(uint64_t (**)(char *))(*(void *)a2 + 192))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520))(a1, v16);
    uint64_t v17 = (*(uint64_t (**)(char *))(*(void *)a2 + 208))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 528))(a1, v17);
    sub_21DC0716C(a1, a2);
    uint64_t v13 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = sub_21DC06A44((uint64_t)a2, (void *)(a1 + 232), 0);
  if (v6)
  {
LABEL_23:
    uint64_t v13 = v6;
  }
  else
  {
    if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
    {
      char v8 = 0;
      char v7 = 1;
      goto LABEL_12;
    }
    uint64_t v13 = 107;
  }
LABEL_20:
  (*(void (**)(char *, void))(*(void *)a2 + 280))(a2, 0);
  return v13;
}

uint64_t sub_21DC07144(uint64_t result, uint64_t a2)
{
  *(void *)(result + 216) = a2;
  return result;
}

uint64_t sub_21DC0714C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 224) = a2;
  return result;
}

uint64_t sub_21DC07154(uint64_t result, int a2)
{
  *(_DWORD *)(result + 208) = a2;
  return result;
}

uint64_t sub_21DC0715C(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t sub_21DC07164(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t sub_21DC0716C(uint64_t a1, char *a2)
{
  *(void *)(a1 + 200) = a2;
  return 0;
}

uint64_t sub_21DC071A8(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = 1;
  if (a2 < 2) {
    goto LABEL_10;
  }
  if (a2 != 3)
  {
    if (a2 != 1003) {
      return 22;
    }
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 568))(a1);
    if (v4) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 80))(v5, 3);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)a1 + 272))(a1);
    }
    if (!v3)
    {
      uint64_t v3 = 1003;
LABEL_10:
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 560))(a1, v3);
      return 0;
    }
  }
  return v3;
}

BOOL sub_21DC07334(uint64_t a1)
{
  return *(_DWORD *)(a1 + 208) != 0;
}

uint64_t sub_21DC07344(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 208);
  return 0;
}

BOOL sub_21DC07354(uint64_t a1)
{
  return *(_DWORD *)(a1 + 212) != 0;
}

__n128 sub_21DC07364(uint64_t a1, __n128 *a2)
{
  __n128 result = *(__n128 *)(a1 + 296);
  *a2 = result;
  return result;
}

uint64_t sub_21DC07374(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t sub_21DC0737C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 292);
}

uint64_t sub_21DC07384(uint64_t a1, const __CFDictionary *a2, char **a3, CFTypeRef *a4)
{
  CFStringRef appendedString = 0;
  uint64_t v14 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 22;
  }
  if (!sub_21DC01FB0()) {
    return 119;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!Mutable) {
    return 999;
  }
  uint64_t v9 = Mutable;
  uint64_t v10 = sub_21DC074AC(a1, a2, (uint64_t)&v14, (uint64_t)&appendedString);
  if (appendedString) {
    CFStringAppend(v9, appendedString);
  }
  int v11 = v14;
  if (v10 && v14)
  {
    DIDiskImageObjectRelease(v14);
    int v11 = 0;
    uint64_t v14 = 0;
  }
  if (appendedString)
  {
    CFRelease(appendedString);
    CFStringRef appendedString = 0;
    int v11 = v14;
  }
  *a3 = v11;
  if (a4)
  {
    *a4 = v9;
    if (!CFStringGetLength(v9) && *a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
  }
  else
  {
    CFRelease(v9);
  }
  return v10;
}

uint64_t sub_21DC074AC(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  if (!off_26B546D40) {
    return 110;
  }
  int v8 = 0;
  unsigned int v9 = 0;
  uint64_t v10 = &off_26B546D98;
  unsigned int v11 = -1;
  do
  {
    uint64_t v12 = (uint64_t (*)(uint64_t, const __CFDictionary *))*(v10 - 19);
    if (v12)
    {
      int v13 = v12(a1, a2);
      if (v13 > v8)
      {
        unsigned int v11 = v9;
        int v8 = v13;
      }
    }
    ++v9;
    uint64_t v14 = *v10;
    v10 += 11;
  }
  while (v14);
  if ((v11 & 0x80000000) != 0) {
    return 110;
  }
  if (CFStringCompare((CFStringRef)qword_26B546CF8[11 * v11 + 9], @"CNotSupportedDiskImage", 0))
  {
    if (a2)
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(a2, @"udif-chunk-size", (const void **)&value))
      {
        uint64_t v18 = 0;
        CFTypeID v15 = CFGetTypeID(value);
        if (v15 == CFNumberGetTypeID()
          && CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v18)
          && (unint64_t)(v18 - 2097153) < 0xFFFFFFFFFFE001FFLL)
        {
          return 22;
        }
      }
    }
    uint64_t v17 = (uint64_t (*)(uint64_t, const __CFDictionary *, uint64_t, uint64_t))qword_26B546CF8[11 * v11 + 2];
    if (v17) {
      return v17(a1, a2, a3, a4);
    }
    return 110;
  }
  return 123;
}

uint64_t sub_21DC07618(uint64_t a1, uint64_t a2)
{
  if (!off_26B546D40) {
    return 0xFFFFFFFFLL;
  }
  int v4 = 0;
  unsigned int v5 = 0;
  uint64_t v6 = &off_26B546D98;
  uint64_t v7 = 0xFFFFFFFFLL;
  do
  {
    int v8 = (uint64_t (*)(uint64_t, uint64_t))*(v6 - 19);
    if (v8)
    {
      int v9 = v8(a1, a2);
      if (v9 <= v4) {
        uint64_t v7 = v7;
      }
      else {
        uint64_t v7 = v5;
      }
      if (v9 > v4) {
        int v4 = v9;
      }
    }
    ++v5;
    uint64_t v10 = *v6;
    v6 += 11;
  }
  while (v10);
  return v7;
}

uint64_t sub_21DC076A4(const void *a1, CFDictionaryRef theDict)
{
  unsigned int v5 = -1000;
  if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CUDIFDiskImage") > 0
    || (int)sub_21DC035B8(theDict, @"diskimage-class", @"CRestrictedUDIFDiskImage") > 0)
  {
    return 9999;
  }
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CUDIFDiskImage") & 0x80000000) != 0) {
    return 4294966296;
  }
  sub_21DC07754(a1, (int *)&v5);
  return v5;
}

uint64_t sub_21DC07754(const void *a1, int *a2)
{
  if (a1
    && __dynamic_cast(a1, (const struct __class_type_info *)&unk_26CE84370, (const struct __class_type_info *)&unk_26CE86B68, 0))
  {
    uint64_t result = 1430538566;
    int v4 = 1000;
  }
  else
  {
    uint64_t result = 0;
    int v4 = -1000;
  }
  *a2 = v4;
  return result;
}

uint64_t sub_21DC077D8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 208))();
  }
  return result;
}

uint64_t sub_21DC07808(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4 = 4294967196;
  unsigned int v7 = -100;
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CSparseDiskImage") & 0x80000000) != 0) {
    return v4;
  }
  if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CSparseDiskImage") > 0) {
    return 9999;
  }
  int v6 = sub_21DC0796C(a1, &v7);
  uint64_t v4 = v7;
  if (v6 || (v7 & 0x80000000) != 0) {
    return v4;
  }
  return sub_21DC079E4(a1);
}

uint64_t sub_21DC078C8(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 200);
  if (v1)
  {
    uint64_t v2 = *v1;
    if (__dynamic_cast(v1, (const struct __class_type_info *)&unk_26CE84370, (const struct __class_type_info *)&unk_26CE861C8, 0))
    {
      uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 488);
      return v3(v1);
    }
    else
    {
      return (uint64_t)v1;
    }
  }
  return result;
}

uint64_t sub_21DC0796C(uint64_t a1, _DWORD *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 208))(a1);
  *a2 = 0;
  if (result)
  {
    if (CFStringCompare((CFStringRef)result, @"sparseimage", 1uLL))
    {
      return 0;
    }
    else
    {
      *a2 = 1000;
      return 1936749171;
    }
  }
  return result;
}

uint64_t sub_21DC079E4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!a1 || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1)) {
    return 0;
  }
  if (sub_21DC07BA0(a1, (uint64_t)v4, 64))
  {
    uint64_t v2 = 0;
  }
  else if (sub_21DC30930((uint64_t)v4))
  {
    uint64_t v2 = 1000;
  }
  else
  {
    uint64_t v2 = 0;
  }
  (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
  return v2;
}

uint64_t sub_21DC07ADC(void *a1)
{
  if (((*(uint64_t (**)(void *))(*a1 + 568))(a1) & 1) != 0 || (uint64_t v2 = a1[25]) == 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272))(v2);
  }
  (*(void (**)(void *))(*a1 + 576))(a1);
  return v3;
}

uint64_t sub_21DC07BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 328))(a1, 0, a3, &v7, a2);
  if (!v5) {
    sub_21DC07D2C(a2, (unint64_t)(a3 + 0x3FFFFFFC0) >> 2);
  }
  return v5;
}

uint64_t sub_21DC07C30(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a5) {
    return 22;
  }
  unint64_t v5 = a1[94];
  if ((uint64_t)v5 < a2 || a3 + a2 > v5) {
    return 29;
  }
  int v8 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(void *))(*a1 + 496))(a1) + 328);
  return v8();
}

uint64_t sub_21DC07D24(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

uint64_t sub_21DC07D2C(uint64_t result, unsigned int a2)
{
  *(int8x16_t *)uint64_t result = vrev32q_s8(*(int8x16_t *)result);
  *(_DWORD *)(result + 16) = bswap32(*(_DWORD *)(result + 16));
  *(int8x16_t *)(result + 20) = vrev64q_s8(*(int8x16_t *)(result + 20));
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (unsigned int *)(result + 64);
    do
    {
      *uint64_t v3 = bswap32(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_21DC07D74(void *a1)
{
  (*(void (**)(void *))(*a1 + 584))(a1);
  if (((*(uint64_t (**)(void *))(*a1 + 568))(a1) & 1) == 0)
  {
    uint64_t v2 = a1[25];
    if (v2) {
      (*(void (**)(uint64_t, void))(*(void *)v2 + 280))(v2, 0);
    }
  }
  return 0;
}

uint64_t sub_21DC07E3C(const void *a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CRawDiskImage") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CRawDiskImage") > 0) {
    return 1000;
  }
  uint64_t result = sub_21DC07F04((uint64_t)a1);
  unsigned int v6 = result;
  if ((result & 0x80000000) == 0)
  {
    sub_21DC1C098(a1, &v6);
    uint64_t result = v6;
    if ((v6 & 0x80000000) == 0)
    {
      int v5 = sub_21DC1C5E8((uint64_t)a1, &v6);
      uint64_t result = v6;
      if (!v5 && (v6 & 0x80000000) == 0)
      {
        sub_21DC1C720((uint64_t)a1, &v6);
        return v6;
      }
    }
  }
  return result;
}

uint64_t sub_21DC07F04(uint64_t a1)
{
  uint64_t valuePtr = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v3 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 296))(a1, &v17)) {
    goto LABEL_2;
  }
  uint64_t v4 = 4294967196;
  if (v17 && (v17 & 0x1FF) == 0)
  {
    CFDictionarySetValue(Mutable, @"writeable", (const void *)*MEMORY[0x263EFFB38]);
    if (sub_21DC1BCFC(a1, (uint64_t)Mutable, &v14, 0))
    {
      CFDictionaryRef v3 = 0;
    }
    else
    {
      CFDictionaryRef v6 = (const __CFDictionary *)sub_21DC16C04();
      CFDictionaryRef v3 = v6;
      if (v6)
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v6, @"partitions");
        if (Value)
        {
          CFArrayRef v8 = Value;
          CFIndex Count = CFArrayGetCount(Value);
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, Count - 1);
          if (!ValueAtIndex
            || (CFDictionaryRef v11 = ValueAtIndex,
                (CFNumberRef v12 = (const __CFNumber *)sub_21DC11C7C(ValueAtIndex, @"partition-start")) == 0)
            || !CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr)
            || (CFNumberRef v13 = (const __CFNumber *)sub_21DC11C7C(v11, @"partition-length")) == 0)
          {
LABEL_2:
            uint64_t v4 = 4294967196;
            goto LABEL_3;
          }
          uint64_t v4 = 4294967196;
          if (CFNumberGetValue(v13, kCFNumberSInt64Type, &v15))
          {
            if (v17 >= (v15 + valuePtr) << 9) {
              uint64_t v4 = 0;
            }
            else {
              uint64_t v4 = 4294967196;
            }
          }
        }
      }
    }
  }
LABEL_3:
  if (v14)
  {
    DIDiskImageObjectRelease(v14);
    uint64_t v14 = 0;
  }
  if (v3) {
    CFRelease(v3);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v4;
}

uint64_t sub_21DC080D0(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 216);
  }
  return 0;
}

uint64_t sub_21DC080E4(uint64_t a1, CFDictionaryRef theDict, void *a3, void *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  uint64_t v6 = 22;
  if (a1 && a3)
  {
    if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CWOUDIFDiskImage") <= 0)
    {
      if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CRestrictedUDIFDiskImage") > 0
        || sub_21DC03648(theDict, @"restricted-only", 0))
      {
        (*(void (**)(uint64_t, void *))(*(void *)a1 + 704))(a1, v8);
        if (v9 >= 2) {
          operator new();
        }
      }
      operator new();
    }
    return 78;
  }
  return v6;
}

void sub_21DC0831C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0834C(uint64_t a1)
{
  uint64_t v2 = sub_21DC08428(a1);
  *(void *)uint64_t v2 = &unk_26CE85940;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 160), 0);
  (*(void (**)(uint64_t, __CFString *, void))(*(void *)a1 + 32))(a1, @"thread-safe", *MEMORY[0x263EFFB40]);
  bzero((void *)(a1 + 360), 0x22EuLL);
  *(void *)(a1 + 920) = -1;
  *(_OWORD *)(a1 + 928) = 0u;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 944), 0);
  *(_DWORD *)(a1 + 1028) = 0;
  *(unsigned char *)(a1 + 1032) = 0;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(unsigned char *)(a1 + 1024) = 0;
  return a1;
}

void sub_21DC08410(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC08428(uint64_t a1)
{
  uint64_t result = sub_21DC03CF0(a1);
  *(void *)uint64_t result = &unk_26CE84E60;
  *(void *)(result + 136) = 0;
  *(_DWORD *)(result + 144) = 0;
  *(unsigned char *)(result + 148) = 0;
  *(void *)(result + 152) = 0;
  *(void *)(result + 112) = 0;
  *(void *)(result + 120) = 0;
  *(void *)(result + 104) = 0;
  *(unsigned char *)(result + 128) = 0;
  return result;
}

BOOL sub_21DC08478(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  if (CFStringCompare(theString1, @"cache enabled", 0))
  {
    return sub_21DC08628(a1, theString1, a3);
  }
  int valuePtr = 0;
  if (a3)
  {
    CFTypeID v7 = CFGetTypeID(a3);
    if (v7 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue((CFBooleanRef)a3);
      if (Value) {
        int v9 = 5;
      }
      else {
        int v9 = 0;
      }
      int valuePtr = v9;
      if (Value) {
        goto LABEL_11;
      }
    }
    else
    {
      CFTypeID v11 = CFGetTypeID(a3);
      if (v11 != CFNumberGetTypeID()) {
        return 0;
      }
      CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
      if (valuePtr)
      {
LABEL_11:
        uint64_t v10 = *(void *)(a1 + 368);
        if (v10) {
          (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
        }
        operator new();
      }
    }
  }
  uint64_t v12 = *(void *)(a1 + 368);
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  *(void *)(a1 + 368) = 0;
  return sub_21DC04008(a1, theString1, a3);
}

void sub_21DC08604(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x1081C406A7D350BLL);
  _Unwind_Resume(a1);
}

BOOL sub_21DC08628(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  if (!theString1 || CFEqual(theString1, @"cache enabled")) {
    return 0;
  }
  if (CFEqual(theString1, @"on IO thread"))
  {
    if (a3)
    {
      CFTypeID v6 = CFGetTypeID(a3);
      if (v6 != CFBooleanGetTypeID()) {
        return 0;
      }
      BOOL v7 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
    if (!v8 || v7 != (*(unsigned int (**)(uint64_t, BOOL))(*(void *)v8 + 664))(v8, v7)) {
      return 0;
    }
  }
  if (CFEqual(theString1, @"di-valid-cached-checksum"))
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
    if (v9)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 488))(v9);
      if (v10)
      {
        uint64_t v11 = v10;
        int v12 = (*(uint64_t (**)(uint64_t, __CFString *, void))(*(void *)v10 + 128))(v10, @"com.apple.diskimages.recentcksum", 0);
        if (!a3 || !sub_21DC02048(a3, 0)) {
          return v12 == 0;
        }
        CFStringRef v13 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 544))(a1);
        if (v13)
        {
          CFStringRef v14 = v13;
          CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, 0x8000100u, 0);
          if (ExternalRepresentation)
          {
            CFDataRef v16 = ExternalRepresentation;
            BOOL v17 = (*(unsigned int (**)(uint64_t, __CFString *, CFDataRef))(*(void *)v11 + 128))(v11, @"com.apple.diskimages.recentcksum", ExternalRepresentation) == 0;
            CFRelease(v14);
            CFRelease(v16);
            return v17;
          }
          CFRelease(v14);
        }
      }
    }
    return 0;
  }
  return sub_21DC04008(a1, theString1, a3);
}

uint64_t sub_21DC088E8(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_21DC088F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 72))();
  }
  return result;
}

uint64_t sub_21DC08920(uint64_t result, char a2)
{
  *(unsigned char *)(result + 148) = a2;
  return result;
}

void *sub_21DC08928(uint64_t a1, void *__dst)
{
  return memcpy(__dst, (const void *)(a1 + 232), 0x200uLL);
}

uint64_t sub_21DC0893C(uint64_t *a1, char **a2)
{
  unint64_t v28 = 0;
  if (a2)
  {
    *a2 = 0;
    int v4 = (*(uint64_t (**)(uint64_t *))(*a1 + 616))(a1);
    uint64_t v5 = *a1;
    if (v4)
    {
      CFIndex Code = 0;
      unint64_t v28 = (char *)(*(uint64_t (**)(uint64_t *))(v5 + 640))(a1);
      if (v28)
      {
LABEL_4:
        (*(void (**)(uint64_t *))(*a1 + 624))(a1);
        BOOL v7 = v28;
LABEL_10:
        *a2 = v7;
        return Code;
      }
LABEL_9:
      BOOL v7 = 0;
      goto LABEL_10;
    }
    if ((*(uint64_t (**)(uint64_t *))(v5 + 592))(a1))
    {
      CFIndex Code = 4294967242;
      goto LABEL_8;
    }
    if (!*((unsigned char *)a1 + 778))
    {
      uint64_t v24 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      CFIndex Code = (*(uint64_t (**)(uint64_t, char **))(*(void *)v24 + 344))(v24, &v28);
      if (!Code) {
        (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v28);
      }
      goto LABEL_8;
    }
    uint64_t v9 = a1[57];
    if (!v9)
    {
      if (!a1[95] || !a1[96])
      {
        CFIndex Code = 4294967257;
        goto LABEL_8;
      }
      goto LABEL_52;
    }
    uint64_t v26 = 0;
    CFErrorRef error = 0;
    uint64_t v10 = (UInt8 *)malloc_type_malloc(v9 + 1, 0x8856F354uLL);
    if (!v10)
    {
      CFDataRef v16 = 0;
      CFDictionaryRef v18 = 0;
      int v21 = 0;
      CFIndex Code = *__error();
      goto LABEL_36;
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 272))(v11);
    if (v12)
    {
      CFIndex Code = v12;
    }
    else
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      CFIndex Code = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, UInt8 *))(*(void *)v13 + 328))(v13, a1[56], a1[57], &v26, v10);
      uint64_t v14 = *(void *)(*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      (*(void (**)(void))(v14 + 280))();
      if (!Code)
      {
        v10[v26] = 0;
        CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFDataRef v16 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v26 + 1);
        if (!v16)
        {
          CFDictionaryRef v18 = 0;
          int v21 = 0;
          goto LABEL_57;
        }
        CFPropertyListFormat format = 0;
        CFDictionaryRef v17 = (const __CFDictionary *)CFPropertyListCreateWithData(v15, v16, 0, &format, &error);
        if (v17)
        {
          CFDictionaryRef v18 = v17;
          *((unsigned char *)a1 + 780) = format == kCFPropertyListBinaryFormat_v1_0;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 != CFDictionaryGetTypeID())
          {
            int v21 = 0;
            CFIndex Code = 107;
            goto LABEL_36;
          }
          int Value = CFDictionaryGetValue(v18, @"resource-fork");
          int v21 = Value;
          if (Value)
          {
            CFRetain(Value);
            uint64_t v22 = sub_21DC08ED8((uint64_t)v21, 1, &v28);
            if (v22)
            {
              CFIndex Code = v22;
            }
            else
            {
              uint64_t v23 = (*(uint64_t (**)(char *))(*(void *)v28 + 48))(v28);
              CFIndex Code = v23;
              if (v23 && v28)
              {
                DIDiskImageObjectRelease(v28);
                unint64_t v28 = 0;
              }
              else if (!v23)
              {
                (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v28);
                sub_21DC0474C(v28);
                *((unsigned char *)a1 + 779) = 1;
              }
            }
LABEL_36:
            if (error)
            {
              CFRelease(error);
              CFErrorRef error = 0;
            }
            if (!v10)
            {
LABEL_42:
              if (v16) {
                CFRelease(v16);
              }
              if (v18) {
                CFRelease(v18);
              }
              if (v21) {
                CFRelease(v21);
              }
              if (Code && a1[95] && a1[96])
              {
                fprintf((FILE *)*MEMORY[0x263EF8348], "CUDIFEncoding::openResourceFile XML failed (contain non-XML embedded rsrc fork) - %d\n", Code);
LABEL_52:
                CFIndex Code = 78;
              }
LABEL_8:
              if (v28) {
                goto LABEL_4;
              }
              goto LABEL_9;
            }
LABEL_41:
            free(v10);
            goto LABEL_42;
          }
LABEL_57:
          CFIndex Code = 4294962336;
          goto LABEL_36;
        }
        if (!error)
        {
          CFDictionaryRef v18 = 0;
          int v21 = 0;
          CFIndex Code = 4294962336;
          goto LABEL_41;
        }
        CFIndex Code = CFErrorGetCode(error);
LABEL_32:
        CFDictionaryRef v18 = 0;
        int v21 = 0;
        goto LABEL_36;
      }
    }
    CFDataRef v16 = 0;
    goto LABEL_32;
  }
  return 22;
}

BOOL sub_21DC08EC8(uint64_t a1)
{
  return *(_DWORD *)(a1 + 172) > 0;
}

uint64_t sub_21DC08ED8(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    *a3 = 0;
    operator new();
  }
  return 22;
}

void sub_21DC08F48(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC08F6C(uint64_t a1, CFMutableDictionaryRef Mutable, int a3)
{
  CFTypeID v6 = sub_21DC09040(a1);
  *CFTypeID v6 = &unk_26CE86D08;
  v6[13] = 0;
  *((unsigned char *)v6 + 114) = a3 == 3;
  *((_WORD *)v6 + 56) = 0;
  *((unsigned char *)v6 + 115) = 1;
  if (Mutable) {
    CFRetain(Mutable);
  }
  else {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  sub_21DC09074(a1, Mutable);
  CFRelease(Mutable);
  return a1;
}

void sub_21DC09028(_Unwind_Exception *a1)
{
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

void *sub_21DC09040(uint64_t a1)
{
  uint64_t result = (void *)sub_21DC03CF0(a1);
  *uint64_t result = &unk_26CE86B90;
  return result;
}

void sub_21DC09074(uint64_t a1, CFPropertyListRef propertyList)
{
  if (*(void *)(a1 + 104))
  {
    sub_21DC0A9F0(a1);
    int v4 = *(const void **)(a1 + 104);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 104) = 0;
    }
  }
  if (propertyList) {
    *(void *)(a1 + 104) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], propertyList, 2uLL);
  }
}

uint64_t sub_21DC090D8(uint64_t a1)
{
  *(_WORD *)(a1 + 112) = 0;
  return 0;
}

void sub_21DC09104(uint64_t a1)
{
  CFDictionaryRef v1 = *(const __CFDictionary **)(a1 + 104);
  if (v1)
  {
    size_t Count = CFDictionaryGetCount(v1);
    if (Count)
    {
      int64_t v3 = Count;
      int v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      if (v4)
      {
        uint64_t v5 = v4;
        CFTypeID v6 = (const void **)malloc_type_calloc(v3, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v5, v6);
        if (v3 >= 1)
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            CFArrayRef v8 = (const __CFArray *)v6[i];
            if (v8)
            {
              CFIndex v9 = CFArrayGetCount((CFArrayRef)v6[i]);
              if (v9 >= 1)
              {
                CFIndex v10 = v9;
                for (CFIndex j = 0; j != v10; ++j)
                {
                  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, j);
                  if (ValueAtIndex)
                  {
                    CFDictionaryRef v13 = ValueAtIndex;
                    int v17 = 0;
                    if (sub_21DC09280(ValueAtIndex, @"Attributes", &v17))
                    {
                      if (sub_21DC09280(v13, @"ID", (_WORD *)&v17 + 1) && (v17 & 4) != 0)
                      {
                        CFDataRef v16 = 0;
                        int v14 = sub_21DC0A050((const __CFString *)v5[i]);
                        sub_21DC09AB8(a1, v14, v13, &v16);
                      }
                    }
                  }
                }
              }
            }
          }
        }
        free(v5);
        if (v6) {
          free(v6);
        }
      }
    }
  }
}

uint64_t sub_21DC09280(const __CFDictionary *a1, const void *a2, _WORD *a3)
{
  __int16 valuePtr = 0;
  if (!a1 || !a3)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_17;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    goto LABEL_13;
  }
  CFStringRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    CFTypeID v11 = CFGetTypeID(v5);
    if (v11 == CFNumberGetTypeID())
    {
      int v12 = CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt16Type, &valuePtr);
      __int16 v13 = valuePtr;
      if (v12)
      {
        *a3 = valuePtr;
        return 1;
      }
LABEL_14:
      uint64_t v10 = 0;
      *a3 = v13;
      return v10;
    }
LABEL_13:
    __int16 v13 = 0;
    goto LABEL_14;
  }
  CFAllocatorRef v15 = 0;
  BOOL v7 = (const char *)sub_21DC0373C(v5, 0x600u);
  if (!v7)
  {
LABEL_17:
    uint64_t v10 = 0;
    *a3 = 0;
    return v10;
  }
  CFArrayRef v8 = (char *)v7;
  if (!*v7)
  {
    __int16 v9 = 0;
    goto LABEL_20;
  }
  __int16 v9 = strtol(v7, &v15, 0);
  if (*v15)
  {
LABEL_20:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = 1;
LABEL_9:
  *a3 = v9;
  free(v8);
  return v10;
}

char *sub_21DC0939C(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 184);
  if (result) {
    uint64_t result = (char *)DIDiskImageObjectRelease(result);
  }
  *(void *)(a1 + 184) = a2;
  return result;
}

uint64_t sub_21DC093DC(uint64_t result)
{
  return result;
}

uint64_t sub_21DC093EC(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  int v21 = 0;
  unint64_t v20 = 0;
  uint64_t result = sub_21DC09764(a1, a2, (__int16 *)&v21 + 1, &v21);
  if (!result)
  {
    __int16 v5 = v21;
    __int16 v6 = HIWORD(v21);
    __int16 v7 = v21 - HIWORD(v21) + 1;
    *(_WORD *)(a1 + 912) = v7;
    *(_WORD *)(a1 + 914) = v6;
    *(_WORD *)(a1 + 916) = v5;
    CFArrayRef v8 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    *(void *)(a1 + 928) = v8;
    if (v8
      && (bzero(v8, 8 * *(__int16 *)(a1 + 912)),
          CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08],
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]),
          (*(void *)(a1 + 936) = Mutable) != 0))
    {
      if (*(__int16 *)(a1 + 912) >= 1)
      {
        uint64_t v11 = 0;
        for (__int16 i = HIWORD(v21); ; ++i)
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
          *(_OWORD *)pStr = 0u;
          long long v23 = 0u;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t **))(*(void *)a2 + 120))(a2, 1651272568, i, &v20);
          if (result) {
            return result;
          }
          if (*(_DWORD *)*v20 != 1752394093 || *(_DWORD *)(*v20 + 4) != 0x1000000) {
            return 107;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 320))(a2);
          if (result) {
            return result;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a2 + 248))(a2, v20);
          if (result) {
            return result;
          }
          *(void *)(*(void *)(a1 + 928) + 8 * v11) = v20;
          CFStringRef v14 = CFStringCreateWithPascalString(v9, pStr, 0);
          if (v14)
          {
            CFAllocatorRef v15 = v14;
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v14);
          }
          else
          {
            int v18 = DIGetBundleRef();
            if (i == -1)
            {
              CFAllocatorRef v15 = sub_21DC3A890(v18, (int)@"Driver Descriptor Map", @"Driver Descriptor Map");
            }
            else
            {
              CFStringRef v19 = (const __CFString *)sub_21DC3A890(v18, (int)@"partition %d", @"partition %d");
              CFAllocatorRef v15 = CFStringCreateWithFormat(v9, 0, v19, i);
              CFRelease(v19);
            }
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v15);
            if (!v15) {
              goto LABEL_20;
            }
          }
          CFRelease(v15);
LABEL_20:
          nullsub_4(v20);
          uint64_t v16 = *v20;
          unint64_t v17 = sub_21DC3A9E4((uint64_t)v20);
          if (sub_21DC0A1B8(v16, v17)) {
            return 107;
          }
          if (++v11 >= *(__int16 *)(a1 + 912))
          {
            if (*(_WORD *)(a1 + 912) != 3) {
              return 0;
            }
            if (*(void *)(**(void **)(*(void *)(a1 + 928) + 8) + 16)
               + *(void *)(**(void **)(*(void *)(a1 + 928) + 8) + 8) <= *(void *)(**(void **)(*(void *)(a1 + 928) + 16)
                                                                                            + 8))
              return 0;
            else {
              return 107;
            }
          }
        }
      }
      return 0;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

uint64_t sub_21DC09764(uint64_t a1, uint64_t a2, __int16 *a3, _WORD *a4)
{
  __int16 v14 = 0;
  if (a3 && a4)
  {
    if (a2)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)a2 + 96))(a2, 1651272568, &v14);
      if (result)
      {
        __int16 v8 = 0;
        __int16 v13 = 0;
      }
      else
      {
        __int16 v8 = v14;
        if (v14)
        {
          int v9 = *(_DWORD *)(a1 + 880);
          __int16 v8 = v14 - 2;
          if (v9) {
            unsigned int v10 = 107;
          }
          else {
            unsigned int v10 = 0;
          }
          if (v9) {
            __int16 v11 = 0;
          }
          else {
            __int16 v11 = v14 - 1;
          }
          if (v9 == 1)
          {
            unsigned int v10 = 0;
            __int16 v12 = -1;
          }
          else
          {
            __int16 v8 = v11;
            __int16 v12 = 0;
          }
          if (v9 == 2) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v10;
          }
          if (v9 == 2)
          {
            __int16 v8 = v14 - 1;
            __int16 v13 = 0;
          }
          else
          {
            __int16 v13 = v12;
          }
        }
        else
        {
          __int16 v13 = 0;
          uint64_t result = 107;
        }
      }
    }
    else
    {
      __int16 v8 = 0;
      __int16 v13 = 0;
      uint64_t result = 999;
    }
    goto LABEL_21;
  }
  __int16 v8 = 0;
  __int16 v13 = 0;
  uint64_t result = 22;
  if (a3) {
LABEL_21:
  }
    *a3 = v13;
  if (a4) {
    *a4 = v8;
  }
  return result;
}

uint64_t sub_21DC09878(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (!a3) {
    return 4294967246;
  }
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4)
  {
    uint64_t result = (uint64_t)sub_21DC098D8(a1, a2);
    if (result)
    {
      LOWORD(v4) = CFArrayGetCount((CFArrayRef)result);
      uint64_t result = 0;
    }
    else
    {
      LOWORD(v4) = 0;
    }
  }
  else
  {
    uint64_t result = 4294967097;
  }
  *a3 = v4;
  return result;
}

const void *sub_21DC098D8(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 104)) {
    return 0;
  }
  CFStringRef v3 = sub_21DC09934(a2);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v3);
  CFRelease(v4);
  return Value;
}

CFStringRef sub_21DC09934(unsigned int a1)
{
  *(_DWORD *)bytes = bswap32(a1);
  return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 4, 0, 0);
}

uint64_t sub_21DC09978(uint64_t a1, unsigned int a2, __int16 a3, void *a4)
{
  unsigned int v10 = 0;
  if (!a4) {
    return 4294967246;
  }
  __int16 v6 = *(void **)(a1 + 104);
  if (v6)
  {
    CFDictionaryRef v8 = sub_21DC09A04(a1, a2, a3);
    if (v8)
    {
      uint64_t result = sub_21DC09AB8(a1, a2, v8, &v10);
      __int16 v6 = v10;
    }
    else
    {
      __int16 v6 = 0;
      uint64_t result = 4294967104;
    }
  }
  else
  {
    uint64_t result = 4294967097;
  }
  *a4 = v6;
  return result;
}

CFDictionaryRef sub_21DC09A04(uint64_t a1, unsigned int a2, __int16 a3)
{
  __int16 v12 = 0;
  if (!*(void *)(a1 + 104)) {
    return 0;
  }
  CFArrayRef v4 = (const __CFArray *)sub_21DC098D8(a1, a2);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  if (Count < 1) {
    return 0;
  }
  CFIndex v7 = Count;
  CFIndex v8 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
    if (ValueAtIndex)
    {
      CFDictionaryRef v10 = ValueAtIndex;
      if (sub_21DC09280(ValueAtIndex, @"ID", &v12))
      {
        if (v12 == a3) {
          break;
        }
      }
    }
    if (v7 == ++v8) {
      return 0;
    }
  }
  return v10;
}

uint64_t sub_21DC09AB8(uint64_t a1, int a2, CFDictionaryRef theDict, void **a4)
{
  int v18 = 0;
  if (!theDict || !a4)
  {
    uint64_t v14 = 4294967246;
    if (!a4) {
      return v14;
    }
    goto LABEL_15;
  }
  if (sub_21DC09CB8(a1, theDict, &v18))
  {
    if (*(void *)v18) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  int v18 = sub_21DC3A910();
  uint64_t v7 = sub_21DC3A898();
  CFIndex v8 = (void **)v18;
  if (v7)
  {
    uint64_t v14 = v7;
LABEL_24:
    if (v14 && v8)
    {
      sub_21DC3A944(v8);
      int v18 = 0;
    }
    goto LABEL_15;
  }
  if (!v18)
  {
    uint64_t v14 = 4294967188;
    goto LABEL_15;
  }
  if ((sub_21DC09D64(0, theDict, (uint64_t)v18) & 1) == 0)
  {
    uint64_t v14 = 4294962336;
    CFIndex v8 = (void **)v18;
    goto LABEL_24;
  }
LABEL_9:
  if (*(unsigned char *)(a1 + 115))
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, @"Data");
    if (!Value || (CFDataRef v10 = Value, v11 = CFGetTypeID(Value), v11 != CFDataGetTypeID()))
    {
      uint64_t v14 = 4294967097;
      goto LABEL_15;
    }
    CFIndex Length = CFDataGetLength(v10);
    sub_21DC3A9EC(v18, Length);
    uint64_t v13 = sub_21DC3A898();
    if (v13)
    {
      uint64_t v14 = v13;
      goto LABEL_15;
    }
    v19.location = 0;
    v19.length = Length;
    CFDataGetBytes(v10, v19, *(UInt8 **)v18);
    __int16 v17 = 0;
    sub_21DC3A9F0();
    nullsub_4(v18);
    sub_21DC09280(theDict, @"ID", &v17);
    sub_21DC3A898();
    nullsub_4(v18);
    __int16 v16 = 0;
    sub_21DC3A9F0();
    sub_21DC09280(theDict, @"Attributes", &v16);
    nullsub_4(v18);
  }
LABEL_14:
  uint64_t v14 = 0;
LABEL_15:
  *a4 = v18;
  return v14;
}

CFNumberRef sub_21DC09CB8(int a1, CFDictionaryRef theDict, void *a3)
{
  uint64_t valuePtr = 0;
  if (theDict && a3)
  {
    CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Handle");
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        int Value = CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        uint64_t v8 = valuePtr;
        if (Value) {
          BOOL v9 = valuePtr == 0;
        }
        else {
          BOOL v9 = 1;
        }
        CFNumberRef result = (const __CFNumber *)!v9;
      }
      else
      {
        uint64_t v8 = 0;
        CFNumberRef result = 0;
      }
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v8 = 0;
LABEL_11:
    *a3 = v8;
    return result;
  }
  CFNumberRef result = 0;
  if (a3) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_21DC09D64(int a1, CFMutableDictionaryRef theDict, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theDict) {
    return 0;
  }
  if (a3)
  {
    uint64_t result = (uint64_t)CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    if (!result) {
      return result;
    }
    CFNumberRef v5 = (const void *)result;
    CFDictionarySetValue(theDict, @"Handle", (const void *)result);
    CFRelease(v5);
  }
  else
  {
    CFDictionaryRemoveValue(theDict, @"Handle");
  }
  return 1;
}

uint64_t sub_21DC09DF4(uint64_t a1, uint64_t a2, _WORD *a3, _DWORD *a4, unsigned __int8 *a5, void *a6)
{
  uint64_t result = 4294967246;
  if (a2 && a3 && a4 && a5 && a6)
  {
    if (!*(void *)(a1 + 104)) {
      return 4294967097;
    }
    CFDictionaryRef v11 = sub_21DC09ED8(a1, a2, a4);
    if (!v11) {
      return 4294967104;
    }
    CFDictionaryRef v12 = v11;
    if (!sub_21DC09280(v11, @"ID", a3) || !sub_21DC0A08C((BOOL)v12, a5)) {
      return 4294967097;
    }
    *a6 = 0;
    uint64_t result = (uint64_t)CFDictionaryGetValue(v12, @"CFName");
    if (result)
    {
      uint64_t v13 = (const void *)result;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v13))
      {
        uint64_t result = 0;
        *a6 = v13;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

CFDictionaryRef sub_21DC09ED8(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3) {
    *a3 = 0;
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 104);
  if (!v6) {
    return 0;
  }
  size_t Count = CFDictionaryGetCount(v6);
  if (!Count) {
    return 0;
  }
  int64_t v8 = Count;
  BOOL v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v9) {
    return 0;
  }
  CFDataRef v10 = v9;
  CFDictionaryRef v11 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v10, v11);
  if (v8 < 1)
  {
LABEL_17:
    CFDictionaryRef ValueAtIndex = 0;
LABEL_18:
    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v12 = 0;
    while (1)
    {
      int v20 = sub_21DC0A050((const __CFString *)v10[v12]);
      CFArrayRef v13 = (const __CFArray *)v11[v12];
      CFIndex v14 = CFArrayGetCount(v13);
      if (v14 >= 1) {
        break;
      }
LABEL_16:
      if (++v12 == v8) {
        goto LABEL_17;
      }
    }
    CFIndex v15 = v14;
    CFIndex v16 = 0;
    while (1)
    {
      uint64_t v21 = 0;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16);
      unsigned int v18 = sub_21DC09CB8((int)ValueAtIndex, ValueAtIndex, &v21) ^ 1;
      if (v21 != a2) {
        LOBYTE(v18) = 1;
      }
      if (a3 && (v18 & 1) == 0) {
        break;
      }
      if ((v18 & 1) == 0) {
        goto LABEL_18;
      }
      if (v15 == ++v16) {
        goto LABEL_16;
      }
    }
    *a3 = v20;
    if (!v11) {
      goto LABEL_20;
    }
  }
  free(v11);
LABEL_20:
  free(v10);
  return ValueAtIndex;
}

uint64_t sub_21DC0A050(const __CFString *a1)
{
  CFDictionaryRef v1 = (unsigned int *)sub_21DC0373C(a1, 0);
  if (v1)
  {
    unsigned int v2 = *v1;
    free(v1);
  }
  else
  {
    unsigned int v2 = 0;
  }
  return bswap32(v2);
}

BOOL sub_21DC0A08C(BOOL result, unsigned __int8 *a2)
{
  if (!a2) {
    return 0;
  }
  *a2 = 0;
  if (result)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)result, @"Name");
    if (Value)
    {
      CFStringRef v4 = Value;
      CFTypeID v5 = CFGetTypeID(Value);
      return v5 == CFStringGetTypeID() && CFStringGetPascalString(v4, a2, 256, 0) != 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_21DC0A120(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967097;
  }
  CFDictionaryRef v2 = sub_21DC09ED8(a1, a2, 0);
  if (!v2) {
    return 4294967104;
  }
  CFStringRef v3 = v2;
  __int16 v5 = 0;
  if (!sub_21DC09280(v2, @"Attributes", &v5)) {
    return 4294967097;
  }
  if ((v5 & 2) != 0) {
    return 4294967098;
  }
  CFDictionaryRemoveValue(v3, @"Handle");
  return 0;
}

uint64_t sub_21DC0A1B8(uint64_t a1, unint64_t a2)
{
  if (a2 < 0xF4) {
    return 29;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 200);
  unsigned int v3 = bswap32(v2);
  if (v2)
  {
    if (40 * (unint64_t)(v3 - 1) + 244 > a2) {
      return 29;
    }
  }
  *(int8x8_t *)a1 = vrev32_s8(*(int8x8_t *)a1);
  *(int8x16_t *)(a1 + 8) = vrev64q_s8(*(int8x16_t *)(a1 + 8));
  *(void *)(a1 + 24) = bswap64(*(void *)(a1 + 24));
  *(int8x8_t *)(a1 + 32) = vrev32_s8(*(int8x8_t *)(a1 + 32));
  *(int8x8_t *)(a1 + 64) = vrev32_s8(*(int8x8_t *)(a1 + 64));
  *(_DWORD *)(a1 + 200) = v3;
  if (v2)
  {
    uint64_t v5 = a1 + 204;
    do
    {
      *(int8x8_t *)uint64_t v5 = vrev32_s8(*(int8x8_t *)v5);
      *(int8x16_t *)(v5 + 8) = vrev64q_s8(*(int8x16_t *)(v5 + 8));
      *(int8x16_t *)(v5 + 24) = vrev64q_s8(*(int8x16_t *)(v5 + 24));
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t sub_21DC0A26C(uint64_t a1, uint64_t a2)
{
  if (*(__int16 *)(a1 + 912) < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 928) + 8 * v4);
    if (!v5 || !*v5) {
      return 999;
    }
    if ((sub_21DC0A2EC((uint64_t)v5, a2) & 1) == 0) {
      break;
    }
    if (++v4 >= *(__int16 *)(a1 + 912)) {
      return 0;
    }
  }
  return 107;
}

uint64_t sub_21DC0A2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DC3A9E4(a1);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(unsigned int *)(*(void *)a1 + 200);
  if (v6 < 2) {
    return 0;
  }
  uint64_t v8 = *(void *)(v5 + 24);
  unint64_t v9 = (v4 - 204) / 0x28uLL;
  BOOL v10 = v9 == v6 && v8 <= a2;
  unsigned int v13 = v10 && *(_DWORD *)(v5 + 4) == 1 && *(_DWORD *)v5 == 1835627368;
  if ((unint64_t)(v4 - 204) > 0x27)
  {
    int64_t v17 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(v5 + 16);
    int64_t v18 = v9 - 1;
    CFRange v19 = (void *)(v5 + 252);
    unsigned int v20 = 1;
    do
    {
      int v21 = *((_DWORD *)v19 - 12);
      uint64_t v22 = *(v19 - 2);
      uint64_t v23 = *(v19 - 5);
      uint64_t v24 = *(v19 - 4);
      if (v14 <= v23) {
        uint64_t v14 = *(v19 - 5);
      }
      if (v21 >= -2147483639 && (v21 + 1) >= 4 && v21 != 2147483646) {
        unsigned int v13 = 0;
      }
      if (v21 >= -2147483639)
      {
        if (v21 == 1) {
          unsigned int v13 = (v22 >= v24 << 9) & v13;
        }
      }
      else
      {
        unsigned int v13 = (v24 <= *(unsigned int *)(v5 + 32)) & v13;
      }
      uint64_t v27 = v24 + v23;
      BOOL v29 = v27 <= v15 && v23 <= v15;
      v13 &= v29;
      if (v21 != -1 && (v21 & 0xF0000000) != 0x70000000 && v18 > v17 && *v19 < v23) {
        unsigned int v13 = 0;
      }
      if (v18 > v17 && v27 != *v19) {
        unsigned int v13 = 0;
      }
      uint64_t v30 = *(v19 - 3) + v8;
      if (v30 + v22 > a2 || v30 > a2) {
        unsigned int v13 = 0;
      }
      int64_t v17 = v20;
      BOOL v10 = v9 > v20++;
      v19 += 5;
    }
    while (v10);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)(v5 + 16);
  }
  if (v14 == v15) {
    uint64_t v7 = v13;
  }
  else {
    uint64_t v7 = 0;
  }
  nullsub_4(a1);
  return v7;
}

uint64_t sub_21DC0A488(uint64_t a1)
{
  unsigned int v2 = (void **)sub_21DC3A90C(204);
  if (!sub_21DC3A898())
  {
    unsigned int v3 = *v2;
    *(void *)unsigned int v3 = 0x16D697368;
    v3[9] = -2;
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      uint64_t v4 = 0;
      unsigned int v32 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      unsigned int v7 = 0;
      uint64_t v8 = 204;
      uint64_t v31 = a1;
      while (1)
      {
        unint64_t v9 = *(uint64_t **)(*(void *)(a1 + 928) + 8 * v4);
        uint64_t v10 = *v9;
        int v11 = *(_DWORD *)(*v9 + 200);
        uint64_t v12 = *(void *)(*v9 + 8);
        if (v12 > v6)
        {
          v8 += 40;
          sub_21DC3A988((uint64_t)v2, v8);
          if (sub_21DC3A898()) {
            break;
          }
          uint64_t v13 = (uint64_t)*v2 + 40 * v7++;
          *(_DWORD *)(v13 + 204) = 0;
          *(_DWORD *)(v13 + 208) = 0;
          *(void *)(v13 + 212) = v6;
          *(void *)(v13 + 220) = v12 - v6;
          *(void *)(v13 + 228) = v5;
          *(void *)(v13 + 236) = 0;
          uint64_t v10 = *v9;
          uint64_t v6 = v12;
        }
        int v14 = v11 - 1;
        unsigned int v15 = *(_DWORD *)(v10 + 32);
        unsigned int v16 = v32;
        if (v15 > v32) {
          unsigned int v16 = v15;
        }
        sub_21DC3A988((uint64_t)v2, v8 + 40 * v14);
        if (sub_21DC3A898()) {
          break;
        }
        if (v14 >= 1)
        {
          uint64_t v17 = 0;
          uint64_t v18 = *v9;
          while (1)
          {
            uint64_t v19 = *(void *)(v18 + v17 + 204);
            uint64_t v20 = *(void *)(v18 + v17 + 212);
            uint64_t v21 = *(void *)(v18 + v17 + 220);
            long long v33 = *(_OWORD *)(v18 + v17 + 228);
            uint64_t v22 = *(void *)(v18 + 8) + v20;
            if (v22 >= v6) {
              goto LABEL_25;
            }
            if (v22 + v21 > v6) {
              break;
            }
LABEL_26:
            v17 += 40;
            if (40 * v14 == v17) {
              goto LABEL_27;
            }
          }
          if ((int)v19 > 2147483645)
          {
            if (v19 != 2147483646) {
              goto LABEL_23;
            }
          }
          else if (v19 >= 3)
          {
            if ((int)v19 < -2147483639 || v19 == -1)
            {
LABEL_29:
              uint64_t v25 = 107;
              goto LABEL_30;
            }
LABEL_23:
            if ((v19 & 0x80000000) != 0) {
              goto LABEL_29;
            }
          }
          v21 += v20 - v6;
          uint64_t v20 = v6;
LABEL_25:
          uint64_t v24 = (uint64_t)*v2 + 40 * v7++;
          v8 += 40;
          *(void *)(v24 + 204) = v19;
          *(void *)(v24 + 212) = v20;
          *(void *)(v24 + 220) = v21;
          *(_OWORD *)(v24 + 228) = v33;
          uint64_t v18 = *v9;
          *(void *)(v24 + 212) = *(void *)(*v9 + 8) + v20;
          *(void *)(v24 + 228) += *(void *)(v18 + 24);
          v6 += v21;
          v5 += *(void *)(v24 + 236);
          goto LABEL_26;
        }
LABEL_27:
        unsigned int v32 = v16;
        ++v4;
        a1 = v31;
        if (v4 >= *(__int16 *)(v31 + 912)) {
          goto LABEL_33;
        }
      }
      uint64_t v25 = 12;
LABEL_30:
      a1 = v31;
      goto LABEL_31;
    }
    unsigned int v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    unsigned int v32 = 0;
    uint64_t v8 = 204;
LABEL_33:
    uint64_t v26 = *(void *)(a1 + 884);
    if (v26 <= v6) {
      goto LABEL_36;
    }
    v8 += 40;
    sub_21DC3A988((uint64_t)v2, v8);
    if (!sub_21DC3A898())
    {
      uint64_t v27 = (uint64_t)*v2 + 40 * v7++;
      *(_DWORD *)(v27 + 204) = 0;
      *(_DWORD *)(v27 + 208) = 0;
      *(void *)(v27 + 212) = v6;
      *(void *)(v27 + 220) = v26 - v6;
      *(void *)(v27 + 228) = v5;
      *(void *)(v27 + 236) = 0;
      uint64_t v6 = v26;
LABEL_36:
      sub_21DC3A988((uint64_t)v2, v8 + 40);
      if (!sub_21DC3A898())
      {
        uint64_t v25 = 0;
        long long v28 = *v2;
        uint64_t v29 = (uint64_t)*v2 + 40 * v7;
        *(void *)(v29 + 204) = 0xFFFFFFFFLL;
        *(void *)(v29 + 212) = v6;
        *(void *)(v29 + 220) = 0;
        *(void *)(v29 + 228) = v5;
        *(void *)(v29 + 236) = 0;
        v28[2] = v6;
        *((_DWORD *)v28 + 8) = v32;
        *((_DWORD *)v28 + 50) = v7 + 1;
        goto LABEL_38;
      }
    }
  }
  uint64_t v25 = 12;
LABEL_31:
  sub_21DC3A944(v2);
  unsigned int v2 = 0;
LABEL_38:
  *(void *)(a1 + 904) = v2;
  return v25;
}

uint64_t sub_21DC0A7B0(unsigned char *a1)
{
  (*(void (**)(unsigned char *))(*(void *)a1 + 632))(a1);
  uint64_t result = (*(uint64_t (**)(unsigned char *))(*(void *)a1 + 616))(a1);
  if ((result & 1) == 0)
  {
    if (!a1[778])
    {
      uint64_t v3 = (*(uint64_t (**)(unsigned char *))(*(void *)a1 + 496))(a1);
      (*(void (**)(uint64_t, void))(*(void *)v3 + 352))(v3, 0);
    }
    uint64_t v4 = *(uint64_t (**)(unsigned char *, void))(*(void *)a1 + 648);
    return v4(a1, 0);
  }
  return result;
}

uint64_t sub_21DC0A8F0(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 176);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + ++*(_DWORD *)(result + 176) = v4;
  }
  return result;
}

void sub_21DC0A914(void *a1)
{
  sub_21DC0A980(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC0A95C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0A980(void *a1)
{
  *a1 = &unk_26CE86D08;
  sub_21DC09074((uint64_t)a1, 0);
  return sub_21DC0AB38(a1);
}

void sub_21DC0A9D8(_Unwind_Exception *a1)
{
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

void sub_21DC0A9F0(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 104);
  if (v2)
  {
    size_t Count = CFDictionaryGetCount(v2);
    if (Count)
    {
      int64_t v4 = Count;
      uint64_t v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      if (v5)
      {
        uint64_t v6 = v5;
        unsigned int v7 = (const void **)malloc_type_calloc(v4, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
        if (v4 >= 1)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            CFArrayRef v9 = (const __CFArray *)v7[i];
            if (v9)
            {
              CFIndex v10 = CFArrayGetCount((CFArrayRef)v7[i]);
              if (v10 >= 1)
              {
                CFIndex v11 = v10;
                for (CFIndex j = 0; j != v11; ++j)
                {
                  unsigned int v15 = 0;
                  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, j);
                  if (ValueAtIndex)
                  {
                    int v14 = ValueAtIndex;
                    if (sub_21DC09CB8((int)ValueAtIndex, ValueAtIndex, &v15)) {
                      sub_21DC3A944((void **)v15);
                    }
                    CFDictionaryRemoveValue(v14, @"Handle");
                  }
                }
              }
            }
          }
        }
        free(v6);
        if (v7) {
          free(v7);
        }
      }
    }
  }
}

uint64_t sub_21DC0AB3C(uint64_t a1)
{
  CFDictionaryRef v2 = *(void **)(a1 + 1008);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 1008) = 0;
  uint64_t v3 = *(unsigned int *)(**(void **)(a1 + 904) + 32);
  if (!v3) {
    return 0;
  }
  if (v3 > 0x400000) {
    return 107;
  }
  *(unsigned char *)(a1 + 1024) = 0;
  *(void *)(a1 + 1016) = v3 << 9;
  uint64_t v5 = malloc_type_malloc(v3 << 9, 0x5D0096D1uLL);
  *(void *)(a1 + 1008) = v5;
  if (v5) {
    return 0;
  }
  else {
    return 12;
  }
}

char *sub_21DC0ABBC(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 136);
  if (result) {
    uint64_t result = (char *)DIDiskImageObjectRelease(result);
  }
  *(void *)(a1 + 136) = a2;
  return result;
}

uint64_t sub_21DC0AC00(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 136);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 432))();
  }
  return result;
}

uint64_t sub_21DC0AC38(uint64_t a1)
{
  CFTypeRef cf = 0;
  CFDictionaryRef v2 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  values = v2;
  if (!v2)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  CFArrayRef v3 = (CFArrayRef)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFArrayGetTypeID()) {
    CFRetain(v3);
  }
  else {
    CFArrayRef v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, MEMORY[0x263EFFF70]);
  }
  if (sub_21DC0AE34((CFArrayRef *)&cf) || !cf || (CFIndex Count = CFArrayGetCount((CFArrayRef)cf), Count < 1))
  {
LABEL_7:
    uint64_t v5 = 0;
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
    if (!ValueAtIndex) {
      goto LABEL_23;
    }
    CFDictionaryRef v11 = ValueAtIndex;
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"writeable-components");
    CFArrayRef v13 = (const __CFArray *)CFDictionaryGetValue(v11, @"readonly-components");
    if (Value)
    {
      if (sub_21DC201E0(Value, v3)) {
        break;
      }
    }
    if (v13)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 72))(a1))
      {
        int v14 = sub_21DC201E0(v13, v3);
      }
      else
      {
        int v14 = sub_21DC1C2B4(v13, v3);
        if (Value) {
          goto LABEL_23;
        }
      }
      if (v14) {
        break;
      }
    }
LABEL_23:
    if (v8 == ++v9) {
      goto LABEL_7;
    }
  }
  uint64_t v5 = 1;
  if (v3) {
LABEL_8:
  }
    CFRelease(v3);
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

uint64_t sub_21DC0AE04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t sub_21DC0AE34(CFArrayRef *a1)
{
  io_iterator_t existing = 0;
  value = 0;
  if (!a1) {
    return 4;
  }
  *a1 = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v3 = IOServiceMatching("IOHDIXHDDrive");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if (MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    CFMutableArrayRef Mutable = 0;
  }
  else
  {
    if (!IOIteratorIsValid(existing)) {
      MEMORY[0x223C15CD0](existing);
    }
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      io_object_t v7 = IOIteratorNext(existing);
      if (v7)
      {
        io_registry_entry_t v8 = v7;
        do
        {
          CFDictionaryRef v9 = sub_21DC1C24C(v8);
          if (v9)
          {
            CFDictionaryRef v10 = v9;
            if (CFDictionaryGetValueIfPresent(v9, @"backingstore-id", (const void **)&value)) {
              CFArrayAppendValue(Mutable, value);
            }
            CFRelease(v10);
          }
          IOObjectRelease(v8);
          io_registry_entry_t v8 = IOIteratorNext(existing);
        }
        while (v8);
      }
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 999;
    }
  }
  if (existing)
  {
    IOObjectRelease(existing);
    io_iterator_t existing = 0;
  }
  if (v5) {
    BOOL v11 = Mutable == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    goto LABEL_28;
  }
  if (Mutable)
  {
    CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Mutable);
    *a1 = Copy;
    if (Copy) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = 999;
    }
LABEL_28:
    CFRelease(Mutable);
  }
  return v5;
}

uint64_t sub_21DC0AFB4()
{
  return 0;
}

uint64_t sub_21DC0AFBC()
{
  return 0;
}

uint64_t sub_21DC0AFC4(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t DIDiskImageHasChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(a1);
}

uint64_t sub_21DC0B01C(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
  if (!v1) {
    return 0;
  }
  mach_port_t v2 = (char *)v1;
  uint64_t v3 = (*(unsigned int (**)(uint64_t))(*(void *)v1 + 80))(v1) ^ 1;
  DIDiskImageObjectRelease(v2);
  return v3;
}

uint64_t sub_21DC0B0A0(uint64_t a1)
{
  uint64_t v2 = sub_21DC0B148(*(_DWORD *)(a1 + 744));
  if (!v2) {
    operator new();
  }
  uint64_t v3 = v2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v2 + 144))(v2, a1 + 752);
  return v3;
}

void sub_21DC0B124(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0B148(int a1)
{
  switch(a1)
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 13:
      operator new();
    case 2:
      operator new();
    case 4:
      operator new();
    case 6:
      operator new();
    case 7:
      operator new();
    case 8:
      operator new();
    case 9:
      operator new();
    default:
      return 0;
  }
}

void sub_21DC0B29C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0B308(uint64_t a1)
{
  uint64_t result = sub_21DC0B340(a1);
  *(void *)uint64_t result = &unk_26CE847E0;
  *(_DWORD *)(result + 112) = 0;
  return result;
}

uint64_t sub_21DC0B340(uint64_t a1)
{
  *(void *)sub_21DC03CF0(a1) = &unk_26CE84718;
  *(void *)(a1 + 104) = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  return a1;
}

void sub_21DC0B39C(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0B3B4(uint64_t result, unsigned int *a2)
{
  *(_DWORD *)(result + 112) = bswap32(*a2);
  return result;
}

BOOL sub_21DC0B3C4(uint64_t a1)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 128))(a1) == 10) {
    return 0;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 128))(a1)) {
    return (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1) == 0;
  }
  return 1;
}

uint64_t sub_21DC0B47C()
{
  return 2;
}

uint64_t sub_21DC0B484()
{
  return 32;
}

void sub_21DC0B48C(void *a1)
{
  sub_21DC0B4F8(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC0B4D4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

void *sub_21DC0B4F8(void *a1)
{
  *a1 = &unk_26CE84718;
  uint64_t v2 = (const void *)a1[13];
  if (v2) {
    CFRelease(v2);
  }
  return sub_21DC04E48(a1);
}

void sub_21DC0B554(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

uint64_t DIDiskImageCopyImageChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 176))();
}

uint64_t DIDiskImageGetBackingStore(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 296))();
}

BOOL sub_21DC0B5BC(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  return ((statfs(*(const char **)(a1 + 296), &v2) & 0x80000000) == 0 || !*__error()) && (v2.f_flags & 0x1000) == 0;
}

uint64_t sub_21DC0B63C(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (statfs(*(const char **)(a1 + 296), &v2) < 0 && *__error()) {
    return 0;
  }
  else {
    return v2.f_flags & 1;
  }
}

uint64_t sub_21DC0B6BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 88) = a2;
  return result;
}

uint64_t sub_21DC0B6C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t DIDiskImageValidateChecksum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 168))(a1, a2, a3, a4, 0);
}

uint64_t sub_21DC0B6F8(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  CFStringRef v10 = (const __CFString *)sub_21DC02040();
  int v11 = sub_21DC02048(v10, 0);
  if (v10) {
    CFRelease(v10);
  }
  if ((a5 & 1) == 0 && v11)
  {
    CFStringRef v12 = (const __CFString *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"di-valid-cached-checksum");
    if (sub_21DC02048(v12, 0))
    {
      if (a2) {
        *a2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
      }
      if (a3) {
        *a3 = 0;
      }
      if (a4) {
        *a4 = 0;
      }
      return 117;
    }
    goto LABEL_14;
  }
  if (v11) {
LABEL_14:
  }
    (*(void (**)(uint64_t, __CFString *, void))(*(void *)a1 + 32))(a1, @"di-valid-cached-checksum", *MEMORY[0x263EFFB38]);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, void *, void *))(*(void *)a1 + 160))(a1, a2, a3, a4);
  if ((a5 & 4) == 0 && a5 & 2 | v11 && !result)
  {
    (*(void (**)(uint64_t, __CFString *, void))(*(void *)a1 + 32))(a1, @"di-valid-cached-checksum", *MEMORY[0x263EFFB40]);
    return 0;
  }
  return result;
}

__CFArray *sub_21DC0B8C0(uint64_t a1, __CFString *theString1)
{
  if (CFEqual(theString1, @"udif-ordered-chunks"))
  {
    CFStringRef v6 = (const __CFString *)sub_21DC0B9D8(a1, theString1);
    if (!v6)
    {
      int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 608))(a1);
      CFDictionaryRef v9 = (const __CFString **)MEMORY[0x263EFFB40];
      if (!v8) {
        CFDictionaryRef v9 = (const __CFString **)MEMORY[0x263EFFB38];
      }
      CFStringRef v6 = *v9;
      sub_21DC08628(a1, theString1, *v9);
    }
    return (__CFArray *)v6;
  }
  int HasPrefix = CFStringHasPrefix(theString1, @"data-run-info-");
  uint64_t v5 = sub_21DC0B9D8(a1, theString1);
  CFStringRef v6 = (const __CFString *)v5;
  if (!HasPrefix || v5) {
    return (__CFArray *)v6;
  }
  sub_21DC3386C(a1, theString1);
  return sub_21DC0B9D8(a1, theString1);
}

__CFArray *sub_21DC0B9D8(uint64_t a1, CFTypeRef cf1)
{
  if (!cf1) {
    return 0;
  }
  if (CFEqual(cf1, @"di-valid-cached-checksum"))
  {
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 536))(a1);
    uint64_t v5 = MEMORY[0x263EFFB40];
    if (!v4) {
      uint64_t v5 = MEMORY[0x263EFFB38];
    }
    return *(__CFArray **)v5;
  }
  if (CFEqual(cf1, @"tiger-blkx"))
  {
    uint64_t v7 = a1;
    char v8 = 1;
LABEL_11:
    return sub_21DC2DD8C(v7, v8);
  }
  if (CFEqual(cf1, @"leopard-blkx"))
  {
    uint64_t v7 = a1;
    char v8 = 0;
    goto LABEL_11;
  }
  if (CFEqual(cf1, @"bs-io-scheduling")
    && (uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1)) != 0
    && (uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 488))(v9)) != 0)
  {
    int v11 = *(uint64_t (**)(void))(*(void *)v10 + 24);
    return (__CFArray *)v11();
  }
  else
  {
    return (__CFArray *)sub_21DC05340(a1, cf1);
  }
}

uint64_t sub_21DC0BBA0(uint64_t a1)
{
  CFTypeRef cf = 0;
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 488))(v2);
  if (!v3
    || (*(unsigned int (**)(uint64_t, __CFString *, CFTypeRef *))(*(void *)v3 + 120))(v3, @"com.apple.diskimages.recentcksum", &cf))
  {
    goto LABEL_4;
  }
  if (!cf) {
    return 0;
  }
  CFStringRef v6 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)cf, 0x8000100u);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFStringRef v8 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 544))(a1);
    if (v8)
    {
      CFStringRef v9 = v8;
      uint64_t v4 = CFEqual(v7, v8);
      CFRelease(v7);
      CFStringRef v7 = v9;
    }
    else
    {
      uint64_t v4 = 0;
    }
    CFRelease(v7);
  }
  else
  {
LABEL_4:
    uint64_t v4 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

size_t sub_21DC0BD14(uint64_t a1, const __CFString *a2, CFDataRef *a3)
{
  uint64_t v5 = (const char *)sub_21DC0373C(a2, 0x8000100u);
  CFStringRef v6 = (char *)v5;
  if (a3 && v5)
  {
    ssize_t v7 = getxattr(*(const char **)(a1 + 296), v5, 0, 0, 0, 0);
    size_t v8 = v7;
    if ((v7 & 0x8000000000000000) == 0)
    {
      CFStringRef v9 = (UInt8 *)malloc_type_malloc(v7, 0xD316FE41uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        ssize_t v11 = getxattr(*(const char **)(a1 + 296), v6, v9, v8, 0, 0);
        size_t v8 = 999;
        if ((v11 & 0x8000000000000000) == 0)
        {
          CFDataRef v12 = CFDataCreate(0, v10, v11);
          *a3 = v12;
          if (v12) {
            size_t v8 = 0;
          }
          else {
            size_t v8 = 999;
          }
        }
        free(v10);
      }
      else
      {
        size_t v8 = 12;
      }
    }
  }
  else
  {
    size_t v8 = 999;
    if (!v5) {
      return v8;
    }
  }
  free(v6);
  return v8;
}

uint64_t sub_21DC0BE08(uint64_t a1, const __CFString *a2, const __CFData *a3)
{
  uint64_t v5 = (const char *)sub_21DC0373C(a2, 0x8000100u);
  if (!v5) {
    return 999;
  }
  CFStringRef v6 = (char *)v5;
  ssize_t v7 = *(const char **)(a1 + 296);
  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    size_t Length = CFDataGetLength(a3);
    uint64_t v10 = setxattr(v7, v6, BytePtr, Length, 0, 0);
  }
  else
  {
    uint64_t v10 = removexattr(v7, v5, 0);
  }
  uint64_t v11 = v10;
  free(v6);
  return v11;
}

uint64_t sub_21DC0BEB0(uint64_t a1, char **a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  *(unsigned char *)(a1 + 1032) = 1;
  uint64_t result = sub_21DC0BEEC(a1, a2, a3, a4);
  *(unsigned char *)(a1 + 1032) = 0;
  return result;
}

uint64_t sub_21DC0BEEC(uint64_t a1, char **a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
  size_t v8 = (char *)v7;
  if (v7)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 80))(v7)) {
      operator new();
    }
    CFStringRef v9 = (char *)sub_21DC0C0B4((uint64_t)v8);
    if (v9)
    {
      uint64_t v11 = (*(uint64_t (**)(uint64_t, char *))(*(void *)a1 + 184))(a1, v9);
      if (v11)
      {
        uint64_t v10 = v11;
        if (!a2) {
          goto LABEL_21;
        }
      }
      else
      {
        if ((*(unsigned int (**)(char *, char *))(*(void *)v8 + 152))(v8, v9)) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = 116;
        }
        if (!a2)
        {
LABEL_21:
          DIDiskImageObjectRelease(v8);
          if (a3) {
            goto LABEL_22;
          }
          goto LABEL_23;
        }
      }
    }
    else
    {
      uint64_t v10 = 999;
      if (!a2) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    if (!a2)
    {
      uint64_t v10 = 999;
      if (!a3) {
        return v10;
      }
      CFStringRef v9 = 0;
LABEL_22:
      *a3 = v9;
      return v10;
    }
    CFStringRef v9 = 0;
    uint64_t v10 = 999;
  }
  *a2 = v8;
  if (a3) {
    goto LABEL_22;
  }
LABEL_23:
  if (v9) {
    DIDiskImageObjectRelease(v9);
  }
  return v10;
}

void sub_21DC0C090(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0C0B4(uint64_t a1)
{
  int v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a1);
  return sub_21DC0B148(v1);
}

uint64_t sub_21DC0C0FC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(unsigned __int8 *, uint64_t, void))(*(void *)a1 + 560))(a1, a2, a1[1032]);
}

uint64_t sub_21DC0C12C(__int16 *a1, uint64_t a2, int a3)
{
  (*(void (**)(uint64_t))(*(void *)a2 + 48))(a2);
  (*(void (**)(__int16 *, double))(*(void *)a1 + 344))(a1, 0.0);
  if (a1[456] >= 1)
  {
    uint64_t v6 = a1[457];
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if ((int)v6 >= -2)
    {
      uint64_t v7 = (void **)(a1 + 452);
      if (v6 == -2)
      {
LABEL_6:
        CFStringRef v9 = *v7;
        if (*v7)
        {
          uint64_t v10 = sub_21DC0C810((uint64_t)a1, v6);
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = sub_21DC0B148(*(_DWORD *)(*v9 + 64));
            if (v12)
            {
              CFArrayRef v13 = (char *)v12;
              if (a3) {
                sub_21DC0C840((_DWORD *)(*v9 + 64));
              }
              int v14 = DIGetBundleRef();
              CFStringRef v15 = (const __CFString *)sub_21DC3A890(v14, (int)@"Checksumming %1$@\\U2026", @"Checksumming %1$@\\U2026");
              CFStringRef v16 = CFStringCreateWithFormat(alloc, 0, v15, v11);
              (*(void (**)(__int16 *, CFStringRef, uint64_t))(*(void *)a1 + 336))(a1, v16, 16);
              if (v16) {
                CFRelease(v16);
              }
              if (v15) {
                CFRelease(v15);
              }
              sub_21DC0CAE4((char *)a1, v9, v13);
            }
          }
        }
        goto LABEL_17;
      }
      uint64_t v8 = a1[457];
      if (v6 - v8 < (unsigned __int16)a1[456])
      {
        uint64_t v7 = (void **)(*((void *)a1 + 116) - 8 * v8 + 8 * v6);
        goto LABEL_6;
      }
    }
LABEL_17:
    uint64_t v17 = 999;
    goto LABEL_18;
  }
  uint64_t v17 = 0;
LABEL_18:
  (*(void (**)(uint64_t))(*(void *)a2 + 72))(a2);
  (*(void (**)(__int16 *, float))(*(void *)a1 + 344))(a1, 100.0);
  return v17;
}

uLong sub_21DC0C73C(uint64_t a1)
{
  uLong result = crc32(0, 0, 0);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_21DC0C770(uint64_t a1, float a2)
{
  float v6 = a2;
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 112);
  if (v3)
  {
    return v3();
  }
  else
  {
    uint64_t result = sub_21DC0C7FC(a1);
    if (result)
    {
      uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, float *, void, void, void))sub_21DC0C7FC(a1);
      return v5(1, a1, &v6, 0, 0, 0);
    }
  }
  return result;
}

uint64_t sub_21DC0C7FC(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t sub_21DC0C808(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

const void *sub_21DC0C810(uint64_t a1, uint64_t a2)
{
  if (a2 >= -1
    && (CFIndex v2 = a2 - *(__int16 *)(a1 + 914), v2 < *(__int16 *)(a1 + 912))
    && (CFArrayRef v3 = *(const __CFArray **)(a1 + 936)) != 0)
  {
    return CFArrayGetValueAtIndex(v3, v2);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_21DC0C840(_DWORD *a1)
{
  switch(*a1)
  {
    case 0:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
      operator new();
    case 2:
      operator new();
    case 4:
      operator new();
    case 6:
      operator new();
    case 7:
      operator new();
    case 8:
      operator new();
    case 9:
      operator new();
    default:
      return 0;
  }
}

void sub_21DC0C9C4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0CA30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v6 = *(uint64_t (**)(void))(a1 + 104);
  if (v6)
  {
    return v6();
  }
  else
  {
    uint64_t result = sub_21DC0C7FC(a1);
    if (result)
    {
      uint64_t v8 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, void, void))sub_21DC0C7FC(a1);
      return v8(0, a1, a2, a3, 0, 0);
    }
  }
  return result;
}

void sub_21DC0CAE4(char *a1, void *a2, char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  (*(void (**)(char *))(*(void *)a1 + 96))(a1);
  (*(void (**)(char *))(*(void *)a3 + 48))(a3);
  memset(&v21, 0, sizeof(v21));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)CFArrayRef v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  uint64_t v11 = a3;
  DIDiskImageObjectRetain_0(a3);
  uint64_t v10 = a1;
  DIDiskImageObjectRetain_0(a1);
  uint64_t v6 = *a2;
  uint64_t v7 = *a2 + 204;
  uint64_t v22 = a2;
  uint64_t v23 = v7;
  *(void *)&long long v19 = *(void *)(v6 + 16);
  *((void *)&v19 + 1) = *(void *)(v6 + 8);
  pthread_mutex_init((pthread_mutex_t *)&v13[1], 0);
  pthread_cond_init((pthread_cond_t *)&v17[1], 0);
  pthread_mutex_init((pthread_mutex_t *)&v17[7], 0);
  pthread_cond_init((pthread_cond_t *)&v17[15], 0);
  BYTE8(v18) = 0;
  long long v20 = 0uLL;
  pthread_mutex_init(&v21, 0);
  operator new();
}

void sub_21DC0D0B4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0D100(void **a1)
{
  uint64_t result = ((uint64_t (*)(void **))(*a1)[37])(a1);
  if (result) {
    return *(void *)(*a1[113] + 16);
  }
  return result;
}

uint64_t sub_21DC0D15C(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879A8;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 72), 0);
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 144) = 0;
  return a1;
}

uint64_t sub_21DC0D1BC(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879F8;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  *(void *)(a1 + 72) = 0;
  return a1;
}

uint64_t sub_21DC0D208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    *(void *)(a2 + 72) = *(void *)(a1 + 128);
    *(void *)(a1 + 128) = a2;
    int v5 = *(_DWORD *)(a1 + 140);
    int v6 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v6;
    if (v5) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "TAOQueue::push: _count is now %d\n", v6);
    }
  }
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

uint64_t sub_21DC0D2A0(void *a1)
{
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  CFIndex v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  int v3 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32))(*a1, &v29, 0);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v29 == 0;
  }
  if (v4)
  {
LABEL_54:
    if (!v3) {
      goto LABEL_56;
    }
  }
  else
  {
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)a1 + 5);
      uint64_t v5 = a1[39];
      int v6 = (int *)a1[49];
      int v7 = *v6;
      if (*v6 == -1)
      {
        uint64_t v10 = 0;
        int v8 = 0;
        uint64_t v12 = a1[39];
      }
      else
      {
        int v8 = 0;
        int v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = 2048;
        uint64_t v12 = a1[39];
        while (1)
        {
          uint64_t v13 = *((void *)v6 + 2);
          if (!v13) {
            break;
          }
LABEL_12:
          BOOL v15 = (v7 - 2147483646) < 2 || v7 == 0;
          int v16 = !v15 && v7 != 2;
          int v17 = v15;
          if (v10)
          {
            if (v8 != v16 || v9 != v17) {
              goto LABEL_37;
            }
          }
          else
          {
            int v9 = v17;
            int v8 = v16;
          }
          uint64_t v18 = *((void *)v6 + 1) + v13;
          uint64_t v19 = v18 - v12;
          if (v8)
          {
            if (v19 >= v11) {
              uint64_t v20 = v11;
            }
            else {
              uint64_t v20 = v18 - v12;
            }
            v10 += v20;
            v12 += v20;
            if (v19 > v11)
            {
              int v8 = 1;
              goto LABEL_37;
            }
            v11 -= v20;
          }
          else
          {
            v10 += v19;
            uint64_t v12 = v18;
          }
          int v21 = v6[10];
          v6 += 10;
          int v7 = v21;
          a1[49] = v6;
          if (v21 == -1) {
            goto LABEL_37;
          }
        }
        long long v14 = v6 + 10;
        while (1)
        {
          int v7 = *v14;
          if (*v14 == -1) {
            break;
          }
          uint64_t v13 = *((void *)v14 + 2);
          v14 += 10;
          if (v13)
          {
            int v6 = v14 - 10;
            a1[49] = v6;
            goto LABEL_12;
          }
        }
        a1[49] = v14;
      }
LABEL_37:
      a1[39] = v12;
      pthread_mutex_unlock((pthread_mutex_t *)a1 + 5);
      if (v5 >= a1[36] || v10 == 0)
      {
        int v3 = 0;
        goto LABEL_56;
      }
      if (!v8)
      {
        (*(void (**)(void, void *))(*(void *)*a1 + 16))(*a1, v29);
        operator new();
      }
      int v23 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void))(*(void *)a1[2] + 48))(a1[2], a1[37] + v5, v10, &v28, v29[13]);
      if (v23)
      {
        int v3 = v23;
        goto LABEL_55;
      }
      if (v28 != v10) {
        break;
      }
      uint64_t v24 = v29;
      v29[11] = v5;
      v24[12] = v10;
      (*(void (**)(void, void *))(*(void *)a1[1] + 24))(a1[1], v24);
      uint64_t v29 = 0;
      int v25 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32))(*a1, &v29, 0);
      if (v25) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = v29 == 0;
      }
      if (v26)
      {
        int v3 = v25;
        goto LABEL_54;
      }
    }
    int v3 = 5;
  }
LABEL_55:
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((unsigned char *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
LABEL_56:
  if (v29) {
    (*(void (**)(void *))(*v29 + 8))(v29);
  }
  return v3;
}

void sub_21DC0D644(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4072491613);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0D668(uint64_t a1)
{
  uint64_t v11 = 0;
  CFIndex v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  --*(_DWORD *)(a1 + 40);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 120));
  pthread_mutex_unlock(v2);
  while (1)
  {
    uint64_t v10 = *(void *)(a1 + 304);
    if (v10 >= *(void *)(a1 + 288)) {
      break;
    }
    int v3 = (*(uint64_t (**)(void, BOOL (*)(uint64_t, void *), uint64_t *, void **))(**(void **)(a1 + 8) + 40))(*(void *)(a1 + 8), sub_21DC0E95C, &v10, &v11);
    BOOL v4 = v11;
    if (v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v11 == 0;
    }
    if (v5) {
      goto LABEL_14;
    }
    uint64_t v6 = v11[12];
    *(void *)(a1 + 304) += v6;
    uint64_t v7 = v4[13];
    if (v7)
    {
      (*(void (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24), v7, v6 << 9);
      int v8 = v11;
      v11[11] = 0;
      v8[12] = 0;
      (*(void (**)(void))(**(void **)a1 + 16))();
    }
    else if (!*((unsigned char *)v4 + 112) {
           || ((*(void (**)(void, void, uint64_t))(**(void **)(a1 + 24) + 64))(*(void *)(a1 + 24), 0, v6 << 9), (BOOL v4 = v11) != 0))
    }
    {
      (*(void (**)(void *))(*v4 + 8))(v4);
    }
    uint64_t v11 = 0;
  }
  int v3 = 0;
LABEL_14:
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 168));
  *(unsigned char *)(a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 232));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 168));
  if (v11) {
    (*(void (**)(void *))(*v11 + 8))(v11);
  }
  return v3;
}

uint64_t sub_21DC0D868(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *(void *)a2 = 0;
  if (*(_DWORD *)(a1 + 120)) {
    goto LABEL_12;
  }
  uint64_t v7 = (FILE **)MEMORY[0x263EF8348];
  while (1)
  {
    if ((a3 & 1) == 0)
    {
      int v8 = *(_DWORD *)(a1 + 144);
      if (*(_DWORD *)(a1 + 136) < v8)
      {
        if (*(_DWORD *)(a1 + 140)) {
          fprintf(*v7, "TAOQueue::dequeue: stalled _count=%d _reservePool=%d\n", *(_DWORD *)(a1 + 136), v8);
        }
        goto LABEL_8;
      }
    }
    uint64_t v9 = *(void *)(a1 + 128);
    if (v9) {
      break;
    }
LABEL_8:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), v6);
    if (*(_DWORD *)(a1 + 120)) {
      goto LABEL_12;
    }
  }
  *(void *)a2 = v9;
  *(void *)(a1 + 128) = *(void *)(*(void *)(a1 + 128) + 72);
  *(void *)(*(void *)a2 + 72) = 0;
  int v10 = *(_DWORD *)(a1 + 140);
  int v11 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v11;
  if (v10) {
    fprintf(*v7, "TAOQueue::dequeue: _count is now %d\n", v11);
  }
LABEL_12:
  pthread_mutex_unlock(v6);
  return 0;
}

uint64_t sub_21DC0D974(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3, void *a4)
{
  if (!a2)
  {
    int v11 = *(uint64_t (**)(void))(*(void *)a1 + 32);
    return v11();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *a4 = 0;
  if (*(_DWORD *)(a1 + 120)) {
    goto LABEL_19;
  }
  int v8 = (uint64_t *)(a1 + 128);
  while (1)
  {
    uint64_t v9 = *v8;
    if (*v8) {
      break;
    }
LABEL_9:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
    if (*(_DWORD *)(a1 + 120)) {
      goto LABEL_19;
    }
  }
  if (a2(*v8, a3))
  {
    while (1)
    {
      uint64_t v10 = v9;
      uint64_t v9 = *(void *)(v9 + 72);
      if (!v9) {
        goto LABEL_9;
      }
      if (!a2(v9, a3)) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_15:
  uint64_t v13 = (void *)(v10 + 72);
  if (!v10) {
    uint64_t v13 = (void *)(a1 + 128);
  }
  *uint64_t v13 = *(void *)(v9 + 72);
  *(void *)(v9 + 72) = 0;
  *a4 = v9;
  int v14 = *(_DWORD *)(a1 + 140);
  int v15 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v15;
  if (v14) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "TAOQueue::dequeueWithFilter: _count is now %d\n", v15);
  }
LABEL_19:
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  return 0;
}

uint64_t sub_21DC0DAF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char *a5)
{
  v37[1] = 0;
  uint64_t v9 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 160));
  uint64_t v27 = v9;
  if (a5)
  {
    uint64_t v10 = 0;
    if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1))
    {
      uint64_t v11 = 22;
      if ((a3 & 0x8000000000000000) == 0)
      {
        uint64_t v12 = *(void *)(a1 + 360);
        if (v12 >= a2 && a3 + a2 <= v12)
        {
          if (a3)
          {
            uint64_t v10 = 0;
            uint64_t v29 = (pthread_mutex_t *)(a1 + 944);
            while (1)
            {
              uint64_t v36 = 0;
              v37[0] = 0;
              uint64_t v34 = 0;
              long long v35 = 0;
              uint64_t v32 = 0;
              uint64_t v33 = 0;
              __src = 0;
              uint64_t v31 = 0;
              uint64_t v13 = *(void *)(a1 + 368);
              if (v13)
              {
                sub_21DC10BAC(v13);
                if (sub_21DC10BB4(*(void *)(a1 + 368), a2, a3, v37, (uint64_t *)&__src))
                {
                  memmove(a5, __src, v37[0] << 9);
                  sub_21DC10C48(*(void *)(a1 + 368));
                  goto LABEL_25;
                }
                sub_21DC10C48(*(void *)(a1 + 368));
              }
              sub_21DC0DF7C(a1, a2, &v36, (_DWORD *)&v36 + 1, &v34, &v33, &v32, &v31, &v35);
              uint64_t v15 = v33;
              uint64_t v14 = v34;
              uint64_t v16 = a2 - v34;
              if (v33 - (a2 - v34) >= a3) {
                uint64_t v17 = a3;
              }
              else {
                uint64_t v17 = v33 - (a2 - v34);
              }
              v37[0] = v17;
              if (SHIDWORD(v36) >= -2147483639)
              {
                LODWORD(v11) = 999;
                switch(HIDWORD(v36))
                {
                  case 0xFFFFFFFF:
                    goto LABEL_43;
                  case 0:
                  case 2:
                    bzero(a5, v17 << 9);
                    goto LABEL_25;
                  case 1:
                    uint64_t v24 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
                    int v22 = (*(uint64_t (**)(void))(v24 + 328))();
                    break;
                  default:
                    if (HIDWORD(v36) == 2147483646) {
                      goto LABEL_51;
                    }
                    int v22 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, void *, char *))(*(void *)a1 + 576))(a1, v35, a2, v17, v37, a5);
                    break;
                }
                LODWORD(v11) = v22;
                goto LABEL_43;
              }
              uint64_t v18 = *(void *)(a1 + 368);
              int v19 = pthread_mutex_trylock(v29);
              if (v18 || a2 != v14 || v17 != v15)
              {
                if (!v19)
                {
                  LODWORD(v11) = sub_21DC10C50(a1, (uint64_t)v35, v36);
                  if (!v11) {
                    memmove(a5, (const void *)(*(void *)(a1 + 1008) + (v16 << 9)), v37[0] << 9);
                  }
                  pthread_mutex_unlock(v29);
                  goto LABEL_43;
                }
                uint64_t v20 = (char *)malloc_type_malloc(*(void *)(a1 + 1016), 0x8DD0383DuLL);
                if (!v20)
                {
LABEL_40:
                  LODWORD(v11) = 12;
                  goto LABEL_43;
                }
                int v21 = v20;
                LODWORD(v11) = sub_21DC0E01C((uint64_t *)a1, v35, v20, (uint64_t)&v20[*(void *)(a1 + 1016) - v31]);
                if (!v11) {
                  memmove(a5, &v21[512 * v16], v37[0] << 9);
                }
                goto LABEL_39;
              }
              if (v19) {
                goto LABEL_36;
              }
              if (!*(unsigned char *)(a1 + 1024) || *(_DWORD *)(a1 + 1028) != v36)
              {
                pthread_mutex_unlock(v29);
LABEL_36:
                int v23 = (char *)malloc_type_malloc(*((void *)v35 + 4), 0xF44FC1EuLL);
                if (!v23) {
                  goto LABEL_40;
                }
                int v21 = v23;
                LODWORD(v11) = sub_21DC0E01C((uint64_t *)a1, v35, a5, (uint64_t)v23);
                if (v11) {
                  fprintf((FILE *)*MEMORY[0x263EF8348], "__decompressChunk() error: %d", v11);
                }
LABEL_39:
                free(v21);
                goto LABEL_43;
              }
              memmove(a5, *(const void **)(a1 + 1008), v37[0] << 9);
              pthread_mutex_unlock(v29);
LABEL_25:
              LODWORD(v11) = 0;
LABEL_43:
              v10 += v37[0];
              if (v11) {
                BOOL v25 = 0;
              }
              else {
                BOOL v25 = v37[0] == 0;
              }
              if (v25) {
                uint64_t v11 = 999;
              }
              else {
                uint64_t v11 = v11;
              }
              if (v11) {
                goto LABEL_54;
              }
              a3 -= v37[0];
              a2 += v37[0];
              a5 += 512 * v37[0];
LABEL_51:
              if (!a3)
              {
                uint64_t v11 = 0;
                goto LABEL_54;
              }
            }
          }
          uint64_t v11 = 0;
          uint64_t v10 = 0;
        }
      }
    }
    else
    {
      uint64_t v11 = 999;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 22;
  }
LABEL_54:
  if (a4) {
    *a4 = v10;
  }
  pthread_rwlock_unlock(v27);
  return v11;
}

uint64_t sub_21DC0DF7C(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  int v9 = 0;
  uint64_t v10 = **(void **)(result + 904);
  unsigned int v11 = *(_DWORD *)(v10 + 200) >> 1;
  uint64_t v12 = v10 + 204;
  while (1)
  {
    uint64_t v13 = *(void *)(v12 + 8);
    if (v13 <= a2 && *(void *)(v12 + 16) + v13 > a2) {
      break;
    }
    BOOL v14 = v13 <= a2;
    if (v13 <= a2) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = -(uint64_t)v11;
    }
    if (v14) {
      int v16 = v11;
    }
    else {
      int v16 = -v11;
    }
    v9 += v16;
    v12 += 40 * v15;
    v11 >>= v11 > 1;
  }
  *a4 = *(_DWORD *)v12;
  *a3 = v9;
  *a5 = v13;
  *a6 = *(void *)(v12 + 48) - *(void *)(v12 + 8);
  *a7 = *(void *)(v12 + 24);
  *a8 = *(void *)(v12 + 32);
  if (a9) {
    *a9 = v12;
  }
  return result;
}

uint64_t sub_21DC0E01C(uint64_t *a1, _DWORD *a2, const void *a3, uint64_t a4)
{
  uint64_t v8 = sub_21DC0E1E8((uint64_t)a1, *a2);
  if (!v8) {
    return 999;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(*(uint64_t (**)(uint64_t *))(*a1 + 296))(a1);
  uint64_t v11 = (*(uint64_t (**)(void))(v10 + 328))();
  if (v11)
  {
    uint64_t v12 = v11;
    fprintf((FILE *)*MEMORY[0x263EF8348], "__decompressChunk: backing store read at offset %qd length %qd failed with error %d\n", *((void *)a2 + 3), *((void *)a2 + 4), v11);
  }
  else
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, void, const void *, void))(*(void *)v9 + 48))(v9, a4, a2[8], a3, (a2[4] << 9));
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = (FILE **)MEMORY[0x263EF8348];
      fprintf((FILE *)*MEMORY[0x263EF8348], "CUDIFDiskImage::__decompressChunk()__decompressChunk: decompressData failed with error %d\n", v13);
      fprintf(*v15, "chunk: %p\n->runType: %#x\n->sectorStart: %qd\n->sectorCount: %qd\n->compOffset: %qd\n->compLength: %qd\n", a2, *a2, *((void *)a2 + 1), *((void *)a2 + 2), *((void *)a2 + 3), *((void *)a2 + 4));
      sub_21DC2BB98(a2[8], a4);
      return v14;
    }
    else
    {
      uint64_t v16 = a1[46];
      if (v16)
      {
        sub_21DC10CC0(v16);
        sub_21DC10CC8(a1[46], *((void *)a2 + 1), *((void *)a2 + 2), a3);
        sub_21DC10C48(a1[46]);
      }
      return 0;
    }
  }
  return v12;
}

uint64_t sub_21DC0E1E8(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 376))
  {
    switch(a2)
    {
      case -2147483648:
      case -2147483644:
        operator new();
      case -2147483647:
        operator new();
      case -2147483646:
        operator new();
      case -2147483645:
        operator new();
      case -2147483643:
        operator new();
      case -2147483641:
        operator new();
      default:
        return *(void *)(a1 + 376);
    }
  }
  return *(void *)(a1 + 376);
}

void sub_21DC0E33C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C4069E7AED5);
  _Unwind_Resume(a1);
}

void *sub_21DC0E3AC(uint64_t a1)
{
  uint64_t result = sub_21DC0E3E0(a1);
  *uint64_t result = &unk_26CE84E00;
  return result;
}

void *sub_21DC0E3E0(uint64_t a1)
{
  uint64_t result = (void *)sub_21DC03CF0(a1);
  *uint64_t result = &unk_26CE84B10;
  return result;
}

uint64_t sub_21DC0E414(uint64_t a1, Bytef *a2, int a3, Bytef *a4, int a5)
{
  unint64_t v8 = a5;
  uint64_t v5 = a3;
  uint64_t v6 = sub_21DC0E484(a4, &v8, a2, a3);
  if (v6) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "decompression failed; compressed chunk size %ld\n", v5);
  }
  return v6;
}

uint64_t sub_21DC0E484(Bytef *a1, unint64_t *a2, Bytef *a3, uint64_t a4)
{
  unint64_t v5 = *a2;
  memset(&strm, 0, sizeof(strm));
  if (a3 < a1)
  {
    if (&a3[a4 - 1] >= a1) {
      return 1000;
    }
    goto LABEL_7;
  }
  uint64_t v6 = &a1[v5];
  if (&a1[v5] <= a3)
  {
LABEL_7:
    strm.next_in = a3;
    strm.avail_in = a4;
    strm.next_out = a1;
    strm.avail_out = v5;
    *a2 = 0;
    if (inflateInit_(&strm, "1.2.12", 112)) {
      return 1000;
    }
    if (inflate(&strm, 4) != 1) {
      goto LABEL_38;
    }
    *a2 = strm.total_out;
    BOOL v8 = inflateEnd(&strm) == 0;
    unsigned int v9 = 1000;
LABEL_10:
    if (v8) {
      return 0;
    }
    else {
      return v9;
    }
  }
  strm.next_in = a3;
  strm.avail_in = a4;
  strm.next_out = a1;
  strm.avail_out = a3 - a1;
  if (inflateInit_(&strm, "1.2.12", 112)) {
    return 1001;
  }
  char v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  next_out = 0;
  uLong total_out = 0;
  uint64_t v15 = 0;
  uint64_t v33 = a2;
  uint64_t v34 = v6 - 1;
  uInt v16 = LODWORD(strm.next_in) - LODWORD(strm.next_out);
  size_t v17 = v5 >> 4;
  int v18 = 2;
  while (1)
  {
    strm.avail_out = v16;
    if (v16 > 0x64) {
      goto LABEL_21;
    }
    if (v15) {
      break;
    }
    if ((v10 & 1) == 0)
    {
      if (v5 < 0x10) {
        goto LABEL_38;
      }
      uint64_t v29 = (Bytef *)malloc_type_calloc(v17, 1uLL, 0x100004077774924uLL);
      if (!v29) {
        return 1001;
      }
      uint64_t v11 = v29;
      next_out = strm.next_out;
      uLong total_out = strm.total_out;
      strm.next_out = v29;
      strm.avail_out = v17;
      int v30 = inflate(&strm, v18);
      if (v30 == 1)
      {
        uint64_t v31 = v33;
LABEL_44:
        memmove(next_out, v11, strm.total_out - total_out);
        free(v11);
LABEL_45:
        int v32 = inflateEnd(&strm);
        *uint64_t v31 = strm.total_out;
        BOOL v8 = v32 == 0;
        unsigned int v9 = 1001;
        goto LABEL_10;
      }
      if (v30 | strm.avail_out) {
        goto LABEL_38;
      }
      uint64_t v15 = 0;
      unint64_t v12 = v17;
      goto LABEL_30;
    }
    uint64_t v19 = v34 - next_out;
    if (v34 - next_out >= v5) {
      goto LABEL_38;
    }
    int v20 = v19 + 1;
    if (v12 > v19 + 1) {
      goto LABEL_38;
    }
    uLong v21 = total_out;
    size_t v22 = v17;
    unint64_t v23 = v12;
    uLong v24 = strm.total_out;
    BOOL v25 = (char *)malloc_type_calloc(v19 + 1, 1uLL, 0x100004077774924uLL);
    if (!v25) {
      return 1001;
    }
    uint64_t v15 = v25;
    size_t v26 = v24 - v21;
    memmove(v25, v11, v26);
    free(v11);
    char v10 = 0;
    strm.next_out = (Bytef *)&v15[v26];
    strm.avail_out = v20 - v26;
    int v18 = 4;
    unint64_t v12 = v23;
    size_t v17 = v22;
    uLong total_out = v21;
LABEL_21:
    int v27 = inflate(&strm, v18);
    if (v27 == 1)
    {
      if (v15)
      {
        memmove(next_out, v15, strm.total_out - total_out);
        free(v15);
        uint64_t v31 = v33;
      }
      else
      {
        uint64_t v31 = v33;
        if (v10) {
          goto LABEL_44;
        }
      }
      goto LABEL_45;
    }
    if (v27 | strm.avail_out) {
      goto LABEL_38;
    }
    if ((v10 & 1) == 0)
    {
      int v28 = (int)strm.next_out;
      goto LABEL_32;
    }
LABEL_30:
    uInt v16 = 0;
    char v10 = 1;
    if (strm.next_in - next_out >= (int64_t)(strm.total_out - total_out))
    {
      memmove(next_out, v11, strm.total_out - total_out);
      free(v11);
      int v28 = next_out + LODWORD(strm.total_out) - total_out;
      strm.next_out = &next_out[strm.total_out - total_out];
LABEL_32:
      char v10 = 0;
      uInt v16 = LODWORD(strm.next_in) - v28;
    }
  }
  if (v10) {
    free(v11);
  }
  free(v15);
LABEL_38:
  inflateEnd(&strm);
  return 1000;
}

uint64_t sub_21DC0E7E8(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    unint64_t v5 = (void *)(a1 + 128);
    uint64_t v6 = *(void *)(a1 + 128);
    while (v6)
    {
      uint64_t v7 = v6;
      uint64_t v6 = *(void *)(v6 + 72);
      if (!v6)
      {
        unint64_t v5 = (void *)(v7 + 72);
        break;
      }
    }
    void *v5 = a2;
    int v8 = *(_DWORD *)(a1 + 140);
    int v9 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v9;
    if (v8) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "TAOQueue::enqueue: _count is now %d\n", v9);
    }
  }
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

void sub_21DC0E894(void *a1)
{
  sub_21DC0E900(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC0E8DC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4072491613);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0E900(void *a1)
{
  *a1 = &unk_26CE85E48;
  CFIndex v2 = (void *)a1[13];
  if (v2) {
    free(v2);
  }
  return sub_21DC0E970((uint64_t)a1);
}

BOOL sub_21DC0E95C(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 88) != *a2;
}

uint64_t sub_21DC0E970(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879F8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

uLong sub_21DC0E9B4(uint64_t a1, const Bytef *a2, uInt a3)
{
  uLong result = crc32(*(unsigned int *)(a1 + 112), a2, a3);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_21DC0E9E0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 128)) {
    return 1;
  }
  int v3 = *(uint64_t (**)(uint64_t))(a1 + 120);
  if (v3)
  {
    int v4 = v3(a1);
  }
  else
  {
    uint64_t result = sub_21DC0C7FC(a1);
    if (!result) {
      return result;
    }
    unint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_21DC0C7FC(a1);
    int v4 = v5(2, a1, 0, 0, 0, 0);
  }
  return v4 != 0;
}

uint64_t sub_21DC0EA60(_DWORD *a1)
{
  a1[30] = 1;
  return (*(uint64_t (**)(_DWORD *, void))(*(void *)a1 + 24))(a1, 0);
}

void sub_21DC0EA94(uint64_t a1)
{
  sub_21DC0EB00(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC0EADC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC0EB00(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879A8;
  CFIndex v2 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  int v3 = *(void **)(a1 + 128);
  if (v3)
  {
    do
    {
      int v4 = (void *)v3[9];
      (*(void (**)(void *))(*v3 + 8))(v3);
      --*(_DWORD *)(a1 + 136);
      int v3 = v4;
    }
    while (v4);
  }
  *(void *)(a1 + 128) = 0;
  pthread_mutex_unlock(v2);
  pthread_mutex_destroy(v2);
  pthread_cond_destroy((pthread_cond_t *)(a1 + 72));
  return a1;
}

CFStringRef sub_21DC0EBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 152))(a2, a3);
    int v6 = DIGetBundleRef();
    if (v5)
    {
      uint64_t v7 = @"verified   %1$@ %2$@";
LABEL_7:
      CFStringRef v8 = (const __CFString *)sub_21DC3A890(v6, (int)v7, v7);
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2);
      uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
      CFStringRef v11 = CFStringCreateWithFormat(v9, 0, v8, v10, v21);
      goto LABEL_11;
    }
    CFStringRef v8 = (const __CFString *)sub_21DC3A890(v6, (int)@"calculated %1$@ %2$@, expected   %3$@ %4$@", @"calculated %1$@ %2$@, expected   %3$@ %4$@");
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 104))(a3);
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 120))(a3);
    uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2);
    uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
    CFStringRef v11 = CFStringCreateWithFormat(v12, 0, v8, v13, v14, v15, v23);
  }
  else
  {
    if (a2)
    {
      int v6 = DIGetBundleRef();
      uint64_t v7 = @"expected   %1$@ %2$@";
      goto LABEL_7;
    }
    if (!a3) {
      return 0;
    }
    int v16 = DIGetBundleRef();
    CFStringRef v8 = (const __CFString *)sub_21DC3A890(v16, (int)@"calculated %1$@ %2$@", @"calculated %1$@ %2$@");
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 104))(a3);
    uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 120))(a3);
    CFStringRef v11 = CFStringCreateWithFormat(v17, 0, v8, v18, v22);
  }
LABEL_11:
  CFStringRef v19 = v11;
  if (v8) {
    CFRelease(v8);
  }
  return v19;
}

uint64_t sub_21DC0EE68(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a1);
  if (v4 != (*(unsigned int (**)(uint64_t))(*(void *)a2 + 128))(a2)) {
    return 0;
  }
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  if (v5 != (*(unsigned int (**)(uint64_t))(*(void *)a2 + 88))(a2)) {
    return 0;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  unsigned int v7 = v6 >> 3;
  if ((v6 & 7) != 0) {
    size_t v8 = v7 + 1;
  }
  else {
    size_t v8 = v7;
  }
  if (!v8) {
    return 1;
  }
  uint64_t v9 = v6;
  uint64_t v10 = (char *)malloc_type_malloc(v8, 0xDE9EE13DuLL);
  CFStringRef v11 = (char *)malloc_type_malloc(v8, 0x25ECD364uLL);
  CFAllocatorRef v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)a1 + 96))(a1, v10, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)a2 + 96))(a2, v12, v9);
    BOOL v16 = strncmp(v10, v12, v8) == 0;
LABEL_17:
    free(v10);
    BOOL v14 = v16;
    goto LABEL_18;
  }
  BOOL v16 = 0;
  BOOL v14 = 0;
  if (v10) {
    goto LABEL_17;
  }
LABEL_18:
  if (v12) {
    free(v12);
  }
  return v14;
}

void *sub_21DC0F074(unsigned int *a1, void *a2, unsigned int a3)
{
  unsigned int v3 = a3;
  unsigned int __src = bswap32(a1[28]);
  if ((*(unsigned int (**)(unsigned int *))(*(void *)a1 + 88))(a1) < a3) {
    unsigned int v3 = (*(uint64_t (**)(unsigned int *))(*(void *)a1 + 88))(a1);
  }
  unsigned int v6 = v3 >> 3;
  if ((v3 & 7) != 0) {
    size_t v7 = v6 + 1;
  }
  else {
    size_t v7 = v6;
  }
  return memcpy(a2, &__src, v7);
}

__CFString *sub_21DC0F128()
{
  return @"CRC32";
}

CFMutableStringRef sub_21DC0F134(CFMutableStringRef *a1)
{
  uint64_t v2 = ((uint64_t (*)(CFMutableStringRef *))(*a1)[2].length)(a1);
  unsigned int v3 = v2 >> 3;
  if ((v2 & 7) != 0) {
    size_t v4 = v3 + 1;
  }
  else {
    size_t v4 = v3;
  }
  CFStringReplaceAll(a1[13], &stru_26CE87FA8);
  if (v2)
  {
    int v5 = (unsigned __int8 *)malloc_type_malloc(v4, 0x1EE5DCF9uLL);
    if (v5)
    {
      unsigned int v6 = v5;
      CFStringAppend(a1[13], @"$");
      ((void (*)(CFMutableStringRef *, unsigned __int8 *, uint64_t))(*a1)[3].isa)(a1, v6, v2);
      if (v4)
      {
        size_t v7 = v6;
        do
        {
          int v8 = *v7++;
          snprintf(__str, 3uLL, "%02hX", v8);
          CFStringAppendCString(a1[13], __str, 0x600u);
          LODWORD(v4) = v4 - 1;
        }
        while (v4);
      }
      free(v6);
    }
  }
  return a1[13];
}

CFStringRef sub_21DC0F258(const __CFString *a1, uint64_t a2, const __CFBoolean *a3)
{
  if (!a1 || !a2) {
    return 0;
  }
  if (a2 >= 0) {
    CFIndex v6 = a2;
  }
  else {
    CFIndex v6 = -a2;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v8 = v6 - Length;
  if (v6 > Length)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
    if (Mutable)
    {
      CFStringRef v11 = Mutable;
      if (a2 < 0)
      {
        CFStringAppend(Mutable, a1);
        CFStringPad(v11, @" ", v6, 1);
      }
      else
      {
        CFStringPad(Mutable, @" ", v8, 1);
        CFStringAppend(v11, a1);
      }
      CFStringRef Copy = CFStringCreateCopy(v9, v11);
      CFRelease(v11);
      return Copy;
    }
    return 0;
  }
  CFIndex v13 = Length;
  int Value = CFBooleanGetValue(a3);
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!Value || v6 == v13)
  {
    return CFStringCreateCopy(v15, a1);
  }
  else
  {
    v16.location = 0;
    v16.length = v6;
    return CFStringCreateWithSubstring(v15, a1, v16);
  }
}

void sub_21DC0F3C0(uint64_t a1, _DWORD *a2)
{
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a1);
  unsigned int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  if (v4 >= 0x400) {
    int v5 = 1024;
  }
  else {
    int v5 = v4;
  }
  a2[1] = v5;
  (*(void (**)(uint64_t, _DWORD *, uint64_t))(*(void *)a1 + 96))(a1, a2 + 2, 1024);
  unsigned int v6 = a2[1] + 7;
  if (v6 <= 0x3FF)
  {
    uint64_t v7 = v6 >> 3;
    bzero((char *)a2 + v7 + 8, 128 - v7);
  }
}

CFStringRef sub_21DC0F4C4(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
  if (!v2) {
    return 0;
  }
  unsigned int v3 = (char *)v2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 488))(v4);
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  CFStringRef v7 = (CFStringRef)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)v5 + 24))(v5, @"bs-persistentID");
  if (v7)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, __CFString *))(*(void *)v6 + 24))(v6, @"bs-modtime");
      if (v9)
      {
        uint64_t v10 = (const void *)v9;
        CFTypeID v11 = CFStringGetTypeID();
        if (v11 == CFGetTypeID(v10))
        {
          uint64_t v12 = (*(uint64_t (**)(char *))(*(void *)v3 + 104))(v3);
          if (v12)
          {
            CFIndex v13 = (const void *)v12;
            CFTypeID v14 = CFStringGetTypeID();
            if (v14 == CFGetTypeID(v13))
            {
              uint64_t v15 = (*(uint64_t (**)(char *))(*(void *)v3 + 120))(v3);
              if (v15)
              {
                CFRange v16 = (const void *)v15;
                CFTypeID v17 = CFStringGetTypeID();
                if (v17 == CFGetTypeID(v16))
                {
                  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@ @ %@ - %@:%@", v7, v10, v13, v16);
                  goto LABEL_14;
                }
              }
            }
          }
        }
      }
    }
LABEL_13:
    CFStringRef v7 = 0;
  }
LABEL_14:
  DIDiskImageObjectRelease(v3);
  return v7;
}

uint64_t sub_21DC0F700()
{
  return 0;
}

uint64_t DIDiskImageCopyChecksumReportString(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 376))();
}

uint64_t DIDiskImageObjectGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

uint64_t sub_21DC0F758()
{
  return 0;
}

uint64_t DIDiskImageIsKernelCompatible(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 200))();
}

uint64_t sub_21DC0F784(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 208))(a1);
  if (result)
  {
    unsigned int v3 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1) + 96);
    return v3();
  }
  return result;
}

uint64_t sub_21DC0F838(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 904);
  if (v1)
  {
    uint64_t v2 = *v1;
    int v3 = *(_DWORD *)(*v1 + 200);
    if (!v3) {
      return 1;
    }
    for (uint64_t i = (int *)(v2 + 204); *i >= -2147483639 || ((0x15Fu >> *i) & 1) == 0; i += 10)
    {
      if (!--v3) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_21DC0F88C(void *a1)
{
  if (!(*(unsigned int (**)(void *))(*a1 + 688))(a1)) {
    return 0;
  }
  uint64_t v2 = a1[25];
  if (!v2) {
    return 0;
  }
  int v3 = *(uint64_t (**)(void))(*(void *)v2 + 96);
  return v3();
}

BOOL sub_21DC0F924(uint64_t a1)
{
  return *(unsigned char *)(a1 + 778) && *(unsigned char *)(a1 + 779) && !*(unsigned char *)(a1 + 780) && *(void *)(a1 + 456) <= 0x400000;
}

uint64_t sub_21DC0F954()
{
  return 1;
}

__CFDictionary *sub_21DC0F95C(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  int v3 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (v2 && (CFMutableArrayRef Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 456))(v2)) != 0
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
  {
    uint64_t v5 = sub_21DC0FED8();
    if (v5)
    {
      uint64_t v6 = v5;
      CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFDataRef v9 = sub_21DC0FEBC(v7, 0x8000100u);
        if (v9)
        {
          CFDataRef v10 = v9;
          CFDictionarySetValue(Mutable, @"icon-path", v9);
          CFRelease(v8);
          CFStringRef v8 = (const __CFString *)v10;
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    uint64_t valuePtr = 512;
    CFAllocatorRef v11 = *v3;
    CFNumberRef v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"blocksize", v12);
    if (v12) {
      CFRelease(v12);
    }
    CFIndex v13 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
    if (v13)
    {
      CFTypeID v14 = v13;
      CFDictionarySetValue(Mutable, @"image-type", v13);
      CFRelease(v14);
    }
    int v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
    CFRange v16 = (const void *)*MEMORY[0x263EFFB38];
    CFTypeID v17 = (const void *)*MEMORY[0x263EFFB40];
    if (v15) {
      uint64_t v18 = (const void *)*MEMORY[0x263EFFB38];
    }
    else {
      uint64_t v18 = (const void *)*MEMORY[0x263EFFB40];
    }
    CFDictionarySetValue(Mutable, @"write-protected", v18);
    CFStringRef v19 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 280))(a1);
    if (v19) {
      CFDictionarySetValue(Mutable, @"backingstore-id", v19);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 384))(a1)) {
      int v20 = v17;
    }
    else {
      int v20 = v16;
    }
    CFDictionarySetValue(Mutable, @"image-encrypted", v20);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 288))(a1))
    {
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232))(a1);
      CFNumberRef v21 = CFNumberCreate(v11, kCFNumberLongLongType, &v23);
      CFDictionarySetValue(Mutable, @"virtual-band-size", v21);
      CFRelease(v21);
    }
  }
  return Mutable;
}

uint64_t sub_21DC0FCAC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 456))();
  }
  return result;
}

__CFDictionary *sub_21DC0FCE4(uint64_t a1)
{
  CFMutableArrayRef Mutable = sub_21DC0FD88(a1);
  if (Mutable
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
  {
    int v3 = (const void *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"bs-apple-quarantine-info");
    if (v3) {
      CFDictionarySetValue(Mutable, @"bs-apple-quarantine-info", v3);
    }
  }
  return Mutable;
}

__CFDictionary *sub_21DC0FD88(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable) {
    sub_21DC2C258(a1, Mutable);
  }
  return Mutable;
}

uint64_t sub_21DC0FDE4(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

CFURLRef sub_21DC0FDEC(CFURLRef relativeURL)
{
  CFURLRef v1 = relativeURL;
  if (!relativeURL) {
    return v1;
  }
  CFURLRef v2 = CFURLCopyAbsoluteURL(relativeURL);
  CFURLRef v3 = v2;
  if (v2) {
    CFURLRef v4 = v2;
  }
  else {
    CFURLRef v4 = v1;
  }
  CFStringRef v5 = CFURLCopyScheme(v4);
  CFStringRef v6 = v5;
  if (!v5 || CFEqual(v5, @"file"))
  {
    CFStringRef Copy = CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
LABEL_10:
    CFURLRef v1 = (const __CFURL *)Copy;
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (CFURLGetString(v1))
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v8 = CFURLGetString(v1);
    CFStringRef Copy = CFStringCreateCopy(v7, v8);
    goto LABEL_10;
  }
  CFURLRef v1 = 0;
  if (v3) {
LABEL_11:
  }
    CFRelease(v3);
LABEL_12:
  if (v6) {
    CFRelease(v6);
  }
  return v1;
}

CFDataRef sub_21DC0FEBC(CFStringRef theString, CFStringEncoding encoding)
{
  return CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], theString, encoding, 0);
}

__CFBundle *sub_21DC0FED8()
{
  uint64_t result = (__CFBundle *)DIGetBundleRef();
  if (result)
  {
    return CFBundleCopyResourceURL(result, @"CDiskImage", @"icns", 0);
  }
  return result;
}

__CFString *sub_21DC0FF20(uint64_t a1)
{
  CFURLRef v1 = *(uint64_t **)(a1 + 904);
  if (!v1) {
    return @"UDIF read-only";
  }
  uint64_t v2 = *v1;
  int v3 = *(_DWORD *)(*v1 + 200);
  if (!v3) {
    return @"UDIF read-only";
  }
  uint64_t result = @"UDIF read-only compressed (bzip2)";
  for (uint64_t i = (_DWORD *)(v2 + 204); *i == -1; i += 10)
  {
    if (!--v3) {
      return @"UDIF read-only";
    }
  }
  switch(*i)
  {
    case 0x80000004:
      uint64_t result = @"UDIF read-only compressed (ADC)";
      break;
    case 0x80000005:
      uint64_t result = @"UDIF read-only compressed (zlib)";
      break;
    case 0x80000006:
      return result;
    case 0x80000007:
      uint64_t result = @"UDIF read-only compressed (lzfse)";
      break;
    case 0x80000008:
      uint64_t result = @"UDIF read-only compressed (lzma)";
      break;
    default:
      JUMPOUT(0);
  }
  return result;
}

uint64_t sub_21DC0FFE8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 148);
}

uint64_t sub_21DC0FFF0(void *a1)
{
  uint64_t result = a1[19];
  if (!result)
  {
    int v3 = (const void *)(*(uint64_t (**)(void *))(*a1 + 192))(a1);
    (*(void (**)(void *, const void *))(*a1 + 504))(a1, v3);
    if (v3) {
      CFRelease(v3);
    }
    return a1[19];
  }
  return result;
}

__CFDictionary *sub_21DC10088(uint64_t a1)
{
  if (!(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1)) {
    return 0;
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  int v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 48))(v2);
  values = v3;
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = (const __CFArray *)v3;
  CFTypeID v5 = CFGetTypeID(v3);
  CFTypeID TypeID = CFArrayGetTypeID();
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFArrayRef v8 = v5 == TypeID
     ? CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v4)
     : CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFArrayRef v9 = v8;
  if (!v8) {
    return 0;
  }
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v12 = Mutable;
  if (Mutable)
  {
    if (v10) {
      CFIndex v13 = @"writeable-components";
    }
    else {
      CFIndex v13 = @"readonly-components";
    }
    CFDictionarySetValue(Mutable, v13, v9);
  }
  CFRelease(v9);
  return v12;
}

void sub_21DC10228(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFArrayRef v4 = *(const void **)(a1 + 152);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 152) = cf;
}

uint64_t sub_21DC10268(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (!v1) {
    return 0;
  }
  LOBYTE(v2) = 0;
  do
  {
    if ((_BYTE)v2) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 104))(v1);
    }
    uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 496))(v1);
  }
  while (v1);
  return v2;
}

uint64_t sub_21DC10320(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 104))();
  }
  return result;
}

uint64_t sub_21DC10350()
{
  return 0;
}

uint64_t sub_21DC10358()
{
  return 0;
}

__CFDictionary *sub_21DC10360(uint64_t a1)
{
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  int v3 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (v2 && (CFMutableArrayRef Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 464))(v2)) != 0
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
  {
    CFTypeID v5 = sub_21DC0FED8();
    if (v5)
    {
      CFStringRef v6 = v5;
      CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFDataRef v9 = sub_21DC0FEBC(v7, 0x8000100u);
        if (v9)
        {
          CFDataRef v10 = v9;
          CFDictionarySetValue(Mutable, @"icon-path", v9);
          CFRelease(v8);
          CFStringRef v8 = (const __CFString *)v10;
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    uint64_t valuePtr = 512;
    CFAllocatorRef v11 = *v3;
    CFNumberRef v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"blocksize", v12);
    if (v12) {
      CFRelease(v12);
    }
    CFNumberRef v13 = CFNumberCreate(v11, kCFNumberSInt64Type, &v25);
    CFDictionarySetValue(Mutable, @"blockcount", v13);
    if (v13) {
      CFRelease(v13);
    }
    CFTypeID v14 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72))(a1);
    if (v14)
    {
      int v15 = v14;
      CFDictionarySetValue(Mutable, @"image-type", v14);
      CFRelease(v15);
    }
    int v16 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
    if (v16 == 1430541391 || v16 == 1430538566)
    {
      CFTypeID v17 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(Mutable, @"image-format-read-only", (const void *)*MEMORY[0x263EFFB40]);
      uint64_t v18 = (const void *)*MEMORY[0x263EFFB38];
    }
    else
    {
      uint64_t v18 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionarySetValue(Mutable, @"image-format-read-only", (const void *)*MEMORY[0x263EFFB38]);
      CFTypeID v17 = (const void *)*MEMORY[0x263EFFB40];
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 288))(a1)) {
      CFStringRef v19 = v18;
    }
    else {
      CFStringRef v19 = v17;
    }
    CFDictionarySetValue(Mutable, @"write-protected", v19);
    int v20 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 280))(a1);
    if (v20) {
      CFDictionarySetValue(Mutable, @"backingstore-id", v20);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 384))(a1)) {
      CFNumberRef v21 = v17;
    }
    else {
      CFNumberRef v21 = v18;
    }
    CFDictionarySetValue(Mutable, @"image-encrypted", v21);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 288))(a1))
    {
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232))(a1);
      CFNumberRef v22 = CFNumberCreate(v11, kCFNumberLongLongType, &v24);
      CFDictionarySetValue(Mutable, @"virtual-band-size", v22);
      CFRelease(v22);
    }
  }
  return Mutable;
}

uint64_t sub_21DC1079C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 464))();
  }
  return result;
}

__CFDictionary *sub_21DC107D4(uint64_t a1)
{
  CFMutableArrayRef Mutable = sub_21DC10890(a1);
  if (Mutable
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
  {
    CFDictionaryAddValue(Mutable, @"Physical Interconnect Location", @"File");
    int v3 = (const void *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"bs-apple-quarantine-info");
    if (v3) {
      CFDictionarySetValue(Mutable, @"bs-apple-quarantine-info", v3);
    }
  }
  return Mutable;
}

__CFDictionary *sub_21DC10890(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable) {
    sub_21DC2C258(a1, Mutable);
  }
  return Mutable;
}

uint64_t sub_21DC108F0(uint64_t a1, int a2)
{
  *(void *)a1 = &unk_26CE86E98;
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0);
  *(_DWORD *)(a1 + 208) = a2;
  *(void *)(a1 + 216) = malloc_type_calloc(a2, 8uLL, 0x2004093837F09uLL);
  if (*(int *)(a1 + 208) >= 1) {
    operator new();
  }
  return a1;
}

void sub_21DC109EC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x1081C405D66F177);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC10A10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 200);
  if (!v2) {
    return *(unsigned char *)(a1 + 192) != 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 664))(v2);
  *(unsigned char *)(a1 + 192) = result;
  return result;
}

uint64_t sub_21DC10A78(_DWORD *a1, uint64_t a2)
{
  int v4 = a1[80];
  if (v4 < 0
    || (int v5 = fcntl(v4, 3, 0), v5 != -1)
    && (!a2 ? (int v6 = 0) : (int v6 = 128), fcntl(a1[80], 4, v5 & 0xFFFFFF7F | v6) != -1))
  {
    sub_21DC10B7C((uint64_t)a1, a2);
    if ((*(unsigned int (**)(_DWORD *))(*(void *)a1 + 72))(a1))
    {
      if (a2)
      {
        (*(void (**)(_DWORD *, uint64_t))(*(void *)a1 + 472))(a1, 1);
        sub_21DC04BA8((uint64_t)a1);
      }
      else
      {
        sub_21DC03E34((uint64_t)a1);
      }
    }
  }
  return *((unsigned __int8 *)a1 + 192);
}

uint64_t sub_21DC10B7C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 192) = a2;
  return a2;
}

uint64_t DIDiskImageReadSectors(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 48))();
}

uint64_t sub_21DC10BAC(uint64_t a1)
{
  return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_21DC10BB4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v5 = *(unsigned int *)(a1 + 208);
  if ((int)v5 < 1)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    char v7 = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 216) + v6);
      if (v9 && *(unsigned char *)(v9 + 24))
      {
        uint64_t v10 = *(void *)(v9 + 32);
        uint64_t v11 = *(void *)(v9 + 40) + v10;
        ++*(void *)(v9 + 16);
        BOOL v12 = __OFSUB__(a2, v10);
        uint64_t v13 = a2 - v10;
        if (v13 < 0 == v12 && v11 > a2)
        {
          if (v11 - a2 >= a3) {
            uint64_t v15 = a3;
          }
          else {
            uint64_t v15 = v11 - a2;
          }
          uint64_t v16 = *(void *)(v9 + 56) + (v13 << 9);
          char v7 = 1;
          ++*(void *)(v9 + 8);
          *(void *)(v9 + 16) = 1;
          *a4 = v15;
          *a5 = v16;
        }
      }
      v6 += 8;
    }
    while (v8 != v6);
  }
  return v7 & 1;
}

uint64_t sub_21DC10C48(uint64_t a1)
{
  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_21DC10C50(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 1024) && *(_DWORD *)(a1 + 1028) == a3) {
    return 0;
  }
  *(unsigned char *)(a1 + 1024) = 0;
  uint64_t result = sub_21DC0E01C((uint64_t *)a1, (_DWORD *)a2, *(const void **)(a1 + 1008), *(void *)(a1 + 1008) + *(void *)(a1 + 1016) - *(void *)(a2 + 32));
  if (!result)
  {
    *(_DWORD *)(a1 + 1028) = a3;
    *(unsigned char *)(a1 + 1024) = 1;
  }
  return result;
}

uint64_t sub_21DC10CC0(uint64_t a1)
{
  return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_21DC10CC8(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v8 = sub_21DC10D84(a1, a3);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  *(unsigned char *)(v8 + 24) = 0;
  *(int64x2_t *)(v8 + 8) = vdupq_n_s64(1uLL);
  *(void *)(v8 + 32) = a2;
  uint64_t v10 = sub_21DC10E88(v8, a3);
  if (v10)
  {
    fwrite("CUDIFCacheObject::cacheData: setLength failed\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    sub_21DC37B08(a1);
  }
  else
  {
    memcpy(*(void **)(v9 + 56), a4, a3 << 9);
    *(unsigned char *)(v9 + 24) = 1;
  }
  return v10;
}

uint64_t sub_21DC10D84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 208);
  if ((int)v2 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)(a1 + 216);
  unsigned int v7 = -1;
  int64_t v8 = 0x8000000000000000;
  while (1)
  {
    uint64_t v9 = *(void *)(v6 + 8 * v5);
    if (v9) {
      break;
    }
LABEL_8:
    if (v2 == ++v5)
    {
      if ((v7 & 0x80000000) != 0) {
        return 0;
      }
      return *(void *)(*(void *)(a1 + 216) + 8 * v7);
    }
  }
  if (*(unsigned char *)(v9 + 24) || *(void *)(v9 + 48) < a2)
  {
    uint64_t v10 = sub_21DC10E30(v9);
    if (v10 > v8)
    {
      unsigned int v7 = v5;
      int64_t v8 = v10;
    }
    goto LABEL_8;
  }
  unsigned int v7 = v5;
  if ((v5 & 0x80000000) == 0) {
    return *(void *)(*(void *)(a1 + 216) + 8 * v7);
  }
  return 0;
}

uint64_t sub_21DC10E30(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    return *(void *)(a1 + 48) + 0x7FFFFFFFLL;
  }
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  unint64_t v3 = *(void *)(a1 + 40);
  do
  {
    if (v3) {
      uint64_t v2 = v1;
    }
    ++v1;
    v3 >>= 1;
  }
  while (v1 != 64);
  if (*(void *)(a1 + 16) - (v2 + 2 * *(void *)(a1 + 8)) >= 0x7FFFFFFF) {
    return 0x7FFFFFFFLL;
  }
  else {
    return *(void *)(a1 + 16) - (v2 + 2 * *(void *)(a1 + 8));
  }
}

uint64_t sub_21DC10E88(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) >= a2)
  {
    uint64_t v5 = (void *)(a1 + 40);
    goto LABEL_7;
  }
  int v4 = *(void **)(a1 + 56);
  if (v4) {
    free(v4);
  }
  *(void *)(a1 + 40) = 0;
  uint64_t v5 = (void *)(a1 + 40);
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v6 = malloc_type_malloc(a2 << 9, 0x290B651AuLL);
  if (v6)
  {
    *(void *)(a1 + 48) = a2;
    *(void *)(a1 + 56) = v6;
LABEL_7:
    uint64_t result = 0;
    void *v5 = a2;
    return result;
  }
  return 12;
}

uint64_t sub_21DC10F0C(io_object_t object, CFStringRef *a2)
{
  if (!a2) {
    return 22;
  }
  *a2 = 0;
  if (!object) {
    return 22;
  }
  if (!IOObjectConformsTo(object, "IOMedia")) {
    return 3758097090;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(object, @"BSD Name", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    uint64_t v6 = CFProperty;
    CFStringRef v7 = CFStringCreateWithFormat(v4, 0, @"/dev/%@", CFProperty);
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 4294962336;
    }
    *a2 = v7;
    CFRelease(v6);
  }
  else
  {
    uint64_t v8 = 0;
    *a2 = 0;
  }
  return v8;
}

uint64_t sub_21DC10FE0(const void *a1, CFTypeRef *a2, _WORD *a3, void *a4)
{
  uint64_t v15 = 0;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a1) {
    return 22;
  }
  uint64_t v6 = 2;
  int v7 = getmntinfo(&v15, 2);
  if (v7 >= 1)
  {
    int v8 = v7;
    for (uint64_t i = v15; ; ++i)
    {
      CFStringRef v10 = sub_21DC2AF3C((uint64_t)i);
      if (v10)
      {
        CFStringRef v11 = v10;
        if (CFEqual(v10, a1))
        {
          CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], i->f_mntonname, 0x8000100u);
          if (v12)
          {
            CFStringRef v13 = v12;
            if (a2) {
              *a2 = CFRetain(v12);
            }
            CFRelease(v11);
            uint64_t v6 = 0;
          }
          else
          {
            uint64_t v6 = 4294962336;
            CFStringRef v13 = v11;
          }
          CFRelease(v13);
          return v6;
        }
        CFRelease(v11);
      }
      if (!--v8) {
        return 2;
      }
    }
  }
  return v6;
}

void sub_21DC110F4(uint64_t a1)
{
  sub_21DC11160(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC1113C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

void *sub_21DC11160(uint64_t a1)
{
  *(void *)a1 = &unk_26CE85940;
  uint64_t v2 = *(void ***)(a1 + 904);
  if (v2) {
    sub_21DC3A944(v2);
  }
  *(void *)(a1 + 904) = 0;
  sub_21DC11238(a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 944));
  unint64_t v3 = *(void **)(a1 + 1008);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = *(void *)(a1 + 368);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *(char **)(a1 + 376);
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    *(void *)(a1 + 376) = 0;
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 160));
  return sub_21DC114A4((void *)a1);
}

void sub_21DC11220(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

void sub_21DC11238(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 928);
  if (v2)
  {
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      uint64_t v3 = 0;
      do
      {
        sub_21DC3A944(*(void ***)(*(void *)(a1 + 928) + 8 * v3));
        *(void *)(*(void *)(a1 + 928) + 8 * v3++) = 0;
      }
      while (v3 < *(__int16 *)(a1 + 912));
      uint64_t v2 = *(void **)(a1 + 928);
    }
    free(v2);
  }
  *(void *)(a1 + 928) = 0;
  uint64_t v4 = *(const void **)(a1 + 936);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 936) = 0;
  }
  *(_DWORD *)(a1 + 912) = 0;
  *(_WORD *)(a1 + 916) = 0;
}

void sub_21DC112B8(uint64_t a1)
{
  sub_21DC11324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC11300(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x1081C406A7D350BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC11324(uint64_t a1)
{
  *(void *)a1 = &unk_26CE86E98;
  uint64_t v2 = *(void **)(a1 + 216);
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 208);
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 216) + 8 * i);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
          int v3 = *(_DWORD *)(a1 + 208);
        }
      }
      uint64_t v2 = *(void **)(a1 + 216);
    }
    free(v2);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 8));
  return a1;
}

void sub_21DC113CC(void *a1)
{
  *a1 = &unk_26CE86EB8;
  uint64_t v1 = (void *)a1[7];
  if (v1) {
    free(v1);
  }
  JUMPOUT(0x223C15E40);
}

void sub_21DC11438()
{
  sub_21DC0AB38();
  JUMPOUT(0x223C15E40);
}

void sub_21DC11480(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

void *sub_21DC114A4(void *a1)
{
  *a1 = &unk_26CE84E60;
  uint64_t v2 = (char *)a1[17];
  if (v2) {
    DIDiskImageObjectRelease(v2);
  }
  a1[17] = 0;
  int v3 = (const void *)a1[19];
  if (v3)
  {
    CFRelease(v3);
    a1[19] = 0;
  }
  return sub_21DC04E48(a1);
}

void sub_21DC11514(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

void sub_21DC1152C(uint64_t a1)
{
  sub_21DC11598(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC11574(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40C363EFF1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC11598(uint64_t a1)
{
  *(void *)a1 = &unk_26CE86848;
  if (sub_21DC04B2C(a1)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 280))(a1, 1);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 592))(a1)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 368))(a1, 1);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 616))(a1)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 352))(a1, 1);
  }
  *(_OWORD *)(a1 + 744) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  return sub_21DC11718(a1);
}

void sub_21DC11700(_Unwind_Exception *a1)
{
  sub_21DC11718(v1);
  _Unwind_Resume(a1);
}

void *sub_21DC1171C(char **a1)
{
  *a1 = (char *)&unk_26CE85F08;
  if (sub_21DC04B2C((uint64_t)a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 35))(a1, 1);
  }
  if ((*((unsigned int (**)(char **))*a1 + 74))(a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 46))(a1, 1);
  }
  if ((*((unsigned int (**)(char **))*a1 + 77))(a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 44))(a1, 1);
  }
  sub_21DC0474C(a1[25]);
  return sub_21DC04D5C((uint64_t)a1);
}

void sub_21DC11880(_Unwind_Exception *a1)
{
  sub_21DC04D5C(v1);
  _Unwind_Resume(a1);
}

uint64_t DIGetPluginPropertyDicts()
{
  return qword_267D20278;
}

uint64_t sub_21DC118A8(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CSparseDiskImage") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CSparseDiskImage") > 0) {
    return 1000;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
  if (Value)
  {
    CFStringRef v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFStringGetTypeID())
    {
      if (CFStringCompare(v6, @"SPARSE", 0)) {
        return 4294966296;
      }
      else {
        return 1000;
      }
    }
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFStringGetTypeID())
    {
      CFStringCompare(v6, @"SPARSEBUNDLE", 0);
      return 4294966296;
    }
  }
  CFStringRef v10 = CFURLCopyPathExtension(a1);
  if (!v10) {
    return 1;
  }
  CFStringRef v11 = v10;
  if (CFStringCompare(v10, @"sparseimage", 1uLL)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 1000;
  }
  CFRelease(v11);
  return v4;
}

uint64_t sub_21DC119DC(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CRawDiskImage") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"diskimage-class", @"CRawDiskImage") > 0) {
    return 1000;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
  if (Value && (CFStringRef v6 = Value, v7 = CFGetTypeID(Value), v7 == CFStringGetTypeID()))
  {
    uint64_t v4 = 1000;
    if (CFStringCompare(v6, @"UDIF", 0))
    {
      if (CFStringCompare(v6, @"UDTO", 0)) {
        uint64_t v4 = 4294966296;
      }
      else {
        uint64_t v4 = 1000;
      }
    }
    if (CFEqual(v6, @"UNIV"))
    {
      if (CFDictionaryGetValue(theDict, @"hybrid-image-source-array")) {
        return 9999;
      }
      else {
        return 4294966296;
      }
    }
  }
  else
  {
    CFStringRef v8 = CFURLCopyPathExtension(a1);
    if (v8)
    {
      CFStringRef v9 = v8;
      if (CFStringCompare(v8, @"dmg", 1uLL) && CFStringCompare(v9, @"cdr", 1uLL)) {
        uint64_t v4 = 100;
      }
      else {
        uint64_t v4 = 1000;
      }
      CFRelease(v9);
    }
    else
    {
      return 100;
    }
  }
  return v4;
}

CFURLRef sub_21DC11B50(CFURLRef url, const __CFString *a2, int a3)
{
  CFURLRef v3 = url;
  if (!url) {
    return v3;
  }
  CFStringRef v6 = CFURLCopyPathExtension(url);
  if (v6)
  {
    CFStringRef v7 = v6;
    if (CFStringCompare(v6, a2, 1uLL))
    {
      CFURLRef v3 = sub_21DC1B980(*MEMORY[0x263EFFB08], v3, a2, a3);
    }
    else if (CFURLHasDirectoryPath(v3) == a3)
    {
      CFRetain(v3);
    }
    else
    {
      uint64_t v10 = *MEMORY[0x263EFFB08];
      CFURLRef v11 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
      if (v11)
      {
        CFURLRef v12 = v11;
        CFURLRef v3 = sub_21DC1B980(v10, v11, a2, a3);
        CFRelease(v12);
      }
      else
      {
        CFURLRef v3 = 0;
      }
    }
    CFRelease(v7);
    return v3;
  }
  uint64_t v8 = *MEMORY[0x263EFFB08];
  return sub_21DC1B980(v8, v3, a2, a3);
}

const void *sub_21DC11C7C(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFURLRef v3 = result;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC11CBC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0;
  CFNumberRef v21 = 0;
  CFStringRef v19 = 0;
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  uint64_t v14 = 22;
  if (a1 && a2 && a6)
  {
    if (sub_21DC01FB0())
    {
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (Mutable)
      {
        uint64_t v16 = Mutable;
        unsigned int v17 = 2;
        while (1)
        {
          if ((a3 >> v17))
          {
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
            uint64_t v14 = sub_21DC11E8C(v17, a1, a2, a4, a5, (uint64_t)&v19, (uint64_t)&cf);
            if (cf) {
              CFStringAppend(v16, (CFStringRef)cf);
            }
            if (v14 != 110) {
              break;
            }
          }
          if (--v17 == -1)
          {
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
            uint64_t v14 = sub_21DC120FC(a1, a2, a4, a5, (uint64_t)&v21, (uint64_t)&cf);
            if (cf) {
              CFStringAppend(v16, (CFStringRef)cf);
            }
            if (v14 && v21)
            {
              DIDiskImageObjectRelease(v21);
              CFNumberRef v21 = 0;
            }
            goto LABEL_29;
          }
        }
        if (!v14) {
          CFNumberRef v21 = v19;
        }
LABEL_29:
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        *a6 = v21;
        if (a7)
        {
          *a7 = v16;
          if (!CFStringGetLength(v16) && *a7)
          {
            CFRelease(*a7);
            *a7 = 0;
          }
        }
        else
        {
          CFRelease(v16);
        }
      }
      else
      {
        return 999;
      }
    }
    else
    {
      return 119;
    }
  }
  return v14;
}

uint64_t sub_21DC11E8C(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1 > 2) {
    return 110;
  }
  CFStringRef v7 = off_264477E30[a1];
  if (!v7[5]) {
    return 110;
  }
  unsigned int v14 = 0;
  int v15 = 0;
  uint64_t v23 = (int)a1;
  uint64_t v16 = (uint64_t *)(v7 + 12);
  unsigned int v17 = -1;
  do
  {
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))*(v16 - 9);
    if (v18)
    {
      int v19 = v18(a2, a3);
      if (v19 > v15)
      {
        unsigned int v17 = v14;
        int v15 = v19;
      }
    }
    ++v14;
    uint64_t v20 = *v16;
    v16 += 7;
  }
  while (v20);
  if ((v17 & 0x80000000) != 0) {
    return 110;
  }
  CFNumberRef v21 = off_264477E30[v23][7 * v17 + 4];
  if (!v21) {
    return 78;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21)(a2, a3, a4, a5, a6, a7);
}

uint64_t sub_21DC11FC0(int a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"fileencoding-class", @"CEncryptedEncoding") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"fileencoding-class", @"CEncryptedEncoding") > 0) {
    return 1000;
  }
  if (!theDict) {
    return 4294966296;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"encryption-class");
  if (!Value) {
    return 4294966296;
  }
  CFStringRef v5 = Value;
  char v7 = 0;
  if (sub_21DC0208C(Value, &v7))
  {
    if (v7) {
      return 1000;
    }
    else {
      return 4294966296;
    }
  }
  else
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v5))
    {
      if (CFStringCompare(v5, @"AES-128", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, @"CEncryptedEncoding", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, @"AES-256", 1uLL) == kCFCompareEqualTo)
      {
        return 1000;
      }
      if (CFStringCompare(v5, &stru_26CE87FA8, 1uLL)) {
        return 1;
      }
      else {
        return 4294966296;
      }
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_21DC120FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!off_26B546B98) {
    return 110;
  }
  int v11 = 0;
  unsigned int v12 = 0;
  CFStringRef v13 = &off_26B546BD0;
  unsigned int v14 = -1;
  do
  {
    int v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 9);
    if (v15)
    {
      int v16 = v15(a1, a2);
      if (v16 > v11)
      {
        unsigned int v14 = v12;
        int v11 = v16;
      }
    }
    ++v12;
    unsigned int v17 = *v13;
    v13 += 7;
  }
  while (v17);
  if ((v14 & 0x80000000) != 0) {
    return 110;
  }
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_26B546B70 + 7 * v14 + 4);
  if (!v18) {
    return 78;
  }
  return v18(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_21DC1220C(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"backingstore-class", @"CBSDBackingStore") & 0x80000000) != 0) {
    return 4294966296;
  }
  if ((int)sub_21DC035B8(theDict, @"backingstore-class", @"CBSDBackingStore") > 0) {
    return 1000;
  }
  CFStringRef v5 = CFURLCopyScheme(a1);
  if (!v5) {
    return 4294966296;
  }
  CFStringRef v6 = v5;
  if (CFStringCompare(v5, @"file", 0) || CFURLHasDirectoryPath(a1))
  {
    uint64_t v4 = 4294966296;
  }
  else
  {
    uint64_t v4 = 100;
    if (theDict)
    {
      if (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0)) {
        LODWORD(v4) = 200;
      }
      else {
        LODWORD(v4) = 100;
      }
      if (CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0)) {
        uint64_t v4 = (v4 + 100);
      }
      else {
        uint64_t v4 = v4;
      }
    }
  }
  CFRelease(v6);
  return v4;
}

uint64_t sub_21DC12310(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (!a1) {
    return a3;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return a3;
  }
  return sub_21DC12360(Value, a3);
}

uint64_t sub_21DC12360(const __CFString *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int valuePtr = a2;
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFStringGetTypeID())
    {
      unsigned int v5 = sub_21DC0A050(a1);
      if (v5) {
        return v5;
      }
      else {
        return v2;
      }
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(a1);
      if (v6 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr)) {
          return valuePtr;
        }
        else {
          return v2;
        }
      }
    }
  }
  return v2;
}

CFNumberRef sub_21DC123FC(const char *a1, const __CFDictionary *a2)
{
  if (!a2) {
    return 0;
  }
  if (stat(a1, &v11) < 0) {
    return (const __CFNumber *)*__error();
  }
  uid_t valuePtr = 0;
  uid_t st_uid = v11.st_uid;
  gid_t st_gid = v11.st_gid;
  CFNumberRef v6 = (const __CFNumber *)sub_21DC11C7C(a2, @"uid");
  if (v6 && CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr)) {
    uid_t st_uid = valuePtr;
  }
  CFNumberRef v7 = (const __CFNumber *)sub_21DC11C7C(a2, @"gid");
  if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr)) {
    gid_t st_gid = valuePtr;
  }
  if ((st_uid != v11.st_uid || st_gid != v11.st_gid) && chown(a1, st_uid, st_gid) < 0) {
    return (const __CFNumber *)*__error();
  }
  CFNumberRef result = (const __CFNumber *)sub_21DC11C7C(a2, @"mode");
  if (result)
  {
    CFNumberRef result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    if (result)
    {
      int v9 = valuePtr & 0xFFF;
      if (v9 == (v11.st_mode & 0xFFF) || (chmod(a1, v9) & 0x80000000) == 0) {
        return 0;
      }
      return (const __CFNumber *)*__error();
    }
  }
  return result;
}

uint64_t sub_21DC12530(const char *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (!a1) {
    return 22;
  }
  if (statfs(a1, &v12) < 0) {
    return *__error();
  }
  int v9 = 5;
  long long v10 = xmmword_21DC419C0;
  int v11 = 0;
  uint64_t result = getattrlist(v12.f_mntonname, &v9, &v6, 0x24uLL, 0);
  if ((result & 0x80000000) != 0) {
    return *__error();
  }
  if ((BYTE8(v7) & 0x40) != 0 && a2 && (BYTE8(v6) & 0x40) != 0) {
    *a2 = 1;
  }
  if ((BYTE4(v7) & 0x40) != 0 && a3 && (BYTE4(v6) & 0x40) != 0) {
    *a3 = 1;
  }
  return result;
}

CFURLRef sub_21DC12640(char *__s)
{
  uint64_t v1 = __s;
  if (!__s) {
    return (CFURLRef)v1;
  }
  uint64_t v2 = strchr(__s, 58);
  CFURLRef v3 = strstr(v1, "://");
  CFTypeID v4 = strchr(v1, 47);
  if (!v2 || !v4 || !v3 || v2 >= v4 || v2 != v3)
  {
    memset(&v14, 0, sizeof(v14));
    if (stat(v1, &v14)) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = (v14.st_mode & 0xF000) == 0x4000;
    }
    Boolean v9 = v8;
    size_t v10 = strlen(v1);
    CFURLRef v11 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v1, v10, v9);
    uint64_t v1 = (char *)v11;
    if (v11)
    {
      CFURLRef v12 = CFURLCopyAbsoluteURL(v11);
      if (v12)
      {
        CFURLRef v13 = v12;
        CFRelease(v1);
        return v13;
      }
    }
    return (CFURLRef)v1;
  }
  size_t v5 = strlen(v1);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFURLCreateWithBytes(v6, (const UInt8 *)v1, v5, 0x8000100u, 0);
}

void sub_21DC1279C(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFTypeID v4 = *(const void **)(a1 + 104);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 104) = cf;
}

uint64_t sub_21DC127DC(unsigned char *a1, int a2)
{
  char v2 = a2;
  if (a2 && !(*(unsigned int (**)(unsigned char *))(*(void *)a1 + 152))(a1)) {
    return 78;
  }
  uint64_t result = 0;
  a1[128] = v2;
  return result;
}

BOOL sub_21DC12840(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1) == 3;
}

uint64_t sub_21DC12880(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t sub_21DC12888(uint64_t a1, const void *a2, uint64_t a3)
{
  __dst[64] = *MEMORY[0x263EF8340];
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0;
  __dst[38] = 0;
  v5.n128_u64[0] = (unint64_t)sub_21DC06B8C((uint64_t)__dst);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, __n128))(*(void *)a1 + 272))(a1, v5);
  if (!v6)
  {
    uint64_t v8 = 0;
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1 + 336))(a1, a3, 512, &v8, __dst);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
  }
  return v6;
}

uint64_t sub_21DC129D0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  size_t v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    pid_t v11 = getpid();
    fprintf(v10, "write\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }
  return sub_21DC12A68(a1, a2, a3, a4, a5);
}

uint64_t sub_21DC12A68(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v31 = 0;
  size_t v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 72))(a1))
  {
    uint64_t v11 = 1;
    goto LABEL_15;
  }
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    uint64_t v11 = 9;
    goto LABEL_15;
  }
  uint64_t v11 = 22;
  if (a4 && a5)
  {
    unint64_t v12 = a3 + a2;
    unint64_t v13 = *(void *)(a1 + 200);
    if (a3 + a2 <= v13 || ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(a1) & 1) != 0)
    {
      uint64_t v14 = *(void *)(a1 + 208);
      if (!v14)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 696))(a1, a2, a3, &v31, a5);
        goto LABEL_35;
      }
      unint64_t v29 = v13;
      int v30 = 0;
      int v15 = sub_21DC05A0C(v14, a2, a3, &v30, 1);
      if (v15 < 1)
      {
        if (a3)
        {
          unint64_t v28 = a3 + a2;
          uint64_t v17 = 0;
          uint64_t v22 = a2;
LABEL_28:
          unint64_t v12 = v28;
          unint64_t v13 = v29;
          unint64_t v27 = v28 - v22;
          if (v28 <= v22)
          {
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 720))(a1);
            if (!v11) {
              uint64_t v31 = v17 + v27;
            }
          }
        }
        else
        {
          uint64_t v11 = 0;
        }
        goto LABEL_35;
      }
      int v16 = v15;
      unint64_t v28 = a3 + a2;
      uint64_t v17 = 0;
      uint64_t v18 = v30;
      int v19 = v15;
      do
      {
        memmove((void *)v18[2], (const void *)(a5 + *v18 - a2), v18[1]);
        v17 += v18[1];
        uint64_t v31 = v17;
        v18 += 3;
        --v19;
      }
      while (v19);
      if (v17 == a3)
      {
        uint64_t v11 = 0;
        goto LABEL_34;
      }
      uint64_t v23 = v30;
      uint64_t v22 = a2;
      while (1)
      {
        uint64_t v24 = *v23;
        uint64_t v25 = *v23 - v22;
        if (*v23 > v22)
        {
          uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 720))(a1);
          if (v26)
          {
            uint64_t v11 = v26;
LABEL_34:
            unint64_t v12 = v28;
            unint64_t v13 = v29;
LABEL_35:
            if (v12 > v13 && !v11)
            {
              uint64_t v11 = 0;
              if (v31 + a2 > *(void *)(a1 + 200)) {
                *(void *)(a1 + 200) = v31 + a2;
              }
            }
            goto LABEL_15;
          }
          v17 += v25;
          uint64_t v31 = v17;
          uint64_t v24 = *v23;
        }
        uint64_t v22 = v23[1] + v24;
        v23 += 3;
        if (!--v16) {
          goto LABEL_28;
        }
      }
    }
    pthread_mutex_unlock(v10);
    uint64_t v20 = 0;
    uint64_t v11 = 29;
    goto LABEL_17;
  }
LABEL_15:
  pthread_mutex_unlock(v10);
  if (a4)
  {
    uint64_t v20 = v31;
LABEL_17:
    *a4 = v20;
  }
  return v11;
}

uint64_t sub_21DC12DA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t sub_21DC12DAC(void *a1, uint64_t a2, size_t a3, char *a4)
{
  CFTypeID v4 = a4;
  size_t v5 = a3;
  uint64_t v6 = a2;
  size_t v8 = *(void *)(a1[26] + 8);
  uint64_t v15 = 0;
  if (v8 <= a3)
  {
    size_t v9 = a3 / v8 * v8;
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, size_t, uint64_t *, char *))(*a1 + 696))(a1, a2, v9, &v15, a4);
    if (result) {
      return result;
    }
    v5 %= v8;
    v6 += v9;
    v4 += v9;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v11 = sub_21DC05C98(a1[26]);
  uint64_t v12 = v11;
  if (!*(unsigned char *)(v11 + 8) || !*(unsigned char *)(v11 + 16) || (uint64_t result = sub_21DC12EF4(v11), !result))
  {
    *(unsigned char *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(unsigned char *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    if (v5 + v6 <= a1[25]) {
      uint64_t v13 = v5 + v6 - 1;
    }
    else {
      uint64_t v13 = v8 + v6 - 1;
    }
    uint64_t v14 = sub_21DC05CE8(a1[26], v6, v13);
    memmove(*(void **)(v12 + 40), v4, v5);
    uint64_t result = 0;
    *(void *)(v12 + 24) = v6;
    *(void *)(v12 + 32) = v6 + v14 - 1;
    *(unsigned char *)(v12 + 8) = 1;
    *(unsigned char *)(v12 + 16) = 1;
  }
  return result;
}

uint64_t sub_21DC12EF4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 8) || !*(unsigned char *)(a1 + 16)) {
    return 0;
  }
  char v2 = *(uint64_t (**)(void))(a1 + 56);
  if (!v2) {
    return 999;
  }
  uint64_t v5 = 0;
  uint64_t v3 = *(void *)(a1 + 32) - *(void *)(a1 + 24) + 1;
  uint64_t result = v2(*(void *)(a1 + 48));
  if (!result)
  {
    if (v3 == v5)
    {
      uint64_t result = 0;
      *(unsigned char *)(a1 + 16) = 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t sub_21DC12F84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 696))();
}

uint64_t sub_21DC12FB0(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ++*(void *)(a1 + 344);
  ssize_t v6 = pwrite(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0) {
    return *__error();
  }
  ssize_t v7 = v6;
  uint64_t result = 0;
  *a4 = v7;
  return result;
}

uint64_t sub_21DC1300C(uint64_t a1)
{
  return a1 + 128;
}

uint64_t DIUDIFFileAccessOpenFile_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253;
  }
  uint64_t v11 = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272))(v2);
  if (v3) {
    return v3;
  }
  uint64_t v4 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296))(*(void *)(a1 + 112), &v11);
  if (v4)
  {
    uint64_t v9 = v4;
LABEL_9:
    (*(void (**)(void, void))(**(void **)(a1 + 112) + 280))(*(void *)(a1 + 112), 0);
    return v9;
  }
  int v5 = *(_DWORD *)(a1 + 644);
  if (v5 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 112);
    ssize_t v7 = (void *)(a1 + 128);
    uint64_t v8 = v11 - 512;
  }
  else
  {
    if (v5) {
      return 0;
    }
    uint64_t v6 = *(void *)(a1 + 112);
    ssize_t v7 = (void *)(a1 + 128);
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_21DC06A44(v6, v7, v8);
  if (v9) {
    goto LABEL_9;
  }
  return v9;
}

uint64_t sub_21DC13144(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253;
  }
  int v3 = *(_DWORD *)(a1 + 644);
  if (v3 != 1)
  {
    if (v3) {
      return 0;
    }
    uint64_t v4 = *(void *)(a1 + 160) + *(void *)(a1 + 152);
    if (v4 <= *(void *)(a1 + 352) + *(void *)(a1 + 344)) {
      uint64_t v4 = *(void *)(a1 + 352) + *(void *)(a1 + 344);
    }
    if (v4 <= *(void *)(a1 + 176) + *(void *)(a1 + 168)) {
      uint64_t v4 = *(void *)(a1 + 176) + *(void *)(a1 + 168);
    }
    uint64_t v14 = v4 & ~(v4 >> 63);
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 312))(v2);
    if (!v5)
    {
      uint64_t v6 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296))(*(void *)(a1 + 112), &v14);
      if (!v6)
      {
        ssize_t v7 = (const void *)(a1 + 128);
        uint64_t v8 = *(void *)(a1 + 112);
        uint64_t v9 = 0;
        return sub_21DC12888(v8, v7, v9);
      }
      return v6;
    }
LABEL_22:
    uint64_t v11 = v5;
    uint64_t v13 = (const char *)DIStrError(v5);
    warnx("updateHeader failed - %s", v13);
    return v11;
  }
  uint64_t v10 = *(void *)(a1 + 160) + *(void *)(a1 + 152);
  if (v10 <= *(void *)(a1 + 352) + *(void *)(a1 + 344)) {
    uint64_t v10 = *(void *)(a1 + 352) + *(void *)(a1 + 344);
  }
  if (v10 <= *(void *)(a1 + 176) + *(void *)(a1 + 168)) {
    uint64_t v10 = *(void *)(a1 + 176) + *(void *)(a1 + 168);
  }
  uint64_t v14 = (v10 & ~(v10 >> 63)) + 512;
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 312))(v2);
  if (v5) {
    goto LABEL_22;
  }
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296))(*(void *)(a1 + 112), &v14);
  if (!v6)
  {
    ssize_t v7 = (const void *)(a1 + 128);
    uint64_t v8 = *(void *)(a1 + 112);
    uint64_t v9 = v14 - 512;
    return sub_21DC12888(v8, v7, v9);
  }
  return v6;
}

uint64_t sub_21DC13310(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 200) == a2) {
    return 0;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    if ((ftruncate(*(_DWORD *)(a1 + 320), a2) & 0x80000000) == 0)
    {
      if (*(void *)(a1 + 200) > a2)
      {
        uint64_t v5 = *(void *)(a1 + 208);
        if (v5) {
          sub_21DC05DEC(v5, a2);
        }
      }
      goto LABEL_9;
    }
  }
  else if ((truncate(*(const char **)(a1 + 296), a2) & 0x80000000) == 0)
  {
LABEL_9:
    uint64_t result = 0;
    *(void *)(a1 + 200) = a2;
    return result;
  }
  return *__error();
}

uint64_t DIUDIFFileAccessCloseFile_0(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253;
  }
  if (*(unsigned char *)(a1 + 640))
  {
    (*(void (**)(void))(**(void **)(a1 + 120) + 72))(*(void *)(a1 + 120));
    (*(void (**)(void, _OWORD *))(**(void **)(a1 + 120) + 136))(*(void *)(a1 + 120), v10);
    long long v3 = v10[7];
    *(_OWORD *)(a1 + 304) = v10[6];
    *(_OWORD *)(a1 + 320) = v3;
    *(void *)(a1 + 336) = v11;
    long long v4 = v10[3];
    *(_OWORD *)(a1 + 240) = v10[2];
    *(_OWORD *)(a1 + 256) = v4;
    long long v5 = v10[5];
    *(_OWORD *)(a1 + 272) = v10[4];
    *(_OWORD *)(a1 + 288) = v5;
    long long v6 = v10[1];
    *(_OWORD *)(a1 + 208) = v10[0];
    *(_OWORD *)(a1 + 224) = v6;
    *(unsigned char *)(a1 + 640) = 0;
    uint64_t v7 = sub_21DC13144(a1);
    uint64_t v2 = *(void *)(a1 + 112);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 280))(v2, 0);
  if (v8 && (v7 == 5 || !v7)) {
    return v8;
  }
  return v7;
}

uint64_t DIUDIFFileAccessGetResourceFile_0(uint64_t a1, char **a2)
{
  uint64_t v9 = 0;
  long long v4 = *(char **)(a1 + 664);
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = sub_21DC1B120(*(void *)(a1 + 112), a1 + 128, &v9);
    if (!v5)
    {
      long long v6 = v9;
      *(void *)(a1 + 664) = v9;
      uint64_t v5 = (*(uint64_t (**)(char *))(*(void *)v6 + 48))(v6);
    }
    long long v4 = v9;
    if (v5) {
      BOOL v7 = v9 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      DIDiskImageObjectRelease(v9);
      long long v4 = 0;
    }
  }
  if (a2) {
    *a2 = v4;
  }
  return v5;
}

uint64_t sub_21DC135CC(void *a1)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = (void **)sub_21DC3A90C(204);
  uint64_t result = sub_21DC3A898();
  if (!result) {
    void **v2 = 0x16D697368;
  }
  *a1 = v2;
  return result;
}

uint64_t sub_21DC13624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 168))(a1, a2, a3, a4, a6);
  if (!v13)
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 232))(a1, a2, a5 & 0xFFFFFFF7);
    if (v13) {
      goto LABEL_3;
    }
    if (a7)
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 328))(a1, a2, a4, a6, a7);
      if (v13) {
        goto LABEL_3;
      }
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 176))(a1, a2);
    if (v13) {
      goto LABEL_3;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 184))(a1, a2);
    if (v13) {
      goto LABEL_3;
    }
    if ((a5 & 8) == 0) {
      return 0;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, a2, a5);
    if (v13
      || (uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 264))(a1, 32), v13))
    {
LABEL_3:
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 248))(a1, a2);
    }
  }
  return v13;
}

uint64_t sub_21DC13840(uint64_t a1, void *a2, unsigned int a3, int a4, const unsigned __int8 *a5)
{
  uint64_t v5 = 4294967246;
  if (a2 && *(void *)(a1 + 104) && *a2)
  {
    if (*(unsigned char *)(a1 + 114))
    {
      CFStringRef v10 = sub_21DC09934(a3);
      if (v10)
      {
        uint64_t v11 = (__CFString *)v10;
        CFStringRef Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v10);
        CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        if (!Value)
        {
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
          if (!Mutable) {
            goto LABEL_19;
          }
          CFStringRef Value = Mutable;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 104), v11, Mutable);
          CFRelease(Value);
        }
        uint64_t v15 = CFDictionaryCreateMutable(v13, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v15)
        {
          int v16 = (__CFString *)v15;
          if (sub_21DC09D64((int)v15, v15, (uint64_t)a2)
            && sub_21DC139D8((__CFDictionary *)v16, @"ID", a4, 0)
            && sub_21DC139D8((__CFDictionary *)v16, @"Attributes", 2, 1)
            && sub_21DC13A78(v16, a5))
          {
            CFArrayAppendValue((CFMutableArrayRef)Value, v16);
            uint64_t v5 = 0;
            *(_WORD *)(a1 + 112) |= 0x20u;
          }
          else
          {
            uint64_t v5 = 4294967246;
          }
          CFRelease(v11);
          goto LABEL_20;
        }
LABEL_19:
        uint64_t v5 = 4294962336;
        int v16 = v11;
LABEL_20:
        CFRelease(v16);
        return v5;
      }
      return 4294962336;
    }
    else
    {
      return 4294967242;
    }
  }
  return v5;
}

__CFDictionary *sub_21DC139D8(__CFDictionary *result, const void *a2, int a3, int a4)
{
  if (result)
  {
    BOOL v7 = result;
    CFDictionaryRemoveValue(result, a2);
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (a4) {
      uint64_t result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0, @"0x%04hX", a3);
    }
    else {
      uint64_t result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0, @"%hd", a3);
    }
    if (result)
    {
      uint64_t v9 = result;
      CFDictionarySetValue(v7, a2, result);
      CFRelease(v9);
      return (__CFDictionary *)1;
    }
  }
  return result;
}

__CFString *sub_21DC13A78(__CFString *result, const unsigned __int8 *a2)
{
  if (result)
  {
    uint64_t v2 = (__CFDictionary *)result;
    if (!a2) {
      a2 = (const unsigned __int8 *)&unk_21DC41EA7;
    }
    uint64_t result = (__CFString *)CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0);
    if (result)
    {
      long long v3 = result;
      CFDictionarySetValue(v2, @"Name", result);
      CFRelease(v3);
      return (__CFString *)1;
    }
  }
  return result;
}

uint64_t sub_21DC13AEC(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967097;
  }
  if (!a2) {
    return 4294967246;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  long long v4 = sub_21DC09ED8(a1, a2, 0);
  if (!v4) {
    return 4294967104;
  }
  if (sub_21DC139D8(v4, @"Attributes", a3, 1)) {
    return 0;
  }
  return 4294967097;
}

uint64_t sub_21DC13B6C(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294967246;
  if (a2 && *(void *)(a1 + 104))
  {
    if (*(unsigned char *)(a1 + 114))
    {
      int v8 = 0;
      CFDictionaryRef v4 = sub_21DC09ED8(a1, a2, &v8);
      if (v4)
      {
        uint64_t v5 = v4;
        __int16 v7 = 0;
        if (sub_21DC09280(v4, @"Attributes", &v7)
          && (int v6 = v7 | 2, v7 |= 2u, sub_21DC139D8(v5, @"Attributes", v6, 1)))
        {
          uint64_t result = 0;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }
        else
        {
          return 4294967097;
        }
      }
      else
      {
        return 4294967104;
      }
    }
    else
    {
      return 4294967242;
    }
  }
  return result;
}

uint64_t sub_21DC13C28(uint64_t a1, const UInt8 **a2)
{
  if (!a2) {
    return 4294967246;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967246;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0) {
    return 4294967098;
  }
  unsigned int v5 = 0;
  CFDictionaryRef v3 = sub_21DC09ED8(a1, (uint64_t)a2, &v5);
  if (v3) {
    return sub_21DC13CB8((uint64_t)v3, v3, v5, a2);
  }
  else {
    return 4294967104;
  }
}

uint64_t sub_21DC13CB8(uint64_t a1, const __CFDictionary *a2, uint64_t a3, const UInt8 **a4)
{
  uint64_t result = 4294967246;
  if (a2 && a4)
  {
    if (*a4)
    {
      __int16 v11 = 0;
      if (!sub_21DC09280(a2, @"ID", &v11)) {
        return 4294967097;
      }
      __int16 v10 = 0;
      if (!sub_21DC09280(a2, @"Attributes", &v10)) {
        return 4294967097;
      }
      __int16 v7 = v10;
      if ((v10 & 2) == 0) {
        return 0;
      }
      v10 &= ~2u;
      if (sub_21DC139D8(a2, @"Attributes", (__int16)(v7 & 0xFFFD), 1))
      {
        CFIndex v8 = sub_21DC3A9E4((uint64_t)a4);
        sub_21DC3A9F0();
        nullsub_4(a4);
        sub_21DC3A898();
        CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], *a4, v8);
        sub_21DC3A898();
        nullsub_4(a4);
        if (v9)
        {
          CFDictionarySetValue(a2, @"Data", v9);
          CFRelease(v9);
          return 0;
        }
        return 4294962336;
      }
      else
      {
        return 4294967097;
      }
    }
    else
    {
      return 4294967187;
    }
  }
  return result;
}

unsigned __int16 *sub_21DC13E38(unsigned __int16 *result)
{
  *uint64_t result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  unsigned int v1 = result[8];
  if (v1 <= 0x3D)
  {
    if (!result[8]) {
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v1 = 61;
  }
  uint64_t v2 = v1;
  CFDictionaryRef v3 = result + 12;
  do
  {
    *(_DWORD *)(v3 - 3) = bswap32(*(_DWORD *)(v3 - 3));
    *(v3 - 1) = bswap32((unsigned __int16)*(v3 - 1)) >> 16;
    *CFDictionaryRef v3 = bswap32((unsigned __int16)*v3) >> 16;
    v3 += 4;
    --v2;
  }
  while (v2);
LABEL_6:
  result[8] = (_WORD)v1 << 8;
  return result;
}

uint64_t sub_21DC13EF0(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 104);
  if (!v2) {
    goto LABEL_16;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0) {
    return 4294967098;
  }
  size_t Count = CFDictionaryGetCount(v2);
  if (!Count)
  {
LABEL_16:
    int v6 = 0;
    CFIndex v8 = 0;
    goto LABEL_17;
  }
  int64_t v4 = Count;
  unsigned int v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v5) {
    return 4294967188;
  }
  int v6 = v5;
  __int16 v7 = (const void **)malloc_type_calloc(v4, 8uLL, 0x6004044C4A2DFuLL);
  if (!v7)
  {
    uint64_t v18 = 4294967188;
    goto LABEL_20;
  }
  CFIndex v8 = v7;
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
  if (v4 < 1)
  {
LABEL_17:
    uint64_t v18 = 0;
    *(_WORD *)(a1 + 112) &= ~0x20u;
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = sub_21DC0A050((const __CFString *)v6[v9]);
    CFArrayRef v11 = (const __CFArray *)v8[v9];
    CFIndex v12 = CFArrayGetCount(v11);
    if (v12 >= 1) {
      break;
    }
LABEL_14:
    if (++v9 == v4) {
      goto LABEL_17;
    }
  }
  CFIndex v13 = v12;
  CFIndex v14 = 0;
  while (1)
  {
    uint64_t v20 = 0;
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v14);
    CFNumberRef v16 = sub_21DC09CB8((int)ValueAtIndex, ValueAtIndex, &v20);
    if (v16)
    {
      uint64_t v17 = sub_21DC13CB8((uint64_t)v16, ValueAtIndex, v10, v20);
      if (v17) {
        break;
      }
    }
    if (v13 == ++v14) {
      goto LABEL_14;
    }
  }
  uint64_t v18 = v17;
LABEL_18:
  free(v8);
LABEL_19:
  if (v6) {
LABEL_20:
  }
    free(v6);
  return v18;
}

uint64_t sub_21DC14098(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, void), uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v20 = 0;
  int v21 = 0;
  int v19 = 0;
  int v18 = 0;
  memset(v22, 0, sizeof(v22));
  uint64_t v17 = 0;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, char *))(*(void *)a2 + 64))(a2, (char *)&v21 + 2);
  if (!v8)
  {
    if (SHIWORD(v21) <= 0) {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
    }
    LOWORD(v9) = 1;
    while (1)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t, unsigned int *, void))(*(void *)a2 + 72))(a2, &v20, (__int16)v9);
      if (v10) {
        return v10;
      }
      uint64_t v10 = (*(uint64_t (**)(uint64_t, void, int *))(*(void *)a2 + 96))(a2, v20, &v21);
      if (v10) {
        return v10;
      }
      if ((__int16)v21 >= 1)
      {
        LOWORD(v11) = 1;
        do
        {
          uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88))(a2);
          (*(void (**)(uint64_t, void))(*(void *)a2 + 80))(a2, 0);
          uint64_t v8 = (*(uint64_t (**)(uint64_t, void, void, void **))(*(void *)a2 + 112))(a2, v20, (__int16)v11, &v19);
          (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 80))(a2, v12);
          if (v8) {
            return v8;
          }
          uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, char *, unsigned int *, _OWORD *, uint64_t *))(*(void *)a2 + 320))(a2, v19, (char *)&v18 + 2, &v20, v22, &v17);
          if (v10) {
            return v10;
          }
          if (!a3 || a3(a4, v20, SHIWORD(v18)))
          {
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 136))(a2, v19);
            if (v10) {
              return v10;
            }
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, int *))(*(void *)a2 + 224))(a2, v19, &v18);
            if (v10) {
              return v10;
            }
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 248))(a2, v19);
            if (v10) {
              return v10;
            }
            uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
            (*(void (**)(uint64_t, void))(*(void *)a1 + 80))(a1, 0);
            CFNumberRef v16 = 0;
            if (!(*(unsigned int (**)(uint64_t, void, void, void **))(*(void *)a1 + 120))(a1, v20, SHIWORD(v18), &v16)&& v16)
            {
              (*(void (**)(uint64_t))(*(void *)a1 + 192))(a1);
              sub_21DC3A944((void **)v16);
            }
            (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v13);
            uint64_t v14 = (*(uint64_t (**)(uint64_t, void *, void, void, void, _OWORD *, uint64_t))(*(void *)a1 + 312))(a1, v19, v20, SHIWORD(v18), (__int16)v18, v22, v17);
            if (v14)
            {
              uint64_t v8 = v14;
              sub_21DC3A944((void **)v19);
              return v8;
            }
          }
          int v11 = (__int16)(v11 + 1);
        }
        while (v11 <= (__int16)v21);
      }
      int v9 = (__int16)(v9 + 1);
      if (v9 > SHIWORD(v21)) {
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
      }
    }
  }
  return v8;
}

uint64_t sub_21DC14578(uint64_t a1, _WORD *a2)
{
  if (!a2) {
    return 4294967246;
  }
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 104);
  if (v3)
  {
    __int16 Count = CFDictionaryGetCount(v3);
    uint64_t result = 0;
  }
  else
  {
    __int16 Count = 0;
    uint64_t result = 4294967097;
  }
  *a2 = Count;
  return result;
}

uint64_t sub_21DC145CC(CFDictionaryRef *a1, _DWORD *a2, int a3)
{
  if (!a2) {
    return 4294967246;
  }
  if (a1[13])
  {
    __int16 v10 = 0;
    uint64_t result = (*((uint64_t (**)(CFDictionaryRef *, __int16 *))*a1 + 8))(a1, &v10);
    if (result)
    {
      int v9 = 0;
    }
    else if (a3 < 1 || v10 < a3)
    {
      int v9 = 0;
      uint64_t result = 4294967246;
    }
    else
    {
      __int16 v7 = (const void **)malloc_type_calloc(v10, 8uLL, 0x6004044C4A2DFuLL);
      if (v7)
      {
        uint64_t v8 = v7;
        CFDictionaryGetKeysAndValues(a1[13], v7, 0);
        int v9 = sub_21DC0A050((const __CFString *)v8[a3 - 1]);
        free(v8);
        uint64_t result = 0;
      }
      else
      {
        int v9 = 0;
        uint64_t result = 12;
      }
    }
  }
  else
  {
    int v9 = 0;
    uint64_t result = 4294967097;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_21DC146E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 115);
}

uint64_t sub_21DC146F0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 115) = a2;
  return result;
}

uint64_t sub_21DC146F8(uint64_t a1, unsigned int a2, int a3, void *a4)
{
  uint64_t v13 = 0;
  if (!a4) {
    return 4294967246;
  }
  int v6 = *(void **)(a1 + 104);
  if (!v6) {
    goto LABEL_13;
  }
  CFArrayRef v9 = (const __CFArray *)sub_21DC098D8(a1, a2);
  if (!v9 || a3 < 1 || (CFArrayRef v10 = v9, CFArrayGetCount(v9) < a3))
  {
    int v6 = 0;
    uint64_t result = 4294967104;
    goto LABEL_8;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, a3 - 1);
  if (!ValueAtIndex)
  {
    int v6 = 0;
LABEL_13:
    uint64_t result = 4294967097;
    goto LABEL_8;
  }
  uint64_t result = sub_21DC09AB8(a1, a2, ValueAtIndex, &v13);
  int v6 = v13;
LABEL_8:
  *a4 = v6;
  return result;
}

uint64_t sub_21DC147C0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246;
  }
  int v9 = 0;
  CFDictionaryRef v3 = sub_21DC09ED8(a1, a2, &v9);
  if (!v3) {
    return 4294967104;
  }
  CFDictionaryRef v4 = v3;
  uint64_t v8 = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, 1);
  uint64_t v6 = sub_21DC09AB8(a1, v9, v4, &v8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v5);
  return v6;
}

uint64_t sub_21DC148BC(uint64_t a1, uint64_t a2, _WORD *a3)
{
  __int16 v6 = 0;
  if (!a3) {
    return 4294967246;
  }
  if (*(void *)(a1 + 104))
  {
    if (a2)
    {
      CFDictionaryRef v4 = sub_21DC09ED8(a1, a2, 0);
      if (v4)
      {
        if (sub_21DC09280(v4, @"Attributes", &v6)) {
          uint64_t result = 0;
        }
        else {
          uint64_t result = 4294967097;
        }
      }
      else
      {
        uint64_t result = 4294967104;
      }
    }
    else
    {
      uint64_t result = 4294967246;
    }
  }
  else
  {
    uint64_t result = 4294967097;
  }
  *a3 = v6;
  return result;
}

void sub_21DC14948(void *a1)
{
  sub_21DC149B4(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC14990(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C400F414A5CLL);
  _Unwind_Resume(a1);
}

void *sub_21DC149B4(void *a1)
{
  *a1 = &unk_26CE84020;
  CFDictionaryRef v2 = (const void *)a1[13];
  if (v2) {
    CFRelease(v2);
  }
  a1[13] = 0;
  CFDictionaryRef v3 = (char *)a1[83];
  if (v3)
  {
    DIDiskImageObjectRelease(v3);
    a1[83] = 0;
  }
  CFDictionaryRef v4 = (char *)a1[14];
  if (v4)
  {
    DIDiskImageObjectRelease(v4);
    a1[14] = 0;
  }
  uint64_t v5 = (char *)a1[15];
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    a1[15] = 0;
  }
  return sub_21DC04E48(a1);
}

void sub_21DC14A44(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

void sub_21DC14A5C(void *a1)
{
  sub_21DC14AC8(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC14AA4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

void *sub_21DC14AC8(void *a1)
{
  *a1 = &unk_26CE84978;
  CFDictionaryRef v2 = (const void *)a1[14];
  if (v2) {
    CFRelease(v2);
  }
  return sub_21DC0B4F8(a1);
}

void sub_21DC14B24(_Unwind_Exception *a1)
{
  sub_21DC0B4F8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC14B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DC127DC((unsigned char *)a1, a2);
  if (v4)
  {
LABEL_4:
    if (!v4) {
      return v4;
    }
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a1 + 200);
  if (v5)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 168))(v5, a2);
    goto LABEL_4;
  }
  uint64_t v4 = 999;
LABEL_5:
  if (a2)
  {
    sub_21DC127DC((unsigned char *)a1, 0);
    uint64_t v6 = *(void *)(a1 + 200);
    if (v6) {
      (*(void (**)(uint64_t, void))(*(void *)v6 + 168))(v6, 0);
    }
  }
  return v4;
}

uint64_t sub_21DC14BFC(void *a1)
{
  uint64_t v1 = a1[32];
  if (v1 >= a1[34] && v1 >= a1[56]) {
    return sub_21DC14C24((uint64_t)a1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC14C24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 152))();
  }
  return result;
}

uint64_t sub_21DC14C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a6) {
    *a6 = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)a1 + 208))();
}

uint64_t DIBackingStoreGetURLArray(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 216))();
}

uint64_t sub_21DC14CA4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 216))();
  }
  return result;
}

uint64_t sub_21DC14CD4(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t DIMediaKitCreateMKMediaRef(uint64_t a1, uint64_t a2, const __CFDictionary *a3, uint64_t *a4)
{
  uint64_t result = 22;
  unsigned int v13 = 22;
  if (a4)
  {
    *a4 = 0;
    if (a1)
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (a3) {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3);
      }
      else {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
      int v9 = MutableCopy;
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      int valuePtr = 16;
      CFNumberRef v11 = CFNumberCreate(v7, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(Mutable, @"attributes", v11);
      CFDictionarySetValue(Mutable, @"valid", v11);
      CFRelease(v11);
      CFDictionarySetValue(v9, @"Characteristics", Mutable);
      CFRelease(Mutable);
      *a4 = MKMediaCreate();
      CFRelease(v9);
      return v13;
    }
  }
  return result;
}

uint64_t sub_21DC14E24(uint64_t a1)
{
  if (!a1) {
    return 999;
  }
  DIDiskImageObjectRetain();
  return 0;
}

__CFDictionary *sub_21DC14E50(uint64_t a1, CFTypeRef cf1)
{
  CFMutableArrayRef Mutable = 0;
  if (a1 && cf1)
  {
    if (CFEqual(cf1, @"Geometry"))
    {
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t valuePtr = DIDiskImageGetSectorCount(a1);
      CFNumberRef v6 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFDictionarySetValue(Mutable, @"Sector Count", v6);
        CFRelease(v7);
      }
      uint64_t valuePtr = 512;
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFDictionarySetValue(Mutable, @"Block Size", v8);
        CFRelease(v9);
      }
      uint64_t valuePtr = 2048;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v10)
      {
        CFNumberRef v11 = v10;
        CFDictionarySetValue(Mutable, @"Maximum Transfer Sector Count", v10);
        CFRelease(v11);
      }
    }
    else if (CFEqual(cf1, @"Writable"))
    {
      int v12 = DIDiskImageIsWriteEnabled(a1);
      uint64_t v13 = MEMORY[0x263EFFB40];
      if (!v12) {
        uint64_t v13 = MEMORY[0x263EFFB38];
      }
      return *(__CFDictionary **)v13;
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t DIDiskImageGetSectorCount(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

uint64_t DIDiskImageIsWriteEnabled(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
}

uint64_t sub_21DC15034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = DIDiskImageWriteSectors(a1);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

uint64_t DIDiskImageWriteSectors(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

char *sub_21DC1509C(char *a1)
{
  if (a1) {
    return (char *)DIDiskImageObjectRelease(a1);
  }
  return a1;
}

uint64_t sub_21DC150A8(uint64_t a1, char a2)
{
  if ((*(_DWORD *)(a1 + 320) & 0x80000000) == 0)
  {
    uint64_t result = sub_21DC15128(a1);
    if (result) {
      return result;
    }
    if (!*(unsigned char *)(a1 + 304)
      && ((a2 & 1) == 0 || fcntl(*(_DWORD *)(a1 + 320), 51, 1) == -1)
      && fsync(*(_DWORD *)(a1 + 320)) < 0)
    {
      return *__error();
    }
  }
  return 0;
}

uint64_t sub_21DC15128(uint64_t a1)
{
  if (!*(void *)(a1 + 208) || !(*(unsigned int (**)(uint64_t))(*(void *)a1 + 72))(a1)) {
    return 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  uint64_t v2 = *(void *)(*(void *)(a1 + 208) + 16);
  if (v2)
  {
    while (!*(unsigned char *)(v2 + 8) || !*(unsigned char *)(v2 + 16))
    {
      uint64_t v2 = *(void *)(v2 + 72);
      if (!v2) {
        goto LABEL_7;
      }
    }
    uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 704))(a1, *(void *)(a1 + 200));
    if (!v3) {
      uint64_t v3 = sub_21DC05D9C(*(void *)(a1 + 208), *(void *)(a1 + 200));
    }
  }
  else
  {
LABEL_7:
    uint64_t v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 216));
  return v3;
}

uint64_t sub_21DC15214(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 496))(a1);
  uint64_t v7 = a1[94];
  if (v7 == a2) {
    return 0;
  }
  uint64_t v9 = v6;
  if (!v6) {
    return 999;
  }
  if (v7 < a2 && !(*(unsigned int (**)(void *))(*a1 + 160))(a1)) {
    return 78;
  }
  if (*((unsigned char *)a1 + 777))
  {
    uint64_t v10 = a1[32] + a2;
  }
  else if (*((unsigned char *)a1 + 776))
  {
    uint64_t v10 = a1[32] + a2 + 512;
  }
  else
  {
    uint64_t v10 = a1[32] + a2;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 320))(v9, v10, a3);
  if (!result)
  {
    a1[94] = a2;
    a1[33] = a2;
    uint64_t result = (*(uint64_t (**)(void *, void *))(*a1 + 776))(a1, a1 + 29);
    if (!result)
    {
      sub_21DC07144((uint64_t)a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC15384(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 160))();
  }
  return result;
}

uint64_t sub_21DC153B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 312))();
}

uint64_t sub_21DC153E0(unsigned char *a1, const void *a2)
{
  __dst[64] = *MEMORY[0x263EF8340];
  if (!a1[777] && !a1[776]) {
    return 78;
  }
  uint64_t v4 = (*(uint64_t (**)(unsigned char *))(*(void *)a1 + 496))(a1);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0;
  __dst[38] = 0;
  v5.n128_u64[0] = (unint64_t)sub_21DC06B8C((uint64_t)__dst);
  if (a1[777])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t *, double))(*(void *)v4 + 296))(v4, &v11, v5.n128_f64[0]);
    if (v7) {
      return v7;
    }
    uint64_t v6 = v11 - 512;
  }
  uint64_t v11 = v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, __n128))(*(void *)v4 + 272))(v4, v5);
  if (v7) {
    return v7;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)v4 + 336))(v4, v11, 512, &v10, __dst);
  (*(void (**)(uint64_t, void))(*(void *)v4 + 280))(v4, 0);
  if (!v8) {
    memcpy(a1 + 232, a2, 0x200uLL);
  }
  return v8;
}

uint64_t sub_21DC155D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a5) {
    return 22;
  }
  unint64_t v6 = a1[94];
  if ((uint64_t)v6 < a2) {
    return 29;
  }
  uint64_t v7 = a3 + a2;
  if (a3 + a2 > v6)
  {
    if ((*(unsigned int (**)(void *))(*a1 + 160))(a1))
    {
      uint64_t result = (*(uint64_t (**)(void *, uint64_t, void))(*a1 + 320))(a1, v7, 0);
      if (result) {
        return result;
      }
      goto LABEL_6;
    }
    return 29;
  }
LABEL_6:
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(void *))(*a1 + 496))(a1) + 336);
  return v9();
}

uint64_t sub_21DC15738(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (!v1) {
    return 78;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 472);
  return v2();
}

uint64_t sub_21DC157D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 472))();
  }
  else {
    return 78;
  }
}

uint64_t sub_21DC15810(uint64_t a1, int a2)
{
  if (a2 != -536870288 && a2 != -536870144 && a2 != -536870272) {
    return 22;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1) + 440);
    return v4();
  }
  return result;
}

uint64_t sub_21DC15914(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 440))();
  }
  return result;
}

uint64_t sub_21DC1594C(uint64_t a1, int a2)
{
  if (a2 == -536870288 || a2 == -536870272 || a2 == -536870144) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t sub_21DC1597C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a5) {
    return 22;
  }
  *a5 = 0;
  uint64_t v10 = 22;
  if (a3 && a4)
  {
    int v29 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    size_t size = 0;
    uint64_t v25 = 0;
    sub_21DC0DF7C(a1, a2, &v28, &v29, &v27, &v26, &v25, &size, 0);
    if (v29 > -2147483640)
    {
      return 78;
    }
    else
    {
      uint64_t v11 = sub_21DC0E1E8(a1, v29);
      if (v11)
      {
        uint64_t v12 = v11;
        size_t v13 = size;
        uint64_t v23 = 0;
        uint64_t v14 = v26;
        uint64_t v15 = malloc_type_malloc(size, 0x497959ADuLL);
        if (v15)
        {
          CFNumberRef v16 = v15;
          uint64_t v22 = v14;
          uint64_t v17 = v14 << 9;
          int v18 = malloc_type_malloc(v14 << 9, 0xED8498E3uLL);
          if (v18)
          {
            uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
            uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, uint64_t *, void *))(*(void *)v19 + 328))(v19, v25, v13, &v23, v16);
            if (v20)
            {
              uint64_t v10 = v20;
            }
            else
            {
              uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void, void *, uint64_t))(*(void *)v12 + 48))(v12, v16, v23, v18, v17);
              if (v10) {
                fprintf((FILE *)*MEMORY[0x263EF8348], "readSectorChunk: decompressData failed with error %ld (inStartSector: %qd)\n", v10, a2);
              }
            }
          }
          else
          {
            uint64_t v10 = 12;
          }
          free(v16);
          if (v18 && v10)
          {
            free(v18);
          }
          else if (v18)
          {
            *a3 = v27;
            *a4 = v22;
            *a5 = v18;
          }
        }
        else
        {
          return 12;
        }
      }
      else
      {
        return 999;
      }
    }
  }
  return v10;
}

uint64_t sub_21DC15BC8(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t valuePtr = 0;
  int v79 = -1;
  uint64_t v78 = -1;
  int v4 = sub_21DC03648(a2, @"inhibit-apm-final-gap", 0);
  if (v4) {
    uint64_t v5 = 35;
  }
  else {
    uint64_t v5 = 3;
  }
  int v6 = sub_21DC03648(a2, @"freeze-file-system", 0);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 456))(a1, v5, 0, 0);
  if (!v7) {
    return 999;
  }
  CFDictionaryRef v8 = (const __CFDictionary *)v7;
  CFNumberRef v9 = (const __CFNumber *)sub_21DC11C7C(a2, @"content-new-length");
  if (v9)
  {
    CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
    int v10 = sub_21DC03648(a2, @"freeze-image-size", 0);
    CFNumberRef v11 = (const __CFNumber *)sub_21DC11C7C(a2, @"partition-ID");
    CFNumberRef v12 = v11;
    if (v11) {
      CFNumberGetValue(v11, kCFNumberSInt32Type, &v79);
    }
    CFNumberRef v13 = (const __CFNumber *)sub_21DC11C7C(a2, @"content-min-length");
    if (v13) {
      CFNumberGetValue(v13, kCFNumberLongLongType, &v78);
    }
    if (sub_21DC16650(v8, @"subcontent-list"))
    {
      if (v12)
      {
        uint64_t v14 = v78;
        uint64_t v102 = valuePtr;
        int v101 = v79;
        uint64_t v99 = 0;
        v100 = 0;
        CFArrayRef v97 = 0;
        CFTypeRef v98 = 0;
        uint64_t v95 = 0;
        CFDictionaryRef v96 = 0;
        uint64_t v93 = 0;
        uint64_t v94 = 0;
        uint64_t v91 = 0;
        uint64_t v92 = 0;
        uint64_t v89 = 0;
        uint64_t v90 = 0;
        if (v10) {
          unsigned int v15 = 7;
        }
        else {
          unsigned int v15 = 3;
        }
        uint64_t v88 = 0;
        if (v4) {
          uint64_t v16 = v15 | 0x20;
        }
        else {
          uint64_t v16 = v15;
        }
        CFDictionaryRef v17 = (const __CFDictionary *)(*(uint64_t (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 456))(a1, v16, 0, 0);
        if (!v17)
        {
          uint64_t v26 = 0;
          uint64_t v27 = 999;
          goto LABEL_103;
        }
        uint64_t v93 = 1;
        uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
        uint64_t v94 = v18;
        uint64_t v95 = v18;
        CFNumberRef v19 = (const __CFNumber *)sub_21DC11C7C(v17, @"content-min-length");
        if (v19) {
          CFNumberGetValue(v19, kCFNumberLongLongType, &v95);
        }
        CFNumberRef v20 = (const __CFNumber *)sub_21DC11C7C(v17, @"content-max-length");
        if (v20) {
          CFNumberGetValue(v20, kCFNumberLongLongType, &v94);
        }
        CFNumberRef v21 = (const __CFNumber *)sub_21DC11C7C(v17, @"content-granularity");
        if (v21) {
          CFNumberGetValue(v21, kCFNumberLongLongType, &v93);
        }
        CFArrayRef v22 = (const __CFArray *)sub_21DC16650(v17, @"subcontent-list");
        uint64_t v23 = sub_21DC166D0(v17, @"content-hint");
        if (!v4 && v23 && CFEqual(v23, @"APM"))
        {
          uint64_t v24 = 10 / v93;
          if (10 / v93 * v93 != 10) {
            ++v24;
          }
          uint64_t v99 = v24 * v93;
        }
        if (v101 != -1)
        {
          CFDictionaryRef v25 = sub_21DC3C534(v22, v101);
          if (!v25)
          {
LABEL_33:
            uint64_t v26 = 0;
            uint64_t v27 = 22;
LABEL_103:
            if (v100)
            {
              DIDiskImageObjectRelease(v100);
              v100 = 0;
            }
            if (v17) {
              CFRelease(v17);
            }
            if (v98)
            {
              CFRelease(v98);
              CFTypeRef v98 = 0;
            }
            if (v26) {
              CFRelease(v26);
            }
            goto LABEL_111;
          }
LABEL_42:
          uint64_t v89 = 1;
          CFNumberRef v32 = (const __CFNumber *)sub_21DC11C7C(v25, @"postamble");
          if (v32) {
            CFNumberGetValue(v32, kCFNumberSInt64Type, &v99);
          }
          CFNumberRef v33 = (const __CFNumber *)sub_21DC11C7C(v25, @"content-length");
          CFNumberGetValue(v33, kCFNumberLongLongType, &v90);
          uint64_t v91 = v90;
          uint64_t v92 = v90;
          CFNumberRef v34 = (const __CFNumber *)sub_21DC11C7C(v25, @"content-start");
          CFNumberGetValue(v34, kCFNumberLongLongType, &v88);
          if (v14 < 0)
          {
            CFNumberRef v36 = (const __CFNumber *)sub_21DC11C7C(v25, @"content-min-length");
            if (v36) {
              CFNumberGetValue(v36, kCFNumberLongLongType, &v92);
            }
          }
          else
          {
            uint64_t v92 = v14;
          }
          CFNumberRef v37 = (const __CFNumber *)sub_21DC11C7C(v25, @"content-max-length");
          if (v37) {
            CFNumberGetValue(v37, kCFNumberLongLongType, &v91);
          }
          CFNumberRef v38 = (const __CFNumber *)sub_21DC11C7C(v25, @"content-granularity");
          if (v38) {
            CFNumberGetValue(v38, kCFNumberLongLongType, &v89);
          }
          CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v25, @"can-trigger-image-resize");
          if (Value) {
            BOOL v40 = CFBooleanGetValue(Value) != 0;
          }
          else {
            BOOL v40 = 0;
          }
          uint64_t v41 = v102;
          if (v102 == -1)
          {
            uint64_t v41 = v92;
            uint64_t v102 = v92;
          }
          if (v41 == 1)
          {
            uint64_t v41 = v91;
            uint64_t v102 = v91;
          }
          if (v14 == -1 && v41 < v92)
          {
            warnx("resize request %qd is below minimum size %qd allowed.");
            goto LABEL_33;
          }
          if (v41 > v91)
          {
            warnx("resize request %qd is above maximum size %qd allowed.");
            goto LABEL_33;
          }
          if (v41 <= v90)
          {
            uint64_t v42 = (v90 - v41) / v89 * v89;
            uint64_t v43 = v90 - v42;
          }
          else
          {
            uint64_t v42 = (v41 - v90) / v89 * v89;
            uint64_t v43 = v42 + v90;
          }
          uint64_t v102 = v43;
          if (!v42)
          {
            uint64_t v26 = 0;
            goto LABEL_83;
          }
          uint64_t v77 = v14;
          uint64_t MKMediaRef = sub_21DC16734(a1, v88, v90, &v100);
          if (!MKMediaRef)
          {
            char v45 = !v40;
            if (v10) {
              char v45 = 1;
            }
            if (v45)
            {
              int v50 = 0;
              uint64_t v46 = v18 - v88;
              uint64_t v75 = v18;
              goto LABEL_100;
            }
            uint64_t v46 = v99 + v102;
            uint64_t v47 = v99 + v102 + v88;
            uint64_t v48 = v47 - v18;
            if (v47 <= v18)
            {
              if (v99 + v102 + v88 < v18)
              {
                if ((v18 - v47) % v93) {
                  uint64_t v51 = (v18 - v47) / v93 + 1;
                }
                else {
                  uint64_t v51 = (v18 - v47) / v93;
                }
                uint64_t v47 = v18 - v51 * v93;
              }
            }
            else
            {
              if (v48 % v93) {
                uint64_t v49 = v48 / v93 + 1;
              }
              else {
                uint64_t v49 = v48 / v93;
              }
              uint64_t v47 = v18 + v49 * v93;
            }
            if (v47 <= v18)
            {
              uint64_t v75 = v47;
              int v50 = 0;
LABEL_100:
              CFAllocatorRef v52 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
              uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x263EFFB08], 0, (uint64_t *)&v98);
              if (MKMediaRef) {
                goto LABEL_101;
              }
              uint64_t v72 = v46;
              int v74 = v50;
              unsigned int v87 = 0;
              CFAllocatorRef allocator = v52;
              CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v52, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFDictionarySetValue(Mutable, @"Include most", (const void *)*MEMORY[0x263EFFB40]);
              uint64_t v26 = (const void *)MKCFReadMedia();
              CFRelease(Mutable);
              uint64_t v27 = v87;
              if (v87) {
                goto LABEL_103;
              }
              uint64_t v27 = sub_21DC3B27C((const __CFDictionary *)v26, &v96, &v97);
              if (v27) {
                goto LABEL_103;
              }
              CFArrayRef v55 = (const __CFArray *)sub_21DC16650((const __CFDictionary *)v26, @"Schemes");
              CFIndex Count = CFArrayGetCount(v55);
              if (Count >= 1)
              {
                CFIndex v57 = Count;
                for (CFIndex i = 0; i < v57; ++i)
                {
                  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v55, i);
                  v60 = sub_21DC166D0(ValueAtIndex, @"ID");
                  if (v60 && CFEqual(v60, @"ISO9660"))
                  {
                    CFArrayRemoveValueAtIndex(v55, i--);
                    --v57;
                  }
                }
              }
              CFIndex v61 = CFArrayGetCount(v97);
              if (v61 < 1)
              {
LABEL_130:
                if (v74)
                {
                  uint64_t v27 = sub_21DC3BCA0(a1, v18, v4 == 0, 0);
                  if (v27) {
                    goto LABEL_103;
                  }
                }
              }
              else
              {
                CFIndex v62 = v61;
                CFIndex v63 = 0;
                while (1)
                {
                  v85 = 0;
                  v86 = 0;
                  uint64_t v83 = 0;
                  CFNumberRef number = 0;
                  uint64_t v82 = 0;
                  CFDictionaryRef v64 = (const __CFDictionary *)sub_21DC16690(v97, v63);
                  if (v64)
                  {
                    v65 = v64;
                    if (sub_21DC3B894(v64, (const void **)&number, &v86, &v85, &v83, &v82, 0))
                    {
                      int v81 = 0;
                      if (CFNumberGetValue(number, kCFNumberIntType, &v81))
                      {
                        if (v81 == v101 && v83 == v88)
                        {
                          CFNumberRef v66 = CFNumberCreate(allocator, kCFNumberLongLongType, &v102);
                          if (v66) {
                            break;
                          }
                        }
                      }
                    }
                  }
                  if (v62 == ++v63) {
                    goto LABEL_130;
                  }
                }
                CFNumberRef v67 = v66;
                CFDictionarySetValue(v65, @"Size", v66);
                CFRelease(v67);
                uint64_t v68 = sub_21DC3C204((uint64_t)v100, v102, v72, 1, v6 != 0, v77);
                if (v68)
                {
                  uint64_t v27 = v68;
                  if (!v74) {
                    goto LABEL_103;
                  }
LABEL_137:
                  sub_21DC3BCA0(a1, v18, v4 == 0, 0);
                  goto LABEL_103;
                }
                if (v100)
                {
                  DIDiskImageObjectRelease(v100);
                  v100 = 0;
                }
                uint64_t v69 = MKCFWriteMedia();
                if (v69)
                {
                  uint64_t v27 = v69;
                  if (sub_21DC16734(a1, v88, v102, &v100)) {
                    goto LABEL_103;
                  }
                  int v70 = sub_21DC3C204((uint64_t)v100, v90, v18, 1, 0, -1);
                  char v71 = v74 ^ 1;
                  if (v70) {
                    char v71 = 1;
                  }
                  if (v71) {
                    goto LABEL_103;
                  }
                  goto LABEL_137;
                }
                if (v75 < v18)
                {
                  uint64_t v27 = sub_21DC3BCA0(a1, v75, v4 == 0, 0);
                  goto LABEL_103;
                }
              }
LABEL_83:
              uint64_t v27 = 0;
              goto LABEL_103;
            }
            uint64_t MKMediaRef = sub_21DC3BCA0(a1, v47, v4 == 0, 0);
            if (!MKMediaRef)
            {
              uint64_t v75 = v47;
              int v50 = 1;
              goto LABEL_100;
            }
          }
LABEL_101:
          uint64_t v27 = MKMediaRef;
          goto LABEL_102;
        }
        uint64_t v76 = v18;
        uint64_t v29 = v14;
        CFNumberRef v30 = (const __CFNumber *)sub_21DC11C7C(v17, @"partition-resize-id-hint");
        CFNumberRef v31 = (const __CFNumber *)sub_21DC11C7C(v17, @"partition-resize-hint");
        LODWORD(v86) = 0;
        if (v30 && CFNumberGetValue(v30, kCFNumberSInt32Type, &v101))
        {
          CFDictionaryRef v25 = sub_21DC3C534(v22, v101);
          if (v25)
          {
LABEL_41:
            uint64_t v14 = v29;
            uint64_t v18 = v76;
            goto LABEL_42;
          }
          uint64_t v27 = 999;
        }
        else
        {
          if (v31 && CFNumberGetValue(v31, kCFNumberSInt32Type, &v86))
          {
            uint64_t v27 = 999;
            if (!v22) {
              goto LABEL_102;
            }
            CFIndex v35 = v86;
            if ((v86 & 0x80000000) != 0) {
              goto LABEL_102;
            }
            if (CFArrayGetCount(v22) <= v35) {
              goto LABEL_102;
            }
            CFDictionaryRef v25 = (const __CFDictionary *)sub_21DC16690(v22, v35);
            if (!v25) {
              goto LABEL_102;
            }
            goto LABEL_41;
          }
          if (!v10)
          {
            uint64_t MKMediaRef = sub_21DC3BCA0(a1, v102, v4 == 0, 1);
            goto LABEL_101;
          }
          uint64_t v27 = 0;
        }
LABEL_102:
        uint64_t v26 = 0;
        goto LABEL_103;
      }
      uint64_t v28 = sub_21DC3BCA0(a1, valuePtr, v4 == 0, 1);
    }
    else
    {
      uint64_t v28 = sub_21DC3C204(a1, valuePtr, 0, 0, 0, -1);
    }
    uint64_t v27 = v28;
  }
  else
  {
    uint64_t v27 = 22;
  }
LABEL_111:
  CFRelease(v8);
  return v27;
}

uint64_t sub_21DC1660C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = DIDiskImageReadSectors(a1);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

const void *sub_21DC16650(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *sub_21DC16690(const __CFArray *a1, CFIndex a2)
{
  uint64_t result = CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *sub_21DC166D0(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC16710(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

uint64_t sub_21DC16734(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    *a4 = 0;
    if (a1) {
      operator new();
    }
  }
  return 22;
}

void sub_21DC169E0(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40CFA280B7);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC16A04(uint64_t a1)
{
  return *(void *)(a1 + 168);
}

uint64_t sub_21DC16A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 48))(*(void *)(a1 + 176), *(void *)(a1 + 160) + a2);
  }
  else {
    return 22;
  }
}

void sub_21DC16A5C(void *a1)
{
  sub_21DC16AC8(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC16AA4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40CFA280B7);
  _Unwind_Resume(a1);
}

void *sub_21DC16AC8(void *a1)
{
  *a1 = &unk_26CE856E0;
  uint64_t v2 = (char *)a1[22];
  if (v2)
  {
    DIDiskImageObjectRelease(v2);
    a1[22] = 0;
  }
  return sub_21DC114A4(a1);
}

void sub_21DC16B28(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC16B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 64))(*(void *)(a1 + 176), *(void *)(a1 + 160) + a2);
  }
  else {
    return 22;
  }
}

uint64_t sub_21DC16B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 160) + a2;
  if (v4 > (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 96))(*(void *)(a1 + 176))) {
    return 29;
  }
  uint64_t result = 0;
  *(void *)(a1 + ++*(_DWORD *)(result + 168) = a2;
  return result;
}

uint64_t sub_21DC16C04()
{
  if (CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) {
    operator new();
  }
  CFRelease(0);
  return 0;
}

void sub_21DC1728C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void *sub_21DC172D0(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_21DC17304(a1, a2);
  *uint64_t result = &unk_26CE86F80;
  return result;
}

uint64_t sub_21DC17304(uint64_t a1, char *a2)
{
  uint64_t v4 = (void *)sub_21DC03CF0(a1);
  void *v4 = &unk_26CE87080;
  v4[13] = 0;
  sub_21DC17370((uint64_t)v4, a2);
  return a1;
}

void sub_21DC17358(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

char *sub_21DC17370(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 104);
  if (result) {
    uint64_t result = (char *)sub_21DC0474C(result);
  }
  *(void *)(a1 + 104) = a2;
  return result;
}

uint64_t sub_21DC173B0(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  CFArrayRef v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    CFArrayRef v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }
  return v5;
}

__CFArray *sub_21DC17434(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 512;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v45 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryRef v8 = malloc_type_malloc(0x200uLL, 0x14CD3861uLL);
  CFNumberRef v9 = v8;
  if (!v8) {
    goto LABEL_59;
  }
  v8[30] = 0u;
  v8[31] = 0u;
  v8[28] = 0u;
  v8[29] = 0u;
  v8[26] = 0u;
  v8[27] = 0u;
  v8[24] = 0u;
  v8[25] = 0u;
  v8[22] = 0u;
  v8[23] = 0u;
  v8[20] = 0u;
  v8[21] = 0u;
  v8[18] = 0u;
  v8[19] = 0u;
  v8[16] = 0u;
  v8[17] = 0u;
  v8[14] = 0u;
  v8[15] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[6] = 0u;
  void v8[7] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  *CFDictionaryRef v8 = 0u;
  v8[1] = 0u;
  theArray = CFArrayCreateMutable(v6, 0, MEMORY[0x263EFFF70]);
  if (!theArray)
  {
LABEL_59:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v9) {
      free(v9);
    }
    return 0;
  }
  CFAllocatorRef allocator = v6;
  CFTypeRef cf = Mutable;
  v39 = a4;
  unsigned int v10 = 0;
  unsigned int v11 = 0;
  LODWORD(v12) = 0;
  int v43 = 0;
  int v13 = 0;
  do
  {
    uint64_t v14 = sub_21DC17A4C(a1);
    uint64_t v15 = v10;
    if ((*(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *, _OWORD *))(*(void *)v14 + 48))(v14, v10, 1, &v45, v9))
    {
      goto LABEL_58;
    }
    memcpy(__dst, v9, sizeof(__dst));
    if (*((unsigned __int16 *)v9 + 255) != 43605) {
      goto LABEL_58;
    }
    uint64_t v16 = 0;
    unsigned int v10 = 0;
    uint64_t v17 = (uint64_t)v9 + 446;
    do
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v17))
      {
        if (!v10)
        {
          uint64_t v20 = *(_DWORD *)(v17 + 8) + v11;
          uint64_t v21 = sub_21DC17A4C(a1);
          if ((*(uint64_t (**)(uint64_t))(*(void *)v21 + 96))(v21) <= v20) {
            unsigned int v10 = 0;
          }
          else {
            unsigned int v10 = v20;
          }
        }
      }
      else if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v17) & 1) != 0 {
             || !v16 && *(_DWORD *)((char *)v9 + 458) && (a3 & 8) != 0 && !*((unsigned char *)v9 + 450))
      }
      {
        if (v15) {
          int v22 = v12;
        }
        else {
          int v22 = v16;
        }
        uint64_t v12 = (v22 + 1);
        if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 88))(a1, v17, v12, v15)) {
          goto LABEL_58;
        }
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 96))(a1, v17, v12, v15))
        {
          ++v13;
        }
        else
        {
          uint64_t v23 = sub_21DC17B44(a1, v17, v12, v15);
          if (v23)
          {
            uint64_t v24 = v23;
            ++v43;
            CFArrayAppendValue(theArray, v23);
            CFRelease(v24);
          }
        }
      }
      ++v16;
      v17 += 16;
    }
    while (v16 != 4);
    if (a3)
    {
      if (v15)
      {
        CFDataRef v25 = 0;
        uint64_t v26 = @"Extended Partition Record";
        uint64_t v27 = @"XPR";
      }
      else
      {
        CFDataRef v25 = CFDataCreate(allocator, __dst, 446);
        uint64_t v26 = @"Master Boot Record";
        uint64_t v27 = @"MBR";
      }
      uint64_t v28 = sub_21DC17DA4(v15, 1, 0, v27, v26, 0, v18, v19);
      uint64_t v29 = v28;
      if (v28 && v25)
      {
        CFDictionarySetValue(v28, @"boot-code", v25);
      }
      else if (!v28)
      {
        goto LABEL_38;
      }
      CFArrayAppendValue(theArray, v29);
      CFRelease(v29);
LABEL_38:
      if (v25) {
        CFRelease(v25);
      }
    }
    if (!v15)
    {
      unsigned int v11 = v10;
      LODWORD(v12) = 4;
    }
  }
  while (v10);
  if (!v43) {
    goto LABEL_58;
  }
  uint64_t v30 = sub_21DC17A4C(a1);
  unint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v30 + 96))(v30);
  if (sub_21DC18CC0(theArray, v31)) {
    goto LABEL_58;
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v32 = sub_21DC17A4C(a1);
    unint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 96))(v32);
    sub_21DC19064(theArray, v33, 0);
  }
  else
  {
    sub_21DC1CB14(theArray);
  }
  CFNumberRef v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(cf, @"block-size", v34);
  CFRelease(v34);
  CFDictionarySetValue(cf, @"burnable", (const void *)*MEMORY[0x263EFFB38]);
  if (v13)
  {
    sub_21DC17A4C(a1);
    CFIndex v35 = sub_21DC17DF4();
    if (v35)
    {
      CFNumberRef v36 = v35;
      if (CFDictionaryGetValue(v35, @"NTFS")
        || CFDictionaryGetValue(v36, @"HFS+")
        || CFDictionaryGetValue(v36, @"HFSX")
        || CFDictionaryGetValue(v36, @"ProDOS")
        || CFDictionaryGetValue(v36, @"NTFS")
        || CFDictionaryGetValue(v36, @"FAT12")
        || CFDictionaryGetValue(v36, @"FAT16"))
      {
        CFRelease(v36);
LABEL_58:
        CFRelease(theArray);
        CFMutableDictionaryRef Mutable = cf;
        goto LABEL_59;
      }
      CFBooleanRef Value = CFDictionaryGetValue(v36, @"FAT32");
      CFRelease(v36);
      if (Value) {
        goto LABEL_58;
      }
    }
  }
  if (v39) {
    *v39 = cf;
  }
  else {
    CFRelease(cf);
  }
  free(v9);
  return theArray;
}

uint64_t sub_21DC17A4C(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

BOOL sub_21DC17A54(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 4);
  return v2 == 5 || v2 == 15 || v2 == 133;
}

BOOL sub_21DC17A74(uint64_t a1, uint64_t a2)
{
  return *(unsigned char *)(a2 + 4) && *(_DWORD *)(a2 + 12) != 0;
}

uint64_t sub_21DC17A94()
{
  return 0;
}

BOOL sub_21DC17A9C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4 = *(_DWORD *)(a2 + 8);
  if (!v4) {
    return 1;
  }
  uint64_t v6 = (v4 + a4);
  uint64_t v7 = *(unsigned int *)(a2 + 12);
  uint64_t v8 = sub_21DC17A4C(a1);
  if ((*(uint64_t (**)(uint64_t))(*(void *)v8 + 96))(v8) <= v6) {
    return 1;
  }
  uint64_t v9 = sub_21DC17A4C(a1);
  return v6 + v7 > (*(uint64_t (**)(uint64_t))(*(void *)v9 + 96))(v9);
}

__CFDictionary *sub_21DC17B44(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = *(unsigned int *)(a2 + 12);
  uint64_t v8 = (*(_DWORD *)(a2 + 8) + a4);
  uint64_t v9 = sub_21DC17A4C(a1);
  if (v8 + v7 > (*(uint64_t (**)(uint64_t))(*(void *)v9 + 96))(v9))
  {
    uint64_t v10 = sub_21DC17A4C(a1);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 96))(v10) - v8;
  }
  uint64_t v11 = sub_21DC17D2C();
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v11)
  {
    CFDictionaryRef v13 = (const __CFDictionary *)v11;
    CFStringRef v14 = CFStringCreateWithFormat(v12, 0, @"0x%02hX", *(unsigned __int8 *)(a2 + 4));
    if (!v14) {
      return 0;
    }
    CFStringRef v15 = v14;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v13, v14);
    if (Value)
    {
      CFStringRef v17 = Value;
      CFRetain(Value);
      CFRelease(v15);
      goto LABEL_9;
    }
    CFRelease(v15);
  }
  CFStringRef v17 = CFStringCreateWithFormat(v12, 0, @"Type %02hX", *(unsigned __int8 *)(a2 + 4));
LABEL_9:
  uint64_t v20 = sub_21DC17DA4(v8, v7, a3, v17, 0, 0, v18, v19);
  if (!v20)
  {
    if (v17) {
      CFRelease(v17);
    }
    return 0;
  }
  uint64_t v21 = v20;
  uint64_t v29 = 0;
  uint64_t v22 = sub_21DC17A4C(a1);
  int v23 = sub_21DC16734(v22, v8, v7, &v29);
  uint64_t v24 = v29;
  if (v23) {
    BOOL v25 = 1;
  }
  else {
    BOOL v25 = v29 == 0;
  }
  if (!v25)
  {
    uint64_t v26 = sub_21DC17DF4();
    if (v26)
    {
      uint64_t v27 = v26;
      CFDictionarySetValue(v21, @"partition-filesystems", v26);
      CFRelease(v27);
    }
    uint64_t v24 = v29;
  }
  if (v24) {
    DIDiskImageObjectRelease(v24);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v21;
}

uint64_t sub_21DC17D2C()
{
  uint64_t result = qword_267D202E0;
  if (!qword_267D202E0)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>0x01</key>\n\t<string>DOS_FAT_12</string>\n\t<key>0x04</key>\n\t<string>DOS_FAT_16_S</string>\n\t<key>0x05</key>\n\t<string>DOS_Extended</string>\n\t<key>0x06</key>\n\t<string>DOS_FAT_16</string>\n\t<key>0x07</key>\n\t<string>Windows_NTFS</string>\n\t<key>0x0A</key>\n\t<string>Boot_Manager</string>\n\t<key>0x0B</key>\n"
                          "\t<string>DOS_FAT_32</string>\n"
                          "\t<key>0x0C</key>\n"
                          "\t<string>Windows_FAT_32</string>\n"
                          "\t<key>0x0E</key>\n"
                          "\t<string>Windows_FAT_16</string>\n"
                          "\t<key>0x0F</key>\n"
                          "\t<string>Windows_Extended</string>\n"
                          "\t<key>0x11</key>\n"
                          "\t<string>DOS_FAT_12_Hidden</string>\n"
                          "\t<key>0x14</key>\n"
                          "\t<string>DOS_FAT_16_S_Hidden</string>\n"
                          "\t<key>0x16</key>\n"
                          "\t<string>DOS_FAT_16_Hidden</string>\n"
                          "\t<key>0x17</key>\n"
                          "\t<string>Windows_NTFS_Hidden</string>\n"
                          "\t<key>0x1B</key>\n"
                          "\t<string>DOS_FAT_32_Hidden</string>\n"
                          "\t<key>0x1C</key>\n"
                          "\t<string>Windows_FAT_32_Hidden</string>\n"
                          "\t<key>0x1E</key>\n"
                          "\t<string>Windows_FAT_16_Hidden</string>\n"
                          "\t<key>0x63</key>\n"
                          "\t<string>UNIX</string>\n"
                          "\t<key>0x82</key>\n"
                          "\t<string>Linux_Swap</string>\n"
                          "\t<key>0x83</key>\n"
                          "\t<string>Linux_Ext2FS</string>\n"
                          "\t<key>0x84</key>\n"
                          "\t<string>Hibernation</string>\n"
                          "\t<key>0x85</key>\n"
                          "\t<string>Linux_Extended</string>\n"
                          "\t<key>0x86</key>\n"
                          "\t<string>Windows_FAT_16_FT</string>\n"
                          "\t<key>0x87</key>\n"
                          "\t<string>Windows_NTFS_FT</string>\n"
                          "\t<key>0xA5</key>\n"
                          "\t<string>FreeBSD</string>\n"
                          "\t<key>0xA6</key>\n"
                          "\t<string>OpenBSD</string>\n"
                          "\t<key>0xA7</key>\n"
                          "\t<string>NeXTSTEP</string>\n"
                          "\t<key>0xA8</key>\n"
                          "\t<string>Apple_UFS</string>\n"
                          "\t<key>0xA9</key>\n"
                          "\t<string>NetBSD</string>\n"
                          "\t<key>0xAB</key>\n"
                          "\t<string>Apple_Boot</string>\n"
                          "\t<key>0xAF</key>\n"
                          "\t<string>Apple_HFS</string>\n"
                          "\t<key>0xB7</key>\n"
                          "\t<string>BSDI</string>\n"
                          "\t<key>0xB8</key>\n"
                          "\t<string>BSDI_Swap</string>\n"
                          "\t<key>0xC6</key>\n"
                          "\t<string>Windows_FAT_16_FT_Corrupt</string>\n"
                          "\t<key>0xC7</key>\n"
                          "\t<string>Windows_NTFS_FT_Corrupt</string>\n"
                          "\t<key>0xEB</key>\n"
                          "\t<string>BeOS</string>\n"
                          "\t<key>0xF2</key>\n"
                          "\t<string>DOS_Secondary</string>\n"
                          "\t<key>0xFD</key>\n"
                          "\t<string>Linux_RAID</string>\n"
                          "</dict>\n"
                          "</plist>\n",
           2045);
    qword_267D202E0 = (uint64_t)CFPropertyListCreateFromXMLData(v1, v2, 0, 0);
    CFRelease(v2);
    return qword_267D202E0;
  }
  return result;
}

__CFDictionary *sub_21DC17DA4(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8)
{
  return sub_21DC17DC8(a1, a2, a3, a4, a5, a6, a7, a8, 0);
}

__CFDictionary *sub_21DC17DC8(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8, __CFString *a9)
{
  return sub_21DC3801C(a1, a2, a3, a4, a5, a6, &a9);
}

__CFDictionary *sub_21DC17DF4()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v100 = *MEMORY[0x263EF8340];
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFArrayRef v3 = malloc_type_malloc(0x10000uLL, 0xD923056DuLL);
  int v4 = v3;
  if (Mutable) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_6;
  }
  DIDiskImageGetSectorCount(v0);
  if (DIDiskImageReadSectors(v0)) {
    goto LABEL_9;
  }
  *(_DWORD *)buffer = 0;
  cf[0] = 0;
  CFDictionaryRef v8 = 0;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0, (uint64_t *)cf))
  {
    CFDictionaryRef v26 = (const __CFDictionary *)MKCFCreateFSInfo();
    CFDictionaryRef v8 = v26;
    if (v26)
    {
      if (CFDictionaryGetCount(v26))
      {
        CFStringRef Value = CFDictionaryGetValue(v8, @"Filesystem");
        if (Value)
        {
          if (CFEqual(Value, @"APFS"))
          {
            uint64_t v28 = (__CFString *)CFDictionaryGetValue(v8, @"Volume name");
            if (v28) {
              uint64_t v29 = v28;
            }
            else {
              uint64_t v29 = @"Untitled";
            }
            CFDictionarySetValue(Mutable, @"APFS", v29);
          }
        }
      }
    }
  }
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  if (v8) {
    CFRelease(v8);
  }
  if (!sub_21DC18BE4(v0, (uint64_t)v4, 2, 1, (char *)cf))
  {
    if (LOWORD(cf[0]) == 11080 && (DWORD2(v97) & 0xFF010000) == 0 && bswap32(WORD1(cf[0])) >> 16 >= 4) {
      CFDictionarySetValue(Mutable, @"HFS+", &stru_26CE87FA8);
    }
    if (!sub_21DC18BE4(v0, (uint64_t)v4, 2, 1, (char *)cf)
      && LOWORD(cf[0]) == 22600
      && (DWORD2(v97) & 0xFF010000) == 0
      && bswap32(WORD1(cf[0])) >> 16 >= 5)
    {
      CFDictionarySetValue(Mutable, @"HFSX", &stru_26CE87FA8);
    }
  }
  if (sub_21DC18BE4(v0, (uint64_t)v4, 0, 4, (char *)cf)
    || LOBYTE(cf[0]) != 233 && (LOBYTE(cf[0]) != 235 || BYTE2(cf[0]) != 144))
  {
    goto LABEL_21;
  }
  unint64_t v30 = *(unsigned __int16 *)((char *)&cf[1] + 3);
  if (*(unsigned __int16 *)((char *)&cf[1] + 3) < 0x200u) {
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)((char *)&cf[1] + 3) > 0x800u) {
    goto LABEL_21;
  }
  v9.i32[0] = *(unsigned __int16 *)((char *)&cf[1] + 3);
  uint8x8_t v31 = (uint8x8_t)vcnt_s8(v9);
  v31.i16[0] = vaddlv_u8(v31);
  if (v31.i32[0] > 1u) {
    goto LABEL_21;
  }
  uint64_t v32 = BYTE5(cf[1]);
  if (!BYTE5(cf[1]) || ((BYTE5(cf[1]) - 1) & BYTE5(cf[1])) != 0) {
    goto LABEL_21;
  }
  unint64_t v33 = (32 * *(unsigned __int16 *)((char *)&v96 + 1)
       + (unint64_t)(*(unsigned __int16 *)((char *)&cf[1] + 3) - 1))
      / *(unsigned __int16 *)((char *)&cf[1] + 3);
  if (WORD3(v96)) {
    unsigned int v34 = WORD3(v96);
  }
  else {
    unsigned int v34 = DWORD1(v97);
  }
  if (*(_WORD *)((char *)&v96 + 3)) {
    uint64_t v35 = *(unsigned __int16 *)((char *)&v96 + 3);
  }
  else {
    uint64_t v35 = v97;
  }
  uint64_t v36 = (uint64_t)(v35 - (v33 + HIWORD(cf[1]) + v34 * (unint64_t)v96)) / BYTE5(cf[1]);
  CFNumberRef v37 = @"FAT32";
  if (v36 < 65525) {
    CFNumberRef v37 = @"FAT16";
  }
  CFNumberRef v38 = v36 >= 4085 ? v37 : @"FAT12";
  key = v38;
  int v92 = (32 * *(unsigned __int16 *)((char *)&v96 + 1)
       + (unint64_t)(*(unsigned __int16 *)((char *)&cf[1] + 3) - 1))
      / *(unsigned __int16 *)((char *)&cf[1] + 3);
  char v94 = 0;
  if (v33)
  {
    int v39 = 0;
    uint64_t v40 = HIWORD(cf[1]) + v96 * WORD3(v96);
    unint64_t v41 = (unint64_t)*(unsigned __int16 *)((char *)&cf[1] + 3) >> 9;
    while (2)
    {
      uint64_t v42 = v40;
      unint64_t v43 = v41;
      int v44 = sub_21DC18BE4(v0, (uint64_t)v4, ((v40 + v39) * v30) >> 9, v41, buffer);
      if (v44)
      {
        int v76 = v44;
      }
      else
      {
        uint64_t v45 = 0;
        do
        {
          if (buffer[v45] != 229)
          {
            if (!buffer[v45]) {
              goto LABEL_188;
            }
            int v46 = buffer[v45 + 11];
            if (v46 != 15 && (v46 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_188;
            }
          }
          v45 += 32;
        }
        while (v45 < v30);
        ++v39;
        uint64_t v40 = v42;
        unint64_t v41 = v43;
        if (v39 != v92) {
          continue;
        }
LABEL_188:
        int v76 = 0;
      }
      break;
    }
  }
  else
  {
    unsigned int v67 = BYTE5(cf[1]) * *(unsigned __int16 *)((char *)&cf[1] + 3);
    uint64_t v68 = (char *)malloc_type_malloc(v67, 0xFF9723F5uLL);
    unsigned int v69 = HIDWORD(v97);
    if ((HIDWORD(v97) - 2) >= 0xFFFFFF4)
    {
LABEL_194:
      int v76 = 0;
    }
    else
    {
      uint64_t v70 = v67 >> 9;
      while (1)
      {
        int v71 = sub_21DC18BE4(v0, (uint64_t)v4, ((HIWORD(cf[1]) + DWORD1(v97) * v96 + (v69 - 2) * v32) * v30) >> 9, v70, v68);
        if (v71) {
          break;
        }
        uint64_t v72 = 0;
        do
        {
          if (v68[v72] != 229)
          {
            if (!v68[v72]) {
              goto LABEL_194;
            }
            int v73 = v68[v72 + 11];
            if (v73 != 15 && (v73 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_194;
            }
          }
          v72 += 32;
        }
        while (v72 < v67);
        int v90 = 4 * v69;
        uint64_t v75 = 4 * v69 / v30;
        int v76 = sub_21DC18BE4(v0, (uint64_t)v4, ((v75 + HIWORD(cf[1])) * v30) >> 9, v30 >> 9, v68);
        if (!v76)
        {
          unsigned int v69 = *(_DWORD *)&v68[(v90 - v75 * v30)] & 0xFFFFFFF;
          uint64_t v70 = v67 >> 9;
          if (v69 - 2 < 0xFFFFFF4) {
            continue;
          }
        }
        goto LABEL_195;
      }
      int v76 = v71;
    }
LABEL_195:
    free(v68);
  }
  if (v76) {
    goto LABEL_21;
  }
  if (!v94 && (!*(_WORD *)((char *)&v96 + 1) || BYTE6(v97) == 41)) {
    __strncat_chk();
  }
  __strlcpy_chk();
  if (cStr[0] == 5) {
    cStr[0] = -27;
  }
  uint64_t v78 = 0;
  while (1)
  {
    unsigned int v79 = cStr[v78];
    unsigned int v80 = v78 ? 32 : 33;
    if (v80 > v79 || memchr("\"*+,./:;<=>?[\\]|", cStr[v78], 0x11uLL)) {
      break;
    }
    if (++v78 == 12)
    {
      LODWORD(v78) = 1;
      break;
    }
  }
  if (v79) {
    BOOL v81 = 1;
  }
  else {
    BOOL v81 = v78 == 0;
  }
  if (v81) {
    cStr[0] = 0;
  }
  for (int i = 10; i != -1; --i)
  {
    if (cStr[i] != 32) {
      break;
    }
    cStr[i] = 0;
  }
  uid_t v83 = getuid();
  if (getpwuid(v83))
  {
    __strlcpy_chk();
    __strlcat_chk();
    int v84 = open(buffer, 0, 0);
    if ((v84 & 0x80000000) == 0)
    {
      int v85 = v84;
      ssize_t v86 = read(v84, buffer, 0x400uLL);
      buffer[v86 & ~(v86 >> 63)] = 0;
      close(v85);
      int v87 = strtol(buffer, 0, 0);
      if (v87 <= 24)
      {
        CFStringEncoding v88 = 1056;
        switch(v87)
        {
          case 0:
            goto LABEL_243;
          case 1:
            goto LABEL_242;
          case 2:
            CFStringEncoding v88 = 1059;
            goto LABEL_242;
          case 3:
            CFStringEncoding v88 = 1058;
            goto LABEL_242;
          case 4:
            CFStringEncoding v88 = 1049;
            goto LABEL_242;
          case 5:
            CFStringEncoding v88 = 1047;
            goto LABEL_242;
          case 6:
            CFStringEncoding v88 = 1029;
            goto LABEL_242;
          case 7:
            goto LABEL_230;
          case 21:
            CFStringEncoding v88 = 1053;
            goto LABEL_242;
          default:
            goto LABEL_240;
        }
      }
      switch(v87)
      {
        case 25:
          CFStringEncoding v88 = 1057;
          break;
        case 26:
        case 27:
        case 28:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
          goto LABEL_240;
        case 29:
        case 36:
        case 38:
          CFStringEncoding v88 = 1042;
          break;
        case 35:
          CFStringEncoding v88 = 1044;
          break;
        case 37:
          CFStringEncoding v88 = 1046;
          break;
        default:
          if (v87 == 140)
          {
            CFStringEncoding v88 = 1049;
          }
          else if (v87 == 152)
          {
LABEL_230:
            CFStringEncoding v88 = 1043;
          }
          else
          {
LABEL_240:
            CFStringEncoding v88 = -1;
          }
          break;
      }
LABEL_242:
      CFStringRef v89 = CFStringCreateWithCString(0, cStr, v88);
      if (v89) {
        goto LABEL_244;
      }
    }
  }
LABEL_243:
  CFStringRef v89 = CFStringCreateWithCString(0, cStr, 0x410u);
  if (v89)
  {
LABEL_244:
    CFDictionarySetValue(Mutable, key, v89);
    CFRelease(v89);
    goto LABEL_21;
  }
  CFDictionarySetValue(Mutable, key, @"UNTITLED");
LABEL_21:
  cf[0] = 0;
  CFDictionaryRef v10 = 0;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0, (uint64_t *)cf))
  {
    *(_DWORD *)buffer = 0;
    CFDictionaryRef v48 = (const __CFDictionary *)MKCFCreateFSInfo();
    CFDictionaryRef v10 = v48;
    if (!*(_DWORD *)buffer)
    {
      if (v48)
      {
        if (CFDictionaryGetCount(v48))
        {
          uint64_t v49 = CFDictionaryGetValue(v10, @"Filesystem");
          if (v49)
          {
            if (CFEqual(v49, @"NTFS"))
            {
              int v50 = (__CFString *)CFDictionaryGetValue(v10, @"Volume name");
              if (v50) {
                uint64_t v51 = v50;
              }
              else {
                uint64_t v51 = @"UNTITLED";
              }
              CFDictionarySetValue(Mutable, @"NTFS", v51);
              CFDictionaryRemoveValue(Mutable, @"FAT12");
              CFDictionaryRemoveValue(Mutable, @"FAT16");
              CFDictionaryRemoveValue(Mutable, @"FAT32");
            }
          }
        }
      }
    }
  }
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (char *)malloc_type_calloc(0x800uLL, 0x10uLL, 0x9E45C449uLL);
  if (v11)
  {
    CFAllocatorRef v12 = v11;
    if (!sub_21DC18BE4(v0, (uint64_t)v4, 64, 64, v11))
    {
      uint64_t v13 = 0;
      while (v12[v13] || *(_WORD *)&v12[v13 + 1] != 21326 || v12[v13 + 3] != 82)
      {
        v13 += 2048;
        if (v13 == 0x8000) {
          goto LABEL_35;
        }
      }
      SectorCFIndex Count = DIDiskImageGetSectorCount(v0);
      uint64_t v63 = SectorCount - 256;
      if (SectorCount >= 256)
      {
        unint64_t v64 = SectorCount;
        if (sub_21DC231A8(v0, (uint64_t)v4, 512, 256, (char *)cf)
          || sub_21DC231A8(v0, (uint64_t)v4, 512, v63, (char *)cf)
          || sub_21DC231A8(v0, (uint64_t)v4, 512, v64 - 1, (char *)cf)
          || v64 >= 0x400
          && (sub_21DC231A8(v0, (uint64_t)v4, 2048, 256, (char *)cf)
           || (unint64_t v77 = v64 >> 2, sub_21DC231A8(v0, (uint64_t)v4, 2048, v77 - 256, (char *)cf))
           || sub_21DC231A8(v0, (uint64_t)v4, 2048, v77 - 1, (char *)cf)))
        {
          CFStringRef v65 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
          if (v65) {
            CFNumberRef v66 = (__CFString *)v65;
          }
          else {
            CFNumberRef v66 = &stru_26CE87FA8;
          }
          CFDictionarySetValue(Mutable, @"UDF", v66);
          CFRelease(v66);
        }
      }
    }
LABEL_35:
    free(v12);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  long long v96 = 0u;
  CFStringRef v15 = (char *)malloc_type_malloc(0x800uLL, 0xD88B8BEDuLL);
  if (!v15) {
    goto LABEL_138;
  }
  uint64_t v16 = v15;
  if (sub_21DC18BE4(v0, (uint64_t)v4, 64, 4, v15)) {
    goto LABEL_137;
  }
  CFStringRef v17 = v16 + 40;
  unint64_t v18 = 16;
  while (*(_DWORD *)(v16 + 1) == 808469571 && v16[5] == 49)
  {
    int v20 = *v16;
    if (v20 == 1)
    {
      v16[120] = 0;
      *(_OWORD *)CFTypeRef cf = *v17;
      long long v96 = *(_OWORD *)(v16 + 56);
      LOBYTE(v97) = 0;
      goto LABEL_49;
    }
    if (v20 != 2)
    {
      if (v20 == 255) {
        goto LABEL_133;
      }
LABEL_49:
      if (v18 > 0x72) {
        goto LABEL_133;
      }
      goto LABEL_71;
    }
    if ((*((_WORD *)v16 + 44) != 12069 || v16[90] != 64)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 67)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 69))
    {
      goto LABEL_49;
    }
    for (uint64_t j = 0; j != 16; ++j)
    {
      if (!*((_WORD *)v17 + j)) {
        break;
      }
      *((_WORD *)v17 + j) = __rev16(*((unsigned __int16 *)v17 + j));
    }
    CFStringRef v25 = CFStringCreateWithCharacters(v1, (const UniChar *)v16 + 20, j);
    if (CFStringGetCString(v25, buffer, 32, 0x8000100u))
    {
      strlen(buffer);
      __memmove_chk();
    }
    CFRelease(v25);
    if (v18 > 0x72 || LOBYTE(cf[0])) {
      goto LABEL_133;
    }
LABEL_71:
    ++v18;
    if (sub_21DC18BE4(v0, (uint64_t)v4, 4 * v18, 4, v16)) {
      goto LABEL_137;
    }
  }
  if (!LOBYTE(cf[0])) {
    goto LABEL_137;
  }
LABEL_133:
  CFStringRef v52 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
  if (v52) {
    v53 = (__CFString *)v52;
  }
  else {
    v53 = &stru_26CE87FA8;
  }
  CFDictionarySetValue(Mutable, @"ISO9660", v53);
  CFRelease(v53);
LABEL_137:
  free(v16);
LABEL_138:
  if (!sub_21DC18BE4(v0, (uint64_t)v4, 2, 1, (char *)cf)
    && !(LOBYTE(cf[0]) | BYTE1(cf[0]))
    && (~BYTE4(cf[0]) & 0xF0) == 0
    && (BYTE4(cf[0]) & 0xF) != 0)
  {
    uint64_t v54 = BYTE4(cf[0]) & 0xF;
    while (1)
    {
      int v55 = *((unsigned __int8 *)cf + v54 + 4);
      if ((v55 - 97) < 0x1A) {
        LOBYTE(v55) = v55 & 0xDF;
      }
      unsigned int v56 = (v55 - 65);
      BOOL v57 = v56 < 0x1A;
      if (!--v54) {
        break;
      }
      BOOL v58 = v56 >= 0x1A && (v55 - 48) >= 0xAu;
      if (v58 && v55 != 46 && v55 != 32) {
        goto LABEL_6;
      }
      if (!(_WORD)v54)
      {
        BOOL v57 = 1;
        break;
      }
    }
    if (v57 && BYTE3(v97) == 39 && BYTE4(v97) == 13)
    {
      CFStringRef v60 = CFStringCreateWithPascalString(v1, (ConstStr255Param)cf + 4, 0x600u);
      if (v60) {
        CFIndex v61 = (__CFString *)v60;
      }
      else {
        CFIndex v61 = &stru_26CE87FA8;
      }
      CFDictionarySetValue(Mutable, @"ProDOS", v61);
      CFRelease(v61);
    }
  }
LABEL_6:
  if (Mutable)
  {
LABEL_9:
    if (!CFDictionaryGetCount(Mutable))
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
  }
  if (v4) {
    free(v4);
  }
  return Mutable;
}

uint64_t sub_21DC18BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *__dst)
{
  if (!a4) {
    return 0;
  }
  uint64_t v6 = a4;
  uint64_t v14 = 0;
  CFDictionaryRef v10 = __dst;
  while (1)
  {
    if (a3 < 128)
    {
      uint64_t v13 = v6 << 9;
      memmove(__dst, (const void *)(a2 + (a3 << 9)), v6 << 9);
      uint64_t v14 = v6;
      uint64_t v12 = v6;
      goto LABEL_8;
    }
    DIDiskImageGetSectorCount(a1);
    uint64_t result = DIDiskImageReadSectors(a1);
    if (result) {
      return result;
    }
    uint64_t v12 = v14;
    if (!v14) {
      return 999;
    }
    uint64_t v13 = v14 << 9;
LABEL_8:
    v10 += v13;
    a3 += v12;
    v6 -= v12;
    if (!v6) {
      return 0;
    }
  }
}

uint64_t sub_21DC18CC0(CFArrayRef theArray, unint64_t a2)
{
  CFArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theArray);
  CFIndex Count = CFArrayGetCount(MutableCopy);
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  v14.length = CFArrayGetCount(MutableCopy);
  v14.location = 0;
  CFArraySortValues(MutableCopy, v14, (CFComparatorFunction)sub_21DC18DEC, 0);
  if (Count < 1)
  {
LABEL_10:
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v5 = 0;
    CFIndex v6 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, v6);
      if (!ValueAtIndex) {
        break;
      }
      CFDictionaryRef v8 = ValueAtIndex;
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 != CFDictionaryGetTypeID() || !sub_21DC18ED4(v8, &v13, &v12, 0, 0, 0) || v5 > v13) {
        break;
      }
      unint64_t v5 = v12 + v13;
      if (Count == ++v6)
      {
        if (v5 <= a2) {
          goto LABEL_10;
        }
        break;
      }
    }
    uint64_t v10 = 1;
  }
  CFRelease(MutableCopy);
  return v10;
}

CFDictionaryRef sub_21DC18DEC(const __CFDictionary *result, const void *a2)
{
  CFTypeRef cf = 0;
  value = 0;
  if (result)
  {
    CFDictionaryRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 != CFDictionaryGetTypeID()
      || !CFDictionaryGetValueIfPresent(v3, @"partition-start", (const void **)&value))
    {
      return 0;
    }
    CFTypeID v5 = CFGetTypeID(value);
    CFTypeID TypeID = CFNumberGetTypeID();
    uint64_t result = 0;
    if (a2 && v5 == TypeID)
    {
      CFTypeID v7 = CFGetTypeID(a2);
      if (v7 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)a2, @"partition-start", &cf))
        {
          CFTypeID v8 = CFGetTypeID(cf);
          if (v8 == CFNumberGetTypeID()) {
            return (const __CFDictionary *)CFNumberCompare((CFNumberRef)value, (CFNumberRef)cf, 0);
          }
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC18ED4(CFDictionaryRef theDict, void *a2, void *a3, _DWORD *a4, uint64_t *a5, uint64_t *a6)
{
  if (a2)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-start");
    if (!result) {
      return result;
    }
    CFNumberRef v13 = (const __CFNumber *)result;
    CFTypeID v14 = CFGetTypeID((CFTypeRef)result);
    if (v14 != CFNumberGetTypeID()) {
      return 0;
    }
    uint64_t result = CFNumberGetValue(v13, kCFNumberLongLongType, a2);
    if (!result) {
      return result;
    }
  }
  if (a3)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-length");
    if (!result) {
      return result;
    }
    CFNumberRef v15 = (const __CFNumber *)result;
    CFTypeID v16 = CFGetTypeID((CFTypeRef)result);
    if (v16 != CFNumberGetTypeID()) {
      return 0;
    }
    uint64_t result = CFNumberGetValue(v15, kCFNumberLongLongType, a3);
    if (!result) {
      return result;
    }
  }
  if (a4)
  {
    *a4 = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"partition-number");
    if (Value)
    {
      CFNumberRef v18 = Value;
      CFTypeID v19 = CFGetTypeID(Value);
      if (v19 != CFNumberGetTypeID()) {
        return 0;
      }
      uint64_t result = CFNumberGetValue(v18, kCFNumberSInt32Type, a4);
      if (!result) {
        return result;
      }
    }
  }
  if (a6)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-name");
    if (!result) {
      return result;
    }
    uint64_t v20 = result;
    CFTypeID v21 = CFGetTypeID((CFTypeRef)result);
    if (v21 != CFStringGetTypeID()) {
      return 0;
    }
    *a6 = v20;
  }
  if (!a5) {
    return 1;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-hint");
  if (!result) {
    return result;
  }
  uint64_t v22 = result;
  CFTypeID v23 = CFGetTypeID((CFTypeRef)result);
  if (v23 == CFStringGetTypeID())
  {
    *a5 = v22;
    return 1;
  }
  return 0;
}

void sub_21DC19064(const __CFArray *a1, unint64_t a2, char a3)
{
  CFTypeID v4 = sub_21DC190F4(a1, a2, a3);
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4))
    {
      v8.length = CFArrayGetCount(v5);
      v8.location = 0;
      CFArrayAppendArray(a1, v5, v8);
    }
    CFRelease(v5);
  }
  v6.length = CFArrayGetCount(a1);
  v6.location = 0;
  CFArraySortValues(a1, v6, (CFComparatorFunction)sub_21DC18DEC, 0);
}

__CFArray *sub_21DC190F4(const __CFArray *a1, unint64_t a2, char a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v19 = 0;
  unint64_t v20 = 0;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  v21.length = CFArrayGetCount(a1);
  v21.location = 0;
  CFArraySortValues(a1, v21, (CFComparatorFunction)sub_21DC18DEC, 0);
  if (Count < 1)
  {
    unint64_t v11 = 0;
  }
  else
  {
    CFIndex v10 = 0;
    unint64_t v11 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      if (ValueAtIndex)
      {
        CFDictionaryRef v13 = ValueAtIndex;
        CFTypeID v14 = CFGetTypeID(ValueAtIndex);
        if (v14 == CFDictionaryGetTypeID())
        {
          if (sub_21DC18ED4(v13, &v20, &v19, 0, 0, 0))
          {
            unint64_t v15 = v20;
            if (v20 > v11)
            {
              CFTypeID v16 = sub_21DC17DC8(v11, v20 - v11, 0, @"Apple_Free", &stru_26CE87FA8, 0, v8, v9, 0);
              CFArrayAppendValue(Mutable, v16);
              CFRelease(v16);
              unint64_t v15 = v20;
            }
            unint64_t v11 = v19 + v15;
          }
        }
      }
      ++v10;
    }
    while (Count != v10);
  }
  if (a2 > v11 && (a3 & 1) == 0)
  {
    CFStringRef v17 = sub_21DC17DC8(v11, a2 - v11, 0, @"Apple_Free", &stru_26CE87FA8, 0, v8, v9, 0);
    CFArrayAppendValue(Mutable, v17);
    CFRelease(v17);
  }
  return Mutable;
}

__CFString *sub_21DC192AC()
{
  return @"fdisk";
}

void sub_21DC192B8(void *a1)
{
  sub_21DC19324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC19300(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void *sub_21DC19324(void *a1)
{
  *a1 = &unk_26CE87080;
  CFDataRef v2 = (char *)a1[13];
  if (v2) {
    sub_21DC0474C(v2);
  }
  a1[13] = 0;
  return sub_21DC04E48(a1);
}

void sub_21DC19384(_Unwind_Exception *a1)
{
  sub_21DC04E48(v1);
  _Unwind_Resume(a1);
}

void *sub_21DC1939C(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_21DC17304(a1, a2);
  *uint64_t result = &unk_26CE86EF8;
  return result;
}

uint64_t sub_21DC193D0(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  CFArrayRef v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    CFArrayRef v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }
  return v5;
}

CFArrayRef sub_21DC19454(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  uint64_t v50 = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFIndex v10 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xD56A321AuLL);
  unint64_t v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  *((_OWORD *)v10 + 30) = 0u;
  *((_OWORD *)v10 + 31) = 0u;
  *((_OWORD *)v10 + 28) = 0u;
  *((_OWORD *)v10 + 29) = 0u;
  *((_OWORD *)v10 + 26) = 0u;
  *((_OWORD *)v10 + 27) = 0u;
  *((_OWORD *)v10 + 24) = 0u;
  *((_OWORD *)v10 + 25) = 0u;
  *((_OWORD *)v10 + 22) = 0u;
  *((_OWORD *)v10 + 23) = 0u;
  *((_OWORD *)v10 + 20) = 0u;
  *((_OWORD *)v10 + 21) = 0u;
  *((_OWORD *)v10 + 18) = 0u;
  *((_OWORD *)v10 + 19) = 0u;
  *((_OWORD *)v10 + 16) = 0u;
  *((_OWORD *)v10 + 17) = 0u;
  *((_OWORD *)v10 + 14) = 0u;
  *((_OWORD *)v10 + 15) = 0u;
  *((_OWORD *)v10 + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 10) = 0u;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + 8) = 0u;
  *((_OWORD *)v10 + 9) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)CFIndex v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  CFMutableArrayRef v12 = CFArrayCreateMutable(v8, 0, MEMORY[0x263EFFF70]);
  if (!v12) {
    goto LABEL_7;
  }
  CFTypeRef cf = v12;
  CFAllocatorRef allocator = v8;
  theDict = Mutable;
  uint64_t v42 = a4;
  uint64_t v13 = sub_21DC17A4C(a1);
  if (!(*(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)v13 + 48))(v13, 0, 1, &v50, v11))
  {
    uint64_t v16 = 512;
    memcpy(__dst, v11, sizeof(__dst));
    if (*v11 == 21061)
    {
      unsigned int v17 = v11[1];
      *a2 += 2000;
      if (v17 == 8)
      {
        uint64_t v18 = sub_21DC17A4C(a1);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)v18 + 48))(v18, 1, 1, &v50, v11))
        {
          goto LABEL_6;
        }
        BOOL v19 = *v11 == 19792;
        unsigned int v20 = 512;
        if (*v11 == 19792) {
          uint64_t v16 = 512;
        }
        else {
          uint64_t v16 = 2048;
        }
      }
      else
      {
        unsigned int v20 = 0;
        BOOL v19 = 0;
        uint64_t v16 = __rev16(v17);
      }
    }
    else
    {
      unsigned int v20 = 0;
      BOOL v19 = 0;
    }
    uint64_t v21 = 1;
    unsigned int v45 = 0;
    char v46 = !v19;
    unsigned int v22 = v16;
    unsigned int v48 = 1;
    do
    {
      if ((unint64_t)v22 + 512 <= v20 + 512)
      {
        uint64_t v25 = v20;
      }
      else
      {
        uint64_t v23 = sub_21DC17A4C(a1);
        int v24 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)v23 + 48))(v23, v22 >> 9, 1, &v50, v11);
        uint64_t v25 = v22;
        unsigned int v20 = v22;
        if (v24) {
          goto LABEL_6;
        }
      }
      CFDictionaryRef v26 = (char *)v11 + v22 - v25;
      if (*(_WORD *)v26 != 19792) {
        goto LABEL_6;
      }
      if (!strcmp(v26 + 48, "Apple_partition_map")
        || !strcmp(v26 + 48, "Apple_Partition_Map")
        || !strcmp(v26 + 48, "Apple_patition_map"))
      {
        unsigned int v48 = bswap32(*((_DWORD *)v26 + 1));
        unsigned int v45 = bswap32(*((_DWORD *)v26 + 3));
        strcpy(v26 + 48, "Apple_partition_map");
      }
      else if (v48 == 1)
      {
        unsigned int v48 = bswap32(*((_DWORD *)v26 + 1));
      }
      char v27 = v46;
      if ((v21 & 3) != 0) {
        char v27 = 1;
      }
      uint64_t v28 = v16;
      if ((v27 & 1) == 0)
      {
        if (!strcmp(v26 + 48, "Apple_Driver")
          || !strcmp(v26 + 48, "Apple_Driver43")
          || !strcmp(v26 + 48, "Apple_Driver43_CD")
          || !strcmp(v26 + 48, "Apple_Driver_ATA")
          || !strcmp(v26 + 48, "Apple_Driver_ATAPI")
          || (uint64_t v28 = v16, !strcmp(v26 + 48, "Apple_Patches")))
        {
          uint64_t v28 = 2048;
        }
      }
      if ((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, v26, v21, v28)) {
        goto LABEL_6;
      }
      if (!a3
        || ((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v26, v21, v28) & 1) == 0)
      {
        uint64_t v29 = (const void *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 88))(a1, v26, v21, v28, a3);
        if (v29)
        {
          unint64_t v30 = v29;
          CFArrayAppendValue(cf, v29);
          CFRelease(v30);
        }
      }
      uint64_t v21 = (v21 + 1);
      v22 += v16;
    }
    while (v21 <= v48);
    if (!v45) {
      goto LABEL_6;
    }
    if (a3)
    {
      CFDataRef v31 = CFDataCreate(allocator, (const UInt8 *)__dst, 512);
      unsigned int v34 = sub_21DC17DA4(0, 1, 0, @"DDM", @"Driver Descriptor Map", v31, v32, v33);
      CFArrayRef v14 = cf;
      if (v34)
      {
        uint64_t v35 = v34;
        CFArrayAppendValue(cf, v34);
        CFRelease(v35);
      }
      if (v31) {
        CFRelease(v31);
      }
    }
    else
    {
      CFArrayRef v14 = cf;
      if (!a3) {
        goto LABEL_59;
      }
    }
    uint64_t v36 = sub_21DC17A4C(a1);
    unint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v36 + 96))(v36);
    if (sub_21DC18CC0(v14, v37)) {
      goto LABEL_6;
    }
    CFArrayRef v14 = cf;
    if ((a3 & 2) != 0)
    {
      uint64_t v38 = sub_21DC17A4C(a1);
      unint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 96))(v38);
      sub_21DC19064(cf, v39, 0);
LABEL_61:
      __int16 valuePtr = bswap32(__dst[1]) >> 16;
      CFNumberRef v40 = CFNumberCreate(allocator, kCFNumberSInt16Type, &valuePtr);
      CFDictionarySetValue(theDict, @"block-size", v40);
      CFRelease(v40);
      unint64_t v41 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(theDict, @"appendable", (const void *)*MEMORY[0x263EFFB40]);
      CFDictionarySetValue(theDict, @"burnable", v41);
      free(v11);
      if (v42) {
        *uint64_t v42 = theDict;
      }
      else {
        CFRelease(theDict);
      }
      return v14;
    }
LABEL_59:
    sub_21DC1CB14(v14);
    goto LABEL_61;
  }
LABEL_6:
  CFRelease(cf);
  CFMutableDictionaryRef Mutable = theDict;
LABEL_7:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v11) {
    free(v11);
  }
  return 0;
}

void sub_21DC19AE4(void *a1)
{
  sub_21DC19324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC19B2C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void *sub_21DC19B50(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_21DC17304(a1, a2);
  *uint64_t result = &unk_26CE87AB0;
  return result;
}

uint64_t sub_21DC19B84(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  CFArrayRef v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    CFArrayRef v3 = v2;
    v5 += 101;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }
  return v5;
}

__CFArray *sub_21DC19C08(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  uint64_t valuePtr = 512;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v64 = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v9 = malloc_type_malloc(0x200uLL, 0xD8C951D1uLL);
  CFIndex v10 = v9;
  if (v9)
  {
    v9[30] = 0u;
    v9[31] = 0u;
    v9[28] = 0u;
    v9[29] = 0u;
    v9[26] = 0u;
    v9[27] = 0u;
    v9[24] = 0u;
    v9[25] = 0u;
    v9[22] = 0u;
    v9[23] = 0u;
    v9[20] = 0u;
    v9[21] = 0u;
    v9[18] = 0u;
    v9[19] = 0u;
    v9[16] = 0u;
    v9[17] = 0u;
    v9[14] = 0u;
    v9[15] = 0u;
    v9[12] = 0u;
    v9[13] = 0u;
    v9[10] = 0u;
    v9[11] = 0u;
    v9[8] = 0u;
    v9[9] = 0u;
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    *uint64_t v9 = 0u;
    v9[1] = 0u;
    CFMutableArrayRef v11 = CFArrayCreateMutable(v7, 8, MEMORY[0x263EFFF70]);
    if (v11)
    {
      CFMutableArrayRef v12 = v11;
      uint64_t v13 = sub_21DC17A4C(a1);
      if (!(*(unsigned int (**)(uint64_t, void, uint64_t, uint64_t *, void *))(*(void *)v13 + 48))(v13, 0, 1, &v64, v10)&& *((unsigned __int16 *)v10 + 255) == 43605)
      {
        uint64_t v14 = 0;
        int v15 = 0;
        do
        {
          if (BYTE2(v10[2 * v14 + 56]) == 238)
          {
            if (v15) {
              goto LABEL_48;
            }
            int v15 = ++v14;
          }
          else
          {
            ++v14;
          }
        }
        while (v14 != 4);
        if (v15)
        {
          uint64_t v16 = sub_21DC17A4C(a1);
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)v16 + 48))(v16, 1, 1, &v64, v10)&& *v10 == 0x5452415020494645)
          {
            uInt v17 = *((_DWORD *)v10 + 3);
            if (v17 - 513 >= 0xFFFFFE5B)
            {
              uint64_t v18 = *((unsigned int *)v10 + 4);
              *((_DWORD *)v10 + 4) = 0;
              if (crc32(0, (const Bytef *)v10, v17) == v18)
              {
                uint64_t v19 = *((unsigned int *)v10 + 21);
                if ((v19 - 0x10000) >= 0xFFFF0080)
                {
                  uint64_t v20 = *((unsigned int *)v10 + 20);
                  if (!WORD1(v20))
                  {
                    uint64_t v60 = *((unsigned int *)v10 + 22);
                    uint64_t v62 = v10[9];
                    free(v10);
                    *(void *)len = (unsigned __int16)v20 * v19;
                    if (((*(void *)len + 511) & 0xFFFFFE00) != 0)
                    {
                      CFIndex v10 = malloc_type_malloc((*(void *)len + 511) & 0xFFFFFE00, 0x5030E679uLL);
                      if (v10)
                      {
                        uint64_t v21 = sub_21DC17A4C(a1);
                        uint64_t v56 = v62 & 0x7FFFFFFFFFFFFFLL;
                        uint64_t v57 = (len[0] + 511) >> 9;
                        if (!(*(unsigned int (**)(uint64_t))(*(void *)v21 + 48))(v21)
                          && crc32(0, (const Bytef *)v10, len[0]) == v60
                          && v20)
                        {
                          int v61 = 0;
                          uint64_t v63 = v20 + 1;
                          uint64_t v22 = 1;
                          uint64_t v23 = v10;
                          do
                          {
                            sub_21DC3A768(v23);
                            *(int8x8_t *)&double v24 = sub_21DC3A768(v23 + 2);
                            if ((*(unsigned int (**)(uint64_t, uint64_t *, double))(*(void *)a1 + 72))(a1, v23, v24))
                            {
                              if ((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 80))(a1, v23, v22))goto LABEL_48; {
                              if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 88))(a1, v23, v22) & 1) == 0)
                              }
                              {
                                char v27 = sub_21DC1A348(a1, (uint64_t)v23, v22);
                                if (v27)
                                {
                                  ++v61;
                                  lena = v27;
                                  CFArrayAppendValue(v12, v27);
                                  CFRelease(lena);
                                }
                              }
                            }
                            ++v22;
                            uint64_t v23 = (uint64_t *)((char *)v23 + v19);
                          }
                          while (v63 != v22);
                          if (v61)
                          {
                            if (a3)
                            {
                              uint64_t v28 = sub_21DC17DA4(0, 1, 0, @"MBR", @"Protective Master Boot Record", 0, v25, v26);
                              if (v28)
                              {
                                CFDataRef v31 = v28;
                                CFArrayAppendValue(v12, v28);
                                CFRelease(v31);
                              }
                              uint64_t v32 = sub_21DC17DA4(1, 1, 0, @"Primary GPT Header", @"GPT Header", 0, v29, v30);
                              if (v32)
                              {
                                uint64_t v35 = v32;
                                CFArrayAppendValue(v12, v32);
                                CFRelease(v35);
                              }
                              uint64_t v36 = sub_21DC17DA4(v56, v57, 0, @"Primary GPT Table", @"GPT Partition Data", 0, v33, v34);
                              if (v36)
                              {
                                unint64_t v37 = v36;
                                CFArrayAppendValue(v12, v36);
                                CFRelease(v37);
                              }
                              uint64_t v38 = sub_21DC17A4C(a1);
                              uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 96))(v38);
                              uint64_t v42 = sub_21DC17DA4(v39 + ~v57, v57, 0, @"Backup GPT Table", @"GPT Partition Data", 0, v40, v41);
                              if (v42)
                              {
                                unint64_t v43 = v42;
                                CFArrayAppendValue(v12, v42);
                                CFRelease(v43);
                              }
                              uint64_t v44 = sub_21DC17A4C(a1);
                              uint64_t v45 = (*(uint64_t (**)(uint64_t))(*(void *)v44 + 96))(v44);
                              unsigned int v48 = sub_21DC17DA4(v45 - 1, 1, 0, @"Backup GPT Header", @"GPT Header", 0, v46, v47);
                              if (v48)
                              {
                                uint64_t v49 = v48;
                                CFArrayAppendValue(v12, v48);
                                CFRelease(v49);
                              }
                            }
                            uint64_t v50 = sub_21DC17A4C(a1);
                            unint64_t v51 = (*(uint64_t (**)(uint64_t))(*(void *)v50 + 96))(v50);
                            if ((sub_21DC18CC0(v12, v51) & 1) == 0)
                            {
                              if ((a3 & 2) != 0)
                              {
                                uint64_t v53 = sub_21DC17A4C(a1);
                                unint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)v53 + 96))(v53);
                                sub_21DC19064(v12, v54, 0);
                              }
                              else
                              {
                                sub_21DC1CB14(v12);
                              }
                              CFNumberRef v55 = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
                              CFDictionarySetValue(Mutable, @"block-size", v55);
                              CFRelease(v55);
                              CFDictionarySetValue(Mutable, @"burnable", (const void *)*MEMORY[0x263EFFB38]);
                              free(v10);
                              if (a4) {
                                *a4 = Mutable;
                              }
                              else {
                                CFRelease(Mutable);
                              }
                              return v12;
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      CFIndex v10 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_48:
      CFRelease(v12);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v10) {
    free(v10);
  }
  return 0;
}

BOOL sub_21DC1A2B8(int a1, unsigned __int8 *uu)
{
  return uuid_is_null(uu) == 0;
}

uint64_t sub_21DC1A2DC()
{
  return 0;
}

BOOL sub_21DC1A2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (*(void *)(a2 + 32) == v2) {
    return 1;
  }
  uint64_t v4 = v2 + 1;
  uint64_t v5 = sub_21DC17A4C(a1);
  return v4 > (*(uint64_t (**)(uint64_t))(*(void *)v5 + 96))(v5);
}

__CFDictionary *sub_21DC1A348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v36 = *MEMORY[0x263EF8340];
  __dst[0] = 0;
  CFAllocatorRef v7 = (const UInt8 *)(a2 + 56);
  do
  {
    if (!*(_WORD *)(a2 + 2 * v6 + 56)) {
      break;
    }
    ++v6;
  }
  while (v6 != 72);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v9 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, 2 * v6, 0x14000100u, 0);
  if (v9)
  {
    CFStringRef v10 = v9;
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v13 = (char *)malloc_type_malloc(v12, 0x2096BE47uLL);
    if (v13)
    {
      uint64_t v14 = v13;
      if (CFStringGetCString(v10, v13, v12, 0x8000100u) && strlen(v14) <= 0x6D) {
        strlcpy(__dst, v14, 0x6DuLL);
      }
      CFRelease(v10);
      free(v14);
    }
    else
    {
      CFRelease(v10);
    }
  }
  uuid_unparse((const unsigned __int8 *)a2, out);
  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40) - v15 + 1;
  if (__dst[0]) {
    CFStringRef v17 = CFStringCreateWithCString(v8, __dst, 0x8000100u);
  }
  else {
    CFStringRef v17 = CFStringCreateWithFormat(v8, 0, @"Untitled %u", a3);
  }
  CFStringRef v18 = v17;
  CFStringRef v19 = CFStringCreateWithCString(v8, out, 0x8000100u);
  CFDictionaryRef Value = (const __CFDictionary *)sub_21DC1A704();
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v19);
  }
  if (Value) {
    CFStringRef v21 = (const __CFString *)Value;
  }
  else {
    CFStringRef v21 = v19;
  }
  CFRetain(v21);
  double v24 = sub_21DC17DA4(v15, v16, a3, v21, v18, 0, v22, v23);
  if (v24)
  {
    *(void *)cStr = 0;
    uint64_t v25 = sub_21DC17A4C(a1);
    int v26 = sub_21DC16734(v25, v15, v16, cStr);
    char v27 = *(char **)cStr;
    if (v26 || !*(void *)cStr) {
      goto LABEL_31;
    }
    uint64_t v28 = sub_21DC17DF4();
    if (!v28)
    {
LABEL_30:
      char v27 = *(char **)cStr;
LABEL_31:
      if (v27) {
        DIDiskImageObjectRelease(v27);
      }
      uuid_unparse((const unsigned __int8 *)(a2 + 16), cStr);
      CFStringRef v31 = CFStringCreateWithCString(v8, cStr, 0x8000100u);
      CFDictionarySetValue(v24, @"partition-UUID", v31);
      CFDictionarySetValue(v24, @"partition-hint-UUID", v19);
      if (v31) {
        CFRelease(v31);
      }
      goto LABEL_35;
    }
    CFDictionaryRef v29 = v28;
    CFDictionarySetValue(v24, @"partition-filesystems", v28);
    if (CFStringCompare(v21, @"Apple_HFS", 0))
    {
      if (CFDictionaryGetValue(v29, @"NTFS"))
      {
        uint64_t v30 = @"Windows_NTFS";
      }
      else
      {
        if (CFStringCompare(v21, @"DOS_FAT", 0)) {
          goto LABEL_29;
        }
        if (CFDictionaryGetValue(v29, @"FAT12"))
        {
          uint64_t v30 = @"DOS_FAT_12";
        }
        else if (CFDictionaryGetValue(v29, @"FAT16"))
        {
          uint64_t v30 = @"DOS_FAT_16";
        }
        else
        {
          if (!CFDictionaryGetValue(v29, @"FAT32")) {
            goto LABEL_29;
          }
          uint64_t v30 = @"DOS_FAT_32";
        }
      }
    }
    else
    {
      if (!CFDictionaryGetValue(v29, @"HFSX"))
      {
LABEL_29:
        CFRelease(v29);
        goto LABEL_30;
      }
      uint64_t v30 = @"Apple_HFSX";
    }
    CFDictionarySetValue(v24, @"partition-hint", v30);
    goto LABEL_29;
  }
LABEL_35:
  if (v19) {
    CFRelease(v19);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v18) {
    CFRelease(v18);
  }
  return v24;
}

uint64_t sub_21DC1A704()
{
  uint64_t result = qword_267D202F0;
  if (!qword_267D202F0)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>48465300-0000-11AA-AA11-00306543ECAC</key>\n\t<string>Apple_HFS</string>\n\t<key>7C3457EF-0000-11AA-AA11-00306543ECAC</key>\n\t<string>Apple_APFS</string>\n\t<key>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7</key>\n\t<string>DOS_FAT</string>\n</dict>\n</plist>\n", 418);
    if (v2)
    {
      CFDataRef v3 = v2;
      qword_267D202F0 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0, 0, 0);
      CFRelease(v3);
    }
    return qword_267D202F0;
  }
  return result;
}

__CFString *sub_21DC1A784()
{
  return @"GUID";
}

void sub_21DC1A790(void *a1)
{
  sub_21DC19324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC1A7D8(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void *sub_21DC1A7FC(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_21DC17304(a1, a2);
  *uint64_t result = &unk_26CE87A40;
  return result;
}

uint64_t sub_21DC1A830(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  uint64_t v8 = sub_21DC17A4C(a1);
  CFTypeRef cf = 0;
  if (a4) {
    *a4 = 0;
  }
  __int16 valuePtr = 0;
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!DIMediaKitCreateMKMediaRef(v8, 0, 0, (uint64_t *)&cf)) {
    MKDetectISO();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v9) {
    CFRelease(v9);
  }
  return 0;
}

void sub_21DC1AC24(void *a1)
{
  sub_21DC19324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC1AC6C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void sub_21DC1AC90(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

uint64_t sub_21DC1AD04(const __CFArray *a1, CFIndex a2, void *a3, void *a4, void **a5, void **a6)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = &stru_26CE87FA8;
  }
  if (a6) {
    *a6 = &stru_26CE87FA8;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (!ValueAtIndex) {
    return 999;
  }
  CFDictionaryRef v11 = ValueAtIndex;
  CFTypeID v12 = CFGetTypeID(ValueAtIndex);
  if (v12 != CFDictionaryGetTypeID()) {
    return 999;
  }
  value = 0;
  if (a3)
  {
    if (!CFDictionaryGetValueIfPresent(v11, @"partition-start", (const void **)&value)
      || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a3))
    {
      return 999;
    }
  }
  if (a4
    && (!CFDictionaryGetValueIfPresent(v11, @"partition-length", (const void **)&value)
     || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a4)))
  {
    return 999;
  }
  if (a5 && CFDictionaryGetValueIfPresent(v11, @"partition-hint", (const void **)&value))
  {
    CFTypeID v13 = CFGetTypeID(value);
    if (v13 == CFStringGetTypeID()) {
      *a5 = value;
    }
  }
  if (!a6) {
    return 0;
  }
  uint64_t result = CFDictionaryGetValueIfPresent(v11, @"partition-name", (const void **)&value);
  if (result)
  {
    CFTypeID v15 = CFGetTypeID(value);
    if (v15 == CFStringGetTypeID())
    {
      uint64_t result = 0;
      *a6 = value;
      return result;
    }
    return 0;
  }
  return result;
}

uLong sub_21DC1AE80(uLong result, int a2, unsigned int a3)
{
  *(_DWORD *)buf = 16843009 * a2;
  unint64_t v3 = a3;
  if (a3)
  {
    uLong v4 = result;
    uint64_t result = *(unsigned int *)(result + 112);
    do
    {
      if (v3 >= 5) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = v3;
      }
      unsigned int v6 = crc32(result, buf, v5);
      uint64_t result = v6;
      *(_DWORD *)(v4 + 112) = v6;
      v3 -= v5;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_21DC1AEF4(uint64_t a1, uint64_t a2, int a3, const unsigned __int8 *a4, const void *a5)
{
  if (!a2) {
    return 4294967246;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967097;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  int v13 = 0;
  CFDictionaryRef v8 = sub_21DC09ED8(a1, a2, &v13);
  if (!v8) {
    return 4294967104;
  }
  CFMutableDictionaryRef v9 = v8;
  __int16 v12 = 0;
  if (!sub_21DC09280(v8, @"Attributes", &v12)) {
    return 4294967097;
  }
  if ((v12 & 8) != 0) {
    return 4294967098;
  }
  if (!sub_21DC139D8(v9, @"ID", a3, 0)) {
    return 4294962336;
  }
  CFDictionaryRemoveValue(v9, @"Name");
  if (!sub_21DC13A78((__CFString *)v9, a4)) {
    return 4294962336;
  }
  CFDictionaryRemoveValue(v9, @"CFName");
  if (a5)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a5)) {
      CFDictionarySetValue(v9, @"CFName", a5);
    }
  }
  return 0;
}

uint64_t sub_21DC1B028(uint64_t a1, void **a2)
{
  if (!a2) {
    return 4294967246;
  }
  LODWORD(result) = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 248))(a1);
  if (result)
  {
    if (result == -198) {
      return 0;
    }
    else {
      return result;
    }
  }
  else
  {
    sub_21DC3A944(a2);
    return 0;
  }
}

uint64_t sub_21DC1B098(unsigned char *a1)
{
  if (a1[114]) {
    (*(void (**)(unsigned char *))(*(void *)a1 + 200))(a1);
  }
  sub_21DC0A9F0((uint64_t)a1);
  return 0;
}

BOOL sub_21DC1B0F4(_DWORD *a1)
{
  return *a1 == 1802464377 && a1[1] == 4;
}

uint64_t sub_21DC1B120(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v23 = 0;
  uint64_t Code = 22;
  if (!a1 || !a2 || !a3) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)(a2 + 12) & 1) == 0)
  {
    CFTypeRef cf = 0;
    uint64_t Code = (*(uint64_t (**)(uint64_t, CFTypeRef *))(*(void *)a1 + 344))(a1, &cf);
    if (!Code)
    {
      uint64_t Code = sub_21DC08ED8(0, 3, &v23);
      if (!Code)
      {
        uint64_t Code = (*(uint64_t (**)(char *))(*(void *)v23 + 48))(v23);
        if (!Code)
        {
          uint64_t Code = (*(uint64_t (**)(char *, CFTypeRef, void, void))(*(void *)v23 + 304))(v23, cf, 0, 0);
          if (!Code) {
            uint64_t Code = (*(uint64_t (**)(char *))(*(void *)v23 + 56))(v23);
          }
        }
      }
    }
    if (cf) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 352))(a1, 0);
    }
    goto LABEL_22;
  }
  size_t v7 = *(void *)(a2 + 224);
  if (!v7)
  {
    uint64_t Code = sub_21DC08ED8(0, 3, &v23);
    goto LABEL_22;
  }
  CFTypeRef cf = 0;
  CFDictionaryRef v8 = (UInt8 *)malloc_type_malloc(v7, 0x9D8B048BuLL);
  if (!v8)
  {
    uint64_t Code = *__error();
    goto LABEL_20;
  }
  CFMutableDictionaryRef v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272))(a1);
  if (!v10)
  {
    CFIndex length = 0;
    uint64_t Code = (*(uint64_t (**)(uint64_t, void, void, CFIndex *, UInt8 *))(*(void *)a1 + 328))(a1, *(void *)(a2 + 216), *(void *)(a2 + 224), &length, v9);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
    if (Code) {
      goto LABEL_19;
    }
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, length);
    if (!v14)
    {
      uint64_t Code = 4294962336;
      goto LABEL_19;
    }
    CFDataRef v15 = v14;
    uint64_t v20 = 0;
    CFDictionaryRef v16 = (const __CFDictionary *)CFPropertyListCreateWithData(v13, v14, 0, (CFPropertyListFormat *)&v20, (CFErrorRef *)&cf);
    CFDictionaryRef v17 = v16;
    if (v16)
    {
      CFTypeID v18 = CFGetTypeID(v16);
      if (v18 != CFDictionaryGetTypeID())
      {
        uint64_t Code = 107;
        goto LABEL_38;
      }
      CFStringRef v19 = sub_21DC29F14(v17, @"resource-fork");
      if (v19)
      {
        uint64_t Code = sub_21DC08ED8((uint64_t)v19, 3, &v23);
        goto LABEL_38;
      }
    }
    else if (cf)
    {
      uint64_t Code = CFErrorGetCode((CFErrorRef)cf);
      goto LABEL_38;
    }
    uint64_t Code = 4294962336;
LABEL_38:
    free(v9);
    CFRelease(v15);
    if (v17) {
      CFRelease(v17);
    }
    goto LABEL_20;
  }
  uint64_t Code = v10;
LABEL_19:
  free(v9);
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
LABEL_22:
  CFDictionaryRef v11 = v23;
  if (Code && v23)
  {
    DIDiskImageObjectRelease(v23);
    CFDictionaryRef v11 = 0;
  }
  if (a3) {
    *a3 = v11;
  }
  return Code;
}

uint64_t sub_21DC1B4B8(uint64_t a1, unsigned int (*a2)(uint64_t, void, void), uint64_t a3)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967246;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  if (a2)
  {
    uint64_t result = sub_21DC36F34(a1, a2, a3);
    if (result) {
      return result;
    }
  }
  else
  {
    sub_21DC0A9F0(a1);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 104));
  }
  uint64_t result = 0;
  *(_WORD *)(a1 + 112) |= 0x20u;
  return result;
}

CFDictionaryRef sub_21DC1B528(uint64_t a1)
{
  unsigned int v6 = 0;
  CFDictionaryRef Copy = 0;
  if (!sub_21DC08ED8(0, 3, &v6))
  {
    if ((*(unsigned int (**)(char *))(*(void *)v6 + 48))(v6))
    {
LABEL_3:
      CFDictionaryRef Copy = 0;
      goto LABEL_5;
    }
    CFDictionaryRef Copy = 0;
    if (!(*(unsigned int (**)(char *, uint64_t, void, void))(*(void *)v6 + 304))(v6, a1, 0, 0))
    {
      if ((*(unsigned int (**)(char *))(*(void *)v6 + 56))(v6)) {
        goto LABEL_3;
      }
      unint64_t v3 = v6;
      CFDictionaryRef v5 = (const __CFDictionary *)*((void *)v6 + 13);
      if (!v5)
      {
        CFDictionaryRef Copy = 0;
        goto LABEL_6;
      }
      CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v5);
    }
  }
LABEL_5:
  unint64_t v3 = v6;
  if (v6) {
LABEL_6:
  }
    DIDiskImageObjectRelease(v3);
  return Copy;
}

uint64_t sub_21DC1B64C(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 172);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + 172) = v4;
  }
  return result;
}

uint64_t DIDeinitialize()
{
  uint64_t result = pthread_mutex_lock(&stru_267D201F0);
  if (!result)
  {
    byte_267D202B8 = 0;
    dword_267D202BC = 0;
    if (qword_267D20278)
    {
      CFRelease((CFTypeRef)qword_267D20278);
      qword_267D20278 = 0;
    }
    if (sub_21DC1B71C())
    {
      printf("\x1B[7m\x1B[5m\a\aDIDeinitialize: objects have leaked\a\a\n\x1B[0m");
      sub_21DC2C738();
    }
    if (getenv("DISKIMAGEOBJECTTRACKING"))
    {
      printf("\x1B[7mDIDeinitialize: stopping DiskImageObject tracking\n\x1B[0m");
      sub_21DC2C7E8();
    }
    return pthread_mutex_unlock(&stru_267D201F0);
  }
  return result;
}

uint64_t sub_21DC1B71C()
{
  uint64_t result = qword_267D202D0;
  if (qword_267D202D0) {
    return CFArrayGetCount((CFArrayRef)qword_267D202D0) > 0;
  }
  return result;
}

uint64_t sub_21DC1B748(const __CFString *a1, CFNumberType a2, void *a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFStringGetTypeID())
  {
    int v23 = 0;
    unint64_t v21 = 0;
    double valuePtr = 0.0;
    size_t v7 = (const char *)sub_21DC0373C(a1, 0x600u);
    if (v7)
    {
      CFDictionaryRef v8 = (char *)v7;
      uint64_t v20 = 0;
      if (!*v7) {
        goto LABEL_22;
      }
      if (!(((unint64_t)a2 > kCFNumberDoubleType) | (0xF9Fu >> a2) & 1))
      {
        double valuePtr = strtod(v7, &v20);
        if (*v20) {
          goto LABEL_22;
        }
        CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        p_double valuePtr = &valuePtr;
        CFNumberType v12 = kCFNumberDoubleType;
        goto LABEL_20;
      }
      if (((unint64_t)a2 > kCFNumberDoubleType) | (0x37EFu >> a2) & 1)
      {
        uint64_t Value = 0;
        int v23 = strtol(v7, &v20, 0);
        if (!*v20)
        {
          CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          p_double valuePtr = (double *)&v23;
          CFNumberType v12 = kCFNumberSInt32Type;
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t Value = 0;
        unint64_t v21 = strtouq(v7, &v20, 0);
        if (!*v20)
        {
          CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          p_double valuePtr = (double *)&v21;
          CFNumberType v12 = kCFNumberSInt64Type;
LABEL_20:
          CFNumberRef v18 = CFNumberCreate(v10, v12, p_valuePtr);
          CFNumberRef v19 = v18;
          if (v18)
          {
            uint64_t Value = CFNumberGetValue(v18, a2, a3);
            CFRelease(v19);
            goto LABEL_23;
          }
LABEL_22:
          uint64_t Value = 0;
        }
      }
LABEL_23:
      free(v8);
      return Value;
    }
    return 0;
  }
  CFTypeID v13 = CFGetTypeID(a1);
  if (v13 == CFBooleanGetTypeID())
  {
    LODWORD(valuePtr) = CFBooleanGetValue((CFBooleanRef)a1) != 0;
    CFNumberRef v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (v14)
    {
      CFNumberRef v15 = v14;
      uint64_t Value = CFNumberGetValue(v14, a2, a3);
      CFRelease(v15);
      return Value;
    }
    return 0;
  }
  CFTypeID v16 = CFGetTypeID(a1);
  if (v16 != CFNumberGetTypeID()) {
    return 0;
  }
  return CFNumberGetValue((CFNumberRef)a1, a2, a3);
}

CFURLRef sub_21DC1B980(int a1, CFURLRef anURL, const __CFString *a3, int a4)
{
  if (!anURL) {
    return anURL;
  }
  if (!a3)
  {
    CFRetain(anURL);
    return anURL;
  }
  Boolean v6 = a4;
  if (CFURLHasDirectoryPath(anURL) == a4)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return CFURLCreateCopyAppendingPathExtension(v7, anURL, a3);
  }
  else
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(anURL);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFURLRef v11 = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], anURL);
    CFStringRef v12 = CFStringCreateWithFormat(v10, 0, @"%@.%@", PathComponent, a3);
    CFURLRef v13 = CFURLCreateCopyAppendingPathComponent(v10, v11, v12, v6);
    CFRelease(v12);
    CFRelease(v11);
    CFRelease(PathComponent);
    return v13;
  }
}

void *sub_21DC1BA9C(const __CFString *a1)
{
  CFIndex v2 = CFStringGetMaximumSizeOfFileSystemRepresentation(a1) + 1;
  unint64_t v3 = malloc_type_malloc(v2, 0x1F3DA98AuLL);
  if (v3 && !CFStringGetFileSystemRepresentation(a1, (char *)v3, v2))
  {
    free(v3);
    return 0;
  }
  return v3;
}

uint64_t sub_21DC1BB08()
{
  return 78;
}

uint64_t sub_21DC1BB10()
{
  if (dword_267D202CC) {
    warnx("DiskImages secure mode enabled");
  }
  pid_t v0 = getpid();
  uint64_t result = ptrace(31, v0, 0, 0);
  if (!result)
  {
    v2.rlim_cur = 0;
    v2.rlim_max = 0;
    return setrlimit(4, &v2);
  }
  return result;
}

uint64_t sub_21DC1BB74(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFStringRef v9 = 0;
  *(_OWORD *)CFTypeRef cf = 0u;
  if (a1)
  {
    if (_CFURLCopyComponents())
    {
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (a2) {
        cf[1] = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0, @";/?:@&=+$,",
      }
                  0x8000100u);
      if (a3) {
        CFStringRef v9 = CFURLCreateStringByAddingPercentEscapes(v5, a3, 0, @";/?:@&=+$,", 0x8000100u);
      }
      uint64_t v6 = _CFURLCreateFromComponents();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v6;
}

uint64_t sub_21DC1BCFC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a1 && a3) {
    operator new();
  }
  return 22;
}

void sub_21DC1C000(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C407FD252BCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1C024(uint64_t a1)
{
  rlimit v2 = (void *)sub_21DC08428(a1);
  *rlimit v2 = &unk_26CE85128;
  sub_21DC08628((uint64_t)v2, @"thread-safe", (const __CFString *)*MEMORY[0x263EFFB40]);
  return a1;
}

void sub_21DC1C080(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1C098(const void *a1, _DWORD *a2)
{
  *a2 = 0;
  if (a1
    && __dynamic_cast(a1, (const struct __class_type_info *)&unk_26CE84370, (const struct __class_type_info *)&unk_26CE86B68, 0))
  {
    *a2 = -1000;
  }
  return 0;
}

void sub_21DC1C110(void *a1)
{
  sub_21DC1C17C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC1C158(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C407FD252BCLL);
  _Unwind_Resume(a1);
}

void *sub_21DC1C17C(void *a1)
{
  *a1 = &unk_26CE85128;
  if (sub_21DC088E8((uint64_t)a1))
  {
    uint64_t v2 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
    (*(void (**)(uint64_t, void))(*(void *)v2 + 280))(v2, 0);
  }
  return sub_21DC114A4(a1);
}

void sub_21DC1C234(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef sub_21DC1C24C(io_registry_entry_t a1)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;

  properties = 0;
  uint64_t v1 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!v1) {
    return properties;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "CFDictionaryCreateMutableFromIOKitObject: unable to get object properties: error 0x%08X (%d)\n", v1, v1);
  return 0;
}

uint64_t sub_21DC1C2B4(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count != CFArrayGetCount(a2)) {
    return 0;
  }
  return sub_21DC1C324(a1, a2);
}

uint64_t sub_21DC1C324(const __CFArray *a1, CFArrayRef theArray)
{
  int Count = CFArrayGetCount(theArray);
  CFIndex v5 = CFArrayGetCount(a1);
  uint64_t result = 0;
  if (a1 && theArray && Count)
  {
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      CFIndex v7 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
        if (ValueAtIndex)
        {
          v9.location = 0;
          v9.CFIndex length = v5;
          uint64_t result = CFArrayContainsValue(a1, v9, ValueAtIndex);
          if (!result) {
            break;
          }
        }
        if (Count == ++v7) {
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21DC1C3C8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1) + 448);
    return v3();
  }
  return result;
}

uint64_t sub_21DC1C48C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 448))();
  }
  return result;
}

uint64_t sub_21DC1C4C4()
{
  return 0;
}

BOOL sub_21DC1C4CC(uint64_t a1)
{
  return sub_21DC1C4F8(*(const char **)(a1 + 296), 0, 0) == 0;
}

uint64_t sub_21DC1C4F8(const char *a1, _DWORD *a2, _DWORD *a3)
{
  int v7 = 0;
  memset(v6, 0, sizeof(v6));
  v8[1] = 0;
  v8[2] = 0;
  v8[0] = 0x400000000005;
  uint64_t result = getattrlist(a1, v8, v6, 0x24uLL, 0);
  if (!result)
  {
    if (a2) {
      *a2 = bswap32(DWORD1(v6[0]));
    }
    if (a3) {
      *a3 = bswap32(DWORD2(v6[0]));
    }
  }
  return result;
}

uint64_t sub_21DC1C578(uint64_t a1, _DWORD *a2)
{
  return sub_21DC1C4F8(*(const char **)(a1 + 296), a2, 0);
}

BOOL sub_21DC1C584(uint64_t a1)
{
  return sub_21DC1C4F8(*(const char **)(a1 + 296), 0, 0) == 0;
}

uint64_t sub_21DC1C5B0(uint64_t a1, _DWORD *a2)
{
  return sub_21DC1C4F8(*(const char **)(a1 + 296), 0, a2);
}

uint64_t sub_21DC1C5C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 176))();
}

uint64_t sub_21DC1C5E8(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 248))(a1)
    && (*(unsigned int (**)(uint64_t, char *))(*(void *)a1 + 264))(a1, (char *)&v9 + 4))
  {
    return 0;
  }
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 224))(a1))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 240))(a1, &v9)) {
      return 0;
    }
    BOOL v4 = HIDWORD(v9) == 1061109567;
    BOOL v5 = v9 == 1061109567;
    if (v4 && v5) {
      int v6 = 0;
    }
    else {
      int v6 = v9;
    }
    if (v4 && v5) {
      int v7 = 0;
    }
    else {
      int v7 = HIDWORD(v9);
    }
  }
  else
  {
    int v6 = 0;
    int v7 = HIDWORD(v9);
  }
  if (v7 | v6) {
    return sub_21DC2E844(v7, v6, a2);
  }
  return 0;
}

uint64_t sub_21DC1C720(uint64_t a1, _DWORD *a2)
{
  CFStringRef v3 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 208))(a1);
  *a2 = 0;
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  *a2 = -1000;
  if (CFStringCompare(v3, @"sparseimage", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"shadow", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"dmgpart", 1uLL) == kCFCompareEqualTo)
  {
    return 0;
  }
  uint64_t v5 = 1430541391;
  *a2 = 100;
  if (CFStringCompare(v4, @"dmg", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"img", 1uLL) == kCFCompareEqualTo)
  {
    return 1430540887;
  }
  if (CFStringCompare(v4, @"iso", 1uLL)
    && CFStringCompare(v4, @"toast", 1uLL)
    && CFStringCompare(v4, @"cdr", 1uLL)
    && CFStringCompare(v4, @"dvdr", 1uLL))
  {
    uint64_t v5 = 0;
    *a2 = 0;
  }
  return v5;
}

uint64_t sub_21DC1C884(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
  if (a4) {
    *a4 = 0;
  }
  if (!v10) {
    return 999;
  }
  uint64_t v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11) {
    return 22;
  }
  unint64_t v15 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(void *)v10 + 328))(v10, a2 << 9, a3 << 9, &v15, a5);
  if (result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = a4 == 0;
  }
  if (!v14)
  {
    uint64_t result = 0;
    *a4 = v15 >> 9;
  }
  return result;
}

uint64_t sub_21DC1C984(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v1 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  (*(void (**)(void))(v1 + 296))();
  return v3 >> 9;
}

uint64_t sub_21DC1CA14(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  unsigned int v2 = 16;
  uint64_t v3 = 64;
  while (1)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(void *)a1 + 48))(a1, v3, 4, &v7, &v8))
    {
      unsigned int v5 = 0;
      goto LABEL_12;
    }
    if (!v8 && v9 == 21326 && v10 == 82) {
      break;
    }
    ++v2;
    v3 += 4;
    if (v3 == 128)
    {
      unsigned int v5 = 0;
      unsigned int v2 = 32;
      goto LABEL_12;
    }
  }
  unsigned int v5 = 1;
LABEL_12:
  if (v2 < 0x20) {
    return v5;
  }
  else {
    return 0;
  }
}

void sub_21DC1CB14(const __CFArray *a1)
{
  v2.CFIndex length = CFArrayGetCount(a1);
  v2.location = 0;
  CFArraySortValues(a1, v2, (CFComparatorFunction)sub_21DC18DEC, 0);
}

__CFString *sub_21DC1CB68()
{
  return @"ISO9660";
}

uint64_t sub_21DC1CB74(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22;
  }
  *a2 = 0;
  return 78;
}

void sub_21DC1CB8C()
{
}

void sub_21DC1CBD0(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1CBF4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120)) {
    return 10;
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC1CC08()
{
  return 1;
}

CFTypeRef sub_21DC1CC10()
{
  int v0 = DIGetBundleRef();
  return sub_21DC3A890(v0, (int)@"read/write", @"read/write");
}

uint64_t sub_21DC1CC4C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  CFStringRef v7 = (const __CFString *)sub_21DC02040();
  int v8 = sub_21DC02048(v7, 0);
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    return 118;
  }
  uint64_t v11 = 0;
  if (a3)
  {
    *a3 = 0;
    if (a4) {
      *a4 = 0;
    }
    if (a1) {
      operator new();
    }
  }
  uint64_t v9 = 22;
  sub_21DC35B94(&v11);
  return v9;
}

void sub_21DC1CE90(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char *a10)
{
  MEMORY[0x223C15E40](v10, 0x10F1C400206AE36);
  CFURLRef v13 = __cxa_begin_catch(a1);
  if (a2 == 2)
  {
    if (a10) {
      sub_21DC0474C(a10);
    }
    (*(void (**)(void *))(*(void *)v13 + 24))(v13);
    __cxa_end_catch();
  }
  else
  {
    if (a10) {
      sub_21DC0474C(a10);
    }
    __cxa_end_catch();
  }
  JUMPOUT(0x21DC1CE48);
}

void sub_21DC1CF4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __cxa_end_catch();
  sub_21DC35B94((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1CF84(uint64_t a1)
{
  sub_21DC06E10(a1);
  *(void *)uint64_t v2 = &unk_26CE86548;
  *(unsigned char *)(a1 + 2048) = 0;
  *(_OWORD *)(v2 + 520) = 0u;
  bzero((void *)(v2 + 546), 0x4FCuLL);
  uint64_t v3 = *MEMORY[0x263EFFB40];
  sub_21DC04008(a1, @"thread-safe", (const void *)*MEMORY[0x263EFFB40]);
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 208), 0);
  (*(void (**)(uint64_t, __CFString *, uint64_t))(*(void *)a1 + 32))(a1, @"bs-supports-proxy-encoding", v3);
  *(void *)(a1 + 472) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 408), 0);
  return a1;
}

void sub_21DC1D054(_Unwind_Exception *a1)
{
  sub_21DC1171C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1D06C(uint64_t a1, const __CFString *a2)
{
  if (!a2)
  {
    if (*(unsigned char *)(a1 + 545))
    {
      uint64_t result = sub_21DC1EFEC(a1);
      if (!result) {
        return result;
      }
      if (result == 80) {
        sub_21DC1D0CC(80, (uint64_t)"unable to unlock image.");
      }
    }
    sub_21DC1D0CC(80, (uint64_t)"unable to unlock image.");
  }
  uint64_t result = sub_21DC35208(a1, a2);
  if (result) {
    sub_21DC1D0CC(result, (uint64_t)"cannot unlock image with specified passphrase");
  }
  return result;
}

void sub_21DC1D0CC(int a1, uint64_t a2)
{
  exception = __cxa_allocate_exception(0x18uLL);
  *(void *)exception = &unk_26CE864D8;
  exception[3] = a1;
  *((void *)exception + 2) = a2;
  __cxa_throw(exception, (struct type_info *)&unk_26CE86508, (void (*)(void *))std::exception::~exception);
}

void sub_21DC1D12C(char **a1)
{
  sub_21DC1D198(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC1D174(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10F1C400206AE36);
  _Unwind_Resume(a1);
}

void *sub_21DC1D198(char **a1)
{
  *a1 = (char *)&unk_26CE86548;
  if (sub_21DC04B2C((uint64_t)a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 35))(a1, 1);
  }
  if ((*((unsigned int (**)(char **))*a1 + 74))(a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 46))(a1, 1);
  }
  if ((*((unsigned int (**)(char **))*a1 + 77))(a1)) {
    (*((void (**)(char **, uint64_t))*a1 + 44))(a1, 1);
  }
  uint64_t v2 = a1[59];
  if (v2) {
    free(v2);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 51));
  uint64_t v3 = a1[65];
  if (v3) {
    free(v3);
  }
  CFStringRef v4 = a1[66];
  if (v4) {
    free(v4);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 26));
  return sub_21DC1171C(a1);
}

void sub_21DC1D328(_Unwind_Exception *a1)
{
  sub_21DC1171C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC1D340(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

void sub_21DC1D34C(unsigned char *a1, uint64_t a2, char *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1[545])
  {
    uint64_t v5 = (*(uint64_t (**)(unsigned char *, __CFString *))(*(void *)a1 + 24))(a1, @"use-filename-for-prompt");
    uint64_t v6 = *(void *)a1;
    if (v5) {
      uint64_t v7 = (*(uint64_t (**)(unsigned char *, __CFString *))(v6 + 24))(a1, @"use-filename-for-prompt");
    }
    else {
      uint64_t v7 = (*(uint64_t (**)(unsigned char *))(v6 + 192))(a1);
    }
    uint64_t v8 = v7;
    int v9 = DIGetBundleRef();
    CFStringRef v10 = (const __CFString *)sub_21DC3A890(v9, (int)@"Enter a new password to secure \"%1$@\": ", @"Enter a new password to secure \"%1$@\": ");
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, v10, v8);
    CFStringRef v12 = sub_21DC0373C(v11, 0x8000100u);
    CFURLRef v13 = v12;
    if (v12) {
      BOOL v14 = (const char *)v12;
    }
    else {
      BOOL v14 = "Enter new password: ";
    }
    int v15 = DIGetBundleRef();
    CFStringRef v16 = (const __CFString *)sub_21DC3A890(v15, (int)@"Re-enter new password: ", @"Re-enter new password: ");
    CFDictionaryRef v17 = sub_21DC0373C(v16, 0x8000100u);
    CFNumberRef v18 = v17;
    if (v17) {
      CFNumberRef v19 = (const char *)v17;
    }
    else {
      CFNumberRef v19 = "Re-enter new password: ";
    }
    int v20 = sub_21DC1F1E8(v14, a3, 1024, 1);
    if (!v20)
    {
      int v20 = sub_21DC1F1E8(v19, __s2, 1024, 1);
      if (!v20)
      {
        int v20 = strncmp(a3, __s2, 0x400uLL);
        bzero(__s2, 0x400uLL);
        if (v20)
        {
          int v21 = DIGetBundleRef();
          CFStringRef v22 = (const __CFString *)sub_21DC3A890(v21, (int)@"Passwords must match.", @"Passwords must match.");
          int v23 = (const char *)sub_21DC0373C(v22, 0x8000100u);
          double v24 = "Passwords must match.";
          if (v23) {
            double v24 = v23;
          }
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v24);
          if (v22) {
            CFRelease(v22);
          }
          int v20 = 80;
        }
      }
    }
    if (v18) {
      free(v18);
    }
    if (v13) {
      free(v13);
    }
    if (v20)
    {
      bzero(a3, 0x400uLL);
      sub_21DC1D0CC(v20, (uint64_t)"cannot get passphrase.");
    }
    if (v16) {
      CFRelease(v16);
    }
    if (v11) {
      CFRelease(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
  }
}

void sub_21DC1D61C(_Unwind_Exception *exception_object)
{
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DC1D698(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 566;
  int v3 = *(_DWORD *)(a1 + 480);
  BOOL v4 = v3 == 1;
  if (v3 == 1) {
    uint64_t v5 = (int *)(a1 + 642);
  }
  else {
    uint64_t v5 = (int *)(a1 + 566);
  }
  uint64_t v6 = 4;
  if (v4) {
    uint64_t v6 = 80;
  }
  int v7 = *(_DWORD *)(v2 + v6);
  int v8 = *v5;
  uint64_t v9 = 8;
  if (v4) {
    uint64_t v9 = 376;
  }
  int v10 = *(_DWORD *)(v2 + v9);
  int v11 = DIGetBundleRef();
  CFTypeRef v12 = sub_21DC3A890(v11, (int)@"(CSSM non-standard algorithm)", @"(CSSM non-standard algorithm)");
  if (v12)
  {
    CFURLRef v13 = v12;
    (*(void (**)(uint64_t, __CFString *, CFTypeRef))(*(void *)a1 + 32))(a1, @"encryption-class", v12);
    CFRelease(v13);
  }
  if ((v10 == 91 || v10 == 0) && (!v8 || v8 == -2147483647))
  {
    if (v7 == 128)
    {
      CFStringRef v16 = @"AES-128";
      uint64_t v17 = 16;
    }
    else
    {
      if (v7 != 256) {
        goto LABEL_25;
      }
      CFStringRef v16 = @"AES-256";
      uint64_t v17 = 32;
    }
    *(void *)(a1 + 2032) = v17;
    (*(void (**)(uint64_t, __CFString *, __CFString *))(*(void *)a1 + 32))(a1, @"encryption-class", v16);
LABEL_25:
    *(void *)(a1 + 2040) = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2016));
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2024));
    unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 2024));
    unsigned int v20 = Length;
    if (!Length) {
      goto LABEL_29;
    }
    uint64_t v21 = Length;
    CFStringRef v22 = data;
    int v23 = BytePtr;
    do
    {
      char v24 = *v23++;
      *v22++ = v24 ^ 0x36;
      --v21;
    }
    while (v21);
    if (Length > 0x3F)
    {
      int v25 = 0;
    }
    else
    {
LABEL_29:
      memset(&data[Length], 54, 64 - Length);
      int v25 = 1;
    }
    uint64_t v26 = (CC_SHA1_CTX *)(a1 + 1824);
    CC_SHA1_Init((CC_SHA1_CTX *)(a1 + 1824));
    char v27 = (CC_SHA1_CTX *)(a1 + 1920);
    CC_SHA1_Init(v27);
    CC_SHA1_Update(v26, data, 0x40u);
    if (v20)
    {
      uint64_t v28 = v20;
      CFDictionaryRef v29 = data;
      do
      {
        char v30 = *BytePtr++;
        *v29++ = v30 ^ 0x5C;
        --v28;
      }
      while (v28);
    }
    if (v25) {
      memset(&data[v20], 92, 64 - v20);
    }
    CC_SHA1_Update(v27, data, 0x40u);
  }
}

uint64_t sub_21DC1D900(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  if (!v2) {
    return 999;
  }
  uint64_t v3 = v2;
  uint64_t v14 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272))(v2);
  if (!v4)
  {
    int v5 = *(_DWORD *)(a1 + 480);
    if (v5 == 2)
    {
      *(_DWORD *)(a1 + 598) = *(void *)(a1 + 488);
      *(_OWORD *)(a1 + 602) = *(_OWORD *)(a1 + 496);
      int8x16_t v10 = *(int8x16_t *)(a1 + 562);
      __dst[0] = *(int8x16_t *)(a1 + 546);
      __dst[1] = v10;
      int8x16_t v11 = *(int8x16_t *)(a1 + 594);
      __dst[2] = *(int8x16_t *)(a1 + 578);
      __dst[3] = v11;
      __dst[4].i64[0] = *(void *)(a1 + 610);
      __dst[0] = vrev32q_s8(__dst[0]);
      __dst[1] = vrev32q_s8(__dst[1]);
      __dst[2].i32[0] = bswap32(__dst[2].u32[0]);
      __dst[3].i32[1] = bswap32(v11.u32[1]);
      *(int8x16_t *)((char *)&__dst[3] + 8) = vrev64q_s8(*(int8x16_t *)((char *)&__dst[3] + 8));
      uint64_t v9 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, int8x16_t *, __n128))(*(void *)v3 + 336))(v3, 0, 72, &v14, __dst, *(__n128 *)((char *)&__dst[3] + 8));
    }
    else
    {
      if (v5 != 1)
      {
        uint64_t v4 = 999;
        goto LABEL_11;
      }
      uint64_t v13 = 0;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v3 + 296))(v3, &v13);
      if (v4)
      {
LABEL_11:
        (*(void (**)(uint64_t, void))(*(void *)v3 + 280))(v3, 0);
        return v4;
      }
      uint64_t v6 = *(void *)(a1 + 496);
      *(_DWORD *)(a1 + 562) = *(void *)(a1 + 488);
      *(void *)(a1 + 1802) = v6;
      memcpy(__dst, (const void *)(a1 + 546), 0x4FCuLL);
      uint64_t v7 = v13 - 1276;
      v8.n128_u64[0] = (unint64_t)sub_21DC359F4((uint64_t)__dst);
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, int8x16_t *, __n128))(*(void *)v3 + 336))(v3, v7, 1276, &v14, __dst, v8);
    }
    uint64_t v4 = v9;
    goto LABEL_11;
  }
  return v4;
}

uint64_t sub_21DC1DB90(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4 && a5 && (unint64_t v6 = *(void *)(a1 + 488), v7 = a2 / v6, a2 == v7 * v6) && !(a3 % v6)) {
    return sub_21DC1DBC8(a1, v7, a3 / v6, a4, a5);
  }
  else {
    return 22;
  }
}

uint64_t sub_21DC1DBC8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3 < 1) {
    return 0;
  }
  uint64_t v10 = 0;
  while (1)
  {
    sub_21DC1DE08((_OWORD *)a1, a2 + v10, iv);
    size_t v11 = *(void *)(a1 + 488);
    CFTypeRef v12 = *(const void **)(a1 + 2040);
    size_t v13 = *(void *)(a1 + 2032);
    size_t dataOutMoved = 0;
    CCCryptorStatus v14 = CCCrypt(0, 0, 0, v12, v13, iv, (const void *)(a4 + v11 * v10), v11, (void *)(a5 + v11 * v10), v11, &dataOutMoved);
    if (v14) {
      break;
    }
    if (a3 == ++v10) {
      return 0;
    }
  }
  uint64_t v16 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "CEncryptedEncoding::encrypt CCCrypt() returned error %d\n", v14);
  uint64_t result = 999;
  if (v14 > -4301)
  {
    if (v14 == -4300 || v14 == -1) {
      return 22;
    }
  }
  else if (v14 == -4302)
  {
    return 12;
  }
  else if (v14 == -4301)
  {
    fprintf(*v16, "CEncryptedEncoding::encrypt output buffer should be %zu bytes\n", dataOutMoved);
    return 999;
  }
  return result;
}

#error "21DC1DDD4: call analysis failed (funcsize=38)"

uint64_t sub_21DC1DE08(_OWORD *a1, unsigned int a2, unsigned __int8 *a3)
{
  unsigned int data = bswap32(a2);
  long long v5 = a1[117];
  *(_OWORD *)&v12.data[1] = a1[116];
  *(_OWORD *)&v12.data[5] = v5;
  long long v6 = a1[119];
  *(_OWORD *)&v12.data[9] = a1[118];
  *(_OWORD *)&v12.data[13] = v6;
  long long v7 = a1[115];
  *(_OWORD *)&v12.h0 = a1[114];
  *(_OWORD *)&v12.h4 = v7;
  CC_SHA1_Update(&v12, &data, 4u);
  CC_SHA1_Final(a3, &v12);
  long long v8 = a1[123];
  *(_OWORD *)&v12.data[1] = a1[122];
  *(_OWORD *)&v12.data[5] = v8;
  long long v9 = a1[125];
  *(_OWORD *)&v12.data[9] = a1[124];
  *(_OWORD *)&v12.data[13] = v9;
  long long v10 = a1[121];
  *(_OWORD *)&v12.h0 = a1[120];
  *(_OWORD *)&v12.h4 = v10;
  CC_SHA1_Update(&v12, a3, 0x14u);
  return CC_SHA1_Final(a3, &v12);
}

uint64_t sub_21DC1DEBC()
{
  return 1;
}

uint64_t sub_21DC1DEC4(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a4 && (v5 = *(void *)(a1 + 488), unint64_t v6 = a2 / v5, a2 == v6 * v5) && !(a3 % v5)) {
    return sub_21DC1DEF8(a1, v6, a3 / v5, a4);
  }
  else {
    return 22;
  }
}

uint64_t sub_21DC1DEF8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  while (1)
  {
    sub_21DC1DE08((_OWORD *)a1, a2 + v8, iv);
    size_t v9 = *(void *)(a1 + 488);
    long long v10 = *(const void **)(a1 + 2040);
    size_t v11 = *(void *)(a1 + 2032);
    size_t dataOutMoved = 0;
    CCCryptorStatus v12 = CCCrypt(1u, 0, 0, v10, v11, iv, (const void *)(a4 + v9 * v8), v9, (void *)(a4 + v9 * v8), v9, &dataOutMoved);
    if (v12) {
      break;
    }
    if (a3 == ++v8) {
      return 0;
    }
  }
  CCCryptorStatus v14 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "CEncryptedEncoding::decrypt CCCrypt() returned error %d\n", v12);
  uint64_t result = 999;
  if (v12 > -4301)
  {
    if (v12 == -4300 || v12 == -1) {
      return 22;
    }
  }
  else if (v12 == -4302)
  {
    return 12;
  }
  else if (v12 == -4301)
  {
    fprintf(*v14, "CEncryptedEncoding::decrypt output buffer should be %zu bytes\n", dataOutMoved);
    return 999;
  }
  return result;
}

#error "21DC1E0F8: call analysis failed (funcsize=38)"

uint64_t sub_21DC1E12C(uint64_t a1, void *a2)
{
  uint64_t v2 = (unsigned int *)(a1 + 570);
  unint64_t v3 = *(unsigned int *)(a1 + 570);
  uint64_t v4 = ((*(_DWORD *)(a1 + 578) + v3) >> 3) + 5;
  if (*a2 != v4) {
    return 0;
  }
  unint64_t v6 = (const UInt8 *)a2[1];
  if (*(_DWORD *)&v6[v4 - 5] ^ 0x45494B43 | v6[v4 - 1]) {
    return 0;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *(void *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v3 >> 3);
  *(void *)(a1 + 2024) = CFDataCreate(v9, (const UInt8 *)(a2[1] + ((unint64_t)*v2 >> 3)), (unint64_t)v2[2] >> 3);
  return 1;
}

uint64_t sub_21DC1E1E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 80))();
  }
  else {
    return 999;
  }
}

void sub_21DC1E21C(unint64_t *a1)
{
  uint64_t v2 = (*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1);
  unint64_t v3 = (uint64_t *)(a1 + 64);
  if ((*(unsigned int (**)(uint64_t, unsigned char *))(*(void *)v2 + 296))(v2, (unsigned char *)a1 + 512))
  {
    uint64_t v4 = 0;
LABEL_3:
    *unint64_t v3 = v4;
    return;
  }
  unint64_t v6 = a1[61];
  unint64_t v5 = a1[62];
  unint64_t v7 = v5 % v6;
  unint64_t v8 = v6 - v5 % v6;
  if (!v7) {
    unint64_t v8 = 0;
  }
  uint64_t v9 = v8 + v5;
  if (*((_DWORD *)a1 + 120) == 1) {
    uint64_t v4 = v9 + 1276;
  }
  else {
    uint64_t v4 = a1[63] + v9;
  }
  if (v4 != *v3 && !*((unsigned char *)a1 + 2049))
  {
    CFStringRef v10 = (const __CFString *)(*(uint64_t (**)(unint64_t *))(*a1 + 192))(a1);
    if (v10) {
      size_t v11 = (char *)sub_21DC0373C(v10, 0x8000100u);
    }
    else {
      size_t v11 = 0;
    }
    CCCryptorStatus v12 = "";
    if (v11) {
      CCCryptorStatus v12 = v11;
    }
    syslog(5, "CEncryptedEncoding: need to repair %s", v12);
    syslog(5, "expected length: %qd, actual length: %qd", v4, *v3);
    if (v11) {
      free(v11);
    }
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 312))(v2, v4);
    syslog(6, "setting length returned %d", v13);
    if (!v13 && !(*(unsigned int (**)(unint64_t *, uint64_t))(*a1 + 472))(a1, 1)) {
      goto LABEL_3;
    }
  }
}

uint64_t sub_21DC1E428(uint64_t a1, unint64_t a2, size_t a3, void *a4, char *a5)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  if (a4) {
    *a4 = 0;
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 208));
  size_t v34 = a3;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    uint64_t v12 = 9;
    goto LABEL_11;
  }
  if (!a5)
  {
    uint64_t v12 = 22;
    goto LABEL_11;
  }
  int64_t v11 = *(void *)(a1 + 496);
  int64_t v36 = v11;
  if (*(unsigned char *)(a1 + 2049))
  {
    (*(void (**)(uint64_t, int64_t *))(*(void *)a1 + 304))(a1, &v36);
    int64_t v11 = v36;
  }
  if ((uint64_t)(a3 + a2) > v11)
  {
    uint64_t v12 = 29;
LABEL_11:
    int v13 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v12 = 0;
    int v13 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_12;
  }
  uint64_t v30 = v10;
  CFStringRef v31 = 0;
  uint64_t v32 = a4;
  uint64_t v33 = (pthread_mutex_t *)(a1 + 408);
  while (1)
  {
    size_t v15 = *(void *)(a1 + 488);
    size_t v16 = a2 % v15;
    if (a3 < v15 || v16)
    {
      if (pthread_mutex_trylock(v33))
      {
        CFStringRef v22 = v31;
        if (v31) {
          goto LABEL_36;
        }
        CFStringRef v22 = (char *)malloc_type_malloc(32 * *(void *)(a1 + 488), 0xBFFE7E74uLL);
        CFStringRef v31 = v22;
      }
      else
      {
        CFStringRef v22 = *(char **)(a1 + 472);
      }
      if (!v22)
      {
        uint64_t v12 = 12;
        a4 = v32;
        goto LABEL_69;
      }
LABEL_36:
      uint64_t v23 = *(void *)(a1 + 512);
      uint64_t v24 = *(void *)(a1 + 504) + a2 - v16;
      unint64_t v25 = *(void *)(a1 + 488);
      if (v23 <= v24)
      {
        uint64_t v26 = 0;
      }
      else
      {
        if ((uint64_t)(v25 + v24) <= v23) {
          uint64_t v26 = *(void *)(a1 + 488);
        }
        else {
          uint64_t v26 = v23 - v24;
        }
        if (v26)
        {
          uint64_t v35 = 0;
          unsigned int v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(void *)v30 + 328))(v30, v24, v26, &v35, v22);
          if (v35 == v26) {
            unsigned int v28 = 0;
          }
          else {
            unsigned int v28 = 5;
          }
          if (v27) {
            uint64_t v12 = v27;
          }
          else {
            uint64_t v12 = v28;
          }
          if (v27) {
            BOOL v29 = 0;
          }
          else {
            BOOL v29 = v35 == v26;
          }
          if (!v29)
          {
            size_t v17 = 0;
            goto LABEL_60;
          }
          unint64_t v25 = *(void *)(a1 + 488);
LABEL_54:
          if (v25 != v26)
          {
            bzero(&v22[v26], v25 - v26);
            unint64_t v25 = *(void *)(a1 + 488);
          }
          sub_21DC1DEF8(a1, (v24 - *(void *)(a1 + 504)) / v25, 1, (uint64_t)v22);
          if (*(void *)(a1 + 488) - v16 >= a3) {
            size_t v17 = a3;
          }
          else {
            size_t v17 = *(void *)(a1 + 488) - v16;
          }
          memcpy(a5, &v22[v16], v17);
LABEL_60:
          if (v22 == *(char **)(a1 + 472)) {
            pthread_mutex_unlock(v33);
          }
          a4 = v32;
          if (v12) {
            goto LABEL_69;
          }
          goto LABEL_63;
        }
      }
      uint64_t v12 = 0;
      goto LABEL_54;
    }
    size_t v17 = a3 / v15 * v15;
    int64_t v18 = *(void *)(a1 + 512);
    int64_t v19 = *(void *)(a1 + 504) + a2;
    if (v18 > v19) {
      break;
    }
    size_t v20 = 0;
LABEL_31:
    if (v17 != v20) {
      bzero(&a5[v20], v17 - v20);
    }
    sub_21DC1DEF8(a1, (unint64_t)(v19 - *(void *)(a1 + 504)) / *(void *)(a1 + 488), v17 / *(void *)(a1 + 488), (uint64_t)a5);
LABEL_63:
    a2 += v17;
    a5 += v17;
    a3 -= v17;
    if (!a3)
    {
      uint64_t v12 = 0;
      goto LABEL_69;
    }
  }
  if ((uint64_t)(v19 + v17) <= v18) {
    size_t v20 = v17;
  }
  else {
    size_t v20 = v18 - v19;
  }
  if (!v20) {
    goto LABEL_31;
  }
  uint64_t v35 = 0;
  uint64_t v21 = (*(uint64_t (**)(uint64_t, int64_t, size_t, uint64_t *, char *))(*(void *)v30 + 328))(v30, v19, v20, &v35, a5);
  if (!v21)
  {
    if (v35 != v20)
    {
      uint64_t v12 = 5;
      goto LABEL_69;
    }
    goto LABEL_31;
  }
  uint64_t v12 = v21;
LABEL_69:
  int v13 = (pthread_rwlock_t *)(a1 + 208);
  if (v31) {
    free(v31);
  }
LABEL_12:
  pthread_rwlock_unlock(v13);
  if (a4) {
    *a4 = v34 - a3;
  }
  return v12;
}

uint64_t sub_21DC1E814(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22;
  }
  uint64_t result = 0;
  *a2 = *(void *)(a1 + 496);
  return result;
}

uint64_t sub_21DC1E834(void *a1, int64_t a2, size_t a3, void *a4, char *a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 496))(a1);
  if (a4) {
    *a4 = 0;
  }
  int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 26));
  uint64_t v12 = a1[59];
  if (!(*(unsigned int (**)(void *))(*a1 + 568))(a1))
  {
    uint64_t v13 = 9;
    goto LABEL_38;
  }
  if (!a5)
  {
    uint64_t v13 = 22;
    goto LABEL_38;
  }
  size_t v25 = a3 + a2;
  if ((int64_t)(a3 + a2) > a1[62])
  {
    if ((*(unsigned int (**)(void *))(*a1 + 160))(a1))
    {
      if (a1[62] < a2) {
        (*(void (**)(void *, int64_t, uint64_t))(*a1 + 320))(a1, a2, 1);
      }
      uint64_t v13 = (*(uint64_t (**)(void *, size_t, void))(*a1 + 320))(a1, v25, 0);
      size_t v14 = a3;
      if (v13) {
        goto LABEL_39;
      }
      goto LABEL_10;
    }
    uint64_t v13 = 29;
LABEL_38:
    size_t v14 = a3;
    goto LABEL_39;
  }
LABEL_10:
  if (!a3)
  {
LABEL_32:
    if ((int64_t)(v25 + a1[63]) > a1[64]) {
      (*(void (**)(uint64_t, void *))(*(void *)v10 + 296))(v10, a1 + 64);
    }
    uint64_t v13 = 0;
    size_t v14 = 0;
    goto LABEL_39;
  }
  size_t v27 = a3;
  size_t v14 = a3;
  uint64_t v26 = a4;
  while (1)
  {
    size_t v15 = a1[61];
    size_t v16 = a2 % v15;
    if (v14 < v15 || v16) {
      break;
    }
    if (v14 / v15 * v15 >= 32 * v15) {
      size_t v17 = 32 * v15;
    }
    else {
      size_t v17 = v14 / v15 * v15;
    }
    sub_21DC1DBC8((uint64_t)a1, a2 / v15, v17 / v15, (uint64_t)a5, v12);
    unint64_t v29 = 0;
    uint64_t v18 = (*(uint64_t (**)(uint64_t, int64_t, size_t, unint64_t *, uint64_t))(*(void *)v10
                                                                                                  + 336))(v10, a1[63] + a2, v17, &v29, v12);
    if (v18)
    {
      uint64_t v13 = v18;
      int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
      goto LABEL_44;
    }
    BOOL v19 = v29 == v17;
LABEL_29:
    int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
    if (!v19)
    {
      uint64_t v13 = 5;
LABEL_44:
      a3 = v27;
      goto LABEL_39;
    }
    a2 += v17;
    a5 += v17;
    v14 -= v17;
    a3 = v27;
    if (!v14) {
      goto LABEL_32;
    }
  }
  unint64_t v20 = a2 - v16;
  unint64_t v29 = 0;
  uint64_t v21 = a1[63];
  if ((int64_t)(a2 - v16 + v15 + v21) > a1[64])
  {
    uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 312))(v10);
    if (v22) {
      goto LABEL_42;
    }
    uint64_t v21 = a1[63];
    size_t v15 = a1[61];
  }
  uint64_t v22 = (*(uint64_t (**)(uint64_t, unint64_t, size_t, unint64_t *, uint64_t))(*(void *)v10
                                                                                                  + 328))(v10, v21 + v20, v15, &v29, v12);
  if (v22)
  {
LABEL_42:
    uint64_t v13 = v22;
    goto LABEL_46;
  }
  if (v29 == a1[61])
  {
    sub_21DC1DEF8((uint64_t)a1, v20 / v29, 1, v12);
    if (a1[61] - v16 >= v14) {
      size_t v17 = v14;
    }
    else {
      size_t v17 = a1[61] - v16;
    }
    memcpy((void *)(v12 + v16), a5, v17);
    sub_21DC1DBC8((uint64_t)a1, v20 / a1[61], 1, v12, v12);
    uint64_t v28 = 0;
    uint64_t v23 = (*(uint64_t (**)(uint64_t, unint64_t, void, uint64_t *, uint64_t))(*(void *)v10 + 336))(v10, a1[63] + v20, a1[61], &v28, v12);
    if (v23)
    {
      uint64_t v13 = v23;
      a4 = v26;
      a3 = v27;
      int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
      goto LABEL_39;
    }
    BOOL v19 = v28 == a1[61];
    a4 = v26;
    goto LABEL_29;
  }
  uint64_t v13 = 5;
LABEL_46:
  a4 = v26;
  int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
LABEL_39:
  pthread_rwlock_unlock(v11);
  if (a4) {
    *a4 = a3 - v14;
  }
  return v13;
}

uint64_t sub_21DC1ECCC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 248))();
  }
  return result;
}

uint64_t sub_21DC1ECFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 264))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC1ED38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 224))();
  }
  return result;
}

uint64_t sub_21DC1ED68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 240))();
  }
  else {
    return 999;
  }
}

CFDictionaryRef sub_21DC1ED9C(uint64_t a1)
{
  __int16 valuePtr = 0;
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  uint64_t v2 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (v1 && (CFDictionaryRef Mutable = (const __CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 464))(v1)) != 0
    || (CFAllocatorRef v4 = *v2, (Mutable = CFDictionaryCreateMutable(*v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0))
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"owner-mode");
    if (Value)
    {
      int v6 = CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      CFAllocatorRef v4 = *v2;
      if (v6)
      {
        valuePtr &= 0x1C0u;
        CFNumberRef v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
        if (v7) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      CFAllocatorRef v4 = *v2;
    }
  }
  else
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!Mutable) {
      return Mutable;
    }
  }
  __int16 valuePtr = 448;
  CFNumberRef v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
  if (v7)
  {
LABEL_11:
    CFNumberRef v8 = v7;
    CFDictionarySetValue(Mutable, @"owner-mode", v7);
    CFRelease(v8);
  }
  return Mutable;
}

uint64_t sub_21DC1EF18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 184))();
  }
  return result;
}

uint64_t sub_21DC1EF48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 344))();
  }
  else {
    return 999;
  }
}

BOOL sub_21DC1EF84(_DWORD *a1)
{
  uint64_t v1 = (char *)a1 + 566;
  int v2 = a1[120];
  uint64_t v3 = 8;
  if (v2 == 1) {
    uint64_t v3 = 376;
  }
  if (*(_DWORD *)&v1[v3] != 91) {
    return 0;
  }
  CFAllocatorRef v4 = (_DWORD *)((char *)a1 + 642);
  if (v2 != 1) {
    CFAllocatorRef v4 = (_DWORD *)((char *)a1 + 566);
  }
  if (*v4 != -2147483647) {
    return 0;
  }
  BOOL v5 = v2 == 1;
  uint64_t v6 = 4;
  if (v5) {
    uint64_t v6 = 80;
  }
  return *(_DWORD *)&v1[v6] == 128;
}

uint64_t sub_21DC1EFEC(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"use-filename-for-prompt");
  uint64_t v3 = *(void *)a1;
  if (v2) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, __CFString *))(v3 + 24))(a1, @"use-filename-for-prompt");
  }
  else {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(v3 + 192))(a1);
  }
  uint64_t v5 = v4;
  int v6 = DIGetBundleRef();
  CFStringRef v7 = (const __CFString *)sub_21DC3A890(v6, (int)@"Enter password to access \"%1$@\": ", @"Enter password to access \"%1$@\": ");
  CFStringRef v8 = CFStringCreateWithFormat(0, 0, v7, v5);
  uint64_t v9 = (const char *)sub_21DC0373C(v8, 0x8000100u);
  uint64_t v10 = (char *)v9;
  if (!v9) {
    uint64_t v9 = "Enter password: ";
  }
  uint64_t v11 = sub_21DC1F1E8(v9, __s, 1024, 1);
  if (!v11)
  {
    size_t v12 = strlen(__s);
    uint64_t v11 = sub_21DC34D78(a1, (uint64_t)__s, v12) ? 0 : 80;
    if (v10) {
      free(v10);
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v11;
}

void sub_21DC1F19C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_21DC1F1E8(const char *a1, char *a2, int a3, int a4)
{
  uint64_t v6 = 22;
  if (a2 && a3 >= 2)
  {
    if (!a1) {
      a1 = "";
    }
    if (readpassphrase(a1, a2, a3, a4 ^ 1 | 2u)) {
      return 0;
    }
    uint64_t v6 = *__error();
  }
  if (a2 && v6) {
    bzero(a2, a3);
  }
  return v6;
}

const char *sub_21DC1F274()
{
  return "CEncryptedEncoding";
}

uint64_t sub_21DC1F280(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 496);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  if (result)
  {
    uint64_t v7 = 0;
    uint64_t v5 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
    uint64_t result = (*(uint64_t (**)(void))(v5 + 304))();
    if (a2)
    {
      if (!result)
      {
        if (*(_DWORD *)(a1 + 480) == 1) {
          unint64_t v6 = v7 - 1276;
        }
        else {
          unint64_t v6 = v7 - *(void *)(a1 + 504);
        }
        *a2 = v6 / *(void *)(a1 + 488) * *(void *)(a1 + 488);
      }
    }
  }
  return result;
}

void sub_21DC1F394(_DWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  int v5 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 696))(a1);
  if (v5) {
    sub_21DC1D0CC(v5, (uint64_t)"setBackingStore() failed");
  }
  int v6 = sub_21DC1F578((uint64_t)a1);
  if (v6) {
    sub_21DC1D0CC(v6, (uint64_t)"loadHeaderAndKeys() failed");
  }
  int v7 = sub_21DC1BB10();
  if (v7) {
    sub_21DC1D0CC(v7, (uint64_t)"DIEnableSecureMode() failed");
  }
  if (!a3)
  {
    if (a1[120] != 2)
    {
      CFStringRef v9 = 0;
      goto LABEL_13;
    }
LABEL_19:
    size_t v12 = "unlock with passphrase failed";
    goto LABEL_22;
  }
  CFNumberRef Value = CFDictionaryGetValue(a3, @"recovery-key");
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a3, @"passphrase");
  if (Value)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value))
    {
      size_t v12 = "recovery-key was not a CFStringRef";
      goto LABEL_22;
    }
  }
  if (!v9)
  {
    if (a1[120] != 2) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  CFTypeID v11 = CFStringGetTypeID();
  if (v11 != CFGetTypeID(v9))
  {
    size_t v12 = "passphrase was not a CFStringRef";
LABEL_22:
    sub_21DC1D0CC(80, (uint64_t)v12);
  }
LABEL_13:
  sub_21DC1D06C((uint64_t)a1, v9);
  sub_21DC1D698((uint64_t)a1);
}

uint64_t sub_21DC1F500(uint64_t a1, char *a2)
{
  uint64_t result = sub_21DC0716C(a1, a2);
  if (!result)
  {
    int v5 = *(uint64_t (**)(char *, uint64_t))(*(void *)a2 + 296);
    return v5(a2, a1 + 512);
  }
  return result;
}

uint64_t sub_21DC1F578(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  uint64_t v3 = sub_21DC1F9C0(a1);
  if (!v3)
  {
    if (*(_DWORD *)(a1 + 480) != 2) {
      return 0;
    }
    uint64_t v31 = 0;
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272))(v2);
    if (!v3)
    {
      uint64_t v4 = (unsigned int *)malloc_type_malloc(0x54uLL, 0x6F8E1257uLL);
      if (!v4) {
        goto LABEL_15;
      }
      uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(void *)v2 + 328))(v2, 72, 84, &v31, v4);
      if (v5)
      {
        uint64_t v3 = v5;
        goto LABEL_16;
      }
      unsigned int v7 = bswap32(*v4);
      if (v7 > 0x800)
      {
        uint64_t v3 = 107;
        goto LABEL_16;
      }
      uint64_t v8 = 20 * v7 + 4;
      CFStringRef v9 = (unsigned int *)malloc_type_realloc(v4, v8, 0xEDA9BDE9uLL);
      if (!v9)
      {
LABEL_15:
        uint64_t v3 = 12;
        goto LABEL_16;
      }
      uint64_t v10 = v9;
      if (v7 >= 5)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(void *)v2 + 328))(v2, 72, v8, &v31, v9);
        if (v11)
        {
LABEL_14:
          uint64_t v3 = v11;
          goto LABEL_50;
        }
      }
      sub_21DC28CD4(v10, v8);
      *(void *)(a1 + 536) = 0;
      unsigned int v12 = *v10;
      if (*v10)
      {
        int v13 = 0;
        unsigned int v12 = 0;
        unint64_t v14 = 0;
        uint64_t v15 = 1;
        do
        {
          unsigned int v16 = v10[v15];
          if (v16 == 2)
          {
            *(_DWORD *)(a1 + 536) = ++v12;
          }
          else if (v16 == 1)
          {
            *(_DWORD *)(a1 + 540) = ++v13;
          }
          ++v14;
          v15 += 5;
        }
        while (v14 < *v10);
      }
      size_t v17 = malloc_type_malloc(564 * v12, 0x1000040185CD20FuLL);
      *(void *)(a1 + 520) = v17;
      if (!v17
        || (uint64_t v18 = malloc_type_malloc(616 * *(unsigned int *)(a1 + 540), 0x10000409E51EDBFuLL),
            (*(void *)(a1 + 528) = v18) == 0))
      {
        uint64_t v3 = 12;
        goto LABEL_50;
      }
      unint64_t v19 = *v10;
      if (!v19)
      {
LABEL_41:
        if (*(_DWORD *)(a1 + 536))
        {
          uint64_t v27 = 0;
          unint64_t v28 = 0;
          do
          {
            sub_21DC34D40(*(void *)(a1 + 520) + v27);
            ++v28;
            v27 += 564;
          }
          while (v28 < *(unsigned int *)(a1 + 536));
        }
        if (!*(_DWORD *)(a1 + 540))
        {
LABEL_48:
          uint64_t v3 = 0;
          goto LABEL_50;
        }
        uint64_t v29 = 0;
        unint64_t v30 = 0;
        while (1)
        {
          uint64_t v11 = sub_21DC28D28(*(void *)(a1 + 528) + v29);
          if (v11) {
            goto LABEL_14;
          }
          ++v30;
          v29 += 616;
          if (v30 >= *(unsigned int *)(a1 + 540)) {
            goto LABEL_48;
          }
        }
      }
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      unsigned int v22 = 0;
      uint64_t v23 = v10 + 2;
      while (1)
      {
        int v24 = *((_DWORD *)v23 - 1);
        uint64_t v25 = *v23;
        uint64_t v26 = v23[1];
        if (v24 == 2) {
          break;
        }
        if (v24 == 1)
        {
          if (v26 != 616) {
            goto LABEL_51;
          }
          uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 328))(v2, v25, 616, &v31, *(void *)(a1 + 528) + 616 * v21);
          if (!v3) {
            ++v21;
          }
LABEL_38:
          if (v3) {
            goto LABEL_50;
          }
          unint64_t v19 = *v10;
        }
        uint64_t v23 = (void *)((char *)v23 + 20);
        if (++v20 >= v19) {
          goto LABEL_41;
        }
      }
      if (v26 != 564)
      {
LABEL_51:
        uint64_t v3 = 107;
LABEL_50:
        uint64_t v4 = v10;
LABEL_16:
        (*(void (**)(uint64_t, void))(*(void *)v2 + 280))(v2, 0);
        if (v4) {
          free(v4);
        }
        return v3;
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 328))(v2, v25, 564, &v31, *(void *)(a1 + 520) + 564 * v22);
      if (!v3) {
        ++v22;
      }
      goto LABEL_38;
    }
  }
  return v3;
}

uint64_t sub_21DC1F9C0(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  uint64_t v12 = 0;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 272))();
  if (!v3)
  {
    unint64_t v11 = 0;
    uint64_t v3 = (*(uint64_t (**)(uint64_t, unint64_t *))(*(void *)v2 + 296))(v2, &v11);
    if (v3)
    {
LABEL_3:
      (*(void (**)(uint64_t, void))(*(void *)v2 + 280))(v2, 0);
      return v3;
    }
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11 >= 0x4FC)
      {
        uint64_t v3 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 328))(v2, v11 - 1276, 1276, &v12, a1 + 546);
        if (v3) {
          goto LABEL_3;
        }
        if (!sub_21DC066B8(a1 + 546)
          && *(_DWORD *)(a1 + 1818) == 1701733234
          && *(_DWORD *)(a1 + 1814) == 1667527521
          && *(_DWORD *)(a1 + 1810) == 1)
        {
          uint64_t v5 = 0;
          *(_DWORD *)(a1 + 480) = 1;
          uint64_t v6 = *(unsigned int *)(a1 + 562);
          uint64_t v7 = *(void *)(a1 + 1802);
LABEL_19:
          *(void *)(a1 + 488) = v6;
          *(void *)(a1 + 496) = v7;
          *(void *)(a1 + 504) = v5;
          CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, (const void *)(a1 + 488));
          if (v8)
          {
            CFNumberRef v9 = v8;
            (*(void (**)(uint64_t, __CFString *, CFNumberRef))(*(void *)a1 + 32))(a1, @"bs-proxy-encoding-blocksize", v8);
            CFRelease(v9);
          }
          uint64_t v10 = malloc_type_malloc(32 * *(void *)(a1 + 488), 0x7CC5BB18uLL);
          *(void *)(a1 + 472) = v10;
          if (v10) {
            uint64_t v3 = 0;
          }
          else {
            uint64_t v3 = 12;
          }
          goto LABEL_3;
        }
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, uint64_t))(*(void *)v2 + 328))(v2, 0, 72, &v12, a1 + 546);
      if (v3) {
        goto LABEL_3;
      }
      uint64_t v3 = sub_21DC06788(a1 + 546);
      if (v3) {
        goto LABEL_3;
      }
      if (*(_DWORD *)(a1 + 546) != 1701733234 || *(_DWORD *)(a1 + 550) != 1667527521)
      {
        uint64_t v3 = 110;
        goto LABEL_3;
      }
      if (*(_DWORD *)(a1 + 554) == 2)
      {
        *(_DWORD *)(a1 + 480) = 2;
        uint64_t v6 = *(unsigned int *)(a1 + 598);
        uint64_t v7 = *(void *)(a1 + 602);
        uint64_t v5 = *(void *)(a1 + 610);
        goto LABEL_19;
      }
    }
    uint64_t v3 = 107;
    goto LABEL_3;
  }
  return v3;
}

uint64_t sub_21DC1FCCC(const __CFURL *a1, CFDictionaryRef theDict, unsigned int (*a3)(void, void, void, void, void, void), uint64_t a4, void *a5, void *a6)
{
  uint64_t v6 = a6;
  CFURLRef v11 = a1;
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  off_t valuePtr = 0;
  __int16 v39 = 0;
  if (a6) {
    *a6 = 0;
  }
  if (!a5) {
    return 22;
  }
  *a5 = 0;
  if (!a1) {
    return 22;
  }
  if (theDict)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"size");
    if (Value && !CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr)) {
      off_t valuePtr = 0;
    }
    CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"max-size");
    if (v13)
    {
      if (!CFNumberGetValue(v13, kCFNumberSInt64Type, &v40)) {
        goto LABEL_12;
      }
    }
  }
  if (!v40) {
LABEL_12:
  }
    uint64_t v40 = valuePtr;
  CFStringRef v14 = sub_21DC036F4(v11);
  if (!v14) {
    return 999;
  }
  uint64_t v15 = (char *)v14;
  if (sub_21DC03648(theDict, @"overwrite", 0)) {
    unlink(v15);
  }
  int v16 = sub_21DC05354(v15, 3586, 0, 438);
  if (v16 < 0)
  {
    uint64_t v17 = *__error();
    if (v17)
    {
      if (v16 != -1) {
        close(v16);
      }
      goto LABEL_50;
    }
  }
  if (theDict)
  {
    v42.f_bsize_t size = 0;
    v42.f_bsize_t size = sub_21DC12310(theDict, @"file-type", 0);
    LODWORD(v18) = sub_21DC12310(theDict, @"file-creator", 0);
    float v38 = v18;
    if (!v42.f_bsize || v18 == 0.0)
    {
      if (v42.f_bsize)
      {
        unint64_t v19 = &v42;
        unsigned int v21 = v15;
        uint64_t v20 = 0;
      }
      else
      {
        if (v18 == 0.0) {
          goto LABEL_29;
        }
        uint64_t v20 = (unsigned int *)&v38;
        unsigned int v21 = v15;
        unint64_t v19 = 0;
      }
    }
    else
    {
      unint64_t v19 = &v42;
      uint64_t v20 = (unsigned int *)&v38;
      unsigned int v21 = v15;
    }
    if ((sub_21DC2C44C(v21, &v19->f_bsize, v20) & 0x80000000) != 0)
    {
      uint64_t v17 = *__error();
      if (v17) {
        goto LABEL_69;
      }
    }
  }
LABEL_29:
  CFNumberRef v22 = sub_21DC123FC(v15, theDict);
  if (v22)
  {
    uint64_t v17 = (uint64_t)v22;
LABEL_69:
    uint64_t v26 = 0;
    goto LABEL_34;
  }
  uint64_t v23 = v40;
  int v24 = statfs(v15, &v42);
  int64_t v25 = v42.f_bavail * v42.f_bsize;
  if (v24) {
    int64_t v25 = v23;
  }
  if (v40 > v25)
  {
    uint64_t v26 = 0;
    uint64_t v17 = 28;
    goto LABEL_34;
  }
  uint64_t v37 = a4;
  sub_21DC12530(v15, (unsigned char *)&v39 + 1, &v39);
  if (v40 && HIBYTE(v39)) {
    sub_21DC22F3C(v16, v40);
  }
  uint64_t v26 = 0;
  if (a3 && valuePtr && !(_BYTE)v39)
  {
    if (sub_21DC03648(theDict, @"skip-zeroing", 0))
    {
      uint64_t v26 = 0;
    }
    else
    {
      CFURLRef v34 = v11;
      uint64_t v35 = v6;
      *(void *)&v42.f_bsize_t size = 0;
      fcntl(v16, 48, 1);
      uint64_t v26 = malloc_type_calloc(0x100000uLL, 1uLL, 0x4704EC30uLL);
      if (!v26)
      {
        uint64_t v17 = 12;
        goto LABEL_34;
      }
      float v38 = 0.0;
      int64_t v36 = a3;
      a3(1, v37, &v38, 0, 0, 0);
      lseek(v16, 0, 0);
      uint64_t v28 = valuePtr;
      time_t v29 = time(0);
      if (v28)
      {
        off_t v30 = 0;
        time_t v31 = v29 - 1;
        while (1)
        {
          size_t v32 = v28 >= 0x100000 ? 0x100000 : v28;
          ssize_t v33 = pwrite(v16, v26, v32, v30);
          if (v33 < 0)
          {
            uint64_t v17 = *__error();
            if (v17) {
              goto LABEL_34;
            }
          }
          v28 -= v33;
          if (v28 < 1) {
            break;
          }
          v30 += v33;
          if (time((time_t *)&v42) > v31)
          {
            float v38 = (float)((float)v30 * 100.0) / (float)valuePtr;
            v36(1, v37, &v38, 0, 0, 0);
            if (v36(2, v37, 0, 0, 0, 0)) {
              goto LABEL_65;
            }
            time_t v31 = *(void *)&v42.f_bsize;
          }
        }
      }
      float v38 = 100.0;
      v36(1, v37, &v38, 0, 0, 0);
      if (v36(2, v37, 0, 0, 0, 0))
      {
LABEL_65:
        uint64_t v17 = 111;
        goto LABEL_34;
      }
      float v38 = -1.0;
      v36(1, v37, &v38, 0, 0, 0);
      CFURLRef v11 = v34;
      uint64_t v6 = v35;
    }
  }
  if (sub_21DC03648(theDict, @"skip-file-size-set", 0)
    || (ftruncate(v16, valuePtr) & 0x80000000) == 0
    || (uint64_t v17 = *__error(), !v17))
  {
    close(v16);
    uint64_t v17 = sub_21DC03898(v11, (uint64_t)theDict, a5, v6);
    if (!v17) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_34:
  if (v16 != -1) {
    close(v16);
  }
LABEL_48:
  unlink(v15);
LABEL_49:
  free(v15);
  uint64_t v15 = (char *)v26;
  if (v26) {
LABEL_50:
  }
    free(v15);
  return v17;
}

uint64_t sub_21DC201E0(const __CFArray *a1, CFArrayRef theArray)
{
  int Count = CFArrayGetCount(theArray);
  CFIndex v5 = CFArrayGetCount(a1);
  uint64_t result = 0;
  if (a1 && theArray && Count > 0)
  {
    CFIndex v7 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
      if (ValueAtIndex)
      {
        v9.location = 0;
        v9.CFIndex length = v5;
        if (CFArrayContainsValue(a1, v9, ValueAtIndex)) {
          break;
        }
      }
      if (Count == ++v7) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_21DC2028C()
{
  return 0;
}

__CFDictionary *sub_21DC20294(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5)
{
  if (!a2) {
    return 0;
  }
  uint64_t v10 = (const char *)(a2 + 48);
  if (strnlen((const char *)(a2 + 48), 0x20uLL) >= 0x20)
  {
    if (*(unsigned char *)(a2 + 79)) {
      return 0;
    }
  }
  if (strnlen((const char *)(a2 + 16), 0x20uLL) >= 0x20 && *(unsigned char *)(a2 + 47)) {
    return 0;
  }
  uint64_t v11 = bswap32(*(_DWORD *)(a2 + 8)) * (unint64_t)(a4 >> 9);
  uint64_t v12 = bswap32(*(_DWORD *)(a2 + 12)) * (unint64_t)(a4 >> 9);
  if (a5)
  {
    uint64_t v13 = sub_21DC17A4C(a1);
    if (v12 + v11 > (*(uint64_t (**)(uint64_t))(*(void *)v13 + 96))(v13))
    {
      uint64_t v14 = sub_21DC17A4C(a1);
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 96))(v14) - v11;
    }
  }
  uint64_t v15 = sub_21DC205A0();
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (!v15) {
    goto LABEL_14;
  }
  CFDictionaryRef v17 = (const __CFDictionary *)v15;
  CFStringRef v18 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, 0);
  if (!v18) {
    return 0;
  }
  CFStringRef v19 = v18;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v17, v18);
  if (!Value)
  {
    CFRelease(v19);
LABEL_14:
    CFStringRef v21 = CFStringCreateWithCString(v16, v10, 0);
    if (v21) {
      goto LABEL_15;
    }
    return 0;
  }
  CFStringRef v21 = Value;
  CFRetain(Value);
  CFRelease(v19);
LABEL_15:
  CFNumberRef v22 = (const char *)(a2 + 15);
  do
    int v23 = *(unsigned __int8 *)++v22;
  while (v23 == 32);
  CFStringRef v24 = CFStringCreateWithCString(v16, v22, 0);
  if (!v24
    || CFStringCompare(v21, @"Apple_Free", 1uLL) == kCFCompareEqualTo
    || (uint64_t v27 = sub_21DC17DA4(v11, v12, a3, v21, v24, 0, v25, v26)) == 0)
  {
    if (v21) {
      CFRelease(v21);
    }
    if (v24) {
      CFRelease(v24);
    }
    return 0;
  }
  uint64_t v28 = v27;
  uint64_t v37 = 0;
  uint64_t v29 = sub_21DC17A4C(a1);
  int v30 = sub_21DC16734(v29, v11, v12, &v37);
  time_t v31 = v37;
  if (!v30 && v37)
  {
    size_t v32 = sub_21DC17DF4();
    if (v32)
    {
      ssize_t v33 = v32;
      CFDictionarySetValue(v28, @"partition-filesystems", v32);
      CFRelease(v33);
    }
    time_t v31 = v37;
  }
  if (v31) {
    DIDiskImageObjectRelease(v31);
  }
  if (*(_DWORD *)(a2 + 508))
  {
    CFStringRef v34 = CFStringCreateWithFormat(v16, 0, @"%4.4s", a2 + 508);
    CFDictionarySetValue(v28, @"toast-signature", v34);
    CFRelease(v34);
  }
  if (*(_DWORD *)(a2 + 296))
  {
    CFStringRef v35 = CFStringCreateWithFormat(v16, 0, @"%4.4s", a2 + 296);
    CFDictionarySetValue(v28, @"drive-setup-signature", v35);
    CFRelease(v35);
  }
  CFRelease(v21);
  CFRelease(v24);
  return v28;
}

uint64_t sub_21DC205A0()
{
  uint64_t result = qword_267D202D8;
  if (!qword_267D202D8)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n</dict>\n</plist>\n", 188);
    if (v2)
    {
      CFDataRef v3 = v2;
      qword_267D202D8 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0, 0, 0);
      CFRelease(v3);
    }
    return qword_267D202D8;
  }
  return result;
}

__CFString *sub_21DC20620()
{
  return @"Apple";
}

UInt8 *sub_21DC20630(int *a1)
{
  CFDataRef v2 = (UInt8 *)qword_267D202E8;
  if (qword_267D202E8
    || (uint64_t result = (UInt8 *)malloc_type_malloc(0x50uLL, 0x959BD508uLL),
        CFDataRef v2 = result,
        (qword_267D202E8 = (uint64_t)result) != 0))
  {
    return sub_21DC206A0(a1, 0, v2, 80);
  }
  return result;
}

UInt8 *sub_21DC206A0(int *a1, char a2, UInt8 *a3, int a4)
{
  uint64_t v6 = sub_21DC20744(a1, a2);
  if (!v6) {
    return 0;
  }
  CFIndex v7 = v6;
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v6, 0x8000100u, 0x3Fu);
  CFRelease(v7);
  if (!ExternalRepresentation) {
    return 0;
  }
  CFIndex Length = CFDataGetLength(ExternalRepresentation);
  if (Length >= a4) {
    CFIndex v10 = a4 - 1;
  }
  else {
    CFIndex v10 = Length;
  }
  v12.location = 0;
  v12.CFIndex length = v10;
  CFDataGetBytes(ExternalRepresentation, v12, a3);
  a3[v10] = 0;
  CFRelease(ExternalRepresentation);
  return a3;
}

__CFString *sub_21DC20744(int *a1, char a2)
{
  CFDataRef v3 = a1;
  if (a1 == -1 && (a2 & 1) == 0) {
    LODWORD(a1) = *__error();
  }
  if (a1 >= 0x6B)
  {
    if ((a2 & 2) == 0)
    {
      uint64_t v9 = 0;
      int v10 = -19;
      do
      {
        if (a1 == v10)
        {
          a1 = (int *)((char *)&unk_21DC4200C + v9 + 4);
          goto LABEL_25;
        }
        int v10 = *(_DWORD *)((char *)&unk_21DC4200C + v9 + 8);
        v9 += 8;
      }
      while (v9 != 192);
      if ((a1 & 0x80000000) != 0 && *__error() && *__error() != 2 && *__error() != 1)
      {
        a1 = __error();
LABEL_25:
        LODWORD(a1) = *a1;
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v4 = strerror((int)a1);
    CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
    if (v5)
    {
      CFStringRef v6 = v5;
      CFTypeRef v7 = CFRetain(v5);
      CFRelease(v6);
      return (__CFString *)v7;
    }
  }
  if ((a2 & 4) != 0) {
    return 0;
  }
  if ((int)v3 >= -100000000) {
    uint64_t v11 = @"error %1$d";
  }
  else {
    uint64_t v11 = @"error %1$#x";
  }
  CFStringRef v12 = (const __CFString *)CFRetain(v11);
  CFStringRef v13 = CFStringCreateWithFormat(0, 0, v12, v3);
  CFRelease(v12);
  if (v13) {
    return (__CFString *)v13;
  }
  else {
    return &stru_26CE87FA8;
  }
}

uint64_t sub_21DC208B4()
{
  return 0;
}

uint64_t sub_21DC208BC()
{
  return 0;
}

uint64_t sub_21DC208C4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (a3)
  {
    *a3 = 0;
    if (a1) {
      operator new();
    }
  }
  return 22;
}

void sub_21DC20998(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40B7E68147);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC209BC(uint64_t a1)
{
  uint64_t v2 = sub_21DC08428(a1);
  *(void *)uint64_t v2 = &unk_26CE85388;
  *(void *)(v2 + 160) = 0;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 168), 0);
  (*(void (**)(uint64_t, __CFString *, void))(*(void *)a1 + 32))(a1, @"thread-safe", *MEMORY[0x263EFFB40]);
  return a1;
}

void sub_21DC20A4C(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

void sub_21DC20A64()
{
}

uint64_t sub_21DC20D94(void *a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  (*(void (**)(void *))(*a1 + 128))(a1);
  unint64_t v2 = a1[14];
  uint64_t result = sub_21DC07BA0(a1[3], (uint64_t)v37, 64);
  if (result) {
    return result;
  }
  if (!sub_21DC30930((uint64_t)v37)) {
    return 107;
  }
  int v4 = v38;
  if ((v38 - 1) >= 2)
  {
    if (v38 == 3)
    {
      a1[5] = v41;
      *((_DWORD *)a1 + 12) = v39;
      *((_DWORD *)a1 + 22) = 3;
      goto LABEL_9;
    }
  }
  else
  {
    a1[5] = v40;
  }
  *((_DWORD *)a1 + 12) = v39;
  *((_DWORD *)a1 + 22) = v4;
  if (v4 == 1)
  {
    unint64_t v5 = 512;
    goto LABEL_11;
  }
  if (v4 == 2)
  {
LABEL_9:
    unint64_t v5 = 4096;
LABEL_11:
    a1[8] = v5;
    goto LABEL_13;
  }
  unint64_t v5 = a1[8];
LABEL_13:
  *(int32x2_t *)((char *)a1 + 52) = vshrn_n_s64(vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_21DC41D70), 2uLL);
  size_t v6 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
  CFTypeRef v7 = malloc_type_malloc(v6, 0x65507881uLL);
  a1[9] = v7;
  if (!v7) {
    return 12;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = a1[3];
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
  uint64_t result = sub_21DC07BA0(v9, v8, v10);
  if (!result)
  {
    uint64_t v11 = a1[9];
    int v12 = *(_DWORD *)(v11 + 12);
    *(_DWORD *)(v11 + 12) = v12 & 0xFFFFFFFE;
    if (*(_DWORD *)(v11 + 4) == 2)
    {
      *(_DWORD *)(v11 + 4) = 3;
      *(void *)(v11 + 28) = *(unsigned int *)(v11 + 16);
      *(_DWORD *)(v11 + 12) = v12 | 1;
    }
    uint64_t v13 = *(void *)(v11 + 20);
    if (v13)
    {
      uint64_t v14 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
      uint64_t v15 = (*(unsigned int (**)(void *))(*a1 + 88))(a1);
      uint64_t v16 = v14 + ((v15 * (*(uint64_t (**)(void *))(*a1 + 64))(a1)) << 9);
      if ((*(uint64_t (**)(void *))(*a1 + 80))(a1) + v13 <= v2 && v13 == v16)
      {
        while (1)
        {
          size_t v17 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
          CFStringRef v18 = (void *)a1[10];
          if (v18)
          {
            CFStringRef v19 = (char *)malloc_type_realloc(v18, v17 * (*((_DWORD *)a1 + 8) + 1), 0xA091F3E4uLL);
            if (!v19) {
              return 12;
            }
            uint64_t v20 = v19;
            a1[10] = v19;
          }
          else
          {
            uint64_t v20 = (char *)malloc_type_malloc(v17, 0xF7285F5DuLL);
            a1[10] = v20;
            if (!v20)
            {
              *((_DWORD *)a1 + 8) = 0;
              return 12;
            }
          }
          uint64_t v21 = *((unsigned int *)a1 + 8);
          *((_DWORD *)a1 + 8) = v21 + 1;
          if (v21 == -1) {
            CFNumberRef v22 = 0;
          }
          else {
            CFNumberRef v22 = &v20[(*(uint64_t (**)(void *))(*a1 + 80))(a1) * v21];
          }
          bzero(v22, v17);
          uint64_t result = sub_21DC309C0((void **)a1, v13, (uint64_t)v22);
          if (result) {
            return result;
          }
          if (*(_DWORD *)v22 != 1936749171) {
            break;
          }
          *((_DWORD *)v22 + 2) &= ~1u;
          uint64_t v23 = *(void *)(v22 + 12);
          if (!v23) {
            return 0;
          }
          uint64_t v24 = (*(uint64_t (**)(void *))(*a1 + 80))(a1) + v13;
          uint64_t v25 = (*(unsigned int (**)(void *))(*a1 + 96))(a1);
          uint64_t v26 = v24 + ((v25 * (*(uint64_t (**)(void *))(*a1 + 64))(a1)) << 9);
          BOOL v27 = (*(uint64_t (**)(void *))(*a1 + 80))(a1) + v23 <= v2 && v23 == v26;
          uint64_t v13 = v23;
          if (!v27)
          {
            uint64_t v28 = v22 + 12;
            sub_21DC3098C("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node's i-node link is out of bounds.\x1B[0m", *((_DWORD *)a1 + 8));
            sub_21DC30AAC((uint64_t)a1, (uint64_t)v22, 0);
            int v29 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
            sub_21DC3098C("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v23, v29, v2);
            sub_21DC3098C("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v23, v26);
            sub_21DC3098C("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
            *((_DWORD *)v22 + 2) |= 1u;
            goto LABEL_37;
          }
        }
        sub_21DC3098C("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node is invalid.\x1B[0m", *((_DWORD *)a1 + 8));
        sub_21DC30AAC((uint64_t)a1, (uint64_t)v22, 0);
        int v32 = *((_DWORD *)a1 + 8) - 1;
        *((_DWORD *)a1 + 8) = v32;
        if (v32)
        {
          sub_21DC3098C("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
          ssize_t v33 = (char *)malloc_type_realloc((void *)a1[10], v17 * *((unsigned int *)a1 + 8), 0x26B9AB4DuLL);
          a1[10] = v33;
          uint64_t v34 = (*((_DWORD *)a1 + 8) - 1);
          CFStringRef v35 = &v33[(*(uint64_t (**)(void *))(*a1 + 80))(a1) * v34];
          *((_DWORD *)v35 + 2) |= 1u;
          uint64_t v28 = v35 + 12;
          goto LABEL_37;
        }
        sub_21DC3098C("\x1B[33mremoving h-node's i-node link.\x1B[0m");
        int64_t v36 = (void *)a1[10];
        if (v36)
        {
          free(v36);
          a1[10] = 0;
        }
      }
      else
      {
        sub_21DC3098C("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: h-node's i-node link is invalid.\x1B[0m");
        int v30 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
        sub_21DC3098C("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v13, v30, v2);
        sub_21DC3098C("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v13, v16);
        sub_21DC3098C("\x1B[33mremoving h-node's i-node link.\x1B[0m");
      }
      uint64_t v31 = a1[9];
      *(_DWORD *)(v31 + 12) |= 1u;
      uint64_t v28 = (void *)(v31 + 20);
LABEL_37:
      *uint64_t v28 = 0;
      *((unsigned char *)a1 + 105) = 1;
      if (!*((unsigned char *)a1 + 104) || (*(unsigned int (**)(void *))(*a1 + 120))(a1)) {
        *((unsigned char *)a1 + 106) = 0;
      }
      (*(void (**)(void, uint64_t))(*(void *)a1[3] + 472))(a1[3], 1);
    }
    return 0;
  }
  return result;
}

void sub_21DC2147C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 72);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 72) = 0;
  }
  CFDataRef v3 = *(void **)(a1 + 80);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 80) = 0;
  }
  *(_DWORD *)(a1 + 32) = 0;
}

uint64_t sub_21DC214C0(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t sub_21DC214C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  unint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 8) = 0;
  }
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  *(_DWORD *)(a1 + 16) = v6 / (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  unsigned int v9 = *(_DWORD *)(a1 + 16);
  if (v7 % v8) {
    *(_DWORD *)(a1 + 16) = ++v9;
  }
  uint64_t v10 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  *(void *)(a1 + 8) = v10;
  if (!v10) {
    return 12;
  }
  uint64_t v11 = v3 << 9;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
  {
    uint64_t v13 = 16;
    while (1)
    {
      uint64_t v14 = *(void *)(a1 + 72);
      unsigned int v15 = *(_DWORD *)(v14 + 4 * v13);
      if (v15 != -1)
      {
        if (!v15 && *(void *)(v14 + 20))
        {
          sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: h-node has no more bands but i-node link is non-zero.\x1B[0m");
          sub_21DC3098C("\x1B[33mzeroing i-node link.\x1B[0m");
          uint64_t v35 = *(void *)(a1 + 72);
          uint64_t v34 = *(void **)(a1 + 80);
          *(void *)(v35 + 20) = 0;
          *(_DWORD *)(v35 + 12) |= 1u;
          *(_DWORD *)(a1 + 32) = 0;
          if (v34)
          {
            free(v34);
            *(void *)(a1 + 80) = 0;
          }
          goto LABEL_57;
        }
        unsigned int v16 = *(_DWORD *)(a1 + 16);
        if (v15 <= v16)
        {
          if (!v15) {
            goto LABEL_57;
          }
          uint64_t v18 = v4 + v11;
          if (v4 + v11 > v2) {
            goto LABEL_52;
          }
          uint64_t v19 = *(void *)(a1 + 8);
          if (v19 && *(void *)(v19 + 8 * (v15 - 1)))
          {
            sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m", v13 - 16, v15);
            sub_21DC3098C("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
            uint64_t v20 = *(void *)(a1 + 72);
            *(_DWORD *)(v20 + 4 * v13) = -1;
            *(_DWORD *)(v20 + 12) |= 1u;
          }
          else
          {
            uint64_t v21 = *(void *)(a1 + 8);
            if (!v21 || *(_DWORD *)(a1 + 16) < v15) {
              return 999;
            }
            *(void *)(v21 + 8 * (v15 - 1)) = v12;
          }
          goto LABEL_23;
        }
        sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m", v13 - 16, v15, v16);
        sub_21DC3098C("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
        uint64_t v17 = *(void *)(a1 + 72);
        *(_DWORD *)(v17 + 4 * v13) = -1;
        *(_DWORD *)(v17 + 12) |= 1u;
      }
      uint64_t v18 = v4 + v11;
      if (v4 + v11 > v2)
      {
        unsigned int v15 = -1;
LABEL_52:
        sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) ending offset %qd is too large (should be <= %qd).\x1B[0m", v13 - 16, v15, v18, v2);
        sub_21DC3098C("\x1B[33mmarking %u-th slot unused.\x1B[0m", v13 - 16);
        uint64_t v33 = *(void *)(a1 + 72);
        *(_DWORD *)(v33 + 4 * v13) = 0;
        *(_DWORD *)(v33 + 12) |= 1u;
        goto LABEL_57;
      }
LABEL_23:
      v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1) << 9;
      unsigned int v22 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
      unint64_t v23 = v13 - 15;
      ++v13;
      uint64_t v4 = v18;
      if (v23 >= v22) {
        goto LABEL_26;
      }
    }
  }
  uint64_t v18 = v4;
LABEL_26:
  if (!*(_DWORD *)(a1 + 32)) {
    goto LABEL_56;
  }
  uint64_t v24 = 0;
  uint64_t v4 = v18;
  while (1)
  {
    uint64_t v25 = *(void *)(a1 + 80);
    uint64_t v26 = v25 ? v25 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v24 : 0;
    v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    v4 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    uint64_t v40 = v24;
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1)) {
      break;
    }
LABEL_49:
    ++v24;
    if (v40 + 1 >= (unint64_t)*(unsigned int *)(a1 + 32)) {
      goto LABEL_57;
    }
  }
  uint64_t v27 = 0;
  uint64_t v28 = v26 + 56;
  while (1)
  {
    uint64_t v18 = v4;
    unsigned int v29 = *(_DWORD *)(v28 + 4 * v27);
    if (v29 == -1) {
      goto LABEL_39;
    }
    if (!v29) {
      break;
    }
    unsigned int v30 = *(_DWORD *)(a1 + 16);
    if (v29 > v30)
    {
      sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m", v24, v27, *(_DWORD *)(v28 + 4 * v27), v30);
      sub_21DC3098C("\x1B[33msparing %u-th slot.\x1B[0m", v27);
      unsigned int v29 = -1;
      *(_DWORD *)(v28 + 4 * v27) = -1;
      *(_DWORD *)(v26 + 8) |= 1u;
    }
LABEL_39:
    v4 += v11;
    if (v18 + v11 > v2)
    {
      sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) ending offset %qd is too large (should be <= %qd).\x1B[0m", v24, v27, v29, v18 + v11, v2);
      sub_21DC3098C("\x1B[33mmarking %u-th slot unused.\x1B[0m", v27);
      *(_DWORD *)(v26 + 4 * v27 + 56) = 0;
      *(_DWORD *)(v26 + 8) |= 1u;
      goto LABEL_56;
    }
    if (v29 != -1)
    {
      uint64_t v31 = *(void *)(a1 + 8);
      if (v31 && *(_DWORD *)(a1 + 16) >= v29 && *(void *)(v31 + 8 * (v29 - 1)))
      {
        sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m", v24, v27, v29);
        sub_21DC3098C("\x1B[33msparing %u-th slot.\x1B[0m", v27);
        *(_DWORD *)(v28 + 4 * v27) = -1;
        *(_DWORD *)(v26 + 8) |= 1u;
      }
      else
      {
        uint64_t v32 = *(void *)(a1 + 8);
        if (!v32 || *(_DWORD *)(a1 + 16) < v29) {
          return 999;
        }
        *(void *)(v32 + 8 * (v29 - 1)) = v12;
      }
    }
    v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1) << 9;
    if (++v27 >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1)) {
      goto LABEL_49;
    }
  }
  if (*(void *)(v26 + 12))
  {
    sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: #%u i-node has no more bands but i-node link is non-zero.\x1B[0m", v24);
    sub_21DC3098C("\x1B[33mzeroing i-node link.\x1B[0m");
    *(void *)(v26 + 12) = 0;
    *(_DWORD *)(v26 + 8) |= 1u;
    *(_DWORD *)(a1 + 32) = v24 + 1;
    int64_t v36 = *(void **)(a1 + 80);
    uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    *(void *)(a1 + 80) = malloc_type_realloc(v36, v37 * *(unsigned int *)(a1 + 32), 0xF437BC1FuLL);
  }
LABEL_56:
  uint64_t v4 = v18;
LABEL_57:
  if (v2 == v4) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 104))
  {
    sub_21DC3098C("\x1B[33mCSparseFile::generateSparseTable: expected EOF %qd, actual EOF %qd.\x1B[0m", v4, v2);
    uint64_t v39 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 312))();
    if (v39)
    {
      *(unsigned char *)(a1 + 106) = 0;
      DIStrError(v39);
      sub_21DC3098C("\x1B[31m\x1B[1madjusting EOF failed (%d - %s).\x1B[0m");
    }
    else
    {
      *(void *)(a1 + 112) = v4;
      *(void *)(a1 + 120) = v4;
      sub_21DC3098C("\x1B[33mEOF was adjusted.\x1B[0m");
    }
  }
  else
  {
    *(unsigned char *)(a1 + 106) = 0;
  }
  (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
  *(unsigned char *)(a1 + 105) = 1;
  if (!*(unsigned char *)(a1 + 104)
    || (uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1), result))
  {
    uint64_t result = 0;
    *(unsigned char *)(a1 + 106) = 0;
  }
  return result;
}

uint64_t sub_21DC21CAC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_21DC21CB4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_21DC21CBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64))();
}

uint64_t sub_21DC21CE4()
{
  return 1;
}

__CFString *sub_21DC21CEC()
{
  return @"sparse disk image";
}

uint64_t sub_21DC21CF8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 160);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t sub_21DC21D28(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_21DC21D30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char *a5)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  char v21 = 0;
  uint64_t v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_24:
    uint64_t v14 = 0;
    uint64_t v19 = 22;
    goto LABEL_20;
  }
  uint64_t v11 = *(void *)(a1 + 160);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48))(v11);
    if (v12 < a2 || a3 + a2 > v12) {
      goto LABEL_24;
    }
    if (a3)
    {
      uint64_t v14 = 0;
      unint64_t v15 = a3 << 9;
      while (1)
      {
        uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24))(*(void *)(a1 + 160), a2, a3, &v23, &v21);
        if (v16)
        {
LABEL_18:
          uint64_t v19 = v16;
          goto LABEL_20;
        }
        uint64_t v17 = v23;
        uint64_t v18 = v23 << 9;
        if (v23 << 9 > v15) {
          break;
        }
        if (v21)
        {
          uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 32))(*(void *)(a1 + 160), a2, v23, &v22, a5);
          if (v16) {
            goto LABEL_18;
          }
          uint64_t v17 = v22;
          uint64_t v18 = v22 << 9;
        }
        else
        {
          bzero(a5, v23 << 9);
          uint64_t v22 = v17;
        }
        a5 += v18;
        a2 += v17;
        v14 += v17;
        a3 -= v17;
        if (!a3)
        {
          uint64_t v19 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v19 = 29;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v19 = 999;
  }
LABEL_20:
  if (a4) {
    *a4 = v14;
  }
  pthread_rwlock_unlock(v10);
  return v19;
}

uint64_t sub_21DC21EF4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  unsigned int v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136))(a1);
  uint64_t v11 = *(void *)(a1 + 8);
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || *(_DWORD *)(a1 + 16) < v10 || (uint64_t v13 = *(void *)(v11 + 8 * (v10 - 1))) == 0)
  {
    *a5 = 0;
    uint64_t v15 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144))(a1, v10 + 1) - a2;
  }
  else
  {
    *a5 = 1;
    uint64_t v14 = v10 + 1;
    do
    {
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144))(a1, v14) - a2;
      if (v15 >= a3) {
        break;
      }
      if (!v14) {
        break;
      }
      uint64_t v16 = *(void *)(a1 + 8);
      if (!v16) {
        break;
      }
      if (*(_DWORD *)(a1 + 16) < v14) {
        break;
      }
      uint64_t v17 = *(void *)(v16 + 8 * (v14 - 1));
      if (!v17) {
        break;
      }
      uint64_t v18 = v13 + ((unint64_t)*(unsigned int *)(a1 + 48) << 9);
      uint64_t v14 = (v14 + 1);
      uint64_t v13 = v17;
    }
    while (v17 == v18);
  }
  if (v15 >= a3) {
    uint64_t v15 = a3;
  }
  *a4 = v15;
  return 0;
}

uint64_t sub_21DC22048(uint64_t a1, uint64_t a2)
{
  return (a2 / (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1)) + 1;
}

uint64_t sub_21DC22094(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1) * (a2 - 1);
}

uint64_t sub_21DC220DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a4) {
    return 22;
  }
  *a4 = 0;
  if (!a5) {
    return 22;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136))(a1);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144))(a1, (v10 + 1)) - a2;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144))(a1, v10);
  if (v11 < a3) {
    a3 = v11;
  }
  uint64_t v13 = *(void *)(a1 + 8);
  if (!v10 || v13 == 0) {
    return 22;
  }
  if (*(_DWORD *)(a1 + 16) < v10) {
    return 22;
  }
  uint64_t v17 = 0;
  uint64_t v15 = *(void *)(v13 + 8 * (v10 - 1));
  if (!v15) {
    return 22;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t))(**(void **)(a1 + 24) + 328))(*(void *)(a1 + 24), v15 + ((a2 - v12) << 9), a3 << 9, &v17, a5);
  if (!result) {
    *a4 = a3;
  }
  return result;
}

void sub_21DC22250(uint64_t a1)
{
  sub_21DC222BC(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC22298(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40B7E68147);
  _Unwind_Resume(a1);
}

void *sub_21DC222BC(uint64_t a1)
{
  *(void *)a1 = &unk_26CE85388;
  uint64_t v2 = *(void *)(a1 + 160);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *(void *)(a1 + 160) = 0;
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 168));
  return sub_21DC114A4((void *)a1);
}

void sub_21DC22344(_Unwind_Exception *a1)
{
  sub_21DC114A4(v1);
  _Unwind_Resume(a1);
}

void sub_21DC2235C(uint64_t a1)
{
  sub_21DC223C8(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC223A4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C40B0449CAELL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC223C8(uint64_t a1)
{
  *(void *)a1 = &unk_26CE855F0;
  sub_21DC224AC(a1);
  if (*(void *)(a1 + 24))
  {
    sub_21DC226D0(a1);
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 128))(a1);
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 8) = 0;
  }
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = *(void **)(a1 + 96);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v4 = *(char **)(a1 + 24);
  if (v4)
  {
    DIDiskImageObjectRelease(v4);
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_21DC224AC(uint64_t a1)
{
  uint64_t v2 = sub_21DC22544((void *)a1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (const char *)DIStrError(v2);
    sub_21DC3098C("\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating header node failed (%d - %s).\x1B[0m", v3, v4);
  }
  else
  {
    uint64_t v5 = sub_21DC225D8(a1);
    uint64_t v3 = v5;
    if (v5)
    {
      if (*(_DWORD *)(a1 + 32) <= 1u) {
        uint64_t v6 = "node";
      }
      else {
        uint64_t v6 = "nodes";
      }
      uint64_t v7 = (const char *)DIStrError(v5);
      sub_21DC3098C("\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating index %s failed (%d - %s).\x1B[0m", v6, v3, v7);
    }
  }
  return v3;
}

uint64_t sub_21DC22544(void *a1)
{
  uint64_t v1 = (unsigned char *)a1[9];
  if (!v1) {
    return 22;
  }
  if ((v1[12] & 1) == 0) {
    return 0;
  }
  uint64_t v3 = a1[3];
  size_t v4 = (*(uint64_t (**)(void *))(*a1 + 80))(a1);
  uint64_t result = sub_21DC23A00(v3, v1, v4);
  if (!result) {
    *(_DWORD *)(a1[9] + 12) &= ~1u;
  }
  return result;
}

uint64_t sub_21DC225D8(uint64_t a1)
{
  if (!*(void *)(a1 + 80)) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 80))(a1);
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = (uint64_t *)(*(void *)(a1 + 72) + 20);
  while (1)
  {
    uint64_t v4 = *v3;
    if (!*v3) {
      break;
    }
    uint64_t v5 = *(void *)(a1 + 80);
    if (!v5) {
      break;
    }
    uint64_t v6 = (_DWORD *)(v5 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v2);
    if (v6[2])
    {
      uint64_t result = sub_21DC30C3C((void **)a1, v4, v6);
      if (result) {
        return result;
      }
      v6[2] &= ~1u;
    }
    uint64_t v3 = (uint64_t *)(v6 + 3);
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 32)) {
      return 0;
    }
  }
  return 22;
}

uint64_t sub_21DC226D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112);
  if (!v1 || v1 == *(void *)(a1 + 120)) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 312))(*(void *)(a1 + 24));
  if (!result) {
    *(void *)(a1 + 120) = *(void *)(a1 + 112);
  }
  return result;
}

void *sub_21DC22748(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_21DC17304(a1, a2);
  *uint64_t result = &unk_26CE87010;
  return result;
}

__CFArray *sub_21DC2277C(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  uint64_t v9 = sub_21DC17A4C(a1);
  uint64_t v10 = (const void *)*MEMORY[0x263EFFB38];
  if (a4) {
    *a4 = 0;
  }
  uint64_t v11 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  (*(void (**)(uint64_t))(*(void *)v9 + 96))(v9);
  uint64_t v12 = sub_21DC17DF4();
  CFDictionaryRef v13 = v12;
  uint64_t v27 = a2;
  if (!v12) {
    goto LABEL_24;
  }
  if (!CFDictionaryGetValue(v12, @"APFS"))
  {
    if (CFDictionaryGetValue(v13, @"HFS+"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x263EFFB40];
      uint64_t v14 = @"Apple_HFS";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"HFSX"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x263EFFB40];
      uint64_t v14 = @"Apple_HFSX";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"UDF"))
    {
      uint64_t v15 = (const void *)*MEMORY[0x263EFFB40];
      uint64_t v14 = @"UDF";
      goto LABEL_26;
    }
    if (CFDictionaryGetValue(v13, @"UFS"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x263EFFB40];
      uint64_t v14 = @"Apple_UFS";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"ProDOS"))
    {
      uint64_t v14 = @"Apple_ProDOS";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"NTFS"))
    {
      uint64_t v14 = @"Windows_NTFS";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"FAT12"))
    {
      uint64_t v14 = @"DOS_FAT_12";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"FAT16"))
    {
      uint64_t v14 = @"DOS_FAT_16";
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, @"FAT32"))
    {
      uint64_t v14 = @"DOS_FAT_32";
      goto LABEL_25;
    }
LABEL_24:
    int v16 = DIGetBundleRef();
    uint64_t v14 = (__CFString *)sub_21DC3A890(v16, (int)@"unknown partition", @"unknown partition");
    goto LABEL_25;
  }
  uint64_t v14 = @"Apple_APFS";
LABEL_25:
  uint64_t v15 = v10;
LABEL_26:
  int v17 = DIGetBundleRef();
  CFTypeRef v18 = sub_21DC3A890(v17, (int)@"whole disk", @"whole disk");
  uint64_t v19 = sub_21DC17A4C(a1);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 96))(v19);
  uint64_t v23 = sub_21DC17DA4(0, v20, 0, v14, v18, 0, v21, v22);
  if (v23)
  {
    uint64_t v24 = v23;
    if (v13)
    {
      CFDictionarySetValue(v23, @"partition-filesystems", v13);
      CFRelease(v13);
    }
    CFArrayAppendValue(Mutable, v24);
    CFRelease(v24);
    __int16 valuePtr = 512;
    CFNumberRef v25 = CFNumberCreate(v7, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(v11, @"block-size", v25);
    CFRelease(v25);
    CFDictionarySetValue(v11, @"burnable", v15);
    CFDictionarySetValue(v11, @"appendable", v10);
    if (a4) {
      *a4 = v11;
    }
    else {
      CFRelease(v11);
    }
    ++*v27;
    if (v18) {
      CFRelease(v18);
    }
    if (v14) {
      CFRelease(v14);
    }
  }
  else
  {
    if (v18) {
      CFRelease(v18);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v11) {
      CFRelease(v11);
    }
    return 0;
  }
  return Mutable;
}

__CFString *sub_21DC22B7C()
{
  return @"none";
}

void sub_21DC22B88(void *a1)
{
  sub_21DC19324(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC22BD0(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC22BF4(const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, void *a5, CFTypeRef *a6)
{
  value = 0;
  CFNumberRef v25 = 0;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v12 = 22;
  if (!a1 || !theDict || !a5) {
    return v12;
  }
  if (!CFDictionaryGetValue(theDict, @"hybrid-image-source-array"))
  {
    uint64_t v26 = 0;
    uint64_t valuePtr = 0;
    if (!CFDictionaryGetValueIfPresent(theDict, @"blockcount", (const void **)&value))
    {
      CFArrayRef MutableCopy = 0;
      CFNumberRef v22 = 0;
      CFURLRef v19 = 0;
      goto LABEL_27;
    }
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &valuePtr);
    value = 0;
    CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
    if (v14
      && (v15 = v14, CFTypeID v16 = CFGetTypeID(v14), v16 == CFStringGetTypeID())
      && CFEqual(v15, @"UDTO"))
    {
      int v17 = 0;
      CFStringRef v18 = @"cdr";
    }
    else
    {
      int v17 = 1;
      CFStringRef v18 = @"dmg";
    }
    CFURLRef v19 = sub_21DC11B50(a1, v18, 0);
    if (v19)
    {
      CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFArrayRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theDict);
      if (MutableCopy)
      {
        uint64_t v26 = valuePtr << 9;
        CFNumberRef v22 = CFNumberCreate(v20, kCFNumberSInt64Type, &v26);
        CFDictionaryRemoveValue(MutableCopy, @"diskimage-class");
        CFDictionarySetValue(MutableCopy, @"writeable", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionarySetValue(MutableCopy, @"size", v22);
        if (v17)
        {
          CFDictionaryAddValue(MutableCopy, @"file-type", @"devr");
          CFDictionaryAddValue(MutableCopy, @"file-creator", @"ddsk");
        }
        uint64_t v23 = sub_21DC11CBC((uint64_t)v19, (uint64_t)MutableCopy, 7u, a3, a4, &v25, a6);
        if (v23)
        {
          uint64_t v12 = v23;
LABEL_27:
          if (!v25)
          {
LABEL_31:
            if (MutableCopy) {
              CFRelease(MutableCopy);
            }
            if (v22) {
              CFRelease(v22);
            }
            if (v19) {
              CFRelease(v19);
            }
            return v12;
          }
          (*(void (**)(char *))(*(void *)v25 + 416))(v25);
LABEL_29:
          if (v25)
          {
            DIDiskImageObjectRelease(v25);
            CFNumberRef v25 = 0;
          }
          goto LABEL_31;
        }
        CFRelease(MutableCopy);
        uint64_t v24 = CFDictionaryCreateMutableCopy(v20, 0, theDict);
        CFArrayRef MutableCopy = v24;
        if (v24)
        {
          CFDictionarySetValue(v24, @"diskimage-class", @"CRawDiskImage");
          uint64_t v12 = sub_21DC1BCFC((uint64_t)v25, (uint64_t)MutableCopy, a5, a6);
          if (!v12) {
            goto LABEL_29;
          }
          goto LABEL_27;
        }
LABEL_26:
        uint64_t v12 = 999;
        goto LABEL_27;
      }
    }
    else
    {
      CFArrayRef MutableCopy = 0;
    }
    CFNumberRef v22 = 0;
    goto LABEL_26;
  }
  return sub_21DC3A880();
}

uint64_t sub_21DC22F3C(int a1, uint64_t a2)
{
  v3[0] = 0x300000000;
  v3[1] = 0;
  v3[2] = a2;
  v3[3] = 0;
  if (fcntl(a1, 42, v3) < 0) {
    return *__error();
  }
  else {
    return 0;
  }
}

BOOL sub_21DC22F8C(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (a2) {
    *a2 = 0;
  }
  int MKMediaRef = DIMediaKitCreateMKMediaRef(a1, 0, 0, (uint64_t *)&cf);
  if (!MKMediaRef)
  {
    MKDetectISO();
    int MKMediaRef = -5343;
  }
  if (cf) {
    CFRelease(cf);
  }
  return MKMediaRef == 0;
}

uint64_t sub_21DC23078(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
  if (a4) {
    *a4 = 0;
  }
  if (!v10) {
    return 999;
  }
  uint64_t v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11) {
    return 22;
  }
  unint64_t v15 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(void *)v10 + 336))(v10, a2 << 9, a3 << 9, &v15, a5);
  if (result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = a4 == 0;
  }
  if (!v14)
  {
    uint64_t result = 0;
    *a4 = v15 >> 9;
  }
  return result;
}

uint64_t sub_21DC23178(uint64_t a1, off_t a2)
{
  if (ftruncate(*(_DWORD *)(a1 + 320), a2) < 0) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC231A8(uint64_t a1, uint64_t a2, int64_t size, uint64_t a4, char *a5)
{
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = (char *)malloc_type_malloc(size, 0xCC202748uLL);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  if (sub_21DC18BE4(a1, a2, (a4 * size) >> 9, (unint64_t)size >> 9, v10)) {
    goto LABEL_8;
  }
  if (*(_WORD *)v11 != 2) {
    goto LABEL_8;
  }
  char v13 = 0;
  v12.i32[0] = *(_DWORD *)v11;
  char v14 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12)));
  uint64_t v15 = 5;
  do
    v13 += v11[v15++];
  while (v15 != 16);
  if (v11[4] != (v13 + v14)) {
    goto LABEL_8;
  }
  int64_t v16 = *((unsigned int *)v11 + 4);
  if (v16 < size) {
    goto LABEL_8;
  }
  unsigned int v19 = *((_DWORD *)v11 + 5);
  unsigned int v20 = v16 - size;
  while (1)
  {
    if (sub_21DC18BE4(a1, a2, ((unint64_t)v19 * size) >> 9, (unint64_t)size >> 9, v11)) {
      goto LABEL_8;
    }
    if (*(_WORD *)v11 == 1) {
      break;
    }
    uint64_t v17 = 0;
    ++v19;
    int64_t v21 = v20;
    v20 -= size;
    if (v21 < size) {
      goto LABEL_9;
    }
  }
  if (v11[55])
  {
    int v22 = v11[55] - 1;
  }
  else
  {
    uint64_t v23 = 0;
    while (v23 != -29)
    {
      if (v11[v23-- + 54])
      {
        int v25 = v11 + v23 + 55;
        goto LABEL_24;
      }
    }
    int v25 = v11 + 25;
LABEL_24:
    int v22 = v25 - (v11 + 25) + 1;
  }
  if ((v22 - 33) >= 0xFFFFFFE0)
  {
    int v26 = v11[24];
    if (v26 != 16 && v26 != 8)
    {
      *(void *)a5 = 0x6E776F6E6B6E55;
      int v32 = 7;
      goto LABEL_40;
    }
    MEMORY[0x270FA5388]();
    unsigned int v30 = (const UniChar *)((char *)v41 - v29);
    if (v11[24] == 8)
    {
      uint64_t v31 = 0;
      do
      {
        v30[v31] = v11[v31 + 25];
        ++v31;
      }
      while (v28 != v31);
    }
    else
    {
      unsigned int v30 = (const UniChar *)(v11 + 25);
      int v28 = v28 >> 1;
    }
    CFStringRef v33 = CFStringCreateWithCharacters(0, v30, v28);
    if (!v33)
    {
      *(void *)a5 = 0x6E776F6E6B6E55;
      int v32 = 7;
      goto LABEL_40;
    }
    CFStringRef v34 = v33;
    CFStringGetCString(v33, a5, 136, 0x8000100u);
    CFRelease(v34);
    int v32 = strlen(a5);
    if (v32 >= 1)
    {
LABEL_40:
      uint64_t v35 = a5;
      do
      {
        --v32;
        int v37 = *v35++;
        int v36 = v37;
        if (v37 == 47 || v36 == 0)
        {
          if (!v32)
          {
LABEL_56:
            *a5++ = 95;
            break;
          }
          while (1)
          {
            int v39 = *v35;
            if (v39 != 47 && v39 != 0) {
              break;
            }
            ++v35;
            if (!--v32) {
              goto LABEL_56;
            }
          }
          LOBYTE(v36) = 95;
        }
        *a5++ = v36;
      }
      while (v32 > 0);
    }
    *a5 = 0;
    uint64_t v17 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v17 = 0;
  }
LABEL_9:
  free(v11);
  return v17;
}

uint64_t sub_21DC234DC(const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, void *a5, CFTypeRef *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int64_t v21 = 0;
  uint64_t v22 = 0;
  unsigned int v19 = 0;
  value = 0;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v12 = 22;
  if (a1 && theDict && a5)
  {
    if (!CFDictionaryGetValueIfPresent(theDict, @"blockcount", (const void **)&value)) {
      goto LABEL_11;
    }
    if (!sub_21DC1B748((const __CFString *)value, kCFNumberSInt64Type, &v22)) {
      return v12;
    }
    if (!v22)
    {
LABEL_11:
      CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
      if (!PathComponent) {
        return v12;
      }
      CFURLRef v14 = PathComponent;
      uint64_t v12 = sub_21DC27194(PathComponent, &v23);
      CFRelease(v14);
      if (v12) {
        return v12;
      }
      uint64_t v22 = v23.f_blocks * (((unint64_t)v23.f_bsize >> 8) & 0xFFFFFE);
    }
    value = 0;
    if (CFDictionaryGetValueIfPresent(theDict, @"sparse-band-size", (const void **)&value)
      && !sub_21DC1B748((const __CFString *)value, kCFNumberSInt64Type, &v21))
    {
      return 22;
    }
    else
    {
      value = 0;
      CFURLRef v15 = sub_21DC11B50(a1, @"sparseimage", 0);
      if (v15)
      {
        CFURLRef v16 = v15;
        uint64_t v12 = sub_21DC236FC((uint64_t)v15, theDict, a3, a4, v22, v21, (uint64_t *)&v19, a6);
        uint64_t v17 = v19;
        if (!v12)
        {
          uint64_t v12 = sub_21DC208C4((uint64_t)v19, (uint64_t)theDict, a5, a6);
          uint64_t v17 = v19;
        }
        if (v12 && v17)
        {
          (*(void (**)(char *))(*(void *)v17 + 416))(v17);
          uint64_t v17 = v19;
        }
        if (v17)
        {
          DIDiskImageObjectRelease(v17);
          unsigned int v19 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        return 999;
      }
    }
  }
  return v12;
}

uint64_t sub_21DC236FC(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, int64_t a6, uint64_t *a7, CFTypeRef *a8)
{
  *(void *)uint64_t v31 = 0;
  if (a6) {
    int64_t v14 = a6;
  }
  else {
    int64_t v14 = 2048;
  }
  uint64_t v15 = a5 / v14;
  if (a5 % v14) {
    ++v15;
  }
  if (v15 >= 134217729)
  {
    if (a6)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 115;
      goto LABEL_44;
    }
    double v18 = sqrt((double)a5) * 0.125;
    int64_t v14 = (uint64_t)v18;
    if ((uint64_t)v18) {
      BOOL v19 = ((uint64_t)v18 & 0x7FF) == 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (!v19)
    {
      uint64_t v20 = v14 + 2047;
      if (v14 >= 0) {
        uint64_t v20 = (uint64_t)v18;
      }
      int64_t v14 = (v20 & 0xFFFFFFFFFFFFF800) + 2048;
    }
  }
  uint64_t v21 = a5 / v14;
  if (a5 % v14) {
    ++v21;
  }
  uint64_t v17 = 115;
  if (v21 > 0x8000000 || (a6 ? (uint64_t v17 = 22) : (uint64_t v17 = 115), v14 > 0x200000))
  {
LABEL_43:
    uint64_t v16 = 0;
    goto LABEL_44;
  }
  if (theDict) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFMutableDictionaryRef v23 = MutableCopy;
  if (!MutableCopy)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_44;
  }
  uint64_t v17 = sub_21DC11CBC(a1, (uint64_t)MutableCopy, 1u, a3, a4, v31, a8);
  if (v17) {
    goto LABEL_28;
  }
  uint64_t v24 = (*(uint64_t (**)(void, uint64_t))(**(void **)v31 + 168))(*(void *)v31, 1);
  if (v24
    || (uint64_t v24 = (*(uint64_t (**)(void))(**(void **)v31 + 272))(*(void *)v31), v24))
  {
    uint64_t v17 = v24;
LABEL_28:
    CFRelease(v23);
    uint64_t v16 = *(void *)v31;
LABEL_41:
    if (!v16) {
      goto LABEL_44;
    }
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    goto LABEL_43;
  }
  int v25 = sub_21DC03648(v23, @"di-sparse-puma-compatible", 0);
  if (v25) {
    size_t v26 = 512;
  }
  else {
    size_t v26 = 4096;
  }
  uint64_t v27 = (char *)malloc_type_calloc(1uLL, v26, 0xF120F10FuLL);
  if (!v27)
  {
    uint64_t v17 = 12;
    goto LABEL_28;
  }
  int v28 = v27;
  if (v25) {
    int v29 = 1;
  }
  else {
    int v29 = 3;
  }
  *(_DWORD *)uint64_t v27 = 1936749171;
  *((_DWORD *)v27 + 1) = v29;
  *((_DWORD *)v27 + 2) = v14;
  *(void *)(v27 + 28) = a5;
  *((_DWORD *)v27 + 4) = a5;
  uint64_t v17 = sub_21DC23A00(*(uint64_t *)v31, v27, v26);
  if (!v17) {
    (*(void (**)(void, void))(**(void **)v31 + 280))(*(void *)v31, 0);
  }
  CFRelease(v23);
  free(v28);
  uint64_t v16 = *(void *)v31;
  if (v17) {
    goto LABEL_41;
  }
LABEL_44:
  *a7 = v16;
  return v17;
}

uint64_t sub_21DC23A00(uint64_t a1, const void *a2, size_t size)
{
  uint64_t v6 = malloc_type_malloc(size, 0x90A104EAuLL);
  if (!v6) {
    return 12;
  }
  CFAllocatorRef v7 = v6;
  uint64_t v10 = 0;
  memmove(v6, a2, size);
  sub_21DC07D2C((uint64_t)v7, (size + 0x3FFFFFFC0) >> 2);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void, size_t, uint64_t *, void *))(*(void *)a1 + 336))(a1, 0, size, &v10, v7);
  free(v7);
  return v8;
}

uint64_t sub_21DC23AE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  char v18 = 0;
  uint64_t v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_21:
    uint64_t v14 = 0;
    uint64_t v16 = 22;
    goto LABEL_18;
  }
  uint64_t v11 = *(void *)(a1 + 160);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48))(v11);
    if (v12 < a2 || a3 + a2 > v12) {
      goto LABEL_21;
    }
    if (a3)
    {
      uint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24))(*(void *)(a1 + 160), a2, a3, &v20, &v18);
        if (v15) {
          break;
        }
        if (!v18)
        {
          uint64_t v15 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 160) + 16))(*(void *)(a1 + 160), a2);
          if (v15) {
            break;
          }
        }
        uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t))(**(void **)(a1 + 160) + 40))(*(void *)(a1 + 160), a2, v20, &v19, a5);
        if (v15) {
          break;
        }
        a5 += v19 << 9;
        a2 += v19;
        v14 += v19;
        a3 -= v19;
        if (!a3)
        {
          uint64_t v16 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 999;
  }
LABEL_18:
  if (a4) {
    *a4 = v14;
  }
  pthread_rwlock_unlock(v10);
  return v16;
}

uint64_t sub_21DC23C9C(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136))(a1);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 152);
  return v3(a1, v2);
}

uint64_t sub_21DC23D18(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
  {
LABEL_5:
    int v8 = 0;
    unsigned int v9 = 1;
    while (1)
    {
      unsigned int v10 = *(_DWORD *)(a1 + 32);
      if (v9 > v10) {
        break;
      }
      uint64_t v11 = v9 - 1;
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        BOOL v13 = v10 > v11;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13) {
        uint64_t v14 = v12 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v11;
      }
      else {
        uint64_t v14 = 0;
      }
      uint64_t v7 = v14 + 56;
      uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1))
      {
        unsigned int v16 = 0;
        while ((*(_DWORD *)v7 + 1) > 1)
        {
          ++v16;
          v7 += 4;
          if (v16 >= (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1)) {
            goto LABEL_17;
          }
        }
        uint64_t v18 = *(void *)(a1 + 80);
        uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
        char v17 = 0;
        *(_DWORD *)(v18 + v19 * v11 + 8) |= 1u;
        if (*(_DWORD *)v7 == -1) {
          int v8 = 1;
        }
      }
      else
      {
LABEL_17:
        char v17 = 1;
      }
      v5 += v15 + ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1) << 9);
      ++v9;
      if ((v17 & 1) == 0)
      {
        if (v8) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    uint64_t result = sub_21DC30D60(a1);
    if (result) {
      return result;
    }
    int v21 = *(_DWORD *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 80);
    if (v21)
    {
      uint64_t v23 = v22 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v21 - 1);
      uint64_t v22 = *(void *)(a1 + 80);
      uint64_t v7 = v23 + 56;
      int v21 = *(_DWORD *)(a1 + 32);
    }
    else
    {
      uint64_t v7 = 56;
    }
    uint64_t v24 = (v21 - 1);
    uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    *(_DWORD *)(v22 + v25 * v24 + 8) |= 1u;
    goto LABEL_30;
  }
  unsigned int v6 = 0;
  uint64_t v7 = v4 + 64;
  while ((*(_DWORD *)v7 + 1) >= 2)
  {
    v5 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1) << 9;
    ++v6;
    v7 += 4;
    if (v6 >= (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1)) {
      goto LABEL_5;
    }
  }
  *(_DWORD *)(*(void *)(a1 + 72) + 12) |= 1u;
  if (*(_DWORD *)v7 != -1)
  {
LABEL_30:
    uint64_t v5 = *(void *)(a1 + 112);
    uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
    uint64_t result = sub_21DC24138(a1, v5 + (v26 << 9));
    if (result) {
      return result;
    }
  }
LABEL_31:
  uint64_t result = 999;
  if (a2)
  {
    uint64_t v27 = *(void *)(a1 + 8);
    if (v27)
    {
      if (*(_DWORD *)(a1 + 16) >= a2)
      {
        *(void *)(v27 + 8 * (a2 - 1)) = v5;
        *(_DWORD *)uint64_t v7 = a2;
        int v28 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 120);
        return v28(a1);
      }
    }
  }
  return result;
}

uint64_t sub_21DC24138(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (v2 == a2) {
    return 0;
  }
  if (v2 > a2 || *(void *)(a1 + 120) >= a2) {
    goto LABEL_10;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 48);
  unsigned int v7 = 10 * v6;
  if (10 * v6 >= 0x32000) {
    unsigned int v7 = 204800;
  }
  uint64_t v8 = a2 + ((v6 * (unint64_t)(v7 / v6)) << 9);
  if (!(*(unsigned int (**)(void, uint64_t, void))(**(void **)(a1 + 24) + 320))(*(void *)(a1 + 24), v8, 0)|| (uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(**(void **)(a1 + 24) + 320))(*(void *)(a1 + 24), a2, 0), v8 = a2, !result))
  {
    *(void *)(a1 + 120) = v8;
LABEL_10:
    uint64_t result = 0;
    *(void *)(a1 + 112) = a2;
  }
  return result;
}

uint64_t sub_21DC24238(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a4) {
    return 22;
  }
  *a4 = 0;
  if (!a5) {
    return 22;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136))(a1);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144))(a1, (v10 + 1)) - a2;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144))(a1, v10);
  if (v11 < a3) {
    a3 = v11;
  }
  uint64_t v13 = *(void *)(a1 + 8);
  if (!v10 || v13 == 0) {
    return 22;
  }
  if (*(_DWORD *)(a1 + 16) < v10) {
    return 22;
  }
  uint64_t v17 = 0;
  uint64_t v15 = *(void *)(v13 + 8 * (v10 - 1));
  if (!v15) {
    return 22;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t))(**(void **)(a1 + 24) + 336))(*(void *)(a1 + 24), v15 + ((a2 - v12) << 9), a3 << 9, &v17, a5);
  if (!result) {
    *a4 = a3;
  }
  return result;
}

uint64_t sub_21DC243AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 160);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 104))();
  }
  else {
    return 78;
  }
}

uint64_t sub_21DC243E0(void **a1)
{
  uint64_t result = ((uint64_t (*)(void **))(*a1)[15])(a1);
  if (!result)
  {
    uint64_t result = sub_21DC226D0((uint64_t)a1);
    if (!result)
    {
      uint64_t v3 = *(uint64_t (**)(void))(*a1[3] + 472);
      return v3();
    }
  }
  return result;
}

uint64_t sub_21DC24484(const __CFURL *a1)
{
  v11[2] = *(char **)MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  uint64_t v1 = (char *)sub_21DC036F4(a1);
  if (!v1) {
    return 4294962336;
  }
  uint64_t v2 = v1;
  v11[0] = v1;
  v11[1] = 0;
  uint64_t v3 = fts_open(v11, 21, 0);
  if (!v3)
  {
    unsigned int v9 = *__error();
    if (v9) {
      uint64_t fts_errno = v9;
    }
    else {
      uint64_t fts_errno = 0xFFFFFFFFLL;
    }
    goto LABEL_25;
  }
  uint64_t v4 = v3;
  while (1)
  {
    uint64_t v5 = fts_read(v4);
    if (!v5) {
      break;
    }
    unsigned int fts_info = v5->fts_info;
    if (fts_info > 0xA) {
      goto LABEL_14;
    }
    if (((1 << fts_info) & 0x490) != 0)
    {
      uint64_t fts_errno = v5->fts_errno;
      if (fts_errno) {
        goto LABEL_24;
      }
    }
    else if (((1 << fts_info) & 6) == 0)
    {
      if (fts_info != 6)
      {
LABEL_14:
        uint64_t v8 = unlink(v5->fts_accpath);
        goto LABEL_15;
      }
      uint64_t v8 = rmdir(v5->fts_accpath);
LABEL_15:
      uint64_t fts_errno = v8;
      if ((v8 & 0x80000000) != 0)
      {
        uint64_t fts_errno = *__error();
        if (fts_errno) {
          goto LABEL_24;
        }
      }
      else if (v8)
      {
        goto LABEL_24;
      }
    }
  }
  uint64_t fts_errno = *__error();
LABEL_24:
  fts_close(v4);
LABEL_25:
  free(v2);
  return fts_errno;
}

uint64_t DIDiskImageValidateChecksumWithFlags(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 168))();
}

void *sub_21DC24600(void *a1)
{
  uint64_t v2 = sub_21DC0E3E0((uint64_t)a1) + 13;
  sub_21DC246E4((uint64_t)v2);
  sub_21DC24720(a1 + 21);
  *a1 = &unk_26CE84BA0;
  a1[13] = &unk_26CE84BE8;
  a1[21] = &unk_26CE84C08;
  sub_21DC24740((uint64_t)v2, 0x10000u);
  return a1;
}

void sub_21DC246A8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  nullsub_4(v4);
  sub_21DC24A4C(v2);
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC246E4(uint64_t result)
{
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)uint64_t result = &unk_26CE84C70;
  *(_DWORD *)(result + 24) = 133114;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  return result;
}

void *sub_21DC24720(void *result)
{
  *uint64_t result = &unk_26CE84B70;
  return result;
}

uint64_t sub_21DC24740(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x30000) {
    unsigned int v2 = 196608;
  }
  else {
    unsigned int v2 = a2;
  }
  if (v2 <= 0x800) {
    unsigned int v2 = 2048;
  }
  *(_DWORD *)(result + 20) = v2;
  return result;
}

uint64_t sub_21DC24760(int a1, char *__src, int a3, unint64_t __dst, int a5)
{
  if (a5 < 1) {
    return 0;
  }
  int v8 = 0;
  unsigned int v9 = (char *)__dst;
  while (a3 >= 1)
  {
    uint64_t v10 = __src + 1;
    if ((*__src & 0x80000000) == 0)
    {
      unsigned int v11 = *__src;
      if ((v11 & 0x40) != 0)
      {
        BOOL v12 = a3 >= 3;
        a3 -= 3;
        if (!v12) {
          return 1000;
        }
        int v13 = (v11 & 0x3F) + 4;
        uint64_t v15 = (bswap32(*(unsigned __int16 *)(__src + 1)) >> 16) + 1;
        __src += 3;
      }
      else
      {
        BOOL v12 = a3 >= 2;
        a3 -= 2;
        if (!v12) {
          return 1000;
        }
        int v13 = (v11 >> 2) + 3;
        int v14 = *(unsigned __int16 *)__src;
        __src += 2;
        uint64_t v15 = (bswap32(v14 & 0xFFFFFF03) >> 16) + 1;
      }
      v8 += v13;
      if (v8 <= a5)
      {
        uint64_t v19 = &v9[-v15];
        if ((unint64_t)v19 >= __dst)
        {
          while (2)
          {
            switch((__int16)v13)
            {
              case 1:
                *v9++ = *v19;
                goto LABEL_24;
              case 2:
                *unsigned int v9 = *v19;
                v9[1] = v19[1];
                v9 += 2;
                goto LABEL_24;
              case 3:
                goto LABEL_23;
              case 4:
                goto LABEL_22;
              case 5:
                goto LABEL_21;
              case 6:
                goto LABEL_20;
              case 7:
                goto LABEL_19;
              default:
                char v20 = *v19++;
                *v9++ = v20;
LABEL_19:
                char v21 = *v19++;
                *v9++ = v21;
LABEL_20:
                char v22 = *v19++;
                *v9++ = v22;
LABEL_21:
                char v23 = *v19++;
                *v9++ = v23;
LABEL_22:
                char v24 = *v19++;
                *v9++ = v24;
LABEL_23:
                *unsigned int v9 = *v19;
                v9[1] = v19[1];
                char v25 = v19[2];
                v19 += 3;
                v9[2] = v25;
                v9 += 3;
                unsigned int v26 = (unsigned __int16)v13;
                LOWORD(v13) = v13 - 8;
                if (v26 <= 8) {
                  goto LABEL_24;
                }
                continue;
            }
          }
        }
      }
      return 1000;
    }
    uint64_t v16 = *__src & 0x7F;
    size_t v17 = v16 + 1;
    v8 += v16 + 1;
    uint64_t result = 1000;
    if (v8 > a5) {
      return result;
    }
    a3 += ~v17;
    if (a3 < 0) {
      return result;
    }
    memcpy(v9, __src + 1, v17);
    unsigned int __src = &v10[v17];
    v9 += v17;
LABEL_24:
    if (v8 >= a5) {
      return 0;
    }
  }
  return 1000;
}

uint64_t DIDiskImageCallProgressMessageProc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 336))();
}

void sub_21DC24970(uint64_t a1)
{
  sub_21DC249DC(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC249B8(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4010E1D886);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC249DC(uint64_t a1)
{
  nullsub_4(a1 + 168);
  sub_21DC24A4C((void *)(a1 + 104));
  return sub_21DC0AB38(a1);
}

void sub_21DC24A20(_Unwind_Exception *a1)
{
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

void *sub_21DC24A4C(void *a1)
{
  *a1 = &unk_26CE84C70;
  unsigned int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }
  a1[4] = 0;
  return a1;
}

uint64_t DIChecksumGetShortName(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 104))();
}

uint64_t DIChecksumGetValueString(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 120))();
}

uint64_t sub_21DC24AE4(int a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 4294966296;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!Value) {
    return 4294966296;
  }
  CFStringRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 4294966296;
  }
  if (CFEqual(v3, @"UDIF-CRC32")) {
    return 1000;
  }
  uint64_t v5 = 1000;
  if (CFStringCompare(v3, @"UDIF-MD5", 0))
  {
    if (CFStringCompare(v3, @"IPOD", 0)) {
      return 4294966296;
    }
    else {
      return 1000;
    }
  }
  return v5;
}

uint64_t sub_21DC24B98(int a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 4294966296;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!Value) {
    return 4294966296;
  }
  CFStringRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 4294966296;
  }
  if (CFEqual(v3, @"CRC32")
    || CFEqual(v3, @"MD5")
    || CFEqual(v3, @"SHA1")
    || CFEqual(v3, @"SHA256"))
  {
    return 1000;
  }
  uint64_t v5 = 1000;
  if (CFStringCompare(v3, @"SHA384", 0))
  {
    if (CFStringCompare(v3, @"SHA512", 0)) {
      return 4294966296;
    }
    else {
      return 1000;
    }
  }
  return v5;
}

uint64_t sub_21DC24C94(int a1, CFDictionaryRef theDict, void *a3)
{
  if (a3)
  {
    *a3 = 0;
    if (theDict)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
      if (Value)
      {
        CFStringRef v4 = Value;
        CFTypeID v5 = CFGetTypeID(Value);
        if (v5 == CFStringGetTypeID())
        {
          if (CFEqual(v4, @"CRC32")) {
            operator new();
          }
          if (CFEqual(v4, @"MD5")) {
            operator new();
          }
          if (CFEqual(v4, @"SHA1")) {
            operator new();
          }
          if (CFEqual(v4, @"SHA256")) {
            operator new();
          }
          if (CFEqual(v4, @"SHA384")) {
            operator new();
          }
          if (CFEqual(v4, @"SHA512")) {
            operator new();
          }
        }
      }
    }
  }
  return 22;
}

void sub_21DC24E90(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

void sub_21DC24EE0(char *a1, char *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFStringRef v4 = 0;
  (*(void (**)(char *, double))(*(void *)a1 + 344))(a1, 0.0);
  (*(void (**)(char *))(*(void *)a2 + 48))(a2);
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  long long v14 = 0u;
  long long v15 = 0u;
  memset(v13, 0, sizeof(v13));
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)unsigned int v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  unsigned int v7 = a2;
  DIDiskImageObjectRetain_0(a2);
  unsigned int v6 = a1;
  DIDiskImageObjectRetain_0(a1);
  *(void *)&long long v15 = (*(uint64_t (**)(char *))(*(void *)a1 + 96))(a1);
  pthread_mutex_init((pthread_mutex_t *)&v9[1], 0);
  pthread_cond_init((pthread_cond_t *)((char *)v13 + 8), 0);
  pthread_mutex_init((pthread_mutex_t *)((char *)&v13[3] + 8), 0);
  pthread_cond_init((pthread_cond_t *)((char *)&v13[7] + 8), 0);
  BYTE8(v14) = 0;
  *((void *)&v15 + 1) = 0;
  *(void *)&v16[0] = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)v16 + 8), 0);
  operator new();
}

void sub_21DC255E0(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC25624(void *a1)
{
  uint64_t v14 = 0;
  long long v15 = 0;
  unsigned int v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  int v3 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32))(*a1, &v15, 0);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v15 == 0;
  }
  if (!v4)
  {
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 39));
      uint64_t v5 = a1[38];
      uint64_t v6 = a1[36];
      if (v5 + 2048 < v6) {
        uint64_t v6 = v5 + 2048;
      }
      a1[38] = v6;
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 39));
      uint64_t v7 = a1[36];
      if (v7 <= v5)
      {
        int v3 = 0;
        goto LABEL_25;
      }
      if (v5 + 2048 <= v7) {
        uint64_t v8 = 2048;
      }
      else {
        uint64_t v8 = v7 - v5;
      }
      int v9 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1[2] + 48))(a1[2], v5, v8, &v14, v15 + 13);
      if (v9)
      {
        int v3 = v9;
        goto LABEL_24;
      }
      if (v14 != v8) {
        break;
      }
      long long v10 = v15;
      v15[11] = v5;
      v10[12] = v8;
      (*(void (**)(void))(*(void *)a1[1] + 24))(a1[1]);
      long long v15 = 0;
      int v11 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32))(*a1, &v15, 0);
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v15 == 0;
      }
      if (v12)
      {
        int v3 = v11;
        goto LABEL_19;
      }
    }
    int v3 = 5;
    goto LABEL_24;
  }
LABEL_19:
  if (v3)
  {
LABEL_24:
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
    *((unsigned char *)a1 + 280) = 1;
    pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  }
LABEL_25:
  if (v15) {
    (*(void (**)(void *))(*v15 + 8))(v15);
  }
  return v3;
}

uint64_t sub_21DC25844(uint64_t a1)
{
  BOOL v12 = 0;
  unsigned int v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  --*(_DWORD *)(a1 + 40);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 120));
  pthread_mutex_unlock(v2);
  while (1)
  {
    uint64_t v3 = *(void *)(a1 + 288);
    uint64_t v11 = *(void *)(a1 + 296);
    if (v11 >= v3)
    {
      int v9 = 0;
      goto LABEL_12;
    }
    int v4 = (*(uint64_t (**)(void, BOOL (*)(uint64_t, void *), uint64_t *, void **))(**(void **)(a1 + 8) + 40))(*(void *)(a1 + 8), sub_21DC259E0, &v11, &v12);
    uint64_t v5 = v12;
    if (v4 || v12 == 0) {
      break;
    }
    uint64_t v7 = *(void *)(a1 + 296) + 2048;
    if (v7 >= *(void *)(a1 + 288)) {
      uint64_t v7 = *(void *)(a1 + 288);
    }
    *(void *)(a1 + 296) = v7;
    (*(void (**)(void, void *, void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24), v5 + 13, v5[12] << 9);
    uint64_t v8 = v12;
    v12[11] = 0;
    v8[12] = 0;
    (*(void (**)(void))(**(void **)a1 + 16))();
    BOOL v12 = 0;
  }
  int v9 = v4;
LABEL_12:
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 168));
  *(unsigned char *)(a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 232));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 168));
  if (v12) {
    (*(void (**)(void *))(*v12 + 8))(v12);
  }
  return v9;
}

BOOL sub_21DC259E0(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 88) != *a2;
}

void sub_21DC259F4(uint64_t a1)
{
  sub_21DC0E970(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC25A3C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C400DD98C08);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC25A60(int a1, CFDictionaryRef theDict, void *a3)
{
  if (a3)
  {
    *a3 = 0;
    if (theDict)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
      if (Value)
      {
        CFStringRef v4 = Value;
        CFTypeID v5 = CFGetTypeID(Value);
        if (v5 == CFStringGetTypeID())
        {
          if (CFEqual(v4, @"UDIF-CRC32")) {
            operator new();
          }
          if (CFEqual(v4, @"UDIF-MD5")) {
            operator new();
          }
          if (CFEqual(v4, @"IPOD")) {
            operator new();
          }
        }
      }
    }
  }
  return 22;
}

void sub_21DC260CC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

void sub_21DC26118(void ***a1, int a2)
{
  if (a1)
  {
    if (a2 >= 1)
    {
      uint64_t v3 = a2;
      CFStringRef v4 = a1;
      do
      {
        sub_21DC3A944(*v4);
        *v4++ = 0;
        --v3;
      }
      while (v3);
    }
    free(a1);
  }
}

BOOL sub_21DC26180(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!(bswap32(*(_DWORD *)(a2 + 12)) * (unint64_t)(a4 >> 9))) {
    return 1;
  }
  int64_t v4 = (a4 >> 9) * (unint64_t)bswap32(*(_DWORD *)(a2 + 8));
  uint64_t v5 = sub_21DC17A4C(a1);
  return v4 >= (*(uint64_t (**)(uint64_t))(*(void *)v5 + 96))(v5);
}

uint64_t sub_21DC261F4(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  if (!a3) {
    return 4294966296;
  }
  int v3 = sub_21DC12310(a3, @"convert-image-type", 0);
  uint64_t result = 4294966296;
  if (v3 > 1430542926)
  {
    if (v3 != 1430542927 && v3 != 1431062095)
    {
      int v5 = 1430667849;
LABEL_10:
      if (v3 != v5) {
        return result;
      }
    }
  }
  else if (v3 != 1229999940 && v3 != 1430537039)
  {
    int v5 = 1430540879;
    goto LABEL_10;
  }
  return 100;
}

uint64_t sub_21DC262A4(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3 = 4294966296;
  if (a3)
  {
    if (sub_21DC12310(a3, @"convert-image-type", 0) == 1430541136) {
      return 100;
    }
    else {
      return 4294966296;
    }
  }
  return v3;
}

uint64_t sub_21DC262F4(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3 = 4294966296;
  if (a3)
  {
    int v4 = sub_21DC12310(a3, @"convert-image-type", 0);
    if (v4 == 1430540887 || v4 == 1430541391) {
      return 100;
    }
    else {
      return 4294966296;
    }
  }
  return v3;
}

uint64_t sub_21DC2634C(uint64_t a1, char *a2, const __CFDictionary *a3, void *a4)
{
  int valuePtr = 8;
  char v21 = 0;
  uint64_t v22 = 0;
  int v20 = 0;
  CFTypeRef v18 = 0;
  CFTypeRef cf = 0;
  uint64_t v17 = -1;
  if (!a2) {
    goto LABEL_7;
  }
  DIDiskImageObjectRetain_0(a2);
  if (!a3) {
    goto LABEL_7;
  }
  int v7 = sub_21DC12310(a3, @"convert-image-type", 0);
  if (!v7) {
    goto LABEL_7;
  }
  int v8 = v7;
  int v9 = sub_21DC03648(a3, @"convert-add-partition-map", 0);
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a3, @"convert-alignment");
  if (v10) {
    CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
  }
  if (v9)
  {
LABEL_7:
    uint64_t v11 = 22;
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a3, @"udif-chunk-size", (const void **)&value)) {
    goto LABEL_18;
  }
  if (!sub_21DC1B748((const __CFString *)value, kCFNumberSInt64Type, &v17))
  {
    uint64_t v11 = 999;
    goto LABEL_8;
  }
  unint64_t v13 = v17;
  if (v17 < 0)
  {
LABEL_18:
    unint64_t v13 = 2048;
    uint64_t v17 = 2048;
  }
  if (v8 == 1430541391) {
    unsigned int v14 = 5;
  }
  else {
    unsigned int v14 = 1;
  }
  uint64_t v15 = sub_21DC38EFC((uint64_t)a2, v14, 1, v13, &v18, (void ****)&v21, &v20, (__CFArray **)&cf, 1);
  if (!v15) {
    sub_21DC2EBD4();
  }
  uint64_t v11 = v15;
  if (v21) {
    sub_21DC26118((void ***)v21, v20);
  }
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v18)
  {
    CFRelease(v18);
    CFTypeRef v18 = 0;
  }
  if (a2) {
    DIDiskImageObjectRelease(a2);
  }
  *a4 = v22;
  return v11;
}

void *sub_21DC26520(void *result)
{
  *uint64_t result = &unk_26CE850F8;
  return result;
}

uint64_t sub_21DC26540(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 8), 0);
}

uint64_t sub_21DC2654C(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 24), 0);
}

uint64_t sub_21DC26558(uint64_t a1)
{
  return 1000 * (1000000 * (*(void *)(a1 + 24) - *(void *)(a1 + 8)) - *(int *)(a1 + 16) + *(int *)(a1 + 32));
}

void sub_21DC2658C()
{
}

uint64_t DIDiskImageCopyImageInformation(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 80))();
}

__CFDictionary *sub_21DC265C4(uint64_t a1)
{
  unsigned int v2 = sub_21DC26910(a1);
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    int v5 = DIGetBundleRef();
    CFTypeRef v6 = sub_21DC3A890(v5, (int)@"raw read/write", @"raw read/write");
    CFDictionaryAddValue(v2, @"Format Description", v6);
    if (v6) {
      CFRelease(v6);
    }
    unsigned int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
    CFStringRef v8 = sub_21DC09934(v7);
    CFDictionaryAddValue(v2, @"Format", v8);
    if (v8) {
      CFRelease(v8);
    }
    uint64_t v17 = 0;
    uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
    CFNumberRef v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Bytes", v9);
    if (v9) {
      CFRelease(v9);
    }
    uint64_t valuePtr = 0;
    CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v10);
    if (v10) {
      CFRelease(v10);
    }
    uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
    CFNumberRef v11 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v11);
    if (v11) {
      CFRelease(v11);
    }
    uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
    CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Compressed Bytes", v12);
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v17 = 0x3FF0000000000000;
    CFNumberRef v13 = CFNumberCreate(v3, kCFNumberDoubleType, &v17);
    CFDictionaryAddValue(Mutable, @"Compressed Ratio", v13);
    if (v13) {
      CFRelease(v13);
    }
    uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
    CFNumberRef v14 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Sector Count", v14);
    if (v14) {
      CFRelease(v14);
    }
    CFStringRef Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
    CFDictionaryAddValue(Value, @"Compressed", @"no");
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  return v2;
}

__CFDictionary *sub_21DC26910(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    CFTypeRef v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(v3, 0, v5, v6);
    CFDictionaryAddValue(Mutable, @"Backing Store Information", v7);
    theDict = v8;
    int v37 = Mutable;
    CFDictionaryAddValue(Mutable, @"Properties", v8);
    CFRelease(v7);
    int v34 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 384))(a1);
    int v35 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
    if (v2)
    {
      while (1)
      {
        CFNumberRef v9 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 16))(v2);
        CFStringRef v10 = CFStringCreateWithCString(v3, v9, 0x8000100u);
        CFDictionaryAddValue(v7, @"Class Name", v10);
        if (v10) {
          CFRelease(v10);
        }
        CFURLRef v11 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 176))(v2);
        CFStringRef v12 = CFURLGetString(v11);
        CFDictionaryAddValue(v7, @"URL", v12);
        CFNumberRef v13 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 192))(v2);
        CFDictionaryAddValue(v7, @"Name", v13);
        if ((*(uint64_t (**)(uint64_t, __CFString *))(*(void *)v2 + 24))(v2, @"encryption-class"))
        {
          CFNumberRef v14 = (const void *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)v2 + 24))(v2, @"encryption-class");
          CFDictionaryAddValue(v7, @"Encryption", v14);
        }
        uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 496))(v2);
        if (!v15) {
          break;
        }
        uint64_t v2 = v15;
        CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionaryAddValue(v7, @"Backing Store Information", v16);
        CFRelease(v16);
        CFMutableDictionaryRef v7 = v16;
      }
    }
    uint64_t v17 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
    CFTypeRef v18 = v17;
    if (v17) {
      CFRelease(v17);
    }
    uint64_t v19 = (const void *)*MEMORY[0x263EFFB40];
    int v20 = (const void *)*MEMORY[0x263EFFB38];
    if (v34) {
      char v21 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      char v21 = (const void *)*MEMORY[0x263EFFB38];
    }
    CFDictionaryAddValue(theDict, @"Encrypted", v21);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 400))(a1)) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = v20;
    }
    CFDictionaryAddValue(theDict, @"Partitioned", v22);
    if (v18) {
      char v23 = v19;
    }
    else {
      char v23 = v20;
    }
    CFDictionaryAddValue(theDict, @"Software License Agreement", v23);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1)) {
      char v24 = v19;
    }
    else {
      char v24 = v20;
    }
    CFDictionaryAddValue(theDict, @"Checksummed", v24);
    if (v35) {
      char v25 = v19;
    }
    else {
      char v25 = v20;
    }
    CFDictionaryAddValue(theDict, @"Kernel Compatible", v25);
    unsigned int v26 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
    uint64_t v27 = (const void *)(*(uint64_t (**)(char *))(*(void *)v26 + 104))(v26);
    CFMutableDictionaryRef Mutable = v37;
    CFDictionaryAddValue(v37, @"Checksum Type", v27);
    int v28 = (const void *)(*(uint64_t (**)(char *))(*(void *)v26 + 120))(v26);
    CFDictionaryAddValue(v37, @"Checksum Value", v28);
    sub_21DC0474C(v26);
    int v29 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
    CFStringRef v30 = CFStringCreateWithCString(v3, v29, 0x8000100u);
    CFDictionaryAddValue(v37, @"Class Name", v30);
    if (v30) {
      CFRelease(v30);
    }
    uint64_t v31 = (const void *)sub_21DC16C04();
    if (v31)
    {
      int v32 = v31;
      CFDictionaryAddValue(v37, @"partitions", v31);
      CFRelease(v32);
    }
    if (theDict) {
      CFRelease(theDict);
    }
  }
  return Mutable;
}

const char *sub_21DC26F1C()
{
  return "CBSDBackingStore";
}

BOOL sub_21DC26F28()
{
  CFDictionaryRef v0 = (const __CFDictionary *)sub_21DC16C04();
  if (!v0) {
    return 0;
  }
  CFDictionaryRef v1 = v0;
  CFStringRef v2 = (const __CFString *)sub_21DC166D0(v0, @"partition-scheme");
  if (v2) {
    BOOL v3 = CFEqual(v2, @"Apple");
  }
  else {
    BOOL v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

uint64_t sub_21DC26F98(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t sub_21DC26FA0()
{
  return 0;
}

const char *sub_21DC26FA8()
{
  return "CRawDiskImage";
}

uint64_t sub_21DC26FB4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 144);
}

uint64_t sub_21DC26FBC(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (v3)
  {
    uint64_t v5 = 0;
    if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)v3 + 304))(v3, &v5))
    {
      uint64_t v2 = v5 >> 9;
      if (v2 < (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1)) {
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
      }
    }
  }
  return v2;
}

uint64_t sub_21DC270E0(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 200);
  if (statfs(*(const char **)(a1 + 296), &v5) < 0)
  {
    uint64_t result = *__error();
    if (!a2) {
      return result;
    }
  }
  else if (v5.f_bavail == -1)
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  else
  {
    uint64_t result = 0;
    v3 += v5.f_bavail * v5.f_bsize;
    if (!a2) {
      return result;
    }
  }
  *a2 = v3;
  return result;
}

uint64_t sub_21DC2718C()
{
  return 22;
}

uint64_t sub_21DC27194(const __CFURL *a1, statfs *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = (const char *)sub_21DC036F4(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = (char *)v3;
  uint64_t v5 = statfs(v3, a2);
  if ((v5 & 0x80000000) != 0) {
    uint64_t v5 = *__error();
  }
  free(v4);
  return v5;
}

__CFDictionary *sub_21DC271F0(uint64_t a1)
{
  uint64_t v2 = sub_21DC26910(a1);
  if (!v2) {
    return v2;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v2, @"Size Information", Mutable);
  uint64_t v75 = 0;
  int v5 = *(_DWORD *)(**(void **)(a1 + 904) + 200);
  uint64_t v6 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  (*(void (**)(void))(v6 + 296))();
  theDict = v2;
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    uint64_t v18 = **(void **)(a1 + 904) + 204;
    do
    {
      int v19 = *(_DWORD *)v18;
      uint64_t v20 = *(void *)(v18 + 32);
      if (v20) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = *(void *)(v18 + 16);
      }
      if (v20) {
        uint64_t v22 = *(void *)(v18 + 16);
      }
      else {
        uint64_t v22 = 0;
      }
      switch(v19)
      {
        case -2147483644:
          int v17 = 1;
          int v12 = 1;
          break;
        case -2147483643:
          int v17 = 1;
          int v16 = 1;
          break;
        case -2147483642:
          int v17 = 1;
          int v15 = 1;
          break;
        case -2147483641:
          int v17 = 1;
          int v14 = 1;
          break;
        case -2147483640:
          int v17 = 1;
          int v13 = 1;
          break;
        default:
          unsigned int v23 = v19 + 1;
          if (v19 < 0) {
            int v24 = 1;
          }
          else {
            int v24 = v17;
          }
          if (v23 >= 3) {
            int v17 = v24;
          }
          break;
      }
      v7 += v20;
      v9 += *(void *)(v18 + 16);
      v8 += v20;
      v11 += v21;
      v10 += v22;
      v18 += 40;
      --v5;
    }
    while (v5);
  }
  else
  {
    LOBYTE(v17) = 0;
    int v16 = 0;
    int v15 = 0;
    int v14 = 0;
    int v13 = 0;
    int v12 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    unint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  int v69 = v14;
  int v70 = v16;
  int v67 = v15;
  int v68 = v13;
  int v66 = v12;
  double v73 = 0.0;
  uint64_t valuePtr = v75 - v7;
  CFNumberRef v25 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-wasted", v25);
  if (v25) {
    CFRelease(v25);
  }
  uint64_t valuePtr = v75;
  CFNumberRef v26 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-total", v26);
  if (v26) {
    CFRelease(v26);
  }
  uint64_t valuePtr = v7;
  CFNumberRef v27 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-in-use", v27);
  if (v27) {
    CFRelease(v27);
  }
  uint64_t valuePtr = v9 << 9;
  CFNumberRef v28 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Bytes", v28);
  if (v28) {
    CFRelease(v28);
  }
  uint64_t valuePtr = v11 << 9;
  CFNumberRef v29 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v29);
  CFStringRef v30 = (uint64_t *)(a1 + 904);
  if (v29) {
    CFRelease(v29);
  }
  uint64_t valuePtr = v10 << 9;
  CFNumberRef v31 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v31);
  if (v31) {
    CFRelease(v31);
  }
  uint64_t valuePtr = v8;
  CFNumberRef v32 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Compressed Bytes", v32);
  if (v32) {
    CFRelease(v32);
  }
  double v73 = (double)(v8 >> 9) / (double)v10;
  CFNumberRef v33 = CFNumberCreate(v3, kCFNumberDoubleType, &v73);
  int v71 = Mutable;
  CFDictionaryAddValue(Mutable, @"Compressed Ratio", v33);
  if (v33) {
    CFRelease(v33);
  }
  uint64_t valuePtr = 0;
  CFMutableDictionaryRef v34 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(theDict, @"Partition Information", v34);
  uint64_t valuePtr = *(__int16 *)(a1 + 914);
  if (*(__int16 *)(a1 + 912) >= 1)
  {
    CFIndex v35 = 0;
    while (1)
    {
      int v36 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFNumberRef v37 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
      if (v37)
      {
        CFNumberRef v38 = v37;
        CFDictionaryAddValue(v36, @"Partition Number", v37);
        CFRelease(v38);
      }
      if (valuePtr >= -2)
      {
        uint64_t v40 = v30;
        if (valuePtr == -2) {
          goto LABEL_49;
        }
        uint64_t v41 = valuePtr - *(__int16 *)(a1 + 914);
        if (v41 < *(__int16 *)(a1 + 912)) {
          break;
        }
      }
      int v39 = 0;
LABEL_59:
      CFStringRef v51 = CFStringCreateWithFormat(0, 0, @"%ld", valuePtr);
      CFDictionaryAddValue(v34, v51, v36);
      if (v51) {
        CFRelease(v51);
      }
      if (v39) {
        DIDiskImageObjectRelease(v39);
      }
      if (v36) {
        CFRelease(v36);
      }
      ++v35;
      ++valuePtr;
      if (v35 >= *(__int16 *)(a1 + 912)) {
        goto LABEL_69;
      }
    }
    uint64_t v40 = (uint64_t *)(*(void *)(a1 + 928) + 8 * v41);
LABEL_49:
    uint64_t v42 = *v40;
    if (!*v40)
    {
      int v39 = 0;
LABEL_58:
      CFStringRef v30 = (uint64_t *)(a1 + 904);
      goto LABEL_59;
    }
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 936), v35);
    if (ValueAtIndex)
    {
      uint64_t v44 = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }
    else
    {
      uint64_t v45 = valuePtr;
      int v46 = DIGetBundleRef();
      if (v45 == -1)
      {
        uint64_t v44 = sub_21DC3A890(v46, (int)@"Driver Descriptor Map", @"Driver Descriptor Map");
        if (!v44)
        {
LABEL_56:
          uint64_t v48 = sub_21DC0C840((_DWORD *)(*(void *)v42 + 64));
          int v39 = (char *)v48;
          if (v48)
          {
            uint64_t v49 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v48 + 104))(v48);
            CFDictionaryAddValue(v36, @"Checksum Type", v49);
            uint64_t v50 = (const void *)(*(uint64_t (**)(char *))(*(void *)v39 + 120))(v39);
            CFDictionaryAddValue(v36, @"Checksum Value", v50);
          }
          goto LABEL_58;
        }
      }
      else
      {
        CFStringRef v47 = (const __CFString *)sub_21DC3A890(v46, (int)@"partition %d", @"partition %d");
        uint64_t v44 = CFStringCreateWithFormat(v3, 0, v47, valuePtr);
        CFRelease(v47);
        if (!v44) {
          goto LABEL_56;
        }
      }
    }
    CFDictionaryAddValue(v36, @"Name", v44);
    CFRelease(v44);
    goto LABEL_56;
  }
LABEL_69:
  if (v34) {
    CFRelease(v34);
  }
  if (!(_BYTE)v17)
  {
    int v60 = DIGetBundleRef();
    CFTypeRef v53 = sub_21DC3A890(v60, (int)@"UDIF read-only", @"UDIF read-only");
    uint64_t v2 = theDict;
    CFDictionaryAddValue(theDict, @"Format Description", v53);
    unint64_t v54 = @"UDRO";
    if (!v53) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  if (!v70)
  {
    uint64_t v2 = theDict;
    if (v69)
    {
      int v61 = DIGetBundleRef();
      CFTypeRef v53 = sub_21DC3A890(v61, (int)@"UDIF read-only compressed (lzfse)", @"UDIF read-only compressed (lzfse)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"ULFO";
      if (!v53) {
        goto LABEL_75;
      }
    }
    else if (v68)
    {
      int v62 = DIGetBundleRef();
      CFTypeRef v53 = sub_21DC3A890(v62, (int)@"UDIF read-only compressed (lzma)", @"UDIF read-only compressed (lzma)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"ULMO";
      if (!v53) {
        goto LABEL_75;
      }
    }
    else if (v67)
    {
      int v63 = DIGetBundleRef();
      CFTypeRef v53 = sub_21DC3A890(v63, (int)@"UDIF read-only compressed (bzip2)", @"UDIF read-only compressed (bzip2)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"UDBZ";
      if (!v53) {
        goto LABEL_75;
      }
    }
    else
    {
      int v64 = DIGetBundleRef();
      if (v66) {
        CFStringRef v65 = @"UDIF read-only compressed (ADC)";
      }
      else {
        CFStringRef v65 = @"UDIF read-only compressed";
      }
      CFTypeRef v53 = sub_21DC3A890(v64, (int)v65, v65);
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"UDCO";
      if (!v53) {
        goto LABEL_75;
      }
    }
    goto LABEL_74;
  }
  int v52 = DIGetBundleRef();
  CFTypeRef v53 = sub_21DC3A890(v52, (int)@"UDIF read-only compressed (zlib)", @"UDIF read-only compressed (zlib)");
  uint64_t v2 = theDict;
  CFDictionaryAddValue(theDict, @"Format Description", v53);
  unint64_t v54 = @"UDZO";
  if (v53) {
LABEL_74:
  }
    CFRelease(v53);
LABEL_75:
  CFDictionaryAddValue(v2, @"Format", v54);
  uint64_t v75 = *(void *)(*(void *)*v30 + 16);
  CFNumberRef v55 = CFNumberCreate(v3, kCFNumberLongLongType, &v75);
  CFDictionaryAddValue(v71, @"Sector Count", v55);
  if (v55) {
    CFRelease(v55);
  }
  CFStringRef Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
  uint64_t v57 = (const void **)MEMORY[0x263EFFB40];
  if (!(_BYTE)v17) {
    uint64_t v57 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(Value, @"Compressed", *v57);
  if (v71) {
    CFRelease(v71);
  }
  BOOL v58 = (const void *)(*(uint64_t (**)(uint64_t, __CFString *))(*(void *)a1 + 24))(a1, @"udif-ordered-chunks");
  if (v58) {
    CFDictionaryAddValue(v2, @"udif-ordered-chunks", v58);
  }
  return v2;
}

const char *sub_21DC27BB8()
{
  return "CUDIFEncoding";
}

uint64_t sub_21DC27BC4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 176))();
  }
  return result;
}

uint64_t sub_21DC27BF4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 192))();
  }
  return result;
}

const char *sub_21DC27C24()
{
  return "CUDIFDiskImage";
}

BOOL sub_21DC27C30(void *a1)
{
  CFDictionaryRef v1 = (uint64_t *)a1[113];
  uint64_t v2 = *v1;
  unsigned int v3 = *(_DWORD *)(*v1 + 200);
  if (__dynamic_cast(a1, (const struct __class_type_info *)&unk_26CE85BA8, (const struct __class_type_info *)&unk_26CE85E78, 0))
  {
    return 0;
  }
  if (!v3) {
    return 1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = (void *)(v2 + 228);
  unsigned int v7 = 1;
  do
  {
    int v8 = *((_DWORD *)v6 - 6);
    if (v8 < -2147483639 || v8 == 1)
    {
      BOOL result = *v6 >= v5;
      uint64_t v5 = *v6;
      if (!result) {
        return result;
      }
    }
    else
    {
      BOOL result = 1;
    }
    v6 += 5;
  }
  while (v7++ < v3);
  return result;
}

void *sub_21DC27D0C(void *a1)
{
  sub_21DC27DD4((uint64_t)a1);
  *uint64_t v2 = &unk_26CE848A8;
  v2[16] = 16;
  a1[15] = malloc_type_calloc(1uLL, 0x10uLL, 0x52C2C228uLL);
  a1[14] = malloc_type_malloc(0x5CuLL, 0x100004034A301B9uLL);
  a1[17] = MEMORY[0x263EF8028];
  a1[18] = MEMORY[0x263EF8030];
  a1[19] = MEMORY[0x263EF8020];
  return a1;
}

void sub_21DC27DBC(_Unwind_Exception *a1)
{
  sub_21DC27F8C(v1);
  _Unwind_Resume(a1);
}

double sub_21DC27DD4(uint64_t a1)
{
  uint64_t v1 = sub_21DC0B340(a1);
  *(void *)uint64_t v1 = &unk_26CE87B68;
  double result = 0.0;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  return result;
}

uint64_t sub_21DC27E14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 136))(*(void *)(a1 + 112));
}

uint64_t sub_21DC27E20()
{
  return 4;
}

uint64_t sub_21DC27E28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 144))(*(void *)(a1 + 112));
}

uint64_t sub_21DC27E34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 152))(*(void *)(a1 + 120), *(void *)(a1 + 112));
}

uint64_t sub_21DC27E44(uint64_t a1)
{
  return (8 * *(_DWORD *)(a1 + 128));
}

void *sub_21DC27E50(void *result, void *a2, unsigned int a3)
{
  if (result[14])
  {
    unsigned int v3 = a3;
    uint64_t v5 = result;
    if ((*(unsigned int (**)(void *))(*result + 88))(result) < a3) {
      unsigned int v3 = (*(uint64_t (**)(void *))(*v5 + 88))(v5);
    }
    unsigned int v6 = v3 >> 3;
    if ((v3 & 7) != 0) {
      size_t v7 = v6 + 1;
    }
    else {
      size_t v7 = v6;
    }
    int v8 = (const void *)v5[15];
    return memcpy(a2, v8, v7);
  }
  return result;
}

__CFString *sub_21DC27F14()
{
  return @"MD5";
}

void sub_21DC27F20(void *a1)
{
  sub_21DC27F8C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC27F68(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

void *sub_21DC27F8C(void *a1)
{
  *a1 = &unk_26CE87B68;
  uint64_t v2 = (void *)a1[14];
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (void *)a1[15];
  if (v3) {
    free(v3);
  }
  return sub_21DC0B4F8(a1);
}

void *sub_21DC27FF4(uint64_t a1, const void *a2)
{
  return memcpy(*(void **)(a1 + 120), a2, *(void *)(a1 + 128));
}

uint64_t sub_21DC28000(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 216))();
}

BOOL sub_21DC28024(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xB41857C9uLL);
  if (!v2) {
    return 0;
  }
  unsigned int v3 = v2;
  uint64_t v6 = 0;
  BOOL v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)a1 + 48))(a1, 2, 1, &v6, v2)&& (sub_21DC280F0(v3), *v3 == 18475)&& (v3[20] & 0x1FF) == 0&& v3[1] > 3u;
  free(v3);
  return v4;
}

double sub_21DC280F0(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *(int8x16_t *)(a1 + 18) = vrev32q_s8(*(int8x16_t *)(a1 + 18));
  *(int8x16_t *)(a1 + 26) = vrev32q_s8(*(int8x16_t *)(a1 + 26));
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  *((void *)a1 + 9) = bswap64(*((void *)a1 + 9));
  sub_21DC281AC((uint64_t)(a1 + 56));
  sub_21DC281AC((uint64_t)(a1 + 96));
  sub_21DC281AC((uint64_t)(a1 + 136));
  sub_21DC281AC((uint64_t)(a1 + 176));
  *(void *)&double result = sub_21DC281AC((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 sub_21DC281AC(uint64_t a1)
{
  uint64_t v1 = 0;
  *(void *)a1 = bswap64(*(void *)a1);
  *(int8x8_t *)(a1 + 8) = vrev32_s8(*(int8x8_t *)(a1 + 8));
  do
  {
    uint64_t v2 = (float *)(a1 + 16 + v1);
    float32x4x2_t v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
    v1 += 32;
  }
  while (v1 != 64);
  return (__n128)v4.val[0];
}

uint64_t sub_21DC281FC()
{
  return 0;
}

uint64_t sub_21DC28204(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

void *sub_21DC28210(void *a1, unsigned int a2)
{
  float32x4x2_t v4 = sub_21DC0E3E0((uint64_t)a1) + 13;
  sub_21DC246E4((uint64_t)v4);
  *a1 = &unk_26CE84CA0;
  a1[13] = &unk_26CE84CE8;
  sub_21DC24740((uint64_t)v4, a2);
  return a1;
}

void sub_21DC28294(_Unwind_Exception *a1)
{
  sub_21DC24A4C(v2);
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC282BC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int a5)
{
  char v26 = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 112) = a2;
  *(_DWORD *)(a1 + 144) = 8 * a5;
  if (!a5) {
    return 0;
  }
  unsigned int v8 = 0;
  uint64_t v9 = a1 + 104;
  int v27 = 0;
  int v28 = 0;
  uint64_t v10 = a4;
  uint64_t v11 = &a4[a5];
  while (1)
  {
    sub_21DC28460(a1, &v28, &v27, (_WORD *)&v28 + 1, v8, (BOOL *)&v26);
    int v12 = (__int16)v28;
    if ((__int16)v28 >= 1) {
      break;
    }
    int v12 = SHIWORD(v28);
    sub_21DC28858(v9, v10, SHIWORD(v28));
    v10 += SHIWORD(v28);
LABEL_24:
    v8 += v12;
    if (v8 >= a5) {
      return 0;
    }
  }
  uint64_t result = 1000;
  if (v10 >= a4)
  {
    int v14 = &v10[-v27];
    BOOL v15 = v14 < a4 || &v10[(__int16)v28] > v11;
    if (!v15 && v14 <= a4)
    {
      __int16 v17 = v28;
      while (2)
      {
        switch(v17)
        {
          case 1:
            goto LABEL_21;
          case 2:
            goto LABEL_20;
          case 3:
            goto LABEL_19;
          case 4:
            goto LABEL_18;
          case 5:
            goto LABEL_17;
          case 6:
            goto LABEL_16;
          case 7:
            goto LABEL_15;
          default:
            char v18 = *v14++;
            *v10++ = v18;
LABEL_15:
            char v19 = *v14++;
            *v10++ = v19;
LABEL_16:
            char v20 = *v14++;
            *v10++ = v20;
LABEL_17:
            char v21 = *v14++;
            *v10++ = v21;
LABEL_18:
            char v22 = *v14++;
            *v10++ = v22;
LABEL_19:
            char v23 = *v14++;
            *v10++ = v23;
LABEL_20:
            char v24 = *v14++;
            *v10++ = v24;
LABEL_21:
            char v25 = *v14++;
            *v10++ = v25;
            LOWORD(v28) = v28 - 8;
            __int16 v17 = v28;
            if ((__int16)v28 <= 0) {
              goto LABEL_24;
            }
            continue;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21DC28460(uint64_t a1, _WORD *a2, _DWORD *a3, _WORD *a4, unsigned int a5, BOOL *a6)
{
  uint64_t v11 = a1 + 104;
  int v12 = sub_21DC2850C(a1 + 104);
  *a2 = v12;
  if (v12 <= 0)
  {
    if (*a6)
    {
      uint64_t result = sub_21DC2878C(v11);
      *a4 = result;
      *a6 = result << 16 > 4063232;
      return result;
    }
    goto LABEL_6;
  }
  if (!*a6)
  {
LABEL_6:
    __int16 v13 = v12 + 3;
    goto LABEL_7;
  }
  __int16 v13 = v12 + 2;
LABEL_7:
  *a2 = v13;
  *a6 = 1;
  uint64_t result = sub_21DC288E8(v11, a5);
  *a3 = result;
  return result;
}

uint64_t sub_21DC2850C(uint64_t a1)
{
  switch(sub_21DC2867C(a1, 0xAu))
  {
    case 0u:
      __int16 v2 = sub_21DC286F0(a1, 1);
      break;
    case 1u:
      if ((unsigned __int16)sub_21DC286F0(a1, 1)) {
        __int16 v2 = sub_21DC286F0(a1, 1) + 3;
      }
      else {
        __int16 v2 = 2;
      }
      break;
    case 2u:
      if ((unsigned __int16)sub_21DC286F0(a1, 1)) {
        __int16 v2 = sub_21DC286F0(a1, 2) + 7;
      }
      else {
        __int16 v2 = sub_21DC286F0(a1, 1) + 5;
      }
      break;
    case 3u:
      __int16 v2 = sub_21DC286F0(a1, 3) + 11;
      break;
    case 4u:
      __int16 v2 = sub_21DC286F0(a1, 3) + 19;
      break;
    case 5u:
      __int16 v2 = sub_21DC286F0(a1, 5) + 27;
      break;
    case 6u:
      __int16 v2 = sub_21DC286F0(a1, 6) + 59;
      break;
    case 7u:
      __int16 v2 = sub_21DC286F0(a1, 7) + 123;
      break;
    case 8u:
      __int16 v2 = sub_21DC286F0(a1, 8) + 251;
      break;
    case 9u:
      __int16 v2 = sub_21DC286F0(a1, 9) + 507;
      break;
    default:
      __int16 v2 = sub_21DC286F0(a1, 10) + 1019;
      break;
  }
  return v2;
}

uint64_t sub_21DC2867C(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 16);
  if (a2)
  {
    unsigned int v3 = 0x80u >> (v2 & 7);
    float32x4x2_t v4 = (unsigned char *)(*(void *)(a1 + 8) + (v2 >> 3));
    int v5 = 1;
    while (1)
    {
      unsigned int v6 = v5;
      if ((*v4 & v3) == 0) {
        break;
      }
      if (v3 >= 2)
      {
        v3 >>= 1;
      }
      else
      {
        ++v4;
        unsigned int v3 = 128;
      }
      ++v5;
      if (v6 >= a2)
      {
        uint64_t v7 = v6;
        goto LABEL_11;
      }
    }
    uint64_t v7 = (v5 - 1);
  }
  else
  {
    uint64_t v7 = 0;
    unsigned int v6 = 0;
  }
LABEL_11:
  *(_DWORD *)(a1 + 16) = v6 + v2;
  return v7;
}

uint64_t sub_21DC286F0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = *(unsigned int *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v2 + a2;
  if ((v2 + a2) > *(_DWORD *)(a1 + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  return (bswap32(*(_DWORD *)(*(void *)(a1 + 8) + (v2 >> 3))) >> (32 - a2 - (v2 & 7))) & (0xFFFFFFFF >> -(char)a2);
}

void sub_21DC28780(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0) {
    __cxa_call_unexpected(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21DC2878C(uint64_t a1)
{
  uint64_t v2 = 1;
  if (sub_21DC286F0(a1, 1))
  {
    uint64_t v2 = 2;
    int v3 = sub_21DC286F0(a1, 2);
    if (v3)
    {
      if (v3 == 2)
      {
        return sub_21DC286F0(a1, 2) + 4;
      }
      else if (v3 == 1)
      {
        return 3;
      }
      else
      {
        signed int v4 = sub_21DC286F0(a1, 4) << 16;
        if (v4 >= 0x80000)
        {
          if (v4 >> 18 > 2) {
            return sub_21DC286F0(a1, 3) + (v4 >> 13) - 64;
          }
          else {
            return sub_21DC286F0(a1, 2) + (v4 >> 14) - 16;
          }
        }
        else
        {
          return ((v4 >> 16) + 8);
        }
      }
    }
  }
  return v2;
}

uint64_t sub_21DC28858(uint64_t result, unsigned char *a2, int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  unint64_t v4 = *(unsigned int *)(result + 16);
  unsigned int v5 = v4 + 8 * a3;
  *(_DWORD *)(result + 16) = v5;
  if (v5 > *(_DWORD *)(result + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  if (a3)
  {
    unsigned int v6 = (unsigned __int16 *)(v3 + (v4 >> 3));
    do
    {
      unsigned int v7 = *v6;
      unsigned int v6 = (unsigned __int16 *)((char *)v6 + 1);
      *a2++ = bswap32(v7) >> 16 >> (8 - (v4 & 7));
      --a3;
    }
    while (a3);
  }
  return result;
}

void sub_21DC288DC(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0) {
    __cxa_call_unexpected(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21DC288E8(uint64_t a1, unsigned int a2)
{
  if (a2 >= 0xB)
  {
    if (a2 >= 0x15)
    {
      if (a2 >= 0x29)
      {
        if (a2 >= 0x51)
        {
          if (a2 >= 0xA1)
          {
            if (a2 >= 0x2A1)
            {
              if (a2 >= 0x3E9)
              {
                __int16 v2 = 7;
                if (a2 >= 0xA81)
                {
                  unsigned int v3 = *(_DWORD *)(a1 + 20);
                  if (v3 >= 0x801)
                  {
                    __int16 v2 = 8;
                    if (a2 >= 0x1501 && v3 > 0x1000)
                    {
                      __int16 v2 = 9;
                      if (a2 >= 0x2A01 && v3 > 0x2000)
                      {
                        __int16 v2 = 10;
                        if (a2 >= 0x5401 && v3 > 0x4000)
                        {
                          __int16 v2 = 11;
                          if (a2 >= 0xA801 && v3 > 0x8000)
                          {
                            __int16 v2 = 12;
                            if (a2 >= 0x11171 && v3 > 0x10000)
                            {
                              if (v3 >= 0x20001 && a2 >= 0x2A001) {
                                __int16 v2 = 14;
                              }
                              else {
                                __int16 v2 = 13;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                __int16 v2 = 6;
              }
            }
            else
            {
              __int16 v2 = 5;
            }
          }
          else
          {
            __int16 v2 = 4;
          }
        }
        else
        {
          __int16 v2 = 3;
        }
      }
      else
      {
        __int16 v2 = 2;
      }
    }
    else
    {
      __int16 v2 = 1;
    }
  }
  else
  {
    __int16 v2 = 0;
  }
  return sub_21DC28A14(a1, a2, v2);
}

uint64_t sub_21DC28A14(uint64_t a1, unsigned int a2, int a3)
{
  int v6 = 1;
  if (!sub_21DC286F0(a1, 1))
  {
    uint64_t v12 = a1;
    int v13 = a3;
LABEL_20:
    int v14 = sub_21DC286F0(v12, v13);
    return (v14 + v6);
  }
  if (!sub_21DC286F0(a1, 1))
  {
    int v6 = 1 << a3;
    goto LABEL_16;
  }
  int v6 = (5 << a3) + 1;
  if ((5 << a3) + 2 >= a2)
  {
    uint64_t v12 = a1;
    int v13 = 1;
    goto LABEL_20;
  }
  unsigned int v7 = (5 << a3) + 4;
  if (v7 >= a2)
  {
    uint64_t v12 = a1;
    int v13 = 2;
    goto LABEL_20;
  }
  int v8 = (__int16)(a3 + 4);
  if (v8 >= 3)
  {
    int v9 = 4;
    LOWORD(v10) = 3;
    while (1)
    {
      v7 += v9;
      unsigned int v11 = v7 == 1664 ? 1644 : v7;
      if ((unsigned __int16)v10 == (unsigned __int16)v8 || v11 >= a2) {
        break;
      }
      v9 *= 2;
      int v10 = (__int16)(v10 + 1);
      if (v10 > v8) {
        goto LABEL_16;
      }
    }
    int v13 = (__int16)v10;
    uint64_t v12 = a1;
    goto LABEL_20;
  }
LABEL_16:
  int v14 = v6 + 1;
  int v6 = sub_21DC286F0(a1, a3 + 2);
  return (v14 + v6);
}

void sub_21DC28B30(uint64_t a1)
{
  sub_21DC28B9C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC28B78(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C40F7BC2A52);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC28B9C(uint64_t a1)
{
  sub_21DC24A4C((void *)(a1 + 104));
  return sub_21DC0AB38(a1);
}

void sub_21DC28BD8(_Unwind_Exception *a1)
{
  sub_21DC0AB38(v1);
  _Unwind_Resume(a1);
}

unsigned __int16 *sub_21DC28BF0(unsigned __int16 *result)
{
  *uint64_t result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  LODWORD(v1) = bswap32(result[8]) >> 16;
  if (v1 >= 0x3D) {
    uint64_t v1 = 61;
  }
  else {
    uint64_t v1 = v1;
  }
  result[8] = v1;
  if (v1)
  {
    __int16 v2 = result + 12;
    do
    {
      *(_DWORD *)(v2 - 3) = bswap32(*(_DWORD *)(v2 - 3));
      *(v2 - 1) = bswap32((unsigned __int16)*(v2 - 1)) >> 16;
      *__int16 v2 = bswap32((unsigned __int16)*v2) >> 16;
      v2 += 4;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_21DC28CA4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 88))();
  }
  return result;
}

int8x16_t sub_21DC28CD4(unsigned int *a1, uint64_t a2)
{
  unint64_t v2 = bswap32(*a1);
  *a1 = v2;
  if ((a2 - 4) / 0x14uLL < v2) {
    unint64_t v2 = (a2 - 4) / 0x14uLL;
  }
  if (v2)
  {
    unsigned int v3 = (int8x16_t *)(a1 + 2);
    do
    {
      v3[-1].i32[3] = bswap32(v3[-1].u32[3]);
      int8x16_t result = vrev64q_s8(*v3);
      *unsigned int v3 = result;
      unsigned int v3 = (int8x16_t *)((char *)v3 + 20);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_21DC28D28(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)a1 = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 48) = v2;
  int8x16_t v3 = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = v3;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 100));
  *(_DWORD *)(a1 + 100) = v4;
  uint32x4_t v5 = (uint32x4_t)vextq_s8(v1, v3, 8uLL);
  v5.i32[0] = v2;
  v5.i32[3] = v4;
  if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_u32(v5, (uint32x4_t)xmmword_21DC41E30), (int8x16_t)xmmword_21DC41E40)) & 0xF) != 0)return 107; {
  else
  }
    return 0;
}

CFDictionaryRef sub_21DC28D94(uint64_t a1, int a2)
{
  io_iterator_t existing = 0;
  CFTypeRef cf = 0;
  CFTypeRef v23 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    CFDictionaryRef Copy = 0;
    goto LABEL_19;
  }
  int v6 = Mutable;
  CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x263EFFF70]);
  if (v7)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 280))(a1);
    int v9 = v8;
    if (a2)
    {
      int v9 = sub_21DC290F0(v8);
      if (!v9)
      {
LABEL_10:
        if (CFArrayGetCount(v7)) {
          CFDictionarySetValue(v6, @"system-entities", v7);
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      CFRetain(v8);
    }
    mach_port_t v11 = *MEMORY[0x263F0EC90];
    CFDictionaryRef v12 = IOServiceMatching("IOMedia");
    if (!IOServiceGetMatchingServices(v11, v12, &existing))
    {
      if (!IOIteratorIsValid(existing)) {
        MEMORY[0x223C15CD0](existing);
      }
      io_object_t v14 = IOIteratorNext(existing);
      if (v14)
      {
        io_registry_entry_t v15 = v14;
        do
        {
          CFDictionaryRef v16 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v15, "IOService", @"backingstore-id", v4, 3u);
          CFDictionaryRef v17 = v16;
          if (a2)
          {
            char v18 = sub_21DC290F0(v16);
            if (v17) {
              CFRelease(v17);
            }
          }
          else
          {
            char v18 = v16;
          }
          if (v18)
          {
            if (CFEqual(v9, v18))
            {
              if (sub_21DC10F0C(v15, (CFStringRef *)&v23))
              {
                CFTypeRef CFProperty = 0;
              }
              else
              {
                CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v15, @"Content", v4, 0);
                sub_21DC10FE0(v23, &cf, 0, 0);
                char v20 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                if (v20)
                {
                  char v21 = v20;
                  if (v23) {
                    CFDictionarySetValue(v20, @"dev-entry", v23);
                  }
                  if (cf) {
                    CFDictionarySetValue(v21, @"mount-point", cf);
                  }
                  if (CFProperty) {
                    CFDictionarySetValue(v21, @"content-hint", CFProperty);
                  }
                  if (CFDictionaryGetCount(v21)) {
                    CFArrayAppendValue(v7, v21);
                  }
                  CFRelease(v21);
                }
              }
              if (v23)
              {
                CFRelease(v23);
                CFTypeRef v23 = 0;
              }
              if (cf)
              {
                CFRelease(cf);
                CFTypeRef cf = 0;
              }
              if (CFProperty) {
                CFRelease(CFProperty);
              }
            }
            CFRelease(v18);
          }
          IOObjectRelease(v15);
          io_registry_entry_t v15 = IOIteratorNext(existing);
        }
        while (v15);
      }
    }
    goto LABEL_10;
  }
LABEL_12:
  if (CFDictionaryGetCount(v6)) {
    CFDictionaryRef Copy = CFDictionaryCreateCopy(v4, v6);
  }
  else {
    CFDictionaryRef Copy = 0;
  }
  CFRelease(v6);
  if (v7) {
    CFRelease(v7);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
LABEL_19:
  if (v23)
  {
    CFRelease(v23);
    CFTypeRef v23 = 0;
  }
  if (existing) {
    IOObjectRelease(existing);
  }
  return Copy;
}

__CFSet *sub_21DC290F0(const __CFDictionary *a1)
{
  CFMutableDictionaryRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFFA0]);
  if (a1)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"writeable-components");
    sub_21DC29170(Mutable, Value);
    CFArrayRef v4 = (const __CFArray *)CFDictionaryGetValue(a1, @"readonly-components");
    sub_21DC29170(Mutable, v4);
  }
  return Mutable;
}

void sub_21DC29170(__CFSet *a1, CFArrayRef theArray)
{
  if (a1)
  {
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          CFSetAddValue(a1, ValueAtIndex);
        }
      }
    }
  }
}

__CFDictionary *sub_21DC291E4(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int8x16_t v3 = sub_21DC14E50(a1, @"Geometry");
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFDictionarySetValue(Mutable, @"Geometry", v3);
    CFRelease(v4);
  }
  CFIndex v5 = sub_21DC14E50(a1, @"Writable");
  if (v5)
  {
    int v6 = v5;
    CFDictionarySetValue(Mutable, @"Writable", v5);
    CFRelease(v6);
  }
  return Mutable;
}

__CFDictionary *sub_21DC292AC(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  CFStringRef v2 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 192))(v1);
  int8x16_t v3 = (char *)sub_21DC0373C(v2, 0x8000100u);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v6 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x263EFFF70]);
  CFDictionarySetValue(Mutable, @"system-entities", v7);
  CFRelease(v7);
  if (*v3 == 114) {
    ++v3;
  }
  CFDictionaryRef v8 = CFArrayCreateMutable(v4, 0, v6);
  if (*v3 == 114) {
    int v9 = v3 + 1;
  }
  else {
    int v9 = v3;
  }
  uint64_t v10 = sub_21DC02204(v9);
  if (v10)
  {
    io_object_t v11 = v10;
    sub_21DC2F4B8(v10, v8);
    IOObjectRelease(v11);
  }
  if (v8)
  {
    char v22 = Mutable;
    CFIndex Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0;
      io_registry_entry_t v15 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      do
      {
        CFStringRef theString = 0;
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v14);
        CFDictionaryRef v17 = sub_21DC166D0(ValueAtIndex, @"BSD Name");
        CFStringRef v18 = CFStringCreateWithFormat(v4, 0, @"/dev/%@", v17);
        CFStringRef v19 = (const __CFString *)sub_21DC166D0(ValueAtIndex, @"Content");
        sub_21DC10FE0(v18, (CFTypeRef *)&theString, 0, 0);
        char v20 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], v15);
        CFDictionarySetValue(v20, @"dev-entry", v18);
        if (v19 && CFStringGetLength(v19)) {
          CFDictionarySetValue(v20, @"content-hint", v19);
        }
        if (theString && CFStringGetLength(theString)) {
          CFDictionarySetValue(v20, @"mount-point", theString);
        }
        CFArrayAppendValue(v7, v20);
        if (v20) {
          CFRelease(v20);
        }
        if (v18) {
          CFRelease(v18);
        }
        ++v14;
      }
      while (v13 != v14);
    }
    CFRelease(v8);
    return v22;
  }
  return Mutable;
}

uint64_t DIDiskImageGetImageFormat(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 88))();
}

uint64_t sub_21DC29570(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = 0;
    *a3 = 0;
    operator new();
  }
  return 22;
}

void sub_21DC297AC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C400F414A5CLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC297D0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 192);
}

uint64_t sub_21DC297D8(uint64_t result)
{
  return result;
}

__CFDictionary *sub_21DC297E8(uint64_t *a1)
{
  CFStringRef v2 = sub_21DC26910((uint64_t)a1);
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    uint64_t v5 = DIGetBundleRef();
    if (v5)
    {
      CFTypeRef v6 = sub_21DC3A890(v5, (int)@"sparse", @"sparse");
      CFDictionaryAddValue(v2, @"Format Description", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFDictionaryAddValue(v2, @"Format", @"SPRS");
      uint64_t v22 = 0;
      uint64_t v18 = 0;
      unint64_t v7 = (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1) << 9;
      unint64_t valuePtr = v7;
      uint64_t v8 = sub_21DC29B10(a1[20]);
      unint64_t v9 = ((*(uint64_t (**)(uint64_t))(*(void *)a1[20] + 64))(a1[20]) * v8) << 9;
      if (v9 >= v7) {
        unint64_t v9 = v7;
      }
      unint64_t v20 = v9;
      unint64_t v19 = v7 - v9;
      CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Bytes", v10);
      if (v10) {
        CFRelease(v10);
      }
      CFNumberRef v11 = CFNumberCreate(v3, kCFNumberLongLongType, &v19);
      CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v11);
      if (v11) {
        CFRelease(v11);
      }
      CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &v20);
      CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v12);
      if (v12) {
        CFRelease(v12);
      }
      CFNumberRef v13 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Compressed Bytes", v13);
      if (v13) {
        CFRelease(v13);
      }
      uint64_t v18 = 0x3FF0000000000000;
      CFNumberRef v14 = CFNumberCreate(v3, kCFNumberDoubleType, &v18);
      CFDictionaryAddValue(Mutable, @"Compressed Ratio", v14);
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v22 = (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1);
      CFNumberRef v15 = CFNumberCreate(v3, kCFNumberLongLongType, &v22);
      CFDictionaryAddValue(Mutable, @"Sector Count", v15);
      if (v15) {
        CFRelease(v15);
      }
      CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
      CFDictionaryAddValue(Value, @"Compressed", @"no");
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

const char *sub_21DC29B04()
{
  return "CSparseDiskImage";
}

uint64_t sub_21DC29B10(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (!v1) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  LODWORD(result) = 0;
  do
  {
    if (*v1++) {
      uint64_t result = (result + 1);
    }
    else {
      uint64_t result = result;
    }
    --v2;
  }
  while (v2);
  return result;
}

uint64_t sub_21DC29B44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64))(*(void *)(a1 + 160)) << 27;
}

uint64_t DIBackingStoreGetDataForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 296))();
}

uint64_t sub_21DC29BB0(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 212);
  return 0;
}

uint64_t DIBackingStoreReadDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 328))();
}

uint64_t DIBackingStoreOpenResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 344))();
}

uint64_t DIResourceFileChangedResource(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 176))();
}

uint64_t DIResourceFileUpdateResFile(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 200))();
}

uint64_t DIBackingStoreCloseResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 352))(a1, 0);
}

uint64_t sub_21DC29C9C()
{
  return 1;
}

uint64_t sub_21DC29CA4(uint64_t a1, int a2, CFURLRef *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  if (a2 < 1) {
    return 22;
  }
  CFTypeRef v6 = *(const char **)(a1 + 296);
  if (!v6) {
    return 9;
  }
  strlcpy(__dst, v6, 0x400uLL);
  unint64_t v7 = &__dst[strlen(*(const char **)(a1 + 296)) - 1];
  if (v7 > __dst)
  {
    while (*v7 == 47)
    {
      *v7-- = 0;
      if (v7 <= __dst)
      {
LABEL_11:
        unint64_t v7 = __dst;
        goto LABEL_12;
      }
    }
  }
  if (v7 > __dst)
  {
    while (*v7 != 47)
    {
      if (--v7 <= __dst) {
        goto LABEL_11;
      }
    }
  }
LABEL_12:
  *unint64_t v7 = 0;
  if (!__dst[0]) {
    strcpy(__dst, ".");
  }
  uint64_t v8 = opendir(__dst);
  if (!v8) {
    return 999;
  }
  unint64_t v9 = v8;
  int v10 = a2 + 1;
  do
  {
    CFNumberRef v11 = readdir(v9);
    CFNumberRef v12 = v11;
    BOOL v13 = v10-- != 0;
  }
  while (v13 && v11);
  if (v11)
  {
    strlcat(__dst, "/", 0x400uLL);
    strlcat(__dst, v12->d_name, 0x400uLL);
    uint64_t v14 = sub_21DC29E3C(__dst, a3);
  }
  else
  {
    uint64_t v14 = 0;
  }
  closedir(v9);
  return v14;
}

uint64_t sub_21DC29E3C(char *cStr, CFURLRef *a2)
{
  if (!a2) {
    return 22;
  }
  *a2 = 0;
  if (!cStr) {
    return 22;
  }
  if (!*cStr) {
    return 22;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (!v5) {
    return 22;
  }
  CFStringRef v6 = v5;
  memset(&v9, 0, sizeof(v9));
  Boolean v7 = stat(cStr, &v9) >= 0 && (v9.st_mode & 0x4000) != 0;
  *a2 = CFURLCreateWithFileSystemPath(v4, v6, kCFURLPOSIXPathStyle, v7);
  CFRelease(v6);
  return 0;
}

const void *sub_21DC29F14(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFAllocatorRef v3 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC29F54(void *a1, uint64_t a2)
{
  if (a1[20] == a2) {
    return 0;
  }
  uint64_t v5 = a2 << 9;
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 312))(v6, v5);
  if (!result) {
    a1[20] = a2;
  }
  return result;
}

uint64_t DIBackingStoreGetURL(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 176))();
}

uint64_t sub_21DC2A020(void *a1)
{
  uint64_t v2 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
  CFStringRef v3 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 192))(v2);
  CFAllocatorRef v4 = (char *)sub_21DC0373C(v3, 0x8000100u);
  syslog(6, "compaction requested for %s", v4);
  free(v4);
  (*(void (**)(void *, __CFString *, void))(*a1 + 32))(a1, @"on IO thread", *MEMORY[0x263EFFB40]);
  if ((*(uint64_t (**)(void *))(*a1 + 288))(a1))
  {
    uint64_t v5 = a1[17];
    if (!v5 || !(*(unsigned int (**)(uint64_t))(*(void *)v5 + 432))(v5)) {
      operator new();
    }
    syslog(4, "compaction rejected because image is in use");
    return 16;
  }
  else
  {
    syslog(4, "compaction rejected because image is not write-enabled");
    return 1;
  }
}

void sub_21DC2A214(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40A0872A6ALL);
  _Unwind_Resume(a1);
}

void *sub_21DC2A23C(void *a1, char *a2, const void *a3)
{
  *a1 = &unk_26CE87B38;
  a1[1] = a2;
  DIDiskImageObjectRetain_0(a2);
  uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)a2 + 96))(a2);
  a1[6] = 0;
  a1[7] = v6;
  a1[4] = 0;
  a1[5] = 0;
  a1[2] = sub_21DC16C04();
  a1[3] = a3;
  if (a3) {
    CFRetain(a3);
  }
  return a1;
}

uint64_t sub_21DC2A2E0(uint64_t a1)
{
  int v2 = DIGetBundleRef();
  CFTypeRef v3 = sub_21DC3A890(v2, (int)@"Starting to compact\\U2026", @"Starting to compact\\U2026");
  (*(void (**)(void))(**(void **)(a1 + 8) + 336))();
  if (v3) {
    CFRelease(v3);
  }
  (*(void (**)(void, float))(**(void **)(a1 + 8) + 344))(*(void *)(a1 + 8), -1.0);
  (*(void (**)(void))(**(void **)(a1 + 8) + 360))();
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 8) + 128))(*(void *)(a1 + 8), 0);
  if (!result)
  {
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 8) + 352))(*(void *)(a1 + 8)))
    {
      int v5 = 222;
LABEL_6:
      syslog(5, "CDiskImageCompactor::compact: line %d: returning kDI_USERCANCELED", v5);
      return 111;
    }
    int v6 = DIGetBundleRef();
    CFTypeRef v7 = sub_21DC3A890(v6, (int)@"Reclaiming free space\\U2026", @"Reclaiming free space\\U2026");
    (*(void (**)(void))(**(void **)(a1 + 8) + 336))();
    if (v7) {
      CFRelease(v7);
    }
    uint64_t result = sub_21DC2A7C4(a1);
    if (!result)
    {
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 8) + 352))(*(void *)(a1 + 8)))
      {
        int v5 = 241;
        goto LABEL_6;
      }
      int v8 = DIGetBundleRef();
      CFTypeRef v9 = sub_21DC3A890(v8, (int)@"Finishing compaction\\U2026", @"Finishing compaction\\U2026");
      (*(void (**)(void))(**(void **)(a1 + 8) + 336))();
      if (v9) {
        CFRelease(v9);
      }
      (*(void (**)(void, float))(**(void **)(a1 + 8) + 344))(*(void *)(a1 + 8), -1.0);
      (*(void (**)(void))(**(void **)(a1 + 8) + 360))();
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 8) + 136))(*(void *)(a1 + 8), 0);
      if (!result)
      {
        CFStringRef v10 = sub_21DC2ACF8(*(void *)(a1 + 40) << 9);
        CFStringRef v11 = sub_21DC2ACF8(*(void *)(a1 + 48) << 9);
        int v12 = DIGetBundleRef();
        CFStringRef v13 = (const __CFString *)sub_21DC3A890(v12, (int)@"Reclaimed %1$@ out of %2$@ possible.", @"Reclaimed %1$@ out of %2$@ possible.");
        CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v13, v10, v11);
        (*(void (**)(void))(**(void **)(a1 + 8) + 336))();
        CFNumberRef v15 = (char *)sub_21DC0373C(v14, 0x8000100u);
        syslog(5, "%s", v15);
        free(v15);
        if (v14) {
          CFRelease(v14);
        }
        if (v13) {
          CFRelease(v13);
        }
        if (v10) {
          CFRelease(v10);
        }
        if (v11) {
          CFRelease(v11);
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_21DC2A758(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_21DC0C7FC(a1);
  if (result)
  {
    int v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void, void))sub_21DC0C7FC(a1);
    return v5(3, a1, a2, 0, 0, 0);
  }
  return result;
}

uint64_t sub_21DC2A7C4(uint64_t a1)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"partitions");
  if (!Value) {
    return 22;
  }
  CFArrayRef v3 = Value;
  CFIndex Count = CFArrayGetCount(Value);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    uint64_t v16 = 0;
    uint64_t valuePtr = 0;
    do
    {
      CFNumberRef v15 = 0;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"partition-hint");
      if (CFStringCompare(v8, @"Apple_HFS", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"Apple_HFSX", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"Apple_APFS", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"not partitioned", 1uLL) == kCFCompareEqualTo)
      {
        if ((*(uint64_t (**)(void))(**(void **)(a1 + 8) + 352))(*(void *)(a1 + 8))) {
          return 111;
        }
        CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"partition-start");
        if (v9)
        {
          CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
          CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"partition-length");
          if (v10)
          {
            CFNumberGetValue(v10, kCFNumberLongLongType, &v16);
            uint64_t v11 = sub_21DC16734(*(void *)(a1 + 8), valuePtr, v16, &v15);
            if (v11) {
              return v11;
            }
            uint64_t v12 = sub_21DC2AA00(a1, (uint64_t)v15, valuePtr);
            if (v15)
            {
              DIDiskImageObjectRelease(v15);
              CFNumberRef v15 = 0;
            }
            if (v12) {
              return v12;
            }
            float v13 = (float)(v16 + valuePtr);
            *(void *)(a1 + 32) = v16 + valuePtr;
            (*(void (**)(void, float))(**(void **)(a1 + 8) + 344))(*(void *)(a1 + 8), (float)(v13 * 100.0) / (float)*(uint64_t *)(a1 + 56));
          }
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
  return 0;
}

uint64_t sub_21DC2AA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return 12;
  }
  CFDictionaryRef v8 = Mutable;
  unsigned __int16 valuePtr = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  CFNumberRef v9 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionarySetValue(Mutable, @"Writable", (const void *)*MEMORY[0x263EFFB40]);
  unsigned int MKMediaRef = DIMediaKitCreateMKMediaRef(a2, 0, v8, (uint64_t *)&cf);
  unsigned int v33 = MKMediaRef;
  CFRelease(v8);
  if (!MKMediaRef)
  {
    uint64_t v11 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v11)
    {
      uint64_t v12 = v11;
      CFDictionarySetValue(v11, @"Record Off Bits", v9);
      CFDictionaryRef v13 = (const __CFDictionary *)MKCFCreateFSInfo();
      CFRelease(v12);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (v33)
      {
LABEL_7:
        if (!v13) {
          return v33;
        }
        goto LABEL_33;
      }
      if (v13)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v13, @"Attributes");
        if (sub_21DC03648(Value, @"Dirty", 0)
          && !sub_21DC03648(*(const __CFDictionary **)(a1 + 24), @"allow-compact-busy-filesystem", 0))
        {
          syslog(4, "cannot compact filesystem because it was not unmounted cleanly.");
        }
        else
        {
          CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v13, @"Data Runs");
          if (v17)
          {
            CFArrayRef v18 = v17;
            CFIndex Count = CFArrayGetCount(v17);
            if (Count >= 1)
            {
              CFIndex v20 = Count;
              for (CFIndex i = 0; i != v20; ++i)
              {
                uint64_t v30 = 0;
                uint64_t v31 = 0;
                CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v18, i);
                if (!ValueAtIndex) {
                  break;
                }
                CFDictionaryRef v23 = ValueAtIndex;
                CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Type");
                if (v24)
                {
                  CFNumberGetValue(v24, kCFNumberSInt16Type, &valuePtr);
                  CFNumberRef v25 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Origin");
                  if (v25) {
                    CFNumberGetValue(v25, kCFNumberSInt64Type, &v31);
                  }
                  v31 += a3;
                  if (valuePtr <= 1u)
                  {
                    CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Length");
                    if (v26) {
                      CFNumberGetValue(v26, kCFNumberSInt64Type, &v30);
                    }
                    if (!valuePtr)
                    {
                      uint64_t v27 = v31;
                      *(void *)(a1 + 48) += v30;
                      unsigned int v33 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 144))(*(void *)(a1 + 8), v27);
                      if (!v33) {
                        *(void *)(a1 + 40) += v29;
                      }
                    }
                  }
                }
              }
              goto LABEL_7;
            }
LABEL_33:
            CFRelease(v13);
            return v33;
          }
        }
        unsigned int v33 = 999;
        goto LABEL_33;
      }
      return 999;
    }
    return 12;
  }
  return v33;
}

uint64_t sub_21DC2ACF0()
{
  return 0;
}

CFStringRef sub_21DC2ACF8(unint64_t a1)
{
  double v1 = (double)a1 * 0.0009765625;
  double v2 = v1 * 0.0009765625;
  double v3 = v1 * 0.0009765625 * 0.0009765625;
  double v4 = v3 * 0.0009765625;
  if (v3 * 0.0009765625 >= 1.0)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v4 == floor(v4)) {
      return CFStringCreateWithFormat(v6, 0, @"%qd TB", (unint64_t)v4);
    }
    else {
      return CFStringCreateWithFormat(v6, 0, @"%.1f TB", v3 * 0.0009765625);
    }
  }
  else if (v3 >= 1.0)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v3 == floor(v3)) {
      return CFStringCreateWithFormat(v7, 0, @"%qd GB", (unint64_t)v3);
    }
    else {
      return CFStringCreateWithFormat(v7, 0, @"%.1f GB", *(void *)&v3);
    }
  }
  else if (v2 >= 1.0)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v2 == floor(v2)) {
      return CFStringCreateWithFormat(v8, 0, @"%qd MB", (unint64_t)v2);
    }
    else {
      return CFStringCreateWithFormat(v8, 0, @"%.1f MB", *(void *)&v2);
    }
  }
  else if (v1 >= 1.0)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v1 == floor(v1)) {
      return CFStringCreateWithFormat(v9, 0, @"%qd KB", (unint64_t)v1);
    }
    else {
      return CFStringCreateWithFormat(v9, 0, @"%.1f KB", *(void *)&v1);
    }
  }
  else
  {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%qd bytes", a1);
  }
}

void sub_21DC2AE6C(void *a1)
{
  sub_21DC2AED8(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC2AEB4(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40A0872A6ALL);
  _Unwind_Resume(a1);
}

void *sub_21DC2AED8(void *a1)
{
  *a1 = &unk_26CE87B38;
  double v2 = (char *)a1[1];
  if (v2) {
    sub_21DC0474C(v2);
  }
  double v3 = (const void *)a1[2];
  if (v3) {
    CFRelease(v3);
  }
  double v4 = (const void *)a1[3];
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

CFStringRef sub_21DC2AF3C(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!a1 || sub_21DC3C6E8(a1, v5, 0x400uLL)) {
    return 0;
  }
  CFStringRef v1 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"/dev/%s", v5);
  int HasPrefix = CFStringHasPrefix(v1, @"/dev/disk");
  if (v1) {
    BOOL v3 = HasPrefix == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

void *sub_21DC2AFF0(uint64_t a1)
{
  CFStringRef v1 = sub_21DC2AF3C(a1);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v8.CFIndex length = CFStringGetLength(v1) - 5;
  v8.location = 5;
  CFStringRef v4 = CFStringCreateWithSubstring(v3, v2, v8);
  if (v4)
  {
    CFStringRef v5 = v4;
    uint64_t v6 = sub_21DC1BA9C(v4);
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  CFRelease(v2);
  return v6;
}

uint64_t DIBackingStoreGetRsrcForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 376))();
}

uint64_t DIBackingStoreOpenDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 272))();
}

uint64_t DIBackingStoreCloseDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
}

uint64_t DIChecksumGetValue(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

uint64_t sub_21DC2B12C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 72))();
}

uint64_t DIShadowedDiskImageCopyDefaultShadowFileURL()
{
  return 0;
}

uint64_t DIResourceFileAddResource(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 168))();
}

uint64_t DIResourceFileGetResource(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 120))();
}

uint64_t DIResourceFileReleaseResource(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 240))();
}

__CFBundle *DIGetDriverVersion()
{
  uint64_t result = CFBundleGetBundleWithIdentifier(@"com.apple.AppleDiskImageController");
  if (result)
  {
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  }
  return result;
}

__CFBundle *DIGetFrameworkVersion()
{
  uint64_t result = (__CFBundle *)DIGetBundleRef();
  if (result)
  {
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  }
  return result;
}

BOOL DIIsPotentiallyValidDiskImage(char *a1, int a2)
{
  if (!a1 || !sub_21DC01FB0()) {
    return 0;
  }
  CFNumberRef v10 = 0;
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)CFAllocatorRef v9 = 0;
  if (a2)
  {
    int v5 = DIResolvePathsToDiskImageWithOptions(a1, 0, Mutable, 7u, 1, &v10, 0);
    CFURLRef v6 = 0;
    BOOL v7 = v5 == 0;
    if (!Mutable) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  CFURLRef v6 = sub_21DC12640(a1);
  if (v6)
  {
    if (DIHLDiskImageProbeURL()) {
      goto LABEL_9;
    }
    CFDictionarySetValue(Mutable, @"DIIsPotentiallyValidDiskImage", (const void *)*MEMORY[0x263EFFB40]);
    if (!DIResolveURLToBackingStore((uint64_t)v6, (uint64_t)Mutable, 1u, v9, 0))
    {
      if ((int)sub_21DC067D8(*(uint64_t *)v9, 0) > 0 || (int)sub_21DC05E40(*(uint64_t *)v9, 0) > 0)
      {
LABEL_9:
        BOOL v7 = 1;
        if (!Mutable) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      BOOL v7 = (int)sub_21DC07618(*(uint64_t *)v9, 0) > 0;
      if (!Mutable) {
        goto LABEL_14;
      }
LABEL_13:
      CFRelease(Mutable);
      goto LABEL_14;
    }
  }
  BOOL v7 = 0;
  if (Mutable) {
    goto LABEL_13;
  }
LABEL_14:
  if (v6) {
    CFRelease(v6);
  }
  if (*(void *)v9)
  {
    DIDiskImageObjectRelease(*(char **)v9);
    *(void *)CFAllocatorRef v9 = 0;
  }
  if (v10) {
    DIDiskImageObjectRelease(v10);
  }
  return v7;
}

uint64_t DIResolvePathsToDiskImageWithOptions(char *a1, const char *a2, const __CFDictionary *a3, unsigned int a4, int a5, void *a6, CFTypeRef *a7)
{
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  uint64_t v14 = 22;
  if (a1 && a6)
  {
    if (!sub_21DC01FB0()) {
      return 119;
    }
    CFURLRef v15 = sub_21DC12640(a1);
    if (!v15)
    {
      uint64_t v14 = 999;
LABEL_27:
      if (a7 && *a7 && !CFStringGetLength((CFStringRef)*a7) && *a7)
      {
        CFRelease(*a7);
        *a7 = 0;
      }
      return v14;
    }
    CFURLRef v16 = v15;
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (a3) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    unint64_t v19 = MutableCopy;
    CFStringRef v20 = CFStringCreateWithCString(v17, a1, 0x8000100u);
    if (v20)
    {
      CFDictionarySetValue(v19, @"image-path", v20);
      DIAddPermission(v19, a5);
      if (!a2) {
        goto LABEL_18;
      }
      a2 = (const char *)CFStringCreateWithCString(v17, a2, 0x8000100u);
      if (a2)
      {
        CFDictionarySetValue(v19, @"shadow-file", a2);
LABEL_18:
        uint64_t v14 = DIResolveURLToDiskImage((uint64_t)v16, v19, a4, a6, a7);
        if (!v19) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
    else
    {
      a2 = 0;
    }
    uint64_t v14 = 999;
    if (!v19)
    {
LABEL_23:
      if (v20) {
        CFRelease(v20);
      }
      CFRelease(v16);
      if (a2) {
        CFRelease(a2);
      }
      goto LABEL_27;
    }
LABEL_22:
    CFRelease(v19);
    goto LABEL_23;
  }
  return v14;
}

uint64_t DIResolvePathsToDiskImage(char *a1, const char *a2, unsigned int a3, int a4, void *a5, CFTypeRef *a6)
{
  if (!sub_21DC01FB0()) {
    return 119;
  }
  return DIResolvePathsToDiskImageWithOptions(a1, a2, 0, a3, a4, a5, a6);
}

uint64_t sub_21DC2B638(uint64_t a1, const uint8_t *a2, int a3, uint8_t *a4, int a5)
{
  if (!a3) {
    return 0;
  }
  compression_algorithm v10 = (*(unsigned int (**)(uint64_t))(*(void *)a1 + 56))(a1);
  size_t v11 = compression_decode_scratch_buffer_size(v10);
  uint64_t v12 = malloc_type_malloc(v11, 0xBC9E6D18uLL);
  if (!v12) {
    return 12;
  }
  CFDictionaryRef v13 = v12;
  compression_algorithm v14 = (*(unsigned int (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (compression_decode_buffer(a4, a5, a2, a3, v13, v14)) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 1000;
  }
  free(v13);
  return v15;
}

const char *sub_21DC2B72C()
{
  return "CDecompressor";
}

void sub_21DC2B738(void *a1)
{
}

uint64_t DIUDIFFileAccessWriteResourceFile_0(uint64_t a1)
{
  uint64_t v29 = 0;
  if (*(_DWORD *)(a1 + 644) > 1u) {
    return 78;
  }
  int v2 = *(_DWORD *)(a1 + 140);
  uint64_t v3 = DIUDIFFileAccessOpenFile_0(a1);
  if (!v3)
  {
    uint64_t v28 = 0;
    uint64_t v4 = *(void *)(a1 + 664);
    if (v4)
    {
      CFDictionaryRef v5 = sub_21DC1B528(v4);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (Mutable)
        {
          CFAllocatorRef v9 = Mutable;
          CFDictionarySetValue(Mutable, @"resource-fork", v6);
          CFRelease(v6);
          CFDataRef Data = CFPropertyListCreateData(v7, v9, kCFPropertyListXMLFormat_v1_0, 0, 0);
          if (Data)
          {
            CFDataRef v11 = Data;
            CFIndex Length = CFDataGetLength(Data);
            uint64_t v13 = *(void *)(a1 + 168);
            uint64_t v14 = *(void *)(a1 + 176);
            uint64_t v12 = (uint64_t *)(a1 + 168);
            uint64_t v15 = *(void *)(a1 + 344);
            uint64_t v16 = *(void *)(a1 + 352);
            uint64_t v3 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296))(*(void *)(a1 + 112), &v29);
            if (v3)
            {
LABEL_8:
              CFRelease(v9);
              CFRelease(v11);
LABEL_14:
              DIUDIFFileAccessCloseFile_0(a1);
              return v3;
            }
            uint64_t v19 = v14 + v13;
            if (*(_DWORD *)(a1 + 644) == 1) {
              v29 -= 512;
            }
            if (v19 && v19 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 168);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312))(*(void *)(a1 + 112));
              if (v3) {
                goto LABEL_8;
              }
              uint64_t v19 = 0;
              *uint64_t v12 = 0;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0;
            }
            CFStringRef v20 = (uint64_t *)(a1 + 344);
            uint64_t v21 = v16 + v15;
            if (v21 && v21 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 344);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312))(*(void *)(a1 + 112));
              if (v3) {
                goto LABEL_8;
              }
              uint64_t v21 = 0;
              *CFStringRef v20 = 0;
              *(void *)(a1 + 352) = 0;
            }
            if (!v19) {
              goto LABEL_30;
            }
            if (v19 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 168);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312))(*(void *)(a1 + 112));
              if (v3) {
                goto LABEL_8;
              }
              *uint64_t v12 = 0;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0;
LABEL_30:
              if (!v21)
              {
                uint64_t v22 = 0;
                CFIndex v23 = 0;
                CFIndex v24 = Length;
                goto LABEL_44;
              }
              uint64_t v22 = *v20;
              CFIndex v23 = v21 - *v20;
LABEL_43:
              CFIndex v24 = Length;
              *CFStringRef v20 = 0;
              v20[1] = 0;
LABEL_44:
              if (v23 < v24)
              {
                uint64_t v22 = v29;
                v29 += v24;
                uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312))(*(void *)(a1 + 112));
                if (v3) {
                  goto LABEL_8;
                }
                CFIndex v24 = Length;
              }
              uint64_t v25 = *(void *)(a1 + 112);
              BytePtr = CFDataGetBytePtr(v11);
              uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, CFIndex, uint64_t *, const UInt8 *))(*(void *)v25
                                                                                                  + 336))(v25, v22, v24, &v28, BytePtr);
              if (!v3)
              {
                *(void *)(a1 + 344) = v22;
                *(void *)(a1 + 352) = Length;
                *(_DWORD *)(a1 + 140) = *(_DWORD *)(a1 + 140) & 0xFFFFFFFC | 1;
                uint64_t v3 = sub_21DC13144(a1);
                if (!(v3 | v2 & 1))
                {
                  if (*(void *)(a1 + 176)) {
                    uint64_t v3 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 112) + 392))(*(void *)(a1 + 112), 0);
                  }
                  else {
                    uint64_t v3 = 0;
                  }
                }
              }
              goto LABEL_8;
            }
            if (!v21)
            {
              uint64_t v22 = *v12;
              CFIndex v23 = v19 - *v12;
              CFStringRef v20 = (uint64_t *)(a1 + 168);
              goto LABEL_43;
            }
            uint64_t v22 = *v12;
            CFIndex v23 = v19 - *v20;
            if (v19 == *v20)
            {
              CFIndex v23 = v21 - v22;
LABEL_42:
              *uint64_t v12 = 0;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0;
              goto LABEL_43;
            }
            if (v21 != v22)
            {
              if (*(void *)(a1 + 176) > *(void *)(a1 + 352))
              {
                CFIndex v23 = v19 - v22;
                goto LABEL_42;
              }
              CFIndex v23 = v21 - *v20;
            }
            uint64_t v22 = *v20;
            goto LABEL_42;
          }
          CFAllocatorRef v17 = v9;
        }
        else
        {
          CFAllocatorRef v17 = v6;
        }
        CFRelease(v17);
      }
    }
    uint64_t v3 = 999;
    goto LABEL_14;
  }
  return v3;
}

const char *sub_21DC2BB8C()
{
  return "CUDIFFileAccess";
}

void sub_21DC2BB98(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      int v3 = a1;
      uint64_t v4 = (char *)malloc_type_malloc(0x80uLL, 0x8CFC6A6uLL);
      CFDictionaryRef v5 = (char *)malloc_type_malloc(0x80uLL, 0x58A26965uLL);
      char *v4 = 0;
      char *v5 = 0;
      LODWORD(v6) = v3 / 16;
      if ((v3 & 0xF) != 0) {
        uint64_t v6 = (v6 + 1);
      }
      else {
        uint64_t v6 = v6;
      }
      uint64_t v13 = v6;
      __s2 = v5;
      if ((int)v6 >= 1)
      {
        uint64_t v7 = 0;
        int v15 = 0;
        while (1)
        {
          uint64_t v8 = 0;
          if (v3 >= 16) {
            int v9 = 16;
          }
          else {
            int v9 = v3;
          }
          char *v4 = 0;
          uint64_t v10 = v9;
          do
          {
            if (v8 < v10) {
              snprintf(__str, 3uLL, "%02X", *(unsigned __int8 *)(v2 + v8));
            }
            __strlcat_chk();
            if (v8) {
              __strlcat_chk();
            }
            ++v8;
          }
          while (v8 != 16);
          int v16 = v3;
          __strlcat_chk();
          for (uint64_t i = 0; i != 16; ++i)
          {
            if (i < v10 && *(char *)(v2 + i) < 0) {
              __maskrune(*(char *)(v2 + i), 0x40000uLL);
            }
            __strlcat_chk();
          }
          __strlcat_chk();
          if (v7)
          {
            if (!strcmp(v4, __s2))
            {
              ++v15;
              goto LABEL_32;
            }
            uint64_t v12 = (FILE **)MEMORY[0x263EF8348];
            if (v15) {
              fprintf((FILE *)*MEMORY[0x263EF8348], "(repeated %d times)\n", v15);
            }
            fprintf(*v12, "%08lX: ", 16 * v7);
          }
          else
          {
            uint64_t v12 = (FILE **)MEMORY[0x263EF8348];
            fprintf((FILE *)*MEMORY[0x263EF8348], "%08lX: ", 0);
          }
          fputs(v4, *v12);
          __strlcpy_chk();
          int v15 = 0;
LABEL_32:
          int v3 = v16 - v10;
          v2 += v10;
          if (++v7 == v13)
          {
            if (v15) {
              fprintf((FILE *)*MEMORY[0x263EF8348], "(repeated %d times)\n", v15);
            }
            break;
          }
        }
      }
      free(__s2);
      free(v4);
    }
  }
}

uint64_t sub_21DC2BE70()
{
  return 78;
}

uint64_t sub_21DC2BE78(uint64_t a1)
{
  if (a1) {
    return sub_21DC2B12C(a1);
  }
  return a1;
}

BOOL sub_21DC2BE84()
{
  CFDictionaryRef v0 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  CFDictionaryRef v1 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  if (v0) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  CFDictionaryGetValue(v1, @"Sections");
  CFDictionaryRef v3 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v3, @"Partitions");
  CFIndex Count = CFArrayGetCount(Value);
  if (Count < 1) {
    return 0;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0;
  unint64_t v8 = 0;
  do
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v7);
    uint64_t v24 = 0;
    uint64_t valuePtr = 0;
    CFNumberRef v10 = (const __CFNumber *)sub_21DC11C7C(ValueAtIndex, @"Offset");
    CFNumberRef v11 = (const __CFNumber *)sub_21DC11C7C(ValueAtIndex, @"Size");
    if (v10)
    {
      CFNumberRef v12 = v11;
      if (v11)
      {
        CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr);
        CFNumberGetValue(v12, kCFNumberSInt64Type, &v24);
        if (v24 + valuePtr > v8) {
          unint64_t v8 = v24 + valuePtr;
        }
      }
    }
    ++v7;
  }
  while (v6 != v7);
  if (!v8) {
    return 0;
  }
  CFDictionaryGetValue(v0, @"Sections");
  CFDictionaryRef v13 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue(v13, @"Partitions");
  CFIndex v15 = CFArrayGetCount(v14);
  if (v15 < 1)
  {
    char v17 = 0;
  }
  else
  {
    CFIndex v16 = v15;
    char v17 = 0;
    for (CFIndex i = 0; i != v16; ++i)
    {
      CFDictionaryRef v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, i);
      uint64_t v24 = 0;
      uint64_t valuePtr = 0;
      CFNumberRef v20 = (const __CFNumber *)sub_21DC11C7C(v19, @"Offset");
      CFNumberRef v21 = (const __CFNumber *)sub_21DC11C7C(v19, @"Size");
      if (v20)
      {
        CFNumberRef v22 = v21;
        if (v21)
        {
          CFNumberGetValue(v20, kCFNumberSInt64Type, &valuePtr);
          CFNumberGetValue(v22, kCFNumberSInt64Type, &v24);
          if ((uint64_t)v8 > valuePtr) {
            char v17 = 1;
          }
        }
      }
    }
  }
  return v17 == 0;
}

uint64_t sub_21DC2C0E4()
{
  return 0;
}

uint64_t sub_21DC2C0EC()
{
  return 0;
}

uint64_t sub_21DC2C0F4()
{
  return 0;
}

uint64_t sub_21DC2C0FC(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C10C()
{
  return 0;
}

uint64_t sub_21DC2C114(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_21DC2C11C()
{
  return 78;
}

uint64_t sub_21DC2C124(uint64_t a1, _DWORD *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C134()
{
  return 78;
}

uint64_t sub_21DC2C13C(uint64_t a1, _DWORD *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C14C()
{
  return 78;
}

uint64_t sub_21DC2C154()
{
  return 78;
}

uint64_t sub_21DC2C15C()
{
  return 0;
}

uint64_t sub_21DC2C164(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C174(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 296))();
}

uint64_t sub_21DC2C1A0()
{
  return 78;
}

uint64_t sub_21DC2C1A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C1B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C1CC()
{
  return 78;
}

uint64_t sub_21DC2C1D4()
{
  return 78;
}

uint64_t sub_21DC2C1DC(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C1EC(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C1FC()
{
  return 78;
}

uint64_t sub_21DC2C204(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C214(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  return 78;
}

uint64_t sub_21DC2C224()
{
  return 78;
}

uint64_t sub_21DC2C22C()
{
  return 0;
}

uint64_t sub_21DC2C234()
{
  return 78;
}

uint64_t sub_21DC2C23C(uint64_t a1, void *a2, void *a3)
{
  if (a2) {
    *a2 = 0;
  }
  if (*a3) {
    *a3 = 0;
  }
  return 78;
}

void sub_21DC2C258(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFURLRef v3 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
  if (v3)
  {
    CFURLRef v4 = v3;
    CFStringRef v5 = (const __CFString *)sub_21DC0FDEC(v3);
    if (v5)
    {
      CFStringRef v6 = v5;
      CFDataRef v7 = sub_21DC0FEBC(v5, 0x8000100u);
      if (v7)
      {
        CFDataRef v8 = v7;
        CFDictionarySetValue(a2, @"image-path", v7);
        if (CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024))
        {
          if (!statfs((const char *)buffer, &v18))
          {
            int v9 = (const char *)sub_21DC2AFF0((uint64_t)&v18);
            if (v9)
            {
              CFNumberRef v10 = (char *)v9;
              mach_port_t v11 = *MEMORY[0x263F0EC90];
              CFDictionaryRef v12 = IOBSDNameMatching(*MEMORY[0x263F0EC90], 0, v9);
              free(v10);
              if (v12)
              {
                io_service_t MatchingService = IOServiceGetMatchingService(v11, v12);
                if (MatchingService)
                {
                  io_object_t v14 = MatchingService;
                  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"BSD Unit", 0, 0);
                  if (CFProperty)
                  {
                    CFIndex v16 = CFProperty;
                    CFTypeID v17 = CFGetTypeID(CFProperty);
                    if (v17 == CFNumberGetTypeID()) {
                      CFDictionarySetValue(a2, @"throttle-unit", v16);
                    }
                    CFRelease(v16);
                  }
                  IOObjectRelease(v14);
                }
              }
            }
          }
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
  }
}

const char *sub_21DC2C404()
{
  return "CBackingStore";
}

uint64_t sub_21DC2C410()
{
  return 0;
}

uint64_t sub_21DC2C418()
{
  return 78;
}

uint64_t sub_21DC2C420()
{
  return 78;
}

uint64_t sub_21DC2C428()
{
  return 78;
}

uint64_t sub_21DC2C430()
{
  return 78;
}

uint64_t sub_21DC2C438()
{
  return 78;
}

uint64_t sub_21DC2C440()
{
  return 78;
}

uint64_t sub_21DC2C44C(const char *a1, unsigned int *a2, unsigned int *a3)
{
  int v8 = 0;
  memset(v7, 0, sizeof(v7));
  v9[1] = 0;
  int v9[2] = 0;
  v9[0] = 0x400000000005;
  uint64_t result = getattrlist(a1, v9, v7, 0x24uLL, 0);
  if (!result)
  {
    if (a2) {
      DWORD1(v7[0]) = bswap32(*a2);
    }
    if (a3) {
      DWORD2(v7[0]) = bswap32(*a3);
    }
    return setattrlist(a1, v9, (char *)v7 + 4, 0x20uLL, 0);
  }
  return result;
}

uint64_t sub_21DC2C4F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 320) = a2;
  return result;
}

uint64_t sub_21DC2C4FC(uint64_t a1)
{
  uint64_t result = unlink(*(const char **)(a1 + 296));
  if ((result & 0x80000000) != 0) {
    return *__error();
  }
  return result;
}

BOOL sub_21DC2C524(uint64_t a1)
{
  BOOL result = 1;
  if (!stat(*(const char **)(a1 + 296), &v4))
  {
    __darwin_time_t v2 = *(void *)(a1 + 352);
    if (v4.st_mtimespec.tv_sec <= v2
      && (v4.st_mtimespec.tv_sec != v2 || v4.st_mtimespec.tv_nsec <= *(void *)(a1 + 360)))
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC2C58C()
{
  return 1;
}

uint64_t sub_21DC2C594(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = a2;
  return sub_21DC2C44C(*(const char **)(a1 + 296), 0, &v3);
}

uint64_t sub_21DC2C5C4(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = a2;
  return sub_21DC2C44C(*(const char **)(a1 + 296), &v3, 0);
}

uint64_t sub_21DC2C5F4()
{
  return 0;
}

void sub_21DC2C5FC()
{
  if (!qword_267D202D0)
  {
    memset(&callBacks, 0, 24);
    callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)sub_21DC2C68C;
    callBacks.equal = (CFArrayEqualCallBack)sub_21DC2C72C;
    fwrite("DIDiskImageBeginRetainCountTracking\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    qword_267D202D0 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &callBacks);
  }
}

CFStringRef sub_21DC2C68C(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return CFStringCreateWithFormat(v2, 0, @"%s %p (%d)", v3, a1, v4);
}

BOOL sub_21DC2C72C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_21DC2C738()
{
  if (qword_267D202D0)
  {
    CFDictionaryRef v0 = (FILE **)MEMORY[0x263EF8348];
    fwrite("DIDiskImageDisplayRetainCountTracking\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_267D202D0);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      for (CFIndex i = 0; i != v2; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_267D202D0, i);
        CFStringRef v5 = *v0;
        CFStringRef v6 = sub_21DC2C68C((uint64_t)ValueAtIndex);
        sub_21DC37988(v5, v6, 0x8000100u);
        fputc(10, *v0);
      }
    }
  }
}

void sub_21DC2C7E8()
{
  if (qword_267D202D0)
  {
    CFRelease((CFTypeRef)qword_267D202D0);
    qword_267D202D0 = 0;
  }
}

void sub_21DC2C81C(void *a1)
{
  sub_21DC04E48(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC2C864(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC2C888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFDataRef v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 88);
  if (v7) {
    return v7(a2, a3, a4, a5, a6, a7);
  }
  else {
    return 0;
  }
}

const char *sub_21DC2C8B4()
{
  return "<generic object>";
}

BOOL sub_21DC2C8C0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL result = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1))
  {
    uint64_t v4 = 0;
    int v2 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, _DWORD *))(*(void *)a1 + 328))(a1, 0, 512, &v4, v5);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280))(a1, 0);
    if (!v2 && v5[0] == 2003069043 && bswap32(v5[1]) - 2 > 2) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_21DC2CA0C(uint64_t a1, CFDictionaryRef theDict)
{
  if ((sub_21DC035B8(theDict, @"diskimage-class", @"CNotSupportedDiskImage") & 0x80000000) != 0) {
    return 4294966296;
  }
  int v4 = sub_21DC035B8(theDict, @"diskimage-class", @"CNotSupportedDiskImage");
  uint64_t v5 = 1000;
  if (v4 <= 0)
  {
    if (sub_21DC2C8C0(a1)) {
      return 1000;
    }
    else {
      return 4294966296;
    }
  }
  return v5;
}

const char *sub_21DC2CB04()
{
  return "CChecksum";
}

uint64_t sub_21DC2CB10()
{
  return 0xFFFFFFFFLL;
}

__CFString *sub_21DC2CB1C()
{
  return @"CRC-32";
}

const char *sub_21DC2CB28()
{
  return "CCRC32Checksum";
}

const char *sub_21DC2CB38()
{
  return "CMD5Checksum";
}

__CFString *sub_21DC2CB44()
{
  return @"MD5";
}

uint64_t sub_21DC2CB50(uint64_t a1, int a2)
{
  uint64_t v4 = sub_21DC0B340(a1);
  *(void *)uint64_t v4 = &unk_26CE84978;
  *(unsigned char *)(v4 + 120) = a2;
  if (a2) {
    uint64_t v5 = @"skip";
  }
  else {
    uint64_t v5 = @"none";
  }
  int v6 = DIGetBundleRef();
  CFTypeRef v7 = sub_21DC3A890(v6, (int)v5, v5);
  *(void *)(a1 + 112) = v7;
  if (!v7)
  {
    CFRetain(v5);
    *(void *)(a1 + 112) = v5;
  }
  return a1;
}

void sub_21DC2CBF8(_Unwind_Exception *a1)
{
  sub_21DC0B4F8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC2CC1C(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

const char *sub_21DC2CC28()
{
  return "CNoneChecksum";
}

void *sub_21DC2CC34(void *a1)
{
  sub_21DC27DD4((uint64_t)a1);
  *int v2 = &unk_26CE84A40;
  v2[16] = 20;
  a1[15] = malloc_type_calloc(1uLL, 0x14uLL, 0x4329567DuLL);
  a1[14] = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  a1[17] = MEMORY[0x263EF8048];
  a1[18] = MEMORY[0x263EF8050];
  a1[19] = MEMORY[0x263EF8040];
  return a1;
}

void sub_21DC2CCE4(_Unwind_Exception *a1)
{
  sub_21DC27F8C(v1);
  _Unwind_Resume(a1);
}

void sub_21DC2CD04(void *a1)
{
  sub_21DC27F8C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC2CD4C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21DC2CD70()
{
  return "CSHA1Checksum";
}

uint64_t sub_21DC2CD7C()
{
  return 6;
}

__CFString *sub_21DC2CD84()
{
  return @"SHA1";
}

__CFString *sub_21DC2CD90()
{
  return @"SHA-1";
}

void sub_21DC2CDA8()
{
}

uint64_t sub_21DC2CDC0(uint64_t a1)
{
  return sub_21DC249DC(a1 - 104);
}

uint64_t sub_21DC2CDC8(uint64_t a1)
{
  return sub_21DC249DC(a1 - 168);
}

void sub_21DC2CDD0(uint64_t a1)
{
}

void sub_21DC2CDD8(uint64_t a1)
{
}

const char *sub_21DC2CDFC()
{
  return "CADCDecompressor";
}

void *sub_21DC2CE08(void *a1)
{
  *a1 = &unk_26CE84C70;
  int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }
  a1[4] = 0;
  return a1;
}

void sub_21DC2CE58(void *a1)
{
  *a1 = &unk_26CE84C70;
  int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }
  a1[4] = 0;
  JUMPOUT(0x223C15E40);
}

uint64_t sub_21DC2CEF4(uint64_t a1)
{
  return sub_21DC28B9C(a1 - 104);
}

void sub_21DC2CEFC(uint64_t a1)
{
}

const char *sub_21DC2CF20()
{
  return "CKenCodeDecompressor";
}

void *sub_21DC2CF2C(uint64_t a1)
{
  BOOL result = sub_21DC0E3E0(a1);
  *BOOL result = &unk_26CE84D40;
  return result;
}

void sub_21DC2CF64()
{
  sub_21DC0AB38();
  JUMPOUT(0x223C15E40);
}

void sub_21DC2CFAC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC2CFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5) {
    return 22;
  }
  if (a5 >= 0) {
    int v5 = a5;
  }
  else {
    int v5 = a5 + 1;
  }
  if (a5 >= 2)
  {
    __int16 v6 = 0;
    LOWORD(v7) = 0;
    __int16 v8 = 0;
    LOWORD(v9) = 0;
    __int16 v10 = 0;
    __int16 v11 = 0;
    int v12 = v5 >> 1;
    do
    {
      if (!(_WORD)v7)
      {
        v8 += v10;
        int v13 = bswap32(*(unsigned __int16 *)(a2 + 2 * v8));
        int v7 = v13 >> 16;
        if (v13 >> 16 >= 0) {
          LOWORD(v14) = HIWORD(v13);
        }
        else {
          int v14 = -v7;
        }
        if (v12 < (__int16)v14) {
          return 22;
        }
        LOWORD(v9) = v8 + 1;
        if (v7 < 0)
        {
          int v7 = -HIWORD(v13);
          __int16 v6 = 1;
          __int16 v10 = 2;
        }
        else
        {
          __int16 v6 = 0;
          __int16 v10 = v7 + 1;
        }
      }
      *(_WORD *)(a4 + 2 * v11) = *(_WORD *)(a2 + 2 * (__int16)v9);
      int v9 = (__int16)(v9 + ((a5 > (__int16)v9) & (v6 ^ 1)));
      if (v9 < 1 || v9 > a5) {
        return 22;
      }
      LOWORD(v7) = v7 - 1;
      ++v11;
    }
    while (v12 > v11);
  }
  return 0;
}

double sub_21DC2D0A0(uint64_t a1)
{
  uint64_t v1 = sub_21DC0E3E0(a1);
  void *v1 = &unk_26CE84D88;
  *(_OWORD *)(v1 + 37) = xmmword_21DC41B56;
  qmemcpy(v1 + 39, "  !!\"\"##$$%%&&''(())**++,,--..//0123456789:;<=>?", 48);
  *(_OWORD *)(v1 + 29) = xmmword_21DC41B16;
  *(_OWORD *)(v1 + 31) = unk_21DC41B26;
  *(_OWORD *)(v1 + 33) = xmmword_21DC41B36;
  *(_OWORD *)(v1 + 35) = unk_21DC41B46;
  *(_OWORD *)(v1 + 21) = xmmword_21DC41AD6;
  *(_OWORD *)(v1 + 23) = unk_21DC41AE6;
  *(_OWORD *)(v1 + 25) = xmmword_21DC41AF6;
  *(_OWORD *)(v1 + 27) = unk_21DC41B06;
  *(_OWORD *)(v1 + 13) = xmmword_21DC41A96;
  *(_OWORD *)(v1 + 15) = unk_21DC41AA6;
  *(_OWORD *)(v1 + 17) = xmmword_21DC41AB6;
  *(_OWORD *)(v1 + 19) = unk_21DC41AC6;
  memset(v1 + 69, 7, 48);
  *(_OWORD *)(v1 + 75) = *(_OWORD *)"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b20CDARTRLEDecompressor";
  *(_OWORD *)(v1 + 61) = xmmword_21DC41C16;
  *(_OWORD *)(v1 + 63) = unk_21DC41C26;
  *(_OWORD *)(v1 + 65) = xmmword_21DC41C36;
  *(_OWORD *)(v1 + 67) = unk_21DC41C46;
  *(_OWORD *)(v1 + 53) = xmmword_21DC41BD6;
  *(_OWORD *)(v1 + 55) = unk_21DC41BE6;
  *(_OWORD *)(v1 + 57) = xmmword_21DC41BF6;
  *(_OWORD *)(v1 + 59) = unk_21DC41C06;
  *(_OWORD *)(v1 + 45) = xmmword_21DC41B96;
  *(_OWORD *)(v1 + 47) = unk_21DC41BA6;
  double result = 2.56734753e-289;
  *(_OWORD *)(v1 + 49) = xmmword_21DC41BB6;
  *(_OWORD *)(v1 + 51) = unk_21DC41BC6;
  return result;
}

void sub_21DC2D184()
{
  sub_21DC0AB38();
  JUMPOUT(0x223C15E40);
}

void sub_21DC2D1CC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C4069E7AED5);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC2D1F0(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int v12 = v2;
  int v13 = v3;
  int v9 = 0;
  __int16 v8 = 0;
  __int16 v17 = 0;
  int v16 = 0;
  v7[0] = v4;
  v7[1] = v5;
  uint64_t v14 = v1 + 104;
  uint64_t v15 = v1 + 360;
  sub_21DC2D2AC(v1, (uint64_t)v7);
  if (v8) {
    return 1001;
  }
  else {
    return 0;
  }
}

void sub_21DC2D2AC(uint64_t a1, uint64_t a2)
{
  sub_21DC2D514(a1, (_WORD *)a2);
  bzero((void *)(a2 + 48), 0xFC4uLL);
  if (*(_DWORD *)(a2 + 44))
  {
    unsigned int v4 = 0;
    int v5 = 4036;
    while (*(_DWORD *)(a2 + 32) <= *(_DWORD *)(a2 + 40))
    {
      int v3 = (void *)sub_21DC2D824(v3, a2);
      __int16 v6 = (__int16)v3;
      if ((int)v3 > 255)
      {
        int v3 = (void *)sub_21DC2D888((uint64_t)v3, (uint64_t *)a2);
        __int16 v9 = 0;
        int v10 = 0;
        __int16 v11 = v5 + ~(_WORD)v3;
        while (1)
        {
          char v12 = *(unsigned char *)(a2 + ((v9 + v11) & 0xFFF) + 48);
          uint64_t v13 = *(void *)(a2 + 8);
          uint64_t v14 = *(unsigned int *)(a2 + 36);
          *(_DWORD *)(a2 + 36) = v14 + 1;
          if ((v14 + 1) > *(_DWORD *)(a2 + 44)) {
            break;
          }
          *(unsigned char *)(v13 + v14) = v12;
          *(unsigned char *)(a2 + (__int16)v5 + 48) = v12;
          int v5 = (v5 + 1) & 0xFFF;
          ++v4;
          __int16 v9 = ++v10;
          if ((__int16)v10 >= (int)(unsigned __int16)(v6 - 253)) {
            goto LABEL_10;
          }
        }
LABEL_14:
        ++*(_WORD *)(a2 + 16);
        return;
      }
      uint64_t v7 = *(void *)(a2 + 8);
      uint64_t v8 = *(unsigned int *)(a2 + 36);
      *(_DWORD *)(a2 + 36) = v8 + 1;
      if ((v8 + 1) > *(_DWORD *)(a2 + 44)) {
        goto LABEL_14;
      }
      *(unsigned char *)(v7 + v8) = (_BYTE)v3;
      *(unsigned char *)(a2 + (__int16)v5 + 48) = (_BYTE)v3;
      int v5 = (v5 + 1) & 0xFFF;
      ++v4;
LABEL_10:
      unsigned int v15 = *(_DWORD *)(a2 + 28);
      if (v4 > v15) {
        *(_DWORD *)(a2 + 28) = v15 + 16;
      }
      if (v4 >= *(_DWORD *)(a2 + 44)) {
        return;
      }
    }
  }
}

uint64_t sub_21DC2D3F8(uint64_t a1, uint64_t *a2)
{
  int v2 = a2 + 1077;
  unsigned int v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    unsigned int v7 = (unsigned __int16)*v2;
  }
  else
  {
    uint64_t v4 = *a2;
    unsigned int v5 = *((_DWORD *)a2 + 10);
    unsigned int v6 = *((_DWORD *)a2 + 8);
    unsigned int v7 = (unsigned __int16)*v2;
    do
    {
      unsigned int v8 = v3;
      unsigned int v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5) {
        __int16 v10 = *(unsigned __int8 *)(v4 + v6);
      }
      else {
        __int16 v10 = -1;
      }
      int v11 = v10 & ~(v10 >> 31);
      unsigned int v3 = 8;
      v7 |= v11 << (8 - v8);
      *int v2 = v7;
      *((unsigned char *)a2 + 8620) = v8 + 8;
      unsigned int v6 = v9;
    }
    while (!v8);
    LOBYTE(v3) = v8 + 8;
  }
  *int v2 = 2 * v7;
  *((unsigned char *)a2 + 8620) = v3 - 1;
  return (v7 >> 15) & 1;
}

uint64_t sub_21DC2D48C(uint64_t a1, uint64_t *a2)
{
  int v2 = a2 + 1077;
  unsigned int v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    LOWORD(v7) = *v2;
    LOBYTE(v8) = v3 - 8;
  }
  else
  {
    uint64_t v4 = *a2;
    unsigned int v5 = *((_DWORD *)a2 + 10);
    unsigned int v6 = *((_DWORD *)a2 + 8);
    int v7 = (unsigned __int16)*v2;
    do
    {
      unsigned int v8 = v3;
      unsigned int v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5) {
        int v10 = *(unsigned __int8 *)(v4 + v6);
      }
      else {
        int v10 = 0xFFFF;
      }
      unsigned int v3 = 8;
      v7 |= v10 << (8 - v8);
      *int v2 = v7;
      *((unsigned char *)a2 + 8620) = v8 + 8;
      unsigned int v6 = v9;
    }
    while (!v8);
  }
  *int v2 = (_WORD)v7 << 8;
  *((unsigned char *)a2 + 8620) = v8;
  return BYTE1(v7);
}

void sub_21DC2D514(uint64_t a1, _WORD *a2)
{
  memset_pattern16(a2 + 2112, &unk_21DC41CD0, 0x274uLL);
  unsigned int v3 = a2 + 3367;
  uint64_t v4 = -314;
  do
  {
    v3[314] = v4 + 941;
    *v3++ = v4 + 314;
  }
  while (!__CFADD__(v4++, 1));
  uint64_t v6 = 0;
  int v7 = a2 + 2112;
  uint64_t v8 = 314;
  do
  {
    unsigned int v9 = &a2[v6 + 2426];
    *unsigned int v9 = v7[1] + *v7;
    v9[1569] = v6 * 2;
    v7[629] = v8;
    v7[628] = v8;
    ++v6;
    ++v8;
    v7 += 2;
  }
  while (v6 != 313);
  a2[2739] = -1;
  a2[3366] = 0;
}

void *sub_21DC2D5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  int v4 = 0;
  do
  {
    uint64_t v5 = a2 + v3;
    if (*(__int16 *)(a2 + v3 + 7362) >= 627)
    {
      uint64_t v6 = a2 + 2 * (__int16)v4;
      *(_WORD *)(v6 + 4224) = (*(unsigned __int16 *)(v5 + 4224) + 1) >> 1;
      *(_WORD *)(v6 + 7362) = *(_WORD *)(v5 + 7362);
      ++v4;
    }
    v3 += 2;
  }
  while (v3 != 1254);
  uint64_t v7 = 0;
  uint64_t v8 = 314;
  uint64_t v9 = a2 + 4224;
  uint64_t v10 = a2 + 7362;
  do
  {
    unsigned __int16 v11 = *(_WORD *)(v9 + ((2 * v7) | 2)) + *(_WORD *)(v9 + 2 * v7);
    *(_WORD *)(v9 + 2 * v8) = v11;
    int v12 = v8;
    do
      __int16 v13 = v12--;
    while (*(unsigned __int16 *)(a2 + 2 * (__int16)v12 + 4224) > v11);
    uint64_t v14 = 2 * v13 + 2;
    memcpy((void *)(a2 + 4224 + 2 * v13), (const void *)(a2 + 4224 + v14), 2 * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(a2 + 4224 + 2 * v13) = v11;
    double result = memcpy((void *)(v10 + 2 * v13), (const void *)(v10 + v14), 2 * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(v10 + 2 * v13) = v7;
    v7 += 2;
    ++v8;
  }
  while (v8 != 627);
  uint64_t v16 = 0;
  uint64_t v17 = a2 + 7362;
  do
  {
    uint64_t v18 = *(unsigned __int16 *)(v17 + 2 * v16);
    if (*(__int16 *)(v17 + 2 * v16) < 627)
    {
      uint64_t v19 = a2 + 2 * (__int16)v18;
      *(_WORD *)(v19 + 5482) = v16;
    }
    else
    {
      uint64_t v19 = a2 + 2 * v18;
    }
    *(_WORD *)(v19 + 5480) = v16++;
  }
  while (v16 != 627);
  return result;
}

void *sub_21DC2D72C(void *result, uint64_t a2, int a3)
{
  if (*(__int16 *)(a2 + 5476) == -32768) {
    double result = sub_21DC2D5C8((uint64_t)result, a2);
  }
  int v5 = *(unsigned __int16 *)(a2 + 2 * a3 + 6734);
  uint64_t v6 = a2 + 4224;
  do
  {
    uint64_t v7 = (__int16)v5;
    uint64_t v8 = (_WORD *)(v6 + 2 * (__int16)v5);
    __int16 v9 = *v8 + 1;
    *uint64_t v8 = v9;
    if (v9 > (int)*(unsigned __int16 *)(v6 + 2 * (__int16)(v5 + 1)))
    {
      int v10 = v5 + 1;
      do
        __int16 v11 = v10++;
      while (v9 > (int)*(unsigned __int16 *)(a2 + 2 * (__int16)v10 + 4224));
      uint64_t v12 = a2 + 2 * v11;
      *uint64_t v8 = *(_WORD *)(v12 + 4224);
      *(_WORD *)(v12 + 4224) = v9;
      uint64_t v13 = a2 + 2 * (__int16)v5;
      uint64_t v14 = *(__int16 *)(v13 + 7362);
      uint64_t v15 = a2 + 2 * v14;
      *(_WORD *)(v15 + 5480) = v11;
      if (v14 <= 626) {
        *(_WORD *)(v15 + 5482) = v11;
      }
      uint64_t v7 = v11;
      uint64_t v16 = a2 + 2 * v11;
      uint64_t v17 = *(__int16 *)(v16 + 7362);
      *(_WORD *)(v16 + 7362) = v14;
      uint64_t v18 = a2 + 2 * v17;
      *(_WORD *)(v18 + 5480) = v5;
      if (v17 <= 626) {
        *(_WORD *)(v18 + 5482) = v5;
      }
      *(_WORD *)(v13 + 7362) = v17;
    }
    int v5 = *(unsigned __int16 *)(a2 + 2 * v7 + 5480);
  }
  while (*(_WORD *)(a2 + 2 * v7 + 5480));
  return result;
}

uint64_t sub_21DC2D824(void *a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 8614);
  if (v3 <= 0x272)
  {
    do
    {
      a1 = (void *)sub_21DC2D3F8((uint64_t)a1, (uint64_t *)a2);
      unsigned int v3 = *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)((_WORD)a1 + v3) + 7362);
    }
    while (v3 < 0x273);
  }
  uint64_t v4 = (__int16)(v3 - 627);
  sub_21DC2D72C(a1, a2, v4);
  return v4;
}

uint64_t sub_21DC2D888(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21DC2D48C(a1, a2);
  char v4 = v3;
  int v5 = *(char *)(a2[526] + (unsigned __int16)v3);
  int v6 = *(char *)(a2[527] + (unsigned __int16)v3);
  int v7 = v6 - 2;
  if (v6 != 2)
  {
    do
    {
      --v7;
      uint64_t v3 = sub_21DC2D3F8(v3, a2);
      char v4 = v3 | (2 * v4);
    }
    while ((_WORD)v7);
  }
  return v4 & 0x3F | (v5 << 6);
}

const char *sub_21DC2D8FC()
{
  return "CDARTRLEDecompressor";
}

const char *sub_21DC2D908()
{
  return "CDARTLZHDecompressor";
}

const char *sub_21DC2D918()
{
  return "CZlibDecompressor";
}

uint64_t sub_21DC2D92C(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[17];
  if (!v2) {
    return 78;
  }
  while (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 104))(v2))
  {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 496))(v2);
    if (!v2) {
      return 78;
    }
  }
  uint64_t v7 = (*(uint64_t (**)(void *))(*a1 + 296))(a1);
  char v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 72))(v7);
  if ((v8 & 1) != 0
    || (uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 80))(v2, 1003), !v5))
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 112))(v2, a2);
    if ((v8 & 1) == 0) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v2 + 80))(v2, 1);
    }
  }
  return v5;
}

uint64_t sub_21DC2DAC0()
{
  return 78;
}

__CFString *sub_21DC2DAC8()
{
  return @"<unknown>";
}

uint64_t sub_21DC2DAD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 104) = a2;
  return result;
}

uint64_t sub_21DC2DADC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 112) = a2;
  return result;
}

uint64_t sub_21DC2DAE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 120) = a2;
  return result;
}

uint64_t sub_21DC2DAEC(uint64_t result)
{
  *(unsigned char *)(result + 128) = 1;
  return result;
}

uint64_t sub_21DC2DAF8(uint64_t a1, __CFDictionary *a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 200))(a1)
    && ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 256))(a1) & 1) == 0)
  {
    char v4 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
    if (!v4)
    {
      int v6 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 216))(a1);
      CFDictionaryAddValue(a2, @"kernel-dict", v6);
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232))(a1);
      CFNumberRef v7 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      CFDictionaryAddValue(a2, @"sparse-band-size", v7);
      return 0;
    }
    CFRelease(v4);
  }
  return 78;
}

uint64_t sub_21DC2DC50(void **a1, CFDictionaryRef theDict)
{
  if (theDict) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  char v4 = MutableCopy;
  if (!MutableCopy) {
    return 999;
  }
  if (((unsigned int (*)(void **, CFMutableDictionaryRef))(*a1)[66])(a1, MutableCopy)
    || (uint64_t v5 = DIHLDiskImageAttach(), v5 == 45))
  {
    CFDictionaryRemoveValue(v4, @"kernel-dict");
    int v6 = (const void *)(*(uint64_t (**)(void *))(*a1[17] + 176))(a1[17]);
    CFDictionaryAddValue(v4, @"main-url", v6);
    uint64_t v5 = DIHLDiskImageAttach();
  }
  CFRelease(v4);
  return v5;
}

__CFArray *sub_21DC2DD8C(uint64_t a1, char a2)
{
  int v15 = 0;
  uint64_t v14 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 240))(a1);
  if (v4 >= 513) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 2048;
  }
  int v6 = sub_21DC38EFC(a1, 1u, 1, v5, 0, (void ****)&v14, &v15, 0, a2);
  CFDictionaryRef Mutable = 0;
  if (!v6)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (v15 >= 1)
    {
      for (uint64_t i = 0; i < v15; ++i)
      {
        int v10 = (const UInt8 **)*((void *)v14 + i);
        sub_21DC3A9F0();
        nullsub_4(v10);
        CFIndex v11 = sub_21DC3A9E4((uint64_t)v10);
        CFDataRef v12 = CFDataCreate(v8, *v10, v11);
        CFArrayAppendValue(Mutable, v12);
        CFRelease(v12);
        nullsub_4(v10);
      }
    }
  }
  if (v14) {
    sub_21DC26118((void ***)v14, v15);
  }
  return Mutable;
}

uint64_t sub_21DC2DEDC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5)
  {
    *a5 = 0;
    unsigned int v5 = 78;
  }
  else
  {
    unsigned int v5 = 22;
  }
  if (a4) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 22;
  }
  else {
    return v5;
  }
}

uint64_t sub_21DC2DF14(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  if (!v1) {
    return 78;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 480);
  return v2();
}

uint64_t sub_21DC2DFB8(uint64_t a1, const char *a2)
{
  uint64_t v2 = "";
  if (a2) {
    uint64_t v2 = a2;
  }
  return fprintf((FILE *)*MEMORY[0x263EF8348], "%s%qd at %qd\n", v2, *(void *)(a1 + 96), *(void *)(a1 + 88));
}

void sub_21DC2E00C(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v13 = DIGetBundleRef();
  CFTypeRef v14 = sub_21DC3A890(v13, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-name", v14);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-key", a5);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-extension", a6);
  CFDictionaryAddValue(Mutable, @"expert-mode", a7);
  CFArrayAppendValue(a1, Mutable);
  if (v14) {
    CFRelease(v14);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void sub_21DC2E130(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7, const void *a8, const void *a9)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v16 = DIGetBundleRef();
  CFTypeRef v17 = sub_21DC3A890(v16, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-name", v17);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-key", a5);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-extension", a6);
  CFDictionaryAddValue(Mutable, @"expert-mode", a7);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-virtual-size", a8);
  if (a9) {
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-hide-from-ui", a9);
  }
  CFArrayAppendValue(a1, Mutable);
  if (v17) {
    CFRelease(v17);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void sub_21DC2E294(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v11 = DIGetBundleRef();
  CFTypeRef v12 = sub_21DC3A890(v11, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum-name", v12);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum-key", a5);
  CFDictionaryAddValue(Mutable, @"expert-mode", a6);
  CFArrayAppendValue(a1, Mutable);
  if (v12) {
    CFRelease(v12);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

const char *sub_21DC2E394()
{
  return "CDiskImage";
}

uint64_t sub_21DC2E3A0()
{
  return 78;
}

uint64_t sub_21DC2E3A8()
{
  return 78;
}

uint64_t sub_21DC2E3B0()
{
  return -1;
}

BOOL sub_21DC2E3BC(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x14F51CFEuLL);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v6 = 0;
  BOOL v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)a1 + 48))(a1, 2, 1, &v6, v2)&& (sub_21DC280F0(v3), *v3 == 18520)&& (v3[20] & 0x1FF) == 0&& v3[1] > 4u;
  free(v3);
  return v4;
}

uint64_t sub_21DC2E488()
{
  return 0;
}

BOOL sub_21DC2E490(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned char *))(*(void *)a1 + 48))(a1, 2, 1, &v10, v11)|| v11[0] | v11[1])
  {
    return 0;
  }
  if ((~v12[0] & 0xF0) != 0 || (v12[0] & 0xF) == 0) {
    return 0;
  }
  uint64_t v3 = v12[0] & 0xF;
  if ((v12[0] & 0xF) != 0)
  {
    while (1)
    {
      int v4 = v12[v3];
      char v5 = (v4 - 97) >= 0x1A ? v12[v3] : v4 & 0xDF;
      unsigned int v6 = (v5 - 65);
      BOOL v7 = v6 < 0x1A;
      if (!--v3) {
        break;
      }
      BOOL v8 = v6 >= 0x1A && (v5 - 48) >= 0xAu;
      if (v8 && v5 != 46 && v5 != 32) {
        goto LABEL_23;
      }
      if (!(_WORD)v3)
      {
        BOOL v7 = 1;
        break;
      }
    }
  }
  else
  {
LABEL_23:
    BOOL v7 = 0;
  }
  BOOL v9 = v12[31] == 39 && v7;
  return v12[32] == 13 && v9;
}

CFStringRef sub_21DC2E5E4(uint64_t a1)
{
  long double v1 = (double)(unint64_t)(1000
                                * (1000000 * (*(void *)(a1 + 24) - *(void *)(a1 + 8))
                                 - *(int *)(a1 + 16)
                                 + *(int *)(a1 + 32)));
  double v2 = fmod(v1, 1000.0);
  long double v3 = floor(v1 / 1000.0);
  double v4 = fmod(v3, 1000.0);
  long double v5 = floor(v3 / 1000.0);
  double v6 = fmod(v5, 1000.0);
  long double v7 = floor(v5 / 1000.0);
  double v8 = fmod(v7, 60.0);
  long double v9 = floor(v7 / 60.0);
  double v10 = fmod(v9, 60.0);
  long double v11 = floor(v9 / 60.0);
  double v12 = fmod(v11, 24.0);
  long double v13 = floor(v11 / 24.0);
  double v14 = fmod(v13, 365.25);
  double v15 = floor(v13 / 365.25);
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v15 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%2hdy %3hdd %2hdh", (int)v15, (int)v14, (int)v10);
  }
  if (v14 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%3hdd %2hdh %02hdm %02hds", (int)v14, (int)v12, (int)v10, (int)v8);
  }
  if (v12 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%2hdh %2hdm %02hd.%03hds", (int)v12, (int)v10, (int)v8, (int)v6);
  }
  if (v10 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%2hdm %2hd.%03hds", (int)v10, (int)v8, (int)v6);
  }
  if (v8 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%2hd.%03hds", (int)v8, (int)v6);
  }
  if (v6 > 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%3hd.%03hdms", (int)v6, (int)v4);
  }
  if (v4 <= 0.0) {
    return CFStringCreateWithFormat(v16, 0, @"%2hdns", (int)v2);
  }
  return CFStringCreateWithFormat(v16, 0, @"%3hd.%03hdus", (int)v4, (int)v2);
}

uint64_t sub_21DC2E844(int a1, int a2, _DWORD *a3)
{
  uint64_t result = 0;
  *a3 = 0;
  if (a1 > 1346586691)
  {
    if (a1 > 1684371057)
    {
      if (a1 == 1684371058)
      {
        uint64_t result = 1430540887;
        goto LABEL_22;
      }
      if (a1 != 1751413366)
      {
        if (a1 != 1885554756) {
          return result;
        }
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (a1 == 1346586692)
    {
LABEL_18:
      uint64_t result = 1144675390;
      goto LABEL_22;
    }
    if (a1 != 1346989415) {
      return result;
    }
LABEL_17:
    uint64_t result = 1430541391;
    goto LABEL_22;
  }
  if (a1 > 1195994470)
  {
    if (a1 == 1195994471) {
      goto LABEL_17;
    }
    if (a1 != 1330660164) {
      return result;
    }
    if (a2 == 1330660128) {
      goto LABEL_18;
    }
    return 0;
  }
  if (a1 == 1095782476)
  {
    uint64_t result = 1144675390;
    if (a2 == 1450461252 || a2 == 1144675390) {
      goto LABEL_22;
    }
    return 0;
  }
  if (a1 != 1145334125) {
    return result;
  }
LABEL_10:
  uint64_t result = 1380013866;
LABEL_22:
  *a3 = 100;
  return result;
}

uint64_t sub_21DC2E990(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_21DC04598(a3);
  int v12 = 0;
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1)) {
    return 78;
  }
  sub_21DC1C098(a2, &v12);
  if (v12 < 0) {
    return 110;
  }
  int v7 = sub_21DC1C5E8((uint64_t)a2, &v12);
  if (v12 < 0) {
    return 110;
  }
  if (!v7)
  {
    int v7 = sub_21DC1C720((uint64_t)a2, &v12);
    if (v12 < 0) {
      return 110;
    }
  }
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = 1380013866;
  }
  *(_DWORD *)(a1 + 144) = v8;
  uint64_t v11 = 0;
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)a2 + 80))(a2, v5);
  if (!v6)
  {
    uint64_t v9 = (*(uint64_t (**)(void *))(*(void *)a2 + 72))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520))(a1, v9);
    uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)a2 + 272))(a2);
    if (!v6)
    {
      uint64_t v6 = (*(uint64_t (**)(void *, uint64_t *))(*(void *)a2 + 296))(a2, &v11);
      if (v6)
      {
        (*(void (**)(void *, void))(*(void *)a2 + 280))(a2, 0);
      }
      else
      {
        *(void *)(a1 + 160) = v11 >> 9;
        sub_21DC0ABBC(a1, (char *)a2);
      }
    }
  }
  return v6;
}

void sub_21DC2EBD4()
{
}

void sub_21DC2F494(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x1081C40C16B1325);
  _Unwind_Resume(a1);
}

void sub_21DC2F4B8(uint64_t a1, __CFArray *a2)
{
  io_iterator_t iterator = 0;
  if (!IOObjectConformsTo(a1, "IOMedia")
    || ((value = 0,
         !IORegistryEntryCreateCFProperties(a1, (CFMutableDictionaryRef *)&value, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0))? (BOOL v4 = value == 0): (BOOL v4 = 1), v4|| (CFArrayAppendValue(a2, value), v5 = sub_21DC03648((const __CFDictionary *)value, @"Leaf", 0), CFRelease(value), !v5)))
  {
    if (!MEMORY[0x223C15D20](a1, "IOService", &iterator))
    {
      if (!IOIteratorIsValid(iterator)) {
        MEMORY[0x223C15CD0](iterator);
      }
      uint64_t v6 = IOIteratorNext(iterator);
      if (v6)
      {
        uint64_t v7 = v6;
        do
        {
          sub_21DC2F4B8(v7, a2);
          IOObjectRelease(v7);
          uint64_t v7 = IOIteratorNext(iterator);
        }
        while (v7);
      }
      if (iterator) {
        IOObjectRelease(iterator);
      }
    }
  }
}

void sub_21DC2F5C8(uint64_t a1, uint64_t a2, double a3)
{
  int v6 = DIGetBundleRef();
  CFStringRef v7 = (const __CFString *)sub_21DC3A890(v6, (int)@"Elapsed Time: %1$@", @"Elapsed Time: %1$@");
  CFStringRef v8 = sub_21DC2E5E4(a2);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v7, v8);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336))(a1, v10, 8);
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  double v11 = (100.0 - a3)
      * (double)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1)
      / 100.0
      * 512.0
      * 1000000000.0;
  double v12 = v11 / (double)(unint64_t)sub_21DC26558(a2);
  if (v12 >= 1024.0) {
    unsigned int v13 = 75;
  }
  else {
    unsigned int v13 = 32;
  }
  if (v12 >= 1024.0) {
    double v12 = v12 * 0.0009765625;
  }
  if (v12 >= 1024.0)
  {
    unsigned int v13 = 77;
    double v12 = v12 * 0.0009765625;
  }
  if (v12 >= 1024.0) {
    uint64_t v14 = 71;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v12 >= 1024.0) {
    double v15 = v12 * 0.0009765625;
  }
  else {
    double v15 = v12;
  }
  int v16 = DIGetBundleRef();
  CFStringRef v17 = (const __CFString *)sub_21DC3A890(v16, (int)@"Speed: %1$.1f%2$cB/s", @"Speed: %1$.1f%2$cB/s");
  CFStringRef v18 = CFStringCreateWithFormat(v9, 0, v17, *(void *)&v15, v14);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336))(a1, v18, 8);
  if (v18) {
    CFRelease(v18);
  }
  if (v17) {
    CFRelease(v17);
  }
  int v19 = DIGetBundleRef();
  CFStringRef v20 = (const __CFString *)sub_21DC3A890(v19, (int)@"Savings: %1$.1f%%", @"Savings: %1$.1f%%");
  CFStringRef v21 = CFStringCreateWithFormat(v9, 0, v20, *(void *)&a3);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336))(a1, v21, 8);
  if (v21) {
    CFRelease(v21);
  }
  if (v20)
  {
    CFRelease(v20);
  }
}

void sub_21DC2F8D8(uint64_t a1, char *a2)
{
}

uint64_t sub_21DC2F988()
{
  return 1936749171;
}

uint64_t sub_21DC2F994(void *a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 112))(a1);
  uint64_t result = 22;
  if (a2 && v4 >= a2)
  {
    uint64_t v6 = a1[20];
    if (v6)
    {
      CFStringRef v7 = *(uint64_t (**)(void))(*(void *)v6 + 56);
      return v7();
    }
    else
    {
      return 999;
    }
  }
  return result;
}

uint64_t sub_21DC2FA3C(uint64_t a1, char *a2, const __CFDictionary *a3, void *a4)
{
  int valuePtr = 8;
  CFStringRef v18 = 0;
  uint64_t v19 = 0;
  int v17 = 0;
  CFTypeRef v15 = 0;
  CFTypeRef cf = 0;
  uint64_t v14 = -1;
  if (!a2) {
    goto LABEL_7;
  }
  DIDiskImageObjectRetain_0(a2);
  if (!a3 || !sub_21DC12310(a3, @"convert-image-type", 0)) {
    goto LABEL_7;
  }
  int v7 = sub_21DC03648(a3, @"convert-add-partition-map", 0);
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a3, @"convert-alignment");
  if (v8) {
    CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
  }
  if (v7)
  {
LABEL_7:
    uint64_t v9 = 22;
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a3, @"udif-chunk-size", (const void **)&value)) {
    goto LABEL_18;
  }
  if (!sub_21DC1B748((const __CFString *)value, kCFNumberSInt64Type, &v14))
  {
    uint64_t v9 = 999;
    goto LABEL_8;
  }
  unint64_t v11 = v14;
  if (v14 < 0)
  {
LABEL_18:
    unint64_t v11 = 2048;
    uint64_t v14 = 2048;
  }
  uint64_t v12 = sub_21DC38EFC((uint64_t)a2, 1u, 1, v11, &v15, (void ****)&v18, &v17, (__CFArray **)&cf, 1);
  if (!v12) {
    sub_21DC2FBF8();
  }
  uint64_t v9 = v12;
  if (v18) {
    sub_21DC26118((void ***)v18, v17);
  }
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v15)
  {
    CFRelease(v15);
    CFTypeRef v15 = 0;
  }
  if (a2) {
    DIDiskImageObjectRelease(a2);
  }
  *a4 = v19;
  return v9;
}

void sub_21DC2FBF8()
{
}

void sub_21DC305A8(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x1081C40C16B1325);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC305CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unsigned int v10 = 0;
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 160))(*(void *)(a1 + 160));
  if (!v6)
  {
    uint64_t v9 = v10;
    uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64))(*(void *)(a1 + 160)) * v9;
    if (!a4) {
      return v6;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v7;
  return v6;
}

uint64_t sub_21DC30688(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 160) + 168))(*(void *)(a1 + 160), a1);
}

uint64_t sub_21DC306B4(uint64_t a1, void ***a2)
{
  if (!a2)
  {
    sub_21DC3A944(0);
    return 22;
  }
  *a2 = 0;
  uint64_t v4 = (void **)sub_21DC3A90C(204);
  uint64_t v5 = sub_21DC3A898();
  if (!v5)
  {
    *(void *)__CFDictionary *v4 = 0x16D697368;
    uint64_t v18 = 0;
    char v17 = 0;
    uint64_t v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 48))(*(void *)(a1 + 160));
    if (!v8)
    {
LABEL_18:
      uint64_t v16 = sub_21DC30858((uint64_t)v4, -1, 0);
LABEL_19:
      uint64_t v6 = v16;
      if (!v16) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    int v11 = -1;
    while (1)
    {
      uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24))(*(void *)(a1 + 160), v10, v9, &v18, &v17);
      if (v5) {
        break;
      }
      if (v17) {
        int v12 = 1;
      }
      else {
        int v12 = 2;
      }
      uint64_t v13 = v18;
      if (v12 == v11)
      {
        uint64_t v14 = *v4;
        v14[2] = *((void *)*v4 + 2) + v18;
        CFTypeRef v15 = &v14[5 * *((unsigned int *)v14 + 50)];
        *(void *)((char *)v15 + 180) += v13;
      }
      else
      {
        uint64_t v16 = sub_21DC30858((uint64_t)v4, v12, v18);
        int v11 = v12;
        if (v16) {
          goto LABEL_19;
        }
      }
      v10 += v18;
      v9 -= v18;
      if (!v9) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v6 = v5;
LABEL_4:
  sub_21DC3A944(v4);
  uint64_t v4 = 0;
LABEL_5:
  *a2 = v4;
  return v6;
}

uint64_t sub_21DC30858(uint64_t a1, int a2, uint64_t a3)
{
  sub_21DC3A9F0();
  nullsub_4(a1);
  uint64_t v6 = sub_21DC3A9E4(a1);
  uint64_t v7 = sub_21DC3A898();
  if (v7)
  {
    uint64_t v8 = v7;
  }
  else
  {
    sub_21DC3A988(a1, v6 + 40);
    uint64_t v8 = sub_21DC3A898();
    if (!v8)
    {
      uint64_t v9 = *(void *)a1;
      unsigned int v10 = *(_DWORD *)(*(void *)a1 + 200);
      *(_DWORD *)(v9 + 200) = v10 + 1;
      uint64_t v11 = v9 + 40 * v10;
      *(_OWORD *)(v11 + 208) = 0u;
      *(_OWORD *)(v11 + 224) = 0u;
      *(_DWORD *)(v11 + 240) = 0;
      *(_DWORD *)(v11 + 204) = a2;
      *(void *)(v11 + 220) = a3;
      uint64_t v12 = *(void *)a1;
      uint64_t v13 = *(void *)(*(void *)a1 + 16);
      *(void *)(v11 + 212) = v13;
      *(void *)(v12 + 16) = v13 + a3;
    }
  }
  nullsub_4(a1);
  return v8;
}

uint64_t sub_21DC30924()
{
  return 0;
}

BOOL sub_21DC30930(uint64_t a1)
{
  if (*(_DWORD *)a1 != 1936749171) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  int v1 = *(_DWORD *)(a1 + 4);
  if ((v1 - 1) > 2) {
    return 0;
  }
  if ((v1 - 1) >= 2) {
    return v1 != 3 || *(void *)(a1 + 28);
  }
  return *(_DWORD *)(a1 + 16) != 0;
}

void sub_21DC3098C(char *a1, ...)
{
  va_start(va, a1);
  vsyslog(5, a1, va);
}

uint64_t sub_21DC309C0(void **a1, uint64_t a2, uint64_t a3)
{
  ((void (*)(void **))(*a1)[10])(a1);
  uint64_t v8 = 0;
  uint64_t v5 = (*(uint64_t (**)(void))(*a1[3] + 328))();
  if (!v5)
  {
    unsigned int v6 = ((uint64_t (*)(void **))(*a1)[12])(a1);
    sub_21DC37C44(a3, v6);
  }
  return v5;
}

uint64_t sub_21DC30AAC(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v6 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "index node %p\n", (const void *)a2);
  fprintf(*v6, "   fSignature           %4.4s\n", (const char *)a2);
  fprintf(*v6, "   fIndexNodeNumber     %u\n", *(_DWORD *)(a2 + 4));
  fprintf(*v6, "   fNextIndexNodeOffset 0x%016qX (%qd)\n", *(void *)(a2 + 12), *(void *)(a2 + 12));
  uint64_t result = fprintf(*v6, "   fFlags               0x%08X\n", *(_DWORD *)(a2 + 8));
  if (a3)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
    if (result)
    {
      unint64_t v8 = 0;
      uint64_t v9 = a2 + 56;
      do
      {
        if (*(_DWORD *)(v9 + 4 * v8))
        {
          fprintf(*v6, "   fBandNumber[%3d]     ", v8);
          unsigned int v10 = *v6;
          if (*(_DWORD *)(v9 + 4 * v8) == -1) {
            fwrite("(spare)\n", 8uLL, 1uLL, v10);
          }
          else {
            fprintf(v10, "%u\n", *(_DWORD *)(v9 + 4 * v8));
          }
        }
        ++v8;
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
      }
      while (v8 < result);
    }
  }
  return result;
}

uint64_t sub_21DC30C3C(void **a1, uint64_t a2, const void *a3)
{
  size_t v5 = ((uint64_t (*)(void **))(*a1)[10])(a1);
  unsigned int v6 = malloc_type_malloc(v5, 0xFF56DE4CuLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  memmove(v6, a3, v5);
  unsigned int v8 = ((uint64_t (*)(void **))(*a1)[12])(a1);
  sub_21DC37C44((uint64_t)v7, v8);
  uint64_t v9 = (*(uint64_t (**)(void))(*a1[3] + 336))();
  free(v7);
  return v9;
}

uint64_t sub_21DC30D60(uint64_t a1)
{
  size_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t result = sub_21DC24138(a1, v3 + v2);
  if (result) {
    return result;
  }
  size_t v5 = *(void **)(a1 + 80);
  if (!v5)
  {
    uint64_t v7 = (char *)malloc_type_malloc(v2, 0xDE16A9B1uLL);
    *(void *)(a1 + 80) = v7;
    if (v7) {
      goto LABEL_6;
    }
    return 12;
  }
  unsigned int v6 = (char *)malloc_type_realloc(v5, v2 * (*(_DWORD *)(a1 + 32) + 1), 0xEDBD7A32uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  *(void *)(a1 + 80) = v6;
LABEL_6:
  uint64_t v8 = *(unsigned int *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v8 + 1;
  if (v8 == -1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = &v7[(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v8];
  }
  uint64_t v15 = 0;
  bzero(v9, v2);
  unsigned int v10 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)uint64_t v9 = 1936749171;
  *((_DWORD *)v9 + 1) = v10 - 1;
  if (v10 < 2)
  {
    uint64_t v14 = *(void *)(a1 + 72);
    *(void *)(v14 + 20) = v3;
    uint64_t v13 = (_DWORD *)(v14 + 12);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 80);
    uint64_t v12 = v11 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v10 - 2);
    *(void *)(v12 + 12) = v3;
    uint64_t v13 = (_DWORD *)(v12 + 8);
  }
  *v13 |= 1u;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, size_t, uint64_t *, char *))(**(void **)(a1 + 24) + 336))(*(void *)(a1 + 24), v3, v2, &v15, v9);
  if (!result)
  {
    *((_DWORD *)v9 + 2) &= ~1u;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  }
  return result;
}

uint64_t sub_21DC30F64(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  *a4 = 0;
  if (a2 >= a3) {
    return 0;
  }
  uint64_t v9 = v8;
  if (a2 % v8) {
    a2 = (v8 + a2) / v8 * v8;
  }
  unsigned int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136))(a1, a2);
  if (*(void *)(a1 + 40) == a3)
  {
    if (a3 % v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    a3 = (v11 + a3) / v9 * v9;
  }
  uint64_t v12 = a3 / v9 * v9;
  unsigned int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136))(a1, v12 - 1);
  if (v12 - a2 < v9 || v10 > v13) {
    return 0;
  }
  unsigned int v16 = v13;
  uint64_t v17 = *(void *)(a1 + 72);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
  {
    uint64_t v18 = 0;
    uint64_t v19 = v17 + 64;
    do
    {
      unsigned int v20 = *(_DWORD *)(v19 + 4 * v18);
      if (v20 + 1 >= 2 && v20 >= v10 && v20 <= v16)
      {
        *(_DWORD *)(*(void *)(a1 + 72) + 12) |= 1u;
        unsigned int v23 = *(_DWORD *)(v19 + 4 * v18);
        uint64_t v24 = *(void *)(a1 + 8);
        if (v23) {
          BOOL v25 = v24 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25 && *(_DWORD *)(a1 + 16) >= v23) {
          *(void *)(v24 + 8 * (v23 - 1)) = 0;
        }
        *(_DWORD *)(v19 + 4 * v18) = -1;
        ++*a4;
      }
      ++v18;
    }
    while (v18 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1));
  }
  unsigned int v26 = *(_DWORD *)(a1 + 32);
  if (v26)
  {
    for (unsigned int i = 1; i <= v26; ++i)
    {
      uint64_t v28 = i - 1;
      uint64_t v29 = *(void *)(a1 + 80);
      if (v26 <= v28 || v29 == 0) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = v29 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v28;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1))
      {
        uint64_t v32 = 0;
        uint64_t v33 = v31 + 56;
        do
        {
          unsigned int v34 = *(_DWORD *)(v33 + 4 * v32);
          if (v34 + 1 >= 2 && v34 >= v10 && v34 <= v16)
          {
            uint64_t v37 = *(void *)(a1 + 80);
            uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
            *(_DWORD *)(v37 + v38 * v28 + 8) |= 1u;
            unsigned int v39 = *(_DWORD *)(v33 + 4 * v32);
            uint64_t v40 = *(void *)(a1 + 8);
            if (v39) {
              BOOL v41 = v40 == 0;
            }
            else {
              BOOL v41 = 1;
            }
            if (!v41 && *(_DWORD *)(a1 + 16) >= v39) {
              *(void *)(v40 + 8 * (v39 - 1)) = 0;
            }
            *(_DWORD *)(v33 + 4 * v32) = -1;
            ++*a4;
          }
          ++v32;
        }
        while (v32 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1));
      }
      unsigned int v26 = *(_DWORD *)(a1 + 32);
    }
  }
  uint64_t v42 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 120);
  return v42(a1);
}

uint64_t sub_21DC3132C(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[9];
  uint64_t v5 = *(void *)(v4 + 28);
  *(void *)(v4 + 28) = a2;
  *(_DWORD *)(v4 + 12) |= 1u;
  *(_DWORD *)(v4 + 16) = a2;
  if (v5 > a2)
  {
    uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*a1 + 160))(a1, a2);
    if (v6 || (uint64_t v6 = (*(uint64_t (**)(void *, void))(*a1 + 168))(a1, 0), v6))
    {
      uint64_t v7 = v6;
      goto LABEL_15;
    }
  }
  uint64_t v7 = (*(uint64_t (**)(void *))(*a1 + 120))(a1);
  (*(void (**)(void))(*(void *)a1[3] + 472))();
  if (v7)
  {
LABEL_15:
    uint64_t v13 = a1[5];
    uint64_t v14 = a1[9];
    *(void *)(v14 + 28) = v13;
    *(_DWORD *)(v14 + 16) = v13;
    return v7;
  }
  uint64_t v8 = a2 / (*(uint64_t (**)(void *))(*a1 + 64))(a1);
  if (a2 % (*(uint64_t (**)(void *))(*a1 + 64))(a1)) {
    unsigned int v9 = v8 + 1;
  }
  else {
    unsigned int v9 = v8;
  }
  unsigned int v10 = (char *)malloc_type_realloc((void *)a1[1], 8 * v9, 0x100004000313F17uLL);
  if (!v10)
  {
    uint64_t v7 = 12;
    goto LABEL_15;
  }
  a1[1] = v10;
  uint64_t v11 = *((unsigned int *)a1 + 4);
  if (v9 > v11) {
    bzero(&v10[8 * v11], 8 * (v9 - v11));
  }
  uint64_t v7 = 0;
  *((_DWORD *)a1 + 4) = v9;
  a1[5] = a2;
  return v7;
}

uint64_t sub_21DC3151C(uint64_t a1, uint64_t a2)
{
  CFArrayRef theArray = 0;
  unsigned int v19 = 0;
  char v18 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, CFArrayRef *))(*(void *)a1 + 176))(a1, a2, &v19, &theArray);
  if (!v4)
  {
    if (v19)
    {
      unsigned int Count = CFArrayGetCount(theArray);
      unsigned int v6 = Count;
      if (Count)
      {
        if (v19 >= Count) {
          unsigned int v7 = Count;
        }
        else {
          unsigned int v7 = v19;
        }
        if (a2) {
          (*(void (**)(uint64_t, double))(*(void *)a2 + 344))(a2, 0.0);
        }
        if (v7)
        {
          unsigned int v9 = v6 - 1;
          unsigned int v10 = 1;
          float v11 = -1.0;
          do
          {
            unsigned int valuePtr = 0;
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v9);
            CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
            uint64_t v13 = (*(uint64_t (**)(uint64_t, void, char *))(*(void *)a1 + 184))(a1, valuePtr, &v18);
            if (v13) {
              goto LABEL_34;
            }
            if (a2 && v18)
            {
              float v8 = (float)v7;
              if ((float)((float)((float)((float)v10 * 100.0) / (float)v7) - v11) >= 1.0)
              {
                (*(void (**)(uint64_t, float))(*(void *)a2 + 344))(a2, (float)((float)v10 * 100.0) / v8);
                float v11 = (float)((float)v10 * 100.0) / v8;
              }
              if ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352))(a2))
              {
                int v15 = 2714;
                goto LABEL_30;
              }
            }
            else if (!v18)
            {
              break;
            }
            ++v10;
            --v9;
          }
          while (v10 <= v7);
        }
      }
    }
    if (a2)
    {
      (*(void (**)(uint64_t, float))(*(void *)a2 + 344))(a2, 100.0);
      if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 352))(a2))
      {
        int v15 = 2728;
LABEL_30:
        syslog(5, "CSparseFile::compact(): line %d: returning kDI_USERCANCELED", v15);
        uint64_t v4 = 111;
        goto LABEL_31;
      }
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(a1);
    if (v13)
    {
LABEL_34:
      uint64_t v4 = v13;
      goto LABEL_31;
    }
    if (a2 && (*(unsigned int (**)(uint64_t))(*(void *)a2 + 352))(a2))
    {
      int v15 = 2739;
      goto LABEL_30;
    }
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
    uint64_t v4 = v14;
    if (a2 && !v14) {
      (*(void (**)(uint64_t, float))(*(void *)a2 + 344))(a2, 100.0);
    }
  }
LABEL_31:
  if (theArray) {
    CFRelease(theArray);
  }
  return v4;
}

uint64_t sub_21DC318AC(void *a1, uint64_t a2, _DWORD *a3, CFMutableArrayRef *a4)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (a2 && ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352))(a2) & 1) != 0)
  {
    int v10 = 2775;
LABEL_30:
    syslog(5, "CSparseFile::buildSortedBandList(): line %d: returning kDI_USERCANCELED", v10);
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableArrayRef Mutable = 0;
    }
    int v12 = 0;
    uint64_t result = 111;
    goto LABEL_33;
  }
  uint64_t v24 = a4;
  uint64_t v11 = a1[9];
  int v12 = 0;
  if ((*(unsigned int (**)(void *))(*a1 + 88))(a1))
  {
    unsigned int v13 = 0;
    uint64_t v14 = (unsigned int *)(v11 + 64);
    do
    {
      uint64_t result = *v14;
      if (result == -1)
      {
        ++v12;
      }
      else
      {
        if (!result) {
          goto LABEL_28;
        }
        CFNumberRef v16 = CFNumberCreate(v8, kCFNumberSInt32Type, v14);
        CFArrayAppendValue(Mutable, v16);
        CFRelease(v16);
      }
      ++v13;
      ++v14;
    }
    while (v13 < (*(unsigned int (**)(void *))(*a1 + 88))(a1));
  }
  if (*((_DWORD *)a1 + 8))
  {
    int v17 = 1;
    while (!a2 || ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352))(a2) & 1) == 0)
    {
      uint64_t v18 = a1[10];
      if (v18 && (uint64_t v19 = (v17 - 1), *((_DWORD *)a1 + 8) > v19)) {
        uint64_t v20 = v18 + (*(uint64_t (**)(void *))(*a1 + 80))(a1) * v19;
      }
      else {
        uint64_t v20 = 0;
      }
      if ((*(unsigned int (**)(void *))(*a1 + 96))(a1))
      {
        unsigned int v21 = 0;
        CFNumberRef v22 = (unsigned int *)(v20 + 56);
        do
        {
          uint64_t result = *v22;
          if (result == -1)
          {
            ++v12;
          }
          else
          {
            if (!result) {
              goto LABEL_28;
            }
            CFNumberRef v23 = CFNumberCreate(v8, kCFNumberSInt32Type, v22);
            CFArrayAppendValue(Mutable, v23);
            CFRelease(v23);
          }
          ++v21;
          ++v22;
        }
        while (v21 < (*(unsigned int (**)(void *))(*a1 + 96))(a1));
      }
      if (++v17 > *((_DWORD *)a1 + 8)) {
        goto LABEL_27;
      }
    }
    int v10 = 2797;
    a4 = v24;
    goto LABEL_30;
  }
LABEL_27:
  uint64_t result = 0;
LABEL_28:
  a4 = v24;
LABEL_33:
  *a3 = v12;
  *a4 = Mutable;
  return result;
}

uint64_t sub_21DC31BB0(uint64_t a1, unsigned int a2, unsigned char *a3)
{
  uint64_t v46 = 0;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  uint64_t v40 = a3;
  uint64_t v41 = 0;
  *a3 = 0;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 16) < a2) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = *(void *)(v7 + 8 * (a2 - 1));
      }
    }
  }
  uint64_t v8 = v6 << 9;
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  int v11 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1))
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    int v12 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    goto LABEL_22;
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  int v12 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  unsigned int v13 = 0;
  uint64_t v14 = (int *)(v9 + 64);
  do
  {
    int v15 = *v14;
    if (!*v14) {
      goto LABEL_57;
    }
    if (!(v11 & 1 | (v15 != -1)))
    {
      uint64_t v44 = (_DWORD *)(*(void *)(a1 + 72) + 12);
      int v11 = 1;
      uint64_t v42 = v14;
    }
    if (v15 == a2)
    {
      uint64_t v45 = (_DWORD *)(*(void *)(a1 + 72) + 12);
      int v12 = 1;
      uint64_t v43 = v14;
    }
    if (v11) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v8;
    }
    v10 += v16;
    if (v11 & v12)
    {
      int v12 = 1;
      int v11 = 1;
      goto LABEL_21;
    }
    ++v13;
    ++v14;
  }
  while (v13 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1));
  if ((v11 & 1) == 0)
  {
LABEL_22:
    unsigned int v17 = 1;
    while (1)
    {
      unsigned int v18 = *(_DWORD *)(a1 + 32);
      if (v17 > v18) {
        goto LABEL_57;
      }
      uint64_t v19 = v17 - 1;
      uint64_t v20 = *(void *)(a1 + 80);
      if (v20 && v18 > v19) {
        break;
      }
      uint64_t v22 = 0;
      if ((v11 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_32:
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1))
      {
        unsigned int v23 = 0;
        uint64_t v24 = (int *)(v22 + 56);
        do
        {
          int v25 = *v24;
          if (!*v24) {
            goto LABEL_57;
          }
          if (!(v11 & 1 | (v25 != -1)))
          {
            uint64_t v26 = *(void *)(a1 + 80);
            if (v26 && *(_DWORD *)(a1 + 32) > v19)
            {
              uint64_t v27 = v26 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v19;
              int v25 = *v24;
            }
            else
            {
              uint64_t v27 = 0;
              int v25 = -1;
            }
            uint64_t v44 = (_DWORD *)(v27 + 8);
            int v11 = 1;
            uint64_t v42 = v24;
          }
          if (v25 == a2)
          {
            uint64_t v28 = *(void *)(a1 + 80);
            if (v28 && *(_DWORD *)(a1 + 32) > v19) {
              uint64_t v29 = v28 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v19;
            }
            else {
              uint64_t v29 = 0;
            }
            uint64_t v45 = (_DWORD *)(v29 + 8);
            int v12 = 1;
            uint64_t v43 = v24;
          }
          if (v11) {
            uint64_t v30 = 0;
          }
          else {
            uint64_t v30 = v8;
          }
          v10 += v30;
          if (v11 & v12)
          {
            int v12 = 1;
            int v11 = 1;
            break;
          }
          ++v23;
          ++v24;
        }
        while (v23 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1));
      }
      ++v17;
      if (v11 & 1) != 0 && (v12) {
        goto LABEL_56;
      }
    }
    uint64_t v22 = v20 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * v19;
    if (v11) {
      goto LABEL_32;
    }
LABEL_31:
    v10 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    goto LABEL_32;
  }
LABEL_21:
  if ((v12 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_56:
  LOBYTE(v12) = 1;
  LOBYTE(v11) = 1;
LABEL_57:
  uint64_t v31 = 999;
  if (v11 & 1) != 0 && (v12)
  {
    if (v10 >= v41) {
      return 0;
    }
    if (v8 >= 0x100000) {
      int64_t v32 = 0x100000;
    }
    else {
      int64_t v32 = v8;
    }
    uint64_t v33 = malloc_type_malloc(v32, 0x1C990A5FuLL);
    if (!v33) {
      return 12;
    }
    unsigned int v34 = v33;
    if (v8)
    {
      uint64_t v35 = 0;
      while (1)
      {
        int64_t v36 = v8 >= v32 ? v32 : v8;
        uint64_t v37 = (*(uint64_t (**)(void, uint64_t, int64_t, uint64_t *, void *))(**(void **)(a1 + 24)
                                                                                            + 328))(*(void *)(a1 + 24), v35 + v41, v36, &v46, v34);
        if (v37) {
          break;
        }
        if (!v46) {
          goto LABEL_80;
        }
        uint64_t v37 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void *))(**(void **)(a1 + 24) + 336))(*(void *)(a1 + 24), v35 + v10, v46, &v46, v34);
        if (v37) {
          break;
        }
        if (!v46)
        {
LABEL_80:
          uint64_t v31 = 999;
          goto LABEL_81;
        }
        v35 += v46;
        v8 -= v46;
        if (!v8) {
          goto LABEL_74;
        }
      }
    }
    else
    {
LABEL_74:
      *uint64_t v43 = -1;
      *v45 |= 1u;
      *uint64_t v42 = a2;
      *v44 |= 1u;
      uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
      if (!v37)
      {
        (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
        if (a2)
        {
          uint64_t v38 = *(void *)(a1 + 8);
          if (v38)
          {
            if (*(_DWORD *)(a1 + 16) >= a2) {
              *(void *)(v38 + 8 * (a2 - 1)) = v10;
            }
          }
        }
        uint64_t v31 = 0;
        *uint64_t v40 = 1;
        goto LABEL_81;
      }
    }
    uint64_t v31 = v37;
LABEL_81:
    free(v34);
  }
  return v31;
}

uint64_t sub_21DC32170(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 32);
  if (!v1) {
    return 0;
  }
  while (1)
  {
    uint64_t v3 = v1 - 1;
    uint64_t v4 = *(void *)(a1 + 80);
    if (v4 && *(_DWORD *)(a1 + 32) > v3) {
      uint64_t v5 = v4 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v1 - 1);
    }
    else {
      uint64_t v5 = 0;
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1))
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 + 56;
      while ((*(_DWORD *)(v7 + 4 * v6) + 1) <= 1)
      {
        if (++v6 >= (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96))(a1)) {
          goto LABEL_10;
        }
      }
      return 0;
    }
LABEL_10:
    if (v1 == 1) {
      break;
    }
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = v8 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v1 - 2);
    uint64_t v10 = *(void *)(v9 + 12);
    *(void *)(v9 + 12) = 0;
    *(_DWORD *)(v9 + 8) |= 1u;
    int v11 = *(void **)(a1 + 80);
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    unsigned int v13 = malloc_type_realloc(v11, v12 * (*(_DWORD *)(a1 + 32) - 1), 0xFD5C7576uLL);
    if (!v13) {
      return 12;
    }
    *(void *)(a1 + 80) = v13;
    --*(_DWORD *)(a1 + 32);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
    if (result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312))(*(void *)(a1 + 24), v10);
    if (result) {
      return result;
    }
    *(void *)(a1 + 112) = v10;
    *(void *)(a1 + 120) = v10;
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
    uint64_t v1 = v3;
    if (!v3) {
      return 0;
    }
  }
  uint64_t v16 = *(void *)(a1 + 72);
  int v15 = *(void **)(a1 + 80);
  uint64_t v17 = *(void *)(v16 + 20);
  *(_DWORD *)(v16 + 12) |= 1u;
  *(void *)(v16 + 20) = 0;
  if (v15)
  {
    free(v15);
    *(void *)(a1 + 80) = 0;
  }
  *(_DWORD *)(a1 + 32) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312))(*(void *)(a1 + 24), v17);
    if (!result)
    {
      *(void *)(a1 + 112) = v17;
      *(void *)(a1 + 120) = v17;
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC32494(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  uint64_t v3 = v2 << 9;
  int v4 = *(_DWORD *)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
    unsigned int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
    if (!v8) {
      goto LABEL_27;
    }
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = v7 + ((v2 * v8) << 9);
    unsigned int v11 = v8 - 1;
    while (1)
    {
      uint64_t v12 = v9 + 4 * v11;
      int v15 = *(_DWORD *)(v12 + 64);
      unsigned int v13 = (_DWORD *)(v12 + 64);
      int v14 = v15;
      if (v15)
      {
        if (v14 != -1)
        {
          uint64_t v7 = v10;
          goto LABEL_27;
        }
        *unsigned int v13 = 0;
        *(_DWORD *)(v9 + 12) |= 1u;
      }
      v10 -= v3;
      if (!(unint64_t)v11--) {
        goto LABEL_27;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 80);
  if (v5)
  {
    uint64_t v6 = v5 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v4 - 1);
    int v4 = *(_DWORD *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v4 == 1)
  {
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 72) + 20);
  }
  else
  {
    uint64_t v18 = 0;
    if (v4)
    {
      uint64_t v19 = *(void *)(a1 + 80);
      if (v19) {
        uint64_t v18 = v19 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) * (v4 - 2);
      }
    }
    uint64_t v17 = (uint64_t *)(v18 + 12);
  }
  uint64_t v20 = *v17;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1) + v20;
  unsigned int v21 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  if (v21)
  {
    uint64_t v22 = v7 + ((v2 * v21) << 9);
    unsigned int v23 = v21 - 1;
    do
    {
      uint64_t v24 = v6 + 4 * v23;
      int v27 = *(_DWORD *)(v24 + 56);
      int v25 = (_DWORD *)(v24 + 56);
      int v26 = v27;
      if (v27)
      {
        if (v26 != -1)
        {
          uint64_t v7 = v22;
          break;
        }
        *int v25 = 0;
        *(_DWORD *)(v6 + 8) |= 1u;
      }
      v22 -= v3;
    }
    while ((unint64_t)v23--);
  }
LABEL_27:
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312))(*(void *)(a1 + 24), v7);
    if (!result)
    {
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v7;
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472))(*(void *)(a1 + 24), 1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC32788(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_21DC32790(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_21DC3279C()
{
  return 0;
}

CFDictionaryRef sub_21DC327A4(uint64_t a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)(*(uint64_t (**)(void))(**(void **)(a1 + 176) + 192))(*(void *)(a1 + 176));
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v2);
    if (MutableCopy)
    {
      uint64_t v5 = MutableCopy;
      CFStringRef v6 = CFStringCreateWithFormat(v3, 0, @"sectors %qd-%qd", *(void *)(a1 + 160), *(void *)(a1 + 160) + *(void *)(a1 + 168) - 1);
      if (v6)
      {
        CFStringRef v7 = v6;
        CFDictionarySetValue(v5, @"sector-range", v6);
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v3, v5);
        CFRelease(v7);
      }
      else
      {
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v3, v5);
      }
      CFRelease(v2);
      CFDictionaryRef v2 = Copy;
    }
    else
    {
      uint64_t v5 = v2;
    }
    CFRelease(v5);
  }
  return v2;
}

uint64_t sub_21DC328B4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 72))(*(void *)(a1 + 176));
  if (result)
  {
    CFDictionaryRef v2 = (const void *)result;
    CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%1$@ (part)", result);
    CFRelease(v2);
    return (uint64_t)v3;
  }
  return result;
}

uint64_t sub_21DC32938(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 128))();
}

uint64_t sub_21DC32960(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 136))();
}

uint64_t sub_21DC32988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 144))(*(void *)(a1 + 176), *(void *)(a1 + 160) + a2);
  }
  else {
    return 22;
  }
}

uint64_t sub_21DC329DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 96))(*(void *)(a1 + 176))
       - *(void *)(a1 + 160);
}

__CFDictionary *sub_21DC32A2C(uint64_t a1)
{
  CFDictionaryRef v2 = sub_21DC26910(a1);
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    uint64_t v5 = DIGetBundleRef();
    if (v5)
    {
      CFTypeRef v6 = sub_21DC3A890(v5, (int)@"partial", @"partial");
      CFDictionaryAddValue(v2, @"Format Description", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFDictionaryAddValue(v2, @"Format", @"SUBB");
      uint64_t v15 = 0;
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
      CFNumberRef v7 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Bytes", v7);
      if (v7) {
        CFRelease(v7);
      }
      uint64_t valuePtr = 0;
      CFNumberRef v8 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v8);
      if (v8) {
        CFRelease(v8);
      }
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
      CFNumberRef v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v9);
      if (v9) {
        CFRelease(v9);
      }
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) << 9;
      CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Compressed Bytes", v10);
      if (v10) {
        CFRelease(v10);
      }
      uint64_t v15 = 0x3FF0000000000000;
      CFNumberRef v11 = CFNumberCreate(v3, kCFNumberDoubleType, &v15);
      CFDictionaryAddValue(Mutable, @"Compressed Ratio", v11);
      if (v11) {
        CFRelease(v11);
      }
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
      CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Sector Count", v12);
      if (v12) {
        CFRelease(v12);
      }
      CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
      CFDictionaryAddValue(Value, @"Compressed", @"no");
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_21DC32D4C(uint64_t a1, uint64_t a2)
{
  if (sub_21DC0C7FC(a1))
  {
    return sub_21DC2A758(a1, a2);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(**(void **)(a1 + 176) + 360);
    return v5();
  }
}

uint64_t sub_21DC32DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 104) || sub_21DC0C7FC(a1))
  {
    return sub_21DC0CA30(a1, a2, a3);
  }
  else
  {
    CFNumberRef v7 = *(uint64_t (**)(void))(**(void **)(a1 + 176) + 336);
    return v7();
  }
}

uint64_t sub_21DC32E90(uint64_t a1, float a2)
{
  if (*(void *)(a1 + 112) || sub_21DC0C7FC(a1))
  {
    return sub_21DC0C770(a1, a2);
  }
  else
  {
    CFTypeRef v6 = *(uint64_t (**)(__n128))(**(void **)(a1 + 176) + 344);
    v4.n128_f32[0] = a2;
    return v6(v4);
  }
}

uint64_t sub_21DC32F38(uint64_t a1)
{
  if (*(void *)(a1 + 120) || sub_21DC0C7FC(a1))
  {
    return sub_21DC0E9E0(a1);
  }
  else
  {
    CFAllocatorRef v3 = *(uint64_t (**)(void))(**(void **)(a1 + 176) + 352);
    return v3();
  }
}

uint64_t sub_21DC32FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  if (!sub_21DC0C7FC(a1)) {
    uint64_t v13 = *(void *)(v13 + 176);
  }
  return sub_21DC2C888(v13, a2, a3, a4, a5, a6, a7);
}

const char *sub_21DC33050()
{
  return "CSubDiskImage";
}

uint64_t sub_21DC330A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v27 = 0;
  CFNumberRef v10 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 160));
  if (!a5)
  {
LABEL_33:
    uint64_t v13 = 0;
    uint64_t v17 = 22;
    goto LABEL_30;
  }
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1))
  {
    uint64_t v11 = *(void *)(a1 + 360);
    if (v11 < a2 || a3 + a2 > v11) {
      goto LABEL_33;
    }
    uint64_t v20 = v10;
    uint64_t v13 = 0;
    while (a3)
    {
      int v26 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v22 = 0;
      sub_21DC0DF7C(a1, a2, &v25, &v26, &v24, &v23, &v22, &v21, 0);
      if (v23 - (a2 - v24) >= a3) {
        uint64_t v14 = a3;
      }
      else {
        uint64_t v14 = v23 - (a2 - v24);
      }
      unsigned int v15 = 1;
      if (v26 >= -2147483639)
      {
        switch(v26)
        {
          case -1:
            unsigned int v15 = 999;
            break;
          case 0:
          case 2:
            break;
          case 1:
            uint64_t v18 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
            unsigned int v15 = (*(uint64_t (**)(void))(v18 + 336))();
            break;
          default:
            if (v26 == 2147483646) {
              unsigned int v15 = 1;
            }
            else {
              unsigned int v15 = 107;
            }
            break;
        }
      }
      a3 -= v14;
      v13 += v14;
      a2 += v14;
      a5 += v14 << 9;
      if (v15) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v14 == 0;
      }
      if (v16) {
        uint64_t v17 = 999;
      }
      else {
        uint64_t v17 = v15;
      }
      if (v17) {
        goto LABEL_29;
      }
    }
    uint64_t v17 = 0;
LABEL_29:
    CFNumberRef v10 = v20;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v17 = 999;
  }
LABEL_30:
  if (a4) {
    *a4 = v13;
  }
  pthread_rwlock_unlock(v10);
  return v17;
}

uint64_t DIUDIFDiskImageGetBLKXStartingAt_0(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v2 = *(uint64_t **)(a1 + 928);
  if (!v2 || *(__int16 *)(a1 + 912) < 1) {
    return 0;
  }
  uint64_t v3 = *(unsigned __int16 *)(a1 + 912);
  while (1)
  {
    uint64_t result = *v2;
    if (*v2)
    {
      if (*(void *)(*(void *)result + 8) == a2) {
        break;
      }
    }
    ++v2;
    if (!--v3) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC33348(uint64_t a1)
{
  return *(void *)(a1 + 920);
}

uint64_t sub_21DC33350(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = sub_21DC04598(a3);
  uint64_t v18 = 0;
  int v17 = 0;
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1)) {
    return 78;
  }
  int v8 = sub_21DC07754(a2, &v17);
  uint64_t v6 = 110;
  if ((v17 & 0x80000000) == 0 && v8)
  {
    *(_DWORD *)(a1 + 144) = v8;
    uint64_t v9 = (*(uint64_t (**)(uint64_t *, uint64_t))(*a2 + 80))(a2, v5);
    if (v9
      || (uint64_t v10 = (*(uint64_t (**)(uint64_t *))(*a2 + 72))(a2),
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520))(a1, v10),
          uint64_t v9 = (*(uint64_t (**)(uint64_t *))(*a2 + 272))(a2),
          v9))
    {
      uint64_t v6 = v9;
      int v11 = 0;
    }
    else
    {
      uint64_t v12 = *a2;
      if (__dynamic_cast(a2, (const struct __class_type_info *)&unk_26CE84370, (const struct __class_type_info *)&unk_26CE86B68, 0))
      {
        (*(void (**)(uint64_t *, uint64_t))(v12 + 704))(a2, a1 + 392);
        unsigned int v13 = (*(uint64_t (**)(uint64_t *, uint64_t *))(*a2 + 344))(a2, &v18);
        if (v13)
        {
          uint64_t v18 = 0;
          if (v13 == 78 || v13 == 2) {
            uint64_t v6 = 107;
          }
          else {
            uint64_t v6 = v13;
          }
          goto LABEL_22;
        }
        uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 584))(a1, v18);
        if (v15
          || (uint64_t v16 = 0, v15 = (*(uint64_t (**)(uint64_t *, uint64_t *))(*a2 + 296))(a2, &v16), v15)
          || (uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 592))(a1, v16), v15)
          || (uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 600))(a1), v15))
        {
          uint64_t v6 = v15;
        }
        else
        {
          nullsub_4(*(void *)(a1 + 904));
          if (v18)
          {
            (*(void (**)(uint64_t *, void))(*a2 + 352))(a2, 0);
            uint64_t v18 = 0;
          }
          uint64_t v6 = sub_21DC0AB3C(a1);
          if (!v6)
          {
            sub_21DC0ABBC(a1, (char *)a2);
            *(void *)(a1 + 360) = *(void *)(**(void **)(a1 + 904) + 16);
            return v6;
          }
        }
        int v11 = 1;
      }
      else
      {
        int v11 = 1;
        uint64_t v6 = 107;
      }
    }
    if (v18)
    {
      (*(void (**)(uint64_t *, void))(*a2 + 352))(a2, 0);
      uint64_t v18 = 0;
      if ((v11 & 1) == 0) {
        return v6;
      }
    }
    else if (!v11)
    {
      return v6;
    }
LABEL_22:
    (*(void (**)(uint64_t *, void))(*a2 + 280))(a2, 0);
  }
  return v6;
}

uint64_t sub_21DC3378C(uint64_t a1, const char *a2)
{
  CFDictionaryRef v2 = "";
  if (a2) {
    CFDictionaryRef v2 = a2;
  }
  uint64_t v3 = "YES";
  if (*(void *)(a1 + 104)) {
    __n128 v4 = "YES";
  }
  else {
    __n128 v4 = "NO";
  }
  if (!*(unsigned char *)(a1 + 112)) {
    uint64_t v3 = "NO";
  }
  return fprintf((FILE *)*MEMORY[0x263EF8348], "%s%qd at %qd (read %s, zero %s)\n", v2, *(void *)(a1 + 96), *(void *)(a1 + 88), v4, v3);
}

BOOL sub_21DC3380C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 160))(a1, a2, a3, 0) == 0;
}

uint64_t sub_21DC33864()
{
  return 78;
}

void sub_21DC3386C(uint64_t a1, const __CFString *a2)
{
  __n128 v4 = (const char *)sub_21DC0373C(a2, 0x8000100u);
  if (!v4) {
    return;
  }
  uint64_t v5 = (char *)v4;
  uint64_t v6 = v4 + 14;
  if (!v4[14]) {
    goto LABEL_60;
  }
  if (strcmp(v4 + 14, "global"))
  {
    if (!strcmp(v6, "ddm"))
    {
      uint64_t v11 = -1;
    }
    else
    {
      __endptr = 0;
      uint64_t v7 = strtol(v6, &__endptr, 0);
      uint64_t v8 = v7 << 32;
      if (*__endptr) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 < (uint64_t)0xFFFFFFFE00000000;
      }
      if (v9) {
        goto LABEL_60;
      }
      if (v8 == 0xFFFFFFFE00000000) {
        goto LABEL_10;
      }
      uint64_t v11 = (int)v7;
    }
    uint64_t v12 = v11 - *(__int16 *)(a1 + 914);
    if (v12 < *(__int16 *)(a1 + 912))
    {
      uint64_t v10 = (uint64_t **)(*(void *)(a1 + 928) + 8 * v12);
      goto LABEL_15;
    }
LABEL_60:
    free(v5);
    return;
  }
LABEL_10:
  uint64_t v10 = (uint64_t **)(a1 + 904);
  uint64_t v11 = -2;
LABEL_15:
  unsigned int v13 = *v10;
  if (!*v10) {
    goto LABEL_60;
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    goto LABEL_60;
  }
  uint64_t v16 = Mutable;
  CFStringRef v42 = a2;
  CFNumberRef v17 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*v13 + 8));
  CFDictionarySetValue(v16, @"sector-start", v17);
  if (v17) {
    CFRelease(v17);
  }
  CFNumberRef v18 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*v13 + 16));
  CFDictionarySetValue(v16, @"sector-count", v18);
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v19 = sub_21DC0C810(a1, v11);
  if (v19) {
    CFDictionarySetValue(v16, @"name", v19);
  }
  CFMutableArrayRef v20 = CFArrayCreateMutable(v14, 0, MEMORY[0x263EFFF70]);
  if (v20)
  {
    CFMutableArrayRef v21 = v20;
    uint64_t v39 = a1;
    CFMutableDictionaryRef theDict = v16;
    uint64_t v41 = v5;
    uint64_t v22 = *v13;
    int v23 = *(_DWORD *)(*v13 + 200);
    uint64_t valuePtr = 0;
    __endptr = 0;
    if (v23)
    {
      uint64_t v24 = v22 + 208;
      value = (void *)*MEMORY[0x263EFFB40];
      uint64_t v44 = v20;
      do
      {
        CFMutableDictionaryRef v25 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (!v25)
        {
          free(v41);
          CFRelease(theDict);
          CFRelease(v21);
          return;
        }
        int v26 = v25;
        int v27 = 0;
        unsigned int v28 = *(_DWORD *)(v24 - 4);
        __endptr = *(char **)(v24 + 4);
        uint64_t valuePtr = *(void *)(v24 + 12);
        unsigned int v29 = v28 >> 28;
        if (v28 >> 28 > 7)
        {
          if (v29 == 8)
          {
            BOOL v30 = 0;
            BOOL v31 = 0;
            int v32 = 0;
            int v34 = 0;
            int v27 = 1;
LABEL_38:
            int v33 = 1;
            goto LABEL_39;
          }
          BOOL v30 = 0;
          BOOL v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          if (v29 == 15)
          {
            int v27 = 0;
            BOOL v30 = 0;
            BOOL v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 1;
          }
        }
        else
        {
          if (!v29)
          {
            if (v28 <= 2)
            {
              int v27 = 0;
              int v32 = 0;
              int v34 = 0;
              BOOL v31 = (v28 & 7) == 0;
              BOOL v30 = (v28 & 7) == 2;
              int v33 = v28 & 1;
              goto LABEL_39;
            }
            int v27 = 0;
            BOOL v30 = 0;
            BOOL v31 = 0;
            int v32 = 0;
            int v34 = 0;
            goto LABEL_38;
          }
          BOOL v30 = 0;
          BOOL v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          if (v29 == 7)
          {
            int v27 = 0;
            BOOL v30 = 0;
            BOOL v31 = 0;
            int v33 = 0;
            int v34 = 0;
            int v32 = 1;
          }
        }
LABEL_39:
        int v45 = v33;
        CFAllocatorRef v35 = v14;
        CFNumberRef v36 = CFNumberCreate(v14, kCFNumberLongLongType, &__endptr);
        CFDictionarySetValue(v26, @"sector-start", v36);
        if (v36) {
          CFRelease(v36);
        }
        CFNumberRef v37 = CFNumberCreate(v35, kCFNumberLongLongType, &valuePtr);
        CFDictionarySetValue(v26, @"sector-count", v37);
        if (v37) {
          CFRelease(v37);
        }
        if (v32)
        {
          CFNumberRef v38 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)v24);
          CFDictionarySetValue(v26, @"comment", v38);
          if (v38) {
            CFRelease(v38);
          }
        }
        if (v34) {
          CFDictionarySetValue(v26, @"terminator", value);
        }
        CFAllocatorRef v14 = v35;
        if (v45) {
          CFDictionarySetValue(v26, @"data", value);
        }
        CFMutableArrayRef v21 = v44;
        if (v31)
        {
          CFDictionarySetValue(v26, @"zero", value);
          if (v30) {
            goto LABEL_57;
          }
        }
        else if (v30)
        {
LABEL_57:
          CFDictionarySetValue(v26, @"ignored", value);
          if (!v27) {
            goto LABEL_54;
          }
LABEL_53:
          CFDictionarySetValue(v26, @"compressed", value);
          goto LABEL_54;
        }
        if (v27) {
          goto LABEL_53;
        }
LABEL_54:
        CFArrayAppendValue(v44, v26);
        CFRelease(v26);
        v24 += 40;
        --v23;
      }
      while (v23);
    }
    CFDictionarySetValue(theDict, @"runs", v21);
    CFRelease(v21);
    (*(void (**)(uint64_t, const __CFString *, CFMutableDictionaryRef))(*(void *)v39 + 32))(v39, v42, theDict);
    CFRelease(theDict);
    uint64_t v5 = v41;
    goto LABEL_60;
  }
  free(v5);
  CFRelease(v16);
}

void sub_21DC33DCC(uint64_t a1)
{
  sub_21DC11160(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC33E14(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC33E38(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  *(_DWORD *)(a1 + 912) = 1;
  *(_WORD *)(a1 + 916) = 0;
  __n128 v4 = malloc_type_calloc(8uLL, 1uLL, 0x49666C96uLL);
  *(void *)(a1 + 928) = v4;
  if (!v4) {
    return 12;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  *(void *)(a1 + 936) = Mutable;
  if (!Mutable) {
    return 12;
  }
  uint64_t v19 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)pStr = 0u;
  __int16 v18 = 0;
  int v17 = 0;
  CFTypeRef cf = 0;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t **))(*(void *)a2 + 120))(a2, 1651272547, 0, &v19);
  **(void **)(a1 + 928) = v19;
  if (v7) {
    return v7;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *, __int16 *, int *, unsigned __int8 *, CFTypeRef *))(*(void *)a2 + 320))(a2, v19, &v18, &v17, pStr, &cf);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a2 + 248))(a2, v19);
  if (!v8)
  {
    if (cf)
    {
      BOOL v9 = CFRetain(cf);
    }
    else
    {
      CFStringRef v10 = CFStringCreateWithPascalString(v5, pStr, 0);
      if (v10)
      {
        BOOL v9 = v10;
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v10);
        goto LABEL_11;
      }
      int v14 = DIGetBundleRef();
      CFStringRef v15 = (const __CFString *)sub_21DC3A890(v14, (int)@"restricted segment %d", @"restricted segment %d");
      BOOL v9 = CFStringCreateWithFormat(v5, 0, v15, *(unsigned int *)(a1 + 448));
      CFRelease(v15);
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v9);
    if (!v9)
    {
LABEL_12:
      nullsub_4(v19);
      uint64_t v11 = *v19;
      unint64_t v12 = sub_21DC3A9E4((uint64_t)v19);
      if (sub_21DC0A1B8(v11, v12)) {
        return 107;
      }
      else {
        return 0;
      }
    }
LABEL_11:
    CFRelease(v9);
    goto LABEL_12;
  }
  return v8;
}

uint64_t sub_21DC340C4(uint64_t a1)
{
  uint64_t v1 = **(const void ****)(a1 + 928);
  if (!v1) {
    return 22;
  }
  size_t v3 = 40 * (*((_DWORD *)*v1 + 50) - 1) + 244;
  __n128 v4 = (void **)sub_21DC3A90C(v3);
  *(void *)(a1 + 904) = v4;
  if (v4)
  {
    memcpy(*v4, *v1, v3);
    uint64_t result = 0;
    *(void *)(**(void **)(a1 + 904) + 8) = 0;
  }
  else if (sub_21DC3A898())
  {
    return 12;
  }
  else
  {
    return 0;
  }
  return result;
}

__CFDictionary *sub_21DC3415C(uint64_t a1)
{
  uint64_t v1 = sub_21DC271F0(a1);
  int v2 = DIGetBundleRef();
  CFTypeRef v3 = sub_21DC3A890(v2, (int)@"[restricted segment]", @"[restricted segment]");
  CFArrayRef Value = CFDictionaryGetValue(v1, @"Format Description");
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@ %@", Value, v3);
  CFDictionarySetValue(v1, @"Format Description", v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v1;
}

uint64_t sub_21DC34218(uint64_t a1)
{
  uint64_t v1 = sub_21DC0C840((_DWORD *)(**(void **)(a1 + 904) + 64));
  if (!v1) {
    operator new();
  }
  return v1;
}

void sub_21DC34274(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

void sub_21DC34298(unsigned int *a1, char *a2)
{
  (*(void (**)(unsigned int *, double))(*(void *)a1 + 344))(a1, 0.0);
  int v4 = DIGetBundleRef();
  CFStringRef v5 = (const __CFString *)sub_21DC3A890(v4, (int)@"Checksumming restricted segment %1$d\\U2026", @"Checksumming restricted segment %1$d\\U2026");
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v5, a1[112]);
  (*(void (**)(unsigned int *, CFStringRef, uint64_t))(*(void *)a1 + 336))(a1, v6, 16);
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  sub_21DC0CAE4((char *)a1, *((void **)a1 + 113), a2);
}

uint64_t sub_21DC34434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0;
  return 107;
}

uint64_t sub_21DC34440()
{
  return 0;
}

const char *sub_21DC3444C()
{
  return "CRestrictedUDIFDiskImage";
}

uint64_t sub_21DC34458(uint64_t a1, int a2)
{
  uint64_t v4 = sub_21DC0D1BC(a1);
  *(void *)uint64_t v4 = &unk_26CE85E48;
  *(unsigned char *)(v4 + 112) = 0;
  *(void *)(v4 + 88) = 0;
  *(void *)(v4 + 96) = 0;
  if (a2) {
    CFStringRef v5 = malloc_type_malloc(0x100000uLL, 0x318C0A67uLL);
  }
  else {
    CFStringRef v5 = 0;
  }
  *(void *)(a1 + 104) = v5;
  return a1;
}

void sub_21DC344C8(_Unwind_Exception *a1)
{
  sub_21DC0E970(v1);
  _Unwind_Resume(a1);
}

void sub_21DC344E4()
{
  sub_21DC0AB38();
  JUMPOUT(0x223C15E40);
}

void sub_21DC3452C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

const char *sub_21DC34550()
{
  return "CLZFSEDecompressor";
}

uint64_t sub_21DC3455C()
{
  return 2049;
}

void sub_21DC34568(char **a1)
{
  sub_21DC1171C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC345B0(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C408CA8AB75);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC345D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 416))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34610(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 424))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC3464C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 56))();
  }
  return result;
}

uint64_t sub_21DC3467C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 112))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC346B0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 136))();
  }
  return result;
}

uint64_t sub_21DC346E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 200);
  if (v3) {
    return (*(uint64_t (**)(void))(*(void *)v3 + 144))();
  }
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  return 999;
}

uint64_t sub_21DC34724(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 200))();
  }
  return result;
}

uint64_t sub_21DC34754(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 232))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34788(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 256))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC347C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 288))();
  }
  return result;
}

uint64_t sub_21DC347FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 296))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34838(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 312))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34874(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 328))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC348B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 336))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC348EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 352))();
  }
  return result;
}

uint64_t sub_21DC34924(void *a1)
{
  if (((*(uint64_t (**)(void *))(*a1 + 592))(a1) & 1) != 0 || (uint64_t v2 = a1[25]) == 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 360))(v2);
  }
  (*(void (**)(void *))(*a1 + 600))(a1);
  return v3;
}

uint64_t sub_21DC349E8(void *a1)
{
  (*(void (**)(void *))(*a1 + 608))(a1);
  if (((*(uint64_t (**)(void *))(*a1 + 592))(a1) & 1) == 0)
  {
    uint64_t v2 = a1[25];
    if (v2) {
      (*(void (**)(uint64_t, void))(*(void *)v2 + 368))(v2, 0);
    }
  }
  return 0;
}

uint64_t sub_21DC34AB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 376))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34AEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 384))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34B28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 392))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34B64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 400))();
  }
  else {
    return 999;
  }
}

uint64_t sub_21DC34BA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 408))();
  }
  else {
    return 999;
  }
}

const char *sub_21DC34BDC()
{
  return "CFileEncoding";
}

uint64_t sub_21DC34BE8()
{
  return 0;
}

void sub_21DC34BF4(char **a1)
{
  sub_21DC1171C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC34C3C(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C405C90840ALL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC34C60()
{
  return 78;
}

uint64_t sub_21DC34C68()
{
  return 78;
}

BOOL sub_21DC34C70(uint64_t a1)
{
  return *(void *)(a1 + 216) != 0;
}

uint64_t sub_21DC34C80()
{
  return 78;
}

uint64_t sub_21DC34C88(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 224);
  }
  return 0;
}

uint64_t sub_21DC34C9C(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 224);
  }
  return 0;
}

uint64_t sub_21DC34CB0()
{
  return 78;
}

uint64_t sub_21DC34CB8()
{
  return 0;
}

const char *sub_21DC34CC0()
{
  return "CFlatFileEncoding";
}

uint64_t sub_21DC34CCC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t sub_21DC34CD4(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_21DC34CE0(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (result != a2 && result != 0) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *a1 = a2;
  return result;
}

uint64_t sub_21DC34D40(uint64_t a1)
{
  unsigned int v1 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)a1 = v1;
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)(a1 + 36));
  *(int8x16_t *)(a1 + 36) = v2;
  if (v2.i32[3] > 0x200u || v1 > 0x20) {
    return 107;
  }
  else {
    return 0;
  }
}

uint64_t sub_21DC34D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 480) != 2) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 540))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while ((sub_21DC34E30(a1, a2, a3, (unsigned int *)(*(void *)(a1 + 528) + v6)) & 1) == 0)
    {
      ++v7;
      v6 += 616;
      if (v7 >= *(unsigned int *)(a1 + 540)) {
        goto LABEL_6;
      }
    }
    return 1;
  }
  else
  {
LABEL_6:
    v9[0] = a3;
    v9[1] = a2;
    return sub_21DC35004(a1, v9);
  }
}

uint64_t sub_21DC34E30(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  v26[2] = *MEMORY[0x263EF8340];
  size_t v6 = ((unint64_t)a4[21] >> 3);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  BOOL v9 = (char *)v22 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)v22 - ((v11 + 15) & 0x1FFFFFFF0);
  v26[0] = *(unsigned int *)(v13 + 48);
  v26[1] = v12;
  v25[0] = v6;
  v25[1] = v9;
  v24[0] = v15;
  v24[1] = v14;
  uint64_t v16 = sub_21DC356EC(v10, v24, (uint64_t)a4, (uint64_t)v25, (uint64_t)v26);
  if ((v16 & 1) == 0) {
    return 0;
  }
  MEMORY[0x270FA5388](v16);
  __int16 v18 = (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0);
  size_t v23 = 0;
  unsigned int v19 = a4[22];
  if (v19 == -2147483647)
  {
    CCAlgorithm v20 = 0;
  }
  else
  {
    if (v19 != 17) {
      sub_21DC1D0CC(45, (uint64_t)"Unsupported key encryption algorithm.");
    }
    CCAlgorithm v20 = 2;
  }
  if (CCCrypt(1u, v20, 1u, v9, v6, v12, a4 + 26, dataOutAvailable, (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0), dataOutAvailable, &v23))
  {
    return 0;
  }
  v22[0] = v23;
  v22[1] = v18;
  return sub_21DC1E12C(a1, v22);
}

uint64_t sub_21DC35004(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  int8x16_t v2 = (unsigned int *)(a1 + 570);
  unint64_t v3 = *(unsigned int *)(a1 + 570);
  if (*a2 != (((*(_DWORD *)(a1 + 578) + v3) >> 2) & 0x3FFFFFFE)) {
    return 0;
  }
  CFStringRef v5 = (const char *)a2[1];
  CFIndex v6 = v3 >> 3;
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  BOOL v9 = (const UInt8 *)v19 - v8;
  CFIndex v10 = (unint64_t)v2[2] >> 3;
  MEMORY[0x270FA5388](v7);
  uint64_t v13 = (const UInt8 *)v19 - v12;
  if (*v2 < 8)
  {
LABEL_7:
    if (v11 < 8)
    {
LABEL_11:
      CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      *(void *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, v6);
      *(void *)(a1 + 2024) = CFDataCreate(v17, v13, v10);
      return 1;
    }
    else
    {
      unint64_t v16 = 0;
      while (sscanf(&v5[((unint64_t)*v2 >> 2) & 0x3FFFFFFE], "%02hhx", &v13[v16]) == 1)
      {
        ++v16;
        v5 += 2;
        if (v16 >= (unint64_t)v2[2] >> 3) {
          goto LABEL_11;
        }
      }
      return 0;
    }
  }
  else
  {
    v19[0] = v19;
    unint64_t v14 = 0;
    uint64_t v15 = v5;
    while (sscanf(v15, "%02hhx", &v9[v14]) == 1)
    {
      ++v14;
      v15 += 2;
      if (v14 >= (unint64_t)*v2 >> 3)
      {
        unsigned int v11 = v2[2];
        goto LABEL_7;
      }
    }
    return 0;
  }
}

uint64_t sub_21DC35208(uint64_t a1, const __CFString *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 22;
  }
  bzero(buffer, 0x400uLL);
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 != CFStringGetTypeID() || !CFStringGetCString(a2, buffer, 1023, 0x8000100u)) {
    return 22;
  }
  size_t v5 = strlen(buffer);
  if (sub_21DC34D78(a1, (uint64_t)buffer, v5)) {
    return 0;
  }
  else {
    return 80;
  }
}

uint64_t sub_21DC352D8(_DWORD *a1, const __CFDictionary *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unsigned int v22 = 0;
  bzero(cStr, 0x400uLL);
  if (!a2) {
    goto LABEL_14;
  }
  CFArrayRef Value = CFDictionaryGetValue(a2, @"new-passphrase");
  if (!Value)
  {
    CFTypeRef v7 = 0;
    goto LABEL_10;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(Value))
  {
    CFTypeID v8 = CFArrayGetTypeID();
    if (v8 == CFGetTypeID(Value) && a1[120] != 1)
    {
      CFTypeRef v7 = CFRetain(Value);
      goto LABEL_10;
    }
    CCAlgorithm v20 = "key specified, but wrong type.";
    int v21 = 22;
LABEL_26:
    sub_21DC1D0CC(v21, (uint64_t)v20);
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable)
  {
    CCAlgorithm v20 = "cannot create passphrase array.\n";
    int v21 = -4960;
    goto LABEL_26;
  }
  CFTypeRef v7 = Mutable;
  CFArrayAppendValue(Mutable, Value);
LABEL_10:
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(a2, @"new-passphrase-index");
  if (v9)
  {
    CFTypeID v10 = CFNumberGetTypeID();
    if (v10 == CFGetTypeID(v9)) {
      sub_21DC1B748(v9, kCFNumberSInt32Type, &v22);
    }
  }
  if (!v7)
  {
LABEL_14:
    int v11 = DIGetBundleRef();
    CFTypeRef v12 = sub_21DC3A890(v11, (int)@"Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved.", @"Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved.");
    (*(void (**)(_DWORD *, CFTypeRef, char *))(*(void *)a1 + 712))(a1, v12, cStr);
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v14 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
    bzero(cStr, 0x400uLL);
    if (v14)
    {
      uint64_t v15 = CFArrayCreateMutable(v13, 0, MEMORY[0x263EFFF70]);
      CFTypeRef v7 = v15;
      if (v15)
      {
        CFArrayAppendValue(v15, v14);
        CFRelease(v14);
        if (v12) {
          CFRelease(v12);
        }
        goto LABEL_18;
      }
      __int16 v18 = "cannot create passphrase array.\n";
      int v19 = -4960;
    }
    else
    {
      __int16 v18 = "passphrase is not valid UTF-8 string.";
      int v19 = 999;
    }
    sub_21DC1D0CC(v19, (uint64_t)v18);
  }
LABEL_18:
  int v16 = (*(uint64_t (**)(_DWORD *, CFTypeRef, void))(*(void *)a1 + 720))(a1, v7, v22);
  if (v16) {
    sub_21DC1D0CC(v16, (uint64_t)"unable to change keys.");
  }
  CFRelease(v7);
  return 0;
}

void sub_21DC355E4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (v2) {
      CFRelease(v2);
    }
    size_t v5 = __cxa_begin_catch(exception_object);
    if (a2 == 2) {
      (*(uint64_t (**)(void *))(*(void *)v5 + 24))(v5);
    }
    __cxa_end_catch();
    JUMPOUT(0x21DC3554CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21DC356E4()
{
  return 78;
}

uint64_t sub_21DC356EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = *(_DWORD *)(a3 + 84);
  int v6 = *(_DWORD *)(a3 + 48);
  if (*a2 != 2 * (v6 + (v5 >> 3))) {
    return 0;
  }
  uint64_t v8 = a2[1];
  uint64_t v9 = *(void *)(a5 + 8);
  if (v5 >= 8)
  {
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)(a4 + 8);
    CFTypeRef v12 = (const char *)a2[1];
    while (sscanf(v12, "%02hhx", v11 + v10) == 1)
    {
      ++v10;
      v12 += 2;
      if (v10 >= (unint64_t)*(unsigned int *)(a3 + 84) >> 3)
      {
        int v6 = *(_DWORD *)(a3 + 48);
        goto LABEL_7;
      }
    }
    return 0;
  }
LABEL_7:
  if (!v6) {
    return 1;
  }
  int v13 = 0;
  unint64_t v14 = 0;
  do
  {
    BOOL v15 = sscanf((const char *)(v8 + (v13 & 0xFFFFFFFE) + (((unint64_t)*(unsigned int *)(a3 + 84) >> 2) & 0x3FFFFFFE)), "%02hhx", v9 + v14) == 1;
    uint64_t result = v15;
    if (!v15) {
      break;
    }
    ++v14;
    v13 += 2;
  }
  while (v14 < *(unsigned int *)(a3 + 48));
  return result;
}

uint64_t sub_21DC3580C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 320))(a1, a2, 1);
}

uint64_t sub_21DC3583C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  unint64_t v7 = *(void *)(a1 + 488);
  uint64_t v8 = *(void *)(a1 + 496);
  unint64_t v9 = a2 % v7;
  unint64_t v10 = v7 - a2 % v7;
  if (!v9) {
    unint64_t v10 = 0;
  }
  unint64_t v11 = v10 + a2;
  if (*(_DWORD *)(a1 + 480) == 1) {
    unint64_t v12 = v11 + 1276;
  }
  else {
    unint64_t v12 = *(void *)(a1 + 504) + v11;
  }
  if (a2 == v8) {
    return 0;
  }
  if (!v6) {
    return 999;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v6 + 312))(v6, v12);
  if (!result)
  {
    *(void *)(a1 + 512) = v12;
    *(void *)(a1 + 496) = a2;
    uint64_t result = sub_21DC1D900(a1);
    if (!result && a2 > v8 && a3)
    {
      unint64_t v14 = malloc_type_calloc(1uLL, 32 * *(void *)(a1 + 488), 0x1DC3C487uLL);
      uint64_t v21 = 0;
      if (v14)
      {
        BOOL v15 = v14;
        uint64_t v16 = a2 - v8;
        if (v16)
        {
          do
          {
            if (32 * *(void *)(a1 + 488) >= v16) {
              uint64_t v17 = v16;
            }
            else {
              uint64_t v17 = 32 * *(void *)(a1 + 488);
            }
            int v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1 + 336))(a1, v8, v17, &v21, v15);
            v16 -= v21;
            v8 += v21;
            if (v18) {
              BOOL v19 = 1;
            }
            else {
              BOOL v19 = v21 == 0;
            }
          }
          while (!v19 && v16 != 0);
        }
        free(v15);
        return 0;
      }
      return 12;
    }
  }
  return result;
}

int8x8_t sub_21DC359F4(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  *(int8x8_t *)(a1 + 48) = vrev32_s8(*(int8x8_t *)(a1 + 48));
  *(int8x16_t *)(a1 + 88) = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(_DWORD *)(a1 + 136) = bswap32(*(_DWORD *)(a1 + 136));
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  *(_DWORD *)(a1 + 436) = bswap32(*(_DWORD *)(a1 + 436));
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  *(_DWORD *)(a1 + 736) = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 996) = bswap32(*(_DWORD *)(a1 + 996));
  *(void *)(a1 + 1256) = bswap64(*(void *)(a1 + 1256));
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(int8x8_t *)(a1 + 1264) = result;
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  return result;
}

CFDictionaryRef sub_21DC35A90(uint64_t a1)
{
  CFDictionaryRef Mutable = (const __CFDictionary *)sub_21DC0FCAC(a1);
  int8x16_t v2 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (Mutable
    || (CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) != 0)
  {
    __int16 valuePtr = 0;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"owner-mode");
    if (Value && CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr)) {
      __int16 v4 = valuePtr & 0x1C0;
    }
    else {
      __int16 v4 = 448;
    }
    __int16 valuePtr = v4;
    CFNumberRef v5 = CFNumberCreate(*v2, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"owner-mode", v5);
    CFRelease(v5);
  }
  return Mutable;
}

void sub_21DC35B5C(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x223C15E40);
}

uint64_t *sub_21DC35B94(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_21DC35BEC()
{
  return 78;
}

uint64_t sub_21DC35BF4(uint64_t a1)
{
  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 592))(a1)) {
    goto LABEL_4;
  }
  if (*(unsigned char *)(a1 + 778))
  {
    uint64_t result = sub_21DC34924((void *)a1);
    if (result) {
      return result;
    }
    goto LABEL_4;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 360))(v3);
  if (!result)
  {
LABEL_4:
    (*(void (**)(uint64_t))(*(void *)a1 + 600))(a1);
    return 0;
  }
  return result;
}

uint64_t sub_21DC35CF0(unsigned __int8 *a1, uint64_t a2)
{
  (*(void (**)(unsigned __int8 *))(*(void *)a1 + 608))(a1);
  if ((*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 592))(a1)) {
    return 0;
  }
  int v5 = a1[778];
  uint64_t v6 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496))(a1);
  if (v5)
  {
    if (!v6) {
      return 999;
    }
    unint64_t v7 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496))(a1)
                             + 280);
    return v7();
  }
  if (!v6
    || (uint64_t v8 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496))(a1),
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 368))(v8, a2),
        !result))
  {
    unint64_t v7 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496))(a1)
                             + 368);
    return v7();
  }
  return result;
}

uint64_t sub_21DC35F30(unsigned char *a1, void *a2)
{
  if (a1[778])
  {
    return sub_21DC34C88((uint64_t)a1, a2);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned char *))(*(void *)a1 + 496))(a1) + 376);
    return v3();
  }
}

uint64_t sub_21DC35FE0(unsigned char *a1, void *a2)
{
  if (a1[778])
  {
    return sub_21DC34C9C((uint64_t)a1, a2);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned char *))(*(void *)a1 + 496))(a1) + 384);
    return v3();
  }
}

uint64_t sub_21DC36090(unsigned char *a1)
{
  if (a1[778]) {
    return 78;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unsigned char *))(*(void *)a1 + 496))(a1) + 392);
  return v2();
}

uint64_t sub_21DC36130(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!(*(unsigned int (**)(unint64_t *))(*a1 + 592))(a1)) {
    return 9;
  }
  if (*((unsigned char *)a1 + 778))
  {
    if (!a5) {
      return 22;
    }
    unint64_t v9 = a1[96];
    if ((uint64_t)v9 < a2 || a3 + a2 > v9) {
      return 29;
    }
    unint64_t v12 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1) + 328);
  }
  else
  {
    unint64_t v12 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1) + 400);
  }
  return v12();
}

uint64_t sub_21DC362F0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!(*(unsigned int (**)(unint64_t *))(*a1 + 592))(a1)) {
    return 9;
  }
  if (*((unsigned char *)a1 + 778))
  {
    if (!a5) {
      return 22;
    }
    unint64_t v9 = a1[96];
    if ((uint64_t)v9 < a2 || a3 + a2 > v9) {
      return 29;
    }
    unint64_t v12 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1) + 336);
  }
  else
  {
    unint64_t v12 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1) + 408);
  }
  return v12();
}

BOOL sub_21DC364B0(uint64_t a1)
{
  return *(_DWORD *)(a1 + 292) > 1u;
}

__n128 sub_21DC364C0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 584);
  long long v2 = *(_OWORD *)(a1 + 600);
  long long v3 = *(_OWORD *)(a1 + 616);
  long long v4 = *(_OWORD *)(a1 + 648);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 632);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 664);
  long long v6 = *(_OWORD *)(a1 + 680);
  long long v7 = *(_OWORD *)(a1 + 696);
  *(void *)(a2 + 128) = *(void *)(a1 + 712);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

__n128 sub_21DC364F8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 312);
  long long v2 = *(_OWORD *)(a1 + 328);
  long long v3 = *(_OWORD *)(a1 + 344);
  long long v4 = *(_OWORD *)(a1 + 376);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 360);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 392);
  long long v6 = *(_OWORD *)(a1 + 408);
  long long v7 = *(_OWORD *)(a1 + 424);
  *(void *)(a2 + 128) = *(void *)(a1 + 440);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

uint64_t sub_21DC36530(uint64_t a1)
{
  return *(unsigned int *)(a1 + 720);
}

uint64_t sub_21DC36538(uint64_t a1)
{
  return *(void *)(a1 + 724);
}

uint64_t sub_21DC36544(uint64_t a1)
{
  return (*(uint64_t (**)(double, float))(*(void *)a1 + 792))(0.0, 100.0);
}

uint64_t sub_21DC3657C(void *a1, void *a2, void *a3, float a4, float a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  float v37 = a4;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  int v8 = DIGetBundleRef();
  CFStringRef v9 = (const __CFString *)sub_21DC3A890(v8, (int)@"Validating \"%1$@\"\\U2026", @"Validating \"%1$@\"\\U2026");
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v11 = (*(uint64_t (**)(void *))(*a1 + 192))(a1);
  CFStringRef v12 = CFStringCreateWithFormat(v10, 0, v9, v11);
  sub_21DC2C888((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v12, 16, 0, 0);
  if (v12) {
    CFRelease(v12);
  }
  if (v9) {
    CFRelease(v9);
  }
  (*(void (**)(void *, int *))(*a1 + 744))(a1, v38);
  uint64_t v13 = sub_21DC0B148(v38[0]);
  if (v13)
  {
    unint64_t v14 = (char *)v13;
    BOOL v15 = (char *)sub_21DC0C840(v38);
    sub_21DC2C888((uint64_t)a1, 3, (uint64_t)a1, 2, 0, 0, 0);
    (*(void (**)(char *))(*(void *)v14 + 48))(v14);
    sub_21DC2C888((uint64_t)a1, 1, (uint64_t)a1, (uint64_t)&v37, 0, 0, 0);
    uint64_t v36 = 0;
    uint64_t v16 = (*(uint64_t (**)(void *))(*a1 + 272))(a1);
    if (v16)
    {
      uint64_t v17 = v16;
    }
    else
    {
      unsigned int v22 = malloc_type_malloc(0x100000uLL, 0xAA107E25uLL);
      if (v22)
      {
        size_t v23 = v22;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        float v26 = a5 - a4;
        uint64_t v27 = a1[33];
        float v28 = a4;
        uint64_t v29 = v27;
        while (1)
        {
          if (!v29)
          {
            unsigned int v32 = 0;
            goto LABEL_31;
          }
          uint64_t v30 = v29 >= 0x100000 ? 0x100000 : v29;
          unsigned int v31 = (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t *, void *))(*a1 + 328))(a1, v24, v30, &v36, v23);
          if (v31) {
            break;
          }
          (*(void (**)(char *, void *, uint64_t))(*(void *)v14 + 56))(v14, v23, v30);
          v25 += v30;
          float v37 = a4 + (float)((float)(v25 / v27) * v26);
          if ((float)(v37 - v28) >= 1.0)
          {
            sub_21DC2C888((uint64_t)a1, 1, (uint64_t)a1, (uint64_t)&v37, 0, 0, 0);
            float v28 = v37;
          }
          v24 += v30;
          v29 -= v30;
          if (sub_21DC2C888((uint64_t)a1, 2, (uint64_t)a1, 0, 0, 0, 0))
          {
            unsigned int v32 = 111;
            goto LABEL_31;
          }
        }
        unsigned int v32 = v31;
LABEL_31:
        free(v23);
        (*(void (**)(char *))(*(void *)v14 + 72))(v14);
        CFStringRef v33 = sub_21DC0EBB8((uint64_t)a1, (uint64_t)v15, (uint64_t)v14);
        if (v33)
        {
          CFStringRef v34 = v33;
          sub_21DC2C888((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v33, 16, 0, 0);
          CFRelease(v34);
        }
        if ((*(unsigned int (**)(char *, char *))(*(void *)v15 + 152))(v15, v14)) {
          uint64_t v17 = v32;
        }
        else {
          uint64_t v17 = 116;
        }
      }
      else
      {
        uint64_t v17 = 12;
      }
      (*(void (**)(void *, void))(*a1 + 280))(a1, 0);
    }
    DIDiskImageObjectRelease(v14);
    if (v15) {
      DIDiskImageObjectRelease(v15);
    }
  }
  else
  {
    int v18 = DIGetBundleRef();
    CFStringRef v19 = (const __CFString *)sub_21DC3A890(v18, (int)@"Unknown checksum type %1$ld.", @"Unknown checksum type %1$ld.");
    uint64_t v20 = (*(uint64_t (**)(void *))(*a1 + 192))(a1);
    CFStringRef v21 = CFStringCreateWithFormat(v10, 0, v19, v20);
    sub_21DC2C888((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v21, 16, 0, 0);
    if (v21) {
      CFRelease(v21);
    }
    if (v19) {
      CFRelease(v19);
    }
    return 0;
  }
  return v17;
}

uint64_t sub_21DC36A9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 320))(a1, a2, 1);
}

uint64_t sub_21DC36ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0;
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 592))(a1) & 1) != 0
    || ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 616))(a1) & 1) != 0)
  {
    return 16;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 48))(a2);
  if (!v6)
  {
    if (DIUDIFFileAccessGetResourceFile_0(a3, &v13))
    {
      uint64_t v6 = 999;
    }
    else
    {
      uint64_t v6 = (*(uint64_t (**)(char *, void, void))(*(void *)v13 + 288))(v13, 0, 0);
      if (!v6)
      {
        uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, void, void))(*(void *)v13 + 304))(v13, a2, 0, 0);
        if (!v6)
        {
          uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)v13 + 200))(v13);
          if (!v6)
          {
            uint64_t v6 = DIUDIFFileAccessWriteResourceFile_0(a3);
            if (!v6)
            {
              int v8 = (const void *)sub_21DC1300C(a3);
              memcpy((void *)(a1 + 232), v8, 0x200uLL);
              int v9 = *(_DWORD *)(a1 + 244);
              *(unsigned char *)(a1 + 778) = v9 & 1;
              if (v9)
              {
                uint64_t v11 = *(void *)(a1 + 272);
                uint64_t v10 = *(void *)(a1 + 280);
                *(void *)(a1 + 768) = v10;
                *(void *)(a1 + 760) = v11;
                sub_21DC0714C(a1, v10);
                uint64_t v12 = *(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496))(a1);
                (*(void (**)(void))(v12 + 392))();
              }
              uint64_t v6 = 0;
            }
          }
        }
      }
    }
    (*(void (**)(uint64_t))(*(void *)a2 + 56))(a2);
  }
  return v6;
}

uint64_t sub_21DC36D6C(uint64_t a1, uint64_t a2)
{
  __int16 v11 = 0;
  uint64_t v10 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)a1 + 96))(a1, a2, &v11);
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v11 == 0;
  }
  if (!v5)
  {
    if (v11 < 1)
    {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
    }
    else
    {
      LOWORD(v6) = 1;
      while (1)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
        (*(void (**)(uint64_t, void))(*(void *)a1 + 80))(a1, 0);
        uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, void, void **))(*(void *)a1 + 112))(a1, a2, (__int16)v6, &v10);
        (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v7);
        if (v4) {
          break;
        }
        uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 192))(a1, v10);
        if (v8) {
          return v8;
        }
        sub_21DC3A944((void **)v10);
        int v6 = (__int16)(v6 + 1);
        if (v6 > v11) {
          return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
        }
      }
    }
  }
  return v4;
}

uint64_t sub_21DC36F34(uint64_t a1, unsigned int (*a2)(uint64_t, void, void), uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int v14 = 0;
  int v15 = 0;
  uint64_t v13 = 0;
  __int16 v12 = 0;
  memset(v16, 0, sizeof(v16));
  uint64_t v6 = (*(uint64_t (**)(uint64_t, char *))(*(void *)a1 + 64))(a1, (char *)&v15 + 2);
  if (!v6)
  {
    if (SHIWORD(v15) < 1) {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
    }
    LOWORD(v7) = 1;
    while (1)
    {
      uint64_t v8 = (*(uint64_t (**)(uint64_t, unsigned int *, void))(*(void *)a1 + 72))(a1, &v14, (__int16)v7);
      if (v8) {
        return v8;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, void, int *))(*(void *)a1 + 96))(a1, v14, &v15);
      if (v8) {
        return v8;
      }
      if ((__int16)v15 >= 1)
      {
        LOWORD(v9) = 1;
        do
        {
          uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
          (*(void (**)(uint64_t, void))(*(void *)a1 + 80))(a1, 0);
          uint64_t v6 = (*(uint64_t (**)(uint64_t, void, void, void **))(*(void *)a1 + 112))(a1, v14, (__int16)v9, &v13);
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80))(a1, v10);
          if (v6) {
            return v6;
          }
          uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, __int16 *, unsigned int *, _OWORD *))(*(void *)a1 + 208))(a1, v13, &v12, &v14, v16);
          if (v8) {
            return v8;
          }
          if (!a2 || a2(a3, v14, v12))
          {
            uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 192))(a1, v13);
            if (v8) {
              return v8;
            }
            sub_21DC3A944((void **)v13);
            uint64_t v13 = 0;
          }
          int v9 = (__int16)(v9 + 1);
        }
        while (v9 <= (__int16)v15);
      }
      int v7 = (__int16)(v7 + 1);
      if (v7 > SHIWORD(v15)) {
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
      }
    }
  }
  return v6;
}

const char *sub_21DC37240()
{
  return "CResourceFile";
}

uint64_t sub_21DC37250(uint64_t a1, unsigned char *a2, uint64_t a3, int a4)
{
  unsigned int v14 = 0;
  if (!a2) {
    return 4294967246;
  }
  uint64_t v13 = 0;
  *a2 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **))(*(void *)a1 + 120))(a1, 1398034979, a3, &v14);
  if (!result)
  {
    if (!v14) {
      return 4294967104;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t *))(*(void *)a1 + 160))(a1, v14, &v13);
    if (!result)
    {
      if (a4 >= 1 && *(__int16 *)*v14 >= a4)
      {
        uint64_t v8 = (unsigned __int8 *)(*v14 + 2);
        if (a4 < 2)
        {
          uint64_t v9 = 0;
        }
        else
        {
          uint64_t v9 = 0;
          LOWORD(v10) = 1;
          do
          {
            uint64_t v11 = *v8 + 1;
            v8 += v11;
            v9 += v11;
            int v10 = (__int16)(v10 + 1);
          }
          while (v10 < a4);
        }
        uint64_t v12 = *v8;
        if (v9 + v12 >= v13) {
          return 4294967106;
        }
        memmove(a2, v8, v12 + 1);
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_21DC37398(uint64_t a1, unsigned int a2, const unsigned __int8 *a3, void *a4)
{
  int v10 = 0;
  if (a3 && a4)
  {
    uint64_t v6 = *(void **)(a1 + 104);
    if (v6)
    {
      CFDictionaryRef v8 = sub_21DC37430(a1, a2, a3);
      if (v8)
      {
        uint64_t result = sub_21DC09AB8(a1, a2, v8, &v10);
        uint64_t v6 = v10;
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t result = 4294967104;
      }
    }
    else
    {
      uint64_t result = 4294967097;
    }
    goto LABEL_6;
  }
  uint64_t result = 4294967246;
  if (a4)
  {
    uint64_t v6 = 0;
LABEL_6:
    *a4 = v6;
  }
  return result;
}

CFDictionaryRef sub_21DC37430(uint64_t a1, unsigned int a2, const unsigned __int8 *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 0;
  }
  CFArrayRef v4 = (const __CFArray *)sub_21DC098D8(a1, a2);
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  CFStringRef v7 = CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  if (Count < 1)
  {
LABEL_11:
    CFDictionaryRef v11 = 0;
  }
  else
  {
    CFIndex v9 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9);
      if (ValueAtIndex)
      {
        CFDictionaryRef v11 = ValueAtIndex;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Name");
        if (Value)
        {
          CFStringRef v13 = Value;
          CFTypeID v14 = CFGetTypeID(Value);
          if (v14 == CFStringGetTypeID() && CFEqual(v13, v8)) {
            break;
          }
        }
      }
      if (Count == ++v9) {
        goto LABEL_11;
      }
    }
  }
  CFRelease(v8);
  return v11;
}

uint64_t sub_21DC37528(uint64_t a1, uint64_t a2)
{
  return sub_21DC3A898();
}

uint64_t sub_21DC37548(uint64_t a1, uint64_t a2)
{
  return sub_21DC3A898();
}

uint64_t sub_21DC37568(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result = 4294967246;
  if (a2)
  {
    if (a3)
    {
      *a3 = sub_21DC3A9E4(a2);
      return sub_21DC3A898();
    }
  }
  return result;
}

uint64_t sub_21DC375A8(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246;
  }
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 104);
  if (!v3) {
    return 4294967246;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  size_t Count = CFDictionaryGetCount(v3);
  if (!Count) {
    return 0;
  }
  int64_t v6 = Count;
  CFStringRef v7 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v7) {
    return 4294967188;
  }
  CFStringRef v8 = v7;
  CFIndex v9 = (const void **)malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
  if (v9)
  {
    int v10 = v9;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v8, v9);
    if (v6 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      while (1)
      {
        sub_21DC0A050((const __CFString *)v8[v11]);
        CFArrayRef v12 = (const __CFArray *)v10[v11];
        CFIndex v13 = CFArrayGetCount(v12);
        if (v13 >= 1) {
          break;
        }
LABEL_14:
        if (++v11 >= v6)
        {
          uint64_t v17 = 4294967104;
          goto LABEL_30;
        }
      }
      CFIndex v14 = v13;
      CFIndex v15 = 0;
      while (1)
      {
        uint64_t v20 = 0;
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v15);
        if (sub_21DC09CB8((int)ValueAtIndex, ValueAtIndex, &v20))
        {
          if (v20 == a2) {
            break;
          }
        }
        if (v14 == ++v15) {
          goto LABEL_14;
        }
      }
      __int16 v19 = 0;
      if (sub_21DC09280(ValueAtIndex, @"Attributes", &v19))
      {
        if ((v19 & 8) != 0)
        {
          uint64_t v17 = 4294967100;
        }
        else
        {
          CFArrayRemoveValueAtIndex(v12, v15);
          if (v14 == 1) {
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), v8[v11]);
          }
          uint64_t v17 = 0;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }
      }
      else
      {
        uint64_t v17 = 4294967097;
      }
    }
LABEL_30:
    free(v10);
  }
  else
  {
    uint64_t v17 = 4294967188;
  }
  free(v8);
  return v17;
}

uint64_t sub_21DC37790(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967246;
  }
  if (!*(unsigned char *)(a1 + 114)) {
    return 4294967242;
  }
  uint64_t result = (uint64_t)sub_21DC09934(a2);
  if (result)
  {
    CFArrayRef v4 = (const void *)result;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), (const void *)result);
    *(_WORD *)(a1 + 112) |= 0x20u;
    CFRelease(v4);
    return 0;
  }
  return result;
}

uint64_t sub_21DC37804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 320))(a1, a2, a3, a4, a5, &v6);
}

uint64_t sub_21DC37854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 328))(a1, a2, a3, a4, 0);
}

uint64_t sub_21DC37884(uint64_t a1, _WORD *a2)
{
  if (a2) {
    *a2 = *(_WORD *)(a1 + 112);
  }
  return 0;
}

uint64_t sub_21DC37898(uint64_t a1, __int16 a2)
{
  *(_WORD *)(a1 + 112) = a2;
  return 0;
}

CFArrayRef sub_21DC378A4(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (!a3) {
    return (const __CFArray *)4294967246;
  }
  *a3 = 0;
  if (!*(void *)(a1 + 104)) {
    return 0;
  }
  CFArrayRef result = (const __CFArray *)sub_21DC098D8(a1, a2);
  if (result)
  {
    CFArrayRef v5 = result;
    CFIndex Count = CFArrayGetCount(result);
    while (1)
    {
      __int16 v7 = random();
      if (Count < 1) {
        break;
      }
      CFIndex v8 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        if (ValueAtIndex)
        {
          __int16 v10 = 0;
          if (sub_21DC09280(ValueAtIndex, @"ID", &v10))
          {
            if (v10 == v7) {
              break;
            }
          }
        }
        if (Count == ++v8) {
          goto LABEL_11;
        }
      }
    }
LABEL_11:
    CFArrayRef result = 0;
    *a3 = v7;
  }
  return result;
}

uint64_t sub_21DC37974()
{
  return 4294967246;
}

const char *sub_21DC3797C()
{
  return "CXMLResourceFile";
}

void sub_21DC37988(FILE *a1, const __CFString *a2, CFStringEncoding a3)
{
  fflush(a1);
  if (a2)
  {
    CFIndex Length = CFStringGetLength(a2);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, a3);
    CFIndex v8 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0xC448D259uLL);
    if (v8)
    {
      CFIndex v9 = v8;
      CFIndex usedBufLen = 0;
      v12.CFIndex length = CFStringGetLength(a2);
      v12.location = 0;
      CFStringGetBytes(a2, v12, a3, 0, 0, v9, MaximumSizeForEncoding, &usedBufLen);
      int v10 = fileno(a1);
      write(v10, v9, usedBufLen);
      fflush(a1);
      free(v9);
    }
  }
}

void sub_21DC37A54(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFDictionaryReplaceValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

uint64_t sub_21DC37AC8(char *a1, ...)
{
  va_start(va, a1);
  return vfprintf((FILE *)*MEMORY[0x263EF8348], a1, va);
}

size_t sub_21DC37B08(uint64_t a1)
{
  long long v2 = (FILE **)MEMORY[0x263EF8348];
  size_t result = fwrite("## ? ...score.. ...age... ...use... ...start ... ...length...\n", 0x3EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  int v4 = *(_DWORD *)(a1 + 208);
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = *(void *)(a1 + 216);
      uint64_t v7 = *(void *)(v6 + 8 * i);
      if (v7)
      {
        CFIndex v8 = *v2;
        if (*(unsigned char *)(v7 + 24)) {
          CFIndex v9 = "+";
        }
        else {
          CFIndex v9 = " ";
        }
        uint64_t v10 = sub_21DC10E30(*(void *)(v6 + 8 * i));
        size_t result = fprintf(v8, "%2d %1.1s %+9qd %9qd %9qd %12qd %12qd\n", i, v9, v10, *(void *)(v7 + 16), *(void *)(v7 + 8), *(void *)(v7 + 32), *(void *)(v7 + 40));
        int v4 = *(_DWORD *)(a1 + 208);
      }
    }
  }
  return result;
}

void *sub_21DC37BF0(void *a1)
{
  *a1 = &unk_26CE86EB8;
  long long v2 = (void *)a1[7];
  if (v2) {
    free(v2);
  }
  return a1;
}

__CFString *DICopyStrError(int *a1)
{
  return sub_21DC20744(a1, 0);
}

uint64_t sub_21DC37C44(uint64_t result, unsigned int a2)
{
  *(int8x8_t *)size_t result = vrev32_s8(*(int8x8_t *)result);
  *(_DWORD *)(result + 8) = bswap32(*(_DWORD *)(result + 8));
  *(void *)(result + 12) = bswap64(*(void *)(result + 12));
  if (a2)
  {
    uint64_t v2 = a2;
    CFDictionaryRef v3 = (unsigned int *)(result + 56);
    do
    {
      *CFDictionaryRef v3 = bswap32(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return result;
}

const char *sub_21DC37C90()
{
  return "CDIApplePartitionScheme";
}

const char *sub_21DC37CA0()
{
  return "CDIFDiskPartitionScheme";
}

uint64_t sub_21DC37CB0()
{
  return 1;
}

const char *sub_21DC37CB8()
{
  return "CDINoPartitionScheme";
}

void sub_21DC37CCC(const __CFArray *a1, CFArrayRef theArray, unint64_t a3, char a4)
{
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  CFArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theArray);
  sub_21DC37F34(a1, 1);
  sub_21DC37F34(MutableCopy, 1);
  v35.CFIndex length = CFArrayGetCount(a1);
  v35.location = 0;
  CFArraySortValues(a1, v35, (CFComparatorFunction)sub_21DC18DEC, 0);
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  CFIndex Count = CFArrayGetCount(MutableCopy);
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    for (CFIndex i = 0; i != v8; ++i)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, i);
      if (ValueAtIndex)
      {
        CFDictionaryRef v11 = ValueAtIndex;
        CFTypeID v12 = CFGetTypeID(ValueAtIndex);
        if (v12 == CFDictionaryGetTypeID())
        {
          if (sub_21DC18ED4(v11, &v32, &v31, 0, (uint64_t *)&v30, (uint64_t *)&v29))
          {
            uint64_t v14 = v31;
            unint64_t v13 = v32;
            CFIndex v15 = sub_21DC190F4(a1, a3, 0);
            CFIndex v16 = CFArrayGetCount(v15);
            if (v16 >= 1)
            {
              unint64_t v17 = v13 + v14 - 1;
              unint64_t v18 = v16 + 1;
              do
              {
                CFDictionaryRef v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v18 - 2);
                if (v19)
                {
                  CFDictionaryRef v20 = v19;
                  CFTypeID v21 = CFGetTypeID(v19);
                  if (v21 == CFDictionaryGetTypeID())
                  {
                    if (sub_21DC18ED4(v20, &v34, &v33, 0, 0, 0))
                    {
                      if (v34 <= v17)
                      {
                        unint64_t v24 = v34 + v33 - 1;
                        if (v24 >= v32)
                        {
                          if (v34 <= v32) {
                            uint64_t v25 = v32;
                          }
                          else {
                            uint64_t v25 = v34;
                          }
                          if (v24 >= v17) {
                            uint64_t v26 = v17;
                          }
                          else {
                            uint64_t v26 = v34 + v33 - 1;
                          }
                          uint64_t v27 = sub_21DC17DC8(v25, v26 - v25 + 1, 0, v30, v29, 0, v22, v23, 0);
                          CFArrayAppendValue(a1, v27);
                          CFRelease(v27);
                        }
                      }
                    }
                  }
                }
                --v18;
              }
              while (v18 > 1);
            }
            CFRelease(v15);
          }
        }
      }
    }
  }
  if ((a4 & 2) != 0)
  {
    sub_21DC19064(a1, a3, (a4 & 0x10) != 0);
  }
  else
  {
    v36.CFIndex length = CFArrayGetCount(a1);
    v36.location = 0;
    CFArraySortValues(a1, v36, (CFComparatorFunction)sub_21DC18DEC, 0);
  }
  CFRelease(MutableCopy);
}

void sub_21DC37F34(const __CFArray *a1, int a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFStringRef theString1 = 0;
    int v9 = 0;
    unint64_t v5 = Count + 1;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5 - 2);
      if (ValueAtIndex)
      {
        CFDictionaryRef v7 = ValueAtIndex;
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID()
          && sub_21DC18ED4(v7, 0, 0, &v9, (uint64_t *)&theString1, 0)
          && CFStringCompare(theString1, @"Apple_Free", 1uLL) == kCFCompareEqualTo
          && (!a2 || !v9))
        {
          CFArrayRemoveValueAtIndex(a1, v5 - 2);
        }
      }
      --v5;
    }
    while (v5 > 1);
  }
}

__CFDictionary *sub_21DC3801C(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, __CFString **a7)
{
  uint64_t v28 = a2;
  uint64_t valuePtr = a1;
  int v27 = a3;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return Mutable;
  }
  CFNumberRef v13 = CFNumberCreate(v11, kCFNumberLongLongType, &valuePtr);
  if (!v13) {
    goto LABEL_8;
  }
  CFNumberRef v14 = v13;
  CFDictionarySetValue(Mutable, @"partition-start", v13);
  CFRelease(v14);
  CFNumberRef v15 = CFNumberCreate(v11, kCFNumberLongLongType, &v28);
  if (!v15) {
    goto LABEL_8;
  }
  CFNumberRef v16 = v15;
  CFDictionarySetValue(Mutable, @"partition-length", v15);
  CFRelease(v16);
  if (!a3)
  {
    CFDictionarySetValue(Mutable, @"partition-synthesized", (const void *)*MEMORY[0x263EFFB40]);
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFNumberRef v17 = CFNumberCreate(v11, kCFNumberSInt32Type, &v27);
  if (!v17)
  {
LABEL_8:
    CFRelease(Mutable);
    return 0;
  }
  CFNumberRef v18 = v17;
  CFDictionarySetValue(Mutable, @"partition-number", v17);
  CFRelease(v18);
  if (a4) {
LABEL_10:
  }
    CFDictionarySetValue(Mutable, @"partition-hint", a4);
LABEL_11:
  if (a5) {
    CFDictionarySetValue(Mutable, @"partition-name", a5);
  }
  if (!a6) {
    goto LABEL_16;
  }
  CFDictionaryRef v19 = @"partition-data";
  CFDictionaryRef v20 = Mutable;
  CFTypeID v21 = a6;
  while (1)
  {
    CFDictionarySetValue(v20, v19, v21);
LABEL_16:
    uint64_t v22 = a7;
    uint64_t v26 = (const void **)(a7 + 1);
    CFDictionaryRef v19 = *v22;
    if (!*v22) {
      break;
    }
    uint64_t v23 = v26;
    a7 = (__CFString **)(v26 + 1);
    CFTypeID v21 = *v23;
    CFDictionaryRef v20 = Mutable;
  }
  return Mutable;
}

const char *sub_21DC381F0()
{
  return "CDIPartitionScheme";
}

uint64_t sub_21DC381FC(uint64_t a1)
{
  sub_21DC03C98(a1);
  *(void *)uint64_t v2 = &unk_26CE870F0;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  sub_21DC04008(v2, @"thread-safe", (const void *)*MEMORY[0x263EFFB40]);
  return a1;
}

void sub_21DC38274(_Unwind_Exception *a1)
{
  sub_21DC04D5C(v1);
  _Unwind_Resume(a1);
}

void *sub_21DC3828C(uint64_t a1)
{
  *(void *)a1 = &unk_26CE870F0;
  sub_21DC387F8((void *)a1, 1);
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  return sub_21DC04D5C(a1);
}

void sub_21DC38300(_Unwind_Exception *a1)
{
  sub_21DC04D5C(v1);
  _Unwind_Resume(a1);
}

void sub_21DC3831C(uint64_t a1)
{
  sub_21DC3828C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC38364(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406D51CF38);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC38388(uint64_t a1, CFDictionaryRef theDict, void *a3, void *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (a1 && theDict && a3)
  {
    CFStringRef Value = CFDictionaryGetValue(theDict, @"VectoredBackingStoreCallbackData");
    if (Value)
    {
      unint64_t v5 = Value;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v5)) {
        operator new();
      }
    }
  }
  else if (a3)
  {
    *a3 = 0;
  }
  return 22;
}

void sub_21DC384D8(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10E1C406D51CF38);
  _Unwind_Resume(a1);
}

__n128 sub_21DC384FC(uint64_t a1, CFDataRef theData)
{
  *(void *)buffer = 0;
  if (theData && CFDataGetLength(theData) == 8)
  {
    v8.location = 0;
    v8.CFIndex length = 8;
    CFDataGetBytes(theData, v8, buffer);
    uint64_t v5 = *(void *)buffer;
    if (!**(_DWORD **)buffer)
    {
      long long v6 = *(_OWORD *)(*(void *)buffer + 8);
      *(void *)(a1 + 272) = v6;
      *(_OWORD *)(a1 + 208) = v6;
      *(_OWORD *)(a1 + 224) = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(a1 + 240) = *(_OWORD *)(v5 + 40);
      __n128 result = *(__n128 *)(v5 + 56);
      *(__n128 *)(a1 + 256) = result;
    }
  }
  return result;
}

uint64_t sub_21DC38590(void *a1, const __CFURL *a2)
{
  sub_21DC04178(a1, a2);
  CFDictionaryRef v3 = *(uint64_t (**)(void *))(*a1 + 688);
  return v3(a1);
}

uint64_t sub_21DC385F0(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v3 = getpid();
  CFStringRef v4 = CFStringCreateWithFormat(v2, 0, @"%d:%p", v3, a1);
  if (!v4) {
    return 999;
  }
  CFStringRef v5 = v4;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 552))(a1, v4);
  CFRelease(v5);
  return 0;
}

uint64_t sub_21DC38690(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 568))(a1))
  {
    if (a2)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88))(a1) == a2) {
        return 0;
      }
      else {
        return 13;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 216))(a1, *(void *)(a1 + 272), a2);
    if (!result)
    {
      return sub_21DC05448(a1, a2);
    }
  }
  return result;
}

uint64_t sub_21DC38760(uint64_t a1)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 568))(a1) & 1) != 0
    || (uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 224))(a1, *(void *)(a1 + 272)), !result))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 576))(a1);
    return 0;
  }
  return result;
}

uint64_t sub_21DC387F8(void *a1, uint64_t a2)
{
  (*(void (**)(void *))(*a1 + 584))(a1);
  if ((*(uint64_t (**)(void *))(*a1 + 568))(a1)) {
    return 0;
  }
  CFStringRef v5 = (uint64_t (*)(void *, uint64_t, uint64_t))a1[32];
  uint64_t v6 = a1[34];
  return v5(a1, v6, a2);
}

uint64_t sub_21DC388B8(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22;
  }
  *a2 = 0;
  return (*(uint64_t (**)(uint64_t, void, void *))(a1 + 264))(a1, *(void *)(a1 + 272), a2);
}

uint64_t sub_21DC388D4(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (!(*(unsigned int (**)(void *))(*a1 + 568))(a1)) {
    return 9;
  }
  uint64_t result = 22;
  if (a4 && a5)
  {
    CFAllocatorRef v11 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, void *, uint64_t))a1[29];
    uint64_t v12 = a1[34];
    return v11(a1, v12, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_21DC389A0(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (!(*(unsigned int (**)(void *))(*a1 + 568))(a1)) {
    return 9;
  }
  uint64_t result = 22;
  if (a4 && a5)
  {
    if ((*(unsigned int (**)(void *))(*a1 + 72))(a1))
    {
      CFAllocatorRef v11 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, void *, uint64_t))a1[30];
      uint64_t v12 = a1[34];
      return v11(a1, v12, a2, a3, a4, a5);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_21DC38AA0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 248))(a1, *(void *)(a1 + 272), a2);
}

const char *sub_21DC38AB0()
{
  return "CVectoredBackingStore";
}

uint64_t sub_21DC38ABC()
{
  return 1;
}

void *sub_21DC38AC4(void *a1)
{
  sub_21DC27DD4((uint64_t)a1);
  *CFAllocatorRef v2 = &unk_26CE873D8;
  v2[16] = 32;
  a1[15] = malloc_type_calloc(1uLL, 0x20uLL, 0x4F440149uLL);
  a1[14] = malloc_type_malloc(0x68uLL, 0x1000040ED882C02uLL);
  a1[17] = MEMORY[0x263EF8068];
  a1[18] = MEMORY[0x263EF8070];
  a1[19] = MEMORY[0x263EF8060];
  return a1;
}

void sub_21DC38B74(_Unwind_Exception *a1)
{
  sub_21DC27F8C(v1);
  _Unwind_Resume(a1);
}

void sub_21DC38B94(void *a1)
{
  sub_21DC27F8C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC38BDC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21DC38C00()
{
  return "CSHA256Checksum";
}

uint64_t sub_21DC38C0C()
{
  return 7;
}

__CFString *sub_21DC38C14()
{
  return @"SHA256";
}

__CFString *sub_21DC38C20()
{
  return @"SHA-256";
}

void *sub_21DC38C2C(void *a1)
{
  sub_21DC27DD4((uint64_t)a1);
  *CFAllocatorRef v2 = &unk_26CE874A8;
  v2[16] = 48;
  a1[15] = malloc_type_calloc(1uLL, 0x30uLL, 0xD3DCB291uLL);
  a1[14] = malloc_type_malloc(0xD0uLL, 0x10000400F93440CuLL);
  a1[17] = MEMORY[0x263EF8080];
  a1[18] = MEMORY[0x263EF8088];
  a1[19] = MEMORY[0x263EF8078];
  return a1;
}

void sub_21DC38CDC(_Unwind_Exception *a1)
{
  sub_21DC27F8C(v1);
  _Unwind_Resume(a1);
}

void sub_21DC38CFC(void *a1)
{
  sub_21DC27F8C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC38D44(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21DC38D68()
{
  return "CSHA384Checksum";
}

uint64_t sub_21DC38D74()
{
  return 8;
}

__CFString *sub_21DC38D7C()
{
  return @"SHA384";
}

__CFString *sub_21DC38D88()
{
  return @"SHA-384";
}

void *sub_21DC38D94(void *a1)
{
  sub_21DC27DD4((uint64_t)a1);
  *CFAllocatorRef v2 = &unk_26CE87578;
  v2[16] = 64;
  a1[15] = malloc_type_calloc(1uLL, 0x40uLL, 0xEC171A1AuLL);
  a1[14] = malloc_type_malloc(0xD0uLL, 0x10000400F93440CuLL);
  a1[17] = MEMORY[0x263EF80A0];
  a1[18] = MEMORY[0x263EF80A8];
  a1[19] = MEMORY[0x263EF8098];
  return a1;
}

void sub_21DC38E44(_Unwind_Exception *a1)
{
  sub_21DC27F8C(v1);
  _Unwind_Resume(a1);
}

void sub_21DC38E64(void *a1)
{
  sub_21DC27F8C(a1);
  JUMPOUT(0x223C15E40);
}

void sub_21DC38EAC(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21DC38ED0()
{
  return "CSHA512Checksum";
}

uint64_t sub_21DC38EDC()
{
  return 9;
}

__CFString *sub_21DC38EE4()
{
  return @"SHA512";
}

__CFString *sub_21DC38EF0()
{
  return @"SHA-512";
}

uint64_t sub_21DC38EFC(uint64_t a1, unsigned int a2, int a3, unint64_t a4, void *a5, void ****a6, int *a7, __CFArray **a8, char a9)
{
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  uint64_t v100 = a7;
  if (!a1)
  {
    CFNumberRef v18 = 0;
    int v24 = 0;
    uint64_t v25 = 0;
    uint64_t v20 = 22;
    goto LABEL_29;
  }
  unsigned int v98 = a2;
  value[0] = 0;
  uint64_t v97 = a1;
  CFNumberRef v18 = (const void *)sub_21DC16C04();
  CFTypeID v19 = CFGetTypeID(v18);
  if (v19 == CFDictionaryGetTypeID())
  {
    uint64_t v20 = 999;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v18, @"partitions", (const void **)value))
    {
      CFTypeID v21 = CFGetTypeID(value[0]);
      CFTypeID TypeID = CFArrayGetTypeID();
      BOOL v23 = v21 != TypeID;
      if (v21 == TypeID) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = 999;
      }
      if (!v18) {
        goto LABEL_22;
      }
LABEL_20:
      if (v23)
      {
        CFRelease(v18);
        CFNumberRef v18 = 0;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v20 = 999;
  }
  BOOL v23 = 1;
  if (v18) {
    goto LABEL_20;
  }
LABEL_22:
  if (v20)
  {
LABEL_23:
    uint64_t v25 = 0;
    goto LABEL_24;
  }
  CFArrayRef theArray = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v18, @"partitions");
  CFStringRef v28 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v18, @"partition-scheme");
  if (v28) {
    BOOL v29 = CFEqual(v28, @"Apple");
  }
  else {
    BOOL v29 = 0;
  }
  int Count = CFArrayGetCount(theArray);
  if (v98 == 5)
  {
    value[0] = &stru_26CE87FA8;
    int v31 = CFArrayGetCount(theArray);
    sub_21DC1AD04(theArray, v31 - 1, 0, 0, value, 0);
    if (value[0]) {
      v31 -= CFEqual((CFStringRef)value[0], @"Apple_Free");
    }
    unsigned int v98 = 2;
  }
  else
  {
    int v31 = Count;
  }
  uint64_t v95 = (void ***)malloc_type_calloc(v31, 8uLL, 0x80040B8603338uLL);
  if (!v95)
  {
    uint64_t v25 = 0;
    int v24 = 0;
    char v26 = 0;
    uint64_t v20 = 12;
    goto LABEL_25;
  }
  v104 = 0;
  uint64_t v106 = 0;
  int v90 = v31;
  if (v31 < 1)
  {
LABEL_208:
    uint64_t v20 = 0;
LABEL_209:
    if (!a6) {
      goto LABEL_216;
    }
LABEL_214:
    if (v20) {
      goto LABEL_216;
    }
    uint64_t v25 = v95;
    int v24 = v90;
LABEL_217:
    char v26 = 1;
    if (!a5) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  int v89 = a3;
  CFIndex v32 = 0;
  uint64_t v94 = v31;
  unint64_t v105 = 0;
  int v33 = -2;
  if (v31 != 1) {
    int v33 = 0;
  }
  CFStringRef v103 = 0;
  BOOL v87 = a9 != 0;
  int v101 = 0;
  uint64_t v102 = 0;
  int v34 = -1;
  if (!v29) {
    int v34 = v33;
  }
  unint64_t v92 = a4;
  int v93 = v34;
  CFStringEncoding v88 = (void *)*MEMORY[0x263EFFB40];
  uint64_t v91 = Mutable;
  while (1)
  {
    uint64_t v35 = sub_21DC1AD04(theArray, v32, &v106, &v105, (void **)&v103, &v102);
    if (v35)
    {
LABEL_211:
      uint64_t v20 = v35;
LABEL_212:
      sub_21DC26118(v95, v94);
      goto LABEL_23;
    }
    uint64_t v36 = sub_21DC135CC(&v101);
    if (v36) {
      break;
    }
    float v37 = v101;
    v95[v32] = (void **)v101;
    uint64_t v38 = *v37;
    *(void *)(v38 + 8) = v106;
    *(void *)(v38 + 16) = 0;
    *(_DWORD *)(v38 + 36) = v93 + v32;
    if (CFEqual(v103, @"Apple_HFS")
      || CFEqual(v103, @"Apple_HFSX"))
    {
      uint64_t v35 = sub_21DC16734(v97, v106, v105, &v104);
      if (v35) {
        goto LABEL_211;
      }
      uint64_t v40 = v104;
      uint64_t v41 = v101;
      unsigned int v108 = 0;
      int64_t valuePtr = 0;
      value[0] = 0;
      uint64_t v107 = 0;
      uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0, (uint64_t *)value);
      if (MKMediaRef)
      {
        uint64_t v20 = MKMediaRef;
        uint64_t v43 = 0;
        a4 = v92;
LABEL_121:
        if (value[0])
        {
          CFRelease(value[0]);
          value[0] = 0;
        }
        if (v43) {
          CFRelease(v43);
        }
        CFDictionaryRef Mutable = v91;
        goto LABEL_182;
      }
      unint64_t v48 = (*(uint64_t (**)(char *))(*(void *)v40 + 96))(v40);
      uint64_t v43 = 0;
      unsigned int v49 = 0;
      if (v98 <= 6)
      {
        if (((1 << v98) & 0x2C) != 0)
        {
          uint64_t v107 = v48;
          uint64_t v50 = (uint64_t)v41;
          a4 = v92;
          unsigned int v49 = sub_21DC39E08(v50, v48, v89, v92);
          uint64_t v43 = 0;
          if (!v49) {
            unint64_t v48 = 0;
          }
          goto LABEL_115;
        }
        if (((1 << v98) & 0x42) != 0)
        {
          unint64_t v54 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          CFDictionarySetValue(v54, @"Record Runs", v88);
          CFDictionarySetValue(v54, @"Record Container", v88);
          CFDictionarySetValue(v54, @"Record Markers", v88);
          uint64_t v43 = (const void *)MKCFCreateFSInfo();
          if (v54) {
            CFRelease(v54);
          }
          unsigned int v49 = v108;
          if (!v108)
          {
            if (v43)
            {
              CFNumberRef v55 = (const __CFNumber *)sub_21DC11C7C((const __CFDictionary *)v43, @"Volume block size");
              if (v55)
              {
                if (CFNumberGetValue(v55, kCFNumberSInt64Type, &valuePtr))
                {
                  valuePtr >>= 9;
                  CFArrayRef v56 = (const __CFArray *)sub_21DC16650((const __CFDictionary *)v43, @"Data Runs");
                  if (v56)
                  {
                    unsigned int v49 = sub_21DC39FE8(v41, v56, v48, v89, v92, v87, (unint64_t *)&v107);
                    if (v49)
                    {
                      a4 = v92;
                    }
                    else
                    {
                      v48 -= v107;
                      uint64_t v107 = v48;
                      unsigned int v49 = sub_21DC39E08((uint64_t)v41, v48, 2, v92);
                      a4 = v92;
                      if (!v49) {
                        v48 -= v107;
                      }
                    }
                    goto LABEL_115;
                  }
                }
              }
            }
            unsigned int v49 = 999;
          }
        }
      }
      a4 = v92;
LABEL_115:
      if (v48) {
        BOOL v65 = v49 == 0;
      }
      else {
        BOOL v65 = 0;
      }
      if (v65) {
        uint64_t v20 = 115;
      }
      else {
        uint64_t v20 = v49;
      }
      goto LABEL_121;
    }
    if (CFEqual(v103, @"Apple_APFS"))
    {
      uint64_t v35 = sub_21DC16734(v97, v106, v105, &v104);
      if (v35) {
        goto LABEL_211;
      }
      CFStringRef v51 = v104;
      int v52 = v101;
      unsigned int v108 = 0;
      int64_t valuePtr = 0;
      value[0] = 0;
      uint64_t v107 = 0;
      uint64_t v53 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0, (uint64_t *)value);
      if (v53)
      {
        uint64_t v20 = v53;
        CFDictionaryRef v47 = 0;
        CFDictionaryRef Mutable = v91;
        goto LABEL_178;
      }
      unint64_t v61 = (*(uint64_t (**)(char *))(*(void *)v51 + 96))(v51);
      CFDictionaryRef v47 = 0;
      unsigned int v62 = 0;
      if (v98 <= 6)
      {
        if (((1 << v98) & 0x2C) != 0)
        {
          uint64_t v107 = v61;
          unsigned int v62 = sub_21DC39E08((uint64_t)v52, v61, v89, a4);
          CFDictionaryRef v47 = 0;
          if (!v62) {
            unint64_t v61 = 0;
          }
        }
        else if (((1 << v98) & 0x42) != 0)
        {
          int v66 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          CFDictionarySetValue(v66, @"Record Runs", v88);
          CFDictionarySetValue(v66, @"Record Container", v88);
          CFDictionarySetValue(v66, @"Record Markers", v88);
          CFDictionaryRef v86 = (const __CFDictionary *)MKCFCreateFSInfo();
          if (v66) {
            CFRelease(v66);
          }
          unsigned int v62 = v108;
          if (v108)
          {
            CFDictionaryRef Mutable = v91;
            CFDictionaryRef v47 = v86;
            goto LABEL_131;
          }
          CFDictionaryRef v47 = v86;
          if (v86
            && (CFNumberRef v70 = (const __CFNumber *)sub_21DC11C7C(v86, @"Volume block size")) != 0
            && CFNumberGetValue(v70, kCFNumberSInt64Type, &valuePtr)
            && (valuePtr >>= 9, (CFArrayRef v71 = (const __CFArray *)sub_21DC16650(v86, @"Data Runs")) != 0))
          {
            unsigned int v62 = sub_21DC39FE8(v52, v71, v61, v89, a4, v87, (unint64_t *)&v107);
            if (!v62)
            {
              v61 -= v107;
              uint64_t v107 = v61;
              unsigned int v62 = sub_21DC39E08((uint64_t)v52, v61, 2, a4);
              if (!v62) {
                v61 -= v107;
              }
            }
          }
          else
          {
            unsigned int v62 = 999;
          }
        }
      }
      CFDictionaryRef Mutable = v91;
LABEL_131:
      if (v61) {
        BOOL v67 = v62 == 0;
      }
      else {
        BOOL v67 = 0;
      }
      if (v67) {
        uint64_t v20 = 115;
      }
      else {
        uint64_t v20 = v62;
      }
      goto LABEL_178;
    }
    if (CFEqual(v103, @"DOS_FAT_32")
      || CFEqual(v103, @"DOS_FAT_16")
      || CFEqual(v103, @"DOS_FAT_16_S")
      || CFEqual(v103, @"Windows_FAT_16")
      || CFEqual(v103, @"Windows_FAT_32")
      || CFEqual(v103, @"DOS_FAT_12"))
    {
      uint64_t v35 = sub_21DC16734(v97, v106, v105, &v104);
      if (v35) {
        goto LABEL_211;
      }
      uint64_t v44 = v104;
      int v45 = v101;
      value[0] = 0;
      uint64_t v46 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0, (uint64_t *)value);
      if (!v46)
      {
        uint64_t v57 = (*(uint64_t (**)(char *))(*(void *)v44 + 96))(v44);
        unint64_t v58 = v57;
        int64_t valuePtr = 0;
        if (v98 > 6) {
          goto LABEL_175;
        }
        if (((1 << v98) & 0x2C) == 0)
        {
          if (((1 << v98) & 0x42) != 0)
          {
            unint64_t v63 = v57;
            int v64 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionarySetValue(v64, @"Record On Bits", v88);
            unsigned int v108 = 0;
            CFDictionaryRef v85 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v64) {
              CFRelease(v64);
            }
            uint64_t v20 = v108;
            if (v108)
            {
              unint64_t v58 = v63;
            }
            else
            {
              unint64_t v58 = v63;
              if (v85
                && (v107 = 0, (CFNumberRef v68 = (const __CFNumber *)sub_21DC11C7C(v85, @"Volume block size")) != 0))
              {
                if (CFNumberGetValue(v68, kCFNumberSInt64Type, &v107)
                  && (v107 >>= 9, (CFArrayRef v69 = (const __CFArray *)sub_21DC16650(v85, @"Data Runs")) != 0))
                {
                  uint64_t v20 = sub_21DC39FE8(v45, v69, v63, v89, v92, 0, (unint64_t *)&valuePtr);
                  if (!v20)
                  {
                    unint64_t v58 = v63 - valuePtr;
                    int64_t valuePtr = v58;
                    uint64_t v20 = sub_21DC39E08((uint64_t)v45, v58, 2, v92);
                    if (!v20) {
                      v58 -= valuePtr;
                    }
                  }
                }
                else
                {
                  uint64_t v20 = 999;
                }
              }
              else
              {
                uint64_t v20 = 999;
              }
            }
            goto LABEL_152;
          }
LABEL_175:
          a4 = v92;
          if (v58)
          {
            CFDictionaryRef v47 = 0;
            uint64_t v20 = 115;
            goto LABEL_178;
          }
LABEL_177:
          uint64_t v20 = 0;
          CFDictionaryRef v47 = 0;
          goto LABEL_178;
        }
LABEL_101:
        uint64_t v59 = (uint64_t)v45;
        a4 = v92;
        uint64_t v60 = sub_21DC39E08(v59, v58, v89, v92);
        if (v60)
        {
          uint64_t v20 = v60;
          CFDictionaryRef v85 = 0;
LABEL_153:
          if (v58) {
            uint64_t v72 = 115;
          }
          else {
            uint64_t v72 = 0;
          }
          if (!v20) {
            uint64_t v20 = v72;
          }
          CFDictionaryRef v47 = v85;
          goto LABEL_178;
        }
        goto LABEL_177;
      }
      goto LABEL_80;
    }
    if (CFEqual(v103, @"Windows_NTFS"))
    {
      uint64_t v35 = sub_21DC16734(v97, v106, v105, &v104);
      if (v35) {
        goto LABEL_211;
      }
      double v73 = v104;
      int v45 = v101;
      value[0] = 0;
      uint64_t v46 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0, (uint64_t *)value);
      if (!v46)
      {
        uint64_t v74 = (*(uint64_t (**)(char *))(*(void *)v73 + 96))(v73);
        unint64_t v58 = v74;
        int64_t valuePtr = 0;
        if (v98 > 6) {
          goto LABEL_175;
        }
        if (((1 << v98) & 0x2C) == 0)
        {
          if (((1 << v98) & 0x42) != 0)
          {
            unint64_t v84 = v74;
            uint64_t v75 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            CFDictionarySetValue(v75, @"Record On Bits", v88);
            unsigned int v108 = 0;
            CFDictionaryRef v85 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v75) {
              CFRelease(v75);
            }
            uint64_t v20 = v108;
            if (!v108)
            {
              if (v85)
              {
                uint64_t v107 = 0;
                CFNumberRef v76 = (const __CFNumber *)sub_21DC11C7C(v85, @"Volume block size");
                if (v76
                  && CFNumberGetValue(v76, kCFNumberSInt64Type, &v107)
                  && (v107 >>= 9, (CFArrayRef v77 = (const __CFArray *)sub_21DC16650(v85, @"Data Runs")) != 0))
                {
                  uint64_t v20 = sub_21DC39FE8(v45, v77, v84, v89, v92, 0, (unint64_t *)&valuePtr);
                  if (!v20)
                  {
                    int64_t valuePtr = v84 - valuePtr;
                    unint64_t v84 = valuePtr;
                    uint64_t v20 = sub_21DC39E08((uint64_t)v45, valuePtr, 2, v92);
                    if (!v20) {
                      v84 -= valuePtr;
                    }
                  }
                }
                else
                {
                  uint64_t v20 = 999;
                }
                CFDictionaryRef Mutable = v91;
              }
              else
              {
                uint64_t v20 = 999;
              }
            }
            unint64_t v58 = v84;
LABEL_152:
            a4 = v92;
            goto LABEL_153;
          }
          goto LABEL_175;
        }
        goto LABEL_101;
      }
LABEL_80:
      uint64_t v20 = v46;
      CFDictionaryRef v47 = 0;
      a4 = v92;
LABEL_178:
      if (value[0])
      {
        CFRelease(value[0]);
        value[0] = 0;
      }
      if (v47) {
        CFRelease(v47);
      }
LABEL_182:
      if (v20) {
        goto LABEL_212;
      }
      if (v104)
      {
        DIDiskImageObjectRelease(v104);
        v104 = 0;
      }
      goto LABEL_185;
    }
    CFStringRef v39 = v103;
    if (v103
      && (CFEqual(v103, @"Apple_Free")
       || CFEqual(v39, @"Apple_Void")
       || CFEqual(v39, @"Apple_Scratch")
       || CFEqual(v39, @"Linux_Swap")
       || CFEqual(v39, @"0657FD6D-A4AB-43C4-84E5-0933C84B4F4F")))
    {
      switch(v98)
      {
        case 6u:
          goto LABEL_195;
        case 3u:
          uint64_t v81 = (uint64_t)v101;
          unint64_t v82 = v105;
          int v83 = 1;
          break;
        case 1u:
LABEL_195:
          uint64_t v81 = (uint64_t)v101;
          unint64_t v82 = v105;
          int v83 = 2;
          break;
        default:
          uint64_t v81 = (uint64_t)v101;
          unint64_t v82 = v105;
          int v83 = 0x7FFFFFFF;
          break;
      }
      uint64_t v20 = sub_21DC39E08(v81, v82, v83, a4);
      if (v20) {
        goto LABEL_209;
      }
      goto LABEL_185;
    }
    uint64_t v36 = sub_21DC39E08((uint64_t)v101, v105, v89, a4);
    if (v36) {
      break;
    }
LABEL_185:
    uint64_t v36 = sub_21DC39E08((uint64_t)v101, 0, -1, a4);
    if (v36) {
      break;
    }
    nullsub_4(v101);
    v106 += v105;
    int v78 = DIGetBundleRef();
    CFStringRef v79 = (const __CFString *)sub_21DC3A890(v78, (int)@"%1$@ (%2$@ : %3$d)", @"%1$@ (%2$@ : %3$d)");
    CFStringRef v80 = CFStringCreateWithFormat(allocator, 0, v79, v102, v103, v32);
    CFArrayAppendValue(Mutable, v80);
    if (v80) {
      CFRelease(v80);
    }
    if (v79) {
      CFRelease(v79);
    }
    if (v94 == ++v32) {
      goto LABEL_208;
    }
  }
  uint64_t v20 = v36;
  if (a6) {
    goto LABEL_214;
  }
LABEL_216:
  int v24 = v90;
  sub_21DC26118(v95, v90);
  uint64_t v25 = 0;
  if (!v20) {
    goto LABEL_217;
  }
LABEL_24:
  int v24 = 0;
  char v26 = 0;
LABEL_25:
  if (v18)
  {
    CFRelease(v18);
    CFNumberRef v18 = 0;
  }
LABEL_27:
  if (!a8 || (v26 & 1) == 0)
  {
LABEL_29:
    if (Mutable)
    {
      CFRelease(Mutable);
      CFDictionaryRef Mutable = 0;
    }
  }
  if (a6) {
    *a6 = v25;
  }
  if (v100) {
    int *v100 = v24;
  }
  if (a5) {
    *a5 = v18;
  }
  if (a8) {
    *a8 = Mutable;
  }
  return v20;
}

uint64_t sub_21DC39E08(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  if (!a1) {
    return 22;
  }
  uint64_t v5 = *(void *)a1;
  if (!*(void *)a1) {
    return 22;
  }
  int64_t v7 = a2;
  uint64_t result = 22;
  if (a3 > -2)
  {
    unint64_t v9 = 0;
    unsigned int v10 = 1;
    if (a3 > 2147483645)
    {
      if (a3 == 2147483646) {
        goto LABEL_24;
      }
    }
    else if (a3 >= 3)
    {
      if (a3 != -1) {
        return result;
      }
      goto LABEL_24;
    }
    unint64_t v9 = a2;
    if (a2) {
      goto LABEL_20;
    }
    return 0;
  }
  unint64_t v9 = a4;
  if ((a3 + 2147483644) < 5 || a3 == 0x80000000)
  {
    if (a2)
    {
      if (!a4)
      {
        unsigned int v10 = 1;
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    return 0;
  }
  if (a3 != -2147483647) {
    return result;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 20;
LABEL_20:
  if (a2 % v9) {
    unsigned int v10 = a2 / v9 + 1;
  }
  else {
    unsigned int v10 = a2 / v9;
  }
  if (!v10) {
    return 0;
  }
LABEL_24:
  unsigned int v11 = *(_DWORD *)(v5 + 200);
  uint64_t v12 = *(void *)(v5 + 16);
  nullsub_4(a1);
  uint64_t v13 = sub_21DC3A9E4(a1);
  uint64_t result = sub_21DC3A898();
  if (!result)
  {
    sub_21DC3A988(a1, v13 + 40 * v10);
    uint64_t result = sub_21DC3A898();
    if (!result)
    {
      uint64_t v14 = *(void *)a1;
      *(_DWORD *)(v14 + 200) = *(_DWORD *)(*(void *)a1 + 200) + v10;
      *(void *)(v14 + 16) += v7;
      if (a3 + 0x80000000 <= 8 && ((1 << a3) & 0x1F3) != 0 && (uint64_t)v9 > *(unsigned int *)(v14 + 32)) {
        *(_DWORD *)(v14 + 32) = v9;
      }
      uint64_t v15 = v14 + 40 * v11 + 204;
      do
      {
        uint64_t result = 0;
        if ((uint64_t)v9 >= v7) {
          unint64_t v16 = v7;
        }
        else {
          unint64_t v16 = v9;
        }
        *(_DWORD *)uint64_t v15 = a3;
        *(_DWORD *)(v15 + 4) = 0;
        *(void *)(v15 + 8) = v12;
        *(void *)(v15 + 16) = v16;
        v12 += v16;
        v7 -= v16;
        *(void *)(v15 + 24) = 0;
        *(void *)(v15 + 32) = 0;
        v15 += 40;
        --v10;
      }
      while (v10);
    }
  }
  return result;
}

uint64_t sub_21DC39FE8(void *a1, const __CFArray *a2, unint64_t a3, int a4, unint64_t a5, int a6, unint64_t *a7)
{
  if (!a1 || !*a1) {
    return 22;
  }
  sub_21DC3A9F0();
  uint64_t v32 = (uint64_t)a1;
  nullsub_4(a1);
  CFIndex Count = CFArrayGetCount(a2);
  __int16 v10 = 0;
  unint64_t v11 = 0;
  CFIndex v12 = 0;
  unint64_t v34 = 0;
  unint64_t v13 = 0;
  uint64_t v14 = Count & ~(Count >> 63);
  unsigned int v35 = 2048;
  while (v14 != v12)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v12);
    __int16 valuePtr = -1;
    if (!ValueAtIndex) {
      goto LABEL_10;
    }
    CFDictionaryRef v16 = ValueAtIndex;
    value = (void *)CFDictionaryGetValue(ValueAtIndex, @"Type");
    CFDictionaryGetValueIfPresent(v16, @"Type", (const void **)&value);
    if (!value) {
      goto LABEL_10;
    }
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt16Type, &valuePtr);
    unsigned __int16 v36 = valuePtr;
    value = (void *)CFDictionaryGetValue(v16, @"Origin");
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v37);
    int v17 = v36;
    if (v36 < 2u)
    {
      value = (void *)CFDictionaryGetValue(v16, @"Length");
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v38);
      goto LABEL_9;
    }
    if (v36 == 2)
    {
      unint64_t v38 = 0;
      int v24 = (void *)sub_21DC166D0(v16, @"Marker");
      value = v24;
      if (v24)
      {
        if (CFEqual(v24, @"Embedded Start"))
        {
          __int16 v10 = 1;
        }
        else if (CFEqual(value, @"Embedded End"))
        {
          __int16 v10 = 2;
        }
        else if (CFEqual(value, @"Volume Start"))
        {
          __int16 v10 = 3;
        }
        else if (CFEqual(value, @"Volume End"))
        {
          __int16 v10 = 4;
        }
        else
        {
          __int16 v10 = -1;
        }
      }
      else
      {
LABEL_9:
        __int16 v10 = 0;
      }
LABEL_10:
      int v17 = v36;
      goto LABEL_11;
    }
    __int16 v10 = 0;
LABEL_11:
    if (v17 == 2)
    {
      uint64_t v21 = 0;
      BOOL v22 = v10 == 4 && a6 == 1;
      unsigned int v23 = v35;
      if (v22) {
        unsigned int v23 = 0;
      }
      unsigned int v35 = v23;
      goto LABEL_37;
    }
    if (v17 == 1)
    {
      unint64_t v18 = v37;
      if (v11 > v37) {
        goto LABEL_53;
      }
      unint64_t v19 = v11;
      unint64_t v20 = v37 - v34;
      if (v37 - v34 < v35)
      {
        v13 += v20;
        uint64_t v21 = 0;
        if (v38)
        {
          v13 += v38;
          unint64_t v34 = v38 + v37;
        }
        else
        {
          unint64_t v34 = v37;
        }
        goto LABEL_36;
      }
      if (v13)
      {
        uint64_t v25 = sub_21DC39E08(v32, v13, a4, a5);
        if (v25)
        {
          uint64_t v21 = v25;
LABEL_36:
          unint64_t v11 = v19;
          goto LABEL_37;
        }
        v19 += v13;
      }
      uint64_t v21 = sub_21DC39E08(v32, v20, 2, a5);
      if (!v21)
      {
        unint64_t v11 = v19 + v20;
        unint64_t v13 = v38;
        unint64_t v34 = v38 + v18;
        goto LABEL_37;
      }
      unint64_t v13 = 0;
      goto LABEL_36;
    }
    uint64_t v21 = 0;
LABEL_37:
    ++v12;
    if (v21) {
      goto LABEL_57;
    }
  }
  if (v13)
  {
    uint64_t v26 = sub_21DC39E08(v32, v13, a4, a5);
    if (v26)
    {
      uint64_t v21 = v26;
      goto LABEL_57;
    }
    v11 += v13;
  }
  if (a3 < v11)
  {
LABEL_53:
    uint64_t v21 = 999;
    goto LABEL_57;
  }
  if (a3 == v11 || (uint64_t v21 = sub_21DC39E08(v32, a3 - v11, 2, a5), !v21))
  {
    uint64_t v21 = 0;
    unint64_t v11 = a3;
  }
LABEL_57:
  nullsub_4(v32);
  if (a7) {
    *a7 = v11;
  }
  return v21;
}

uint64_t sub_21DC3A374(uint64_t a1)
{
  *(void *)a1 = &unk_26CE87950;
  free(*(void **)(a1 + 40));
  *(void *)(a1 + 40) = 0;
  return a1;
}

const char *sub_21DC3A3C0()
{
  return "CCachedBackingStore";
}

uint64_t sub_21DC3A3CC()
{
  return 78;
}

uint64_t sub_21DC3A3D8(uint64_t a1, char *a2)
{
  uint64_t v3 = (FILE **)MEMORY[0x263EF8348];
  if (a2) {
    fputs(a2, (FILE *)*MEMORY[0x263EF8348]);
  }
  CFStringRef v4 = (pthread_mutex_t *)(a1 + 8);
  int v5 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 8));
  uint64_t v6 = "<locked>";
  if (!v5) {
    uint64_t v6 = "<unlocked>";
  }
  uint64_t result = fprintf(*v3, "%s (items %d, reserve %d)\n", v6, *(_DWORD *)(a1 + 136), *(_DWORD *)(a1 + 144));
  if (*(_DWORD *)(a1 + 120)) {
    uint64_t result = puts("<aborting>");
  }
  for (CFIndex i = *(void **)(a1 + 128); i; CFIndex i = (void *)i[9])
    uint64_t result = (*(uint64_t (**)(void *, void))(*i + 16))(i, 0);
  if (!v5)
  {
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t sub_21DC3A4E8(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879F8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

void sub_21DC3A52C(uint64_t a1)
{
  *(void *)a1 = &unk_26CE879F8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  JUMPOUT(0x223C15E40);
}

void sub_21DC3A590(_Unwind_Exception *a1)
{
  MEMORY[0x223C15E40](v1, 0x10A1C4039AEBF7ALL);
  _Unwind_Resume(a1);
}

uint64_t sub_21DC3A5B4(uint64_t a1, char *a2)
{
  uint64_t v3 = (FILE **)MEMORY[0x263EF8348];
  if (a2) {
    fputs(a2, (FILE *)*MEMORY[0x263EF8348]);
  }
  CFStringRef v4 = (pthread_mutex_t *)(a1 + 8);
  int v5 = pthread_mutex_trylock(v4);
  uint64_t v6 = "<locked>";
  if (!v5) {
    uint64_t v6 = "<unlocked>";
  }
  uint64_t result = fprintf(*v3, "%s\n", v6);
  if (!v5)
  {
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t sub_21DC3A66C(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = 0;
  CFAllocatorRef v2 = (const void *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64))(a1, &v4, a2, 0);
  if (v2) {
    CFRelease(v2);
  }
  return v4;
}

const char *sub_21DC3A6C8()
{
  return "CDIISOPartitionScheme";
}

int8x8_t sub_21DC3A768(uint64_t *a1)
{
  v1.i64[0] = *a1;
  v1.i64[1] = *a1;
  int8x8_t result = vqtbl1_s8(v1, (int8x8_t)0x607040500010203);
  *a1 = (uint64_t)result;
  return result;
}

const char *sub_21DC3A784()
{
  return "CDIGUIDPartitionScheme";
}

uint64_t sub_21DC3A79C(uint64_t result, int a2, unint64_t a3)
{
  if (*(void *)(result + 112))
  {
    uint64_t v4 = result;
    unint64_t v5 = a3 >> 2;
    BOOL v9 = a2 != 0;
    if (a3 >= 4)
    {
      do
      {
        int8x8_t result = (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 4);
        --v5;
      }
      while (v5);
      uint64_t v6 = -1;
    }
    else
    {
      uint64_t v6 = v5 - 1;
    }
    unint64_t v7 = a3 - 4 * v6;
    unint64_t v8 = v7 - 2;
    if (v7 >= 2)
    {
      int8x8_t result = (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 2);
      unint64_t v7 = v8;
    }
    if (v7) {
      return (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 1);
    }
  }
  return result;
}

uint64_t sub_21DC3A854(_DWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 96))(a1, a2, (8 * a1[32]));
}

uint64_t sub_21DC3A880()
{
  return 45;
}

uint64_t DIHLDiskImageProbeURL()
{
  return 1;
}

CFTypeRef sub_21DC3A890(int a1, int a2, CFTypeRef cf)
{
  return CFRetain(cf);
}

uint64_t sub_21DC3A898()
{
  return 0;
}

void *sub_21DC3A8A0(uint64_t a1)
{
  CFAllocatorRef v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x100004000313F17uLL);
  if (a1)
  {
    uint64_t v3 = (char *)malloc_type_calloc(1uLL, a1 + 4, 0x847AC88FuLL);
    *(_DWORD *)&v3[a1] = a1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  *CFAllocatorRef v2 = v3;
  v2[1] = a1;
  return v2;
}

void *sub_21DC3A910()
{
  int8x8_t result = malloc_type_calloc(1uLL, 0x10uLL, 0x100004000313F17uLL);
  *int8x8_t result = 0;
  result[1] = 0;
  return result;
}

void sub_21DC3A944(void **a1)
{
  if (a1)
  {
    CFAllocatorRef v2 = *a1;
    if (*a1) {
      free(v2);
    }
  }
  free(a1);
}

char *sub_21DC3A988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4) {
    int8x8_t result = (char *)malloc_type_realloc(v4, a2 + 4, 0xF9C1DEE4uLL);
  }
  else {
    int8x8_t result = (char *)malloc_type_calloc(1uLL, a2 + 4, 0x847AC88FuLL);
  }
  *(_DWORD *)&result[a2] = a2;
  *(void *)a1 = result;
  *(void *)(a1 + 8) = a2;
  return result;
}

uint64_t sub_21DC3A9E4(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_21DC3A9F0()
{
  return 7;
}

__CFDictionary *sub_21DC3A9F8(uint64_t *a1, char a2, uint64_t a3, int a4)
{
  uint64_t v61 = a3;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  uint64_t v58 = 0;
  CFTypeRef v59 = 0;
  if (!Mutable) {
    return 0;
  }
  CFMutableArrayRef v9 = Mutable;
  unint64_t v60 = 0;
  if (!DIMediaKitCreateMKMediaRef((uint64_t)a1, (uint64_t)v7, 0, (uint64_t *)&v59))
  {
    int v57 = 0;
    unint64_t v11 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFIndex v12 = (void *)*MEMORY[0x263EFFB40];
    CFDictionarySetValue(v11, @"Include most", (const void *)*MEMORY[0x263EFFB40]);
    CFDictionaryRef v13 = (const __CFDictionary *)MKCFReadMedia();
    CFRelease(v11);
    if (!v13)
    {
      __int16 v10 = sub_21DC3AFAC((uint64_t)a1, a2, 0, 0, 0, 0, 0, 1, v61, 0);
      if (v10) {
        int v14 = 0;
      }
      else {
        int v14 = 999;
      }
      goto LABEL_12;
    }
    CFDictionaryRef v55 = 0;
    CFArrayRef v56 = 0;
    int v15 = sub_21DC3B27C(v13, &v55, &v56);
    if (v15
      || (CFDictionaryRef v16 = (__CFString *)sub_21DC166D0(v55, @"ID"),
          (int v15 = sub_21DC3B3A4(a2, a1, (uint64_t)v59, v55, &v61, (uint64_t *)&v60)) != 0))
    {
      int v14 = v15;
      __int16 v10 = 0;
LABEL_12:
      if (v14 && v10)
      {
        CFRelease(v10);
        __int16 v10 = 0;
      }
      if (v13) {
        CFRelease(v13);
      }
      goto LABEL_17;
    }
    uint64_t v18 = (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1);
    uint64_t v40 = v61;
    uint64_t v41 = v18;
    __int16 v10 = sub_21DC3B728(v16, 0, 0, 0, a2, 0, v18, v18, v61, v60, 0);
    CFIndex Count = CFArrayGetCount(v56);
    CFDictionaryRef v20 = (const __CFDictionary *)sub_21DC16690(v56, 0);
    CFIndex v43 = Count;
    CFIndex v44 = Count - 1;
    if (Count < 1)
    {
      int v14 = 0;
LABEL_70:
      if (CFArrayGetCount(v9))
      {
        CFDictionarySetValue(v10, @"subcontent-list", v9);
        CFRelease(v9);
        CFMutableArrayRef v9 = 0;
      }
      goto LABEL_12;
    }
    CFDictionaryRef v21 = v20;
    CFStringRef v39 = v12;
    CFIndex v22 = 0;
    int v14 = 0;
    int v42 = a4 | ((a2 & 0x10) >> 4);
    while (1)
    {
      if (v22 >= v44) {
        CFDictionaryRef v45 = 0;
      }
      else {
        CFDictionaryRef v45 = (const __CFDictionary *)sub_21DC16690(v56, v22 + 1);
      }
      uint64_t v53 = 0;
      unint64_t v54 = 0;
      CFStringRef v51 = 0;
      int v52 = 0;
      uint64_t v49 = 0;
      value = 0;
      uint64_t valuePtr = 0;
      uint64_t v48 = 0;
      if (!sub_21DC3B894(v21, (const void **)&value, (const void **)&v53, &v52, &v49, &v48, (const void **)&v51))goto LABEL_65; {
      uint64_t v23 = v48;
      }
      if (v42)
      {
        uint64_t v24 = v48;
        char v25 = a2 & 0xF8 | 4;
      }
      else
      {
        if (v45)
        {
          uint64_t valuePtr = 0;
          CFNumberRef v26 = (const __CFNumber *)sub_21DC11C7C(v45, @"Offset");
          if (v26)
          {
            int v27 = CFNumberGetValue(v26, kCFNumberLongLongType, &valuePtr);
            uint64_t v24 = v48;
            if (v27)
            {
              uint64_t v58 = valuePtr - (v49 + v48);
              uint64_t v23 = v48;
            }
          }
          else
          {
            uint64_t v24 = v48;
          }
        }
        else
        {
          uint64_t v58 = v41 - (v48 + v49);
          uint64_t v24 = v48;
          if (v61 - (v41 - v48) > v48) {
            uint64_t v23 = v61 - (v41 - v48);
          }
        }
        char v25 = a2;
      }
      int v14 = sub_21DC16734((uint64_t)a1, v49, v24, &v54);
      if (v14) {
        goto LABEL_65;
      }
      CFStringRef v28 = sub_21DC3AFAC((uint64_t)v54, v25, value, v53, v53, v52, v49, v60, v23, v51);
      if (v28) {
        break;
      }
      int v14 = 0;
LABEL_65:
      CFDictionaryRef v21 = v45;
      if (v54) {
        DIDiskImageObjectRelease(v54);
      }
      if (v43 == ++v22) {
        goto LABEL_70;
      }
    }
    BOOL v29 = v28;
    if (v58)
    {
      CFNumberRef v30 = CFNumberCreate(0, kCFNumberSInt64Type, &v58);
      CFDictionarySetValue(v29, @"postamble", v30);
      CFRelease(v30);
    }
    if ((v25 & 0x10) != 0 || !sub_21DC3B9D4(v29))
    {
      if (v44 != v22)
      {
LABEL_63:
        int v14 = 0;
        goto LABEL_64;
      }
      uint64_t v35 = v41;
      uint64_t v36 = v41;
      if ((a2 & 4) == 0)
      {
        uint64_t v37 = v48;
        uint64_t v38 = v49;
        int v14 = sub_21DC3BBE8(v55, (unint64_t *)&v58);
        if (v14)
        {
LABEL_64:
          CFArrayAppendValue(v9, v29);
          CFRelease(v29);
          goto LABEL_65;
        }
        uint64_t v36 = v37 + v38 + v58;
        uint64_t v35 = v41;
      }
    }
    else
    {
      if (value)
      {
        CFDictionarySetValue(v10, @"partition-resize-id-hint", value);
        LODWORD(v46) = v22;
        CFNumberRef v31 = CFNumberCreate(v7, kCFNumberIntType, &v46);
        CFDictionarySetValue(v10, @"partition-resize-hint", v31);
        CFRelease(v31);
      }
      if (v44 != v22) {
        goto LABEL_63;
      }
      if ((a2 & 4) == 0) {
        CFDictionarySetValue(v29, @"can-trigger-image-resize", v39);
      }
      uint64_t v33 = v48;
      uint64_t v32 = v49;
      uint64_t v46 = 0;
      CFNumberRef v34 = (const __CFNumber *)sub_21DC11C7C(v29, @"content-min-length");
      if (v34 && CFNumberGetValue(v34, kCFNumberLongLongType, &v46)) {
        uint64_t v33 = v46;
      }
      else {
        uint64_t v46 = v33;
      }
      uint64_t v35 = v41;
      if ((a2 & 4) != 0) {
        uint64_t v36 = v41;
      }
      else {
        uint64_t v36 = v33 + v32 + v58;
      }
    }
    sub_21DC3BA10(v10, a2, v36, v35, v40, v60);
    goto LABEL_63;
  }
  __int16 v10 = 0;
LABEL_17:
  if (v59)
  {
    CFRelease(v59);
    CFTypeRef v59 = 0;
  }
  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

__CFDictionary *sub_21DC3AFAC(uint64_t a1, char a2, const void *a3, __CFString *a4, const void *a5, const void *a6, uint64_t a7, int64_t a8, uint64_t a9, void *a10)
{
  CFTypeRef cf = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v16 = a9;
  if (!a9)
  {
    uint64_t v18 = *(void *)a1;
    if ((a2 & 4) != 0) {
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(v18 + 96))(a1);
    }
    else {
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(v18 + 112))(a1);
    }
    uint64_t v16 = v19;
  }
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  if (!a4)
  {
    if ((a2 & 8) == 0) {
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
    if ((unint64_t)a8 <= 1) {
      a8 = 1;
    }
    char v25 = a6;
    uint64_t v26 = a7;
    goto LABEL_20;
  }
  CFComparisonResult v21 = CFStringCompare(a4, @"Apple_APFS", 0);
  if ((a2 & 8) != 0 || v21 == kCFCompareEqualTo) {
    goto LABEL_17;
  }
LABEL_12:
  int MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x263EFFB08], 0, (uint64_t *)&cf);
  if (cf && !MKMediaRef && !MKHFSGetResizeLimits())
  {
    uint64_t v27 = v40;
    unint64_t v29 = v41 | (unint64_t)a8;
    if (a8 && v41)
    {
      if (v29)
      {
        char v30 = 0;
        unint64_t v32 = v41;
        unint64_t v31 = a8;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = a8;
        unint64_t v32 = v41;
        do
        {
          v32 >>= 1;
          v31 >>= 1;
          ++v30;
        }
        while (((v32 | v31) & 1) == 0);
      }
      do
      {
        unint64_t v33 = v32;
        v32 >>= 1;
      }
      while ((v33 & 1) == 0);
      do
      {
        do
        {
          unint64_t v34 = v31;
          v31 >>= 1;
        }
        while ((v34 & 1) == 0);
        unint64_t v35 = v33 - v34;
        if (v33 < v34)
        {
          unint64_t v36 = v34 - v33;
        }
        else
        {
          unint64_t v33 = v34;
          unint64_t v36 = v35;
        }
        unint64_t v31 = v36 >> 1;
      }
      while (v36 > 1);
      unint64_t v29 = v33 << v30;
    }
    char v25 = a6;
    uint64_t v26 = a7;
    if (a8 / v29 * v41 <= 1) {
      a8 = 1;
    }
    else {
      a8 = a8 / v29 * v41;
    }
    if (v39 < v16) {
      uint64_t v16 = v39;
    }
LABEL_20:
    if (v20 - (v20 - v27) / a8 * a8 >= v20) {
      uint64_t v23 = v20;
    }
    else {
      uint64_t v23 = v20 - (v20 - v27) / a8 * a8;
    }
    uint64_t v24 = (((v16 - v20) / a8 * a8) & ~(((v16 - v20) / a8 * a8) >> 63)) + v20;
    goto LABEL_24;
  }
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  a4 = @"unknown";
  uint64_t v24 = v23;
  uint64_t v20 = v23;
  char v25 = a6;
  uint64_t v26 = a7;
LABEL_24:
  int v17 = sub_21DC3B728(a4, a3, a5, v25, a2, v26, v23, v20, v24, a8, a10);
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

uint64_t sub_21DC3B27C(const __CFDictionary *a1, const __CFDictionary **a2, const __CFArray **a3)
{
  if (a3) {
    *a3 = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  CFArrayRef v5 = (const __CFArray *)sub_21DC16650(a1, @"Schemes");
  if (!v5) {
    return 45;
  }
  CFArrayRef v6 = v5;
  if (!CFArrayGetCount(v5)) {
    return 45;
  }
  if (CFArrayGetCount(v6) < 2)
  {
    CFDictionaryRef v7 = (const __CFDictionary *)sub_21DC16690(v6, 0);
    goto LABEL_12;
  }
  if (!sub_21DC2BE84()) {
    return 45;
  }
  CFDictionaryRef v7 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
LABEL_12:
  CFDictionaryRef v9 = v7;
  if (!v7) {
    return 22;
  }
  __int16 v10 = sub_21DC166D0(v7, @"ID");
  if (!v10) {
    return 22;
  }
  if (CFEqual(v10, @"ISO9660")) {
    return 22;
  }
  CFArrayRef v11 = (const __CFArray *)sub_21DC16650(v9, @"Sections");
  CFDictionaryRef v12 = sub_21DC3C600(v11);
  if (!v12) {
    return 22;
  }
  CFArrayRef v13 = (const __CFArray *)sub_21DC16650(v12, @"Partitions");
  if (!v13) {
    return 22;
  }
  CFArrayRef v14 = v13;
  if (!CFArrayGetCount(v13)) {
    return 22;
  }
  if (a3) {
    *a3 = v14;
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = v9;
  }
  return result;
}

uint64_t sub_21DC3B3A4(char a1, uint64_t *a2, uint64_t a3, const __CFDictionary *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a6) {
    *a6 = 0;
  }
  if (a5)
  {
    uint64_t v11 = MKMediaCopyProperty();
    if (v11)
    {
      CFDictionaryRef v12 = (const void *)v11;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v12)
        || (CFArrayRef v14 = (const __CFArray *)sub_21DC16650(a4, @"Sections"), (v15 = sub_21DC3C600(v14)) == 0))
      {
        uint64_t v20 = 22;
        goto LABEL_16;
      }
      uint64_t valuePtr = 0;
      CFNumberRef v16 = (const __CFNumber *)sub_21DC11C7C(v15, @"Media Block Size");
      if (!v16 || !CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr)) {
        uint64_t valuePtr = 512;
      }
      int v17 = sub_21DC166D0(a4, @"ID");
      uint64_t v18 = v17;
      if (v17 && CFEqual(v17, @"APM"))
      {
        uint64_t v27 = 0;
        uint64_t v19 = (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t *, unsigned __int16 *))(*a2 + 48))(a2, 0, 1, &v27, v29);
        if (v19)
        {
          uint64_t v20 = v19;
LABEL_16:
          CFRelease(v12);
          return v20;
        }
        sub_21DC28BF0(v29);
      }
      if (a6) {
        *a6 = valuePtr / 512;
      }
      if (*a5)
      {
        uint64_t v20 = 0;
        goto LABEL_16;
      }
      uint64_t v22 = *a2;
      if ((a1 & 4) != 0)
      {
        uint64_t v25 = (*(uint64_t (**)(uint64_t *))(v22 + 96))(a2);
      }
      else
      {
        uint64_t v23 = (*(uint64_t (**)(uint64_t *))(v22 + 112))(a2);
        if (v23 < (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2)) {
          uint64_t v23 = (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2);
        }
        uint64_t v24 = v23;
        if (!v18) {
          goto LABEL_33;
        }
        if (CFEqual(v18, @"APM"))
        {
          uint64_t v24 = 0xFFFFFFFFLL * valuePtr / 512;
LABEL_33:
          if (v24 < (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2)) {
            uint64_t v24 = (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2);
          }
          uint64_t v20 = 0;
          if (v23 >= v24) {
            uint64_t v26 = v24;
          }
          else {
            uint64_t v26 = v23;
          }
          *a5 = v26;
          goto LABEL_16;
        }
        uint64_t v24 = v23;
        if (CFEqual(v18, @"GPT")) {
          goto LABEL_33;
        }
        uint64_t v24 = v23;
        if (CFEqual(v18, @"MBR")) {
          goto LABEL_33;
        }
        uint64_t v25 = (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2);
      }
      uint64_t v20 = 0;
      *a5 = v25;
      goto LABEL_16;
    }
  }
  return 22;
}

__CFDictionary *sub_21DC3B728(__CFString *a1, const void *a2, const void *a3, const void *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, void *value)
{
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  sub_21DC3BA10(Mutable, a5, a7, a8, a9, a10);
  if (a1) {
    uint64_t v19 = a1;
  }
  else {
    uint64_t v19 = @"unknown";
  }
  CFDictionarySetValue(Mutable, @"content-hint", v19);
  if (a3) {
    CFDictionarySetValue(Mutable, @"partition-type", a3);
  }
  if (a4) {
    CFDictionarySetValue(Mutable, @"partition-name", a4);
  }
  if (a2) {
    CFDictionarySetValue(Mutable, @"partition-ID", a2);
  }
  if (value) {
    CFDictionarySetValue(Mutable, @"partition-UUID", value);
  }
  uint64_t valuePtr = a6;
  CFNumberRef v20 = CFNumberCreate(v22, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"content-start", v20);
  if (v20) {
    CFRelease(v20);
  }
  return Mutable;
}

uint64_t sub_21DC3B894(const __CFDictionary *a1, const void **a2, const void **a3, const void **a4, void *a5, void *a6, const void **a7)
{
  if (a3) {
    *a3 = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (!a1) {
    return 0;
  }
  if (a2) {
    *a2 = sub_21DC11C7C(a1, @"Partition ID");
  }
  if (a3) {
    *a3 = sub_21DC166D0(a1, @"Type");
  }
  if (a4) {
    *a4 = sub_21DC166D0(a1, @"Name");
  }
  if (a7) {
    *a7 = sub_21DC166D0(a1, @"GUID");
  }
  if (!a5
    || (uint64_t result = (uint64_t)sub_21DC11C7C(a1, @"Offset")) != 0
    && (uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a5), result))
  {
    if (!a6) {
      return 1;
    }
    uint64_t result = (uint64_t)sub_21DC11C7C(a1, @"Size");
    if (result)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a6);
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

CFStringRef sub_21DC3B9D4(const __CFDictionary *a1)
{
  CFStringRef result = (const __CFString *)sub_21DC166D0(a1, @"content-hint");
  if (result) {
    return (const __CFString *)(CFStringCompare(result, @"unknown", 0) != kCFCompareEqualTo);
  }
  return result;
}

void sub_21DC3BA10(__CFDictionary *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a1)
  {
    uint64_t valuePtr = 0;
    if (a5 < a4 || (a2 & 1) == 0) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = a5;
    }
    if (a3 > a4 || (a2 & 2) == 0) {
      uint64_t v11 = a4;
    }
    else {
      uint64_t v11 = a3;
    }
    if (a6 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = a6;
    }
    uint64_t v13 = a4 - (a4 - v11) / v12 * v12;
    if (v13 >= a4) {
      uint64_t v13 = a4;
    }
    if ((a4 - v11) % v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v11;
    }
    uint64_t v15 = (v9 - a4) / v12 * v12;
    if (v9 - a4 == v15) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = (v15 & ~(v15 >> 63)) + a4;
    }
    CFDictionaryRemoveValue(a1, @"content-min-length");
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v14 != a4)
    {
      uint64_t valuePtr = v14;
      CFNumberRef v18 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-min-length", v18);
      CFRelease(v18);
    }
    CFDictionaryRemoveValue(a1, @"content-max-length");
    if (v16 != a4)
    {
      uint64_t valuePtr = v16;
      CFNumberRef v19 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-max-length", v19);
      CFRelease(v19);
    }
    CFDictionaryRemoveValue(a1, @"content-granularity");
    if (v14 != v16)
    {
      uint64_t valuePtr = v12;
      CFNumberRef v20 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-granularity", v20);
      CFRelease(v20);
    }
    uint64_t valuePtr = a4;
    CFNumberRef v21 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
    CFDictionarySetValue(a1, @"content-length", v21);
    CFRelease(v21);
  }
}

uint64_t sub_21DC3BBE8(const __CFDictionary *a1, unint64_t *a2)
{
  uint64_t v9 = 0;
  uint64_t valuePtr = 0;
  if (!a2) {
    return 22;
  }
  CFArrayRef v3 = (const __CFArray *)sub_21DC16650(a1, @"Sections");
  CFDictionaryRef v4 = sub_21DC3C600(v3);
  if (!v4) {
    return 2;
  }
  CFDictionaryRef v5 = v4;
  CFNumberRef v6 = (const __CFNumber *)sub_21DC11C7C(v4, @"Overhead");
  if (!v6) {
    return 2;
  }
  CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v7 = (const __CFNumber *)sub_21DC11C7C(v5, @"Offset");
  if (!v7) {
    return 2;
  }
  CFNumberGetValue(v7, kCFNumberLongLongType, &v9);
  if (valuePtr - v9 < 0) {
    return 2;
  }
  uint64_t result = 0;
  *a2 = (valuePtr - v9 + 8 * (((valuePtr - v9) & 7) != 0)) & 0xFFFFFFFFFFFFFFF8;
  return result;
}

uint64_t sub_21DC3BCA0(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (a4) {
    unsigned int v6 = 19;
  }
  else {
    unsigned int v6 = 3;
  }
  if (a3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 | 0x20;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)a1 + 456))(a1, v7, 0, 1);
  if (!v8) {
    return 999;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)v8;
  uint64_t v45 = 1;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  uint64_t v46 = v10;
  uint64_t valuePtr = v10;
  CFNumberRef v11 = (const __CFNumber *)sub_21DC11C7C(v9, @"content-min-length");
  if (v11) {
    CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
  }
  CFNumberRef v12 = (const __CFNumber *)sub_21DC11C7C(v9, @"content-max-length");
  if (v12) {
    CFNumberGetValue(v12, kCFNumberLongLongType, &v46);
  }
  CFNumberRef v13 = (const __CFNumber *)sub_21DC11C7C(v9, @"content-granularity");
  if (v13) {
    CFNumberGetValue(v13, kCFNumberLongLongType, &v45);
  }
  if (a2 == -1) {
    uint64_t v14 = valuePtr;
  }
  else {
    uint64_t v14 = a2;
  }
  if (v14 == 1) {
    uint64_t v14 = v46;
  }
  if (v14 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.");
LABEL_66:
    CFDictionaryRef v23 = 0;
    uint64_t v22 = 22;
    goto LABEL_33;
  }
  if (v14 > v46)
  {
    warnx("resize request is above maximum size allowed.");
    goto LABEL_66;
  }
  uint64_t v15 = (v10 - v14) / v45 * v45;
  uint64_t v16 = (v14 - v10) / v45 * v45;
  BOOL v17 = v14 <= v10;
  if (v14 > v10) {
    uint64_t v18 = (v14 - v10) / v45 * v45;
  }
  else {
    uint64_t v18 = (v10 - v14) / v45 * v45;
  }
  if (v17) {
    uint64_t v19 = v10 - v15;
  }
  else {
    uint64_t v19 = v16 + v10;
  }
  if (v18)
  {
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x263EFFB08], 0, (uint64_t *)&cf);
    if (!MKMediaRef)
    {
      int v43 = 0;
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v20, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v26 = (const void *)*MEMORY[0x263EFFB40];
      CFDictionarySetValue(Mutable, @"Include most", (const void *)*MEMORY[0x263EFFB40]);
      CFDictionaryRef v23 = (const __CFDictionary *)MKCFReadMedia();
      CFRelease(Mutable);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      CFDictionaryRef v41 = 0;
      CFArrayRef v42 = 0;
      uint64_t v22 = sub_21DC3B27C(v23, &v41, &v42);
      if (v22) {
        goto LABEL_33;
      }
      uint64_t v27 = sub_21DC166D0(v41, @"ID");
      CFStringRef v28 = v27;
      unint64_t v29 = @"Fit Map to Container";
      if (v27 && CFEqual(v27, @"APM")) {
        unint64_t v29 = @"Fit Map to Media";
      }
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 104))(a1, v19);
      if (v22) {
        goto LABEL_33;
      }
      uint64_t v22 = DIMediaKitCreateMKMediaRef(a1, (uint64_t)v20, 0, (uint64_t *)&cf);
      if (v22) {
        goto LABEL_33;
      }
      CFTypeRef cf1 = v28;
      CFArrayRef v30 = (const __CFArray *)sub_21DC16650(v23, @"Schemes");
      CFIndex Count = CFArrayGetCount(v30);
      if (Count >= 1)
      {
        CFIndex v32 = Count;
        for (CFIndex i = 0; i < v32; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v30, i);
          unint64_t v35 = sub_21DC166D0(ValueAtIndex, @"ID");
          if (v35 && CFEqual(v35, @"ISO9660"))
          {
            CFArrayRemoveValueAtIndex(v30, i--);
            --v32;
          }
        }
      }
      unint64_t v36 = CFDictionaryCreateMutable(v20, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(v36, v29, v26);
      uint64_t v22 = MKCFWriteMedia();
      CFRelease(v36);
      if (!cf1 || v22) {
        goto LABEL_33;
      }
      if (CFEqual(cf1, @"APM"))
      {
        uint64_t v40 = 0;
        uint64_t v22 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)a1 + 48))(a1, 0, 1, &v40, &v48);
        if (v22) {
          goto LABEL_33;
        }
        sub_21DC28BF0(&v48);
        if (v49 < 0x200u) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = v49 >> 9;
        }
        uint64_t v38 = v19 / v37;
        if (v19 % v37) {
          ++v38;
        }
        if (v50 * (unint64_t)v37 != v38 * v37)
        {
          if (v38 <= 0xFFFFFFFFLL)
          {
            unsigned int v50 = v38;
            sub_21DC13E38(&v48);
            uint64_t v22 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, unsigned __int16 *))(*(void *)a1 + 64))(a1, 0, 1, &v40, &v48);
          }
          else
          {
            uint64_t v22 = 999;
          }
          goto LABEL_33;
        }
      }
      else if (!CFEqual(cf1, @"GPT"))
      {
        CFEqual(cf1, @"MBR");
      }
      uint64_t v22 = 0;
      goto LABEL_33;
    }
    uint64_t v22 = MKMediaRef;
  }
  else
  {
    uint64_t v22 = 0;
  }
  CFDictionaryRef v23 = 0;
LABEL_33:
  CFRelease(v9);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v23) {
    CFRelease(v23);
  }
  return v22;
}

uint64_t sub_21DC3C204(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  CFTypeRef cf = 0;
  if (a4)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
    if (v12 <= a2) {
      uint64_t v13 = a2;
    }
    else {
      uint64_t v13 = v12;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (a5) {
    uint64_t v14 = 11;
  }
  else {
    uint64_t v14 = 3;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 456))(a1, v14, v13, 0);
  if (!v15) {
    return 999;
  }
  CFDictionaryRef v16 = (const __CFDictionary *)v15;
  uint64_t v31 = 1;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  uint64_t v32 = v17;
  uint64_t valuePtr = v17;
  if (a6 < 0)
  {
    CFNumberRef v19 = (const __CFNumber *)sub_21DC11C7C(v16, @"content-min-length");
    if (v19) {
      CFNumberGetValue(v19, kCFNumberLongLongType, &valuePtr);
    }
  }
  else
  {
    uint64_t valuePtr = a6;
  }
  CFNumberRef v20 = (const __CFNumber *)sub_21DC11C7C(v16, @"content-max-length");
  if (v20) {
    CFNumberGetValue(v20, kCFNumberLongLongType, &v32);
  }
  CFNumberRef v21 = (const __CFNumber *)sub_21DC11C7C(v16, @"content-granularity");
  if (v21) {
    CFNumberGetValue(v21, kCFNumberLongLongType, &v31);
  }
  if (a2 == -1) {
    uint64_t v22 = valuePtr;
  }
  else {
    uint64_t v22 = a2;
  }
  if (v22 == 1) {
    uint64_t v23 = v32;
  }
  else {
    uint64_t v23 = v22;
  }
  if (v23 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.");
LABEL_47:
    uint64_t MKMediaRef = 22;
    goto LABEL_48;
  }
  if (v23 > v32)
  {
    warnx("resize request is above maximum size allowed.");
    goto LABEL_47;
  }
  if (v23 <= v17)
  {
    if (v17 - v23 != (v17 - v23) % v31)
    {
      uint64_t v29 = a3;
      uint64_t v24 = v17 - (v17 - v23) / v31 * v31;
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v23 - v17 == (v23 - v17) % v31)
  {
LABEL_32:
    uint64_t MKMediaRef = 0;
    goto LABEL_48;
  }
  uint64_t v24 = v23 - (v23 - v17) % v31;
  uint64_t MKMediaRef = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 104))(a1, v24);
  if (!MKMediaRef)
  {
    uint64_t v29 = a3;
LABEL_34:
    uint64_t v25 = *MEMORY[0x263EFFB08];
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionarySetValue(Mutable, @"Writable", (const void *)*MEMORY[0x263EFFB40]);
    uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef(a1, v25, Mutable, (uint64_t *)&cf);
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (cf)
    {
      if ((a5 & 1) != 0 || (uint64_t MKMediaRef = MKHFSResizeVolume(), !MKMediaRef))
      {
        uint64_t v27 = a4 ? v29 : v24;
        if (v23 <= v17 && v27) {
          uint64_t MKMediaRef = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1);
        }
      }
    }
  }
LABEL_48:
  CFRelease(v16);
  if (cf) {
    CFRelease(cf);
  }
  return MKMediaRef;
}

CFDictionaryRef sub_21DC3C534(const __CFArray *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
  if (a1 && (CFIndex Count = CFArrayGetCount(a1), Count >= 1))
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    while (1)
    {
      CFDictionaryRef v7 = (const __CFDictionary *)sub_21DC16690(a1, v6);
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFDictionaryRef v9 = sub_21DC11C7C(v7, @"partition-ID");
        if (!v9) {
          goto LABEL_8;
        }
        if (CFEqual(v3, v9)) {
          break;
        }
      }
      if (v5 == ++v6) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    CFDictionaryRef v8 = 0;
  }
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

CFDictionaryRef sub_21DC3C600(const __CFArray *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    CFDictionaryRef v5 = (const __CFDictionary *)sub_21DC16690(a1, v4);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFDictionaryRef v7 = sub_21DC166D0(v5, @"ID");
      if (v7)
      {
        if (CFEqual(v7, @"MAP")) {
          break;
        }
      }
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return v6;
}

BOOL sub_21DC3C698(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t sub_21DC3C6E8(uint64_t a1, char *a2, size_t a3)
{
  CFDictionaryRef v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    if (sub_21DC3C698((const char *)(a1 + 72)))
    {
      CFDictionaryRef v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (CFDictionaryRef v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        uint64_t v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((unsigned char *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL)) {
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      }
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

void sub_21DC3C828()
{
  CFDictionaryRef v0 = __error();
  warn("couldn't open debug log; error %d", *v0);
}

BOOL sub_21DC3C85C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 160))(a1, a2, a3, 0) == 0;
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
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

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

uint64_t CFArrayDictionarySearchWithIndexOptions()
{
  return MEMORY[0x270F49B08]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
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

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return MEMORY[0x270EE4618](bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
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

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D30](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
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

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE5120](alloc, pStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

Boolean CFStringGetPascalString(CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5350](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFStringRef CFURLCopyUserName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5378](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x270EE5398](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A8](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53E8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x270EE5450](anURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
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

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
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

uint64_t MKCFCreateFSInfo()
{
  return MEMORY[0x270F49B30]();
}

uint64_t MKCFReadMedia()
{
  return MEMORY[0x270F49B50]();
}

uint64_t MKCFWriteMedia()
{
  return MEMORY[0x270F49B60]();
}

uint64_t MKDetectISO()
{
  return MEMORY[0x270F49B70]();
}

uint64_t MKHFSGetResizeLimits()
{
  return MEMORY[0x270F49B78]();
}

uint64_t MKHFSResizeVolume()
{
  return MEMORY[0x270F49B80]();
}

uint64_t MKMediaCopyProperty()
{
  return MEMORY[0x270F49B88]();
}

uint64_t MKMediaCreate()
{
  return MEMORY[0x270F49B90]();
}

uint64_t _CFURLCopyComponents()
{
  return MEMORY[0x270EE5730]();
}

uint64_t _CFURLCreateFromComponents()
{
  return MEMORY[0x270EE5758]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::exception::~exception(std::exception *this)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x270ED7EE8]();
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x270ED8740](a1);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F50](*(void *)&algorithm);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x270ED9680](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
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

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x270ED9C98](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x270ED9D38](*(void *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x270F9C748](strm, version, *(void *)&stream_size);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
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

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
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

int ptrace(int _request, pid_t _pid, caddr_t _addr, int _data)
{
  return MEMORY[0x270EDB078](*(void *)&_request, *(void *)&_pid, _addr, *(void *)&_data);
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

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x270EDB148](a1, a2, a3, *(void *)&a4);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB218](path, name, *(void *)&options);
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDB3C8](a1, a2, a3, a4, *(void *)&a5);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x270EDB428](*(void *)&a1, a2);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB730](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x270EDB978](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}