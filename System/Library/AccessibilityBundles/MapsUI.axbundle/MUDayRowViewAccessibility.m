@interface MUDayRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MUDayRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUDayRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUDayRowView" hasInstanceVariable:@"_headerLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUDayRowView" hasInstanceVariable:@"_dayLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUDayRowView" hasInstanceVariable:@"_hoursLabel" withType:"UIView<MULabelViewProtocol>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MUDayRowViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_headerLabel, _dayLabel, _hoursLabel"];
}

@end