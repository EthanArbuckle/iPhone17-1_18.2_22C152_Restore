@interface SK
@end

@implementation SK

uint64_t __53__SK_UIBarButtonItemAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = NSStringFromSelector((SEL)[*(id *)(a1 + 32) action]);

  return MEMORY[0x270F9A758]();
}

void __82__SK_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _accessibilitySortedElementsWithinWithOptions__IsIBooks = [v0 isEqualToString:*MEMORY[0x263F227E8]];
}

uint64_t __82__SK_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __82__SK_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _accessibilityIndexPathOfDirectSubviewForDescendantElement:a2 withElementKind:0];
  uint64_t v4 = [*(id *)(a1 + 32) _accessibilityDescendantElementAtIndexPathIsValid:v3] ^ 1;

  return v4;
}

@end