@interface APBonjourBrowserCacheEnsureStarted
@end

@implementation APBonjourBrowserCacheEnsureStarted

uint64_t ___APBonjourBrowserCacheEnsureStarted_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (*(void *)(result + 232) == *(void *)(a1 + 32))
  {
    if (*(_WORD *)(result + 40)) {
      return _APBonjourBrowserHandleDeviceEvent((const void *)result, 0, a2, *(const void **)(result + 80));
    }
  }
  return result;
}

uint64_t ___APBonjourBrowserCacheEnsureStarted_block_invoke_2(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (*(void *)(result + 232) == *(void *)(a1 + 32))
  {
    if (*(_WORD *)(result + 40)) {
      return _APBonjourBrowserHandleDeviceEvent((const void *)result, 1, a2, *(const void **)(result + 80));
    }
  }
  return result;
}

void ___APBonjourBrowserCacheEnsureStarted_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 == *(void **)(*(void *)(a1 + 40) + 232))
    {
      [v3 invalidate];

      *(void *)(*(void *)(a1 + 40) + 232) = 0;
    }
  }
}

@end