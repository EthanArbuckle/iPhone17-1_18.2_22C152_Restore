@interface CALayer
@end

@implementation CALayer

uint64_t __53__CALayer_UIFocusConformance__parentFocusEnvironment__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] conformsToProtocol:&unk_26F490598];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __80__CALayer_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) nextFocusedItem];
  char v5 = 0;
  char v4 = 0;
  if (v3 == *(id *)(a1 + 40))
  {
    id v6 = (id)[*(id *)(a1 + 40) _accessibilityParentView];
    char v5 = 1;
    char v4 = [v6 _accessibilityIsFKARunningForFocusItem];
  }
  if (v5) {

  }
  if (v4) {
    return [MEMORY[0x263F1C648] moveRingToFocusItem:*(void *)(a1 + 40)];
  }
  else {
    return [MEMORY[0x263F1C648] removeRingFromFocusItem:*(void *)(a1 + 40)];
  }
}

uint64_t __48__CALayer_UIFocusConformance__focusItemsInRect___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  char v7 = 0;
  if ([location[0] conformsToProtocol:&unk_26F4908D0])
  {
    objc_opt_class();
    char v4 = 1;
    if (objc_opt_isKindOfClass()) {
      char v4 = [a1[4] _accessibilityFKAShouldIncludeViewsAsElements];
    }
    char v7 = v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

@end