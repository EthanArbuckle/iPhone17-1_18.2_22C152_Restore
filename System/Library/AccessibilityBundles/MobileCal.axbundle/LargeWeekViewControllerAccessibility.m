@interface LargeWeekViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
@end

@implementation LargeWeekViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeWeekViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WeekAllDayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"_dayIndexForToday", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeWeekViewController", @"selectDate: animated:", "v", "@", "B", 0);
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)LargeWeekViewControllerAccessibility;
  [(LargeWeekViewControllerAccessibility *)&v5 selectDate:a3 animated:a4];
  if ([(LargeWeekViewControllerAccessibility *)self _accessibilityBoolValueForKey:@"_AXShouldFocusOnTodayStorageKey"])AXPerformBlockOnMainThreadAfterDelay(); {
}
  }

void __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
  v2 = [v1 _accessibilityFindSubviewDescendant:&__block_literal_global_5];

  id v3 = [v2 safeValueForKey:@"_dayIndexForToday"];
  uint64_t v4 = [v3 integerValue];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_3;
  v6[3] = &__block_descriptor_40_e8_B16__0_8l;
  v6[4] = v4;
  objc_super v5 = [v2 _accessibilityFindDescendant:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v5);
}

BOOL __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Weekalldayview.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"_dayIndexForToday"];
    BOOL v4 = [v3 integerValue] != -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __60__LargeWeekViewControllerAccessibility_selectDate_animated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 dayIndex] == *(void *)(a1 + 32);

  return v4;
}

@end