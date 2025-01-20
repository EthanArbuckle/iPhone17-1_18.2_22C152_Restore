@interface UIPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_accessibilityScrollStatus;
- (uint64_t)_axScrollPageController:(void *)a1;
- (void)_accessibilitySendScrollStatus;
- (void)_pageControlValueChanged:(id)a3;
@end

@implementation UIPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIPageViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v5 = "B";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPageViewController", @"_viewControllerBefore: viewController:", "B", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_pageControl", v3, 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setViewControllers: withScrollInDirection: animated: completion:", v3, "q", v5, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_pageControlValueChanged:", v6, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPageControl", @"_updateCurrentPageDisplayWithForceUpdate:", v6, v5, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilitySendScrollStatus
{
  id v3 = a1;
  if (a1)
  {
    if ([v3 accessibilityScreenChangeOnScroll])
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
    }
    else
    {
      id v2 = (id)[v3 _accessibilityScrollStatus];
      id v1 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v2];
      [v1 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21A70]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v1);
      objc_storeStrong(&v1, 0);
      objc_storeStrong(&v2, 0);
    }
  }
}

- (void)_pageControlValueChanged:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIPageViewControllerAccessibility;
  [(UIPageViewControllerAccessibility *)&v3 _pageControlValueChanged:location[0]];
  -[UIPageViewControllerAccessibility _accessibilitySendScrollStatus](v5);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScrollStatus
{
  v17 = self;
  v16[1] = (id)a2;
  char v15 = 0;
  objc_opt_class();
  id v8 = (id)[(UIPageViewControllerAccessibility *)v17 safeValueForKey:@"_pageControl"];
  id v14 = (id)__UIAccessibilityCastAsClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  if (v13)
  {
    uint64_t v12 = [v16[0] currentPage];
    uint64_t v11 = [v16[0] numberOfPages];
    v4 = NSString;
    id v7 = accessibilityLocalizedString(@"scroll.page.summary");
    id v6 = (id)AXFormatInteger();
    id v5 = (id)AXFormatInteger();
    id v18 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v6, v5);
  }
  else
  {
    v9.receiver = v17;
    v9.super_class = (Class)UIPageViewControllerAccessibility;
    id v18 = [(UIPageViewControllerAccessibility *)&v9 _accessibilityScrollStatus];
  }
  int v10 = 1;
  objc_storeStrong(v16, 0);
  id v2 = v18;

  return v2;
}

- (uint64_t)_axScrollPageController:(void *)a1
{
  v44 = a1;
  unsigned __int8 v43 = a2 & 1;
  if (a1)
  {
    id v6 = (id)[v44 safeValueForKey:@"_viewControllers"];
    id v42 = (id)[v6 lastObject];

    uint64_t v34 = 0;
    v35 = &v34;
    int v36 = 838860800;
    int v37 = 48;
    v38 = __Block_byref_object_copy__16;
    v39 = __Block_byref_object_dispose__16;
    id v40 = 0;
    uint64_t v26 = MEMORY[0x263EF8330];
    int v27 = -1073741824;
    int v28 = 0;
    v29 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke;
    v30 = &unk_2650AF010;
    v32[1] = &v34;
    id v31 = v44;
    char v33 = v43 & 1;
    v32[0] = v42;
    AXPerformSafeBlock();
    id v25 = (id)v35[5];
    objc_storeStrong(v32, 0);
    objc_storeStrong(&v31, 0);
    _Block_object_dispose(&v34, 8);
    objc_storeStrong(&v40, 0);
    id v41 = v25;
    if (v25)
    {
      id v24 = (id)[v44 safeValueForKey:@"_delegate"];
      id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObject:v41];
      if (objc_opt_respondsToSelector()) {
        [v24 pageViewController:v44 willTransitionToViewControllers:v23];
      }
      objc_initWeak(&v22, v44);
      v11[1] = (id)MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      id v14 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_2;
      char v15 = &unk_2650AF060;
      id v16 = v44;
      id v17 = v23;
      char v21 = v43 & 1;
      objc_copyWeak(&v20, &v22);
      id v18 = v24;
      id v19 = v42;
      AXPerformSafeBlock();
      char v10 = 0;
      objc_opt_class();
      id v5 = (id)[v44 safeValueForKey:@"_pageControl"];
      id v9 = (id)__UIAccessibilityCastAsClass();

      id v8 = v9;
      objc_storeStrong(&v9, 0);
      v11[0] = v8;
      uint64_t v4 = [v8 currentPage];
      if ((v43 ^ 1)) {
        int v2 = 1;
      }
      else {
        int v2 = -1;
      }
      uint64_t v7 = v4 + v2;
      if (v7 < 0) {
        uint64_t v7 = 0;
      }
      [v11[0] setCurrentPage:v7];
      [v11[0] _updateCurrentPageDisplayWithForceUpdate:1];
      -[UIPageViewControllerAccessibility _accessibilitySendScrollStatus](v44);
      char v45 = 1;
      objc_storeStrong(v11, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_destroyWeak(&v20);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_destroyWeak(&v22);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
    }
    else
    {
      char v45 = 0;
    }
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  else
  {
    char v45 = 0;
  }
  return v45 & 1;
}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _viewControllerBefore:*(unsigned char *)(a1 + 56) & 1 viewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_2(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = (*(unsigned char *)(a1 + 72) & 1) != 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_3;
  id v9 = &unk_2650AF038;
  objc_copyWeak(v12, (id *)(a1 + 64));
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v4 _setViewControllers:v2 withScrollInDirection:v3 animated:0 completion:&v5];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(v12);
}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_3(id *a1, char a2, char a3)
{
  int v7 = a1;
  id v11 = a1;
  unsigned __int8 v10 = a2 & 1;
  char v9 = a3 & 1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 6);
  if (location[0] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = v7[4];
    id v3 = location[0];
    int v4 = v10;
    id v6 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7[5], 0);
    objc_msgSend(v5, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", v3, v4 & 1);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v7 = self;
  SEL v6 = a2;
  int64_t v5 = a3;
  if (a3 == 1) {
    return -[UIPageViewControllerAccessibility _axScrollPageController:](v7, 1) & 1;
  }
  if (v5 == 2) {
    return -[UIPageViewControllerAccessibility _axScrollPageController:](v7, 0) & 1;
  }
  v4.receiver = v7;
  v4.super_class = (Class)UIPageViewControllerAccessibility;
  return [(UIPageViewControllerAccessibility *)&v4 accessibilityScroll:v5];
}

@end