@interface SLMicroBlogComposeViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_presentMentionsViewControllerWithSearchString:(id)a3;
- (void)noteLocationInfoChanged:(id)a3;
@end

@implementation SLMicroBlogComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLMicroBlogComposeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SLMicroBlogComposeViewController", @"noteLocationInfoChanged:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SLMicroBlogComposeViewController", @"_presentMentionsViewControllerWithSearchString:", "v", "@", 0);
}

- (void)noteLocationInfoChanged:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SLMicroBlogComposeViewControllerAccessibility;
  [(SLMicroBlogComposeViewControllerAccessibility *)&v3 noteLocationInfoChanged:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_presentMentionsViewControllerWithSearchString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogComposeViewControllerAccessibility;
  [(SLMicroBlogComposeViewControllerAccessibility *)&v7 _presentMentionsViewControllerWithSearchString:a3];
  objc_super v3 = accessibilityLocalizedString(@"mention.sheet.appeared");
  v6 = accessibilityLocalizedString(@"mention.sheet.hint");
  v4 = __UIAXStringForVariables();

  v5 = objc_msgSend(MEMORY[0x263F21660], "axAttributedStringWithString:", v4, v6, @"__AXStringForVariablesSentinel");
  [v5 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21770]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

@end