@interface DismissibleTileHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation DismissibleTileHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.DismissibleTileHeaderView";
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
  v5.super_class = (Class)DismissibleTileHeaderViewAccessibility;
  [(DismissibleTileHeaderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(DismissibleTileHeaderViewAccessibility *)self safeValueForKey:@"accessibilityAccessoryLabel"];
  v4 = accessibilityLocalizedString(@"close");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end