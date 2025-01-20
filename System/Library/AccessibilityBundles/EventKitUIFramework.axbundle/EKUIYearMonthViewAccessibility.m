@interface EKUIYearMonthViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsCurrentMonth;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation EKUIYearMonthViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIYearMonthView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKUIYearMonthView" hasInstanceVariable:@"_todayIndex" withType:"q"];
  [v3 validateClass:@"EKUIYearMonthView" hasInstanceVariable:@"_calendarDate" withType:"EKCalendarDate"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_axIsCurrentMonth
{
  v2 = [(EKUIYearMonthViewAccessibility *)self safeValueForKey:@"_todayIndex"];
  BOOL v3 = [v2 integerValue] != -1;

  return v3;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  BOOL v3 = [(EKUIYearMonthViewAccessibility *)self safeValueForKey:@"_calendarDate"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 date];
  v6 = MEMORY[0x24564B940]();

  if ([(EKUIYearMonthViewAccessibility *)self _axIsCurrentMonth])
  {
    v7 = accessibilityLocalizedString(@"current.month.indicator");
    uint64_t v8 = __UIAXStringForVariables();

    v6 = (void *)v8;
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  objc_opt_class();
  BOOL v3 = [(EKUIYearMonthViewAccessibility *)self safeValueForKey:@"_calendarDate"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = MEMORY[0x24564B930]([v4 month]);
  v6 = MEMORY[0x24564B970]();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"year.month.hint");
}

@end