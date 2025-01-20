@interface UIStatusBarForegroundViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_accessibilityFuzzyHitTestElements;
- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5;
@end

@implementation UIStatusBarForegroundViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarForegroundView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v30 = a4;
  BOOL v29 = a5;
  char v28 = 0;
  uint64_t v27 = [(UIStatusBarForegroundViewAccessibility *)v32 safeIvarForKey:@"_itemIsEnabled"];
  for (int i = 0; i < 46; ++i)
  {
    char v25 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    int v22 = 0x20000000;
    int v23 = 32;
    char v24 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    v16 = __77__UIStatusBarForegroundViewAccessibility__setStatusBarData_actions_animated___block_invoke;
    v17 = &unk_2650AF1E0;
    v18[1] = &v20;
    v18[0] = location[0];
    int v19 = i;
    AXPerformSafeBlock();
    char v12 = v21[3] & 1;
    objc_storeStrong(v18, 0);
    _Block_object_dispose(&v20, 8);
    char v25 = v12 & 1;
    if ((*(unsigned char *)(v27 + i) & 1) != (v12 & 1) && i != 32)
    {
      char v28 = 1;
      break;
    }
  }
  v11.receiver = v32;
  v11.super_class = (Class)UIStatusBarForegroundViewAccessibility;
  [(UIStatusBarForegroundViewAccessibility *)&v11 _setStatusBarData:location[0] actions:v30 animated:v29];
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  id v10 = v7;
  if (v28 & 1) != 0 && ([v10 _accessibilityViewIsVisible]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

uint64_t __77__UIStatusBarForegroundViewAccessibility__setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isItemEnabled:*(unsigned int *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)[(UIStatusBarForegroundViewAccessibility *)self safeValueForKey:@"subviews", a2, self];
}

@end