@interface BCChatButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BCChatButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCChatButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BCChatButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(BCChatButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"bc.chat.with.messages");
}

@end