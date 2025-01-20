@interface HKMonthDayCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKMonthDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMonthDayCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMonthDayCell" isKindOfClass:@"HKCalendarDayCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarDayCell", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarDayCell", @"representsToday", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarDayCell", @"circle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(HKMonthDayCellAccessibility *)self safeValueForKey:@"date"];
  if (v3)
  {
    v4 = AXDateStringForFormat();
    if ([(HKMonthDayCellAccessibility *)self safeBoolForKey:@"representsToday"])
    {
      v5 = accessibilityLocalizedString(@"today.button");
      __AXStringForVariables();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)HKMonthDayCellAccessibility;
  unint64_t v3 = [(HKMonthDayCellAccessibility *)&v7 accessibilityTraits];
  objc_opt_class();
  v4 = [(HKMonthDayCellAccessibility *)self safeValueForKey:@"circle"];
  v5 = __UIAccessibilityCastAsClass();

  if (v5 && ([v5 isHidden] & 1) == 0) {
    v3 |= *MEMORY[0x263F1CF38];
  }

  return v3;
}

@end