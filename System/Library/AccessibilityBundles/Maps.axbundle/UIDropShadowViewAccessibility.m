@interface UIDropShadowViewAccessibility
@end

@implementation UIDropShadowViewAccessibility

uint64_t __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:2 animated:1];
}

uint64_t __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:3 animated:1];
}

uint64_t __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:1 animated:1];
}

uint64_t __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLayoutIfSupported:2 animated:1];
}

id __87__UIDropShadowViewAccessibility_Maps_AppKit__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _accessibilityContaineeLayout];

  return AXMapsStringForContaineeLayout(v2);
}

uint64_t __71__UIDropShadowViewAccessibility_Maps_AppKit_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissContainee];
}

@end