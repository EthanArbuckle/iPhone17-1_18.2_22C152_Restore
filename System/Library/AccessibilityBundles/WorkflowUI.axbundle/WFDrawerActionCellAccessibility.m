@interface WFDrawerActionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation WFDrawerActionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell" hasSwiftField:@"label" withSwiftType:"UILabel"];
  [v3 validateClass:@"_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell" hasSwiftField:@"infoButton" withSwiftType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(WFDrawerActionCellAccessibility *)self safeSwiftValueForKey:@"label"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(WFDrawerActionCellAccessibility *)self safeSwiftValueForKey:@"infoButton"];
  v5 = accessibilityLocalizedString(@"more.info");
  [v4 setAccessibilityLabel:v5];

  [v3 axSafelyAddObject:v4];

  return v3;
}

@end