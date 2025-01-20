@interface MTCCTimerBackgroundViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MTCCTimerBackgroundViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTCCTimerBackgroundViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCTimerBackgroundViewController", @"timeLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MTCCTimerBackgroundViewControllerAccessibility;
  [(MTCCTimerBackgroundViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MTCCTimerBackgroundViewControllerAccessibility *)self safeUIViewForKey:@"timeLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CF68]];
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__MTCCTimerBackgroundViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2651602B0;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityValueBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __92__MTCCTimerBackgroundViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained accessibilityLabel];

  id v3 = AXLocalizeDurationTime();

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTCCTimerBackgroundViewControllerAccessibility;
  [(MTCCTimerBackgroundViewControllerAccessibility *)&v3 viewDidLoad];
  [(MTCCTimerBackgroundViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end