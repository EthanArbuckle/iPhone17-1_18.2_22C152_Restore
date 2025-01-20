@interface BOOL
@end

@implementation BOOL

size_t __cftype_to_BOOL_cftype_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SecXPCDictionarySetPListWithRepair(a2, "query", *(const __CFString **)(a1 + 32), a3, a5, a6, a7, a8);
}

BOOL __cftype_to_BOOL_cftype_error_request_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  v3 = *(void **)(a1 + 32);
  return !v3 || SecXPCDictionaryCopyPListOptional(a2, v3, a3);
}

uint64_t __simple_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL __info_array_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = CreateXPCObjectWithArrayOfPeerInfo(*(const __CFArray **)(a1 + 32), a3);
  if (v6) {
    xpc_dictionary_set_value(v5, "peer-infos", v6);
  }

  return v6 != 0;
}

uint64_t __info_array_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __uint64_t_to_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  return 1;
}

uint64_t __uint64_t_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL __keybag_and_BOOL_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    xpc_dictionary_set_value(v3, "keybag", v4);
  }
  xpc_dictionary_set_BOOL(v3, "includeV0", *(unsigned char *)(a1 + 40));

  return v4 != 0;
}

BOOL __keybag_and_BOOL_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __recovery_and_BOOL_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  }
  else
  {
    UInt8 bytes = 0;
    CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &bytes, 1);
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5) {
      CFRelease(v5);
    }
  }
  if (v4)
  {
    xpc_dictionary_set_value(v3, "RecoveryPublicKey", v4);
  }
  return v4 != 0;
}

BOOL __recovery_and_BOOL_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

uint64_t __label_and_password_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = *(const __CFString **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __label_and_password_to_BOOL_error_request_block_invoke_2;
  v9[3] = &unk_1E547E7B0;
  id v10 = v3;
  id v5 = v3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 0x40000000;
  v11[2] = __CFStringPerformWithCString_block_invoke;
  v11[3] = &unk_1E5484C20;
  v11[4] = v9;
  CFStringPerformWithCStringAndLength(v4, (uint64_t)v11);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  xpc_dictionary_set_data(v5, "password", BytePtr, Length);

  return 1;
}

uint64_t __label_and_password_to_BOOL_error_request_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __label_and_password_to_BOOL_error_request_block_invoke_2(uint64_t a1, char *string)
{
}

uint64_t __label_and_password_and_dsid_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = *(const __CFString **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_2;
  v13[3] = &unk_1E547E7B0;
  id v5 = v3;
  id v14 = v5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 0x40000000;
  v17 = __CFStringPerformWithCString_block_invoke;
  v18 = &unk_1E5484C20;
  v19 = v13;
  CFStringPerformWithCStringAndLength(v4, (uint64_t)&v15);
  CFStringRef v6 = *(const __CFString **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_3;
  v11[3] = &unk_1E547E7B0;
  id v12 = v5;
  id v7 = v5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 0x40000000;
  v17 = __CFStringPerformWithCString_block_invoke;
  v18 = &unk_1E5484C20;
  v19 = v11;
  CFStringPerformWithCStringAndLength(v6, (uint64_t)&v15);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  xpc_dictionary_set_data(v7, "password", BytePtr, Length);

  return 1;
}

uint64_t __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_4(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_2(uint64_t a1, char *string)
{
}

void __label_and_password_and_dsid_to_BOOL_error_request_block_invoke_3(uint64_t a1, char *string)
{
}

BOOL __cfdata_and_int_error_request_returns_BOOL_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    xpc_dictionary_set_value(v3, "data", v4);
    xpc_dictionary_set_uint64(v3, "version", *(unsigned int *)(a1 + 40));
  }
  return v4 != 0;
}

uint64_t __cfdata_and_int_error_request_returns_BOOL_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

BOOL __peer_info_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, CFTypeRef *a3)
{
  id v5 = a2;
  id v12 = SOSPeerInfoCopyEncodedData(*(void *)(a1 + 32), v6, a3, v7, v8, v9, v10, v11);
  if (v12)
  {
    v13 = v12;
    BOOL v14 = SecXPCDictionarySetData(v5, "peer-info", v12, (__CFString **)a3);
    CFRelease(v13);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __peer_info_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __BOOL_and_error_request_returns_BOOL_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  return 1;
}

uint64_t __BOOL_and_error_request_returns_BOOL_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

uint64_t __data_data_array_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v5 = *(const __CFData **)(a1 + 32);
  id v6 = a2;
  SecXPCDictionarySetData(v6, "normIssuer", v5, a3);
  SecXPCDictionarySetData(v6, "serialNum", *(CFDataRef *)(a1 + 40), a3);
  SecXPCDictionarySetPListWithRepair(v6, "accessGroups", *(const __CFString **)(a1 + 48), a3, v7, v8, v9, v10);

  return 1;
}

uint64_t __data_data_array_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

BOOL __client_data_data_BOOL_to_data_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v6 = *(const __CFData **)(a1 + 32);
  if (!v6 || (BOOL result = SecXPCDictionarySetData(a2, "keybag", v6, a3)))
  {
    CFDataRef v8 = *(const __CFData **)(a1 + 40);
    if (!v8 || (BOOL result = SecXPCDictionarySetData(a2, "password", v8, a3)))
    {
      xpc_dictionary_set_BOOL(a2, "emcsbackup", *(unsigned char *)(a1 + 48));
      return 1;
    }
  }
  return result;
}

BOOL __client_data_data_BOOL_to_data_error_request_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v4 = SecXPCDictionaryCopyData(a2, "status", a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return v4 != 0;
}

BOOL __string_data_data_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  BOOL result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"backup", *(const __CFString **)(a1 + 32), a3);
  if (result)
  {
    CFDataRef v7 = *(const __CFData **)(a1 + 40);
    if (!v7 || (BOOL result = SecXPCDictionarySetData(a2, "keybag", v7, a3), result))
    {
      CFDataRef v8 = *(const __CFData **)(a1 + 48);
      if (v8)
      {
        return SecXPCDictionarySetData(a2, "data", v8, a3);
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

BOOL __string_data_data_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __string_string_data_data_data_to_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  if (!SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"backup", *(const __CFString **)(a1 + 32), a3)) {
    return 0;
  }
  CFStringRef v6 = *(const __CFString **)(a1 + 40);
  if (v6)
  {
    if (!SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"digest", v6, a3)) {
      return 0;
    }
  }
  if (!SecXPCDictionarySetData(a2, "keybag", *(CFDataRef *)(a1 + 48), a3)
    || !SecXPCDictionarySetData(a2, "password", *(CFDataRef *)(a1 + 56), a3))
  {
    return 0;
  }
  CFDataRef v7 = *(const __CFData **)(a1 + 64);

  return SecXPCDictionarySetData(a2, "data", v7, a3);
}

BOOL __string_string_data_data_data_to_BOOL_error_request_block_invoke_2(int a1, xpc_object_t xdict)
{
  return xpc_dictionary_get_BOOL(xdict, "status");
}

BOOL __data_data_to_data_data_BOOL_error_request_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v6 = *(const __CFData **)(a1 + 32);
  if (!v6 || (BOOL result = SecXPCDictionarySetData(a2, "otrsess", v6, a3), result))
  {
    CFDataRef v8 = *(const __CFData **)(a1 + 40);
    if (v8)
    {
      return SecXPCDictionarySetData(a2, "data", v8, a3);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

BOOL __data_data_to_data_data_BOOL_error_request_block_invoke_2(void *a1, xpc_object_t xdict, __CFString **a3)
{
  BOOL v6 = xpc_dictionary_get_BOOL(xdict, "status");
  if (v6)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = SecXPCDictionaryCopyData(xdict, "otrsess", a3);
    *(void *)(*(void *)(a1[5] + 8) + 24) = SecXPCDictionaryCopyData(xdict, "data", a3);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "otrrdy");
  }
  return v6;
}

uint64_t __int_to_BOOL_error_request_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  return 1;
}

uint64_t __int_to_BOOL_error_request_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __to_BOOL_error_request_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    BOOL v3 = *a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

BOOL __string_cert_to_BOOL_BOOL_error_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  BOOL result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"domain", *(const __CFString **)(a1 + 32), a3);
  if (result)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    return SecXPCDictionarySetCertificate(a2, v7, a3);
  }
  return result;
}

uint64_t __string_cert_to_BOOL_BOOL_error_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  if (*(void *)(a1 + 32)) {
    **(unsigned char **)(a1 + 32) = xpc_dictionary_get_BOOL(xdict, "status");
  }
  return 1;
}

BOOL __string_cert_to_BOOL_error_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  BOOL result = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"domain", *(const __CFString **)(a1 + 32), a3);
  if (result)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    return SecXPCDictionarySetCertificate(a2, v7, a3);
  }
  return result;
}

@end