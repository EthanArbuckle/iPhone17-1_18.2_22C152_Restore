@interface RCRecorderStyleProvider
+ (id)sharedStyleProvider;
- (BOOL)_isCompactWidth;
- (BOOL)_isIOSMac;
- (BOOL)_isIpad;
- (BOOL)_isIpadOrIOSMac;
- (BOOL)_isIphone;
- (BOOL)_isLandscape;
- (BOOL)_isPortrait;
- (BOOL)_isVibrantUIOrIOSMac;
- (BOOL)_isWatch;
- (BOOL)_isWideIPad;
- (BOOL)_isWideIpadOrIOSMac;
- (BOOL)_usesVibrantUI;
- (BOOL)allowsInteractiveCardSizing;
- (BOOL)animatesRecordingCardPresentation;
- (BOOL)appIsRightToLeft;
- (BOOL)expandsTableViewRowOnSelection;
- (BOOL)explicitlyScrollsToTableViewRowOnSelection;
- (BOOL)folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle;
- (BOOL)folderSelectionCollectionViewNeedsDisclosureAccessory;
- (BOOL)folderSelectionCollectionViewShowsSeparators;
- (BOOL)hasPlaybackCard;
- (BOOL)isAccessibilityLargerTextSizeEnabled;
- (BOOL)libraryCellAlwaysHasClearBackgroundColor;
- (BOOL)librarySupportsBlueCellSelectionStyle;
- (BOOL)needsLocalizedSymbolImageWorkaround;
- (BOOL)needsTouchDownWorkaround;
- (BOOL)presentsTitleAndAdditionalEditingControlsInPlaybackCard;
- (BOOL)presentsTitleAndAdditionalEditingControlsInRecordingCard;
- (BOOL)setSplitViewHorizontalSizeClass:(int64_t)a3;
- (BOOL)showsEmptyLibraryMessageInLibrary;
- (BOOL)showsGradientsInBottomOfCardView;
- (BOOL)showsProgressInTableViewCell;
- (BOOL)sidebarCollectionViewNeedsDisclosureAccessory;
- (BOOL)sidebarCollectionViewShowsSeparators;
- (BOOL)sidebarPresentsWithGesture;
- (BOOL)supportsCompactRecordingCard;
- (BOOL)supportsDisplaceSplitBehavior;
- (BOOL)supportsSheetPresentationSPI;
- (BOOL)transportButtonsAnimateWithCircle;
- (BOOL)usesLargeTitles;
- (BOOL)usesNavBarLargeTitleAndSearchBarHosting;
- (BOOL)usesSplitBehavior;
- (BOOL)usesVectorGlyph;
- (CGSize)actionMenuImageSize;
- (CGSize)centerClusterControlSize;
- (CGSize)centerClusterControlSizeRecentlyDeleted;
- (CGSize)doneCancelButtonRightSize;
- (CGSize)playbackSpeedSliderTickSize;
- (CGSize)trimDeleteButtonLeftSize;
- (NSDirectionalEdgeInsets)playbackSettingsButtonContentInsets;
- (RCDateFormatter)dateFormatter;
- (UIEdgeInsets)playbackViewEdgeInsets;
- (UIEdgeInsets)playbackViewFullScreenEdgeInsets;
- (UIEdgeInsets)playbackViewTitleTextInsets;
- (double)actionButtonExtraXAxisActiveWidth;
- (double)animationDragCoefficient;
- (double)annotationViewHeight;
- (double)beginEndLabelsTopPadding;
- (double)borderLayerThickness;
- (double)bottomAccessoryDescriptionHeight;
- (double)bottomAccessoryWaveformHeight;
- (double)cancelButtonBottomAlignmentOffset;
- (double)centerClusterWidthCard;
- (double)centerClusterWidthJumpButton;
- (double)centerClusterWidthLibrary;
- (double)compactStylePlayheadMultiplier;
- (double)compactStyleTimeBarDefaultHeight;
- (double)compactStyleTimeBarHeightInset;
- (double)compactWaveformWaveVerticalPadding;
- (double)dateDurationLabelLockScreenVerticalPadding;
- (double)dateLabelLockScreenHorizontalPadding;
- (double)descriptionCompactViewTitleToSecondaryPadding;
- (double)descriptionViewCreationDateInfoLabelXOffset;
- (double)descriptionViewCreationDurationInfoLabelXOffset;
- (double)descriptionViewSecondaryLabelAlpha;
- (double)descriptionViewSecondaryLabelsTopMargin;
- (double)descriptionViewTitleToSecondaryPadding;
- (double)dimDescriptionViewAnimationDuration;
- (double)doneEditingButtonSidePadding;
- (double)durationLabelLockScreenHorizontalPadding;
- (double)editButtonContentLeftRightPadding;
- (double)editButtonContentTopBottomPadding;
- (double)editButtonImageTitlePadding;
- (double)editRecordingButtonCornerRadius;
- (double)editToolbarButtonHorizontalInset;
- (double)editToolbarButtonTopInset;
- (double)editToolbarCompactHeight;
- (double)editToolbarHeight;
- (double)editToolbarTitleTopInset;
- (double)editTrimToolbarButtonTopInset;
- (double)editingProgressIndicatorDiameterCell;
- (double)editingProgressIndicatorDiameterPlayback;
- (double)editingProgressOuterRingThicknessCell;
- (double)editingProgressOuterRingThicknessPlayback;
- (double)emptyLibraryLabelXInset;
- (double)folderSelectionCollectionViewTopPadding;
- (double)fullScreenDescriptionHeight;
- (double)inOutButtonCornerRadius;
- (double)jumpBackwardForwardButtonSpacing;
- (double)knobWidthMultiplier;
- (double)libraryCellDescriptionHeight;
- (double)libraryCellDescriptionViewShuttleBarPadding;
- (double)libraryCellShuttleBarHeight;
- (double)libraryCellSliderAndControlsVerticalStackViewSpacing;
- (double)librarySelectedMoreAndTrashButtonPadding;
- (double)maximumDecibelDisplayRange;
- (double)maximumPrimaryColumnWidth;
- (double)maximumSupplementaryColumnWidth;
- (double)minimumDecibelDisplayRange;
- (double)minimumPrimaryColumnWidth;
- (double)minimumSecondaryColumnWidth;
- (double)minimumSupplementaryColumnWidth;
- (double)overviewKnobWidthMultiplier;
- (double)overviewPlayheadHeightInset;
- (double)overviewPlayheadWidthMultiplier;
- (double)overviewWaveformCornerRadius;
- (double)overviewWaveformHeight;
- (double)overviewWaveformHorizontalSpacing;
- (double)overviewWaveformMinimumDurationToDisplayWhenRecording;
- (double)overviewWaveformWaveVerticalPadding;
- (double)overviewWaveformWaveWidth;
- (double)playbackSettingsButtonCornerRadius;
- (double)playbackSettingsButtonExtraActivePoints;
- (double)playbackSettingsCollectionViewCellMinHeight;
- (double)playbackSettingsCollectionViewContentInsetBottom;
- (double)playbackSettingsPopoverBottomPadding;
- (double)playbackSpeedSliderHeight;
- (double)playbackSpeedSliderTickCornerRadius;
- (double)playbackViewControlSectionHeight;
- (double)playbackViewCornerRadius;
- (double)playbackViewShuttleBarWidth;
- (double)playbackViewTimeLabelYOffset;
- (double)playbackViewTimeSectionBottomPadding;
- (double)playbackViewTimeSectionHeight;
- (double)playbackViewTopPadding;
- (double)playbackViewVerticalSpacingAboveOverviewWaveform;
- (double)playbackViewVerticalSpacingBelowOverviewWaveform;
- (double)playbackViewWaveformOverviewSidePadding;
- (double)playbackViewWidthToCollapseToolbarButtons;
- (double)playheadWidthMultiplier;
- (double)positionReadoutHeight;
- (double)positionReadoutLabelYOffset;
- (double)presentedViewsMinimumWidth;
- (double)primaryColumnWidth;
- (double)progressTextFontSize;
- (double)progressTextYSpacing;
- (double)progressViewDisplayDismissTime;
- (double)recentlyDeletedToolbarDivdiderHeight;
- (double)recentlyDeletedToolbarDivdiderInset;
- (double)recordingControlAlphaWhenPressed;
- (double)recordingControlAnimationDuration;
- (double)recordingControlDiameter;
- (double)recordingControlExtraHitOutset;
- (double)recordingControlHeight;
- (double)recordingControlHorizontalOffset;
- (double)recordingControlInnerSquareWidth;
- (double)recordingControlLockScreenPadding;
- (double)recordingControlLozengeFixedWidth;
- (double)recordingControlOuterRingGap;
- (double)recordingControlOuterRingThickness;
- (double)recordingControlPauseGap;
- (double)recordingControlPauseStrokeCornerRadius;
- (double)recordingControlSectionHeight;
- (double)recordingControlSquareCornerRadius;
- (double)recordingNameLabelPadding;
- (double)recordingSectionBottomPadding;
- (double)recordingSectionDoneButtonDisabledOpacity;
- (double)recordingViewSpaceBetweenToolbarAndDescriptionView;
- (double)recordingViewWaveformOverviewSidePadding;
- (double)recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview;
- (double)recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview;
- (double)selectionBarWidth;
- (double)selectionDimOverlayAlpha;
- (double)selectionHighlightToKnobInset;
- (double)selectionHitTestSlop;
- (double)selectionKnobRadius;
- (double)selectionLightOverlayAlpha;
- (double)selectionMiddleTimeBaselineInset;
- (double)selectionOverlayAlpha;
- (double)selectionOverlayBorderWidth;
- (double)selectionTimeBaseLineOffset;
- (double)selectionTimeInsetNormal;
- (double)selectionTimeInsetWhenSelected;
- (double)selectionTimeMinOffset;
- (double)shuttleBarAdditionalSliderSpacingLibrary;
- (double)shuttleBarButtonContainerHeightCard;
- (double)shuttleBarButtonContainerHeightLibrary;
- (double)shuttleBarHeight;
- (double)shuttleBarShouldForceProportionalDistribution;
- (double)sidebarCollectionViewCellAXHyphenationFactor;
- (double)sidebarCollectionViewTopPadding;
- (double)splitViewSeparatorWidth;
- (double)tableViewAlphaWhenDisabled;
- (double)tableViewAnimationDuration;
- (double)timeDisplayLabelLockScreenPadding;
- (double)timeLineMajorTickHeight;
- (double)timeLineMinorTickHeight;
- (double)timeLineTickWidth;
- (double)titleLabelLockScreenTopPaddingMultiplier;
- (double)topMarginForCardView;
- (double)topMarginMinSafeAreaTopInsetForCardView;
- (double)topScreenSpacerHeight;
- (double)transportButtonAnimationDuration;
- (double)transportButtonAnimationJumpCircleRadius;
- (double)transportButtonAnimationPlayCircleRadius;
- (double)transportButtonAnimationShrinkFactor;
- (double)trimDeleteButtonCornerRadius;
- (double)trimDeleteButtonLeftPaddingDistance;
- (double)virtualNavBarButtonExtraSpaceItemSpacing;
- (double)virtualNavBarButtonItemSpacing;
- (double)virtualNavBarWidthInset;
- (double)waveformHorizontalSpacing;
- (double)waveformLockScreenBottomPadding;
- (double)waveformLockScreenTopPadding;
- (double)waveformVerticalHeightReduction;
- (double)waveformVerticalOffset;
- (double)waveformViewBottomPadding;
- (double)waveformViewRightPadding;
- (double)waveformViewTopPadding;
- (double)waveformViewleftPadding;
- (double)waveformWaveVerticalPadding;
- (double)waveformWaveWidth;
- (id)_gobackwardSystemImage;
- (id)_goforwardSystemImage;
- (id)_roundedThemePrimaryBackgroundColor;
- (id)accessibilityLargeSizes;
- (id)actionControlsColorForPlaybackCard;
- (id)activityImageSymbolConfiguration;
- (id)backgroundColor;
- (id)beginEndLabelsColor;
- (id)cardGoBackwardImage;
- (id)cardGoForwardImage;
- (id)cardPauseImage;
- (id)cardPlayImage;
- (id)createNewFolderImage;
- (id)creationDateLabelFont;
- (id)creationDateLabelFontForTableViewCell;
- (id)deleteContextMenuButtonImage;
- (id)descriptionViewScalableSecondaryFont;
- (id)descriptionViewScalableTitleFontForCardView;
- (id)descriptionViewScalableTitleFontForTableViewCell;
- (id)durationLabelFont;
- (id)durationLabelFontForCompactRecordingView;
- (id)editButtonImage;
- (id)editingControlButtonLabelFont;
- (id)editingToolbarButtonDisabledTextColor;
- (id)editingToolbarButtonTextColor;
- (id)editingToolbarCancelButtonLabelFont;
- (id)editingToolbarImageSymbolConfiguration;
- (id)editingToolbarSaveButtonLabelFont;
- (id)editingToolbarTitleLabelFont;
- (id)editingToolbarTitleTextColor;
- (id)ellipsisCircleImage;
- (id)ellipsisImage;
- (id)emptyLibraryBackgroundColor:(BOOL)a3;
- (id)emptyLibraryMessageTextColor:(BOOL)a3;
- (id)emptyLibraryTextScalableSecondaryFont;
- (id)expandCompactRecordingCardPropertyAnimator;
- (id)favoriteImage;
- (id)favoriteImageName;
- (id)filledMoveToFolderImage;
- (id)folderSelectionCollectionViewBackgroundColor;
- (id)folderSelectionCollectionViewCellColor;
- (id)folderSelectionNavBarNewFolderImageTintColor;
- (id)footerViewBackgroundColor;
- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4;
- (id)inOutButtonBackgroundColor;
- (id)inOutButtonTextColor;
- (id)libraryGoBackwardImage;
- (id)libraryGoForwardImage;
- (id)libraryPauseImage;
- (id)libraryPlayImage;
- (id)mainLabelColor;
- (id)mainViewBackgroundColor;
- (id)maxTrackTintColor:(BOOL)a3;
- (id)minTrackTintColor:(BOOL)a3;
- (id)moveToFolderImage;
- (id)notFavoriteImage;
- (id)notFavoriteImageName;
- (id)playbackCardBottomGradientColor:(BOOL)a3;
- (id)playbackCardPrimaryLabelFontColor;
- (id)playbackCardSecondaryLabelFontColor;
- (id)playbackCardTimeLabelFontColor:(BOOL)a3;
- (id)playbackCardTopBorderColor1:(BOOL)a3;
- (id)playbackCardTopBorderColor2:(BOOL)a3;
- (id)playbackCardTopGradientColor:(BOOL)a3;
- (id)playbackPositionBarColor;
- (id)playbackPositionTimeColor;
- (id)playbackSettingsImage;
- (id)playbackSettingsToolbarButtonColor;
- (id)playbackSpeedRegularTrackColor;
- (id)playbackSpeedSliderImageColor;
- (id)playbackSpeedSliderMaximumValueImage;
- (id)playbackSpeedSliderMinimumValueImage;
- (id)playbackSpeedTintedTrackColor;
- (id)playbackViewBackgroundColor:(BOOL)a3;
- (id)playbackViewTimeLabelFont;
- (id)playbackViewToolbarImageSymbolConfiguration;
- (id)progressViewBackgroundColorTableViewCell:(BOOL)a3;
- (id)recentlyDeleteToolBarDividerColor;
- (id)recentlyDeletedNonDefaultButtonTextColor;
- (id)recordPositionBarColor;
- (id)recordingCardBackgroundColor;
- (id)recordingCardBottomAccessoryBackgroundColor;
- (id)recordingCardBottomGradientColor;
- (id)recordingCardDefaultBackgroundColor:(BOOL)a3;
- (id)recordingCardTimeLabelFontColor;
- (id)recordingCardTopBorderColor1;
- (id)recordingCardTopBorderColor2;
- (id)recordingCardTopGradientColor;
- (id)recordingControlFontColor;
- (id)recordingControlFontColorResume;
- (id)recordingControlInnerColor;
- (id)recordingControlInnerColorResume;
- (id)recordingControlOuterColor:(BOOL)a3;
- (id)recordingControlOuterColorResume;
- (id)recordingControlTextFont;
- (id)recordingSectionCancelButtonInnerColor;
- (id)recordingSectionDoneAndCancelButtonTextColor;
- (id)recordingSectionDoneButtonInnerColor;
- (id)recordingViewEffectsActiveBackgroundColor;
- (id)recordingViewEffectsInactiveBackgroundColor;
- (id)renameContextMenuButtonImage;
- (id)replaceSelectionOverlayColor;
- (id)secondaryTransportControlsColorForLibrary;
- (id)selectionOverlayColor;
- (id)selectionOverlayEndpointBarColor;
- (id)selectionOverlayEndpointTimeColor;
- (id)shareToolbarMenuImage;
- (id)shuttleBarImageSymbolConfiguration;
- (id)sidebarCollectionViewBackgroundColor;
- (id)sidebarCollectionViewCellDropTargetBackgroundColor;
- (id)sidebarNavBarNewFolderImageTintColor;
- (id)sliderThumbTintColor:(BOOL)a3;
- (id)splitViewSeparatorColor:(BOOL)a3;
- (id)standardInteractionTintColor;
- (id)swipeTrashImage;
- (id)tableViewBackgroundColor;
- (id)tableViewCellTextColor;
- (id)tableViewDoubleLineSeparatorColor;
- (id)tableViewEditButtonDimmedColor;
- (id)tableViewSelectedCellTextColor;
- (id)tableViewToolboxSeparatorColor;
- (id)timeLineLabelFont;
- (id)timeLineMajorPlaybackMarkerColor;
- (id)timeLineMinorPlaybackMarkerColor;
- (id)timeLineTimeColor;
- (id)timelinePlaybackBackgroundColor:(BOOL)a3;
- (id)timelinePlaybackTimeColor;
- (id)transportButtonAnimationCircleColor;
- (id)transportControlsColorForLibrary;
- (id)transportControlsColorForPlaybackCard:(BOOL)a3;
- (id)transportControlsColorForRecordingCard;
- (id)trashBottomToolbarImage;
- (id)trashImage;
- (id)trimButtonTintColor;
- (id)trimDeleteButtonBackgroundColor;
- (id)trimDeleteButtonFont;
- (id)trimDeleteButtonTextColor;
- (id)trimImage;
- (id)watchAppTintColor;
- (id)waveformCompactHighlightedBackgroundColor;
- (id)waveformPlaybackBackgroundColor:(BOOL)a3;
- (id)waveformPlaybackHighlightedBackgroundColor:(BOOL)a3;
- (id)waveformRecordingColor;
- (id)waveformStandardColor:(BOOL)a3;
- (id)windowHeaderSpacerViewBackgroundColor:(BOOL)a3;
- (int64_t)_horizontalSizeClassFromSplitView;
- (int64_t)cellEditingSelectionStyle;
- (int64_t)cellSelectionStyle;
- (int64_t)currentUserInterfaceStyle;
- (int64_t)folderSelectionCollectionViewListAppearance;
- (int64_t)sidebarCollectionViewListAppearance;
- (int64_t)tableViewAnimationCurve;
- (unint64_t)supportedInterfaceOrientations;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)set_horizontalSizeClassFromSplitView:(int64_t)a3;
@end

@implementation RCRecorderStyleProvider

+ (id)sharedStyleProvider
{
  if (qword_82E48 != -1) {
    dispatch_once(&qword_82E48, &stru_6D420);
  }
  v2 = (void *)qword_82E40;

  return v2;
}

- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[RCDateFormatter sharedDateFormatter];
  v8 = [v7 formattedDateStringFromDate:v6 forUUID:v5];

  return v8;
}

- (BOOL)setSplitViewHorizontalSizeClass:(int64_t)a3
{
  BOOL v5 = [(RCRecorderStyleProvider *)self _horizontalSizeClassFromSplitView] != a3;
  [(RCRecorderStyleProvider *)self set_horizontalSizeClassFromSplitView:a3];
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 30;
  }
  else {
    return 6;
  }
}

- (BOOL)appIsRightToLeft
{
  v2 = +[AMMessagesViewController sharedMessagesViewController];
  v3 = [v2 view];
  BOOL v4 = [v3 effectiveUserInterfaceLayoutDirection] == (char *)&def_3AC7C + 1;

  return v4;
}

- (double)tableViewAnimationDuration
{
  return 0.4;
}

- (int64_t)tableViewAnimationCurve
{
  return 2;
}

- (double)tableViewAlphaWhenDisabled
{
  return 0.5;
}

- (double)recordingControlAnimationDuration
{
  return 0.2;
}

- (double)recordingControlAlphaWhenPressed
{
  return 0.5;
}

- (double)recordingControlExtraHitOutset
{
  return 20.0;
}

- (double)descriptionViewSecondaryLabelAlpha
{
  return 0.5;
}

- (double)primaryColumnWidth
{
  return 320.0;
}

- (double)minimumPrimaryColumnWidth
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 182.0;
  }

  [(RCRecorderStyleProvider *)self primaryColumnWidth];
  return result;
}

- (double)maximumPrimaryColumnWidth
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 600.0;
  }

  [(RCRecorderStyleProvider *)self primaryColumnWidth];
  return result;
}

- (double)minimumSupplementaryColumnWidth
{
  [(RCRecorderStyleProvider *)self primaryColumnWidth];
  return result;
}

- (double)maximumSupplementaryColumnWidth
{
  [(RCRecorderStyleProvider *)self maximumPrimaryColumnWidth];
  return result;
}

- (double)emptyLibraryLabelXInset
{
  return 12.0;
}

- (double)animationDragCoefficient
{
  UIAnimationDragCoefficient();
  return v2;
}

- (double)centerClusterWidthCard
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  if ([(RCRecorderStyleProvider *)self _isWideIPad])
  {
    [(RCRecorderStyleProvider *)self centerClusterWidthJumpButton];
  }
  else
  {
    unsigned int v6 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = v5 + -58.0;
    if (v6) {
      return 260.0;
    }
  }
  return result;
}

- (double)centerClusterWidthJumpButton
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad])
  {
    double v3 = 198.0;
  }
  else if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    double v3 = 260.0;
  }
  else
  {
    double v3 = 296.0;
  }
  [(RCRecorderStyleProvider *)self jumpBackwardForwardButtonSpacing];
  return v3 + v4 * 2.0;
}

- (double)centerClusterWidthLibrary
{
  return 165.0;
}

- (double)librarySelectedMoreAndTrashButtonPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 4.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (CGSize)centerClusterControlSize
{
  double v2 = 55.0;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)centerClusterControlSizeRecentlyDeleted
{
  double v2 = 1.79769313e308;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)editRecordingButtonCornerRadius
{
  [(RCRecorderStyleProvider *)self playbackSettingsButtonCornerRadius];
  return result;
}

- (NSDirectionalEdgeInsets)playbackSettingsButtonContentInsets
{
  [(RCRecorderStyleProvider *)self editButtonContentTopBottomPadding];
  double v3 = v2 + 2.0;
  double v4 = 5.0;
  double v5 = 5.0;
  double v6 = v3;
  result.trailing = v5;
  result.bottom = v6;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (double)playbackSettingsButtonCornerRadius
{
  return 8.0;
}

- (double)playbackSettingsCollectionViewContentInsetBottom
{
  return -2.0;
}

- (double)playbackSettingsCollectionViewCellMinHeight
{
  return 50.0;
}

- (double)recordingControlHeight
{
  return 58.0;
}

- (double)topScreenSpacerHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 30.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (double)recordingControlSectionHeight
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 94.8051948;
  }
  if (![(RCRecorderStyleProvider *)self _isWatch]) {
    return 96.0;
  }
  [(RCRecorderStyleProvider *)self recordingControlHeight];
  return v4 + 24.0;
}

- (double)doneEditingButtonSidePadding
{
  return -16.0;
}

- (double)cancelButtonBottomAlignmentOffset
{
  return 151.0;
}

- (double)recordingControlHorizontalOffset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 0.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (double)bottomAccessoryWaveformHeight
{
  return 94.0;
}

- (double)overviewWaveformHeight
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 48.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 57.0;
  if (v4) {
    return 61.038961;
  }
  return result;
}

- (double)overviewWaveformCornerRadius
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 5.19480519;
  if (!v2) {
    return 4.0;
  }
  return result;
}

- (double)selectionOverlayBorderWidth
{
  return 2.0;
}

- (double)bottomAccessoryDescriptionHeight
{
  return 70.0;
}

- (double)recordingSectionBottomPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 39.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)fullScreenDescriptionHeight
{
}

- (double)positionReadoutHeight
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 76.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 70.0;
  if (v4) {
    return 151.948052;
  }
  return result;
}

- (double)positionReadoutLabelYOffset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)editToolbarHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 50.0;
  if (v2) {
    return 75.0;
  }
  return result;
}

- (double)editToolbarCompactHeight
{
  return 30.0;
}

- (double)shuttleBarHeight
{
  return 88.0;
}

- (double)shuttleBarShouldForceProportionalDistribution
{
  return (double)[(RCRecorderStyleProvider *)self _isWideIPad];
}

- (double)shuttleBarButtonContainerHeightCard
{
  return 88.0;
}

- (double)shuttleBarButtonContainerHeightLibrary
{
  return 56.0;
}

- (double)shuttleBarAdditionalSliderSpacingLibrary
{
  return 12.0;
}

- (double)topMarginMinSafeAreaTopInsetForCardView
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
  double result = 32.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (double)topMarginForCardView
{
  return 12.0;
}

- (double)actionButtonExtraXAxisActiveWidth
{
  return 5.0;
}

- (double)playbackSettingsButtonExtraActivePoints
{
  return 10.0;
}

- (double)borderLayerThickness
{
  return 0.5;
}

- (double)recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 22.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 116.0;
    if (v5) {
      return 49.3506494;
    }
  }
  return result;
}

- (double)recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 24.0;
  if ((v3 & 1) == 0)
  {
    [(RCRecorderStyleProvider *)self _isIOSMac];
    return 0.0;
  }
  return result;
}

- (double)recordingViewWaveformOverviewSidePadding
{
  [(RCRecorderStyleProvider *)self playbackViewWaveformOverviewSidePadding];
  return result;
}

- (double)recordingViewSpaceBetweenToolbarAndDescriptionView
{
  if (![(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 0.0;
  }

  [(RCRecorderStyleProvider *)self playbackViewTopPadding];
  return result;
}

- (double)virtualNavBarButtonItemSpacing
{
  return 22.0;
}

- (double)virtualNavBarWidthInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 0.0;
  if (v2) {
    return -4.0;
  }
  return result;
}

- (double)virtualNavBarButtonExtraSpaceItemSpacing
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 0.0;
  if (v2) {
    return 22.0;
  }
  return result;
}

- (id)trimDeleteButtonTextColor
{
  return +[UIColor blackColor];
}

- (id)trimDeleteButtonBackgroundColor
{
  return +[UIColor systemYellowColor];
}

- (double)trimDeleteButtonCornerRadius
{
  return 8.0;
}

- (double)trimDeleteButtonLeftPaddingDistance
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 15.5844156;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (CGSize)trimDeleteButtonLeftSize
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double v3 = 80.0;
  if (v2) {
    double v3 = 116.883117;
  }
  double v4 = 32.0;
  if (v2) {
    double v4 = 36.3636364;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)doneCancelButtonRightSize
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double v3 = 136.0;
  if (v2) {
    double v3 = 90.0;
  }
  double v4 = 50.0;
  if (v2) {
    double v4 = 36.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)inOutButtonTextColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

- (id)inOutButtonBackgroundColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.15];
}

- (double)inOutButtonCornerRadius
{
  return 8.0;
}

- (double)overviewPlayheadHeightInset
{
  return 1.0;
}

- (double)recentlyDeletedToolbarDivdiderInset
{
  return 16.0;
}

- (double)recentlyDeletedToolbarDivdiderHeight
{
  return 1.0;
}

- (double)recordingNameLabelPadding
{
  return 0.0;
}

- (double)dimDescriptionViewAnimationDuration
{
  return 0.2;
}

- (id)expandCompactRecordingCardPropertyAnimator
{
  id v2 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithDampingRatio:initialVelocity:", 1.0, 0.0, 0.0);
  id v3 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v2 timingParameters:0.5];

  return v3;
}

- (double)jumpBackwardForwardButtonSpacing
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 35.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (id)playbackViewTimeLabelFont
{
  if ([(RCRecorderStyleProvider *)self _isWatch])
  {
    double v3 = UIFontWeightRegular;
    double v4 = 35.0;
  }
  else
  {
    if ([(RCRecorderStyleProvider *)self _isIpad])
    {
      double v3 = UIFontWeightBold;
      uint64_t v5 = 0x4041000000000000;
    }
    else
    {
      double v3 = UIFontWeightSemibold;
      [(RCRecorderStyleProvider *)self _isIOSMac];
      uint64_t v5 = 0x4045000000000000;
    }
    double v4 = *(double *)&v5;
  }

  return +[UIFont monospacedDigitSystemFontOfSize:v4 weight:v3];
}

- (double)playbackViewTimeSectionHeight
{
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI]) {
    return 60.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 70.0;
  if (v4) {
    return 150.649351;
  }
  return result;
}

- (double)playbackViewTimeSectionBottomPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIpad];
  double result = 0.0;
  if (v2) {
    return 18.0;
  }
  return result;
}

- (double)playbackViewTimeLabelYOffset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 2.5974026;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)playbackViewControlSectionHeight
{
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI]) {
    return 94.8051948;
  }
  if (![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return 92.0;
  }

  [(RCRecorderStyleProvider *)self recordingControlSectionHeight];
  return result;
}

- (double)playbackViewTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self presentsTitleAndAdditionalEditingControlsInPlaybackCard];
  double result = 50.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

- (double)playbackViewWaveformOverviewSidePadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 42.0;
  if (v2) {
    return 42.8571429;
  }
  return result;
}

- (double)playbackViewVerticalSpacingAboveOverviewWaveform
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isIpad];
  double result = 22.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 62.0;
    if (v5) {
      return 49.3506494;
    }
  }
  return result;
}

- (double)playbackViewVerticalSpacingBelowOverviewWaveform
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 23.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 41.0;
    if (v5) {
      return 0.0;
    }
  }
  return result;
}

- (double)playbackViewShuttleBarWidth
{
  [(RCRecorderStyleProvider *)self centerClusterWidthJumpButton];
  return result;
}

- (double)playbackViewCornerRadius
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 0.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (BOOL)_isPortrait
{
  unsigned int v2 = +[AMMessagesViewController sharedMessagesViewController];
  unsigned __int8 v3 = [v2 view];
  unsigned int v4 = [v3 window];
  unsigned int v5 = [v4 windowScene];
  BOOL v6 = (char *)[v5 interfaceOrientation] - 1 < (unsigned char *)&def_3AC7C + 2;

  return v6;
}

- (BOOL)_isLandscape
{
  unsigned int v2 = +[AMMessagesViewController sharedMessagesViewController];
  unsigned __int8 v3 = [v2 view];
  unsigned int v4 = [v3 window];
  unsigned int v5 = [v4 windowScene];
  BOOL v6 = (char *)[v5 interfaceOrientation] - 3 < (unsigned char *)&def_3AC7C + 2;

  return v6;
}

- (UIEdgeInsets)playbackViewEdgeInsets
{
  if ([(RCRecorderStyleProvider *)self _isIpad])
  {
    [(RCRecorderStyleProvider *)self _isPortrait];
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
    double top = 0.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)playbackViewFullScreenEdgeInsets
{
  if ([(RCRecorderStyleProvider *)self _isIpad])
  {
    [(RCRecorderStyleProvider *)self _isPortrait];
    double top = 24.0;
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)playbackViewTitleTextInsets
{
  double v2 = 0.0;
  double v3 = -12.0;
  double v4 = 0.0;
  double v5 = -5.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (double)playbackViewWidthToCollapseToolbarButtons
{
  return 500.0;
}

- (double)playbackSettingsPopoverBottomPadding
{
  return 30.0;
}

- (double)playbackSpeedSliderHeight
{
  return 4.0;
}

- (CGSize)playbackSpeedSliderTickSize
{
  [(RCRecorderStyleProvider *)self playbackSpeedSliderHeight];
  double v3 = v2 * 3.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)playbackSpeedSliderTickCornerRadius
{
  return 2.0;
}

- (BOOL)transportButtonsAnimateWithCircle
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (double)transportButtonAnimationJumpCircleRadius
{
  return 32.5;
}

- (double)transportButtonAnimationPlayCircleRadius
{
  return 32.5;
}

- (id)transportButtonAnimationCircleColor
{
  return +[UIColor secondarySystemFillColor];
}

- (double)transportButtonAnimationShrinkFactor
{
  return 0.8;
}

- (double)transportButtonAnimationDuration
{
  return 0.2;
}

- (double)recordingControlDiameter
{
  return 60.0;
}

- (double)recordingControlOuterRingThickness
{
  return 3.0;
}

- (double)recordingControlOuterRingGap
{
  return 6.0;
}

- (double)recordingControlInnerSquareWidth
{
  return 24.0;
}

- (double)recordingControlSquareCornerRadius
{
  return 4.0;
}

- (double)recordingControlPauseGap
{
  return 4.0;
}

- (double)recordingControlPauseStrokeCornerRadius
{
  return 2.0;
}

- (double)recordingControlLozengeFixedWidth
{
  return 86.0;
}

- (double)libraryCellDescriptionHeight
{
  return 60.0;
}

- (double)libraryCellShuttleBarHeight
{
  return 110.0;
}

- (double)libraryCellDescriptionViewShuttleBarPadding
{
  return 18.0;
}

- (double)libraryCellSliderAndControlsVerticalStackViewSpacing
{
  if (UIAccessibilityIsBoldTextEnabled()) {
    return 35.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled];
  double result = 35.0;
  if (!v4) {
    return 29.0;
  }
  return result;
}

- (BOOL)librarySupportsBlueCellSelectionStyle
{
  if ([(RCRecorderStyleProvider *)self recordingTableViewSupportsSidebarBackgroundConfiguration])
  {
    return 1;
  }

  return [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)libraryCellAlwaysHasClearBackgroundColor
{
  return ![(RCRecorderStyleProvider *)self librarySupportsBlueCellSelectionStyle];
}

- (CGSize)actionMenuImageSize
{
  double v2 = 32.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)descriptionViewSecondaryLabelsTopMargin
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 4.0;
  if (v2) {
    return 2.0;
  }
  return result;
}

- (double)descriptionViewTitleToSecondaryPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 3.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

- (double)descriptionCompactViewTitleToSecondaryPadding
{
  return 5.0;
}

- (double)descriptionViewCreationDateInfoLabelXOffset
{
  return 1.0;
}

- (double)descriptionViewCreationDurationInfoLabelXOffset
{
  return 11.0;
}

- (double)minimumDecibelDisplayRange
{
  return -72.0;
}

- (double)maximumDecibelDisplayRange
{
  return 0.0;
}

- (double)waveformVerticalHeightReduction
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = -8.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 90.0;
    if (v5) {
      return -38.0;
    }
  }
  return result;
}

- (double)waveformVerticalOffset
{
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI]) {
    return 52.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 21.0;
  if (v4) {
    return 25.0;
  }
  return result;
}

- (double)waveformViewleftPadding
{
  return 0.0;
}

- (double)waveformViewRightPadding
{
  return 0.0;
}

- (double)waveformViewTopPadding
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 52.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 70.0;
  if (v4) {
    return 0.0;
  }
  return result;
}

- (double)waveformViewBottomPadding
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  double result = 10.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 12.987013;
    if (!v5) {
      return 24.0;
    }
  }
  return result;
}

- (double)waveformWaveWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)waveformHorizontalSpacing
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isIOSMac];
  [(RCRecorderStyleProvider *)self waveformWaveWidth];
  double result = v4 + 3.0;
  if (v3) {
    return result / 0.77;
  }
  return result;
}

- (double)overviewWaveformWaveWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)overviewWaveformHorizontalSpacing
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isIOSMac];
  [(RCRecorderStyleProvider *)self overviewWaveformWaveWidth];
  double result = v4 + 1.0;
  if (v3) {
    return result / 0.77;
  }
  return result;
}

- (double)waveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)overviewWaveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)compactWaveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 23.3766234;
  if (!v2) {
    return 18.0;
  }
  return result;
}

- (double)beginEndLabelsTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 6.49350649;
  if (!v2) {
    return 5.0;
  }
  return result;
}

- (double)overviewWaveformMinimumDurationToDisplayWhenRecording
{
  return 20.0;
}

- (double)timeLineTickWidth
{
  return 1.0;
}

- (double)timeLineMajorTickHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)timeLineMinorTickHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 6.49350649;
  if (!v2) {
    return 5.0;
  }
  return result;
}

- (double)annotationViewHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 35.0649351;
  if (!v2) {
    return 27.0;
  }
  return result;
}

- (double)editToolbarTitleTopInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 12.5;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (double)editToolbarButtonTopInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 6.0;
  if (v2) {
    return 9.0;
  }
  return result;
}

- (double)editTrimToolbarButtonTopInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  double result = 14.0;
  if (v2) {
    return 11.0;
  }
  return result;
}

- (double)editToolbarButtonHorizontalInset
{
  return 17.0;
}

- (double)selectionKnobRadius
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 4.54545455;
  if (!v2) {
    return 3.5;
  }
  return result;
}

- (double)selectionBarWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)selectionHighlightToKnobInset
{
  return 0.0;
}

- (double)selectionMiddleTimeBaselineInset
{
  return 7.0;
}

- (double)selectionTimeBaseLineOffset
{
  return 4.0;
}

- (double)selectionTimeMinOffset
{
  return 20.0;
}

- (double)selectionTimeInsetWhenSelected
{
  return 60.0;
}

- (double)selectionTimeInsetNormal
{
  return 0.0;
}

- (double)selectionHitTestSlop
{
  return 10.0;
}

- (double)selectionOverlayAlpha
{
  return 1.0;
}

- (double)selectionDimOverlayAlpha
{
  return 0.6;
}

- (double)selectionLightOverlayAlpha
{
  return 0.2;
}

- (double)playheadWidthMultiplier
{
  return 1.0;
}

- (double)knobWidthMultiplier
{
  return 1.0;
}

- (double)overviewPlayheadWidthMultiplier
{
  return 0.714;
}

- (double)overviewKnobWidthMultiplier
{
  return 1.857;
}

- (double)compactStylePlayheadMultiplier
{
  return 0.143;
}

- (double)compactStyleTimeBarDefaultHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 63.0;
  if (v2) {
    return 81.8181818;
  }
  return result;
}

- (double)compactStyleTimeBarHeightInset
{
  return 17.0;
}

- (double)recordingControlLockScreenPadding
{
  return -20.0;
}

- (double)timeDisplayLabelLockScreenPadding
{
  return -20.0;
}

- (double)waveformLockScreenBottomPadding
{
  return -20.0;
}

- (double)waveformLockScreenTopPadding
{
  return 60.0;
}

- (double)dateDurationLabelLockScreenVerticalPadding
{
  return 5.0;
}

- (double)dateLabelLockScreenHorizontalPadding
{
  return -5.0;
}

- (double)durationLabelLockScreenHorizontalPadding
{
  return 5.0;
}

- (double)titleLabelLockScreenTopPaddingMultiplier
{
  return 0.08;
}

- (double)editButtonImageTitlePadding
{
  return 8.0;
}

- (double)editButtonContentTopBottomPadding
{
  return 5.0;
}

- (double)editButtonContentLeftRightPadding
{
  [(RCRecorderStyleProvider *)self editButtonContentTopBottomPadding];
  return v2 + 5.0;
}

- (id)libraryPlayImage
{
  double v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:32.0];
  unsigned int v3 = +[UIImage systemImageNamed:@"play.fill"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardPlayImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 42.0;
  if (v2) {
    double v4 = 50.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"play.fill"];
  v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)libraryPauseImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:32.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"pause.fill"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardPauseImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 42.0;
  if (v2) {
    double v4 = 50.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"pause.fill"];
  v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)libraryGoBackwardImage
{
  uint64_t v3 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  double v4 = [(RCRecorderStyleProvider *)self _gobackwardSystemImage];
  unsigned int v5 = [v4 imageWithSymbolConfiguration:v3];

  return v5;
}

- (id)cardGoBackwardImage
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 5;
  }
  double v5 = 25.0;
  if (v3) {
    double v5 = 31.0;
  }
  BOOL v6 = +[UIImageSymbolConfiguration configurationWithPointSize:v4 weight:2 scale:v5];
  v7 = [(RCRecorderStyleProvider *)self _gobackwardSystemImage];
  v8 = [v7 imageWithSymbolConfiguration:v6];

  return v8;
}

- (id)_gobackwardSystemImage
{
  if ([(RCRecorderStyleProvider *)self needsLocalizedSymbolImageWorkaround]) {
    +[UIImage systemImageNamedNumberAware:@"gobackward.15"];
  }
  else {
  unsigned int v2 = +[UIImage systemImageNamed:@"gobackward.15"];
  }

  return v2;
}

- (id)libraryGoForwardImage
{
  unsigned int v3 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  uint64_t v4 = [(RCRecorderStyleProvider *)self _goforwardSystemImage];
  double v5 = [v4 imageWithSymbolConfiguration:v3];

  return v5;
}

- (id)cardGoForwardImage
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 5;
  }
  double v5 = 25.0;
  if (v3) {
    double v5 = 31.0;
  }
  BOOL v6 = +[UIImageSymbolConfiguration configurationWithPointSize:v4 weight:2 scale:v5];
  v7 = [(RCRecorderStyleProvider *)self _goforwardSystemImage];
  v8 = [v7 imageWithSymbolConfiguration:v6];

  return v8;
}

- (id)_goforwardSystemImage
{
  if ([(RCRecorderStyleProvider *)self needsLocalizedSymbolImageWorkaround]) {
    +[UIImage systemImageNamedNumberAware:@"goforward.15"];
  }
  else {
  unsigned int v2 = +[UIImage systemImageNamed:@"goforward.15"];
  }

  return v2;
}

- (id)ellipsisCircleImage
{
  return +[UIImage systemImageNamed:@"ellipsis.circle"];
}

- (id)ellipsisImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  unsigned int v3 = +[UIImage systemImageNamed:@"ellipsis"];
  uint64_t v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)trashImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)playbackSettingsImage
{
  return +[UIImage systemImageNamed:@"slider.horizontal.3"];
}

- (id)swipeTrashImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  unsigned int v3 = +[UIImage systemImageNamed:@"trash.fill" withConfiguration:v2];

  return v3;
}

- (id)filledMoveToFolderImage
{
  return +[UIImage systemImageNamed:@"folder.fill"];
}

- (id)moveToFolderImage
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v2 = 0;
  }
  else
  {
    unsigned int v2 = +[UIImage systemImageNamed:@"folder"];
  }

  return v2;
}

- (id)createNewFolderImage
{
  return +[UIImage systemImageNamed:@"folder.badge.plus"];
}

- (id)trimImage
{
  return +[UIImage systemImageNamed:@"selection.pin.in.out"];
}

- (id)favoriteImageName
{
  return @"heart.fill";
}

- (id)notFavoriteImageName
{
  return @"heart";
}

- (id)favoriteImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self favoriteImageName];
  unsigned int v3 = +[UIImage systemImageNamed:v2];

  return v3;
}

- (id)notFavoriteImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self notFavoriteImageName];
  unsigned int v3 = +[UIImage systemImageNamed:v2];

  return v3;
}

- (id)playbackSpeedSliderMinimumValueImage
{
  return +[UIImage systemImageNamed:@"tortoise"];
}

- (id)playbackSpeedSliderMaximumValueImage
{
  return +[UIImage systemImageNamed:@"hare"];
}

- (id)editButtonImage
{
  return +[UIImage systemImageNamed:@"waveform"];
}

- (id)renameContextMenuButtonImage
{
  return +[UIImage systemImageNamed:@"pencil"];
}

- (id)deleteContextMenuButtonImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)shareToolbarMenuImage
{
  return +[UIImage systemImageNamed:@"square.and.arrow.up"];
}

- (id)trashBottomToolbarImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)mainLabelColor
{
  return +[UIColor blackColor];
}

- (id)mainViewBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac]) {
    [(RCRecorderStyleProvider *)self _roundedThemePrimaryBackgroundColor];
  }
  else {
  unsigned int v3 = +[UIColor systemBackgroundColor];
  }

  return v3;
}

- (id)playbackViewBackgroundColor:(BOOL)a3
{
  return +[UIColor systemBackgroundColor];
}

- (id)windowHeaderSpacerViewBackgroundColor:(BOOL)a3
{
  if (a3) {
    +[UIColor blackColor];
  }
  else {
  unsigned int v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (id)_roundedThemePrimaryBackgroundColor
{
  return +[UIColor clearColor];
}

- (id)transportControlsColorForLibrary
{
  return +[UIColor labelColor];
}

- (id)secondaryTransportControlsColorForLibrary
{
  return +[UIColor systemBlueColor];
}

- (id)transportControlsColorForRecordingCard
{
  return +[UIColor labelColor];
}

- (id)transportControlsColorForPlaybackCard:(BOOL)a3
{
  double v3 = 0.129411765;
  if (a3) {
    double v3 = 1.0;
  }
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3);
}

- (id)actionControlsColorForPlaybackCard
{
  unsigned int v2 = objc_opt_new();
  double v3 = [v2 tintColor];

  return v3;
}

- (id)playbackCardTopGradientColor:(BOOL)a3
{
  if (a3) {
    [(RCRecorderStyleProvider *)self recordingCardTopGradientColor];
  }
  else {
  double v3 = +[UIColor colorWithWhite:0.93 alpha:1.0];
  }

  return v3;
}

- (id)playbackCardBottomGradientColor:(BOOL)a3
{
  if (a3) {
    [(RCRecorderStyleProvider *)self recordingCardBottomGradientColor];
  }
  else {
  double v3 = +[UIColor colorWithWhite:0.83 alpha:1.0];
  }

  return v3;
}

- (id)playbackCardTopBorderColor1:(BOOL)a3
{
  if (a3) {
    [(RCRecorderStyleProvider *)self recordingCardTopBorderColor1];
  }
  else {
  double v3 = +[UIColor colorWithWhite:0.7 alpha:1.0];
  }

  return v3;
}

- (id)playbackCardTopBorderColor2:(BOOL)a3
{
  if (a3) {
    [(RCRecorderStyleProvider *)self recordingCardTopBorderColor2];
  }
  else {
  double v3 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  }

  return v3;
}

- (id)playbackCardTimeLabelFontColor:(BOOL)a3
{
  return +[UIColor labelColor];
}

- (id)splitViewSeparatorColor:(BOOL)a3
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac] && a3)
  {
    double v5 = +[UIColor systemBlackColor];
  }
  else
  {
    BOOL v6 = +[UIColor separatorColor];
    v7 = [(RCRecorderStyleProvider *)self sidebarCollectionViewBackgroundColor];
    [v6 alphaComponent];
    double v5 = objc_msgSend(v7, "colorWithAlphaComponent:");
  }

  return v5;
}

- (id)recordingCardBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (id)recordingCardTimeLabelFontColor
{
  return +[UIColor colorWithWhite:0.901960784 alpha:1.0];
}

- (id)recordingCardDefaultBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIColor secondarySystemBackgroundColor];
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac] || !v3)
  {
    uint64_t v6 = +[UIColor systemBackgroundColor];

    double v5 = (void *)v6;
  }

  return v5;
}

- (id)recordingCardBottomAccessoryBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

- (id)recordingCardTopGradientColor
{
  return +[UIColor colorWithWhite:0.1 alpha:1.0];
}

- (id)recordingCardBottomGradientColor
{
  return +[UIColor colorWithWhite:0.05 alpha:1.0];
}

- (id)recordingCardTopBorderColor1
{
  return +[UIColor colorWithWhite:0.165 alpha:1.0];
}

- (id)recordingCardTopBorderColor2
{
  return +[UIColor clearColor];
}

- (id)editingToolbarButtonTextColor
{
  if ([(RCRecorderStyleProvider *)self hostsTransportAndDoneButtonInBottomSection])
  {
    +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  else
  {
    +[UIColor systemBlueColor];
  unsigned int v2 = };

  return v2;
}

- (id)editingToolbarButtonDisabledTextColor
{
  unsigned int v2 = +[UIColor systemGrayColor];
  BOOL v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

- (id)editingToolbarTitleTextColor
{
  return +[UIColor labelColor];
}

- (id)tableViewEditButtonDimmedColor
{
  return +[UIColor systemGrayColor];
}

- (id)sidebarCollectionViewBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self recordingTableViewSupportsSidebarBackgroundConfiguration])
  {
    BOOL v3 = [(RCRecorderStyleProvider *)self recordingCardBottomAccessoryBackgroundColor];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)sidebarNavBarNewFolderImageTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v2 = +[UIColor secondaryLabelColor];
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

- (id)sidebarCollectionViewCellDropTargetBackgroundColor
{
  return 0;
}

- (id)folderSelectionCollectionViewCellColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v2 = +[UIColor systemBackgroundColor];
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

- (id)folderSelectionCollectionViewBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

- (id)folderSelectionNavBarNewFolderImageTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v2 = +[UIColor secondaryLabelColor];
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

- (int64_t)sidebarCollectionViewListAppearance
{
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (BOOL)sidebarCollectionViewShowsSeparators
{
  return ![(RCRecorderStyleProvider *)self supportsAccompaniedSidebarStyle];
}

- (BOOL)sidebarCollectionViewNeedsDisclosureAccessory
{
  return ![(RCRecorderStyleProvider *)self supportsAccompaniedSidebarStyle];
}

- (double)sidebarCollectionViewCellAXHyphenationFactor
{
  return 0.2;
}

- (double)sidebarCollectionViewTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 0.0;
  if (v2) {
    return 7.0;
  }
  return result;
}

- (BOOL)sidebarPresentsWithGesture
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (int64_t)folderSelectionCollectionViewListAppearance
{
  return 2;
}

- (BOOL)folderSelectionCollectionViewShowsSeparators
{
  return 1;
}

- (BOOL)folderSelectionCollectionViewNeedsDisclosureAccessory
{
  return 0;
}

- (BOOL)folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle
{
  return 0;
}

- (double)folderSelectionCollectionViewTopPadding
{
  return 0.0;
}

- (double)presentedViewsMinimumWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 500.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (id)watchAppTintColor
{
  return +[UIColor colorWithRed:0.988235294 green:0.239215686 blue:0.223529412 alpha:1.0];
}

- (id)playbackCardPrimaryLabelFontColor
{
  return +[UIColor labelColor];
}

- (id)playbackCardSecondaryLabelFontColor
{
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  unsigned int v2 = +[UIColor colorWithRed:0.298039216 green:0.298039216 blue:0.298039216 alpha:1.0];
  }

  return v2;
}

- (id)recordingControlFontColor
{
  return +[UIColor whiteColor];
}

- (id)recordingControlFontColorResume
{
  return [(RCRecorderStyleProvider *)self recordingControlInnerColor];
}

- (id)recordingControlInnerColor
{
  return +[UIColor systemRedColor];
}

- (id)recordingControlOuterColor:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = +[UIColor systemGrayColor];
  if (v3)
  {
    uint64_t v5 = +[UIColor labelColor];

    uint64_t v4 = (void *)v5;
  }

  return v4;
}

- (id)recordingControlInnerColorResume
{
  unsigned int v2 = +[UIColor systemRedColor];
  [v2 alphaComponent];
  uint64_t v4 = [v2 colorWithAlphaComponent:v3 * 0.3];

  return v4;
}

- (id)recordingControlOuterColorResume
{
  return [(RCRecorderStyleProvider *)self recordingControlInnerColor];
}

- (id)recordingSectionDoneButtonInnerColor
{
  return +[UIColor systemGray4Color];
}

- (id)recordingSectionDoneAndCancelButtonTextColor
{
  return +[UIColor labelColor];
}

- (id)recordingSectionCancelButtonInnerColor
{
  return +[UIColor systemGray5Color];
}

- (double)recordingSectionDoneButtonDisabledOpacity
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
  double result = 0.2;
  if (v2) {
    return 0.575;
  }
  return result;
}

- (id)recordingViewEffectsActiveBackgroundColor
{
  return +[UIColor clearColor];
}

- (id)recordingViewEffectsInactiveBackgroundColor
{
  return +[UIColor colorWithRed:0.171875 green:0.1796875 blue:0.1875 alpha:1.0];
}

- (id)footerViewBackgroundColor
{
  return +[UIColor clearColor];
}

- (id)emptyLibraryMessageTextColor:(BOOL)a3
{
  double v3 = 0.59;
  if (a3) {
    double v3 = 0.39;
  }
  uint64_t v4 = +[UIColor colorWithWhite:v3 alpha:1.0];

  return v4;
}

- (id)emptyLibraryBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCRecorderStyleProvider *)self showsEmptyLibraryMessageInLibrary]) {
    [(RCRecorderStyleProvider *)self tableViewBackgroundColor];
  }
  else {
  uint64_t v5 = [(RCRecorderStyleProvider *)self playbackViewBackgroundColor:v3];
  }

  return v5;
}

- (id)tableViewBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI]) {
    [(RCRecorderStyleProvider *)self _roundedThemePrimaryBackgroundColor];
  }
  else {
  BOOL v3 = +[UIColor systemBackgroundColor];
  }

  return v3;
}

- (id)tableViewCellTextColor
{
  return +[UIColor labelColor];
}

- (id)tableViewSelectedCellTextColor
{
  if ([(RCRecorderStyleProvider *)self librarySupportsBlueCellSelectionStyle]) {
    +[UIColor systemWhiteColor];
  }
  else {
  BOOL v3 = [(RCRecorderStyleProvider *)self tableViewCellTextColor];
  }

  return v3;
}

- (int64_t)cellSelectionStyle
{
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)cellEditingSelectionStyle
{
  return 3;
}

- (id)tableViewToolboxSeparatorColor
{
  BOOL v3 = +[UIColor colorWithWhite:0.698039216 alpha:1.0];
  if ([(RCRecorderStyleProvider *)self _usesVibrantUI])
  {
    uint64_t v4 = +[UIColor colorWithWhite:1.0 alpha:0.15];

    BOOL v3 = (void *)v4;
  }

  return v3;
}

- (id)tableViewDoubleLineSeparatorColor
{
  return 0;
}

- (id)backgroundColor
{
  return +[UIColor colorWithRed:0.08 green:0.08 blue:0.08 alpha:1.0];
}

- (id)waveformRecordingColor
{
  if (qword_82E58 != -1) {
    dispatch_once(&qword_82E58, &stru_6D440);
  }
  unsigned int v2 = (void *)qword_82E50;

  return v2;
}

- (id)waveformPlaybackBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCRecorderStyleProvider *)self _isIpadOrIOSMac] && v3)
  {
    uint64_t v5 = +[UIColor tertiarySystemFillColor];
    [v5 alphaComponent];
    double v7 = v6 * 0.66;

    v8 = +[UIColor tertiarySystemFillColor];
  }
  else
  {
    [(RCRecorderStyleProvider *)self _isCompactWidth];
    v9 = +[UIColor quaternarySystemFillColor];
    [v9 alphaComponent];
    double v7 = v10 * 0.33;

    v8 = +[UIColor quaternarySystemFillColor];
  }
  v11 = v8;
  v12 = [v8 colorWithAlphaComponent:v7];

  return v12;
}

- (id)waveformPlaybackHighlightedBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCRecorderStyleProvider *)self _isIpadOrIOSMac] && v3)
  {
    uint64_t v5 = +[UIColor tertiarySystemFillColor];
    [v5 alphaComponent];
    double v7 = v6 * 0.38;

    v8 = +[UIColor tertiarySystemFillColor];
    v9 = v8;
    double v10 = v7;
  }
  else
  {
    unsigned int v11 = [(RCRecorderStyleProvider *)self _isCompactWidth];
    v12 = +[UIColor quaternarySystemFillColor];
    [v12 alphaComponent];
    double v14 = v13;

    v8 = +[UIColor quaternarySystemFillColor];
    v9 = v8;
    if (v11 && v3) {
      double v15 = 0.65;
    }
    else {
      double v15 = 0.67;
    }
    double v10 = v14 * v15;
  }
  v16 = [v8 colorWithAlphaComponent:v10];

  return v16;
}

- (id)waveformStandardColor:(BOOL)a3
{
  if (a3) {
    +[UIColor whiteColor];
  }
  else {
  BOOL v3 = +[UIColor blackColor];
  }

  return v3;
}

- (id)beginEndLabelsColor
{
  return [(RCRecorderStyleProvider *)self beginEndLabelsPlaybackColor];
}

- (id)waveformCompactHighlightedBackgroundColor
{
  return +[UIColor colorWithRed:0.121568627 green:0.121568627 blue:0.121568627 alpha:0.0];
}

- (id)timeLineTimeColor
{
  return +[UIColor colorWithWhite:0.345098039 alpha:1.0];
}

- (id)timelinePlaybackTimeColor
{
  return +[UIColor tertiaryLabelColor];
}

- (id)timelinePlaybackBackgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[UIColor systemBackgroundColor];
  if (v3 && [(RCRecorderStyleProvider *)self _isIphone])
  {
    uint64_t v6 = +[UIColor secondarySystemBackgroundColor];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

- (id)timeLineMinorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (id)timeLineMajorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (id)playbackPositionBarColor
{
  if ([(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac]) {
    +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  else {
  unsigned int v2 = +[UIColor systemBlueColor];
  }

  return v2;
}

- (id)recordPositionBarColor
{
  return +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
}

- (id)playbackPositionTimeColor
{
  return +[UIColor colorWithWhite:1.0 alpha:1.0];
}

- (id)selectionOverlayColor
{
  unsigned int v2 = +[UIColor systemYellowColor];
  BOOL v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

- (id)selectionOverlayEndpointBarColor
{
  return +[UIColor systemYellowColor];
}

- (id)selectionOverlayEndpointTimeColor
{
  return +[UIColor colorWithWhite:1.0 alpha:1.0];
}

- (id)replaceSelectionOverlayColor
{
  return +[UIColor colorWithRed:0.164705882 green:0.031372549 blue:0.031372549 alpha:1.0];
}

- (id)minTrackTintColor:(BOOL)a3
{
  if (a3)
  {
    double v3 = 0.898039216;
    double v4 = 0.917647059;
  }
  else
  {
    double v3 = 0.56;
    double v4 = 0.58;
  }
  uint64_t v5 = +[UIColor colorWithRed:v3 green:v3 blue:v4 alpha:1.0];

  return v5;
}

- (id)maxTrackTintColor:(BOOL)a3
{
  if (a3)
  {
    double v3 = 0.180392157;
    double v4 = 0.184313725;
    double v5 = 1.0;
    double v6 = 0.180392157;
  }
  else
  {
    double v3 = 0.87;
    double v5 = 1.0;
    double v6 = 0.87;
    double v4 = 0.87;
  }
  double v7 = +[UIColor colorWithRed:v3 green:v6 blue:v4 alpha:v5];

  return v7;
}

- (id)sliderThumbTintColor:(BOOL)a3
{
  return [(RCRecorderStyleProvider *)self minTrackTintColor:a3];
}

- (id)playbackSpeedSliderImageColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)playbackSpeedRegularTrackColor
{
  return +[UIColor systemFillColor];
}

- (id)playbackSpeedTintedTrackColor
{
  return +[UIColor systemBlueColor];
}

- (id)playbackSettingsToolbarButtonColor
{
  return +[UIColor systemBlueColor];
}

- (id)recentlyDeletedNonDefaultButtonTextColor
{
  return +[UIColor whiteColor];
}

- (id)recentlyDeleteToolBarDividerColor
{
  if ([(RCRecorderStyleProvider *)self _isIpad])
  {
    unsigned int v2 = +[UIColor colorWithWhite:1.0 alpha:0.15];
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

- (id)trimButtonTintColor
{
  return +[UIColor systemBlueColor];
}

- (id)standardInteractionTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v2 = 0;
  }
  else
  {
    unsigned int v2 = +[UIColor systemBlueColor];
  }

  return v2;
}

- (id)descriptionViewScalableTitleFontForTableViewCell
{
  return +[UIFont scaledSystemFontOfSize:17.0 weight:UIFontWeightSemibold];
}

- (id)descriptionViewScalableTitleFontForCardView
{
  double v3 = UIFontWeightSemibold;
  double v4 = 28.0;
  if (![(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isWideIPad];
    double v4 = v5 ? 34.0 : 22.0;
    if (v5) {
      double v3 = UIFontWeightBold;
    }
  }
  if ([(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled])
  {
    if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
      double v4 = v4 * 0.85;
    }
    else {
      double v4 = 20.0;
    }
  }

  return +[UIFont scaledSystemFontOfSize:v4 weight:v3];
}

- (id)descriptionViewScalableSecondaryFont
{
  return +[UIFont scaledSystemFontOfSize:14.0];
}

- (id)creationDateLabelFont
{
  return +[UIFont scaledSystemFontOfSize:15.0 weight:UIFontWeightSemibold];
}

- (id)creationDateLabelFontForTableViewCell
{
  return +[UIFont scaledSystemFontOfSize:15.0 weight:UIFontWeightRegular];
}

- (id)durationLabelFont
{
  return +[UIFont scaledMonospacedSystemFontOfSize:15.0];
}

- (id)recordingControlTextFont
{
  return +[UIFont systemFontOfSize:15.0 weight:UIFontWeightBold];
}

- (id)editingControlButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
}

- (id)editingToolbarSaveButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
}

- (id)editingToolbarCancelButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
}

- (id)editingToolbarTitleLabelFont
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWatch];
  double v3 = 17.0;
  if (v2) {
    double v3 = 21.0;
  }
  double v4 = &UIFontWeightMedium;
  if (!v2) {
    double v4 = &UIFontWeightSemibold;
  }
  unsigned int v5 = +[UIFont systemFontOfSize:v3 weight:*v4];

  return v5;
}

- (id)emptyLibraryTextScalableSecondaryFont
{
  return +[UIFont scaledSystemFontOfSize:16.0];
}

- (id)durationLabelFontForCompactRecordingView
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled];
  double v3 = 17.0;
  if (v2) {
    double v3 = 15.0;
  }
  double v4 = +[UIFont scaledMonospacedSystemFontOfSize:v3];

  return v4;
}

- (id)timeLineLabelFont
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double v3 = 15.5844156;
  if (!v2) {
    double v3 = 12.0;
  }

  return +[UIFont systemFontOfSize:v3];
}

- (id)trimDeleteButtonFont
{
  return +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
}

- (double)progressViewDisplayDismissTime
{
  return 0.5;
}

- (id)progressViewBackgroundColorTableViewCell:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac]) {
    [(RCRecorderStyleProvider *)self progressViewBackgroundColorEditingCard:v3];
  }
  else {
  unsigned int v5 = +[UIColor clearColor];
  }

  return v5;
}

- (double)editingProgressIndicatorDiameterCell
{
  return 26.0;
}

- (double)editingProgressIndicatorDiameterPlayback
{
  return 52.0;
}

- (double)editingProgressOuterRingThicknessCell
{
  return 2.0;
}

- (double)editingProgressOuterRingThicknessPlayback
{
  return 4.0;
}

- (double)progressTextFontSize
{
  return 15.0;
}

- (double)progressTextYSpacing
{
  return 12.0;
}

- (BOOL)showsProgressInTableViewCell
{
  return ![(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
}

- (BOOL)_isIpad
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 0;
  }
  BOOL v3 = +[UIDevice currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == (char *)&def_3AC7C + 1;

  return v2;
}

- (BOOL)_isIphone
{
  BOOL v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)_isWatch
{
  BOOL v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == &dword_4;

  return v3;
}

- (id)accessibilityLargeSizes
{
  v4[0] = UIContentSizeCategoryAccessibilityMedium;
  v4[1] = UIContentSizeCategoryAccessibilityLarge;
  v4[2] = UIContentSizeCategoryAccessibilityExtraLarge;
  v4[3] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v4[4] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  BOOL v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (BOOL)isAccessibilityLargerTextSizeEnabled
{
  BOOL v3 = +[UIContentSizeCategoryPreference system];
  double v4 = [v3 preferredContentSizeCategory];

  unsigned int v5 = [(RCRecorderStyleProvider *)self accessibilityLargeSizes];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

- (BOOL)hasPlaybackCard
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 1;
  }

  return [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)explicitlyScrollsToTableViewRowOnSelection
{
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return +[UIKeyboard isInHardwareKeyboardMode] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)expandsTableViewRowOnSelection
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 0;
  }
  else {
    return ![(RCRecorderStyleProvider *)self _isIOSMac];
  }
}

- (BOOL)supportsCompactRecordingCard
{
  return ![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
}

- (BOOL)supportsSheetPresentationSPI
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)animatesRecordingCardPresentation
{
  return [(RCRecorderStyleProvider *)self supportsCompactRecordingCard];
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInRecordingCard
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInPlaybackCard
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)showsGradientsInBottomOfCardView
{
  return 0;
}

- (BOOL)usesNavBarLargeTitleAndSearchBarHosting
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)showsEmptyLibraryMessageInLibrary
{
  return ![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
}

- (BOOL)_isIpadOrIOSMac
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isIpad];
  return v3 | [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)_isWideIpadOrIOSMac
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  return v3 | [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)_isVibrantUIOrIOSMac
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _usesVibrantUI];
  return v3 | [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)_isIOSMac
{
  return 0;
}

- (BOOL)_isCompactWidth
{
  return (char *)[(RCRecorderStyleProvider *)self _horizontalSizeClassFromSplitView] == (char *)&def_3AC7C + 1;
}

- (BOOL)_usesVibrantUI
{
  return 0;
}

- (BOOL)_isWideIPad
{
  char v3 = ![(RCRecorderStyleProvider *)self _isCompactWidth];
  return [(RCRecorderStyleProvider *)self _isIpad] & v3;
}

- (BOOL)usesLargeTitles
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)allowsInteractiveCardSizing
{
  return ![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
}

- (BOOL)usesVectorGlyph
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)needsTouchDownWorkaround
{
  BOOL v3 = [(RCRecorderStyleProvider *)self _isIpad];
  if (v3) {
    LOBYTE(v3) = ![(RCRecorderStyleProvider *)self _isVibrantUIOrIOSMac];
  }
  return v3;
}

- (BOOL)needsLocalizedSymbolImageWorkaround
{
  return 1;
}

- (BOOL)usesSplitBehavior
{
  return ![(RCRecorderStyleProvider *)self _isCompactWidth];
}

- (BOOL)supportsDisplaceSplitBehavior
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (double)minimumSecondaryColumnWidth
{
  return 384.0;
}

- (double)splitViewSeparatorWidth
{
  return 0.5;
}

- (id)activityImageSymbolConfiguration
{
  if ([(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled])
  {
    BOOL v2 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
    BOOL v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v2];

    double v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

    unsigned int v5 = +[UIFont fontWithDescriptor:v4 size:0.0];
    [v5 pointSize];
    double v6 = +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
  }
  else
  {
    double v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:UIImageSymbolSizeLarge];
  }

  return v6;
}

- (id)editingToolbarImageSymbolConfiguration
{
  return [(RCRecorderStyleProvider *)self activityImageSymbolConfiguration];
}

- (id)playbackViewToolbarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:UIImageSymbolSizeLarge];
}

- (id)shuttleBarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
}

- (RCDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (int64_t)_horizontalSizeClassFromSplitView
{
  return self->__horizontalSizeClassFromSplitView;
}

- (void)set_horizontalSizeClassFromSplitView:(int64_t)a3
{
  self->__horizontalSizeClassFromSplitView = a3;
}

- (void).cxx_destruct
{
}

@end