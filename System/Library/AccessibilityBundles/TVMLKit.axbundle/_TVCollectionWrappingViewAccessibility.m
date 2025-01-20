@interface _TVCollectionWrappingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setHeaderView:(id)a3;
@end

@implementation _TVCollectionWrappingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCollectionWrappingView";
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
  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionWrappingViewAccessibility;
  [(_TVCollectionWrappingViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(_TVCollectionWrappingViewAccessibility *)self safeValueForKey:@"headerView"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 isAccessibilityElement])
  {
    uint64_t v5 = [v4 accessibilityTraits];
    [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v5];
  }
}

- (void)setHeaderView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionWrappingViewAccessibility;
  [(_TVCollectionWrappingViewAccessibility *)&v4 setHeaderView:a3];
  [(_TVCollectionWrappingViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end