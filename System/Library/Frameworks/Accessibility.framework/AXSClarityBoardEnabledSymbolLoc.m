@interface AXSClarityBoardEnabledSymbolLoc
@end

@implementation AXSClarityBoardEnabledSymbolLoc

void *__get_AXSClarityBoardEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSClarityBoardEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSClarityBoardEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end