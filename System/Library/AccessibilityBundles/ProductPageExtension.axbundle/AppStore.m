@interface AppStore
@end

@implementation AppStore

uint64_t __122__AppStore_UINavigationControllerAccessibility__navigationBarSizeForViewController_proposedHeight_allowRubberBandStretch___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) getValue:*(void *)(*(void *)(a1 + 40) + 8) + 32 size:24];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

void __76__AppStore_UITransitionViewAccessibility__isSuperviewOfSearchControllerView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  MEMORY[0x24565D250](@"_UISearchControllerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

@end