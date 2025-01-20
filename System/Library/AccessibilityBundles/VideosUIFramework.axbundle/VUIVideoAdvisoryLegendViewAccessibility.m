@interface VUIVideoAdvisoryLegendViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VUIVideoAdvisoryLegendViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIVideoAdvisoryLegendView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(VUIVideoAdvisoryLegendViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"legendDescriptionLabel"];
}

@end