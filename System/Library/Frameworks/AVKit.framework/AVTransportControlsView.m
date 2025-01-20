@interface AVTransportControlsView
- (AVButton)mediaSelectionButton;
- (AVButton)playbackSpeedButton;
- (AVButton)skipBackButton;
- (AVButton)skipForwardButton;
- (AVButton)standardPlayPauseButton;
- (AVButton)startLeftwardContentTransitionButton;
- (AVButton)startRightwardContentTransitionButton;
- (AVChromedLabel)detachedScrubInstructionsBackdropLabel;
- (AVChromedLabel)elapsedTimeLabel;
- (AVChromedLabel)liveBroadcastLabel;
- (AVChromedLabel)liveBroadcastScrubberLabel;
- (AVChromedLabel)timeRemainingLabel;
- (AVControlOverflowButton)controlOverflowButton;
- (AVLayoutView)controlsLayoutView;
- (AVLayoutView)detachedExtraContentLayoutView;
- (AVMobileChromeControlsStyleSheet)styleSheet;
- (AVPlaybackControlsRoutePickerView)routePickerView;
- (AVScrubber)scrubber;
- (AVTouchIgnoringView)embeddedExtraContentContainer;
- (AVTouchIgnoringView)flexibleViewAfterRoutePickerView;
- (AVTouchIgnoringView)flexibleViewAfterSkipForwardButtons;
- (AVTransportControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4;
- (AVTransportControlsViewDelegate)delegate;
- (BOOL)_subviewIsCustomMenuItemView:(id)a3;
- (BOOL)canShowScrubInstructions;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isAnimatingScrubInstructions;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isDoubleRowLayoutEnabled;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)isShowingScrubInstructions;
- (BOOL)liveStreamingControlsIncludeScrubber;
- (BOOL)showsLiveStreamingControls;
- (BOOL)showsLoadingIndicator;
- (BOOL)transportViewIncludesVolumeController;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSArray)customItems;
- (NSArray)customMenuItemsViews;
- (NSArray)doubleRowViews;
- (NSArray)singleRowViews;
- (NSTimer)scrubInstructionsTimer;
- (UILabel)scrubInstructionsLabel;
- (UIView)customContentTransitioningInfoPanel;
- (double)_doubleRowLayoutSpacingAfterSubview:(id)a3;
- (double)_rowSpacingForDoubleRowLayoutAfterRow:(unint64_t)a3;
- (double)_singeRowLayoutSpacingAfterSubview:(id)a3;
- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3;
- (double)minimumRequiredWidth;
- (float)scrubberValueWhenScrubInstructionsTimerBegan;
- (float)volumeControlsControllerTransportBarHeight:(id)a3;
- (id)_scrubInstructionsAttributedText;
- (unint64_t)_layoutItemDisplayPriorityForSubview:(id)a3;
- (void)_layoutDoubleRowViews;
- (void)_layoutSingleRowViews;
- (void)_showScrubInstructions;
- (void)_updateCustomContentTransitioningInfoPanelLayout;
- (void)_updateFontSizes;
- (void)_updateScrubInstructionsFrame;
- (void)_updateScrubInstructionsLabelsText;
- (void)avkit_reevaluateHiddenStateOfItem:(id)a3;
- (void)beginScrubbing:(id)a3;
- (void)endScrubbing:(id)a3;
- (void)layoutSubviews;
- (void)reevaluateHiddenStateOfAllItems;
- (void)scrubberSlowKnobMovementDetected:(id)a3;
- (void)scrubberValueChanged:(id)a3;
- (void)setAnimatingScrubInstructions:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCustomContentTransitioningInfoPanel:(id)a3;
- (void)setCustomItems:(id)a3;
- (void)setCustomMenuItemsViews:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetachedExtraContentLayoutView:(id)a3;
- (void)setDoubleRowLayoutEnabled:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setFlexibleViewAfterRoutePickerView:(id)a3;
- (void)setFlexibleViewAfterSkipForwardButtons:(id)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setLiveStreamingControlsIncludeScrubber:(BOOL)a3;
- (void)setScrubInstructionsTimer:(id)a3;
- (void)setScrubberValueWhenScrubInstructionsTimerBegan:(float)a3;
- (void)setShowingScrubInstructions:(BOOL)a3;
- (void)setShowsLiveStreamingControls:(BOOL)a3;
- (void)setShowsLoadingIndicator:(BOOL)a3;
- (void)setStyleSheet:(id)a3;
- (void)setTransportViewIncludesVolumeController:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVTransportControlsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexibleViewAfterSkipForwardButtons, 0);
  objc_storeStrong((id *)&self->_flexibleViewAfterRoutePickerView, 0);
  objc_destroyWeak((id *)&self->_scrubInstructionsTimer);
  objc_storeStrong((id *)&self->_detachedScrubInstructionsBackdropLabel, 0);
  objc_storeStrong((id *)&self->_scrubInstructionsLabel, 0);
  objc_storeStrong((id *)&self->_embeddedExtraContentContainer, 0);
  objc_storeStrong((id *)&self->_liveBroadcastScrubberLabel, 0);
  objc_storeStrong((id *)&self->_liveBroadcastLabel, 0);
  objc_storeStrong((id *)&self->_detachedExtraContentLayoutView, 0);
  objc_storeStrong((id *)&self->_controlsLayoutView, 0);
  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, 0);
  objc_storeStrong((id *)&self->_customMenuItemsViews, 0);
  objc_storeStrong((id *)&self->_customItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_controlOverflowButton, 0);
  objc_storeStrong((id *)&self->_mediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_routePickerView, 0);
  objc_storeStrong((id *)&self->_startRightwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_startLeftwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_standardPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAnimatingScrubInstructions:(BOOL)a3
{
  self->_animatingScrubInstructions = a3;
}

- (BOOL)isAnimatingScrubInstructions
{
  return self->_animatingScrubInstructions;
}

- (void)setShowingScrubInstructions:(BOOL)a3
{
  self->_showingScrubInstructions = a3;
}

- (BOOL)isShowingScrubInstructions
{
  return self->_showingScrubInstructions;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFlexibleViewAfterSkipForwardButtons:(id)a3
{
}

- (AVTouchIgnoringView)flexibleViewAfterSkipForwardButtons
{
  return self->_flexibleViewAfterSkipForwardButtons;
}

- (void)setFlexibleViewAfterRoutePickerView:(id)a3
{
}

- (AVTouchIgnoringView)flexibleViewAfterRoutePickerView
{
  return self->_flexibleViewAfterRoutePickerView;
}

- (void)setScrubberValueWhenScrubInstructionsTimerBegan:(float)a3
{
  self->_scrubberValueWhenScrubInstructionsTimerBegan = a3;
}

- (float)scrubberValueWhenScrubInstructionsTimerBegan
{
  return self->_scrubberValueWhenScrubInstructionsTimerBegan;
}

- (void)setScrubInstructionsTimer:(id)a3
{
}

- (NSTimer)scrubInstructionsTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubInstructionsTimer);

  return (NSTimer *)WeakRetained;
}

- (AVChromedLabel)detachedScrubInstructionsBackdropLabel
{
  return self->_detachedScrubInstructionsBackdropLabel;
}

- (UILabel)scrubInstructionsLabel
{
  return self->_scrubInstructionsLabel;
}

- (AVTouchIgnoringView)embeddedExtraContentContainer
{
  return self->_embeddedExtraContentContainer;
}

- (AVChromedLabel)liveBroadcastScrubberLabel
{
  return self->_liveBroadcastScrubberLabel;
}

- (AVChromedLabel)liveBroadcastLabel
{
  return self->_liveBroadcastLabel;
}

- (void)setDetachedExtraContentLayoutView:(id)a3
{
}

- (AVLayoutView)detachedExtraContentLayoutView
{
  return self->_detachedExtraContentLayoutView;
}

- (AVLayoutView)controlsLayoutView
{
  return self->_controlsLayoutView;
}

- (UIView)customContentTransitioningInfoPanel
{
  return self->_customContentTransitioningInfoPanel;
}

- (NSArray)customMenuItemsViews
{
  return self->_customMenuItemsViews;
}

- (NSArray)customItems
{
  return self->_customItems;
}

- (AVButton)playbackSpeedButton
{
  return self->_playbackSpeedButton;
}

- (AVControlOverflowButton)controlOverflowButton
{
  return self->_controlOverflowButton;
}

- (AVButton)mediaSelectionButton
{
  return self->_mediaSelectionButton;
}

- (AVPlaybackControlsRoutePickerView)routePickerView
{
  return self->_routePickerView;
}

- (AVButton)startRightwardContentTransitionButton
{
  return self->_startRightwardContentTransitionButton;
}

- (AVButton)startLeftwardContentTransitionButton
{
  return self->_startLeftwardContentTransitionButton;
}

- (AVButton)skipBackButton
{
  return self->_skipBackButton;
}

- (AVButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (AVButton)standardPlayPauseButton
{
  return self->_standardPlayPauseButton;
}

- (AVChromedLabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (AVChromedLabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (AVScrubber)scrubber
{
  return self->_scrubber;
}

- (double)minimumRequiredWidth
{
  return self->_minimumRequiredWidth;
}

- (void)setTransportViewIncludesVolumeController:(BOOL)a3
{
  self->_transportViewIncludesVolumeController = a3;
}

- (BOOL)transportViewIncludesVolumeController
{
  return self->_transportViewIncludesVolumeController;
}

- (BOOL)liveStreamingControlsIncludeScrubber
{
  return self->_liveStreamingControlsIncludeScrubber;
}

- (BOOL)showsLiveStreamingControls
{
  return self->_showsLiveStreamingControls;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (BOOL)isDoubleRowLayoutEnabled
{
  return self->_doubleRowLayoutEnabled;
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setDelegate:(id)a3
{
}

- (AVTransportControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVTransportControlsViewDelegate *)WeakRetained;
}

- (BOOL)_subviewIsCustomMenuItemView:(id)a3
{
  id v4 = a3;
  v5 = [(AVTransportControlsView *)self customMenuItemsViews];

  if (v5)
  {
    id v6 = v4;
    if (v6)
    {
      v7 = [(AVTransportControlsView *)self customMenuItemsViews];
      char v8 = [v7 containsObject:v6];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)canShowScrubInstructions
{
  v2 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSArray)doubleRowViews
{
  v22[17] = *MEMORY[0x1E4F143B8];
  scrubber = self->_scrubber;
  liveBroadcastLabel = self->_liveBroadcastLabel;
  elapsedTimeLabel = self->_elapsedTimeLabel;
  timeRemainingLabel = self->_timeRemainingLabel;
  liveBroadcastScrubberLabel = self->_liveBroadcastScrubberLabel;
  routePickerView = self->_routePickerView;
  flexibleViewAfterRoutePickerView = self->_flexibleViewAfterRoutePickerView;
  v22[0] = self->_embeddedExtraContentContainer;
  v22[1] = scrubber;
  skipBackButton = self->_skipBackButton;
  v22[2] = liveBroadcastLabel;
  v22[3] = elapsedTimeLabel;
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v22[4] = timeRemainingLabel;
  v22[5] = liveBroadcastScrubberLabel;
  standardPlayPauseButton = self->_standardPlayPauseButton;
  v22[6] = routePickerView;
  v22[7] = flexibleViewAfterRoutePickerView;
  startRightwardContentTransitionButton = self->_startRightwardContentTransitionButton;
  v22[8] = skipBackButton;
  v22[9] = startLeftwardContentTransitionButton;
  skipForwardButton = self->_skipForwardButton;
  v22[10] = standardPlayPauseButton;
  v22[11] = startRightwardContentTransitionButton;
  flexibleViewAfterSkipForwardButtons = self->_flexibleViewAfterSkipForwardButtons;
  v22[12] = skipForwardButton;
  v22[13] = flexibleViewAfterSkipForwardButtons;
  playbackSpeedButton = self->_playbackSpeedButton;
  v22[14] = self->_mediaSelectionButton;
  v22[15] = playbackSpeedButton;
  v22[16] = self->_controlOverflowButton;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:17];
  v18 = [(AVTransportControlsView *)self customMenuItemsViews];

  if (v18)
  {
    v19 = [(AVTransportControlsView *)self customMenuItemsViews];
    uint64_t v20 = [v17 arrayByAddingObjectsFromArray:v19];

    v17 = (void *)v20;
  }

  return (NSArray *)v17;
}

- (NSArray)singleRowViews
{
  v23[10] = *MEMORY[0x1E4F143B8];
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v23[0] = self->_skipBackButton;
  v23[1] = startLeftwardContentTransitionButton;
  skipForwardButton = self->_skipForwardButton;
  v23[2] = self->_standardPlayPauseButton;
  v23[3] = skipForwardButton;
  liveBroadcastLabel = self->_liveBroadcastLabel;
  v23[4] = self->_startRightwardContentTransitionButton;
  v23[5] = liveBroadcastLabel;
  scrubber = self->_scrubber;
  v23[6] = self->_elapsedTimeLabel;
  v23[7] = scrubber;
  liveBroadcastScrubberLabel = self->_liveBroadcastScrubberLabel;
  v23[8] = self->_timeRemainingLabel;
  v23[9] = liveBroadcastScrubberLabel;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:10];
  mediaSelectionButton = self->_mediaSelectionButton;
  v22[0] = self->_routePickerView;
  v22[1] = mediaSelectionButton;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v11 = [v8 arrayByAddingObjectsFromArray:v10];

  v12 = [(AVTransportControlsView *)self customItems];
  v13 = [v11 arrayByAddingObjectsFromArray:v12];

  v14 = [(AVTransportControlsView *)self customMenuItemsViews];

  if (v14)
  {
    v15 = [(AVTransportControlsView *)self customMenuItemsViews];
    uint64_t v16 = [v13 arrayByAddingObjectsFromArray:v15];

    v13 = (void *)v16;
  }
  playbackSpeedButton = self->_playbackSpeedButton;
  v21[0] = self->_controlOverflowButton;
  v21[1] = playbackSpeedButton;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v19 = [v13 arrayByAddingObjectsFromArray:v18];

  return (NSArray *)v19;
}

- (void)_updateCustomContentTransitioningInfoPanelLayout
{
  BOOL v3 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];

  if (!v3) {
    return;
  }
  BOOL v4 = [(AVTransportControlsView *)self isDoubleRowLayoutEnabled];
  v5 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
  id v6 = [v5 superview];
  if (v4)
  {
    v7 = [(AVTransportControlsView *)self embeddedExtraContentContainer];

    if (v6 != v7)
    {
      char v8 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
      v9 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
      [v8 addSubview:v9];
    }
    v10 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    v11 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
    [v11 bounds];
    objc_msgSend(v10, "setFrame:");
    goto LABEL_9;
  }
  v12 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];

  if (v6 != v12)
  {
    v10 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
    v11 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    [v10 addSubview:v11];
LABEL_9:
  }
  v13 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
  objc_msgSend(v13, "setHidden:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"));

  v14 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
  if ([(AVTransportControlsView *)self isDoubleRowLayoutEnabled]) {
    double v15 = 0.0;
  }
  else {
    double v15 = 1.0;
  }
  [v14 setAlpha:v15];

  uint64_t v16 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  objc_msgSend(v16, "setCollapsed:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled") ^ 1);

  v17 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  objc_msgSend(v17, "setIncluded:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled"));

  id v19 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  if ([(AVTransportControlsView *)self isDoubleRowLayoutEnabled]) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  [v19 setAlpha:v18];
}

- (id)_scrubInstructionsAttributedText
{
  v25[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = AVLocalizedString(@"PLAYBACK_CONTROLS_VIEW_CONTROLLER_SCRUB_INSTRUCTIONS_SLIDE_UP_TITLE_LABEL_TEXT");
  BOOL v4 = [(AVTransportControlsView *)self scrubber];
  v5 = [v4 localizedScrubbingSpeedName];

  id v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB28F0];
  char v8 = [(AVTransportControlsView *)self traitCollection];
  v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];

  v10 = (void *)MEMORY[0x1E4FB08E0];
  [v9 pointSize];
  v11 = objc_msgSend(v10, "systemFontOfSize:weight:");
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v24 = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = v24;
  v25[0] = v9;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  double v15 = (void *)[v12 initWithString:v3 attributes:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F28E48]);
  v17 = [v5 stringByAppendingString:@"\n"];
  uint64_t v22 = v13;
  v23 = v11;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v19 = (void *)[v16 initWithString:v17 attributes:v18];

  [v19 appendAttributedString:v15];
  uint64_t v20 = (void *)[v19 copy];

  return v20;
}

- (void)_updateScrubInstructionsFrame
{
  [(AVTransportControlsView *)self frame];
  CGFloat v3 = CGRectGetMinY(v38) + -8.0;
  BOOL v4 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v4 intrinsicContentSize];
  CGFloat v6 = v3 - v5 + -20.0;

  uint64_t v7 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v7 intrinsicContentSize];
  double v9 = v8 + 20.0;

  v10 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v10 intrinsicContentSize];
  double v12 = v11 + 20.0;

  uint64_t v13 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
  objc_msgSend(v13, "setFrame:", 0.0, v6, v9, v12);

  v14 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  double v15 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v15 intrinsicContentSize];
  double v17 = v16;
  double v18 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v18 intrinsicContentSize];
  objc_msgSend(v14, "setFrame:", 10.0, 10.0, v17, v19);

  uint64_t v20 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
  [(AVTransportControlsView *)self center];
  double v22 = v21;
  v23 = [(AVTransportControlsView *)self detachedExtraContentLayoutView];
  [v23 center];
  [v20 setCenter:v22];

  uint64_t v24 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  v25 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  [v25 bounds];
  objc_msgSend(v24, "sizeThatFits:", v26, v27);
  double v29 = v28;
  double v31 = v30;

  v32 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  objc_msgSend(v32, "setFrame:", 0.0, 0.0, v29, v31);

  id v36 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  v33 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  [v33 frame];
  CGFloat v34 = CGRectGetWidth(v39) * 0.5;
  v35 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  [v35 center];
  [v36 setCenter:v34];
}

- (void)_updateScrubInstructionsLabelsText
{
  CGFloat v3 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];

  if (v3)
  {
    BOOL v4 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
    [v4 setAttributedText:0];

    id v12 = [(AVTransportControlsView *)self scrubInstructionsLabel];
    [v12 setAttributedText:0];
  }
  else
  {
    id v12 = [(AVTransportControlsView *)self _scrubInstructionsAttributedText];
    double v5 = [(AVTransportControlsView *)self scrubInstructionsLabel];
    CGFloat v6 = [v5 attributedText];
    char v7 = [v12 isEqualToAttributedString:v6];

    if ((v7 & 1) == 0)
    {
      double v8 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
      double v9 = [(AVTransportControlsView *)self _scrubInstructionsAttributedText];
      [v8 setAttributedText:v9];

      v10 = [(AVTransportControlsView *)self scrubInstructionsLabel];
      double v11 = [(AVTransportControlsView *)self _scrubInstructionsAttributedText];
      [v10 setAttributedText:v11];
    }
  }
}

- (void)_showScrubInstructions
{
  if (![(AVTransportControlsView *)self canShowScrubInstructions])
  {
    CGFloat v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Do not call this method when showing the content info panel.", buf, 2u);
    }
  }
  [(AVTransportControlsView *)self bounds];
  double Width = CGRectGetWidth(v12);
  double v5 = [(AVTransportControlsView *)self styleSheet];
  [v5 doubleRowLayoutMargins];
  if (Width <= v6)
  {
  }
  else
  {
    BOOL v7 = [(AVTransportControlsView *)self isShowingScrubInstructions];

    if (!v7)
    {
      [(AVTransportControlsView *)self setShowingScrubInstructions:1];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke;
      v10[3] = &unk_1E5FC4698;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
      v8[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke_2;
      v9[3] = &unk_1E5FC4698;
      v9[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__AVTransportControlsView__showScrubInstructions__block_invoke_3;
      v8[3] = &unk_1E5FC3528;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:133122 delay:v9 options:v8 animations:0.3 completion:0.0];
    }
  }
}

void __49__AVTransportControlsView__showScrubInstructions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateScrubInstructionsLabelsText];
  [*(id *)(a1 + 32) _updateScrubInstructionsFrame];
  v2 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  [v2 setAlpha:0.0];

  CGFloat v3 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  [v3 setHidden:0];

  BOOL v4 = [*(id *)(a1 + 32) embeddedExtraContentContainer];
  objc_msgSend(v4, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled"));

  double v5 = [*(id *)(a1 + 32) embeddedExtraContentContainer];
  objc_msgSend(v5, "setCollapsed:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled") ^ 1);

  double v6 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
  [v6 setAlpha:0.0];

  BOOL v7 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
  objc_msgSend(v7, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isDoubleRowLayoutEnabled"));

  double v8 = [*(id *)(a1 + 32) detachedScrubInstructionsBackdropLabel];
  [v8 setAlpha:0.0];

  double v9 = [*(id *)(a1 + 32) detachedScrubInstructionsBackdropLabel];
  [v9 setHidden:0];

  v10 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  [v10 layoutIfNeeded];

  double v11 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
  [v11 layoutIfNeeded];

  CGRect v12 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  +[AVBackdropView applySecondaryGlyphTintToView:v12];

  id v13 = [*(id *)(a1 + 32) detachedScrubInstructionsBackdropLabel];
  +[AVBackdropView applySecondaryGlyphTintToView:v13];
}

void __49__AVTransportControlsView__showScrubInstructions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingScrubInstructions:1];
  char v2 = [*(id *)(a1 + 32) isDoubleRowLayoutEnabled];
  CGFloat v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (![v3 isDoubleRowLayoutEnabled]) {
      goto LABEL_6;
    }
    BOOL v4 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  }
  else
  {
    double v5 = [v3 detachedScrubInstructionsBackdropLabel];
    [v5 setAlpha:1.0];

    BOOL v4 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
  }
  double v6 = v4;
  [v4 setAlpha:1.0];

LABEL_6:
  if ([*(id *)(a1 + 32) isDoubleRowLayoutEnabled])
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 transportControlsNeedsLayoutIfNeeded:*(void *)(a1 + 32)];
  }
}

uint64_t __49__AVTransportControlsView__showScrubInstructions__block_invoke_3(uint64_t a1, int a2)
{
  return [*(id *)(a1 + 32) setAnimatingScrubInstructions:a2 ^ 1u];
}

- (void)_updateFontSizes
{
  CGFloat v3 = [(AVTransportControlsView *)self elapsedTimeLabel];
  BOOL v4 = [(AVTransportControlsView *)self styleSheet];
  double v5 = [v4 scrubberTimeLabelFont];
  [v3 setFont:v5];

  double v6 = [(AVTransportControlsView *)self timeRemainingLabel];
  id v7 = [(AVTransportControlsView *)self styleSheet];
  double v8 = [v7 scrubberTimeLabelFont];
  [v6 setFont:v8];

  double v9 = [(AVTransportControlsView *)self liveBroadcastLabel];
  v10 = [(AVTransportControlsView *)self styleSheet];
  double v11 = [v10 infoLabelFont];
  [v9 setFont:v11];

  CGRect v12 = [(AVTransportControlsView *)self liveBroadcastScrubberLabel];
  id v13 = [(AVTransportControlsView *)self styleSheet];
  v14 = [v13 scrubberInfoLabelFont];
  [v12 setFont:v14];

  [(AVTransportControlsView *)self setNeedsLayout];
}

- (unint64_t)_layoutItemDisplayPriorityForSubview:(id)a3
{
  id v4 = a3;
  [(AVTransportControlsView *)self _subviewIsCustomMenuItemView:v4];
  uint64_t v5 = [(AVTransportControlsView *)self standardPlayPauseButton];
  if ((id)v5 == v4)
  {

    goto LABEL_16;
  }
  double v6 = (void *)v5;
  id v7 = [(AVTransportControlsView *)self embeddedExtraContentContainer];

  if (v7 == v4)
  {
LABEL_16:
    unint64_t v30 = 4;
    goto LABEL_20;
  }
  uint64_t v8 = [(AVTransportControlsView *)self scrubber];
  if ((id)v8 == v4)
  {

    goto LABEL_19;
  }
  double v9 = (void *)v8;
  uint64_t v10 = [(AVTransportControlsView *)self timeRemainingLabel];
  if ((id)v10 == v4)
  {

    goto LABEL_19;
  }
  double v11 = (void *)v10;
  id v12 = [(AVTransportControlsView *)self controlOverflowButton];

  if (v12 == v4)
  {
LABEL_19:
    unint64_t v30 = 3;
    goto LABEL_20;
  }
  uint64_t v13 = [(AVTransportControlsView *)self elapsedTimeLabel];
  if ((id)v13 == v4)
  {

    goto LABEL_23;
  }
  v14 = (void *)v13;
  uint64_t v15 = [(AVTransportControlsView *)self liveBroadcastLabel];
  if ((id)v15 == v4)
  {

    goto LABEL_23;
  }
  double v16 = (void *)v15;
  id v17 = [(AVTransportControlsView *)self routePickerView];

  if (v17 == v4)
  {
LABEL_23:
    unint64_t v30 = 2;
    goto LABEL_20;
  }
  uint64_t v18 = [(AVTransportControlsView *)self skipBackButton];
  double v19 = v4;
  if ((id)v18 == v4)
  {
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v20 = (void *)v18;
  uint64_t v21 = [(AVTransportControlsView *)self skipForwardButton];
  double v22 = v4;
  if ((id)v21 == v4)
  {
LABEL_26:

    double v19 = v20;
    goto LABEL_27;
  }
  v23 = (void *)v21;
  uint64_t v24 = [(AVTransportControlsView *)self startLeftwardContentTransitionButton];
  v25 = v4;
  if ((id)v24 == v4)
  {
LABEL_25:

    double v22 = v23;
    goto LABEL_26;
  }
  double v26 = (void *)v24;
  uint64_t v27 = [(AVTransportControlsView *)self startRightwardContentTransitionButton];
  if ((id)v27 == v4)
  {

    v25 = v26;
    goto LABEL_25;
  }
  double v28 = (void *)v27;
  id v29 = [(AVTransportControlsView *)self mediaSelectionButton];

  if (v29 == v4)
  {
LABEL_28:
    unint64_t v30 = 1;
    goto LABEL_20;
  }
  unint64_t v30 = 0;
LABEL_20:

  return v30;
}

- (double)_rowSpacingForDoubleRowLayoutAfterRow:(unint64_t)a3
{
  BOOL v5 = [(AVTransportControlsView *)self isDoubleRowLayoutEnabled];
  double v6 = 0.0;
  if (!a3 && v5)
  {
    uint64_t v7 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      double v9 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
      int v10 = [v9 isHiddenOrHasHiddenAncestor];

      if (v10) {
        double v6 = 0.0;
      }
      else {
        double v6 = 12.0;
      }
    }
  }
  if (((a3 == 1) & [(AVTransportControlsView *)self isDoubleRowLayoutEnabled]) != 0) {
    double v6 = 4.5;
  }
  BOOL v11 = [(AVTransportControlsView *)self isDoubleRowLayoutEnabled];
  if (!a3 && v11)
  {
    id v12 = [(AVTransportControlsView *)self scrubInstructionsLabel];
    [v12 alpha];
    double v14 = v13;

    if (v14 == 1.0)
    {
      uint64_t v15 = [(AVTransportControlsView *)self styleSheet];
      [v15 spacingBetweenScrubInstructionsAndScrubber];
      double v6 = v16;
    }
  }
  return v6;
}

- (void)_layoutSingleRowViews
{
  v43[1] = *MEMORY[0x1E4F143B8];
  CGFloat v3 = [(AVTransportControlsView *)self liveBroadcastLabel];
  [v3 setLoadingIndicatorAlignment:1];

  id v4 = [(AVTransportControlsView *)self controlsLayoutView];
  BOOL v5 = [(AVTransportControlsView *)self singleRowViews];
  v43[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v4 setArrangedSubviews:v6];

  double v7 = 0.0;
  if (![(AVTransportControlsView *)self isCollapsedOrExcluded])
  {
    if ([(AVTransportControlsView *)self hasFullScreenAppearance]) {
      double v7 = 18.0;
    }
    else {
      double v7 = 14.0;
    }
  }
  uint64_t v8 = [(AVTransportControlsView *)self controlsLayoutView];
  objc_msgSend(v8, "setContentLayoutMargins:", 0.0, v7, 0.0, v7);

  [(AVTransportControlsView *)self bounds];
  if (CGRectGetWidth(v44) < 568.0)
  {
    double v11 = 95.0;
  }
  else
  {
    double v9 = [(AVTransportControlsView *)self styleSheet];
    [v9 minimumScrubberSize];
    double v11 = v10;
  }
  id v12 = [(AVTransportControlsView *)self scrubber];
  double v13 = [v12 layoutAttributes];
  double v14 = [(AVTransportControlsView *)self styleSheet];
  [v14 minimumScrubberSize];
  [v13 setMinimumSize:v11];

  uint64_t v15 = [(AVTransportControlsView *)self scrubber];
  double v16 = [v15 layoutAttributes];
  id v17 = [(AVTransportControlsView *)self timeRemainingLabel];
  uint64_t v18 = [v17 layoutAttributes];
  [v16 setDisplayPartnerAttributes:v18];

  double v19 = [(AVTransportControlsView *)self timeRemainingLabel];
  uint64_t v20 = [v19 layoutAttributes];
  uint64_t v21 = [(AVTransportControlsView *)self scrubber];
  double v22 = [v21 layoutAttributes];
  [v20 setDisplayPartnerAttributes:v22];

  v23 = [(AVTransportControlsView *)self skipBackButton];
  uint64_t v24 = [v23 layoutAttributes];
  v25 = [(AVTransportControlsView *)self skipForwardButton];
  double v26 = [v25 layoutAttributes];
  [v24 setDisplayPartnerAttributes:v26];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v27 = [(AVTransportControlsView *)self singleRowViews];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v33 = [v32 layoutAttributes];
        [(AVTransportControlsView *)self _singeRowLayoutSpacingAfterSubview:v32];
        objc_msgSend(v33, "setTrailingInterItemSpace:");

        CGFloat v34 = [v32 layoutAttributes];
        objc_msgSend(v34, "setDisplayPriority:", -[AVTransportControlsView _layoutItemDisplayPriorityForSubview:](self, "_layoutItemDisplayPriorityForSubview:", v32));

        v35 = [v32 layoutAttributes];
        id v36 = [(AVTransportControlsView *)self scrubber];
        if (v32 == v36)
        {
          [v35 setHasFlexibleContentSize:1];
        }
        else
        {
          v37 = [(AVTransportControlsView *)self liveBroadcastLabel];
          [v35 setHasFlexibleContentSize:v32 == v37];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v29);
  }
}

- (void)_layoutDoubleRowViews
{
  v106[1] = *MEMORY[0x1E4F143B8];
  CGFloat v3 = [(AVTransportControlsView *)self controlsLayoutView];
  id v4 = [(AVTransportControlsView *)self styleSheet];
  [v4 doubleRowLayoutMargins];
  objc_msgSend(v3, "setContentLayoutMargins:");

  BOOL v5 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  [v5 alpha];
  double v7 = v6;

  if (v7 == 1.0)
  {
    uint64_t v8 = [(AVTransportControlsView *)self controlsLayoutView];
    double v9 = [(AVTransportControlsView *)self styleSheet];
    [v9 doubleRowLayoutMarginsWhenShowingScrubInstructions];
  }
  else
  {
    uint64_t v30 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    if (!v30) {
      goto LABEL_4;
    }
    double v31 = (void *)v30;
    v32 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    char v33 = [v32 isHidden];

    if (v33) {
      goto LABEL_4;
    }
    uint64_t v8 = [(AVTransportControlsView *)self controlsLayoutView];
    double v9 = [(AVTransportControlsView *)self styleSheet];
    [v9 doublerowLayoutMarginsWhenShowingCustomContentInfo];
  }
  objc_msgSend(v8, "setContentLayoutMargins:");

LABEL_4:
  double v10 = [(AVTransportControlsView *)self liveBroadcastLabel];
  [v10 setLoadingIndicatorAlignment:2];

  v95 = [(AVTransportControlsView *)self doubleRowViews];
  double v11 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
  v106[0] = v11;
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];

  id v12 = [(AVTransportControlsView *)self scrubber];
  v105[0] = v12;
  double v13 = [(AVTransportControlsView *)self liveBroadcastLabel];
  v105[1] = v13;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];

  double v14 = [(AVTransportControlsView *)self elapsedTimeLabel];
  v104[0] = v14;
  uint64_t v15 = [(AVTransportControlsView *)self timeRemainingLabel];
  v104[1] = v15;
  double v16 = [(AVTransportControlsView *)self liveBroadcastScrubberLabel];
  v104[2] = v16;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];

  v90 = [(AVTransportControlsView *)self routePickerView];
  v103[0] = v90;
  v89 = [(AVTransportControlsView *)self flexibleViewAfterRoutePickerView];
  v103[1] = v89;
  v88 = [(AVTransportControlsView *)self startLeftwardContentTransitionButton];
  v103[2] = v88;
  id v17 = [(AVTransportControlsView *)self skipBackButton];
  v103[3] = v17;
  uint64_t v18 = [(AVTransportControlsView *)self standardPlayPauseButton];
  v103[4] = v18;
  double v19 = [(AVTransportControlsView *)self skipForwardButton];
  v103[5] = v19;
  uint64_t v20 = [(AVTransportControlsView *)self startRightwardContentTransitionButton];
  v103[6] = v20;
  uint64_t v21 = [(AVTransportControlsView *)self flexibleViewAfterSkipForwardButtons];
  v103[7] = v21;
  double v22 = [(AVTransportControlsView *)self mediaSelectionButton];
  v103[8] = v22;
  v23 = [(AVTransportControlsView *)self playbackSpeedButton];
  v103[9] = v23;
  uint64_t v24 = [(AVTransportControlsView *)self controlOverflowButton];
  v103[10] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:11];

  double v26 = [(AVTransportControlsView *)self customMenuItemsViews];

  if (v26)
  {
    uint64_t v27 = [(AVTransportControlsView *)self customMenuItemsViews];
    uint64_t v28 = [v25 arrayByAddingObjectsFromArray:v27];

    uint64_t v29 = (void *)v28;
  }
  else
  {
    uint64_t v29 = v25;
  }
  CGFloat v34 = [(AVTransportControlsView *)self flexibleViewAfterSkipForwardButtons];
  v35 = [v34 layoutAttributes];
  double v36 = *MEMORY[0x1E4F1DB30];
  double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_msgSend(v35, "setMinimumSize:", *MEMORY[0x1E4F1DB30], v37);

  long long v38 = [(AVTransportControlsView *)self flexibleViewAfterRoutePickerView];
  long long v39 = [v38 layoutAttributes];
  objc_msgSend(v39, "setMinimumSize:", v36, v37);

  long long v40 = [(AVTransportControlsView *)self controlsLayoutView];
  v102[0] = v93;
  v102[1] = v92;
  v102[2] = v94;
  v102[3] = v29;
  v91 = v29;
  long long v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
  [v40 setArrangedSubviews:v41];

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v42 = v95;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v98 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        v48 = [v47 layoutAttributes];
        [(AVTransportControlsView *)self _doubleRowLayoutSpacingAfterSubview:v47];
        objc_msgSend(v48, "setTrailingInterItemSpace:");

        v49 = [v47 layoutAttributes];
        objc_msgSend(v49, "setDisplayPriority:", -[AVTransportControlsView _layoutItemDisplayPriorityForSubview:](self, "_layoutItemDisplayPriorityForSubview:", v47));

        v50 = [(AVTransportControlsView *)self scrubber];

        if (v47 == v50)
        {
          v57 = [v47 layoutAttributes];
          v58 = [(AVTransportControlsView *)self styleSheet];
          [v58 minimumScrubberSize];
          objc_msgSend(v57, "setMinimumSize:");
        }
        else
        {
          v51 = [(AVTransportControlsView *)self embeddedExtraContentContainer];

          if (v47 != v51) {
            continue;
          }
          v52 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];

          if (v52)
          {
            v53 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
            [(AVTransportControlsView *)self frame];
            objc_msgSend(v53, "systemLayoutSizeFittingSize:", v54, v55);
            double v96 = v56;
          }
          else
          {
            v53 = [(AVTransportControlsView *)self scrubInstructionsLabel];
            v59 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
            [v59 bounds];
            objc_msgSend(v53, "sizeThatFits:", v60, v61);
            double v96 = v62;
          }
          [(AVTransportControlsView *)self bounds];
          double v64 = v63;
          double v66 = v65;
          double v68 = v67;
          double v70 = v69;
          v71 = [(AVTransportControlsView *)self controlsLayoutView];
          [v71 contentLayoutMargins];
          double v73 = v72;
          double v75 = v74;
          double v77 = v76;
          double v79 = v78;
          uint64_t v80 = [(AVTransportControlsView *)self effectiveUserInterfaceLayoutDirection];
          if (v80 == 1) {
            double v81 = v79;
          }
          else {
            double v81 = v75;
          }
          if (v80 == 1) {
            double v82 = v75;
          }
          else {
            double v82 = v79;
          }
          v107.origin.x = v64 + v81;
          v107.origin.y = v66 + v73;
          v107.size.double width = v68 - (v81 + v82);
          v107.size.double height = v70 - (v73 + v77);
          double Width = CGRectGetWidth(v107);

          v57 = [v47 layoutAttributes];
          objc_msgSend(v57, "setMinimumSize:", Width, v96);
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v97 objects:v101 count:16];
    }
    while (v44);
  }

  for (uint64_t j = 0; j != 4; ++j)
  {
    [(AVTransportControlsView *)self _rowSpacingForDoubleRowLayoutAfterRow:j];
    double v86 = v85;
    v87 = [(AVTransportControlsView *)self controlsLayoutView];
    [v87 setRowSpacing:j afterRow:v86];
  }
}

- (double)_doubleRowLayoutSpacingAfterSubview:(id)a3
{
  id v4 = a3;
  [(AVTransportControlsView *)self bounds];
  double Width = CGRectGetWidth(v41);
  double v6 = [(AVTransportControlsView *)self controlsLayoutView];
  double v7 = [(AVTransportControlsView *)self skipForwardButton];
  if ([v7 isIncluded])
  {
    int v8 = 0;
  }
  else
  {
    double v9 = [(AVTransportControlsView *)self startRightwardContentTransitionButton];
    int v10 = [v9 isIncluded];

    int v8 = v10 ^ 1;
  }

  uint64_t v11 = [(AVTransportControlsView *)self skipBackButton];
  if ((id)v11 != v4)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [(AVTransportControlsView *)self startLeftwardContentTransitionButton];
    if ((id)v13 == v4)
    {
    }
    else
    {
      double v14 = (void *)v13;
      uint64_t v15 = [(AVTransportControlsView *)self mediaSelectionButton];
      if ((id)v15 == v4)
      {
      }
      else
      {
        double v16 = (void *)v15;
        uint64_t v17 = [(AVTransportControlsView *)self standardPlayPauseButton];
        if ((id)v17 == v4) {
          int v18 = v8;
        }
        else {
          int v18 = 1;
        }
        if (v18 == 1)
        {
          double v19 = (void *)v17;
          uint64_t v20 = [(AVTransportControlsView *)self playbackSpeedButton];
          if ((id)v20 != v4)
          {
            uint64_t v21 = (void *)v20;
            id v22 = [(AVTransportControlsView *)self controlOverflowButton];

            if (v22 == v4)
            {
              double v25 = 32.0;
              goto LABEL_30;
            }
            id v23 = [(AVTransportControlsView *)self elapsedTimeLabel];

            if (v23 == v4)
            {
              uint64_t v29 = [(AVTransportControlsView *)self elapsedTimeLabel];
              [v29 intrinsicContentSize];
              double v31 = Width - v30;
              [v6 contentLayoutMargins];
              double v33 = v31 - v32;
              [v6 contentLayoutMargins];
              double v25 = v33 - v34;

              v35 = [(AVTransportControlsView *)self timeRemainingLabel];
              int v36 = [v35 isIncluded];

              if (v36)
              {
                double v37 = [(AVTransportControlsView *)self timeRemainingLabel];
              }
              else
              {
                long long v38 = [(AVTransportControlsView *)self liveBroadcastScrubberLabel];
                int v39 = [v38 isIncluded];

                if (!v39) {
                  goto LABEL_30;
                }
                double v37 = [(AVTransportControlsView *)self liveBroadcastScrubberLabel];
              }
              id v12 = v37;
              [v37 intrinsicContentSize];
              double v25 = v25 - v40;
              goto LABEL_29;
            }
            uint64_t v24 = [(AVTransportControlsView *)self routePickerView];
            double v25 = 0.0;
            if ((id)v24 != v4)
            {
              id v12 = (void *)v24;
              id v26 = [(AVTransportControlsView *)self skipForwardButton];
              if (v26 != v4)
              {
                id v27 = [(AVTransportControlsView *)self startRightwardContentTransitionButton];
                if (v27 != v4)
                {
                  [(AVTransportControlsView *)self standardPlayPauseButton];
                }
              }

              goto LABEL_29;
            }
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
    double v25 = 32.0;
    goto LABEL_29;
  }
  double v25 = 32.0;
LABEL_21:
  id v12 = v4;
LABEL_29:

LABEL_30:
  return v25;
}

- (double)_singeRowLayoutSpacingAfterSubview:(id)a3
{
  id v4 = (AVButton *)a3;
  [(AVTransportControlsView *)self _subviewIsCustomMenuItemView:v4];
  double v5 = 16.0;
  if (![(AVTransportControlsView *)self hasFullScreenAppearance]) {
    goto LABEL_32;
  }
  if ([(AVTransportControlsView *)self hasFullScreenAppearance])
  {
    [(AVTransportControlsView *)self bounds];
    BOOL v6 = CGRectGetWidth(v22) < 568.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  double v7 = [(AVTransportControlsView *)self skipBackButton];
  if ([v7 isIncluded])
  {
  }
  else
  {
    int v8 = [(AVTransportControlsView *)self startLeftwardContentTransitionButton];
    char v9 = [v8 isIncluded];

    if ((v9 & 1) == 0)
    {
      double v5 = 0.0;
      if (self->_skipBackButton != v4
        && self->_startLeftwardContentTransitionButton != v4
        && self->_skipForwardButton != v4)
      {
        if (self->_startRightwardContentTransitionButton == v4) {
          double v5 = 0.0;
        }
        else {
          double v5 = 20.0;
        }
      }
      goto LABEL_19;
    }
  }
  if (v6)
  {
    double v5 = 32.0;
  }
  else if ([(AVTransportControlsView *)self hasFullScreenAppearance])
  {
    double v5 = 32.0;
  }
  else
  {
    double v5 = 0.0;
  }
LABEL_19:
  int v10 = [(AVTransportControlsView *)self customItems];

  if (v10)
  {
    if (self->_mediaSelectionButton == v4)
    {
      double v14 = [(AVTransportControlsView *)self skipBackButton];
      if ([v14 isIncluded])
      {
        double v5 = 32.0;
      }
      else
      {
        uint64_t v15 = [(AVTransportControlsView *)self startLeftwardContentTransitionButton];
        if ([v15 isIncluded]) {
          double v5 = 32.0;
        }
        else {
          double v5 = 20.0;
        }
      }
    }
    else if ([(AVButton *)v4 conformsToProtocol:&unk_1F095D728])
    {
      uint64_t v11 = v4;
      id v12 = [(AVTransportControlsView *)self customItems];
      int v13 = [v12 containsObject:v11];

      if (v13) {
        double v5 = 16.0;
      }
    }
  }
LABEL_32:
  if ((AVButton *)self->_liveBroadcastLabel == v4)
  {
    double v5 = 0.0;
  }
  else if ((AVButton *)self->_elapsedTimeLabel == v4 || (AVButton *)self->_scrubber == v4)
  {
    double v5 = 5.0;
  }
  double v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v17 = [v16 traitCollection];
  uint64_t v18 = [v17 userInterfaceIdiom];

  double v19 = 0.77;
  if (v18 != 5) {
    double v19 = 1.0;
  }
  double v20 = v5 * v19;

  return v20;
}

- (void)endScrubbing:(id)a3
{
  id v4 = a3;
  [(AVTransportControlsView *)self setScrubberValueWhenScrubInstructionsTimerBegan:0.0];
  double v5 = [(AVTransportControlsView *)self scrubInstructionsTimer];
  [v5 invalidate];

  BOOL v6 = [(AVTransportControlsView *)self delegate];
  [v6 transportControls:self scrubberDidEndScrubbing:v4];

  if ([(AVTransportControlsView *)self canShowScrubInstructions])
  {
    if ([(AVTransportControlsView *)self isShowingScrubInstructions])
    {
      [(AVTransportControlsView *)self setShowingScrubInstructions:0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__AVTransportControlsView_endScrubbing___block_invoke;
      v8[3] = &unk_1E5FC4698;
      v8[4] = self;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__AVTransportControlsView_endScrubbing___block_invoke_2;
      v7[3] = &unk_1E5FC3528;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:133126 delay:v8 options:v7 animations:0.3 completion:0.0];
    }
  }
}

void __40__AVTransportControlsView_endScrubbing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingScrubInstructions:1];
  char v2 = [*(id *)(a1 + 32) scrubInstructionsLabel];
  [v2 setAlpha:0.0];

  CGFloat v3 = [*(id *)(a1 + 32) detachedScrubInstructionsBackdropLabel];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
  [v4 setAlpha:0.0];

  double v5 = [*(id *)(a1 + 32) embeddedExtraContentContainer];
  [v5 setCollapsed:1];

  BOOL v6 = [*(id *)(a1 + 32) embeddedExtraContentContainer];
  [v6 setIncluded:0];

  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 transportControlsNeedsLayoutIfNeeded:*(void *)(a1 + 32)];
}

void __40__AVTransportControlsView_endScrubbing___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setAnimatingScrubInstructions:0];
    objc_msgSend(*(id *)(a1 + 32), "avkit_reevaluateHiddenStateOfItem:", *(void *)(a1 + 32));
    CGFloat v3 = [*(id *)(a1 + 32) scrubInstructionsLabel];
    [v3 setHidden:1];

    id v4 = [*(id *)(a1 + 32) detachedScrubInstructionsBackdropLabel];
    [v4 setHidden:1];

    id v5 = [*(id *)(a1 + 32) detachedExtraContentLayoutView];
    [v5 setHidden:1];
  }
}

- (void)scrubberValueChanged:(id)a3
{
  id v4 = a3;
  [(AVTransportControlsView *)self _updateScrubInstructionsLabelsText];
  [(AVTransportControlsView *)self _updateScrubInstructionsFrame];
  id v5 = [(AVTransportControlsView *)self delegate];
  [v5 transportControls:self scrubberDidScrub:v4];
}

- (void)beginScrubbing:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTransportControlsView *)self delegate];
  [v5 transportControls:self scrubberDidBeginScrubbing:v4];

  BOOL v6 = [(AVTransportControlsView *)self scrubInstructionsLabel];
  [v6 setHidden:1];

  id v7 = [(AVTransportControlsView *)self detachedScrubInstructionsBackdropLabel];
  [v7 setHidden:1];
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    [(AVTransportControlsView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_collapsed != a3)
  {
    BOOL v3 = a3;
    self->_collapsed = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVTransportControlsView *)self singleRowViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setCollapsed:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(AVTransportControlsView *)self invalidateIntrinsicContentSize];
    [(AVTransportControlsView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(AVTransportControlsView *)self invalidateIntrinsicContentSize];
    [(AVTransportControlsView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVTransportControlsView *)self isCollapsed]
    || ![(AVTransportControlsView *)self isIncluded])
  {
    return 1;
  }

  return [(AVTransportControlsView *)self isRemoved];
}

- (void)scrubberSlowKnobMovementDetected:(id)a3
{
  if ([(AVTransportControlsView *)self canShowScrubInstructions])
  {
    [(AVTransportControlsView *)self _showScrubInstructions];
  }
}

- (void)avkit_reevaluateHiddenStateOfItem:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTransportControlsView *)self embeddedExtraContentContainer];

  if (v5 == v4)
  {
    uint64_t v6 = [v4 isCollapsedOrExcluded];
    double v7 = 1.0;
    if (v6) {
      double v7 = 0.0;
    }
    [v4 setAlpha:v7];
    BOOL v8 = [(AVTransportControlsView *)self isAnimatingScrubInstructions];
    if ((v6 & 1) != 0 || !v8)
    {
      if (![(AVTransportControlsView *)self isAnimatingScrubInstructions])
      {
        [v4 setHidden:v6];
        [v4 setAlpha:1.0];
      }
    }
    else
    {
      [v4 setHidden:0];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVTransportControlsView;
    [(UIView *)&v9 avkit_reevaluateHiddenStateOfItem:v4];
  }
}

- (void)layoutSubviews
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v57.receiver = self;
  v57.super_class = (Class)AVTransportControlsView;
  [(AVView *)&v57 layoutSubviews];
  [(UIView *)self avkit_makeSubtreeDisallowGroupBlending];
  BOOL v3 = [(AVTransportControlsView *)self liveBroadcastScrubberLabel];
  objc_msgSend(v3, "setIncluded:", -[AVTransportControlsView liveStreamingControlsIncludeScrubber](self, "liveStreamingControlsIncludeScrubber"));

  id v4 = [(AVTransportControlsView *)self liveBroadcastLabel];
  if ([(AVTransportControlsView *)self showsLiveStreamingControls]) {
    uint64_t v5 = [(AVTransportControlsView *)self liveStreamingControlsIncludeScrubber] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  if ([(AVTransportControlsView *)self showsLiveStreamingControls]) {
    BOOL v6 = [(AVTransportControlsView *)self liveStreamingControlsIncludeScrubber];
  }
  else {
    BOOL v6 = 1;
  }
  double v7 = [(AVTransportControlsView *)self scrubber];
  [v7 setIncluded:v6];

  BOOL v8 = [(AVTransportControlsView *)self elapsedTimeLabel];
  [v8 setIncluded:v6];

  objc_super v9 = [(AVTransportControlsView *)self timeRemainingLabel];
  if (v6) {
    uint64_t v10 = [(AVTransportControlsView *)self liveStreamingControlsIncludeScrubber] ^ 1;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setIncluded:v10];

  long long v11 = [(AVTransportControlsView *)self elapsedTimeLabel];
  objc_msgSend(v11, "setShowsLoadingIndicator:", -[AVTransportControlsView showsLoadingIndicator](self, "showsLoadingIndicator"));

  long long v12 = [(AVTransportControlsView *)self liveBroadcastLabel];
  objc_msgSend(v12, "setShowsLoadingIndicator:", -[AVTransportControlsView showsLoadingIndicator](self, "showsLoadingIndicator"));

  long long v13 = [(AVTransportControlsView *)self elapsedTimeLabel];
  objc_msgSend(v13, "setLoadingIndicatorAlignment:", -[AVTransportControlsView isDoubleRowLayoutEnabled](self, "isDoubleRowLayoutEnabled") ^ 1);

  double v14 = [(AVTransportControlsView *)self controlsLayoutView];
  [(AVTransportControlsView *)self bounds];
  objc_msgSend(v14, "setFrame:");

  [(AVTransportControlsView *)self _updateCustomContentTransitioningInfoPanelLayout];
  if ([(AVTransportControlsView *)self isDoubleRowLayoutEnabled]) {
    [(AVTransportControlsView *)self _layoutDoubleRowViews];
  }
  else {
    [(AVTransportControlsView *)self _layoutSingleRowViews];
  }
  if ([(AVTransportControlsView *)self hasFullScreenAppearance]
    || [(AVTransportControlsView *)self isCollapsedOrExcluded])
  {
    if (![(AVTransportControlsView *)self hasFullScreenAppearance]) {
      goto LABEL_37;
    }
    [(AVTransportControlsView *)self setCollapsed:0];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v15 = [(AVTransportControlsView *)self customItems];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          BOOL v21 = [(AVTransportControlsView *)self isDoubleRowLayoutEnabled];
          if (v21) {
            [v20 setCollapsed:1];
          }
          [v20 setIncluded:!v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v17);
    }
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v15 = [(AVTransportControlsView *)self customItems];
    uint64_t v22 = [v15 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v15);
          }
          id v26 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          if ([(AVTransportControlsView *)self isDoubleRowLayoutEnabled])
          {
            BOOL v27 = 0;
          }
          else
          {
            [v26 intrinsicContentSize];
            double v29 = v28;
            [(AVTransportControlsView *)self bounds];
            BOOL v27 = v29 < CGRectGetWidth(v61) * 0.3;
          }
          [v26 setCollapsed:!v27];
        }
        uint64_t v23 = [v15 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v23);
    }
  }

LABEL_37:
  double v30 = [(AVTransportControlsView *)self elapsedTimeLabel];
  int v31 = [v30 isCollapsedOrExcluded];

  if (v31) {
    double v32 = -16.0;
  }
  else {
    double v32 = -22.0;
  }
  double v33 = [(AVTransportControlsView *)self standardPlayPauseButton];
  objc_msgSend(v33, "setHitRectInsets:", -16.0, -22.0, -16.0, v32);

  double v34 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
  if (!v34 || ![(AVTransportControlsView *)self isDoubleRowLayoutEnabled])
  {

    goto LABEL_45;
  }
  v35 = [(AVTransportControlsView *)self liveBroadcastLabel];
  char v36 = [v35 isCollapsedOrExcluded];

  if (v36)
  {
LABEL_45:
    uint64_t v43 = [(AVTransportControlsView *)self liveBroadcastLabel];
    long long v46 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v47[0] = *MEMORY[0x1E4F1DAB8];
    v47[1] = v46;
    v47[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v43 setTransform:v47];
    goto LABEL_46;
  }
  double v37 = [(AVTransportControlsView *)self styleSheet];
  [v37 liveBroadcastLabelTopToBackdropTopDistance];
  double v39 = v38;

  double v40 = [(AVTransportControlsView *)self liveBroadcastLabel];
  [v40 intrinsicContentSize];
  double v42 = v41;

  uint64_t v43 = [(AVTransportControlsView *)self liveBroadcastLabel];
  uint64_t v44 = [(AVTransportControlsView *)self scrubber];
  [v44 frame];
  CGFloat MaxY = CGRectGetMaxY(v62);
  CGAffineTransformMakeTranslation(&v48, 0.0, MaxY - (v39 + v42 * 0.5));
  [v43 setTransform:&v48];

LABEL_46:
  kdebug_trace();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTransportControlsView;
  [(AVTransportControlsView *)&v4 traitCollectionDidChange:a3];
  [(AVTransportControlsView *)self _updateFontSizes];
}

- (CGSize)intrinsicContentSize
{
  v35.receiver = self;
  v35.super_class = (Class)AVTransportControlsView;
  [(AVTransportControlsView *)&v35 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
  if (v7)
  {
    BOOL v8 = (void *)v7;
    objc_super v9 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
    char v10 = [v9 isHidden];

    if ((v10 & 1) == 0)
    {
      uint64_t v22 = [(AVTransportControlsView *)self customContentTransitioningInfoPanel];
      [(AVTransportControlsView *)self frame];
      objc_msgSend(v22, "systemLayoutSizeFittingSize:", v27, v28);
      double v11 = v29;
LABEL_10:

      goto LABEL_11;
    }
  }
  double v11 = 0.01;
  if ([(AVTransportControlsView *)self isShowingScrubInstructions]
    && [(AVTransportControlsView *)self isDoubleRowLayoutEnabled])
  {
    long long v12 = [(AVTransportControlsView *)self styleSheet];
    [v12 doubleRowLayoutMargins];
    double v14 = v13;
    uint64_t v15 = [(AVTransportControlsView *)self styleSheet];
    [v15 doubleRowLayoutMarginsWhenShowingScrubInstructions];
    double v17 = v14 - v16;

    if (v17 >= 0.0) {
      double v18 = v17;
    }
    else {
      double v18 = -v17;
    }
    double v19 = [(AVTransportControlsView *)self styleSheet];
    [v19 spacingBetweenScrubInstructionsAndScrubber];
    double v21 = v20;

    uint64_t v22 = [(AVTransportControlsView *)self scrubInstructionsLabel];
    uint64_t v23 = [(AVTransportControlsView *)self embeddedExtraContentContainer];
    [v23 bounds];
    objc_msgSend(v22, "sizeThatFits:", v24, v25);
    double v11 = v26 - (v18 + v21);

    goto LABEL_10;
  }
LABEL_11:
  [(AVTransportControlsView *)self extrinsicContentSize];
  if (v4 < v30) {
    double v4 = v30;
  }
  [(AVTransportControlsView *)self extrinsicContentSize];
  if (v6 >= v31) {
    double v32 = v6;
  }
  else {
    double v32 = v31;
  }
  double v33 = v11 + v32;
  double v34 = v4;
  result.double height = v33;
  result.double width = v34;
  return result;
}

- (double)layoutHeightThatFitsRowsStartingWithRow:(unint64_t)a3
{
  double v4 = [(AVTransportControlsView *)self controlsLayoutView];
  [v4 layoutHeightThatFitsRowsStartingWithRow:a3];
  double v6 = v5;

  return v6;
}

- (void)reevaluateHiddenStateOfAllItems
{
  id v2 = [(AVTransportControlsView *)self controlsLayoutView];
  [v2 reevaluateHiddenStateOfAllItems];
}

- (void)setStyleSheet:(id)a3
{
  id v7 = a3;
  double v5 = [(AVTransportControlsView *)self styleSheet];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_styleSheet, a3);
    [(AVTransportControlsView *)self _updateFontSizes];
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  id v5 = a3;
  uint64_t customContentTransitioningInfoPanel = (uint64_t)self->_customContentTransitioningInfoPanel;
  if ((id)customContentTransitioningInfoPanel != v5)
  {
    id v7 = v5;
    [(id)customContentTransitioningInfoPanel removeFromSuperview];
    objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, a3);
    [(AVTransportControlsView *)self setNeedsLayout];
    uint64_t customContentTransitioningInfoPanel = [(AVTransportControlsView *)self isHiddenOrHasHiddenAncestor];
    id v5 = v7;
    if ((customContentTransitioningInfoPanel & 1) == 0)
    {
      uint64_t customContentTransitioningInfoPanel = [(AVTransportControlsView *)self layoutIfNeeded];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](customContentTransitioningInfoPanel, v5);
}

- (void)setCustomItems:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_customItems, "isEqualToArray:"))
  {
    double v4 = (NSArray *)[v6 copy];
    customItems = self->_customItems;
    self->_customItems = v4;

    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setLiveStreamingControlsIncludeScrubber:(BOOL)a3
{
  if (self->_liveStreamingControlsIncludeScrubber != a3)
  {
    self->_liveStreamingControlsIncludeScrubber = a3;
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setShowsLiveStreamingControls:(BOOL)a3
{
  if (self->_showsLiveStreamingControls != a3)
  {
    self->_showsLiveStreamingControls = a3;
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  if (self->_showsLoadingIndicator != a3)
  {
    self->_showsLoadingIndicator = a3;
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setDoubleRowLayoutEnabled:(BOOL)a3
{
  if (self->_doubleRowLayoutEnabled != a3)
  {
    self->_doubleRowLayoutEnabled = a3;
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (void)setCustomMenuItemsViews:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (NSArray *)a3;
  p_customMenuItemsViews = &self->_customMenuItemsViews;
  if (self->_customMenuItemsViews != v5)
  {
    objc_storeStrong((id *)&self->_customMenuItemsViews, a3);
    if ([(NSArray *)*p_customMenuItemsViews count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = *p_customMenuItemsViews;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            double v13 = objc_msgSend(v12, "layoutAttributes", (void)v15);
            [v13 setCanOverflowToAuxiliaryMenu:1];

            double v14 = [v12 layoutAttributes];
            [v14 setCanOnlyAppearInControlOverflowMenu:1];

            [v12 setNeedsLayout];
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
    [(AVTransportControlsView *)self setNeedsLayout];
  }
}

- (float)volumeControlsControllerTransportBarHeight:(id)a3
{
  return 0.0;
}

- (AVTransportControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  double v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v90 = "-[AVTransportControlsView initWithFrame:styleSheet:]";
    __int16 v91 = 1024;
    int v92 = 72;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v86.receiver = self;
  v86.super_class = (Class)AVTransportControlsView;
  long long v12 = -[AVView initWithFrame:](&v86, sel_initWithFrame_, x, y, width, height);
  double v13 = v12;
  if (v12)
  {
    v12->_included = 1;
    objc_storeStrong((id *)&v12->_styleSheet, a4);
    double v14 = objc_alloc_init(AVScrubber);
    scrubber = v13->_scrubber;
    v13->_scrubber = v14;

    long long v16 = [(AVScrubber *)v13->_scrubber layoutAttributes];
    [v16 setAccessibilityIdentifier:@"Scrubber"];

    long long v17 = [(AVScrubber *)v13->_scrubber layoutAttributes];
    [v17 setHasFlexibleContentSize:1];

    [(AVScrubber *)v13->_scrubber setDelegate:v13];
    [(AVScrubber *)v13->_scrubber addTarget:v13 action:sel_beginScrubbing_ forControlEvents:1];
    [(AVScrubber *)v13->_scrubber addTarget:v13 action:sel_endScrubbing_ forControlEvents:448];
    [(AVScrubber *)v13->_scrubber addTarget:v13 action:sel_scrubberValueChanged_ forControlEvents:4096];
    uint64_t v18 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(0, @"Time Elapsed");
    elapsedTimeLabel = v13->_elapsedTimeLabel;
    v13->_elapsedTimeLabel = (AVChromedLabel *)v18;

    uint64_t v20 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(0, @"Time Remaining");
    timeRemainingLabel = v13->_timeRemainingLabel;
    v13->_timeRemainingLabel = (AVChromedLabel *)v20;

    uint64_t v22 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(@"PLAYBACK_CONTROLS_VIEW_CONTROLLER_LIVE_BROADCAST_LABEL_TEXT", @"Live Broadcast");
    liveBroadcastLabel = v13->_liveBroadcastLabel;
    v13->_liveBroadcastLabel = (AVChromedLabel *)v22;

    [(AVChromedLabel *)v13->_liveBroadcastLabel setLoadingIndicatorAlignment:1];
    double v24 = [(AVChromedLabel *)v13->_liveBroadcastLabel layoutAttributes];
    [v24 setHasFlexibleContentSize:1];

    uint64_t v25 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(@"PLAYBACK_CONTROLS_VIEW_CONTROLLER_LIVE_LABEL_TEXT", @"Live");
    liveBroadcastScrubberLabel = v13->_liveBroadcastScrubberLabel;
    v13->_liveBroadcastScrubberLabel = (AVChromedLabel *)v25;

    double v27 = objc_alloc_init(AVTouchIgnoringView);
    embeddedExtraContentContainer = v13->_embeddedExtraContentContainer;
    v13->_embeddedExtraContentContainer = v27;

    [(AVTouchIgnoringView *)v13->_embeddedExtraContentContainer setClipsToBounds:1];
    [(AVTouchIgnoringView *)v13->_embeddedExtraContentContainer setCollapsed:1];
    [(AVTouchIgnoringView *)v13->_embeddedExtraContentContainer setIncluded:0];
    double v29 = [(AVTouchIgnoringView *)v13->_embeddedExtraContentContainer layoutAttributes];
    [v29 setHasFlexibleContentSize:1];

    double v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    scrubInstructionsLabel = v13->_scrubInstructionsLabel;
    v13->_scrubInstructionsLabel = v30;

    [(UILabel *)v13->_scrubInstructionsLabel setNumberOfLines:0];
    [(UILabel *)v13->_scrubInstructionsLabel setTextAlignment:1];
    [(UILabel *)v13->_scrubInstructionsLabel setHidden:1];
    double v32 = objc_alloc_init(AVChromedLabel);
    detachedScrubInstructionsBackdropLabel = v13->_detachedScrubInstructionsBackdropLabel;
    v13->_detachedScrubInstructionsBackdropLabel = v32;

    [(AVChromedLabel *)v13->_detachedScrubInstructionsBackdropLabel setNumberOfLines:0];
    [(AVChromedLabel *)v13->_detachedScrubInstructionsBackdropLabel setLoadingIndicatorAlignment:2];
    [(AVChromedLabel *)v13->_detachedScrubInstructionsBackdropLabel setHidden:1];
    +[AVBackdropView applySecondaryGlyphTintToView:v13->_scrubInstructionsLabel];
    +[AVBackdropView applySecondaryGlyphTintToView:v13->_detachedScrubInstructionsBackdropLabel];
    double v34 = [AVLayoutView alloc];
    double v35 = *MEMORY[0x1E4F1DB28];
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v39 = -[AVLayoutView initWithFrame:](v34, "initWithFrame:", *MEMORY[0x1E4F1DB28], v36, v37, v38);
    detachedExtraContentLayoutView = v13->_detachedExtraContentLayoutView;
    v13->_detachedExtraContentLayoutView = (AVLayoutView *)v39;

    double v41 = v13->_detachedExtraContentLayoutView;
    v87 = v13->_detachedScrubInstructionsBackdropLabel;
    double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    v88 = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
    [(AVLayoutView *)v41 setArrangedSubviews:v43];

    [(AVLayoutView *)v13->_detachedExtraContentLayoutView setDebugIdentifier:@"detatchedExtraContentStackView"];
    uint64_t v44 = [[AVPlaybackControlsRoutePickerView alloc] initWithSecondGenerationButton:0];
    routePickerView = v13->_routePickerView;
    v13->_routePickerView = v44;

    [(AVPlaybackControlsRoutePickerView *)v13->_routePickerView setPrioritizesVideoDevices:1];
    uint64_t v46 = +[AVControlOverflowButton firstGenerationButton];
    controlOverflowButton = v13->_controlOverflowButton;
    v13->_controlOverflowButton = (AVControlOverflowButton *)v46;

    CGAffineTransform v48 = [(AVButton *)v13->_controlOverflowButton layoutAttributes];
    [v48 setCanSubstituteOtherAttributes:1];

    uint64_t v49 = +[AVButton buttonWithAccessibilityIdentifier:@"Media Selection" isSecondGeneration:0];
    mediaSelectionButton = v13->_mediaSelectionButton;
    v13->_mediaSelectionButton = (AVButton *)v49;

    long long v51 = [(AVButton *)v13->_mediaSelectionButton layoutAttributes];
    [v51 setCanOverflowToAuxiliaryMenu:1];

    uint64_t v52 = +[AVButton buttonWithAccessibilityIdentifier:@"Playback Speed" isSecondGeneration:0];
    playbackSpeedButton = v13->_playbackSpeedButton;
    v13->_playbackSpeedButton = (AVButton *)v52;

    long long v54 = [(AVButton *)v13->_playbackSpeedButton layoutAttributes];
    [v54 setCanOverflowToAuxiliaryMenu:1];

    long long v55 = [(AVButton *)v13->_playbackSpeedButton layoutAttributes];
    [v55 setCanOnlyAppearInControlOverflowMenu:1];

    uint64_t v56 = +[AVButton buttonWithAccessibilityIdentifier:@"Play/Pause" isSecondGeneration:0];
    standardPlayPauseButton = v13->_standardPlayPauseButton;
    v13->_standardPlayPauseButton = (AVButton *)v56;

    v58 = v13->_standardPlayPauseButton;
    v59 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2988], *MEMORY[0x1E4FB09D0]);
    [(AVButton *)v58 setFullScreenFont:v59];

    uint64_t v60 = +[AVButton buttonWithAccessibilityIdentifier:@"Skip Forward" isSecondGeneration:0];
    skipForwardButton = v13->_skipForwardButton;
    v13->_skipForwardButton = (AVButton *)v60;

    uint64_t v62 = +[AVButton buttonWithAccessibilityIdentifier:@"Skip Backward" isSecondGeneration:0];
    skipBackButton = v13->_skipBackButton;
    v13->_skipBackButton = (AVButton *)v62;

    double v64 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v35, v36, v37, v38);
    flexibleViewAfterRoutePickerView = v13->_flexibleViewAfterRoutePickerView;
    v13->_flexibleViewAfterRoutePickerView = v64;

    double v66 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v35, v36, v37, v38);
    flexibleViewAfterSkipForwardButtons = v13->_flexibleViewAfterSkipForwardButtons;
    v13->_flexibleViewAfterSkipForwardButtons = v66;

    [(AVTouchIgnoringView *)v13->_flexibleViewAfterRoutePickerView setIncluded:1];
    [(AVTouchIgnoringView *)v13->_flexibleViewAfterSkipForwardButtons setIncluded:1];
    double v68 = [(AVTouchIgnoringView *)v13->_flexibleViewAfterRoutePickerView layoutAttributes];
    [v68 setHasFlexibleContentSize:1];

    double v69 = [(AVTouchIgnoringView *)v13->_flexibleViewAfterSkipForwardButtons layoutAttributes];
    [v69 setHasFlexibleContentSize:1];

    v13->_transportViewIncludesVolumeController = 0;
    uint64_t v70 = [(AVTransportControlsView *)v13 effectiveUserInterfaceLayoutDirection];
    if (v70) {
      v71 = @"Skip To Next";
    }
    else {
      v71 = @"Skip To Previous";
    }
    if (v70) {
      double v72 = @"Skip To Previous";
    }
    else {
      double v72 = @"Skip To Next";
    }
    uint64_t v73 = +[AVButton buttonWithAccessibilityIdentifier:v71 isSecondGeneration:0];
    startRightwardContentTransitionButton = v13->_startRightwardContentTransitionButton;
    v13->_startRightwardContentTransitionButton = (AVButton *)v73;

    uint64_t v75 = +[AVButton buttonWithAccessibilityIdentifier:v72 isSecondGeneration:0];
    startLeftwardContentTransitionButton = v13->_startLeftwardContentTransitionButton;
    v13->_startLeftwardContentTransitionButton = (AVButton *)v75;

    [(AVTransportControlsView *)v13 addSubview:v13->_detachedExtraContentLayoutView];
    [(AVLayoutView *)v13->_detachedExtraContentLayoutView setAlpha:0.0];
    [(UILabel *)v13->_scrubInstructionsLabel setAlpha:0.0];
    double v77 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v35, v36, v37, v38);
    controlsLayoutView = v13->_controlsLayoutView;
    v13->_controlsLayoutView = v77;

    [(AVLayoutView *)v13->_controlsLayoutView setDebugIdentifier:@"transportControlsView"];
    [(AVLayoutView *)v13->_controlsLayoutView setSemanticContentAttribute:1];
    [(AVTransportControlsView *)v13 addSubview:v13->_controlsLayoutView];
    [(AVTouchIgnoringView *)v13->_embeddedExtraContentContainer addSubview:v13->_scrubInstructionsLabel];
    LODWORD(v79) = 1148846080;
    [(AVTransportControlsView *)v13 setContentCompressionResistancePriority:0 forAxis:v79];
    LODWORD(v80) = 1148846080;
    [(AVTransportControlsView *)v13 setContentCompressionResistancePriority:1 forAxis:v80];
    LODWORD(v81) = 1148846080;
    [(AVTransportControlsView *)v13 setContentHuggingPriority:0 forAxis:v81];
    double v82 = [(AVTransportControlsView *)v13 scrubInstructionsLabel];
    [v82 setHidden:1];

    v83 = [(AVTransportControlsView *)v13 detachedExtraContentLayoutView];
    [v83 setHidden:1];

    v84 = [(AVTransportControlsView *)v13 detachedScrubInstructionsBackdropLabel];
    [v84 setHidden:1];

    [(AVTransportControlsView *)v13 _updateFontSizes];
  }

  return v13;
}

AVChromedLabel *__52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(AVChromedLabel);
  if (v3)
  {
    objc_initWeak(&location, v5);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke_2;
    long long v12 = &unk_1E5FC27F0;
    objc_copyWeak(&v13, &location);
    AVAsynchronousLocalizedString(v3, v4, &v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  LODWORD(v6) = 1148846080;
  -[AVChromedLabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v6, v9, v10, v11, v12);
  [(AVChromedLabel *)v5 setAccessibilityIdentifier:v4];
  id v7 = [(AVChromedLabel *)v5 layoutAttributes];
  [v7 setAccessibilityIdentifier:v4];

  return v5;
}

void __52__AVTransportControlsView_initWithFrame_styleSheet___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setText:v3];
}

@end