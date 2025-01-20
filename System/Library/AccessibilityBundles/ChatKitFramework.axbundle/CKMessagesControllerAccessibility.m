@interface CKMessagesControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)setChatController:(id)a3;
@end

@implementation CKMessagesControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessagesController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMessagesController" isKindOfClass:@"UISplitViewController"];
  [v3 validateClass:@"CKMessagesController" hasProperty:@"chatController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagesController", @"setChatController:", "v", "@", 0);
  [v3 validateClass:@"CKMessagesController" hasProperty:@"conversationListController" withType:"@"];
  [v3 validateClass:@"CKConversationListCollectionViewController" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagesController", @"conversationListController", "@", 0);
  [v3 validateClass:@"CKConversationListCollectionViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessagesControllerAccessibility;
  [(CKMessagesControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMessagesControllerAccessibility *)self _accessibilityWindow];
  [v3 setAccessibilityIdentifier:@"AXChatMainWindow"];

  v4 = [(CKMessagesControllerAccessibility *)self safeValueForKey:@"conversationListController"];
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"navigationItem"];
  v6 = __UIAccessibilityCastAsClass();

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSFullKeyboardAccessEnabled()
    || _AXSCommandAndControlEnabled())
  {
    [v6 setHidesSearchBarWhenScrolling:0];
  }
  [(CKMessagesControllerAccessibility *)self _accessibilityReloadElementRelations:1];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessagesControllerAccessibility;
  [(CKMessagesControllerAccessibility *)&v3 loadView];
  [(CKMessagesControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setChatController:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  objc_opt_class();
  v5 = [(CKMessagesControllerAccessibility *)self safeValueForKey:@"chatController"];
  v6 = __UIAccessibilityCastAsSafeCategory();

  v7.receiver = self;
  v7.super_class = (Class)CKMessagesControllerAccessibility;
  [(CKMessagesControllerAccessibility *)&v7 setChatController:v4];
  [v6 _accessibilityReloadElementRelations:0];
  if (v4) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else {
    [(CKMessagesControllerAccessibility *)self _accessibilityReloadElementRelations:0];
  }
}

uint64_t __55__CKMessagesControllerAccessibility_setChatController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityReloadElementRelations:1];
}

@end