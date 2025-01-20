@interface AVPlaybackControlsView
- (AVButton)doneButton;
- (AVButton)fullScreenButton;
- (AVButton)mediaSelectionButton;
- (AVButton)pictureInPictureButton;
- (AVButton)playbackSpeedButton;
- (AVButton)prominentPlayButton;
- (AVButton)skipBackButton;
- (AVButton)skipForwardButton;
- (AVButton)standardPlayPauseButton;
- (AVButton)startLeftwardContentTransitionButton;
- (AVButton)startRightwardContentTransitionButton;
- (AVButton)videoGravityButton;
- (AVControlOverflowButton)controlOverflowButton;
- (AVLayoutView)prominentPlayButtonContainerView;
- (AVLayoutView)screenModeControls;
- (AVLayoutView)volumeControls;
- (AVMobileChromeControlsStyleSheet)styleSheet;
- (AVObservationController)observationController;
- (AVPlaybackControlsRoutePickerView)routePickerView;
- (AVPlaybackControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4;
- (AVPlaybackControlsViewVisibilityDelegate)visibilityDelegate;
- (AVPlayerViewControllerCustomControlsView)customControlsView;
- (AVScrubber)scrubber;
- (AVTouchIgnoringView)playbackControlsContainer;
- (AVTouchIgnoringView)volumeControlsContainer;
- (AVTransportControlsView)transportControlsView;
- (AVView)transportControlsContainerView;
- (AVVolumeButtonControl)volumeButton;
- (AVVolumeSlider)volumeSlider;
- (BOOL)hasVisibleSubview;
- (BOOL)includesAudioControlsContainer;
- (BOOL)includesCustomAudioControls;
- (BOOL)includesCustomDisplayModeControls;
- (BOOL)includesDisplayModeControlsContainer;
- (BOOL)includesTransportControls;
- (BOOL)isDoubleRowLayoutEnabled;
- (BOOL)isFullScreen;
- (BOOL)isTopAreaLayoutGuideExpanded;
- (BOOL)needsIntialLayout;
- (BOOL)prefersDoneButtonIncluded;
- (BOOL)prefersFullScreenButtonIncluded;
- (BOOL)prefersPiPButtonIncluded;
- (BOOL)prefersVideoGravityButtonIncluded;
- (BOOL)prefersVolumeSliderExpandedAutomatically;
- (BOOL)showsAudioControls;
- (BOOL)showsPlaybackControls;
- (BOOL)showsProminentPlayButton;
- (CGAffineTransform)overrideTransformForProminentPlayButton;
- (NSArray)customAudioItems;
- (NSArray)customControlItems;
- (NSArray)customDisplayModeItems;
- (NSArray)customMediaItems;
- (NSArray)defaultAudioControls;
- (NSArray)defaultDisplayModeControls;
- (NSUUID)mostRecentAnimationCompletionsID;
- (NSValue)overrideLayoutMarginsWhenEmbeddedInline;
- (UIViewPropertyAnimator)keyboardUIAvoidanceAnimator;
- (UIViewPropertyAnimator)playbackControlsVisibilityAnimator;
- (double)keyboardHeight;
- (id)_audioViewsToRemoveDuringAnimation;
- (id)_currentArrangedAudioModeViews;
- (id)_currentArrangedDisplayModeViews;
- (id)_customControlsViewIfLoaded;
- (id)_displayModeViewsToRemoveDuringAnimation;
- (id)_playbackControlsViewItems;
- (id)_playbackControlsViewsForControlItems:(id)a3 withType:(int64_t)a4;
- (id)_preferredArrangedAudioModeViews;
- (id)_preferredArrangedDisplayModeViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)includedContainers;
- (int64_t)preferredUnobscuredArea;
- (void)_animateKeyboardAvoidance:(int64_t)a3 duration:(double)a4;
- (void)_collapse:(BOOL)a3 view:(id)a4;
- (void)_collapse:(BOOL)a3 views:(id)a4;
- (void)_setupInitialLayout;
- (void)_showPlaybackControlsAnimated:(BOOL)a3;
- (void)_updateAreVolumeAndTransportControlsVisible;
- (void)_updateDoubleRowLayoutEnabled;
- (void)_updateLayoutMargins;
- (void)_updatePlaybackControlsContainerVisibilityAnimated:(BOOL)a3 additionalActions:(id)a4;
- (void)_updateTransportControlsFrame;
- (void)_updateVolumeControlsWithSize:(CGSize)a3;
- (void)animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a3 appearingViews:(id)a4 disappearingViews:(id)a5;
- (void)avkit_reevaluateHiddenStateOfItem:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)reevaluateHiddenStateForContainersAndSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setCustomControlItems:(id)a3 animations:(id)a4;
- (void)setCustomControlsView:(id)a3;
- (void)setDoubleRowLayoutEnabled:(BOOL)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setIncludedContainers:(int64_t)a3 animations:(id)a4;
- (void)setKeyboardHeight:(double)a3;
- (void)setMostRecentAnimationCompletionsID:(id)a3;
- (void)setNeedsIntialLayout:(BOOL)a3;
- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3;
- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3;
- (void)setPlaybackControlsVisibilityAnimator:(id)a3;
- (void)setPreferredUnobscuredArea:(int64_t)a3;
- (void)setPrefersDoneButtonIncluded:(BOOL)a3;
- (void)setPrefersFullScreenButtonIncluded:(BOOL)a3;
- (void)setPrefersPiPButtonIncluded:(BOOL)a3;
- (void)setPrefersVideoGravityButtonIncluded:(BOOL)a3;
- (void)setPrefersVolumeSliderExpanded:(BOOL)a3 prefersVolumeButtonIncluded:(BOOL)a4 animated:(BOOL)a5;
- (void)setPrefersVolumeSliderExpandedAutomatically:(BOOL)a3;
- (void)setShowsAudioControls:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setStyleSheet:(id)a3;
- (void)setTopAreaLayoutGuideExpanded:(BOOL)a3;
- (void)setVisibilityDelegate:(id)a3;
- (void)setupInitialLayout;
- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDisplayControlsVisibilityIncludedButtons:(id)a3;
@end

@implementation AVPlaybackControlsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentAnimationCompletionsID, 0);
  objc_storeStrong((id *)&self->_playbackControlsVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, 0);
  objc_storeStrong((id *)&self->_defaultDisplayModeControls, 0);
  objc_storeStrong((id *)&self->_defaultAudioControls, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_customMediaItems, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_controlOverflowButton, 0);
  objc_storeStrong((id *)&self->_mediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_routePickerView, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_startRightwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_startLeftwardContentTransitionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_standardPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButton, 0);
  objc_storeStrong((id *)&self->_customAudioItems, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_volumeButton, 0);
  objc_storeStrong((id *)&self->_customDisplayModeItems, 0);
  objc_storeStrong((id *)&self->_pictureInPictureButton, 0);
  objc_storeStrong((id *)&self->_videoGravityButton, 0);
  objc_storeStrong((id *)&self->_fullScreenButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_transportControlsContainerView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButtonContainerView, 0);
  objc_storeStrong((id *)&self->_volumeControls, 0);
  objc_storeStrong((id *)&self->_screenModeControls, 0);
  objc_storeStrong((id *)&self->_playbackControlsContainer, 0);
  objc_storeStrong((id *)&self->_volumeControlsContainer, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);

  objc_storeStrong((id *)&self->_customControlsView, 0);
}

- (void)setPrefersPiPButtonIncluded:(BOOL)a3
{
  self->_prefersPiPButtonIncluded = a3;
}

- (BOOL)prefersPiPButtonIncluded
{
  return self->_prefersPiPButtonIncluded;
}

- (void)setPrefersFullScreenButtonIncluded:(BOOL)a3
{
  self->_prefersFullScreenButtonIncluded = a3;
}

- (BOOL)prefersFullScreenButtonIncluded
{
  return self->_prefersFullScreenButtonIncluded;
}

- (void)setPrefersVideoGravityButtonIncluded:(BOOL)a3
{
  self->_prefersVideoGravityButtonIncluded = a3;
}

- (BOOL)prefersVideoGravityButtonIncluded
{
  return self->_prefersVideoGravityButtonIncluded;
}

- (void)setPrefersDoneButtonIncluded:(BOOL)a3
{
  self->_prefersDoneButtonIncluded = a3;
}

- (BOOL)prefersDoneButtonIncluded
{
  return self->_prefersDoneButtonIncluded;
}

- (void)setTopAreaLayoutGuideExpanded:(BOOL)a3
{
  self->_topAreaLayoutGuideExpanded = a3;
}

- (BOOL)isTopAreaLayoutGuideExpanded
{
  return self->_topAreaLayoutGuideExpanded;
}

- (void)setMostRecentAnimationCompletionsID:(id)a3
{
}

- (NSUUID)mostRecentAnimationCompletionsID
{
  return self->_mostRecentAnimationCompletionsID;
}

- (void)setPlaybackControlsVisibilityAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)playbackControlsVisibilityAnimator
{
  return self->_playbackControlsVisibilityAnimator;
}

- (void)setNeedsIntialLayout:(BOOL)a3
{
  self->_needsIntialLayout = a3;
}

- (BOOL)needsIntialLayout
{
  return self->_needsIntialLayout;
}

- (void)setDoubleRowLayoutEnabled:(BOOL)a3
{
  self->_doubleRowLayoutEnabled = a3;
}

- (BOOL)isDoubleRowLayoutEnabled
{
  return self->_doubleRowLayoutEnabled;
}

- (UIViewPropertyAnimator)keyboardUIAvoidanceAnimator
{
  return self->_keyboardUIAvoidanceAnimator;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (NSArray)defaultDisplayModeControls
{
  return self->_defaultDisplayModeControls;
}

- (NSArray)defaultAudioControls
{
  return self->_defaultAudioControls;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  long long v3 = *(_OWORD *)&self[16].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].c;
  return self;
}

- (BOOL)showsAudioControls
{
  return self->_showsAudioControls;
}

- (void)setVisibilityDelegate:(id)a3
{
}

- (AVPlaybackControlsViewVisibilityDelegate)visibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityDelegate);

  return (AVPlaybackControlsViewVisibilityDelegate *)WeakRetained;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)setPrefersVolumeSliderExpandedAutomatically:(BOOL)a3
{
  self->_prefersVolumeSliderExpandedAutomatically = a3;
}

- (BOOL)prefersVolumeSliderExpandedAutomatically
{
  return self->_prefersVolumeSliderExpandedAutomatically;
}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (NSArray)customMediaItems
{
  return self->_customMediaItems;
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

- (AVScrubber)scrubber
{
  return self->_scrubber;
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

- (AVTransportControlsView)transportControlsView
{
  return self->_transportControlsView;
}

- (AVButton)prominentPlayButton
{
  return self->_prominentPlayButton;
}

- (NSArray)customAudioItems
{
  return self->_customAudioItems;
}

- (AVVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (AVVolumeButtonControl)volumeButton
{
  return self->_volumeButton;
}

- (NSArray)customDisplayModeItems
{
  return self->_customDisplayModeItems;
}

- (AVButton)pictureInPictureButton
{
  return self->_pictureInPictureButton;
}

- (AVButton)videoGravityButton
{
  return self->_videoGravityButton;
}

- (AVButton)fullScreenButton
{
  return self->_fullScreenButton;
}

- (AVButton)doneButton
{
  return self->_doneButton;
}

- (AVView)transportControlsContainerView
{
  return self->_transportControlsContainerView;
}

- (AVLayoutView)prominentPlayButtonContainerView
{
  return self->_prominentPlayButtonContainerView;
}

- (AVLayoutView)volumeControls
{
  return self->_volumeControls;
}

- (AVLayoutView)screenModeControls
{
  return self->_screenModeControls;
}

- (AVTouchIgnoringView)playbackControlsContainer
{
  return self->_playbackControlsContainer;
}

- (AVTouchIgnoringView)volumeControlsContainer
{
  return self->_volumeControlsContainer;
}

- (int64_t)includedContainers
{
  return self->_includedContainers;
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  self->_preferredUnobscuredArea = a3;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  return self->_customControlsView;
}

- (id)_customControlsViewIfLoaded
{
  return self->_customControlsView;
}

- (void)setCustomControlsView:(id)a3
{
  v5 = (AVPlayerViewControllerCustomControlsView *)a3;
  p_customControlsView = &self->_customControlsView;
  if (self->_customControlsView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_customControlsView, a3);
    p_customControlsView = (AVPlayerViewControllerCustomControlsView **)[(AVPlaybackControlsView *)self _updateAreVolumeAndTransportControlsVisible];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_customControlsView, v5);
}

- (id)_playbackControlsViewsForControlItems:(id)a3 withType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if ([v11 type] == a4)
        {
          v12 = [v11 view];
          if (![v12 conformsToProtocol:&unk_1F095D728]) {
            goto LABEL_10;
          }
          v13 = [v11 view];
          int v14 = [v13 conformsToProtocol:&unk_1F095D5A8];

          if (!v14) {
            goto LABEL_11;
          }
          v15 = [v11 view];
          [v20 addObject:v15];

          v12 = [v11 image];
          if (!v12)
          {
            v16 = [v11 title];

            if (v16) {
              goto LABEL_16;
            }
          }
          else
          {
LABEL_10:
          }
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v17;
    }
    while (v17);
  }
LABEL_16:

  v18 = (void *)[v20 copy];

  return v18;
}

- (id)_playbackControlsViewItems
{
  v25[17] = *MEMORY[0x1E4F143B8];
  pictureInPictureButton = self->_pictureInPictureButton;
  transportControlsView = self->_transportControlsView;
  routePickerView = self->_routePickerView;
  mediaSelectionButton = self->_mediaSelectionButton;
  controlOverflowButton = self->_controlOverflowButton;
  playbackSpeedButton = self->_playbackSpeedButton;
  standardPlayPauseButton = self->_standardPlayPauseButton;
  v25[0] = self->_doneButton;
  v25[1] = pictureInPictureButton;
  fullScreenButton = self->_fullScreenButton;
  v25[2] = transportControlsView;
  v25[3] = routePickerView;
  videoGravityButton = self->_videoGravityButton;
  v25[4] = mediaSelectionButton;
  v25[5] = controlOverflowButton;
  prominentPlayButton = self->_prominentPlayButton;
  v25[6] = playbackSpeedButton;
  v25[7] = standardPlayPauseButton;
  skipForwardButton = self->_skipForwardButton;
  v25[8] = fullScreenButton;
  v25[9] = videoGravityButton;
  skipBackButton = self->_skipBackButton;
  v25[10] = prominentPlayButton;
  v25[11] = skipForwardButton;
  startLeftwardContentTransitionButton = self->_startLeftwardContentTransitionButton;
  v25[12] = skipBackButton;
  v25[13] = startLeftwardContentTransitionButton;
  volumeButton = self->_volumeButton;
  v25[14] = self->_startRightwardContentTransitionButton;
  v25[15] = volumeButton;
  v25[16] = self->_volumeSlider;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:17];
  v18 = [(AVPlaybackControlsView *)self customDisplayModeItems];
  v19 = [v17 arrayByAddingObjectsFromArray:v18];

  v20 = [(AVPlaybackControlsView *)self customAudioItems];
  long long v21 = [v19 arrayByAddingObjectsFromArray:v20];

  long long v22 = [(AVPlaybackControlsView *)self customMediaItems];
  long long v23 = [v21 arrayByAddingObjectsFromArray:v22];

  return v23;
}

- (void)_animateKeyboardAvoidance:(int64_t)a3 duration:(double)a4
{
  uint64_t v7 = [(AVPlaybackControlsView *)self keyboardUIAvoidanceAnimator];
  if ([v7 isRunning] && objc_msgSend(v7, "isInterruptible"))
  {
    [v7 stopAnimation:0];
    [v7 finishAnimationAtPosition:2];
  }
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __61__AVPlaybackControlsView__animateKeyboardAvoidance_duration___block_invoke;
  int v14 = &unk_1E5FC44F8;
  objc_copyWeak(&v15, &location);
  uint64_t v9 = (void *)[v8 initWithDuration:a3 curve:&v11 animations:a4];
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, v9);
  uint64_t v10 = [(AVPlaybackControlsView *)self keyboardUIAvoidanceAnimator];
  [v10 startAnimation];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __61__AVPlaybackControlsView__animateKeyboardAvoidance_duration___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];

  id v3 = objc_loadWeakRetained(v1);
  [v3 layoutIfNeeded];
}

- (void)_updateLayoutMargins
{
  if ([(AVPlaybackControlsView *)self isFullScreen]
    || ([(AVPlaybackControlsView *)self overrideLayoutMarginsWhenEmbeddedInline], id v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    v18 = [(AVPlaybackControlsView *)self styleSheet];
    [(AVPlaybackControlsView *)self keyboardHeight];
    objc_msgSend(v18, "playbackControlsViewLayoutMarginsForView:keyboardHeight:isFullScreen:", self, -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"), v19);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    [(AVPlaybackControlsView *)self layoutMargins];
    if (v23 != v31 || v21 != v28 || v27 != v30 || v25 != v29)
    {
      -[AVPlaybackControlsView setLayoutMargins:](self, "setLayoutMargins:", v21, v23, v25, v27);
    }
  }
  else
  {
    v4 = [(AVPlaybackControlsView *)self overrideLayoutMarginsWhenEmbeddedInline];
    [v4 UIEdgeInsetsValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(AVPlaybackControlsView *)self layoutMargins];
    if (v8 == v16 && v6 == v13 && v12 == v15)
    {
      double v17 = v14;

      if (v10 == v17) {
        return;
      }
    }
    else
    {
    }
    id v32 = [(AVPlaybackControlsView *)self overrideLayoutMarginsWhenEmbeddedInline];
    [v32 UIEdgeInsetsValue];
    [(AVPlaybackControlsView *)self setLayoutMargins:"setLayoutMargins:"];
  }
}

- (void)_setupInitialLayout
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(AVPlaybackControlsView *)self needsIntialLayout])
  {
    id v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      double v20 = _AVMethodProem(self);
      *(_DWORD *)buf = 138412290;
      double v28 = v20;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "%@ called when initial layout not needed already set.", buf, 0xCu);
    }
  }
  [(AVPlaybackControlsView *)self setNeedsIntialLayout:0];
  [(AVPlaybackControlsView *)self setEdgesInsettingLayoutMarginsFromSafeArea:0];
  [(AVPlaybackControlsView *)self _updateLayoutMargins];
  v4 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [(AVPlaybackControlsView *)self addSubview:v4];

  double v5 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  double v6 = [(AVPlaybackControlsView *)self layoutMarginsGuide];
  [v6 layoutFrame];
  objc_msgSend(v5, "setFrame:");

  double v7 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  [(AVPlaybackControlsView *)self addSubview:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  transportControlsContainerView = self->_transportControlsContainerView;
  v25[0] = self->_screenModeControls;
  v25[1] = transportControlsContainerView;
  v25[2] = self->_prominentPlayButtonContainerView;
  double v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 3, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        double v15 = [(AVPlaybackControlsView *)self playbackControlsContainer];
        [v15 addSubview:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:self->_screenModeControls];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:self->_prominentPlayButtonContainerView];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:self->_volumeControlsContainer];
  double v16 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  double v17 = [(AVPlaybackControlsView *)self volumeControls];
  [v16 addSubview:v17];

  v18 = [(AVPlaybackControlsView *)self transportControlsContainerView];
  double v19 = [(AVPlaybackControlsView *)self transportControlsView];
  [v18 addSubview:v19];
}

- (void)_updateDoubleRowLayoutEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlaybackControlsView *)self isDoubleRowLayoutEnabled];
  if (![(AVPlaybackControlsView *)self isFullScreen]) {
    goto LABEL_7;
  }
  v4 = [(AVPlaybackControlsView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    [(AVPlaybackControlsView *)self bounds];
    double Width = CGRectGetWidth(v21);
    [(AVPlaybackControlsView *)self bounds];
    BOOL v10 = Width < CGRectGetHeight(v22);
    goto LABEL_11;
  }
  double v6 = [(AVPlaybackControlsView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 != 1)
  {
LABEL_7:
    if (!v3) {
      return;
    }
    BOOL v10 = 0;
    goto LABEL_12;
  }
  double v8 = [(AVPlaybackControlsView *)self transportControlsView];
  double v9 = [v8 customContentTransitioningInfoPanel];

  if (!v9)
  {
    uint64_t v12 = [(AVPlaybackControlsView *)self traitCollection];
    BOOL v10 = [v12 horizontalSizeClass] == 1;

LABEL_11:
    if (v3 == v10) {
      return;
    }
    goto LABEL_12;
  }
  if (v3) {
    return;
  }
  BOOL v10 = 1;
LABEL_12:
  uint64_t v13 = _AVLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = _AVMethodProem(self);
    int v16 = 138412546;
    double v17 = v14;
    __int16 v18 = 1024;
    BOOL v19 = v10;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%@ %d", (uint8_t *)&v16, 0x12u);
  }
  [(AVPlaybackControlsView *)self setDoubleRowLayoutEnabled:v10];
  double v15 = [(AVPlaybackControlsView *)self transportControlsView];
  [v15 setDoubleRowLayoutEnabled:v10];
}

- (void)_updateAreVolumeAndTransportControlsVisible
{
  BOOL v3 = [(AVPlaybackControlsView *)self _customControlsViewIfLoaded];
  if ([(AVPlaybackControlsView *)self includesTransportControls])
  {
    v4 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v4 alpha];
    [v3 setAreTransportControlsVisible:v5 > 0.0];
  }
  else
  {
    [v3 setAreTransportControlsVisible:0];
  }

  double v6 = [(AVPlaybackControlsView *)self _customControlsViewIfLoaded];
  if ([(AVPlaybackControlsView *)self includesAudioControlsContainer]
    || [(AVPlaybackControlsView *)self includesCustomAudioControls])
  {
    uint64_t v7 = [(AVPlaybackControlsView *)self volumeControlsContainer];
    [v7 alpha];
    [v6 setAreVolumeControlsVisible:v8 > 0.0];
  }
  else
  {
    [v6 setAreVolumeControlsVisible:0];
  }

  double v9 = [(AVPlaybackControlsView *)self _customControlsViewIfLoaded];
  [v9 updateConstraintsIfNeeded];

  id v10 = [(AVPlaybackControlsView *)self _customControlsViewIfLoaded];
  [v10 layoutIfNeeded];
}

- (void)reevaluateHiddenStateForContainersAndSubviews
{
  BOOL v3 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:v3];

  v4 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:v4];

  double v5 = [(AVPlaybackControlsView *)self screenModeControls];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:v5];

  double v6 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  [(AVPlaybackControlsView *)self avkit_reevaluateHiddenStateOfItem:v6];

  uint64_t v7 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  [v7 reevaluateHiddenStateOfAllItems];

  double v8 = [(AVPlaybackControlsView *)self volumeControls];
  [v8 reevaluateHiddenStateOfAllItems];

  double v9 = [(AVPlaybackControlsView *)self screenModeControls];
  [v9 reevaluateHiddenStateOfAllItems];

  id v10 = [(AVPlaybackControlsView *)self transportControlsView];
  [v10 reevaluateHiddenStateOfAllItems];
}

- (void)_updatePlaybackControlsContainerVisibilityAnimated:(BOOL)a3 additionalActions:(id)a4
{
  BOOL v54 = a3;
  id v5 = a4;
  double v6 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
  if ([v6 isRunning])
  {
    uint64_t v7 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
    int v8 = [v7 isInterruptible];

    if (!v8) {
      goto LABEL_5;
    }
    double v9 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
    [v9 stopAnimation:0];

    double v6 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
    [v6 finishAnimationAtPosition:2];
  }

LABEL_5:
  id v10 = [(AVPlaybackControlsView *)self transportControlsView];
  uint64_t v11 = [(AVPlaybackControlsView *)self customMediaItems];
  [v10 setCustomItems:v11];

  BOOL v12 = [(AVPlaybackControlsView *)self showsPlaybackControls];
  uint64_t v13 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  int v14 = [v13 isCollapsedOrExcluded];
  unsigned __int8 v15 = v14 ^ 1;

  int v16 = v14 & v12;
  BOOL v17 = [(AVPlaybackControlsView *)self showsProminentPlayButton];
  BOOL v53 = [(AVPlaybackControlsView *)self includesTransportControls];
  __int16 v18 = [(AVPlaybackControlsView *)self screenModeControls];
  int v58 = [v18 hasVisibleArrangedSubview] ^ 1;

  if ([(AVPlaybackControlsView *)self includesDisplayModeControlsContainer]) {
    char v56 = 0;
  }
  else {
    char v56 = ![(AVPlaybackControlsView *)self includesCustomDisplayModeControls];
  }
  BOOL v19 = [(AVPlaybackControlsView *)self volumeControls];
  int v55 = [v19 hasVisibleArrangedSubview] ^ 1;

  uint64_t v20 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  char v21 = [v20 isCollapsedOrExcluded] ^ 1;

  v52 = v5;
  BOOL v51 = v17;
  if (v17)
  {
    int v22 = 0;
    goto LABEL_16;
  }
  if ([(AVPlaybackControlsView *)self includesAudioControlsContainer])
  {
    if (v12)
    {
      int v22 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v23 = [(AVPlaybackControlsView *)self includesCustomAudioControls];
    int v24 = !v23 | v16;
    int v22 = v23 | v24 ^ 1;
    if (v24 & 1) != 0 || (v15 & v12) {
      goto LABEL_16;
    }
  }
  int v22 = [(AVPlaybackControlsView *)self showsAudioControls];
LABEL_16:
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke;
  v89[3] = &unk_1E5FC41F8;
  char v90 = v58;
  char v91 = v55;
  char v92 = v14 & v12;
  char v93 = v15 & v12;
  char v94 = v14 ^ 1;
  v89[4] = self;
  char v95 = v56;
  char v96 = v22;
  char v97 = v21;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v89];
  double v25 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  double v27 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  v59 = (void *)v26;
  if (v22) {
    double v28 = v25;
  }
  else {
    double v28 = (void *)v26;
  }
  uint64_t v29 = v25;
  [v28 addObject:v27];

  if (v16)
  {
    double v30 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v25 addObject:v30];
    BOOL v31 = v53;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v31 = v53;
  if (((v14 | v12) & 1) == 0)
  {
    double v30 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v59 addObject:v30];
    goto LABEL_23;
  }
LABEL_24:
  if ((v14 & 1) == 0 && !self->_controlsViewHasAppeared)
  {
    v46 = [(AVPlaybackControlsView *)self window];

    if (v46)
    {
      self->_controlsViewHasAppeared = 1;
      v47 = [(AVPlaybackControlsView *)self playbackControlsContainer];
      char v48 = [v29 containsObject:v47];

      if ((v48 & 1) == 0)
      {
        v49 = [(AVPlaybackControlsView *)self playbackControlsContainer];
        [v29 addObject:v49];
      }
    }
  }
  id v32 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
  v33 = [(AVPlaybackControlsView *)self visibilityDelegate];
  [v33 playbackControlsView:self animateAlongsideVisibilityAnimationsWithAnimationCoordinator:v32 appearingViews:v29 disappearingViews:v59];

  objc_initWeak(&location, self);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_2;
  v76[3] = &unk_1E5FC2F78;
  objc_copyWeak(&v79, &location);
  BOOL v80 = v31;
  char v81 = v56;
  BOOL v82 = v51;
  char v83 = v14 & v12;
  char v84 = v15 & v12;
  BOOL v85 = v12;
  char v86 = v58;
  char v87 = v55;
  v34 = v32;
  v77 = v34;
  id v57 = v52;
  id v78 = v57;
  v35 = (void (**)(void))MEMORY[0x1B3E963E0](v76);
  v36 = [MEMORY[0x1E4F29128] UUID];
  [(AVPlaybackControlsView *)self setMostRecentAnimationCompletionsID:v36];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_3;
  v72[3] = &unk_1E5FC2FA0;
  objc_copyWeak(&v73, &location);
  char v74 = v15 & !v12;
  char v75 = v14 & !v12;
  v37 = (void (**)(void))MEMORY[0x1B3E963E0](v72);
  if ((((v14 ^ 1) & 1) != 0
     || (v16 & 1) != 0
     || [(AVPlaybackControlsView *)self showsAudioControls])
    && [(UIView *)self avkit_wantsAnimatedViewTransitions]
    && v54)
  {
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      v38 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
      char v39 = [v38 isRunning];

      if ((v39 & 1) == 0)
      {
        [MEMORY[0x1E4F39CF8] begin];
        v50 = (void *)MEMORY[0x1E4F39CF8];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_5;
        v66[3] = &unk_1E5FC2FC8;
        objc_copyWeak(&v70, &location);
        id v67 = v36;
        v69 = v37;
        BOOL v71 = v54;
        v68 = v34;
        [v50 setCompletionBlock:v66];
        v35[2](v35);
        [MEMORY[0x1E4F39CF8] commit];

        p_id from = &v70;
        goto LABEL_42;
      }
    }
    objc_initWeak(&from, self);
    v40 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
    if ([v40 isRunning])
    {
      v41 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
      int v42 = [v41 isInterruptible];

      if (!v42)
      {
LABEL_36:
        v44 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 curve:v35 animations:0.2];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_6;
        v60[3] = &unk_1E5FC2FF0;
        objc_copyWeak(&v63, &from);
        v62 = v37;
        BOOL v64 = v54;
        v61 = v34;
        [v44 addCompletion:v60];
        [(AVPlaybackControlsView *)self setPlaybackControlsVisibilityAnimator:v44];
        [v44 startAnimation];

        objc_destroyWeak(&v63);
        p_id from = &from;
LABEL_42:
        objc_destroyWeak(p_from);
        goto LABEL_43;
      }
      v43 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
      [v43 stopAnimation:0];

      v40 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
      [v40 finishAnimationAtPosition:2];
    }

    goto LABEL_36;
  }
  v35[2](v35);
  v37[2](v37);
LABEL_43:

  objc_destroyWeak(&v73);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = *(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41) || *(unsigned char *)(a1 + 42) || *(unsigned char *)(a1 + 43) != 0;
  if (*(unsigned char *)(a1 + 44)
    && (objc_msgSend(*(id *)(a1 + 32), "avkit_isBeingPresented") & 1) == 0
    && !*(unsigned char *)(a1 + 40))
  {
LABEL_10:
    if (!*(unsigned char *)(a1 + 42)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v3 = [*(id *)(a1 + 32) fullScreenButton];
  objc_msgSend(v3, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersFullScreenButtonIncluded"));

  v4 = [*(id *)(a1 + 32) doneButton];
  objc_msgSend(v4, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersDoneButtonIncluded"));

  id v5 = [*(id *)(a1 + 32) pictureInPictureButton];
  objc_msgSend(v5, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersPiPButtonIncluded"));

  double v6 = [*(id *)(a1 + 32) videoGravityButton];
  objc_msgSend(v6, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersVideoGravityButtonIncluded"));

  [*(id *)(a1 + 32) setNeedsLayout];
  if (!*(unsigned char *)(a1 + 40))
  {
    BOOL v2 = 1;
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v7 = [*(id *)(a1 + 32) _preferredArrangedDisplayModeViews];
  int v8 = [v7 array];

  double v9 = [*(id *)(a1 + 32) screenModeControls];
  v28[0] = v8;
  BOOL v2 = 1;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v9 setArrangedSubviews:v10];

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 45);
  uint64_t v13 = [v11 defaultDisplayModeControls];
  [v11 _collapse:v12 views:v13];

  int v14 = *(void **)(a1 + 32);
  unsigned __int8 v15 = [v14 customDisplayModeItems];
  [v14 _collapse:0 views:v15];

LABEL_12:
  if (*(unsigned char *)(a1 + 41) || *(unsigned char *)(a1 + 46) && !*(unsigned char *)(a1 + 47) || *(unsigned char *)(a1 + 42) && !*(unsigned char *)(a1 + 47))
  {
    int v16 = [*(id *)(a1 + 32) _preferredArrangedAudioModeViews];
    BOOL v17 = [v16 array];

    __int16 v18 = [*(id *)(a1 + 32) volumeControls];
    double v27 = v17;
    BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [v18 setArrangedSubviews:v19];

    uint64_t v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v20 includesAudioControlsContainer] ^ 1;
    int v22 = [*(id *)(a1 + 32) defaultAudioControls];
    [v20 _collapse:v21 views:v22];

    BOOL v23 = *(void **)(a1 + 32);
    int v24 = [v23 customAudioItems];
    [v23 _collapse:0 views:v24];

    double v25 = [*(id *)(a1 + 32) volumeSlider];
    objc_msgSend(v25, "setIncluded:", objc_msgSend(*(id *)(a1 + 32), "prefersVolumeSliderExpandedAutomatically"));

    uint64_t v26 = [*(id *)(a1 + 32) volumeButton];
    objc_msgSend(v26, "setLongPressEnabled:", objc_msgSend(*(id *)(a1 + 32), "prefersVolumeSliderExpandedAutomatically") ^ 1);

LABEL_14:
    [*(id *)(a1 + 32) layoutIfNeeded];
    return;
  }
  if (v2) {
    goto LABEL_14;
  }
}

uint64_t __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_2(uint64_t a1)
{
  v67[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained transportControlsContainerView];
  [v5 setHidden:0];

  id v6 = objc_loadWeakRetained(v3);
  uint64_t v7 = [v6 transportControlsContainerView];
  int v8 = v7;
  double v9 = 1.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v9 = 0.0;
  }
  [v7 setAlpha:v9];

  id v10 = objc_loadWeakRetained(v3);
  uint64_t v11 = [v10 screenModeControls];
  [v11 setIncluded:*(unsigned char *)(a1 + 57) == 0];

  id v12 = objc_loadWeakRetained(v3);
  uint64_t v13 = [v12 prominentPlayButtonContainerView];
  [v13 setIncluded:*(unsigned __int8 *)(a1 + 58)];

  uint64_t v14 = 0;
  if (!*(unsigned char *)(a1 + 58))
  {
    id v15 = objc_loadWeakRetained(v3);
    char v16 = [v15 includesAudioControlsContainer];
    if ((v16 & 1) != 0
      || (id v1 = objc_loadWeakRetained(v3), [v1 includesCustomAudioControls]))
    {
      if (*(unsigned char *)(a1 + 59) || *(unsigned char *)(a1 + 60))
      {
        uint64_t v14 = 1;
        if (v16) {
          goto LABEL_12;
        }
      }
      else
      {
        id v65 = objc_loadWeakRetained(v3);
        uint64_t v14 = [v65 showsAudioControls];

        if (v16) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

LABEL_12:
  }
  id v17 = objc_loadWeakRetained(v3);
  __int16 v18 = [v17 volumeControlsContainer];
  [v18 setIncluded:v14];

  id v19 = objc_loadWeakRetained(v3);
  uint64_t v20 = [v19 playbackControlsContainer];
  [v20 setIncluded:*(unsigned __int8 *)(a1 + 61)];

  id v21 = objc_loadWeakRetained(v3);
  int v22 = [v21 visibilityDelegate];
  id v23 = objc_loadWeakRetained(v3);
  [v22 playbackControlsViewNeedsUpdateStatusBarAppearance:v23];

  if (*(unsigned char *)(a1 + 60))
  {
    id v24 = objc_loadWeakRetained(v3);
    double v25 = [v24 fullScreenButton];
    id v26 = objc_loadWeakRetained(v3);
    objc_msgSend(v25, "setIncluded:", objc_msgSend(v26, "prefersFullScreenButtonIncluded"));

    id v27 = objc_loadWeakRetained(v3);
    double v28 = [v27 doneButton];
    id v29 = objc_loadWeakRetained(v3);
    objc_msgSend(v28, "setIncluded:", objc_msgSend(v29, "prefersDoneButtonIncluded"));

    id v30 = objc_loadWeakRetained(v3);
    BOOL v31 = [v30 pictureInPictureButton];
    id v32 = objc_loadWeakRetained(v3);
    objc_msgSend(v31, "setIncluded:", objc_msgSend(v32, "prefersPiPButtonIncluded"));

    id v33 = objc_loadWeakRetained(v3);
    v34 = [v33 videoGravityButton];
    id v35 = objc_loadWeakRetained(v3);
    objc_msgSend(v34, "setIncluded:", objc_msgSend(v35, "prefersVideoGravityButtonIncluded"));

    if (!*(unsigned char *)(a1 + 57))
    {
      id v36 = objc_loadWeakRetained(v3);
      v37 = [v36 screenModeControls];
      id v38 = objc_loadWeakRetained(v3);
      char v39 = [v38 _preferredArrangedDisplayModeViews];
      v40 = [v39 array];
      v67[0] = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
      [v37 setArrangedSubviews:v41];

      if (!*(unsigned char *)(a1 + 62) && !*(unsigned char *)(a1 + 57))
      {
        id v42 = objc_loadWeakRetained(v3);
        uint64_t v43 = [v42 includesDisplayModeControlsContainer] ^ 1;
        id v44 = objc_loadWeakRetained(v3);
        v45 = [v44 defaultDisplayModeControls];
        [v42 _collapse:v43 views:v45];

        id v46 = objc_loadWeakRetained(v3);
        v47 = [v46 _displayModeViewsToRemoveDuringAnimation];
        [v46 _collapse:1 views:v47];
      }
    }
    if (v14)
    {
      id v48 = objc_loadWeakRetained(v3);
      v49 = [v48 volumeControls];
      id v50 = objc_loadWeakRetained(v3);
      BOOL v51 = [v50 _preferredArrangedAudioModeViews];
      v52 = [v51 array];
      v66 = v52;
      BOOL v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
      [v49 setArrangedSubviews:v53];

      if (!*(unsigned char *)(a1 + 63))
      {
        id v54 = objc_loadWeakRetained(v3);
        uint64_t v55 = [v54 includesAudioControlsContainer] ^ 1;
        id v56 = objc_loadWeakRetained(v3);
        id v57 = [v56 defaultAudioControls];
        [v54 _collapse:v55 views:v57];

        id v58 = objc_loadWeakRetained(v3);
        v59 = [v58 _audioViewsToRemoveDuringAnimation];
        [v58 _collapse:1 views:v59];
      }
    }
    id v60 = objc_loadWeakRetained(v3);
    v61 = [v60 customAudioItems];
    [v60 _collapse:0 views:v61];

    id v62 = objc_loadWeakRetained(v3);
    id v63 = [v62 customDisplayModeItems];
    [v62 _collapse:0 views:v63];
  }
  [*(id *)(a1 + 32) performCoordinatedAnimations];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_3(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMostRecentAnimationCompletionsID:0];

  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    v4 = (void *)MEMORY[0x1E4FB1EB0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_4;
    v6[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v7, v2);
    [v4 performWithoutAnimation:v6];
    objc_destroyWeak(&v7);
  }
  id v5 = objc_loadWeakRetained(v2);
  [v5 reevaluateHiddenStateForContainersAndSubviews];
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_5(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setMostRecentAnimationCompletionsID:0];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 mostRecentAnimationCompletionsID];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (*(unsigned char *)(a1 + 64))
    {
      id v7 = *(void **)(a1 + 40);
      [v7 didFinishAnimations:1];
    }
  }
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPlaybackControlsVisibilityAnimator:0];

  if (!a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = *(void **)(a1 + 32);
    [v5 didFinishAnimations:a2 == 0];
  }
}

void __95__AVPlaybackControlsView__updatePlaybackControlsContainerVisibilityAnimated_additionalActions___block_invoke_4(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained volumeSlider];
  id v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setIncluded:", objc_msgSend(v4, "prefersVolumeSliderExpandedAutomatically"));

  id v5 = objc_loadWeakRetained(v1);
  int v6 = [v5 volumeButton];
  id v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setLongPressEnabled:", objc_msgSend(v7, "prefersVolumeSliderExpandedAutomatically") ^ 1);

  id v8 = objc_loadWeakRetained(v1);
  double v9 = [v8 screenModeControls];
  id v10 = objc_loadWeakRetained(v1);
  uint64_t v11 = [v10 _preferredArrangedDisplayModeViews];
  id v12 = [v11 array];
  v21[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v9 setArrangedSubviews:v13];

  id v14 = objc_loadWeakRetained(v1);
  id v15 = [v14 volumeControls];
  id v16 = objc_loadWeakRetained(v1);
  id v17 = [v16 _preferredArrangedAudioModeViews];
  __int16 v18 = [v17 array];
  uint64_t v20 = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v15 setArrangedSubviews:v19];
}

- (void)updateDisplayControlsVisibilityIncludedButtons:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AVPlaybackControlsView *)self fullScreenButton];
  -[AVPlaybackControlsView setPrefersFullScreenButtonIncluded:](self, "setPrefersFullScreenButtonIncluded:", [v4 containsObject:v5]);

  int v6 = [(AVPlaybackControlsView *)self doneButton];
  -[AVPlaybackControlsView setPrefersDoneButtonIncluded:](self, "setPrefersDoneButtonIncluded:", [v4 containsObject:v6]);

  id v7 = [(AVPlaybackControlsView *)self pictureInPictureButton];
  -[AVPlaybackControlsView setPrefersPiPButtonIncluded:](self, "setPrefersPiPButtonIncluded:", [v4 containsObject:v7]);

  id v8 = [(AVPlaybackControlsView *)self videoGravityButton];
  uint64_t v9 = [v4 containsObject:v8];

  [(AVPlaybackControlsView *)self setPrefersVideoGravityButtonIncluded:v9];
  id v10 = _AVLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPlaybackControlsView *)self prefersFullScreenButtonIncluded]) {
      uint64_t v11 = "YES";
    }
    else {
      uint64_t v11 = "NO";
    }
    int v18 = 136315650;
    id v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    __int16 v20 = 2080;
    id v21 = "self.prefersFullScreenButtonIncluded";
    __int16 v22 = 2080;
    id v23 = v11;
    _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  id v12 = _AVLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPlaybackControlsView *)self prefersDoneButtonIncluded]) {
      uint64_t v13 = "YES";
    }
    else {
      uint64_t v13 = "NO";
    }
    int v18 = 136315650;
    id v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    __int16 v20 = 2080;
    id v21 = "self.prefersDoneButtonIncluded";
    __int16 v22 = 2080;
    id v23 = v13;
    _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  id v14 = _AVLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPlaybackControlsView *)self prefersVideoGravityButtonIncluded]) {
      id v15 = "YES";
    }
    else {
      id v15 = "NO";
    }
    int v18 = 136315650;
    id v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    __int16 v20 = 2080;
    id v21 = "self.prefersVideoGravityButtonIncluded";
    __int16 v22 = 2080;
    id v23 = v15;
    _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  id v16 = _AVLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPlaybackControlsView *)self prefersPiPButtonIncluded]) {
      id v17 = "YES";
    }
    else {
      id v17 = "NO";
    }
    int v18 = 136315650;
    id v19 = "-[AVPlaybackControlsView updateDisplayControlsVisibilityIncludedButtons:]";
    __int16 v20 = 2080;
    id v21 = "self.prefersPiPButtonIncluded";
    __int16 v22 = 2080;
    id v23 = v17;
    _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v18, 0x20u);
  }

  [(AVPlaybackControlsView *)self _updatePlaybackControlsContainerVisibilityAnimated:1 additionalActions:0];
}

- (void)_collapse:(BOOL)a3 view:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [v5 setCollapsed:v4];
  }
  else {
    [v5 setHidden:v4];
  }
}

- (void)_collapse:(BOOL)a3 views:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AVPlaybackControlsView *)self _collapse:v4 view:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_displayModeViewsToRemoveDuringAnimation
{
  BOOL v3 = [(AVPlaybackControlsView *)self _currentArrangedDisplayModeViews];
  BOOL v4 = (void *)[v3 mutableCopy];

  id v5 = [(AVPlaybackControlsView *)self _preferredArrangedDisplayModeViews];
  [v4 minusOrderedSet:v5];

  id v6 = [v4 array];

  return v6;
}

- (id)_audioViewsToRemoveDuringAnimation
{
  BOOL v3 = [(AVPlaybackControlsView *)self _currentArrangedAudioModeViews];
  BOOL v4 = (void *)[v3 mutableCopy];

  id v5 = [(AVPlaybackControlsView *)self _preferredArrangedAudioModeViews];
  [v4 minusOrderedSet:v5];

  id v6 = [v4 array];

  return v6;
}

- (id)_currentArrangedDisplayModeViews
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CAA0];
  BOOL v3 = [(AVPlaybackControlsView *)self screenModeControls];
  BOOL v4 = [v3 arrangedSubviews];
  id v5 = [v4 firstObject];
  id v6 = [v2 orderedSetWithArray:v5];

  return v6;
}

- (id)_currentArrangedAudioModeViews
{
  BOOL v2 = (void *)MEMORY[0x1E4F1CAA0];
  BOOL v3 = [(AVPlaybackControlsView *)self volumeControls];
  BOOL v4 = [v3 arrangedSubviews];
  id v5 = [v4 firstObject];
  id v6 = [v2 orderedSetWithArray:v5];

  return v6;
}

- (id)_preferredArrangedDisplayModeViews
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CAA0];
  BOOL v4 = [(AVPlaybackControlsView *)self defaultDisplayModeControls];
  id v5 = [(AVPlaybackControlsView *)self customDisplayModeItems];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v7 = [v3 orderedSetWithArray:v6];

  return v7;
}

- (id)_preferredArrangedAudioModeViews
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CAA0];
  BOOL v4 = [(AVPlaybackControlsView *)self customAudioItems];
  id v5 = [(AVPlaybackControlsView *)self defaultAudioControls];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v7 = [v3 orderedSetWithArray:v6];

  return v7;
}

- (void)_updateVolumeControlsWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = [(AVPlaybackControlsView *)self customAudioItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v40 + 1) + 8 * i) isCollapsed])
        {
          char v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  char v11 = 0;
LABEL_11:

  long long v12 = [(AVPlaybackControlsView *)self volumeSlider];
  char v13 = [v12 isCollapsedOrExcluded];

  double v14 = -44.0;
  if ((v11 & 1) == 0 && (v13 & 1) == 0)
  {
    id v15 = [(AVPlaybackControlsView *)self volumeSlider];
    [v15 frame];
    double v16 = CGRectGetWidth(v46);
    id v17 = [(AVPlaybackControlsView *)self volumeSlider];
    [v17 value];
    double v19 = v16 * (v18 + -1.0);

    double v20 = v19 * 0.5;
    if (v19 <= -44.0) {
      double v20 = -22.0;
    }
    double v14 = fmin(v20, 0.0);
  }
  id v21 = [(AVPlaybackControlsView *)self volumeButton];
  objc_msgSend(v21, "setHitRectInsets:", -16.0, v14, -24.0, -16.0);

  if ([(AVPlaybackControlsView *)self isFullScreen])
  {
    __int16 v22 = [(AVPlaybackControlsView *)self screenModeControls];
    if ([v22 isHiddenOrHasHiddenAncestor])
    {
      id v23 = [(AVPlaybackControlsView *)self window];
      uint64_t v24 = [v23 windowScene];
      double v25 = [v24 statusBarManager];
      if ([v25 isStatusBarHidden])
      {
        id v26 = [(AVPlaybackControlsView *)self traitCollection];
        [v26 displayCornerRadius];
        double v28 = v27;

        if (v28 == 0.0)
        {
          [(AVPlaybackControlsView *)self frame];
          double MinY = CGRectGetMinY(v47);
          id v30 = [(AVPlaybackControlsView *)self styleSheet];
          [v30 standardPaddingFullScreen];
          double v32 = MinY + v31;
LABEL_23:

          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    goto LABEL_26;
  }
  if ([(AVPlaybackControlsView *)self preferredUnobscuredArea] == 1)
  {
    id v30 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v30 frame];
    double v32 = CGRectGetMaxY(v48) - height;
    goto LABEL_23;
  }
LABEL_26:
  [(AVPlaybackControlsView *)self layoutMargins];
  double v32 = v33;
LABEL_27:
  if ([(AVPlaybackControlsView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v34 = [(AVPlaybackControlsView *)self layoutMarginsGuide];
    [v34 layoutFrame];
    double MinX = CGRectGetMinX(v49);
  }
  else
  {
    v34 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v34 frame];
    double MinX = CGRectGetMaxX(v50) - width;
  }

  id v36 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  objc_msgSend(v36, "setFrame:", MinX, v32, width, height);

  v37 = [(AVPlaybackControlsView *)self volumeControls];
  id v38 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  [v38 bounds];
  objc_msgSend(v37, "setFrame:");

  char v39 = [(AVPlaybackControlsView *)self volumeControls];
  [v39 setNeedsLayout];
}

- (void)_updateTransportControlsFrame
{
  BOOL v3 = [(AVPlaybackControlsView *)self transportControlsView];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [v8 frame];
  double v9 = CGRectGetHeight(v32) - v7;

  uint64_t v10 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [v10 frame];
  double Width = CGRectGetWidth(v33);

  if (Width >= v5) {
    double Width = v5;
  }
  long long v12 = [(AVPlaybackControlsView *)self transportControlsContainerView];
  char v13 = [(AVPlaybackControlsView *)self transportControlsContainerView];
  [v13 frame];
  objc_msgSend(v12, "setFrame:", CGRectGetMinX(v34), v9, Width, v7);

  double v14 = [(AVPlaybackControlsView *)self styleSheet];
  [v14 minimumSingleButtonTransportControlsWidth];
  double v16 = v15;

  id v17 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  float v18 = v17;
  if (Width == v16)
  {
    [v17 frame];
    CGFloat v19 = CGRectGetHeight(v35) - v7;

    double v20 = [(AVPlaybackControlsView *)self transportControlsContainerView];
    objc_msgSend(v20, "setFrame:", 0.0, v19, v5, v7);
  }
  else
  {
    [v17 center];
    double v22 = v21;
    id v23 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    [v23 frame];
    double v24 = v22 - CGRectGetMinX(v36);

    double v25 = [(AVPlaybackControlsView *)self transportControlsContainerView];
    [v25 center];
    double v27 = v26;

    if (v27 == v24) {
      goto LABEL_8;
    }
    double v20 = [(AVPlaybackControlsView *)self transportControlsContainerView];
    double v28 = [(AVPlaybackControlsView *)self transportControlsContainerView];
    [v28 center];
    [v20 setCenter:v24];
  }
LABEL_8:
  id v29 = [(AVPlaybackControlsView *)self transportControlsView];
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v5, v7);

  id v30 = [(AVPlaybackControlsView *)self transportControlsView];
  [v30 setNeedsLayout];
}

- (void)_showPlaybackControlsAnimated:(BOOL)a3
{
}

- (void)layoutSubviews
{
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v238.receiver = self;
  v238.super_class = (Class)AVPlaybackControlsView;
  [(AVPlaybackControlsView *)&v238 layoutSubviews];
  if ([(AVPlaybackControlsView *)self needsIntialLayout]) {
    return;
  }
  BOOL v3 = [(AVPlaybackControlsView *)self styleSheet];
  [(AVPlaybackControlsView *)self _updateDoubleRowLayoutEnabled];
  long long v236 = 0u;
  long long v237 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  double v4 = [(AVPlaybackControlsView *)self _playbackControlsViewItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v234 objects:v243 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v235;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v235 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v234 + 1) + 8 * i), "setHasFullScreenAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v234 objects:v243 count:16];
    }
    while (v6);
  }

  double v9 = [(AVPlaybackControlsView *)self transportControlsView];
  objc_msgSend(v9, "setHasAlternateAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));

  [(AVPlaybackControlsView *)self _updateLayoutMargins];
  uint64_t v10 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  char v11 = [(AVPlaybackControlsView *)self layoutMarginsGuide];
  [v11 layoutFrame];
  objc_msgSend(v10, "setFrame:");

  long long v12 = [(AVPlaybackControlsView *)self layoutMarginsGuide];
  [v12 layoutFrame];
  double Width = CGRectGetWidth(v245);

  double v14 = [(AVPlaybackControlsView *)self layoutMarginsGuide];
  [v14 layoutFrame];
  double Height = CGRectGetHeight(v246);

  [v3 defaultItemInlineSize];
  if (v16 >= Width) {
    double v17 = v16;
  }
  else {
    double v17 = Width;
  }
  [v3 maximumProminentPlayButtonDimension];
  if (v17 >= v18) {
    double v17 = v18;
  }
  [v3 minimumProminentPlayButtonDimension];
  if (v19 >= Height) {
    double v20 = v19;
  }
  else {
    double v20 = Height;
  }
  [v3 maximumProminentPlayButtonDimension];
  if (v20 < v21) {
    double v21 = v20;
  }
  if (v17 >= v21) {
    double v17 = v21;
  }
  double v22 = [(AVPlaybackControlsView *)self prominentPlayButton];
  objc_msgSend(v22, "setExtrinsicContentSize:", v17, v17);

  id v23 = [(AVPlaybackControlsView *)self prominentPlayButton];
  [v3 defaultItemInlineSize];
  [v23 setHasAlternateAppearance:v17 < v24];

  double v25 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  objc_msgSend(v25, "setFrame:", 0.0, 0.0, v17, v17);

  double v26 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [v26 bounds];
  double MidX = CGRectGetMidX(v247);
  double v28 = [(AVPlaybackControlsView *)self playbackControlsContainer];
  [v28 bounds];
  double MidY = CGRectGetMidY(v248);

  id v30 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  objc_msgSend(v30, "setCenter:", MidX, MidY);

  if ([(AVPlaybackControlsView *)self isFullScreen]) {
    [v3 defaultItemFullScreenSize];
  }
  else {
    [v3 defaultItemInlineSize];
  }
  double v33 = v31;
  double v34 = v32;
  CGRect v35 = [(AVPlaybackControlsView *)self doneButton];
  objc_msgSend(v35, "setExtrinsicContentSize:", v33, v34);

  CGRect v36 = [(AVPlaybackControlsView *)self doneButton];
  v37 = [v36 layoutAttributes];
  [v37 setPrefersSecondaryMaterialOverlay:1];

  id v38 = [(AVPlaybackControlsView *)self fullScreenButton];
  objc_msgSend(v38, "setExtrinsicContentSize:", v33, v34);

  char v39 = [(AVPlaybackControlsView *)self pictureInPictureButton];
  objc_msgSend(v39, "setExtrinsicContentSize:", v33, v34);

  long long v232 = 0u;
  long long v233 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  long long v40 = [(AVPlaybackControlsView *)self customDisplayModeItems];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v230 objects:v242 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v231;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v231 != v43) {
          objc_enumerationMutation(v40);
        }
        objc_msgSend(*(id *)(*((void *)&v230 + 1) + 8 * j), "setExtrinsicContentSize:", v33, v34);
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v230 objects:v242 count:16];
    }
    while (v42);
  }

  uint64_t v45 = [(AVPlaybackControlsView *)self volumeButton];
  CGRect v46 = [v45 layoutAttributes];
  [v46 setDisplayPriority:4];

  CGRect v47 = [(AVPlaybackControlsView *)self volumeSlider];
  CGRect v48 = [v47 layoutAttributes];
  [v48 setDisplayPriority:3];

  if ([(AVPlaybackControlsView *)self isFullScreen])
  {
    CGRect v49 = [(AVPlaybackControlsView *)self videoGravityButton];
    objc_msgSend(v49, "setExtrinsicContentSize:", v33, v34);

    CGRect v50 = [(AVPlaybackControlsView *)self volumeButton];
    BOOL v51 = [(AVPlaybackControlsView *)self volumeSlider];
    int v52 = [v51 isIncluded];
    [v3 defaultItemFullScreenSize];
    if (v52)
    {
      double v55 = v54 + 1.0;
      [v3 defaultItemFullScreenSize];
    }
    else
    {
      double v55 = v53;
    }
    [v50 setExtrinsicContentSize:v55];

    id v70 = [(AVPlaybackControlsView *)self customAudioItems];
    if ((unint64_t)[v70 count] > 1)
    {
      uint64_t v72 = 1;
    }
    else
    {
      BOOL v71 = [(AVPlaybackControlsView *)self volumeButton];
      uint64_t v72 = [v71 isCollapsedOrExcluded] ^ 1;
    }
    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id v73 = [(AVPlaybackControlsView *)self customAudioItems];
    uint64_t v74 = [v73 countByEnumeratingWithState:&v226 objects:v241 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v227;
      do
      {
        for (uint64_t k = 0; k != v75; ++k)
        {
          if (*(void *)v227 != v76) {
            objc_enumerationMutation(v73);
          }
          id v78 = *(void **)(*((void *)&v226 + 1) + 8 * k);
          [v3 defaultItemFullScreenSize];
          objc_msgSend(v78, "setExtrinsicContentSize:");
          id v79 = [v78 layoutAttributes];
          [v79 setPrefersSecondaryMaterialOverlay:v72];

          BOOL v80 = [(AVPlaybackControlsView *)self volumeSlider];
          objc_msgSend(v78, "setIncluded:", objc_msgSend(v80, "isIncluded") ^ 1);
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v226 objects:v241 count:16];
      }
      while (v75);
    }

    char v81 = [(AVPlaybackControlsView *)self traitCollection];
    if ([v81 horizontalSizeClass] == 1)
    {
      [(AVPlaybackControlsView *)self bounds];
      double v82 = CGRectGetHeight(v249);
      [(AVPlaybackControlsView *)self bounds];
      double v83 = CGRectGetWidth(v250);

      if (v82 > v83)
      {
        id v62 = [(AVPlaybackControlsView *)self volumeSlider];
        [v3 volumeSliderCompactFullScreenWidth];
LABEL_58:
        double v85 = v84;
        [v3 defaultItemFullScreenSize];
        [v62 setExtrinsicContentSize:v85];
        goto LABEL_59;
      }
    }
    else
    {
    }
    id v62 = [(AVPlaybackControlsView *)self volumeSlider];
    [v3 volumeSliderRegularFullScreenWidth];
    goto LABEL_58;
  }
  id v56 = [(AVPlaybackControlsView *)self volumeSlider];
  [v3 volumeSliderInlineWidth];
  double v58 = v57;
  [v3 defaultItemInlineSize];
  [v56 setExtrinsicContentSize:v58];

  v59 = [(AVPlaybackControlsView *)self volumeButton];
  [v3 defaultItemInlineSize];
  double v61 = v60;
  [v3 defaultItemInlineSize];
  [v59 setExtrinsicContentSize:v61];

  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v62 = [(AVPlaybackControlsView *)self customAudioItems];
  uint64_t v63 = [v62 countByEnumeratingWithState:&v222 objects:v240 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v223;
    do
    {
      for (uint64_t m = 0; m != v64; ++m)
      {
        if (*(void *)v223 != v65) {
          objc_enumerationMutation(v62);
        }
        id v67 = *(void **)(*((void *)&v222 + 1) + 8 * m);
        [v3 defaultItemInlineSize];
        double v69 = v68;
        [v3 defaultItemInlineSize];
        [v67 setExtrinsicContentSize:v69];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v222 objects:v240 count:16];
    }
    while (v64);
  }
LABEL_59:

  if ([(AVPlaybackControlsView *)self isDoubleRowLayoutEnabled])
  {
    [v3 maximumMultiRowTransportControlsWidth];
    if (v86 >= Width) {
      double v86 = Width;
    }
    goto LABEL_74;
  }
  char v87 = [(AVPlaybackControlsView *)self traitCollection];
  if ([v87 horizontalSizeClass] != 2) {
    goto LABEL_70;
  }
  v88 = [(AVPlaybackControlsView *)self traitCollection];
  if ([v88 verticalSizeClass] != 2)
  {

LABEL_70:
    goto LABEL_71;
  }
  BOOL v89 = [(AVPlaybackControlsView *)self isFullScreen];

  if (v89)
  {
    [v3 maximumTransportControlsWidth];
    if (Width < v86) {
      double v86 = Width;
    }
    goto LABEL_74;
  }
LABEL_71:
  int64_t v90 = [(AVPlaybackControlsView *)self preferredUnobscuredArea];
  double v86 = Width;
  if (v90 == 1)
  {
    BOOL v91 = [(AVPlaybackControlsView *)self isFullScreen];
    double v86 = Width;
    if (!v91) {
      objc_msgSend(v3, "minimumSingleButtonTransportControlsWidth", Width);
    }
  }
LABEL_74:
  if (v86 >= Width) {
    double v92 = Width;
  }
  else {
    double v92 = v86;
  }
  [v3 minimumTransportControlsWidth];
  if (v92 <= v93)
  {
    [v3 minimumSingleButtonTransportControlsWidth];
    double v92 = v94;
  }
  if ([(AVPlaybackControlsView *)self isFullScreen]) {
    [v3 defaultItemFullScreenSize];
  }
  else {
    [v3 defaultItemInlineSize];
  }
  double v96 = v95;
  BOOL v97 = [(AVPlaybackControlsView *)self isDoubleRowLayoutEnabled];
  double v98 = 1.0;
  if (v97) {
    double v98 = 2.0;
  }
  double v99 = v96 * v98;
  if ([(AVPlaybackControlsView *)self isDoubleRowLayoutEnabled])
  {
    v100 = [(AVPlaybackControlsView *)self transportControlsView];
    [v100 layoutHeightThatFitsRowsStartingWithRow:0];
    double v102 = v101;

    if (v102 >= v99) {
      double v99 = v102;
    }
  }
  v103 = [(AVPlaybackControlsView *)self transportControlsView];
  objc_msgSend(v103, "setExtrinsicContentSize:", v92, v99);

  if ([(AVPlaybackControlsView *)self isFullScreen]) {
    [v3 defaultItemFullScreenSize];
  }
  else {
    [v3 defaultItemInlineSize];
  }
  double v105 = v104;
  v106 = [(AVPlaybackControlsView *)self standardPlayPauseButton];
  objc_msgSend(v106, "setExtrinsicContentSize:", 0.0, v105);

  v107 = [(AVPlaybackControlsView *)self skipBackButton];
  objc_msgSend(v107, "setExtrinsicContentSize:", 0.0, v105);

  v108 = [(AVPlaybackControlsView *)self skipForwardButton];
  objc_msgSend(v108, "setExtrinsicContentSize:", 0.0, v105);

  v109 = [(AVPlaybackControlsView *)self startLeftwardContentTransitionButton];
  objc_msgSend(v109, "setExtrinsicContentSize:", 0.0, v105);

  v110 = [(AVPlaybackControlsView *)self startRightwardContentTransitionButton];
  objc_msgSend(v110, "setExtrinsicContentSize:", 0.0, v105);

  v111 = [(AVPlaybackControlsView *)self mediaSelectionButton];
  objc_msgSend(v111, "setExtrinsicContentSize:", 0.0, v105);

  v112 = [(AVPlaybackControlsView *)self controlOverflowButton];
  objc_msgSend(v112, "setExtrinsicContentSize:", 0.0, v105);

  v113 = [(AVPlaybackControlsView *)self playbackSpeedButton];
  objc_msgSend(v113, "setExtrinsicContentSize:", 0.0, v105);

  if ([(AVPlaybackControlsView *)self isFullScreen]) {
    [v3 routePickerButtonFullScreenSize];
  }
  else {
    [v3 routePickerButtonInlineSize];
  }
  double v116 = v114;
  double v117 = v115;
  if ([(AVPlaybackControlsView *)self isFullScreen]) {
    [v3 audioRoutePickerFullScreenSize];
  }
  else {
    [v3 routePickerButtonInlineSize];
  }
  double v120 = v118;
  double v121 = v119;
  v122 = [(AVPlaybackControlsView *)self routePickerView];
  int v123 = [v122 prioritizesVideoDevices];

  v124 = [(AVPlaybackControlsView *)self routePickerView];
  if (v123)
  {
    objc_msgSend(v124, "setExtrinsicContentSize:", v116, v117);

    v125 = [(AVPlaybackControlsView *)self routePickerView];
    v126 = [v125 customButton];
    v127 = [v126 micaPackage];
    v128 = v127;
    double v129 = v116;
    double v130 = v117;
  }
  else
  {
    objc_msgSend(v124, "setExtrinsicContentSize:", v120, v121);

    v125 = [(AVPlaybackControlsView *)self routePickerView];
    v126 = [v125 customButton];
    v127 = [v126 micaPackage];
    v128 = v127;
    double v129 = v120;
    double v130 = v121;
  }
  objc_msgSend(v127, "setTargetSize:", v129, v130);

  v131 = [(AVPlaybackControlsView *)self routePickerView];
  v132 = [v131 customButton];
  objc_msgSend(v132, "setHasFullScreenAppearance:", -[AVPlaybackControlsView isFullScreen](self, "isFullScreen"));

  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  v133 = [(AVPlaybackControlsView *)self customMediaItems];
  uint64_t v134 = [v133 countByEnumeratingWithState:&v218 objects:v239 count:16];
  if (v134)
  {
    uint64_t v135 = v134;
    uint64_t v136 = *(void *)v219;
    do
    {
      for (uint64_t n = 0; n != v135; ++n)
      {
        if (*(void *)v219 != v136) {
          objc_enumerationMutation(v133);
        }
        objc_msgSend(*(id *)(*((void *)&v218 + 1) + 8 * n), "setExtrinsicContentSize:", 0.0, v105);
      }
      uint64_t v135 = [v133 countByEnumeratingWithState:&v218 objects:v239 count:16];
    }
    while (v135);
  }

  BOOL v138 = [(AVPlaybackControlsView *)self isFullScreen];
  v139 = (double *)MEMORY[0x1E4FB12A8];
  if (v138) {
    goto LABEL_119;
  }
  v140 = [(AVPlaybackControlsView *)self transportControlsView];
  if ([v140 isIncluded])
  {
    v141 = [(AVPlaybackControlsView *)self transportControlsView];
    [v141 extrinsicContentSize];
    if (v142 <= Width)
    {
      v144 = [(AVPlaybackControlsView *)self transportControlsView];
      [v144 extrinsicContentSize];
      BOOL v143 = v145 > Height;
    }
    else
    {
      BOOL v143 = 1;
    }
  }
  else
  {
    BOOL v143 = 1;
  }

  v146 = [(AVPlaybackControlsView *)self transportControlsView];
  [v146 setCollapsed:v143];

  v147 = [(AVPlaybackControlsView *)self prominentPlayButton];
  if ([v147 isCollapsedOrExcluded])
  {
  }
  else
  {
    int64_t v148 = [(AVPlaybackControlsView *)self preferredUnobscuredArea];

    if (v148 != 2)
    {
      v149 = [(AVPlaybackControlsView *)self prominentPlayButton];
      v150 = v149;
      double v151 = -Height;
      double v152 = -Width;
      double v153 = -Height;
      double v154 = -Width;
      goto LABEL_118;
    }
  }
  v149 = [(AVPlaybackControlsView *)self prominentPlayButton];
  v150 = v149;
  double v151 = *v139;
  double v152 = v139[1];
  double v153 = v139[2];
  double v154 = v139[3];
LABEL_118:
  objc_msgSend(v149, "setHitRectInsets:", v151, v152, v153, v154);

  v155 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  [v155 setNeedsLayout];

LABEL_119:
  [(AVPlaybackControlsView *)self _updateTransportControlsFrame];
  v156 = [(AVPlaybackControlsView *)self volumeSlider];
  double v157 = Width;
  if ([v156 isIncluded])
  {
    v158 = [(AVPlaybackControlsView *)self styleSheet];
    [v158 volumeSliderPadding];
    double v157 = Width - v159;
  }
  [v3 standardInteritemPadding];
  double v161 = v160;
  if ([(AVPlaybackControlsView *)self preferredUnobscuredArea] == 2)
  {
    if ([(AVPlaybackControlsView *)self isFullScreen]) {
      [v3 standardPaddingFullScreen];
    }
    else {
      [v3 standardPaddingInline];
    }
    double v164 = v162;
    [v3 maximumProminentPlayButtonDimension];
    double v163 = v165 + v164 * 2.0;
  }
  else
  {
    double v163 = v99 + v161;
  }
  double v166 = Height - v163;
  v167 = [(AVPlaybackControlsView *)self volumeControls];
  v168 = objc_msgSend(v167, "prioritizedSizeThatFitsSize:", v157, v166);

  v169 = [(AVPlaybackControlsView *)self screenModeControls];
  v170 = objc_msgSend(v169, "prioritizedSizeThatFitsSize:", v157, v166);

  v171 = +[AVPrioritizedSize sizesResolvingFirstPrioritizedSize:v168 secondPrioritizedSize:v170 inAvailableWidth:v157];
  v172 = [v171 objectAtIndexedSubscript:0];
  [v172 CGSizeValue];
  double v217 = v173;
  double v175 = v174;

  v176 = [v171 objectAtIndexedSubscript:1];
  [v176 CGSizeValue];
  double v178 = v177;
  double v180 = v179;
  uint64_t v181 = *(void *)&v179;

  if (v175 >= v180) {
    double v182 = v180;
  }
  else {
    double v182 = v175;
  }
  if ((v181 <= -1 || ((v181 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(v181 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    double v185 = v175;
  }
  else
  {
    double v185 = v182;
  }
  if ((*(uint64_t *)&v185 > -1 && ((*(void *)&v185 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
     || (unint64_t)(*(void *)&v185 - 1) < 0xFFFFFFFFFFFFFLL)
    && v185 < v180)
  {
    double v189 = v185;
  }
  else
  {
    double v189 = v180;
  }
  if ([(AVPlaybackControlsView *)self effectiveUserInterfaceLayoutDirection]) {
    double v190 = Width - v178;
  }
  else {
    double v190 = 0.0;
  }
  v191 = [(AVPlaybackControlsView *)self screenModeControls];
  [v191 setCollapsed:v189 > v166];

  v192 = [(AVPlaybackControlsView *)self screenModeControls];
  objc_msgSend(v192, "setFrame:", v190, 0.0, v178, v189);

  v193 = [(AVPlaybackControlsView *)self screenModeControls];
  [v193 setNeedsLayout];

  v194 = [(AVPlaybackControlsView *)self volumeSlider];
  [v194 extrinsicContentSize];
  double v196 = v195;
  v197 = [(AVPlaybackControlsView *)self volumeButton];
  [v197 extrinsicContentSize];
  double v199 = v198;

  double v200 = *v139;
  double v201 = v139[1];
  double v202 = v139[2];
  double v203 = v139[3];
  v204 = [(AVPlaybackControlsView *)self volumeSlider];
  LODWORD(v197) = [v204 isIncluded];

  if (v197)
  {
    double v205 = v196 + v199;
    double v206 = v217;
    if (v217 >= v205)
    {
      v207 = [(AVPlaybackControlsView *)self styleSheet];
      [v207 volumeSliderPadding];
      double v216 = v166;
      double v209 = v208;

      uint64_t v210 = [(AVPlaybackControlsView *)self effectiveUserInterfaceLayoutDirection];
      v211 = [(AVPlaybackControlsView *)self styleSheet];
      [v211 volumeSliderPadding];
      double v213 = v212;

      if (v210 == 1) {
        double v203 = v213;
      }
      else {
        double v201 = v213;
      }
      double v206 = v217 + v209;
      double v166 = v216;
    }
  }
  else
  {
    double v206 = v217;
  }
  v214 = [(AVPlaybackControlsView *)self volumeControls];
  objc_msgSend(v214, "setContentLayoutMargins:", v200, v201, v202, v203);

  -[AVPlaybackControlsView _updateVolumeControlsWithSize:](self, "_updateVolumeControlsWithSize:", v206, v185);
  v215 = [(AVPlaybackControlsView *)self volumeControlsContainer];
  [v215 setCollapsed:v185 > v166];

  kdebug_trace();
}

- (void)avkit_reevaluateHiddenStateOfItem:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 isCollapsedOrExcluded];
  double v5 = 1.0;
  if (v4) {
    double v5 = 0.0;
  }
  [v12 setAlpha:v5];
  uint64_t v6 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
  if (([v6 isRunning] & 1) != 0
    || [MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
  {

    if ((v4 & 1) == 0)
    {
      uint64_t v7 = v12;
      uint64_t v8 = 0;
LABEL_12:
      [v7 setHidden:v8];
      goto LABEL_13;
    }
  }
  else
  {
  }
  double v9 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
  if (([v9 isRunning] & 1) == 0)
  {
    char v10 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];

    char v11 = v12;
    if (v10) {
      goto LABEL_14;
    }
    uint64_t v7 = v12;
    uint64_t v8 = v4;
    goto LABEL_12;
  }

LABEL_13:
  char v11 = v12;
LABEL_14:
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackControlsView;
  [(AVPlaybackControlsView *)&v3 safeAreaInsetsDidChange];
  [(AVPlaybackControlsView *)self _updateLayoutMargins];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsView;
  [(AVPlaybackControlsView *)&v4 traitCollectionDidChange:a3];
  [(AVPlaybackControlsView *)self _updateLayoutMargins];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = -[UIView avkit_hitTestControlForPoint:withEvent:](self, "avkit_hitTestControlForPoint:withEvent:", v7, x, y);
  double v9 = v8;
  if (v8)
  {
    char v10 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AVPlaybackControlsView;
    -[AVPlaybackControlsView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
    char v10 = (AVPlaybackControlsView *)objc_claimAutoreleasedReturnValue();
  }
  char v11 = v10;

  if (v11 == self) {
    id v12 = 0;
  }
  else {
    id v12 = v11;
  }

  return v12;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackControlsView;
  [(AVPlaybackControlsView *)&v3 didMoveToWindow];
  [(AVPlaybackControlsView *)self _updatePlaybackControlsContainerVisibilityAnimated:0 additionalActions:0];
}

- (void)setPrefersVolumeSliderExpanded:(BOOL)a3 prefersVolumeButtonIncluded:(BOOL)a4 animated:(BOOL)a5
{
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke;
  v22[3] = &unk_1E5FC2F50;
  v22[4] = self;
  BOOL v23 = a3;
  BOOL v24 = a4;
  id v7 = (void (**)(void))MEMORY[0x1B3E963E0](v22, a2);
  uint64_t v8 = [(AVPlaybackControlsView *)self volumeControls];
  int v9 = [v8 hasVisibleArrangedSubview];

  if (!v9 || !a5)
  {
LABEL_6:
    v7[2](v7);
    goto LABEL_7;
  }
  char v10 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
  int v11 = [v10 isRunning];

  if (!v11)
  {
    if (![MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      char v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1C58]) initWithDampingRatio:0.75];
      objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v13 timingParameters:0.5];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      double v17 = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_3;
      double v18 = &unk_1E5FC41A8;
      double v19 = v7;
      [v14 addAnimations:&v15];
      -[AVPlaybackControlsView setPlaybackControlsVisibilityAnimator:](self, "setPlaybackControlsVisibilityAnimator:", v14, v15, v16, v17, v18);
      [v14 startAnimation];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v12 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_2;
  v20[3] = &unk_1E5FC3A38;
  double v21 = v7;
  [v12 addCompletion:v20];

LABEL_7:
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) volumeSlider];
  [v2 setIncluded:*(unsigned __int8 *)(a1 + 40)];

  objc_super v3 = [*(id *)(a1 + 32) volumeButton];
  [v3 setIncluded:*(unsigned __int8 *)(a1 + 41)];

  objc_super v4 = [*(id *)(a1 + 32) volumeButton];
  [v4 setLongPressEnabled:*(unsigned char *)(a1 + 40) == 0];

  [*(id *)(a1 + 32) setNeedsLayout];
  double v5 = *(void **)(a1 + 32);

  return [v5 layoutIfNeeded];
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __94__AVPlaybackControlsView_setPrefersVolumeSliderExpanded_prefersVolumeButtonIncluded_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setShowsAudioControls:(BOOL)a3
{
  if (self->_showsAudioControls != a3)
  {
    self->_showsAudioControls = a3;
    objc_super v4 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    int v5 = [v4 isCollapsedOrExcluded];

    uint64_t v6 = [(AVPlaybackControlsView *)self playbackControlsVisibilityAnimator];
    int v7 = [v6 isRunning];

    if (!v7)
    {
      if (v5)
      {
        [(AVPlaybackControlsView *)self _updatePlaybackControlsContainerVisibilityAnimated:1 additionalActions:0];
      }
    }
  }
}

- (void)showPlaybackControls:(BOOL)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL showsPlaybackControls = self->_showsPlaybackControls;
  if (showsPlaybackControls != a3 || self->_showsAudioControls != showsPlaybackControls)
  {
    -[AVPlaybackControlsView setShowsPlaybackControls:](self, "setShowsPlaybackControls:");
    [(AVPlaybackControlsView *)self _showPlaybackControlsAnimated:!v4];
  }
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  BOOL showsPlaybackControls = self->_showsPlaybackControls;
  if (showsPlaybackControls != a3)
  {
    self->_BOOL showsPlaybackControls = a3;
    BOOL showsPlaybackControls = a3;
  }
  if (showsPlaybackControls != self->_showsAudioControls) {
    self->_showsAudioControls = showsPlaybackControls;
  }
  id v5 = [(AVPlaybackControlsView *)self visibilityDelegate];
  [v5 playbackControlsViewDidToggleControlsVisibility:self];
}

- (BOOL)hasVisibleSubview
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v2 = [(AVPlaybackControlsView *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) isHiddenOrHasHiddenAncestor])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a3 appearingViews:(id)a4 disappearingViews:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AVPlaybackControlsView *)self _isInAWindow]
    && ([(AVPlaybackControlsView *)self isHiddenOrHasHiddenAncestor] & 1) == 0)
  {
    int v11 = [(AVPlaybackControlsView *)self volumeControlsContainer];
    char v12 = [v9 containsObject:v11];

    char v13 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    LOBYTE(v11) = [v9 containsObject:v13];

    objc_super v14 = [(AVPlaybackControlsView *)self volumeControlsContainer];
    LOBYTE(v13) = [v10 containsObject:v14];

    uint64_t v15 = [(AVPlaybackControlsView *)self playbackControlsContainer];
    char v16 = [v10 containsObject:v15];

    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke;
    v21[3] = &unk_1E5FC2F00;
    objc_copyWeak(&v22, &location);
    char v23 = (char)v11;
    char v24 = v12;
    v21[4] = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_4;
    v17[3] = &unk_1E5FC2F28;
    char v19 = (char)v13;
    char v20 = v16;
    objc_copyWeak(&v18, &location);
    [v8 addCoordinatedAnimations:v21 completion:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateAreVolumeAndTransportControlsVisible];

  if (*(unsigned char *)(a1 + 48))
  {
    if (!*(unsigned char *)(a1 + 49))
    {
      id v4 = objc_loadWeakRetained(v2);
      id v5 = [v4 traitCollection];
      [v5 displayCornerRadius];
      double v7 = v6;

      if (v7 == 0.0)
      {
        id v8 = (void *)MEMORY[0x1E4FB1EB0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2;
        v18[3] = &unk_1E5FC4180;
        objc_copyWeak(&v19, v2);
        v18[4] = *(void *)(a1 + 32);
        [v8 performWithoutAnimation:v18];
        objc_destroyWeak(&v19);
      }
    }
  }
  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 screenModeControls];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v17[0] = *MEMORY[0x1E4F1DAB8];
  v17[1] = v11;
  v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v10 setTransform:v17];

  id v12 = objc_loadWeakRetained(v2);
  [v12 setNeedsLayout];

  if (*(unsigned char *)(a1 + 48) && *(unsigned char *)(a1 + 49))
  {
    char v13 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_3;
    v15[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v16, v2);
    [v13 performWithoutAnimation:v15];
    objc_destroyWeak(&v16);
  }
  else
  {
    id v14 = objc_loadWeakRetained(v2);
    [v14 layoutIfNeeded];
  }
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    id v1 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setNeedsLayout];

    id v3 = objc_loadWeakRetained(v1);
    [v3 layoutIfNeeded];
  }
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained window];
  id v5 = [v4 windowScene];
  double v6 = [v5 statusBarManager];
  [v6 statusBarFrame];
  double v8 = v7;

  LOBYTE(WeakRetained) = [*(id *)(a1 + 32) isFullScreen];
  id v9 = [*(id *)(a1 + 32) styleSheet];
  id v10 = v9;
  if (WeakRetained) {
    [v9 standardPaddingFullScreen];
  }
  else {
    [v9 standardPaddingInline];
  }
  double v12 = v11;

  id v13 = objc_loadWeakRetained(v2);
  id v14 = [v13 screenModeControls];
  CGAffineTransformMakeTranslation(&v15, 0.0, fmax(v8 + v12 * 0.5 - v12, 0.0));
  [v14 setTransform:&v15];
}

void __120__AVPlaybackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutIfNeeded];
}

- (void)setStyleSheet:(id)a3
{
  id v8 = a3;
  id v5 = [(AVPlaybackControlsView *)self styleSheet];
  char v6 = [v5 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_styleSheet, a3);
    double v7 = [(AVPlaybackControlsView *)self transportControlsView];
    [v7 setStyleSheet:v8];

    [(AVPlaybackControlsView *)self setNeedsLayout];
  }
}

- (void)setCustomControlItems:(id)a3 animations:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (![(NSArray *)self->_customControlItems isEqualToArray:v18])
  {
    double v7 = (NSArray *)[v18 copy];
    customControlItems = self->_customControlItems;
    self->_customControlItems = v7;

    id v9 = [(AVPlaybackControlsView *)self customControlItems];
    id v10 = [(AVPlaybackControlsView *)self _playbackControlsViewsForControlItems:v9 withType:2];
    customMediaItems = self->_customMediaItems;
    self->_customMediaItems = v10;

    double v12 = [(AVPlaybackControlsView *)self customControlItems];
    id v13 = [(AVPlaybackControlsView *)self _playbackControlsViewsForControlItems:v12 withType:0];
    customDisplayModeItems = self->_customDisplayModeItems;
    self->_customDisplayModeItems = v13;

    CGAffineTransform v15 = [(AVPlaybackControlsView *)self customControlItems];
    id v16 = [(AVPlaybackControlsView *)self _playbackControlsViewsForControlItems:v15 withType:1];
    customAudioItems = self->_customAudioItems;
    self->_customAudioItems = v16;

    [(AVPlaybackControlsView *)self _updatePlaybackControlsContainerVisibilityAnimated:1 additionalActions:v6];
  }
}

- (BOOL)includesCustomDisplayModeControls
{
  if ([(AVPlaybackControlsView *)self showsProminentPlayButton]) {
    return 0;
  }
  id v4 = [(AVPlaybackControlsView *)self customDisplayModeItems];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (BOOL)includesDisplayModeControlsContainer
{
  if ([(AVPlaybackControlsView *)self showsProminentPlayButton]) {
    LOBYTE(v3) = 0;
  }
  else {
    return (LOBYTE(self->_includedContainers) >> 3) & 1;
  }
  return v3;
}

- (BOOL)includesTransportControls
{
  if ([(AVPlaybackControlsView *)self showsProminentPlayButton]) {
    LOBYTE(v3) = 0;
  }
  else {
    return (LOBYTE(self->_includedContainers) >> 2) & 1;
  }
  return v3;
}

- (BOOL)includesCustomAudioControls
{
  if ([(AVPlaybackControlsView *)self showsProminentPlayButton]) {
    return 0;
  }
  id v4 = [(AVPlaybackControlsView *)self customAudioItems];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (BOOL)includesAudioControlsContainer
{
  if ([(AVPlaybackControlsView *)self showsProminentPlayButton]) {
    LOBYTE(v3) = 0;
  }
  else {
    return (LOBYTE(self->_includedContainers) >> 4) & 1;
  }
  return v3;
}

- (BOOL)showsProminentPlayButton
{
  return (LOBYTE(self->_includedContainers) >> 1) & 1;
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  id v5 = a3;
  if (!-[NSValue isEqualToValue:](self->_overrideLayoutMarginsWhenEmbeddedInline, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
    if (![(AVPlaybackControlsView *)self isFullScreen]) {
      [(AVPlaybackControlsView *)self setNeedsLayout];
    }
  }
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  p_overrideTransformForProminentPlayButtouint64_t n = &self->_overrideTransformForProminentPlayButton;
  long long v5 = *(_OWORD *)&a3->c;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c = v5;
  *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tdouble x = v4;
  id v6 = [(AVPlaybackControlsView *)self prominentPlayButtonContainerView];
  long long v7 = *(_OWORD *)&p_overrideTransformForProminentPlayButton->c;
  v8[0] = *(_OWORD *)&p_overrideTransformForProminentPlayButton->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&p_overrideTransformForProminentPlayButton->tx;
  [v6 setTransform:v8];
}

- (void)setIncludedContainers:(int64_t)a3 animations:(id)a4
{
  if (self->_includedContainers != a3)
  {
    self->_includedContainers = a3;
    [(AVPlaybackControlsView *)self _updatePlaybackControlsContainerVisibilityAnimated:1 additionalActions:a4];
  }
}

- (void)setFullScreen:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_fullScreen != a3)
  {
    BOOL v3 = a3;
    long long v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      long long v7 = "-[AVPlaybackControlsView setFullScreen:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    self->_fullScreeuint64_t n = v3;
    [(AVPlaybackControlsView *)self _updateLayoutMargins];
    [(AVPlaybackControlsView *)self _updateDoubleRowLayoutEnabled];
    [(AVPlaybackControlsView *)self setNeedsLayout];
  }
}

- (void)setupInitialLayout
{
  if ([(AVPlaybackControlsView *)self needsIntialLayout])
  {
    [(AVPlaybackControlsView *)self _setupInitialLayout];
  }
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlaybackControlsView *)self observationController];
  [v3 stopAllObservation];

  long long v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v7 = "-[AVPlaybackControlsView dealloc]";
    __int16 v8 = 1024;
    int v9 = 222;
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsView;
  [(AVPlaybackControlsView *)&v5 dealloc];
}

- (AVPlaybackControlsView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  double v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v122 = "-[AVPlaybackControlsView initWithFrame:styleSheet:]";
    __int16 v123 = 1024;
    int v124 = 83;
    __int16 v125 = 2048;
    v126 = self;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v114.receiver = self;
  v114.super_class = (Class)AVPlaybackControlsView;
  uint64_t v12 = -[AVPlaybackControlsView initWithFrame:](&v114, sel_initWithFrame_, x, y, width, height);
  id v13 = v12;
  if (v12)
  {
    [(AVPlaybackControlsView *)v12 setHidden:1];
    customControlItems = v13->_customControlItems;
    CGAffineTransform v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v13->_customControlItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    customDisplayModeItems = v13->_customDisplayModeItems;
    v13->_customDisplayModeItems = v15;

    customAudioItems = v13->_customAudioItems;
    v13->_customAudioItems = v15;

    customMediaItems = v13->_customMediaItems;
    v13->_customMediaItems = v15;

    v13->_BOOL showsPlaybackControls = 1;
    objc_storeStrong((id *)&v13->_styleSheet, a4);
    uint64_t v19 = +[AVButton buttonWithAccessibilityIdentifier:@"Done" isSecondGeneration:0];
    doneButtouint64_t n = v13->_doneButton;
    v13->_doneButtouint64_t n = (AVButton *)v19;

    [(AVButton *)v13->_doneButton setIncluded:0];
    [(AVButton *)v13->_doneButton setCollapsed:1];
    double v21 = [(AVButton *)v13->_doneButton layoutAttributes];
    [v21 setDisplayPriority:2];

    uint64_t v22 = +[AVButton buttonWithAccessibilityIdentifier:@"Full Screen" isSecondGeneration:0];
    fullScreenButtouint64_t n = v13->_fullScreenButton;
    v13->_fullScreenButtouint64_t n = (AVButton *)v22;

    [(AVButton *)v13->_fullScreenButton setIncluded:0];
    [(AVButton *)v13->_fullScreenButton setCollapsed:1];
    char v24 = [(AVButton *)v13->_fullScreenButton layoutAttributes];
    [v24 setDisplayPriority:2];

    double v25 = AVLocalizedString(@"Zoom");
    uint64_t v26 = +[AVButton buttonWithAccessibilityIdentifier:@"Zoom" accessibilityLabel:v25 isSecondGeneration:0];
    videoGravityButtouint64_t n = v13->_videoGravityButton;
    v13->_videoGravityButtouint64_t n = (AVButton *)v26;

    [(AVButton *)v13->_videoGravityButton setIncluded:0];
    [(AVButton *)v13->_videoGravityButton setCollapsed:1];
    double v28 = [(AVButton *)v13->_videoGravityButton layoutAttributes];
    [v28 setDisplayPriority:2];

    uint64_t v29 = +[AVButton buttonWithAccessibilityIdentifier:@"Picture in Picture" isSecondGeneration:0];
    pictureInPictureButtouint64_t n = v13->_pictureInPictureButton;
    v13->_pictureInPictureButtouint64_t n = (AVButton *)v29;

    [(AVButton *)v13->_pictureInPictureButton setIncluded:0];
    [(AVButton *)v13->_pictureInPictureButton setCollapsed:1];
    double v31 = [(AVButton *)v13->_pictureInPictureButton layoutAttributes];
    [v31 setDisplayPriority:2];

    double v32 = v13->_doneButton;
    uint64_t v33 = *MEMORY[0x1E4FB2990];
    v113.size.double height = height;
    double v34 = *MEMORY[0x1E4FB09C8];
    CGRect v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2990], *MEMORY[0x1E4FB09C8]);
    [(AVButton *)v32 setFullScreenFont:v35];

    CGRect v36 = v13->_videoGravityButton;
    v37 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", v33, v34);
    [(AVButton *)v36 setFullScreenFont:v37];

    id v38 = v13->_pictureInPictureButton;
    char v39 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", v33, v34);
    [(AVButton *)v38 setFullScreenFont:v39];

    v120[0] = v13->_doneButton;
    v120[1] = v13->_fullScreenButton;
    v120[2] = v13->_pictureInPictureButton;
    v120[3] = v13->_videoGravityButton;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:4];
    defaultDisplayModeControls = v13->_defaultDisplayModeControls;
    v13->_defaultDisplayModeControls = (NSArray *)v40;

    uint64_t v42 = [AVLayoutView alloc];
    double v43 = *MEMORY[0x1E4F1DB28];
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v112 = *MEMORY[0x1E4F1DB28];
    uint64_t v47 = -[AVLayoutView initWithFrame:](v42, "initWithFrame:", *MEMORY[0x1E4F1DB28], v44, v45, v46);
    screenModeControls = v13->_screenModeControls;
    v13->_screenModeControls = (AVLayoutView *)v47;

    CGRect v49 = v13->_screenModeControls;
    double v119 = v13->_defaultDisplayModeControls;
    CGRect v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
    [(AVLayoutView *)v49 setArrangedSubviews:v50];

    v113.origin.double y = y;
    v113.size.double width = width;
    double v51 = *MEMORY[0x1E4FB12A8];
    double v52 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    v113.origin.double x = x;
    double v53 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v54 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    -[AVLayoutView setContentLayoutMargins:](v13->_screenModeControls, "setContentLayoutMargins:", *MEMORY[0x1E4FB12A8], v52, v53, v54);
    [(AVLayoutView *)v13->_screenModeControls setDebugIdentifier:@"ScreenModeControls"];
    uint64_t v55 = +[AVButton buttonWithAccessibilityIdentifier:@"Central Play" isSecondGeneration:0];
    prominentPlayButtouint64_t n = v13->_prominentPlayButton;
    v13->_prominentPlayButtouint64_t n = (AVButton *)v55;

    [(AVButton *)v13->_prominentPlayButton setClampsHitRectInsetsWhenContainedInScrollableView:1];
    double v57 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v43, v44, v45, v46);
    prominentPlayButtonContainerView = v13->_prominentPlayButtonContainerView;
    v13->_prominentPlayButtonContainerView = v57;

    v59 = v13->_prominentPlayButtonContainerView;
    double v117 = v13->_prominentPlayButton;
    double v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
    double v118 = v60;
    double v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
    [(AVLayoutView *)v59 setArrangedSubviews:v61];

    [(AVLayoutView *)v13->_prominentPlayButtonContainerView setShapeStyle:1];
    [(AVLayoutView *)v13->_prominentPlayButtonContainerView setIncluded:1];
    -[AVLayoutView setContentLayoutMargins:](v13->_prominentPlayButtonContainerView, "setContentLayoutMargins:", v51, v52, v53, v54);
    [(AVLayoutView *)v13->_prominentPlayButtonContainerView setDebugIdentifier:@"prominentPlayButton"];
    [v10 defaultItemInlineSize];
    CGFloat v63 = v62;
    [v10 defaultItemInlineSize];
    CGRect v128 = CGRectInset(v113, v63, v64);
    double v65 = v128.origin.x;
    double v66 = v128.origin.y;
    double v67 = v128.size.width;
    [v10 defaultItemFullScreenSize];
    double v69 = v68 + v68;
    id v70 = -[AVView initWithFrame:]([AVView alloc], "initWithFrame:", v65, v66, v67, v68 + v68);
    transportControlsContainerView = v13->_transportControlsContainerView;
    v13->_transportControlsContainerView = v70;

    [(AVView *)v13->_transportControlsContainerView setHasBackdropView:1];
    kdebug_trace();
    uint64_t v72 = -[AVTransportControlsView initWithFrame:styleSheet:]([AVTransportControlsView alloc], "initWithFrame:styleSheet:", v10, v65, v66, v67, v69);
    transportControlsView = v13->_transportControlsView;
    v13->_transportControlsView = v72;

    kdebug_trace();
    [(AVView *)v13->_transportControlsView setHasBackdropView:1];
    v13->_includedContainers = 28;
    uint64_t v74 = [(AVTransportControlsView *)v13->_transportControlsView routePickerView];
    routePickerView = v13->_routePickerView;
    v13->_routePickerView = (AVPlaybackControlsRoutePickerView *)v74;

    uint64_t v76 = [(AVTransportControlsView *)v13->_transportControlsView mediaSelectionButton];
    mediaSelectionButtouint64_t n = v13->_mediaSelectionButton;
    v13->_mediaSelectionButtouint64_t n = (AVButton *)v76;

    uint64_t v78 = [(AVTransportControlsView *)v13->_transportControlsView controlOverflowButton];
    controlOverflowButtouint64_t n = v13->_controlOverflowButton;
    v13->_controlOverflowButtouint64_t n = (AVControlOverflowButton *)v78;

    uint64_t v80 = [(AVTransportControlsView *)v13->_transportControlsView playbackSpeedButton];
    playbackSpeedButtouint64_t n = v13->_playbackSpeedButton;
    v13->_playbackSpeedButtouint64_t n = (AVButton *)v80;

    uint64_t v82 = [(AVTransportControlsView *)v13->_transportControlsView standardPlayPauseButton];
    standardPlayPauseButtouint64_t n = v13->_standardPlayPauseButton;
    v13->_standardPlayPauseButtouint64_t n = (AVButton *)v82;

    uint64_t v84 = [(AVTransportControlsView *)v13->_transportControlsView skipForwardButton];
    skipForwardButtouint64_t n = v13->_skipForwardButton;
    v13->_skipForwardButtouint64_t n = (AVButton *)v84;

    uint64_t v86 = [(AVTransportControlsView *)v13->_transportControlsView skipBackButton];
    skipBackButtouint64_t n = v13->_skipBackButton;
    v13->_skipBackButtouint64_t n = (AVButton *)v86;

    uint64_t v88 = [(AVTransportControlsView *)v13->_transportControlsView startLeftwardContentTransitionButton];
    startLeftwardContentTransitionButtouint64_t n = v13->_startLeftwardContentTransitionButton;
    v13->_startLeftwardContentTransitionButtouint64_t n = (AVButton *)v88;

    uint64_t v90 = [(AVTransportControlsView *)v13->_transportControlsView startRightwardContentTransitionButton];
    startRightwardContentTransitionButtouint64_t n = v13->_startRightwardContentTransitionButton;
    v13->_startRightwardContentTransitionButtouint64_t n = (AVButton *)v90;

    uint64_t v92 = [(AVTransportControlsView *)v13->_transportControlsView scrubber];
    scrubber = v13->_scrubber;
    v13->_scrubber = (AVScrubber *)v92;

    double v94 = objc_alloc_init(AVVolumeButtonControl);
    volumeButtouint64_t n = v13->_volumeButton;
    v13->_volumeButtouint64_t n = v94;

    double v96 = objc_alloc_init(AVVolumeSlider);
    volumeSlider = v13->_volumeSlider;
    v13->_volumeSlider = v96;

    v116[0] = v13->_volumeSlider;
    v116[1] = v13->_volumeButton;
    uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
    defaultAudioControls = v13->_defaultAudioControls;
    v13->_defaultAudioControls = (NSArray *)v98;

    v100 = -[AVLayoutView initWithFrame:]([AVLayoutView alloc], "initWithFrame:", v112, v44, v45, v46);
    volumeControls = v13->_volumeControls;
    v13->_volumeControls = v100;

    double v102 = v13->_volumeControls;
    double v115 = v13->_defaultAudioControls;
    v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
    [(AVLayoutView *)v102 setArrangedSubviews:v103];

    [(AVLayoutView *)v13->_volumeControls setDebugIdentifier:@"volumeControls"];
    v13->_needsIntialLayout = 1;
    [(AVView *)v13->_screenModeControls setIgnoresTouches:1];
    [(AVView *)v13->_volumeControls setIgnoresTouches:1];
    [(AVView *)v13->_prominentPlayButtonContainerView setIgnoresTouches:1];
    [(AVView *)v13->_transportControlsContainerView setIgnoresTouches:1];
    double v104 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v113.origin.x, v113.origin.y, v113.size.width, v113.size.height);
    playbackControlsContainer = v13->_playbackControlsContainer;
    v13->_playbackControlsContainer = v104;

    v106 = -[AVTouchIgnoringView initWithFrame:]([AVTouchIgnoringView alloc], "initWithFrame:", v112, v44, v45, v46);
    volumeControlsContainer = v13->_volumeControlsContainer;
    v13->_volumeControlsContainer = v106;

    [(AVTouchIgnoringView *)v13->_volumeControlsContainer setIncluded:1];
    v108 = [[AVObservationController alloc] initWithOwner:v13];
    observationController = v13->_observationController;
    v13->_observationController = v108;

    [(AVObservationController *)v13->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB3140] object:0 notificationCenter:0 observationHandler:&__block_literal_global_11762];
    [(AVObservationController *)v13->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB3170] object:0 notificationCenter:0 observationHandler:&__block_literal_global_11762];
    [(AVObservationController *)v13->_observationController startObservingNotificationForName:*MEMORY[0x1E4FB2C28] object:0 notificationCenter:0 observationHandler:&__block_literal_global_39_11763];
    v110 = [MEMORY[0x1E4FB1618] whiteColor];
    [(AVPlaybackControlsView *)v13 setTintColor:v110];
  }
  return v13;
}

void __51__AVPlaybackControlsView_initWithFrame_styleSheet___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v29 = a2;
  id v5 = a4;
  int v6 = [v5 userInfo];
  long long v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v7 CGRectValue];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = [v5 userInfo];
  double v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB2C10]];
  char v18 = [v17 BOOLValue];

  uint64_t v19 = [v5 userInfo];
  char v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA0]];
  uint64_t v21 = [v20 longValue];

  uint64_t v22 = [v5 userInfo];

  char v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA8]];
  [v23 doubleValue];
  double v25 = v24;

  v31.origin.double x = v9;
  v31.origin.double y = v11;
  v31.size.double width = v13;
  v31.size.double height = v15;
  double Height = CGRectGetHeight(v31);
  [v29 keyboardHeight];
  if (Height != v27)
  {
    v32.origin.double x = v9;
    v32.origin.double y = v11;
    v32.size.double width = v13;
    v32.size.double height = v15;
    [v29 setKeyboardHeight:CGRectGetHeight(v32)];
    if ((v18 & 1) == 0)
    {
      double v28 = [v29 window];

      if (v28) {
        [v29 _animateKeyboardAvoidance:v21 duration:v25];
      }
    }
  }
}

uint64_t __51__AVPlaybackControlsView_initWithFrame_styleSheet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsLayout];
}

@end