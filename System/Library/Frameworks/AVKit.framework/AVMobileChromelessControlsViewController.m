@interface AVMobileChromelessControlsViewController
- (AVEnhanceDialogueController)enhanceDialogueController;
- (AVMobileChromelessControlsViewController)init;
- (AVMobileContentTabPresentationContext)contentTabPresentationContext;
- (BOOL)_canPerformSetup;
- (BOOL)_isLandscape;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)prefersFullScreenStyleForEmbeddedMode;
- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3;
- (BOOL)showsAnalysisControl;
- (BOOL)showsAudioTrackSelectionMenu;
- (BOOL)showsCopySubjectControl;
- (BOOL)showsVisualLookupControl;
- (CGRect)unobscuredContentArea;
- (NSArray)customInfoViewControllers;
- (UIPanGestureRecognizer)contentTabPanGestureRecognizer;
- (double)_frameForLiveEdgeMarkContentTag:(double)a3;
- (double)extendedDynamicRangeGain;
- (float)_normalizeTimeValue:(uint64_t)a1;
- (id)_auxiliaryControlForControlItem:(uint64_t)a1;
- (id)_auxiliaryControlForIdentifier:(uint64_t)a1;
- (id)_auxiliaryControlsView;
- (id)_didEndUpdatingControlsVisibilityStateTo:(uint64_t)a3 completed:(int)a4;
- (id)_displayModeControlsView;
- (id)_identifierForMenuElement:(void *)a1;
- (id)_timelineSlider;
- (id)_timelineView;
- (id)_titlebarView;
- (id)_updateRoutePickerControlInclusionState;
- (id)_volumeControlsView;
- (id)auxiliaryControlsView:(id)a3 menuElementForControl:(id)a4;
- (id)controlsView;
- (id)displayModeControlsLayoutItem;
- (id)mediaSelectionMenuController:(id)a3 displayNameForMediaSelectionOption:(id)a4;
- (id)menuForMenuButton:(id)a3;
- (id)transportControlsLayoutItem;
- (id)volumeControlsLayoutItem;
- (uint64_t)_activeRouteSupportsAdjustingVolume;
- (uint64_t)_isScrubbing;
- (uint64_t)_preferredAuxiliaryControlsPlacement;
- (uint64_t)_setUpMediaSelectionMenuControllerIfNeeded;
- (uint64_t)_shouldIncludeRoutePickerButton;
- (uint64_t)_updateAudibleMediaSelectionControlInclusionState;
- (uint64_t)_updateWebKitExcludedObservationState;
- (unint64_t)visibleControls;
- (void)_animateSliderToTintState:(void *)a3 duration:(double)a4 completionHandler:;
- (void)_animateVolumeEmphasisTo:(id *)a1;
- (void)_attemptSetupIfNeeded;
- (void)_cancelOutstandVisibilityUpdates;
- (void)_configureAuxiliaryControlButton:(void *)a1;
- (void)_contentTabPanGestureRecognizerTriggered:(id)a3;
- (void)_contentTabTapGestureRecognizerTriggered:(id)a3;
- (void)_decrementUserInteractionCount;
- (void)_didBeginUpdatingControlsVisibilityStateFromState:(uint64_t)a3 toState:(uint64_t)a4 withAnimationCoordinator:(uint64_t)a5;
- (void)_enumerateControlItemsOfTypes:(id)a3 usingBlock:(id)a4;
- (void)_handleJumpToLiveAction;
- (void)_handleMuteStateToggle;
- (void)_hideControlsIfPossible;
- (void)_incrementUserInteractionCount;
- (void)_resetVolumeControlsEmphasisDelayTimer;
- (void)_resetVolumeSliderTemporarilyVisibleTimer;
- (void)_setContentTabPresented:(int)a3 animated:;
- (void)_setNeedsControlsVisibilityStateUpdate;
- (void)_setUpAnalysisControlIfNeeded;
- (void)_setUpAuxiliaryControlsViewIfNeeded;
- (void)_setUpCopySubjectControlIfNeeded;
- (void)_setUpPanGestureRecognizerIfNeeded;
- (void)_setUpTapGestureRecognizerIfNeeded;
- (void)_setUpVisualLookupControlIfNeeded;
- (void)_temporarilyShowVolumeSlider;
- (void)_timelineSliderDidChangeValue:(id)a3;
- (void)_transitionContentTabIfNeccesary:(double)a3;
- (void)_updateAnalysisControlInclusionIfNeeded;
- (void)_updateAudibleMediaSelectionMenu;
- (void)_updateAuxiliaryControlSpacing;
- (void)_updateAuxiliaryControls;
- (void)_updateAuxiliaryControlsForControlItems;
- (void)_updateContentTabViewControllers;
- (void)_updateContentTabsInteractionEnablementState;
- (void)_updateContentTag;
- (void)_updateControlItemsInclusionState;
- (void)_updateControlsViewLayoutConfiguration;
- (void)_updateControlsVisibilityStateAnimated:(uint64_t)a1;
- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3;
- (void)_updateDisplayModeControlsButtonsInclusion;
- (void)_updateDisplayModeControlsForControlItems;
- (void)_updateExtendedDynamicRangeGain;
- (void)_updateFullScreenButtonIcon;
- (void)_updateJumpToLiveControlInclusionStateIfNeeded;
- (void)_updateLayoutMargins;
- (void)_updateLegibleMediaSelectionControlInclusionState;
- (void)_updateLegibleMediaSelectionMenu;
- (void)_updateLoadingAnimatorState;
- (void)_updatePinnedAuxiliaryControlsIfNeeded;
- (void)_updatePlayPauseButtonIcon;
- (void)_updatePlaybackControlsViewInclusionState;
- (void)_updatePlaybackSpeedControlInclusion;
- (void)_updatePrefersSystemVolumeHUDHidden;
- (void)_updatePrefersVolumeSliderIncludedAnimated:(uint64_t)a1;
- (void)_updateSecondaryPlaybackControlsTypes;
- (void)_updateSliderMarkForLiveEdgeIfNeeded;
- (void)_updateStyleSheet;
- (void)_updateTimeResolver;
- (void)_updateTimelineEmphasisStateIfNeeded;
- (void)_updateTimelineLabelPositions;
- (void)_updateTimelineSliderEnablementState;
- (void)_updateTimelineValues;
- (void)_updateTimelineViewSliderMarksIfNeeded;
- (void)_updateTintColorsForAuxiliaryControlButtons;
- (void)_updateTitleAndDescriptionInfo;
- (void)_updateTitleBarViewInclusionState;
- (void)_updateTransportControlsLayoutGuidesConstraintsIfNeeded;
- (void)_updateViewVisibilityStatesTo:(__int16)a3;
- (void)_updateVolumeControllerClient;
- (void)_updateVolumeControlsViewAllowsVolumeAdjustmentState;
- (void)_updateVolumeControlsViewMutedState;
- (void)_updateVolumeControlsViewVolumeWithMuteStateUpdate:(id *)a1;
- (void)buttonIsOverVideoDidChange:(id)a3;
- (void)contentTabsViewController:(id)a3 didChangeSelectedCustomInfoViewController:(id)a4 withReason:(unint64_t)a5;
- (void)controlItemDidUpdateVisualConfiguration:(id)a3;
- (void)dealloc;
- (void)didBeginIndirectUserInteraction;
- (void)dismissCustomInfoViewControllerAnimated:(BOOL)a3;
- (void)displayModeControlsView:(id)a3 layoutWithHiddenIdentifiers:(id)a4;
- (void)displayModeControlsViewFullscreenButtonWasPressed:(id)a3;
- (void)displayModeControlsViewPictureInPictureButtonWasPressed:(id)a3;
- (void)flashControlsWithDuration:(double)a3;
- (void)fullscreenControllerDidChangePresentationState:(id)a3;
- (void)loadView;
- (void)mediaSelectionMenuController:(id)a3 didSelectEnhanceDialogueOption:(int64_t)a4;
- (void)mediaSelectionMenuController:(id)a3 didSelectOption:(id)a4;
- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3;
- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3;
- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3;
- (void)setControlItems:(id)a3;
- (void)setCustomInfoViewControllers:(id)a3;
- (void)setEnhanceDialogueController:(id)a3;
- (void)setExcludedControls:(unint64_t)a3;
- (void)setExtendedDynamicRangeGain:(double)a3;
- (void)setFullscreenController:(id)a3;
- (void)setIncludedControls:(unint64_t)a3;
- (void)setOptimizeForPerformance:(BOOL)a3;
- (void)setPlaybackSpeedCollection:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setRoutingConfiguration:(id)a3;
- (void)setSecondaryPlaybackControlsType:(unint64_t)a3;
- (void)setShowsAnalysisControl:(BOOL)a3;
- (void)setShowsAudioTrackSelectionMenu:(BOOL)a3;
- (void)setShowsCopySubjectControl:(BOOL)a3;
- (void)setShowsFullScreenControl:(BOOL)a3;
- (void)setShowsVisualLookupControl:(BOOL)a3;
- (void)setTransportBarCustomMenuItems:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4;
- (void)slider:(id)a3 didUpdateFrame:(CGRect)a4 forSliderMark:(id)a5;
- (void)sliderDidBeginTracking:(id)a3;
- (void)sliderDidEndTracking:(id)a3;
- (void)sliderWillEndTracking:(id)a3;
- (void)toggleVisibility:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateVisibilityPolicy:(unint64_t)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4;
- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4 withUpdateSource:(unint64_t)a5;
- (void)volumeControlsViewButtonWasTapped:(id)a3;
- (void)volumeControlsViewInteractionDidBegin:(id)a3;
- (void)volumeControlsViewInteractionDidEnd:(id)a3;
- (void)webkitPlayerController:(id)a3 didChangeScrubbingStateTo:(BOOL)a4;
@end

@implementation AVMobileChromelessControlsViewController

- (AVMobileContentTabPresentationContext)contentTabPresentationContext
{
  return self->_contentTabPresentationContext;
}

- (uint64_t)_activeRouteSupportsAdjustingVolume
{
  v2 = [a1 playerController];
  int v3 = [v2 isExternalPlaybackActive];

  v4 = [a1 volumeController];
  LODWORD(v2) = [v4 currentRouteHasVolumeControl];

  return v2 & ~v3;
}

- (void)_updateAuxiliaryControls
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [*(id *)(a1 + 1184) auxiliaryControlsView];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = *(void **)(a1 + 1608);
    if (v4 && [v4 count])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v5 = *(id *)(a1 + 1608);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v5);
            }
            [v3 addObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v7);
      }
    }
    uint64_t v10 = [(id)a1 transportBarCustomMenuItems];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(id)a1 transportBarCustomMenuItems];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v14 = objc_msgSend((id)a1, "transportBarCustomMenuItems", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              -[AVMobileChromelessControlsViewController _identifierForMenuElement:](*(void **)(*((void *)&v24 + 1)
              v19 = + 8 * j));
              v20 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0 identifier:v19];
              [v20 setIncluded:1];
              [v3 addObject:v20];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v16);
        }
      }
    }
    if (*(void *)(a1 + 1232)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(void *)(a1 + 1240))
    {
      v21 = [(id)a1 fullscreenController];
      uint64_t v22 = [v21 presentationState];

      uint64_t v23 = *(void *)(a1 + 1240);
      if (v22 == 2) {
        [v3 addObject:v23];
      }
      else {
        [v3 insertObject:v23 atIndex:0];
      }
    }
    if (*(void *)(a1 + 1224)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(unsigned char *)(a1 + 1732) && *(void *)(a1 + 1208)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(void *)(a1 + 1216)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(void *)(a1 + 1248)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(void *)(a1 + 1256)) {
      objc_msgSend(v3, "addObject:");
    }
    if (*(void *)(a1 + 1264)) {
      objc_msgSend(v3, "addObject:");
    }
    [v2 setControls:v3];
    [v2 updateOverflowMenu];
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
  }
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMobileControlsViewController *)self transportBarCustomMenuItems];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v6 setTransportBarCustomMenuItems:v4];
    if (self)
    {
      if (self->_hasBeenSetUp) {
        -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
      }
    }
  }
}

- (void)_updateAuxiliaryControlSpacing
{
  if (a1)
  {
    id v7 = [a1[148] auxiliaryControlsView];
    v2 = [a1 fullscreenController];
    uint64_t v3 = [v2 presentationState];

    if (v3 == 2)
    {
      [a1[147] standardPaddingInline];
      double v5 = v4;
    }
    else if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)a1))
    {
      double v5 = 26.0;
    }
    else
    {
      double v5 = 13.0;
    }
    [v7 controlSpacing];
    if (v6 != v5)
    {
      [v7 setControlSpacing:v5];
      [a1[148] setNeedsLayout];
    }
  }
}

- (void)_updatePinnedAuxiliaryControlsIfNeeded
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 fullscreenController];
    uint64_t v3 = [v2 presentationState];

    double v4 = [(id)a1 traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    [*(id *)(a1 + 1184) bounds];
    double v7 = v6;
    double v9 = v8;
    [*(id *)(a1 + 1184) bounds];
    double v11 = v10;
    v12 = [(id)a1 traitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = v14;
    if (v3 != 2)
    {
      BOOL v17 = v7 <= v9 || v13 != 0;
      BOOL v18 = v11 > 600.0 && v5 == 1;
      if (v18 || !v17)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v24 = [*(id *)(a1 + 1184) auxiliaryControlsView];
        id v19 = [v24 controls];

        uint64_t v25 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v19);
              }
              long long v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (([v29 canOnlyAppearInOverflowMenu] & 1) == 0) {
                [v15 addObject:v29];
              }
            }
            uint64_t v26 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v26);
        }
        goto LABEL_35;
      }
      if (*(void *)(a1 + 1240)) {
        objc_msgSend(v14, "addObject:");
      }
    }
    if (*(void *)(a1 + 1232)) {
      objc_msgSend(v15, "addObject:");
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = *(id *)(a1 + 1608);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v15, "addObject:", *(void *)(*((void *)&v31 + 1) + 8 * j), (void)v31);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }
LABEL_35:

    long long v30 = *(void **)(a1 + 1192);
    *(void *)(a1 + 1192) = v15;

    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
  }
}

- (void)_updateDisplayModeControlsButtonsInclusion
{
  if (a1)
  {
    id v12 = [a1[148] displayModeControlsView];
    __int16 v2 = [a1 excludedControls];
    if (+[AVPictureInPictureController isPictureInPictureSupported])
    {
      uint64_t v3 = [a1 pipController];
      unsigned int v4 = [v3 isPictureInPicturePossible];
      if ((v2 & 0x100) != 0) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = v4;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    double v6 = [a1 fullscreenController];
    if ([v6 presentationState])
    {
      double v7 = [a1 fullscreenController];
      BOOL v8 = [v7 presentationState] == 1 && (objc_msgSend(a1, "excludedControls") & 0x80) == 0;
    }
    else
    {
      BOOL v8 = ([a1 excludedControls] & 0x80) == 0;
    }

    if ([a1 showsFullScreenControl])
    {
      double v9 = [a1 fullscreenController];
      BOOL v10 = [v9 presentationState] == 2 && (objc_msgSend(a1, "excludedControls") & 0x40) == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    uint64_t shouldIncludeRoutePicker = -[AVMobileChromelessControlsViewController _shouldIncludeRoutePickerButton](a1);
    [v12 setIncludesFullscreenControl:v10 | v8];
    [v12 setIncludesPictureInPictureControl:v5];
    [v12 setIncludesRoutePickerControl:shouldIncludeRoutePicker];
  }
}

- (void)_updateControlsViewLayoutConfiguration
{
  if (a1)
  {
    __int16 v2 = [(id)a1 fullscreenController];
    uint64_t v3 = [v2 presentationState];

    id v4 = *(id *)(a1 + 1712);
    uint64_t v5 = -[AVMobileChromelessControlsViewController _preferredAuxiliaryControlsPlacement]((void *)a1);
    [*(id *)(a1 + 1176) standardPaddingFullScreen];
    uint64_t v7 = v6;
    [v4 presentationHeight];
    uint64_t v9 = v8;
    uint64_t v10 = [(id)a1 includedControls];
    if (v4) {
      BOOL v11 = [v4 state] == 2;
    }
    else {
      BOOL v11 = 0;
    }
    if (v3 == 2)
    {
      [*(id *)(a1 + 1176) standardPaddingInline];
      uint64_t v7 = v12;
      v10 &= ~0x40uLL;
    }
    char v13 = *(unsigned char *)(a1 + 1528);
    id v14 = *(id *)(a1 + 1192);
    char v15 = *(unsigned char *)(a1 + 1672);
    uint64_t v16 = [*(id *)(a1 + 1712) contentTabsLayout];

    BOOL v17 = *(void **)(a1 + 1184);
    uint64_t v20 = v10;
    char v21 = v13;
    memset(v22, 0, sizeof(v22));
    uint64_t v23 = v7;
    uint64_t v24 = v5;
    id v18 = v14;
    id v19 = v18;
    id v25 = v18;
    char v26 = v15;
    BOOL v27 = v11;
    int v28 = 0;
    __int16 v29 = 0;
    uint64_t v30 = v16;
    uint64_t v31 = v9;
    if (v17) {
      [v17 setLayoutConfiguration:&v20];
    }
    else {
  }
    }
}

- (uint64_t)_preferredAuxiliaryControlsPlacement
{
  __int16 v2 = [a1 fullscreenController];
  uint64_t v3 = [v2 presentationState];

  if (v3 == 2) {
    return [a1 prefersFullScreenStyleForEmbeddedMode] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)prefersFullScreenStyleForEmbeddedMode
{
  return self->_prefersFullScreenStyleForEmbeddedMode;
}

- (uint64_t)_shouldIncludeRoutePickerButton
{
  char v2 = [a1 excludedControls];
  uint64_t v3 = [a1 playerController];
  unsigned int v4 = [v3 allowsExternalPlayback];

  if ((v2 & 0x10) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)setSecondaryPlaybackControlsType:(unint64_t)a3
{
  if ([(AVMobileControlsViewController *)self secondaryPlaybackControlsType] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setSecondaryPlaybackControlsType:a3];
    if (self)
    {
      if (self->_hasBeenSetUp) {
        -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(AVControlsViewController *)self playbackSpeedCollection];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVControlsViewController *)&v6 setPlaybackSpeedCollection:v4];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        [(AVMobilePlaybackRateMenuController *)self->_playbackSpeedMenuController setPlaybackSpeedCollection:v4];
        -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setVolumeController:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMobileControlsViewController *)self volumeController];

  if (v5)
  {
    objc_super v6 = [(AVMobileControlsViewController *)self volumeController];
    [v6 setPrefersSystemVolumeHUDHidden:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileControlsViewController *)&v7 setVolumeController:v4];
  if (self && self->_hasBeenSetUp)
  {
    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:]((id *)&self->super.super.super.super.super.isa, 0);
    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState]((id *)&self->super.super.super.super.super.isa);
    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](self);
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 0);
  }
}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  if ([(AVMobileControlsViewController *)&v6 showsFullScreenControl] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setShowsFullScreenControl:v3];
    if (self)
    {
      if (self->_hasBeenSetUp) {
        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setRoutingConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMobileControlsViewController *)self routingConfiguration];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v7 setRoutingConfiguration:v4];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        objc_super v6 = [(AVMobileChromelessControlsView *)self->_view displayModeControlsView];
        [v6 setRoutingConfiguration:v4];

        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVMobileControlsViewController *)self requiresLinearPlayback] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setRequiresLinearPlayback:v3];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateTimelineSliderEnablementState](self);
      }
    }
  }
}

- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3
{
  if (self->_prefersFullScreenStyleForEmbeddedMode != a3)
  {
    self->_prefersFullScreenStyleForEmbeddedMode = a3;
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
    -[AVMobileChromelessControlsViewController _updateExtendedDynamicRangeGain]((uint64_t)self);
    -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
  }
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVMobileControlsViewController *)self optimizeForPerformance] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setOptimizeForPerformance:v3];
    -[AVMobileChromelessControlsViewController _attemptSetupIfNeeded](self);
  }
}

- (void)setIncludedControls:(unint64_t)a3
{
  if ([(AVMobileControlsViewController *)self includedControls] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setIncludedControls:a3];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
      }
    }
  }
}

- (void)setFullscreenController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessControlsViewController;
  id v4 = a3;
  [(AVMobileControlsViewController *)&v5 setFullscreenController:v4];
  objc_msgSend(v4, "setDelegate:", self, v5.receiver, v5.super_class);
}

- (void)setExcludedControls:(unint64_t)a3
{
  if ([(AVMobileControlsViewController *)self excludedControls] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v5 setExcludedControls:a3];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _updateTitleBarViewInclusionState]((id *)&self->super.super.super.super.super.isa);
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
      }
    }
  }
}

- (void)setEnhanceDialogueController:(id)a3
{
}

- (void)setControlItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessControlsViewController;
  id v5 = [(AVMobileControlsViewController *)&v17 controlItems];

  if (v5 != v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v12.receiver = self;
    v12.super_class = (Class)AVMobileChromelessControlsViewController;
    objc_super v6 = [(AVMobileControlsViewController *)&v12 controlItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v10++) setDelegate:0];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    v11.receiver = self;
    v11.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v11 setControlItems:v4];
    if (self && self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlsForControlItems](self);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsForControlItems]((id *)&self->super.super.super.super.super.isa);
    }
  }
}

- (AVMobileChromelessControlsViewController)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessControlsViewController;
  char v2 = [(AVMobileControlsViewController *)&v11 init];
  BOOL v3 = v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v2->_sliderEdgeInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v2->_sliderEdgeInsets.bottom = v4;
    v2->_showsAudioTrackSelectionMenu = 1;
    id v5 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v6 = [v5 globallyUniqueString];
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v6;

    v12[0] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v9 = (id)[(AVMobileChromelessControlsViewController *)v3 registerForTraitChanges:v8 withHandler:&__block_literal_global_17938];
  }
  return v3;
}

- (void)fullscreenControllerDidChangePresentationState:(id)a3
{
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateLayoutMargins](self);
  -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 0);

  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
}

- (void)_updateVolumeControllerClient
{
  if (a1)
  {
    char v2 = [*(id *)(a1 + 1184) window];
    BOOL v3 = [v2 windowScene];
    long long v4 = [v3 session];
    id v6 = [v4 persistentIdentifier];

    id v5 = [(id)a1 volumeController];
    [v5 setClientWithIdentifier:*(void *)(a1 + 1408) forWindowSceneSessionWithIdentifier:v6];

    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden]((void *)a1);
  }
}

- (void)_updateTimelineLabelPositions
{
  if (a1)
  {
    id v5 = [a1[148] timelineView];
    char v2 = [a1 fullscreenController];
    uint64_t v3 = [v2 presentationState];

    if (v3 == 2) {
      uint64_t v4 = [a1 prefersFullScreenStyleForEmbeddedMode];
    }
    else {
      uint64_t v4 = 1;
    }
    if ([v5 labelPosition] != v4)
    {
      [v5 setLabelPosition:v4];
      [a1[148] setNeedsLayout];
    }
  }
}

- (void)_updateSecondaryPlaybackControlsTypes
{
  if (a1)
  {
    char v2 = [a1[148] playbackControlsView];
    uint64_t v3 = [a1 secondaryPlaybackControlsType];
    if (v3 == 1)
    {
      [v2 setBackwardSecondaryControlIcon:1];
      uint64_t v4 = v2;
      uint64_t v5 = 1;
    }
    else
    {
      if (v3)
      {
        id v6 = _AVLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Error: Unrecognized AVMobileSecondaryPlaybackControlsType", v7, 2u);
        }

        goto LABEL_10;
      }
      [v2 setBackwardSecondaryControlIcon:0];
      uint64_t v4 = v2;
      uint64_t v5 = 0;
    }
    [v4 setForwardSecondaryControlIcon:v5];
LABEL_10:
  }
}

- (void)_updatePrefersVolumeSliderIncludedAnimated:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 1184) volumeControlsView];
    uint64_t v5 = [(id)a1 fullscreenController];
    uint64_t v6 = [v5 presentationState];

    if (-[AVMobileChromelessControlsViewController _activeRouteSupportsAdjustingVolume]((void *)a1))
    {
      if (-[AVMobileChromelessControlsViewController _isLandscape](a1) && v6 != 2
        || ([(id)a1 traitCollection],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v8 = [v7 userInterfaceIdiom],
            v7,
            v8 == 1)
        && v6 != 2)
      {
        if (([v4 prefersVolumeSliderIncluded] & 1) == 0)
        {
          BOOL v9 = 1;
          goto LABEL_12;
        }
LABEL_18:

        return;
      }
      BOOL v9 = *(unsigned char *)(a1 + 1368) != 0;
      if ([v4 prefersVolumeSliderIncluded] == v9) {
        goto LABEL_18;
      }
    }
    else
    {
      if (([v4 prefersVolumeSliderIncluded] & 1) == 0) {
        goto LABEL_18;
      }
      BOOL v9 = 0;
    }
LABEL_12:
    if (a2)
    {
      double v10 = 0.0;
      if ([*(id *)(a1 + 1384) isRunning])
      {
        if ([*(id *)(a1 + 1384) isInterruptible])
        {
          [*(id *)(a1 + 1384) fractionComplete];
          double v10 = v11;
          [*(id *)(a1 + 1384) stopAnimation:1];
          [*(id *)(a1 + 1384) finishAnimationAtPosition:2];
          objc_super v12 = *(void **)(a1 + 1384);
          *(void *)(a1 + 1384) = 0;
        }
      }
      objc_initWeak(&location, (id)a1);
      id v13 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __87__AVMobileChromelessControlsViewController__updatePrefersVolumeSliderIncludedAnimated___block_invoke;
      v16[3] = &unk_1E5FC46C0;
      objc_copyWeak(&v17, &location);
      BOOL v18 = v9;
      uint64_t v14 = [v13 initWithDuration:3 curve:v16 animations:(1.0 - v10) * 0.1];
      long long v15 = *(void **)(a1 + 1384);
      *(void *)(a1 + 1384) = v14;

      [*(id *)(a1 + 1384) startAnimation];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      [v4 setPrefersVolumeSliderIncluded:v9];
    }
    goto LABEL_18;
  }
}

- (void)_updatePrefersSystemVolumeHUDHidden
{
  if (a1)
  {
    if (([a1 excludedControls] & 0x200) != 0)
    {
      uint64_t v7 = 0;
    }
    else
    {
      char v2 = [a1 pipController];
      int v3 = [v2 isPictureInPictureActive];

      char v4 = [a1 includedControls];
      uint64_t v5 = [a1 fullscreenController];
      uint64_t v6 = [v5 presentationState];

      if (v6 == 2 || (v3 & 1) != 0 || (v4 & 2) == 0)
      {
        unint64_t v8 = a1[186];
        BOOL v9 = [a1 fullscreenController];
        BOOL v10 = [v9 presentationState] == 2;

        uint64_t v7 = v10 & ~v3 & (v8 >> 1) & 1;
      }
      else
      {
        uint64_t v7 = 1;
      }
    }
    id v11 = [a1 volumeController];
    [v11 setPrefersSystemVolumeHUDHidden:v7];
  }
}

- (void)_updateLayoutMargins
{
  if (result)
  {
    v1 = (id *)result;
    double v2 = *((double *)result + 169);
    int v3 = [result fullscreenController];
    uint64_t v4 = [v3 presentationState];

    uint64_t v5 = v4 == 2 ? [v1 prefersFullScreenStyleForEmbeddedMode] : 1;
    [v1[147] playbackControlsViewLayoutMarginsForView:v1[148] keyboardHeight:v5 isFullScreen:v2];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    result = (void *)[v1[148] layoutMargins];
    BOOL v18 = v17 == v9 && v14 == v7;
    BOOL v19 = v18 && v16 == v13;
    if (!v19 || v15 != v11)
    {
      objc_msgSend(v1[148], "setLayoutMargins:", v7, v9, v11, v13);
      id v21 = v1[148];
      return (void *)[v21 setNeedsLayout];
    }
  }
  return result;
}

- (void)_updateFullScreenButtonIcon
{
  if (a1)
  {
    id v4 = [a1[148] displayModeControlsView];
    double v2 = [a1 fullscreenController];
    unint64_t v3 = [v2 presentationState];

    if (v3 <= 2) {
      [v4 setFullscreenIcon:qword_1B07213F0[v3]];
    }
  }
}

- (void)_setNeedsControlsVisibilityStateUpdate
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 1504))
  {
    if (*(unsigned char *)(a1 + 1168))
    {
      *(unsigned char *)(a1 + 1504) = 1;
      double v2 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      v4[0] = *MEMORY[0x1E4F1C4B0];
      unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
      [v2 performSelector:sel__updateControlsVisibilityStateIfNeededAnimated_ target:a1 argument:MEMORY[0x1E4F1CC38] order:0 modes:v3];
    }
  }
}

- (void)setPlayerController:(id)a3
{
  id v4 = a3;
  id v5 = [(AVMobileControlsViewController *)self playerController];

  if (v5 != v4)
  {
    double v6 = [(AVMobileControlsViewController *)self playerController];
    objc_msgSend(v6, "avkit_setWebKitDelegate:", 0);

    v8.receiver = self;
    v8.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v8 setPlayerController:v4];
    double v7 = [(AVMobileControlsViewController *)self playerController];
    objc_msgSend(v7, "avkit_setWebKitDelegate:", self);

    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        [(AVPlayerControllerTimeResolver *)self->_timeResolver setPlayerController:v4];
        -[AVMobileChromelessControlsViewController _updateWebKitExcludedObservationState]((uint64_t)self);
        -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)self);
      }
    }
  }
}

- (void)updateVisibilityPolicy:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v7 = [(AVMobileControlsViewController *)self visibilityPolicy];
  if (v7 != a3)
  {
    unint64_t v8 = v7;
    v9.receiver = self;
    v9.super_class = (Class)AVMobileChromelessControlsViewController;
    [(AVMobileControlsViewController *)&v9 setVisibilityPolicy:a3];
    if (self)
    {
      if (self->_hasBeenSetUp)
      {
        if (a3 == 2)
        {
          if (v8 == 1)
          {
            -[AVMobileChromelessControlsViewController _hideControlsIfPossible]((uint64_t)self);
          }
          else if (!v8)
          {
            [(id)objc_opt_class() autoHideInterval];
            -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
          }
        }
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        if (!a4) {
          [(AVMobileChromelessControlsViewController *)self _updateControlsVisibilityStateIfNeededAnimated:MEMORY[0x1E4F1CC28]];
        }
      }
    }
  }
}

- (id)controlsView
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhanceDialogueController, 0);
  objc_storeStrong((id *)&self->_contentTabPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentTabTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contentTabPresentationContext, 0);
  objc_storeStrong((id *)&self->_contentTabsViewController, 0);
  objc_storeStrong((id *)&self->_contentTabViewPresentationAnimator, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_liveEdgeSliderMark, 0);
  objc_storeStrong((id *)&self->_timelineSliderEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsForControlItems, 0);
  objc_storeStrong((id *)&self->_defaultTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_auxiliaryControlsViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_timelineTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titlebarViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_currentTransportControlsTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_volumeControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_displayModeControlsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_visibilityAnimator, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_loadingAnimator, 0);
  objc_storeStrong((id *)&self->_mediaSelectionMenuController, 0);
  objc_storeStrong((id *)&self->_playbackSpeedMenuController, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeResolver, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeSliderTemporarilyVisibleTimer, 0);
  objc_storeStrong((id *)&self->_volumeEmphasisAnimationDelayTimer, 0);
  objc_storeStrong((id *)&self->_volumeControlsSliderAnimator, 0);
  objc_storeStrong((id *)&self->_volumeControlsEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_keyboardUIAvoidanceAnimator, 0);
  objc_storeStrong((id *)&self->_visualLookupAction, 0);
  objc_storeStrong((id *)&self->_copySubjectAction, 0);
  objc_storeStrong((id *)&self->_analysisToggleAction, 0);
  objc_storeStrong((id *)&self->_jumpToLiveAction, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionButton, 0);
  objc_storeStrong((id *)&self->_jumpToLiveButton, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionMenu, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionMenu, 0);
  objc_storeStrong((id *)&self->_visualLookupControl, 0);
  objc_storeStrong((id *)&self->_copySubjectControl, 0);
  objc_storeStrong((id *)&self->_analysisControl, 0);
  objc_storeStrong((id *)&self->_jumpToLiveControl, 0);
  objc_storeStrong((id *)&self->_routePickerControl, 0);
  objc_storeStrong((id *)&self->_playbackSpeedControl, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionControl, 0);
  objc_storeStrong((id *)&self->_audibleMediaSelectionControl, 0);
  objc_storeStrong((id *)&self->_overflowDisplayModeControls, 0);
  objc_storeStrong((id *)&self->_pinnedAuxiliaryControls, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_webKitExcludedObservationController, 0);

  objc_storeStrong((id *)&self->_observationController, 0);
}

- (double)extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (AVEnhanceDialogueController)enhanceDialogueController
{
  return self->_enhanceDialogueController;
}

- (BOOL)showsAudioTrackSelectionMenu
{
  return self->_showsAudioTrackSelectionMenu;
}

- (BOOL)showsVisualLookupControl
{
  return self->_showsVisualLookupControl;
}

- (BOOL)showsCopySubjectControl
{
  return self->_showsCopySubjectControl;
}

- (BOOL)showsAnalysisControl
{
  return self->_showsAnalysisControl;
}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (void)_updateTimelineEmphasisStateIfNeeded
{
  if (a1)
  {
    uint64_t v2 = -[AVMobileChromelessControlsViewController _isScrubbing](a1);
    unint64_t v3 = [a1[148] timelineView];
    if (v2 != [v3 isEmphasized])
    {
      [v3 prepareForDeemphasisIfNeeded];
      [v3 setEmphasized:v2];
      id v4 = a1[202];
      double v5 = 1.0;
      double v6 = 1.0;
      if (v4 && [v4 isRunning] && objc_msgSend(a1[202], "isInterruptible"))
      {
        [a1[202] fractionComplete];
        double v6 = v7;
        [a1[202] stopAnimation:1];
        [a1[202] finishAnimationAtPosition:2];
        id v8 = a1[202];
        a1[202] = 0;
      }
      if (v6 <= 1.0) {
        double v9 = v6 * 0.2;
      }
      else {
        double v9 = 0.2;
      }
      if (v2)
      {
        double v10 = 288.0;
      }
      else
      {
        double v5 = 2.0;
        double v10 = 500.0;
      }
      if (v2) {
        double v11 = 26.5;
      }
      else {
        double v11 = 40.0;
      }
      double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", v5, v10, v11, 0.0, 0.0);
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v12 timingParameters:v9];
      id v14 = a1[202];
      a1[202] = (id)v13;

      objc_initWeak(&location, a1);
      id v15 = a1[202];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke;
      v22[3] = &unk_1E5FC46C0;
      objc_copyWeak(&v23, &location);
      char v24 = v2;
      [v15 addAnimations:v22];
      id v16 = a1[202];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      BOOL v19 = __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke_2;
      uint64_t v20 = &unk_1E5FC3998;
      objc_copyWeak(&v21, &location);
      [v16 addCompletion:&v17];
      objc_msgSend(a1[202], "startAnimation", v17, v18, v19, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

- (uint64_t)_isScrubbing
{
  uint64_t v2 = [a1 playerController];
  unint64_t v3 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
  char v4 = [v3 isTracking];

  if (v4 & 1) != 0 || ([v2 isScrubbing]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = objc_msgSend(v2, "avkit_webkitIsScrubbing");
  }

  return v5;
}

void __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    unint64_t v3 = [WeakRetained[148] timelineView];
    [v3 setEmphasized:*(unsigned __int8 *)(a1 + 40)];

    char v4 = [v5[148] timelineView];
    [v4 layoutIfNeeded];

    WeakRetained = v5;
  }
}

void __80__AVMobileChromelessControlsViewController__updateTimelineEmphasisStateIfNeeded__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[202];
    WeakRetained[202] = 0;
    unint64_t v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (id)_timelineSlider
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 1184) timelineView];
    uint64_t v2 = [v1 slider];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)_timelineSliderDidChangeValue:(id)a3
{
  id v11 = a3;
  timeResolver = self->_timeResolver;
  if (timeResolver)
  {
    [(AVPlayerControllerTimeResolver *)timeResolver minTime];
    double v6 = v5;
    [(AVPlayerControllerTimeResolver *)self->_timeResolver maxTime];
    double v8 = v7;
    if (fabs(v6) != INFINITY && fabs(v7) != INFINITY)
    {
      double v9 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)self);
      [v9 value];
      [(AVPlayerControllerTimeResolver *)self->_timeResolver setTargetTime:v6 + (v8 - v6) * v10];
    }
  }
  -[AVMobileChromelessControlsViewController _updateTimelineValues]((uint64_t)self);
}

- (void)_updateTimelineValues
{
  if (a1)
  {
    -[AVMobileChromelessControlsViewController _timelineSlider](a1);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [*(id *)(a1 + 1184) timelineView];
    [v31 value];
    float v4 = v3;
    double v5 = *(void **)(a1 + 1184);
    if (v5 && *(unsigned char *)(a1 + 1168) && ([v5 isHidden] & 1) == 0 && (double v6 = *(void **)(a1 + 1416)) != 0)
    {
      [v6 minTime];
      double v8 = v7;
      [*(id *)(a1 + 1416) maxTime];
      double v10 = v9;
      id v11 = 0;
      double v12 = 0;
      if (fabs(v8) != INFINITY)
      {
        if (fabs(v9) == INFINITY)
        {
          double v12 = 0;
        }
        else
        {
          double v13 = v9 - v8;
          id v14 = [(id)a1 playerController];
          objc_msgSend(v14, "avkit_webkitSeekToTime");
          double v16 = v15;

          unint64_t v17 = (unint64_t)(COERCE__INT64(fabs(v10 - v8)) - 0x10000000000000) >> 53;
          BOOL v19 = (COERCE__INT64(v10 - v8) < 0 || v17 > 0x3FE)
             && (unint64_t)(COERCE__INT64(v10 - v8) - 1) > 0xFFFFFFFFFFFFELL;
          double v20 = fabs(v16);
          if (!v19 && v20 != INFINITY)
          {
            float v23 = (v16 - v8) / v13;
            float v4 = v23;
          }
          [*(id *)(a1 + 1424) setFormatTemplate:v10 - v8];
          [*(id *)(a1 + 1432) setFormatTemplate:v10 - v8];
          char v24 = [(id)a1 playerController];
          id v25 = [v24 currentOrEstimatedDate];
          if ([v24 hasSeekableLiveStreamingContent] && v25)
          {
            char v26 = [v25 dateByAddingTimeInterval:-(v13 - v16)];
            double v12 = [*(id *)(a1 + 1440) stringFromDate:v26];

            id v11 = &stru_1F09185C8;
          }
          else
          {
            double v12 = [*(id *)(a1 + 1424) stringFromSeconds:v16];
            id v11 = [*(id *)(a1 + 1432) stringFromSeconds:v10 - v16];
          }
        }
      }
    }
    else
    {
      id v11 = 0;
      double v12 = 0;
    }
    BOOL v27 = [v2 leadingTimeText];
    BOOL v28 = v27 == 0;

    __int16 v29 = [v2 trailingTimeText];

    if ((v12 != 0) == v28 || (v11 != 0) == (v29 == 0)) {
      [*(id *)(a1 + 1184) setNeedsLayout];
    }
    if (([v31 isTracking] & 1) == 0)
    {
      uint16x4_t v30 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1632), *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 1648), *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL));
      if (vminv_u16(v30))
      {
        *(float *)v30.i32 = v4;
        [v31 setValue:*(double *)&v30];
      }
    }
    [v2 setLeadingTimeText:v12];
    [v2 setTrailingTimeText:v11];
  }
}

- (void)_handleJumpToLiveAction
{
  id v3 = [(AVMobileControlsViewController *)self playerController];
  [v3 seekToEnd:self];
}

- (void)_enumerateControlItemsOfTypes:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AVMobileControlsViewController *)self controlItems];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__AVMobileChromelessControlsViewController__enumerateControlItemsOfTypes_usingBlock___block_invoke;
  v11[3] = &unk_1E5FC3A60;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __85__AVMobileChromelessControlsViewController__enumerateControlItemsOfTypes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = *(void **)(a1 + 32);
  id v7 = v3;
  double v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "type"));
  if ([v4 containsObject:v5])
  {
    uint64_t v6 = *(void *)(a1 + 40);

    if (v6) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
  }
}

- (void)_updateTintColorsForAuxiliaryControlButtons
{
  audibleMediaSelectionButton = self->_audibleMediaSelectionButton;
  float v4 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v5 = [(AVButton *)audibleMediaSelectionButton isButtonOverVideo];
  uint64_t v6 = [(AVMobileChromelessControlsViewController *)self traitCollection];
  id v7 = objc_msgSend(v4, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v5, objc_msgSend(v6, "userInterfaceStyle"));
  [(AVMenuButton *)audibleMediaSelectionButton setTintColor:v7];

  legibleMediaSelectionButton = self->_legibleMediaSelectionButton;
  id v9 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v10 = [(AVButton *)legibleMediaSelectionButton isButtonOverVideo];
  id v11 = [(AVMobileChromelessControlsViewController *)self traitCollection];
  id v12 = objc_msgSend(v9, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v10, objc_msgSend(v11, "userInterfaceStyle"));
  [(AVMenuButton *)legibleMediaSelectionButton setTintColor:v12];

  playbackSpeedButton = self->_playbackSpeedButton;
  id v14 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v15 = [(AVButton *)playbackSpeedButton isButtonOverVideo];
  id v17 = [(AVMobileChromelessControlsViewController *)self traitCollection];
  double v16 = objc_msgSend(v14, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v15, objc_msgSend(v17, "userInterfaceStyle"));
  [(AVMenuButton *)playbackSpeedButton setTintColor:v16];
}

- (void)_updateStyleSheet
{
  -[AVMobileChromelessControlsViewController _timelineView]((id *)&self->super.super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[AVMobileChromelessControlsViewController _titlebarView]((id *)&self->super.super.super.super.super.isa);
  float v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v5 = [v4 traitCollection];

  uint64_t v6 = [[AVMobileChromelessControlsStyleSheet alloc] initWithTraitCollection:v5];
  styleSheet = self->_styleSheet;
  self->_styleSheet = v6;

  [v8 setStyleSheet:self->_styleSheet];
  [v3 setStyleSheet:self->_styleSheet];
  -[AVMobileChromelessControlsViewController _updateLayoutMargins](self);
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
}

- (id)_timelineView
{
  if (a1)
  {
    a1 = [a1[148] timelineView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_titlebarView
{
  if (a1)
  {
    a1 = [a1[148] titlebarView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_contentTabTapGestureRecognizerTriggered:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 state] - 1;
  uint64_t v5 = v7;
  if (v4 <= 2)
  {
    id v6 = v7;
    if (self)
    {
      if ([(AVMobileContentTabPresentationContext *)self->_contentTabPresentationContext contentTabsLayout])
      {
        [(AVMobileChromelessControlsViewController *)self toggleVisibility:self];
      }
      else
      {
        [(AVMobileChromelessControlsViewController *)self dismissCustomInfoViewControllerAnimated:1];
      }
    }

    uint64_t v5 = v7;
  }
}

- (void)_contentTabPanGestureRecognizerTriggered:(id)a3
{
  id v39 = a3;
  uint64_t v4 = [v39 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    if (!self) {
      goto LABEL_26;
    }
    view = self->_view;
    id v15 = v39;
    [v15 velocityInView:view];
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [v15 state];

    double v21 = v17 * 0.05;
    uint64_t v23 = v19 < 0.0 || v20 == 4;
    contentTabPresentationContext = self->_contentTabPresentationContext;
    if (!contentTabPresentationContext) {
      goto LABEL_19;
    }
    if (![(AVMobileContentTabPresentationContext *)contentTabPresentationContext state]) {
      goto LABEL_18;
    }
    id v25 = self->_contentTabPresentationContext;
    if (v25)
    {
      uint64_t v26 = [(AVMobileContentTabPresentationContext *)v25 state];
      BOOL v27 = self->_contentTabPresentationContext;
      BOOL v28 = v27;
      if (v26 == 2)
      {
        __int16 v29 = [(AVMobileContentTabPresentationContext *)v27 transitionContext];
        uint64_t v30 = [v29 direction];

        if (v30)
        {
LABEL_21:
          id v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithDampingRatio:initialVelocity:", 1.0, v21, v19 * 0.05);
          [(UIViewPropertyAnimator *)self->_contentTabViewPresentationAnimator setReversed:v23];
          [(UIViewPropertyAnimator *)self->_contentTabViewPresentationAnimator continueAnimationWithTimingParameters:v31 durationFactor:1.0];

          goto LABEL_26;
        }
LABEL_18:
        uint64_t v23 = v23 ^ 1;
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
      BOOL v28 = 0;
    }

    goto LABEL_21;
  }
  if (v4 == 2)
  {
    if (self)
    {
      long long v32 = self->_contentTabViewPresentationAnimator;
      id v33 = v39;
      [(UIViewPropertyAnimator *)v32 pauseAnimation];
      [v33 velocityInView:self->_view];
      [(AVMobileChromelessControlsViewController *)self _transitionContentTabIfNeccesary:v35];
      [v33 translationInView:self->_view];
      double v37 = v36;

      double v38 = v37 / self->_contentTabPanGestureTranslationScaleFactor;
      if (self->_contentTabPresented) {
        double v38 = -v38;
      }
      [(UIViewPropertyAnimator *)v32 setFractionComplete:v38 + self->_contentTabInteractivePresentationInitialFractionComplete];
    }
  }
  else if (v4 == 1 && self)
  {
    uint64_t v5 = self->_contentTabViewPresentationAnimator;
    id v6 = v39;
    [(UIViewPropertyAnimator *)v5 pauseAnimation];
    [v6 velocityInView:self->_view];
    double v8 = v7;
    double v10 = v9;

    [(AVMobileChromelessControlsViewController *)self _transitionContentTabIfNeccesary:v10];
    [(AVMobileChromelessControlsView *)self->_view bounds];
    self->_contentTabPanGestureTranslationScaleFactor = v11 / 3.0;
    [(UIViewPropertyAnimator *)v5 fractionComplete];
    double v13 = v12;

    self->_contentTabInteractivePresentationInitialFractionComplete = v13;
  }
LABEL_26:
}

- (void)_transitionContentTabIfNeccesary:(double)a3
{
  id v6 = (void *)a1[214];
  if ((!v6 || [v6 state] != 2) && fabs(a3) > fabs(a2))
  {
    [(id)objc_opt_class() autoHideInterval];
    objc_msgSend(a1, "flashControlsWithDuration:");
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)a1, a3 < 0.0, 1);
  }
}

- (void)_setContentTabPresented:(int)a3 animated:
{
  v63[12] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1 || *(unsigned __int8 *)(a1 + 1672) == a2) {
    return;
  }
  *(unsigned char *)(a1 + 1672) = a2;
  -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded]((void *)a1);
  -[AVMobileChromelessControlsViewController _setUpTapGestureRecognizerIfNeeded](a1);
  uint64_t v5 = (AVMobileContentTabPresentationContext *)*(id *)(a1 + 1712);
  id v6 = [*(id *)(a1 + 1704) selectedCustomInfoViewController];
  if (a3)
  {
    uint64_t v7 = 2;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = *(unsigned char *)(a1 + 1672) == 0;
    if (!v5) {
LABEL_8:
    }
      uint64_t v5 = objc_alloc_init(AVMobileContentTabPresentationContext);
  }
  [(AVMobileContentTabPresentationContext *)v5 setState:v7];
  [(AVMobileContentTabPresentationContext *)v5 setCustomInfoViewController:v6];
  if (a3)
  {
    double v8 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
    BOOL v9 = *(unsigned char *)(a1 + 1672) == 0;
    double v10 = objc_alloc_init(AVMobileContentTabTransitionContext);
    [(AVMobileContentTabTransitionContext *)v10 setDirection:v9];
    [(AVMobileContentTabTransitionContext *)v10 setAnimationCoordinator:v8];
    [(AVMobileContentTabPresentationContext *)v5 setTransitionContext:v10];
  }
  double v11 = *(void **)(a1 + 1712);
  *(void *)(a1 + 1712) = v5;
  v56 = v5;

  double v12 = *(void **)(a1 + 1712);
  if (v12)
  {
    id v13 = v12;
    if (([v13 state] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      uint64_t v14 = 0;
      double v15 = 0.0;
    }
    else
    {
      v55 = [(id)a1 delegate];
      long long v58 = 0u;
      long long v59 = 0u;
      memset(v60, 0, sizeof(v60));
      id v16 = *(id *)(a1 + 1664);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v62 count:16];
      double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (v17)
      {
        uint64_t v19 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(v16);
            }
            double v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            objc_msgSend(v21, "preferredContentSize", v55, v56, (void)v58);
            [v21 preferredContentSize];
            if (v18 < v22) {
              double v18 = v22;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v17);
      }

      id v23 = *(id *)(a1 + 1184);
      char v24 = [v23 contentTabsView];
      [v23 layoutMargins];
      double v26 = v25;
      [v24 intrinsicContentSize];
      double v28 = v27;
      [*(id *)(a1 + 1184) bounds];
      double v30 = v29;
      double v32 = v31;
      [*(id *)(a1 + 1184) safeAreaInsets];
      double v34 = v33;

      double v35 = v55;
      if (objc_opt_respondsToSelector())
      {
        double v36 = 16.0;
        if (v30 > v32) {
          double v36 = 14.0;
        }
        double v37 = 28.0;
        if (v26 <= 28.0) {
          double v37 = v26;
        }
        if (v34 >= v37) {
          double v37 = v34;
        }
        uint64_t v38 = objc_msgSend(v55, "chromelessControlsViewController:contentTabPresentationInfoWithPreferredHeight:", a1, v18 + v28 + v36 + v37, v55);
        uint64_t v14 = v39;
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v38 = 0;
      }

      double v15 = *(double *)&v38;
    }
    objc_msgSend(v13, "setPresentationHeight:", v15, v55);
    [v13 setContentTabsLayout:v14];
  }
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
  [*(id *)(a1 + 1512) invalidate];
  v40 = *(void **)(a1 + 1512);
  *(void *)(a1 + 1512) = 0;

  id v57 = *(id *)(a1 + 1712);
  uint64_t v41 = [(id)a1 delegate];
  if (*(unsigned char *)(a1 + 1672) && (objc_opt_respondsToSelector() & 1) != 0) {
    [v41 chromelessControlsViewController:a1 willBeginPresentingContentTabWithContext:v57];
  }
  if (!*(unsigned char *)(a1 + 1672) && (objc_opt_respondsToSelector() & 1) != 0) {
    [v41 chromelessControlsViewController:a1 willBeginDismissingContentTabWithContext:v57];
  }
  if (a3)
  {
    BOOL v42 = [*(id *)(a1 + 1736) state] != 1 && objc_msgSend(*(id *)(a1 + 1736), "state") != 2;
    if (*(unsigned char *)(a1 + 1672) && !v42) {
      [*(id *)(a1 + 1704) selectInitialCustomInfoViewController];
    }
    id v44 = *(id *)(a1 + 1696);
    double v45 = 0.0;
    if ([v44 isRunning] && objc_msgSend(v44, "isInterruptible"))
    {
      [v44 fractionComplete];
      double v45 = v46;
      [v44 stopAnimation:1];
      [v44 finishAnimationAtPosition:2];
      v47 = *(void **)(a1 + 1696);
      *(void *)(a1 + 1696) = 0;
    }
    [*(id *)(a1 + 1184) bounds];
    double v49 = (1.0 - v45) * (v48 / 0.15 * 0.15);
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C58]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 250.0, 30.0, 0.0, 0.0);
    v51 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v50 timingParameters:v49];

    objc_initWeak(&location, (id)a1);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke;
    v62[3] = &unk_1E5FC44F8;
    objc_copyWeak(v63, &location);
    [v51 addAnimations:v62];
    *(void *)&long long v58 = MEMORY[0x1E4F143A8];
    *((void *)&v58 + 1) = 3221225472;
    *(void *)&long long v59 = __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke_2;
    *((void *)&v59 + 1) = &unk_1E5FC3998;
    objc_copyWeak((id *)v60, &location);
    [v51 addCompletion:&v58];
    objc_storeStrong((id *)(a1 + 1696), v51);
    v52 = *(void **)(a1 + 1696);
    if (!v52)
    {
      [*(id *)(a1 + 1704) updateSelectedCustomInfoViewController];
      v52 = *(void **)(a1 + 1696);
    }
    [v52 startAnimation];
    objc_destroyWeak((id *)v60);
    objc_destroyWeak(v63);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
    if (!*(void *)(a1 + 1696)) {
      [*(id *)(a1 + 1704) updateSelectedCustomInfoViewController];
    }
    if (!*(unsigned char *)(a1 + 1672))
    {
      v43 = *(void **)(a1 + 1712);
      *(void *)(a1 + 1712) = 0;

      [(id)objc_opt_class() autoHideInterval];
      objc_msgSend((id)a1, "flashControlsWithDuration:");
    }
  }
  v53 = *(void **)(a1 + 1712);
  if (v53) {
    BOOL v54 = [v53 state] == 1;
  }
  else {
    BOOL v54 = 1;
  }
  [*(id *)(a1 + 1184) setIgnoresTouches:v54];
}

- (void)_setUpPanGestureRecognizerIfNeeded
{
  if (a1)
  {
    if (!a1[217])
    {
      uint64_t v2 = (void *)a1[208];
      if (v2)
      {
        if ([v2 count])
        {
          if (a1[148])
          {
            id v3 = [a1 fullscreenController];
            uint64_t v4 = [v3 presentationState];

            if (v4 != 2)
            {
              uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:a1 action:sel__contentTabPanGestureRecognizerTriggered_];
              [v5 setEnabled:1];
              [v5 setDelegate:a1];
              id v6 = (void *)a1[217];
              a1[217] = v5;
            }
          }
        }
      }
    }
  }
}

- (void)_setUpTapGestureRecognizerIfNeeded
{
  if (!*(void *)(a1 + 1720))
  {
    if (*(unsigned char *)(a1 + 1672))
    {
      if (*(void *)(a1 + 1184))
      {
        uint64_t v2 = [(id)a1 fullscreenController];
        uint64_t v3 = [v2 presentationState];

        if (v3 != 2)
        {
          uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:a1 action:sel__contentTabTapGestureRecognizerTriggered_];
          [v4 setDelegate:a1];
          [v4 setEnabled:1];
          [v4 setNumberOfTapsRequired:1];
          [*(id *)(a1 + 1184) addGestureRecognizer:v4];
          uint64_t v5 = *(void **)(a1 + 1720);
          *(void *)(a1 + 1720) = v4;
        }
      }
    }
  }
}

void __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v2 = [WeakRetained[214] transitionContext];
    uint64_t v3 = [v2 animationCoordinator];
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v5);
    uint64_t v4 = [v5 view];
    [v4 layoutIfNeeded];

    -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)v5, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 performCoordinatedAnimations];
    }

    WeakRetained = v5;
  }
}

void __85__AVMobileChromelessControlsViewController__animateContentTabPresentationStateUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_20;
  }
  double v18 = WeakRetained;
  id v4 = WeakRetained[214];
  uint64_t v5 = [v4 transitionContext];
  id v6 = [v5 animationCoordinator];
  uint64_t v7 = [v5 direction];
  if (a2)
  {
    if (v7)
    {
      double v8 = v18;
      *((unsigned char *)v18 + 1672) = 1;
      id v9 = v18[214];
      if (v9)
      {
        [v9 state];
        double v8 = v18;
      }
      objc_msgSend(v8[148], "setIgnoresTouches:");
      goto LABEL_9;
    }
    id v12 = v18[214];
    v18[214] = 0;

    double v11 = v18;
    *((unsigned char *)v18 + 1672) = 0;
LABEL_11:
    [v11[213] invalidateContentTabsSelection];
    id v13 = v18;
    id v14 = v18[214];
    if (v14)
    {
      uint64_t v15 = [v14 state];
      id v13 = v18;
      BOOL v16 = v15 == 1;
    }
    else
    {
      BOOL v16 = 1;
    }
    [v13[148] setIgnoresTouches:v16];
    [(id)objc_opt_class() autoHideInterval];
    objc_msgSend(v18, "flashControlsWithDuration:");
    goto LABEL_15;
  }
  if (v7)
  {
    id v10 = v18[214];
    v18[214] = 0;

    double v11 = v18;
    goto LABEL_11;
  }
LABEL_9:
  [v4 setState:0];
  [v4 setTransitionContext:0];
LABEL_15:
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v18);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v18);
  [v18[148] setNeedsLayout];
  [v18[148] layoutIfNeeded];
  id v17 = v18[212];
  v18[212] = 0;

  if (!v18[212]) {
    [v18[213] updateSelectedCustomInfoViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 didFinishAnimations:a2 == 0];
  }

  WeakRetained = v18;
LABEL_20:
}

- (void)_updateControlsVisibilityStateAnimated:(uint64_t)a1
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  -[AVMobileChromelessControlsViewController _cancelOutstandVisibilityUpdates](a1);
  *(unsigned char *)(a1 + 1504) = 0;
  v75 = *(void **)(a1 + 1488);
  uint64_t v76 = *(void *)(a1 + 1496);
  if ([(id)a1 visibilityPolicy] != 1)
  {
    v74 = [*(id *)(a1 + 1184) volumeControlsView];
    unint64_t v5 = [(id)a1 excludedControls];
    unint64_t v6 = [(id)a1 includedControls];
    char v7 = [v74 isTracking];
    int v8 = -[AVMobileChromelessControlsViewController _isScrubbing]((void *)a1);
    id v9 = [(id)a1 fullscreenController];
    uint64_t v10 = [v9 presentationState];

    int v11 = *(unsigned __int8 *)(a1 + 1672);
    id v12 = [(id)a1 playerController];
    if ([v12 hasLiveStreamingContent]) {
      uint64_t v13 = [v12 canSeek];
    }
    else {
      uint64_t v13 = 1;
    }
    uint64_t v72 = v13;
    uint64_t v70 = -[AVMobileChromelessControlsViewController _preferredAuxiliaryControlsPlacement]((void *)a1);
    if (v11) {
      BOOL v14 = [*(id *)(a1 + 1712) contentTabsLayout] != 0;
    }
    else {
      BOOL v14 = 1;
    }
    BOOL v15 = v10 != 2;
    if (v10 == 2) {
      char v16 = 1;
    }
    else {
      char v16 = v7;
    }
    if ((v16 & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 1368)) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = *(unsigned char *)(a1 + 1672) != 0;
      }
    }
    BOOL v71 = v14;
    if (v8 && [v12 hasSeekableLiveStreamingContent]) {
      int v69 = [v12 isAtLiveEdge] ^ 1;
    }
    else {
      int v69 = 0;
    }
    uint64_t v17 = [(id)a1 visibilityPolicy];
    if (v17)
    {
      double v18 = (void *)v17;
      if (v17 != 2)
      {
        if (v17 == 1)
        {
          BOOL v19 = 0;
LABEL_31:
          int v21 = 1;
          if ((v15 || v19) && (v5 & 0x200) == 0) {
            int v21 = [v12 hasEnabledAudio] ^ 1;
          }
          if (v19)
          {
            BOOL v22 = (v5 & 8) == 0;
            BOOL v23 = 1;
          }
          else
          {
            BOOL v23 = *(unsigned char *)(a1 + 1672) != 0;
            if ((v5 & 8) != 0) {
              BOOL v22 = 0;
            }
            else {
              BOOL v22 = v8;
            }
            if (!*(unsigned char *)(a1 + 1672))
            {
              LODWORD(v24) = 1;
              goto LABEL_41;
            }
          }
          uint64_t v24 = (v5 >> 5) & 1;
LABEL_41:
          int v25 = !v19;
          char v26 = (~(_WORD)v5 & 0x1C00) == 0 || !v19;
          if ((v6 & 0x10) == 0) {
            int v25 = 1;
          }
          if ((v6 & 0x20) == 0) {
            char v26 = 1;
          }
          char v27 = v26 | v8;
          if (v10 == 2) {
            char v27 = 1;
          }
          if (v11) {
            char v27 = 1;
          }
          if (v70) {
            int v28 = 0;
          }
          else {
            int v28 = v8;
          }
          int v29 = !v22;
          int v30 = v25 | v28;
          if (v11) {
            int v30 = 1;
          }
          if ((v6 & 1) == 0) {
            int v29 = 1;
          }
          if (v11) {
            int v29 = 1;
          }
          BOOL v36 = v29 == 0;
          uint64_t v31 = v72;
          if (!v36) {
            uint64_t v31 = 0;
          }
          if ((v6 & 2) == 0) {
            int v21 = 1;
          }
          if (v21 | v8) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = v31 | 2;
          }
          uint64_t v33 = v32 | 4;
          if (v8) {
            uint64_t v33 = v31;
          }
          if (v23 && (v6 & 4) != 0) {
            uint64_t v32 = v33;
          }
          if (!v8) {
            uint64_t v31 = v32 | 8;
          }
          if ((v19 && v71) & (v6 >> 3)) {
            uint64_t v32 = v31;
          }
          if (!v30) {
            v32 |= 0x10uLL;
          }
          uint64_t v34 = v32 | 0x20;
          if (v27) {
            uint64_t v34 = v32;
          }
          if (v10 != 2) {
            uint64_t v32 = v34 | 0x40;
          }
          if ((v6 & 0x40) == 0) {
            LODWORD(v24) = 1;
          }
          if (v24 | v8) {
            id v4 = (void *)v34;
          }
          else {
            id v4 = (void *)v32;
          }
          int v35 = (v11 == 0) << 8;
          if (!v69) {
            int v35 = 0;
          }
          unint64_t v3 = (v4 << 8) & v35 | (unint64_t)(v19 & (v8 ^ 1u));

          goto LABEL_90;
        }
        uint64_t v20 = _AVLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = v18;
          _os_log_error_impl(&dword_1B05B7000, v20, OS_LOG_TYPE_ERROR, "Error: Unrecognized AVControlsVisibilityPolicy %ld", (uint8_t *)location, 0xCu);
        }
      }
      if (!*(unsigned char *)(a1 + 1529))
      {
        BOOL v19 = *(void *)(a1 + 1536) > 0;
        goto LABEL_31;
      }
    }
    BOOL v19 = 1;
    goto LABEL_31;
  }
  unint64_t v3 = 0;
  id v4 = 0;
LABEL_90:
  if (*(void *)(a1 + 1184))
  {
    BOOL v36 = v75 == v4 && ((v3 ^ v76) & 1) == 0;
    if (!v36)
    {
      if ((v3 & 0x100) != 0)
      {
        double v37 = [(id)a1 playerController];
        int v38 = [v37 hasSeekableLiveStreamingContent];

        uint64_t v39 = [*(id *)(a1 + 1184) liveEdgeContentTagView];
        if (v39) {
          int v38 = 0;
        }

        if (v38 == 1)
        {
          v40 = [AVMobileContentTagView alloc];
          uint64_t v41 = +[AVMobileContentTag liveEdgeContentTag];
          BOOL v42 = [(AVMobileContentTagView *)v40 initWithContentTag:v41 withStyleSheet:*(void *)(a1 + 1176)];

          v43 = -[AVMobileChromelessControlsViewController _timelineSlider](a1);
          [v43 frameForSliderMark:*(void *)(a1 + 1624)];
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          double v51 = v50;

          -[AVMobileContentTagView setFrame:](v42, "setFrame:", -[AVMobileChromelessControlsViewController _frameForLiveEdgeMarkContentTag:](a1, v45, v47, v49, v51));
          [*(id *)(a1 + 1184) setLiveEdgeContentTagView:v42];
        }
      }
      v52 = objc_alloc_init(AVPlayerViewControllerAnimationCoordinator);
      v53 = [*(id *)(a1 + 1184) timelineView];
      BOOL v54 = [(id)a1 delegate];
      if (v54)
      {
        v55 = [(id)a1 delegate];
        char v56 = objc_opt_respondsToSelector();

        if (v56)
        {
          id v57 = [(id)a1 delegate];
          [v57 controlsViewController:a1 willBeginUpdatingVisibleControlsTo:v4 withAnimationCoordinator:v52];
        }
      }
      if ((v4 != 0) == ([(id)a1 visibleControls] == 0))
      {
        -[AVMobileChromelessControlsViewController _updateTimeResolver](a1);
        if (v4) {
          [v53 layoutIfNeeded];
        }
        -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:](a1, 0);
      }
      if ((([(id)a1 visibleControls] ^ v4) & 2) != 0) {
        -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden]((void *)a1);
      }
      [*(id *)(a1 + 1184) setHidden:0];

      if (a2)
      {
        long long v58 = *(void **)(a1 + 1520);
        double v59 = 1.0;
        if (v58
          && [v58 isRunning]
          && [*(id *)(a1 + 1520) isInterruptible])
        {
          [*(id *)(a1 + 1520) fractionComplete];
          double v59 = v60;
          [*(id *)(a1 + 1520) stopAnimation:1];
          [*(id *)(a1 + 1520) finishAnimationAtPosition:2];
          v61 = *(void **)(a1 + 1520);
          *(void *)(a1 + 1520) = 0;
        }
        objc_initWeak(location, (id)a1);
        id v62 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        if (v59 <= 1.0) {
          double v63 = v59 * 0.15;
        }
        else {
          double v63 = 0.15;
        }
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke;
        v80[3] = &unk_1E5FC39C0;
        objc_copyWeak(v82, location);
        v82[1] = v4;
        v82[2] = (id)v3;
        v64 = v52;
        v81 = v64;
        uint64_t v65 = [v62 initWithDuration:3 curve:v80 animations:v63];
        v66 = *(void **)(a1 + 1520);
        *(void *)(a1 + 1520) = v65;

        v67 = *(void **)(a1 + 1520);
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke_2;
        v77[3] = &unk_1E5FC39E8;
        v68 = v64;
        v78 = v68;
        objc_copyWeak(v79, location);
        v79[1] = v4;
        v79[2] = (id)v3;
        [v67 addCompletion:v77];
        *(unsigned char *)(a1 + 1528) = v4 == 0;
        [*(id *)(a1 + 1520) startAnimation];
        *(void *)(a1 + 1488) = v4;
        *(void *)(a1 + 1496) = v3;
        -[AVMobileChromelessControlsViewController _didBeginUpdatingControlsVisibilityStateFromState:toState:withAnimationCoordinator:]((id *)a1, (char)v75, v76, (uint64_t)v4, v3, v68);
        objc_destroyWeak(v79);

        objc_destroyWeak(v82);
        objc_destroyWeak(location);
      }
      else
      {
        *(unsigned char *)(a1 + 1528) = v4 == 0;
        [(AVMobileChromelessControlsViewController *)a1 _updateViewVisibilityStatesTo:v3];
        -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration](a1);
        [(AVPlayerViewControllerAnimationCoordinator *)v52 performCoordinatedAnimations];
        *(void *)(a1 + 1488) = v4;
        *(void *)(a1 + 1496) = v3;
        -[AVMobileChromelessControlsViewController _didBeginUpdatingControlsVisibilityStateFromState:toState:withAnimationCoordinator:]((id *)a1, (char)v75, v76, (uint64_t)v4, v3, v52);
        [(AVPlayerViewControllerAnimationCoordinator *)v52 didFinishAnimations:1];
        [(AVMobileChromelessControlsViewController *)(id *)a1 _didEndUpdatingControlsVisibilityStateTo:v3 completed:1];
      }
    }
  }
}

- (void)_cancelOutstandVisibilityUpdates
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v2 cancelPerformSelector:sel__updateControlsVisibilityStateIfNeededAnimated_ target:a1 argument:0];
  }
}

uint64_t __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [(AVMobileChromelessControlsViewController *)(uint64_t)WeakRetained _updateViewVisibilityStatesTo:*(void *)(a1 + 56)];

  id v4 = objc_loadWeakRetained(v2);
  -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)v4);

  id v5 = objc_loadWeakRetained(v2);
  unint64_t v6 = [v5 view];
  [v6 layoutIfNeeded];

  char v7 = *(void **)(a1 + 32);

  return [v7 performCoordinatedAnimations];
}

uint64_t __83__AVMobileChromelessControlsViewController__updateControlsVisibilityStateAnimated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a2 == 0;
  [*(id *)(a1 + 32) didFinishAnimations:v3];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [(AVMobileChromelessControlsViewController *)WeakRetained _didEndUpdatingControlsVisibilityStateTo:*(void *)(a1 + 56) completed:v3];

  id v5 = *(void **)(a1 + 32);

  return [v5 didFinishAnimations:v3];
}

- (void)_didBeginUpdatingControlsVisibilityStateFromState:(uint64_t)a3 toState:(uint64_t)a4 withAnimationCoordinator:(uint64_t)a5
{
  id v16 = a6;
  id v9 = [a1 delegate];
  if (v9)
  {
    uint64_t v10 = [a1 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [a1 delegate];
      [v12 controlsViewController:a1 didBeginUpdatingVisibleControlsTo:a4 withAnimationCoordinator:v16];
    }
  }
  -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded](a1);
  if ((a2 & 0x10) != 0 && (a4 & 0x10) == 0)
  {
    uint64_t v13 = [a1[148] auxiliaryControlsView];
    [v13 interruptActiveInteractions];
  }
  if ((a2 & 4) != 0 && (a4 & 4) == 0)
  {
    BOOL v14 = [a1[148] displayModeControlsView];
    [v14 interruptActiveInteractions];
  }
  if ((a2 & 2) != 0 && (a4 & 2) == 0)
  {
    BOOL v15 = [a1[148] volumeControlsView];
    [v15 interruptActiveInteractions];
  }
}

- (void)_updateViewVisibilityStatesTo:(__int16)a3
{
  if (a1)
  {
    id v25 = [*(id *)(a1 + 1184) auxiliaryControlsView];
    BOOL v22 = [*(id *)(a1 + 1184) contentTabsView];
    uint64_t v24 = [*(id *)(a1 + 1184) backgroundView];
    unint64_t v6 = [*(id *)(a1 + 1184) displayModeControlsView];
    BOOL v23 = [*(id *)(a1 + 1184) liveEdgeContentTagView];
    char v7 = [*(id *)(a1 + 1184) playbackControlsView];
    int v8 = [*(id *)(a1 + 1184) timelineView];
    id v9 = [*(id *)(a1 + 1184) titlebarView];
    uint64_t v10 = [*(id *)(a1 + 1184) volumeControlsView];
    BOOL v11 = (a3 & 1) == 0;
    if (a2) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
    if ((a2 & 0x40) != 0) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    uint64_t v14 = v11 & ((a2 & 2) >> 1);
    uint64_t v15 = a2 & v11;
    if ((a2 & 2) != 0) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.0;
    }
    if ((a2 & 4) != 0) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.0;
    }
    if ((a2 & 8) != 0) {
      double v18 = 1.0;
    }
    else {
      double v18 = 0.0;
    }
    if ((a2 & 0x10) != 0) {
      double v19 = 1.0;
    }
    else {
      double v19 = 0.0;
    }
    if ((a2 & 0x20) != 0) {
      double v20 = 1.0;
    }
    else {
      double v20 = 0.0;
    }
    if ((a3 & 0x100) != 0) {
      double v21 = 1.0;
    }
    else {
      double v21 = 0.0;
    }
    [v8 setAlpha:v12];
    [v22 setAlpha:v13];
    [v10 setAlpha:v16];
    [v6 setAlpha:v17];
    [v7 setAlpha:v18];
    [v25 setAlpha:v19];
    [v9 setAlpha:v20];
    [v23 setAlpha:v21];
    [v24 setActive:a3 & 1];
    [v8 setDrawsShadow:v15];
    [v10 setDrawsShadow:v14];
  }
}

- (id)_didEndUpdatingControlsVisibilityStateTo:(uint64_t)a3 completed:(int)a4
{
  if (!result || !a4) {
    return result;
  }
  char v4 = a2;
  id v5 = result;
  if (!a2) {
    [result[148] setHidden:1];
  }
  -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)v5);
  -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](v5);
  result = (id *)v5[214];
  if (!result)
  {
    if ((v4 & 0x40) != 0) {
      return result;
    }
    goto LABEL_12;
  }
  result = (id *)[result state];
  if (result != (id *)2 && (v4 & 0x40) == 0)
  {
LABEL_12:
    id v7 = v5[213];
    return (id *)[v7 invalidateContentTabsSelection];
  }
  return result;
}

- (void)_updateTimeResolver
{
  if (a1 && *(void *)(a1 + 1416))
  {
    id v2 = *(void **)(a1 + 1184);
    if (v2 && *(unsigned char *)(a1 + 1168) && ([v2 isHidden] & 1) == 0)
    {
      id v5 = -[AVMobileChromelessControlsViewController _timelineSlider](a1);
      unint64_t v6 = [(id)a1 traitCollection];
      [v6 displayScale];
      double v8 = v7;

      [v5 bounds];
      double v10 = fmax(v8 * v9, 1.0);
      BOOL v11 = [(id)a1 playerController];
      double v12 = [v11 interstitialController];

      double v13 = [v12 currentInterstitialTimeRange];

      if (v13) {
        [v12 interstitialTimingController];
      }
      else {
      id v14 = [(id)a1 playerController];
      }
      [*(id *)(a1 + 1416) setResolution:v10];
    }
    else
    {
      id v14 = 0;
    }
    id v3 = [*(id *)(a1 + 1416) playerController];

    char v4 = v14;
    if (v3 != v14)
    {
      [*(id *)(a1 + 1416) setPlayerController:v14];
      -[AVMobileChromelessControlsViewController _updateTimelineValues](a1);
      char v4 = v14;
    }
  }
}

- (void)_updateTransportControlsLayoutGuidesConstraintsIfNeeded
{
  if (a1)
  {
    id v2 = a1[148];
    if (v2)
    {
      if (a1[197] && a1[198] && a1[199])
      {
        id v22 = [v2 auxiliaryControlsView];
        id v3 = [a1[148] timelineView];
        char v4 = [a1[148] titlebarView];
        [v4 frame];
        double v6 = v5;
        [v3 frame];
        double v8 = v7;
        [v22 frame];
        double v10 = v9;
        [a1[148] frame];
        double Height = CGRectGetHeight(v24);
        char v12 = [v4 isHidden];
        id v13 = 0;
        if (v4 && (v12 & 1) == 0)
        {
          [v4 alpha];
          if (v14 != 1.0 || Height <= v6)
          {
            id v13 = 0;
          }
          else
          {
            id v13 = a1[197];
            double Height = v6;
          }
        }
        if (([v3 isHidden] & 1) != 0
          || !v3
          || (([v3 alpha], v16 == 1.0) ? (BOOL v17 = Height <= v8) : (BOOL v17 = 1), v17))
        {
          double v8 = Height;
        }
        else
        {
          id v18 = a1[198];

          id v13 = v18;
        }
        if (([v22 isHidden] & 1) == 0)
        {
          if (v22)
          {
            [v22 alpha];
            if (v19 == 1.0 && v8 > v10)
            {
              id v20 = a1[199];

              id v13 = v20;
            }
          }
        }
        if (!v13) {
          id v13 = a1[200];
        }
        id v21 = a1[196];
        if (v21 != v13)
        {
          [v21 setActive:0];
          objc_storeStrong(a1 + 196, v13);
          [a1[196] setActive:1];
        }
      }
    }
  }
}

- (BOOL)_isLandscape
{
  uint64_t v1 = [*(id *)(a1 + 1184) window];
  id v2 = [v1 windowScene];
  uint64_t v3 = [v2 interfaceOrientation];

  return (unint64_t)(v3 - 3) < 2;
}

void __87__AVMobileChromelessControlsViewController__updatePrefersVolumeSliderIncludedAnimated___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = -[AVMobileChromelessControlsViewController _volumeControlsView](WeakRetained);
  [v4 setPrefersVolumeSliderIncluded:*(unsigned __int8 *)(a1 + 40)];

  id v6 = objc_loadWeakRetained(v2);
  double v5 = [v6 view];
  [v5 layoutIfNeeded];
}

- (id)_volumeControlsView
{
  if (a1)
  {
    a1 = [a1[148] volumeControlsView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)_frameForLiveEdgeMarkContentTag:(double)a3
{
  double v10 = [*(id *)(a1 + 1184) liveEdgeContentTagView];
  BOOL v11 = -[AVMobileChromelessControlsViewController _timelineSlider](a1);
  objc_msgSend(v11, "convertRect:toView:", *(void *)(a1 + 1184), a2, a3, a4, a5);
  double v13 = v12;
  double v15 = v14;

  [v10 intrinsicContentSize];
  double v17 = v16;

  return v13 + v15 * 0.5 - v17 * 0.5;
}

- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3
{
  if (self->_needsControlsVisibilityStateUpdate)
  {
    int v4 = [a3 BOOLValue];
    -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)self, v4);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int v4 = (UIPanGestureRecognizer *)a3;
  double v5 = v4;
  if ((UIPanGestureRecognizer *)self->_contentTabTapGestureRecognizer == v4)
  {
    double v7 = [(UIPanGestureRecognizer *)v4 view];
    double v8 = [(AVMobileChromelessControlsView *)self->_view contentTabsView];
    [(UIPanGestureRecognizer *)v5 locationInView:v8];
    double v9 = objc_msgSend(v7, "hitTest:withEvent:", 0);

    BOOL v6 = v9 == 0;
  }
  else
  {
    BOOL v6 = 1;
    if (self->_contentTabPanGestureRecognizer == v4)
    {
      if (([(UIPanGestureRecognizer *)v4 velocityInView:self->_view], !self->_contentTabPresented)
        && v10 > 0.0
        || self->_contentTabViewPresentationAnimator)
      {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (void)_decrementUserInteractionCount
{
  if (a1)
  {
    uint64_t v2 = a1[192];
    if (v2 > 0) {
      goto LABEL_6;
    }
    uint64_t v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Error: calls to decrementUserInteractionCount must be matched with calls to incrementUserInteractionCount", v5, 2u);
    }

    uint64_t v2 = a1[192];
    if (v2 >= 1)
    {
LABEL_6:
      uint64_t v4 = v2 - 1;
      a1[192] = v4;
      if (!v4)
      {
        [(id)objc_opt_class() autoHideInterval];
        objc_msgSend(a1, "flashControlsWithDuration:");
      }
    }
  }
}

- (void)_incrementUserInteractionCount
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 1536);
    if (!v2)
    {
      -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
      uint64_t v2 = *(void *)(a1 + 1536);
    }
    *(void *)(a1 + 1536) = v2 + 1;
  }
}

- (void)webkitPlayerController:(id)a3 didChangeScrubbingStateTo:(BOOL)a4
{
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);

  -[AVMobileChromelessControlsViewController _updateTimelineEmphasisStateIfNeeded]((id *)&self->super.super.super.super.super.isa);
}

- (id)_auxiliaryControlsView
{
  if (a1)
  {
    a1 = [a1[148] auxiliaryControlsView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_identifierForMenuElement:(void *)a1
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v2 = [v1 identifier];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)contentTabsViewController:(id)a3 didChangeSelectedCustomInfoViewController:(id)a4 withReason:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (self)
  {
    double v8 = [(AVMobileChromelessContentTabsViewController *)self->_contentTabsViewController selectedCustomInfoViewController];
    BOOL v9 = v8 != 0;

    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)self, v9, 1);
    if (!a5)
    {
      [(id)objc_opt_class() autoHideInterval];
      -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
    }
  }
  if (v7)
  {
    double v10 = objc_msgSend(v7, "avkit_infoPanelKindIdentifier");
    BOOL v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v13 = @"Kind";
    v14[0] = v10;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v11 postNotificationName:@"AVPlayerViewControllerDidShowInfoViewControllerNotification" object:v7 userInfo:v12];
  }
}

- (void)slider:(id)a3 didUpdateFrame:(CGRect)a4 forSliderMark:(id)a5
{
  if (self->_liveEdgeSliderMark == a5)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v10 = [(AVMobileChromelessControlsView *)self->_view liveEdgeContentTagView];
    if (v10) {
      objc_msgSend(v10, "setFrame:", -[AVMobileChromelessControlsViewController _frameForLiveEdgeMarkContentTag:]((uint64_t)self, x, y, width, height));
    }
  }
}

- (void)sliderDidEndTracking:(id)a3
{
  [(AVMobileChromelessControlsViewController *)self _timelineSliderTrackingStateDidChange];
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _decrementUserInteractionCount](self);

  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (void)_updatePlayPauseButtonIcon
{
  if (a1)
  {
    id v7 = [a1[148] playbackControlsView];
    uint64_t v2 = [a1 playerController];
    if ([v2 timeControlStatus])
    {
      BOOL v3 = 0;
    }
    else
    {
      [v2 rate];
      BOOL v3 = v4 == 0.0;
    }
    if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
    {
      [v2 suspendedRate];
      int v6 = [v2 isPlaybackSuspended] ^ 1 | (v5 == 0.0);
    }
    else
    {
      int v6 = 1;
    }
    [v7 setPlayPauseButtonShowsPlayIcon:v3 & v6];
  }
}

- (void)sliderWillEndTracking:(id)a3
{
  [(AVMobileChromelessControlsViewController *)self _timelineSliderTrackingStateDidChange];
  id v4 = [(AVMobileControlsViewController *)self playerController];
  [v4 endScrubbing:self];
  [v4 endPlaybackSuspension];
}

- (void)sliderDidBeginTracking:(id)a3
{
  id v4 = [(AVMobileControlsViewController *)self playerController];
  [v4 beginPlaybackSuspension];
  [v4 beginScrubbing:self];
  [(AVMobileChromelessControlsViewController *)self _timelineSliderTrackingStateDidChange];
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _incrementUserInteractionCount]((uint64_t)self);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  self->_sliderEdgeInsets = a4;
}

- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3
{
  id v6 = a3;
  if ([v6 forwardSecondaryControlIcon])
  {
    if ([v6 forwardSecondaryControlIcon] == 1)
    {
      id v4 = [(AVMobileControlsViewController *)self eventManager];
      [v4 sendActionsForEvent:@"AVChromelessControlsSkipForwardPressedEvent"];
    }
    else
    {
      if ([v6 forwardSecondaryControlIcon] != 2) {
        goto LABEL_9;
      }
      id v4 = [(AVMobileControlsViewController *)self playerController];
      [v4 seekToEnd:self];
    }
  }
  else
  {
    double v5 = [(AVMobileControlsViewController *)self playerController];
    [v5 seekByTimeInterval:10.0];

    id v4 = [(AVMobileControlsViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 chromelessControlsViewControllerDidPressSkipForwardButton:self];
    }
  }

LABEL_9:
  if (self)
  {
    [(id)objc_opt_class() autoHideInterval];
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3
{
  id v6 = a3;
  if ([v6 backwardSecondaryControlIcon])
  {
    if ([v6 backwardSecondaryControlIcon] != 1) {
      goto LABEL_7;
    }
    id v4 = [(AVMobileControlsViewController *)self eventManager];
    [v4 sendActionsForEvent:@"AVChromelessControlsSkipBackwardPressedEvent"];
  }
  else
  {
    double v5 = [(AVMobileControlsViewController *)self playerController];
    [v5 seekByTimeInterval:-10.0];

    id v4 = [(AVMobileControlsViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 chromelessControlsViewControllerDidPressSkipBackButton:self];
    }
  }

LABEL_7:
  if (self)
  {
    [(id)objc_opt_class() autoHideInterval];
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3
{
  id v4 = [(AVMobileControlsViewController *)self eventManager];
  [v4 sendActionsForEvent:@"AVChromelessControlsPlayPauseButtonPressedEvent"];

  double v5 = [(AVMobileControlsViewController *)self playerController];
  [v5 togglePlayback:self];

  if (self)
  {
    [(id)objc_opt_class() autoHideInterval];
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)displayModeControlsView:(id)a3 layoutWithHiddenIdentifiers:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v12 = [(AVMobileAuxiliaryControl *)self->_routePickerControl identifier];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          [(NSArray *)v6 addObject:self->_routePickerControl];
        }
        else
        {
          double v14 = -[AVMobileChromelessControlsViewController _auxiliaryControlForIdentifier:]((uint64_t)self, v11);
          if (v14) {
            [(NSArray *)v6 addObject:v14];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  overflowDisplayModeControls = self->_overflowDisplayModeControls;
  self->_overflowDisplayModeControls = v6;

  -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateControlItemsInclusionState]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
}

- (id)_auxiliaryControlForIdentifier:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 1608);
    id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "identifier", (void)v11);
          id v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v3)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_updateRoutePickerControlInclusionState
{
  if (result)
  {
    id v1 = result;
    uint64_t shouldIncludeRoutePicker = -[AVMobileChromelessControlsViewController _shouldIncludeRoutePickerButton](result);
    int v3 = [v1[150] containsObject:v1[154]];
    id v4 = [v1[148] displayModeControlsView];
    [v4 setIncludesRoutePickerControl:shouldIncludeRoutePicker];

    id v5 = v1[154];
    return (id *)[v5 setIncluded:shouldIncludeRoutePicker & v3];
  }
  return result;
}

- (void)_updateControlItemsInclusionState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v2 = objc_msgSend(a1, "controlItems", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = -[AVMobileChromelessControlsViewController _auxiliaryControlForControlItem:]((uint64_t)a1, v7);
          uint64_t v9 = [v7 type];
          if ((unint64_t)(v9 - 1) >= 2)
          {
            if (v9) {
              uint64_t v10 = 0;
            }
            else {
              uint64_t v10 = [a1[150] containsObject:v8];
            }
          }
          else
          {
            uint64_t v10 = 1;
          }
          [v8 setIncluded:v10];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
}

- (id)_auxiliaryControlForControlItem:(uint64_t)a1
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = -[AVMobileChromelessControlsViewController _auxiliaryControlForIdentifier:](a1, v3);

  return v4;
}

- (void)displayModeControlsViewPictureInPictureButtonWasPressed:(id)a3
{
  uint64_t v4 = [(AVMobileControlsViewController *)self pipController];
  int v5 = [v4 isPictureInPicturePossible];

  if (v5)
  {
    uint64_t v6 = [(AVMobileControlsViewController *)self pipController];
    char v7 = [v6 isPictureInPictureActive];

    uint64_t v8 = [(AVMobileControlsViewController *)self pipController];
    uint64_t v9 = v8;
    if (v7) {
      [v8 stopPictureInPicture];
    }
    else {
      [v8 startPictureInPicture];
    }

    -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](self);
  }
}

- (void)displayModeControlsViewFullscreenButtonWasPressed:(id)a3
{
  id v5 = a3;
  if ([v5 fullscreenIcon] == 1)
  {
    uint64_t v4 = [(AVMobileControlsViewController *)self fullscreenController];
    [v4 enterFullscreen:self];
  }
  else
  {
    if ([v5 fullscreenIcon]) {
      goto LABEL_6;
    }
    uint64_t v4 = [(AVMobileControlsViewController *)self eventManager];
    [v4 sendActionsForEvent:@"AVChromelessControlsDoneButtonPressedEvent"];
  }

LABEL_6:
  -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon]((id *)&self->super.super.super.super.super.isa);
}

- (void)volumeControlsViewButtonWasTapped:(id)a3
{
  uint64_t v4 = [(AVMobileControlsViewController *)self eventManager];
  [v4 sendActionsForEvent:@"AVChromelessControlsVolumeButtonPressedEvent"];

  if (self)
  {
    if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)self))
    {
      -[AVMobileChromelessControlsViewController _handleMuteStateToggle](self);
    }
    else
    {
      if (self->_volumeSliderTemporarilyVisibileInFullscreen) {
        -[AVMobileChromelessControlsViewController _handleMuteStateToggle](self);
      }
      -[AVMobileChromelessControlsViewController _temporarilyShowVolumeSlider]((uint64_t)self);
    }
  }
}

- (void)_handleMuteStateToggle
{
  id v8 = [a1 volumeController];
  [v8 volume];
  float v3 = v2;
  uint64_t v4 = [a1 playerController];
  int v5 = [v4 isMuted];

  if (v3 != 0.0
    || ([v8 beginChangingVolume],
        LODWORD(v6) = 1036831949,
        [v8 setTargetVolume:v6],
        [v8 endChangingVolume],
        v5))
  {
    char v7 = [a1 playerController];
    [v7 toggleMuted:a1];

    -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState]((id *)a1);
  }
}

- (void)_temporarilyShowVolumeSlider
{
  -[AVMobileChromelessControlsViewController _resetVolumeSliderTemporarilyVisibleTimer](a1);
  if (!*(unsigned char *)(a1 + 1368))
  {
    *(unsigned char *)(a1 + 1368) = 1;
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:](a1, 1);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
  }
  objc_initWeak(&location, (id)a1);
  float v2 = (void *)MEMORY[0x1E4F1CB00];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVMobileChromelessControlsViewController__temporarilyShowVolumeSlider__block_invoke;
  v5[3] = &unk_1E5FC4480;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = [v2 scheduledTimerWithTimeInterval:0 repeats:v5 block:2.0];
  uint64_t v4 = *(void **)(a1 + 1400);
  *(void *)(a1 + 1400) = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_resetVolumeSliderTemporarilyVisibleTimer
{
  float v2 = *(void **)(a1 + 1400);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v3 = *(void **)(a1 + 1400);
    *(void *)(a1 + 1400) = 0;
  }
}

void __72__AVMobileChromelessControlsViewController__temporarilyShowVolumeSlider__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1368] = 0;
    float v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)WeakRetained, 1);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);
    id WeakRetained = v2;
  }
}

- (void)_updateVolumeControlsViewMutedState
{
  if (a1)
  {
    id v4 = [a1[148] volumeControlsView];
    float v2 = [a1 playerController];
    uint64_t v3 = [v2 isMuted];

    [v4 setMute:v3];
  }
}

- (void)volumeControlsViewInteractionDidEnd:(id)a3
{
  -[AVMobileChromelessControlsViewController _decrementUserInteractionCount](self);
  if (self)
  {
    [(NSTimer *)self->_volumeEmphasisAnimationDelayTimer invalidate];
    volumeEmphasisAnimationDelayTimer = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = 0;

    objc_initWeak(&location, self);
    int v5 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    long long v11 = __80__AVMobileChromelessControlsViewController__volumeControlsViewInteractionDidEnd__block_invoke;
    long long v12 = &unk_1E5FC4480;
    objc_copyWeak(&v13, &location);
    id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:&v9 block:3.0];
    char v7 = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  id v8 = [(AVMobileControlsViewController *)self volumeController];
  [v8 endChangingVolume];

  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 1);

  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

void __80__AVMobileChromelessControlsViewController__volumeControlsViewInteractionDidEnd__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](WeakRetained, 0);

  id v3 = objc_loadWeakRetained(v1);
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)v3);
}

- (void)_animateVolumeEmphasisTo:(id *)a1
{
  if (a1)
  {
    id v4 = [a1[148] volumeControlsView];
    if ([v4 isEmphasized] != a2)
    {
      double v5 = 0.0;
      if ([a1[172] isRunning])
      {
        if ([a1[172] isInterruptible])
        {
          [a1[172] fractionComplete];
          double v5 = v6;
          [a1[172] stopAnimation:1];
          [a1[172] finishAnimationAtPosition:2];
          id v7 = a1[172];
          a1[172] = 0;
        }
      }
      objc_initWeak(&location, a1);
      id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __69__AVMobileChromelessControlsViewController__animateVolumeEmphasisTo___block_invoke;
      v11[3] = &unk_1E5FC46C0;
      objc_copyWeak(&v12, &location);
      char v13 = a2;
      uint64_t v9 = [v8 initWithDuration:3 curve:v11 animations:(1.0 - v5) * 0.2];
      id v10 = a1[172];
      a1[172] = (id)v9;

      [a1[172] startAnimation];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_resetVolumeControlsEmphasisDelayTimer
{
  if (a1)
  {
    [*(id *)(a1 + 1392) invalidate];
    float v2 = *(void **)(a1 + 1392);
    *(void *)(a1 + 1392) = 0;
  }
}

void __69__AVMobileChromelessControlsViewController__animateVolumeEmphasisTo___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  float v2 = -[AVMobileChromelessControlsViewController _volumeControlsView](WeakRetained);
  [v2 setEmphasized:*(unsigned __int8 *)(a1 + 40)];
}

- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4 withUpdateSource:(unint64_t)a5
{
  id v13 = a3;
  id v8 = [(AVMobileControlsViewController *)self playerController];
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)self);
  if (a5 != 2)
  {
    uint64_t v9 = [(AVMobileControlsViewController *)self volumeController];
    [v9 beginChangingVolume];

    id v10 = [(AVMobileControlsViewController *)self volumeController];
    *(float *)&double v11 = a4;
    [v10 setTargetVolume:v11];

    id v12 = [(AVMobileControlsViewController *)self volumeController];
    [v12 endChangingVolume];
  }
  if ([v8 isMuted])
  {
    [v8 setMuted:0];
    [v13 setMute:0];
  }
}

- (void)volumeControlsView:(id)a3 volumeDidChangeTo:(double)a4
{
  id v11 = a3;
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)self);
  double v6 = [(AVMobileControlsViewController *)self volumeController];
  *(float *)&double v7 = a4;
  [v6 setTargetVolume:v7];

  id v8 = [(AVMobileControlsViewController *)self playerController];
  int v9 = [v8 isMuted];

  if (v9)
  {
    id v10 = [(AVMobileControlsViewController *)self playerController];
    [v10 setMuted:0];

    [v11 setMute:0];
  }
}

- (void)volumeControlsViewInteractionDidBegin:(id)a3
{
  -[AVMobileChromelessControlsViewController _incrementUserInteractionCount]((uint64_t)self);
  if (self)
  {
    [(NSTimer *)self->_volumeEmphasisAnimationDelayTimer invalidate];
    volumeEmphasisAnimationDelayTimer = self->_volumeEmphasisAnimationDelayTimer;
    self->_volumeEmphasisAnimationDelayTimer = 0;

    -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:]((id *)&self->super.super.super.super.super.isa, 1);
  }
  double v5 = [(AVMobileControlsViewController *)self volumeController];
  [v5 beginChangingVolume];

  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)self, 1);

  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
}

- (id)auxiliaryControlsView:(id)a3 menuElementForControl:(id)a4
{
  v48[12] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 identifier];
  if (self
    && ([(AVMobileControlsViewController *)self transportBarCustomMenuItems],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    long long v45 = 0u;
    long long v46 = 0u;
    *(_OWORD *)id location = 0u;
    long long v44 = 0u;
    id v8 = [(AVMobileControlsViewController *)self transportBarCustomMenuItems];
    int v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:location objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)*((void *)location[1] + i);
          -[AVMobileChromelessControlsViewController _identifierForMenuElement:](v13);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == v6)
          {
            id v15 = v13;

            int v9 = v15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:location objects:v47 count:16];
      }
      while (v10);
    }
  }
  else
  {
    int v9 = 0;
  }

  uint64_t v16 = (AVMobileAuxiliaryControl *)v5;
  if (self)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    *(_OWORD *)id location = 0u;
    long long v44 = 0u;
    long long v17 = [(AVMobileControlsViewController *)self controlItems];
    long long v18 = (char *)[v17 countByEnumeratingWithState:location objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v17);
          }
          id v21 = (void *)*((void *)location[1] + (void)j);
          uint64_t v22 = [v21 identifier];
          BOOL v23 = [(AVMobileAuxiliaryControl *)v16 identifier];
          BOOL v24 = v22 == v23;

          if (v24)
          {
            id v25 = [v21 action];

            if (v25)
            {
              char v26 = (void *)MEMORY[0x1E4FB13F0];
              char v27 = [v21 title];
              int v28 = [v21 image];
              int v29 = [(AVMobileAuxiliaryControl *)v16 identifier];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __71__AVMobileChromelessControlsViewController__menuElementForControlItem___block_invoke;
              v42[3] = &unk_1E5FC3A88;
              v42[4] = v21;
              long long v18 = [v26 actionWithTitle:v27 image:v28 identifier:v29 handler:v42];

              if (([v21 isEnabled] & 1) == 0) {
                [v18 setAttributes:1];
              }
            }
            else
            {
              long long v18 = [v21 menu];

              if (v18)
              {
                long long v18 = [v21 menu];
              }
            }
            goto LABEL_29;
          }
        }
        long long v18 = (char *)[v17 countByEnumeratingWithState:location objects:v47 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_29:
  }
  else
  {
    long long v18 = 0;
  }

  if (self->_audibleMediaSelectionControl == v16)
  {
    -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    int v30 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController audibleOptionsOverflowMenu];
    goto LABEL_51;
  }
  if (self->_legibleMediaSelectionControl == v16)
  {
    -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    int v30 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController legibleOptionsMenu];
    goto LABEL_51;
  }
  if (self->_playbackSpeedControl == v16)
  {
    int v30 = [(AVMobilePlaybackRateMenuController *)self->_playbackSpeedMenuController menu];
    goto LABEL_51;
  }
  if (self->_routePickerControl != v16)
  {
    if (self->_analysisControl == v16)
    {
      uint64_t v39 = 1328;
    }
    else if (self->_copySubjectControl == v16)
    {
      uint64_t v39 = 1336;
    }
    else if (self->_visualLookupControl == v16)
    {
      uint64_t v39 = 1344;
    }
    else
    {
      if (self->_jumpToLiveControl != v16)
      {
        if (v9)
        {
          int v30 = v9;
        }
        else
        {
          if (!v18)
          {
            int v38 = 0;
            goto LABEL_52;
          }
          int v30 = v18;
        }
        goto LABEL_51;
      }
      uint64_t v39 = 1320;
    }
    int v30 = (char *)*(id *)((char *)&self->super.super.super.super.super.isa + v39);
LABEL_51:
    int v38 = v30;
    goto LABEL_52;
  }
  uint64_t v31 = [(AVMobileChromelessControlsView *)self->_view displayModeControlsView];
  uint64_t v32 = [v31 routePickerView];

  uint64_t v33 = AVLocalizedString(@"EXTERNAL_PLAYBACK_OVERFLOW_MENU_ITEM_TITLE");
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4FB1818], "avkit_imageWithSymbolNamed:textStyle:scale:", @"airplayvideo", *MEMORY[0x1E4FB28D0], 2);
  if ([v32 isAirPlayActive])
  {
    int v35 = [MEMORY[0x1E4FB1618] colorWithRed:0.5 green:0.86 blue:1.0 alpha:1.0];
    uint64_t v36 = [v34 imageWithTintColor:v35 renderingMode:1];

    uint64_t v34 = (void *)v36;
  }
  objc_initWeak(location, self);
  double v37 = (void *)MEMORY[0x1E4FB13F0];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __70__AVMobileChromelessControlsViewController__menuElementForRoutePicker__block_invoke;
  v47[3] = &unk_1E5FC3A10;
  objc_copyWeak(v48, location);
  int v38 = [v37 actionWithTitle:v33 image:v34 identifier:0 handler:v47];
  objc_destroyWeak(v48);
  objc_destroyWeak(location);

LABEL_52:
  id v40 = v38;

  return v40;
}

- (void)_updateAudibleMediaSelectionMenu
{
  if (a1)
  {
    id v12 = [a1 playerController];
    float v2 = [v12 audioMediaSelectionOptions];
    id v3 = [v12 currentAudioMediaSelectionOption];
    uint64_t v4 = [v2 indexOfObject:v3];

    -[AVMobileChromelessControlsViewController _setUpMediaSelectionMenuControllerIfNeeded]((uint64_t)a1);
    [a1[183] setAudibleOptions:v2];
    [a1[183] setCurrentAudibleOptionIndex:v4];
    id v5 = +[AVKitGlobalSettings shared];
    LODWORD(v4) = [v5 enhanceDialogueEnabled];

    if (v4)
    {
      id v6 = [a1 enhanceDialogueController];
      uint64_t v7 = [v6 currentLevel];

      id v8 = [a1 enhanceDialogueController];
      int v9 = [v8 availableLevels];

      uint64_t v10 = [a1 enhanceDialogueController];
      uint64_t v11 = [v10 currentContentSupported];

      [a1[183] setCurrentEnhanceDialogueOption:v7];
      [a1[183] setEnhanceDialogueOptions:v9];
      [a1[183] setShouldEnableEnhanceDialogueOptions:v11];
    }
  }
}

- (void)_updateLegibleMediaSelectionMenu
{
  if (a1)
  {
    id v5 = [a1 playerController];
    float v2 = [v5 legibleMediaSelectionOptions];
    id v3 = [v5 currentLegibleMediaSelectionOption];
    uint64_t v4 = [v2 indexOfObject:v3];

    -[AVMobileChromelessControlsViewController _setUpMediaSelectionMenuControllerIfNeeded]((uint64_t)a1);
    [a1[183] setLegibleOptions:v2];
    [a1[183] setCurrentLegibleOptionIndex:v4];
  }
}

void __70__AVMobileChromelessControlsViewController__menuElementForRoutePicker__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    float v2 = [WeakRetained[148] displayModeControlsView];
    id v3 = [v2 routePickerView];

    [v3 presentRoutePicker:v4];
    id WeakRetained = v4;
  }
}

- (uint64_t)_setUpMediaSelectionMenuControllerIfNeeded
{
  if (!*(void *)(result + 1464))
  {
    uint64_t v1 = result;
    float v2 = [[AVMediaSelectionMenuController alloc] initWithAudibleOptions:0 legibleOptions:0 enhanceDialogueOptions:0];
    id v3 = *(void **)(v1 + 1464);
    *(void *)(v1 + 1464) = v2;

    uint64_t v4 = *(void **)(v1 + 1464);
    return [v4 setDelegate:v1];
  }
  return result;
}

void __71__AVMobileChromelessControlsViewController__menuElementForControlItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) action];
  v1[2]();
}

- (void)buttonIsOverVideoDidChange:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  uint64_t v6 = [v5 isButtonOverVideo];
  id v8 = [(AVMobileChromelessControlsViewController *)self traitCollection];
  uint64_t v7 = objc_msgSend(v4, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v6, objc_msgSend(v8, "userInterfaceStyle"));
  [v5 setTintColor:v7];
}

- (id)menuForMenuButton:(id)a3
{
  uint64_t v4 = (AVMenuButton *)a3;
  id v5 = v4;
  if (self->_playbackSpeedButton == v4)
  {
    uint64_t v7 = [(AVMobilePlaybackRateMenuController *)self->_playbackSpeedMenuController menu];
  }
  else if (self->_audibleMediaSelectionButton == v4)
  {
    -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    uint64_t v7 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController audibleOptionsMenu];
  }
  else
  {
    if (self->_legibleMediaSelectionButton != v4)
    {
      uint64_t v6 = 0;
      goto LABEL_9;
    }
    -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionMenu]((id *)&self->super.super.super.super.super.isa);
    uint64_t v7 = [(AVMediaSelectionMenuController *)self->_mediaSelectionMenuController legibleOptionsMenu];
  }
  uint64_t v6 = (void *)v7;
LABEL_9:

  return v6;
}

- (BOOL)shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:(id)a3
{
  id v3 = [(AVMobileControlsViewController *)self playerController];
  char v4 = [v3 closedCaptionsEnabled];

  return v4;
}

- (id)mediaSelectionMenuController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AVMobileControlsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(AVMobileControlsViewController *)self delegate];
    int v9 = [v8 controlsViewController:self displayNameForMediaSelectionOption:v5];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)mediaSelectionMenuController:(id)a3 didSelectEnhanceDialogueOption:(int64_t)a4
{
  id v6 = a3;
  char v7 = [(AVMobileChromelessControlsViewController *)self enhanceDialogueController];
  [v7 setCurrentLevel:a4];

  [v6 setCurrentEnhanceDialogueOption:a4];
  [(AVMenuButton *)self->_audibleMediaSelectionButton updateContextMenu];

  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
}

- (void)mediaSelectionMenuController:(id)a3 didSelectOption:(id)a4
{
  id v10 = a4;
  id v6 = [a3 audibleOptions];
  int v7 = [v6 containsObject:v10];

  id v8 = [(AVMobileControlsViewController *)self playerController];
  int v9 = v8;
  if (v7) {
    [v8 setCurrentAudioMediaSelectionOption:v10];
  }
  else {
    [v8 setCurrentLegibleMediaSelectionOption:v10];
  }
}

- (void)controlItemDidUpdateVisualConfiguration:(id)a3
{
  if (self)
  {
    id v3 = [(AVMobileChromelessControlsView *)self->_view auxiliaryControlsView];
    [v3 updateOverflowMenu];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileChromelessControlsViewController *)&v4 traitCollectionDidChange:a3];
  if (self)
  {
    if (self->_hasBeenSetUp)
    {
      [(AVMobileChromelessControlsViewController *)self _updateStyleSheet];
      -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)&self->super.super.super.super.super.isa);
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVMobileChromelessControlsViewController;
  -[AVMobileChromelessControlsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self && self->_hasBeenSetUp)
  {
    [(UIPanGestureRecognizer *)self->_contentTabPanGestureRecognizer setEnabled:0];
    -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
    id v8 = self->_contentTabPresentationContext;
    int v9 = v8;
    if (self->_contentTabViewPresentationAnimator && [(AVMobileContentTabPresentationContext *)v8 state] == 2)
    {
      [(UIViewPropertyAnimator *)self->_contentTabViewPresentationAnimator stopAnimation:0];
      [(UIViewPropertyAnimator *)self->_contentTabViewPresentationAnimator finishAnimationAtPosition:[(UIViewPropertyAnimator *)self->_contentTabViewPresentationAnimator isReversed]];
    }

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__AVMobileChromelessControlsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E5FC3900;
    objc_copyWeak(&v11, &location);
    [v7 animateAlongsideTransition:v10 completion:0];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __95__AVMobileChromelessControlsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained dismissCustomInfoViewControllerAnimated:1];
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing](WeakRetained);
    -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)WeakRetained);
    -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)WeakRetained, 1);
    [WeakRetained[217] setEnabled:1];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileChromelessControlsViewController *)&v6 viewSafeAreaInsetsDidChange];
  if (self)
  {
    if (self->_hasBeenSetUp)
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __71__AVMobileChromelessControlsViewController_viewSafeAreaInsetsDidChange__block_invoke;
      v3[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v4, &location);
      dispatch_async(MEMORY[0x1E4F14428], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __71__AVMobileChromelessControlsViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained[1168];

    if (v3)
    {
      id v4 = objc_loadWeakRetained(v1);
      -[AVMobileChromelessControlsViewController _updateLayoutMargins](v4);
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileChromelessControlsViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (self && self->_hasBeenSetUp) {
    -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)self);
  }
  -[AVMobileChromelessControlsViewController _attemptSetupIfNeeded](self);
}

- (void)_attemptSetupIfNeeded
{
  if (a1)
  {
    if (-[AVMobileChromelessControlsViewController _canPerformSetup]((uint64_t)a1))
    {
      objc_initWeak(&location, a1);
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __65__AVMobileChromelessControlsViewController__attemptSetupIfNeeded__block_invoke;
      v2[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v3, &location);
      dispatch_async(MEMORY[0x1E4F14428], v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_canPerformSetup
{
  if ([(id)a1 optimizeForPerformance]) {
    return 0;
  }
  id v3 = [*(id *)(a1 + 1184) window];
  if (v3) {
    BOOL v2 = *(unsigned char *)(a1 + 1168) == 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

uint64_t __65__AVMobileChromelessControlsViewController__attemptSetupIfNeeded__block_invoke(uint64_t a1)
{
  v108[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    val = (void *)WeakRetained;
    uint64_t WeakRetained = -[AVMobileChromelessControlsViewController _canPerformSetup](WeakRetained);
    uint64_t v2 = (uint64_t)val;
    if (WeakRetained)
    {
      *((unsigned char *)val + 1168) = 1;
      if (!val[147])
      {
        id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v3 addObserver:val selector:sel__updateStyleSheet name:*MEMORY[0x1E4FB27A8] object:0];

        [val _updateStyleSheet];
        uint64_t v2 = (uint64_t)val;
      }
      id v4 = *(void **)(v2 + 1184);
      if (v4)
      {
        objc_super v5 = [v4 backgroundView];

        uint64_t v2 = (uint64_t)val;
        if (!v5)
        {
          objc_super v6 = objc_alloc_init(AVMobileChromelessBackgroundGradientView);
          [(AVMobileChromelessBackgroundGradientView *)v6 setAutoresizingMask:0];
          [(id)val[148] setBackgroundView:v6];

          uint64_t v2 = (uint64_t)val;
        }
      }
      id v7 = *(void **)(v2 + 1184);
      if (v7)
      {
        if (*(void *)(v2 + 1176))
        {
          id v8 = [v7 displayModeControlsView];

          uint64_t v2 = (uint64_t)val;
          if (!v8)
          {
            int v9 = [[AVMobileChromelessDisplayModeControlsView alloc] initWithStyleSheet:val[147]];
            [(AVMobileChromelessDisplayModeControlsView *)v9 setAutoresizingMask:0];
            [(AVMobileChromelessDisplayModeControlsView *)v9 setDelegate:val];
            [(AVMobileChromelessDisplayModeControlsView *)v9 setFullscreenIcon:0];
            id v10 = [val routingConfiguration];
            [(AVMobileChromelessDisplayModeControlsView *)v9 setRoutingConfiguration:v10];

            [(id)val[148] setDisplayModeControlsView:v9];
            uint64_t v2 = (uint64_t)val;
          }
        }
      }
      id v11 = *(void **)(v2 + 1184);
      if (v11)
      {
        if (*(void *)(v2 + 1176))
        {
          id v12 = [v11 playbackControlsView];

          uint64_t v2 = (uint64_t)val;
          if (!v12)
          {
            objc_super v13 = [[AVMobileChromelessPlaybackControlsView alloc] initWithStyleSheet:val[147]];
            [(AVMobileChromelessPlaybackControlsView *)v13 setAutoresizingMask:0];
            [(AVMobileChromelessPlaybackControlsView *)v13 setDelegate:val];
            int v14 = [val prefersFullScreenStyleForEmbeddedMode];
            double v15 = 0.0;
            if (v14) {
              double v15 = *((double *)val + 219);
            }
            -[AVMobileChromelessPlaybackControlsView setAvkit_extendedDynamicRangeGain:](v13, "setAvkit_extendedDynamicRangeGain:", v15, val);
            [(id)val[148] setPlaybackControlsView:v13];

            uint64_t v2 = (uint64_t)val;
          }
        }
      }
      uint64_t v16 = *(void **)(v2 + 1184);
      if (v16)
      {
        if (*(void *)(v2 + 1176))
        {
          long long v17 = [v16 timelineView];

          uint64_t v2 = (uint64_t)val;
          if (!v17)
          {
            double v18 = 0.0;
            if ([val prefersFullScreenStyleForEmbeddedMode]) {
              double v18 = *((double *)val + 219);
            }
            uint64_t v19 = [[AVMobileChromelessTimelineView alloc] initWithStyleSheet:val[147]];
            [(AVMobileChromelessTimelineView *)v19 setAutoresizingMask:0];
            [(AVMobileChromelessTimelineView *)v19 setLabelsExtendedDynamicRangeGain:v18];
            [(AVMobileChromelessTimelineView *)v19 setSliderExtendedDynamicRangeGain:v18];
            [(AVView *)v19 setAutomaticallyUpdatesSubviewContentIntersections:1];
            [(id)val[148] setTimelineView:v19];

            uint64_t v2 = (uint64_t)val;
          }
        }
      }
      long long v20 = *(void **)(v2 + 1184);
      if (v20)
      {
        if (*(void *)(v2 + 1176))
        {
          id v21 = [v20 titlebarView];

          uint64_t v2 = (uint64_t)val;
          if (!v21)
          {
            uint64_t v22 = [[AVMobileTitlebarView alloc] initWithStyleSheet:val[147]];
            [(AVMobileTitlebarView *)v22 setAutoresizingMask:0];
            [(id)val[148] setTitlebarView:v22];
            -[AVMobileChromelessControlsViewController _updateTitleAndDescriptionInfo]((id *)val);
            -[AVMobileChromelessControlsViewController _updateContentTag]((id *)val);

            uint64_t v2 = (uint64_t)val;
          }
        }
      }
      -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded](v2);
      BOOL v23 = val;
      if (val[148] && !val[154])
      {
        uint64_t v24 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0 identifier:@"AVRoutePickerControl"];
        id v25 = (void *)val[154];
        val[154] = v24;

        BOOL v23 = val;
      }
      -[AVMobileChromelessControlsViewController _setUpAnalysisControlIfNeeded](v23);
      char v26 = val;
      if (!val[153] && val[148])
      {
        -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded]((uint64_t)val);
        char v27 = objc_alloc_init(AVMobilePlaybackRateMenuController);
        int v28 = (void *)val[182];
        val[182] = v27;

        int v29 = (void *)val[182];
        int v30 = [val playbackSpeedCollection];
        [v29 setPlaybackSpeedCollection:v30];

        uint64_t v31 = +[AVButton buttonWithAccessibilityIdentifier:@"AVPlaybackSpeedControl" isSecondGeneration:1];
        uint64_t v32 = (void *)val[164];
        val[164] = v31;

        uint64_t v33 = (void *)val[164];
        uint64_t v34 = AVLocalizedString(@"Playback Speed");
        [v33 setAccessibilityLabel:v34];

        [(id)val[164] setImageName:@"speedometer"];
        [(id)val[164] setDelegate:val];
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:](val, (void *)val[164]);
        uint64_t v35 = +[AVMobileAuxiliaryControl controlWithView:val[164] displayPriority:0 identifier:@"AVPlaybackSpeedControl"];
        uint64_t v36 = (void *)val[153];
        val[153] = v35;

        -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion]((id *)val);
        char v26 = val;
      }
      if (!v26[151] && v26[148])
      {
        -[AVMobileChromelessControlsViewController _setUpAuxiliaryControlsViewIfNeeded]((uint64_t)v26);
        uint64_t v37 = +[AVButton buttonWithAccessibilityIdentifier:@"Audible Options" isSecondGeneration:1];
        int v38 = (void *)val[162];
        val[162] = v37;

        uint64_t v39 = (void *)val[162];
        id v40 = AVLocalizedString(@"Audio Track");
        [v39 setAccessibilityLabel:v40];

        [(id)val[162] setImageName:@"waveform.circle"];
        [(id)val[162] setDelegate:val];
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:](val, (void *)val[162]);
        uint64_t v41 = +[AVMobileAuxiliaryControl controlWithView:val[162] displayPriority:0 identifier:@"AVAudibleMediaSelectionControl"];
        BOOL v42 = (void *)val[151];
        val[151] = v41;

        uint64_t v43 = +[AVButton buttonWithAccessibilityIdentifier:@"Legible Options" isSecondGeneration:1];
        long long v44 = (void *)val[163];
        val[163] = v43;

        long long v45 = (void *)val[163];
        long long v46 = AVLocalizedString(@"Legible Options");
        [v45 setAccessibilityLabel:v46];

        [(id)val[163] setImageName:@"captions.bubble"];
        [(id)val[163] setDelegate:val];
        -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:](val, (void *)val[163]);
        uint64_t v47 = +[AVMobileAuxiliaryControl controlWithView:val[163] displayPriority:0 identifier:@"AVLegibleMediaSelectionControl"];
        double v48 = (void *)val[152];
        val[152] = v47;

        -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)val);
        -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionControlInclusionState](val);
        char v26 = val;
      }
      double v49 = (void *)v26[148];
      if (v49)
      {
        if (v26[147])
        {
          double v50 = [v49 volumeControlsView];

          char v26 = val;
          if (!v50)
          {
            double v51 = objc_alloc_init(AVMobileChromelessVolumeControlsView);
            [(AVMobileChromelessVolumeControlsView *)v51 setDelegate:val];
            [(AVMobileChromelessVolumeControlsView *)v51 setPrefersVolumeSliderIncluded:1];
            [(AVMobileChromelessVolumeControlsView *)v51 setAutoresizingMask:0];
            [(id)val[148] setVolumeControlsView:v51];
            -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)val);

            char v26 = val;
          }
        }
      }
      -[AVMobileChromelessControlsViewController _setUpCopySubjectControlIfNeeded](v26);
      -[AVMobileChromelessControlsViewController _setUpVisualLookupControlIfNeeded](val);
      [(AVMobileChromelessControlsViewController *)(uint64_t)val _updateViewVisibilityStatesTo:0];
      objc_initWeak(&location, val);
      block = (__CFString *)MEMORY[0x1E4F143A8];
      uint64_t v105 = 3221225472;
      v106 = __62__AVMobileChromelessControlsViewController__loadControlsViews__block_invoke;
      v107 = &unk_1E5FC44F8;
      objc_copyWeak(v108, &location);
      dispatch_async(MEMORY[0x1E4F14428], &block);
      objc_destroyWeak(v108);
      objc_destroyWeak(&location);
      -[AVMobileChromelessControlsViewController _updateContentTabViewControllers]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded](val);
      -[AVMobileChromelessControlsViewController _setUpTapGestureRecognizerIfNeeded]((uint64_t)val);
      id v52 = objc_alloc_init(MEMORY[0x1E4F166B8]);
      v53 = (void *)val[178];
      val[178] = v52;

      [(id)val[178] setStyle:1];
      id v54 = objc_alloc_init(MEMORY[0x1E4F166B8]);
      v55 = (void *)val[179];
      val[179] = v54;

      [(id)val[179] setStyle:2];
      id v56 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      id v57 = (void *)val[180];
      val[180] = v56;

      [(id)val[180] setDateFormat:@"h:mm a"];
      if (!val[177] && val[148])
      {
        long long v58 = objc_alloc_init(AVPlayerControllerTimeResolver);
        double v59 = (void *)val[177];
        val[177] = v58;

        double v60 = (void *)val[177];
        v61 = [val playerController];
        [v60 setPlayerController:v61];

        [(id)val[177] setInterval:1.0];
      }
      id v62 = [[AVObservationController alloc] initWithOwner:val];
      double v63 = (void *)val[144];
      val[144] = v62;

      [(id)val[144] startObservingNotificationForName:*MEMORY[0x1E4FB2C28] object:0 notificationCenter:0 observationHandler:&__block_literal_global_122];
      [(id)val[144] startObservingNotificationForName:@"AVVolumeControllerCurrentRouteHasVolumeControlChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_124];
      id v64 = (id)[(id)val[144] startObserving:val keyPath:@"pipController.pictureInPicturePossible" includeInitialValue:1 observationHandler:&__block_literal_global_131_17836];
      id v65 = (id)[(id)val[144] startObserving:val keyPath:@"pipController.pictureInPictureActive" includeInitialValue:1 observationHandler:&__block_literal_global_136];
      [(id)val[144] startObservingNotificationForName:@"AVVolumeControllerVolumeChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_138];
      id v66 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.muted" observationHandler:&__block_literal_global_144];
      id v67 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.allowsExternalPlayback" observationHandler:&__block_literal_global_149];
      id v68 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.canSeek" observationHandler:&__block_literal_global_154];
      id v69 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.hasLiveStreamingContent" observationHandler:&__block_literal_global_159];
      id v70 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.hasSeekableLiveStreamingContent" observationHandler:&__block_literal_global_164];
      id v71 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.status" observationHandler:&__block_literal_global_169];
      id v72 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.timeControlStatus" observationHandler:&__block_literal_global_174];
      id v73 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.playing" includeInitialValue:0 observationHandler:&__block_literal_global_179];
      id v74 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.rate" observationHandler:&__block_literal_global_184];
      id v75 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.timeControlStatus" observationHandler:&__block_literal_global_186];
      id v76 = (id)[(id)val[144] startObserving:val[182] keyPath:@"menu" observationHandler:&__block_literal_global_191];
      id v77 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.playingOnMatchPointDevice" observationHandler:&__block_literal_global_196];
      id v78 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.hasEnabledAudio" observationHandler:&__block_literal_global_201_17845];
      id v79 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.hasAudioMediaSelectionOptions" observationHandler:&__block_literal_global_206];
      id v80 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.hasLegibleMediaSelectionOptions" observationHandler:&__block_literal_global_211];
      id v81 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.currentAssetIfReady" observationHandler:&__block_literal_global_216];
      id v82 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.scrubbing" observationHandler:&__block_literal_global_221];
      v83 = (void *)val[144];
      uint64_t v84 = val[177];
      block = @"targetTime";
      uint64_t v105 = @"minTime";
      v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&block count:2];
      id v86 = (id)[v83 startObserving:v84 keyPaths:v85 observationHandler:&__block_literal_global_229];

      id v87 = (id)[(id)val[144] startObserving:val[177] keyPath:@"maxTime" observationHandler:&__block_literal_global_234];
      id v88 = (id)[(id)val[144] startObserving:val keyPath:@"playerController.externalPlaybackActive" observationHandler:&__block_literal_global_239];
      -[AVMobileChromelessControlsViewController _updateAnalysisControlInclusionIfNeeded]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlsForControlItems](val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing]((id *)val);
      -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState]((id *)val);
      -[AVMobileChromelessControlsViewController _updateContentTag]((id *)val);
      -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateControlsVisibilityStateAnimated:]((uint64_t)val, 0);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion]((id *)val);
      -[AVMobileChromelessControlsViewController _updateDisplayModeControlsForControlItems]((id *)val);
      -[AVMobileChromelessControlsViewController _updateFullScreenButtonIcon]((id *)val);
      [(id)val[148] setLayoutAllowed:*((unsigned __int8 *)val + 1168)];
      -[AVMobileChromelessControlsViewController _updateLayoutMargins](val);
      -[AVMobileChromelessControlsViewController _updateLegibleMediaSelectionControlInclusionState](val);
      -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState](val);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion]((id *)val);
      -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon]((id *)val);
      -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState]((id *)val);
      -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)val, 0);
      -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState]((id *)val);
      -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes]((id *)val);
      -[AVMobileChromelessControlsViewController _updateTimelineLabelPositions]((id *)val);
      -[AVMobileChromelessControlsViewController _updateTimelineSliderEnablementState](val);
      -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateTitleAndDescriptionInfo]((id *)val);
      -[AVMobileChromelessControlsViewController _updateTitleBarViewInclusionState]((id *)val);
      -[AVMobileChromelessControlsViewController _updateVolumeControllerClient]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState]((id *)val);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:]((id *)val, 0);
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewAllowsVolumeAdjustmentState]((id *)val);
      -[AVMobileChromelessControlsViewController _updateWebKitExcludedObservationState]((uint64_t)val);
      v89 = val;
      v90 = (void *)val[148];
      if (v90 && val[147])
      {
        v91 = [v90 timelineView];

        if (v91)
        {
          v92 = [(id)val[148] timelineView];
          v93 = [v92 slider];
          [v93 setAccessibilityIdentifier:@"Current position"];
          v94 = AVLocalizedString(@"Current position");
          [v93 setAccessibilityLabel:v94];

          [v93 setIsAccessibilityElement:1];
          [v93 setDelegate:val];
          [v93 addTarget:val action:sel__timelineSliderDidChangeValue_ forControlEvents:4096];
          v95 = +[AVKitGlobalSettings shared];
          char v96 = [v95 fluidSliderEnabled];

          if (v96)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v93 setFineScrubbingStyle:1];
            }
          }
          else
          {
            [v93 addTarget:val action:sel__timelineSliderTrackingStateDidChange forControlEvents:449];
          }
          objc_msgSend(v93, "setMinimumValue:", 0.0, val);
          LODWORD(v97) = 1.0;
          [v93 setMaximumValue:v97];
          LODWORD(v98) = 1.0;
          [v93 setTotalValue:v98];
        }
        v89 = val;
      }
      objc_msgSend((id)v89[148], "avkit_makeSubtreeDisallowGroupBlending", val);
      v99 = [vala[148] window];

      uint64_t v2 = (uint64_t)vala;
      if (v99)
      {
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)vala);
        uint64_t v2 = (uint64_t)vala;
      }
    }
  }

  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)_updateContentTabViewControllers
{
  if (a1)
  {
    uint64_t v2 = +[AVKitGlobalSettings shared];
    int v3 = [v2 isTVApp];

    if (v3)
    {
      [*(id *)(a1 + 1704) invalidateContentTabsSelection];
      if (*(void *)(a1 + 1184) && !*(void *)(a1 + 1704))
      {
        id v4 = objc_alloc_init(AVMobileChromelessContentTabsViewController);
        objc_super v5 = *(void **)(a1 + 1704);
        *(void *)(a1 + 1704) = v4;

        [*(id *)(a1 + 1704) setCustomInfoViewControllers:*(void *)(a1 + 1664)];
        [*(id *)(a1 + 1704) setDelegate:a1];
        [*(id *)(a1 + 1704) willMoveToParentViewController:a1];
        [(id)a1 addChildViewController:*(void *)(a1 + 1704)];
        objc_super v6 = [*(id *)(a1 + 1704) view];
        [*(id *)(a1 + 1184) setContentTabsView:v6];
        [*(id *)(a1 + 1704) didMoveToParentViewController:a1];
      }
      id v7 = *(void **)(a1 + 1704);
      uint64_t v8 = *(void *)(a1 + 1664);
      [v7 setCustomInfoViewControllers:v8];
    }
  }
}

- (void)_updateAnalysisControlInclusionIfNeeded
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 1248);
    if (v2)
    {
      int v3 = *(unsigned __int8 *)(a1 + 1729);
      id v5 = v2;
      BOOL v4 = v3 == [v2 isIncluded];
      id v2 = v5;
      if (!v4)
      {
        [v5 setIncluded:*(unsigned __int8 *)(a1 + 1729)];
        [*(id *)(a1 + 1184) setNeedsLayout];
        id v2 = v5;
      }
    }
  }
}

- (uint64_t)_updateAudibleMediaSelectionControlInclusionState
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    id v2 = +[AVKitGlobalSettings shared];
    int v3 = [v2 enhanceDialogueEnabled];

    BOOL v4 = [v1 playerController];
    unsigned int v5 = [v4 hasAudioMediaSelectionOptions];
    uint64_t v6 = v3 | v5;
    if (v3 && (v5 & 1) == 0)
    {
      id v7 = [v1 enhanceDialogueController];
      uint64_t v8 = [v7 availableLevels];
      uint64_t v6 = [v8 count] != 0;
    }
    int v9 = (void *)v1[151];
    return [v9 setIncluded:v6];
  }
  return result;
}

- (void)_updateAuxiliaryControlsForControlItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v3 = [a1 controlItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v9 = -[AVMobileChromelessControlsViewController _auxiliaryControlForControlItem:]((uint64_t)a1, v8);
        if (!v9)
        {
          uint64_t v10 = [v8 type];
          if ((unint64_t)(v10 - 1) < 2)
          {
            id v11 = [v8 view];
            id v12 = [v8 identifier];
            int v9 = +[AVMobileAuxiliaryControl controlWithView:v11 displayPriority:0 identifier:v12];

            goto LABEL_11;
          }
          if (v10)
          {
            int v9 = 0;
          }
          else
          {
            id v11 = [v8 identifier];
            int v9 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0 identifier:v11];
LABEL_11:
          }
          objc_super v13 = [v8 view];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            double v15 = [v8 view];
            uint64_t v16 = [MEMORY[0x1E4FB1618] whiteColor];
            [v15 setTintColor:v16];

            [v15 setAutoresizingMask:0];
          }
        }
        [v8 setDelegate:a1];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  long long v17 = (void *)a1[201];
  a1[201] = v2;

  -[AVMobileChromelessControlsViewController _updateControlItemsInclusionState]((id *)a1);
  -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)a1);
  -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)a1);
}

- (void)_updateContentTabsInteractionEnablementState
{
  if (a1)
  {
    id v13 = [a1 playerController];
    uint64_t v2 = [v13 status];
    [v13 contentDimensions];
    BOOL v7 = ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v4 >= 0
      || (unint64_t)(v4 - 1) < 0xFFFFFFFFFFFFFLL;
    BOOL v9 = (v3 < 0 || ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
      && (unint64_t)(v3 - 1) > 0xFFFFFFFFFFFFELL;
    if (v9 || !v7) {
      unsigned int v10 = [v13 isExternalPlaybackActive];
    }
    else {
      unsigned int v10 = 1;
    }
    if (v2 == 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = [a1[213] view];
    [v12 setUserInteractionEnabled:v11];
  }
}

- (void)_updateContentTag
{
  if (a1)
  {
    id v4 = [a1[148] titlebarView];
    uint64_t v2 = [a1 playerController];
    if ([v2 hasLiveStreamingContent])
    {
      if ([v2 isAtLiveEdge]) {
        +[AVMobileContentTag liveEdgeContentTag];
      }
      else {
      uint64_t v3 = +[AVMobileContentTag liveContentTag];
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    [v4 setContentTag:v3];
    [a1[148] setNeedsLayout];
  }
}

- (void)_updateDisplayModeControlsForControlItems
{
  uint64_t v2 = +[AVKitGlobalSettings shared];
  uint64_t v3 = [a1 fullscreenController];
  uint64_t v4 = [v3 presentationState];

  if ([v2 isTVApp])
  {

    if (v4 == 2) {
      return;
    }
    goto LABEL_3;
  }
  int v11 = [v2 isAVKitTester];

  if (v11) {
    BOOL v12 = v4 == 2;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
LABEL_3:
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke;
    v13[3] = &unk_1E5FC3AD8;
    id v14 = v5;
    id v6 = v5;
    [a1 _enumerateControlItemsOfTypes:&unk_1F094A388 usingBlock:v13];
    unint64_t v7 = [v6 count];
    if (v7 >= 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7;
    }
    BOOL v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);
    unsigned int v10 = [a1[148] displayModeControlsView];
    [v10 setCustomActions:v9];
  }
}

- (void)_updateLegibleMediaSelectionControlInclusionState
{
  if (a1)
  {
    uint64_t v1 = (void *)a1[152];
    id v2 = [a1 playerController];
    objc_msgSend(v1, "setIncluded:", objc_msgSend(v2, "hasLegibleMediaSelectionOptions"));
  }
}

- (void)_updateLoadingAnimatorState
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v2 = [a1 playerController];
  if ([v2 status] == 1)
  {

    uint64_t v3 = a1 + 184;
LABEL_5:
    *uint64_t v3 = 1;
    id v5 = (void *)a1[185];
    if (!v5 || ([v5 isRunning] & 1) == 0)
    {
      id v6 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
      unint64_t v7 = [v6 tintState];

      if (v7 >= 3)
      {
        BOOL v9 = _AVLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = (id)v7;
          _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: unknown slider tint state %ld", (uint8_t *)location, 0xCu);
        }

        uint64_t v8 = 2;
      }
      else
      {
        uint64_t v8 = qword_1B0721408[v7];
      }
      objc_initWeak(location, a1);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__AVMobileChromelessControlsViewController__updateLoadingAnimatorState__block_invoke;
      v10[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v11, location);
      -[AVMobileChromelessControlsViewController _animateSliderToTintState:duration:completionHandler:]((uint64_t)a1, (void *)v8, v10, 1.0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(location);
    }
    return;
  }
  uint64_t v4 = [v2 timeControlStatus];

  uint64_t v3 = a1 + 184;
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (*v3)
  {
    *uint64_t v3 = 0;
    -[AVMobileChromelessControlsViewController _animateSliderToTintState:duration:completionHandler:]((uint64_t)a1, (void *)1, 0, 0.25);
  }
}

- (void)_updatePlaybackSpeedControlInclusion
{
  if (a1)
  {
    id v6 = [a1 playerController];
    if ([v6 hasLiveStreamingContent]) {
      int v2 = [v6 hasSeekableLiveStreamingContent];
    }
    else {
      int v2 = 1;
    }
    uint64_t v3 = [a1 playbackSpeedCollection];
    if (v3)
    {
      uint64_t v4 = +[AVKitGlobalSettings shared];
      if ([v4 playbackSpeedControlEnabled]) {
        uint64_t v5 = v2 & ~[v6 isPlayingOnMatchPointDevice];
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }

    [a1[153] setIncluded:v5];
  }
}

- (void)_updatePlaybackControlsViewInclusionState
{
  if (a1)
  {
    char v2 = [a1 excludedControls];
    id v9 = [a1[148] playbackControlsView];
    uint64_t v3 = [a1 playerController];
    int v4 = [v3 hasLiveStreamingContent];
    int v5 = [v3 hasSeekableLiveStreamingContent];
    if (!v4 || v5) {
      unsigned int v6 = [a1 requiresLinearPlayback] ^ 1;
    }
    else {
      unsigned int v6 = 0;
    }
    if ((v2 & 4) != 0) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    [v9 setShowsPlayPauseButton:(v2 & 1) == 0];
    if ((v2 & 2) != 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v6;
    }
    [v9 setShowsBackwardSecondaryPlaybackButton:v8];
    [v9 setShowsForwardSecondaryPlaybackButton:v7];
  }
}

- (void)_updateTimelineSliderEnablementState
{
  -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "requiresLinearPlayback") ^ 1);
}

- (void)_updateTitleAndDescriptionInfo
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v1 = a1;
  id v2 = [a1[148] titlebarView];
  uint64_t v3 = [v1 playerController];
  int v4 = [v3 player];
  int v5 = [v4 currentItem];
  unsigned int v6 = [v5 contentTitle];

  uint64_t v7 = [v3 player];
  uint64_t v8 = [v7 currentItem];
  id v9 = [v8 contentSubtitle];

  if (!objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
  {
    double v15 = 0;
    goto LABEL_29;
  }
  uint64_t v37 = v1;
  int v38 = v2;
  uint64_t v35 = [v3 metadata];
  uint64_t v36 = v3;
  unsigned int v10 = [v3 player];
  id v11 = [v10 currentItem];
  BOOL v12 = [v11 externalMetadata];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v13)
  {
    double v15 = 0;
    goto LABEL_24;
  }
  uint64_t v14 = v13;
  double v15 = 0;
  uint64_t v16 = *(void *)v43;
  uint64_t v39 = *MEMORY[0x1E4F15DB0];
  uint64_t v40 = *MEMORY[0x1E4F15C80];
  uint64_t v17 = *MEMORY[0x1E4F15C58];
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v43 != v16) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      long long v20 = [v19 identifier];
      long long v21 = v20;
      if (!v6
        && [v20 isEqualToString:v40]
        && ([v19 stringValue], uint64_t v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
      {
        id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v24 = [v19 stringValue];
        unsigned int v6 = (void *)[v23 initWithString:v24];
      }
      else if (!v9 {
             && [v21 isEqualToString:v39]
      }
             && ([v19 stringValue],
                 id v25 = objc_claimAutoreleasedReturnValue(),
                 v25,
                 v25))
      {
        id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v24 = [v19 stringValue];
        id v9 = (void *)[v26 initWithString:v24];
      }
      else
      {
        if (![v21 isEqualToString:v17]) {
          goto LABEL_19;
        }
        [v19 stringValue];
        double v15 = v24 = v15;
      }

LABEL_19:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v14);
LABEL_24:

  uint64_t v1 = v37;
  id v2 = v38;
  uint64_t v3 = v36;
  if (!v6)
  {
    uint64_t v27 = *MEMORY[0x1E4F15CD0];
    int v28 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F15CD0]];

    if (v28)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
      int v30 = [v35 objectForKeyedSubscript:v27];
      unsigned int v6 = (void *)[v29 initWithString:v30];

      if (!v9) {
        goto LABEL_35;
      }
    }
    else
    {
      unsigned int v6 = 0;
      if (!v9) {
        goto LABEL_35;
      }
    }
LABEL_26:
    if (v15) {
      goto LABEL_28;
    }
LABEL_27:
    double v15 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F15CA8]];
    goto LABEL_28;
  }
  if (v9) {
    goto LABEL_26;
  }
LABEL_35:
  uint64_t v31 = *MEMORY[0x1E4F15EF8];
  uint64_t v32 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F15EF8]];

  if (!v32)
  {
    id v9 = 0;
    if (v15) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v33 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v34 = [v35 objectForKeyedSubscript:v31];
  id v9 = (void *)[v33 initWithString:v34];

  if (!v15) {
    goto LABEL_27;
  }
LABEL_28:

LABEL_29:
  [v2 setTitle:v6];
  [v2 setSubtitle:v9];
  [v1[148] setNeedsLayout];
}

- (void)_updateTitleBarViewInclusionState
{
  __int16 v2 = [a1 excludedControls];
  id v3 = [a1[148] titlebarView];
  [v3 setShowsTitle:(v2 & 0x400) == 0];
  [v3 setShowsSubtitle:(v2 & 0x800) == 0];
  [v3 setShowsContentTag:(v2 & 0x1000) == 0];
  [v3 setNeedsLayout];
}

- (void)_updateVolumeControlsViewVolumeWithMuteStateUpdate:(id *)a1
{
  if (a1)
  {
    id v12 = [a1[148] volumeControlsView];
    if (([v12 isTracking] & 1) == 0)
    {
      int v4 = [a1 playerController];
      int v5 = [v4 isMuted];

      unsigned int v6 = [a1 playerController];
      int v7 = [v6 isExternalPlaybackActive];

      uint64_t v8 = [a1 volumeController];
      [v8 volume];
      float v10 = v9;

      double v11 = v10;
      if (v7) {
        double v11 = 1.0;
      }
      if (v5) {
        double v11 = 0.0;
      }
      [v12 setVolume:a2 forUpdateReason:v11];
    }
  }
}

- (void)_updateVolumeControlsViewAllowsVolumeAdjustmentState
{
  if (a1)
  {
    id v2 = [a1[148] volumeControlsView];
    [v2 setAllowsVolumeAdjustment:-[AVMobileChromelessControlsViewController _activeRouteSupportsAdjustingVolume](a1)];
  }
}

- (uint64_t)_updateWebKitExcludedObservationState
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = [(id)a1 playerController];
  id v2 = *(void **)(a1 + 1160);
  if (!v2)
  {
    id v3 = [[AVObservationController alloc] initWithOwner:a1];
    int v4 = *(void **)(a1 + 1160);
    *(void *)(a1 + 1160) = v3;

    id v2 = *(void **)(a1 + 1160);
  }
  uint64_t v5 = objc_msgSend(v2, "stopAllObservation", v23);
  unsigned int v6 = v24;
  if (v24)
  {
    uint64_t v5 = objc_msgSend(v24, "avkit_isAVPlayerControllerOrSubclass");
    unsigned int v6 = v24;
    if (v5)
    {
      int v7 = [(id)a1 playerController];
      uint64_t v8 = *(void **)(a1 + 1152);
      v26[0] = @"playbackSuspended";
      v26[1] = @"suspendedRate";
      float v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      id v10 = (id)[v8 startObserving:v7 keyPaths:v9 observationHandler:&__block_literal_global_249];

      id v11 = (id)[*(id *)(a1 + 1152) startObserving:v7 keyPath:@"photosensitivityRegions" includeInitialValue:1 observationHandler:&__block_literal_global_254];
      id v12 = *(void **)(a1 + 1152);
      uint64_t v13 = *MEMORY[0x1E4F16008];
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 startObservingNotificationForName:v13 object:0 notificationCenter:v14 observationHandler:&__block_literal_global_256];

      id v15 = (id)[*(id *)(a1 + 1152) startObserving:v7 keyPath:@"player.currentItem.interstitialTimeRanges" observationHandler:&__block_literal_global_261];
      uint64_t v16 = *(void **)(a1 + 1152);
      v25[0] = @"playerController.player.currentItem.externalMetadata";
      v25[1] = @"playerController.metadata";
      v25[2] = @"playerController.player.currentItem.contentTitle";
      v25[3] = @"playerController.player.currentItem.contentSubtitle";
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      id v18 = (id)[v16 startObserving:a1 keyPaths:v17 observationHandler:&__block_literal_global_275];

      id v19 = (id)[*(id *)(a1 + 1152) startObserving:a1 keyPath:@"playerController.atLiveEdge" observationHandler:&__block_literal_global_280];
      id v20 = (id)[*(id *)(a1 + 1152) startObserving:a1 keyPath:@"playerController.coordinatedPlaybackActive" includeInitialValue:0 observationHandler:&__block_literal_global_285];
      id v21 = (id)[*(id *)(a1 + 1152) startObserving:a1 keyPath:@"playerController.contentDimensions" observationHandler:&__block_literal_global_290];

      unsigned int v6 = v24;
    }
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_8(uint64_t a1, id *a2)
{
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  uint64_t v5 = [a4 oldValue];
  int v6 = [v5 BOOLValue];

  int v7 = [v9 playerController];
  char v8 = [v7 coordinatedPlaybackActive];

  if (v9 && v6 && (v8 & 1) == 0)
  {
    [(id)objc_opt_class() autoHideInterval];
    objc_msgSend(v9, "flashControlsWithDuration:");
  }
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  if (v5)
  {
    id v2 = [v5[148] playbackControlsView];
    id v3 = [v5 playerController];
    int v4 = [v3 isAtLiveEdge];

    [v2 setBackwardSecondaryControlEnabled:1];
    [v2 setForwardSecondaryControlEnabled:v4 ^ 1u];
  }
  -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](v5);
  -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](v5);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v5);
  -[AVMobileChromelessControlsViewController _updateContentTag](v5);
}

- (void)_updateJumpToLiveControlInclusionStateIfNeeded
{
  if (a1)
  {
    id v3 = [a1 playerController];
    if ([v3 hasSeekableLiveStreamingContent]) {
      uint64_t v2 = [v3 isAtLiveEdge] ^ 1;
    }
    else {
      uint64_t v2 = 0;
    }
    [a1[155] setIncluded:v2];
  }
}

- (void)_updateSliderMarkForLiveEdgeIfNeeded
{
  if (a1)
  {
    uint64_t v2 = [a1 playerController];
    if ([v2 hasSeekableLiveStreamingContent]
      && ([v2 isAtLiveEdge] & 1) == 0)
    {
      id obja = a1[203];
      int v4 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)a1);
      [v4 maximumValue];
      float v6 = v5;

      if (!obja || ([obja startValue], id v3 = obja, vabds_f32(*(float *)&v7, v6) >= 0.00000011921))
      {
        *(float *)&double v7 = v6;
        uint64_t v8 = +[AVMobileSliderMark liveEdgeMarkAtValue:v7];

        id v3 = (id)v8;
      }
    }
    else
    {
      id v3 = 0;
    }
    obuint64_t j = v3;
    if (a1[203] != v3)
    {
      objc_storeStrong(a1 + 203, v3);
      -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](a1);
    }
  }
}

- (void)_updateTimelineViewSliderMarksIfNeeded
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    id v3 = [v1 playerController];
    id v56 = v3;
    if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
    {
      id v4 = v2;
      float v5 = [v1 playerController];
      float v6 = [v5 interstitialController];
      double v7 = [v6 currentInterstitialTimeRange];

      if (!v7)
      {
        obuint64_t j = v2;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        uint64_t v8 = [v5 player];
        id v9 = [v8 currentItem];
        id v10 = [v9 interstitialTimeRanges];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v68 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(id *)(*((void *)&v67 + 1) + 8 * i);
              uint64_t v16 = v15;
              if (v15)
              {
                [v15 timeRange];
              }
              else
              {
                memset(v65, 0, sizeof(v65));
                long long v64 = 0u;
              }
              *(_OWORD *)time = v64;
              *(void *)&time[16] = *(void *)&v65[0];
              double Seconds = CMTimeGetSeconds((CMTime *)time);
              *(float *)&double v18 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, Seconds);
              id v19 = +[AVMobileSliderMark interstitialMarkAtValue:v18];

              [v4 addObject:v19];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v71 count:16];
          }
          while (v12);
        }

        uint64_t v2 = obj;
      }
      if ([v5 hasSeekableLiveStreamingContent] && v1[203]) {
        objc_msgSend(v4, "addObject:");
      }
    }
    id v58 = v2;
    id v20 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)v1);
    id v21 = [v1 playerController];
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      v55 = v20;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v23 = [v1 playerController];
      uint64_t v24 = [v23 photosensitivityRegions];

      id obja = v24;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v68;
        uint64_t v57 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v68 != v27) {
              objc_enumerationMutation(obja);
            }
            id v29 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            [v29 risk];
            if (v30 >= 0.5)
            {
              uint64_t v31 = [v29 colors];
              if (v29)
              {
                [v29 timeRange];
                CMTime v66 = *(CMTime *)((char *)v65 + 8);
                double v32 = CMTimeGetSeconds(&v66);
                [v29 timeRange];
              }
              else
              {
                memset(v65, 0, sizeof(v65));
                long long v64 = 0u;
                *(_OWORD *)&v66.value = *(_OWORD *)((char *)v65 + 8);
                v66.epoch = 0;
                double v32 = CMTimeGetSeconds(&v66);
                memset(time, 0, sizeof(time));
                long long v62 = 0u;
              }
              CMTime v63 = *(CMTime *)time;
              double v33 = CMTimeGetSeconds(&v63);
              float v34 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, v33);
              float v35 = -[AVMobileChromelessControlsViewController _normalizeTimeValue:]((uint64_t)v1, v32 + v33);
              uint64_t v36 = (void *)MEMORY[0x1E4FB1618];
              uint64_t v37 = [v31 objectAtIndexedSubscript:0];
              [v37 doubleValue];
              double v39 = v38;
              uint64_t v40 = [v31 objectAtIndexedSubscript:1];
              [v40 doubleValue];
              double v42 = v41;
              long long v43 = [v31 objectAtIndexedSubscript:2];
              [v43 doubleValue];
              double v45 = v44;
              [v31 objectAtIndexedSubscript:3];
              v47 = long long v46 = v1;
              [v47 doubleValue];
              double v49 = [v36 colorWithRed:v39 green:v42 blue:v45 alpha:v48];

              double v50 = [AVMobileSliderMark alloc];
              *(float *)&double v51 = v34;
              *(float *)&double v52 = v35;
              v53 = [(AVMobileSliderMark *)v50 initWithStartValue:v49 endValue:v49 filledColor:2 unfilledColor:v51 markWithType:v52];
              [v58 addObject:v53];

              uint64_t v1 = v46;
              uint64_t v27 = v57;
            }
          }
          uint64_t v26 = [obja countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v26);
      }

      id v20 = v55;
      [v55 setSliderMarks:v58];
      id v3 = v56;
    }

    id v54 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)v1);
    [v54 setSliderMarks:v58];
  }
}

- (float)_normalizeTimeValue:(uint64_t)a1
{
  id v3 = *(void **)(a1 + 1416);
  float v4 = 0.0;
  if (v3)
  {
    [v3 minTime];
    double v7 = v6;
    [*(id *)(a1 + 1416) maxTime];
    if (fabs(v7) != INFINITY && fabs(v8) != INFINITY)
    {
      float v9 = v8 - v7;
      if (v9 > 0.0) {
        return (a2 - v7) / v9;
      }
    }
  }
  return v4;
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_5(uint64_t a1, id *a2)
{
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_4(uint64_t a1, void *a2)
{
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  float v5 = [a4 object];
  double v6 = [v5 interstitialPlayer];
  double v7 = [v10 playerController];
  double v8 = [v7 interstitialController];
  float v9 = [v8 interstitialPlayer];

  if (v6 == v9)
  {
    -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)v10);
    -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](v10);
  }
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke_2(uint64_t a1, void *a2)
{
}

void __75__AVMobileChromelessControlsViewController__webKitExcludedObservationSetup__block_invoke(uint64_t a1, id *a2)
{
}

void __71__AVMobileChromelessControlsViewController__updateLoadingAnimatorState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState]();
}

- (void)_animateSliderToTintState:(void *)a3 duration:(double)a4 completionHandler:
{
  id v7 = a3;
  double v8 = *(void **)(a1 + 1480);
  if (v8
    && [v8 isRunning]
    && [*(id *)(a1 + 1480) isInterruptible])
  {
    [*(id *)(a1 + 1480) stopAnimation:1];
    [*(id *)(a1 + 1480) finishAnimationAtPosition:2];
    float v9 = *(void **)(a1 + 1480);
    *(void *)(a1 + 1480) = 0;
  }
  id v10 = [*(id *)(a1 + 1184) timelineView];
  objc_initWeak(&location, v10);

  id v11 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke;
  v20[3] = &unk_1E5FC41D0;
  objc_copyWeak(v21, &location);
  v21[1] = a2;
  uint64_t v12 = [v11 initWithDuration:3 curve:v20 animations:a4];
  uint64_t v13 = *(void **)(a1 + 1480);
  *(void *)(a1 + 1480) = v12;

  if (v7)
  {
    uint64_t v14 = *(void **)(a1 + 1480);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_2;
    double v18 = &unk_1E5FC3A38;
    id v19 = v7;
    [v14 addCompletion:&v15];
  }
  objc_msgSend(*(id *)(a1 + 1480), "startAnimation", v15, v16, v17, v18);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained slider];
  [v2 setTintState:*(void *)(a1 + 40)];
}

void __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_3;
  block[3] = &unk_1E5FC41A8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __97__AVMobileChromelessControlsViewController__animateSliderToTintState_duration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = [v3 action];
  float v5 = [v3 title];
  double v6 = [v3 image];
  id v7 = [v3 identifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke_2;
  v15[3] = &unk_1E5FC3AB0;
  id v16 = v4;
  id v8 = v4;
  float v9 = +[AVAction actionWithTitle:v5 image:v6 identifier:v7 handler:v15];

  id v10 = [v3 accessibilityLabel];
  [v9 setAccessibilityLabel:v10];

  id v11 = [v3 accessibilityHint];
  [v9 setAccessibilityHint:v11];

  uint64_t v12 = [v3 accessibilityIdentifier];
  [v9 setAccessibilityIdentifier:v12];

  uint64_t v13 = [v3 tintColor];
  [v9 setTintColor:v13];

  uint64_t v14 = [v3 menu];

  [v9 setContextMenu:v14];
  [*(id *)(a1 + 32) addObject:v9];
}

uint64_t __85__AVMobileChromelessControlsViewController__updateDisplayModeControlsForControlItems__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)v2, 1);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](v2, 0);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewAllowsVolumeAdjustmentState](v2);
  -[AVMobileChromelessControlsViewController _updateDisplayModeControlsButtonsInclusion](v2);
  -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState](v2);
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateTimelineValues]((uint64_t)v2);
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_23(uint64_t a1, uint64_t a2)
{
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);
  [v2 _timelineSliderTrackingStateDidChange];
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState]((uint64_t)v2);
  -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionMenu](v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_20(uint64_t a1, void *a2)
{
}

uint64_t __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return -[AVMobileChromelessControlsViewController _updateAudibleMediaSelectionControlInclusionState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_18(uint64_t a1, uint64_t a2)
{
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_17(uint64_t a1, id *a2)
{
}

uint64_t __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = -[AVMobileChromelessControlsViewController _auxiliaryControlsView](v2);
  [v3 updateOverflowMenu];

  id v4 = v2[164];

  return [v4 updateContextMenu];
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_15(uint64_t a1, void *a2)
{
  id v7 = a2;
  -[AVMobileChromelessControlsViewController _updatePlayPauseButtonIcon](v7);
  id v2 = v7;
  if (v7)
  {
    id v3 = [v7 playerController];
    int v4 = [v3 coordinatedPlaybackActive];
    if (objc_msgSend(v3, "avkit_isAVPlayerControllerOrSubclass"))
    {
      if (v4)
      {
        uint64_t v5 = [v3 timeControlStatus];
        [(id)objc_opt_class() autoHideInterval];
        objc_msgSend(v7, "flashControlsWithDuration:");
        if (v5 == 1)
        {
          [v7[189] invalidate];
          id v6 = v7[189];
          v7[189] = 0;
        }
      }
    }

    id v2 = v7;
  }
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_14(uint64_t a1, id *a2)
{
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v12 = a2;
  uint64_t v5 = [a4 oldValue];
  int v6 = [v5 BOOLValue];

  id v7 = [v12 playerController];
  int v8 = [v7 isPlaying];

  float v9 = v12;
  if (*((unsigned char *)v12 + 1529)) {
    BOOL v10 = v6 == v8;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (v8)
    {
      [(id)objc_opt_class() autoHideInterval];
      objc_msgSend(v12, "flashControlsWithDuration:");
    }
    else
    {
      [v12[189] invalidate];
      id v11 = v12[189];
      v12[189] = 0;
    }
    float v9 = v12;
  }
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_12(uint64_t a1, void *a2)
{
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateLoadingAnimatorState](v2);
  -[AVMobileChromelessControlsViewController _updateContentTabsInteractionEnablementState]((id *)v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_10(uint64_t a1, void *a2)
{
  val = a2;
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes](val);
  -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState](val);
  -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](val);
  if (!val)
  {
    -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](0);
    -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](0);
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](0);
    goto LABEL_13;
  }
  id v2 = -[AVMobileChromelessControlsViewController _timelineSlider]((uint64_t)val);
  [v2 maximumValue];
  float v4 = v3;
  uint64_t v5 = [val playerController];
  int v6 = [v5 hasSeekableLiveStreamingContent];

  if (v6)
  {
    if (-[AVMobileChromelessControlsViewController _isLandscape]((uint64_t)val)) {
      double v8 = 0.015;
    }
    else {
      double v8 = 0.033;
    }
    [v2 maximumValue];
    double v10 = v9;
    [v2 maximumValue];
    double v7 = v11 + v10 * v8;
    float v4 = v7;
  }
  *(float *)&double v7 = v4;
  [v2 setTotalValue:v7];

  -[AVMobileChromelessControlsViewController _updateSliderMarkForLiveEdgeIfNeeded](val);
  -[AVMobileChromelessControlsViewController _updateTimelineViewSliderMarksIfNeeded](val);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)val);
  uint64_t v12 = [val playerController];
  int v13 = [v12 hasSeekableLiveStreamingContent];

  uint64_t v14 = val;
  if (!val[155])
  {
    int v15 = val[148] ? v13 : 0;
    if (v15 == 1)
    {
      uint64_t v16 = +[AVButton buttonWithAccessibilityIdentifier:@"Jump to Live" isSecondGeneration:1];
      id v17 = val[161];
      val[161] = (id)v16;

      [val[161] setAccessibilityIdentifier:@"Jump to Live"];
      id v18 = val[161];
      id v19 = AVLocalizedString(@"Jump to Live");
      [v18 setAccessibilityLabel:v19];

      [val[161] addTarget:val action:sel__handleJumpToLiveAction forControlEvents:64];
      [val[161] setImageName:@"forward.end.fill.tv"];
      -[AVMobileChromelessControlsViewController _configureAuxiliaryControlButton:](val, val[161]);
      uint64_t v20 = +[AVMobileAuxiliaryControl controlWithView:val[161] displayPriority:0 identifier:@"AVJumpToLiveControl"];
      id v21 = val[155];
      val[155] = (id)v20;

      [val[155] setIncluded:1];
      objc_initWeak(&location, val);
      char v22 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v23 = AVLocalizedString(@"OVERFLOW_MENU_JUMP_TO_LIVE");
      uint64_t v24 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v25 = AVBundle();
      uint64_t v26 = [v24 imageNamed:@"forward.end.fill.tv" inBundle:v25];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __75__AVMobileChromelessControlsViewController__setUpJumpToLiveControlIfNeeded__block_invoke;
      v30[3] = &unk_1E5FC3A10;
      objc_copyWeak(&v31, &location);
      uint64_t v27 = [v22 actionWithTitle:v23 image:v26 identifier:0 handler:v30];
      id v28 = val[165];
      val[165] = (id)v27;

      -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](val);
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)val);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
LABEL_13:
      uint64_t v14 = val;
    }
  }
  -[AVMobileChromelessControlsViewController _updateJumpToLiveControlInclusionStateIfNeeded](v14);
}

- (void)_configureAuxiliaryControlButton:(void *)a1
{
  float v3 = (void *)a1[147];
  id v4 = a2;
  uint64_t v5 = [v3 buttonFont];
  [v4 setInlineFont:v5];

  int v6 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v7 = [v4 isButtonOverVideo];
  id v9 = [a1 traitCollection];
  double v8 = objc_msgSend(v6, "avkit_tintColorForControlElementIsOverVideo:withUserInterfaceStyle:", v7, objc_msgSend(v9, "userInterfaceStyle"));
  [v4 setTintColor:v8];
}

void __75__AVMobileChromelessControlsViewController__setUpJumpToLiveControlIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleJumpToLiveAction];
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateContentTag](v2);
  -[AVMobileChromelessControlsViewController _updateSecondaryPlaybackControlsTypes](v2);
  -[AVMobileChromelessControlsViewController _updatePlaybackControlsViewInclusionState](v2);
  -[AVMobileChromelessControlsViewController _updatePlaybackSpeedControlInclusion](v2);
  -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_8(uint64_t a1, uint64_t a2)
{
}

id *__61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_7(uint64_t a1, id *a2)
{
  return -[AVMobileChromelessControlsViewController _updateRoutePickerControlInclusionState](a2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](v2, 1u);
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewMutedState](v2);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  val = a2;
  id v5 = a4;
  int v6 = [v5 object];
  uint64_t v7 = [val volumeController];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [v5 userInfo];
    double v10 = [v9 objectForKeyedSubscript:@"AVVolumeControllerVolumeDidChangeNotificationShowHUDKey"];

    if (v10) {
      int v11 = [v10 BOOLValue];
    }
    else {
      int v11 = 1;
    }
    if (val)
    {
      uint64_t v12 = [val[148] volumeControlsView];
      int v13 = [val playerController];
      if (v11)
      {
        uint64_t v14 = [val[148] volumeControlsView];
        -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](val, 1);
        [val[174] invalidate];
        id v15 = val[174];
        val[174] = 0;

        if (([v14 isTracking] & 1) == 0)
        {
          objc_initWeak(&location, val);
          uint64_t v16 = (void *)MEMORY[0x1E4F1CB00];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __106__AVMobileChromelessControlsViewController__animateVolumeControlsToEmphasizedWithTransformToIdentityDelay__block_invoke;
          v20[3] = &unk_1E5FC4480;
          objc_copyWeak(&v21, &location);
          uint64_t v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:v20 block:3.0];
          id v18 = val[174];
          val[174] = (id)v17;

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }

        if ([v13 isMuted])
        {
          [v13 setMuted:0];
          [v12 setMute:0];
        }
        -[AVMobileChromelessControlsViewController _temporarilyShowVolumeSlider]((uint64_t)val);
      }
      -[AVMobileChromelessControlsViewController _updateVolumeControlsViewVolumeWithMuteStateUpdate:](val, 0);
    }
  }
}

void __106__AVMobileChromelessControlsViewController__animateVolumeControlsToEmphasizedWithTransformToIdentityDelay__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMobileChromelessControlsViewController _animateVolumeEmphasisTo:](WeakRetained, 0);

  id v3 = objc_loadWeakRetained(v1);
  -[AVMobileChromelessControlsViewController _resetVolumeControlsEmphasisDelayTimer]((uint64_t)v3);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  double v10 = a2;
  id v5 = [a4 oldValue];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [v10 pipController];
  int v8 = [v7 isPictureInPictureActive];

  int v9 = v6 ^ v8;
  if ((v6 & 1) != 0 || !v9) {
    -[AVMobileChromelessControlsViewController _updateLayoutMargins](v10);
  }
  else {
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)v10, 0, 0);
  }
  if ((v6 & v9) == 1)
  {
    -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)v10);
    -[AVMobileChromelessControlsViewController _updateAuxiliaryControlSpacing]((id *)v10);
  }
  -[AVMobileChromelessControlsViewController _updatePrefersSystemVolumeHUDHidden](v10);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_3(uint64_t a1, id *a2)
{
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  -[AVMobileChromelessControlsViewController _updateVolumeControlsViewAllowsVolumeAdjustmentState](v2);
  -[AVMobileChromelessControlsViewController _updatePrefersVolumeSliderIncludedAnimated:]((uint64_t)v2, 0);
}

void __61__AVMobileChromelessControlsViewController__observationSetup__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    id v20 = [a4 userInfo];
    id v5 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
    [v5 CGRectValue];
    double v7 = v6;

    int v8 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FB2C10]];
    char v9 = [v8 BOOLValue];

    double v10 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA0]];
    uint64_t v11 = [v10 longValue];

    uint64_t v12 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA8]];
    [v12 doubleValue];
    double v14 = v13;

    if (*(double *)(a2 + 1352) != v7)
    {
      *(double *)(a2 + 1352) = v7;
      -[AVMobileChromelessControlsViewController _updateLayoutMargins]((void *)a2);
      if ((v9 & 1) == 0)
      {
        id v15 = [*(id *)(a2 + 1184) window];

        if (v15)
        {
          id v16 = *(id *)(a2 + 1360);
          if ([v16 isRunning] && objc_msgSend(v16, "isInterruptible"))
          {
            [v16 stopAnimation:0];
            [v16 finishAnimationAtPosition:2];
          }
          objc_initWeak(&location, (id)a2);
          id v17 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          id v21[2] = __79__AVMobileChromelessControlsViewController__animateKeyboardAvoidance_duration___block_invoke;
          v21[3] = &unk_1E5FC44F8;
          objc_copyWeak(&v22, &location);
          id v18 = (void *)[v17 initWithDuration:v11 curve:v21 animations:v14];
          [v18 startAnimation];
          id v19 = *(void **)(a2 + 1360);
          *(void *)(a2 + 1360) = v18;

          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

void __79__AVMobileChromelessControlsViewController__animateKeyboardAvoidance_duration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained viewIfLoaded];

  [v2 setNeedsLayout];
  [v2 layoutIfNeeded];
}

- (void)_setUpAuxiliaryControlsViewIfNeeded
{
  id v2 = *(void **)(a1 + 1184);
  if (v2)
  {
    id v3 = [v2 auxiliaryControlsView];

    if (!v3)
    {
      double v6 = objc_alloc_init(AVMobileAuxiliaryControlsView);
      [(AVMobileAuxiliaryControlsView *)v6 setAutoresizingMask:0];
      [(AVMobileAuxiliaryControlsView *)v6 setDelegate:a1];
      [(AVView *)v6 setAutomaticallyUpdatesSubviewContentIntersections:1];
      int v4 = [(id)a1 prefersFullScreenStyleForEmbeddedMode];
      double v5 = 0.0;
      if (v4) {
        double v5 = *(double *)(a1 + 1752);
      }
      [(AVMobileAuxiliaryControlsView *)v6 setAvkit_extendedDynamicRangeGain:v5];
      [*(id *)(a1 + 1184) setAuxiliaryControlsView:v6];
    }
  }
}

- (void)_setUpAnalysisControlIfNeeded
{
  if (val && *((void *)val + 148) && !*((void *)val + 156))
  {
    if (*((unsigned char *)val + 1729))
    {
      objc_initWeak(&location, val);
      id v2 = (void *)MEMORY[0x1E4FB13F0];
      id v3 = AVLocalizedString(@"OVERFLOW_MENU_LIVE_TEXT_TITLE");
      int v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"text.viewfinder"];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v11 = __73__AVMobileChromelessControlsViewController__setUpAnalysisControlIfNeeded__block_invoke;
      uint64_t v12 = &unk_1E5FC3A10;
      objc_copyWeak(&v13, &location);
      uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v9];
      double v6 = (void *)*((void *)val + 166);
      *((void *)val + 166) = v5;

      uint64_t v7 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0, @"AVAnalysisControl", v9, v10, v11, v12 identifier];
      int v8 = (void *)*((void *)val + 156);
      *((void *)val + 156) = v7;

      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setUpCopySubjectControlIfNeeded
{
  if (val && *((void *)val + 148) && !*((void *)val + 157))
  {
    objc_initWeak(&location, val);
    id v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = AVLocalizedString(@"OVERFLOW_MENU_COPY_SUBJECT");
    int v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle.dashed.rectangle"];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __76__AVMobileChromelessControlsViewController__setUpCopySubjectControlIfNeeded__block_invoke;
    uint64_t v12 = &unk_1E5FC3A10;
    objc_copyWeak(&v13, &location);
    uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v9];
    double v6 = (void *)*((void *)val + 167);
    *((void *)val + 167) = v5;

    uint64_t v7 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0, @"AVAnalysisCopySubjectControl", v9, v10, v11, v12 identifier];
    int v8 = (void *)*((void *)val + 157);
    *((void *)val + 157) = v7;

    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_setUpVisualLookupControlIfNeeded
{
  if (val && *((void *)val + 148) && !*((void *)val + 158))
  {
    objc_initWeak(&location, val);
    id v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = AVLocalizedString(@"OVERFLOW_MENU_VISUAL_LOOKUP");
    int v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"info.circle.and.sparkles"];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __77__AVMobileChromelessControlsViewController__setUpVisualLookupControlIfNeeded__block_invoke;
    uint64_t v12 = &unk_1E5FC3A10;
    objc_copyWeak(&v13, &location);
    uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v9];
    double v6 = (void *)*((void *)val + 168);
    *((void *)val + 168) = v5;

    uint64_t v7 = +[AVMobileAuxiliaryControl controlWithDisplayPriority:0, @"AVAnalysisVisualLookupControl", v9, v10, v11, v12 identifier];
    int v8 = (void *)*((void *)val + 158);
    *((void *)val + 158) = v7;

    -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)val);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __62__AVMobileChromelessControlsViewController__loadControlsViews__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 controlsViewControllerDidUpdateLayoutGuides:v3];
}

void __77__AVMobileChromelessControlsViewController__setUpVisualLookupControlIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained eventManager];
  [v1 sendActionsForEvent:@"AVChromelessControlsVisualLookupMenuItemPressedEvent"];
}

void __76__AVMobileChromelessControlsViewController__setUpCopySubjectControlIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained eventManager];
  [v1 sendActionsForEvent:@"AVChromelessControlsCopySubjectMenuItemPressedEvent"];
}

void __73__AVMobileChromelessControlsViewController__setUpAnalysisControlIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [WeakRetained delegate];
    char v2 = objc_opt_respondsToSelector();

    if (v2)
    {
      id v3 = [WeakRetained delegate];
      [v3 chromelessControlsViewControllerDidPressLiveTextButton:WeakRetained];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileChromelessControlsViewController *)&v3 viewDidLayoutSubviews];
  if (self && !self->_needsTimeResolverUpdate)
  {
    self->_needsTimeResolverUpdate = 1;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__AVMobileChromelessControlsViewController__setNeedsTimeResolverUpdate__block_invoke;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded]((id *)&self->super.super.super.super.super.isa);
}

void __71__AVMobileChromelessControlsViewController__setNeedsTimeResolverUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1448] = 0;
    char v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _updateTimeResolver]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)loadView
{
  obuint64_t j = objc_alloc_init(AVMobileChromelessControlsView);
  [(AVMobileChromelessControlsView *)obj setDelegate:self];
  [(AVMobileChromelessControlsView *)obj setPreservesSuperviewLayoutMargins:0];
  [(AVMobileChromelessControlsView *)obj setInsetsLayoutMarginsFromSafeArea:0];
  BOOL v3 = 1;
  [(AVView *)obj setHidden:1];
  [(AVView *)obj setAutomaticallyUpdatesSubviewContentIntersections:1];
  [(AVMobileChromelessControlsViewController *)self setView:obj];
  objc_storeStrong((id *)&self->_view, obj);
  contentTabPresentationContext = self->_contentTabPresentationContext;
  if (contentTabPresentationContext) {
    BOOL v3 = [(AVMobileContentTabPresentationContext *)contentTabPresentationContext state] == 1;
  }
  [(AVView *)self->_view setIgnoresTouches:v3];
}

- (void)_hideControlsIfPossible
{
  if (a1)
  {
    *(unsigned char *)(a1 + 1529) = 0;
    *(unsigned char *)(a1 + 1368) = 0;
    -[AVMobileChromelessControlsViewController _resetVolumeSliderTemporarilyVisibleTimer](a1);
    [*(id *)(a1 + 1512) invalidate];
    char v2 = *(void **)(a1 + 1512);
    *(void *)(a1 + 1512) = 0;

    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate](a1);
  }
}

- (void)toggleVisibility:(id)a3
{
  if (self->_temporarilyVisibile)
  {
    -[AVMobileChromelessControlsViewController _hideControlsIfPossible]((uint64_t)self);
  }
  else
  {
    [(id)objc_opt_class() autoHideInterval];
    -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
  }
}

- (void)didBeginIndirectUserInteraction
{
  [(id)objc_opt_class() autoHideInterval];

  -[AVMobileChromelessControlsViewController flashControlsWithDuration:](self, "flashControlsWithDuration:");
}

- (void)flashControlsWithDuration:(double)a3
{
  if (self)
  {
    [(NSTimer *)self->_visibilityTimer invalidate];
    visibilityTimer = self->_visibilityTimer;
    self->_visibilityTimer = 0;
  }
  double v6 = [(AVMobileControlsViewController *)self pipController];
  char v7 = [v6 isPictureInPictureActive];

  if ((v7 & 1) == 0)
  {
    int v8 = [(AVMobileControlsViewController *)self playerController];
    int v9 = [v8 isPlaying];

    if (self
      && (contentTabPresentationContext = self->_contentTabPresentationContext) != 0
      && [(AVMobileContentTabPresentationContext *)contentTabPresentationContext state] != 1)
    {
      BOOL v11 = [(AVMobileContentTabPresentationContext *)self->_contentTabPresentationContext contentTabsLayout] == 0;
      if (!v9)
      {
LABEL_12:
        self->_temporarilyVisibile = 1;
        -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)self);
        return;
      }
    }
    else
    {
      BOOL v11 = 0;
      if (!v9) {
        goto LABEL_12;
      }
    }
    if (!v11)
    {
      objc_initWeak(&location, self);
      uint64_t v12 = (void *)MEMORY[0x1E4F1CB00];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__AVMobileChromelessControlsViewController_flashControlsWithDuration___block_invoke;
      v15[3] = &unk_1E5FC4480;
      objc_copyWeak(&v16, &location);
      id v13 = [v12 scheduledTimerWithTimeInterval:0 repeats:v15 block:a3];
      double v14 = self->_visibilityTimer;
      self->_visibilityTimer = v13;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    goto LABEL_12;
  }
}

void __70__AVMobileChromelessControlsViewController_flashControlsWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1529] = 0;
    char v2 = WeakRetained;
    -[AVMobileChromelessControlsViewController _setNeedsControlsVisibilityStateUpdate]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)dismissCustomInfoViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_contentTabPresentationContext;
  uint64_t v10 = v5;
  if (v5)
  {
    BOOL v6 = [(AVMobileContentTabPresentationContext *)v5 state] == 0;
    id v5 = v10;
    int v7 = v6;
  }
  else
  {
    int v7 = 0;
  }
  if ([(AVMobileContentTabPresentationContext *)v5 state] == 2)
  {
    int v8 = [(AVMobileContentTabPresentationContext *)v10 transitionContext];
    BOOL v9 = [v8 direction] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if ((v7 | v9) == 1) {
    -[AVMobileChromelessControlsViewController _setContentTabPresented:animated:]((uint64_t)self, 0, v3);
  }
}

- (void)_updateExtendedDynamicRangeGain
{
  if (a1)
  {
    double v2 = 0.0;
    if ([(id)a1 prefersFullScreenStyleForEmbeddedMode]) {
      double v2 = *(double *)(a1 + 1752);
    }
    id v5 = [*(id *)(a1 + 1184) timelineView];
    [v5 setLabelsExtendedDynamicRangeGain:v2];
    [v5 setSliderExtendedDynamicRangeGain:v2];
    BOOL v3 = [*(id *)(a1 + 1184) playbackControlsView];
    objc_msgSend(v3, "setAvkit_extendedDynamicRangeGain:", v2);
    int v4 = [*(id *)(a1 + 1184) auxiliaryControlsView];
    objc_msgSend(v4, "setAvkit_extendedDynamicRangeGain:", v2);
  }
}

- (void)setExtendedDynamicRangeGain:(double)a3
{
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    -[AVMobileChromelessControlsViewController _updateExtendedDynamicRangeGain]((uint64_t)self);
  }
}

- (UIPanGestureRecognizer)contentTabPanGestureRecognizer
{
  -[AVMobileChromelessControlsViewController _setUpPanGestureRecognizerIfNeeded](self);
  contentTabPanGestureRecognizer = self->_contentTabPanGestureRecognizer;

  return contentTabPanGestureRecognizer;
}

- (id)volumeControlsLayoutItem
{
  if (self)
  {
    uint64_t v3 = [(AVMobileChromelessControlsView *)self->_view volumeControlsView];
    int v4 = (void *)v3;
    if (self->_view) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5 && ![(AVMobileControlsViewController *)self optimizeForPerformance])
    {
      BOOL v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      volumeControlsLayoutGuide = self->_volumeControlsLayoutGuide;
      self->_volumeControlsLayoutGuide = v6;

      [(AVMobileChromelessControlsView *)self->_view addLayoutGuide:self->_volumeControlsLayoutGuide];
      int v8 = [(UILayoutGuide *)self->_volumeControlsLayoutGuide avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:v4];
      [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    }
  }
  BOOL v9 = self->_volumeControlsLayoutGuide;

  return v9;
}

- (unint64_t)visibleControls
{
  return self->_currentVisibilityState.visibleControls;
}

- (id)transportControlsLayoutItem
{
  v44[3] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v3 = [(AVMobileChromelessControlsView *)self->_view auxiliaryControlsView];
    int v4 = [(AVMobileChromelessControlsView *)self->_view timelineView];
    uint64_t v5 = [(AVMobileChromelessControlsView *)self->_view titlebarView];
    BOOL v6 = (void *)v5;
    if (self->_view) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v9 = v7 || v3 == 0 || v5 == 0;
    if (!v9 && ![(AVMobileControlsViewController *)self optimizeForPerformance])
    {
      uint64_t v10 = [(AVMobileChromelessControlsView *)self->_view layoutMarginsGuide];
      BOOL v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      transportControlsLayoutGuide = self->_transportControlsLayoutGuide;
      self->_transportControlsLayoutGuide = v11;

      [(AVMobileChromelessControlsView *)self->_view addLayoutGuide:self->_transportControlsLayoutGuide];
      id v13 = [(UILayoutGuide *)self->_transportControlsLayoutGuide topAnchor];
      double v14 = [v6 topAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14];
      titlebarViewTopAnchorConstraint = self->_titlebarViewTopAnchorConstraint;
      self->_titlebarViewTopAnchorConstraint = v15;

      id v17 = [(UILayoutGuide *)self->_transportControlsLayoutGuide topAnchor];
      id v18 = [v4 topAnchor];
      id v19 = [v17 constraintEqualToAnchor:v18];
      timelineTopAnchorConstraint = self->_timelineTopAnchorConstraint;
      self->_timelineTopAnchorConstraint = v19;

      id v21 = [(UILayoutGuide *)self->_transportControlsLayoutGuide topAnchor];
      id v22 = [v3 topAnchor];
      uint64_t v23 = [v21 constraintEqualToAnchor:v22];
      auxiliaryControlsViewTopAnchorConstraint = self->_auxiliaryControlsViewTopAnchorConstraint;
      self->_auxiliaryControlsViewTopAnchorConstraint = v23;

      uint64_t v25 = [(UILayoutGuide *)self->_transportControlsLayoutGuide topAnchor];
      uint64_t v26 = [v10 bottomAnchor];
      uint64_t v27 = [v25 constraintEqualToAnchor:v26];
      defaultTopAnchorConstraint = self->_defaultTopAnchorConstraint;
      self->_defaultTopAnchorConstraint = v27;

      id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
      long long v43 = [(UILayoutGuide *)self->_transportControlsLayoutGuide leadingAnchor];
      double v42 = [v10 leadingAnchor];
      double v41 = [v43 constraintEqualToAnchor:v42];
      v44[0] = v41;
      double v39 = [(UILayoutGuide *)self->_transportControlsLayoutGuide trailingAnchor];
      uint64_t v40 = v10;
      double v38 = [v10 trailingAnchor];
      double v30 = [v39 constraintEqualToAnchor:v38];
      v44[1] = v30;
      id v31 = [(UILayoutGuide *)self->_transportControlsLayoutGuide bottomAnchor];
      double v32 = [v10 bottomAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32];
      v44[2] = v33;
      float v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
      float v35 = (void *)[v29 initWithArray:v34];

      [MEMORY[0x1E4F28DC8] activateConstraints:v35];
      -[AVMobileChromelessControlsViewController _updateTransportControlsLayoutGuidesConstraintsIfNeeded]((id *)&self->super.super.super.super.super.isa);
    }
  }
  uint64_t v36 = self->_transportControlsLayoutGuide;

  return v36;
}

- (void)setShowsAudioTrackSelectionMenu:(BOOL)a3
{
  if (self->_showsAudioTrackSelectionMenu != a3)
  {
    self->_showsAudioTrackSelectionMenu = a3;
    if (self->_hasBeenSetUp) {
      -[AVMobileChromelessControlsViewController _updateAuxiliaryControls]((uint64_t)self);
    }
  }
}

- (void)setShowsVisualLookupControl:(BOOL)a3
{
  if (self->_showsVisualLookupControl != a3)
  {
    self->_BOOL showsVisualLookupControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpVisualLookupControlIfNeeded](self);
      int v4 = self->_visualLookupControl;
      BOOL showsVisualLookupControl = self->_showsVisualLookupControl;
      BOOL v6 = v4;
      if (showsVisualLookupControl != [(AVMobileAuxiliaryControl *)v4 isIncluded]) {
        [(AVMobileAuxiliaryControl *)v6 setIncluded:self->_showsVisualLookupControl];
      }
    }
  }
}

- (void)setShowsCopySubjectControl:(BOOL)a3
{
  if (self->_showsCopySubjectControl != a3)
  {
    self->_BOOL showsCopySubjectControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpCopySubjectControlIfNeeded](self);
      copySubjectControl = self->_copySubjectControl;
      if (copySubjectControl)
      {
        BOOL showsCopySubjectControl = self->_showsCopySubjectControl;
        [(AVMobileAuxiliaryControl *)copySubjectControl setIncluded:showsCopySubjectControl];
      }
    }
  }
}

- (void)setShowsAnalysisControl:(BOOL)a3
{
  if (self->_showsAnalysisControl != a3)
  {
    self->_showsAnalysisControl = a3;
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _setUpAnalysisControlIfNeeded](self);
      -[AVMobileChromelessControlsViewController _updateAnalysisControlInclusionIfNeeded]((uint64_t)self);
      -[AVMobileChromelessControlsViewController _updatePinnedAuxiliaryControlsIfNeeded]((uint64_t)self);
    }
  }
}

- (id)_displayModeControlsView
{
  if (a1)
  {
    a1 = [a1[148] displayModeControlsView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)displayModeControlsLayoutItem
{
  if (self)
  {
    uint64_t v3 = [(AVMobileChromelessControlsView *)self->_view displayModeControlsView];
    int v4 = (void *)v3;
    if (self->_view) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5 && ![(AVMobileControlsViewController *)self optimizeForPerformance])
    {
      BOOL v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
      displayModeControlsLayoutGuide = self->_displayModeControlsLayoutGuide;
      self->_displayModeControlsLayoutGuide = v6;

      [(AVMobileChromelessControlsView *)self->_view addLayoutGuide:self->_displayModeControlsLayoutGuide];
      int v8 = [(UILayoutGuide *)self->_displayModeControlsLayoutGuide avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:v4];
      [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    }
  }
  BOOL v9 = self->_displayModeControlsLayoutGuide;

  return v9;
}

- (CGRect)unobscuredContentArea
{
  CGFloat v3 = *MEMORY[0x1E4F1DB28];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  BOOL v7 = -[AVMobileChromelessControlsViewController _volumeControlsView]((id *)&self->super.super.super.super.super.isa);
  [v7 frame];
  v41.origin.CGFloat x = v8;
  v41.origin.CGFloat y = v9;
  v41.size.CGFloat width = v10;
  v41.size.CGFloat height = v11;
  v35.origin.CGFloat x = v3;
  v35.origin.CGFloat y = v4;
  v35.size.CGFloat width = v5;
  v35.size.CGFloat height = v6;
  CGRect v36 = CGRectUnion(v35, v41);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;

  id v16 = -[AVMobileChromelessControlsViewController _displayModeControlsView]((id *)&self->super.super.super.super.super.isa);
  [v16 frame];
  v42.origin.CGFloat x = v17;
  v42.origin.CGFloat y = v18;
  v42.size.CGFloat width = v19;
  v42.size.CGFloat height = v20;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGRect v38 = CGRectUnion(v37, v42);
  CGFloat v21 = v38.origin.x;
  CGFloat v22 = v38.origin.y;
  CGFloat v23 = v38.size.width;
  CGFloat v24 = v38.size.height;

  [(AVMobileChromelessControlsView *)self->_view bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v39.origin.CGFloat x = v21;
  v39.origin.CGFloat y = v22;
  v39.size.CGFloat width = v23;
  v39.size.CGFloat height = v24;
  double MaxY = CGRectGetMaxY(v39);
  double v32 = v30 - MaxY;
  double v33 = v26;
  double v34 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = MaxY;
  result.origin.CGFloat x = v33;
  return result;
}

- (void)setCustomInfoViewControllers:(id)a3
{
  CGFloat v5 = (NSArray *)a3;
  if (self->_customInfoViewControllers != v5)
  {
    objc_storeStrong((id *)&self->_customInfoViewControllers, a3);
    if (self->_hasBeenSetUp)
    {
      -[AVMobileChromelessControlsViewController _updateContentTabViewControllers]((uint64_t)self);
      -[AVMobileChromelessControlsViewController _updateControlsViewLayoutConfiguration]((uint64_t)self);
    }
  }
}

- (void)dealloc
{
  if (self->_styleSheet)
  {
    CGFloat v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];
  }
  [(AVObservationController *)self->_observationController stopAllObservation];
  CGFloat v4 = [(AVMobileControlsViewController *)self volumeController];
  [v4 setPrefersSystemVolumeHUDHidden:0];

  CGFloat v5 = [(AVMobileControlsViewController *)self volumeController];
  [v5 setClientWithIdentifier:0 forWindowSceneSessionWithIdentifier:0];

  -[AVMobileChromelessControlsViewController _cancelOutstandVisibilityUpdates]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewController;
  [(AVMobileChromelessControlsViewController *)&v6 dealloc];
}

uint64_t __48__AVMobileChromelessControlsViewController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateTintColorsForAuxiliaryControlButtons];
}

@end