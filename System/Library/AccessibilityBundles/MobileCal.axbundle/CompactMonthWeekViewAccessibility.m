@interface CompactMonthWeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_axContainsToday;
- (BOOL)_axShowsMonthHeader;
- (BOOL)_axShowsWeekNumber;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityMonthViewController;
- (id)_axDate;
- (id)_axMonthHeader;
- (id)_axWeekNumber;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDayNumbers;
- (void)_axAnnotateMonthHeader;
- (void)_axInvalidateChildren;
- (void)_initializeDays;
- (void)_initializeMonthNameLabel;
- (void)_reloadMonthNameLabel;
- (void)dealloc;
- (void)setCalendarDate:(id)a3;
- (void)setCompressedVerticalMode:(BOOL)a3;
@end

@implementation CompactMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompactMonthWeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_monthNameLabel" withType:"UILabel"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_days" withType:"NSArray"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_startCalendarDate" withType:"EKCalendarDate"];
  [v3 validateClass:@"InfiniteScrollViewController" hasInstanceVariable:@"_model" withType:"CUIKCalendarModel"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_weekNumberLabel" withType:"UILabel"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_containsFirstDayOfMonth" withType:"B"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_compressedVerticalMode" withType:"B"];
  [v3 validateClass:@"CompactWidthMonthViewController" hasInstanceVariable:@"_dividedListMode" withType:"B"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_showWeekNumber" withType:"B"];
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_containsToday" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekView", @"setCalendarDate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekView", @"_initializeMonthNameLabel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekView", @"_initializeDays", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekView", @"_reloadMonthNameLabel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactMonthWeekView", @"setCompressedVerticalMode:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"selectedDate", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateMonthHeader];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateDayNumbers];
}

- (id)_axMonthHeader
{
  return (id)[(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_monthNameLabel"];
}

- (id)_axDate
{
  v2 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_startCalendarDate"];
  objc_super v3 = [v2 safeValueForKey:@"date"];

  return v3;
}

- (BOOL)_axShowsMonthHeader
{
  int v3 = [(CompactMonthWeekViewAccessibility *)self safeBoolForKey:@"_containsFirstDayOfMonth"];
  if (v3) {
    LOBYTE(v3) = [(CompactMonthWeekViewAccessibility *)self safeBoolForKey:@"_compressedVerticalMode"] ^ 1;
  }
  return v3;
}

- (BOOL)_axShowsWeekNumber
{
  return [(CompactMonthWeekViewAccessibility *)self safeBoolForKey:@"_showWeekNumber"];
}

- (BOOL)_axContainsToday
{
  return [(CompactMonthWeekViewAccessibility *)self safeBoolForKey:@"_containsToday"];
}

- (id)_axWeekNumber
{
  return (id)[(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_weekNumberLabel"];
}

- (void)_axAnnotateMonthHeader
{
  if ([(CompactMonthWeekViewAccessibility *)self _axShowsMonthHeader])
  {
    int v3 = [(CompactMonthWeekViewAccessibility *)self _axMonthHeader];
    v4 = [(CompactMonthWeekViewAccessibility *)self _axDate];
    v5 = MEMORY[0x245654950]();
    [v3 setAccessibilityLabel:v5];

    v6 = (void *)MEMORY[0x263EFF8C0];
    objc_opt_class();
    v7 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_startCalendarDate"];
    v8 = __UIAccessibilityCastAsClass();

    v9 = MEMORY[0x245654940]([v8 month]);
    objc_opt_class();
    v10 = [(CompactMonthWeekViewAccessibility *)self _axMonthHeader];
    v11 = __UIAccessibilityCastAsClass();

    v12 = [v11 text];
    v13 = objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v9, v12);
    [v3 setAccessibilityUserInputLabels:v13];

    uint64_t v14 = [v3 accessibilityTraits];
    [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v14];
    [v3 _accessibilitySetIsSpeakThisElement:0];
  }
}

- (void)_axAnnotateDayNumbers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_days", 0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setAccessibilityContainer:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_axInvalidateChildren
{
}

- (id)accessibilityElements
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263F81490];
  uint64_t v4 = [(CompactMonthWeekViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    uint64_t v5 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_days"];
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    [(CompactMonthWeekViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:*v3];
    if ([(CompactMonthWeekViewAccessibility *)self _axShowsMonthHeader])
    {
      uint64_t v7 = [(CompactMonthWeekViewAccessibility *)self _axMonthHeader];
      [v6 addObject:v7];
    }
    if ([(CompactMonthWeekViewAccessibility *)self _axShowsWeekNumber])
    {
      char v27 = 0;
      long long v8 = [(CompactMonthWeekViewAccessibility *)self _axWeekNumber];
      long long v9 = __UIAccessibilitySafeClass();

      BOOL v10 = [(CompactMonthWeekViewAccessibility *)self _axContainsToday];
      long long v11 = NSString;
      if (v10) {
        v12 = @"currentweek.number";
      }
      else {
        v12 = @"week.number";
      }
      uint64_t v13 = accessibilityLocalizedString(v12);
      uint64_t v14 = [v9 text];
      v15 = objc_msgSend(v11, "stringWithFormat:", v13, v14);

      [v9 setAccessibilityLabel:v15];
      [v6 axSafelyAddObject:v9];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v21 isAccessibilityElement]) {
            [v6 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v18);
    }
  }

  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  int v3 = [(CompactMonthWeekViewAccessibility *)self _accessibilityMonthViewController];
  if ([v3 safeBoolForKey:@"_dividedListMode"])
  {
    uint64_t v4 = [v3 safeValueForKey:@"_model"];
    uint64_t v5 = [v4 safeValueForKey:@"selectedDate"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_startCalendarDate"];
      uint64_t v7 = [v5 month];
      unsigned __int8 v8 = v7 != [v6 month];
    }
    else
    {
      _AXAssert();
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CompactMonthWeekViewAccessibility;
    unsigned __int8 v8 = [(CompactMonthWeekViewAccessibility *)&v10 accessibilityElementsHidden];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(CompactMonthWeekViewAccessibility *)self safeValueForKey:@"_days"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v8 dealloc];
}

- (void)_initializeMonthNameLabel
{
  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v3 _initializeMonthNameLabel];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateMonthHeader];
  [(CompactMonthWeekViewAccessibility *)self _axInvalidateChildren];
}

- (void)_initializeDays
{
  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v3 _initializeDays];
  [(CompactMonthWeekViewAccessibility *)self _axInvalidateChildren];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateDayNumbers];
}

- (void)_reloadMonthNameLabel
{
  v3.receiver = self;
  v3.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v3 _reloadMonthNameLabel];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateMonthHeader];
}

- (void)setCalendarDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v4 setCalendarDate:a3];
  [(CompactMonthWeekViewAccessibility *)self _axAnnotateMonthHeader];
  [(CompactMonthWeekViewAccessibility *)self _axInvalidateChildren];
}

- (void)setCompressedVerticalMode:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactMonthWeekViewAccessibility;
  [(CompactMonthWeekViewAccessibility *)&v4 setCompressedVerticalMode:a3];
  [(CompactMonthWeekViewAccessibility *)self _axInvalidateChildren];
}

- (id)_accessibilityMonthViewController
{
  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_super v3 = [(CompactMonthWeekViewAccessibility *)v2 _accessibilityViewController];
      if (v3)
      {
        NSClassFromString(&cfstr_Compactwidthmo_0.isa);
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      uint64_t v4 = [(CompactMonthWeekViewAccessibility *)v2 accessibilityContainer];

      v2 = (CompactMonthWeekViewAccessibility *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    objc_super v3 = 0;
  }

  return v3;
}

@end