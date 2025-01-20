@interface CKUIBehaviorMac
- (BOOL)browserButtonShouldUseMenu;
- (BOOL)canPluginBalloonsUseOpaqueMask;
- (BOOL)canPresentOverKeyboard;
- (BOOL)ckShouldUpdateappMenuTitleFont;
- (BOOL)ckShouldUpdateaudioBalloonSpeedFont;
- (BOOL)ckShouldUpdateaudioBalloonTimeFont;
- (BOOL)ckShouldUpdateaudioBalloonTranscriptionFont;
- (BOOL)ckShouldUpdateaudioHintFont;
- (BOOL)ckShouldUpdateavatarNameFont;
- (BOOL)ckShouldUpdateballoonTextFont;
- (BOOL)ckShouldUpdatebottomConversationListSpace;
- (BOOL)ckShouldUpdatebusinessInfoViewDescriptionTextFont;
- (BOOL)ckShouldUpdatebusinessInfoViewGreetingTextFont;
- (BOOL)ckShouldUpdatebusinessInfoViewTitleLabelFont;
- (BOOL)ckShouldUpdateconversationListBoldSummaryFont;
- (BOOL)ckShouldUpdateconversationListCellLeftMargin;
- (BOOL)ckShouldUpdateconversationListCellRightMargin;
- (BOOL)ckShouldUpdateconversationListCellRoundSelectorLeftInset;
- (BOOL)ckShouldUpdateconversationListCellRoundSelectorRightInset;
- (BOOL)ckShouldUpdateconversationListPinnedConversationNameFont;
- (BOOL)ckShouldUpdateconversationListSenderFont;
- (BOOL)ckShouldUpdateconversationListSummaryFont;
- (BOOL)ckShouldUpdateentryViewAppButtonName;
- (BOOL)ckShouldUpdateiosMacDetailsButtonText;
- (BOOL)ckShouldUpdatelocationBoldButtonFont;
- (BOOL)ckShouldUpdatelocationButtonFont;
- (BOOL)ckShouldUpdatemessageAcknowledgmentVoteCountFont;
- (BOOL)ckShouldUpdatenavbarDefaultLabelFont;
- (BOOL)ckShouldUpdatenicknameUpdatesSubtitleFont;
- (BOOL)ckShouldUpdatenicknameUpdatesTitleFont;
- (BOOL)ckShouldUpdatepreviewTitleFont;
- (BOOL)ckShouldUpdaterecipientNameFont;
- (BOOL)ckShouldUpdatereplyBalloonTextFont;
- (BOOL)ckShouldUpdatereplyButtonFont;
- (BOOL)ckShouldUpdatesearchBarFont;
- (BOOL)ckShouldUpdatesearchHeaderButtonFont;
- (BOOL)ckShouldUpdatesearchHeaderFont;
- (BOOL)ckShouldUpdatesearchIndexingSubtitleFont;
- (BOOL)ckShouldUpdatesearchIndexingTitleFont;
- (BOOL)ckShouldUpdatesearchMessageBodyTextFont;
- (BOOL)ckShouldUpdatesearchResultLabelFont;
- (BOOL)ckShouldUpdatesyncProgressLabelFont;
- (BOOL)ckShouldUpdatetapbackPickerSizingFont;
- (BOOL)ckShouldUpdatetranscriptBoldFont;
- (BOOL)ckShouldUpdatetranscriptButtonTextFont;
- (BOOL)ckShouldUpdatetranscriptDrawerGestureAcceleration;
- (BOOL)ckShouldUpdatetranscriptLightFont;
- (BOOL)ckShouldUpdatetranscriptMessageStatusDateFont;
- (BOOL)ckShouldUpdatetranscriptMessageStatusFont;
- (BOOL)ckShouldUpdatetranscriptRegularFont;
- (BOOL)ckShouldUpdatetranscriptSenderFont;
- (BOOL)ckShouldUpdatetuConversationBalloonActionButtonFont;
- (BOOL)ckShouldUpdatetuConversationBalloonActionButtonFontStyle;
- (BOOL)contactPhotosEnabled;
- (BOOL)conversationListHidesSearchBarWhenScrolling;
- (BOOL)effectPickerPresentsSelectionView;
- (BOOL)effectPickerShowsCloseButton;
- (BOOL)enableBalloonTextSelection;
- (BOOL)entryViewCoverHasOuterStroke;
- (BOOL)entryViewFollowsKeyboardLayoutGuide;
- (BOOL)entryViewSupportsBrowserButton;
- (BOOL)entryViewSupportsPhotoButton;
- (BOOL)entryViewSupportsPlusButton;
- (BOOL)forceMinTranscriptMarginInsets;
- (BOOL)isEntryViewCollapsable;
- (BOOL)isEntryViewFirstResponderOnViewAppearance;
- (BOOL)isEntryViewInputAccessory;
- (BOOL)isSendButtonEnabledOnPlatform;
- (BOOL)presentsAutocompleteInAPopover;
- (BOOL)searchControllerObscuresConversationList;
- (BOOL)shouldShowAvatarForWidth:(double)a3;
- (BOOL)shouldUnreadIndicatorChangeOnSelection;
- (BOOL)showsBalloonChevron;
- (BOOL)showsHoverToDeleteButton;
- (BOOL)showsHoverToDeleteButtonForNewCompose;
- (BOOL)supportsOrbPreviewsInConversationList;
- (BOOL)suppressPinActivityForState:(id)a3;
- (BOOL)transcriptMinBottomInsetIsEntryViewHeight;
- (BOOL)useMacToolbar;
- (CGPoint)messageAcknowledgmentTranscriptBalloonRelativePosition;
- (CGPoint)transcriptTypingIndicatorLargeBubbleGrowOffset;
- (CGPoint)transcriptTypingIndicatorLargeBubbleOffset;
- (CGSize)aggregateAcknowledgmentTranscriptBalloonSize;
- (CGSize)attributionCollapseButtonSize;
- (CGSize)attributionCountViewImageSize;
- (CGSize)attributionIconSize;
- (CGSize)attributionStickerDetailsViewAvatarSize;
- (CGSize)attributionStickerDetailsViewButtonSize;
- (CGSize)attributionStickerDetailsViewImageSize;
- (CGSize)attributionViewAvatarSize;
- (CGSize)audioProgressViewSize;
- (CGSize)avatarSize;
- (CGSize)balloonMaskSize;
- (CGSize)balloonMaskTailSizeForTailShape:(char)a3;
- (CGSize)browserButtonSize;
- (CGSize)cancelButtonSize;
- (CGSize)emojiStickerTranscriptBalloonSize;
- (CGSize)entryViewPlusButtonSize;
- (CGSize)macJoinFaceTimeNSToolbarItemSize;
- (CGSize)macNSToolbarItemSize;
- (CGSize)mediaObjectCachedIconSize;
- (CGSize)messageAcknowledgmentAnchorBubbleOffset;
- (CGSize)messageAcknowledgmentAnchorBubbleSize;
- (CGSize)messageAcknowledgmentButtonSize;
- (CGSize)messageAcknowledgmentIntermediateBubbleSize;
- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentImageSize;
- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize;
- (CGSize)messageAcknowledgmentPickerBarOffsetFromBalloon;
- (CGSize)messageAcknowledgmentPickerBarSize;
- (CGSize)messageAcknowledgmentPillBubbleSize;
- (CGSize)messageAcknowledgmentTranscriptBalloonSize;
- (CGSize)minConversationListWidthComposeButtonSize;
- (CGSize)minWindowSize;
- (CGSize)multilineBalloonMaskSize;
- (CGSize)pinnedConversationActivityBroadShadowDarkOffset;
- (CGSize)pinnedConversationActivityBroadShadowLightOffset;
- (CGSize)pinnedConversationActivityTightShadowDarkOffset;
- (CGSize)pinnedConversationActivityTightShadowLightOffset;
- (CGSize)replyBalloonMaskSize;
- (CGSize)replyDeleteBalloonMaskSize;
- (CGSize)replyMultilineBalloonMaskSize;
- (CGSize)replySkinnyBalloonMaskSize;
- (CGSize)roundBalloonMaskSizeWithTailShape:(char)a3;
- (CGSize)skinnyBalloonMaskSize;
- (CGSize)stickerPopoverSize;
- (CGSize)taillessMultilineBalloonMaskSize;
- (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4;
- (CGSize)transcriptTypingIndicatorDefaultSize;
- (CGSize)transcriptTypingIndicatorLargeBubbleSize;
- (CGSize)unreadIndicatorImageViewSize;
- (Class)navigationBarClass;
- (NSDirectionalEdgeInsets)collaborationOptionsPopoverInsets;
- (NSDirectionalEdgeInsets)searchConversationSectionInsets;
- (NSDirectionalEdgeInsets)searchMessagesSectionInsets;
- (NSDirectionalEdgeInsets)searchResultsInsets;
- (UIEdgeInsets)attachmentReplyPreviewBalloonAlignmentRectInsets;
- (UIEdgeInsets)attributionViewCollapsedModeInsets;
- (UIEdgeInsets)balloonMaskAlignmentRectInsets;
- (UIEdgeInsets)conversationListPinnedCellTitleLabelVerticalPadding;
- (UIEdgeInsets)detailsContactCellButtonEdgeInsets;
- (UIEdgeInsets)entryViewHorizontalCoverInsets;
- (UIEdgeInsets)entryViewVerticalCoverInsets;
- (UIEdgeInsets)entryViewVerticalTextFieldInsets;
- (UIEdgeInsets)messageAcknowledgmentTranscriptGlyphInset;
- (UIEdgeInsets)messageEntryContentViewSendLaterDateInsets;
- (UIEdgeInsets)messageEntryContentViewSendLaterInsets;
- (UIEdgeInsets)minTranscriptMarginInsets;
- (UIEdgeInsets)replyButtonEdgeInsets;
- (UIEdgeInsets)searchNavbarCanvasInsets;
- (UIEdgeInsets)searchSectionMarginInsets;
- (UIEdgeInsets)sendLaterEditViewInsets;
- (UIEdgeInsets)textReplyPreviewBalloonAlignmentRectInsets;
- (UIEdgeInsets)toFieldScrollViewInsets;
- (double)attributionCollapseButtonLeadingInset;
- (double)attributionCountAndImageViewPadding;
- (double)attributionViewMaxWidth;
- (double)attributionViewMinPadding;
- (double)attributionVoteCountTrailingInset;
- (double)audioReplyPreviewBalloonInset;
- (double)audioWaveformHeight;
- (double)autocompletePopOverLeftOffset;
- (double)avatarContactImageNameMargin;
- (double)avatarNameWidth;
- (double)avatarSpacingMargin;
- (double)balloonContiguousSpace;
- (double)balloonMaskTailWidth;
- (double)balloonMaxWidthPercent;
- (double)balloonNonContiguousSpace;
- (double)balloonSelectionLoadMoreSpinnerHeight;
- (double)balloonSelectionMaxScrollSpeed;
- (double)balloonSelectionScrollThresholdBottom;
- (double)balloonSelectionScrollThresholdTop;
- (double)bottomConversationListSpace;
- (double)chatNavbarLeftMargin;
- (double)chatNavbarRightMargin;
- (double)collaborationDetailsPreferredContentSizeWidth;
- (double)composeBalloonMaxWidthForEntryContentViewWidth:(double)a3;
- (double)conversationListCellCloseButtonHeight;
- (double)conversationListCellCloseButtonWidth;
- (double)conversationListCellLeftMargin;
- (double)conversationListCellRightMargin;
- (double)conversationListCellRoundSelectorLeftInset;
- (double)conversationListCellRoundSelectorRightInset;
- (double)conversationListContactImageDiameter;
- (double)conversationListContactImageTrailingSpace;
- (double)conversationListDragDistanceThreshold;
- (double)conversationListMinimumWidthForHiddenContactImage;
- (double)conversationListPinnedCellSelectedBackgroundCornerRadius;
- (double)conversationListSenderToDateHorizontalPadding;
- (double)defaultConversationListWidth;
- (double)detailsAddButtonDiameter;
- (double)detailsCellLabelPadding;
- (double)detailsContactCellButtonHeight;
- (double)detailsContactCellButtonWidth;
- (double)detailsContactCellMinimumHeight;
- (double)detailsContactImageDiameter;
- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode;
- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode;
- (double)detailsExpanseCellHeight;
- (double)detailsExpanseDescriptionLabelHeight;
- (double)detailsExpanseScreenShareCellHeight;
- (double)detailsGroupButtonHeight;
- (double)detailsGroupButtonWidth;
- (double)detailsInterGroupButtonPadding;
- (double)detailsMapViewInset;
- (double)detailsPreferredContentSizeHeight;
- (double)detailsPreferredContentSizeWidth;
- (double)detailsSectionHeaderPaddingAbove;
- (double)detailsSectionHeaderPaddingLeading;
- (double)detailsToFieldPreferredHeight;
- (double)detailsViewMapHeight;
- (double)emojiButtonSize;
- (double)entryContentViewTextLeftOffset;
- (double)entryViewAppButtonImagePointSize;
- (double)entryViewCoverHorizontalMargin;
- (double)entryViewCoverMinHeight;
- (double)entryViewMaxHeight;
- (double)entryViewMaxSendLaterHeight;
- (double)entryViewWithSendMenuBottomContentInsetWithKeyboardVisible;
- (double)entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible;
- (double)expandedToolbarHeightForMiiC;
- (double)fontSizeOffsetUserDefaults;
- (double)ktStatusCellImagePadding;
- (double)legacyMacAppMinConversationListWidth;
- (double)legacyMacAppSnapToMinConversationListWidth;
- (double)macAppKitToolbarHeight;
- (double)macConversationListToolbarHeight;
- (double)macEffectPickerTitleLeadingPadding;
- (double)macNSToolbarItemInterItemSpacing;
- (double)macNavbarBottomMargin;
- (double)macNavbarLeftMargin;
- (double)macNavbarRightMargin;
- (double)macTitleTrailingMargin;
- (double)macToLabelTrailingMargin;
- (double)macToolbarImagePointSize;
- (double)macToolbarStoplightButtonsLeadingPadding;
- (double)macTotalMarginWidth;
- (double)mapPreviewMaxWidth;
- (double)marzNavigationBarHeight;
- (double)maxConversationListWidth;
- (double)messageAcknowledgementVotingViewHeight;
- (double)messageAcknowledgementVotingViewMaxWidth;
- (double)messageAcknowledgementVotingViewMinPadding;
- (double)messageAcknowledgmentButtonMargin;
- (double)messageAcknowledgmentPhotoGridXOffsetScalar;
- (double)messageAcknowledgmentPhotoGridYOffsetScalar;
- (double)messageAcknowledgmentPickerMinHorizontalMargin;
- (double)messageHighlightButtonGlyphSymbolPointSize;
- (double)minConversationListWidth;
- (double)minWindowWidthPrimaryColumnOffset;
- (double)minimumWaveformHeight;
- (double)onBoardingKitWelcomeControllerHeaderViewIconSize;
- (double)paddleDividerInset;
- (double)paddleOverlayRadius;
- (double)pinnedConversationActivityBroadShadowDarkOpacity;
- (double)pinnedConversationActivityBroadShadowDarkRadius;
- (double)pinnedConversationActivityBroadShadowLightOpacity;
- (double)pinnedConversationActivityBroadShadowLightRadius;
- (double)pinnedConversationActivityTightShadowDarkOpacity;
- (double)pinnedConversationActivityTightShadowDarkRadius;
- (double)pinnedConversationActivityTightShadowLightOpacity;
- (double)pinnedConversationActivityTightShadowLightRadius;
- (double)popOverMaxHeight;
- (double)popOverMaxHeightInDetailsView;
- (double)popOverWidth;
- (double)popOverWidthInDetailsView;
- (double)popoverHeightPadding;
- (double)popoverPadding;
- (double)previewMaxWidth;
- (double)replyBalloonMaskTailWidth;
- (double)replyBalloonMinHeight;
- (double)replyButtonPadding;
- (double)replyLineBracketRadius;
- (double)replyLineViewContactImageLayoutHorizontalPadding;
- (double)replyLineViewHorizontalPadding;
- (double)replyLineViewMaxWidth;
- (double)replyLineViewVerticalPadding;
- (double)replyLineWidth;
- (double)searchAttachmentsCellCornerRadius;
- (double)searchCellCornerRadius;
- (double)searchConversationMinAvatarLabelSpacing;
- (double)searchDetailsLeadingAndTrailingMaxPadding;
- (double)searchDropdownAvatarDiameter;
- (double)searchLeadingAndTrailingMaxPadding;
- (double)searchLinksCellCornerRadius;
- (double)searchLocationsCellCornerRadius;
- (double)searchMessagesConversationToSenderSpacing;
- (double)searchMessagesSenderToBalloonSpacing;
- (double)searchPhotosCellCornerRadius;
- (double)searchPhotosCellZKWAndDetailsCornerRadius;
- (double)searchPhotosInterItemSpacing;
- (double)searchPhotosInterItemSpacingDetailsView;
- (double)searchPhotosZKWAndDetailsInterItemSpacing;
- (double)searchResultsTitleHeaderBottomPadding;
- (double)searchResultsTitleHeaderTopPadding;
- (double)sendButtonSize;
- (double)snapToMinConversationListCellWidth;
- (double)snapToMinConversationListWidth;
- (double)spaceBetweenSearchBarAndComposeButton;
- (double)stopButtonSize;
- (double)toFieldInterItemSpacing;
- (double)toFieldXOffset;
- (double)toFieldYOffset;
- (double)transcriptContactImageDiameter;
- (double)transcriptDrawerGestureAcceleration;
- (double)transcriptQuickActionButtonDiameter;
- (double)transcriptReplyPreviewContextContactImageDiameter;
- (double)tuConversationBalloonAvatarDimensions;
- (double)tuConversationBalloonContentMinHeight;
- (double)tuConversationBalloonContentStandardMinWidth;
- (double)tuConversationBalloonFaceTimeIconDimensions;
- (double)tuConversationBalloonIconDimensions;
- (double)tuConversationBalloonImageDimensions;
- (double)tuConversationBalloonJoinButtonHeight;
- (double)tuConversationBalloonJoinButtonMaxWidth;
- (double)tuConversationBalloonJoinButtonMinWidth;
- (double)tuConversationInsetPadding;
- (double)tuConversationInteritemSpacing;
- (double)tuConversationJoinButtonCornerRadius;
- (double)tuConversationJoinButtonHeight;
- (double)tuConversationJoinButtonMinWidth;
- (double)unreadIndicatorTotalMargins;
- (double)waveformHeight;
- (id)appMenuAnimojiStickersIconForTraitCollection:(id)a3;
- (id)appMenuApplePayIconForTraitCollection:(id)a3;
- (id)appMenuEffectsIconForTraitCollection:(id)a3;
- (id)appMenuEmojiIconForTraitCollection:(id)a3;
- (id)appMenuHashtagImagesIconForTraitCollection:(id)a3;
- (id)appMenuPhotosIconForTraitCollection:(id)a3;
- (id)appMenuTitleFont;
- (id)audioBalloonSpeedFont;
- (id)audioBalloonTimeFont;
- (id)audioBalloonTranscriptionFont;
- (id)audioButtonName;
- (id)audioHintFont;
- (id)avatarNameFont;
- (id)balloonTextFont;
- (id)balloonTextFontUserDefaults;
- (id)businessInfoViewDescriptionTextFont;
- (id)businessInfoViewGreetingTextFont;
- (id)businessInfoViewTitleLabelFont;
- (id)chatNavbarColor;
- (id)chromeEffectForInterfaceStyle:(int64_t)a3;
- (id)conversationListBoldSummaryFont;
- (id)conversationListPinnedConversationNameFont;
- (id)conversationListSenderFont;
- (id)conversationListSummaryFont;
- (id)effectPreviewOverlayEffect;
- (id)emojiStickerTranscriptCellFont;
- (id)entryViewAppButtonName;
- (id)entryViewAudioButtonName;
- (id)entryViewMacCancelButtonName;
- (id)entryViewMacEmojiButtonImage;
- (id)entryViewMacStopButtonName;
- (id)imageBalloonSelectionOverlayColor;
- (id)iosMacDetailsButtonText;
- (id)livePhotoBadgeImage;
- (id)locationBoldButtonFont;
- (id)locationButtonFont;
- (id)macToolbarDetailsImage;
- (id)macToolbarDetailsImageName;
- (id)macToolbarFaceTimeImage;
- (id)macToolbarFaceTimeImageName;
- (id)macToolbarJoinableFaceTimeAudioImageName;
- (id)macToolbarJoinableFaceTimeVideoImageName;
- (id)macToolbarJoinedFaceTimeAudioImageName;
- (id)macToolbarJoinedFaceTimeVideoImageName;
- (id)macToolbarSymbolConfiguration;
- (id)mentionsCellNameFont;
- (id)messageAcknowledgmentVoteCountFont;
- (id)navbarDefaultLabelFont;
- (id)nicknameUpdatesSubtitleFont;
- (id)nicknameUpdatesTitleFont;
- (id)previewTitleFont;
- (id)quickSaveButtonImage;
- (id)quickSavePinImage;
- (id)recipientNameFont;
- (id)replyBalloonTextFont;
- (id)replyButtonFont;
- (id)searchBarFont;
- (id)searchHeaderButtonFont;
- (id)searchHeaderFont;
- (id)searchIndexingSubtitleFont;
- (id)searchIndexingTitleFont;
- (id)searchMessageBodyTextFont;
- (id)searchResultLabelFont;
- (id)stickerDetailsCellBackgroundColor;
- (id)stickerSaveButtonConfiguration;
- (id)stickerViewButtonConfiguration;
- (id)syncBarHairlineColor;
- (id)syncProgressLabelFont;
- (id)tapbackPickerSizingFont;
- (id)textFontUserDefaults:(id)a3;
- (id)theme;
- (id)transcriptBoldFont;
- (id)transcriptButtonTextFont;
- (id)transcriptLightFont;
- (id)transcriptMessageStatusDateFont;
- (id)transcriptMessageStatusFont;
- (id)transcriptRegularFont;
- (id)transcriptSenderFont;
- (id)tuConversationBalloonActionButtonFont;
- (id)tuConversationBalloonActionButtonFontStyle;
- (int64_t)_detailsActionViewStyle;
- (int64_t)detailsActionViewStyle;
- (int64_t)detailsGroupChevronImageScale;
- (int64_t)groupRecipientSelectionPresentationStyle;
- (int64_t)sendMenuPlusSymbolScale;
- (int64_t)syncBarBlurEffectStyle;
- (unint64_t)contactsSettingsCacheSize;
- (unint64_t)defaultConversationLoadMoreCount;
- (unint64_t)detailsSectionCount;
@end

@implementation CKUIBehaviorMac

- (id)theme
{
  if (theme_once_0 != -1) {
    dispatch_once(&theme_once_0, &__block_literal_global_164);
  }
  v2 = (void *)theme_sBehavior_0;

  return v2;
}

void __24__CKUIBehaviorMac_theme__block_invoke()
{
  v0 = objc_alloc_init(CKUIThemeMac);
  v1 = (void *)theme_sBehavior_0;
  theme_sBehavior_0 = (uint64_t)v0;
}

- (BOOL)canPresentOverKeyboard
{
  if (canPresentOverKeyboard_once_0 != -1) {
    dispatch_once(&canPresentOverKeyboard_once_0, &__block_literal_global_30);
  }
  return canPresentOverKeyboard_sBehavior_0;
}

void __41__CKUIBehaviorMac_canPresentOverKeyboard__block_invoke()
{
  canPresentOverKeyboard_sBehavior_0 = 1;
}

- (double)minWindowWidthPrimaryColumnOffset
{
  if (minWindowWidthPrimaryColumnOffset_once != -1) {
    dispatch_once(&minWindowWidthPrimaryColumnOffset_once, &__block_literal_global_32);
  }
  return *(double *)&minWindowWidthPrimaryColumnOffset_sBehavior;
}

void __52__CKUIBehaviorMac_minWindowWidthPrimaryColumnOffset__block_invoke()
{
  minWindowWidthPrimaryColumnOffset_sBehavior = 0x4075400000000000;
}

- (CGSize)minWindowSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CKUIBehaviorMac_minWindowSize__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (minWindowSize_once != -1) {
    dispatch_once(&minWindowSize_once, block);
  }
  double v2 = *(double *)&minWindowSize_sBehavior_0;
  double v3 = *(double *)&minWindowSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

double __32__CKUIBehaviorMac_minWindowSize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) minConversationListWidth];
  double v3 = v2;
  [*(id *)(a1 + 32) minWindowWidthPrimaryColumnOffset];
  double result = v3 + v4;
  minWindowSize_sBehavior_0 = *(void *)&result;
  minWindowSize_sBehavior_1 = 0x4074000000000000;
  return result;
}

- (id)chromeEffectForInterfaceStyle:(int64_t)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:30.0];
  double v5 = 2.0;
  if (a3 == 2)
  {
    double v5 = 1.0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 5;
  }
  v7 = [MEMORY[0x1E4F428C0] colorEffectSaturate:v5];
  v8 = (void *)MEMORY[0x1E4F43020];
  v9 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v10 = [v8 effectCompositingColor:v9 withMode:v6 alpha:0.7];

  v11 = (void *)MEMORY[0x1E4F43020];
  v15[0] = v4;
  v15[1] = v7;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v13 = [v11 effectCombiningEffects:v12];

  return v13;
}

- (id)effectPreviewOverlayEffect
{
  return 0;
}

- (BOOL)useMacToolbar
{
  if (useMacToolbar_once_0 != -1) {
    dispatch_once(&useMacToolbar_once_0, &__block_literal_global_39_0);
  }
  return useMacToolbar_sBehavior;
}

void __32__CKUIBehaviorMac_useMacToolbar__block_invoke()
{
  if (CKIsRunningInMacCatalyst())
  {
    v0 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v1 = [v0 macToolbarEnabled];
  }
  else
  {
    char v1 = 0;
  }
  useMacToolbar_sBehavior = v1;
}

- (double)macToolbarImagePointSize
{
  if (macToolbarImagePointSize_once != -1) {
    dispatch_once(&macToolbarImagePointSize_once, &__block_literal_global_42);
  }
  return *(double *)&macToolbarImagePointSize_sBehavior;
}

void __43__CKUIBehaviorMac_macToolbarImagePointSize__block_invoke()
{
  macToolbarImagePointSize_sBehavior = 0x4036000000000000;
}

- (id)macToolbarFaceTimeImageName
{
  if (macToolbarFaceTimeImageName_once != -1) {
    dispatch_once(&macToolbarFaceTimeImageName_once, &__block_literal_global_44_0);
  }
  double v2 = (void *)macToolbarFaceTimeImageName_sBehavior;

  return v2;
}

void __46__CKUIBehaviorMac_macToolbarFaceTimeImageName__block_invoke()
{
  v0 = (void *)macToolbarFaceTimeImageName_sBehavior;
  macToolbarFaceTimeImageName_sBehavior = @"video";
}

- (id)macToolbarJoinedFaceTimeVideoImageName
{
  if (macToolbarJoinedFaceTimeVideoImageName_once != -1) {
    dispatch_once(&macToolbarJoinedFaceTimeVideoImageName_once, &__block_literal_global_49);
  }
  double v2 = (void *)macToolbarJoinedFaceTimeVideoImageName_sBehavior;

  return v2;
}

void __57__CKUIBehaviorMac_macToolbarJoinedFaceTimeVideoImageName__block_invoke()
{
  v0 = (void *)macToolbarJoinedFaceTimeVideoImageName_sBehavior;
  macToolbarJoinedFaceTimeVideoImageName_sBehavior = @"video.fill";
}

- (id)macToolbarJoinedFaceTimeAudioImageName
{
  if (macToolbarJoinedFaceTimeAudioImageName_once != -1) {
    dispatch_once(&macToolbarJoinedFaceTimeAudioImageName_once, &__block_literal_global_54);
  }
  double v2 = (void *)macToolbarJoinedFaceTimeAudioImageName_sBehavior;

  return v2;
}

void __57__CKUIBehaviorMac_macToolbarJoinedFaceTimeAudioImageName__block_invoke()
{
  v0 = (void *)macToolbarJoinedFaceTimeAudioImageName_sBehavior;
  macToolbarJoinedFaceTimeAudioImageName_sBehavior = @"phone.fill";
}

- (id)macToolbarJoinableFaceTimeVideoImageName
{
  if (macToolbarJoinableFaceTimeVideoImageName_once != -1) {
    dispatch_once(&macToolbarJoinableFaceTimeVideoImageName_once, &__block_literal_global_59_1);
  }
  double v2 = (void *)macToolbarJoinableFaceTimeVideoImageName_sBehavior;

  return v2;
}

void __59__CKUIBehaviorMac_macToolbarJoinableFaceTimeVideoImageName__block_invoke()
{
  v0 = (void *)macToolbarJoinableFaceTimeVideoImageName_sBehavior;
  macToolbarJoinableFaceTimeVideoImageName_sBehavior = @"video.fill";
}

- (id)macToolbarJoinableFaceTimeAudioImageName
{
  if (macToolbarJoinableFaceTimeAudioImageName_once != -1) {
    dispatch_once(&macToolbarJoinableFaceTimeAudioImageName_once, &__block_literal_global_61_1);
  }
  double v2 = (void *)macToolbarJoinableFaceTimeAudioImageName_sBehavior;

  return v2;
}

void __59__CKUIBehaviorMac_macToolbarJoinableFaceTimeAudioImageName__block_invoke()
{
  v0 = (void *)macToolbarJoinableFaceTimeAudioImageName_sBehavior;
  macToolbarJoinableFaceTimeAudioImageName_sBehavior = @"phone.fill";
}

- (id)macToolbarDetailsImageName
{
  if (macToolbarDetailsImageName_once != -1) {
    dispatch_once(&macToolbarDetailsImageName_once, &__block_literal_global_63);
  }
  double v2 = (void *)macToolbarDetailsImageName_sBehavior;

  return v2;
}

void __45__CKUIBehaviorMac_macToolbarDetailsImageName__block_invoke()
{
  v0 = (void *)macToolbarDetailsImageName_sBehavior;
  macToolbarDetailsImageName_sBehavior = @"info.circle";
}

- (id)macToolbarFaceTimeImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CKUIBehaviorMac_macToolbarFaceTimeImage__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macToolbarFaceTimeImage_once != -1) {
    dispatch_once(&macToolbarFaceTimeImage_once, block);
  }
  return (id)macToolbarFaceTimeImage_sBehavior;
}

void __42__CKUIBehaviorMac_macToolbarFaceTimeImage__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v5 = [v2 macToolbarFaceTimeImageName];
  [*(id *)(a1 + 32) macToolbarImagePointSize];
  uint64_t v3 = objc_msgSend(v2, "imageNamed:pointSize:insets:", v5);
  double v4 = (void *)macToolbarFaceTimeImage_sBehavior;
  macToolbarFaceTimeImage_sBehavior = v3;
}

- (id)macToolbarDetailsImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CKUIBehaviorMac_macToolbarDetailsImage__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macToolbarDetailsImage_once != -1) {
    dispatch_once(&macToolbarDetailsImage_once, block);
  }
  return (id)macToolbarDetailsImage_sBehavior;
}

void __41__CKUIBehaviorMac_macToolbarDetailsImage__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v5 = [v2 macToolbarDetailsImageName];
  [*(id *)(a1 + 32) macToolbarImagePointSize];
  uint64_t v3 = objc_msgSend(v2, "imageNamed:pointSize:insets:", v5);
  double v4 = (void *)macToolbarDetailsImage_sBehavior;
  macToolbarDetailsImage_sBehavior = v3;
}

- (id)macToolbarSymbolConfiguration
{
  if (macToolbarSymbolConfiguration_once != -1) {
    dispatch_once(&macToolbarSymbolConfiguration_once, &__block_literal_global_68);
  }
  double v2 = (void *)macToolbarSymbolConfiguration_sBehavior;

  return v2;
}

void __48__CKUIBehaviorMac_macToolbarSymbolConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:3 scale:13.0];
  char v1 = (void *)macToolbarSymbolConfiguration_sBehavior;
  macToolbarSymbolConfiguration_sBehavior = v0;
}

- (unint64_t)contactsSettingsCacheSize
{
  if (contactsSettingsCacheSize_once_0 != -1) {
    dispatch_once(&contactsSettingsCacheSize_once_0, &__block_literal_global_71);
  }
  if (contactsSettingsCacheSize_sBehavior_0) {
    return 1000;
  }
  else {
    return 0;
  }
}

void __44__CKUIBehaviorMac_contactsSettingsCacheSize__block_invoke()
{
  contactsSettingsCacheSize_sBehavior_0 = 1;
}

- (BOOL)ckShouldUpdatebottomConversationListSpace
{
  return 0;
}

- (double)bottomConversationListSpace
{
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @"None";
  }
  v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)bottomConversationListSpace_sContentSizeCategory_bottomConversationListSpace_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatebottomConversationListSpace]
    || v10
    || bottomConversationListSpace_sIsBoldTextEnabled_bottomConversationListSpace_0 != IsBoldTextEnabled
    || (uint64_t v11 = bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0,
        *(double *)&bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0 != v5)
    || (uint64_t v11 = bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0,
        *(double *)&bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0 != v6)
    || (objc_msgSend((id)bottomConversationListSpace_sCustomTextFontName_bottomConversationListSpace_0, "isEqualToString:", v9, *(double *)&bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0) & 1) == 0)
  {
    [(CKUIBehavior *)self conversationListSummaryBodyLeading];
    bottomConversationListSpace_sBehavior_0 = v12;
    objc_storeStrong((id *)&bottomConversationListSpace_sContentSizeCategory_bottomConversationListSpace_0, v3);
    bottomConversationListSpace_sIsBoldTextEnabled_bottomConversationListSpace_0 = IsBoldTextEnabled;
    bottomConversationListSpace_sTextFontSize_bottomConversationListSpace_0 = *(void *)&v5;
    bottomConversationListSpace_sCustomTextFontSize_bottomConversationListSpace_0 = *(void *)&v6;
    objc_storeStrong((id *)&bottomConversationListSpace_sCustomTextFontName_bottomConversationListSpace_0, v8);
  }
  double v13 = *(double *)&bottomConversationListSpace_sBehavior_0;

  return v13;
}

- (unint64_t)defaultConversationLoadMoreCount
{
  if (defaultConversationLoadMoreCount_once_0 != -1) {
    dispatch_once(&defaultConversationLoadMoreCount_once_0, &__block_literal_global_76);
  }
  if (defaultConversationLoadMoreCount_sBehavior_0) {
    return 100;
  }
  else {
    return 0;
  }
}

void __51__CKUIBehaviorMac_defaultConversationLoadMoreCount__block_invoke()
{
  defaultConversationLoadMoreCount_sBehavior_0 = 1;
}

- (Class)navigationBarClass
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CKUIBehaviorMac_navigationBarClass__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (navigationBarClass_once_0 != -1) {
    dispatch_once(&navigationBarClass_once_0, block);
  }
  return (Class)(id)navigationBarClass_sBehavior_0;
}

id __37__CKUIBehaviorMac_navigationBarClass__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CKUIBehaviorMac;
  id result = objc_msgSendSuper2(&v2, sel_navigationBarClass);
  navigationBarClass_sBehavior_0 = (uint64_t)result;
  return result;
}

- (BOOL)suppressPinActivityForState:(id)a3
{
  return [a3 isSelected];
}

- (BOOL)shouldUnreadIndicatorChangeOnSelection
{
  if (shouldUnreadIndicatorChangeOnSelection_once_0[0] != -1) {
    dispatch_once(shouldUnreadIndicatorChangeOnSelection_once_0, &__block_literal_global_78);
  }
  return shouldUnreadIndicatorChangeOnSelection_sBehavior;
}

void __57__CKUIBehaviorMac_shouldUnreadIndicatorChangeOnSelection__block_invoke()
{
  shouldUnreadIndicatorChangeOnSelection_sBehavior = 1;
}

- (double)conversationListContactImageDiameter
{
  if (conversationListContactImageDiameter_once_0 != -1) {
    dispatch_once(&conversationListContactImageDiameter_once_0, &__block_literal_global_80);
  }
  return *(double *)&conversationListContactImageDiameter_sBehavior_0;
}

void __55__CKUIBehaviorMac_conversationListContactImageDiameter__block_invoke()
{
  conversationListContactImageDiameter_sBehavior_0 = 0x4044000000000000;
}

- (double)conversationListCellCloseButtonWidth
{
  if (conversationListCellCloseButtonWidth_once != -1) {
    dispatch_once(&conversationListCellCloseButtonWidth_once, &__block_literal_global_82);
  }
  return *(double *)&conversationListCellCloseButtonWidth_sBehavior;
}

void __55__CKUIBehaviorMac_conversationListCellCloseButtonWidth__block_invoke()
{
  conversationListCellCloseButtonWidth_sBehavior = 0x402E000000000000;
}

- (double)conversationListCellCloseButtonHeight
{
  if (conversationListCellCloseButtonHeight_once != -1) {
    dispatch_once(&conversationListCellCloseButtonHeight_once, &__block_literal_global_84);
  }
  return *(double *)&conversationListCellCloseButtonHeight_sBehavior;
}

void __56__CKUIBehaviorMac_conversationListCellCloseButtonHeight__block_invoke()
{
  conversationListCellCloseButtonHeight_sBehavior = 0x402E000000000000;
}

- (BOOL)ckShouldUpdateconversationListSenderFont
{
  return 0;
}

- (id)conversationListSenderFont
{
  v30[1] = *MEMORY[0x1E4F143B8];
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    v9 = v8;
  }
  else {
    v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListSenderFont_sContentSizeCategory_conversationListSenderFont_0, v3);
  BOOL v12 = [(CKUIBehaviorMac *)self ckShouldUpdateconversationListSenderFont];
  v14 = &previewPrewarmQueue_once;
  if (v12
    || v11
    || conversationListSenderFont_sIsIncreaseContrastEnabled_conversationListSenderFont_0 != v4
    || conversationListSenderFont_sIsBoldTextEnabled_conversationListSenderFont_0 != IsBoldTextEnabled
    || (uint64_t v13 = conversationListSenderFont_sTextFontSize_conversationListSenderFont_0,
        *(double *)&conversationListSenderFont_sTextFontSize_conversationListSenderFont_0 != v6)
    || (uint64_t v13 = conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0,
        *(double *)&conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0 != v7)
    || (objc_msgSend((id)conversationListSenderFont_sCustomTextFontName_conversationListSenderFont_0, "isEqualToString:", v10, *(double *)&conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0) & 1) == 0)
  {
    v15 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F43870], *(double *)&v13);
    uint64_t v29 = *MEMORY[0x1E4FB0950];
    uint64_t v27 = *MEMORY[0x1E4FB09F0];
    v16 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
    v28 = v16;
    obj = v9;
    v17 = v10;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = v18 = v3;
    v30[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v21 = [v15 fontDescriptorByAddingAttributes:v20];

    uint64_t v3 = v18;
    v14 = &previewPrewarmQueue_once;
    uint64_t v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:0.0];

    NSComparisonResult v10 = v17;
    v23 = (void *)conversationListSenderFont_sBehavior_0;
    conversationListSenderFont_sBehavior_0 = v22;

    objc_storeStrong((id *)&conversationListSenderFont_sContentSizeCategory_conversationListSenderFont_0, v18);
    conversationListSenderFont_sIsIncreaseContrastEnabled_conversationListSenderFont_0 = v4;
    conversationListSenderFont_sIsBoldTextEnabled_conversationListSenderFont_0 = IsBoldTextEnabled;
    conversationListSenderFont_sTextFontSize_conversationListSenderFont_0 = *(void *)&v6;
    conversationListSenderFont_sCustomTextFontSize_conversationListSenderFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&conversationListSenderFont_sCustomTextFontName_conversationListSenderFont_0, obj);
  }
  id v24 = (id)v14[435];

  return v24;
}

- (BOOL)ckShouldUpdateconversationListSummaryFont
{
  return 0;
}

- (id)conversationListSummaryFont
{
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    v9 = v8;
  }
  else {
    v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListSummaryFont_sContentSizeCategory_conversationListSummaryFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateconversationListSummaryFont]
    || v11
    || conversationListSummaryFont_sIsIncreaseContrastEnabled_conversationListSummaryFont_0 != v4
    || conversationListSummaryFont_sIsBoldTextEnabled_conversationListSummaryFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0,
        *(double *)&conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0 != v6)
    || (uint64_t v12 = conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0,
        *(double *)&conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0 != v7)
    || (objc_msgSend((id)conversationListSummaryFont_sCustomTextFontName_conversationListSummaryFont_0, "isEqualToString:", v10, *(double *)&conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F438C8], *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:12.0];

    v15 = (void *)conversationListSummaryFont_sBehavior_0;
    conversationListSummaryFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&conversationListSummaryFont_sContentSizeCategory_conversationListSummaryFont_0, v3);
    conversationListSummaryFont_sIsIncreaseContrastEnabled_conversationListSummaryFont_0 = v4;
    conversationListSummaryFont_sIsBoldTextEnabled_conversationListSummaryFont_0 = IsBoldTextEnabled;
    conversationListSummaryFont_sTextFontSize_conversationListSummaryFont_0 = *(void *)&v6;
    conversationListSummaryFont_sCustomTextFontSize_conversationListSummaryFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&conversationListSummaryFont_sCustomTextFontName_conversationListSummaryFont_0, v9);
  }
  id v16 = (id)conversationListSummaryFont_sBehavior_0;

  return v16;
}

- (BOOL)ckShouldUpdateconversationListBoldSummaryFont
{
  return 0;
}

- (id)conversationListBoldSummaryFont
{
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    v9 = v8;
  }
  else {
    v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListBoldSummaryFont_sContentSizeCategory_conversationListBoldSummaryFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListBoldSummaryFont](self, "ckShouldUpdateconversationListBoldSummaryFont")|| v11|| conversationListBoldSummaryFont_sIsIncreaseContrastEnabled_conversationListBoldSummaryFont_0 != v4|| conversationListBoldSummaryFont_sIsBoldTextEnabled_conversationListBoldSummaryFont_0 != IsBoldTextEnabled|| (uint64_t v12 = conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0, *(double *)&conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0 != v6)|| (uint64_t v12 = conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0, *(double *)&conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0 != v7)|| (objc_msgSend((id)conversationListBoldSummaryFont_sCustomTextFontName_conversationListBoldSummaryFont_0, "isEqualToString:", v10, *(double *)&conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F438C8], 2, 0, *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:12.0];

    v15 = (void *)conversationListBoldSummaryFont_sBehavior_0;
    conversationListBoldSummaryFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&conversationListBoldSummaryFont_sContentSizeCategory_conversationListBoldSummaryFont_0, v3);
    conversationListBoldSummaryFont_sIsIncreaseContrastEnabled_conversationListBoldSummaryFont_0 = v4;
    conversationListBoldSummaryFont_sIsBoldTextEnabled_conversationListBoldSummaryFont_0 = IsBoldTextEnabled;
    conversationListBoldSummaryFont_sTextFontSize_conversationListBoldSummaryFont_0 = *(void *)&v6;
    conversationListBoldSummaryFont_sCustomTextFontSize_conversationListBoldSummaryFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&conversationListBoldSummaryFont_sCustomTextFontName_conversationListBoldSummaryFont_0, v9);
  }
  id v16 = (id)conversationListBoldSummaryFont_sBehavior_0;

  return v16;
}

- (BOOL)ckShouldUpdateconversationListPinnedConversationNameFont
{
  return 0;
}

- (id)conversationListPinnedConversationNameFont
{
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    v9 = v8;
  }
  else {
    v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListPinnedConversationNameFont_sContentSizeCategory_conversationListPinnedConversationNameFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListPinnedConversationNameFont](self, "ckShouldUpdateconversationListPinnedConversationNameFont")|| v11|| conversationListPinnedConversationNameFont_sIsIncreaseContrastEnabled_conversationListPinnedConversationNameFont_0 != v4|| conversationListPinnedConversationNameFont_sIsBoldTextEnabled_conversationListPinnedConversationNameFont_0 != IsBoldTextEnabled|| (uint64_t v12 = conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0, *(double *)&conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0 != v6)|| (uint64_t v12 = conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0, *(double *)&conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0 != v7)|| (objc_msgSend((id)conversationListPinnedConversationNameFont_sCustomTextFontName_conversationListPinnedConversationNameFont_0, "isEqualToString:", v10, *(double *)&conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0) & 1) == 0)
  {
    uint64_t v13 = +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E4F438C8], *MEMORY[0x1E4F43790], *(double *)&v12);
    uint64_t v14 = (void *)conversationListPinnedConversationNameFont_sBehavior_0;
    conversationListPinnedConversationNameFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&conversationListPinnedConversationNameFont_sContentSizeCategory_conversationListPinnedConversationNameFont_0, v3);
    conversationListPinnedConversationNameFont_sIsIncreaseContrastEnabled_conversationListPinnedConversationNameFont_0 = v4;
    conversationListPinnedConversationNameFont_sIsBoldTextEnabled_conversationListPinnedConversationNameFont_0 = IsBoldTextEnabled;
    conversationListPinnedConversationNameFont_sTextFontSize_conversationListPinnedConversationNameFont_0 = *(void *)&v6;
    conversationListPinnedConversationNameFont_sCustomTextFontSize_conversationListPinnedConversationNameFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&conversationListPinnedConversationNameFont_sCustomTextFontName_conversationListPinnedConversationNameFont_0, v9);
  }
  id v15 = (id)conversationListPinnedConversationNameFont_sBehavior_0;

  return v15;
}

- (double)pinnedConversationActivityBroadShadowLightRadius
{
  if (pinnedConversationActivityBroadShadowLightRadius_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowLightRadius_once_0, &__block_literal_global_91_0);
  }
  return *(double *)&pinnedConversationActivityBroadShadowLightRadius_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightRadius__block_invoke()
{
  pinnedConversationActivityBroadShadowLightRadius_sBehavior_0 = 0x4014000000000000;
}

- (double)pinnedConversationActivityBroadShadowDarkRadius
{
  if (pinnedConversationActivityBroadShadowDarkRadius_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowDarkRadius_once_0, &__block_literal_global_93_1);
  }
  return *(double *)&pinnedConversationActivityBroadShadowDarkRadius_sBehavior_0;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkRadius__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkRadius_sBehavior_0 = 0x4014000000000000;
}

- (double)pinnedConversationActivityTightShadowLightRadius
{
  if (pinnedConversationActivityTightShadowLightRadius_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowLightRadius_once_0, &__block_literal_global_95_1);
  }
  return *(double *)&pinnedConversationActivityTightShadowLightRadius_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightRadius__block_invoke()
{
  pinnedConversationActivityTightShadowLightRadius_sBehavior_0 = 0x3FF0000000000000;
}

- (double)pinnedConversationActivityTightShadowDarkRadius
{
  if (pinnedConversationActivityTightShadowDarkRadius_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowDarkRadius_once_0, &__block_literal_global_97_2);
  }
  return *(double *)&pinnedConversationActivityTightShadowDarkRadius_sBehavior_0;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkRadius__block_invoke()
{
  pinnedConversationActivityTightShadowDarkRadius_sBehavior_0 = 0x3FF0000000000000;
}

- (double)pinnedConversationActivityBroadShadowLightOpacity
{
  if (pinnedConversationActivityBroadShadowLightOpacity_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowLightOpacity_once_0, &__block_literal_global_99_1);
  }
  return *(double *)&pinnedConversationActivityBroadShadowLightOpacity_sBehavior_0;
}

void __68__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightOpacity__block_invoke()
{
  pinnedConversationActivityBroadShadowLightOpacity_sBehavior_0 = 0x3FBEB851EB851EB8;
}

- (double)pinnedConversationActivityBroadShadowDarkOpacity
{
  if (pinnedConversationActivityBroadShadowDarkOpacity_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowDarkOpacity_once_0, &__block_literal_global_101_1);
  }
  return *(double *)&pinnedConversationActivityBroadShadowDarkOpacity_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkOpacity__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkOpacity_sBehavior_0 = 0x3FD47AE147AE147BLL;
}

- (double)pinnedConversationActivityTightShadowLightOpacity
{
  if (pinnedConversationActivityTightShadowLightOpacity_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowLightOpacity_once_0, &__block_literal_global_103_0);
  }
  return *(double *)&pinnedConversationActivityTightShadowLightOpacity_sBehavior_0;
}

void __68__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightOpacity__block_invoke()
{
  pinnedConversationActivityTightShadowLightOpacity_sBehavior_0 = 0x3FC3333333333333;
}

- (double)pinnedConversationActivityTightShadowDarkOpacity
{
  if (pinnedConversationActivityTightShadowDarkOpacity_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowDarkOpacity_once_0, &__block_literal_global_105_1);
  }
  return *(double *)&pinnedConversationActivityTightShadowDarkOpacity_sBehavior_0;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkOpacity__block_invoke()
{
  pinnedConversationActivityTightShadowDarkOpacity_sBehavior_0 = 0x3FC3333333333333;
}

- (CGSize)pinnedConversationActivityBroadShadowLightOffset
{
  if (pinnedConversationActivityBroadShadowLightOffset_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowLightOffset_once_0, &__block_literal_global_107_0);
  }
  double v2 = *(double *)&pinnedConversationActivityBroadShadowLightOffset_sBehavior_1_0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

void __67__CKUIBehaviorMac_pinnedConversationActivityBroadShadowLightOffset__block_invoke()
{
  pinnedConversationActivityBroadShadowLightOffset_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)pinnedConversationActivityBroadShadowDarkOffset
{
  if (pinnedConversationActivityBroadShadowDarkOffset_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityBroadShadowDarkOffset_once_0, &__block_literal_global_109_0);
  }
  double v2 = *(double *)&pinnedConversationActivityBroadShadowDarkOffset_sBehavior_1_0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

void __66__CKUIBehaviorMac_pinnedConversationActivityBroadShadowDarkOffset__block_invoke()
{
  pinnedConversationActivityBroadShadowDarkOffset_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)pinnedConversationActivityTightShadowLightOffset
{
  if (pinnedConversationActivityTightShadowLightOffset_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowLightOffset_once_0, &__block_literal_global_111_0);
  }
  double v3 = *((double *)&pinnedConversationActivityTightShadowLightOffset_sBehavior_0 + 1);
  double v2 = *(double *)&pinnedConversationActivityTightShadowLightOffset_sBehavior_0;
  result.height = v3;
  result.width = v2;
  return result;
}

__n128 __67__CKUIBehaviorMac_pinnedConversationActivityTightShadowLightOffset__block_invoke()
{
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB30];
  pinnedConversationActivityTightShadowLightOffset_sBehavior_0 = *MEMORY[0x1E4F1DB30];
  return result;
}

- (CGSize)pinnedConversationActivityTightShadowDarkOffset
{
  if (pinnedConversationActivityTightShadowDarkOffset_once_0 != -1) {
    dispatch_once(&pinnedConversationActivityTightShadowDarkOffset_once_0, &__block_literal_global_113_0);
  }
  double v3 = *((double *)&pinnedConversationActivityTightShadowDarkOffset_sBehavior_0 + 1);
  double v2 = *(double *)&pinnedConversationActivityTightShadowDarkOffset_sBehavior_0;
  result.height = v3;
  result.width = v2;
  return result;
}

__n128 __66__CKUIBehaviorMac_pinnedConversationActivityTightShadowDarkOffset__block_invoke()
{
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB30];
  pinnedConversationActivityTightShadowDarkOffset_sBehavior_0 = *MEMORY[0x1E4F1DB30];
  return result;
}

- (double)conversationListSenderToDateHorizontalPadding
{
  if (conversationListSenderToDateHorizontalPadding_once_0 != -1) {
    dispatch_once(&conversationListSenderToDateHorizontalPadding_once_0, &__block_literal_global_115_1);
  }
  return *(double *)&conversationListSenderToDateHorizontalPadding_sBehavior_0;
}

void __64__CKUIBehaviorMac_conversationListSenderToDateHorizontalPadding__block_invoke()
{
  conversationListSenderToDateHorizontalPadding_sBehavior_0 = 0x4020000000000000;
}

- (UIEdgeInsets)conversationListPinnedCellTitleLabelVerticalPadding
{
  if (conversationListPinnedCellTitleLabelVerticalPadding_once_0 != -1) {
    dispatch_once(&conversationListPinnedCellTitleLabelVerticalPadding_once_0, &__block_literal_global_117_0);
  }
  double v2 = *(double *)&conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_0_0;
  double v3 = *(double *)&conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_2_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __70__CKUIBehaviorMac_conversationListPinnedCellTitleLabelVerticalPadding__block_invoke()
{
  conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_0_0 = 0x4018000000000000;
  conversationListPinnedCellTitleLabelVerticalPadding_sBehavior_2_0 = 0x4024000000000000;
}

- (BOOL)ckShouldUpdateconversationListCellRoundSelectorLeftInset
{
  return 0;
}

- (double)conversationListCellRoundSelectorLeftInset
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @"None";
  }
  v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRoundSelectorLeftInset_sContentSizeCategory_conversationListCellRoundSelectorLeftInset_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListCellRoundSelectorLeftInset](self, "ckShouldUpdateconversationListCellRoundSelectorLeftInset")|| v10|| conversationListCellRoundSelectorLeftInset_sIsBoldTextEnabled_conversationListCellRoundSelectorLeftInset_0 != IsBoldTextEnabled|| *(double *)&conversationListCellRoundSelectorLeftInset_sTextFontSize_conversationListCellRoundSelectorLeftInset_0 != v5|| *(double *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0 != v6|| (objc_msgSend((id)conversationListCellRoundSelectorLeftInset_sCustomTextFontName_conversationListCellRoundSelectorLeftInset_0, "isEqualToString:", v9, *(double *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0) & 1) == 0)
  {
    conversationListCellRoundSelectorLeftInset_sBehavior = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRoundSelectorLeftInset_sContentSizeCategory_conversationListCellRoundSelectorLeftInset_0, v3);
    conversationListCellRoundSelectorLeftInset_sIsBoldTextEnabled_conversationListCellRoundSelectorLeftInset_0 = IsBoldTextEnabled;
    conversationListCellRoundSelectorLeftInset_sTextFontSize_conversationListCellRoundSelectorLeftInset_0 = *(void *)&v5;
    conversationListCellRoundSelectorLeftInset_sCustomTextFontSize_conversationListCellRoundSelectorLeftInset_0 = *(void *)&v6;
    objc_storeStrong((id *)&conversationListCellRoundSelectorLeftInset_sCustomTextFontName_conversationListCellRoundSelectorLeftInset_0, v8);
  }
  double v11 = *(double *)&conversationListCellRoundSelectorLeftInset_sBehavior;

  return v11;
}

- (BOOL)ckShouldUpdateconversationListCellRoundSelectorRightInset
{
  return 0;
}

- (double)conversationListCellRoundSelectorRightInset
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @"None";
  }
  v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRoundSelectorRightInset_sContentSizeCategory_conversationListCellRoundSelectorRightInset_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListCellRoundSelectorRightInset](self, "ckShouldUpdateconversationListCellRoundSelectorRightInset")|| v10|| conversationListCellRoundSelectorRightInset_sIsBoldTextEnabled_conversationListCellRoundSelectorRightInset_0 != IsBoldTextEnabled|| *(double *)&conversationListCellRoundSelectorRightInset_sTextFontSize_conversationListCellRoundSelectorRightInset_0 != v5|| *(double *)&conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0 != v6|| (objc_msgSend((id)conversationListCellRoundSelectorRightInset_sCustomTextFontName_conversationListCellRoundSelectorRightInset_0, "isEqualToString:", v9, *(double *)&conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0) & 1) == 0)
  {
    conversationListCellRoundSelectorRightInset_sBehavior = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRoundSelectorRightInset_sContentSizeCategory_conversationListCellRoundSelectorRightInset_0, v3);
    conversationListCellRoundSelectorRightInset_sIsBoldTextEnabled_conversationListCellRoundSelectorRightInset_0 = IsBoldTextEnabled;
    conversationListCellRoundSelectorRightInset_sTextFontSize_conversationListCellRoundSelectorRightInset_0 = *(void *)&v5;
    conversationListCellRoundSelectorRightInset_sCustomTextFontSize_conversationListCellRoundSelectorRightInset_0 = *(void *)&v6;
    objc_storeStrong((id *)&conversationListCellRoundSelectorRightInset_sCustomTextFontName_conversationListCellRoundSelectorRightInset_0, v8);
  }
  double v11 = *(double *)&conversationListCellRoundSelectorRightInset_sBehavior;

  return v11;
}

- (BOOL)ckShouldUpdateconversationListCellLeftMargin
{
  return 0;
}

- (double)conversationListCellLeftMargin
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @"None";
  }
  v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellLeftMargin_sContentSizeCategory_conversationListCellLeftMargin_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListCellLeftMargin](self, "ckShouldUpdateconversationListCellLeftMargin")|| v10|| conversationListCellLeftMargin_sIsBoldTextEnabled_conversationListCellLeftMargin_0 != IsBoldTextEnabled|| (uint64_t v11 = conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0, *(double *)&conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0 != v5)|| (uint64_t v11 = conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0, *(double *)&conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0 != v6)|| (objc_msgSend((id)conversationListCellLeftMargin_sCustomTextFontName_conversationListCellLeftMargin_0, "isEqualToString:", v9, *(double *)&conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0) & 1) == 0)
  {
    [(CKUIBehaviorMac *)self unreadIndicatorTotalMargins];
    double v13 = v12;
    [(CKUIBehaviorMac *)self unreadIndicatorImageViewSize];
    *(double *)&conversationListCellLeftMargin_sBehavior_0 = v13 + v14;
    objc_storeStrong((id *)&conversationListCellLeftMargin_sContentSizeCategory_conversationListCellLeftMargin_0, v3);
    conversationListCellLeftMargin_sIsBoldTextEnabled_conversationListCellLeftMargin_0 = IsBoldTextEnabled;
    conversationListCellLeftMargin_sTextFontSize_conversationListCellLeftMargin_0 = *(void *)&v5;
    conversationListCellLeftMargin_sCustomTextFontSize_conversationListCellLeftMargin_0 = *(void *)&v6;
    objc_storeStrong((id *)&conversationListCellLeftMargin_sCustomTextFontName_conversationListCellLeftMargin_0, v8);
  }
  double v15 = *(double *)&conversationListCellLeftMargin_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdateconversationListCellRightMargin
{
  return 0;
}

- (double)conversationListCellRightMargin
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    v8 = v7;
  }
  else {
    v8 = @"None";
  }
  v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)conversationListCellRightMargin_sContentSizeCategory_conversationListCellRightMargin_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateconversationListCellRightMargin](self, "ckShouldUpdateconversationListCellRightMargin")|| v10|| conversationListCellRightMargin_sIsBoldTextEnabled_conversationListCellRightMargin_0 != IsBoldTextEnabled|| *(double *)&conversationListCellRightMargin_sTextFontSize_conversationListCellRightMargin_0 != v5|| *(double *)&conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0 != v6|| (objc_msgSend((id)conversationListCellRightMargin_sCustomTextFontName_conversationListCellRightMargin_0, "isEqualToString:", v9, *(double *)&conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0) & 1) == 0)
  {
    conversationListCellRightMargin_sBehavior_0 = 0x4024000000000000;
    objc_storeStrong((id *)&conversationListCellRightMargin_sContentSizeCategory_conversationListCellRightMargin_0, v3);
    conversationListCellRightMargin_sIsBoldTextEnabled_conversationListCellRightMargin_0 = IsBoldTextEnabled;
    conversationListCellRightMargin_sTextFontSize_conversationListCellRightMargin_0 = *(void *)&v5;
    conversationListCellRightMargin_sCustomTextFontSize_conversationListCellRightMargin_0 = *(void *)&v6;
    objc_storeStrong((id *)&conversationListCellRightMargin_sCustomTextFontName_conversationListCellRightMargin_0, v8);
  }
  double v11 = *(double *)&conversationListCellRightMargin_sBehavior_0;

  return v11;
}

- (CGSize)unreadIndicatorImageViewSize
{
  if (unreadIndicatorImageViewSize_once_0 != -1) {
    dispatch_once(&unreadIndicatorImageViewSize_once_0, &__block_literal_global_119_0);
  }
  double v2 = *(double *)&unreadIndicatorImageViewSize_sBehavior_0_0;
  double v3 = *(double *)&unreadIndicatorImageViewSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __47__CKUIBehaviorMac_unreadIndicatorImageViewSize__block_invoke()
{
  unreadIndicatorImageViewSize_sBehavior_0_0 = 0x4022000000000000;
  unreadIndicatorImageViewSize_sBehavior_1_0 = 0x4022000000000000;
}

- (double)unreadIndicatorTotalMargins
{
  if (unreadIndicatorTotalMargins_once != -1) {
    dispatch_once(&unreadIndicatorTotalMargins_once, &__block_literal_global_121_1);
  }
  return *(double *)&unreadIndicatorTotalMargins_sBehavior;
}

void __46__CKUIBehaviorMac_unreadIndicatorTotalMargins__block_invoke()
{
  unreadIndicatorTotalMargins_sBehavior = 0x4022000000000000;
}

- (double)conversationListContactImageTrailingSpace
{
  if (conversationListContactImageTrailingSpace_once_0 != -1) {
    dispatch_once(&conversationListContactImageTrailingSpace_once_0, &__block_literal_global_123_0);
  }
  return *(double *)&conversationListContactImageTrailingSpace_sBehavior_0;
}

void __60__CKUIBehaviorMac_conversationListContactImageTrailingSpace__block_invoke()
{
  conversationListContactImageTrailingSpace_sBehavior_0 = 0x4018000000000000;
}

- (double)legacyMacAppMinConversationListWidth
{
  if (legacyMacAppMinConversationListWidth_once != -1) {
    dispatch_once(&legacyMacAppMinConversationListWidth_once, &__block_literal_global_125_0);
  }
  return *(double *)&legacyMacAppMinConversationListWidth_sBehavior;
}

void __55__CKUIBehaviorMac_legacyMacAppMinConversationListWidth__block_invoke()
{
  legacyMacAppMinConversationListWidth_sBehavior = 0x4056000000000000;
}

- (double)legacyMacAppSnapToMinConversationListWidth
{
  if (legacyMacAppSnapToMinConversationListWidth_once != -1) {
    dispatch_once(&legacyMacAppSnapToMinConversationListWidth_once, &__block_literal_global_127_0);
  }
  return *(double *)&legacyMacAppSnapToMinConversationListWidth_sBehavior;
}

void __61__CKUIBehaviorMac_legacyMacAppSnapToMinConversationListWidth__block_invoke()
{
  legacyMacAppSnapToMinConversationListWidth_sBehavior = 0x4070E00000000000;
}

- (double)conversationListDragDistanceThreshold
{
  if (conversationListDragDistanceThreshold_once != -1) {
    dispatch_once(&conversationListDragDistanceThreshold_once, &__block_literal_global_129_0);
  }
  return *(double *)&conversationListDragDistanceThreshold_sBehavior;
}

void __56__CKUIBehaviorMac_conversationListDragDistanceThreshold__block_invoke()
{
  conversationListDragDistanceThreshold_sBehavior = 0x402E000000000000;
}

- (CGSize)minConversationListWidthComposeButtonSize
{
  if (minConversationListWidthComposeButtonSize_once != -1) {
    dispatch_once(&minConversationListWidthComposeButtonSize_once, &__block_literal_global_131);
  }
  double v2 = *(double *)&minConversationListWidthComposeButtonSize_sBehavior_0;
  double v3 = *(double *)&minConversationListWidthComposeButtonSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __60__CKUIBehaviorMac_minConversationListWidthComposeButtonSize__block_invoke()
{
  minConversationListWidthComposeButtonSize_sBehavior_0 = 0x4046000000000000;
  minConversationListWidthComposeButtonSize_sBehavior_1 = 0x403C000000000000;
}

- (double)minConversationListWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_minConversationListWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (minConversationListWidth_once_0 != -1) {
    dispatch_once(&minConversationListWidth_once_0, block);
  }
  return *(double *)&minConversationListWidth_sBehavior_0;
}

double __43__CKUIBehaviorMac_minConversationListWidth__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) conversationListCellRoundSelectorLeftInset];
  double v3 = v2;
  [*(id *)(a1 + 32) conversationListCellLeftMargin];
  double v5 = v3 + v4;
  [*(id *)(a1 + 32) conversationListContactImageDiameter];
  double v7 = v5 + v6;
  [*(id *)(a1 + 32) conversationListContactImageTrailingSpace];
  double v9 = v7 + v8;
  [*(id *)(a1 + 32) conversationListCellRightMargin];
  double v11 = v9 + v10;
  [*(id *)(a1 + 32) conversationListCellRoundSelectorRightInset];
  double result = v11 + v12;
  minConversationListWidth_sBehavior_0 = *(void *)&result;
  return result;
}

- (double)snapToMinConversationListWidth
{
  if (snapToMinConversationListWidth_once != -1) {
    dispatch_once(&snapToMinConversationListWidth_once, &__block_literal_global_133);
  }
  return *(double *)&snapToMinConversationListWidth_sBehavior;
}

void __49__CKUIBehaviorMac_snapToMinConversationListWidth__block_invoke()
{
  snapToMinConversationListWidth_sBehavior = 0x4074000000000000;
}

- (double)snapToMinConversationListCellWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CKUIBehaviorMac_snapToMinConversationListCellWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (snapToMinConversationListCellWidth_once != -1) {
    dispatch_once(&snapToMinConversationListCellWidth_once, block);
  }
  return *(double *)&snapToMinConversationListCellWidth_sBehavior;
}

double __53__CKUIBehaviorMac_snapToMinConversationListCellWidth__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) snapToMinConversationListWidth];
  double v3 = v2;
  [*(id *)(a1 + 32) conversationListCellRoundSelectorLeftInset];
  double v5 = v3 - v4;
  [*(id *)(a1 + 32) conversationListCellRoundSelectorRightInset];
  double result = v5 - v6;
  snapToMinConversationListCellWidth_sBehavior = *(void *)&result;
  return result;
}

- (double)defaultConversationListWidth
{
  if (defaultConversationListWidth_once != -1) {
    dispatch_once(&defaultConversationListWidth_once, &__block_literal_global_135);
  }
  return *(double *)&defaultConversationListWidth_sBehavior;
}

void __47__CKUIBehaviorMac_defaultConversationListWidth__block_invoke()
{
  defaultConversationListWidth_sBehavior = 0x4074000000000000;
}

- (double)maxConversationListWidth
{
  if (maxConversationListWidth_once_0 != -1) {
    dispatch_once(&maxConversationListWidth_once_0, &__block_literal_global_137_0);
  }
  return *(double *)&maxConversationListWidth_sBehavior_0;
}

void __43__CKUIBehaviorMac_maxConversationListWidth__block_invoke()
{
  maxConversationListWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)conversationListMinimumWidthForHiddenContactImage
{
  if (conversationListMinimumWidthForHiddenContactImage_once_0 != -1) {
    dispatch_once(&conversationListMinimumWidthForHiddenContactImage_once_0, &__block_literal_global_139_0);
  }
  return *(double *)&conversationListMinimumWidthForHiddenContactImage_sBehavior_0;
}

void __68__CKUIBehaviorMac_conversationListMinimumWidthForHiddenContactImage__block_invoke()
{
  conversationListMinimumWidthForHiddenContactImage_sBehavior_0 = 0x406F400000000000;
}

- (double)conversationListPinnedCellSelectedBackgroundCornerRadius
{
  if (conversationListPinnedCellSelectedBackgroundCornerRadius_once_0 != -1) {
    dispatch_once(&conversationListPinnedCellSelectedBackgroundCornerRadius_once_0, &__block_literal_global_141);
  }
  return *(double *)&conversationListPinnedCellSelectedBackgroundCornerRadius_sBehavior_0;
}

void __75__CKUIBehaviorMac_conversationListPinnedCellSelectedBackgroundCornerRadius__block_invoke()
{
  conversationListPinnedCellSelectedBackgroundCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)expandedToolbarHeightForMiiC
{
  if (expandedToolbarHeightForMiiC_once != -1) {
    dispatch_once(&expandedToolbarHeightForMiiC_once, &__block_literal_global_143);
  }
  return *(double *)&expandedToolbarHeightForMiiC_sBehavior;
}

void __47__CKUIBehaviorMac_expandedToolbarHeightForMiiC__block_invoke()
{
  expandedToolbarHeightForMiiC_sBehavior = 0x404E000000000000;
}

- (BOOL)showsHoverToDeleteButton
{
  if (showsHoverToDeleteButton_once_0 != -1) {
    dispatch_once(&showsHoverToDeleteButton_once_0, &__block_literal_global_145_1);
  }
  return 0;
}

- (BOOL)showsHoverToDeleteButtonForNewCompose
{
  if (showsHoverToDeleteButtonForNewCompose_once_0 != -1) {
    dispatch_once(&showsHoverToDeleteButtonForNewCompose_once_0, &__block_literal_global_147_1);
  }
  return showsHoverToDeleteButtonForNewCompose_sBehavior;
}

void __56__CKUIBehaviorMac_showsHoverToDeleteButtonForNewCompose__block_invoke()
{
  showsHoverToDeleteButtonForNewCompose_sBehavior = 1;
}

- (BOOL)supportsOrbPreviewsInConversationList
{
  if (supportsOrbPreviewsInConversationList_once_0 != -1) {
    dispatch_once(&supportsOrbPreviewsInConversationList_once_0, &__block_literal_global_149_2);
  }
  return 0;
}

- (BOOL)searchControllerObscuresConversationList
{
  if (searchControllerObscuresConversationList_once_0 != -1) {
    dispatch_once(&searchControllerObscuresConversationList_once_0, &__block_literal_global_151_1);
  }
  return 0;
}

- (BOOL)shouldShowAvatarForWidth:(double)a3
{
  BOOL v4 = [(CKUIBehaviorPad *)self canShowContactPhotosInConversationList];
  if (v4)
  {
    LOBYTE(v4) = [(CKUIBehaviorMac *)self contactPhotosEnabled];
  }
  return v4;
}

- (BOOL)contactPhotosEnabled
{
  return 1;
}

- (UIEdgeInsets)toFieldScrollViewInsets
{
  if (toFieldScrollViewInsets_once_0 != -1) {
    dispatch_once(&toFieldScrollViewInsets_once_0, &__block_literal_global_153_1);
  }
  double v2 = *(double *)&toFieldScrollViewInsets_sBehavior_0;
  double v3 = *(double *)&toFieldScrollViewInsets_sBehavior_1;
  double v4 = *(double *)&toFieldScrollViewInsets_sBehavior_3;
  double v5 = 0.0;
  result.right = v4;
  result.bottom = v5;
  result.left = v3;
  result.top = v2;
  return result;
}

void __42__CKUIBehaviorMac_toFieldScrollViewInsets__block_invoke()
{
  toFieldScrollViewInsets_sBehavior_0 = 0x4004000000000000;
  toFieldScrollViewInsets_sBehavior_1 = 0x401E000000000000;
  toFieldScrollViewInsets_sBehavior_3 = 0x4024000000000000;
}

- (double)toFieldInterItemSpacing
{
  if (toFieldInterItemSpacing_once != -1) {
    dispatch_once(&toFieldInterItemSpacing_once, &__block_literal_global_155_2);
  }
  return *(double *)&toFieldInterItemSpacing_sBehavior;
}

void __42__CKUIBehaviorMac_toFieldInterItemSpacing__block_invoke()
{
  toFieldInterItemSpacing_sBehavior = 0x4014000000000000;
}

- (double)toFieldYOffset
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CKUIBehaviorMac_toFieldYOffset__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (toFieldYOffset_once != -1) {
    dispatch_once(&toFieldYOffset_once, block);
  }
  return *(double *)&toFieldYOffset_sBehavior;
}

double __33__CKUIBehaviorMac_toFieldYOffset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) macAppKitToolbarHeight];
  double v3 = v2;
  [*(id *)(a1 + 32) macAppKitToolbarHeight];
  double v5 = v4;
  [*(id *)(a1 + 32) toFieldPreferredHeight];
  double result = (v3 - fmin(v5, v6)) * 0.5;
  toFieldYOffset_sBehavior = *(void *)&result;
  return result;
}

- (double)toFieldXOffset
{
  if (toFieldXOffset_once != -1) {
    dispatch_once(&toFieldXOffset_once, &__block_literal_global_157_0);
  }
  return *(double *)&toFieldXOffset_sBehavior;
}

void __33__CKUIBehaviorMac_toFieldXOffset__block_invoke()
{
  toFieldXOffset_sBehavior = 0x4012000000000000;
}

- (BOOL)presentsAutocompleteInAPopover
{
  if (presentsAutocompleteInAPopover_once_0 != -1) {
    dispatch_once(&presentsAutocompleteInAPopover_once_0, &__block_literal_global_159_1);
  }
  return presentsAutocompleteInAPopover_sBehavior;
}

void __49__CKUIBehaviorMac_presentsAutocompleteInAPopover__block_invoke()
{
  presentsAutocompleteInAPopover_sBehavior = 1;
}

- (BOOL)ckShouldUpdateaudioHintFont
{
  return 0;
}

- (id)audioHintFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioHintFont_sContentSizeCategory_audioHintFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateaudioHintFont]
    || v11
    || audioHintFont_sIsIncreaseContrastEnabled_audioHintFont_0 != v4
    || audioHintFont_sIsBoldTextEnabled_audioHintFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = audioHintFont_sTextFontSize_audioHintFont_0, *(double *)&audioHintFont_sTextFontSize_audioHintFont_0 != v6)
    || (uint64_t v12 = audioHintFont_sCustomTextFontSize_audioHintFont_0,
        *(double *)&audioHintFont_sCustomTextFontSize_audioHintFont_0 != v7)
    || (objc_msgSend((id)audioHintFont_sCustomTextFontName_audioHintFont_0, "isEqualToString:", v10, *(double *)&audioHintFont_sCustomTextFontSize_audioHintFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "defaultFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    double v14 = (void *)audioHintFont_sBehavior_0;
    audioHintFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&audioHintFont_sContentSizeCategory_audioHintFont_0, v3);
    audioHintFont_sIsIncreaseContrastEnabled_audioHintFont_0 = v4;
    audioHintFont_sIsBoldTextEnabled_audioHintFont_0 = IsBoldTextEnabled;
    audioHintFont_sTextFontSize_audioHintFont_0 = *(void *)&v6;
    audioHintFont_sCustomTextFontSize_audioHintFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&audioHintFont_sCustomTextFontName_audioHintFont_0, v9);
  }
  id v15 = (id)audioHintFont_sBehavior_0;

  return v15;
}

- (BOOL)isSendButtonEnabledOnPlatform
{
  if (isSendButtonEnabledOnPlatform_once_0 != -1) {
    dispatch_once(&isSendButtonEnabledOnPlatform_once_0, &__block_literal_global_161_1);
  }
  return 0;
}

- (BOOL)isEntryViewInputAccessory
{
  if (isEntryViewInputAccessory_once_0 != -1) {
    dispatch_once(&isEntryViewInputAccessory_once_0, &__block_literal_global_163_0);
  }
  return 0;
}

- (BOOL)isEntryViewFirstResponderOnViewAppearance
{
  if (isEntryViewFirstResponderOnViewAppearance_once_0 != -1) {
    dispatch_once(&isEntryViewFirstResponderOnViewAppearance_once_0, &__block_literal_global_165_0);
  }
  return isEntryViewFirstResponderOnViewAppearance_sBehavior;
}

void __60__CKUIBehaviorMac_isEntryViewFirstResponderOnViewAppearance__block_invoke()
{
  isEntryViewFirstResponderOnViewAppearance_sBehavior = 1;
}

- (BOOL)entryViewFollowsKeyboardLayoutGuide
{
  if (entryViewFollowsKeyboardLayoutGuide_once_0 != -1) {
    dispatch_once(&entryViewFollowsKeyboardLayoutGuide_once_0, &__block_literal_global_167_0);
  }
  return 0;
}

- (BOOL)isEntryViewCollapsable
{
  if (isEntryViewCollapsable_once_0 != -1) {
    dispatch_once(&isEntryViewCollapsable_once_0, &__block_literal_global_169);
  }
  return 0;
}

- (BOOL)entryViewSupportsPhotoButton
{
  if (entryViewSupportsPhotoButton_once_0 != -1) {
    dispatch_once(&entryViewSupportsPhotoButton_once_0, &__block_literal_global_171);
  }
  return 0;
}

- (BOOL)browserButtonShouldUseMenu
{
  if (browserButtonShouldUseMenu_once_0 != -1) {
    dispatch_once(&browserButtonShouldUseMenu_once_0, &__block_literal_global_173_1);
  }
  return browserButtonShouldUseMenu_sBehavior;
}

void __45__CKUIBehaviorMac_browserButtonShouldUseMenu__block_invoke()
{
  browserButtonShouldUseMenu_sBehavior = 1;
}

- (UIEdgeInsets)messageEntryContentViewSendLaterDateInsets
{
  if (messageEntryContentViewSendLaterDateInsets_once_0 != -1) {
    dispatch_once(&messageEntryContentViewSendLaterDateInsets_once_0, &__block_literal_global_175_0);
  }
  double v2 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_0_0;
  double v3 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_1_0;
  double v4 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_2_0;
  double v5 = *(double *)&messageEntryContentViewSendLaterDateInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __61__CKUIBehaviorMac_messageEntryContentViewSendLaterDateInsets__block_invoke()
{
  messageEntryContentViewSendLaterDateInsets_sBehavior_0_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_1_0 = 0x4024000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_2_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterDateInsets_sBehavior_3_0 = 0x4021000000000000;
}

- (double)sendButtonSize
{
  if (sendButtonSize_once_0 != -1) {
    dispatch_once(&sendButtonSize_once_0, &__block_literal_global_177_1);
  }
  return *(double *)&sendButtonSize_sBehavior_0;
}

void __33__CKUIBehaviorMac_sendButtonSize__block_invoke()
{
  sendButtonSize_sBehavior_0 = 0x4035000000000000;
}

- (double)emojiButtonSize
{
  if (emojiButtonSize_once != -1) {
    dispatch_once(&emojiButtonSize_once, &__block_literal_global_179_1);
  }
  return *(double *)&emojiButtonSize_sBehavior;
}

void __34__CKUIBehaviorMac_emojiButtonSize__block_invoke()
{
  emojiButtonSize_sBehavior = 0x4037000000000000;
}

- (double)stopButtonSize
{
  if (stopButtonSize_once != -1) {
    dispatch_once(&stopButtonSize_once, &__block_literal_global_181);
  }
  return *(double *)&stopButtonSize_sBehavior;
}

void __33__CKUIBehaviorMac_stopButtonSize__block_invoke()
{
  stopButtonSize_sBehavior = 0x403B000000000000;
}

- (CGSize)entryViewPlusButtonSize
{
  if (entryViewPlusButtonSize_once_0 != -1) {
    dispatch_once(&entryViewPlusButtonSize_once_0, &__block_literal_global_183);
  }
  double v2 = *(double *)&entryViewPlusButtonSize_sBehavior_0_0;
  double v3 = *(double *)&entryViewPlusButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __42__CKUIBehaviorMac_entryViewPlusButtonSize__block_invoke()
{
  entryViewPlusButtonSize_sBehavior_0_0 = 0x4038000000000000;
  entryViewPlusButtonSize_sBehavior_1_0 = 0x4038000000000000;
}

- (double)entryViewWithSendMenuBottomContentInsetWithKeyboardVisible
{
  if (entryViewWithSendMenuBottomContentInsetWithKeyboardVisible_once_0 != -1) {
    dispatch_once(&entryViewWithSendMenuBottomContentInsetWithKeyboardVisible_once_0, &__block_literal_global_185_0);
  }
  return 0.0;
}

- (double)entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible
{
  if (entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible_once_0 != -1) {
    dispatch_once(&entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible_once_0, &__block_literal_global_187);
  }
  return 0.0;
}

- (int64_t)sendMenuPlusSymbolScale
{
  if (sendMenuPlusSymbolScale_once_0 != -1) {
    dispatch_once(&sendMenuPlusSymbolScale_once_0, &__block_literal_global_189_0);
  }
  return sendMenuPlusSymbolScale_sBehavior_0;
}

void __42__CKUIBehaviorMac_sendMenuPlusSymbolScale__block_invoke()
{
  sendMenuPlusSymbolScale_sBehavior_0 = 1;
}

- (double)entryViewCoverMinHeight
{
  if (entryViewCoverMinHeight_once_0 != -1) {
    dispatch_once(&entryViewCoverMinHeight_once_0, &__block_literal_global_191_0);
  }
  return *(double *)&entryViewCoverMinHeight_sBehavior_0;
}

void __42__CKUIBehaviorMac_entryViewCoverMinHeight__block_invoke()
{
  entryViewCoverMinHeight_sBehavior_0 = 0x403B000000000000;
}

- (BOOL)entryViewCoverHasOuterStroke
{
  if (entryViewCoverHasOuterStroke_once_0 != -1) {
    dispatch_once(&entryViewCoverHasOuterStroke_once_0, &__block_literal_global_193);
  }
  return 0;
}

- (UIEdgeInsets)entryViewVerticalTextFieldInsets
{
  if (entryViewVerticalTextFieldInsets_once_0 != -1) {
    dispatch_once(&entryViewVerticalTextFieldInsets_once_0, &__block_literal_global_195_0);
  }
  double v2 = *(double *)&entryViewVerticalTextFieldInsets_sBehavior_0_0;
  double v3 = *(double *)&entryViewVerticalTextFieldInsets_sBehavior_2_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __51__CKUIBehaviorMac_entryViewVerticalTextFieldInsets__block_invoke()
{
  entryViewVerticalTextFieldInsets_sBehavior_0_0 = 0x4014000000000000;
  entryViewVerticalTextFieldInsets_sBehavior_2_0 = 0x4014000000000000;
}

- (UIEdgeInsets)entryViewVerticalCoverInsets
{
  if (entryViewVerticalCoverInsets_once_0 != -1) {
    dispatch_once(&entryViewVerticalCoverInsets_once_0, &__block_literal_global_197_1);
  }
  double v2 = *(double *)&entryViewVerticalCoverInsets_sBehavior_0_0;
  double v3 = *(double *)&entryViewVerticalCoverInsets_sBehavior_2_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

void __47__CKUIBehaviorMac_entryViewVerticalCoverInsets__block_invoke()
{
  entryViewVerticalCoverInsets_sBehavior_0_0 = 0x4028000000000000;
  entryViewVerticalCoverInsets_sBehavior_2_0 = 0x4030000000000000;
}

- (double)entryViewCoverHorizontalMargin
{
  if (entryViewCoverHorizontalMargin_once != -1) {
    dispatch_once(&entryViewCoverHorizontalMargin_once, &__block_literal_global_199_0);
  }
  return *(double *)&entryViewCoverHorizontalMargin_sBehavior;
}

void __49__CKUIBehaviorMac_entryViewCoverHorizontalMargin__block_invoke()
{
  entryViewCoverHorizontalMargin_sBehavior = 0x4030000000000000;
}

- (double)entryViewMaxHeight
{
  if (entryViewMaxHeight_once_0 != -1) {
    dispatch_once(&entryViewMaxHeight_once_0, &__block_literal_global_201_0);
  }
  return *(double *)&entryViewMaxHeight_sBehavior_0;
}

void __37__CKUIBehaviorMac_entryViewMaxHeight__block_invoke()
{
  entryViewMaxHeight_sBehavior_0 = 0x4072C00000000000;
}

- (id)entryViewAudioButtonName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_entryViewAudioButtonName__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (entryViewAudioButtonName_once != -1) {
    dispatch_once(&entryViewAudioButtonName_once, block);
  }
  return (id)entryViewAudioButtonName_sBehavior_0;
}

void __43__CKUIBehaviorMac_entryViewAudioButtonName__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) audioButtonName];
  double v2 = (void *)entryViewAudioButtonName_sBehavior_0;
  entryViewAudioButtonName_sBehavior_0 = v1;
}

- (BOOL)entryViewSupportsPlusButton
{
  if (entryViewSupportsPlusButton_once_0 != -1) {
    dispatch_once(&entryViewSupportsPlusButton_once_0, &__block_literal_global_203_1);
  }
  return entryViewSupportsPlusButton_sBehavior_0;
}

void __46__CKUIBehaviorMac_entryViewSupportsPlusButton__block_invoke()
{
  entryViewSupportsPlusButton_sBehavior_0 = 1;
}

- (BOOL)entryViewSupportsBrowserButton
{
  if (entryViewSupportsBrowserButton_once_0 != -1) {
    dispatch_once(&entryViewSupportsBrowserButton_once_0, &__block_literal_global_205);
  }
  return 0;
}

- (id)audioButtonName
{
  double v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isAudioMessagesEntryViewRecordingEnabled];

  if (v3) {
    return @"EntryViewWaveformImageMac";
  }
  else {
    return @"waveform";
  }
}

- (UIEdgeInsets)messageEntryContentViewSendLaterInsets
{
  if (messageEntryContentViewSendLaterInsets_once_0 != -1) {
    dispatch_once(&messageEntryContentViewSendLaterInsets_once_0, &__block_literal_global_213);
  }
  double v2 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_0_0;
  double v3 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_1_0;
  double v4 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_2_0;
  double v5 = *(double *)&messageEntryContentViewSendLaterInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __57__CKUIBehaviorMac_messageEntryContentViewSendLaterInsets__block_invoke()
{
  messageEntryContentViewSendLaterInsets_sBehavior_0_0 = 0x401C000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_1_0 = 0x401C000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_2_0 = 0x401E000000000000;
  messageEntryContentViewSendLaterInsets_sBehavior_3_0 = 0x401C000000000000;
}

- (double)entryViewMaxSendLaterHeight
{
  if (entryViewMaxSendLaterHeight_once_0 != -1) {
    dispatch_once(&entryViewMaxSendLaterHeight_once_0, &__block_literal_global_215);
  }
  return *(double *)&entryViewMaxSendLaterHeight_sBehavior_0;
}

void __46__CKUIBehaviorMac_entryViewMaxSendLaterHeight__block_invoke()
{
  entryViewMaxSendLaterHeight_sBehavior_0 = 0x403B000000000000;
}

- (BOOL)ckShouldUpdateentryViewAppButtonName
{
  return 0;
}

- (id)entryViewAppButtonName
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)entryViewAppButtonName_sContentSizeCategory_entryViewAppButtonName_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateentryViewAppButtonName]
    || v11
    || entryViewAppButtonName_sIsIncreaseContrastEnabled_entryViewAppButtonName_0 != v4
    || entryViewAppButtonName_sIsBoldTextEnabled_entryViewAppButtonName_0 != IsBoldTextEnabled
    || *(double *)&entryViewAppButtonName_sTextFontSize_entryViewAppButtonName_0 != v6
    || *(double *)&entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0 != v7
    || (objc_msgSend((id)entryViewAppButtonName_sCustomTextFontName_entryViewAppButtonName_0, "isEqualToString:", v10, *(double *)&entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0) & 1) == 0)
  {
    uint64_t v12 = (void *)entryViewAppButtonName_sBehavior_0;
    entryViewAppButtonName_sBehavior_0 = @"appstore.capsule.2.fill";

    objc_storeStrong((id *)&entryViewAppButtonName_sContentSizeCategory_entryViewAppButtonName_0, v3);
    entryViewAppButtonName_sIsIncreaseContrastEnabled_entryViewAppButtonName_0 = v4;
    entryViewAppButtonName_sIsBoldTextEnabled_entryViewAppButtonName_0 = IsBoldTextEnabled;
    entryViewAppButtonName_sTextFontSize_entryViewAppButtonName_0 = *(void *)&v6;
    entryViewAppButtonName_sCustomTextFontSize_entryViewAppButtonName_0 = *(void *)&v7;
    objc_storeStrong((id *)&entryViewAppButtonName_sCustomTextFontName_entryViewAppButtonName_0, v9);
  }
  id v13 = (id)entryViewAppButtonName_sBehavior_0;

  return v13;
}

- (id)entryViewMacEmojiButtonImage
{
  if (entryViewMacEmojiButtonImage_once != -1) {
    dispatch_once(&entryViewMacEmojiButtonImage_once, &__block_literal_global_220_0);
  }
  double v2 = (void *)entryViewMacEmojiButtonImage_sBehavior;

  return v2;
}

void __47__CKUIBehaviorMac_entryViewMacEmojiButtonImage__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"face.grinning"];
  uint64_t v1 = (void *)entryViewMacEmojiButtonImage_sBehavior;
  entryViewMacEmojiButtonImage_sBehavior = v0;
}

- (id)entryViewMacCancelButtonName
{
  if (entryViewMacCancelButtonName_once != -1) {
    dispatch_once(&entryViewMacCancelButtonName_once, &__block_literal_global_226);
  }
  double v2 = (void *)entryViewMacCancelButtonName_sBehavior;

  return v2;
}

void __47__CKUIBehaviorMac_entryViewMacCancelButtonName__block_invoke()
{
  uint64_t v0 = (void *)entryViewMacCancelButtonName_sBehavior;
  entryViewMacCancelButtonName_sBehavior = @"mac-cancel";
}

- (id)entryViewMacStopButtonName
{
  if (entryViewMacStopButtonName_once != -1) {
    dispatch_once(&entryViewMacStopButtonName_once, &__block_literal_global_231);
  }
  double v2 = (void *)entryViewMacStopButtonName_sBehavior;

  return v2;
}

void __45__CKUIBehaviorMac_entryViewMacStopButtonName__block_invoke()
{
  uint64_t v0 = (void *)entryViewMacStopButtonName_sBehavior;
  entryViewMacStopButtonName_sBehavior = @"mac-stop";
}

- (BOOL)forceMinTranscriptMarginInsets
{
  if (forceMinTranscriptMarginInsets_once_0 != -1) {
    dispatch_once(&forceMinTranscriptMarginInsets_once_0, &__block_literal_global_236_0);
  }
  return forceMinTranscriptMarginInsets_sBehavior;
}

void __49__CKUIBehaviorMac_forceMinTranscriptMarginInsets__block_invoke()
{
  forceMinTranscriptMarginInsets_sBehavior = 1;
}

- (UIEdgeInsets)entryViewHorizontalCoverInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CKUIBehaviorMac_entryViewHorizontalCoverInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (entryViewHorizontalCoverInsets_once_0 != -1) {
    dispatch_once(&entryViewHorizontalCoverInsets_once_0, block);
  }
  double v2 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_0_0;
  double v3 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_1_0;
  double v4 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_2_0;
  double v5 = *(double *)&entryViewHorizontalCoverInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

uint64_t __49__CKUIBehaviorMac_entryViewHorizontalCoverInsets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) minTranscriptMarginInsets];
  entryViewHorizontalCoverInsets_sBehavior_0_0 = v2;
  entryViewHorizontalCoverInsets_sBehavior_1_0 = v3;
  entryViewHorizontalCoverInsets_sBehavior_2_0 = v4;
  entryViewHorizontalCoverInsets_sBehavior_3_0 = v5;
  return result;
}

- (double)entryViewAppButtonImagePointSize
{
  if (entryViewAppButtonImagePointSize_once_0 != -1) {
    dispatch_once(&entryViewAppButtonImagePointSize_once_0, &__block_literal_global_238);
  }
  return *(double *)&entryViewAppButtonImagePointSize_sBehavior_0;
}

void __51__CKUIBehaviorMac_entryViewAppButtonImagePointSize__block_invoke()
{
  entryViewAppButtonImagePointSize_sBehavior_0 = 0x4030000000000000;
}

- (double)entryContentViewTextLeftOffset
{
  if (entryContentViewTextLeftOffset_once_0 != -1) {
    dispatch_once(&entryContentViewTextLeftOffset_once_0, &__block_literal_global_240);
  }
  return *(double *)&entryContentViewTextLeftOffset_sBehavior_0;
}

void __49__CKUIBehaviorMac_entryContentViewTextLeftOffset__block_invoke()
{
  entryContentViewTextLeftOffset_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)transcriptTypingIndicatorDefaultSize
{
  if (transcriptTypingIndicatorDefaultSize_once_0 != -1) {
    dispatch_once(&transcriptTypingIndicatorDefaultSize_once_0, &__block_literal_global_242_0);
  }
  double v2 = *(double *)&transcriptTypingIndicatorDefaultSize_sBehavior_0_0;
  double v3 = *(double *)&transcriptTypingIndicatorDefaultSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __55__CKUIBehaviorMac_transcriptTypingIndicatorDefaultSize__block_invoke()
{
  transcriptTypingIndicatorDefaultSize_sBehavior_0_0 = 0x404A000000000000;
  transcriptTypingIndicatorDefaultSize_sBehavior_1_0 = 0x403D000000000000;
}

- (CGSize)transcriptTypingIndicatorLargeBubbleSize
{
  if (transcriptTypingIndicatorLargeBubbleSize_once_0 != -1) {
    dispatch_once(&transcriptTypingIndicatorLargeBubbleSize_once_0, &__block_literal_global_244);
  }
  double v2 = *(double *)&transcriptTypingIndicatorLargeBubbleSize_sBehavior_0_0;
  double v3 = *(double *)&transcriptTypingIndicatorLargeBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __59__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleSize__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleSize_sBehavior_0_0 = 0x4046000000000000;
  transcriptTypingIndicatorLargeBubbleSize_sBehavior_1_0 = 0x403B000000000000;
}

- (CGPoint)transcriptTypingIndicatorLargeBubbleGrowOffset
{
  if (transcriptTypingIndicatorLargeBubbleGrowOffset_once_0 != -1) {
    dispatch_once(&transcriptTypingIndicatorLargeBubbleGrowOffset_once_0, &__block_literal_global_246);
  }
  double v2 = *(double *)&transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_0_0;
  double v3 = *(double *)&transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __65__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleGrowOffset__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_0_0 = 0x400C000000000000;
  transcriptTypingIndicatorLargeBubbleGrowOffset_sBehavior_1_0 = 0xC010000000000000;
}

- (CGPoint)transcriptTypingIndicatorLargeBubbleOffset
{
  if (transcriptTypingIndicatorLargeBubbleOffset_once_0 != -1) {
    dispatch_once(&transcriptTypingIndicatorLargeBubbleOffset_once_0, &__block_literal_global_248);
  }
  double v2 = *(double *)&transcriptTypingIndicatorLargeBubbleOffset_sBehavior_0_0;
  double v3 = *(double *)&transcriptTypingIndicatorLargeBubbleOffset_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __61__CKUIBehaviorMac_transcriptTypingIndicatorLargeBubbleOffset__block_invoke()
{
  transcriptTypingIndicatorLargeBubbleOffset_sBehavior_0_0 = 0x4028000000000000;
  transcriptTypingIndicatorLargeBubbleOffset_sBehavior_1_0 = 0xC033000000000000;
}

- (double)paddleOverlayRadius
{
  if (paddleOverlayRadius_once_0 != -1) {
    dispatch_once(&paddleOverlayRadius_once_0, &__block_literal_global_250);
  }
  return *(double *)&paddleOverlayRadius_sBehavior_0;
}

void __38__CKUIBehaviorMac_paddleOverlayRadius__block_invoke()
{
  paddleOverlayRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)paddleDividerInset
{
  if (paddleDividerInset_once_0 != -1) {
    dispatch_once(&paddleDividerInset_once_0, &__block_literal_global_252_0);
  }
  return *(double *)&paddleDividerInset_sBehavior;
}

void __37__CKUIBehaviorMac_paddleDividerInset__block_invoke()
{
  paddleDividerInset_sBehavior = 0x4024000000000000;
}

- (id)mentionsCellNameFont
{
  double v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43878]];
  double v3 = [v2 fontDescriptor];
  uint64_t v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

  uint64_t v5 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  double v6 = objc_msgSend(v5, "fontWithDescriptor:size:", v4);

  return v6;
}

- (double)waveformHeight
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CKUIBehaviorMac_waveformHeight__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (waveformHeight_once_0 != -1) {
    dispatch_once(&waveformHeight_once_0, block);
  }
  return *(double *)&waveformHeight_sBehavior_0;
}

uint64_t __33__CKUIBehaviorMac_waveformHeight__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) audioWaveformHeight];
  waveformHeight_sBehavior_0 = v2;
  return result;
}

- (double)minimumWaveformHeight
{
  if (minimumWaveformHeight_once_0 != -1) {
    dispatch_once(&minimumWaveformHeight_once_0, &__block_literal_global_254);
  }
  return *(double *)&minimumWaveformHeight_sBehavior_0;
}

void __40__CKUIBehaviorMac_minimumWaveformHeight__block_invoke()
{
  minimumWaveformHeight_sBehavior_0 = 0x4010000000000000;
}

- (CGSize)audioProgressViewSize
{
  if (audioProgressViewSize_once_0 != -1) {
    dispatch_once(&audioProgressViewSize_once_0, &__block_literal_global_256_2);
  }
  double v2 = *(double *)&audioProgressViewSize_sBehavior_0_0;
  double v3 = *(double *)&audioProgressViewSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __40__CKUIBehaviorMac_audioProgressViewSize__block_invoke()
{
  audioProgressViewSize_sBehavior_0_0 = 0x4036000000000000;
  audioProgressViewSize_sBehavior_1_0 = 0x4036000000000000;
}

- (double)audioWaveformHeight
{
  return 35.0;
}

- (BOOL)ckShouldUpdateappMenuTitleFont
{
  return 0;
}

- (id)appMenuTitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)appMenuTitleFont_sContentSizeCategory_appMenuTitleFont, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateappMenuTitleFont]
    || v11
    || appMenuTitleFont_sIsIncreaseContrastEnabled_appMenuTitleFont != v4
    || appMenuTitleFont_sIsBoldTextEnabled_appMenuTitleFont != IsBoldTextEnabled
    || (uint64_t v12 = appMenuTitleFont_sTextFontSize_appMenuTitleFont,
        *(double *)&appMenuTitleFont_sTextFontSize_appMenuTitleFont != v6)
    || (uint64_t v12 = appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont,
        *(double *)&appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont != v7)
    || (objc_msgSend((id)appMenuTitleFont_sCustomTextFontName_appMenuTitleFont, "isEqualToString:", v10, *(double *)&appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43870], *(double *)&v12);
    double v14 = (void *)appMenuTitleFont_sBehavior;
    appMenuTitleFont_sBehavior = v13;

    objc_storeStrong((id *)&appMenuTitleFont_sContentSizeCategory_appMenuTitleFont, v3);
    appMenuTitleFont_sIsIncreaseContrastEnabled_appMenuTitleFont = v4;
    appMenuTitleFont_sIsBoldTextEnabled_appMenuTitleFont = IsBoldTextEnabled;
    appMenuTitleFont_sTextFontSize_appMenuTitleFont = *(void *)&v6;
    appMenuTitleFont_sCustomTextFontSize_appMenuTitleFont = *(void *)&v7;
    objc_storeStrong((id *)&appMenuTitleFont_sCustomTextFontName_appMenuTitleFont, v9);
  }
  id v15 = (id)appMenuTitleFont_sBehavior;

  return v15;
}

- (id)appMenuPhotosIconForTraitCollection:(id)a3
{
  id v3 = a3;
  [v3 displayScale];
  if (v4 == 1.0) {
    uint64_t v5 = @"Mac-PhotosIcon1x";
  }
  else {
    uint64_t v5 = @"Mac-PhotosIcon2x";
  }
  double v6 = [MEMORY[0x1E4F42A80] ckImageNamed:v5 compatibleWithTraitCollection:v3];

  return v6;
}

- (id)appMenuEffectsIconForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4F42A80] ckImageNamed:@"Mac-EffectsIcon" compatibleWithTraitCollection:a3];
}

- (id)appMenuHashtagImagesIconForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4F42A80] ckImageNamed:@"Mac-HashtagImagesIcon" compatibleWithTraitCollection:a3];
}

- (id)appMenuAnimojiStickersIconForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4F42A80] ckImageNamed:@"Mac-StickersIcon" compatibleWithTraitCollection:a3];
}

- (id)appMenuEmojiIconForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4F42A80] ckImageNamed:@"Emoji" compatibleWithTraitCollection:a3];
}

- (id)appMenuApplePayIconForTraitCollection:(id)a3
{
  return (id)[MEMORY[0x1E4F42A80] ckImageNamed:@"Mac-ApplePayIcon" compatibleWithTraitCollection:a3];
}

- (double)popoverPadding
{
  if (popoverPadding_once != -1) {
    dispatch_once(&popoverPadding_once, &__block_literal_global_279_1);
  }
  return *(double *)&popoverPadding_sBehavior;
}

void __33__CKUIBehaviorMac_popoverPadding__block_invoke()
{
  popoverPadding_sBehavior = 0x401C000000000000;
}

- (double)popoverHeightPadding
{
  if (popoverHeightPadding_once != -1) {
    dispatch_once(&popoverHeightPadding_once, &__block_literal_global_281_0);
  }
  return *(double *)&popoverHeightPadding_sBehavior;
}

void __39__CKUIBehaviorMac_popoverHeightPadding__block_invoke()
{
  popoverHeightPadding_sBehavior = 0x4030000000000000;
}

- (double)popOverWidth
{
  if (popOverWidth_once != -1) {
    dispatch_once(&popOverWidth_once, &__block_literal_global_283_1);
  }
  return *(double *)&popOverWidth_sBehavior;
}

void __31__CKUIBehaviorMac_popOverWidth__block_invoke()
{
  popOverWidth_sBehavior = 0x406F800000000000;
}

- (double)popOverWidthInDetailsView
{
  if (popOverWidthInDetailsView_once != -1) {
    dispatch_once(&popOverWidthInDetailsView_once, &__block_literal_global_285_0);
  }
  return *(double *)&popOverWidthInDetailsView_sBehavior;
}

void __44__CKUIBehaviorMac_popOverWidthInDetailsView__block_invoke()
{
  popOverWidthInDetailsView_sBehavior = 0x4070400000000000;
}

- (double)popOverMaxHeight
{
  if (popOverMaxHeight_once != -1) {
    dispatch_once(&popOverMaxHeight_once, &__block_literal_global_287_2);
  }
  return *(double *)&popOverMaxHeight_sBehavior;
}

void __35__CKUIBehaviorMac_popOverMaxHeight__block_invoke()
{
  popOverMaxHeight_sBehavior = 0x4079000000000000;
}

- (double)popOverMaxHeightInDetailsView
{
  if (popOverMaxHeightInDetailsView_once != -1) {
    dispatch_once(&popOverMaxHeightInDetailsView_once, &__block_literal_global_289_1);
  }
  return *(double *)&popOverMaxHeightInDetailsView_sBehavior;
}

void __48__CKUIBehaviorMac_popOverMaxHeightInDetailsView__block_invoke()
{
  popOverMaxHeightInDetailsView_sBehavior = 0x406F400000000000;
}

- (double)autocompletePopOverLeftOffset
{
  if (autocompletePopOverLeftOffset_once != -1) {
    dispatch_once(&autocompletePopOverLeftOffset_once, &__block_literal_global_291_0);
  }
  return *(double *)&autocompletePopOverLeftOffset_sBehavior;
}

void __48__CKUIBehaviorMac_autocompletePopOverLeftOffset__block_invoke()
{
  autocompletePopOverLeftOffset_sBehavior = 0x4040000000000000;
}

- (BOOL)ckShouldUpdateiosMacDetailsButtonText
{
  return 0;
}

- (id)iosMacDetailsButtonText
{
  CKPreferredContentSizeCategory();
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)iosMacDetailsButtonText_sContentSizeCategory_iosMacDetailsButtonText, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateiosMacDetailsButtonText]
    || v11
    || iosMacDetailsButtonText_sIsIncreaseContrastEnabled_iosMacDetailsButtonText != v4
    || iosMacDetailsButtonText_sIsBoldTextEnabled_iosMacDetailsButtonText != IsBoldTextEnabled
    || *(double *)&iosMacDetailsButtonText_sTextFontSize_iosMacDetailsButtonText != v6
    || *(double *)&iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText != v7
    || (objc_msgSend((id)iosMacDetailsButtonText_sCustomTextFontName_iosMacDetailsButtonText, "isEqualToString:", v10, *(double *)&iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText) & 1) == 0)
  {
    if (iosMacDetailsButtonText_onceToken != -1) {
      dispatch_once(&iosMacDetailsButtonText_onceToken, &__block_literal_global_293_0);
    }
    objc_storeStrong((id *)&iosMacDetailsButtonText_sBehavior, (id)iosMacDetailsButtonText_detailsText);
    objc_storeStrong((id *)&iosMacDetailsButtonText_sContentSizeCategory_iosMacDetailsButtonText, v3);
    iosMacDetailsButtonText_sIsIncreaseContrastEnabled_iosMacDetailsButtonText = v4;
    iosMacDetailsButtonText_sIsBoldTextEnabled_iosMacDetailsButtonText = IsBoldTextEnabled;
    iosMacDetailsButtonText_sTextFontSize_iosMacDetailsButtonText = *(void *)&v6;
    iosMacDetailsButtonText_sCustomTextFontSize_iosMacDetailsButtonText = *(void *)&v7;
    objc_storeStrong((id *)&iosMacDetailsButtonText_sCustomTextFontName_iosMacDetailsButtonText, v9);
  }
  id v12 = (id)iosMacDetailsButtonText_sBehavior;

  return v12;
}

void __42__CKUIBehaviorMac_iosMacDetailsButtonText__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F428B8] ckColorNamed:@"MarzipanDetailButtonColor"];
  uint64_t v1 = (void *)iosMacDetailsButtonText_blueTextColor;
  iosMacDetailsButtonText_blueTextColor = v0;

  v10[0] = *MEMORY[0x1E4FB06F8];
  double v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  v10[1] = *MEMORY[0x1E4FB0700];
  v11[0] = v2;
  v11[1] = iosMacDetailsButtonText_blueTextColor;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  int v4 = (void *)iosMacDetailsButtonText_attributes;
  iosMacDetailsButtonText_attributes = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v6 = CKFrameworkBundle();
  double v7 = [v6 localizedStringForKey:@"DETAILS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v8 = [v5 initWithString:v7 attributes:iosMacDetailsButtonText_attributes];
  double v9 = (void *)iosMacDetailsButtonText_detailsText;
  iosMacDetailsButtonText_detailsText = v8;
}

- (BOOL)ckShouldUpdatenavbarDefaultLabelFont
{
  return 0;
}

- (id)navbarDefaultLabelFont
{
  CKPreferredContentSizeCategory();
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)navbarDefaultLabelFont_sContentSizeCategory_navbarDefaultLabelFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatenavbarDefaultLabelFont]
    || v11
    || navbarDefaultLabelFont_sIsIncreaseContrastEnabled_navbarDefaultLabelFont_0 != v4
    || navbarDefaultLabelFont_sIsBoldTextEnabled_navbarDefaultLabelFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0,
        *(double *)&navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0 != v6)
    || (uint64_t v12 = navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0,
        *(double *)&navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0 != v7)
    || (objc_msgSend((id)navbarDefaultLabelFont_sCustomTextFontName_navbarDefaultLabelFont_0, "isEqualToString:", v10, *(double *)&navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F438F8], *(double *)&v12);
    double v14 = (void *)navbarDefaultLabelFont_sBehavior_0;
    navbarDefaultLabelFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&navbarDefaultLabelFont_sContentSizeCategory_navbarDefaultLabelFont_0, v3);
    navbarDefaultLabelFont_sIsIncreaseContrastEnabled_navbarDefaultLabelFont_0 = v4;
    navbarDefaultLabelFont_sIsBoldTextEnabled_navbarDefaultLabelFont_0 = IsBoldTextEnabled;
    navbarDefaultLabelFont_sTextFontSize_navbarDefaultLabelFont_0 = *(void *)&v6;
    navbarDefaultLabelFont_sCustomTextFontSize_navbarDefaultLabelFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&navbarDefaultLabelFont_sCustomTextFontName_navbarDefaultLabelFont_0, v9);
  }
  id v15 = (id)navbarDefaultLabelFont_sBehavior_0;

  return v15;
}

- (double)marzNavigationBarHeight
{
  if (marzNavigationBarHeight_once != -1) {
    dispatch_once(&marzNavigationBarHeight_once, &__block_literal_global_308_1);
  }
  return *(double *)&marzNavigationBarHeight_sBehavior;
}

void __42__CKUIBehaviorMac_marzNavigationBarHeight__block_invoke()
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  int v0 = [v2 useMacToolbar];
  double v1 = 50.0;
  if (v0) {
    double v1 = 40.0;
  }
  marzNavigationBarHeight_sBehavior = *(void *)&v1;
}

- (double)macAppKitToolbarHeight
{
  if (macAppKitToolbarHeight_once != -1) {
    dispatch_once(&macAppKitToolbarHeight_once, &__block_literal_global_310_0);
  }
  return *(double *)&macAppKitToolbarHeight_sBehavior;
}

void __41__CKUIBehaviorMac_macAppKitToolbarHeight__block_invoke()
{
  macAppKitToolbarHeight_sBehavior = 0x404A000000000000;
}

- (double)macToolbarStoplightButtonsLeadingPadding
{
  if (macToolbarStoplightButtonsLeadingPadding_once != -1) {
    dispatch_once(&macToolbarStoplightButtonsLeadingPadding_once, &__block_literal_global_312_0);
  }
  return *(double *)&macToolbarStoplightButtonsLeadingPadding_sBehavior;
}

void __59__CKUIBehaviorMac_macToolbarStoplightButtonsLeadingPadding__block_invoke()
{
  macToolbarStoplightButtonsLeadingPadding_sBehavior = 0x4052000000000000;
}

- (double)macEffectPickerTitleLeadingPadding
{
  if (macEffectPickerTitleLeadingPadding_once != -1) {
    dispatch_once(&macEffectPickerTitleLeadingPadding_once, &__block_literal_global_314_1);
  }
  return *(double *)&macEffectPickerTitleLeadingPadding_sBehavior;
}

void __53__CKUIBehaviorMac_macEffectPickerTitleLeadingPadding__block_invoke()
{
  macEffectPickerTitleLeadingPadding_sBehavior = 0x402E000000000000;
}

- (BOOL)effectPickerPresentsSelectionView
{
  if (effectPickerPresentsSelectionView_once_0 != -1) {
    dispatch_once(&effectPickerPresentsSelectionView_once_0, &__block_literal_global_316_1);
  }
  return 0;
}

- (BOOL)effectPickerShowsCloseButton
{
  if (effectPickerShowsCloseButton_once_0 != -1) {
    dispatch_once(&effectPickerShowsCloseButton_once_0, &__block_literal_global_318_0);
  }
  return effectPickerShowsCloseButton_sBehavior;
}

void __47__CKUIBehaviorMac_effectPickerShowsCloseButton__block_invoke()
{
  effectPickerShowsCloseButton_sBehavior = 1;
}

- (double)macConversationListToolbarHeight
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CKUIBehaviorMac_macConversationListToolbarHeight__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macConversationListToolbarHeight_once != -1) {
    dispatch_once(&macConversationListToolbarHeight_once, block);
  }
  return *(double *)&macConversationListToolbarHeight_sBehavior;
}

double __51__CKUIBehaviorMac_macConversationListToolbarHeight__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) macAppKitToolbarHeight];
  double v3 = v2;
  [*(id *)(a1 + 32) marzNavigationBarHeight];
  double result = v3 + v4;
  macConversationListToolbarHeight_sBehavior = *(void *)&result;
  return result;
}

- (UIEdgeInsets)searchNavbarCanvasInsets
{
  if (searchNavbarCanvasInsets_once != -1) {
    dispatch_once(&searchNavbarCanvasInsets_once, &__block_literal_global_320_1);
  }
  double v2 = *(double *)&searchNavbarCanvasInsets_sBehavior_0;
  double v3 = *(double *)&searchNavbarCanvasInsets_sBehavior_1;
  double v4 = *(double *)&searchNavbarCanvasInsets_sBehavior_2;
  double v5 = *(double *)&searchNavbarCanvasInsets_sBehavior_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __43__CKUIBehaviorMac_searchNavbarCanvasInsets__block_invoke()
{
  id v4 = +[CKUIBehavior sharedBehaviors];
  int v0 = [v4 useMacToolbar];
  double v1 = 18.0;
  double v2 = 10.0;
  if (v0) {
    double v1 = 10.0;
  }
  double v3 = 12.0;
  if (v0) {
    double v3 = 0.0;
  }
  else {
    double v2 = 12.0;
  }
  searchNavbarCanvasInsets_sBehavior_0 = *(void *)&v3;
  searchNavbarCanvasInsets_sBehavior_1 = 0x4024000000000000;
  searchNavbarCanvasInsets_sBehavior_2 = *(void *)&v2;
  searchNavbarCanvasInsets_sBehavior_3 = *(void *)&v1;
}

- (double)spaceBetweenSearchBarAndComposeButton
{
  if (spaceBetweenSearchBarAndComposeButton_once != -1) {
    dispatch_once(&spaceBetweenSearchBarAndComposeButton_once, &__block_literal_global_322);
  }
  return *(double *)&spaceBetweenSearchBarAndComposeButton_sBehavior;
}

void __56__CKUIBehaviorMac_spaceBetweenSearchBarAndComposeButton__block_invoke()
{
  spaceBetweenSearchBarAndComposeButton_sBehavior = 0x4024000000000000;
}

- (CGSize)browserButtonSize
{
  if (browserButtonSize_once_0 != -1) {
    dispatch_once(&browserButtonSize_once_0, &__block_literal_global_324);
  }
  double v2 = *(double *)&browserButtonSize_sBehavior_0_0;
  double v3 = *(double *)&browserButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __36__CKUIBehaviorMac_browserButtonSize__block_invoke()
{
  browserButtonSize_sBehavior_0_0 = 0x4042000000000000;
  browserButtonSize_sBehavior_1_0 = 0x403A000000000000;
}

- (CGSize)cancelButtonSize
{
  if (cancelButtonSize_once != -1) {
    dispatch_once(&cancelButtonSize_once, &__block_literal_global_326);
  }
  double v2 = *(double *)&cancelButtonSize_sBehavior_0;
  double v3 = *(double *)&cancelButtonSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __35__CKUIBehaviorMac_cancelButtonSize__block_invoke()
{
  cancelButtonSize_sBehavior_0 = 0x4038000000000000;
  cancelButtonSize_sBehavior_1 = 0x4038000000000000;
}

- (BOOL)ckShouldUpdatesearchBarFont
{
  return 0;
}

- (id)searchBarFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchBarFont_sContentSizeCategory_searchBarFont, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatesearchBarFont]
    || v11
    || searchBarFont_sIsIncreaseContrastEnabled_searchBarFont != v4
    || searchBarFont_sIsBoldTextEnabled_searchBarFont != IsBoldTextEnabled
    || (uint64_t v12 = searchBarFont_sTextFontSize_searchBarFont, *(double *)&searchBarFont_sTextFontSize_searchBarFont != v6)
    || (uint64_t v12 = searchBarFont_sCustomTextFontSize_searchBarFont,
        *(double *)&searchBarFont_sCustomTextFontSize_searchBarFont != v7)
    || (objc_msgSend((id)searchBarFont_sCustomTextFontName_searchBarFont, "isEqualToString:", v10, *(double *)&searchBarFont_sCustomTextFontSize_searchBarFont) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43870], *(double *)&v12);
    double v14 = (void *)searchBarFont_sBehavior;
    searchBarFont_sBehavior = v13;

    objc_storeStrong((id *)&searchBarFont_sContentSizeCategory_searchBarFont, v3);
    searchBarFont_sIsIncreaseContrastEnabled_searchBarFont = v4;
    searchBarFont_sIsBoldTextEnabled_searchBarFont = IsBoldTextEnabled;
    searchBarFont_sTextFontSize_searchBarFont = *(void *)&v6;
    searchBarFont_sCustomTextFontSize_searchBarFont = *(void *)&v7;
    objc_storeStrong((id *)&searchBarFont_sCustomTextFontName_searchBarFont, v9);
  }
  id v15 = (id)searchBarFont_sBehavior;

  return v15;
}

- (id)chatNavbarColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CKUIBehaviorMac_chatNavbarColor__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (chatNavbarColor_once != -1) {
    dispatch_once(&chatNavbarColor_once, block);
  }
  return (id)chatNavbarColor_sBehavior;
}

void __34__CKUIBehaviorMac_chatNavbarColor__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) useMacToolbar])
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  }
  double v2 = (void *)chatNavbarColor_sBehavior;
  chatNavbarColor_sBehavior = v1;
}

- (double)chatNavbarLeftMargin
{
  if (chatNavbarLeftMargin_once != -1) {
    dispatch_once(&chatNavbarLeftMargin_once, &__block_literal_global_328);
  }
  return *(double *)&chatNavbarLeftMargin_sBehavior;
}

void __39__CKUIBehaviorMac_chatNavbarLeftMargin__block_invoke()
{
  chatNavbarLeftMargin_sBehavior = 0x402F000000000000;
}

- (double)chatNavbarRightMargin
{
  if (chatNavbarRightMargin_once != -1) {
    dispatch_once(&chatNavbarRightMargin_once, &__block_literal_global_330_0);
  }
  return *(double *)&chatNavbarRightMargin_sBehavior;
}

void __40__CKUIBehaviorMac_chatNavbarRightMargin__block_invoke()
{
  chatNavbarRightMargin_sBehavior = 0x4034000000000000;
}

- (CGSize)macNSToolbarItemSize
{
  if (macNSToolbarItemSize_once != -1) {
    dispatch_once(&macNSToolbarItemSize_once, &__block_literal_global_332_0);
  }
  double v2 = *(double *)&macNSToolbarItemSize_sBehavior_0;
  double v3 = *(double *)&macNSToolbarItemSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __39__CKUIBehaviorMac_macNSToolbarItemSize__block_invoke()
{
  macNSToolbarItemSize_sBehavior_0 = 0x403F000000000000;
  macNSToolbarItemSize_sBehavior_1 = 0x403C000000000000;
}

- (CGSize)macJoinFaceTimeNSToolbarItemSize
{
  if (macJoinFaceTimeNSToolbarItemSize_once != -1) {
    dispatch_once(&macJoinFaceTimeNSToolbarItemSize_once, &__block_literal_global_334_0);
  }
  double v2 = *(double *)&macJoinFaceTimeNSToolbarItemSize_sBehavior_0;
  double v3 = *(double *)&macJoinFaceTimeNSToolbarItemSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __51__CKUIBehaviorMac_macJoinFaceTimeNSToolbarItemSize__block_invoke()
{
  macJoinFaceTimeNSToolbarItemSize_sBehavior_0 = 0x4051800000000000;
  macJoinFaceTimeNSToolbarItemSize_sBehavior_1 = 0x403C000000000000;
}

- (double)macNSToolbarItemInterItemSpacing
{
  if (macNSToolbarItemInterItemSpacing_once != -1) {
    dispatch_once(&macNSToolbarItemInterItemSpacing_once, &__block_literal_global_336);
  }
  return *(double *)&macNSToolbarItemInterItemSpacing_sBehavior;
}

void __51__CKUIBehaviorMac_macNSToolbarItemInterItemSpacing__block_invoke()
{
  macNSToolbarItemInterItemSpacing_sBehavior = 0x4028000000000000;
}

- (double)macNavbarBottomMargin
{
  if (macNavbarBottomMargin_once != -1) {
    dispatch_once(&macNavbarBottomMargin_once, &__block_literal_global_338);
  }
  return *(double *)&macNavbarBottomMargin_sBehavior;
}

void __40__CKUIBehaviorMac_macNavbarBottomMargin__block_invoke()
{
  macNavbarBottomMargin_sBehavior = 0x402E000000000000;
}

- (double)macNavbarLeftMargin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CKUIBehaviorMac_macNavbarLeftMargin__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macNavbarLeftMargin_once != -1) {
    dispatch_once(&macNavbarLeftMargin_once, block);
  }
  return *(double *)&macNavbarLeftMargin_sBehavior;
}

uint64_t __38__CKUIBehaviorMac_macNavbarLeftMargin__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) useMacToolbar];
  double v2 = 13.0;
  if (result) {
    double v2 = 20.0;
  }
  macNavbarLeftMargin_sBehavior = *(void *)&v2;
  return result;
}

- (double)macNavbarRightMargin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CKUIBehaviorMac_macNavbarRightMargin__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macNavbarRightMargin_once != -1) {
    dispatch_once(&macNavbarRightMargin_once, block);
  }
  return *(double *)&macNavbarRightMargin_sBehavior;
}

uint64_t __39__CKUIBehaviorMac_macNavbarRightMargin__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) useMacToolbar];
  double v2 = 12.0;
  if (result) {
    double v2 = 20.0;
  }
  macNavbarRightMargin_sBehavior = *(void *)&v2;
  return result;
}

- (double)macToLabelTrailingMargin
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CKUIBehaviorMac_macToLabelTrailingMargin__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macToLabelTrailingMargin_once != -1) {
    dispatch_once(&macToLabelTrailingMargin_once, block);
  }
  return *(double *)&macToLabelTrailingMargin_sBehavior;
}

uint64_t __43__CKUIBehaviorMac_macToLabelTrailingMargin__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) useMacToolbar];
  double v2 = 9.0;
  if (result) {
    double v2 = 0.0;
  }
  macToLabelTrailingMargin_sBehavior = *(void *)&v2;
  return result;
}

- (double)macTitleTrailingMargin
{
  if (macTitleTrailingMargin_once != -1) {
    dispatch_once(&macTitleTrailingMargin_once, &__block_literal_global_340);
  }
  return 0.0;
}

- (double)macTotalMarginWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CKUIBehaviorMac_macTotalMarginWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (macTotalMarginWidth_once != -1) {
    dispatch_once(&macTotalMarginWidth_once, block);
  }
  return *(double *)&macTotalMarginWidth_sBehavior;
}

double __38__CKUIBehaviorMac_macTotalMarginWidth__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) macNavbarLeftMargin];
  double v3 = v2;
  [*(id *)(a1 + 32) macToLabelTrailingMargin];
  double v5 = v3 + v4;
  [*(id *)(a1 + 32) macTitleTrailingMargin];
  double v7 = v5 + v6;
  [*(id *)(a1 + 32) macNavbarRightMargin];
  double result = v7 + v8;
  macTotalMarginWidth_sBehavior = *(void *)&result;
  return result;
}

- (BOOL)ckShouldUpdateaudioBalloonTimeFont
{
  return 0;
}

- (id)audioBalloonTimeFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonTimeFont_sContentSizeCategory_audioBalloonTimeFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateaudioBalloonTimeFont]
    || v11
    || audioBalloonTimeFont_sIsIncreaseContrastEnabled_audioBalloonTimeFont_0 != v4
    || audioBalloonTimeFont_sIsBoldTextEnabled_audioBalloonTimeFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0,
        *(double *)&audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0 != v6)
    || (uint64_t v12 = audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0,
        *(double *)&audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0 != v7)
    || (objc_msgSend((id)audioBalloonTimeFont_sCustomTextFontName_audioBalloonTimeFont_0, "isEqualToString:", v10, *(double *)&audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortMonospacedPreferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    double v14 = (void *)audioBalloonTimeFont_sBehavior_0;
    audioBalloonTimeFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&audioBalloonTimeFont_sContentSizeCategory_audioBalloonTimeFont_0, v3);
    audioBalloonTimeFont_sIsIncreaseContrastEnabled_audioBalloonTimeFont_0 = v4;
    audioBalloonTimeFont_sIsBoldTextEnabled_audioBalloonTimeFont_0 = IsBoldTextEnabled;
    audioBalloonTimeFont_sTextFontSize_audioBalloonTimeFont_0 = *(void *)&v6;
    audioBalloonTimeFont_sCustomTextFontSize_audioBalloonTimeFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&audioBalloonTimeFont_sCustomTextFontName_audioBalloonTimeFont_0, v9);
  }
  id v15 = (id)audioBalloonTimeFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdateaudioBalloonSpeedFont
{
  return 0;
}

- (id)audioBalloonSpeedFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonSpeedFont_sContentSizeCategory_audioBalloonSpeedFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateaudioBalloonSpeedFont]
    || v11
    || audioBalloonSpeedFont_sIsIncreaseContrastEnabled_audioBalloonSpeedFont_0 != v4
    || audioBalloonSpeedFont_sIsBoldTextEnabled_audioBalloonSpeedFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0,
        *(double *)&audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0 != v6)
    || (uint64_t v12 = audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0,
        *(double *)&audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0 != v7)
    || (objc_msgSend((id)audioBalloonSpeedFont_sCustomTextFontName_audioBalloonSpeedFont_0, "isEqualToString:", v10, *(double *)&audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortMonospacedPreferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    double v14 = (void *)audioBalloonSpeedFont_sBehavior_0;
    audioBalloonSpeedFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&audioBalloonSpeedFont_sContentSizeCategory_audioBalloonSpeedFont_0, v3);
    audioBalloonSpeedFont_sIsIncreaseContrastEnabled_audioBalloonSpeedFont_0 = v4;
    audioBalloonSpeedFont_sIsBoldTextEnabled_audioBalloonSpeedFont_0 = IsBoldTextEnabled;
    audioBalloonSpeedFont_sTextFontSize_audioBalloonSpeedFont_0 = *(void *)&v6;
    audioBalloonSpeedFont_sCustomTextFontSize_audioBalloonSpeedFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&audioBalloonSpeedFont_sCustomTextFontName_audioBalloonSpeedFont_0, v9);
  }
  id v15 = (id)audioBalloonSpeedFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdateaudioBalloonTranscriptionFont
{
  return 0;
}

- (id)audioBalloonTranscriptionFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)audioBalloonTranscriptionFont_sContentSizeCategory_audioBalloonTranscriptionFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdateaudioBalloonTranscriptionFont](self, "ckShouldUpdateaudioBalloonTranscriptionFont")|| v11|| audioBalloonTranscriptionFont_sIsIncreaseContrastEnabled_audioBalloonTranscriptionFont_0 != v4|| audioBalloonTranscriptionFont_sIsBoldTextEnabled_audioBalloonTranscriptionFont_0 != IsBoldTextEnabled|| (uint64_t v12 = audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0, *(double *)&audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0 != v6)|| (uint64_t v12 = audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0, *(double *)&audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0 != v7)|| (objc_msgSend((id)audioBalloonTranscriptionFont_sCustomTextFontName_audioBalloonTranscriptionFont_0, "isEqualToString:", v10, *(double *)&audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    double v14 = (void *)audioBalloonTranscriptionFont_sBehavior_0;
    audioBalloonTranscriptionFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&audioBalloonTranscriptionFont_sContentSizeCategory_audioBalloonTranscriptionFont_0, v3);
    audioBalloonTranscriptionFont_sIsIncreaseContrastEnabled_audioBalloonTranscriptionFont_0 = v4;
    audioBalloonTranscriptionFont_sIsBoldTextEnabled_audioBalloonTranscriptionFont_0 = IsBoldTextEnabled;
    audioBalloonTranscriptionFont_sTextFontSize_audioBalloonTranscriptionFont_0 = *(void *)&v6;
    audioBalloonTranscriptionFont_sCustomTextFontSize_audioBalloonTranscriptionFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&audioBalloonTranscriptionFont_sCustomTextFontName_audioBalloonTranscriptionFont_0, v9);
  }
  id v15 = (id)audioBalloonTranscriptionFont_sBehavior_0;

  return v15;
}

- (BOOL)transcriptMinBottomInsetIsEntryViewHeight
{
  if (transcriptMinBottomInsetIsEntryViewHeight_once_0 != -1) {
    dispatch_once(&transcriptMinBottomInsetIsEntryViewHeight_once_0, &__block_literal_global_342);
  }
  return transcriptMinBottomInsetIsEntryViewHeight_sBehavior;
}

void __60__CKUIBehaviorMac_transcriptMinBottomInsetIsEntryViewHeight__block_invoke()
{
  transcriptMinBottomInsetIsEntryViewHeight_sBehavior = 1;
}

- (UIEdgeInsets)minTranscriptMarginInsets
{
  if (minTranscriptMarginInsets_once_0 != -1) {
    dispatch_once(&minTranscriptMarginInsets_once_0, &__block_literal_global_344);
  }
  double v2 = *(double *)&minTranscriptMarginInsets_sBehavior_1_0;
  double v3 = *(double *)&minTranscriptMarginInsets_sBehavior_3_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __44__CKUIBehaviorMac_minTranscriptMarginInsets__block_invoke()
{
  minTranscriptMarginInsets_sBehavior_1_0 = 0x4030000000000000;
  minTranscriptMarginInsets_sBehavior_3_0 = 0x4030000000000000;
}

- (double)balloonMaxWidthPercent
{
  if (balloonMaxWidthPercent_once_0 != -1) {
    dispatch_once(&balloonMaxWidthPercent_once_0, &__block_literal_global_346);
  }
  return *(double *)&balloonMaxWidthPercent_sBehavior_0;
}

void __41__CKUIBehaviorMac_balloonMaxWidthPercent__block_invoke()
{
  balloonMaxWidthPercent_sBehavior_0 = 0x3FE4CCCCCCCCCCCDLL;
}

- (BOOL)ckShouldUpdateballoonTextFont
{
  return 0;
}

- (id)balloonTextFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)balloonTextFont_sContentSizeCategory_balloonTextFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateballoonTextFont]
    || v11
    || balloonTextFont_sIsIncreaseContrastEnabled_balloonTextFont_0 != v4
    || balloonTextFont_sIsBoldTextEnabled_balloonTextFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = balloonTextFont_sTextFontSize_balloonTextFont_0,
        *(double *)&balloonTextFont_sTextFontSize_balloonTextFont_0 != v6)
    || (uint64_t v12 = balloonTextFont_sCustomTextFontSize_balloonTextFont_0,
        *(double *)&balloonTextFont_sCustomTextFontSize_balloonTextFont_0 != v7)
    || (objc_msgSend((id)balloonTextFont_sCustomTextFontName_balloonTextFont_0, "isEqualToString:", v10, *(double *)&balloonTextFont_sCustomTextFontSize_balloonTextFont_0) & 1) == 0)
  {
    uint64_t v13 = [(CKUIBehaviorMac *)self balloonTextFontUserDefaults];
    double v14 = (void *)balloonTextFont_sBehavior_0;
    balloonTextFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&balloonTextFont_sContentSizeCategory_balloonTextFont_0, v3);
    balloonTextFont_sIsIncreaseContrastEnabled_balloonTextFont_0 = v4;
    balloonTextFont_sIsBoldTextEnabled_balloonTextFont_0 = IsBoldTextEnabled;
    balloonTextFont_sTextFontSize_balloonTextFont_0 = *(void *)&v6;
    balloonTextFont_sCustomTextFontSize_balloonTextFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&balloonTextFont_sCustomTextFontName_balloonTextFont_0, v9);
  }
  id v15 = (id)balloonTextFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptRegularFont
{
  return 0;
}

- (id)transcriptRegularFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptRegularFont_sContentSizeCategory_transcriptRegularFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptRegularFont]
    || v11
    || transcriptRegularFont_sIsIncreaseContrastEnabled_transcriptRegularFont_0 != v4
    || transcriptRegularFont_sIsBoldTextEnabled_transcriptRegularFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = transcriptRegularFont_sTextFontSize_transcriptRegularFont_0,
        *(double *)&transcriptRegularFont_sTextFontSize_transcriptRegularFont_0 != v6)
    || (uint64_t v12 = transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0,
        *(double *)&transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0 != v7)
    || (objc_msgSend((id)transcriptRegularFont_sCustomTextFontName_transcriptRegularFont_0, "isEqualToString:", v10, *(double *)&transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0) & 1) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)CKUIBehaviorMac;
    uint64_t v13 = [(CKUIBehavior *)&v18 transcriptRegularFont];
    uint64_t v14 = objc_msgSend(v13, "__ck_fontScaledByUserPreference");
    id v15 = (void *)transcriptRegularFont_sBehavior_0;
    transcriptRegularFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&transcriptRegularFont_sContentSizeCategory_transcriptRegularFont_0, v3);
    transcriptRegularFont_sIsIncreaseContrastEnabled_transcriptRegularFont_0 = v4;
    transcriptRegularFont_sIsBoldTextEnabled_transcriptRegularFont_0 = IsBoldTextEnabled;
    transcriptRegularFont_sTextFontSize_transcriptRegularFont_0 = *(void *)&v6;
    transcriptRegularFont_sCustomTextFontSize_transcriptRegularFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptRegularFont_sCustomTextFontName_transcriptRegularFont_0, v9);
  }
  id v16 = (id)transcriptRegularFont_sBehavior_0;

  return v16;
}

- (BOOL)ckShouldUpdatetranscriptMessageStatusFont
{
  return 0;
}

- (id)transcriptMessageStatusFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptMessageStatusFont_sContentSizeCategory_transcriptMessageStatusFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptMessageStatusFont]
    || v11
    || transcriptMessageStatusFont_sIsIncreaseContrastEnabled_transcriptMessageStatusFont_0 != v4
    || transcriptMessageStatusFont_sIsBoldTextEnabled_transcriptMessageStatusFont_0 != IsBoldTextEnabled
    || *(double *)&transcriptMessageStatusFont_sTextFontSize_transcriptMessageStatusFont_0 != v6
    || *(double *)&transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0 != v7
    || (objc_msgSend((id)transcriptMessageStatusFont_sCustomTextFontName_transcriptMessageStatusFont_0, "isEqualToString:", v10, *(double *)&transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_fontForStyle:weight:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4FB09D0]);
    uint64_t v13 = objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    uint64_t v14 = (void *)transcriptMessageStatusFont_sBehavior_0;
    transcriptMessageStatusFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptMessageStatusFont_sContentSizeCategory_transcriptMessageStatusFont_0, v3);
    transcriptMessageStatusFont_sIsIncreaseContrastEnabled_transcriptMessageStatusFont_0 = v4;
    transcriptMessageStatusFont_sIsBoldTextEnabled_transcriptMessageStatusFont_0 = IsBoldTextEnabled;
    transcriptMessageStatusFont_sTextFontSize_transcriptMessageStatusFont_0 = *(void *)&v6;
    transcriptMessageStatusFont_sCustomTextFontSize_transcriptMessageStatusFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptMessageStatusFont_sCustomTextFontName_transcriptMessageStatusFont_0, v9);
  }
  id v15 = (id)transcriptMessageStatusFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptMessageStatusDateFont
{
  return 0;
}

- (id)transcriptMessageStatusDateFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptMessageStatusDateFont_sContentSizeCategory_transcriptMessageStatusDateFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatetranscriptMessageStatusDateFont](self, "ckShouldUpdatetranscriptMessageStatusDateFont")|| v11|| transcriptMessageStatusDateFont_sIsIncreaseContrastEnabled_transcriptMessageStatusDateFont_0 != v4|| transcriptMessageStatusDateFont_sIsBoldTextEnabled_transcriptMessageStatusDateFont_0 != IsBoldTextEnabled|| *(double *)&transcriptMessageStatusDateFont_sTextFontSize_transcriptMessageStatusDateFont_0 != v6|| *(double *)&transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0 != v7|| (objc_msgSend((id)transcriptMessageStatusDateFont_sCustomTextFontName_transcriptMessageStatusDateFont_0, "isEqualToString:", v10, *(double *)&transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_fontForStyle:weight:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4FB09D8]);
    uint64_t v13 = objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    uint64_t v14 = (void *)transcriptMessageStatusDateFont_sBehavior_0;
    transcriptMessageStatusDateFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptMessageStatusDateFont_sContentSizeCategory_transcriptMessageStatusDateFont_0, v3);
    transcriptMessageStatusDateFont_sIsIncreaseContrastEnabled_transcriptMessageStatusDateFont_0 = v4;
    transcriptMessageStatusDateFont_sIsBoldTextEnabled_transcriptMessageStatusDateFont_0 = IsBoldTextEnabled;
    transcriptMessageStatusDateFont_sTextFontSize_transcriptMessageStatusDateFont_0 = *(void *)&v6;
    transcriptMessageStatusDateFont_sCustomTextFontSize_transcriptMessageStatusDateFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptMessageStatusDateFont_sCustomTextFontName_transcriptMessageStatusDateFont_0, v9);
  }
  id v15 = (id)transcriptMessageStatusDateFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptBoldFont
{
  return 0;
}

- (id)transcriptBoldFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptBoldFont_sContentSizeCategory_transcriptBoldFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptBoldFont]
    || v11
    || transcriptBoldFont_sIsIncreaseContrastEnabled_transcriptBoldFont_0 != v4
    || transcriptBoldFont_sIsBoldTextEnabled_transcriptBoldFont_0 != IsBoldTextEnabled
    || *(double *)&transcriptBoldFont_sTextFontSize_transcriptBoldFont_0 != v6
    || *(double *)&transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0 != v7
    || (objc_msgSend((id)transcriptBoldFont_sCustomTextFontName_transcriptBoldFont_0, "isEqualToString:", v10, *(double *)&transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_fontForStyle:weight:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4FB09D0]);
    uint64_t v13 = objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    uint64_t v14 = (void *)transcriptBoldFont_sBehavior_0;
    transcriptBoldFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptBoldFont_sContentSizeCategory_transcriptBoldFont_0, v3);
    transcriptBoldFont_sIsIncreaseContrastEnabled_transcriptBoldFont_0 = v4;
    transcriptBoldFont_sIsBoldTextEnabled_transcriptBoldFont_0 = IsBoldTextEnabled;
    transcriptBoldFont_sTextFontSize_transcriptBoldFont_0 = *(void *)&v6;
    transcriptBoldFont_sCustomTextFontSize_transcriptBoldFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptBoldFont_sCustomTextFontName_transcriptBoldFont_0, v9);
  }
  id v15 = (id)transcriptBoldFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptLightFont
{
  return 0;
}

- (id)transcriptLightFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptLightFont_sContentSizeCategory_transcriptLightFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptLightFont]
    || v11
    || transcriptLightFont_sIsIncreaseContrastEnabled_transcriptLightFont_0 != v4
    || transcriptLightFont_sIsBoldTextEnabled_transcriptLightFont_0 != IsBoldTextEnabled
    || *(double *)&transcriptLightFont_sTextFontSize_transcriptLightFont_0 != v6
    || *(double *)&transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0 != v7
    || (objc_msgSend((id)transcriptLightFont_sCustomTextFontName_transcriptLightFont_0, "isEqualToString:", v10, *(double *)&transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_fontForStyle:weight:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4FB09C8]);
    uint64_t v13 = objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    uint64_t v14 = (void *)transcriptLightFont_sBehavior_0;
    transcriptLightFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptLightFont_sContentSizeCategory_transcriptLightFont_0, v3);
    transcriptLightFont_sIsIncreaseContrastEnabled_transcriptLightFont_0 = v4;
    transcriptLightFont_sIsBoldTextEnabled_transcriptLightFont_0 = IsBoldTextEnabled;
    transcriptLightFont_sTextFontSize_transcriptLightFont_0 = *(void *)&v6;
    transcriptLightFont_sCustomTextFontSize_transcriptLightFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptLightFont_sCustomTextFontName_transcriptLightFont_0, v9);
  }
  id v15 = (id)transcriptLightFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptButtonTextFont
{
  return 0;
}

- (id)transcriptButtonTextFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptButtonTextFont_sContentSizeCategory_transcriptButtonTextFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptButtonTextFont]
    || v11
    || transcriptButtonTextFont_sIsIncreaseContrastEnabled_transcriptButtonTextFont_0 != v4
    || transcriptButtonTextFont_sIsBoldTextEnabled_transcriptButtonTextFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0,
        *(double *)&transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0 != v6)
    || (uint64_t v12 = transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0,
        *(double *)&transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0 != v7)
    || (objc_msgSend((id)transcriptButtonTextFont_sCustomTextFontName_transcriptButtonTextFont_0, "isEqualToString:", v10, *(double *)&transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0) & 1) == 0)
  {
    uint64_t v13 = [(CKUIBehaviorMac *)self transcriptBoldFont];
    uint64_t v14 = (void *)transcriptButtonTextFont_sBehavior_0;
    transcriptButtonTextFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptButtonTextFont_sContentSizeCategory_transcriptButtonTextFont_0, v3);
    transcriptButtonTextFont_sIsIncreaseContrastEnabled_transcriptButtonTextFont_0 = v4;
    transcriptButtonTextFont_sIsBoldTextEnabled_transcriptButtonTextFont_0 = IsBoldTextEnabled;
    transcriptButtonTextFont_sTextFontSize_transcriptButtonTextFont_0 = *(void *)&v6;
    transcriptButtonTextFont_sCustomTextFontSize_transcriptButtonTextFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptButtonTextFont_sCustomTextFontName_transcriptButtonTextFont_0, v9);
  }
  id v15 = (id)transcriptButtonTextFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatetranscriptSenderFont
{
  return 0;
}

- (id)transcriptSenderFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptSenderFont_sContentSizeCategory_transcriptSenderFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetranscriptSenderFont]
    || v11
    || transcriptSenderFont_sIsIncreaseContrastEnabled_transcriptSenderFont_0 != v4
    || transcriptSenderFont_sIsBoldTextEnabled_transcriptSenderFont_0 != IsBoldTextEnabled
    || *(double *)&transcriptSenderFont_sTextFontSize_transcriptSenderFont_0 != v6
    || *(double *)&transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0 != v7
    || (objc_msgSend((id)transcriptSenderFont_sCustomTextFontName_transcriptSenderFont_0, "isEqualToString:", v10, *(double *)&transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_fontForStyle:weight:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4FB09D8]);
    uint64_t v13 = objc_msgSend(v12, "__ck_fontScaledByUserPreference");
    uint64_t v14 = (void *)transcriptSenderFont_sBehavior_0;
    transcriptSenderFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&transcriptSenderFont_sContentSizeCategory_transcriptSenderFont_0, v3);
    transcriptSenderFont_sIsIncreaseContrastEnabled_transcriptSenderFont_0 = v4;
    transcriptSenderFont_sIsBoldTextEnabled_transcriptSenderFont_0 = IsBoldTextEnabled;
    transcriptSenderFont_sTextFontSize_transcriptSenderFont_0 = *(void *)&v6;
    transcriptSenderFont_sCustomTextFontSize_transcriptSenderFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&transcriptSenderFont_sCustomTextFontName_transcriptSenderFont_0, v9);
  }
  id v15 = (id)transcriptSenderFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatepreviewTitleFont
{
  return 0;
}

- (id)previewTitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  double v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)previewTitleFont_sContentSizeCategory_previewTitleFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatepreviewTitleFont]
    || v11
    || previewTitleFont_sIsIncreaseContrastEnabled_previewTitleFont_0 != v4
    || previewTitleFont_sIsBoldTextEnabled_previewTitleFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = previewTitleFont_sTextFontSize_previewTitleFont_0,
        *(double *)&previewTitleFont_sTextFontSize_previewTitleFont_0 != v6)
    || (uint64_t v12 = previewTitleFont_sCustomTextFontSize_previewTitleFont_0,
        *(double *)&previewTitleFont_sCustomTextFontSize_previewTitleFont_0 != v7)
    || (objc_msgSend((id)previewTitleFont_sCustomTextFontName_previewTitleFont_0, "isEqualToString:", v10, *(double *)&previewTitleFont_sCustomTextFontSize_previewTitleFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    uint64_t v14 = (void *)previewTitleFont_sBehavior_0;
    previewTitleFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&previewTitleFont_sContentSizeCategory_previewTitleFont_0, v3);
    previewTitleFont_sIsIncreaseContrastEnabled_previewTitleFont_0 = v4;
    previewTitleFont_sIsBoldTextEnabled_previewTitleFont_0 = IsBoldTextEnabled;
    previewTitleFont_sTextFontSize_previewTitleFont_0 = *(void *)&v6;
    previewTitleFont_sCustomTextFontSize_previewTitleFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&previewTitleFont_sCustomTextFontName_previewTitleFont_0, v9);
  }
  id v15 = (id)previewTitleFont_sBehavior_0;

  return v15;
}

- (double)transcriptContactImageDiameter
{
  if (transcriptContactImageDiameter_once_0 != -1) {
    dispatch_once(&transcriptContactImageDiameter_once_0, &__block_literal_global_350);
  }
  return *(double *)&transcriptContactImageDiameter_sBehavior_0;
}

void __49__CKUIBehaviorMac_transcriptContactImageDiameter__block_invoke()
{
  transcriptContactImageDiameter_sBehavior_0 = 0x403C000000000000;
}

- (BOOL)ckShouldUpdatetranscriptDrawerGestureAcceleration
{
  return 0;
}

- (double)transcriptDrawerGestureAcceleration
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v5 = CKUserPreferenceFontSize();
  double v6 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v7 length]) {
    double v8 = v7;
  }
  else {
    double v8 = @"None";
  }
  double v9 = v8;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)transcriptDrawerGestureAcceleration_sContentSizeCategory_transcriptDrawerGestureAcceleration_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatetranscriptDrawerGestureAcceleration](self, "ckShouldUpdatetranscriptDrawerGestureAcceleration")|| v10|| transcriptDrawerGestureAcceleration_sIsBoldTextEnabled_transcriptDrawerGestureAcceleration_0 != IsBoldTextEnabled|| *(double *)&transcriptDrawerGestureAcceleration_sTextFontSize_transcriptDrawerGestureAcceleration_0 != v5|| *(double *)&transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0 != v6|| (objc_msgSend((id)transcriptDrawerGestureAcceleration_sCustomTextFontName_transcriptDrawerGestureAcceleration_0, "isEqualToString:", v9, *(double *)&transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0) & 1) == 0)
  {
    transcriptDrawerGestureAcceleration_sBehavior_0 = 0x4014000000000000;
    objc_storeStrong((id *)&transcriptDrawerGestureAcceleration_sContentSizeCategory_transcriptDrawerGestureAcceleration_0, v3);
    transcriptDrawerGestureAcceleration_sIsBoldTextEnabled_transcriptDrawerGestureAcceleration_0 = IsBoldTextEnabled;
    transcriptDrawerGestureAcceleration_sTextFontSize_transcriptDrawerGestureAcceleration_0 = *(void *)&v5;
    transcriptDrawerGestureAcceleration_sCustomTextFontSize_transcriptDrawerGestureAcceleration_0 = *(void *)&v6;
    objc_storeStrong((id *)&transcriptDrawerGestureAcceleration_sCustomTextFontName_transcriptDrawerGestureAcceleration_0, v8);
  }
  double v11 = *(double *)&transcriptDrawerGestureAcceleration_sBehavior_0;

  return v11;
}

- (double)balloonContiguousSpace
{
  if (balloonContiguousSpace_once_0 != -1) {
    dispatch_once(&balloonContiguousSpace_once_0, &__block_literal_global_352);
  }
  return *(double *)&balloonContiguousSpace_sBehavior_0;
}

void __41__CKUIBehaviorMac_balloonContiguousSpace__block_invoke()
{
  balloonContiguousSpace_sBehavior_0 = 0x4008000000000000;
}

- (double)balloonNonContiguousSpace
{
  if (balloonNonContiguousSpace_once_0 != -1) {
    dispatch_once(&balloonNonContiguousSpace_once_0, &__block_literal_global_354_0);
  }
  return *(double *)&balloonNonContiguousSpace_sBehavior_0;
}

void __44__CKUIBehaviorMac_balloonNonContiguousSpace__block_invoke()
{
  balloonNonContiguousSpace_sBehavior_0 = 0x4024000000000000;
}

- (BOOL)ckShouldUpdatereplyBalloonTextFont
{
  return 0;
}

- (id)replyBalloonTextFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)replyBalloonTextFont_sContentSizeCategory_replyBalloonTextFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatereplyBalloonTextFont]
    || v11
    || replyBalloonTextFont_sIsIncreaseContrastEnabled_replyBalloonTextFont_0 != v4
    || replyBalloonTextFont_sIsBoldTextEnabled_replyBalloonTextFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0,
        *(double *)&replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0 != v6)
    || (uint64_t v12 = replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0,
        *(double *)&replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0 != v7)
    || (objc_msgSend((id)replyBalloonTextFont_sCustomTextFontName_replyBalloonTextFont_0, "isEqualToString:", v10, *(double *)&replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:", *MEMORY[0x1E4F43890], *(double *)&v12);
    uint64_t v14 = (void *)replyBalloonTextFont_sBehavior_0;
    replyBalloonTextFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&replyBalloonTextFont_sContentSizeCategory_replyBalloonTextFont_0, v3);
    replyBalloonTextFont_sIsIncreaseContrastEnabled_replyBalloonTextFont_0 = v4;
    replyBalloonTextFont_sIsBoldTextEnabled_replyBalloonTextFont_0 = IsBoldTextEnabled;
    replyBalloonTextFont_sTextFontSize_replyBalloonTextFont_0 = *(void *)&v6;
    replyBalloonTextFont_sCustomTextFontSize_replyBalloonTextFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&replyBalloonTextFont_sCustomTextFontName_replyBalloonTextFont_0, v9);
  }
  id v15 = (id)replyBalloonTextFont_sBehavior_0;

  return v15;
}

- (double)transcriptReplyPreviewContextContactImageDiameter
{
  if (transcriptReplyPreviewContextContactImageDiameter_once_0 != -1) {
    dispatch_once(&transcriptReplyPreviewContextContactImageDiameter_once_0, &__block_literal_global_356);
  }
  return *(double *)&transcriptReplyPreviewContextContactImageDiameter_sBehavior_0;
}

void __68__CKUIBehaviorMac_transcriptReplyPreviewContextContactImageDiameter__block_invoke()
{
  transcriptReplyPreviewContextContactImageDiameter_sBehavior_0 = 0x4032000000000000;
}

- (CGSize)mediaObjectCachedIconSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CKUIBehaviorMac_mediaObjectCachedIconSize__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (mediaObjectCachedIconSize_once_0 != -1) {
    dispatch_once(&mediaObjectCachedIconSize_once_0, block);
  }
  double v2 = *(double *)&mediaObjectCachedIconSize_sBehavior_0_0;
  double v3 = *(double *)&mediaObjectCachedIconSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __44__CKUIBehaviorMac_mediaObjectCachedIconSize__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) searchPhotosThumbnailWidth];
  double v3 = v2 * 0.5;
  if (v3 < 60.0) {
    double v3 = 60.0;
  }
  mediaObjectCachedIconSize_sBehavior_0_0 = *(void *)&v3;
  mediaObjectCachedIconSize_sBehavior_1_0 = *(void *)&v3;
  return result;
}

- (double)replyLineWidth
{
  if (replyLineWidth_once_0 != -1) {
    dispatch_once(&replyLineWidth_once_0, &__block_literal_global_358);
  }
  return *(double *)&replyLineWidth_sBehavior_0;
}

void __33__CKUIBehaviorMac_replyLineWidth__block_invoke()
{
  replyLineWidth_sBehavior_0 = 0x4008000000000000;
}

- (double)replyLineViewVerticalPadding
{
  if (replyLineViewVerticalPadding_once_0 != -1) {
    dispatch_once(&replyLineViewVerticalPadding_once_0, &__block_literal_global_360_0);
  }
  return *(double *)&replyLineViewVerticalPadding_sBehavior_0;
}

void __47__CKUIBehaviorMac_replyLineViewVerticalPadding__block_invoke()
{
  replyLineViewVerticalPadding_sBehavior_0 = 0x401C000000000000;
}

- (double)replyLineViewHorizontalPadding
{
  if (replyLineViewHorizontalPadding_once_0 != -1) {
    dispatch_once(&replyLineViewHorizontalPadding_once_0, &__block_literal_global_362);
  }
  return *(double *)&replyLineViewHorizontalPadding_sBehavior_0;
}

void __49__CKUIBehaviorMac_replyLineViewHorizontalPadding__block_invoke()
{
  replyLineViewHorizontalPadding_sBehavior_0 = 0x401C000000000000;
}

- (double)replyLineViewContactImageLayoutHorizontalPadding
{
  if (replyLineViewContactImageLayoutHorizontalPadding_once_0 != -1) {
    dispatch_once(&replyLineViewContactImageLayoutHorizontalPadding_once_0, &__block_literal_global_364);
  }
  return *(double *)&replyLineViewContactImageLayoutHorizontalPadding_sBehavior_0;
}

void __67__CKUIBehaviorMac_replyLineViewContactImageLayoutHorizontalPadding__block_invoke()
{
  replyLineViewContactImageLayoutHorizontalPadding_sBehavior_0 = 0x3FE0000000000000;
}

- (double)replyLineBracketRadius
{
  if (replyLineBracketRadius_once_0 != -1) {
    dispatch_once(&replyLineBracketRadius_once_0, &__block_literal_global_366);
  }
  return *(double *)&replyLineBracketRadius_sBehavior_0;
}

void __41__CKUIBehaviorMac_replyLineBracketRadius__block_invoke()
{
  replyLineBracketRadius_sBehavior_0 = 0x4033000000000000;
}

- (double)replyLineViewMaxWidth
{
  if (replyLineViewMaxWidth_once_0 != -1) {
    dispatch_once(&replyLineViewMaxWidth_once_0, &__block_literal_global_368);
  }
  return *(double *)&replyLineViewMaxWidth_sBehavior_0;
}

void __40__CKUIBehaviorMac_replyLineViewMaxWidth__block_invoke()
{
  replyLineViewMaxWidth_sBehavior_0 = 0x403E000000000000;
}

- (double)transcriptQuickActionButtonDiameter
{
  if (transcriptQuickActionButtonDiameter_once_0 != -1) {
    dispatch_once(&transcriptQuickActionButtonDiameter_once_0, &__block_literal_global_370);
  }
  return *(double *)&transcriptQuickActionButtonDiameter_sBehavior_0;
}

void __54__CKUIBehaviorMac_transcriptQuickActionButtonDiameter__block_invoke()
{
  transcriptQuickActionButtonDiameter_sBehavior_0 = 0x403C000000000000;
}

- (id)quickSaveButtonImage
{
  if (quickSaveButtonImage_once_0 != -1) {
    dispatch_once(&quickSaveButtonImage_once_0, &__block_literal_global_372);
  }
  double v2 = (void *)quickSaveButtonImage_sBehavior_0;

  return v2;
}

void __39__CKUIBehaviorMac_quickSaveButtonImage__block_invoke()
{
  id v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"square.and.arrow.down"];
  int v0 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:12.0];
  uint64_t v1 = [v3 imageWithSymbolConfiguration:v0];
  double v2 = (void *)quickSaveButtonImage_sBehavior_0;
  quickSaveButtonImage_sBehavior_0 = v1;
}

- (id)quickSavePinImage
{
  if (quickSavePinImage_once != -1) {
    dispatch_once(&quickSavePinImage_once, &__block_literal_global_377_0);
  }
  double v2 = (void *)quickSavePinImage_sBehavior;

  return v2;
}

void __36__CKUIBehaviorMac_quickSavePinImage__block_invoke()
{
  id v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"pin"];
  int v0 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:12.0];
  uint64_t v1 = [v3 imageWithSymbolConfiguration:v0];
  double v2 = (void *)quickSavePinImage_sBehavior;
  quickSavePinImage_sBehavior = v1;
}

- (BOOL)canPluginBalloonsUseOpaqueMask
{
  if (canPluginBalloonsUseOpaqueMask_once_0 != -1) {
    dispatch_once(&canPluginBalloonsUseOpaqueMask_once_0, &__block_literal_global_382);
  }
  return 0;
}

- (CGSize)balloonMaskSize
{
  if (balloonMaskSize_once_0 != -1) {
    dispatch_once(&balloonMaskSize_once_0, &__block_literal_global_384_0);
  }
  double v2 = *(double *)&balloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&balloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __34__CKUIBehaviorMac_balloonMaskSize__block_invoke()
{
  balloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  balloonMaskSize_sBehavior_1_0 = 0x403B000000000000;
}

- (CGSize)skinnyBalloonMaskSize
{
  if (skinnyBalloonMaskSize_once_0 != -1) {
    dispatch_once(&skinnyBalloonMaskSize_once_0, &__block_literal_global_386_0);
  }
  double v2 = *(double *)&skinnyBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&skinnyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __40__CKUIBehaviorMac_skinnyBalloonMaskSize__block_invoke()
{
  skinnyBalloonMaskSize_sBehavior_0_0 = 0x4042800000000000;
  skinnyBalloonMaskSize_sBehavior_1_0 = 0x403B000000000000;
}

- (double)balloonMaskTailWidth
{
  if (balloonMaskTailWidth_once_0 != -1) {
    dispatch_once(&balloonMaskTailWidth_once_0, &__block_literal_global_388);
  }
  return *(double *)&balloonMaskTailWidth_sBehavior_0;
}

void __39__CKUIBehaviorMac_balloonMaskTailWidth__block_invoke()
{
  balloonMaskTailWidth_sBehavior_0 = 0x4014000000000000;
}

- (double)replyBalloonMaskTailWidth
{
  if (replyBalloonMaskTailWidth_once != -1) {
    dispatch_once(&replyBalloonMaskTailWidth_once, &__block_literal_global_390);
  }
  return *(double *)&replyBalloonMaskTailWidth_sBehavior;
}

void __44__CKUIBehaviorMac_replyBalloonMaskTailWidth__block_invoke()
{
  replyBalloonMaskTailWidth_sBehavior = 0x4008000000000000;
}

- (double)replyBalloonMinHeight
{
  if (replyBalloonMinHeight_once_0 != -1) {
    dispatch_once(&replyBalloonMinHeight_once_0, &__block_literal_global_392);
  }
  return *(double *)&replyBalloonMinHeight_sBehavior_0;
}

void __40__CKUIBehaviorMac_replyBalloonMinHeight__block_invoke()
{
  replyBalloonMinHeight_sBehavior_0 = 0x4034000000000000;
}

- (CGSize)multilineBalloonMaskSize
{
  if (multilineBalloonMaskSize_once_0 != -1) {
    dispatch_once(&multilineBalloonMaskSize_once_0, &__block_literal_global_394);
  }
  double v2 = *(double *)&multilineBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&multilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __43__CKUIBehaviorMac_multilineBalloonMaskSize__block_invoke()
{
  multilineBalloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  multilineBalloonMaskSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)taillessMultilineBalloonMaskSize
{
  if (taillessMultilineBalloonMaskSize_once_0 != -1) {
    dispatch_once(&taillessMultilineBalloonMaskSize_once_0, &__block_literal_global_396);
  }
  double v2 = *(double *)&taillessMultilineBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&taillessMultilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __51__CKUIBehaviorMac_taillessMultilineBalloonMaskSize__block_invoke()
{
  taillessMultilineBalloonMaskSize_sBehavior_0_0 = 0x4045800000000000;
  taillessMultilineBalloonMaskSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)replyBalloonMaskSize
{
  if (replyBalloonMaskSize_once_0 != -1) {
    dispatch_once(&replyBalloonMaskSize_once_0, &__block_literal_global_398);
  }
  double v2 = *(double *)&replyBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&replyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __39__CKUIBehaviorMac_replyBalloonMaskSize__block_invoke()
{
  replyBalloonMaskSize_sBehavior_0_0 = 0x4041000000000000;
  replyBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (CGSize)replySkinnyBalloonMaskSize
{
  if (replySkinnyBalloonMaskSize_once_0 != -1) {
    dispatch_once(&replySkinnyBalloonMaskSize_once_0, &__block_literal_global_400_2);
  }
  double v2 = *(double *)&replySkinnyBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&replySkinnyBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __45__CKUIBehaviorMac_replySkinnyBalloonMaskSize__block_invoke()
{
  replySkinnyBalloonMaskSize_sBehavior_0_0 = 0x403C000000000000;
  replySkinnyBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (CGSize)replyMultilineBalloonMaskSize
{
  if (replyMultilineBalloonMaskSize_once_0 != -1) {
    dispatch_once(&replyMultilineBalloonMaskSize_once_0, &__block_literal_global_402);
  }
  double v2 = *(double *)&replyMultilineBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&replyMultilineBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_replyMultilineBalloonMaskSize__block_invoke()
{
  replyMultilineBalloonMaskSize_sBehavior_0_0 = 0x4041000000000000;
  replyMultilineBalloonMaskSize_sBehavior_1_0 = 0x4036000000000000;
}

- (CGSize)replyDeleteBalloonMaskSize
{
  if (replyDeleteBalloonMaskSize_once_0 != -1) {
    dispatch_once(&replyDeleteBalloonMaskSize_once_0, &__block_literal_global_404);
  }
  double v2 = *(double *)&replyDeleteBalloonMaskSize_sBehavior_0_0;
  double v3 = *(double *)&replyDeleteBalloonMaskSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __45__CKUIBehaviorMac_replyDeleteBalloonMaskSize__block_invoke()
{
  replyDeleteBalloonMaskSize_sBehavior_0_0 = 0x403F000000000000;
  replyDeleteBalloonMaskSize_sBehavior_1_0 = 0x4034000000000000;
}

- (id)livePhotoBadgeImage
{
  if (livePhotoBadgeImage_once_0 != -1) {
    dispatch_once(&livePhotoBadgeImage_once_0, &__block_literal_global_406);
  }
  double v2 = (void *)livePhotoBadgeImage_sBehavior_0;

  return v2;
}

void __38__CKUIBehaviorMac_livePhotoBadgeImage__block_invoke()
{
  int v0 = [MEMORY[0x1E4F42A80] systemImageNamed:@"livephoto"];
  uint64_t v1 = (void *)MEMORY[0x1E4F42A98];
  double v2 = [MEMORY[0x1E4F428B8] whiteColor];
  double v3 = [v1 configurationWithHierarchicalColor:v2];

  int v4 = [MEMORY[0x1E4F42A98] configurationWithScale:3];
  double v5 = [v3 configurationByApplyingConfiguration:v4];

  uint64_t v6 = [v0 imageWithSymbolConfiguration:v5];

  double v7 = (void *)livePhotoBadgeImage_sBehavior_0;
  livePhotoBadgeImage_sBehavior_0 = v6;
}

- (UIEdgeInsets)textReplyPreviewBalloonAlignmentRectInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CKUIBehaviorMac_textReplyPreviewBalloonAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (textReplyPreviewBalloonAlignmentRectInsets_once_0 != -1) {
    dispatch_once(&textReplyPreviewBalloonAlignmentRectInsets_once_0, block);
  }
  double v2 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0;
  double v3 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0;
  double v4 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0;
  double v5 = *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __61__CKUIBehaviorMac_textReplyPreviewBalloonAlignmentRectInsets__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) replyBalloonMaskTailWidth];
  double v2 = v1;
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v3 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  double v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v3 = 1.0;
  }
  double v5 = ceil(v3 * 5.0) / v3;
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = ceil(v6 * 9.0) / v6;
  double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v8 = 1.0;
  }
  double v9 = ceil(v8 * 5.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 != 0.0) {
    double v4 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  }
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0 = *(void *)&v5;
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0 = *(void *)&v7;
  textReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0 = *(void *)&v9;
  *(double *)&textReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0 = ceil((v2 + 9.0) * v4) / v4;
}

- (UIEdgeInsets)attachmentReplyPreviewBalloonAlignmentRectInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CKUIBehaviorMac_attachmentReplyPreviewBalloonAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (attachmentReplyPreviewBalloonAlignmentRectInsets_once_0 != -1) {
    dispatch_once(&attachmentReplyPreviewBalloonAlignmentRectInsets_once_0, block);
  }
  double v2 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0;
  double v3 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0;
  double v4 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0;
  double v5 = *(double *)&attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

double __67__CKUIBehaviorMac_attachmentReplyPreviewBalloonAlignmentRectInsets__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) balloonMaskTailWidth];
  double v2 = v1;
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v3 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  double v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v3 = 1.0;
  }
  double v5 = ceil(v3 * 4.0) / v3;
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = ceil(v6 * 7.0) / v6;
  double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v8 = 1.0;
  }
  double v9 = ceil(v8 * 4.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 != 0.0) {
    double v4 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  }
  double result = ceil((v2 + 6.0) * v4) / v4;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_0_0 = *(void *)&v5;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_1_0 = *(void *)&v7;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_2_0 = *(void *)&v9;
  attachmentReplyPreviewBalloonAlignmentRectInsets_sBehavior_3_0 = *(void *)&result;
  return result;
}

- (double)audioReplyPreviewBalloonInset
{
  if (audioReplyPreviewBalloonInset_once_0 != -1) {
    dispatch_once(&audioReplyPreviewBalloonInset_once_0, &__block_literal_global_411_0);
  }
  return *(double *)&audioReplyPreviewBalloonInset_sBehavior_0;
}

void __48__CKUIBehaviorMac_audioReplyPreviewBalloonInset__block_invoke()
{
  audioReplyPreviewBalloonInset_sBehavior_0 = 0x4035000000000000;
}

- (double)previewMaxWidth
{
  if (previewMaxWidth_once_0 != -1) {
    dispatch_once(&previewMaxWidth_once_0, &__block_literal_global_413);
  }
  return *(double *)&previewMaxWidth_sBehavior_0;
}

void __34__CKUIBehaviorMac_previewMaxWidth__block_invoke()
{
  previewMaxWidth_sBehavior_0 = 0x4072C00000000000;
}

- (double)replyButtonPadding
{
  if (replyButtonPadding_once_0 != -1) {
    dispatch_once(&replyButtonPadding_once_0, &__block_literal_global_415);
  }
  return *(double *)&replyButtonPadding_sBehavior;
}

void __37__CKUIBehaviorMac_replyButtonPadding__block_invoke()
{
  replyButtonPadding_sBehavior = 0x4020000000000000;
}

- (UIEdgeInsets)replyButtonEdgeInsets
{
  if (replyButtonEdgeInsets_once_0 != -1) {
    dispatch_once(&replyButtonEdgeInsets_once_0, &__block_literal_global_417_0);
  }
  double v2 = *(double *)&replyButtonEdgeInsets_sBehavior_0_0;
  double v3 = *(double *)&replyButtonEdgeInsets_sBehavior_1_0;
  double v4 = *(double *)&replyButtonEdgeInsets_sBehavior_2_0;
  double v5 = *(double *)&replyButtonEdgeInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __40__CKUIBehaviorMac_replyButtonEdgeInsets__block_invoke()
{
  replyButtonEdgeInsets_sBehavior_0_0 = 0x4014000000000000;
  replyButtonEdgeInsets_sBehavior_1_0 = 0x4026000000000000;
  replyButtonEdgeInsets_sBehavior_2_0 = 0x4014000000000000;
  replyButtonEdgeInsets_sBehavior_3_0 = 0x4026000000000000;
}

- (double)composeBalloonMaxWidthForEntryContentViewWidth:(double)a3
{
  return 176.0;
}

- (double)fontSizeOffsetUserDefaults
{
  [(CKUIBehaviorMac *)self fontSizeUserDefaults];
  return v2 + -13.0;
}

- (id)textFontUserDefaults:(id)a3
{
  id v4 = a3;
  [v4 pointSize];
  double v6 = v5;
  [(CKUIBehaviorMac *)self fontSizeOffsetUserDefaults];
  double v8 = [v4 fontWithSize:v6 + v7];

  return v8;
}

- (id)balloonTextFontUserDefaults
{
  if ([(CKUIBehaviorMac *)self customFontEnabled]
    && ([(CKUIBehaviorMac *)self customFontNameUserDefaults],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = (void *)MEMORY[0x1E4FB08E0];
    double v5 = [(CKUIBehaviorMac *)self customFontNameUserDefaults];
    [(CKUIBehaviorMac *)self customFontSizeUserDefaults];
    uint64_t v6 = objc_msgSend(v4, "fontWithName:size:", v5);
  }
  else
  {
    double v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isTextKit2Enabled];

    uint64_t v9 = *MEMORY[0x1E4F43870];
    if (v8)
    {
      double v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v9];
      NSComparisonResult v10 = (void *)MEMORY[0x1E4FB08E0];
      [(CKUIBehaviorMac *)self fontSizeUserDefaults];
      objc_msgSend(v10, "fontWithDescriptor:size:", v5);
    }
    else
    {
      double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:", v9);
      [(CKUIBehaviorMac *)self fontSizeUserDefaults];
      objc_msgSend(v5, "fontWithSize:");
    uint64_t v6 = };
  }
  NSComparisonResult v11 = (void *)v6;

  return v11;
}

- (CGSize)balloonMaskTailSizeForTailShape:(char)a3
{
  if (a3 >= 2)
  {
    double v3 = 5.0;
    double v4 = 5.0;
    if (a3 != 2)
    {
      double v3 = *MEMORY[0x1E4F1DB30];
      double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorMac;
    -[CKUIBehavior balloonMaskTailSizeForTailShape:](&v5, sel_balloonMaskTailSizeForTailShape_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)roundBalloonMaskSizeWithTailShape:(char)a3
{
  if (a3 >= 2)
  {
    double v3 = 28.0;
    double v4 = 28.0;
    if (a3 != 2)
    {
      double v3 = *MEMORY[0x1E4F1DB30];
      double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorMac;
    -[CKUIBehavior roundBalloonMaskSizeWithTailShape:](&v5, sel_roundBalloonMaskSizeWithTailShape_);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKUIBehaviorMac;
  -[CKUIBehavior unconstrainedAspectFillSizeForWidth:imageSize:](&v6, sel_unconstrainedAspectFillSizeForWidth_imageSize_, a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)balloonMaskAlignmentRectInsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CKUIBehaviorMac_balloonMaskAlignmentRectInsets__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (balloonMaskAlignmentRectInsets_once_0 != -1) {
    dispatch_once(&balloonMaskAlignmentRectInsets_once_0, block);
  }
  double v2 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_0_0;
  double v3 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_1_0;
  double v4 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_2_0;
  double v5 = *(double *)&balloonMaskAlignmentRectInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __49__CKUIBehaviorMac_balloonMaskAlignmentRectInsets__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) balloonMaskTailWidth];
  double v2 = v1;
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v3 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  double v4 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v3 = 1.0;
  }
  double v5 = ceil(v3 * 8.5) / v3;
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = ceil(v6 * 9.0) / v6;
  double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v8 = 1.0;
  }
  double v9 = ceil(v8 * 9.0) / v8;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 != 0.0) {
    double v4 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  }
  balloonMaskAlignmentRectInsets_sBehavior_0_0 = *(void *)&v5;
  balloonMaskAlignmentRectInsets_sBehavior_1_0 = *(void *)&v7;
  balloonMaskAlignmentRectInsets_sBehavior_2_0 = *(void *)&v9;
  *(double *)&balloonMaskAlignmentRectInsets_sBehavior_3_0 = ceil((v2 + 9.0) * v4) / v4;
}

- (id)imageBalloonSelectionOverlayColor
{
  if (imageBalloonSelectionOverlayColor_once_0 != -1) {
    dispatch_once(&imageBalloonSelectionOverlayColor_once_0, &__block_literal_global_425_0);
  }
  double v2 = (void *)imageBalloonSelectionOverlayColor_sBehavior_0;

  return v2;
}

void __52__CKUIBehaviorMac_imageBalloonSelectionOverlayColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.807843137 green:0.807843137 blue:0.823529412 alpha:0.4];
  double v1 = (void *)imageBalloonSelectionOverlayColor_sBehavior_0;
  imageBalloonSelectionOverlayColor_sBehavior_0 = v0;
}

- (BOOL)ckShouldUpdatetuConversationBalloonActionButtonFont
{
  return 0;
}

- (id)tuConversationBalloonActionButtonFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tuConversationBalloonActionButtonFont_sContentSizeCategory_tuConversationBalloonActionButtonFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatetuConversationBalloonActionButtonFont](self, "ckShouldUpdatetuConversationBalloonActionButtonFont")|| v11|| tuConversationBalloonActionButtonFont_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFont_0 != v4|| tuConversationBalloonActionButtonFont_sIsBoldTextEnabled_tuConversationBalloonActionButtonFont_0 != IsBoldTextEnabled|| (uint64_t v12 = tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0, *(double *)&tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0 != v6)|| (uint64_t v12 = tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0, *(double *)&tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0 != v7)|| (objc_msgSend((id)tuConversationBalloonActionButtonFont_sCustomTextFontName_tuConversationBalloonActionButtonFont_0, "isEqualToString:", v10, *(double *)&tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0) & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v14 = +[CKUIBehavior sharedBehaviors];
    id v15 = [v14 tuConversationBalloonActionButtonFontStyle];
    uint64_t v16 = objc_msgSend(v13, "__ck_fontForStyle:weight:", v15, *MEMORY[0x1E4FB09D8]);
    v17 = (void *)tuConversationBalloonActionButtonFont_sBehavior_0;
    tuConversationBalloonActionButtonFont_sBehavior_0 = v16;

    objc_storeStrong((id *)&tuConversationBalloonActionButtonFont_sContentSizeCategory_tuConversationBalloonActionButtonFont_0, v3);
    tuConversationBalloonActionButtonFont_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFont_0 = v4;
    tuConversationBalloonActionButtonFont_sIsBoldTextEnabled_tuConversationBalloonActionButtonFont_0 = IsBoldTextEnabled;
    tuConversationBalloonActionButtonFont_sTextFontSize_tuConversationBalloonActionButtonFont_0 = *(void *)&v6;
    tuConversationBalloonActionButtonFont_sCustomTextFontSize_tuConversationBalloonActionButtonFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFont_sCustomTextFontName_tuConversationBalloonActionButtonFont_0, v9);
  }
  id v18 = (id)tuConversationBalloonActionButtonFont_sBehavior_0;

  return v18;
}

- (BOOL)ckShouldUpdatetuConversationBalloonActionButtonFontStyle
{
  return 0;
}

- (id)tuConversationBalloonActionButtonFontStyle
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tuConversationBalloonActionButtonFontStyle_sContentSizeCategory_tuConversationBalloonActionButtonFontStyle_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatetuConversationBalloonActionButtonFontStyle](self, "ckShouldUpdatetuConversationBalloonActionButtonFontStyle")|| v11|| tuConversationBalloonActionButtonFontStyle_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFontStyle_0 != v4|| tuConversationBalloonActionButtonFontStyle_sIsBoldTextEnabled_tuConversationBalloonActionButtonFontStyle_0 != IsBoldTextEnabled|| *(double *)&tuConversationBalloonActionButtonFontStyle_sTextFontSize_tuConversationBalloonActionButtonFontStyle_0 != v6|| *(double *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0 != v7|| (objc_msgSend((id)tuConversationBalloonActionButtonFontStyle_sCustomTextFontName_tuConversationBalloonActionButtonFontStyle_0, "isEqualToString:", v10, *(double *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0) & 1) == 0)
  {
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sBehavior_0, (id)*MEMORY[0x1E4F43878]);
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sContentSizeCategory_tuConversationBalloonActionButtonFontStyle_0, v3);
    tuConversationBalloonActionButtonFontStyle_sIsIncreaseContrastEnabled_tuConversationBalloonActionButtonFontStyle_0 = v4;
    tuConversationBalloonActionButtonFontStyle_sIsBoldTextEnabled_tuConversationBalloonActionButtonFontStyle_0 = IsBoldTextEnabled;
    tuConversationBalloonActionButtonFontStyle_sTextFontSize_tuConversationBalloonActionButtonFontStyle_0 = *(void *)&v6;
    tuConversationBalloonActionButtonFontStyle_sCustomTextFontSize_tuConversationBalloonActionButtonFontStyle_0 = *(void *)&v7;
    objc_storeStrong((id *)&tuConversationBalloonActionButtonFontStyle_sCustomTextFontName_tuConversationBalloonActionButtonFontStyle_0, v9);
  }
  id v12 = (id)tuConversationBalloonActionButtonFontStyle_sBehavior_0;

  return v12;
}

- (double)tuConversationBalloonImageDimensions
{
  if (tuConversationBalloonImageDimensions_once_0 != -1) {
    dispatch_once(&tuConversationBalloonImageDimensions_once_0, &__block_literal_global_427);
  }
  return *(double *)&tuConversationBalloonImageDimensions_sBehavior_0;
}

void __55__CKUIBehaviorMac_tuConversationBalloonImageDimensions__block_invoke()
{
  tuConversationBalloonImageDimensions_sBehavior_0 = 0x403E000000000000;
}

- (double)tuConversationBalloonFaceTimeIconDimensions
{
  if (tuConversationBalloonFaceTimeIconDimensions_once_0 != -1) {
    dispatch_once(&tuConversationBalloonFaceTimeIconDimensions_once_0, &__block_literal_global_429);
  }
  return *(double *)&tuConversationBalloonFaceTimeIconDimensions_sBehavior_0;
}

void __62__CKUIBehaviorMac_tuConversationBalloonFaceTimeIconDimensions__block_invoke()
{
  tuConversationBalloonFaceTimeIconDimensions_sBehavior_0 = 0x4038000000000000;
}

- (double)tuConversationBalloonIconDimensions
{
  if (tuConversationBalloonIconDimensions_once_0 != -1) {
    dispatch_once(&tuConversationBalloonIconDimensions_once_0, &__block_literal_global_431_0);
  }
  return *(double *)&tuConversationBalloonIconDimensions_sBehavior_0;
}

void __54__CKUIBehaviorMac_tuConversationBalloonIconDimensions__block_invoke()
{
  tuConversationBalloonIconDimensions_sBehavior_0 = 0x4030000000000000;
}

- (double)tuConversationBalloonAvatarDimensions
{
  if (tuConversationBalloonAvatarDimensions_once_0 != -1) {
    dispatch_once(&tuConversationBalloonAvatarDimensions_once_0, &__block_literal_global_433);
  }
  return *(double *)&tuConversationBalloonAvatarDimensions_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonAvatarDimensions__block_invoke()
{
  tuConversationBalloonAvatarDimensions_sBehavior_0 = 0x402C000000000000;
}

- (double)tuConversationBalloonJoinButtonHeight
{
  if (tuConversationBalloonJoinButtonHeight_once_0 != -1) {
    dispatch_once(&tuConversationBalloonJoinButtonHeight_once_0, &__block_literal_global_435);
  }
  return *(double *)&tuConversationBalloonJoinButtonHeight_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonJoinButtonHeight__block_invoke()
{
  tuConversationBalloonJoinButtonHeight_sBehavior_0 = 0x4034000000000000;
}

- (double)tuConversationBalloonJoinButtonMinWidth
{
  if (tuConversationBalloonJoinButtonMinWidth_once_0 != -1) {
    dispatch_once(&tuConversationBalloonJoinButtonMinWidth_once_0, &__block_literal_global_437);
  }
  return *(double *)&tuConversationBalloonJoinButtonMinWidth_sBehavior_0;
}

void __58__CKUIBehaviorMac_tuConversationBalloonJoinButtonMinWidth__block_invoke()
{
  tuConversationBalloonJoinButtonMinWidth_sBehavior_0 = 0x4052000000000000;
}

- (double)tuConversationBalloonJoinButtonMaxWidth
{
  if (tuConversationBalloonJoinButtonMaxWidth_once_0 != -1) {
    dispatch_once(&tuConversationBalloonJoinButtonMaxWidth_once_0, &__block_literal_global_439);
  }
  return *(double *)&tuConversationBalloonJoinButtonMaxWidth_sBehavior_0;
}

void __58__CKUIBehaviorMac_tuConversationBalloonJoinButtonMaxWidth__block_invoke()
{
  tuConversationBalloonJoinButtonMaxWidth_sBehavior_0 = 0x4062C00000000000;
}

- (double)tuConversationBalloonContentMinHeight
{
  if (tuConversationBalloonContentMinHeight_once_0 != -1) {
    dispatch_once(&tuConversationBalloonContentMinHeight_once_0, &__block_literal_global_441_0);
  }
  return *(double *)&tuConversationBalloonContentMinHeight_sBehavior_0;
}

void __56__CKUIBehaviorMac_tuConversationBalloonContentMinHeight__block_invoke()
{
  tuConversationBalloonContentMinHeight_sBehavior_0 = 0x403E000000000000;
}

- (double)tuConversationBalloonContentStandardMinWidth
{
  if (tuConversationBalloonContentStandardMinWidth_once_0 != -1) {
    dispatch_once(&tuConversationBalloonContentStandardMinWidth_once_0, &__block_literal_global_443_0);
  }
  return *(double *)&tuConversationBalloonContentStandardMinWidth_sBehavior_0;
}

void __63__CKUIBehaviorMac_tuConversationBalloonContentStandardMinWidth__block_invoke()
{
  tuConversationBalloonContentStandardMinWidth_sBehavior_0 = 0x4062C00000000000;
}

- (BOOL)ckShouldUpdatenicknameUpdatesTitleFont
{
  return 0;
}

- (id)nicknameUpdatesTitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)nicknameUpdatesTitleFont_sContentSizeCategory_nicknameUpdatesTitleFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatenicknameUpdatesTitleFont]
    || v11
    || nicknameUpdatesTitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesTitleFont_0 != v4
    || nicknameUpdatesTitleFont_sIsBoldTextEnabled_nicknameUpdatesTitleFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0,
        *(double *)&nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0 != v6)
    || (uint64_t v12 = nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0,
        *(double *)&nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0 != v7)
    || (objc_msgSend((id)nicknameUpdatesTitleFont_sCustomTextFontName_nicknameUpdatesTitleFont_0, "isEqualToString:", v10, *(double *)&nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43870], *(double *)&v12);
    uint64_t v14 = (void *)nicknameUpdatesTitleFont_sBehavior_0;
    nicknameUpdatesTitleFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&nicknameUpdatesTitleFont_sContentSizeCategory_nicknameUpdatesTitleFont_0, v3);
    nicknameUpdatesTitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesTitleFont_0 = v4;
    nicknameUpdatesTitleFont_sIsBoldTextEnabled_nicknameUpdatesTitleFont_0 = IsBoldTextEnabled;
    nicknameUpdatesTitleFont_sTextFontSize_nicknameUpdatesTitleFont_0 = *(void *)&v6;
    nicknameUpdatesTitleFont_sCustomTextFontSize_nicknameUpdatesTitleFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&nicknameUpdatesTitleFont_sCustomTextFontName_nicknameUpdatesTitleFont_0, v9);
  }
  id v15 = (id)nicknameUpdatesTitleFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatenicknameUpdatesSubtitleFont
{
  return 0;
}

- (id)nicknameUpdatesSubtitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)nicknameUpdatesSubtitleFont_sContentSizeCategory_nicknameUpdatesSubtitleFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatenicknameUpdatesSubtitleFont]
    || v11
    || nicknameUpdatesSubtitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesSubtitleFont_0 != v4
    || nicknameUpdatesSubtitleFont_sIsBoldTextEnabled_nicknameUpdatesSubtitleFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0,
        *(double *)&nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0 != v6)
    || (uint64_t v12 = nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0,
        *(double *)&nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0 != v7)
    || (objc_msgSend((id)nicknameUpdatesSubtitleFont_sCustomTextFontName_nicknameUpdatesSubtitleFont_0, "isEqualToString:", v10, *(double *)&nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    uint64_t v14 = (void *)nicknameUpdatesSubtitleFont_sBehavior_0;
    nicknameUpdatesSubtitleFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&nicknameUpdatesSubtitleFont_sContentSizeCategory_nicknameUpdatesSubtitleFont_0, v3);
    nicknameUpdatesSubtitleFont_sIsIncreaseContrastEnabled_nicknameUpdatesSubtitleFont_0 = v4;
    nicknameUpdatesSubtitleFont_sIsBoldTextEnabled_nicknameUpdatesSubtitleFont_0 = IsBoldTextEnabled;
    nicknameUpdatesSubtitleFont_sTextFontSize_nicknameUpdatesSubtitleFont_0 = *(void *)&v6;
    nicknameUpdatesSubtitleFont_sCustomTextFontSize_nicknameUpdatesSubtitleFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&nicknameUpdatesSubtitleFont_sCustomTextFontName_nicknameUpdatesSubtitleFont_0, v9);
  }
  id v15 = (id)nicknameUpdatesSubtitleFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatelocationBoldButtonFont
{
  return 0;
}

- (id)locationBoldButtonFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)locationBoldButtonFont_sContentSizeCategory_locationBoldButtonFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatelocationBoldButtonFont]
    || v11
    || locationBoldButtonFont_sIsIncreaseContrastEnabled_locationBoldButtonFont_0 != v4
    || locationBoldButtonFont_sIsBoldTextEnabled_locationBoldButtonFont_0 != IsBoldTextEnabled
    || *(double *)&locationBoldButtonFont_sTextFontSize_locationBoldButtonFont_0 != v6
    || *(double *)&locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0 != v7
    || (objc_msgSend((id)locationBoldButtonFont_sCustomTextFontName_locationBoldButtonFont_0, "isEqualToString:", v10, *(double *)&locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0) & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:14.0];
    uint64_t v13 = (void *)locationBoldButtonFont_sBehavior_0;
    locationBoldButtonFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&locationBoldButtonFont_sContentSizeCategory_locationBoldButtonFont_0, v3);
    locationBoldButtonFont_sIsIncreaseContrastEnabled_locationBoldButtonFont_0 = v4;
    locationBoldButtonFont_sIsBoldTextEnabled_locationBoldButtonFont_0 = IsBoldTextEnabled;
    locationBoldButtonFont_sTextFontSize_locationBoldButtonFont_0 = *(void *)&v6;
    locationBoldButtonFont_sCustomTextFontSize_locationBoldButtonFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&locationBoldButtonFont_sCustomTextFontName_locationBoldButtonFont_0, v9);
  }
  id v14 = (id)locationBoldButtonFont_sBehavior_0;

  return v14;
}

- (BOOL)ckShouldUpdatelocationButtonFont
{
  return 0;
}

- (id)locationButtonFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)locationButtonFont_sContentSizeCategory_locationButtonFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatelocationButtonFont]
    || v11
    || locationButtonFont_sIsIncreaseContrastEnabled_locationButtonFont_0 != v4
    || locationButtonFont_sIsBoldTextEnabled_locationButtonFont_0 != IsBoldTextEnabled
    || *(double *)&locationButtonFont_sTextFontSize_locationButtonFont_0 != v6
    || *(double *)&locationButtonFont_sCustomTextFontSize_locationButtonFont_0 != v7
    || (objc_msgSend((id)locationButtonFont_sCustomTextFontName_locationButtonFont_0, "isEqualToString:", v10, *(double *)&locationButtonFont_sCustomTextFontSize_locationButtonFont_0) & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v13 = (void *)locationButtonFont_sBehavior_0;
    locationButtonFont_sBehavior_0 = v12;

    objc_storeStrong((id *)&locationButtonFont_sContentSizeCategory_locationButtonFont_0, v3);
    locationButtonFont_sIsIncreaseContrastEnabled_locationButtonFont_0 = v4;
    locationButtonFont_sIsBoldTextEnabled_locationButtonFont_0 = IsBoldTextEnabled;
    locationButtonFont_sTextFontSize_locationButtonFont_0 = *(void *)&v6;
    locationButtonFont_sCustomTextFontSize_locationButtonFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&locationButtonFont_sCustomTextFontName_locationButtonFont_0, v9);
  }
  id v14 = (id)locationButtonFont_sBehavior_0;

  return v14;
}

- (BOOL)enableBalloonTextSelection
{
  if (enableBalloonTextSelection_once_0 != -1) {
    dispatch_once(&enableBalloonTextSelection_once_0, &__block_literal_global_445_0);
  }
  return enableBalloonTextSelection_sBehavior;
}

void __45__CKUIBehaviorMac_enableBalloonTextSelection__block_invoke()
{
  enableBalloonTextSelection_sBehavior = 1;
}

- (BOOL)showsBalloonChevron
{
  if (showsBalloonChevron_once_0 != -1) {
    dispatch_once(&showsBalloonChevron_once_0, &__block_literal_global_447_0);
  }
  return 0;
}

- (double)onBoardingKitWelcomeControllerHeaderViewIconSize
{
  return 85.0;
}

- (CGSize)messageAcknowledgmentTranscriptBalloonSize
{
  if (messageAcknowledgmentTranscriptBalloonSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentTranscriptBalloonSize_once_0, &__block_literal_global_449_0);
  }
  double v2 = *(double *)&messageAcknowledgmentTranscriptBalloonSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __61__CKUIBehaviorMac_messageAcknowledgmentTranscriptBalloonSize__block_invoke()
{
  messageAcknowledgmentTranscriptBalloonSize_sBehavior_0_0 = 0x403D000000000000;
  messageAcknowledgmentTranscriptBalloonSize_sBehavior_1_0 = 0x403D000000000000;
}

- (UIEdgeInsets)messageAcknowledgmentTranscriptGlyphInset
{
  if (messageAcknowledgmentTranscriptGlyphInset_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentTranscriptGlyphInset_once_0, &__block_literal_global_451_1);
  }
  double v2 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_1_0;
  double v4 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_2_0;
  double v5 = *(double *)&messageAcknowledgmentTranscriptGlyphInset_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __60__CKUIBehaviorMac_messageAcknowledgmentTranscriptGlyphInset__block_invoke()
{
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_0_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_1_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_2_0 = 0x4008000000000000;
  messageAcknowledgmentTranscriptGlyphInset_sBehavior_3_0 = 0x4008000000000000;
}

- (CGPoint)messageAcknowledgmentTranscriptBalloonRelativePosition
{
  if (messageAcknowledgmentTranscriptBalloonRelativePosition_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentTranscriptBalloonRelativePosition_once_0, &__block_literal_global_453_0);
  }
  double v2 = *(double *)&messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_1_0;
  result.y = v3;
  result.x = v2;
  return result;
}

void __73__CKUIBehaviorMac_messageAcknowledgmentTranscriptBalloonRelativePosition__block_invoke()
{
  messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_0_0 = 0x4022000000000000;
  messageAcknowledgmentTranscriptBalloonRelativePosition_sBehavior_1_0 = 0xC02A000000000000;
}

- (double)messageAcknowledgmentPhotoGridXOffsetScalar
{
  if (messageAcknowledgmentPhotoGridXOffsetScalar_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPhotoGridXOffsetScalar_once_0, &__block_literal_global_455_0);
  }
  return *(double *)&messageAcknowledgmentPhotoGridXOffsetScalar_sBehavior;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentPhotoGridXOffsetScalar__block_invoke()
{
  messageAcknowledgmentPhotoGridXOffsetScalar_sBehavior = 0x3FD6666660000000;
}

- (double)messageAcknowledgmentPhotoGridYOffsetScalar
{
  if (messageAcknowledgmentPhotoGridYOffsetScalar_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPhotoGridYOffsetScalar_once_0, &__block_literal_global_457_0);
  }
  return *(double *)&messageAcknowledgmentPhotoGridYOffsetScalar_sBehavior_0;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentPhotoGridYOffsetScalar__block_invoke()
{
  messageAcknowledgmentPhotoGridYOffsetScalar_sBehavior_0 = 0x3FD6666660000000;
}

- (CGSize)messageAcknowledgmentPickerBarSize
{
  if (messageAcknowledgmentPickerBarSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPickerBarSize_once_0, &__block_literal_global_459_0);
  }
  double v2 = *(double *)&messageAcknowledgmentPickerBarSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentPickerBarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __53__CKUIBehaviorMac_messageAcknowledgmentPickerBarSize__block_invoke()
{
  messageAcknowledgmentPickerBarSize_sBehavior_0_0 = 0x406DC00000000000;
  messageAcknowledgmentPickerBarSize_sBehavior_1_0 = 0x404C800000000000;
}

- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentImageSize
{
  if (messageAcknowledgmentPickerBarAcknowledgmentImageSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPickerBarAcknowledgmentImageSize_once_0, &__block_literal_global_461_0);
  }
  double v2 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __72__CKUIBehaviorMac_messageAcknowledgmentPickerBarAcknowledgmentImageSize__block_invoke()
{
  messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_0_0 = 0x403C000000000000;
  messageAcknowledgmentPickerBarAcknowledgmentImageSize_sBehavior_1_0 = 0x403C000000000000;
}

- (CGSize)messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize
{
  if (messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_once_0, &__block_literal_global_463_0);
  }
  double v2 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __78__CKUIBehaviorMac_messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize__block_invoke()
{
  messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_0_0 = 0x403E000000000000;
  messageAcknowledgmentPickerBarAcknowledgmentItemBalloonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)messageAcknowledgmentPickerBarOffsetFromBalloon
{
  if (messageAcknowledgmentPickerBarOffsetFromBalloon_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPickerBarOffsetFromBalloon_once_0, &__block_literal_global_465_0);
  }
  double v2 = *(double *)&messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __66__CKUIBehaviorMac_messageAcknowledgmentPickerBarOffsetFromBalloon__block_invoke()
{
  messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_0_0 = 0x4037000000000000;
  messageAcknowledgmentPickerBarOffsetFromBalloon_sBehavior_1_0 = 0x4022000000000000;
}

- (CGSize)messageAcknowledgmentAnchorBubbleOffset
{
  if (messageAcknowledgmentAnchorBubbleOffset_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentAnchorBubbleOffset_once_0, &__block_literal_global_467_0);
  }
  double v2 = *(double *)&messageAcknowledgmentAnchorBubbleOffset_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentAnchorBubbleOffset_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_messageAcknowledgmentAnchorBubbleOffset__block_invoke()
{
  messageAcknowledgmentAnchorBubbleOffset_sBehavior_0_0 = 0x4014000000000000;
  messageAcknowledgmentAnchorBubbleOffset_sBehavior_1_0 = 0x4010000000000000;
}

- (double)messageAcknowledgmentPickerMinHorizontalMargin
{
  if (messageAcknowledgmentPickerMinHorizontalMargin_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPickerMinHorizontalMargin_once_0, &__block_literal_global_469_0);
  }
  return *(double *)&messageAcknowledgmentPickerMinHorizontalMargin_sBehavior_0;
}

void __65__CKUIBehaviorMac_messageAcknowledgmentPickerMinHorizontalMargin__block_invoke()
{
  messageAcknowledgmentPickerMinHorizontalMargin_sBehavior_0 = 0x4010000000000000;
}

- (CGSize)messageAcknowledgmentAnchorBubbleSize
{
  if (messageAcknowledgmentAnchorBubbleSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentAnchorBubbleSize_once_0, &__block_literal_global_471_0);
  }
  double v2 = *(double *)&messageAcknowledgmentAnchorBubbleSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentAnchorBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __56__CKUIBehaviorMac_messageAcknowledgmentAnchorBubbleSize__block_invoke()
{
  messageAcknowledgmentAnchorBubbleSize_sBehavior_0_0 = 0x4018000000000000;
  messageAcknowledgmentAnchorBubbleSize_sBehavior_1_0 = 0x4014000000000000;
}

- (CGSize)messageAcknowledgmentIntermediateBubbleSize
{
  if (messageAcknowledgmentIntermediateBubbleSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentIntermediateBubbleSize_once_0, &__block_literal_global_473_0);
  }
  double v2 = *(double *)&messageAcknowledgmentIntermediateBubbleSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentIntermediateBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __62__CKUIBehaviorMac_messageAcknowledgmentIntermediateBubbleSize__block_invoke()
{
  messageAcknowledgmentIntermediateBubbleSize_sBehavior_0_0 = 0x4028000000000000;
  messageAcknowledgmentIntermediateBubbleSize_sBehavior_1_0 = 0x4026000000000000;
}

- (CGSize)messageAcknowledgmentPillBubbleSize
{
  if (messageAcknowledgmentPillBubbleSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentPillBubbleSize_once_0, &__block_literal_global_475_0);
  }
  double v2 = *(double *)&messageAcknowledgmentPillBubbleSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentPillBubbleSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __54__CKUIBehaviorMac_messageAcknowledgmentPillBubbleSize__block_invoke()
{
  messageAcknowledgmentPillBubbleSize_sBehavior_0_0 = 0x406DE00000000000;
  messageAcknowledgmentPillBubbleSize_sBehavior_1_0 = 0x4044000000000000;
}

- (double)messageAcknowledgmentButtonMargin
{
  if (messageAcknowledgmentButtonMargin_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentButtonMargin_once_0, &__block_literal_global_477_0);
  }
  return *(double *)&messageAcknowledgmentButtonMargin_sBehavior_0;
}

void __52__CKUIBehaviorMac_messageAcknowledgmentButtonMargin__block_invoke()
{
  messageAcknowledgmentButtonMargin_sBehavior_0 = 0x4020000000000000;
}

- (CGSize)messageAcknowledgmentButtonSize
{
  if (messageAcknowledgmentButtonSize_once_0 != -1) {
    dispatch_once(&messageAcknowledgmentButtonSize_once_0, &__block_literal_global_479_0);
  }
  double v2 = *(double *)&messageAcknowledgmentButtonSize_sBehavior_0_0;
  double v3 = *(double *)&messageAcknowledgmentButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __50__CKUIBehaviorMac_messageAcknowledgmentButtonSize__block_invoke()
{
  messageAcknowledgmentButtonSize_sBehavior_0_0 = 0x403E000000000000;
  messageAcknowledgmentButtonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)aggregateAcknowledgmentTranscriptBalloonSize
{
  if (aggregateAcknowledgmentTranscriptBalloonSize_once_0 != -1) {
    dispatch_once(&aggregateAcknowledgmentTranscriptBalloonSize_once_0, &__block_literal_global_481_1);
  }
  double v2 = *(double *)&aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_0_0;
  double v3 = *(double *)&aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __63__CKUIBehaviorMac_aggregateAcknowledgmentTranscriptBalloonSize__block_invoke()
{
  aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_0_0 = 0x4041800000000000;
  aggregateAcknowledgmentTranscriptBalloonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (BOOL)ckShouldUpdatemessageAcknowledgmentVoteCountFont
{
  return 0;
}

- (id)messageAcknowledgmentVoteCountFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)messageAcknowledgmentVoteCountFont_sContentSizeCategory_messageAcknowledgmentVoteCountFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatemessageAcknowledgmentVoteCountFont](self, "ckShouldUpdatemessageAcknowledgmentVoteCountFont")|| v11|| messageAcknowledgmentVoteCountFont_sIsIncreaseContrastEnabled_messageAcknowledgmentVoteCountFont_0 != v4|| messageAcknowledgmentVoteCountFont_sIsBoldTextEnabled_messageAcknowledgmentVoteCountFont_0 != IsBoldTextEnabled|| (uint64_t v12 = messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0, *(double *)&messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0 != v6)|| (uint64_t v12 = messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0, *(double *)&messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0 != v7)|| (objc_msgSend((id)messageAcknowledgmentVoteCountFont_sCustomTextFontName_messageAcknowledgmentVoteCountFont_0, "isEqualToString:", v10, *(double *)&messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    id v14 = (void *)messageAcknowledgmentVoteCountFont_sBehavior_0;
    messageAcknowledgmentVoteCountFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&messageAcknowledgmentVoteCountFont_sContentSizeCategory_messageAcknowledgmentVoteCountFont_0, v3);
    messageAcknowledgmentVoteCountFont_sIsIncreaseContrastEnabled_messageAcknowledgmentVoteCountFont_0 = v4;
    messageAcknowledgmentVoteCountFont_sIsBoldTextEnabled_messageAcknowledgmentVoteCountFont_0 = IsBoldTextEnabled;
    messageAcknowledgmentVoteCountFont_sTextFontSize_messageAcknowledgmentVoteCountFont_0 = *(void *)&v6;
    messageAcknowledgmentVoteCountFont_sCustomTextFontSize_messageAcknowledgmentVoteCountFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&messageAcknowledgmentVoteCountFont_sCustomTextFontName_messageAcknowledgmentVoteCountFont_0, v9);
  }
  id v15 = (id)messageAcknowledgmentVoteCountFont_sBehavior_0;

  return v15;
}

- (double)messageAcknowledgementVotingViewHeight
{
  if (messageAcknowledgementVotingViewHeight_once_0 != -1) {
    dispatch_once(&messageAcknowledgementVotingViewHeight_once_0, &__block_literal_global_483_0);
  }
  return *(double *)&messageAcknowledgementVotingViewHeight_sBehavior_0;
}

void __57__CKUIBehaviorMac_messageAcknowledgementVotingViewHeight__block_invoke()
{
  messageAcknowledgementVotingViewHeight_sBehavior_0 = 0x4054000000000000;
}

- (double)messageAcknowledgementVotingViewMaxWidth
{
  if (messageAcknowledgementVotingViewMaxWidth_once_0 != -1) {
    dispatch_once(&messageAcknowledgementVotingViewMaxWidth_once_0, &__block_literal_global_485_0);
  }
  return *(double *)&messageAcknowledgementVotingViewMaxWidth_sBehavior_0;
}

void __59__CKUIBehaviorMac_messageAcknowledgementVotingViewMaxWidth__block_invoke()
{
  messageAcknowledgementVotingViewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)messageAcknowledgementVotingViewMinPadding
{
  if (messageAcknowledgementVotingViewMinPadding_once_0 != -1) {
    dispatch_once(&messageAcknowledgementVotingViewMinPadding_once_0, &__block_literal_global_487_0);
  }
  return *(double *)&messageAcknowledgementVotingViewMinPadding_sBehavior_0;
}

void __61__CKUIBehaviorMac_messageAcknowledgementVotingViewMinPadding__block_invoke()
{
  messageAcknowledgementVotingViewMinPadding_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)attributionViewAvatarSize
{
  if (attributionViewAvatarSize_once_0 != -1) {
    dispatch_once(&attributionViewAvatarSize_once_0, &__block_literal_global_489_0);
  }
  double v2 = *(double *)&attributionViewAvatarSize_sBehavior_0_0;
  double v3 = *(double *)&attributionViewAvatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __44__CKUIBehaviorMac_attributionViewAvatarSize__block_invoke()
{
  attributionViewAvatarSize_sBehavior_0_0 = 0x403E000000000000;
  attributionViewAvatarSize_sBehavior_1_0 = 0x403E000000000000;
}

- (double)attributionViewMaxWidth
{
  if (attributionViewMaxWidth_once_0 != -1) {
    dispatch_once(&attributionViewMaxWidth_once_0, &__block_literal_global_491_0);
  }
  return *(double *)&attributionViewMaxWidth_sBehavior_0;
}

void __42__CKUIBehaviorMac_attributionViewMaxWidth__block_invoke()
{
  attributionViewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (CGSize)attributionIconSize
{
  if (attributionIconSize_once_0 != -1) {
    dispatch_once(&attributionIconSize_once_0, &__block_literal_global_493_0);
  }
  double v2 = *(double *)&attributionIconSize_sBehavior_0_0;
  double v3 = *(double *)&attributionIconSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __38__CKUIBehaviorMac_attributionIconSize__block_invoke()
{
  attributionIconSize_sBehavior_0_0 = 0x402C000000000000;
  attributionIconSize_sBehavior_1_0 = 0x402C000000000000;
}

- (double)attributionViewMinPadding
{
  if (attributionViewMinPadding_once_0 != -1) {
    dispatch_once(&attributionViewMinPadding_once_0, &__block_literal_global_495_0);
  }
  return *(double *)&attributionViewMinPadding_sBehavior_0;
}

void __44__CKUIBehaviorMac_attributionViewMinPadding__block_invoke()
{
  attributionViewMinPadding_sBehavior_0 = 0x4018000000000000;
}

- (CGSize)attributionCountViewImageSize
{
  if (attributionCountViewImageSize_once_0 != -1) {
    dispatch_once(&attributionCountViewImageSize_once_0, &__block_literal_global_497_1);
  }
  double v2 = *(double *)&attributionCountViewImageSize_sBehavior_0_0;
  double v3 = *(double *)&attributionCountViewImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_attributionCountViewImageSize__block_invoke()
{
  attributionCountViewImageSize_sBehavior_0_0 = 0x402E000000000000;
  attributionCountViewImageSize_sBehavior_1_0 = 0x402E000000000000;
}

- (double)attributionCountAndImageViewPadding
{
  if (attributionCountAndImageViewPadding_once_0 != -1) {
    dispatch_once(&attributionCountAndImageViewPadding_once_0, &__block_literal_global_499_0);
  }
  return *(double *)&attributionCountAndImageViewPadding_sBehavior_0;
}

void __54__CKUIBehaviorMac_attributionCountAndImageViewPadding__block_invoke()
{
  attributionCountAndImageViewPadding_sBehavior_0 = 0x4000000000000000;
}

- (CGSize)attributionStickerDetailsViewButtonSize
{
  if (attributionStickerDetailsViewButtonSize_once_0 != -1) {
    dispatch_once(&attributionStickerDetailsViewButtonSize_once_0, &__block_literal_global_501_0);
  }
  double v2 = *(double *)&attributionStickerDetailsViewButtonSize_sBehavior_0_0;
  double v3 = *(double *)&attributionStickerDetailsViewButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_attributionStickerDetailsViewButtonSize__block_invoke()
{
  attributionStickerDetailsViewButtonSize_sBehavior_0_0 = 0x403E000000000000;
  attributionStickerDetailsViewButtonSize_sBehavior_1_0 = 0x403E000000000000;
}

- (CGSize)attributionStickerDetailsViewAvatarSize
{
  if (attributionStickerDetailsViewAvatarSize_once_0 != -1) {
    dispatch_once(&attributionStickerDetailsViewAvatarSize_once_0, &__block_literal_global_503_0);
  }
  double v2 = *(double *)&attributionStickerDetailsViewAvatarSize_sBehavior_0_0;
  double v3 = *(double *)&attributionStickerDetailsViewAvatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __58__CKUIBehaviorMac_attributionStickerDetailsViewAvatarSize__block_invoke()
{
  attributionStickerDetailsViewAvatarSize_sBehavior_0_0 = 0x402E000000000000;
  attributionStickerDetailsViewAvatarSize_sBehavior_1_0 = 0x402E000000000000;
}

- (CGSize)attributionStickerDetailsViewImageSize
{
  if (attributionStickerDetailsViewImageSize_once_0 != -1) {
    dispatch_once(&attributionStickerDetailsViewImageSize_once_0, &__block_literal_global_505_0);
  }
  double v2 = *(double *)&attributionStickerDetailsViewImageSize_sBehavior_0_0;
  double v3 = *(double *)&attributionStickerDetailsViewImageSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __57__CKUIBehaviorMac_attributionStickerDetailsViewImageSize__block_invoke()
{
  attributionStickerDetailsViewImageSize_sBehavior_0_0 = 0x4046800000000000;
  attributionStickerDetailsViewImageSize_sBehavior_1_0 = 0x4046800000000000;
}

- (CGSize)attributionCollapseButtonSize
{
  if (attributionCollapseButtonSize_once_0 != -1) {
    dispatch_once(&attributionCollapseButtonSize_once_0, &__block_literal_global_507_0);
  }
  double v2 = *(double *)&attributionCollapseButtonSize_sBehavior_0_0;
  double v3 = *(double *)&attributionCollapseButtonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorMac_attributionCollapseButtonSize__block_invoke()
{
  attributionCollapseButtonSize_sBehavior_0_0 = 0x4041000000000000;
  attributionCollapseButtonSize_sBehavior_1_0 = 0x4041000000000000;
}

- (UIEdgeInsets)attributionViewCollapsedModeInsets
{
  if (attributionViewCollapsedModeInsets_once_0 != -1) {
    dispatch_once(&attributionViewCollapsedModeInsets_once_0, &__block_literal_global_509);
  }
  double v2 = *(double *)&attributionViewCollapsedModeInsets_sBehavior_1_0;
  double v3 = *(double *)&attributionViewCollapsedModeInsets_sBehavior_3_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __53__CKUIBehaviorMac_attributionViewCollapsedModeInsets__block_invoke()
{
  attributionViewCollapsedModeInsets_sBehavior_1_0 = 0x4024000000000000;
  attributionViewCollapsedModeInsets_sBehavior_3_0 = 0x4024000000000000;
}

- (double)attributionCollapseButtonLeadingInset
{
  if (attributionCollapseButtonLeadingInset_once_0 != -1) {
    dispatch_once(&attributionCollapseButtonLeadingInset_once_0, &__block_literal_global_511);
  }
  return *(double *)&attributionCollapseButtonLeadingInset_sBehavior_0;
}

void __56__CKUIBehaviorMac_attributionCollapseButtonLeadingInset__block_invoke()
{
  attributionCollapseButtonLeadingInset_sBehavior_0 = 0x4000000000000000;
}

- (double)attributionVoteCountTrailingInset
{
  if (attributionVoteCountTrailingInset_once_0 != -1) {
    dispatch_once(&attributionVoteCountTrailingInset_once_0, &__block_literal_global_513);
  }
  return *(double *)&attributionVoteCountTrailingInset_sBehavior_0;
}

void __52__CKUIBehaviorMac_attributionVoteCountTrailingInset__block_invoke()
{
  attributionVoteCountTrailingInset_sBehavior_0 = 0xC024000000000000;
}

- (id)emojiStickerTranscriptCellFont
{
  if (emojiStickerTranscriptCellFont_once_0 != -1) {
    dispatch_once(&emojiStickerTranscriptCellFont_once_0, &__block_literal_global_515);
  }
  double v2 = (void *)emojiStickerTranscriptCellFont_sBehavior_0;

  return v2;
}

void __49__CKUIBehaviorMac_emojiStickerTranscriptCellFont__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB08E0] systemFontOfSize:52.0];
  double v1 = (void *)emojiStickerTranscriptCellFont_sBehavior_0;
  emojiStickerTranscriptCellFont_sBehavior_0 = v0;
}

- (CGSize)emojiStickerTranscriptBalloonSize
{
  if (emojiStickerTranscriptBalloonSize_once_0 != -1) {
    dispatch_once(&emojiStickerTranscriptBalloonSize_once_0, &__block_literal_global_517);
  }
  double v2 = *(double *)&emojiStickerTranscriptBalloonSize_sBehavior_0_0;
  double v3 = *(double *)&emojiStickerTranscriptBalloonSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __52__CKUIBehaviorMac_emojiStickerTranscriptBalloonSize__block_invoke()
{
  emojiStickerTranscriptBalloonSize_sBehavior_0_0 = 0x4056800000000000;
  emojiStickerTranscriptBalloonSize_sBehavior_1_0 = 0x4056800000000000;
}

- (CGSize)stickerPopoverSize
{
  if (stickerPopoverSize_once_0 != -1) {
    dispatch_once(&stickerPopoverSize_once_0, &__block_literal_global_519);
  }
  double v2 = *(double *)&stickerPopoverSize_sBehavior_0_0;
  double v3 = *(double *)&stickerPopoverSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __37__CKUIBehaviorMac_stickerPopoverSize__block_invoke()
{
  stickerPopoverSize_sBehavior_0_0 = 0x4074000000000000;
  stickerPopoverSize_sBehavior_1_0 = 0x407E000000000000;
}

- (BOOL)ckShouldUpdatetapbackPickerSizingFont
{
  return 0;
}

- (id)tapbackPickerSizingFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)tapbackPickerSizingFont_sContentSizeCategory_tapbackPickerSizingFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatetapbackPickerSizingFont]
    || v11
    || tapbackPickerSizingFont_sIsIncreaseContrastEnabled_tapbackPickerSizingFont_0 != v4
    || tapbackPickerSizingFont_sIsBoldTextEnabled_tapbackPickerSizingFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0,
        *(double *)&tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0 != v6)
    || (uint64_t v12 = tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0,
        *(double *)&tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0 != v7)
    || (objc_msgSend((id)tapbackPickerSizingFont_sCustomTextFontName_tapbackPickerSizingFont_0, "isEqualToString:", v10, *(double *)&tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0) & 1) == 0)
  {
    uint64_t v13 = +[CKUIBehavior fontWithStyle:adjustedForMaxSizeCategory:](CKUIBehavior, "fontWithStyle:adjustedForMaxSizeCategory:", *MEMORY[0x1E4F438B8], *MEMORY[0x1E4F43798], *(double *)&v12);
    uint64_t v14 = [v13 _fontScaledByScaleFactor:0.85];

    id v15 = (void *)tapbackPickerSizingFont_sBehavior_0;
    tapbackPickerSizingFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&tapbackPickerSizingFont_sContentSizeCategory_tapbackPickerSizingFont_0, v3);
    tapbackPickerSizingFont_sIsIncreaseContrastEnabled_tapbackPickerSizingFont_0 = v4;
    tapbackPickerSizingFont_sIsBoldTextEnabled_tapbackPickerSizingFont_0 = IsBoldTextEnabled;
    tapbackPickerSizingFont_sTextFontSize_tapbackPickerSizingFont_0 = *(void *)&v6;
    tapbackPickerSizingFont_sCustomTextFontSize_tapbackPickerSizingFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&tapbackPickerSizingFont_sCustomTextFontName_tapbackPickerSizingFont_0, v9);
  }
  id v16 = (id)tapbackPickerSizingFont_sBehavior_0;

  return v16;
}

- (id)stickerDetailsCellBackgroundColor
{
  if (stickerDetailsCellBackgroundColor_once_0 != -1) {
    dispatch_once(&stickerDetailsCellBackgroundColor_once_0, &__block_literal_global_521);
  }
  double v2 = (void *)stickerDetailsCellBackgroundColor_sBehavior;

  return v2;
}

void __52__CKUIBehaviorMac_stickerDetailsCellBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] clearColor];
  double v1 = (void *)stickerDetailsCellBackgroundColor_sBehavior;
  stickerDetailsCellBackgroundColor_sBehavior = v0;
}

- (id)stickerSaveButtonConfiguration
{
  if (stickerSaveButtonConfiguration_once_0 != -1) {
    dispatch_once(&stickerSaveButtonConfiguration_once_0, &__block_literal_global_523);
  }
  double v2 = (void *)stickerSaveButtonConfiguration_sBehavior_0;

  return v2;
}

void __49__CKUIBehaviorMac_stickerSaveButtonConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F427E8] borderedButtonConfiguration];
  double v1 = CKFrameworkBundle();
  double v2 = [v1 localizedStringForKey:@"STICKER_SAVE_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v0 setTitle:v2];

  [v0 setButtonSize:1];
  [v0 setCornerStyle:4];
  [v0 setMacIdiomStyle:1];
  double v3 = (void *)stickerSaveButtonConfiguration_sBehavior_0;
  stickerSaveButtonConfiguration_sBehavior_0 = (uint64_t)v0;
}

- (id)stickerViewButtonConfiguration
{
  if (stickerViewButtonConfiguration_once_0 != -1) {
    dispatch_once(&stickerViewButtonConfiguration_once_0, &__block_literal_global_529);
  }
  double v2 = (void *)stickerViewButtonConfiguration_sBehavior_0;

  return v2;
}

void __49__CKUIBehaviorMac_stickerViewButtonConfiguration__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F427E8] borderedButtonConfiguration];
  double v1 = CKFrameworkBundle();
  double v2 = [v1 localizedStringForKey:@"STICKER_VIEW_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v0 setTitle:v2];

  [v0 setButtonSize:1];
  [v0 setCornerStyle:4];
  [v0 setMacIdiomStyle:1];
  double v3 = (void *)stickerViewButtonConfiguration_sBehavior_0;
  stickerViewButtonConfiguration_sBehavior_0 = (uint64_t)v0;
}

- (CGSize)avatarSize
{
  if (avatarSize_once_0 != -1) {
    dispatch_once(&avatarSize_once_0, &__block_literal_global_534_0);
  }
  double v2 = *(double *)&avatarSize_sBehavior_0_0;
  double v3 = *(double *)&avatarSize_sBehavior_1_0;
  result.height = v3;
  result.width = v2;
  return result;
}

double __29__CKUIBehaviorMac_avatarSize__block_invoke()
{
  if (IMEnableTranscriptChromelessNavBar())
  {
    if (CKPixelWidth_once_13 != -1) {
      dispatch_once(&CKPixelWidth_once_13, &__block_literal_global_1102);
    }
    double v0 = 46.0;
    double v1 = *(double *)&CKPixelWidth_sPixel_13 + 46.0;
  }
  else
  {
    if (CKPixelWidth_once_13 != -1) {
      dispatch_once(&CKPixelWidth_once_13, &__block_literal_global_1102);
    }
    double v0 = 30.0;
    double v1 = *(double *)&CKPixelWidth_sPixel_13 + 30.0;
  }
  double result = *(double *)&CKPixelWidth_sPixel_13 + v0;
  avatarSize_sBehavior_0_0 = *(void *)&v1;
  avatarSize_sBehavior_1_0 = *(void *)&result;
  return result;
}

- (double)avatarSpacingMargin
{
  if (avatarSpacingMargin_once_0 != -1) {
    dispatch_once(&avatarSpacingMargin_once_0, &__block_literal_global_536);
  }
  return *(double *)&avatarSpacingMargin_sBehavior_0;
}

void __38__CKUIBehaviorMac_avatarSpacingMargin__block_invoke()
{
  avatarSpacingMargin_sBehavior_0 = 0x4042800000000000;
}

- (double)avatarNameWidth
{
  if (avatarNameWidth_once_0 != -1) {
    dispatch_once(&avatarNameWidth_once_0, &__block_literal_global_538);
  }
  return *(double *)&avatarNameWidth_sBehavior_0;
}

void __34__CKUIBehaviorMac_avatarNameWidth__block_invoke()
{
  avatarNameWidth_sBehavior_0 = 0x4050400000000000;
}

- (double)avatarContactImageNameMargin
{
  if (avatarContactImageNameMargin_once_0 != -1) {
    dispatch_once(&avatarContactImageNameMargin_once_0, &__block_literal_global_540_0);
  }
  return *(double *)&avatarContactImageNameMargin_sBehavior_0;
}

void __47__CKUIBehaviorMac_avatarContactImageNameMargin__block_invoke()
{
  avatarContactImageNameMargin_sBehavior_0 = 0x4020000000000000;
}

- (BOOL)ckShouldUpdateavatarNameFont
{
  return 0;
}

- (id)avatarNameFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)avatarNameFont_sContentSizeCategory_avatarNameFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdateavatarNameFont]
    || v11
    || avatarNameFont_sIsIncreaseContrastEnabled_avatarNameFont_0 != v4
    || avatarNameFont_sIsBoldTextEnabled_avatarNameFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = avatarNameFont_sTextFontSize_avatarNameFont_0,
        *(double *)&avatarNameFont_sTextFontSize_avatarNameFont_0 != v6)
    || (uint64_t v12 = avatarNameFont_sCustomTextFontSize_avatarNameFont_0,
        *(double *)&avatarNameFont_sCustomTextFontSize_avatarNameFont_0 != v7)
    || (objc_msgSend((id)avatarNameFont_sCustomTextFontName_avatarNameFont_0, "isEqualToString:", v10, *(double *)&avatarNameFont_sCustomTextFontSize_avatarNameFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "defaultFontForTextStyle:", *MEMORY[0x1E4F43878], *(double *)&v12);
    uint64_t v14 = (void *)avatarNameFont_sBehavior_0;
    avatarNameFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&avatarNameFont_sContentSizeCategory_avatarNameFont_0, v3);
    avatarNameFont_sIsIncreaseContrastEnabled_avatarNameFont_0 = v4;
    avatarNameFont_sIsBoldTextEnabled_avatarNameFont_0 = IsBoldTextEnabled;
    avatarNameFont_sTextFontSize_avatarNameFont_0 = *(void *)&v6;
    avatarNameFont_sCustomTextFontSize_avatarNameFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&avatarNameFont_sCustomTextFontName_avatarNameFont_0, v9);
  }
  id v15 = (id)avatarNameFont_sBehavior_0;

  return v15;
}

- (UIEdgeInsets)searchSectionMarginInsets
{
  if (searchSectionMarginInsets_once_0 != -1) {
    dispatch_once(&searchSectionMarginInsets_once_0, &__block_literal_global_542);
  }
  double v2 = *(double *)&searchSectionMarginInsets_sBehavior_0;
  double v3 = *(double *)&searchSectionMarginInsets_sBehavior_2;
  double v4 = *(double *)&searchSectionMarginInsets_sBehavior_3_0;
  double v5 = 0.0;
  result.right = v4;
  result.bottom = v3;
  result.left = v5;
  result.top = v2;
  return result;
}

void __44__CKUIBehaviorMac_searchSectionMarginInsets__block_invoke()
{
  searchSectionMarginInsets_sBehavior_0 = 0x4024000000000000;
  searchSectionMarginInsets_sBehavior_2 = 0x4024000000000000;
  searchSectionMarginInsets_sBehavior_3_0 = 0x4030000000000000;
}

- (double)searchLeadingAndTrailingMaxPadding
{
  if (searchLeadingAndTrailingMaxPadding_once_0 != -1) {
    dispatch_once(&searchLeadingAndTrailingMaxPadding_once_0, &__block_literal_global_544);
  }
  return *(double *)&searchLeadingAndTrailingMaxPadding_sBehavior_0;
}

void __53__CKUIBehaviorMac_searchLeadingAndTrailingMaxPadding__block_invoke()
{
  searchLeadingAndTrailingMaxPadding_sBehavior_0 = 0x4028000000000000;
}

- (double)searchDetailsLeadingAndTrailingMaxPadding
{
  if (searchDetailsLeadingAndTrailingMaxPadding_once_0 != -1) {
    dispatch_once(&searchDetailsLeadingAndTrailingMaxPadding_once_0, &__block_literal_global_546);
  }
  return *(double *)&searchDetailsLeadingAndTrailingMaxPadding_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchDetailsLeadingAndTrailingMaxPadding__block_invoke()
{
  searchDetailsLeadingAndTrailingMaxPadding_sBehavior_0 = 0x4030000000000000;
}

- (NSDirectionalEdgeInsets)searchResultsInsets
{
  if (searchResultsInsets_once_0 != -1) {
    dispatch_once(&searchResultsInsets_once_0, &__block_literal_global_548);
  }
  double v3 = *((double *)&searchResultsInsets_sBehavior_0 + 1);
  double v2 = *(double *)&searchResultsInsets_sBehavior_0;
  double v4 = *(double *)&qword_1E9242CE8;
  double v5 = unk_1E9242CF0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

__n128 __38__CKUIBehaviorMac_searchResultsInsets__block_invoke()
{
  __n128 result = *(__n128 *)MEMORY[0x1E4F424F0];
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F424F0] + 16);
  searchResultsInsets_sBehavior_0 = *MEMORY[0x1E4F424F0];
  *(_OWORD *)&qword_1E9242CE8 = v1;
  return result;
}

- (double)searchResultsTitleHeaderTopPadding
{
  if (searchResultsTitleHeaderTopPadding_once_0 != -1) {
    dispatch_once(&searchResultsTitleHeaderTopPadding_once_0, &__block_literal_global_550);
  }
  return *(double *)&searchResultsTitleHeaderTopPadding_sBehavior_0;
}

void __53__CKUIBehaviorMac_searchResultsTitleHeaderTopPadding__block_invoke()
{
  searchResultsTitleHeaderTopPadding_sBehavior_0 = 0x4020000000000000;
}

- (double)searchResultsTitleHeaderBottomPadding
{
  if (searchResultsTitleHeaderBottomPadding_once_0 != -1) {
    dispatch_once(&searchResultsTitleHeaderBottomPadding_once_0, &__block_literal_global_552_1);
  }
  return *(double *)&searchResultsTitleHeaderBottomPadding_sBehavior_0;
}

void __56__CKUIBehaviorMac_searchResultsTitleHeaderBottomPadding__block_invoke()
{
  searchResultsTitleHeaderBottomPadding_sBehavior_0 = 0x4020000000000000;
}

- (BOOL)conversationListHidesSearchBarWhenScrolling
{
  if (conversationListHidesSearchBarWhenScrolling_once_0 != -1) {
    dispatch_once(&conversationListHidesSearchBarWhenScrolling_once_0, &__block_literal_global_554);
  }
  return 0;
}

- (double)searchConversationMinAvatarLabelSpacing
{
  if (searchConversationMinAvatarLabelSpacing_once_0 != -1) {
    dispatch_once(&searchConversationMinAvatarLabelSpacing_once_0, &__block_literal_global_556);
  }
  return *(double *)&searchConversationMinAvatarLabelSpacing_sBehavior_0;
}

void __58__CKUIBehaviorMac_searchConversationMinAvatarLabelSpacing__block_invoke()
{
  searchConversationMinAvatarLabelSpacing_sBehavior_0 = 0x4018000000000000;
}

- (NSDirectionalEdgeInsets)searchConversationSectionInsets
{
  if (searchConversationSectionInsets_once_0 != -1) {
    dispatch_once(&searchConversationSectionInsets_once_0, &__block_literal_global_558);
  }
  double v2 = *(double *)&searchConversationSectionInsets_sBehavior_0_0;
  double v3 = *(double *)&searchConversationSectionInsets_sBehavior_2_0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v3;
  result.leading = v4;
  result.top = v2;
  return result;
}

void __50__CKUIBehaviorMac_searchConversationSectionInsets__block_invoke()
{
  searchConversationSectionInsets_sBehavior_0_0 = 0x4024000000000000;
  searchConversationSectionInsets_sBehavior_2_0 = 0x4030000000000000;
}

- (double)searchCellCornerRadius
{
  if (searchCellCornerRadius_once != -1) {
    dispatch_once(&searchCellCornerRadius_once, &__block_literal_global_560);
  }
  return *(double *)&searchCellCornerRadius_sBehavior;
}

void __41__CKUIBehaviorMac_searchCellCornerRadius__block_invoke()
{
  searchCellCornerRadius_sBehavior = 0x4024000000000000;
}

- (BOOL)ckShouldUpdatesearchHeaderFont
{
  return 0;
}

- (id)searchHeaderFont
{
  v30[1] = *MEMORY[0x1E4F143B8];
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchHeaderFont_sContentSizeCategory_searchHeaderFont_0, v3);
  BOOL v12 = [(CKUIBehaviorMac *)self ckShouldUpdatesearchHeaderFont];
  uint64_t v14 = &previewPrewarmQueue_once;
  if (v12
    || v11
    || searchHeaderFont_sIsIncreaseContrastEnabled_searchHeaderFont_0 != v4
    || searchHeaderFont_sIsBoldTextEnabled_searchHeaderFont_0 != IsBoldTextEnabled
    || (uint64_t v13 = searchHeaderFont_sTextFontSize_searchHeaderFont_0,
        *(double *)&searchHeaderFont_sTextFontSize_searchHeaderFont_0 != v6)
    || (uint64_t v13 = searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0,
        *(double *)&searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0 != v7)
    || (objc_msgSend((id)searchHeaderFont_sCustomTextFontName_searchHeaderFont_0, "isEqualToString:", v10, *(double *)&searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0) & 1) == 0)
  {
    id v15 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F438A0], 0x8000, 0, *(double *)&v13);
    uint64_t v29 = *MEMORY[0x1E4FB0950];
    uint64_t v27 = *MEMORY[0x1E4FB09F0];
    id v16 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
    v28 = v16;
    obj = v9;
    v17 = v10;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = id v18 = v3;
    v30[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v21 = [v15 fontDescriptorByAddingAttributes:v20];

    double v3 = v18;
    uint64_t v14 = &previewPrewarmQueue_once;
    uint64_t v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:0.0];

    NSComparisonResult v10 = v17;
    v23 = (void *)searchHeaderFont_sBehavior_0;
    searchHeaderFont_sBehavior_0 = v22;

    objc_storeStrong((id *)&searchHeaderFont_sContentSizeCategory_searchHeaderFont_0, v18);
    searchHeaderFont_sIsIncreaseContrastEnabled_searchHeaderFont_0 = v4;
    searchHeaderFont_sIsBoldTextEnabled_searchHeaderFont_0 = IsBoldTextEnabled;
    searchHeaderFont_sTextFontSize_searchHeaderFont_0 = *(void *)&v6;
    searchHeaderFont_sCustomTextFontSize_searchHeaderFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&searchHeaderFont_sCustomTextFontName_searchHeaderFont_0, obj);
  }
  id v24 = (id)v14[11];

  return v24;
}

- (BOOL)ckShouldUpdatesearchHeaderButtonFont
{
  return 0;
}

- (id)searchHeaderButtonFont
{
  v30[1] = *MEMORY[0x1E4F143B8];
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchHeaderButtonFont_sContentSizeCategory_searchHeaderButtonFont_0, v3);
  BOOL v12 = [(CKUIBehaviorMac *)self ckShouldUpdatesearchHeaderButtonFont];
  uint64_t v14 = &previewPrewarmQueue_once;
  if (v12
    || v11
    || searchHeaderButtonFont_sIsIncreaseContrastEnabled_searchHeaderButtonFont_0 != v4
    || searchHeaderButtonFont_sIsBoldTextEnabled_searchHeaderButtonFont_0 != IsBoldTextEnabled
    || (uint64_t v13 = searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0,
        *(double *)&searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0 != v6)
    || (uint64_t v13 = searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0,
        *(double *)&searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0 != v7)
    || (objc_msgSend((id)searchHeaderButtonFont_sCustomTextFontName_searchHeaderButtonFont_0, "isEqualToString:", v10, *(double *)&searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0) & 1) == 0)
  {
    id v15 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F43870], 0x8000, 0, *(double *)&v13);
    uint64_t v29 = *MEMORY[0x1E4FB0950];
    uint64_t v27 = *MEMORY[0x1E4FB09F0];
    id v16 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D8]];
    v28 = v16;
    obj = v9;
    v17 = v10;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = id v18 = v3;
    v30[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v21 = [v15 fontDescriptorByAddingAttributes:v20];

    double v3 = v18;
    uint64_t v14 = &previewPrewarmQueue_once;
    uint64_t v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:0.0];

    NSComparisonResult v10 = v17;
    v23 = (void *)searchHeaderButtonFont_sBehavior_0;
    searchHeaderButtonFont_sBehavior_0 = v22;

    objc_storeStrong((id *)&searchHeaderButtonFont_sContentSizeCategory_searchHeaderButtonFont_0, v18);
    searchHeaderButtonFont_sIsIncreaseContrastEnabled_searchHeaderButtonFont_0 = v4;
    searchHeaderButtonFont_sIsBoldTextEnabled_searchHeaderButtonFont_0 = IsBoldTextEnabled;
    searchHeaderButtonFont_sTextFontSize_searchHeaderButtonFont_0 = *(void *)&v6;
    searchHeaderButtonFont_sCustomTextFontSize_searchHeaderButtonFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&searchHeaderButtonFont_sCustomTextFontName_searchHeaderButtonFont_0, obj);
  }
  id v24 = (id)v14[7];

  return v24;
}

- (BOOL)ckShouldUpdatesearchResultLabelFont
{
  return 0;
}

- (id)searchResultLabelFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchResultLabelFont_sContentSizeCategory_searchResultLabelFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatesearchResultLabelFont]
    || v11
    || searchResultLabelFont_sIsIncreaseContrastEnabled_searchResultLabelFont_0 != v4
    || searchResultLabelFont_sIsBoldTextEnabled_searchResultLabelFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = searchResultLabelFont_sTextFontSize_searchResultLabelFont_0,
        *(double *)&searchResultLabelFont_sTextFontSize_searchResultLabelFont_0 != v6)
    || (uint64_t v12 = searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0,
        *(double *)&searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0 != v7)
    || (objc_msgSend((id)searchResultLabelFont_sCustomTextFontName_searchResultLabelFont_0, "isEqualToString:", v10, *(double *)&searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43890], *(double *)&v12);
    uint64_t v14 = (void *)searchResultLabelFont_sBehavior_0;
    searchResultLabelFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&searchResultLabelFont_sContentSizeCategory_searchResultLabelFont_0, v3);
    searchResultLabelFont_sIsIncreaseContrastEnabled_searchResultLabelFont_0 = v4;
    searchResultLabelFont_sIsBoldTextEnabled_searchResultLabelFont_0 = IsBoldTextEnabled;
    searchResultLabelFont_sTextFontSize_searchResultLabelFont_0 = *(void *)&v6;
    searchResultLabelFont_sCustomTextFontSize_searchResultLabelFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&searchResultLabelFont_sCustomTextFontName_searchResultLabelFont_0, v9);
  }
  id v15 = (id)searchResultLabelFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatesearchMessageBodyTextFont
{
  return 0;
}

- (id)searchMessageBodyTextFont
{
  v30[1] = *MEMORY[0x1E4F143B8];
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchMessageBodyTextFont_sContentSizeCategory_searchMessageBodyTextFont, v3);
  BOOL v12 = [(CKUIBehaviorMac *)self ckShouldUpdatesearchMessageBodyTextFont];
  uint64_t v14 = &quickSavePinImage_sBehavior;
  if (v12
    || v11
    || searchMessageBodyTextFont_sIsIncreaseContrastEnabled_searchMessageBodyTextFont != v4
    || searchMessageBodyTextFont_sIsBoldTextEnabled_searchMessageBodyTextFont != IsBoldTextEnabled
    || (uint64_t v13 = searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont,
        *(double *)&searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont != v6)
    || (uint64_t v13 = searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont,
        *(double *)&searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont != v7)
    || (objc_msgSend((id)searchMessageBodyTextFont_sCustomTextFontName_searchMessageBodyTextFont, "isEqualToString:", v10, *(double *)&searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont) & 1) == 0)
  {
    id v15 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F438C8], 0x8000, 0, *(double *)&v13);
    uint64_t v29 = *MEMORY[0x1E4FB0950];
    uint64_t v27 = *MEMORY[0x1E4FB09F0];
    id v16 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D8]];
    v28 = v16;
    obj = v9;
    v17 = v10;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v19 = id v18 = v3;
    v30[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v21 = [v15 fontDescriptorByAddingAttributes:v20];

    double v3 = v18;
    uint64_t v14 = &quickSavePinImage_sBehavior;
    uint64_t v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:0.0];

    NSComparisonResult v10 = v17;
    v23 = (void *)searchMessageBodyTextFont_sBehavior;
    searchMessageBodyTextFont_sBehavior = v22;

    objc_storeStrong((id *)&searchMessageBodyTextFont_sContentSizeCategory_searchMessageBodyTextFont, v18);
    searchMessageBodyTextFont_sIsIncreaseContrastEnabled_searchMessageBodyTextFont = v4;
    searchMessageBodyTextFont_sIsBoldTextEnabled_searchMessageBodyTextFont = IsBoldTextEnabled;
    searchMessageBodyTextFont_sTextFontSize_searchMessageBodyTextFont = *(void *)&v6;
    searchMessageBodyTextFont_sCustomTextFontSize_searchMessageBodyTextFont = *(void *)&v7;
    objc_storeStrong((id *)&searchMessageBodyTextFont_sCustomTextFontName_searchMessageBodyTextFont, obj);
  }
  id v24 = (id)v14[184];

  return v24;
}

- (BOOL)ckShouldUpdatesearchIndexingTitleFont
{
  return 0;
}

- (id)searchIndexingTitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchIndexingTitleFont_sContentSizeCategory_searchIndexingTitleFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatesearchIndexingTitleFont]
    || v11
    || searchIndexingTitleFont_sIsIncreaseContrastEnabled_searchIndexingTitleFont_0 != v4
    || searchIndexingTitleFont_sIsBoldTextEnabled_searchIndexingTitleFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0,
        *(double *)&searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0 != v6)
    || (uint64_t v12 = searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0,
        *(double *)&searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0 != v7)
    || (objc_msgSend((id)searchIndexingTitleFont_sCustomTextFontName_searchIndexingTitleFont_0, "isEqualToString:", v10, *(double *)&searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F43890], 0x8000, 0, *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:0.0];

    id v15 = (void *)searchIndexingTitleFont_sBehavior_0;
    searchIndexingTitleFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&searchIndexingTitleFont_sContentSizeCategory_searchIndexingTitleFont_0, v3);
    searchIndexingTitleFont_sIsIncreaseContrastEnabled_searchIndexingTitleFont_0 = v4;
    searchIndexingTitleFont_sIsBoldTextEnabled_searchIndexingTitleFont_0 = IsBoldTextEnabled;
    searchIndexingTitleFont_sTextFontSize_searchIndexingTitleFont_0 = *(void *)&v6;
    searchIndexingTitleFont_sCustomTextFontSize_searchIndexingTitleFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&searchIndexingTitleFont_sCustomTextFontName_searchIndexingTitleFont_0, v9);
  }
  id v16 = (id)searchIndexingTitleFont_sBehavior_0;

  return v16;
}

- (BOOL)ckShouldUpdatesearchIndexingSubtitleFont
{
  return 0;
}

- (id)searchIndexingSubtitleFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)searchIndexingSubtitleFont_sContentSizeCategory_searchIndexingSubtitleFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatesearchIndexingSubtitleFont]
    || v11
    || searchIndexingSubtitleFont_sIsIncreaseContrastEnabled_searchIndexingSubtitleFont_0 != v4
    || searchIndexingSubtitleFont_sIsBoldTextEnabled_searchIndexingSubtitleFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0,
        *(double *)&searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0 != v6)
    || (uint64_t v12 = searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0,
        *(double *)&searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0 != v7)
    || (objc_msgSend((id)searchIndexingSubtitleFont_sCustomTextFontName_searchIndexingSubtitleFont_0, "isEqualToString:", v10, *(double *)&searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F43890], *(double *)&v12);
    uint64_t v14 = (void *)searchIndexingSubtitleFont_sBehavior_0;
    searchIndexingSubtitleFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&searchIndexingSubtitleFont_sContentSizeCategory_searchIndexingSubtitleFont_0, v3);
    searchIndexingSubtitleFont_sIsIncreaseContrastEnabled_searchIndexingSubtitleFont_0 = v4;
    searchIndexingSubtitleFont_sIsBoldTextEnabled_searchIndexingSubtitleFont_0 = IsBoldTextEnabled;
    searchIndexingSubtitleFont_sTextFontSize_searchIndexingSubtitleFont_0 = *(void *)&v6;
    searchIndexingSubtitleFont_sCustomTextFontSize_searchIndexingSubtitleFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&searchIndexingSubtitleFont_sCustomTextFontName_searchIndexingSubtitleFont_0, v9);
  }
  id v15 = (id)searchIndexingSubtitleFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatereplyButtonFont
{
  return 0;
}

- (id)replyButtonFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)replyButtonFont_sContentSizeCategory_replyButtonFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatereplyButtonFont]
    || v11
    || replyButtonFont_sIsIncreaseContrastEnabled_replyButtonFont_0 != v4
    || replyButtonFont_sIsBoldTextEnabled_replyButtonFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = replyButtonFont_sTextFontSize_replyButtonFont_0,
        *(double *)&replyButtonFont_sTextFontSize_replyButtonFont_0 != v6)
    || (uint64_t v12 = replyButtonFont_sCustomTextFontSize_replyButtonFont_0,
        *(double *)&replyButtonFont_sCustomTextFontSize_replyButtonFont_0 != v7)
    || (objc_msgSend((id)replyButtonFont_sCustomTextFontName_replyButtonFont_0, "isEqualToString:", v10, *(double *)&replyButtonFont_sCustomTextFontSize_replyButtonFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F438C8], *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:14.0];
    uint64_t v15 = [(CKUIBehaviorMac *)self textFontUserDefaults:v14];

    id v16 = (void *)replyButtonFont_sBehavior_0;
    replyButtonFont_sBehavior_0 = v15;

    objc_storeStrong((id *)&replyButtonFont_sContentSizeCategory_replyButtonFont_0, v3);
    replyButtonFont_sIsIncreaseContrastEnabled_replyButtonFont_0 = v4;
    replyButtonFont_sIsBoldTextEnabled_replyButtonFont_0 = IsBoldTextEnabled;
    replyButtonFont_sTextFontSize_replyButtonFont_0 = *(void *)&v6;
    replyButtonFont_sCustomTextFontSize_replyButtonFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&replyButtonFont_sCustomTextFontName_replyButtonFont_0, v9);
  }
  id v17 = (id)replyButtonFont_sBehavior_0;

  return v17;
}

- (NSDirectionalEdgeInsets)searchMessagesSectionInsets
{
  if (searchMessagesSectionInsets_once_0 != -1) {
    dispatch_once(&searchMessagesSectionInsets_once_0, &__block_literal_global_562);
  }
  double v2 = *(double *)&searchMessagesSectionInsets_sBehavior_0;
  double v3 = *(double *)&searchMessagesSectionInsets_sBehavior_2;
  double v4 = 0.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v3;
  result.leading = v4;
  result.top = v2;
  return result;
}

void __46__CKUIBehaviorMac_searchMessagesSectionInsets__block_invoke()
{
  searchMessagesSectionInsets_sBehavior_0 = 0x4000000000000000;
  searchMessagesSectionInsets_sBehavior_2 = 0x4000000000000000;
}

- (double)searchMessagesConversationToSenderSpacing
{
  if (searchMessagesConversationToSenderSpacing_once_0 != -1) {
    dispatch_once(&searchMessagesConversationToSenderSpacing_once_0, &__block_literal_global_564);
  }
  return 0.0;
}

- (double)searchMessagesSenderToBalloonSpacing
{
  if (searchMessagesSenderToBalloonSpacing_once_0 != -1) {
    dispatch_once(&searchMessagesSenderToBalloonSpacing_once_0, &__block_literal_global_566);
  }
  return *(double *)&searchMessagesSenderToBalloonSpacing_sBehavior_0;
}

void __55__CKUIBehaviorMac_searchMessagesSenderToBalloonSpacing__block_invoke()
{
  searchMessagesSenderToBalloonSpacing_sBehavior_0 = 0x4014000000000000;
}

- (double)searchPhotosCellCornerRadius
{
  if (searchPhotosCellCornerRadius_once != -1) {
    dispatch_once(&searchPhotosCellCornerRadius_once, &__block_literal_global_568);
  }
  return *(double *)&searchPhotosCellCornerRadius_sBehavior;
}

void __47__CKUIBehaviorMac_searchPhotosCellCornerRadius__block_invoke()
{
  searchPhotosCellCornerRadius_sBehavior = 0x4020000000000000;
}

- (double)searchPhotosCellZKWAndDetailsCornerRadius
{
  if (searchPhotosCellZKWAndDetailsCornerRadius_once_0 != -1) {
    dispatch_once(&searchPhotosCellZKWAndDetailsCornerRadius_once_0, &__block_literal_global_570);
  }
  return *(double *)&searchPhotosCellZKWAndDetailsCornerRadius_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchPhotosCellZKWAndDetailsCornerRadius__block_invoke()
{
  searchPhotosCellZKWAndDetailsCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchPhotosInterItemSpacing
{
  if (searchPhotosInterItemSpacing_once_0 != -1) {
    dispatch_once(&searchPhotosInterItemSpacing_once_0, &__block_literal_global_572_0);
  }
  return *(double *)&searchPhotosInterItemSpacing_sBehavior_0;
}

void __47__CKUIBehaviorMac_searchPhotosInterItemSpacing__block_invoke()
{
  searchPhotosInterItemSpacing_sBehavior_0 = 0x4024000000000000;
}

- (double)searchPhotosZKWAndDetailsInterItemSpacing
{
  if (searchPhotosZKWAndDetailsInterItemSpacing_once_0 != -1) {
    dispatch_once(&searchPhotosZKWAndDetailsInterItemSpacing_once_0, &__block_literal_global_574);
  }
  return *(double *)&searchPhotosZKWAndDetailsInterItemSpacing_sBehavior_0;
}

void __60__CKUIBehaviorMac_searchPhotosZKWAndDetailsInterItemSpacing__block_invoke()
{
  searchPhotosZKWAndDetailsInterItemSpacing_sBehavior_0 = 0x4024000000000000;
}

- (double)searchPhotosInterItemSpacingDetailsView
{
  if (searchPhotosInterItemSpacingDetailsView_once_0 != -1) {
    dispatch_once(&searchPhotosInterItemSpacingDetailsView_once_0, &__block_literal_global_576);
  }
  return *(double *)&searchPhotosInterItemSpacingDetailsView_sBehavior_0;
}

double __58__CKUIBehaviorMac_searchPhotosInterItemSpacingDetailsView__block_invoke()
{
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v0 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v0 = 1.0;
  }
  double result = round(v0 * 10.0) / v0;
  searchPhotosInterItemSpacingDetailsView_sBehavior_0 = *(void *)&result;
  return result;
}

- (double)searchLinksCellCornerRadius
{
  if (searchLinksCellCornerRadius_once_0 != -1) {
    dispatch_once(&searchLinksCellCornerRadius_once_0, &__block_literal_global_578);
  }
  return *(double *)&searchLinksCellCornerRadius_sBehavior_0;
}

void __46__CKUIBehaviorMac_searchLinksCellCornerRadius__block_invoke()
{
  searchLinksCellCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchAttachmentsCellCornerRadius
{
  if (searchAttachmentsCellCornerRadius_once_0 != -1) {
    dispatch_once(&searchAttachmentsCellCornerRadius_once_0, &__block_literal_global_580);
  }
  return *(double *)&searchAttachmentsCellCornerRadius_sBehavior_0;
}

void __52__CKUIBehaviorMac_searchAttachmentsCellCornerRadius__block_invoke()
{
  searchAttachmentsCellCornerRadius_sBehavior_0 = 0x4020000000000000;
}

- (double)searchLocationsCellCornerRadius
{
  if (searchLocationsCellCornerRadius_once != -1) {
    dispatch_once(&searchLocationsCellCornerRadius_once, &__block_literal_global_582);
  }
  return *(double *)&searchLocationsCellCornerRadius_sBehavior;
}

void __50__CKUIBehaviorMac_searchLocationsCellCornerRadius__block_invoke()
{
  searchLocationsCellCornerRadius_sBehavior = 0x4020000000000000;
}

- (double)mapPreviewMaxWidth
{
  if (mapPreviewMaxWidth_once_0 != -1) {
    dispatch_once(&mapPreviewMaxWidth_once_0, &__block_literal_global_584_0);
  }
  return *(double *)&mapPreviewMaxWidth_sBehavior_0;
}

void __37__CKUIBehaviorMac_mapPreviewMaxWidth__block_invoke()
{
  mapPreviewMaxWidth_sBehavior_0 = 0x407F400000000000;
}

- (double)searchDropdownAvatarDiameter
{
  if (searchDropdownAvatarDiameter_once != -1) {
    dispatch_once(&searchDropdownAvatarDiameter_once, &__block_literal_global_586);
  }
  return *(double *)&searchDropdownAvatarDiameter_sBehavior;
}

void __47__CKUIBehaviorMac_searchDropdownAvatarDiameter__block_invoke()
{
  searchDropdownAvatarDiameter_sBehavior = 0x4030000000000000;
}

- (BOOL)ckShouldUpdaterecipientNameFont
{
  return 0;
}

- (id)recipientNameFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)recipientNameFont_sContentSizeCategory_recipientNameFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdaterecipientNameFont]
    || v11
    || recipientNameFont_sIsIncreaseContrastEnabled_recipientNameFont_0 != v4
    || recipientNameFont_sIsBoldTextEnabled_recipientNameFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = recipientNameFont_sTextFontSize_recipientNameFont_0,
        *(double *)&recipientNameFont_sTextFontSize_recipientNameFont_0 != v6)
    || (uint64_t v12 = recipientNameFont_sCustomTextFontSize_recipientNameFont_0,
        *(double *)&recipientNameFont_sCustomTextFontSize_recipientNameFont_0 != v7)
    || (objc_msgSend((id)recipientNameFont_sCustomTextFontName_recipientNameFont_0, "isEqualToString:", v10, *(double *)&recipientNameFont_sCustomTextFontSize_recipientNameFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E4F43870], 0x8000, 0, *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:0.0];

    uint64_t v15 = (void *)recipientNameFont_sBehavior_0;
    recipientNameFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&recipientNameFont_sContentSizeCategory_recipientNameFont_0, v3);
    recipientNameFont_sIsIncreaseContrastEnabled_recipientNameFont_0 = v4;
    recipientNameFont_sIsBoldTextEnabled_recipientNameFont_0 = IsBoldTextEnabled;
    recipientNameFont_sTextFontSize_recipientNameFont_0 = *(void *)&v6;
    recipientNameFont_sCustomTextFontSize_recipientNameFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&recipientNameFont_sCustomTextFontName_recipientNameFont_0, v9);
  }
  id v16 = (id)recipientNameFont_sBehavior_0;

  return v16;
}

- (double)detailsContactCellButtonWidth
{
  if (detailsContactCellButtonWidth_once_0 != -1) {
    dispatch_once(&detailsContactCellButtonWidth_once_0, &__block_literal_global_588);
  }
  return *(double *)&detailsContactCellButtonWidth_sBehavior_0;
}

void __48__CKUIBehaviorMac_detailsContactCellButtonWidth__block_invoke()
{
  detailsContactCellButtonWidth_sBehavior_0 = 0x4039000000000000;
}

- (double)detailsContactCellButtonHeight
{
  if (detailsContactCellButtonHeight_once_0 != -1) {
    dispatch_once(&detailsContactCellButtonHeight_once_0, &__block_literal_global_590);
  }
  return *(double *)&detailsContactCellButtonHeight_sBehavior_0;
}

void __49__CKUIBehaviorMac_detailsContactCellButtonHeight__block_invoke()
{
  detailsContactCellButtonHeight_sBehavior_0 = 0x4039000000000000;
}

- (UIEdgeInsets)detailsContactCellButtonEdgeInsets
{
  if (detailsContactCellButtonEdgeInsets_once_0 != -1) {
    dispatch_once(&detailsContactCellButtonEdgeInsets_once_0, &__block_literal_global_592);
  }
  double v2 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_0_0;
  double v3 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_1_0;
  double v4 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_2_0;
  double v5 = *(double *)&detailsContactCellButtonEdgeInsets_sBehavior_3_0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __53__CKUIBehaviorMac_detailsContactCellButtonEdgeInsets__block_invoke()
{
  detailsContactCellButtonEdgeInsets_sBehavior_0_0 = 0x4020000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_1_0 = 0x4018000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_2_0 = 0x4020000000000000;
  detailsContactCellButtonEdgeInsets_sBehavior_3_0 = 0x4018000000000000;
}

- (double)detailsContactCellMinimumHeight
{
  if (detailsContactCellMinimumHeight_once_0 != -1) {
    dispatch_once(&detailsContactCellMinimumHeight_once_0, &__block_literal_global_594_1);
  }
  return *(double *)&detailsContactCellMinimumHeight_sBehavior_0;
}

void __50__CKUIBehaviorMac_detailsContactCellMinimumHeight__block_invoke()
{
  detailsContactCellMinimumHeight_sBehavior_0 = 0x4044000000000000;
}

- (int64_t)detailsGroupChevronImageScale
{
  if (detailsGroupChevronImageScale_once_0 != -1) {
    dispatch_once(&detailsGroupChevronImageScale_once_0, &__block_literal_global_596_0);
  }
  return (uint64_t)((unint64_t)detailsGroupChevronImageScale_sBehavior_0 << 63) >> 63;
}

void __48__CKUIBehaviorMac_detailsGroupChevronImageScale__block_invoke()
{
  detailsGroupChevronImageScale_sBehavior_0 = 1;
}

- (double)detailsGroupButtonHeight
{
  if (detailsGroupButtonHeight_once != -1) {
    dispatch_once(&detailsGroupButtonHeight_once, &__block_literal_global_598);
  }
  return *(double *)&detailsGroupButtonHeight_sBehavior;
}

void __43__CKUIBehaviorMac_detailsGroupButtonHeight__block_invoke()
{
  detailsGroupButtonHeight_sBehavior = 0x4039000000000000;
}

- (double)detailsGroupButtonWidth
{
  if (detailsGroupButtonWidth_once != -1) {
    dispatch_once(&detailsGroupButtonWidth_once, &__block_literal_global_600);
  }
  return *(double *)&detailsGroupButtonWidth_sBehavior;
}

void __42__CKUIBehaviorMac_detailsGroupButtonWidth__block_invoke()
{
  detailsGroupButtonWidth_sBehavior = 0x4039000000000000;
}

- (double)detailsInterGroupButtonPadding
{
  if (detailsInterGroupButtonPadding_once != -1) {
    dispatch_once(&detailsInterGroupButtonPadding_once, &__block_literal_global_602_0);
  }
  return *(double *)&detailsInterGroupButtonPadding_sBehavior;
}

void __49__CKUIBehaviorMac_detailsInterGroupButtonPadding__block_invoke()
{
  detailsInterGroupButtonPadding_sBehavior = 0x4014000000000000;
}

- (double)detailsMapViewInset
{
  if (detailsMapViewInset_once != -1) {
    dispatch_once(&detailsMapViewInset_once, &__block_literal_global_604);
  }
  return *(double *)&detailsMapViewInset_sBehavior;
}

void __38__CKUIBehaviorMac_detailsMapViewInset__block_invoke()
{
  detailsMapViewInset_sBehavior = 0x3F847AE147AE147BLL;
}

- (double)detailsToFieldPreferredHeight
{
  if (detailsToFieldPreferredHeight_once != -1) {
    dispatch_once(&detailsToFieldPreferredHeight_once, &__block_literal_global_606_0);
  }
  return *(double *)&detailsToFieldPreferredHeight_sBehavior;
}

void __48__CKUIBehaviorMac_detailsToFieldPreferredHeight__block_invoke()
{
  detailsToFieldPreferredHeight_sBehavior = 0x4049000000000000;
}

- (double)detailsContactImageDiameter
{
  if (detailsContactImageDiameter_once != -1) {
    dispatch_once(&detailsContactImageDiameter_once, &__block_literal_global_608_0);
  }
  return *(double *)&detailsContactImageDiameter_sBehavior;
}

void __46__CKUIBehaviorMac_detailsContactImageDiameter__block_invoke()
{
  detailsContactImageDiameter_sBehavior = 0x4040000000000000;
}

- (double)detailsPreferredContentSizeWidth
{
  if (detailsPreferredContentSizeWidth_once != -1) {
    dispatch_once(&detailsPreferredContentSizeWidth_once, &__block_literal_global_610_0);
  }
  return *(double *)&detailsPreferredContentSizeWidth_sBehavior;
}

void __51__CKUIBehaviorMac_detailsPreferredContentSizeWidth__block_invoke()
{
  detailsPreferredContentSizeWidth_sBehavior = 0x4074000000000000;
}

- (double)collaborationDetailsPreferredContentSizeWidth
{
  if (collaborationDetailsPreferredContentSizeWidth_once != -1) {
    dispatch_once(&collaborationDetailsPreferredContentSizeWidth_once, &__block_literal_global_612_0);
  }
  return *(double *)&collaborationDetailsPreferredContentSizeWidth_sBehavior;
}

void __64__CKUIBehaviorMac_collaborationDetailsPreferredContentSizeWidth__block_invoke()
{
  collaborationDetailsPreferredContentSizeWidth_sBehavior = 0x407C200000000000;
}

- (double)detailsPreferredContentSizeHeight
{
  if (detailsPreferredContentSizeHeight_once != -1) {
    dispatch_once(&detailsPreferredContentSizeHeight_once, &__block_literal_global_614_0);
  }
  return *(double *)&detailsPreferredContentSizeHeight_sBehavior;
}

void __52__CKUIBehaviorMac_detailsPreferredContentSizeHeight__block_invoke()
{
  detailsPreferredContentSizeHeight_sBehavior = 0x407E000000000000;
}

- (double)detailsExpanseCellHeight
{
  if (detailsExpanseCellHeight_once_0 != -1) {
    dispatch_once(&detailsExpanseCellHeight_once_0, &__block_literal_global_616_0);
  }
  return *(double *)&detailsExpanseCellHeight_sBehavior_0;
}

double __43__CKUIBehaviorMac_detailsExpanseCellHeight__block_invoke()
{
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v0 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v0 = 1.0;
  }
  double result = round(v0 * 195.0) / v0;
  detailsExpanseCellHeight_sBehavior_0 = *(void *)&result;
  return result;
}

- (double)detailsExpanseScreenShareCellHeight
{
  if (detailsExpanseScreenShareCellHeight_once_0 != -1) {
    dispatch_once(&detailsExpanseScreenShareCellHeight_once_0, &__block_literal_global_618_1);
  }
  return *(double *)&detailsExpanseScreenShareCellHeight_sBehavior_0;
}

double __54__CKUIBehaviorMac_detailsExpanseScreenShareCellHeight__block_invoke()
{
  if (CKMainScreenScale_once_62 != -1) {
    dispatch_once(&CKMainScreenScale_once_62, &__block_literal_global_1099_0);
  }
  double v0 = *(double *)&CKMainScreenScale_sMainScreenScale_62;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_62 == 0.0) {
    double v0 = 1.0;
  }
  double result = round(v0 * 85.0) / v0;
  detailsExpanseScreenShareCellHeight_sBehavior_0 = *(void *)&result;
  return result;
}

- (double)detailsExpanseDescriptionLabelHeight
{
  if (detailsExpanseDescriptionLabelHeight_once_0 != -1) {
    dispatch_once(&detailsExpanseDescriptionLabelHeight_once_0, &__block_literal_global_620_1);
  }
  return *(double *)&detailsExpanseDescriptionLabelHeight_sBehavior;
}

void __55__CKUIBehaviorMac_detailsExpanseDescriptionLabelHeight__block_invoke()
{
  detailsExpanseDescriptionLabelHeight_sBehavior = 0x4036000000000000;
}

- (int64_t)detailsActionViewStyle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CKUIBehaviorMac_detailsActionViewStyle__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (detailsActionViewStyle_once_0 != -1) {
    dispatch_once(&detailsActionViewStyle_once_0, block);
  }
  return detailsActionViewStyle_sBehavior_0;
}

uint64_t __41__CKUIBehaviorMac_detailsActionViewStyle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _detailsActionViewStyle];
  detailsActionViewStyle_sBehavior_0 = result;
  return result;
}

- (int64_t)_detailsActionViewStyle
{
  return 4;
}

- (double)tuConversationInsetPadding
{
  if (tuConversationInsetPadding_once_0 != -1) {
    dispatch_once(&tuConversationInsetPadding_once_0, &__block_literal_global_622_1);
  }
  return *(double *)&tuConversationInsetPadding_sBehavior_0;
}

void __45__CKUIBehaviorMac_tuConversationInsetPadding__block_invoke()
{
  tuConversationInsetPadding_sBehavior_0 = 0x4031000000000000;
}

- (double)tuConversationInteritemSpacing
{
  if (tuConversationInteritemSpacing_once_0 != -1) {
    dispatch_once(&tuConversationInteritemSpacing_once_0, &__block_literal_global_624_1);
  }
  return *(double *)&tuConversationInteritemSpacing_sBehavior_0;
}

void __49__CKUIBehaviorMac_tuConversationInteritemSpacing__block_invoke()
{
  tuConversationInteritemSpacing_sBehavior_0 = 0x4028000000000000;
}

- (double)tuConversationJoinButtonCornerRadius
{
  if (tuConversationJoinButtonCornerRadius_once_0 != -1) {
    dispatch_once(&tuConversationJoinButtonCornerRadius_once_0, &__block_literal_global_626_0);
  }
  return *(double *)&tuConversationJoinButtonCornerRadius_sBehavior_0;
}

void __55__CKUIBehaviorMac_tuConversationJoinButtonCornerRadius__block_invoke()
{
  tuConversationJoinButtonCornerRadius_sBehavior_0 = 0x4019000000000000;
}

- (double)tuConversationJoinButtonHeight
{
  if (tuConversationJoinButtonHeight_once_0 != -1) {
    dispatch_once(&tuConversationJoinButtonHeight_once_0, &__block_literal_global_628);
  }
  return *(double *)&tuConversationJoinButtonHeight_sBehavior_0;
}

void __49__CKUIBehaviorMac_tuConversationJoinButtonHeight__block_invoke()
{
  tuConversationJoinButtonHeight_sBehavior_0 = 0x4034000000000000;
}

- (double)tuConversationJoinButtonMinWidth
{
  if (tuConversationJoinButtonMinWidth_once_0 != -1) {
    dispatch_once(&tuConversationJoinButtonMinWidth_once_0, &__block_literal_global_630);
  }
  return *(double *)&tuConversationJoinButtonMinWidth_sBehavior_0;
}

void __51__CKUIBehaviorMac_tuConversationJoinButtonMinWidth__block_invoke()
{
  tuConversationJoinButtonMinWidth_sBehavior_0 = 0x404A800000000000;
}

- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode
{
  if (detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_once_0 != -1) {
    dispatch_once(&detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_once_0, &__block_literal_global_632);
  }
  return *(double *)&detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_sBehavior_0;
}

void __79__CKUIBehaviorMac_detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode__block_invoke()
{
  detailsDownloadAttachmentsHeaderiCloudImageAlphaForLightMode_sBehavior_0 = 0x3FF0000000000000;
}

- (double)detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode
{
  if (detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_once_0 != -1) {
    dispatch_once(&detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_once_0, &__block_literal_global_634);
  }
  return *(double *)&detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_sBehavior_0;
}

void __78__CKUIBehaviorMac_detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode__block_invoke()
{
  detailsDownloadAttachmentsHeaderiCloudImageAlphaForDarkMode_sBehavior_0 = 0x3FF0000000000000;
}

- (double)detailsSectionHeaderPaddingLeading
{
  if (detailsSectionHeaderPaddingLeading_once_0 != -1) {
    dispatch_once(&detailsSectionHeaderPaddingLeading_once_0, &__block_literal_global_636);
  }
  return *(double *)&detailsSectionHeaderPaddingLeading_sBehavior;
}

void __53__CKUIBehaviorMac_detailsSectionHeaderPaddingLeading__block_invoke()
{
  detailsSectionHeaderPaddingLeading_sBehavior = 0xC000000000000000;
}

- (double)detailsSectionHeaderPaddingAbove
{
  if (detailsSectionHeaderPaddingAbove_once_0 != -1) {
    dispatch_once(&detailsSectionHeaderPaddingAbove_once_0, &__block_literal_global_638);
  }
  return *(double *)&detailsSectionHeaderPaddingAbove_sBehavior;
}

void __51__CKUIBehaviorMac_detailsSectionHeaderPaddingAbove__block_invoke()
{
  detailsSectionHeaderPaddingAbove_sBehavior = 0x4030000000000000;
}

- (double)detailsCellLabelPadding
{
  if (detailsCellLabelPadding_once_0 != -1) {
    dispatch_once(&detailsCellLabelPadding_once_0, &__block_literal_global_640);
  }
  return *(double *)&detailsCellLabelPadding_sBehavior;
}

void __42__CKUIBehaviorMac_detailsCellLabelPadding__block_invoke()
{
  detailsCellLabelPadding_sBehavior = 0x4028000000000000;
}

- (int64_t)groupRecipientSelectionPresentationStyle
{
  if (groupRecipientSelectionPresentationStyle_once_0 != -1) {
    dispatch_once(&groupRecipientSelectionPresentationStyle_once_0, &__block_literal_global_642);
  }
  if (groupRecipientSelectionPresentationStyle_sBehavior_0) {
    return 7;
  }
  else {
    return 0;
  }
}

void __59__CKUIBehaviorMac_groupRecipientSelectionPresentationStyle__block_invoke()
{
  groupRecipientSelectionPresentationStyle_sBehavior_0 = 1;
}

- (double)detailsAddButtonDiameter
{
  if (detailsAddButtonDiameter_once_0 != -1) {
    dispatch_once(&detailsAddButtonDiameter_once_0, &__block_literal_global_644_0);
  }
  return *(double *)&detailsAddButtonDiameter_sBehavior_0;
}

void __43__CKUIBehaviorMac_detailsAddButtonDiameter__block_invoke()
{
  detailsAddButtonDiameter_sBehavior_0 = 0x4040000000000000;
}

- (double)ktStatusCellImagePadding
{
  if (ktStatusCellImagePadding_once_0 != -1) {
    dispatch_once(&ktStatusCellImagePadding_once_0, &__block_literal_global_646);
  }
  return *(double *)&ktStatusCellImagePadding_sBehavior_0;
}

void __43__CKUIBehaviorMac_ktStatusCellImagePadding__block_invoke()
{
  ktStatusCellImagePadding_sBehavior_0 = 0x4008000000000000;
}

- (double)balloonSelectionScrollThresholdTop
{
  if (balloonSelectionScrollThresholdTop_once != -1) {
    dispatch_once(&balloonSelectionScrollThresholdTop_once, &__block_literal_global_648);
  }
  return *(double *)&balloonSelectionScrollThresholdTop_sBehavior;
}

void __53__CKUIBehaviorMac_balloonSelectionScrollThresholdTop__block_invoke()
{
  balloonSelectionScrollThresholdTop_sBehavior = 0x4059000000000000;
}

- (double)balloonSelectionScrollThresholdBottom
{
  if (balloonSelectionScrollThresholdBottom_once != -1) {
    dispatch_once(&balloonSelectionScrollThresholdBottom_once, &__block_literal_global_650);
  }
  return *(double *)&balloonSelectionScrollThresholdBottom_sBehavior;
}

void __56__CKUIBehaviorMac_balloonSelectionScrollThresholdBottom__block_invoke()
{
  balloonSelectionScrollThresholdBottom_sBehavior = 0x4059000000000000;
}

- (double)balloonSelectionLoadMoreSpinnerHeight
{
  if (balloonSelectionLoadMoreSpinnerHeight_once != -1) {
    dispatch_once(&balloonSelectionLoadMoreSpinnerHeight_once, &__block_literal_global_652);
  }
  return *(double *)&balloonSelectionLoadMoreSpinnerHeight_sBehavior;
}

void __56__CKUIBehaviorMac_balloonSelectionLoadMoreSpinnerHeight__block_invoke()
{
  balloonSelectionLoadMoreSpinnerHeight_sBehavior = 0x4042000000000000;
}

- (double)balloonSelectionMaxScrollSpeed
{
  if (balloonSelectionMaxScrollSpeed_once != -1) {
    dispatch_once(&balloonSelectionMaxScrollSpeed_once, &__block_literal_global_654_0);
  }
  return *(double *)&balloonSelectionMaxScrollSpeed_sBehavior;
}

void __49__CKUIBehaviorMac_balloonSelectionMaxScrollSpeed__block_invoke()
{
  balloonSelectionMaxScrollSpeed_sBehavior = 0x404E000000000000;
}

- (double)detailsViewMapHeight
{
  if (detailsViewMapHeight_once_0 != -1) {
    dispatch_once(&detailsViewMapHeight_once_0, &__block_literal_global_656_0);
  }
  return *(double *)&detailsViewMapHeight_sBehavior_0;
}

void __39__CKUIBehaviorMac_detailsViewMapHeight__block_invoke()
{
  detailsViewMapHeight_sBehavior_0 = 0x4068800000000000;
}

- (BOOL)ckShouldUpdatebusinessInfoViewGreetingTextFont
{
  return 0;
}

- (id)businessInfoViewGreetingTextFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewGreetingTextFont_sContentSizeCategory_businessInfoViewGreetingTextFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatebusinessInfoViewGreetingTextFont](self, "ckShouldUpdatebusinessInfoViewGreetingTextFont")|| v11|| businessInfoViewGreetingTextFont_sIsIncreaseContrastEnabled_businessInfoViewGreetingTextFont_0 != v4|| businessInfoViewGreetingTextFont_sIsBoldTextEnabled_businessInfoViewGreetingTextFont_0 != IsBoldTextEnabled|| *(double *)&businessInfoViewGreetingTextFont_sTextFontSize_businessInfoViewGreetingTextFont_0 != v6|| *(double *)&businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0 != v7|| (objc_msgSend((id)businessInfoViewGreetingTextFont_sCustomTextFontName_businessInfoViewGreetingTextFont_0, "isEqualToString:", v10, *(double *)&businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0) & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    uint64_t v13 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F438C0]];
    uint64_t v14 = [v13 scaledFontForFont:v12];

    uint64_t v15 = (void *)businessInfoViewGreetingTextFont_sBehavior_0;
    businessInfoViewGreetingTextFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&businessInfoViewGreetingTextFont_sContentSizeCategory_businessInfoViewGreetingTextFont_0, v3);
    businessInfoViewGreetingTextFont_sIsIncreaseContrastEnabled_businessInfoViewGreetingTextFont_0 = v4;
    businessInfoViewGreetingTextFont_sIsBoldTextEnabled_businessInfoViewGreetingTextFont_0 = IsBoldTextEnabled;
    businessInfoViewGreetingTextFont_sTextFontSize_businessInfoViewGreetingTextFont_0 = *(void *)&v6;
    businessInfoViewGreetingTextFont_sCustomTextFontSize_businessInfoViewGreetingTextFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&businessInfoViewGreetingTextFont_sCustomTextFontName_businessInfoViewGreetingTextFont_0, v9);
  }
  id v16 = (id)businessInfoViewGreetingTextFont_sBehavior_0;

  return v16;
}

- (BOOL)ckShouldUpdatebusinessInfoViewDescriptionTextFont
{
  return 0;
}

- (id)businessInfoViewDescriptionTextFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewDescriptionTextFont_sContentSizeCategory_businessInfoViewDescriptionTextFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatebusinessInfoViewDescriptionTextFont](self, "ckShouldUpdatebusinessInfoViewDescriptionTextFont")|| v11|| businessInfoViewDescriptionTextFont_sIsIncreaseContrastEnabled_businessInfoViewDescriptionTextFont_0 != v4|| businessInfoViewDescriptionTextFont_sIsBoldTextEnabled_businessInfoViewDescriptionTextFont_0 != IsBoldTextEnabled|| (uint64_t v12 = businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0, *(double *)&businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0 != v6)|| (uint64_t v12 = businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0, *(double *)&businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0 != v7)|| (objc_msgSend((id)businessInfoViewDescriptionTextFont_sCustomTextFontName_businessInfoViewDescriptionTextFont_0, "isEqualToString:", v10, *(double *)&businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F438C0], *(double *)&v12);
    uint64_t v14 = (void *)businessInfoViewDescriptionTextFont_sBehavior_0;
    businessInfoViewDescriptionTextFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&businessInfoViewDescriptionTextFont_sContentSizeCategory_businessInfoViewDescriptionTextFont_0, v3);
    businessInfoViewDescriptionTextFont_sIsIncreaseContrastEnabled_businessInfoViewDescriptionTextFont_0 = v4;
    businessInfoViewDescriptionTextFont_sIsBoldTextEnabled_businessInfoViewDescriptionTextFont_0 = IsBoldTextEnabled;
    businessInfoViewDescriptionTextFont_sTextFontSize_businessInfoViewDescriptionTextFont_0 = *(void *)&v6;
    businessInfoViewDescriptionTextFont_sCustomTextFontSize_businessInfoViewDescriptionTextFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&businessInfoViewDescriptionTextFont_sCustomTextFontName_businessInfoViewDescriptionTextFont_0, v9);
  }
  id v15 = (id)businessInfoViewDescriptionTextFont_sBehavior_0;

  return v15;
}

- (BOOL)ckShouldUpdatebusinessInfoViewTitleLabelFont
{
  return 0;
}

- (id)businessInfoViewTitleLabelFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)businessInfoViewTitleLabelFont_sContentSizeCategory_businessInfoViewTitleLabelFont_0, v3);
  if (-[CKUIBehaviorMac ckShouldUpdatebusinessInfoViewTitleLabelFont](self, "ckShouldUpdatebusinessInfoViewTitleLabelFont")|| v11|| businessInfoViewTitleLabelFont_sIsIncreaseContrastEnabled_businessInfoViewTitleLabelFont_0 != v4|| businessInfoViewTitleLabelFont_sIsBoldTextEnabled_businessInfoViewTitleLabelFont_0 != IsBoldTextEnabled|| (uint64_t v12 = businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0, *(double *)&businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0 != v6)|| (uint64_t v12 = businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0, *(double *)&businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0 != v7)|| (objc_msgSend((id)businessInfoViewTitleLabelFont_sCustomTextFontName_businessInfoViewTitleLabelFont_0, "isEqualToString:", v10, *(double *)&businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4F438C0], *(double *)&v12);
    uint64_t v14 = (void *)businessInfoViewTitleLabelFont_sBehavior_0;
    businessInfoViewTitleLabelFont_sBehavior_0 = v13;

    objc_storeStrong((id *)&businessInfoViewTitleLabelFont_sContentSizeCategory_businessInfoViewTitleLabelFont_0, v3);
    businessInfoViewTitleLabelFont_sIsIncreaseContrastEnabled_businessInfoViewTitleLabelFont_0 = v4;
    businessInfoViewTitleLabelFont_sIsBoldTextEnabled_businessInfoViewTitleLabelFont_0 = IsBoldTextEnabled;
    businessInfoViewTitleLabelFont_sTextFontSize_businessInfoViewTitleLabelFont_0 = *(void *)&v6;
    businessInfoViewTitleLabelFont_sCustomTextFontSize_businessInfoViewTitleLabelFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&businessInfoViewTitleLabelFont_sCustomTextFontName_businessInfoViewTitleLabelFont_0, v9);
  }
  id v15 = (id)businessInfoViewTitleLabelFont_sBehavior_0;

  return v15;
}

- (unint64_t)detailsSectionCount
{
  if (detailsSectionCount_once_0 != -1) {
    dispatch_once(&detailsSectionCount_once_0, &__block_literal_global_659);
  }
  if (detailsSectionCount_sBehavior_0) {
    return 16;
  }
  else {
    return 0;
  }
}

void __38__CKUIBehaviorMac_detailsSectionCount__block_invoke()
{
  detailsSectionCount_sBehavior_0 = 1;
}

- (BOOL)ckShouldUpdatesyncProgressLabelFont
{
  return 0;
}

- (id)syncProgressLabelFont
{
  CKPreferredContentSizeCategory();
  double v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  int IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  double v6 = CKUserPreferenceFontSize();
  double v7 = CKAccessibilityCustomTextFontSize();
  CKAccessibilityCustomTextFontName();
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v8 length]) {
    double v9 = v8;
  }
  else {
    double v9 = @"None";
  }
  NSComparisonResult v10 = v9;
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)syncProgressLabelFont_sContentSizeCategory_syncProgressLabelFont_0, v3);
  if ([(CKUIBehaviorMac *)self ckShouldUpdatesyncProgressLabelFont]
    || v11
    || syncProgressLabelFont_sIsIncreaseContrastEnabled_syncProgressLabelFont_0 != v4
    || syncProgressLabelFont_sIsBoldTextEnabled_syncProgressLabelFont_0 != IsBoldTextEnabled
    || (uint64_t v12 = syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0,
        *(double *)&syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0 != v6)
    || (uint64_t v12 = syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0,
        *(double *)&syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0 != v7)
    || (objc_msgSend((id)syncProgressLabelFont_sCustomTextFontName_syncProgressLabelFont_0, "isEqualToString:", v10, *(double *)&syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E4F438D0], *(double *)&v12);
    uint64_t v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v13 size:10.0];

    id v15 = (void *)syncProgressLabelFont_sBehavior_0;
    syncProgressLabelFont_sBehavior_0 = v14;

    objc_storeStrong((id *)&syncProgressLabelFont_sContentSizeCategory_syncProgressLabelFont_0, v3);
    syncProgressLabelFont_sIsIncreaseContrastEnabled_syncProgressLabelFont_0 = v4;
    syncProgressLabelFont_sIsBoldTextEnabled_syncProgressLabelFont_0 = IsBoldTextEnabled;
    syncProgressLabelFont_sTextFontSize_syncProgressLabelFont_0 = *(void *)&v6;
    syncProgressLabelFont_sCustomTextFontSize_syncProgressLabelFont_0 = *(void *)&v7;
    objc_storeStrong((id *)&syncProgressLabelFont_sCustomTextFontName_syncProgressLabelFont_0, v9);
  }
  id v16 = (id)syncProgressLabelFont_sBehavior_0;

  return v16;
}

- (id)syncBarHairlineColor
{
  if (syncBarHairlineColor_once_0 != -1) {
    dispatch_once(&syncBarHairlineColor_once_0, &__block_literal_global_661);
  }
  double v2 = (void *)syncBarHairlineColor_sBehavior_0;

  return v2;
}

void __39__CKUIBehaviorMac_syncBarHairlineColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] separatorColor];
  long long v1 = (void *)syncBarHairlineColor_sBehavior_0;
  syncBarHairlineColor_sBehavior_0 = v0;
}

- (int64_t)syncBarBlurEffectStyle
{
  if (syncBarBlurEffectStyle_once_0 != -1) {
    dispatch_once(&syncBarBlurEffectStyle_once_0, &__block_literal_global_663_0);
  }
  if (syncBarBlurEffectStyle_sBehavior_0) {
    return 6;
  }
  else {
    return 0;
  }
}

void __41__CKUIBehaviorMac_syncBarBlurEffectStyle__block_invoke()
{
  syncBarBlurEffectStyle_sBehavior_0 = 1;
}

- (double)messageHighlightButtonGlyphSymbolPointSize
{
  if (messageHighlightButtonGlyphSymbolPointSize_once_0 != -1) {
    dispatch_once(&messageHighlightButtonGlyphSymbolPointSize_once_0, &__block_literal_global_665_0);
  }
  return *(double *)&messageHighlightButtonGlyphSymbolPointSize_sBehavior_0;
}

void __61__CKUIBehaviorMac_messageHighlightButtonGlyphSymbolPointSize__block_invoke()
{
  messageHighlightButtonGlyphSymbolPointSize_sBehavior_0 = 0x4030000000000000;
}

- (NSDirectionalEdgeInsets)collaborationOptionsPopoverInsets
{
  if (collaborationOptionsPopoverInsets_once != -1) {
    dispatch_once(&collaborationOptionsPopoverInsets_once, &__block_literal_global_667_0);
  }
  double v2 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_0;
  double v3 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_1;
  double v4 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_2;
  double v5 = *(double *)&collaborationOptionsPopoverInsets_sBehavior_3;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

void __52__CKUIBehaviorMac_collaborationOptionsPopoverInsets__block_invoke()
{
  collaborationOptionsPopoverInsets_sBehavior_0 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_1 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_2 = 0x4028000000000000;
  collaborationOptionsPopoverInsets_sBehavior_3 = 0x4028000000000000;
}

- (UIEdgeInsets)sendLaterEditViewInsets
{
  if (sendLaterEditViewInsets_once != -1) {
    dispatch_once(&sendLaterEditViewInsets_once, &__block_literal_global_669_0);
  }
  double v2 = *(double *)&sendLaterEditViewInsets_sBehavior_0;
  double v3 = *(double *)&sendLaterEditViewInsets_sBehavior_1;
  double v4 = *(double *)&sendLaterEditViewInsets_sBehavior_2;
  double v5 = *(double *)&sendLaterEditViewInsets_sBehavior_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __42__CKUIBehaviorMac_sendLaterEditViewInsets__block_invoke()
{
  sendLaterEditViewInsets_sBehavior_0 = 0x402E000000000000;
  sendLaterEditViewInsets_sBehavior_1 = 0x4034000000000000;
  sendLaterEditViewInsets_sBehavior_2 = 0x4034000000000000;
  sendLaterEditViewInsets_sBehavior_3 = 0x4034000000000000;
}

@end