@interface CKNanoChatControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setConversation:(id)a3;
@end

@implementation CKNanoChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoChatController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKNanoChatController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoChatController", @"setConversation:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CKNanoChatControllerAccessibility;
  [(CKNanoChatControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v2 = accessibilityLocalizedString(@"contact.info");
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setAccessibilityLabel:v2];
}

- (void)setConversation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKNanoChatControllerAccessibility;
  [(CKNanoChatControllerAccessibility *)&v4 setConversation:a3];
  [(CKNanoChatControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end