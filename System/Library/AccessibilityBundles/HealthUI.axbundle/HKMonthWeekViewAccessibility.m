@interface HKMonthWeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation HKMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMonthWeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarWeekView", @"monthTitleView", "@", 0);
  [v3 validateClass:@"HKMonthWeekView" isKindOfClass:@"HKCalendarWeekView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKMonthTitleView", @"monthTitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityElements
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(HKMonthWeekViewAccessibility *)self safeValueForKey:@"monthTitleView"];
  v5 = [v4 safeValueForKey:@"monthTitle"];

  if ([v5 _accessibilityViewIsVisible])
  {
    [v3 axSafelyAddObject:v5];
    [v5 setAccessibilityContainer:self];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(HKMonthWeekViewAccessibility *)self safeValueForKey:@"layer", 0];
  v7 = [v6 safeValueForKey:@"sublayers"];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        MEMORY[0x24564F8C0](@"HKMonthDayCell");
        if (objc_opt_isKindOfClass())
        {
          [v3 addObject:v12];
          [v12 setAccessibilityContainer:self];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v3;
}

@end