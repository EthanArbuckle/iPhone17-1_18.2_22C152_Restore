@interface PromptViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)subviewsForStackViewElement;
@end

@implementation PromptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Diagnostics.PromptView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.PromptView", @"buttonStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.PromptView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.PromptView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.PromptView", @"infoProgressIndicatorView", "@", 0);
}

- (id)subviewsForStackViewElement
{
  objc_opt_class();
  id v3 = [(PromptViewAccessibility *)self safeValueForKey:@"buttonStackView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263EFF980] array];
  v6 = [(PromptViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v5 axSafelyAddObject:v6];

  v7 = [(PromptViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  [v5 axSafelyAddObject:v7];

  v8 = [(PromptViewAccessibility *)self safeValueForKey:@"infoProgressIndicatorView"];
  [v5 axSafelyAddObject:v8];

  v9 = [v4 arrangedSubviews];
  [v5 axSafelyAddObjectsFromArray:v9];

  return v5;
}

@end