@interface PBADataRecoveryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_pushPasscodeView;
- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4;
@end

@implementation PBADataRecoveryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBADataRecoveryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBADataRecoveryViewController" hasInstanceVariable:@"_firstPasscode" withType:"NSData"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADataRecoveryViewController", @"_pushPasscodeView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADataRecoveryViewController", @"passcodeEntryViewControllerEntryCompleted:passcode:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADataRecoveryViewController", @"_homeButtonPressed:", "v", "@", 0);
}

- (void)_pushPasscodeView
{
  v4.receiver = self;
  v4.super_class = (Class)PBADataRecoveryViewControllerAccessibility;
  [(PBADataRecoveryViewControllerAccessibility *)&v4 _pushPasscodeView];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = accessibilityLocalizedString(@"enter.passcode");
  UIAccessibilityPostNotification(v2, v3);
}

- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PBADataRecoveryViewControllerAccessibility *)self safeValueForKey:@"_firstPasscode"];

  v11.receiver = self;
  v11.super_class = (Class)PBADataRecoveryViewControllerAccessibility;
  [(PBADataRecoveryViewControllerAccessibility *)&v11 passcodeEntryViewControllerEntryCompleted:v7 passcode:v6];

  if (!v8)
  {
    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
    v10 = accessibilityLocalizedString(@"verify.passcode");
    UIAccessibilityPostNotification(v9, v10);
  }
}

@end