@interface AXChatKitGlue
+ (void)_handleMessageReceived:(id)a3;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXChatKitGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_436 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_445];

    v3 = [MEMORY[0x263F21400] sharedInstance];
    [v3 installSafeCategories:&__block_literal_global_999 afterDelay:@"ChatKit AX Bundle" validationTargetName:@"ChatKit" overrideProcessName:1.0];

    AXPerformBlockOnMainThreadAfterDelay();
    v4 = [MEMORY[0x263F21388] sharedInstance];
    [v4 addHandler:&__block_literal_global_1010 forBundleName:@"MSMessageExtensionBalloonPlugin"];

    v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_1037 forBundleName:@"HandwritingProvider"];

    v6 = [MEMORY[0x263F21388] sharedInstance];
    [v6 addHandler:&__block_literal_global_1072 forFramework:@"ElectricTouch"];

    v7 = [MEMORY[0x263F21388] sharedInstance];
    [v7 addHandler:&__block_literal_global_1089 forFramework:@"ClipServices"];

    v8 = [MEMORY[0x263F21388] sharedInstance];
    [v8 addHandler:&__block_literal_global_1106 forFramework:@"LinkPresentation"];

    v9 = [MEMORY[0x263F21388] sharedInstance];
    [v9 addHandler:&__block_literal_global_1127 forBundleID:@"com.apple.Jellyfish.MessagesExtension"];

    v10 = [MEMORY[0x263F21388] sharedInstance];
    [v10 addHandler:&__block_literal_global_1135 forBundleName:@"UIKit.axbundle"];
  }
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CKBalloonView"];
  [v2 validateClass:@"CKImageBalloonView"];
  [v2 validateClass:@"CKMovieMediaObject"];
  [v2 validateClass:@"CKImageMediaObject"];
  [v2 validateClass:@"CKActionMenuWindow"];
  [v2 validateClass:@"CKConversation"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"isMuted", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"hasUnreadMessages", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CKActionMenuWindow", @"sharedInstance", "@", 0);
  [v2 validateClass:@"CKAttachmentBalloonView" isKindOfClass:@"CKBalloonView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEntity", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"chatItems", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMChat", @"lastIncomingMessage", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"subject", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"sender", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"plainBody", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"inlineAttachmentAttributesArray", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMHandle", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMHandle", @"nameAndEmail", "@", 0);
  [v2 validateClass:@"CKConversationList"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CKConversationList", @"sharedConversationList", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationList", @"conversationForExistingChat:", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKRecipientSelectionController", @"toField", "@", 0);
  [v2 validateClass:@"CKConversationListCell"];
  [v2 validateClass:@"CKConversationListCell"];
  [v2 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_dateLabel" withType:"CKDateLabel"];
  [v2 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_summaryLabel" withType:"UILabel"];
  [v2 validateClass:@"CKChatController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"messageEntryViewSendButtonHit:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"_showPhotoPickerWithSourceType:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"_showVCalViewerForMediaObject:", "v", "@", 0);
  [v2 validateClass:@"CKChatController" hasInstanceVariable:@"_conversation" withType:"CKConversation"];
  [v2 validateClass:@"CKMessageEntryView" hasInstanceVariable:@"_characterCountLabel" withType:"UILabel"];
  [v2 validateClass:@"CKMessageEntryView" hasInstanceVariable:@"_sendButton" withType:"CKEntryViewButton"];

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ChatKit AX Bundle"];
  [v2 setOverrideProcessName:@"ChatKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 installSafeCategory:@"UITextFieldAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UINavigationButtonAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIButtonAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UILabelAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"_UIKBCompatInputViewAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIWindowAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UITextEffectsWindowAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTextBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKImageBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAttachmentBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptPluginBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKRichLinkReplyPreviewBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAggregateAcknowledgmentBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKContactBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAudioBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKInlineStickerBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLocationShareBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAutoloopMovieBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPhotoStackBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLinkBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptMessageCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryTextViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryContentViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBalloonTextViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptBalloonCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptTypingIndicatorCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryRecordedAudioViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAudioRecorderAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKActionMenuItemImageViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKActionMenuItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKActionMenuWindowAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKActionMenuViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSpeakerButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPresentationControllerWindowAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptStatusCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptLabelCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageAcknowledgmentPickerBarItemViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageAcknowledgmentPickerBarViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAggregateAcknowledgmentChatItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKFullScreenBalloonViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"IMMessageAcknowledgmentChatItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNicknameBannerViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKVideoCancelActionMenuItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"_CKVideoMessageRecordingWindowAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKVideoMessageRecordingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"_MFAtomTextViewAccessibility__ChatKit__MessageUI" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIInputSetHostViewAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSharedAssetCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsChildViewControllerCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKGroupAcknowledgmentVotingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarTitleCollectionReusableViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarPickerLayoutAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKUIBehaviorAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptGroupHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMacRecipientsControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAttachmentCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKRecipientSelectionControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKRecipientSelectionViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CAMShutterButtonAccessibility__ChatKit__CameraKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListNewMessageCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListNewMessageCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptDNDCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryViewSnapshotAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEntryRichTextViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKEntryViewButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKChatControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKImageAttachmentItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLocationAttachmentItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMovieAttachmentItemAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptManagementNameFieldAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarNavigationBarAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKCanvasBackButtonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKFullScreenAppNavbarManagerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKCoreChatControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKHandwritingWindowAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKChatInputControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKHandwritingPresentationControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTUConversationBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKVideoPlayerBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNavBarUnifiedCallButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAudioMessageRecordingViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"AudioMessageRecordingAppendButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKEmbeddedRichLinkViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBrowserSwitcherViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBrowserSwitcherFooterViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBrowserCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKFullscreenBrowserNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKExpandedAppViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKEffectPickerViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKUIPageControlAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKUICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsChatOptionsCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsChatOptionsCheckboxCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsContactsTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsSearchResultsTitleHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsLocationShareHeaderFooterViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsLocationShareCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsSeparatorCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDefaultPluginEntryViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIAccessibilityElementKBKeyChatKitAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIAccessibilityElementKBEmojiCategoryChatKitAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarPickerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAvatarContactNameCollectionReusableViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAppManagerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNotificationChatControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAppGrabberCloseButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAppGrabberViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKFunCameraViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNavbarCanvasViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNavigationButtonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKNavigationBarCanvasViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKStickerDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKStickerDetailCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLinkSearchControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLinkSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPhotosSearchControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPhotoSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLocationSearchControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLocationSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAttachmentsSearchControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAttachmentSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBrowserSwitcherCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMeCardNavigationControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSearchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKHighlightsSearchControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationAvatarSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKLargeTitleAccessoryViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKDetailsSearchViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessagesControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKInlineReplyCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKInlineReplyChatControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKRecipientSearchListControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKComposeNavbarCanvasViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPinnedConversationViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKPinnedConversationCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMentionSuggestionCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMentionSuggestionViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListCollectionViewConversationCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKQuickActionSaveButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKConversationListAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageHighlightButtonAccessibility" canInteractWithTargetClass:1];
  id v2 = AXProcessGetName();
  int v3 = [v2 isEqualToString:@"MessagesTranscriptExtension"];

  if (v3) {
    [v4 installSafeCategory:@"CKTranscriptExtensionViewControllerAccessibility" canInteractWithTargetClass:1];
  }
  [v4 installSafeCategory:@"CKMessagePartHighlightBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTranscriptActionButtonCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMediaObjectBackedAssetAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKEditableSearchResultCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSyndicationPageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSyndicationContentViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEditingBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMessageEditingViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKGroupCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKHyperlinkBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKEntryViewPlusButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSendMenuViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKSendMenuCollectionViewLayoutAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKAudioMessageBalloonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"SendMenuCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKComposeRecipientSelectionControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKBalloonImageViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKStickerTranscriptCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"AppCardContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKComposeSubscriptionSelectorButtonAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"NavbarConversationTitleAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKFullScreenBalloonViewControllerPhoneAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"TapbackPickerCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"TapbackPickerEmojiTailViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"TapbackPickerCancelButtonViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMentionsUtilitiesAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKMentionsControllerAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"CKTapbackPickerBalloonParentViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"TapbackPickerBalloonAccessoryViewAccessibility" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"SendMenuCollectionViewAccessibility" canInteractWithTargetClass:1];
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  int v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F21328]];

  if (v4)
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F4A480];
    v7 = [MEMORY[0x263F08A48] mainQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_6;
    v9[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    v9[4] = *(void *)(a1 + 32);
    id v8 = (id)[v5 addObserverForName:v6 object:0 queue:v7 usingBlock:v9];
  }
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 object];
  [v2 _handleMessageReceived:v3];
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_7()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1012 withPreValidationHandler:&__block_literal_global_1014 postValidationHandler:&__block_literal_global_1017];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_8()
{
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MSMessageExtensionBalloonView"];
  [v2 validateClass:@"MSMessageExtensionBalloonLiveView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MSMessageExtensionBalloonLiveView", @"payload", "@", 0);
  [v2 validateClass:@"MSMessageExtensionDataSource"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"MSMessageExtensionDataSource", @"messagePayloadFromPluginPayload:", "@", "@", 0);
  [v2 validateClass:@"MSMessageExtensionDataSource" isKindOfClass:@"IMBalloonPluginDataSource"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"IMBalloonPluginDataSource", @"payload", "@", 0);
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_11()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1039 withPreValidationHandler:&__block_literal_global_1065 postValidationHandler:&__block_literal_global_1067];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"HWBalloonDataSource"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"HWBalloonDataSource", @"handwritingFromPayload", "@", 0);
  [v2 validateClass:@"HWHandwritingItem"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"HWHandwritingItem", @"drawing", "@", 0);
  [v2 validateClass:@"DKDrawing"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DKDrawing", @"strokes", "@", 0);
  [v2 validateClass:@"HWPluginContentView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"HWPluginContentView", @"dataSource", "@", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_13()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_15()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1074 withPreValidationHandler:&__block_literal_global_1082 postValidationHandler:&__block_literal_global_1084];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_16(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_17()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_19()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1091 withPreValidationHandler:&__block_literal_global_1099 postValidationHandler:&__block_literal_global_1101];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CPSClipURL"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CPSClipURL", @"isSupported", "B", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_21()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_23()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1108 withPreValidationHandler:&__block_literal_global_1120 postValidationHandler:&__block_literal_global_1122];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"LPLinkView" hasInstanceVariable:@"_metadata" withType:"LPLinkMetadata"];
  [v2 validateClass:@"LPApplicationIdentification"];

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_25()
{
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_27()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_28()
{
  id v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Jellyfish.MessagesExtension"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_29()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_1137 withPreValidationHandler:&__block_literal_global_1148 postValidationHandler:&__block_literal_global_1150];
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CKBalloonTextView" isKindOfClass:@"UITextView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"_accessibilityGetValue", "@", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_31()
{
  return 1;
}

+ (void)_handleMessageReceived:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  id v3 = a3;
  AXPerformSafeBlock();
  id v4 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  if (([v4 safeBoolForKey:@"isMuted"] & 1) == 0)
  {
    LOBYTE(v30) = 0;
    v5 = [v3 safeValueForKey:@"lastIncomingMessage"];
    uint64_t v6 = __UIAccessibilitySafeClass();

    if ((_BYTE)v30) {
      abort();
    }
    v7 = [v6 sender];
    id v8 = [v7 firstName];

    if (v8) {
      goto LABEL_6;
    }
    v9 = [v6 sender];
    id v8 = [v9 name];

    if (v8
      || ([v6 safeValueForKey:@"sender"],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 safeValueForKey:@"nameAndEmail"],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v10,
          v8))
    {
LABEL_6:
      v11 = [v6 descriptionForPurpose:0 inChat:v3 senderDisplayName:v8];
      v12 = NSString;
      v13 = accessibilityLocalizedString(@"message.from.format");
      v14 = objc_msgSend(v12, "stringWithFormat:", v13, v8);
      v15 = __UIAXStringForVariables();

      v16 = objc_msgSend(v6, "fileTransferGUIDs", v11, @"__AXStringForVariablesSentinel");
      v17 = [v16 firstObject];

      if ([v17 length])
      {
        v18 = [MEMORY[0x263F4A578] sharedInstance];
        v19 = [v18 transferForGUID:v17];

        v20 = [v19 attributionInfo];
        v21 = [v20 objectForKey:*MEMORY[0x263F4ABE8]];

        if ([v21 length])
        {
          uint64_t v22 = __UIAXStringForVariables();

          v15 = (void *)v22;
        }
      }
      v23 = NSString;
      v24 = accessibilityLocalizedString(@"message.received");
      v25 = objc_msgSend(v23, "stringWithFormat:", v24, v15);

      v26 = [MEMORY[0x263F21660] axAttributedStringWithString:v25];
      uint64_t v36 = *MEMORY[0x263F218C8];
      v37[0] = MEMORY[0x263EFFA88];
      v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      [v26 setAttributes:v27];

      v29 = v26;
      id v28 = v26;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __40__AXChatKitGlue__handleMessageReceived___block_invoke(uint64_t a1)
{
  id v5 = [NSClassFromString(&cfstr_Ckconversation_0.isa) safeValueForKey:@"sharedConversationList"];
  uint64_t v2 = [v5 conversationForExistingChat:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __40__AXChatKitGlue__handleMessageReceived___block_invoke_2(uint64_t a1)
{
}

@end