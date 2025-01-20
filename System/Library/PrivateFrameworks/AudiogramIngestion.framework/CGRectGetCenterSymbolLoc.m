@interface CGRectGetCenterSymbolLoc
@end

@implementation CGRectGetCenterSymbolLoc

void *__getAX_CGRectGetCenterSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  result = dlsym(v2, "AX_CGRectGetCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAX_CGRectGetCenterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end