@interface CKUIBehaviorPad
- (BOOL)canPresentOverKeyboard;
- (BOOL)canShowContactPhotosInConversationList;
- (BOOL)isAppStripInKeyboard;
- (BOOL)keyboardSizeDeterminesAppCardDetentHeight;
- (BOOL)lowClearanceInLandscape;
- (BOOL)photoPickerShouldZoomOnSelection;
- (BOOL)presentForwardingUIModally;
- (BOOL)presentsAutocompleteInAPopover;
- (BOOL)presentsQuickLookController;
- (BOOL)shouldAlignRecipientGlyphsWithMargins;
- (BOOL)shouldPopoverSuggestionsBanner;
- (BOOL)shouldRefreshAlternateAddressesSheet;
- (BOOL)shouldShowDisclosureChevronInRecipientAtoms;
- (BOOL)shouldSuppressRotationInNewCompose;
- (BOOL)showMMSSetup;
- (BOOL)showPendingInConversationList;
- (BOOL)showsConversationListCellChevronImage;
- (BOOL)supportsEntryViewPlusButtonLongPress;
- (BOOL)usesPopovers;
- (BOOL)usesUncollapsedSplitview;
- (CGSize)attachmentBrowserDefaultSizeForSquare;
- (CGSize)detonatedItemBalloonViewSize;
- (CGSize)detonatedItemDocumentIconSize;
- (CGSize)documentIconSize;
- (UIEdgeInsets)contactPhotoTranscriptInsets;
- (UIEdgeInsets)defaultAVPlayerViewContorllerControlsInsets;
- (UIEdgeInsets)minTranscriptMarginInsets;
- (double)appDrawerTitleIconHeight;
- (double)appDrawerTitleIconWidth;
- (double)attachmentBrowserGridInterItemSpacing;
- (double)conversationListMinimumWidthForHiddenContactImage;
- (double)conversationListWidthForInterfaceOrientation:(int64_t)a3;
- (double)defaultNavigationBarNoContactPhotoCollapsedHeightValue;
- (double)entryViewMaxHandWritingPluginShelfHeight;
- (double)photoPickerMaxPopoverPhotoHeight;
- (double)photoPickerPopoverWidth;
- (double)previewMaxWidth;
- (double)searchLinksThumbnailWidth;
- (double)searchPhotosThumbnailWidth;
- (double)transcriptContactImageDiameter;
- (double)transcriptHeaderViewMaxRows;
- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant;
- (id)fullscreenPickerActionLayoutAxisPrioritiesForWidth:(double)a3;
- (int64_t)groupRecipientSelectionPresentationStyle;
- (unint64_t)browserViewControllerSheetDetentStyle;
- (unint64_t)defaultConversationViewingMessageCount;
- (unint64_t)numberOfButtonsInPhotoPicker;
- (unint64_t)suggestedAppStripLimit;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation CKUIBehaviorPad

- (BOOL)usesUncollapsedSplitview
{
  if (usesUncollapsedSplitview_once_5722 != -1) {
    dispatch_once(&usesUncollapsedSplitview_once_5722, &__block_literal_global_5724);
  }
  return usesUncollapsedSplitview_sBehavior_5721;
}

void __43__CKUIBehaviorPad_usesUncollapsedSplitview__block_invoke()
{
  usesUncollapsedSplitview_sBehavior_5721 = 1;
}

- (BOOL)shouldSuppressRotationInNewCompose
{
  if (shouldSuppressRotationInNewCompose_once_5726 != -1) {
    dispatch_once(&shouldSuppressRotationInNewCompose_once_5726, &__block_literal_global_5728);
  }
  return 0;
}

- (BOOL)lowClearanceInLandscape
{
  if (lowClearanceInLandscape_once_5730 != -1) {
    dispatch_once(&lowClearanceInLandscape_once_5730, &__block_literal_global_5732);
  }
  return 0;
}

- (BOOL)usesPopovers
{
  if (usesPopovers_once_5734 != -1) {
    dispatch_once(&usesPopovers_once_5734, &__block_literal_global_5736);
  }
  return usesPopovers_sBehavior_5733;
}

void __31__CKUIBehaviorPad_usesPopovers__block_invoke()
{
  usesPopovers_sBehavior_5733 = 1;
}

- (BOOL)canPresentOverKeyboard
{
  if (canPresentOverKeyboard_once_5738 != -1) {
    dispatch_once(&canPresentOverKeyboard_once_5738, &__block_literal_global_5740);
  }
  return 0;
}

- (BOOL)keyboardSizeDeterminesAppCardDetentHeight
{
  if (keyboardSizeDeterminesAppCardDetentHeight_once_5742 != -1) {
    dispatch_once(&keyboardSizeDeterminesAppCardDetentHeight_once_5742, &__block_literal_global_5744);
  }
  return 0;
}

- (BOOL)presentsQuickLookController
{
  if (presentsQuickLookController_once_5746 != -1) {
    dispatch_once(&presentsQuickLookController_once_5746, &__block_literal_global_5748);
  }
  return presentsQuickLookController_sBehavior_5745;
}

void __46__CKUIBehaviorPad_presentsQuickLookController__block_invoke()
{
  presentsQuickLookController_sBehavior_5745 = 1;
}

- (BOOL)presentForwardingUIModally
{
  if (presentForwardingUIModally_once_5750 != -1) {
    dispatch_once(&presentForwardingUIModally_once_5750, &__block_literal_global_5752);
  }
  return 0;
}

- (double)transcriptHeaderViewMaxRows
{
  if (transcriptHeaderViewMaxRows_once_5754 != -1) {
    dispatch_once(&transcriptHeaderViewMaxRows_once_5754, &__block_literal_global_5756);
  }
  return *(double *)&transcriptHeaderViewMaxRows_sBehavior_5753;
}

void __46__CKUIBehaviorPad_transcriptHeaderViewMaxRows__block_invoke()
{
  transcriptHeaderViewMaxRows_sBehavior_5753 = 0x4012000000000000;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (supportedInterfaceOrientations_once_5758 != -1) {
    dispatch_once(&supportedInterfaceOrientations_once_5758, &__block_literal_global_5760);
  }
  if (supportedInterfaceOrientations_sBehavior_5757) {
    return 30;
  }
  else {
    return 0;
  }
}

void __49__CKUIBehaviorPad_supportedInterfaceOrientations__block_invoke()
{
  supportedInterfaceOrientations_sBehavior_5757 = 1;
}

- (BOOL)showMMSSetup
{
  if (showMMSSetup_once_5762 != -1) {
    dispatch_once(&showMMSSetup_once_5762, &__block_literal_global_5764);
  }
  return 0;
}

- (unint64_t)defaultConversationViewingMessageCount
{
  if (defaultConversationViewingMessageCount_once_5766 != -1) {
    dispatch_once(&defaultConversationViewingMessageCount_once_5766, &__block_literal_global_5768);
  }
  if (defaultConversationViewingMessageCount_sBehavior_5765) {
    return 50;
  }
  else {
    return 0;
  }
}

void __57__CKUIBehaviorPad_defaultConversationViewingMessageCount__block_invoke()
{
  defaultConversationViewingMessageCount_sBehavior_5765 = 1;
}

- (double)defaultNavigationBarNoContactPhotoCollapsedHeightValue
{
  return 50.0;
}

- (unint64_t)browserViewControllerSheetDetentStyle
{
  return 2;
}

- (double)conversationListWidthForInterfaceOrientation:(int64_t)a3
{
  double result = 320.0;
  if ((unint64_t)(a3 - 1) >= 2) {
    double result = 0.0;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    return 375.0;
  }
  return result;
}

- (BOOL)showPendingInConversationList
{
  if (showPendingInConversationList_once_5770 != -1) {
    dispatch_once(&showPendingInConversationList_once_5770, &__block_literal_global_5772);
  }
  return showPendingInConversationList_sBehavior_5769;
}

void __48__CKUIBehaviorPad_showPendingInConversationList__block_invoke()
{
  showPendingInConversationList_sBehavior_5769 = 1;
}

- (BOOL)canShowContactPhotosInConversationList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CKUIBehaviorPad_canShowContactPhotosInConversationList__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (canShowContactPhotosInConversationList_once_5774 != -1) {
    dispatch_once(&canShowContactPhotosInConversationList_once_5774, block);
  }
  return canShowContactPhotosInConversationList_sBehavior_5773;
}

uint64_t __57__CKUIBehaviorPad_canShowContactPhotosInConversationList__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) conversationListCellUsesLargeTextLayout];
  canShowContactPhotosInConversationList_sBehavior_5773 = result ^ 1;
  return result;
}

- (BOOL)showsConversationListCellChevronImage
{
  if (showsConversationListCellChevronImage_once_5776 != -1) {
    dispatch_once(&showsConversationListCellChevronImage_once_5776, &__block_literal_global_5778);
  }
  return showsConversationListCellChevronImage_sBehavior_5775;
}

void __56__CKUIBehaviorPad_showsConversationListCellChevronImage__block_invoke()
{
  showsConversationListCellChevronImage_sBehavior_5775 = 1;
}

- (double)conversationListMinimumWidthForHiddenContactImage
{
  if (conversationListMinimumWidthForHiddenContactImage_once_5780 != -1) {
    dispatch_once(&conversationListMinimumWidthForHiddenContactImage_once_5780, &__block_literal_global_5782);
  }
  return *(double *)&conversationListMinimumWidthForHiddenContactImage_sBehavior_5779;
}

void __68__CKUIBehaviorPad_conversationListMinimumWidthForHiddenContactImage__block_invoke()
{
  conversationListMinimumWidthForHiddenContactImage_sBehavior_5779 = 0x4073F00000000000;
}

- (double)previewMaxWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CKUIBehaviorPad_previewMaxWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (previewMaxWidth_once_5784 != -1) {
    dispatch_once(&previewMaxWidth_once_5784, block);
  }
  return *(double *)&previewMaxWidth_sBehavior_5783;
}

double __34__CKUIBehaviorPad_previewMaxWidth__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CKUIBehaviorPad;
  objc_msgSendSuper2(&v3, sel_previewMaxWidth);
  double result = fmin(v1, 300.0);
  previewMaxWidth_sBehavior_5783 = *(void *)&result;
  return result;
}

- (double)transcriptContactImageDiameter
{
  if (transcriptContactImageDiameter_once_5788 != -1) {
    dispatch_once(&transcriptContactImageDiameter_once_5788, &__block_literal_global_5790);
  }
  return *(double *)&transcriptContactImageDiameter_sBehavior_5787;
}

void __49__CKUIBehaviorPad_transcriptContactImageDiameter__block_invoke()
{
  transcriptContactImageDiameter_sBehavior_5787 = 0x4041000000000000;
}

- (UIEdgeInsets)contactPhotoTranscriptInsets
{
  if (contactPhotoTranscriptInsets_once != -1) {
    dispatch_once(&contactPhotoTranscriptInsets_once, &__block_literal_global_5793);
  }
  double v3 = *((double *)&contactPhotoTranscriptInsets_sBehavior_5791 + 1);
  double v2 = *(double *)&contactPhotoTranscriptInsets_sBehavior_5791;
  double v4 = *(double *)&qword_1E9250310;
  double v5 = unk_1E9250318;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

__n128 __47__CKUIBehaviorPad_contactPhotoTranscriptInsets__block_invoke()
{
  __n128 result = *(__n128 *)MEMORY[0x1E4F437F8];
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  contactPhotoTranscriptInsets_sBehavior_5791 = *MEMORY[0x1E4F437F8];
  *(_OWORD *)&qword_1E9250310 = v1;
  return result;
}

- (UIEdgeInsets)minTranscriptMarginInsets
{
  if (minTranscriptMarginInsets_once_5795 != -1) {
    dispatch_once(&minTranscriptMarginInsets_once_5795, &__block_literal_global_5797);
  }
  double v2 = *(double *)&minTranscriptMarginInsets_sBehavior_5794_1;
  double v3 = *(double *)&minTranscriptMarginInsets_sBehavior_5794_3;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __44__CKUIBehaviorPad_minTranscriptMarginInsets__block_invoke()
{
  minTranscriptMarginInsets_sBehavior_5794_1 = 0x4034000000000000;
  minTranscriptMarginInsets_sBehavior_5794_3 = 0x4034000000000000;
}

- (UIEdgeInsets)defaultAVPlayerViewContorllerControlsInsets
{
  if (defaultAVPlayerViewContorllerControlsInsets_once_5799 != -1) {
    dispatch_once(&defaultAVPlayerViewContorllerControlsInsets_once_5799, &__block_literal_global_5801);
  }
  double v2 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_0;
  double v3 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_1;
  double v4 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_2;
  double v5 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __62__CKUIBehaviorPad_defaultAVPlayerViewContorllerControlsInsets__block_invoke()
{
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_0 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_1 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_2 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_5798_3 = 0x4020000000000000;
}

- (CGSize)documentIconSize
{
  if (documentIconSize_once_5803 != -1) {
    dispatch_once(&documentIconSize_once_5803, &__block_literal_global_5805);
  }
  double v2 = *(double *)&documentIconSize_sBehavior_5802_0;
  double v3 = *(double *)&documentIconSize_sBehavior_5802_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __35__CKUIBehaviorPad_documentIconSize__block_invoke()
{
  documentIconSize_sBehavior_5802_0 = 0x4050000000000000;
  documentIconSize_sBehavior_5802_1 = 0x4050000000000000;
}

- (BOOL)shouldShowDisclosureChevronInRecipientAtoms
{
  if (shouldShowDisclosureChevronInRecipientAtoms_once_5807 != -1) {
    dispatch_once(&shouldShowDisclosureChevronInRecipientAtoms_once_5807, &__block_literal_global_5809);
  }
  return 0;
}

- (BOOL)shouldRefreshAlternateAddressesSheet
{
  if (shouldRefreshAlternateAddressesSheet_once_5811 != -1) {
    dispatch_once(&shouldRefreshAlternateAddressesSheet_once_5811, &__block_literal_global_5813);
  }
  return shouldRefreshAlternateAddressesSheet_sBehavior_5810;
}

void __55__CKUIBehaviorPad_shouldRefreshAlternateAddressesSheet__block_invoke()
{
  shouldRefreshAlternateAddressesSheet_sBehavior_5810 = 1;
}

- (BOOL)presentsAutocompleteInAPopover
{
  if (presentsAutocompleteInAPopover_once_5815 != -1) {
    dispatch_once(&presentsAutocompleteInAPopover_once_5815, &__block_literal_global_5817);
  }
  return 0;
}

- (BOOL)isAppStripInKeyboard
{
  if (isAppStripInKeyboard_once_5819 != -1) {
    dispatch_once(&isAppStripInKeyboard_once_5819, &__block_literal_global_5821);
  }
  return 0;
}

- (BOOL)supportsEntryViewPlusButtonLongPress
{
  if (supportsEntryViewPlusButtonLongPress_once_5823 != -1) {
    dispatch_once(&supportsEntryViewPlusButtonLongPress_once_5823, &__block_literal_global_5825);
  }
  return supportsEntryViewPlusButtonLongPress_sBehavior_5822;
}

void __55__CKUIBehaviorPad_supportsEntryViewPlusButtonLongPress__block_invoke()
{
  supportsEntryViewPlusButtonLongPress_sBehavior_5822 = 1;
}

- (double)entryViewMaxHandWritingPluginShelfHeight
{
  if (entryViewMaxHandWritingPluginShelfHeight_once_5827 != -1) {
    dispatch_once(&entryViewMaxHandWritingPluginShelfHeight_once_5827, &__block_literal_global_5829);
  }
  return *(double *)&entryViewMaxHandWritingPluginShelfHeight_sBehavior_5826;
}

void __59__CKUIBehaviorPad_entryViewMaxHandWritingPluginShelfHeight__block_invoke()
{
  if (CKIsBigIdiom_onceToken != -1) {
    dispatch_once(&CKIsBigIdiom_onceToken, &__block_literal_global_5993);
  }
  double v0 = 135.0;
  if (!CKIsBigIdiom_sBig) {
    double v0 = 128.0;
  }
  entryViewMaxHandWritingPluginShelfHeight_sBehavior_5826 = *(void *)&v0;
}

- (CGSize)attachmentBrowserDefaultSizeForSquare
{
  if (attachmentBrowserDefaultSizeForSquare_once_5831 != -1) {
    dispatch_once(&attachmentBrowserDefaultSizeForSquare_once_5831, &__block_literal_global_5833);
  }
  double v2 = *(double *)&attachmentBrowserDefaultSizeForSquare_sBehavior_5830_0;
  double v3 = *(double *)&attachmentBrowserDefaultSizeForSquare_sBehavior_5830_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __56__CKUIBehaviorPad_attachmentBrowserDefaultSizeForSquare__block_invoke()
{
  attachmentBrowserDefaultSizeForSquare_sBehavior_5830_0 = 0x405A000000000000;
  attachmentBrowserDefaultSizeForSquare_sBehavior_5830_1 = 0x405A000000000000;
}

- (double)attachmentBrowserGridInterItemSpacing
{
  if (attachmentBrowserGridInterItemSpacing_once_5835 != -1) {
    dispatch_once(&attachmentBrowserGridInterItemSpacing_once_5835, &__block_literal_global_5837);
  }
  return *(double *)&attachmentBrowserGridInterItemSpacing_sBehavior_5834;
}

void __56__CKUIBehaviorPad_attachmentBrowserGridInterItemSpacing__block_invoke()
{
  attachmentBrowserGridInterItemSpacing_sBehavior_5834 = 0x4010000000000000;
}

- (double)photoPickerPopoverWidth
{
  if (photoPickerPopoverWidth_once_5839 != -1) {
    dispatch_once(&photoPickerPopoverWidth_once_5839, &__block_literal_global_5841);
  }
  return *(double *)&photoPickerPopoverWidth_sBehavior_5838;
}

void __42__CKUIBehaviorPad_photoPickerPopoverWidth__block_invoke()
{
  photoPickerPopoverWidth_sBehavior_5838 = 0x4079000000000000;
}

- (unint64_t)numberOfButtonsInPhotoPicker
{
  if (numberOfButtonsInPhotoPicker_once_5843 != -1) {
    dispatch_once(&numberOfButtonsInPhotoPicker_once_5843, &__block_literal_global_5845);
  }
  if (numberOfButtonsInPhotoPicker_sBehavior_5842) {
    return 2;
  }
  else {
    return 0;
  }
}

void __47__CKUIBehaviorPad_numberOfButtonsInPhotoPicker__block_invoke()
{
  numberOfButtonsInPhotoPicker_sBehavior_5842 = 1;
}

- (BOOL)photoPickerShouldZoomOnSelection
{
  if (photoPickerShouldZoomOnSelection_once != -1) {
    dispatch_once(&photoPickerShouldZoomOnSelection_once, &__block_literal_global_5847);
  }
  return photoPickerShouldZoomOnSelection_sBehavior;
}

void __51__CKUIBehaviorPad_photoPickerShouldZoomOnSelection__block_invoke()
{
  photoPickerShouldZoomOnSelection_sBehavior = 1;
}

- (double)photoPickerMaxPopoverPhotoHeight
{
  if (photoPickerMaxPopoverPhotoHeight_once_5849 != -1) {
    dispatch_once(&photoPickerMaxPopoverPhotoHeight_once_5849, &__block_literal_global_5851);
  }
  return *(double *)&photoPickerMaxPopoverPhotoHeight_sBehavior_5848;
}

void __51__CKUIBehaviorPad_photoPickerMaxPopoverPhotoHeight__block_invoke()
{
  photoPickerMaxPopoverPhotoHeight_sBehavior_5848 = 0x4074A00000000000;
}

- (BOOL)shouldAlignRecipientGlyphsWithMargins
{
  if (shouldAlignRecipientGlyphsWithMargins_once_5853 != -1) {
    dispatch_once(&shouldAlignRecipientGlyphsWithMargins_once_5853, &__block_literal_global_5855);
  }
  return shouldAlignRecipientGlyphsWithMargins_sBehavior_5852;
}

void __56__CKUIBehaviorPad_shouldAlignRecipientGlyphsWithMargins__block_invoke()
{
  shouldAlignRecipientGlyphsWithMargins_sBehavior_5852 = 1;
}

- (int64_t)groupRecipientSelectionPresentationStyle
{
  if (groupRecipientSelectionPresentationStyle_once_5857 != -1) {
    dispatch_once(&groupRecipientSelectionPresentationStyle_once_5857, &__block_literal_global_5859);
  }
  if (groupRecipientSelectionPresentationStyle_sBehavior_5856) {
    return 2;
  }
  else {
    return 0;
  }
}

void __59__CKUIBehaviorPad_groupRecipientSelectionPresentationStyle__block_invoke()
{
  groupRecipientSelectionPresentationStyle_sBehavior_5856 = 1;
}

- (id)fullscreenPickerActionLayoutAxisPrioritiesForWidth:(double)a3
{
  if (a3 >= 550.0)
  {
    double v3 = &unk_1EDF153E0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorPad;
    double v3 = [(CKUIBehavior *)&v5 fullscreenPickerActionLayoutAxisPrioritiesForWidth:sel_fullscreenPickerActionLayoutAxisPrioritiesForWidth_];
  }

  return v3;
}

- (double)searchPhotosThumbnailWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CKUIBehaviorPad_searchPhotosThumbnailWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (searchPhotosThumbnailWidth_once_5867 != -1) {
    dispatch_once(&searchPhotosThumbnailWidth_once_5867, block);
  }
  return *(double *)&searchPhotosThumbnailWidth_sBehavior_5866;
}

double __45__CKUIBehaviorPad_searchPhotosThumbnailWidth__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) maxConversationListWidth];
  double result = v1 * 0.5;
  searchPhotosThumbnailWidth_sBehavior_5866 = *(void *)&result;
  return result;
}

- (double)searchLinksThumbnailWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CKUIBehaviorPad_searchLinksThumbnailWidth__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (searchLinksThumbnailWidth_once_5869 != -1) {
    dispatch_once(&searchLinksThumbnailWidth_once_5869, block);
  }
  return *(double *)&searchLinksThumbnailWidth_sBehavior_5868;
}

uint64_t __44__CKUIBehaviorPad_searchLinksThumbnailWidth__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) maxConversationListWidth];
  searchLinksThumbnailWidth_sBehavior_5868 = v2;
  return result;
}

- (unint64_t)suggestedAppStripLimit
{
  if (suggestedAppStripLimit_once_5871 != -1) {
    dispatch_once(&suggestedAppStripLimit_once_5871, &__block_literal_global_5873);
  }
  if (suggestedAppStripLimit_sBehavior_5870) {
    return 30;
  }
  else {
    return 0;
  }
}

void __41__CKUIBehaviorPad_suggestedAppStripLimit__block_invoke()
{
  suggestedAppStripLimit_sBehavior_5870 = 1;
}

- (double)appDrawerTitleIconHeight
{
  if (appDrawerTitleIconHeight_once != -1) {
    dispatch_once(&appDrawerTitleIconHeight_once, &__block_literal_global_5875);
  }
  return *(double *)&appDrawerTitleIconHeight_sBehavior;
}

void __43__CKUIBehaviorPad_appDrawerTitleIconHeight__block_invoke()
{
  appDrawerTitleIconHeight_sBehavior = 0x4040000000000000;
}

- (double)appDrawerTitleIconWidth
{
  if (appDrawerTitleIconWidth_once != -1) {
    dispatch_once(&appDrawerTitleIconWidth_once, &__block_literal_global_5877);
  }
  return *(double *)&appDrawerTitleIconWidth_sBehavior;
}

void __42__CKUIBehaviorPad_appDrawerTitleIconWidth__block_invoke()
{
  appDrawerTitleIconWidth_sBehavior = 0x4045000000000000;
}

- (BOOL)shouldPopoverSuggestionsBanner
{
  return 0;
}

- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant
{
  return 45.0;
}

- (CGSize)detonatedItemBalloonViewSize
{
  if (detonatedItemBalloonViewSize_once_5879 != -1) {
    dispatch_once(&detonatedItemBalloonViewSize_once_5879, &__block_literal_global_5881);
  }
  double v2 = *(double *)&detonatedItemBalloonViewSize_sBehavior_5878_0;
  double v3 = *(double *)&detonatedItemBalloonViewSize_sBehavior_5878_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __47__CKUIBehaviorPad_detonatedItemBalloonViewSize__block_invoke()
{
  detonatedItemBalloonViewSize_sBehavior_5878_0 = 0x4064000000000000;
  detonatedItemBalloonViewSize_sBehavior_5878_1 = 0x405E000000000000;
}

- (CGSize)detonatedItemDocumentIconSize
{
  if (detonatedItemDocumentIconSize_once_5883 != -1) {
    dispatch_once(&detonatedItemDocumentIconSize_once_5883, &__block_literal_global_5885);
  }
  double v2 = *(double *)&detonatedItemDocumentIconSize_sBehavior_5882_0;
  double v3 = *(double *)&detonatedItemDocumentIconSize_sBehavior_5882_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorPad_detonatedItemDocumentIconSize__block_invoke()
{
  detonatedItemDocumentIconSize_sBehavior_5882_0 = 0x404B000000000000;
  detonatedItemDocumentIconSize_sBehavior_5882_1 = 0x404E000000000000;
}

@end