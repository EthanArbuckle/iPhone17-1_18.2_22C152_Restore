@interface NSData
@end

@implementation NSData

uint64_t __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_33()
{
  qword_1EB38E138 = objc_alloc_init(AMSThreadSafeDictionary);
  return MEMORY[0x1F41817F8]();
}

uint64_t __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke()
{
  qword_1EB38E128 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.AESKeyGeneration", MEMORY[0x1E4F14430]);
  return MEMORY[0x1F41817F8]();
}

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_37(uint64_t a1)
{
  CFTypeRef result = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), &result);
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = result;
  }
}

void __55__NSData_AMSFPDI__ams_createDataWithFPDIResult_length___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  pspdoawubd0((uint64_t)&v2);
}

void __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_38(uint64_t a1)
{
  CFTypeRef result = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), &result);
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E4F3B558], (const void *)[*(id *)(a1 + 56) _accessibleAttributeForDataProtectionClass:*(void *)(a1 + 64)]), CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E4F3BD38], (const void *)objc_msgSend(*(id *)(a1 + 56), "ams_generateEncryptionKey")), (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 48), &result)) == 0))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = result;
  }
}

@end