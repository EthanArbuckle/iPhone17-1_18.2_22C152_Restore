@interface _UIFloatingTabBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3;
@end

@implementation _UIFloatingTabBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFloatingTabBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"_UIFloatingTabBar";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"sidebarButton", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"collectionView", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"pinnedItemsView", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"rightArrowButton", v3, 0);
  v4 = "B";
  [location[0] validateClass:v5 hasInstanceMethod:@"showsSidebarButton" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_updateSelectionViewVisibilityAnimated:", "v", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFloatingTabBarPageButton", @"contentOpacity", "d", 0);
  objc_storeStrong(v7, v6);
}

- (id)accessibilityElements
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)objc_opt_new();
  id v18 = (id)[(_UIFloatingTabBarAccessibility *)v20 safeUIViewForKey:@"leftArrowButton"];
  [v18 safeCGFloatForKey:@"contentOpacity"];
  if (v2 > 0.0) {
    [v19[0] axSafelyAddObject:v18];
  }
  if ([(_UIFloatingTabBarAccessibility *)v20 safeBoolForKey:@"showsSidebarButton"])
  {
    id v12 = (id)[(_UIFloatingTabBarAccessibility *)v20 safeUIViewForKey:@"sidebarButton"];
    objc_msgSend(v19[0], "axSafelyAddObject:");
  }
  char v16 = 0;
  objc_opt_class();
  id v11 = (id)[(_UIFloatingTabBarAccessibility *)v20 safeUIViewForKey:@"collectionView"];
  id v15 = (id)__UIAccessibilityCastAsClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  id v17 = v14;
  id v6 = v19[0];
  id v7 = (id)[v14 _accessibilitySortedElementsWithin];
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

  id v8 = v19[0];
  id v10 = (id)[(_UIFloatingTabBarAccessibility *)v20 safeUIViewForKey:@"pinnedItemsView"];
  id v9 = (id)[v10 subviews];
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

  id v13 = (id)[(_UIFloatingTabBarAccessibility *)v20 safeUIViewForKey:@"rightArrowButton"];
  [v13 safeCGFloatForKey:@"contentOpacity"];
  if (v3 > 0.0) {
    [v19[0] axSafelyAddObject:v13];
  }
  id v5 = v19[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);

  return v5;
}

- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarAccessibility;
  [(_UIFloatingTabBarAccessibility *)&v3 _updateSelectionViewVisibilityAnimated:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end