@interface MTCCTimerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MTCCTimerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTCCTimerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerViewController", @"sliderView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerModule", @"timerBackgroundViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"timer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"dateComponentsFormatter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimer", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimer", @"duration", "d", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)MTCCTimerViewControllerAccessibility;
  [(MTCCTimerViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MTCCTimerViewControllerAccessibility *)self safeValueForKey:@"sliderView"];
  objc_initWeak(&location, self);
  v4 = accessibilityLocalizedString(@"timer.button.label");
  [v3 setAccessibilityLabel:v4];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__MTCCTimerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2651602B0;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityValueBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __82__MTCCTimerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"delegate"];

  id v3 = [v2 safeValueForKey:@"timerBackgroundViewController"];
  v4 = [v3 safeValueForKey:@"timer"];
  if ([v4 safeIntForKey:@"state"] > 1)
  {
    id v6 = [v3 safeValueForKey:@"titleLabel"];
    id v8 = [v6 accessibilityLabel];
  }
  else
  {
    objc_opt_class();
    v5 = [v3 safeUIViewForKey:@"timeLabel"];
    id v6 = __UIAccessibilityCastAsClass();

    v7 = [v6 accessibilityLabel];
    if ([v7 length])
    {
      id v8 = v7;
    }
    else
    {
      [v4 safeDoubleForKey:@"duration"];
      double v10 = v9;
      v11 = [v3 safeValueForKey:@"dateComponentsFormatter"];
      id v8 = [v11 stringFromTimeInterval:v10];
    }
  }

  return v8;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"com.apple.mobiletimer";
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"timer.button.label");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTCCTimerViewControllerAccessibility;
  [(MTCCTimerViewControllerAccessibility *)&v3 viewDidLoad];
  [(MTCCTimerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end