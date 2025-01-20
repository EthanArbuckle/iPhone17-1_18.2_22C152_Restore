@interface MUHoursSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MUHoursSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUHoursSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUHoursSummaryView" hasInstanceVariable:@"_expanded" withType:"BOOL"];
  [v3 validateClass:@"MUHoursSummaryView" hasInstanceVariable:@"_titleLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUHoursSummaryView" hasInstanceVariable:@"_hoursLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUHoursSummaryView" hasInstanceVariable:@"_openStateLabel" withType:"UIView<MULabelViewProtocol>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  if ([(MUHoursSummaryViewAccessibility *)self safeBoolForKey:@"_expanded"]) {
    v2 = @"hours.view.collapse.hint";
  }
  else {
    v2 = @"hours.view.expand.hint";
  }

  return accessibilityLocalizedString(v2);
}

- (id)accessibilityValue
{
  if ([(MUHoursSummaryViewAccessibility *)self safeBoolForKey:@"_expanded"]) {
    v2 = @"HOURS_EXPANDED";
  }
  else {
    v2 = @"HOURS_COLLAPSED";
  }

  return accessibilityLocalizedString(v2);
}

- (id)accessibilityLabel
{
  return (id)[(MUHoursSummaryViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _hoursLabel, _openStateLabel"];
}

@end