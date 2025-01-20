@interface COSHelloAppleWatchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation COSHelloAppleWatchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSHelloAppleWatchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSHelloAppleWatchViewController" isKindOfClass:@"BPSWelcomeOptinViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSWelcomeOptinViewController", @"okayButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)COSHelloAppleWatchViewControllerAccessibility;
  [(COSHelloAppleWatchViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(COSHelloAppleWatchViewControllerAccessibility *)self safeValueForKey:@"okayButton"];
  [v3 setAccessibilityIdentifier:@"GoToBridgeButton"];
  v4 = [v3 accessibilityLabel];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    v6 = accessibilityLocalizedString(@"go.to.bridge");
    [v3 setAccessibilityLabel:v6];
  }
}

@end