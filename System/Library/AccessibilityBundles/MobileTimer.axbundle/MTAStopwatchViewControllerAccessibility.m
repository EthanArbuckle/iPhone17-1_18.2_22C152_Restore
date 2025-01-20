@interface MTAStopwatchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetLapButtonTraitsForMode:(unint64_t)a3;
- (void)didAddLap:(double)a3;
- (void)lapLapTimer;
- (void)loadView;
- (void)setMode:(unint64_t)a3;
@end

@implementation MTAStopwatchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAStopwatchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"pageControl", "@", 0);
  [v3 validateClass:@"MTAStopwatchViewController" hasInstanceVariable:@"_mode" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"stopwatchController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchViewController", @"setMode:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAStopwatchController", @"lapControlButton", "@", 0);
}

- (void)lapLapTimer
{
  OutputLap = 1;
  v2.receiver = self;
  v2.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  [(MTAStopwatchViewControllerAccessibility *)&v2 lapLapTimer];
  OutputLap = 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  [(MTAStopwatchViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MTAStopwatchViewControllerAccessibility *)self safeValueForKey:@"pageControl"];
  [v3 accessibilitySetIdentification:@"StopWatchPageControl"];

  [(MTAStopwatchViewControllerAccessibility *)self _axSetLapButtonTraitsForMode:[(MTAStopwatchViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_mode"]];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  [(MTAStopwatchViewControllerAccessibility *)&v3 loadView];
  [(MTAStopwatchViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)didAddLap:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility didAddLap:](&v3, sel_didAddLap_);
  if (OutputLap == 1) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __53__MTAStopwatchViewControllerAccessibility_didAddLap___block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CDC8];
  UIAXTimeStringForDuration();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (void)_axSetLapButtonTraitsForMode:(unint64_t)a3
{
  objc_super v4 = [(MTAStopwatchViewControllerAccessibility *)self safeValueForKey:@"stopwatchController"];
  id v8 = [v4 safeUIViewForKey:@"lapControlButton"];

  if (a3 == 1)
  {
    uint64_t v5 = [v8 accessibilityTraits];
    uint64_t v6 = *MEMORY[0x263F1CF20] | v5;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F1CF20];
    uint64_t v6 = [v8 accessibilityTraits] & ~v7;
  }
  [v8 setAccessibilityTraits:v6];
}

- (void)setMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTAStopwatchViewControllerAccessibility;
  -[MTAStopwatchViewControllerAccessibility setMode:](&v5, sel_setMode_);
  [(MTAStopwatchViewControllerAccessibility *)self _axSetLapButtonTraitsForMode:a3];
}

@end