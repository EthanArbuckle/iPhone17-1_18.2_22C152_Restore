@interface SecKeychainWriteBackupToFileDescriptor
@end

@implementation SecKeychainWriteBackupToFileDescriptor

uint64_t ___SecKeychainWriteBackupToFileDescriptor_block_invoke(uint64_t a1)
{
  v1 = *(CFTypeRef **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___SecKeychainWriteBackupToFileDescriptor_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_4_10249;
  long long v5 = *(_OWORD *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainWriteBackupToFileDescriptor_block_invoke_3;
  v3[3] = &unk_1E547F8C8;
  v3[4] = *(void *)(a1 + 32);
  return securityd_send_sync_and_do(9u, v1, (uint64_t)v4, (uint64_t)v3);
}

BOOL ___SecKeychainWriteBackupToFileDescriptor_block_invoke_2(uint64_t a1, void *a2, __CFString **a3)
{
  CFDataRef v6 = *(const __CFData **)(a1 + 32);
  if (!v6 || (BOOL result = SecXPCDictionarySetData(a2, "keybag", v6, a3)))
  {
    CFDataRef v8 = *(const __CFData **)(a1 + 40);
    if (!v8 || (BOOL result = SecXPCDictionarySetData(a2, "password", v8, a3)))
    {
      xpc_dictionary_set_fd(a2, "fileDescriptor", *(_DWORD *)(a1 + 48));
      return 1;
    }
  }
  return result;
}

BOOL ___SecKeychainWriteBackupToFileDescriptor_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "status");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end