@interface SBElasticSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation SBElasticSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBElasticSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

@end