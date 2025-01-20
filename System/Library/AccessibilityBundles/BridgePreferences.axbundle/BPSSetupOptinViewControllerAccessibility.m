@interface BPSSetupOptinViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation BPSSetupOptinViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BPSSetupOptinViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BPSSetupOptinViewController" hasInstanceVariable:@"_suggestedChoiceButton" withType:"UIButton"];
  [v3 validateClass:@"BPSSetupOptinViewController" hasInstanceVariable:@"_alternateChoiceButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupOptinViewController", @"watchView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupOptinViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupOptinViewController", @"wantsAlternateChoicePillButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSSetupOptinViewController", @"wantsAlternateChoiceSystemButton", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)BPSSetupOptinViewControllerAccessibility;
  [(BPSSetupOptinViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BPSSetupOptinViewControllerAccessibility *)self safeValueForKey:@"_suggestedChoiceButton"];
  [v3 setAccessibilityIdentifier:@"SuggestedChoiceButton"];

  if (objc_opt_respondsToSelector())
  {
    v4 = [(BPSSetupOptinViewControllerAccessibility *)self safeValueForKey:@"watchView"];
    [v4 setIsAccessibilityElement:1];
    v5 = [(BPSSetupOptinViewControllerAccessibility *)self _accessibilityLabelForWatchView];
    [v4 setAccessibilityLabel:v5];
  }
  if (([(BPSSetupOptinViewControllerAccessibility *)self safeBoolForKey:@"wantsAlternateChoicePillButton"] & 1) == 0&& ([(BPSSetupOptinViewControllerAccessibility *)self safeBoolForKey:@"wantsAlternateChoiceSystemButton"] & 1) == 0)
  {
    v6 = [(BPSSetupOptinViewControllerAccessibility *)self safeValueForKey:@"_alternateChoiceButton"];
    [v6 setIsAccessibilityElement:0];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BPSSetupOptinViewControllerAccessibility;
  [(BPSSetupOptinViewControllerAccessibility *)&v3 viewDidLoad];
  [(BPSSetupOptinViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end