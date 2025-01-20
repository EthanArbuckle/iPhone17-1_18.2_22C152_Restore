@interface CKNotificationChatControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation CKNotificationChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNotificationChatController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatControllerAccessibility;
  [(CKNotificationChatControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKNotificationChatControllerAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXTranscriptIsInNotification"];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatControllerAccessibility;
  [(CKNotificationChatControllerAccessibility *)&v3 loadView];
  [(CKNotificationChatControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end