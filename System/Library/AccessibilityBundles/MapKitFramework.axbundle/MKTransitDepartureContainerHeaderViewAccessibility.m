@interface MKTransitDepartureContainerHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation MKTransitDepartureContainerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKTransitDepartureContainerHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKTransitDepartureContainerHeaderView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"MKTransitDepartureContainerHeaderView" hasInstanceVariable:@"_containerTitleLabel" withType:"_MKUILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MKTransitDepartureContainerHeaderViewAccessibility *)self safeUIViewForKey:@"_containerTitleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)automationElements
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 subviews];

  return v3;
}

@end