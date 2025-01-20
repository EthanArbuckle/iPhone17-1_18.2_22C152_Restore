@interface EKDayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (EKDayViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11;
- (id)accessibilityCustomRotors;
- (id)accessibilityScrollView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateScroller;
@end

@implementation EKDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKDayView" hasInstanceVariable:@"_scroller" withType:"UIScrollView"];
  [v3 validateClass:@"EKDayView" hasInstanceVariable:@"_allDayView" withType:"EKDayAllDayView"];
  [v3 validateClass:@"EKDayView" hasInstanceVariable:@"_dayContent" withType:"EKDayViewContent"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayView", @"initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", "@", "@", "B", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewContent", @"occurrenceViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayAllDayView", @"occurrenceViews", "@", 0);
}

- (id)accessibilityScrollView
{
  v2 = *(void **)[(EKDayViewAccessibility *)self safeIvarForKey:@"_scroller"];

  return v2;
}

- (void)_axAnnotateScroller
{
  objc_opt_class();
  id v3 = [(EKDayViewAccessibility *)self accessibilityScrollView];
  v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 setAccessibilityIsDayGridScroller:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EKDayViewAccessibility;
  [(EKDayViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EKDayViewAccessibility *)self _axAnnotateScroller];
}

- (EKDayViewAccessibility)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 displayDate:(id)a6 backgroundColor:(id)a7 opaque:(BOOL)a8 scrollbarShowsInside:(BOOL)a9 isMiniPreviewInEventDetail:(BOOL)a10 rightClickDelegate:(id)a11
{
  v15.receiver = self;
  v15.super_class = (Class)EKDayViewAccessibility;
  v11 = -[EKDayViewAccessibility initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](&v15, sel_initWithFrame_sizeClass_orientation_displayDate_backgroundColor_opaque_scrollbarShowsInside_isMiniPreviewInEventDetail_rightClickDelegate_, a4, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a10, a11);
  v12 = v11;
  if (v11) {
    [(EKDayViewAccessibility *)v11 _axAnnotateScroller];
  }
  return v12;
}

- (id)accessibilityCustomRotors
{
  v14[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(EKDayViewAccessibility *)self _accessibilityValueForKey:@"AXCustomRotor"];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F1C398]);
    v5 = accessibilityLocalizedString(@"rotor.events");
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __51__EKDayViewAccessibility_accessibilityCustomRotors__block_invoke;
    v11 = &unk_26511E3B8;
    objc_copyWeak(&v12, &location);
    objc_super v3 = (void *)[v4 initWithName:v5 itemSearchBlock:&v8];

    [(EKDayViewAccessibility *)self _accessibilitySetRetainedValue:v3, @"AXCustomRotor", v8, v9, v10, v11 forKey];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  return v6;
}

id __51__EKDayViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained safeValueForKey:@"_allDayView"];
  uint64_t v6 = [v5 safeValueForKey:@"occurrenceViews"];
  v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = objc_loadWeakRetained(v2);
  v11 = [v10 safeValueForKey:@"_dayContent"];
  id v12 = [v11 safeValueForKey:@"occurrenceViews"];

  v13 = [v9 arrayByAddingObjectsFromArray:v12];

  id v14 = objc_loadWeakRetained(v2);
  objc_super v15 = [v14 _accessibilityCustomRotorResultHelper:v3 array:v13];

  return v15;
}

@end