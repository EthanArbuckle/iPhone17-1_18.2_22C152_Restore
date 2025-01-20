@interface CKRichLinkReplyPreviewBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKRichLinkReplyPreviewBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKRichLinkReplyPreviewBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v3 = __UIAccessibilityCastAsSafeCategory();
  v4 = [(CKRichLinkReplyPreviewBalloonViewAccessibility *)self safeValueForKey:@"linkView"];
  v5 = [v4 accessibilityLabel];

  v6 = [v3 _axMessageSender];
  v7 = [v3 _axReplyDescription];
  v8 = [v3 _axStickerDescription];
  v9 = [v3 _axAcknowledgmentDescription];
  v12 = [v3 _axMessageTime];
  v10 = __UIAXStringForVariables();

  return v10;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityCustomActions
{
  v3 = [(CKRichLinkReplyPreviewBalloonViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1165 startWithSelf:1];
  v4 = v3;
  if (v3 && [v3 safeBoolForKey:@"isReplyContextPreview"])
  {
    v5 = [MEMORY[0x263EFF980] array];
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"balloon.message.openthread.action");
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__CKRichLinkReplyPreviewBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2;
    v11[3] = &unk_265112F48;
    objc_copyWeak(&v12, &location);
    v8 = (void *)[v6 initWithName:v7 actionHandler:v11];

    [v5 axSafelyAddObject:v8];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKRichLinkReplyPreviewBalloonViewAccessibility;
    v5 = [(CKRichLinkReplyPreviewBalloonViewAccessibility *)&v10 accessibilityCustomActions];
  }

  return v5;
}

uint64_t __76__CKRichLinkReplyPreviewBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Cktranscriptme_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __76__CKRichLinkReplyPreviewBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __76__CKRichLinkReplyPreviewBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) tapGestureRecognized:0];
}

@end