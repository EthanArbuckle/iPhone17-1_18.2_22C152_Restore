@interface LUIPaneHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
@end

@implementation LUIPaneHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIPaneHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)LUIPaneHeaderViewAccessibility;
  [(LUIPaneHeaderViewAccessibility *)&v3 didMoveToWindow];
  [(LUIPaneHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)LUIPaneHeaderViewAccessibility;
  [(LUIPaneHeaderViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  objc_super v3 = [(LUIPaneHeaderViewAccessibility *)self safeValueForKey:@"mTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
}

@end