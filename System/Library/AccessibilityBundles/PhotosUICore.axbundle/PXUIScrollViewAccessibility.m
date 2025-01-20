@interface PXUIScrollViewAccessibility
@end

@implementation PXUIScrollViewAccessibility

uint64_t __66___PXUIScrollViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _axCompareView:a2 toView:a3];
}

uint64_t __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E3C60](@"PXGView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained subviews];
  }
  else {
  v3 = [MEMORY[0x263EFF8C0] array];
  }

  return v3;
}

uint64_t __68___PXUIScrollViewAccessibility__accessibilityIsInFeedViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E3C60](@"PXFeedViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2;
  v6[3] = &__block_descriptor_48_e8_B16__0_8l;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = [a2 _accessibilityFindDescendant:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

BOOL __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(CGPoint *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement])
  {
    [v3 accessibilityFrame];
    BOOL v4 = CGRectContainsPoint(v6, a1[2]);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end