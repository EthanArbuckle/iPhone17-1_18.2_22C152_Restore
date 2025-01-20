@interface DayNavigationWeekScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_accessibilityScrollStatus;
- (id)_axVisibleCells;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (void)setSelectedDate:(id)a3 animated:(BOOL)a4;
@end

@implementation DayNavigationWeekScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DayNavigationWeekScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationWeekScrollView", @"_weekStartForDate:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationWeekScrollView", @"selectedDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationWeekScrollView", @"setSelectedDate: animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationWeekScrollView", @"didFinishScrolling", "v", 0);
  [v3 validateClass:@"DayNavigationWeekScrollView" hasInstanceVariable:@"_cells" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationView", @"dayNavigationWeekScrollView:selectedDateChanged:", "v", "@", "@", 0);
}

- (id)_axVisibleCells
{
  char v26 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  v12 = [(DayNavigationWeekScrollViewAccessibility *)self safeValueForKey:@"_cells"];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __59__DayNavigationWeekScrollViewAccessibility__axVisibleCells__block_invoke;
  v20 = &unk_265131F80;
  id v21 = v3;
  uint64_t v22 = v5;
  uint64_t v23 = v7;
  uint64_t v24 = v9;
  uint64_t v25 = v11;
  id v13 = v3;
  v14 = objc_msgSend(v12, "ax_filteredArrayUsingBlock:", &v17);

  v15 = objc_msgSend(v14, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_, v17, v18, v19, v20);

  return v15;
}

BOOL __59__DayNavigationWeekScrollViewAccessibility__axVisibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = __UIAccessibilityCastAsClass();
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", *(void *)(a1 + 32));
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGRect v19 = CGRectIntersection(v18, *(CGRect *)(a1 + 40));
  CGFloat v9 = v19.origin.x;
  CGFloat v10 = v19.origin.y;
  CGFloat v11 = v19.size.width;
  CGFloat v12 = v19.size.height;
  if (CGRectIsNull(v19))
  {
    BOOL v13 = 0;
  }
  else
  {
    v20.origin.CGFloat x = v9;
    v20.origin.CGFloat y = v10;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v12;
    double v17 = CGRectGetWidth(v20);
    v21.origin.CGFloat x = v9;
    v21.origin.CGFloat y = v10;
    v21.size.CGFloat width = v11;
    v21.size.CGFloat height = v12;
    double v14 = v17 * CGRectGetHeight(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v15 = CGRectGetWidth(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    BOOL v13 = v14 > v15 * CGRectGetHeight(v23) * 0.5;
  }

  return v13;
}

- (int64_t)accessibilityElementCount
{
  v2 = [(DayNavigationWeekScrollViewAccessibility *)self _axVisibleCells];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DayNavigationWeekScrollViewAccessibility *)self _axVisibleCells];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4 = [(DayNavigationWeekScrollViewAccessibility *)self _axVisibleCells];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CGFloat v10 = __Block_byref_object_copy__1;
  CGFloat v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  AXPerformSafeBlock();
  v2 = NSString;
  int64_t v3 = accessibilityLocalizedString(@"week.scroll.status");
  id v4 = _AXGetStringsForDate((void *)v8[5]);
  uint64_t v5 = objc_msgSend(v2, "stringWithFormat:", v3, v4);

  _Block_object_dispose(&v7, 8);

  return v5;
}

void __70__DayNavigationWeekScrollViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [v2 safeValueForKey:@"selectedDate"];
  uint64_t v3 = [v2 _weekStartForDate:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)DayNavigationWeekScrollViewAccessibility;
  [(DayNavigationWeekScrollViewAccessibility *)&v4 setSelectedDate:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_opt_class();
  uint64_t v5 = [(DayNavigationWeekScrollViewAccessibility *)self safeValueForKey:@"selectedDate"];
  id v6 = __UIAccessibilityCastAsClass();

  BOOL v7 = a3 == 4 || a3 == 1;
  double v8 = 604800.0;
  if (v7) {
    double v8 = -604800.0;
  }
  uint64_t v9 = [v6 dateByAddingTimeInterval:v8];
  [(DayNavigationWeekScrollViewAccessibility *)self setSelectedDate:v9 animated:1];
  id v12 = v9;
  id v10 = v9;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);

  return 1;
}

void __64__DayNavigationWeekScrollViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didFinishScrolling];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"navDelegate"];
  [v2 dayNavigationWeekScrollView:*(void *)(a1 + 32) selectedDateChanged:*(void *)(a1 + 40)];
}

@end