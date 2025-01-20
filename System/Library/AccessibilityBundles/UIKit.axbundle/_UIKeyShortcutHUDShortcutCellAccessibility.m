@interface _UIKeyShortcutHUDShortcutCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIKeyShortcutHUDShortcutCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDShortcutCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIKeyShortcutHUDShortcutCell";
  v3 = @"UICollectionViewCell";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v7 = "@";
  [location[0] validateClass:@"UICollectionViewCell" hasInstanceMethod:@"contentConfiguration" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"shortcutInputAccessoryView", v7, 0);
  v5 = @"UIListContentConfiguration";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"secondaryText", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIKeyShortcutHUDShortcutInputAccessoryView", @"shortcutInputView", v7, 0);
  v6 = @"_UIKeyShortcutHUDShortcutInputView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"inputLabel", v7, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = (id)[(_UIKeyShortcutHUDShortcutCellAccessibility *)self safeValueForKey:@"contentConfiguration"];
  id v11 = (id)[v12[0] safeStringForKey:@"text"];
  id v10 = (id)[v12[0] safeStringForKey:@"secondaryText"];
  id v9 = (id)[(_UIKeyShortcutHUDShortcutCellAccessibility *)v13 safeValueForKeyPath:@"shortcutInputAccessoryView.shortcutInputView"];
  id v3 = (id)[v9 safeValueForKey:@"modifiersLabel"];
  id v8 = (id)[v3 accessibilityLabel];

  id v5 = (id)[v9 safeValueForKey:@"inputLabel"];
  id v4 = (id)[v5 accessibilityLabel];
  id v7 = (id)[v4 lowercaseString];

  id v6 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end