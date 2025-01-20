@interface GEOConfigKeyHelper
@end

@implementation GEOConfigKeyHelper

void __43___GEOConfigKeyHelper__lookupKeyProperties__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)&a3 & 0xFF0000;
  if ((*(void *)&a3 & 0xFF0000uLL) >= 0x80000)
  {
    if ((*(void *)&a3 & 0xFF0000) == 0x80000)
    {
      uint64_t v7 = 8;
    }
    else
    {
      if (v6 != 983040) {
        goto LABEL_11;
      }
      uint64_t v7 = 2;
    }
  }
  else if (v6 == 0x20000)
  {
    uint64_t v7 = 6;
  }
  else
  {
    if (v6 != 0x40000) {
      goto LABEL_11;
    }
    uint64_t v7 = 7;
  }
  *(void *)(*(void *)(a1 + 32) + 16) = v7;
LABEL_11:
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v5;
}

@end