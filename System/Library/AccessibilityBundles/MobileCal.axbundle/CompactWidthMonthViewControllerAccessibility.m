@interface CompactWidthMonthViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation CompactWidthMonthViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompactWidthMonthViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CompactMonthWeekView"];
  [v3 validateClass:@"CompactWidthMonthViewController" isKindOfClass:@"InfiniteScrollViewController"];
  [v3 validateClass:@"CompactWidthMonthViewController" isKindOfClass:@"MonthViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CompactWidthMonthViewController", @"showDate: animated: completionBlock:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"scrollView", "@", 0);
  v4 = NSString;
  v5 = [NSString stringWithUTF8String:"^{CGPoint=dd}"];
  v6 = [v4 stringWithFormat:@"N%@", v5];

  id v7 = v6;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"willEndDraggingWithVelocity: targetContentOffset:", "v", "{CGPoint=dd}", objc_msgSend(v7, "UTF8String"), 0);
  [v3 validateClass:@"InfiniteScrollViewController" isKindOfClass:@"MainViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MainViewController", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CUIKCalendarModel", @"selectedDate", "@", 0);
  [v3 validateClass:@"CompactMonthWeekView" hasInstanceVariable:@"_today" withType:"CompactMonthWeekDayNumber"];
  [v3 validateClass:@"CompactWidthMonthViewController" hasInstanceVariable:@"_dividedListMode" withType:"B"];
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke;
  v13[3] = &unk_265131EB8;
  v13[4] = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = a3;
  v11 = (void *)MEMORY[0x245654CF0](v13);
  v12.receiver = self;
  v12.super_class = (Class)CompactWidthMonthViewControllerAccessibility;
  [(CompactWidthMonthViewControllerAccessibility *)&v12 showDate:v10 animated:v5 completionBlock:v11];
}

void __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if ([*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"_AXShouldFocusOnTodayStorageKey"])
  {
    id v3 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
    id v5 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_3];

    if (v5)
    {
      v4 = [v5 safeValueForKey:@"_today"];
      UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v4);
    }
    else
    {
      _AXAssert();
    }
  }
}

BOOL __82__CompactWidthMonthViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Compactmonthwe_2.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"_today"];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5 = [(CompactWidthMonthViewControllerAccessibility *)self safeBoolForKey:@"_dividedListMode"];
  if ((unint64_t)(a3 - 3) <= 1 && v5)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke;
    v15 = &unk_265131F08;
    v16 = self;
    int64_t v17 = a3;
    AXPerformSafeBlock();
    v6 = [(CompactWidthMonthViewControllerAccessibility *)self safeValueForKey:@"model"];
    id v7 = [v6 safeValueForKey:@"selectedDate"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 date];
      id v9 = AXDateStringForFormat();
    }
    else
    {
      _AXAssert();
      id v9 = 0;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v9);

    return 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CompactWidthMonthViewControllerAccessibility;
    return [(CompactWidthMonthViewControllerAccessibility *)&v11 accessibilityScroll:a3];
  }
}

void __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"scrollView"];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3010000000;
  id v10 = &unk_2422ABEFB;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  id v4 = v3;
  AXPerformSafeBlock();
  if (v2 == 3) {
    double v5 = -1.0;
  }
  else {
    double v5 = 1.0;
  }
  long long v13 = *((_OWORD *)v8 + 2);

  _Block_object_dispose(&v7, 8);
  objc_msgSend(*(id *)(a1 + 32), "willEndDraggingWithVelocity:targetContentOffset:", &v13, 0.0, v5, v6, 3221225472, __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke_2, &unk_265131EE0);
}

uint64_t __68__CompactWidthMonthViewControllerAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) contentOffset];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

@end