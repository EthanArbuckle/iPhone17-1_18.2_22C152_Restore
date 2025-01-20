@interface CKChatControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)_axCurrentTargetBalloonView;
- (id)_axDescriptionForMessageEffectIdentifier:(id)a3;
- (id)_axFocusedChatItemElement;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)editingToolbarItems;
- (int64_t)_axCurrentLayoutIntent;
- (unint64_t)_axLayoutIntentForTarget:(id)a3 inBalloonView:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityReloadElementRelations:(BOOL)a3;
- (void)_axSetCurrentLayoutIntent:(int64_t)a3;
- (void)_axSetCurrentTargetBalloonView:(id)a3;
- (void)_axSetFocusedChatItemElement:(id)a3;
- (void)_axUpdateEditingToolbarItems:(id)a3;
- (void)_dealloc;
- (void)_showPhotoPickerWithSourceType:(int64_t)a3;
- (void)_showVCalViewerForMediaObject:(id)a3;
- (void)actionMenuGestureRecognizerButtonGestureDidEnd:(id)a3;
- (void)dismissInlineReplyController:(BOOL)a3;
- (void)dragManagerDidBeginDragging:(id)a3;
- (void)dragManagerDidEndDragging:(id)a3;
- (void)messageEntryViewSendButtonHit:(id)a3;
- (void)sendSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5;
- (void)setEffectPickerWindow:(id)a3;
- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4;
- (void)transcriptCollectionViewController:(id)a3 willBeginImpactEffectAnimationWithSendAnimationContext:(id)a4;
@end

@implementation CKChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKChatController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFocusedChatItemElement
{
}

- (void)_axSetFocusedChatItemElement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"editingToolbarItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"actionMenuGestureRecognizerButtonGestureDidEnd:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"videoMessageRecordingViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"setEffectPickerWindow:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"transcriptCollectionViewController: willBeginImpactEffectAnimationWithSendAnimationContext:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"videoActionMenuController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuController", @"actionMenuItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuItem", @"view", "@", 0);
  [v3 validateClass:@"CKChatController" isKindOfClass:@"CKCoreChatController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"collectionViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagePartChatItem", @"message", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"isFromMe", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"sender", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"subject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMHandle", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"__ck_isiMessage", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"dragManagerDidBeginDragging:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"dropInteraction: sessionDidUpdate:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"dragManagerDidEndDragging:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"selectedBalloonForTarget:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"_selectedBalloonFromTouchForDropSession:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"sendSticker: withDragTarget: draggedSticker:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"nicknameBanner", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"collectionView", "@", 0);
  [v3 validateClass:@"CKTranscriptCollectionView" isKindOfClass:@"UICollectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"showInlineReplyControllerForChatItem:presentKeyboard:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"dismissInlineReplyController:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"inlineReplyController", "@", 0);
  [v3 validateProtocol:@"CKSendAnimationContext" hasRequiredInstanceMethod:@"impactIdentifier"];
  [v3 validateProtocol:@"CKSendAnimationContext" hasRequiredInstanceMethod:@"throwBalloonViews"];
  [v3 validateClass:@"CKAttachmentMessagePartChatItem"];
  [v3 validateClass:@"IMMessage"];
  [v3 validateClass:@"IMHandle"];
  [v3 validateClass:@"CKAdaptivePresentationController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKAdaptivePresentationController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAdaptivePresentationController", @"presentedViewController", "@", 0);
  [v3 validateClass:@"CKBrowserDragControllerTarget"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserDragControllerTarget", @"screenCoordinate", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"becomeFirstResponder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"targetFirstResponder", "q", 0);
  [v3 validateClass:@"CKMacToolbarController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagesController", @"macToolbarController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"entryView", "@", 0);
  [v3 validateClass:@"CKMessageEntryView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"contentView", "@", 0);
  [v3 validateClass:@"CKMessageEntryContentView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"textView", "@", 0);
  [v3 validateClass:@"CKMessageEntryRichTextView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKMessagesController" hasProperty:@"conversationListController" withType:"@"];
  [v3 validateClass:@"CKConversationListCollectionViewController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"CKCoreChatController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"CKChatController" hasProperty:@"delegate" withType:"@"];
  [v3 validateClass:@"CKChatController" hasProperty:@"entryView" withType:"@"];
  [v3 validateClass:@"CKMessageEntryView" hasProperty:@"contentView" withType:"@"];
  [v3 validateClass:@"CKMessageEntryContentView" hasProperty:@"textView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"toolbarItems", "@", 0);
  [v3 validateClass:@"CKChatController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  uint64_t v4 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  -[CKChatControllerAccessibility _axUpdateEditingToolbarItems:](self, "_axUpdateEditingToolbarItems:", v3, v4, 3221225472, __75__CKChatControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_265112D10, self, &v5);
  [(CKChatControllerAccessibility *)self _accessibilityReloadElementRelations:1];
}

uint64_t __75__CKChatControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) toolbarItems];

  return MEMORY[0x270F9A758]();
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [NSClassFromString(&cfstr_Ckadaptivepres.isa) safeValueForKey:@"sharedInstance"];
  id v3 = [v2 safeValueForKey:@"presentedViewController"];
  if (v3)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return v3 != 0;
}

uint64_t __59__CKChatControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_2];
}

void __59__CKChatControllerAccessibility_accessibilityPerformEscape__block_invoke_2()
{
}

- (void)_dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v3 _dealloc];
  [(CKChatControllerAccessibility *)self _accessibilityReloadElementRelations:0];
}

- (void)_accessibilityReloadElementRelations:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKChatControllerAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Ckmessagescont_0.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v6 = [v5 safeValueForKeyPath:@"conversationListController.collectionView"];
    uint64_t v7 = __UIAccessibilityCastAsClass();

    if (v7) {
      UIAccessibilityUnrelateAllElements();
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_opt_class();
  v8 = [(CKChatControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v9 = __UIAccessibilityCastAsClass();

  if (v9) {
    UIAccessibilityUnrelateAllElements();
  }
  objc_opt_class();
  id v10 = [(CKChatControllerAccessibility *)self safeValueForKeyPath:@"entryView.contentView.textView"];
  objc_super v11 = __UIAccessibilityCastAsClass();

  if (v11) {
    UIAccessibilityUnrelateAllElements();
  }
  if (v3)
  {
    v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v9);
    [v7 _setAccessibilityLinkedUIElements:v12];

    if (v9)
    {
      if (v11) {
        UIAccessibilityRelateElements();
      }
    }
  }
}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v3 messageEntryViewSendButtonHit:a3];
  MEMORY[0x2456470F0](*MEMORY[0x263F812B8]);
}

- (void)_showPhotoPickerWithSourceType:(int64_t)a3
{
  id v5 = MEMORY[0x245647070](self, a2);
  v6 = [v5 stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/PhotoLibrary.framework"];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
  if (([v7 isLoaded] & 1) == 0) {
    [v7 load];
  }

  v8.receiver = self;
  v8.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v8 _showPhotoPickerWithSourceType:a3];
}

- (void)_showVCalViewerForMediaObject:(id)a3
{
  id v4 = a3;
  id v5 = MEMORY[0x245647070]();
  v6 = [v5 stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/CalendarUI.framework"];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
  if (([v7 isLoaded] & 1) == 0) {
    [v7 load];
  }

  v8.receiver = self;
  v8.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v8 _showVCalViewerForMediaObject:v4];
}

- (id)editingToolbarItems
{
  v5.receiver = self;
  v5.super_class = (Class)CKChatControllerAccessibility;
  objc_super v3 = [(CKChatControllerAccessibility *)&v5 editingToolbarItems];
  [(CKChatControllerAccessibility *)self _axUpdateEditingToolbarItems:v3];

  return v3;
}

- (void)actionMenuGestureRecognizerButtonGestureDidEnd:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v11 actionMenuGestureRecognizerButtonGestureDidEnd:v4];
  objc_opt_class();
  objc_super v5 = [(CKChatControllerAccessibility *)self safeValueForKeyPath:@"videoMessageRecordingViewController.videoActionMenuController.actionMenuItems"];
  v6 = __UIAccessibilityCastAsClass();

  if ((unint64_t)[v6 count] < 2)
  {
    objc_super v8 = 0;
  }
  else
  {
    uint64_t v7 = [v6 objectAtIndex:1];
    objc_super v8 = [v7 safeValueForKey:@"view"];
  }
  id v10 = v8;
  id v9 = v8;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __80__CKChatControllerAccessibility_actionMenuGestureRecognizerButtonGestureDidEnd___block_invoke(uint64_t a1)
{
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  objc_super v3 = [(CKChatControllerAccessibility *)self safeValueForKey:@"collectionViewController"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _accessibilitySpeakThisElementsAndStrings];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKChatControllerAccessibility;
    uint64_t v5 = [(CKChatControllerAccessibility *)&v8 _accessibilitySpeakThisElementsAndStrings];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setEffectPickerWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKChatControllerAccessibility;
  id v3 = a3;
  [(CKChatControllerAccessibility *)&v4 setEffectPickerWindow:v3];
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1, v4.receiver, v4.super_class);
}

- (id)_axCurrentTargetBalloonView
{
}

- (void)_axSetCurrentTargetBalloonView:(id)a3
{
}

- (int64_t)_axCurrentLayoutIntent
{
  return MEMORY[0x270F09640](self, &__CKChatController___axCurrentLayoutIntent);
}

- (void)_axSetCurrentLayoutIntent:(int64_t)a3
{
}

- (void)dragManagerDidBeginDragging:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v5 dragManagerDidBeginDragging:a3];
  objc_super v4 = accessibilityLocalizedString(@"sticker.drag.begin");
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  [(CKChatControllerAccessibility *)self _axSetCurrentTargetBalloonView:0];
  [(CKChatControllerAccessibility *)self _axSetCurrentLayoutIntent:0];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CKChatControllerAccessibility *)self safeValueForKey:@"collectionViewController"];
  LOBYTE(v45) = 0;
  objc_opt_class();
  id v9 = [v8 safeValueForKey:@"collectionView"];
  id v10 = __UIAccessibilityCastAsClass();

  if (v10)
  {
    id v32 = v6;
    char v51 = 0;
    objc_opt_class();
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    id v50 = 0;
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke;
    v41 = &unk_265112F70;
    v44 = &v45;
    v42 = self;
    id v31 = v7;
    id v11 = v7;
    id v43 = v11;
    AXPerformSafeBlock();
    id v12 = (id)v46[5];

    _Block_object_dispose(&v45, 8);
    v13 = __UIAccessibilityCastAsClass();

    if (v51) {
      abort();
    }
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    id v50 = 0;
    v14 = [v10 visibleCells];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_2;
    v34[3] = &unk_265113250;
    id v35 = v10;
    id v15 = v13;
    id v36 = v15;
    v37 = &v45;
    [v14 enumerateObjectsUsingBlock:v34];
    v16 = (void *)v46[5];
    v17 = [(CKChatControllerAccessibility *)self _axCurrentTargetBalloonView];

    uint64_t v18 = v46[5];
    if (v16 == v17)
    {
      if (v18)
      {
        uint64_t v24 = -[CKChatControllerAccessibility _axLayoutIntentForTarget:inBalloonView:](self, "_axLayoutIntentForTarget:inBalloonView:", v11);
        if (v24 != [(CKChatControllerAccessibility *)self _axCurrentLayoutIntent])
        {
          [(CKChatControllerAccessibility *)self _axSetCurrentLayoutIntent:v24];
          v25 = _axLocalizedStringForLayoutIntent(v24);
          UIAccessibilitySpeakIfNotSpeaking();
        }
      }
    }
    else if (v18)
    {
      uint64_t v19 = -[CKChatControllerAccessibility _axLayoutIntentForTarget:inBalloonView:](self, "_axLayoutIntentForTarget:inBalloonView:", v11);
      [(CKChatControllerAccessibility *)self _axSetCurrentLayoutIntent:v19];
      v20 = accessibilityLocalizedString(@"sticker.drag.hovering");
      v21 = _axLocalizedStringForLayoutIntent(v19);
      v29 = [(id)v46[5] accessibilityLabel];
      v22 = __UIAXStringForVariables();

      UIAccessibilitySpeak();
      [(CKChatControllerAccessibility *)self _axSetCurrentTargetBalloonView:v46[5], v21, v29, @"__AXStringForVariablesSentinel"];
    }
    else
    {
      -[CKChatControllerAccessibility _axSetCurrentTargetBalloonView:](self, "_axSetCurrentTargetBalloonView:", 0, v27, v28, v30);
    }
    v33.receiver = self;
    v33.super_class = (Class)CKChatControllerAccessibility;
    v23 = [(CKChatControllerAccessibility *)&v33 dropInteraction:v32 sessionDidUpdate:v11];

    _Block_object_dispose(&v45, 8);
    id v7 = v31;
    id v6 = v32;
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)CKChatControllerAccessibility;
    v23 = [(CKChatControllerAccessibility *)&v52 dropInteraction:v6 sessionDidUpdate:v7];
  }

  return v23;
}

uint64_t __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = [*(id *)(a1 + 32) _selectedBalloonFromTouchForDropSession:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__5;
    id v12 = __Block_byref_object_dispose__5;
    id v13 = 0;
    id v6 = *(id *)(a1 + 32);
    id v7 = v4;
    AXPerformSafeBlock();
    id v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    if ([*(id *)(a1 + 40) isEqual:v5]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
}

uint64_t __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = [*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)dragManagerDidEndDragging:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v4 dragManagerDidEndDragging:a3];
  id v3 = accessibilityLocalizedString(@"sticker.drag.done");
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)sendSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v20 sendSticker:v8 withDragTarget:v9 draggedSticker:v10];
  if (v9)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    uint64_t v18 = __Block_byref_object_dispose__5;
    id v19 = 0;
    id v13 = v9;
    AXPerformSafeBlock();
    id v11 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    if (v11)
    {
      id v12 = accessibilityLocalizedString(@"sticker.drag.attached");
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
  }
}

uint64_t __75__CKChatControllerAccessibility_sendSticker_withDragTarget_draggedSticker___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0) = [*(id *)(a1 + 32) selectedBalloonForTarget:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axDescriptionForMessageEffectIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.impact"])
  {
    objc_super v4 = @"impact.effect.message.impact";
  }
  else if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.loud"])
  {
    objc_super v4 = @"impact.effect.message.loud";
  }
  else if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.gentle"])
  {
    objc_super v4 = @"impact.effect.message.gentle";
  }
  else if ([v3 isEqualToString:@"com.apple.MobileSMS.expressivesend.focus"])
  {
    objc_super v4 = @"impact.effect.message.focus";
  }
  else
  {
    objc_super v4 = &stru_26F654EE0;
  }
  id v5 = NSString;
  id v6 = accessibilityLocalizedString(@"impact.effect.message");
  id v7 = accessibilityLocalizedString(v4);
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  return v8;
}

- (unint64_t)_axLayoutIntentForTarget:(id)a3 inBalloonView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKChatControllerAccessibility *)self safeValueForKeyPath:@"collectionViewController.collectionView"];
  id v9 = [v8 window];
  [v6 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  objc_opt_class();
  uint64_t v14 = __UIAccessibilityCastAsClass();
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  objc_msgSend(v14, "convertPoint:fromView:", 0, v11, v13);
  double v36 = v23;
  double v25 = v24;
  v37.origin.x = v16;
  v37.origin.y = v18;
  v37.size.width = v20;
  v37.size.height = v22;
  CGFloat v26 = CGRectGetWidth(v37) / 3.0;
  v38.origin.x = v16;
  v38.origin.y = v18;
  v38.size.width = v20;
  v38.size.height = v22;
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v16;
  v39.origin.y = v18;
  v39.size.width = v20;
  v39.size.height = v22;
  double v27 = CGRectGetHeight(v39) / 3.0;
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v20;
  v40.size.height = v22;
  CGFloat Height = CGRectGetHeight(v40);
  double v29 = (Height + Height) / 3.0;
  if (v36 <= v26)
  {
    if (v25 <= v27)
    {
      unint64_t v33 = 1;
      goto LABEL_15;
    }
    BOOL v30 = v25 < v29;
    uint64_t v31 = 3;
    uint64_t v32 = 8;
  }
  else if (v36 >= (Width + Width) / 3.0)
  {
    if (v25 <= v27)
    {
      unint64_t v33 = 2;
      goto LABEL_15;
    }
    BOOL v30 = v25 < v29;
    uint64_t v31 = 4;
    uint64_t v32 = 9;
  }
  else
  {
    if (v25 <= v27)
    {
      unint64_t v33 = 6;
      goto LABEL_15;
    }
    BOOL v30 = v25 < v29;
    uint64_t v31 = 7;
    uint64_t v32 = 5;
  }
  if (v30) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = v31;
  }
LABEL_15:

  return v33;
}

- (void)transcriptCollectionViewController:(id)a3 willBeginImpactEffectAnimationWithSendAnimationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v16 transcriptCollectionViewController:v6 willBeginImpactEffectAnimationWithSendAnimationContext:v7];
  objc_opt_class();
  id v8 = [v7 safeValueForKey:@"impactIdentifier"];
  id v9 = __UIAccessibilityCastAsClass();

  if (v9)
  {
    objc_opt_class();
    double v10 = [v7 safeValueForKey:@"throwBalloonViews"];
    double v11 = __UIAccessibilityCastAsClass();

    double v12 = [v11 firstObject];
    double v13 = [(CKChatControllerAccessibility *)self _axDescriptionForMessageEffectIdentifier:v9];
    double v15 = [v12 accessibilityLabel];
    uint64_t v14 = __UIAXStringForVariables();
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSString *)*MEMORY[0x263F1CE28];
  id v7 = a3;
  id v8 = UIAccessibilityFocusedElement(v6);
  [(CKChatControllerAccessibility *)self _axSetFocusedChatItemElement:v8];
  id v9 = [(CKChatControllerAccessibility *)self safeValueForKeyPath:@"collectionViewController.collectionView"];
  [v9 setAccessibilityElementsHidden:1];
  double v10 = [(CKChatControllerAccessibility *)self safeValueForKey:@"nicknameBanner"];
  [v10 setAccessibilityElementsHidden:1];
  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v11 showInlineReplyControllerForChatItem:v7 presentKeyboard:v4];

  AXPerformBlockOnMainThreadAfterDelay();
}

void __86__CKChatControllerAccessibility_showInlineReplyControllerForChatItem_presentKeyboard___block_invoke()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"inline.reply.show.transcript");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);
}

- (void)dismissInlineReplyController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKChatControllerAccessibility *)self safeValueForKey:@"inlineReplyController"];

  v10.receiver = self;
  v10.super_class = (Class)CKChatControllerAccessibility;
  [(CKChatControllerAccessibility *)&v10 dismissInlineReplyController:v3];
  id v6 = [(CKChatControllerAccessibility *)self safeValueForKeyPath:@"collectionViewController.collectionView"];
  [v6 setAccessibilityElementsHidden:0];
  id v7 = [(CKChatControllerAccessibility *)self safeValueForKey:@"nicknameBanner"];
  [v7 setAccessibilityElementsHidden:0];
  if (v5)
  {
    UIAccessibilityNotifications v8 = *MEMORY[0x263F1CE68];
    id v9 = [(CKChatControllerAccessibility *)self _axFocusedChatItemElement];
    UIAccessibilityPostNotification(v8, v9);

    [(CKChatControllerAccessibility *)self _axSetFocusedChatItemElement:0];
  }
}

- (void)_axUpdateEditingToolbarItems:(id)a3
{
}

void __62__CKChatControllerAccessibility__axUpdateEditingToolbarItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  unint64_t v4 = [v3 tag];
  if (v4 <= 2)
  {
    id v5 = accessibilityLocalizedString(off_2651132E0[v4]);
    [v3 setAccessibilityLabel:v5];
  }
}

@end