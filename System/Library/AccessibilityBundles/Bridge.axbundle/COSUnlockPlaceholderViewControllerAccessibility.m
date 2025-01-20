@interface COSUnlockPlaceholderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation COSUnlockPlaceholderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSUnlockPlaceholderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSUnlockPlaceholderViewController" isKindOfClass:@"BPSWelcomeOptinViewController"];
  [v3 validateClass:@"COSUnlockPlaceholderViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BPSWelcomeOptinViewController", @"watchView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)COSUnlockPlaceholderViewControllerAccessibility;
  [(COSUnlockPlaceholderViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"phone.with.watch.picture.unlock.passcode");
  v4 = [(COSUnlockPlaceholderViewControllerAccessibility *)self safeUIViewForKey:@"watchView"];
  [v4 setAccessibilityLabel:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)COSUnlockPlaceholderViewControllerAccessibility;
  [(COSUnlockPlaceholderViewControllerAccessibility *)&v3 viewDidLoad];
  [(COSUnlockPlaceholderViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end