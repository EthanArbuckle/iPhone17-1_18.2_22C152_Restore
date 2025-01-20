@interface UITransitionViewAccessibility
@end

@implementation UITransitionViewAccessibility

void __84__UITransitionViewAccessibility__Podcasts__UIKit__isSuperviewOfSearchControllerView__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  MEMORY[0x24565B6C0](@"_UISearchControllerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t __83__UITransitionViewAccessibility__Podcasts__UIKit__foundSearchControllerDimmingView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentification];
  uint64_t v3 = [v2 isEqualToString:@"AXUISearchControllerDimmingView"];

  return v3;
}

@end