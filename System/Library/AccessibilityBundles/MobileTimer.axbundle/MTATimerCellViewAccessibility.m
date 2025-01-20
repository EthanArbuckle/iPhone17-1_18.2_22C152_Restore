@interface MTATimerCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsTimerRunning;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetup;
- (void)localSetup;
@end

@implementation MTATimerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerCellView", @"localSetup", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerCellView", @"controlButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerCellView", @"state", "Q", 0);
}

- (BOOL)_accessibilityIsTimerRunning
{
  return [(MTATimerCellViewAccessibility *)self safeUnsignedIntegerForKey:@"state"] == 3;
}

- (void)_accessibilitySetup
{
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(MTATimerCellViewAccessibility *)self safeUIViewForKey:@"controlButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__MTATimerCellViewAccessibility__accessibilitySetup__block_invoke;
  v5[3] = &unk_265139FD0;
  objc_copyWeak(&v6, &location);
  [v4 setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __52__MTATimerCellViewAccessibility__accessibilitySetup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _accessibilityIsTimerRunning]) {
    v2 = @"timer.pause";
  }
  else {
    v2 = @"timer.resume";
  }
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MTATimerCellViewAccessibility;
  [(MTATimerCellViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MTATimerCellViewAccessibility *)self _accessibilitySetup];
}

- (void)localSetup
{
  v3.receiver = self;
  v3.super_class = (Class)MTATimerCellViewAccessibility;
  [(MTATimerCellViewAccessibility *)&v3 localSetup];
  [(MTATimerCellViewAccessibility *)self _accessibilitySetup];
}

@end