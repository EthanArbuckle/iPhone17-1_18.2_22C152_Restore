@interface EKDateTimeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation EKDateTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDateTimeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKDateTimeCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"EKDateTimeCell" hasInstanceVariable:@"_datePicker" withType:"UIDatePicker"];
  [v3 validateClass:@"EKDateTimeCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"_UIDatePickerCompactDateLabel"];
  [v3 validateClass:@"_UIDatePickerCompactTimeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3 = [(EKDateTimeCellAccessibility *)self accessibilityUserDefinedLabel];
  if (!v3)
  {
    v4 = [(EKDateTimeCellAccessibility *)self safeValueForKey:@"_titleLabel"];
    v5 = [v4 accessibilityLabel];

    v6 = [(EKDateTimeCellAccessibility *)self safeValueForKey:@"_datePicker"];
    v7 = [v6 accessibilityLabel];

    if (v7)
    {
      v13 = v7;
      v15 = @"__AXStringForVariablesSentinel";
      id v3 = __UIAXStringForVariables();
    }
    else
    {
      v8 = [(EKDateTimeCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_0];
      v9 = [(EKDateTimeCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_293];
      v10 = [v9 accessibilityLabel];
      v15 = [v8 accessibilityLabel];
      v16 = @"__AXStringForVariablesSentinel";
      v13 = v10;
      id v3 = __UIAXStringForVariables();
    }
  }
  v14 = [(EKDateTimeCellAccessibility *)self _accessibilityValueForKey:@"AXAddendumString", v13, v15, v16];
  v11 = __UIAXStringForVariables();

  return v11;
}

uint64_t __49__EKDateTimeCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uidatepickerco.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__EKDateTimeCellAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uidatepickerco_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end