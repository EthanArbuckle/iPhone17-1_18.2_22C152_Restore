@interface CKMessageEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsMediaJoystickVisible;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)accessibilityElementsHidden;
- (BOOL)shouldGroupAccessibilityChildren;
- (CKMessageEntryViewAccessibility)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14;
- (void)_accessibilityApplyArrowLabel;
- (void)_accessibilityApplyAudioButtonLabel;
- (void)_accessibilityApplyBrowserLabel;
- (void)_accessibilityApplyCancelButtonLabel;
- (void)_accessibilityApplyEmojiButtonLabel;
- (void)_accessibilityApplyPhotoLabel;
- (void)_accessibilityApplyPlaceholderLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySendButtonLabel;
- (void)_postSentAnnouncementIfNeeded;
- (void)arrowButtonTapped:(id)a3;
- (void)browserButtonTapped:(id)a3;
- (void)collapsedPlaceholderLabelTapped:(id)a3;
- (void)keyCommandSend:(id)a3;
- (void)loadRecordedAudioViewsIfNeeded;
- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3;
- (void)touchUpInsideSendButton:(id)a3;
- (void)updateEntryView;
@end

@implementation CKMessageEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{UIEdgeInsets=dddd}", "B", "B", "B", "B", "B", "@", "B", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"keyCommandSend:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"entryFieldCollapsed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"hasRecording", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"updateEntryView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"messageEntryRecordedAudioViewPressedDelete:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"loadRecordedAudioViewsIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"touchUpInsideSendButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuController", @"isActionMenuVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"audioButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"recordedAudioView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"videoMessageRecordingViewController", "@", 0);
  [v3 validateClass:@"CKVideoMessageRecordingViewController" hasInstanceVariable:@"_presented" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRecordedAudioView", @"waveformImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuController", @"actionMenuItems", "@", 0);
  [v3 validateClass:@"CKRecordActionMenuItem" isKindOfClass:@"CKActionMenuItemView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"arrowButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"arrowButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"browserButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"browserButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"collapsedPlaceholderLabelTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"photoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"shouldAllowImpactSend", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"inputDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"shouldShowAppStrip", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"sendButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"emojiButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"cancelButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"stopButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"sendAudioButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"presentAudioActionButtons", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"cancelButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"stopButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"sendAudioButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"showHintWithText:animatingReferenceButton:", "v", "@", "B", 0);
  [v3 validateClass:@"IMService"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"IMService", @"iMessageService", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"sendButtonColor", "c", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"sendingService", "@", 0);
  [v3 validateProtocol:@"CKMessageEntryViewInputDelegate" hasRequiredInstanceMethod:@"messageEntryViewHighLightInputButton:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"appStrip", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserSwitcherFooterView", @"appStripCollectionView", "@", 0);
  [v3 validateClass:@"CKInlineReplyChatController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"delegate", "@", 0);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityIsMediaJoystickVisible
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"recordedAudioView"];
  BOOL v4 = [(CKMessageEntryViewAccessibility *)self _accessibilityIsMediaJoystickVisible];
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4;
  }

  return v5;
}

- (void)_accessibilityApplyArrowLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"arrowButton"];
  [v3 setAccessibilityIdentifier:@"arrowButton"];
  v2 = accessibilityLocalizedString(@"arrow.button.text");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityApplyPhotoLabel
{
  id v4 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"photoButton"];
  [v4 setAccessibilityIdentifier:@"photoButton"];
  v2 = accessibilityLocalizedString(@"photo.button.text");
  [v4 setAccessibilityLabel:v2];

  id v3 = accessibilityLocalizedString(@"photo.button.hint");
  [v4 setAccessibilityHint:v3];
}

- (void)_accessibilityApplyBrowserLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"browserButton"];
  id v4 = [v3 safeValueForKey:@"button"];
  BOOL v5 = accessibilityLocalizedString(@"app.store.button.text");
  [v4 setAccessibilityLabel:v5];

  v6 = accessibilityLocalizedString(@"messaging.apps.button.hint");
  [v4 setAccessibilityHint:v6];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CKMessageEntryViewAccessibility__accessibilityApplyBrowserLabel__block_invoke;
  v7[3] = &unk_265112EF8;
  objc_copyWeak(&v8, &location);
  [v4 _setAccessibilityValueBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __66__CKMessageEntryViewAccessibility__accessibilityApplyBrowserLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"shouldShowAppStrip"];

  if (v2) {
    id v3 = @"messaging.apps.visible";
  }
  else {
    id v3 = @"messaging.apps.hidden";
  }

  return accessibilityLocalizedString(v3);
}

- (void)_accessibilityApplyPlaceholderLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"collpasedPlaceholderLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  int v2 = accessibilityLocalizedString(@"collapsed.placeholder.hint");
  [v3 setAccessibilityHint:v2];
}

- (void)_accessibilityApplyAudioButtonLabel
{
  id v5 = [(CKMessageEntryViewAccessibility *)self safeUIViewForKey:@"audioButton"];
  [v5 setAccessibilityIdentifier:@"axAudioButton"];
  int v2 = accessibilityLocalizedString(@"audio.button.label");
  [v5 setAccessibilityLabel:v2];

  id v3 = accessibilityLocalizedString(@"audio.button.hint");
  [v5 setAccessibilityHint:v3];

  id v4 = accessibilityLocalizedString(@"audio.button.hint.macos");
  [v5 _accessibilitySetElementHelp:v4];

  [v5 setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];
}

- (void)_accessibilityApplyCancelButtonLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeUIViewForKey:@"cancelButton"];
  int v2 = accessibilityLocalizedString(@"audio.button.cancel.label");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilityApplyEmojiButtonLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeUIViewForKey:@"emojiButton"];
  int v2 = accessibilityLocalizedString(@"emoji.button.text");
  [v3 setAccessibilityLabel:v2];
}

- (void)_accessibilitySendButtonLabel
{
  id v3 = [(CKMessageEntryViewAccessibility *)self safeUIViewForKey:@"_sendButton"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__CKMessageEntryViewAccessibility__accessibilitySendButtonLabel__block_invoke;
  v4[3] = &unk_265112EF8;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityLabelBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __64__CKMessageEntryViewAccessibility__accessibilitySendButtonLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeValueForKey:@"delegate"];

  NSClassFromString(&cfstr_Ckinlinereplyc_1.isa);
  if (objc_opt_isKindOfClass()) {
    id v3 = @"send.button.reply.text";
  }
  else {
    id v3 = @"send.button.text";
  }
  id v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  [(CKMessageEntryViewAccessibility *)self setAccessibilityIdentifier:@"MessageEntryView"];
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"_characterCountLabel"];
  [v3 setAccessibilityIdentifier:@"CharacterCount"];

  id v4 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"_sendButton"];
  [v4 setAccessibilityIdentifier:@"sendButton"];

  [(CKMessageEntryViewAccessibility *)self _accessibilitySendButtonLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyArrowLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyPhotoLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyBrowserLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyPlaceholderLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyAudioButtonLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyCancelButtonLabel];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyEmojiButtonLabel];
}

- (CKMessageEntryViewAccessibility)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14
{
  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryViewAccessibility;
  HIWORD(v16) = __PAIR16__(a14, a13);
  LOWORD(v16) = __PAIR16__(a12, a11);
  v14 = -[CKMessageEntryViewAccessibility initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](&v17, sel_initWithFrame_marginInsets_shouldAllowImpact_shouldShowSendButton_shouldShowSubject_shouldShowPluginButtons_shouldShowCharacterCount_traitCollection_shouldDisableAttachments_shouldUseNonEmojiKeyboard_shouldUseNonHandwritingKeyboard_shouldDisableKeyboardStickers_, a5, a6, a7, a8, a9, a10, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right, v16);
  [(CKMessageEntryViewAccessibility *)v14 _accessibilityLoadAccessibilityInformation];

  return v14;
}

- (void)updateEntryView
{
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v18 updateEntryView];
  id v3 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"conversation"];
  id v4 = __UIAccessibilitySafeClass();

  if (v4)
  {
    objc_super v5 = [v4 safeValueForKey:@"sendButtonColor"];
    char v6 = [v5 integerValue];
    int v7 = v6;

    if (v6 == 6)
    {
      id v8 = @"send.message.button.hint.business.chat";
    }
    else if (v6 == 1)
    {
      id v8 = @"send.message.button.hint.imessage";
    }
    else
    {
      if (v6)
      {
        v9 = 0;
        goto LABEL_11;
      }
      id v8 = @"send.message.button.hint.sms";
    }
    v9 = accessibilityLocalizedString(v8);
  }
  else
  {
    v9 = 0;
    int v7 = -1;
  }
LABEL_11:
  v10 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"conversation"];
  v11 = [v10 safeValueForKey:@"sendingService"];
  v12 = [NSClassFromString(&cfstr_Imservice.isa) safeValueForKey:@"iMessageService"];
  if (v11 != v12
    || ![(CKMessageEntryViewAccessibility *)self safeBoolForKey:@"shouldAllowImpactSend"])
  {

LABEL_19:
    goto LABEL_20;
  }

  if (v7 != 6)
  {
    if (AXForceTouchAvailableAndEnabled()) {
      v13 = @"send.button.hint.force";
    }
    else {
      v13 = @"send.button.hint.longpress";
    }
    v10 = accessibilityLocalizedString(v13);
    int v16 = v10;
    objc_super v17 = @"__AXStringForVariablesSentinel";
    __UIAXStringForVariables();
    v9 = v11 = v9;
    goto LABEL_19;
  }
LABEL_20:
  v14 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"_sendButton", v16, v17];
  [v14 setAccessibilityHint:v9];

  v15 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"_sendButton"];
  [v15 _accessibilitySetElementHelp:v9];
}

- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v3 messageEntryRecordedAudioViewPressedDelete:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __78__CKMessageEntryViewAccessibility_messageEntryRecordedAudioViewPressedDelete___block_invoke()
{
}

- (void)loadRecordedAudioViewsIfNeeded
{
  v2.receiver = self;
  v2.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v2 loadRecordedAudioViewsIfNeeded];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)arrowButtonTapped:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v6 arrowButtonTapped:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  objc_super v5 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"photoButton"];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)browserButtonTapped:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v6 browserButtonTapped:a3];
  [(CKMessageEntryViewAccessibility *)self _accessibilityApplyBrowserLabel];
  if ([(CKMessageEntryViewAccessibility *)self safeBoolForKey:@"shouldShowAppStrip"])
  {
    UIAccessibilityNotifications v4 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"appStrip"];
    objc_super v5 = [v4 safeValueForKey:@"appStripCollectionView"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v5);
  }
  else
  {
    UIAccessibilityNotifications v4 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"browserButton"];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v4);
  }
}

- (void)collapsedPlaceholderLabelTapped:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v7 collapsedPlaceholderLabelTapped:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  objc_super v5 = [(CKMessageEntryViewAccessibility *)self safeValueForKey:@"contentView"];
  objc_super v6 = [v5 safeValueForKey:@"textView"];
  UIAccessibilityPostNotification(v4, v6);
}

- (void)keyCommandSend:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(id)*MEMORY[0x263F1D020] _accessibilityResponderElement];
  if (!UIAccessibilityIsVoiceOverRunning()) {
    goto LABEL_3;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__CKMessageEntryViewAccessibility_keyCommandSend___block_invoke;
  v9[3] = &unk_265113520;
  v9[4] = self;
  objc_super v6 = [v5 _accessibilityFindViewAncestor:v9 startWithSelf:1];

  if (!v6)
  {
    objc_super v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_241FFB000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring key command because I'm not the focused element: %@ %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_3:
    v8.receiver = self;
    v8.super_class = (Class)CKMessageEntryViewAccessibility;
    [(CKMessageEntryViewAccessibility *)&v8 keyCommandSend:v4];
  }
}

BOOL __50__CKMessageEntryViewAccessibility_keyCommandSend___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (void)touchUpInsideSendButton:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryViewAccessibility;
  [(CKMessageEntryViewAccessibility *)&v4 touchUpInsideSendButton:a3];
  [(CKMessageEntryViewAccessibility *)self _postSentAnnouncementIfNeeded];
}

- (void)_postSentAnnouncementIfNeeded
{
  int v3 = [(CKMessageEntryViewAccessibility *)self safeBoolForKey:@"entryFieldCollapsed"];
  int v4 = [(CKMessageEntryViewAccessibility *)self safeBoolForKey:@"hasRecording"];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    accessibilityLocalizedString(@"sent");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);
  }
}

@end