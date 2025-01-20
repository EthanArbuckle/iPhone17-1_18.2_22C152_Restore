@interface LocalParticipantViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsExpanded;
- (BOOL)_accessibilityIsFullScreen;
- (BOOL)_axHandleLongPress;
- (BOOL)_axIsShowingVideo;
- (BOOL)_axReactionsVisible;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axConstraintsController;
- (id)_axGetParticipantView;
- (id)_axMultiwayViewController;
- (id)_axParticipantView;
- (id)accessibilityAttributedLabel;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axSetParticipantView:(id)a3;
- (void)updateCountdownWith:(int64_t)a3;
@end

@implementation LocalParticipantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.LocalParticipantView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"accessibilityConstraintController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"toggleReactionsView", "v", 0);
  [v3 validateClass:@"ConversationKit.MultiwayViewController" hasProperty:@"reactionsViewController" withType:"@"];
  [v3 validateClass:@"ConversationKit.VideoReactionPickerViewController" hasProperty:@"view" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNKFaceTimeConstraintsController", @"localParticipantState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ParticipantViewAccessibility", @"_accessibilityVideoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantView", @"controlsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"collapseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantView", @"updateCountdownWith:", "v", "q", 0);
}

- (id)_axGetParticipantView
{
}

- (void)_axSetParticipantView:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return ![(LocalParticipantViewAccessibility *)self _accessibilityIsFullScreen];
}

- (id)accessibilityAttributedLabel
{
  id v3 = accessibilityLocalizedString(@"participant.video");
  v4 = [(LocalParticipantViewAccessibility *)self _axParticipantView];
  v12 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F089B8]), "initWithString:", v5, v12, @"__AXStringForVariablesSentinel");
  uint64_t v7 = *MEMORY[0x263F1CEB0];
  uint64_t v8 = [v3 length];
  uint64_t v9 = [v5 length];
  uint64_t v10 = [v3 length];
  objc_msgSend(v6, "addAttribute:value:range:", v7, MEMORY[0x263EFFA88], v8, v9 - v10);

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(LocalParticipantViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_6 startWithSelf:1];
  v4 = [v3 _accessibilityFindDescendant:&__block_literal_global_328];
  if ([(LocalParticipantViewAccessibility *)self _accessibilityIsExpanded])
  {
    v5 = accessibilityLocalizedString(@"fullscreen");
  }
  else
  {
    v5 = 0;
  }
  if ([(LocalParticipantViewAccessibility *)self _axIsShowingVideo]) {
    [v4 accessibilityValue];
  }
  else {
  uint64_t v8 = accessibilityLocalizedString(@"video.hidden");
  }
  v6 = __UIAXStringForVariables();

  return v6;
}

uint64_t __55__LocalParticipantViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __55__LocalParticipantViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"AXCFXViewFinder"];

  return v3;
}

- (id)accessibilityHint
{
  BOOL v3 = [(LocalParticipantViewAccessibility *)self _accessibilityIsExpanded];
  BOOL v4 = [(LocalParticipantViewAccessibility *)self _axReactionsVisible];
  if ([(LocalParticipantViewAccessibility *)self _axIsShowingVideo])
  {
    if (v3 || v4) {
      v5 = @"minimize.hint";
    }
    else {
      v5 = @"maximize.hint";
    }
    v6 = accessibilityLocalizedString(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axIsShowingVideo];
  BOOL v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    BOOL v3 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v3;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(LocalParticipantViewAccessibility *)self _axParticipantView];
  BOOL v4 = [(LocalParticipantViewAccessibility *)self _accessibilityIsExpanded];
  BOOL v5 = [(LocalParticipantViewAccessibility *)self _axReactionsVisible];
  if ([(LocalParticipantViewAccessibility *)self _axIsShowingVideo])
  {
    if (v4)
    {
      objc_opt_class();
      uint64_t v7 = [(LocalParticipantViewAccessibility *)self safeValueForKeyPath:@"controlsView.collapseButton"];
      v6 = __UIAccessibilityCastAsClass();

      LOBYTE(v7) = v6 != 0;
      if (v6)
      {
        [v6 sendActionsForControlEvents:64];
        UIAccessibilityNotifications v8 = *MEMORY[0x263F1CDC8];
        uint64_t v9 = accessibilityLocalizedString(@"minimized.local");
        UIAccessibilityPostNotification(v8, v9);

        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
      }
    }
    else
    {
      uint64_t v7 = [v3 safeValueForKey:@"_axHandleSingleTap"];

      if (v7)
      {
        LODWORD(v7) = *MEMORY[0x263F1CDC8];
        if (v5) {
          uint64_t v10 = @"minimized.local";
        }
        else {
          uint64_t v10 = @"maximized.local";
        }
        v11 = accessibilityLocalizedString(v10);
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v11);

        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
        LOBYTE(v7) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3 = [(LocalParticipantViewAccessibility *)self _accessibilityIsExpanded];
  if ([(LocalParticipantViewAccessibility *)self _axReactionsVisible])
  {
    BOOL v4 = [(LocalParticipantViewAccessibility *)self _axParticipantView];
    BOOL v5 = [v4 safeValueForKey:@"_axHandleSingleTap"];

    if (v5)
    {
      UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
      uint64_t v7 = accessibilityLocalizedString(@"minimized.local");
      UIAccessibilityPostNotification(v6, v7);

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
      return 1;
    }
  }
  if (!v3) {
    return 0;
  }
  objc_opt_class();
  uint64_t v9 = [(LocalParticipantViewAccessibility *)self safeValueForKeyPath:@"controlsView.collapseButton"];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  BOOL v8 = v10 != 0;
  if (v10)
  {
    [v10 sendActionsForControlEvents:64];
    UIAccessibilityNotifications v11 = *MEMORY[0x263F1CDC8];
    v12 = accessibilityLocalizedString(@"minimized.local");
    UIAccessibilityPostNotification(v11, v12);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }

  return v8;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (![(LocalParticipantViewAccessibility *)self _axReactionsVisible]
    && ![(LocalParticipantViewAccessibility *)self _accessibilityIsExpanded])
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    BOOL v5 = accessibilityLocalizedString(@"camera.open.reactions");
    UIAccessibilityNotifications v6 = (void *)[v4 initWithName:v5 target:self selector:sel__axHandleLongPress];
    [v3 addObject:v6];
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  BOOL v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(LocalParticipantViewAccessibility *)self safeValueForKey:@"controlsView"];
  id v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (void)updateCountdownWith:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LocalParticipantViewAccessibility;
  -[LocalParticipantViewAccessibility updateCountdownWith:](&v6, sel_updateCountdownWith_);
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  BOOL v5 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", a3);
  UIAccessibilityPostNotification(v4, v5);
}

- (BOOL)_axIsShowingVideo
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axParticipantView];
  id v3 = [v2 safeUIViewForKey:@"_accessibilityVideoView"];
  char v4 = [v3 isHidden] ^ 1;

  return v4;
}

- (BOOL)_axReactionsVisible
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axMultiwayViewController];
  char v3 = [v2 safeBoolForKey:@"isShowingReactions"];

  return v3;
}

- (id)_axParticipantView
{
  char v3 = [(LocalParticipantViewAccessibility *)self _axGetParticipantView];
  if (!v3)
  {
    char v3 = [(LocalParticipantViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456492E0](@"ConversationKit.ParticipantView")];
    [(LocalParticipantViewAccessibility *)self _axSetParticipantView:v3];
  }

  return v3;
}

- (id)_axMultiwayViewController
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_377 startWithSelf:1];
  char v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __62__LocalParticipantViewAccessibility__axMultiwayViewController__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axConstraintsController
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axMultiwayViewController];
  char v3 = [v2 safeValueForKey:@"accessibilityConstraintController"];

  return v3;
}

- (BOOL)_accessibilityIsExpanded
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axConstraintsController];
  uint64_t v3 = [v2 safeIntegerForKey:@"localParticipantState"];

  return v3 == 2;
}

- (BOOL)_accessibilityIsFullScreen
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axConstraintsController];
  uint64_t v3 = [v2 safeIntegerForKey:@"localParticipantState"];

  return v3 == 3;
}

- (BOOL)_axHandleLongPress
{
  BOOL v2 = [(LocalParticipantViewAccessibility *)self _axMultiwayViewController];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke;
  UIAccessibilityNotifications v11 = &unk_265119EE8;
  id v12 = v2;
  AXPerformSafeBlock();
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke_2;
  v6[3] = &unk_265119EE8;
  id v7 = v12;
  id v4 = v12;
  dispatch_after(v3, MEMORY[0x263EF83A0], v6);

  return 1;
}

uint64_t __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleReactionsView];
}

void __55__LocalParticipantViewAccessibility__axHandleLongPress__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"reactionsViewController"];
  v1 = [v2 safeValueForKey:@"view"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v1);
}

@end