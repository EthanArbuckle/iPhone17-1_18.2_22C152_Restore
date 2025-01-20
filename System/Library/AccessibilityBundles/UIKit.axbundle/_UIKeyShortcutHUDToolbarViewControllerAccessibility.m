@interface _UIKeyShortcutHUDToolbarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didCompleteSearchTransition;
- (void)setSearching:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDToolbarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDToolbarViewController";
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
  v3 = @"_UIKeyShortcutHUDToolbarViewController";
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"searchBar", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"searchButton", v6, 0);
  v4 = "v";
  [location[0] validateClass:v3 hasInstanceMethod:@"didCompleteSearchTransition" withFullSignature:0];
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"setSearching:", v4, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDViewController", @"isSearching", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDSearchBar", @"searchTextField", v6, 0);
  objc_storeStrong(v8, v7);
}

- (void)didCompleteSearchTransition
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDToolbarViewControllerAccessibility;
  [(_UIKeyShortcutHUDToolbarViewControllerAccessibility *)&v6 didCompleteSearchTransition];
  id v4 = (id)[(_UIKeyShortcutHUDToolbarViewControllerAccessibility *)v8 safeValueForKey:@"delegate"];
  char v5 = [v4 safeBoolForKey:@"isSearching"];

  if (v5)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
    id v3 = (id)[(_UIKeyShortcutHUDToolbarViewControllerAccessibility *)v8 safeValueForKeyPath:@"searchBar.searchTextField"];
    UIAccessibilityPostNotification(notification, v3);
  }
}

- (void)setSearching:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDToolbarViewControllerAccessibility;
  [(_UIKeyShortcutHUDToolbarViewControllerAccessibility *)&v5 setSearching:a3];
  if (!v6)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
    id v4 = (id)[(_UIKeyShortcutHUDToolbarViewControllerAccessibility *)v8 safeValueForKey:@"searchButton"];
    UIAccessibilityPostNotification(notification, v4);
  }
}

@end