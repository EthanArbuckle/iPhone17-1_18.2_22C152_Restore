@interface AAUserNotificationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 secureTextFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 textFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8;
@end

@implementation AAUserNotificationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUserNotification";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AAUserNotification", @"showUserNotificationWithTitle: message: cancelButtonTitle: otherButtonTitle: withCompletionBlock:", "v", "@", "@", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AAUserNotification", @"showUserNotificationWithTitle: message: textFieldTitle: cancelButtonTitle: otherButtonTitle: completion:", "v", "@", "@", "@", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AAUserNotification", @"showUserNotificationWithTitle: message: secureTextFieldTitle: cancelButtonTitle: otherButtonTitle: completion:", "v", "@", "@", "@", "@", "@", "@?", 0);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  UIAccessibilityNotifications v12 = *MEMORY[0x263F1CE68];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  UIAccessibilityPostNotification(v12, 0);
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___AAUserNotificationAccessibility;
  objc_msgSendSuper2(&v18, sel_showUserNotificationWithTitle_message_cancelButtonTitle_otherButtonTitle_withCompletionBlock_, v17, v16, v15, v14, v13);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 textFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  UIAccessibilityNotifications v14 = *MEMORY[0x263F1CE68];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  UIAccessibilityPostNotification(v14, 0);
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___AAUserNotificationAccessibility;
  objc_msgSendSuper2(&v21, sel_showUserNotificationWithTitle_message_textFieldTitle_cancelButtonTitle_otherButtonTitle_completion_, v20, v19, v18, v17, v16, v15);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 secureTextFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  UIAccessibilityNotifications v14 = *MEMORY[0x263F1CE68];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  UIAccessibilityPostNotification(v14, 0);
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___AAUserNotificationAccessibility;
  objc_msgSendSuper2(&v21, sel_showUserNotificationWithTitle_message_secureTextFieldTitle_cancelButtonTitle_otherButtonTitle_completion_, v20, v19, v18, v17, v16, v15);
}

@end