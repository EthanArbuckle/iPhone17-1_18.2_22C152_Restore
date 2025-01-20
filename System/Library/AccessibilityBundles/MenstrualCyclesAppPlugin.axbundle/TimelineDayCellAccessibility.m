@interface TimelineDayCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCycleDayViewModel;
- (id)_axFertileLevel:(unint64_t)a3;
- (id)_axInformationLogged:(id)a3;
- (id)_axMensturationLevel:(unint64_t)a3;
- (id)_axPregnancyState:(unint64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TimelineDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MenstrualCyclesAppPlugin.TimelineDayCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.TimelineDayCell", @"axCycleDayViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MenstrualCyclesAppPlugin.TimelineDayCell", @"axCycleDay", "@", 0);
  [v3 validateClass:@"HKMCDayViewModel" hasInstanceVariable:@"_menstruationLevel" withType:"NSUInteger"];
  [v3 validateClass:@"HKMCDayViewModel" hasInstanceVariable:@"_fertileWindowLevel" withType:"NSUInteger"];
  [v3 validateClass:@"HKMCDayViewModel" hasInstanceVariable:@"_pregnancyState" withType:"NSUInteger"];
  [v3 validateClass:@"HKMCDayViewModel" hasInstanceVariable:@"_daySummary" withType:"HKMCDaySummary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMCDaySummary", @"isSupplementaryDataLogged", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(TimelineDayCellAccessibility *)self safeValueForKey:@"axCycleDay"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263EFF910] date];
  id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
  v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v8 = [v7 components:4 fromDate:v5];
  v9 = [v7 dateFromComponents:v8];
  if ([v4 compare:v9] == 1) {
    _AXGetStringForDay(v4);
  }
  else {
  v10 = _AXGetStringForDayAndYear();
  }

  return v10;
}

- (id)accessibilityValue
{
  id v3 = [(TimelineDayCellAccessibility *)self _axCycleDayViewModel];
  v4 = -[TimelineDayCellAccessibility _axMensturationLevel:](self, "_axMensturationLevel:", [v3 safeIntegerForKey:@"_menstruationLevel"]);
  v5 = -[TimelineDayCellAccessibility _axFertileLevel:](self, "_axFertileLevel:", [v3 safeIntegerForKey:@"_fertileWindowLevel"]);
  id v6 = -[TimelineDayCellAccessibility _axPregnancyState:](self, "_axPregnancyState:", [v3 safeIntegerForKey:@"_pregnancyState"]);
  v7 = [v3 safeValueForKey:@"_daySummary"];
  v10 = [(TimelineDayCellAccessibility *)self _axInformationLogged:v7];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TimelineDayCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TimelineDayCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_axCycleDayViewModel
{
  return (id)[(TimelineDayCellAccessibility *)self safeValueForKey:@"axCycleDayViewModel"];
}

- (id)_axInformationLogged:(id)a3
{
  if ([a3 safeBoolForKey:@"isSupplementaryDataLogged"])
  {
    accessibilityLocalizedString(@"data.logged");
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = &stru_26F7027B8;
  }

  return v3;
}

- (id)_axMensturationLevel:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_265131400[a3 - 1]);
  }
  return v4;
}

- (id)_axFertileLevel:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_265131420[a3 - 1]);
  }
  return v4;
}

- (id)_axPregnancyState:(unint64_t)a3
{
  if (a3 - 2 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_265131438[a3 - 2]);
  }
  return v4;
}

@end