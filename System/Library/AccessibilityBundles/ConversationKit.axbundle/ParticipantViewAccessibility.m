@interface ParticipantViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsLocalParticipantExpanded;
- (BOOL)_accessibilityIsLocalParticipantFullScreen;
- (BOOL)_axHandleKickMemberAction;
- (BOOL)_axHandleSingleTap;
- (BOOL)_axHandleTakeLivePhotoAction;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityMonogramView;
- (id)_accessibilityMultiwayViewController;
- (id)_accessibilityVideoOverlayView;
- (id)_accessibilityVideoView;
- (id)_axConstraintsController;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation ParticipantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.ParticipantViewLabelContainerView"];
  [v3 validateClass:@"ConversationKit.ParticipantMonogramView"];
  [v3 validateClass:@"ConversationKit.ParticipantVideoView"];
  [v3 validateClass:@"ConversationKit.ParticipantVideoOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantView", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantView", @"isInRoster", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantView", @"infoView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.TapInteraction", @"numberOfTapsRequired", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.TapInteraction", @"handleRecognizer:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantInfoView", @"isMomentsAvailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"accessibilityConstraintController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNKFaceTimeConstraintsController", @"localParticipantState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantInfoView", @"didTapShutterButton", "v", 0);
  [v3 validateClass:@"ConversationKit.MultiwayViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"mediaPipFrameInWindowScene", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantView", @"kickMemberButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ParticipantView", @"monogramView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  if ([(ParticipantViewAccessibility *)self _accessibilityIsLocalParticipantExpanded])
  {
    return 1;
  }

  return [(ParticipantViewAccessibility *)self _accessibilityIsLocalParticipantFullScreen];
}

- (id)accessibilityLabel
{
  id v3 = [(ParticipantViewAccessibility *)self _accessibilityMonogramView];
  char v4 = [v3 isHidden];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(ParticipantViewAccessibility *)self _accessibilityMonogramView];
    v5 = [v6 accessibilityLabel];
  }
  if ([v5 length])
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(ParticipantViewAccessibility *)self safeValueForKey:@"infoView"];
    id v7 = [v8 accessibilityLabel];
  }

  return v7;
}

- (id)accessibilityValue
{
  if ([(ParticipantViewAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    id v3 = accessibilityLocalizedString(@"fullscreen");
  }
  else
  {
    id v3 = 0;
  }
  char v4 = [(ParticipantViewAccessibility *)self _accessibilityVideoOverlayView];
  if ([v4 isHidden])
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 accessibilityLabel];
  }
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityCustomActions
{
  id v3 = [(ParticipantViewAccessibility *)self _accessibilityMultiwayViewController];
  [v3 safeCGRectForKey:@"mediaPipFrameInWindowScene"];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  if (CGRectEqualToRect(v33, *MEMORY[0x263F001A8]))
  {
    v13 = [(ParticipantViewAccessibility *)self _accessibilityVideoView];
    if (([v13 isHidden] & 1) == 0)
    {
      char v14 = [(ParticipantViewAccessibility *)self safeBoolForKey:@"isInRoster"];

      if (v14)
      {
LABEL_11:
        v29 = [(ParticipantViewAccessibility *)self safeValueForKey:@"monogramView"];
        v30 = [v29 accessibilityCustomActions];
        [v12 addObjectsFromArray:v30];

        goto LABEL_12;
      }
      int v15 = [(ParticipantViewAccessibility *)self safeBoolForKey:@"isExpanded"];
      v16 = @"enter.fullscreen";
      if (v15) {
        v16 = @"exit.fullscreen";
      }
      v17 = (objc_class *)MEMORY[0x263F1C390];
      v18 = v16;
      id v19 = [v17 alloc];
      v20 = accessibilityLocalizedString(v18);

      v21 = (void *)[v19 initWithName:v20 target:self selector:sel__axHandleSingleTap];
      [v12 addObject:v21];

      v22 = [(ParticipantViewAccessibility *)self safeValueForKey:@"infoView"];
      LODWORD(v18) = [v22 safeBoolForKey:@"isMomentsAvailable"];

      if (v18)
      {
        id v23 = objc_alloc(MEMORY[0x263F1C390]);
        v24 = accessibilityLocalizedString(@"take.live.photo");
        v25 = (void *)[v23 initWithName:v24 target:self selector:sel__axHandleTakeLivePhotoAction];
        [v12 addObject:v25];
      }
      v13 = [(ParticipantViewAccessibility *)self safeUIViewForKey:@"kickMemberButton"];
      if ([v13 _accessibilityViewIsVisible])
      {
        id v26 = objc_alloc(MEMORY[0x263F1C390]);
        v27 = accessibilityLocalizedString(@"kick.member");
        v28 = (void *)[v26 initWithName:v27 target:self selector:sel__axHandleKickMemberAction];
        [v12 addObject:v28];
      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (BOOL)_axHandleSingleTap
{
  return 1;
}

void __50__ParticipantViewAccessibility__axHandleSingleTap__block_invoke()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 interactions];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_7];
}

void __50__ParticipantViewAccessibility__axHandleSingleTap__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 safeIntegerForKey:@"numberOfTapsRequired"] == 1)
  {
    CGFloat v5 = objc_alloc_init(AX_RecognizedTapGestureRecognizer);
    [v6 handleRecognizer:v5];

    *a4 = 1;
  }
}

- (BOOL)_axHandleTakeLivePhotoAction
{
  return 1;
}

void __60__ParticipantViewAccessibility__axHandleTakeLivePhotoAction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"infoView"];
  [v1 didTapShutterButton];
}

- (BOOL)_axHandleKickMemberAction
{
  v2 = [(ParticipantViewAccessibility *)self safeValueForKey:@"kickMemberButton"];
  id v3 = __UIAccessibilitySafeClass();

  [v3 sendActionsForControlEvents:64];
  return v3 != 0;
}

- (id)automationElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  double v4 = [(ParticipantViewAccessibility *)self safeValueForKey:@"infoView"];
  CGFloat v5 = [(ParticipantViewAccessibility *)self safeValueForKey:@"kickMemberButton"];
  id v6 = [(ParticipantViewAccessibility *)self safeValueForKeyPath:@"monogramView"];
  CGFloat v7 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);

  return v7;
}

- (BOOL)_accessibilityIsLocalParticipantExpanded
{
  v2 = [(ParticipantViewAccessibility *)self _axConstraintsController];
  BOOL v3 = [v2 safeIntegerForKey:@"localParticipantState"] == 2;

  return v3;
}

- (BOOL)_accessibilityIsLocalParticipantFullScreen
{
  v2 = [(ParticipantViewAccessibility *)self _axConstraintsController];
  BOOL v3 = [v2 safeIntegerForKey:@"localParticipantState"] == 3;

  return v3;
}

- (id)_axConstraintsController
{
  v2 = [(ParticipantViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_374 startWithSelf:1];
  BOOL v3 = [v2 _accessibilityViewController];
  double v4 = [v3 safeValueForKey:@"accessibilityConstraintController"];

  return v4;
}

uint64_t __56__ParticipantViewAccessibility__axConstraintsController__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityMonogramView
{
  objc_opt_class();
  BOOL v3 = [(ParticipantViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456492E0](@"ConversationKit.ParticipantMonogramView")];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_accessibilityVideoView
{
  objc_opt_class();
  BOOL v3 = [(ParticipantViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456492E0](@"ConversationKit.ParticipantVideoView")];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_accessibilityVideoOverlayView
{
  objc_opt_class();
  BOOL v3 = [(ParticipantViewAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x2456492E0](@"ConversationKit.ParticipantVideoOverlayView")];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_accessibilityMultiwayViewController
{
  v2 = [(ParticipantViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_376 startWithSelf:0];
  BOOL v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __68__ParticipantViewAccessibility__accessibilityMultiwayViewController__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end