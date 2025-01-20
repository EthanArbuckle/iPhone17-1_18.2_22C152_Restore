@interface CardTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CardTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.CardTitleView";
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
  v4.receiver = self;
  v4.super_class = (Class)CardTitleViewAccessibility;
  [(CardTitleViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CardTitleViewAccessibility *)self safeValueForKey:@"title"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end