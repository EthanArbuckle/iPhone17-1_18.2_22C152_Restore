@interface LargeMonthViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation LargeMonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LargeMonthViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LargeMonthWeekView"];
  [v3 validateClass:@"LargeMonthViewController" isKindOfClass:@"InfiniteScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"showDate: animated: completionBlock:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeMonthWeekView", @"todayDay", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LargeMonthWeekView", @"dayIndexForToday", "q", 0);
  [v3 validateClass:@"LargeMonthWeekView" hasInstanceVariable:@"_dayNumberLabels" withType:"NSArray"];
  [v3 validateClass:@"LargeMonthViewController" hasInstanceVariable:@"_draggedStartDate" withType:"EKCalendarDate"];
}

- (id)_axTopWeekViewWithTopPoint:(CGPoint)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(LargeMonthViewControllerAccessibility *)self safeValueForKey:@"_views", 0];
  id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = [MEMORY[0x263F81198] options];
        [v8 setShouldOnlyIncludeElementsWithVisibleFrame:1];
        v9 = [v7 _accessibilityLeafDescendantsWithCount:1 options:v8];
        if ([v9 count])
        {
          id v4 = v7;

          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)LargeMonthViewControllerAccessibility;
  [(LargeMonthViewControllerAccessibility *)&v6 showDate:a3 animated:a4 completionBlock:a5];
  if ([(LargeMonthViewControllerAccessibility *)self _accessibilityBoolValueForKey:@"_AXShouldFocusOnTodayStorageKey"])AXPerformBlockOnMainThreadAfterDelay(); {
}
  }

void __75__LargeMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
  id v5 = [v1 _accessibilityFindSubviewDescendant:&__block_literal_global_4];

  v2 = [v5 safeValueForKey:@"_dayNumberLabels"];
  id v3 = [v5 safeValueForKey:@"dayIndexForToday"];
  id v4 = objc_msgSend(v2, "objectAtIndex:", objc_msgSend(v3, "integerValue"));

  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v4);
}

BOOL __75__LargeMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Largemonthweek_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"todayDay"];
    BOOL v4 = [v3 integerValue] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end