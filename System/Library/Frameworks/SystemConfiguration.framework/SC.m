@interface SC
@end

@implementation SC

__CFBundle *___SC_getApplicationBundleID_block_invoke()
{
  result = CFBundleGetMainBundle();
  if (!result) {
    goto LABEL_9;
  }
  v1 = result;
  CFStringRef Identifier = CFBundleGetIdentifier(result);
  _SC_getApplicationBundleID_bundleID = (uint64_t)Identifier;
  if (Identifier)
  {
    CFRetain(Identifier);
  }
  else
  {
    CFURLRef v3 = CFBundleCopyExecutableURL(v1);
    if (v3)
    {
      CFURLRef v4 = v3;
      _SC_getApplicationBundleID_bundleID = (uint64_t)CFURLCopyPath(v3);
      CFRelease(v4);
    }
  }
  if (!_SC_getApplicationBundleID_bundleID) {
    goto LABEL_10;
  }
  result = (__CFBundle *)CFEqual((CFTypeRef)_SC_getApplicationBundleID_bundleID, @"/");
  if (!result)
  {
LABEL_9:
    if (_SC_getApplicationBundleID_bundleID) {
      return result;
    }
    goto LABEL_10;
  }
  CFRelease((CFTypeRef)_SC_getApplicationBundleID_bundleID);
  _SC_getApplicationBundleID_bundleID = 0;
LABEL_10:
  uint64_t v5 = getpid();
  result = (__CFBundle *)CFStringCreateWithFormat(0, 0, @"Unknown(%d)", v5);
  _SC_getApplicationBundleID_bundleID = (uint64_t)result;
  return result;
}

char *___SC_isInstallEnvironment_block_invoke()
{
  result = getenv("__OSINSTALL_ENVIRONMENT");
  _SC_isInstallEnvironment_is_install = result != 0;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_0()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_0 = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_1()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_1 = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_2()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_2 = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_3()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_3 = result;
  return result;
}

uint64_t ___SC_isAppleInternal_block_invoke_4()
{
  uint64_t result = os_variant_has_internal_content();
  _SC_isAppleInternal_isInternal_4 = result;
  return result;
}

void ___SC_hw_model_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)v11 = 0x200000006;
  size_t v10 = 64;
  *(_OWORD *)cStr = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (sysctl(v11, 2u, cStr, &v10, 0, 0))
  {
    v0 = _SC_LOG_DEFAULT();
    uint64_t v1 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v0, (os_log_type_t)v1))
    {
      v2 = (char *)&v11[-2] - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      uint64_t v3 = _os_log_pack_fill();
      CFURLRef v4 = __error();
      uint64_t v5 = strerror(*v4);
      *(_DWORD *)uint64_t v3 = 136315138;
      *(void *)(v3 + 4) = v5;
      __SC_log_send(5, (uint64_t)v0, v1, v2);
    }
  }
  else
  {
    HIBYTE(v15) = 0;
    _SC_hw_model_model = (uint64_t)CFStringCreateWithCString(0, cStr, 0x600u);
    v6 = index(cStr, 44);
    if (v6) {
      char *v6 = 0;
    }
    size_t v7 = strlen(cStr);
    size_t v9 = v7 - 1;
    for (BOOL i = v7 == 1; ; BOOL i = v9 == 0)
    {
      size_t v10 = v9;
      if (i || (cStr[v9] - 48) > 9) {
        break;
      }
      cStr[v9--] = 0;
    }
    _SC_hw_model_model_trimmed = (uint64_t)CFStringCreateWithCString(0, cStr, 0x600u);
  }
}

unint64_t ___SC_dlopen_block_invoke()
{
  unint64_t result = dyld_process_is_restricted();
  if ((result & 1) == 0)
  {
    unint64_t result = (unint64_t)getenv("DYLD_IMAGE_SUFFIX");
    _SC_dlopen_suffix = result;
    if (result)
    {
      uint64_t v1 = (unsigned char *)result;
      unint64_t result = strlen((const char *)result);
      if (result < 2 || *v1 != 95) {
        _SC_dlopen_suffix = 0;
      }
    }
  }
  return result;
}

void ___SC_crash_once_block_invoke(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

void ___SC_crash_once_block_invoke_0(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

void ___SC_crash_once_block_invoke_1(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

void ___SC_crash_once_block_invoke_2(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

void ___SC_crash_once_block_invoke_3(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

void ___SC_crash_once_block_invoke_4(void *a1)
{
  v2 = (const char *)a1[4];
  CFStringRef v3 = (const __CFString *)a1[5];
  uint64_t v4 = a1[6];

  _SC_crash(v2, v3, v4);
}

@end