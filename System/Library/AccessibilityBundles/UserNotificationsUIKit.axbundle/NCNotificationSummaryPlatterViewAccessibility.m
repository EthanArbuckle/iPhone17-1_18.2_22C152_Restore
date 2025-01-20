@interface NCNotificationSummaryPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationSummaryPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationSummaryPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationSummaryPlatterView" hasInstanceVariable:@"_summaryContentView" withType:"NCNotificationSummaryContentView"];
  [v3 validateClass:@"NCNotificationSummaryContentView" hasInstanceVariable:@"_summaryDateLabel" withType:"UILabel<BSUIDateLabel>"];
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationSummaryPlatterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"summaryTitle, summary"];
  v6 = [(NCNotificationSummaryPlatterViewAccessibility *)self safeValueForKeyPath:@"_summaryContentView._summaryDateLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"notification.cell.collapsed.hint");
}

@end