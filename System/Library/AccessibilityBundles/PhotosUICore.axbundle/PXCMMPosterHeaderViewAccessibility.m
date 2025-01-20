@interface PXCMMPosterHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PXCMMPosterHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCMMPosterHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXCMMPosterHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PXCMMPosterHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  [v3 validateClass:@"PXCMMPosterHeaderView" hasInstanceVariable:@"_statusLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(PXCMMPosterHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _subtitleLabel, _statusLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end