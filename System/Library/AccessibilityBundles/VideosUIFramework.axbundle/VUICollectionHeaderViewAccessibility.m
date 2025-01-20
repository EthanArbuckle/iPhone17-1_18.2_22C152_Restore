@interface VUICollectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupSubviews;
@end

@implementation VUICollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUICollectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VUICollectionHeaderViewAccessibility;
  [(VUICollectionHeaderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VUICollectionHeaderViewAccessibility *)self _accessibilityMarkupSubviews];
}

- (void)_accessibilityMarkupSubviews
{
  objc_opt_class();
  objc_super v3 = [(VUICollectionHeaderViewAccessibility *)self safeValueForKey:@"titleTextView"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
}

@end