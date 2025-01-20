@interface AMUIOnboardingContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (void)onboardingViewRequestsDismissal:(id)a3;
@end

@implementation AMUIOnboardingContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUIOnboardingContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIInfographViewController", @"delegate", "@", 0);
  [v3 validateClass:@"AMUIDataLayerViewController" conformsToProtocol:@"AMUIInfographViewControllerDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIDataLayerViewController", @"createUnlockRequestForViewController:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIDataLayerViewController", @"requestUnlockForViewController:withRequest:completion:", "v", "@", "@", "@?", 0);
  [v3 validateClass:@"AMUIConcreteUnlockRequest" conformsToProtocol:@"AMUnlockRequest"];
  [v3 validateClass:@"AMUIConcreteUnlockRequest" hasProperty:@"unlockDestination" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AMUIOnboardingContainerView", @"onboardingViewRequestsDismissal:", "v", "@", 0);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)onboardingViewRequestsDismissal:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingContainerViewAccessibility;
  [(AMUIOnboardingContainerViewAccessibility *)&v3 onboardingViewRequestsDismissal:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end