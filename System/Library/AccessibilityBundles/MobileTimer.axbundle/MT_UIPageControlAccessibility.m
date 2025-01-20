@interface MT_UIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPagingController;
- (id)accessibilityValue;
- (void)_axStopWatchAdjustPage:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MT_UIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"pagingViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchPagingViewController", @"currentPage", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchPagingViewController", @"pages", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchPagingViewController", @"setCurrentPage:", "v", "Q", 0);
}

- (id)_axPagingController
{
  v2 = [(MT_UIPageControlAccessibility *)self superview];
  id v3 = [MEMORY[0x263F1CB68] viewControllerForView:v2];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"pagingViewController"];
  v6 = __UIAccessibilitySafeClass();

  return v6;
}

- (void)_axStopWatchAdjustPage:(BOOL)a3
{
  id v3 = [(MT_UIPageControlAccessibility *)self _axPagingController];
  [v3 safeUnsignedIntegerForKey:@"currentPage"];
  v4 = [v3 safeValueForKey:@"pages"];
  v5 = __UIAccessibilitySafeClass();

  [v5 count];
  v7 = v3;
  id v6 = v3;
  AXPerformSafeBlock();
}

- (id)accessibilityValue
{
  v11.receiver = self;
  v11.super_class = (Class)MT_UIPageControlAccessibility;
  id v3 = [(MT_UIPageControlAccessibility *)&v11 accessibilityValue];
  v4 = [(MT_UIPageControlAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"StopWatchPageControl"];

  if (v5)
  {
    id v6 = [(MT_UIPageControlAccessibility *)self _axPagingController];
    if ([v6 safeUnsignedIntegerForKey:@"currentPage"]) {
      v7 = @"analog.stopwatch.description";
    }
    else {
      v7 = @"digital.stopwatch.description";
    }
    v10 = accessibilityLocalizedString(v7);
    uint64_t v8 = __UIAXStringForVariables();

    id v3 = (void *)v8;
  }

  return v3;
}

- (void)accessibilityDecrement
{
  id v3 = [(MT_UIPageControlAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"StopWatchPageControl"];

  if (v4) {
    [(MT_UIPageControlAccessibility *)self _axStopWatchAdjustPage:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)MT_UIPageControlAccessibility;
  [(MT_UIPageControlAccessibility *)&v5 accessibilityDecrement];
}

- (void)accessibilityIncrement
{
  id v3 = [(MT_UIPageControlAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"StopWatchPageControl"];

  if (v4) {
    [(MT_UIPageControlAccessibility *)self _axStopWatchAdjustPage:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)MT_UIPageControlAccessibility;
  [(MT_UIPageControlAccessibility *)&v5 accessibilityIncrement];
}

@end