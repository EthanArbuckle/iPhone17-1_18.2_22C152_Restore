@interface CFBundleSearchForLocalizedString
@end

@implementation CFBundleSearchForLocalizedString

uint64_t ___CFBundleSearchForLocalizedString_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = ___CFBundleSearchForLocalizedString_block_invoke_2;
  v6[3] = &unk_1ECDFFAF8;
  uint64_t v9 = a2;
  uint64_t v10 = a4;
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v7 = v4;
  return CFDictionaryApply(a3, (uint64_t)v6);
}

uint64_t ___CFBundleSearchForLocalizedString_block_invoke_2(uint64_t a1, const void *a2, CFTypeRef cf1, unsigned char *a4)
{
  uint64_t result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if (result)
  {
    if (*(void *)(a1 + 48))
    {
      uint64_t result = (uint64_t)CFRetain(a2);
      **(void **)(a1 + 48) = result;
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t result = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 64));
      **(void **)(a1 + 56) = result;
    }
    *a4 = 1;
    **(unsigned char **)(a1 + 72) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end