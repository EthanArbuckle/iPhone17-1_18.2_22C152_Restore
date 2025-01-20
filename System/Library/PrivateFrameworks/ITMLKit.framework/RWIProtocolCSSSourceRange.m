@interface RWIProtocolCSSSourceRange
@end

@implementation RWIProtocolCSSSourceRange

uint64_t __72__RWIProtocolCSSSourceRange_IKJSInspector__ik_rangeWithNewLineIndexSet___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 == (int)[*(id *)(a1 + 32) startLine]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 + 1;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) endLine];
  if (v7 == (int)result) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2 + 1;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == -100
    || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == -100)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

@end