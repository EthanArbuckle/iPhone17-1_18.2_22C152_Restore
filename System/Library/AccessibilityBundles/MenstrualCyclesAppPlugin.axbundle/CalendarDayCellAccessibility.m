@interface CalendarDayCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDayShowsDayIndicator;
- (BOOL)isAccessibilityElement;
- (NSDate)accessibilityDate;
- (id)_axDayLocalizedText;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityDate:(id)a3;
@end

@implementation CalendarDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.CalendarDayCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSDate)accessibilityDate
{
}

- (void)setAccessibilityDate:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.CalendarDayCell", @"axDayShowsDayIndicator", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.CalendarDayCell", @"axDayLocalizedText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CalendarDayCellAccessibility *)self accessibilityDate];
  id v3 = _AXGetStringForDay(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(CalendarDayCellAccessibility *)self _axDayShowsDayIndicator];
  v7.receiver = self;
  v7.super_class = (Class)CalendarDayCellAccessibility;
  unint64_t v4 = [(CalendarDayCellAccessibility *)&v7 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v5 = 0;
  }
  return v5 | v4 | *MEMORY[0x263F1CEE8];
}

- (BOOL)_axDayShowsDayIndicator
{
  return [(CalendarDayCellAccessibility *)self safeBoolForKey:@"axDayShowsDayIndicator"];
}

- (id)_axDayLocalizedText
{
  return (id)[(CalendarDayCellAccessibility *)self safeValueForKey:@"axDayLocalizedText"];
}

@end