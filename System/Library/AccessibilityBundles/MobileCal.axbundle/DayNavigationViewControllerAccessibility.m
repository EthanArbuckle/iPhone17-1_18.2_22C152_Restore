@interface DayNavigationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
@end

@implementation DayNavigationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DayNavigationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DayViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewController", @"setSelectedDate: animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayViewController", @"dayNavigationViewController: didSelectDate:", "v", "@", "@", 0);
  [v3 validateClass:@"DayNavigationViewController" hasInstanceVariable:@"_navigationView" withType:"DayNavigationView"];
  [v3 validateClass:@"DayNavigationView" hasInstanceVariable:@"_calendar" withType:"NSCalendar"];
  [v3 validateClass:@"DayNavigationView" hasInstanceVariable:@"_selectedDate" withType:"NSDate"];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(DayNavigationViewControllerAccessibility *)self safeValueForKey:@"_navigationView"];
  v6 = [v5 safeValueForKey:@"_selectedDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 safeValueForKey:@"_calendar"];
    if (a3 == 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v8 setWeekOfYear:-1];
      UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
      v10 = @"day.scrubber.previous.week";
    }
    else
    {
      if (a3 != 2)
      {
        LOBYTE(v8) = 0;
        goto LABEL_13;
      }
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v8 setWeekOfYear:1];
      UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
      v10 = @"day.scrubber.next.week";
    }
    v11 = accessibilityLocalizedString(v10);
    UIAccessibilityPostNotification(v9, v11);

    if (v8)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      id v19 = v7;
      id v8 = v8;
      id v20 = v6;
      AXPerformSafeBlock();
      id v12 = (id)v22[5];

      _Block_object_dispose(&v21, 8);
      id v13 = v12;
      v18 = v13;
      AXPerformSafeBlock();
      v14 = [(DayNavigationViewControllerAccessibility *)self safeValueForKey:@"delegate"];
      if (v14)
      {
        NSClassFromString(&cfstr_Dayviewcontrol_0.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          _AXAssert();
        }
      }
      id v15 = v13;
      id v16 = v14;
      AXPerformSafeBlock();

      LOBYTE(v8) = 1;
      goto LABEL_14;
    }
LABEL_13:
    id v15 = 0;
LABEL_14:

    goto LABEL_15;
  }
  _AXAssert();
  LOBYTE(v8) = 0;
LABEL_15:

  return (char)v8;
}

uint64_t __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) dateByAddingComponents:*(void *)(a1 + 40) toDate:*(void *)(a1 + 48) options:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedDate:*(void *)(a1 + 40) animated:0];
}

uint64_t __64__DayNavigationViewControllerAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dayNavigationViewController:*(void *)(a1 + 40) didSelectDate:*(void *)(a1 + 48)];
}

@end