@interface TUIEmojiSearchInputViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TUIEmojiSearchInputViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIEmojiSearchInputViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUIEmojiSearchInputViewControllerAccessibility;
  [(TUIEmojiSearchInputViewControllerAccessibility *)&v4 viewWillDisappear:a3];
  v3 = accessibilityLocalizedString(@"emoji.search.hidden");
  UIAccessibilitySpeak();
}

@end