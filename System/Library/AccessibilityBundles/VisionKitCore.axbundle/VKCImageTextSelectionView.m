@interface VKCImageTextSelectionView
@end

@implementation VKCImageTextSelectionView

void __67__VKCImageTextSelectionView_iOSAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if ([v8 length])
  {
    v7 = -[AXVKCImageTextSelectionViewAccessibilityElement initWithAccessibilityContainer:textRange:]([AXVKCImageTextSelectionViewAccessibilityElement alloc], "initWithAccessibilityContainer:textRange:", *(void *)(a1 + 32), a3, a4);
    [(AXVKCImageTextSelectionViewAccessibilityElement *)v7 set_accessibilityContent:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

@end