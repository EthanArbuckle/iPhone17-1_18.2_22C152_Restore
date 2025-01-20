@interface _UIKeyShortcutHUDToolbarCategoryCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIKeyShortcutHUDToolbarCategoryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyShortcutHUDToolbarCategoryCell";
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
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDToolbarCategoryCellAccessibility;
  return [(_UIKeyShortcutHUDToolbarCategoryCellAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CEE8];
}

@end