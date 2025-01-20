@interface CHListSummaryTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CHListSummaryTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHListSummaryTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CHWorkoutSummaryTabbedLabelContainer" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CHListSummaryTableViewCell" hasInstanceVariable:@"_numberOfWorkoutsLabel" withType:"_CHWorkoutSummaryTabbedLabelContainer"];
  [v3 validateClass:@"CHListSummaryTableViewCell" hasInstanceVariable:@"_activeEnergyLabel" withType:"_CHWorkoutSummaryTabbedLabelContainer"];
  [v3 validateClass:@"CHListSummaryTableViewCell" hasInstanceVariable:@"_durationLabel" withType:"_CHWorkoutSummaryTabbedLabelContainer"];
  [v3 validateClass:@"CHListSummaryTableViewCell" hasInstanceVariable:@"_distanceLabel" withType:"_CHWorkoutSummaryTabbedLabelContainer"];
  [v3 validateClass:@"CHListSummaryTableViewCell" hasInstanceVariable:@"_paceLabel" withType:"_CHWorkoutSummaryTabbedLabelContainer"];
}

- (id)accessibilityElements
{
  id v3 = [(CHListSummaryTableViewCellAccessibility *)self safeUIViewForKey:@"_numberOfWorkoutsLabel"];
  v4 = [(CHListSummaryTableViewCellAccessibility *)self safeUIViewForKey:@"_durationLabel"];
  v5 = [(CHListSummaryTableViewCellAccessibility *)self safeUIViewForKey:@"_activeEnergyLabel"];
  v6 = [(CHListSummaryTableViewCellAccessibility *)self safeUIViewForKey:@"_distanceLabel"];
  v7 = [(CHListSummaryTableViewCellAccessibility *)self safeUIViewForKey:@"_paceLabel"];
  v8 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 5, v3, v4, v5, v6, v7);
  v9 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_5);

  return v9;
}

BOOL __64__CHListSummaryTableViewCellAccessibility_accessibilityElements__block_invoke(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
  return [(UIView *)a2 _accessibilityViewIsVisible];
}

@end