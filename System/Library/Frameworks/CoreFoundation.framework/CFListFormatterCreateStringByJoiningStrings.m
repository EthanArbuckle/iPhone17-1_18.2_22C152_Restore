@interface CFListFormatterCreateStringByJoiningStrings
@end

@implementation CFListFormatterCreateStringByJoiningStrings

void ___CFListFormatterCreateStringByJoiningStrings_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    __cficu_ulistfmt_close(v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i < v3; ++i)
    {
      v5 = *(void **)(*(void *)(a1 + 48) + 8 * i);
      if (v5 && *(unsigned char *)(*(void *)(a1 + 56) + i))
      {
        free(v5);
        uint64_t v3 = *(void *)(a1 + 40);
      }
    }
  }
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 48));
  v6 = *(void **)(a1 + 64);

  free(v6);
}

@end