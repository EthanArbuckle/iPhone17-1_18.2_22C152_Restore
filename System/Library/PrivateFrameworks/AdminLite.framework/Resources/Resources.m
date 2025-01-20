uint64_t start()
{
  kern_return_t v0;
  kern_return_t v1;
  mach_port_t mainPort[2];

  *(void *)mainPort = 0;
  v0 = IOMasterPort(bootstrap_port, &mainPort[1]);
  if (v0) {
    sub_10000347C("Error (%d) getting the IOMaster port", v0);
  }
  dword_100008000 = IORegistryEntryFromPath(mainPort[1], "IODeviceTree:/options");
  if (!dword_100008000) {
    sub_10000347C("nvram is not supported on this system.", -1);
  }
  v1 = bootstrap_check_in(bootstrap_port, "com.apple.AdminLite", mainPort);
  if (v1) {
    sub_10000347C("Error (%d) checking in with the bootstrap server", v1);
  }
  mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100003BE8, 0x878u, mainPort[0], 50331648);
  IOObjectRelease(dword_100008000);
  return 0;
}

void sub_10000347C(const char *a1, uint64_t a2)
{
}

CFTypeRef sub_1000034E0(_OWORD *a1, const __CFString *a2)
{
  long long v3 = a1[1];
  *(_OWORD *)v8.val = *a1;
  *(_OWORD *)&v8.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &v8);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  *(void *)v8.val = 0;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a2, (CFErrorRef *)&v8);
  CFRelease(v5);
  return v6;
}

const void *sub_10000354C(const void *a1)
{
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(a1)) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_100003584(int a1, _OWORD *a2, char *__s2, const char *a4, int a5, _DWORD *a6)
{
  *a6 = 1;
  if (!strcmp("boot-args", __s2))
  {
    long long v12 = a2[1];
    v17[0] = *a2;
    v17[1] = v12;
    CFBooleanRef v13 = (const __CFBoolean *)sub_1000034E0(v17, @"com.apple.nvram.boot-args-set-allow");
    if (v13)
    {
      CFBooleanRef v14 = v13;
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v14))
      {
        if (CFBooleanGetValue(v14) == 1)
        {
          if (a5)
          {
            sub_10000366C("IONVRAM-DELETE-PROPERTY", __s2);
            int v16 = 0;
          }
          else
          {
            int v16 = sub_10000366C(__s2, a4);
          }
          *a6 = v16;
        }
        CFRelease(v14);
      }
    }
  }
  return 0;
}

uint64_t sub_10000366C(char *cStr, const char *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v4) {
    sub_10000347C("Error (-1) creating CFString for key %s", (uint64_t)cStr);
  }
  CFStringRef v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_100008000, v4, 0, 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    CFTypeID v8 = CFGetTypeID(CFProperty);
    CFRelease(v7);
    CFDataRef v9 = sub_1000037E4(v8, a2);
    if (!v9) {
      sub_10000347C("Error (-1) creating CFTypeRef for value %s", (uint64_t)a2);
    }
    uint64_t v10 = IORegistryEntrySetCFProperty(dword_100008000, v5, v9);
  }
  else
  {
    CFTypeID TypeID = CFDataGetTypeID();
    CFDataRef v12 = sub_1000037E4(TypeID, a2);
    if (v12 && !IORegistryEntrySetCFProperty(dword_100008000, v5, v12)
      || (CFTypeID v13 = CFStringGetTypeID(), (v14 = sub_1000037E4(v13, a2)) != 0)
      && !IORegistryEntrySetCFProperty(dword_100008000, v5, v14)
      || (v15 = CFNumberGetTypeID(), (CFDataRef v16 = sub_1000037E4(v15, a2)) != 0)
      && !IORegistryEntrySetCFProperty(dword_100008000, v5, v16)
      || (CFTypeID v17 = CFBooleanGetTypeID(), (v18 = sub_1000037E4(v17, a2)) != 0)
      && !IORegistryEntrySetCFProperty(dword_100008000, v5, v18))
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
  }
  CFRelease(v5);
  return v10;
}

CFDataRef sub_1000037E4(uint64_t a1, const char *a2)
{
  if (CFBooleanGetTypeID() == a1)
  {
    if (!strcmp("true", a2))
    {
      return kCFBooleanTrue;
    }
    else if (!strcmp("false", a2))
    {
      return kCFBooleanFalse;
    }
    else
    {
      return 0;
    }
  }
  else if (CFNumberGetTypeID() == a1)
  {
    uint64_t valuePtr = strtol(a2, 0, 0);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  }
  else if (CFStringGetTypeID() == a1)
  {
    return (CFDataRef)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  }
  else if (CFDataGetTypeID() == a1)
  {
    int64_t v5 = strlen(a2);
    if (v5 < 1)
    {
      CFIndex v7 = 0;
    }
    else
    {
      int64_t v6 = v5;
      CFIndex v7 = 0;
      for (int64_t i = 0; i < v6; ++i)
      {
        unsigned int v9 = a2[i];
        if (v9 == 37)
        {
          int64_t v10 = i + 1;
          __darwin_ct_rune_t v11 = a2[i + 1];
          if (v11 < 0)
          {
            if (!__maskrune(v11, 0x10000uLL)) {
              return 0;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v11] & 0x10000) == 0)
          {
            return 0;
          }
          i += 2;
          __darwin_ct_rune_t v12 = a2[i];
          if (v12 < 0)
          {
            if (!__maskrune(v12, 0x10000uLL)) {
              return 0;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[v12] & 0x10000) == 0)
          {
            return 0;
          }
          unsigned int v13 = __toupper(a2[v10]) - 48;
          __darwin_ct_rune_t v14 = __toupper(a2[i]);
          unsigned int v9 = v14 - 48;
          char v15 = 16 * v13;
          if (v13 > 9) {
            char v15 = 16 * v13 - 112;
          }
          if (v9 > 9) {
            LOBYTE(v9) = v14 - 55;
          }
          LOBYTE(v9) = v9 + v15;
        }
        a2[v7++] = v9;
      }
    }
    return CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)a2, v7, kCFAllocatorDefault);
  }
  else
  {
    return 0;
  }
}

char *(*sub_100003A2C(uint64_t a1))(char *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 12345) {
    return sub_100003A4C;
  }
  else {
    return 0;
  }
}

char *sub_100003A4C(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  long long v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x34) {
    goto LABEL_26;
  }
  if (v4 > 0x834) {
    goto LABEL_26;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 52 < v5 || v4 < v6 + 52) {
    goto LABEL_26;
  }
  CFTypeID v8 = &result[v6];
  unsigned int v9 = *((_DWORD *)v8 + 11);
  if (v9 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 52 < v9 || v11 != v10 + 52) {
    goto LABEL_26;
  }
  uint64_t v13 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL) {
    uint64_t v13 = *((unsigned int *)result + 1);
  }
  result = (char *)memchr(result + 40, 0, v13 - 40);
  if (!result
    || ((__darwin_ct_rune_t v14 = v8 - 1024, v15 = v8 + 48, &v3[v4] - v15 >= 1024) ? (v16 = 1024) : (v16 = &v3[v4] - v15),
        (result = (char *)memchr(v15, 0, v16)) == 0))
  {
LABEL_26:
    int v18 = -304;
    goto LABEL_27;
  }
  CFTypeID v17 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v17 || *((_DWORD *)v17 + 1) <= 0x1Fu)
  {
    int v18 = -309;
LABEL_27:
    *(_DWORD *)(a2 + 32) = v18;
    NDR_record_t v19 = NDR_record;
    goto LABEL_28;
  }
  int v20 = *((_DWORD *)v3 + 3);
  int v21 = *(_DWORD *)&v14[v10 + 1072];
  long long v22 = *(_OWORD *)(v17 + 36);
  v23[0] = *(_OWORD *)(v17 + 20);
  v23[1] = v22;
  result = (char *)sub_100003584(v20, v23, v3 + 40, v15, v21, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v19 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_28:
  *(NDR_record_t *)(a2 + 24) = v19;
  return result;
}

uint64_t sub_100003BE8(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = *(_DWORD *)(a1 + 20) + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) == 12345)
  {
    sub_100003A4C((char *)a1, a2);
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
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

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}