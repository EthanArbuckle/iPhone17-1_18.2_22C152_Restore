@interface NCNotificationContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupportGesturesAttributes;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCNotificationContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"primaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"primarySubtitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"secondaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"summaryText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"thumbnail", "@", 0);
  [v3 validateClass:@"NCNotificationListCell"];
  [v3 validateClass:@"NCNotificationListCell" hasInstanceVariable:@"_contentViewController" withType:"UIViewController<NCNotificationListDimmable>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_executeDefaultAction:", "v", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"thumbnail"];
  v4 = [v3 accessibilityLabel];

  if (![v4 length])
  {
    v6 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"thumbnail"];

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
  v7 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"primaryText"];
  v8 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"primarySubtitleText"];
  v9 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"secondaryText"];
  v12 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"summaryText"];
  v10 = __UIAXStringForVariables();

  return v10;
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
  v2 = [(NCNotificationContentViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_4 startWithSelf:0];
  id v3 = v2;
  if (v2)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return 1;
}

uint64_t __63__NCNotificationContentViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"NCNotificationListCell");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __63__NCNotificationContentViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"_contentViewController"];
  [v1 _executeDefaultAction:1];
}

- (id)accessibilityCustomRotors
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationContentViewAccessibility;
  id v3 = [(NCNotificationContentViewAccessibility *)&v8 accessibilityCustomRotors];
  v4 = [(NCNotificationContentViewAccessibility *)self safeValueForKey:@"secondaryTextView"];
  id v5 = [v4 accessibilityCustomRotors];

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
  v6[0] = &unk_26F81DF70;
  v6[1] = &unk_26F81DF88;
  id v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v3;
}

@end