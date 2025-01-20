@interface CFGenerateReport
@end

@implementation CFGenerateReport

uint64_t ____CFGenerateReport_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  if (!*v3) {
    return 1;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  BOOL v6 = __CFADD__(v5, a2);
  uint64_t v7 = v5 + a2;
  uint64_t result = v6;
  *(void *)(v4 + 24) = v7;
  return result;
}

@end