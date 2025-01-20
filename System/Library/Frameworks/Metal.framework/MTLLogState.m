@interface MTLLogState
@end

@implementation MTLLogState

BOOL __25___MTLLogState_decodeLog__block_invoke(uint64_t a1, void *a2)
{
  *a2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  size_t v4 = *(void *)(v3 + 24);
  size_t v5 = strnlen(*(const char **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v4);
  *(void *)(v3 + 24) = v4 - (v5 + 1);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v5 + 1;
  return (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x8000000000000000) == 0
      && *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - 1) == 0;
}

@end