@interface PromotionTileViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PromotionTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.PromotionTileView";
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
  v5.super_class = (Class)PromotionTileViewAccessibility;
  [(PromotionTileViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PromotionTileViewAccessibility *)self safeSwiftValueForKey:@"accessoryLabel"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityLocalizedString(@"close");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end