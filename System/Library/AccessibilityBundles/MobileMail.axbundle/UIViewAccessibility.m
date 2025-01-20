@interface UIViewAccessibility
@end

@implementation UIViewAccessibility

uint64_t __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:*(void *)(a1 + 32)];
  v2 = (void *)accessibilityElements_showDraftsElement;
  accessibilityElements_showDraftsElement = v1;

  [(id)accessibilityElements_showDraftsElement setIsAccessibilityElement:1];
  v3 = (void *)accessibilityElements_showDraftsElement;
  uint64_t v4 = *MEMORY[0x263F1CEE8];

  return [v3 setAccessibilityTraits:v4];
}

uint64_t __63__UIViewAccessibility__MobileMail__UIKit_accessibilityElements__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessibilityElementsHidden] ^ 1;
}

@end