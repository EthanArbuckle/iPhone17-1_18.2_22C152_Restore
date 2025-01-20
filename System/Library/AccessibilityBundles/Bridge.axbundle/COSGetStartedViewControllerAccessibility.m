@interface COSGetStartedViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation COSGetStartedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSGetStartedViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSGetStartedViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"COSGetStartedViewController" hasInstanceVariable:@"_automationButton" withType:"UIButton"];
  [v3 validateClass:@"COSGetStartedViewController" hasInstanceVariable:@"_marketingBannerImage" withType:"UIImageView"];
  [v3 validateClass:@"COSGetStartedViewController" isKindOfClass:@"BPSWelcomeOptinViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSWelcomeOptinViewController", @"suggestedChoiceButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSWelcomeOptinViewController", @"alternateChoiceButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)COSGetStartedViewControllerAccessibility;
  [(COSGetStartedViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(COSGetStartedViewControllerAccessibility *)self safeValueForKey:@"suggestedChoiceButton"];
  [v3 setAccessibilityIdentifier:@"StartPairingButton"];

  v4 = [(COSGetStartedViewControllerAccessibility *)self safeValueForKey:@"alternateChoiceButton"];
  [v4 setAccessibilityIdentifier:@"StartMigrationButton"];

  v5 = [(COSGetStartedViewControllerAccessibility *)self safeValueForKey:@"_automationButton"];
  [v5 setAccessibilityIdentifier:@"AutomationButton"];

  v6 = [(COSGetStartedViewControllerAccessibility *)self safeValueForKey:@"_marketingBannerImage"];
  [v6 setIsAccessibilityElement:1];
  v7 = accessibilityLocalizedString(@"apple.watch.photos");
  [v6 setAccessibilityLabel:v7];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)COSGetStartedViewControllerAccessibility;
  [(COSGetStartedViewControllerAccessibility *)&v3 viewDidLoad];
  [(COSGetStartedViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end