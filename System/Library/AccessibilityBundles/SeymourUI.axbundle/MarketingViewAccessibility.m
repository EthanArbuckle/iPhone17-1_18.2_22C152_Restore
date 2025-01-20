@interface MarketingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MarketingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.MarketingView";
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
  v5.receiver = self;
  v5.super_class = (Class)MarketingViewAccessibility;
  [(MarketingViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(MarketingViewAccessibility *)self safeValueForKey:@"logoImageView"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF48]];
  v4 = accessibilityLocalizedString(@"product.logo");
  [v3 setAccessibilityLabel:v4];
}

@end