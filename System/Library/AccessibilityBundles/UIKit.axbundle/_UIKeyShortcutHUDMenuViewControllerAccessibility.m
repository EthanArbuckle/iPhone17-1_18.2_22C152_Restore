@interface _UIKeyShortcutHUDMenuViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDMenuViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIKeyShortcutHUDMenuViewController" hasInstanceVariable:@"_collectionView" withType:"UICollectionView"];
  objc_storeStrong(location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  [(_UIKeyShortcutHUDMenuViewControllerAccessibility *)&v3 viewWillDisappear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  [(_UIKeyShortcutHUDMenuViewControllerAccessibility *)&v5 viewWillAppear:a3];
  [(_UIKeyShortcutHUDMenuViewControllerAccessibility *)v8 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE68];
  id v4 = (id)[(_UIKeyShortcutHUDMenuViewControllerAccessibility *)v8 safeUIViewForKey:@"_collectionView"];
  UIAccessibilityPostNotification(notification, v4);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDMenuViewControllerAccessibility;
  [(_UIKeyShortcutHUDMenuViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  char v5 = 0;
  id v2 = (id)[(_UIKeyShortcutHUDMenuViewControllerAccessibility *)v9 safeUIViewForKey:@"_collectionView"];
  id v4 = (id)__UIAccessibilitySafeClass();

  id v3 = v4;
  objc_storeStrong(&v4, 0);
  id v6 = v3;
  [v3 setAccessibilityComparatorForSorting:&__block_literal_global_6];
  objc_storeStrong(&v6, 0);
}

@end