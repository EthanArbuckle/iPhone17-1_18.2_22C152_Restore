@interface CKChatInputControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3;
- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3;
- (void)sendMenuViewControllerRequestDismiss:(id)a3;
@end

@implementation CKChatInputControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKChatInputController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatInputController", @"handwritingPresentationControllerDidShowHandwriting:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatInputController", @"handwritingPresentationControllerWillHideHandwriting:", "v", "@", 0);
  [v3 validateClass:@"CKChatInputController" conformsToProtocol:@"CKSendMenuViewControllerDelegate"];
  [v3 validateProtocol:@"CKSendMenuViewControllerDelegate" hasRequiredInstanceMethod:@"sendMenuViewControllerRequestDismiss:"];
  [v3 validateClass:@"CKHandwritingPresentationController"];
}

- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  [(CKChatInputControllerAccessibility *)&v3 handwritingPresentationControllerDidShowHandwriting:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  [(CKChatInputControllerAccessibility *)&v3 handwritingPresentationControllerWillHideHandwriting:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)sendMenuViewControllerRequestDismiss:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  [(CKChatInputControllerAccessibility *)&v3 sendMenuViewControllerRequestDismiss:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end