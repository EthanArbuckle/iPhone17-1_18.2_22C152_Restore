@interface BSXPCDecodeObject
@end

@implementation BSXPCDecodeObject

BOOL ___BSXPCDecodeObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = _BSXPCDecodeObjectFromContext(*(void *)(a1 + 32), a3, 0, *(void *)(a1 + 48), 0);
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    v7 = BSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134218242;
      uint64_t v10 = a2;
      __int16 v11 = 2112;
      uint64_t v12 = a3;
      _os_log_error_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_ERROR, "Array element %zu failed to decode: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6 != 0;
}

BOOL ___BSXPCDecodeObject_block_invoke_242(uint64_t a1, uint64_t a2)
{
  v3 = [NSString stringWithUTF8String:a2];
  v4 = _BSXPCDecodeObjectForKey(*(void *)(a1 + 32), v3, *(void *)(a1 + 56), 0);
  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  }

  return v4 != 0;
}

@end