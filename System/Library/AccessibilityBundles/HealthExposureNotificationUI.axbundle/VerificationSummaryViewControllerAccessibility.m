@interface VerificationSummaryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation VerificationSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.VerificationSummaryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HealthExposureNotificationUI.VerificationSummaryViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidAppear:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)VerificationSummaryViewControllerAccessibility;
  [(VerificationSummaryViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VerificationSummaryViewControllerAccessibility;
  [(VerificationSummaryViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(VerificationSummaryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end