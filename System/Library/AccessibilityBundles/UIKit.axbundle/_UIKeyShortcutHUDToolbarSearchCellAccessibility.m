@interface _UIKeyShortcutHUDToolbarSearchCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIKeyShortcutHUDToolbarSearchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDToolbarSearchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIKeyShortcutHUDViewController";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDViewController", @"isSearching", "B", 0);
  objc_storeStrong(v5, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCellAccessibility;
  [(_UIKeyShortcutHUDToolbarSearchCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(_UIKeyShortcutHUDToolbarSearchCellAccessibility *)v5 _accessibilityDescendantOfType:objc_opt_class()];
  [v2 setIsAccessibilityElement:0];
  objc_storeStrong(&v2, 0);
}

- (BOOL)isAccessibilityElement
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(_UIKeyShortcutHUDToolbarSearchCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_7 startWithSelf:0];
  id v3 = (id)[v5[0] _accessibilityViewController];
  int v4 = [v3 safeBoolForKey:@"isSearching"] ^ 1;

  objc_storeStrong(v5, 0);
  return v4 & 1;
}

- (id)accessibilityLabel
{
  return (id)accessibilityUIKitLocalizedString();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end