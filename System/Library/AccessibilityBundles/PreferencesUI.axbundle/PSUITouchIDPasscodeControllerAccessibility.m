@interface PSUITouchIDPasscodeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)highlightFingerprintSpecifier:(id)a3;
@end

@implementation PSUITouchIDPasscodeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSUITouchIDPasscodeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)highlightFingerprintSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSUITouchIDPasscodeControllerAccessibility;
  id v3 = a3;
  [(PSUITouchIDPasscodeControllerAccessibility *)&v6 highlightFingerprintSpecifier:v3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  v5 = objc_msgSend(v3, "name", v6.receiver, v6.super_class);

  UIAccessibilityPostNotification(v4, v5);
}

@end