@interface CFPrefsGetSuiteContainer
@end

@implementation CFPrefsGetSuiteContainer

void ___CFPrefsGetSuiteContainer_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a2 + 16);
  if (Mutable)
  {
    CFURLRef Value = (const __CFURL *)CFDictionaryGetValue(Mutable, *(const void **)(a1 + 48));
    if (Value)
    {
      if (Value != (const __CFURL *)&__kCFNull)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFURLGetFileSystemRepresentation(Value, 1u, *(UInt8 **)(a1 + 56), *(void *)(a1 + 64)) != 0;
        return;
      }
      goto LABEL_12;
    }
  }
  _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), 0, a2);
  v6 = *(const void **)(a2 + 40);
  if (!v6 || (CFArrayRef v7 = (const __CFArray *)CFRetain(v6)) == 0)
  {
LABEL_12:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    return;
  }
  CFArrayRef v8 = v7;
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(void *)(a2 + 16) = Mutable;
  }
  int v9 = *(unsigned __int8 *)(a1 + 80);
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v15 = ___CFPrefsGetSuiteContainer_block_invoke_2;
  v16 = &unk_1ECE007A8;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = v10;
  long long v19 = *(_OWORD *)(a1 + 48);
  uint64_t v20 = v11;
  CFDictionaryRef v21 = Mutable;
  if (!(void)v19) {
    ___CFPrefsGetSuiteContainer_block_invoke_cold_1();
  }
  if (v9)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    CFIndex Count = CFArrayGetCount(v8);
    v22[0] = off_1ECE0A5A0;
    v22[1] = 3221225472;
    v22[2] = ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke;
    v22[3] = &unk_1ECDFFC80;
    v22[4] = &v23;
    v22[5] = v19;
    CFArrayApply((uint64_t)v8, 0, Count, (uint64_t)v22);
    if (v24[3]) {
      BOOL v12 = v15((uint64_t)v14);
    }
    else {
      BOOL v12 = 0;
    }
    _Block_object_dispose(&v23, 8);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    CFDictionarySetValue(Mutable, *(const void **)(a1 + 48), &__kCFNull);
  }
  CFRelease(v8);
}

BOOL ___CFPrefsGetSuiteContainer_block_invoke_2(uint64_t a1)
{
  CFStringRef v3 = *(const __CFString **)(a1 + 40);
  v2 = *(const void **)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(v4, "connection");
    if (!value || (remote_connection = value, object_getClass(value) != (Class)off_1ECE0A678)) {
      ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1();
    }
  }
  xpc_connection_get_euid(remote_connection);
  CFURLRef v7 = _CFCreateContainerURLForSecurityApplicationIdentifierGroupIdentifierAndUser(v3, v2);
  if (!v7) {
    return 0;
  }
  CFURLRef v8 = v7;
  int v9 = CFURLGetFileSystemRepresentation(v7, 1u, *(UInt8 **)(a1 + 56), *(void *)(a1 + 64));
  BOOL v10 = v9 != 0;
  if (v9) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), *(const void **)(a1 + 48), v8);
  }
  CFRelease(v8);
  return v10;
}

void ___CFPrefsGetSuiteContainer_block_invoke_cold_1()
{
}

void ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end