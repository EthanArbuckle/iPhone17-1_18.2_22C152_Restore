@interface UIAccessibilityCastAsClassSymbolLoc
@end

@implementation UIAccessibilityCastAsClassSymbolLoc

void *__get__UIAccessibilityCastAsClassSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  result = dlsym(v2, "__UIAccessibilityCastAsClass");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get__UIAccessibilityCastAsClassSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end