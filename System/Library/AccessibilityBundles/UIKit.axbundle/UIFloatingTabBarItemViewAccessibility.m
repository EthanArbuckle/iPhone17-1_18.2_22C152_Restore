@interface UIFloatingTabBarItemViewAccessibility
@end

@implementation UIFloatingTabBarItemViewAccessibility

void __63___UIFloatingTabBarItemViewAccessibility_accessibilityRowRange__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _indexPathForTabItem:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

uint64_t __68___UIFloatingTabBarItemViewAccessibility_accessibilityCustomActions__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __68___UIFloatingTabBarItemViewAccessibility_accessibilityCustomActions__block_invoke_2;
  v8 = &unk_2650ADFB0;
  id v9 = a1[4];
  v10[0] = a1[5];
  AXPerformSafeBlock();
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

uint64_t __68___UIFloatingTabBarItemViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFavoriteTab:", *(void *)(a1 + 40), a1, a1);
}

@end