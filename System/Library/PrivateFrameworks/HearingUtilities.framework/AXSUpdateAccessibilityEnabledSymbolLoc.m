@interface AXSUpdateAccessibilityEnabledSymbolLoc
@end

@implementation AXSUpdateAccessibilityEnabledSymbolLoc

void *__get_AXSUpdateAccessibilityEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSUpdateAccessibilityEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end