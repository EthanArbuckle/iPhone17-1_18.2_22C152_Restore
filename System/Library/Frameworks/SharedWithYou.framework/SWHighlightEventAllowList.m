@interface SWHighlightEventAllowList
@end

@implementation SWHighlightEventAllowList

uint64_t __48___SWHighlightEventAllowList_eventClassForType___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 integerValue];
  if (result == *(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

@end