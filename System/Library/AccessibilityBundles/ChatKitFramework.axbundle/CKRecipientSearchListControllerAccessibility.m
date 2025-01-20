@interface CKRecipientSearchListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation CKRecipientSearchListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKRecipientSearchListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListControllerAccessibility;
  [(CKRecipientSearchListControllerAccessibility *)&v4 didSelectRecipient:a3 atIndex:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end