@interface WeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (WeekViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6;
- (id)accessibilityCustomRotors;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateScrollView;
@end

@implementation WeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WeekAllDayView"];
  [v3 validateClass:@"EKDayViewContent"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekView", @"initWithFrame:sizeClass:targetWindow:rightClickDelegate:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewContent", @"grid", "@", 0);
  [v3 validateClass:@"WeekView" hasInstanceVariable:@"_scrollView" withType:"UIScrollView"];
  [v3 validateClass:@"WeekView" hasInstanceVariable:@"_allDayView" withType:"WeekAllDayView"];
  [v3 validateClass:@"WeekView" hasInstanceVariable:@"_content" withType:"EKDayViewContent"];
  [v3 validateClass:@"WeekView" hasInstanceVariable:@"_daysToDisplay" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewContent", @"occurrenceViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"occurrenceViews", "@", 0);
}

- (void)_axAnnotateScrollView
{
  id v2 = [(WeekViewAccessibility *)self safeValueForKey:@"_scrollView"];
  [v2 setAccessibilityIdentifier:@"_AXWeekViewScrollViewIdentifier"];
}

- (WeekViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)WeekViewAccessibility;
  v6 = -[WeekViewAccessibility initWithFrame:sizeClass:targetWindow:rightClickDelegate:](&v9, sel_initWithFrame_sizeClass_targetWindow_rightClickDelegate_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6) {
    [(WeekViewAccessibility *)v6 _axAnnotateScrollView];
  }
  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)WeekViewAccessibility;
  [(WeekViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(WeekViewAccessibility *)self _axAnnotateScrollView];
}

- (id)accessibilityElements
{
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    objc_super v3 = 0;
    goto LABEL_15;
  }
  v4 = [(WeekViewAccessibility *)self safeValueForKey:@"_daysToDisplay"];
  uint64_t v5 = [v4 integerValue];

  v6 = [(WeekViewAccessibility *)self safeValueForKey:@"_allDayView"];
  v7 = [v6 accessibilityElements];

  uint64_t v8 = [v7 count];
  if (v8 != v5) {
    _AXAssert();
  }
  objc_super v9 = [(WeekViewAccessibility *)self safeValueForKey:@"_content"];
  v10 = [v9 safeValueForKey:@"grid"];
  v11 = [v10 accessibilityElements];

  if (v11)
  {
    if ([v11 count] == v5)
    {
      if (v8 == v5)
      {
        objc_super v3 = [MEMORY[0x263EFF980] array];
        if (v5)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            v13 = [v7 objectAtIndex:i];
            [v13 setAccessibilityContainer:self];
            [v3 addObject:v13];
            v14 = [v11 objectAtIndex:i];
            [v14 setAccessibilityContainer:self];
            [v3 addObject:v14];
          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      _AXAssert();
    }
  }
  objc_super v3 = 0;
LABEL_14:

LABEL_15:

  return v3;
}

- (id)accessibilityCustomRotors
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(WeekViewAccessibility *)self _accessibilityValueForKey:@"AXCustomRotor"];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F1C398]);
    uint64_t v5 = accessibilityLocalizedString(@"rotor.events");
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __50__WeekViewAccessibility_accessibilityCustomRotors__block_invoke;
    v11 = &unk_265132030;
    objc_copyWeak(&v12, &location);
    objc_super v3 = (void *)[v4 initWithName:v5 itemSearchBlock:&v8];

    [(WeekViewAccessibility *)self _accessibilitySetRetainedValue:v3, @"AXCustomRotor", v8, v9, v10, v11 forKey];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  return v6;
}

id __50__WeekViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained safeValueForKey:@"_content"];
  uint64_t v6 = [v5 safeValueForKey:@"occurrenceViews"];
  v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = objc_loadWeakRetained(v2);
  v11 = [v10 safeValueForKey:@"_allDayView"];
  id v12 = [v11 safeValueForKey:@"occurrenceViews"];

  v13 = [v9 arrayByAddingObjectsFromArray:v12];

  id v14 = objc_loadWeakRetained(v2);
  v15 = [v14 _accessibilityCustomRotorResultHelper:v3 array:v13];

  return v15;
}

@end