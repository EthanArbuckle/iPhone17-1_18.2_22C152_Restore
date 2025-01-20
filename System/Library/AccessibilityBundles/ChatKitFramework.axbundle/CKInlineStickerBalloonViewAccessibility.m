@interface CKInlineStickerBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsAttachedToOutgoingMessage;
- (id)_axBalloonContentDescription;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKInlineStickerBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKInlineStickerBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKInlineStickerBalloonView" isKindOfClass:@"CKBalloonImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonImageView", @"stickerAccessibilityDescription", "@", 0);
}

- (id)accessibilityLabel
{
  if ([(CKInlineStickerBalloonViewAccessibility *)self _axIsAttachedToOutgoingMessage])
  {
    id v3 = [(CKInlineStickerBalloonViewAccessibility *)self _axBalloonContentDescription];
    v4 = accessibilityLocalizedString(@"sticker.attached");
    v5 = __UIAXStringForVariables();
  }
  else
  {
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsSafeCategory();
    v4 = [v3 _axMessageSender];
    v6 = [(CKInlineStickerBalloonViewAccessibility *)self _axBalloonContentDescription];
    v7 = [v3 _axStickerDescription];
    v8 = [v3 _axAcknowledgmentDescription];
    v10 = [v3 _axMessageTime];
    v5 = __UIAXStringForVariables();
  }

  return v5;
}

- (id)accessibilityCustomActions
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(CKInlineStickerBalloonViewAccessibility *)self _accessibilityValueForKey:@"AXPluginClearActionProvider"];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = accessibilityLocalizedString(@"app.browser.clear.action.name");
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v3 target:v2 selector:sel__accessibilityClearPlugin];
    v7[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)CKInlineStickerBalloonViewAccessibility;
  unint64_t v3 = [(CKInlineStickerBalloonViewAccessibility *)&v6 accessibilityTraits];
  if ([(CKInlineStickerBalloonViewAccessibility *)self _axIsAttachedToOutgoingMessage]) {
    uint64_t v4 = ~*MEMORY[0x263F1CEE8];
  }
  else {
    uint64_t v4 = -1;
  }
  return v4 & v3;
}

- (id)_axBalloonContentDescription
{
  v2 = [(CKInlineStickerBalloonViewAccessibility *)self safeValueForKey:@"stickerAccessibilityDescription"];
  if (v2)
  {
    unint64_t v3 = NSString;
    uint64_t v4 = accessibilityLocalizedString(@"sticker.label.format");
    v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
  }
  else
  {
    v5 = accessibilityLocalizedString(@"sticker.unknown");
  }

  return v5;
}

- (BOOL)_axIsAttachedToOutgoingMessage
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsSafeCategory();
  unint64_t v3 = [v2 _axChatItemForBalloon];
  BOOL v4 = v3 == 0;

  return v4;
}

@end