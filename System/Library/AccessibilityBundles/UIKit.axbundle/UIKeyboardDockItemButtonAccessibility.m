@interface UIKeyboardDockItemButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKeyboardDockItemButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardDockItemButton";
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
  v6 = self;
  SEL v5 = a2;
  unint64_t v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDockItemButtonAccessibility;
  unint64_t v4 = [(UIKeyboardDockItemButtonAccessibility *)&v3 accessibilityTraits];
  v4 |= *MEMORY[0x263F219B8];
  return v4 | *MEMORY[0x263F21A38];
}

@end