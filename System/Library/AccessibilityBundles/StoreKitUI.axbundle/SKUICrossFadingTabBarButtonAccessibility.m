@interface SKUICrossFadingTabBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUICrossFadingTabBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUICrossFadingTabBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUICrossFadingTabBarButton" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SKUICrossFadingTabBarButton" hasInstanceVariable:@"_standardTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUICrossFadingTabBarButton" hasInstanceVariable:@"_selectedTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUICrossFadingTabBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUICrossFadingTabBar", @"tabBarButtons", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SKUICrossFadingTabBarButtonAccessibility *)self safeValueForKey:@"_standardTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  id v3 = [(SKUICrossFadingTabBarButtonAccessibility *)self safeValueForKey:@"_standardTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(SKUICrossFadingTabBarButtonAccessibility *)self safeValueForKey:@"_selectedTitleLabel"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = *MEMORY[0x263F813F8];
  [v6 alpha];
  double v9 = v8;
  [v4 alpha];
  uint64_t v10 = *MEMORY[0x263F1CF38];
  if (v9 <= v11) {
    uint64_t v10 = 0;
  }
  unint64_t v12 = v10 | v7;

  return v12;
}

- (_NSRange)accessibilityRowRange
{
  objc_opt_class();
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 superview];
  v5 = [v4 safeValueForKey:@"tabBarButtons"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 indexOfObject:self];
  uint64_t v8 = [v6 count];

  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

@end