@interface LargeMonthWeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axMonthHeader;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateDayNumberLabels;
- (void)_axUpdateMonthAXLabel;
- (void)_rebuildDayNumberLabels;
- (void)_updateMonthLabel;
- (void)reloadData;
@end

@implementation LargeMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeMonthWeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_CalendarEventsRow"];
  [v3 validateClass:@"EKEvent" isKindOfClass:@"EKCalendarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CalendarEventsRow", @"occurrenceBlocks", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendar", @"source", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendar", @"type", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarItem", @"calendar", "@", 0);
  [v3 validateClass:@"EKEvent" isKindOfClass:@"EKObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKObject", @"eventStore", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventStore", @"calendarsForEntityType:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKSource", @"isFacebookSource", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeMonthWeekView", @"_rebuildDayNumberLabels", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeMonthWeekView", @"reloadData", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeMonthWeekView", @"dayIndexForToday", "q", 0);
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_dayNumberLabels" withType:"NSArray"];
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_startDate" withType:"EKCalendarDate"];
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_endDate" withType:"EKCalendarDate"];
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_firstOfMonthLabel" withType:"UILabel"];
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_showingFirstDayOfMonthLabel" withType:"B"];
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_firstDayIndex" withType:"q"];
}

- (void)_axUpdateDayNumberLabels
{
  id v22 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_startDate"];
  id v3 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_dayNumberLabels"];
  v21 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_endDate"];
  uint64_t v4 = [v21 differenceInDays:v22] + 1;
  v5 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_firstDayIndex"];
  uint64_t v6 = [v5 integerValue];

  if ([v3 count] - v6 < (unint64_t)v4)
  {
    uint64_t v18 = v6;
    uint64_t v20 = v4;
    uint64_t v16 = [v3 count];
    _AXAssert();
  }
  if (objc_msgSend(v3, "count", v16, v18, v20) - v6 < (unint64_t)v4) {
    uint64_t v4 = [v3 count] - v6;
  }
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      v8 = [v22 calendarDateByAddingDays:v7 >> 32];
      v9 = [v8 date];
      v10 = _AXGetStringsForDate(v9);

      v11 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"dayIndexForToday"];
      uint64_t v12 = [v11 integerValue];

      if (v6 == v12)
      {
        v13 = accessibilityLocalizedString(@"today.indicator");
        v17 = v10;
        v19 = @"__AXStringForVariablesSentinel";
        uint64_t v14 = __UIAXStringForVariables();

        v10 = (void *)v14;
      }
      v15 = objc_msgSend(v3, "objectAtIndex:", v6, v17, v19);
      [v15 setAccessibilityLabel:v10];

      ++v6;
      v7 += 0x100000000;
      --v4;
    }
    while (v4);
  }
}

- (id)_axMonthHeader
{
  id v3 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_firstOfMonthLabel"];
  uint64_t v4 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_startDate"];
  v5 = [v4 date];
  uint64_t v6 = _AXGetYearlessStringForDay();
  [v3 setAccessibilityLabel:v6];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  [(LargeMonthWeekViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(LargeMonthWeekViewAccessibility *)self _axUpdateDayNumberLabels];
  [(LargeMonthWeekViewAccessibility *)self _axUpdateMonthAXLabel];
}

- (void)_axUpdateMonthAXLabel
{
  id v7 = [(LargeMonthWeekViewAccessibility *)self _axMonthHeader];
  objc_super v3 = [(LargeMonthWeekViewAccessibility *)self safeValueForKey:@"_startDate"];
  uint64_t v4 = [v3 safeValueForKey:@"date"];
  v5 = MEMORY[0x245654950]();
  [v7 setAccessibilityLabel:v5];

  uint64_t v6 = [v7 accessibilityTraits];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v6];
}

- (void)_rebuildDayNumberLabels
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  [(LargeMonthWeekViewAccessibility *)&v3 _rebuildDayNumberLabels];
  [(LargeMonthWeekViewAccessibility *)self _axUpdateDayNumberLabels];
}

- (void)_updateMonthLabel
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  [(LargeMonthWeekViewAccessibility *)&v3 _updateMonthLabel];
  [(LargeMonthWeekViewAccessibility *)self _axUpdateMonthAXLabel];
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthWeekViewAccessibility;
  [(LargeMonthWeekViewAccessibility *)&v3 reloadData];
  [(LargeMonthWeekViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LargeMonthWeekViewAccessibility;
  uint64_t v4 = -[LargeMonthWeekViewAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  [v4 _accessibilityVisibleFrame];
  if (CGRectIsEmpty(v9)) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

@end