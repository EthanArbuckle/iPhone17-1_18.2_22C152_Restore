@interface LSFindBundleWithInfo
@end

@implementation LSFindBundleWithInfo

uint64_t ___LSFindBundleWithInfo_NoIOFiltered_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(_DWORD *)(a3 + 12))
  {
    v5 = (void *)result;
    if (*(void *)(a3 + 288) == *(void *)(result + 56))
    {
      int v6 = a2;
      result = *(void *)(result + 32);
      if (!result
        || (result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(result + 16))(result, v5[8], a2, a3),
            result))
      {
        *(_DWORD *)(*(void *)(v5[5] + 8) + 24) = v6;
        *(unsigned char *)(*(void *)(v5[6] + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
  return result;
}

@end