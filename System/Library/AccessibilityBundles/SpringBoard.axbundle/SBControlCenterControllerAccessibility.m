@interface SBControlCenterControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_didEndTransition;
- (void)_willBeginTransition;
@end

@implementation SBControlCenterControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBControlCenterController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBControlCenterController" hasInstanceVariable:@"_viewController" withType:"UIViewController<CCUIMainViewController>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"_willBeginTransition", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"_didEndTransition", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AXSBHearingAidDeviceController", @"sharedController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AXSBHearingAidDeviceController", @"showHearingAidControl:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  [(SBControlCenterControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBControlCenterControllerAccessibility *)self safeValueForKey:@"_viewController"];
  [v3 _accessibilityLoadAccessibilityInformation];
}

- (void)_willBeginTransition
{
  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  [(SBControlCenterControllerAccessibility *)&v4 _willBeginTransition];
  id v3 = [(SBControlCenterControllerAccessibility *)self safeValueForKey:@"_window"];
  [v3 setAccessibilityViewIsModal:1];

  AXPerformSafeBlock();
}

void __62__SBControlCenterControllerAccessibility__willBeginTransition__block_invoke()
{
  id v0 = [NSClassFromString(&cfstr_Axsbhearingaid.isa) safeValueForKey:@"sharedController"];
  [v0 showHearingAidControl:0];
}

- (void)_didEndTransition
{
  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterControllerAccessibility;
  [(SBControlCenterControllerAccessibility *)&v4 _didEndTransition];
  id v3 = [(SBControlCenterControllerAccessibility *)self safeValueForKey:@"_window"];
  [v3 setAccessibilityViewIsModal:0];
}

@end