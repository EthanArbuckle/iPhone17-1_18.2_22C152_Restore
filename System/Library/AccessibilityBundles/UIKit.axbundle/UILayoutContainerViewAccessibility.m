@interface UILayoutContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation UILayoutContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILayoutContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UILayoutContainerViewAccessibility;
  return [(UILayoutContainerViewAccessibility *)&v3 shouldGroupAccessibilityChildren];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UILayoutContainerViewAccessibility;
  [(UILayoutContainerViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v8 = (id)[(UILayoutContainerViewAccessibility *)v11 safeValueForKey:@"delegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[v8 view];
    [v2 _accessibilitySetIsSortPriorityContainer:1];

    char v7 = 0;
    if (([v8 safeBoolForKey:@"isNavigationBarHidden"] & 1) == 0)
    {
      id v6 = (id)[v8 safeValueForKey:@"navigationBar"];
      [v6 _accessibilitySetSortPriority:1000];
      char v7 = 1;
      objc_storeStrong(&v6, 0);
    }
    id v5 = (id)[v8 safeValueForKey:@"_topPalette"];
    if (v5
      && ([v5 safeBoolForKey:@"isAttached"] & 1) != 0
      && ([v5 safeBoolForKey:@"paletteIsHidden"] & 1) == 0)
    {
      [v5 _accessibilitySetSortPriority:999];
      char v7 = 1;
    }
    if (([v8 safeBoolForKey:@"isToolbarHidden"] & 1) == 0)
    {
      id v4 = (id)[v8 safeValueForKey:@"toolbar"];
      [v4 _accessibilitySetSortPriority:997];
      char v7 = 1;
      objc_storeStrong(&v4, 0);
    }
    if (v7)
    {
      id v3 = (id)[v8 safeValueForKey:@"navigationTransitionView"];
      [v3 _accessibilitySetSortPriority:998];
      [v3 setShouldGroupAccessibilityChildren:1];
      objc_storeStrong(&v3, 0);
    }
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v8, 0);
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = (id)[MEMORY[0x263F1CB68] viewControllerForView:v19];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v15 = (id)[v16 viewControllers];
  id v5 = location[0];
  id v7 = (id)[v15 firstObject];
  id v6 = (id)[v7 view];
  char v14 = objc_msgSend(v5, "_accessibilityIsDescendantOfElement:") & 1;

  id v8 = v17;
  id v10 = (id)[v15 firstObject];
  id v9 = (id)[v10 view];
  char v13 = objc_msgSend(v8, "_accessibilityIsDescendantOfElement:") & 1;

  if (v14 & 1) == 0 || (v13)
  {
    if ((v14 & 1) != 0 || (v13 & 1) == 0)
    {
      int v12 = 0;
    }
    else
    {
      int64_t v20 = 1;
      int v12 = 1;
    }
  }
  else
  {
    int64_t v20 = -1;
    int v12 = 1;
  }
  objc_storeStrong(&v15, 0);
  if (!v12) {
LABEL_10:
  }
    int64_t v20 = 0;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (void)layoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UILayoutContainerViewAccessibility;
  [(UILayoutContainerViewAccessibility *)&v2 layoutSubviews];
  [(UILayoutContainerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

@end