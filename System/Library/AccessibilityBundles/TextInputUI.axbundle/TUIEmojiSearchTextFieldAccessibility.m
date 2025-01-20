@interface TUIEmojiSearchTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityTextInputProxiesForRealTextView;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation TUIEmojiSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIEmojiSearchTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TUIEmojiSearchTextField" isKindOfClass:@"UITextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"_inputController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextFieldAccessibility", @"_accessibilitySetSelectedTextRange:", "v", "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextInputControllerAccessibility", @"_accessibilityUpdateSelectionNotification:", "v", "@", 0);
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiSearchTextFieldAccessibility;
  -[TUIEmojiSearchTextFieldAccessibility _accessibilitySetSelectedTextRange:](&v6, sel__accessibilitySetSelectedTextRange_, a3.location, a3.length);
  v5 = [(TUIEmojiSearchTextFieldAccessibility *)self safeValueForKey:@"_inputController"];
  id v4 = v5;
  AXPerformSafeBlock();
}

uint64_t __75__TUIEmojiSearchTextFieldAccessibility__accessibilitySetSelectedTextRange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateSelectionNotification:*(void *)(a1 + 40)];
}

- (BOOL)_accessibilityTextInputProxiesForRealTextView
{
  return _AXSHoverTextTypingEnabled() == 0;
}

@end