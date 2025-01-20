@interface SMSApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySoftwareKeyboardActive;
- (id)_accessibilityMainWindow;
@end

@implementation SMSApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SMSApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"senderName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"chat", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMChat", @"lastIncomingMessage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"isTypingMessage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_accessibilitySoftwareKeyboardActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagesController", @"isShowingChatController", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplication", @"_accessibilityMainWindow", "@", 0);
  [v3 validateClass:@"CKActionMenuWindow"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKActionMenuWindow", @"sharedInstance", "@", 0);
}

- (BOOL)_accessibilitySoftwareKeyboardActive
{
  char v8 = 0;
  objc_opt_class();
  id v3 = [(id)MEMORY[0x2456559C0](@"CKActionMenuWindow") sharedInstance];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && ![v4 isHidden])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SMSApplicationAccessibility;
    BOOL v5 = [(SMSApplicationAccessibility *)&v7 _accessibilitySoftwareKeyboardActive];
  }

  return v5;
}

- (id)_accessibilityMainWindow
{
  v7.receiver = self;
  v7.super_class = (Class)SMSApplicationAccessibility;
  v2 = [(SMSApplicationAccessibility *)&v7 _accessibilityMainWindow];
  uint64_t v3 = [MEMORY[0x263F1CBC8] keyWindow];
  v4 = (void *)v3;
  if (!v2
    || (void *)v3 != v2
    && [v2 accessibilityViewIsModal]
    && [v4 accessibilityViewIsModal])
  {
    id v5 = v4;

    v2 = v5;
  }

  return v2;
}

@end