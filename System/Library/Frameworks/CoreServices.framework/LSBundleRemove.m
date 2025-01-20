@interface LSBundleRemove
@end

@implementation LSBundleRemove

void ___LSBundleRemove_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v5 = (void *)MEMORY[0x18530F680]();
  if ((*(void *)(_LSBundleGet(*(void **)(a1 + 32), a3) + 172) & 0x400000000000) != 0) {
    _CSStoreWriteToUnit();
  }
}

uint64_t ___LSBundleRemove_block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(_DWORD *)(a3 + 168) == 14 && *(_DWORD *)(a3 + 300) == *(_DWORD *)(result + 340))
  {
    v7 = _LSAppProtectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      ___LSBundleRemove_block_invoke_2_cold_1(a2, v7);
    }

    result = _CSStoreWriteToUnit();
    *a5 = 1;
  }
  return result;
}

uint64_t ___LSBundleRemove_block_invoke_155(uint64_t a1)
{
  return _LSClaimRemove(*(void **)(a1 + 32));
}

uint64_t ___LSBundleRemove_block_invoke_2_156(uint64_t a1, uint64_t a2, int a3)
{
  return _UTTypeRemove(*(void **)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    v5 = *(__CFDictionary **)(a1 + 40);
    if (v5) {
      LSPluginAddInfoToPayloadDict(*(void **)(a1 + 32), v5, a3, 0, 0);
    }
  }
  v6 = *(void **)(a1 + 32);

  _LSPluginRemove(v6, a3);
}

void ___LSBundleRemove_block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
}

void ___LSBundleRemove_block_invoke_5(uint64_t a1, uint64_t a2)
{
}

uint64_t ___LSBundleRemove_block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  return _LSPlistRemove(*(void *)(a1 + 32), a3);
}

void ___LSBundleRemove_block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Resetting locked/hidden flags for unit: %u", (uint8_t *)v2, 8u);
}

@end