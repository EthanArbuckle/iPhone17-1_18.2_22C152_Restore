@interface ActionValidationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)presentAttributedString:(id)a3 inWindow:(id)a4;
@end

@implementation ActionValidationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ActionValidationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (void)presentAttributedString:(id)a3 inWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___ActionValidationControllerAccessibility;
  objc_msgSendSuper2(&v11, sel_presentAttributedString_inWindow_, v6, v7);
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v9 = *MEMORY[0x263F1CDC8];
  v10 = [v8 string];
  UIAccessibilityPostNotification(v9, v10);
}

@end