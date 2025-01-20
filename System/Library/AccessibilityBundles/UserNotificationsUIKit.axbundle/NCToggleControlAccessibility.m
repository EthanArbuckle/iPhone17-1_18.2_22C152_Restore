@interface NCToggleControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformPreviewInteractionAction;
- (BOOL)accessibilityActivate;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_axSetPreviewInteractionAncestorsModal:(BOOL)a3;
- (void)clickInteractionPresenterDidDismiss:(id)a3;
- (void)clickInteractionPresenterDidPresent:(id)a3;
@end

@implementation NCToggleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCToggleControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    [v3 validateClass:@"SBFTouchPassThroughView"];
    [v3 validateClass:@"CSCoverSheetViewBase"];
  }
  [v3 validateClass:@"NCNotificationListCoalescingControlsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCToggleControl", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCToggleControl", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCToggleControl", @"_previewInteractionPlatterPresenter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCToggleControl", @"clickInteractionPresenterDidPresent:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCToggleControl", @"clickInteractionPresenterDidDismiss:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCClickInteractionPresenter", @"_presentedControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCClickInteractionPresenter", @"_containerView", "@", 0);
  [v3 validateClass:@"NCClickInteractionPresentedControl" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCoalescingHeaderCell", @"handlerDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCoalescingControlsCell", @"handlerDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationGroupList", @"leadingNotificationRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRequest", @"content", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContent", @"header", "@", 0);
}

- (BOOL)accessibilityActivate
{
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControlAccessibility;
  return [(NCToggleControlAccessibility *)&v4 accessibilityActivate];
}

- (id)accessibilityLabel
{
  id v3 = [(NCToggleControlAccessibility *)self safeStringForKey:@"title"];
  if ([v3 length])
  {
    if ([(NCToggleControlAccessibility *)self safeBoolForKey:@"isExpanded"])
    {
      objc_super v4 = NSString;
      v5 = accessibilityLocalizedString(@"confirm.action");
      v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);

      goto LABEL_7;
    }
    id v7 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCToggleControlAccessibility;
    id v7 = [(NCToggleControlAccessibility *)&v9 accessibilityLabel];
  }
  v6 = v7;
LABEL_7:

  return v6;
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(NCToggleControlAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  objc_super v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 safeValueForKey:@"handlerDelegate"];
  v6 = [v5 safeValueForKey:@"leadingNotificationRequest"];
  id v7 = [v6 safeValueForKey:@"content"];
  v8 = [v7 safeStringForKey:@"header"];

  return v8;
}

- (id)accessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = [(NCToggleControlAccessibility *)self safeValueForKey:@"_previewInteractionPlatterPresenter"];
  objc_super v4 = [v3 safeValueForKey:@"_presentedControl"];
  v5 = [v4 accessibilityLabel];

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v5 target:self selector:sel__axPerformPreviewInteractionAction];
    v9[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_axPerformPreviewInteractionAction
{
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_opt_class();
  id v3 = [(NCToggleControlAccessibility *)self safeValueForKey:@"_previewInteractionPlatterPresenter"];
  objc_super v4 = [v3 safeValueForKey:@"_presentedControl"];
  v5 = __UIAccessibilityCastAsClass();

  [v5 sendActionsForControlEvents:64];
  return 1;
}

- (void)_axSetPreviewInteractionAncestorsModal:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NCToggleControlAccessibility *)self safeValueForKey:@"_previewInteractionPlatterPresenter"];
  id v8 = [v5 safeValueForKey:@"_containerView"];

  [v8 setAccessibilityViewIsModal:v3];
  v6 = [(NCToggleControlAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456680B0](@"SBFPagedScrollView")];
  [v6 setAccessibilityViewIsModal:v3];

  id v7 = [(NCToggleControlAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_11 startWithSelf:0];
  [v7 setAccessibilityViewIsModal:v3];
}

uint64_t __71__NCToggleControlAccessibility__axSetPreviewInteractionAncestorsModal___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456680B0](@"SBFTouchPassThroughView");
  if (objc_opt_isKindOfClass())
  {
    MEMORY[0x2456680B0](@"CSCoverSheetViewBase");
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

- (void)clickInteractionPresenterDidPresent:(id)a3
{
  char v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)NCToggleControlAccessibility;
  id v4 = a3;
  [(NCToggleControlAccessibility *)&v6 clickInteractionPresenterDidPresent:v4];
  -[NCToggleControlAccessibility _axSetPreviewInteractionAncestorsModal:](v3, "_axSetPreviewInteractionAncestorsModal:", 1, v6.receiver, v6.super_class);
  LODWORD(v3) = *MEMORY[0x263F1CE18];
  v5 = [v4 safeValueForKey:@"_presentedControl"];

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v5);
}

- (void)clickInteractionPresenterDidDismiss:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControlAccessibility;
  [(NCToggleControlAccessibility *)&v4 clickInteractionPresenterDidDismiss:a3];
  [(NCToggleControlAccessibility *)self _axSetPreviewInteractionAncestorsModal:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

@end