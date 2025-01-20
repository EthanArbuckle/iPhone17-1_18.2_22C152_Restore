@interface CGPointGetDistanceToPointSymbolLoc
@end

@implementation CGPointGetDistanceToPointSymbolLoc

void *__getAX_CGPointGetDistanceToPointSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  result = dlsym(v2, "AX_CGPointGetDistanceToPoint");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAX_CGPointGetDistanceToPointSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end