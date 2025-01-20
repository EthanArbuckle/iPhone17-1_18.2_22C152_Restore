@interface WDManualDataEntryTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4;
@end

@implementation WDManualDataEntryTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDManualDataEntryTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WDManualDataEntryTableViewCell" hasInstanceVariable:@"_valueField" withType:"UITextField"];
  [v3 validateClass:@"WDManualDataEntryTableViewCell" hasInstanceVariable:@"_displayNameLabel" withType:"UILabel"];
  [v3 validateClass:@"WDManualDataEntryTableViewCell" hasInstanceVariable:@"_unitLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDManualDataEntryTableViewCell", @"_setupUIWithDisplayName: unitName:", "v", "@", "@", 0);
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)WDManualDataEntryTableViewCellAccessibility;
  [(WDManualDataEntryTableViewCellAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WDManualDataEntryTableViewCellAccessibility *)self safeValueForKey:@"_valueField"];
  v4 = [(WDManualDataEntryTableViewCellAccessibility *)self safeValueForKey:@"_displayNameLabel"];
  v5 = [(WDManualDataEntryTableViewCellAccessibility *)self safeValueForKey:@"_unitLabel"];
  [v4 setIsAccessibilityElement:0];
  [v5 setIsAccessibilityElement:0];
  v6 = [(WDManualDataEntryTableViewCellAccessibility *)self _accessibilityValueForKey:@"AXDisplayLabelOverrideKey"];
  if (!v6)
  {
    v6 = [v4 accessibilityLabel];
  }
  v8 = [v5 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  objc_msgSend(v3, "setAccessibilityLabel:", v7, v8, @"__AXStringForVariablesSentinel");
}

- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WDManualDataEntryTableViewCellAccessibility;
  [(WDManualDataEntryTableViewCellAccessibility *)&v5 _setupUIWithDisplayName:a3 unitName:a4];
  [(WDManualDataEntryTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end