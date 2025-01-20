@interface DayViewTitleAndValueLabelPairAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation DayViewTitleAndValueLabelPairAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.DayViewTitleAndValueLabelPair";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(DayViewTitleAndValueLabelPairAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

@end