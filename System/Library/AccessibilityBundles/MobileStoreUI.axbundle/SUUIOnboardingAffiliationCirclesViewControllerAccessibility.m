@interface SUUIOnboardingAffiliationCirclesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHandleLayoutChangedTimerFired:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIOnboardingAffiliationCirclesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIOnboardingAffiliationCirclesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingAffiliationCirclesViewController", @"instructionsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingInstructionsView", @"explanationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingInstructionsView", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIOnboardingAffiliationCirclesViewControllerAccessibility;
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)self safeValueForKey:@"instructionsView"];
  v4 = [v3 safeValueForKey:@"titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIOnboardingAffiliationCirclesViewControllerAccessibility;
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)&v3 loadView];
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIOnboardingAffiliationCirclesViewControllerAccessibility;
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)&v5 viewDidAppear:a3];
  if (UIAccessibilityIsSwitchControlRunning())
  {
    v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axHandleLayoutChangedTimerFired_ selector:0 userInfo:1 repeats:2.0];
    [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:@"AXLayoutChangedTimerKey"];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)self _accessibilityValueForKey:@"AXLayoutChangedTimerKey"];
  [v5 invalidate];
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)self _accessibilitySetRetainedValue:0 forKey:@"AXLayoutChangedTimerKey"];
  v6.receiver = self;
  v6.super_class = (Class)SUUIOnboardingAffiliationCirclesViewControllerAccessibility;
  [(SUUIOnboardingAffiliationCirclesViewControllerAccessibility *)&v6 viewWillDisappear:v3];
}

- (void)_axHandleLayoutChangedTimerFired:(id)a3
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v3, 0);
  }
}

@end