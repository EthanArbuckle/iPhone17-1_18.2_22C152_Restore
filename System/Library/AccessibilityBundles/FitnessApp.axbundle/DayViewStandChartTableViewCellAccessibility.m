@interface DayViewStandChartTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation DayViewStandChartTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.DayViewStandChartTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.DayViewStandChartTableViewCell", @"chartView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FitnessApp.DayViewStandChartTableViewCell", @"idleHoursLabel", "@", 0);
  [v3 validateClass:@"FitnessApp.DayViewTitleAndValueLabelPair"];
}

- (id)accessibilityElements
{
  id v3 = [(DayViewStandChartTableViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_4];
  v4 = [v3 firstObject];

  [v4 setIsAccessibilityElement:1];
  v5 = [v4 _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  [v4 setAccessibilityLabel:v5];

  [v4 _accessibilityAddTrait:UIAccessibilityTraitHeader];
  v6 = [(DayViewStandChartTableViewCellAccessibility *)self safeValueForKey:@"idleHoursLabel"];
  v7 = [(DayViewStandChartTableViewCellAccessibility *)self safeValueForKey:@"chartView"];
  v8 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v7, v6);

  return v8;
}

BOOL __68__DayViewStandChartTableViewCellAccessibility_accessibilityElements__block_invoke(id a1, id a2, BOOL *a3)
{
  id v3 = a2;
  AXSafeClassFromString();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end