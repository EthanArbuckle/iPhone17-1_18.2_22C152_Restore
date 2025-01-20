@interface SecKeychainCopyKeybagUUIDFromFileDescriptor
@end

@implementation SecKeychainCopyKeybagUUIDFromFileDescriptor

uint64_t ___SecKeychainCopyKeybagUUIDFromFileDescriptor_block_invoke(uint64_t a1)
{
  v1 = *(CFTypeRef **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___SecKeychainCopyKeybagUUIDFromFileDescriptor_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_10_10256;
  int v5 = *(_DWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___SecKeychainCopyKeybagUUIDFromFileDescriptor_block_invoke_3;
  v3[3] = &unk_1E547F9A8;
  v3[4] = *(void *)(a1 + 32);
  return securityd_send_sync_and_do(0x68u, v1, (uint64_t)v4, (uint64_t)v3);
}

uint64_t ___SecKeychainCopyKeybagUUIDFromFileDescriptor_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  return 1;
}

BOOL ___SecKeychainCopyKeybagUUIDFromFileDescriptor_block_invoke_3(uint64_t a1, void *a2, __CFString **a3)
{
  CFStringRef v4 = SecXPCDictionaryCopyString(a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return v4 != 0;
}

@end