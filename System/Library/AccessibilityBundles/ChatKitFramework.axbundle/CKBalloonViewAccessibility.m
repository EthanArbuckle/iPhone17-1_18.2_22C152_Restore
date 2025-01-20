@interface CKBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsBalloonOfType:(id)a3;
- (BOOL)_axIsDigitalTouch;
- (BOOL)_axIsImessage;
- (BOOL)_axIsInNotification;
- (BOOL)_axIsMessageFromMe;
- (BOOL)_axIsTapbackBalloonView;
- (BOOL)_axIsTextMessage;
- (BOOL)_axIsVisibleInTapbackView;
- (BOOL)isAccessibilityElement;
- (id)_axAcknowledgmentDescription;
- (id)_axActionsForMenu:(id)a3;
- (id)_axBalloonViewCustomActions;
- (id)_axBuddyNameForBalloon;
- (id)_axChatItemForBalloon;
- (id)_axDigitalTouchDescription;
- (id)_axHighlightedDescription;
- (id)_axIndexPathForBalloon;
- (id)_axMessageForBalloon;
- (id)_axMessageSender;
- (id)_axMessageTime;
- (id)_axReplyDescription;
- (id)_axStickerDescription;
- (id)accessibilityCustomActions;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityTextualContext;
- (void)_axTapback;
- (void)axPerformInterfaceAction:(id)a3;
@end

@implementation CKBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBalloonView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"doubleTapGestureRecognized:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"tapGestureRecognized:", "v", "@", 0);
  [v3 validateClass:@"CKMessagePartChatItem" isKindOfClass:@"CKChatItem"];
  [v3 validateProtocol:@"CKBalloonViewDelegate" hasRequiredInstanceMethod:@"balloonViewTapped:withModifierFlags:selectedText:"];
  [v3 validateProtocol:@"CKBalloonViewDelegate" hasRequiredInstanceMethod:@"balloonViewDoubleTapped:"];
  [v3 validateProtocol:@"CKBalloonViewDelegate" hasRequiredInstanceMethod:@"balloonViewLongTouched:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"delegate", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagePartChatItem", @"message", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"isFromMe", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"hasMention", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"text", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"time", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"__ck_isiMessage", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"__ck_isSMS", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentMessagePartChatItem", @"mediaObject", "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObject", @"mediaType", "i", 0);
  [v3 validateClass:@"CKLocationMediaObject" isKindOfClass:@"CKMediaObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKLocationMediaObject", @"coordinate", "{CLLocationCoordinate2D=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatItem", @"IMChatItem", "@", 0);
  [v3 validateClass:@"IMTranscriptPluginChatItem" conformsToProtocol:@"IMPluginChatItemProtocol"];
  [v3 validateProtocol:@"IMPluginChatItemProtocol" hasRequiredInstanceMethod:@"type"];
  [v3 validateProtocol:@"IMPluginChatItemProtocol" hasRequiredInstanceMethod:@"dataSource"];
  [v3 validateClass:@"CKLocatingChatItem"];
  [v3 validateClass:@"CKMovieMediaObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIInterfaceAction", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIInterfaceAction", @"handler", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagePartChatItem", @"visibleAssociatedMessageChatItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatItem", @"isHighlighted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMovieMediaObject", @"isJellyfishVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"wantsReplyButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"showInlineReplyControllerForChatItem:presentKeyboard:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"presentStickerDetailControllerWithIndexPath:", "v", "@", 0);
  [v3 validateClass:@"CKFullScreenBalloonViewControllerPhone"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenBalloonViewControllerPhone", @"balloonView", "@", 0);
  [v3 validateClass:@"ChatKit.TapbackPickerTintableMessageBalloonView"];
  [v3 validateClass:@"ChatKit.TapbackPickerBalloonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBalloonView", @"invisibleInkEffectController", "@", 0);
  [v3 validateClass:@"CKInvisibleInkEffectController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKInvisibleInkEffectController", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKInvisibleInkEffectController", @"isSuspended", "B", 0);
  [v3 validateClass:@"CKTranscriptBalloonCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptMessageCell", @"isReply", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptMessageCell", @"isReplyContextPreview", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKRichLinkReplyPreviewBalloonView", @"linkView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(CKBalloonViewAccessibility *)self storedIsAccessibilityElement];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)accessibilityCustomActions
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v2 = [(CKBalloonViewAccessibility *)self safeValueForKey:@"superview"];

  if (v2)
  {
    id v21 = [MEMORY[0x263EFF980] array];
    id v3 = [(CKBalloonViewAccessibility *)self safeArrayForKey:@"_axBalloonViewCustomActions"];
    [v21 axSafelyAddObjectsFromArray:v3];

    if (![(CKBalloonViewAccessibility *)self _axIsInNotification])
    {
      char v4 = [(CKBalloonViewAccessibility *)self safeValueForKeyPath:@"delegate.delegate"];
      v5 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__4;
      v52 = __Block_byref_object_dispose__4;
      id v53 = 0;
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke;
      v44 = &unk_265112F70;
      v47 = &v48;
      id v45 = v4;
      v46 = self;
      AXPerformSafeBlock();
      id v6 = (id)v49[5];

      _Block_object_dispose(&v48, 8);
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__4;
      v52 = __Block_byref_object_dispose__4;
      id v53 = 0;
      uint64_t v33 = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      v35 = __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2;
      v36 = &unk_2651130C0;
      v40 = &v48;
      id v20 = v45;
      id v37 = v20;
      id v19 = v5;
      id v38 = v19;
      id v16 = v6;
      id v39 = v16;
      AXPerformSafeBlock();
      id v17 = (id)v49[5];

      _Block_object_dispose(&v48, 8);
      id obj = [(CKBalloonViewAccessibility *)self _axActionsForMenu:v17];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v54 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v30 != v8) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "safeStringForKey:", @"title", v16);
            if ([v11 length])
            {
              id v12 = objc_alloc(MEMORY[0x263F1C390]);
              v23[0] = MEMORY[0x263EF8330];
              v23[1] = 3221225472;
              v23[2] = __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3;
              v23[3] = &unk_2651130E8;
              id v13 = v11;
              id v24 = v13;
              id v25 = v20;
              v26 = self;
              id v27 = v19;
              v28 = v10;
              v14 = (void *)[v12 initWithName:v13 actionHandler:v23];
              [v21 axSafelyAddObject:v14];
            }
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v54 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _axIndexPathForBalloon];
  uint64_t v3 = [v2 _parentChatItemForIndexPath:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _menuForChatItem:*(void *)(a1 + 40) withParentChatItem:*(void *)(a1 + 48) menuAppearance:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = accessibilityLocalizedString(@"balloon.message.sticker.details");
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    id v10 = *(id *)(a1 + 40);
    AXPerformSafeBlock();
    uint64_t v4 = v10;
  }
  else
  {
    if (![*(id *)(a1 + 40) safeBoolForKey:@"wantsReplyButton"]
      || (v5 = *(void **)(a1 + 32),
          accessibilityLocalizedString(@"balloon.message.reply"),
          id v6 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v5) = [v5 isEqualToString:v6],
          v6,
          !v5))
    {
      [*(id *)(a1 + 48) axPerformInterfaceAction:*(void *)(a1 + 64)];
      return 1;
    }
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    AXPerformSafeBlock();

    uint64_t v4 = v8;
  }

  return 1;
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__4;
  id v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = *(void *)(a1 + 40);
  AXPerformSafeBlock();
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  objc_msgSend(v1, "presentStickerDetailControllerWithIndexPath:", v2, v3, 3221225472, __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_5, &unk_265112D10, v4, &v5);
}

uint64_t __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _axIndexPathForBalloon];

  return MEMORY[0x270F9A758]();
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__4;
  id v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  uint64_t v3 = MEMORY[0x263EF8330];
  id v4 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
  id v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "showInlineReplyControllerForChatItem:presentKeyboard:", v2, 1, v3, 3221225472, __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_7, &unk_265112D10);
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
}

- (id)_axActionsForMenu:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v4, "children", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 safeUnsignedIntegerForKey:@"options"])
          {
            id v12 = [(CKBalloonViewAccessibility *)self _axActionsForMenu:v11];
            [v5 axSafelyAddObjectsFromArray:v12];
          }
        }
        else
        {
          [v5 axSafelyAddObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_axBalloonViewCustomActions
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(CKBalloonViewAccessibility *)self _axIsInNotification]
    || [(CKBalloonViewAccessibility *)self _axIsVisibleInTapbackView]
    && (![(CKBalloonViewAccessibility *)self _axIsVisibleInTapbackView]
     || [(CKBalloonViewAccessibility *)self _axIsTapbackBalloonView]))
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v5 = accessibilityLocalizedString(@"acknowledgments.action.title");
    id v6 = (void *)[v4 initWithName:v5 target:self selector:sel__axTapback];

    v8[0] = v6;
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }

  return v3;
}

- (void)_axTapback
{
  id v2 = [(CKBalloonViewAccessibility *)self safeValueForKey:@"superview"];

  if (v2)
  {
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

uint64_t __40__CKBalloonViewAccessibility__axTapback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doubleTapGestureRecognized:0];
}

- (void)axPerformInterfaceAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonViewAccessibility *)self safeValueForKey:@"superview"];

  if (v5 && ![(CKBalloonViewAccessibility *)self _axIsInNotification])
  {
    id v6 = [v4 safeValueForKey:@"handler"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
        id v7 = v4;
        AXPerformSafeBlock();
      }
    }
  }
}

uint64_t __55__CKBalloonViewAccessibility_axPerformInterfaceAction___block_invoke(uint64_t a1)
{
  char v2 = 0;
  return (*(uint64_t (**)(void, void, char *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), &v2);
}

- (id)_axIndexPathForBalloon
{
  uint64_t v3 = [(CKBalloonViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v4 = [v3 safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Cktranscriptco.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(CKBalloonViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    if (v5)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x3032000000;
      id v13 = __Block_byref_object_copy__4;
      long long v14 = __Block_byref_object_dispose__4;
      id v15 = 0;
      id v8 = v3;
      id v9 = v5;
      AXPerformSafeBlock();
      id v6 = (id)v11[5];

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __52__CKBalloonViewAccessibility__axIndexPathForBalloon__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axChatItemForBalloon
{
  uint64_t v3 = [(CKBalloonViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v4 = [v3 safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Cktranscriptco.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(CKBalloonViewAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    if (v5)
    {
      [v4 safeValueForKey:@"chatItems"];
      uint64_t v9 = 0;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x3032000000;
      uint64_t v12 = __Block_byref_object_copy__4;
      id v13 = __Block_byref_object_dispose__4;
      id v14 = 0;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      id v6 = (id)v10[5];

      _Block_object_dispose(&v9, 8);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __51__CKBalloonViewAccessibility__axChatItemForBalloon__block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _axIndexPathForBalloon];
  uint64_t v3 = objc_msgSend(v2, "objectAtIndex:", objc_msgSend(v6, "row"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axMessageForBalloon
{
  char v2 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
  NSClassFromString(&cfstr_Ckmessagepartc.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 safeValueForKey:@"message"];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_axBuddyNameForBalloon
{
  char v2 = [(CKBalloonViewAccessibility *)self _axMessageForBalloon];
  uint64_t v3 = [v2 safeValueForKey:@"sender"];
  uint64_t v4 = [v3 safeValueForKey:@"name"];

  return v4;
}

- (BOOL)_axIsMessageFromMe
{
  char v2 = [(CKBalloonViewAccessibility *)self _axMessageForBalloon];
  char v3 = [v2 safeBoolForKey:@"isFromMe"];

  return v3;
}

- (BOOL)_axIsImessage
{
  char v2 = [(CKBalloonViewAccessibility *)self _axMessageForBalloon];
  char v3 = [v2 safeBoolForKey:@"__ck_isiMessage"];

  return v3;
}

- (BOOL)_axIsTextMessage
{
  char v2 = [(CKBalloonViewAccessibility *)self _axMessageForBalloon];
  char v3 = [v2 safeBoolForKey:@"__ck_isSMS"];

  return v3;
}

- (BOOL)_axIsDigitalTouch
{
  return [(CKBalloonViewAccessibility *)self _axIsBalloonOfType:@"com.apple.DigitalTouchBalloonProvider"];
}

- (id)_axReplyDescription
{
  char v2 = [(CKBalloonViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:1];
  if ([v2 safeBoolForKey:@"isReply"])
  {
    char v3 = @"balloon.message.reply";
LABEL_5:
    uint64_t v4 = accessibilityLocalizedString(v3);
    goto LABEL_7;
  }
  if ([v2 safeBoolForKey:@"isReplyContextPreview"])
  {
    char v3 = @"balloon.message.reply.preview";
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

uint64_t __49__CKBalloonViewAccessibility__axReplyDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Cktranscriptme_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axDigitalTouchDescription
{
  id v2 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
  char v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 safeValueForKeyPath:@"IMChatItem.dataSource"];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 safeArrayForKey:@"createSessionMessages"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 firstObject],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    id v7 = [v6 accessibilityLabel];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_axMessageTime
{
  id v2 = [(CKBalloonViewAccessibility *)self _axMessageForBalloon];
  char v3 = [v2 safeValueForKey:@"time"];
  uint64_t v4 = AXDateStringForFormat();

  return v4;
}

- (BOOL)_axIsBalloonOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBalloonViewAccessibility *)self safeValueForKey:@"_axChatItemForBalloon"];
  id v6 = __UIAccessibilitySafeClass();

  id v7 = [v6 safeValueForKey:@"IMChatItem"];
  id v8 = NSProtocolFromString(&cfstr_Impluginchatit.isa);
  int v9 = [v7 conformsToProtocol:v8];

  if (v9)
  {
    uint64_t v10 = [v7 safeValueForKey:@"type"];
    char v11 = [v10 isEqualToString:v4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_axMessageSender
{
  BOOL v3 = [(CKBalloonViewAccessibility *)self _axIsMessageFromMe];
  BOOL v4 = [(CKBalloonViewAccessibility *)self _axIsImessage];
  uint64_t v5 = [(CKBalloonViewAccessibility *)self _axBuddyNameForBalloon];
  id v6 = v5;
  if (v3)
  {
    if (v4) {
      id v7 = @"balloon.your.imessage";
    }
    else {
      id v7 = @"balloon.your.textmessage";
    }
  }
  else
  {
    if ([v5 length])
    {
      id v8 = v6;
      goto LABEL_9;
    }
    id v7 = @"balloon.message";
  }
  accessibilityLocalizedString(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  int v9 = v8;

  return v9;
}

- (id)_axHighlightedDescription
{
  id v2 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
  int v3 = [v2 safeBoolForKey:@"isHighlighted"];

  if (v3)
  {
    BOOL v4 = accessibilityLocalizedString(@"balloon.message.pinned");
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_axStickerDescription
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
  char v19 = 0;
  objc_opt_class();
  int v3 = [v2 safeValueForKey:@"visibleAssociatedMessageChatItems"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v6)
  {
    id v13 = 0;
    uint64_t v12 = v5;
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      NSClassFromString(&cfstr_Ckassociatedst.isa);
      v8 += objc_opt_isKindOfClass() & 1;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  }
  while (v7);

  if (v8)
  {
    char v11 = NSString;
    uint64_t v12 = accessibilityLocalizedString(@"stickers.count");
    id v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v8);
LABEL_11:

    goto LABEL_13;
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (id)_axAcknowledgmentDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_opt_class();
  int v3 = [(CKBalloonViewAccessibility *)self _axChatItemForBalloon];
  BOOL v4 = [v3 safeValueForKey:@"visibleAssociatedMessageChatItems"];
  id v5 = __UIAccessibilityCastAsClass();

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      char v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      NSClassFromString(&cfstr_Ckaggregateack_2.isa);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v11;

    if (v13)
    {
      uint64_t v12 = objc_msgSend(v13, "accessibilityLabel", (void)v15);
      goto LABEL_12;
    }
    uint64_t v12 = 0;
  }
  else
  {
LABEL_9:
    uint64_t v12 = 0;
    id v13 = v6;
LABEL_12:
  }

  return v12;
}

- (BOOL)_axIsInNotification
{
  id v2 = [(CKBalloonViewAccessibility *)self safeValueForKeyPath:@"delegate.delegate"];
  char v3 = [v2 _accessibilityBoolValueForKey:@"AXTranscriptIsInNotification"];

  return v3;
}

- (BOOL)_axIsTapbackBalloonView
{
  BOOL v3 = [(CKBalloonViewAccessibility *)self _axIsVisibleInTapbackView];
  if (v3)
  {
    BOOL v4 = [(CKBalloonViewAccessibility *)self accessibilityContainer];
    id v5 = [v4 _accessibilityViewController];

    id v6 = [v5 safeValueForKey:@"balloonView"];
    char v7 = [v6 isEqual:self];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_axIsVisibleInTapbackView
{
  BOOL v3 = [(CKBalloonViewAccessibility *)self accessibilityContainer];
  BOOL v4 = [v3 _accessibilityViewController];

  NSClassFromString(&cfstr_Ckfullscreenba_1.isa);
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v6 = [(CKBalloonViewAccessibility *)self accessibilityContainer];
    NSClassFromString(&cfstr_ChatkitTapback_4.isa);
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      char v7 = [(CKBalloonViewAccessibility *)self accessibilityContainer];
      NSClassFromString(&cfstr_ChatkitTapback_5.isa);
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (id)accessibilityTextualContext
{
  return (id)*MEMORY[0x263F1CED0];
}

- (id)accessibilityDropPointDescriptors
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C3B8]);
  BOOL v4 = accessibilityLocalizedString(@"drop.into.compose");
  id v5 = (void *)[v3 initWithName:v4 view:self];
  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

@end