@interface CKConversationListAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)deleteConversations:(id)a3;
@end

@implementation CKConversationListAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationList";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)deleteConversations:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListAccessibility;
  id v3 = a3;
  [(CKConversationListAccessibility *)&v10 deleteConversations:v3];
  v4 = (void *)MEMORY[0x263F21660];
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"deleted.conversations.count");
  uint64_t v7 = [v3 count];

  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v9 = [v4 axAttributedStringWithString:v8];

  [v9 setAttribute:&unk_26F66E088 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v9);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end