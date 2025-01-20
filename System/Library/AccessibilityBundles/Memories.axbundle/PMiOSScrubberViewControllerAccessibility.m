@interface PMiOSScrubberViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_axLastScrolledTimeInterval;
- (void)_setAXLastScrolledTimeInterval:(double)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation PMiOSScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMiOSScrubberViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSScrubberViewController", @"provider", "@", 0);
  [v3 validateClass:@"PMScrubberProvider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMScrubberProvider", @"currentDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMScrubberProvider", @"currentProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSScrubberViewController", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSScrubberViewController", @"scrollViewDidEndDragging: willDecelerate:", "v", "@", "B", 0);
}

- (double)_axLastScrolledTimeInterval
{
  MEMORY[0x270F0A470](self, &__PMiOSScrubberViewControllerAccessibility___axLastScrolledTimeInterval);
  return result;
}

- (void)_setAXLastScrolledTimeInterval:(double)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PMiOSScrubberViewControllerAccessibility;
  [(PMiOSScrubberViewControllerAccessibility *)&v11 scrollViewDidScroll:a3];
  v4 = [(PMiOSScrubberViewControllerAccessibility *)self safeValueForKey:@"provider"];
  MEMORY[0x2455E2920](@"PMScrubberProvider");
  if (objc_opt_isKindOfClass())
  {
    [v4 safeTimeIntervalForKey:@"currentDuration"];
    double v6 = v5;
    [v4 safeCGFloatForKey:@"currentProgress"];
    double v8 = v6 * v7;
    [(PMiOSScrubberViewControllerAccessibility *)self _axLastScrolledTimeInterval];
    if ((int)v8 - (int)v9 >= 15)
    {
      [(PMiOSScrubberViewControllerAccessibility *)self _setAXLastScrolledTimeInterval:v8];
      if (v8 >= 0.0)
      {
        v10 = AXDurationStringForDuration();
        UIAccessibilitySpeak();
      }
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PMiOSScrubberViewControllerAccessibility;
  [(PMiOSScrubberViewControllerAccessibility *)&v5 scrollViewDidEndDragging:a3 willDecelerate:a4];
  [(PMiOSScrubberViewControllerAccessibility *)self _setAXLastScrolledTimeInterval:-1.0];
}

@end