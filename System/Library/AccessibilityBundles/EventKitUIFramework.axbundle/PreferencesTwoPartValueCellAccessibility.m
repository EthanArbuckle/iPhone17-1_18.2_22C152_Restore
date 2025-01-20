@interface PreferencesTwoPartValueCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
@end

@implementation PreferencesTwoPartValueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PreferencesTwoPartValueCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventDateEditItem", @"_endDateIsBeforeStartDate", "B", 0);
  [v3 validateClass:@"PreferencesTwoPartValueCell" isKindOfClass:@"EKUITableViewCell"];
  [v3 validateClass:@"EKUITableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesTwoPartValueCell", @"twoPartTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesTwoPartValueCell", @"largePart2TextLabel", "@", 0);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"add.event.tablecells.hint");
}

- (id)accessibilityLabel
{
  id v3 = [(PreferencesTwoPartValueCellAccessibility *)self safeValueForKey:@"textLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(PreferencesTwoPartValueCellAccessibility *)self safeValueForKey:@"twoPartTextLabel"];
  v6 = [v5 accessibilityLabel];

  if (![v6 length])
  {
    uint64_t v7 = [(PreferencesTwoPartValueCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"detailTextLabel, largePart2TextLabel"];

    v6 = (void *)v7;
  }
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(PreferencesTwoPartValueCellAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];
  v4 = MEMORY[0x24564B970]();

  return v4;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end