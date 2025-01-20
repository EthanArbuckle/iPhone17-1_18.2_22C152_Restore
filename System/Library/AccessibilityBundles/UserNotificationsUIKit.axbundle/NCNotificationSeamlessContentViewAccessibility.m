@interface NCNotificationSeamlessContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySecondaryText;
- (id)_accessibilitySupportGesturesAttributes;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationSeamlessContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationSeamlessContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationSeamlessContentView" hasInstanceVariable:@"_dateLabel" withType:"UILabel<BSUIDateLabel>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"primaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"primarySubtitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"secondaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"importantText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"footerText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"thumbnail", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationSeamlessContentView", @"delegate", "@", 0);
  [v3 validateClass:@"NCNotificationListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCell", @"contentViewController", "@", 0);
  [v3 validateClass:@"NCNotificationSeamlessContentView" hasInstanceVariable:@"_secondaryTextElement" withType:"UIView<NCTextSupporting>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_executeDefaultAction:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCExpandedPlatterViewController", @"customContentRequestsDefaultAction:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"thumbnail"];
  v4 = [v3 accessibilityLabel];

  if (![v4 length])
  {
    v6 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"thumbnail"];

    if (v6)
    {
      uint64_t v5 = accessibilityLocalizedString(@"attachment.label");
      goto LABEL_7;
    }
  }
  if ([v4 isAXAttributedString]
    && [v4 hasAttribute:*MEMORY[0x263F21790]])
  {
    uint64_t v5 = 0;
LABEL_7:

    v4 = (void *)v5;
  }
  v7 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"_dateLabel"];
  v8 = [v7 accessibilityLabel];
  v9 = [(NCNotificationSeamlessContentViewAccessibility *)self safeStringForKey:@"primaryText"];
  v10 = [(NCNotificationSeamlessContentViewAccessibility *)self safeStringForKey:@"primarySubtitleText"];
  v11 = [(NCNotificationSeamlessContentViewAccessibility *)self _accessibilitySecondaryText];
  v12 = [(NCNotificationSeamlessContentViewAccessibility *)self safeStringForKey:@"importantText"];
  v15 = [(NCNotificationSeamlessContentViewAccessibility *)self safeStringForKey:@"footerText"];
  v13 = __UIAXStringForVariables();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(NCNotificationSeamlessContentViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:0];
  v4 = [v3 safeValueForKey:@"contentViewController"];
  uint64_t v5 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"delegate"];
  v6 = [v5 _accessibilityViewController];

  if (objc_opt_respondsToSelector())
  {
    v7 = v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_2;
    v11[3] = &unk_2651615D8;
    v8 = v4;
LABEL_5:
    v7[4] = v8;
    AXPerformSafeBlock();

    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    v7 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_3;
    v10[3] = &unk_2651615D8;
    v8 = v6;
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"NCNotificationListCell");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeDefaultAction:1];
}

uint64_t __71__NCNotificationSeamlessContentViewAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) customContentRequestsDefaultAction:0];
}

- (id)accessibilityCustomRotors
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationSeamlessContentViewAccessibility;
  id v3 = [(NCNotificationSeamlessContentViewAccessibility *)&v8 accessibilityCustomRotors];
  v4 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"_secondaryTextElement"];
  uint64_t v5 = [v4 accessibilityCustomRotors];

  v6 = [MEMORY[0x263EFF980] array];
  [v6 axSafelyAddObjectsFromArray:v3];
  [v6 axSafelyAddObjectsFromArray:v5];

  return v6;
}

- (id)_accessibilitySupportGesturesAttributes
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = @"AXSupportedGestureTypeKey";
  v5[1] = @"AXOrbGestureMode";
  v6[0] = &unk_26F81DF40;
  v6[1] = &unk_26F81DF58;
  id v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v3;
}

- (id)_accessibilitySecondaryText
{
  objc_opt_class();
  id v3 = [(NCNotificationSeamlessContentViewAccessibility *)self safeValueForKey:@"secondaryText"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end