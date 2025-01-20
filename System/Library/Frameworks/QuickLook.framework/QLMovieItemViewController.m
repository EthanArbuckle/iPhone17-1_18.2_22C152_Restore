@interface QLMovieItemViewController
- (AVEditBehavior)editBehavior;
- (AVPlayerViewController)playerViewController;
- (BOOL)_enterEditModeIfPossible;
- (BOOL)_isInteractingWithAnalysis;
- (BOOL)_videoIsPlaying;
- (BOOL)assetCanBeRotated;
- (BOOL)canEnterFullScreen;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)canPinchToDismiss;
- (BOOL)canSwipeToDismiss;
- (BOOL)canToggleFullScreen;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isEditing;
- (BOOL)isSavingEditsBeforeDismissing;
- (BOOL)play;
- (BOOL)shouldAllowEditingContents;
- (BOOL)shouldDisplayPlayButtonInNavigationBar;
- (BOOL)shouldHandleRegisteringForCommandCenterHandlers;
- (BOOL)supportsChromeless;
- (NSLayoutConstraint)bottomScrubberConstraint;
- (NSNumber)assetIsHDR;
- (NSNumber)assetIsProRes;
- (PHPlaceholderView)airPlayPlaceholderView;
- (PXUIAssetBadgeView)assetBadgeView;
- (QLMovieEdits)edits;
- (QLMovieEdits)editsSinceLastSave;
- (QLMovieItemViewController)init;
- (QLOverlayPlayButton)playButton;
- (QLVideoScrubberView)scrubber;
- (UIScrollView)playerViewControllerScrollView;
- (UIScrollView)scrubberContainerScrollView;
- (UIView)playerViewContainer;
- (UIView)scrubberContainer;
- (double)scrubberVerticalOffset;
- (id)_metadataItemTitle;
- (id)accessoryView;
- (id)editBehaviorAlertActionsForDoneButtonTap:(id)a3;
- (id)editProgressIndicatorMessage;
- (id)imageAnalysisToolbarButton;
- (id)lookupAction;
- (id)registeredKeyCommands;
- (id)scrollView;
- (id)scrollViewInView:(id)a3;
- (id)setupPlayerViewWithPlayer:(id)a3;
- (id)timeLabelScrollView;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (id)transitioningView;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)_addAssetBadgeViewToHierarchyIfNeeded:(id)a3;
- (void)_displayAssetBadgeView:(id)a3;
- (void)_enterEditMode;
- (void)_exitEditMode:(BOOL)a3;
- (void)_hideAssetBadgeViewAfterDelayIfNeeded:(double)a3;
- (void)_hideAssetBadgeViewIfVisible;
- (void)_lookupButtonTapped;
- (void)_resetTrimmingValues;
- (void)_rotateIfPossible;
- (void)_rotateMovieRight;
- (void)_saveMovieIfEdited:(BOOL)a3 forceSaving:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_saveMovieIfEdited:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_saveMovieIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5;
- (void)_setupEditBehavior;
- (void)_setupScrubberPlaceholderThumbnail;
- (void)_setupWithCompletionHandler:(id)a3;
- (void)_showAssetBadgeView:(id)a3;
- (void)_showAssetBadgeViewIfNeeded;
- (void)_showBadge;
- (void)_showFailedToSaveChangesAlertWithError:(id)a3;
- (void)_stopLookupIfNeeded;
- (void)_updateAssetBadgeViewVisibilityForFullscreenMode:(BOOL)a3;
- (void)_updateAssetBadgeViewVisibilityWithNewPlayingStatus:(int64_t)a3;
- (void)_updateEditMode;
- (void)_updateEditsTrimmingValuesWithTrimStartTime:(double)a3 trimEndTime:(double)a4;
- (void)_updateInterfaceAfterExitingEditMode;
- (void)_updatePlaceHolderView;
- (void)_updatePlayButtonVisibility;
- (void)addScrubberIfNeeded;
- (void)addScrubberIfNeededWithDeferral;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didChangePlayingStatus;
- (void)editBehaviorDidCancel:(id)a3;
- (void)handlePerformedKeyCommandIfNeeded:(id)a3;
- (void)hostApplicationDidEnterBackground:(id)a3;
- (void)loadAssetMetadata;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerWillPerformAnalysisCalloutAction:(id)a3;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setAssetBadgeView:(id)a3;
- (void)setAssetCanBeRotated:(BOOL)a3;
- (void)setAssetIsHDR:(id)a3;
- (void)setAssetIsProRes:(id)a3;
- (void)setBottomScrubberConstraint:(id)a3;
- (void)setEditBehavior:(id)a3;
- (void)setEdits:(id)a3;
- (void)setEditsSinceLastSave:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsSavingEditsBeforeDismissing:(BOOL)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPlayerViewContainer:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setPlayerViewControllerScrollView:(id)a3;
- (void)setScrubber:(id)a3;
- (void)setScrubberContainer:(id)a3;
- (void)setScrubberContainerScrollView:(id)a3;
- (void)setScrubberVerticalOffset:(double)a3;
- (void)showTimeLabelIfNeeded;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)updateInterfaceAfterSavingEdits;
- (void)updateInterfaceForSavingEdits;
@end

@implementation QLMovieItemViewController

- (QLMovieItemViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)QLMovieItemViewController;
  v2 = [(QLScrollableContentItemViewController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    editsSinceLastSave = v2->_editsSinceLastSave;
    v2->_editsSinceLastSave = (QLMovieEdits *)v3;

    uint64_t v5 = objc_opt_new();
    edits = v2->_edits;
    v2->_edits = (QLMovieEdits *)v5;
  }
  return v2;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(QLScrollableContentItemViewController *)self setShouldFit:1];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__QLMovieItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v13[3] = &unk_2642F59E0;
  id v11 = v10;
  id v14 = v11;
  objc_copyWeak(&v15, &location);
  v12.receiver = self;
  v12.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v12 loadPreviewControllerWithContents:v8 context:v9 completionHandler:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __89__QLMovieItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      [v8 _setupWithCompletionHandler:*(void *)(a1 + 32)];
    }
    else
    {
      id v9 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        id v10 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        id v9 = *v10;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_ERROR, "Could not setup media item view controller because it has been deallocated #Media", (uint8_t *)&v11, 2u);
      }
      if (!*(void *)(a1 + 32)) {
        goto LABEL_17;
      }
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62938] code:0 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

LABEL_17:
    goto LABEL_18;
  }
  v4 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Error while attempting to load media item view controller: %@ #Media", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
LABEL_18:
}

- (void)_setupWithCompletionHandler:(id)a3
{
  id v20 = a3;
  [(QLMediaItemBaseViewController *)self imageSize];
  -[QLMovieItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(QLMovieItemViewController *)self loadAssetMetadata];
  v4 = [(QLMediaItemBaseViewController *)self player];
  [v4 addObserver:self forKeyPath:@"externalPlaybackActive" options:3 context:&QLMovieItemViewControllerContext];

  self->_isObservingPlayerExternalPlaybackActive = 1;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v5 = objc_alloc_init(QLOverlayPlayButton);
    playButton = self->_playButton;
    self->_playButton = v5;

    [(QLOverlayPlayButton *)self->_playButton setTarget:self action:sel_play];
    [(QLOverlayPlayButton *)self->_playButton setAlpha:0.0];
    [(QLOverlayPlayButton *)self->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(QLMovieItemViewController *)self view];
    [v7 addSubview:self->_playButton];

    id v8 = [(QLMovieItemViewController *)self view];
    id v9 = (void *)MEMORY[0x263F08938];
    id v10 = [(QLMovieItemViewController *)self view];
    int v11 = [v9 constraintWithItem:v10 attribute:9 relatedBy:0 toItem:self->_playButton attribute:9 multiplier:1.0 constant:0.0];
    [v8 addConstraint:v11];

    id v12 = [(QLMovieItemViewController *)self view];
    uint64_t v13 = (void *)MEMORY[0x263F08938];
    id v14 = [(QLMovieItemViewController *)self view];
    id v15 = [v13 constraintWithItem:v14 attribute:10 relatedBy:0 toItem:self->_playButton attribute:10 multiplier:1.0 constant:0.0];
    [v12 addConstraint:v15];

    v16 = objc_alloc_init(_QLMovieScrubberViewContainer);
    scrubberContainer = self->_scrubberContainer;
    self->_scrubberContainer = &v16->super;

    [(UIView *)self->_scrubberContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_scrubberContainer setUserInteractionEnabled:1];
    [(UIView *)self->_scrubberContainer setDeliversTouchesForGesturesToSuperview:0];
    [(UIView *)self->_scrubberContainer setAlpha:1.0];
  }
  v18 = [(QLMediaItemBaseViewController *)self mediaAsset];
  self->_assetCanBeRotated = objc_msgSend(v18, "ql_canBeRotated");

  [(QLMovieItemViewController *)self _setupEditBehavior];
  v19 = v20;
  if (v20)
  {
    (*((void (**)(id, void))v20 + 2))(v20, 0);
    v19 = v20;
  }
}

- (void)addScrubberIfNeededWithDeferral
{
  if ((_os_feature_enabled_impl() & 1) == 0 && !self->_scrubber)
  {
    if (self->_scrubberContainer)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v3 = dispatch_time(0, 1000000000);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __60__QLMovieItemViewController_addScrubberIfNeededWithDeferral__block_invoke;
      v4[3] = &unk_2642F5AF8;
      objc_copyWeak(&v5, &location);
      dispatch_after(v3, MEMORY[0x263EF83A0], v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __60__QLMovieItemViewController_addScrubberIfNeededWithDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained addScrubberIfNeeded];
}

- (void)addScrubberIfNeeded
{
  v47[1] = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = [(QLMovieItemViewController *)self scrubber];

  if (!v3 && self->_previewIsVisisble)
  {
    v4 = objc_opt_new();
    [(QLMovieItemViewController *)self setScrubber:v4];

    id v5 = [(QLMediaItemBaseViewController *)self player];
    uint64_t v6 = [(QLMovieItemViewController *)self scrubber];
    v7 = [v6 photosScrubber];
    [v7 setPlayer:v5];

    [(QLMediaItemBaseViewController *)self mediaDuration];
    double v9 = v8;
    id v10 = [(QLMovieItemViewController *)self scrubber];
    int v11 = [v10 photosScrubber];
    [v11 setEstimatedDuration:v9];

    [(QLMovieItemViewController *)self _setupScrubberPlaceholderThumbnail];
    id v12 = [(QLMovieItemViewController *)self scrubber];
    uint64_t v13 = [v12 scrollView];
    [v13 setContentInsetAdjustmentBehavior:2];

    id v14 = (UIScrollView *)objc_opt_new();
    scrubberContainerScrollView = self->_scrubberContainerScrollView;
    self->_scrubberContainerScrollView = v14;

    [(UIScrollView *)self->_scrubberContainerScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)self->_scrubberContainerScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)self->_scrubberContainerScrollView setBounces:0];
    v16 = [(QLMovieItemViewController *)self scrubber];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(QLMovieItemViewController *)self scrubber];
    [v17 addObserver:self forKeyPath:@"userInteractingWithScrubber" options:0 context:&QLMovieItemViewControllerContext];

    [(QLVideoScrubberView *)self->_scrubber setAlpha:0.0];
    objc_initWeak(&location, self);
    v18 = (void *)MEMORY[0x263F82E00];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __48__QLMovieItemViewController_addScrubberIfNeeded__block_invoke;
    v41[3] = &unk_2642F5AF8;
    objc_copyWeak(&v42, &location);
    [v18 animateWithDuration:v41 animations:0.2];
    [(UIScrollView *)self->_scrubberContainerScrollView addSubview:self->_scrubber];
    [(UIView *)self->_scrubberContainer addSubview:self->_scrubberContainerScrollView];
    v19 = [(UIView *)self->_scrubberContainer leadingAnchor];
    id v20 = [(QLVideoScrubberView *)self->_scrubber leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(UIView *)self->_scrubberContainer trailingAnchor];
    v23 = [(QLVideoScrubberView *)self->_scrubber trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    v25 = [(UIView *)self->_scrubberContainer topAnchor];
    v26 = [(QLVideoScrubberView *)self->_scrubber topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(UIView *)self->_scrubberContainer bottomAnchor];
    v29 = [(QLVideoScrubberView *)self->_scrubber bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    scrubberContainer = self->_scrubberContainer;
    v32 = (void *)MEMORY[0x263F08938];
    v33 = self->_scrubberContainerScrollView;
    v46 = @"scrubberContainerScrollView";
    v47[0] = v33;
    v34 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    v35 = [v32 constraintsWithVisualFormat:@"H:|[scrubberContainerScrollView]|" options:0 metrics:0 views:v34];
    [(UIView *)scrubberContainer addConstraints:v35];

    v36 = self->_scrubberContainer;
    v37 = (void *)MEMORY[0x263F08938];
    v38 = self->_scrubberContainerScrollView;
    v44 = @"scrubberContainerScrollView";
    v45 = v38;
    v39 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v40 = [v37 constraintsWithVisualFormat:@"V:|[scrubberContainerScrollView]|" options:0 metrics:0 views:v39];
    [(UIView *)v36 addConstraints:v40];

    [(QLMovieItemViewController *)self showTimeLabelIfNeeded];
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
}

void __48__QLMovieItemViewController_addScrubberIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained scrubber];
  [v1 setAlpha:1.0];
}

- (void)_setupScrubberPlaceholderThumbnail
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = [(QLItemViewController *)self context];
    v4 = [v3 thumbnailGenerator];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke;
    v5[3] = &unk_2642F6BF8;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "generateThumbnailWithSize:completionBlock:", v5, 30.0, 30.0);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke_2;
  v5[3] = &unk_2642F5B90;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __63__QLMovieItemViewController__setupScrubberPlaceholderThumbnail__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained scrubber];
  id v3 = [v2 photosScrubber];
  [v3 setPlaceholderThumbnail:v1];
}

- (id)setupPlayerViewWithPlayer:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFA9C8];
  id v5 = a3;
  id v6 = (AVPlayerViewController *)objc_alloc_init(v4);
  playerViewController = self->_playerViewController;
  self->_playerViewController = v6;

  [(AVPlayerViewController *)self->_playerViewController setAllowsVideoFrameAnalysis:1];
  [(AVPlayerViewController *)self->_playerViewController setUpdatesNowPlayingInfoCenter:1];
  double v8 = [(AVPlayerViewController *)self->_playerViewController view];
  [v8 setBackgroundColor:0];

  [(AVPlayerViewController *)self->_playerViewController setShowsPlaybackControls:_os_feature_enabled_impl()];
  [(AVPlayerViewController *)self->_playerViewController setPlayer:v5];

  [(AVPlayerViewController *)self->_playerViewController setAllowsPictureInPicturePlayback:0];
  [(AVPlayerViewController *)self->_playerViewController setDelegate:self];
  [(AVPlayerViewController *)self->_playerViewController setShowsExitFullScreenButton:0];
  if (_os_feature_enabled_impl())
  {
    double v9 = [(AVPlayerViewController *)self->_playerViewController configuration];
    objc_msgSend(v9, "setExcludedControls:", objc_msgSend(v9, "excludedControls") | 0x1FD0);
    [v9 setPrefersFullScreenStyleForEmbeddedMode:1];
    [(AVPlayerViewController *)self->_playerViewController setConfiguration:v9];
    [(AVPlayerViewController *)self->_playerViewController setPrefersDeviceUserInterfaceStyle:1];
  }
  id v10 = [(QLMovieItemViewController *)self _metadataItemTitle];
  v39[0] = v10;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  id v12 = [(AVPlayerViewController *)self->_playerViewController player];
  uint64_t v13 = [v12 currentItem];
  [v13 setExternalMetadata:v11];

  id v14 = [(AVPlayerViewController *)self->_playerViewController view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(QLMovieItemViewController *)self addChildViewController:self->_playerViewController];
  id v15 = [(QLMovieItemViewController *)self view];
  v16 = [(AVPlayerViewController *)self->_playerViewController view];
  [v15 addSubview:v16];

  [(AVPlayerViewController *)self->_playerViewController didMoveToParentViewController:self];
  v17 = [(QLMovieItemViewController *)self view];
  v18 = (void *)MEMORY[0x263F08938];
  v37 = @"player";
  v19 = [(AVPlayerViewController *)self->_playerViewController view];
  v38 = v19;
  id v20 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  v21 = [v18 constraintsWithVisualFormat:@"H:|[player]|" options:0 metrics:0 views:v20];
  [v17 addConstraints:v21];

  v22 = [(QLMovieItemViewController *)self view];
  v23 = (void *)MEMORY[0x263F08938];
  v24 = [(AVPlayerViewController *)self->_playerViewController view];
  v36 = v24;
  v25 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  uint64_t v26 = [v23 constraintsWithVisualFormat:@"V:|[player]|" options:0 metrics:0 views:v25];
  [v22 addConstraints:v26];

  v27 = [(QLMovieItemViewController *)self playerViewController];
  LOBYTE(v26) = objc_opt_respondsToSelector();

  if (v26)
  {
    v28 = [(QLMovieItemViewController *)self playerViewController];
    [v28 addObserver:self forKeyPath:@"analysisInteractionInProgress" options:5 context:&QLMovieItemViewControllerContext];
  }
  v29 = [(QLMovieItemViewController *)self playerViewController];
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    v31 = [(QLMovieItemViewController *)self playerViewController];
    [v31 addObserver:self forKeyPath:@"toggleLookupAction" options:5 context:&QLMovieItemViewControllerContext];
  }
  v32 = [(QLMovieItemViewController *)self playerViewController];
  [v32 addObserver:self forKeyPath:@"videoBounds" options:5 context:&QLMovieItemViewControllerContext];

  playerViewContainer = self->_playerViewContainer;

  return playerViewContainer;
}

- (id)_metadataItemTitle
{
  id v3 = (void *)MEMORY[0x263F11E08];
  id v4 = [(QLMediaItemBaseViewController *)self mediaAsset];
  id v5 = objc_msgSend(v3, "ql_propertyTitleFromAsset:", v4);

  if (!v5)
  {
    id v6 = [(QLItemViewController *)self context];
    id v5 = [v6 previewTitle];
  }
  id v7 = [MEMORY[0x263EFA790] metadataItem];
  [v7 setKey:*MEMORY[0x263EF9DC8]];
  [v7 setIdentifier:*MEMORY[0x263EF9D78]];
  [v7 setValue:v5];

  return v7;
}

- (void)dealloc
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(QLVideoScrubberView *)self->_scrubber removeObserver:self forKeyPath:@"userInteractingWithScrubber" context:&QLMovieItemViewControllerContext];
  }
  id v3 = [(QLMovieItemViewController *)self playerViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLMovieItemViewController *)self playerViewController];
    [v5 removeObserver:self forKeyPath:@"analysisInteractionInProgress" context:&QLMovieItemViewControllerContext];
  }
  id v6 = [(QLMovieItemViewController *)self playerViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(QLMovieItemViewController *)self playerViewController];
    [v8 removeObserver:self forKeyPath:@"toggleLookupAction" context:&QLMovieItemViewControllerContext];
  }
  if (self->_isObservingPlayerExternalPlaybackActive)
  {
    double v9 = [(QLMediaItemBaseViewController *)self player];
    [v9 removeObserver:self forKeyPath:@"externalPlaybackActive" context:&QLMovieItemViewControllerContext];
  }
  id v10 = [(QLMovieItemViewController *)self playerViewController];
  [v10 removeObserver:self forKeyPath:@"videoBounds" context:&QLMovieItemViewControllerContext];

  v11.receiver = self;
  v11.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v11 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  objc_super v11 = (QLVideoScrubberView *)a4;
  if (a6 == &QLMovieItemViewControllerContext)
  {
    if ((_os_feature_enabled_impl() & 1) == 0 && self->_scrubber == v11)
    {
      if ([v10 isEqualToString:@"userInteractingWithScrubber"])
      {
        if ([(QLVideoScrubberView *)self->_scrubber isUserInteractingWithScrubber])
        {
          [(QLMovieItemViewController *)self showTimeLabelIfNeeded];
        }
        else
        {
          if ([(QLMediaItemBaseViewController *)self endOfMediaReached]) {
            [(QLMediaItemBaseViewController *)self resetToBeginningAndPlay];
          }
          [(QLMediaItemViewController *)self hideTimeLabelAfterDelay];
        }
        [(QLMovieItemViewController *)self didChangePlayingStatus];
      }
    }
    else
    {
      id v12 = [(QLMediaItemBaseViewController *)self player];

      if (v12 == v11)
      {
        if ([v10 isEqualToString:@"externalPlaybackActive"]) {
          [(QLMovieItemViewController *)self _updatePlaceHolderView];
        }
      }
      else
      {
        uint64_t v13 = [(QLMovieItemViewController *)self playerViewController];

        if (v13 == v11)
        {
          if (![v10 isEqualToString:@"analysisInteractionInProgress"])
          {
            if ([v10 isEqualToString:@"toggleLookupAction"]
              && ([(QLMovieItemViewController *)self lookupAction],
                  id v14 = objc_claimAutoreleasedReturnValue(),
                  v14,
                  v14))
            {
              id v15 = [(QLItemViewController *)self delegate];
              [v15 previewItemViewControllerWantsUpdateOverlay:self animated:0];
            }
            else
            {
              if (![v10 isEqualToString:@"videoBounds"]) {
                goto LABEL_3;
              }
              id v15 = [(QLMovieItemViewController *)self view];
              v16 = [(QLMovieItemViewController *)self playerViewController];
              [v16 videoBounds];
              double v18 = v17;
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              v25 = [(QLMovieItemViewController *)self playerViewController];
              uint64_t v26 = [v25 view];
              objc_msgSend(v15, "convertRect:fromView:", v26, v18, v20, v22, v24);
              -[QLItemViewController setContentFrame:](self, "setContentFrame:");
            }
            goto LABEL_3;
          }
          [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
        }
      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)QLMovieItemViewController;
    [(QLMediaItemViewController *)&v27 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
LABEL_3:
}

- (void)previewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  [(QLScrollableContentItemViewController *)&v4 previewWillAppear:a3];
  [(QLMovieItemViewController *)self _showAssetBadgeViewIfNeeded];
}

- (void)previewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v6 previewDidAppear:a3];
  self->_previewIsVisisble = 1;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(QLMovieItemViewController *)self addScrubberIfNeededWithDeferral];
  }
  objc_super v4 = [(QLItemViewController *)self presentingDelegate];
  id v5 = [v4 parentApplicationDisplayIdentifier];
  [(AVPlayerViewController *)self->_playerViewController setOverrideParentApplicationDisplayIdentifier:v5];
}

- (void)previewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v4 previewDidDisappear:a3];
  self->_previewIsVisisble = 0;
  [(QLMovieItemViewController *)self _stopLookupIfNeeded];
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v4 hostApplicationDidEnterBackground:a3];
  [(QLMediaItemBaseViewController *)self pause];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v7 previewBecameFullScreen:a3 animated:a4];
  [(QLMovieItemViewController *)self _updateAssetBadgeViewVisibilityForFullscreenMode:v4];
  if (v4) {
    double v6 = 0.0;
  }
  else {
    double v6 = 40.0;
  }
  -[AVPlayerViewController setAdditionalSafeAreaInsets:](self->_playerViewController, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v6, 0.0);
}

- (id)accessoryView
{
  if (_os_feature_enabled_impl()) {
    id v3 = 0;
  }
  else {
    id v3 = self->_scrubberContainer;
  }

  return v3;
}

- (id)timeLabelScrollView
{
  if (_os_feature_enabled_impl())
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(QLVideoScrubberView *)self->_scrubber scrollView];
  }

  return v3;
}

- (void)showTimeLabelIfNeeded
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)QLMovieItemViewController;
    [(QLMediaItemViewController *)&v3 showTimeLabelIfNeeded];
  }
}

- (BOOL)canEnterFullScreen
{
  v2 = [(QLMediaItemBaseViewController *)self player];
  char v3 = [v2 isExternalPlaybackActive] ^ 1;

  return v3;
}

- (BOOL)play
{
  v6.receiver = self;
  v6.super_class = (Class)QLMovieItemViewController;
  BOOL v3 = [(QLMediaItemBaseViewController *)&v6 play];
  if (v3)
  {
    BOOL v4 = [(QLItemViewController *)self delegate];
    [v4 previewItemViewController:self wantsFullScreen:1];
  }
  return v3;
}

- (id)scrollView
{
  p_playerViewControllerScrollView = &self->_playerViewControllerScrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewControllerScrollView);

  if (!WeakRetained)
  {
    id v5 = [(AVPlayerViewController *)self->_playerViewController view];
    objc_super v6 = [(QLMovieItemViewController *)self scrollViewInView:v5];
    objc_storeWeak((id *)p_playerViewControllerScrollView, v6);
  }
  id v7 = objc_loadWeakRetained((id *)p_playerViewControllerScrollView);

  return v7;
}

- (id)scrollViewInView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(QLMovieItemViewController *)self scrollViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (BOOL)canPinchToDismiss
{
  if (self->_isEditing) {
    return 0;
  }
  BOOL v3 = [(QLMovieItemViewController *)self scrollView];
  [v3 minimumZoomScale];
  double v5 = v4;
  [v3 zoomScale];
  BOOL v2 = v5 == v6;

  return v2;
}

- (BOOL)canSwipeToDismiss
{
  if (self->_isEditing) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)QLMovieItemViewController;
  return [(QLItemViewController *)&v3 canSwipeToDismiss];
}

- (BOOL)canToggleFullScreen
{
  if (self->_isEditing || [(QLItemViewController *)self isSavingEdits]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)QLMovieItemViewController;
  return [(QLItemViewController *)&v4 canToggleFullScreen];
}

- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(QLOverlayPlayButton *)self->_playButton alpha];
    if (v7 == (double)v5)
    {
      if (v4)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __60__QLMovieItemViewController_setPlayControlsHidden_animated___block_invoke;
        v9[3] = &unk_2642F55E0;
        v9[4] = self;
        BOOL v10 = v5;
        [MEMORY[0x263F82E00] animateWithDuration:v9 animations:0.2];
      }
      else
      {
        playButton = self->_playButton;
        [(QLOverlayPlayButton *)playButton setAlpha:(double)!v5];
      }
    }
  }
}

uint64_t __60__QLMovieItemViewController_setPlayControlsHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1408) setAlpha:v1];
}

- (void)_updatePlayButtonVisibility
{
  BOOL v3 = [(QLMovieItemViewController *)self _videoIsPlaying];
  BOOL v4 = [(QLMovieItemViewController *)self scrubber];
  if ([v4 isUserInteractingWithScrubber])
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [(QLMediaItemViewController *)self scrubGesture];
    if ([v6 state] == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      double v7 = [(QLMediaItemViewController *)self scrubGesture];
      BOOL v5 = [v7 state] == 1;
    }
  }

  int v8 = _os_feature_enabled_impl();
  int v9 = v8 ^ 1;
  char v10 = (v8 ^ 1) & v5;
  BOOL v11 = [(QLMovieItemViewController *)self _isInteractingWithAnalysis];
  id v12 = [(QLItemViewController *)self appearance];
  BOOL v13 = [v12 presentationMode] == 4;

  uint64_t v14 = 1;
  if ((v10 & 1) == 0 && !v11 && (v9 & v3 & 1) == 0) {
    uint64_t v14 = ![(QLMediaItemBaseViewController *)self playable]
  }
       || self->_isEditing
       || (_os_feature_enabled_impl() & 1) == 0
       && ([(QLItemViewController *)self isSavingEdits] || self->_isSavingEditsBeforeDismissing)
       || v13;

  [(QLMovieItemViewController *)self setPlayControlsHidden:v14 animated:0];
}

- (void)didChangePlayingStatus
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
    [(QLMovieItemViewController *)self _updateAssetBadgeViewVisibilityWithNewPlayingStatus:[(QLMediaItemBaseViewController *)self playingStatus]];
  }

  [(QLMovieItemViewController *)self _stopLookupIfNeeded];
}

- (void)_stopLookupIfNeeded
{
  BOOL v3 = [(QLMovieItemViewController *)self lookupAction];
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 state] == 1;
    BOOL v3 = v5;
    if (v4)
    {
      [(QLMovieItemViewController *)self _lookupButtonTapped];
      BOOL v3 = v5;
    }
  }
}

- (BOOL)_videoIsPlaying
{
  return [(QLMediaItemBaseViewController *)self playingStatus] == 1;
}

- (BOOL)_isInteractingWithAnalysis
{
  BOOL v3 = [(QLMovieItemViewController *)self playerViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(QLMovieItemViewController *)self playerViewController];
  char v6 = [v5 analysisInteractionInProgress];

  return v6;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)transitionDidStart:(BOOL)a3
{
  if (a3)
  {
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  }
  else
  {
    [(QLMovieItemViewController *)self setPlayControlsHidden:1 animated:1];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      [(QLMovieItemViewController *)self _hideAssetBadgeViewIfVisible];
    }
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  if (a3 && a4 && ![(QLMovieItemViewController *)self isEditing])
  {
    id v6 = [(QLMediaItemBaseViewController *)self player];
    [v6 play];
  }
  else if (!a4 && [(QLMediaItemBaseViewController *)self playingStatus] != 1)
  {
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  }
}

- (id)transitioningView
{
  BOOL v3 = [(QLMediaItemBaseViewController *)self player];
  if ([v3 isExternalPlaybackActive])
  {
    char v4 = self->_airPlayPlaceholderView;
  }
  else
  {
    char v4 = [(AVPlayerViewController *)self->_playerViewController view];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)shouldAllowEditingContents
{
  BOOL v3 = [(QLMediaItemBaseViewController *)self mediaAsset];
  uint64_t v4 = [v3 hasProtectedContent];

  if ((v4 & 1) == 0)
  {
    id v6 = [(QLItemViewController *)self context];
    int v7 = [v6 canBeEdited];
    if (v7
      && ([(QLItemViewController *)self context],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [(id)v4 editedFileBehavior]))
    {
      BOOL v5 = 1;
    }
    else
    {
      int v8 = [(QLItemViewController *)self context];
      int v9 = [v8 item];
      BOOL v5 = [v9 editingMode] != 0;

      if (!v7)
      {
LABEL_8:

        return v5;
      }
    }

    goto LABEL_8;
  }
  return 0;
}

- (BOOL)shouldHandleRegisteringForCommandCenterHandlers
{
  return 0;
}

- (BOOL)supportsChromeless
{
  return _os_feature_enabled_impl();
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(QLItemViewController *)self appearance];
  uint64_t v8 = [v7 presentationMode];

  v10.receiver = self;
  v10.super_class = (Class)QLMovieItemViewController;
  [(QLMediaItemViewController *)&v10 setAppearance:v6 animated:v4];
  uint64_t v9 = [v6 presentationMode];

  if (v8 != v9) {
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  }
}

- (void)_setupEditBehavior
{
  BOOL v3 = (AVEditBehavior *)objc_opt_new();
  editBehavior = self->_editBehavior;
  self->_editBehavior = v3;

  [(AVEditBehavior *)self->_editBehavior setDelegate:self];
  playerViewController = self->_playerViewController;
  id v6 = self->_editBehavior;

  [(AVPlayerViewController *)playerViewController addBehavior:v6];
}

- (BOOL)_enterEditModeIfPossible
{
  BOOL v3 = [(QLItemViewController *)self isSavingEdits];
  if (v3)
  {
    BOOL v4 = (NSObject **)MEMORY[0x263F62940];
    BOOL v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      BOOL v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "Ignored request to enter edit mode because changes are being saved. #ItemViewController", v7, 2u);
    }
  }
  else
  {
    [(QLMovieItemViewController *)self _enterEditMode];
  }
  return !v3;
}

- (void)_enterEditMode
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(QLMovieItemViewController *)self shouldAllowEditingContents])
  {
    self->_isEditing = 1;
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
    BOOL v3 = [(QLItemViewController *)self delegate];
    [v3 previewItemViewController:self didEnableEditMode:1];

    BOOL v4 = [(AVEditBehavior *)self->_editBehavior behaviorContext];
    [v4 startEditing];

    BOOL v5 = [(QLItemViewController *)self delegate];
    [v5 previewItemViewController:self wantsFullScreen:1];

    id v6 = [(QLItemViewController *)self delegate];
    [v6 previewItemViewControllerWantsUpdateOverlay:self animated:0];

    int v7 = [(QLItemViewController *)self delegate];
    [v7 previewItemViewControllerWantsUpdateKeyCommands:self];

    if (_os_feature_enabled_impl())
    {
      playerViewController = self->_playerViewController;
      [(AVPlayerViewController *)playerViewController setShowsPlaybackControls:0];
    }
  }
  else
  {
    uint64_t v9 = (NSObject **)MEMORY[0x263F62940];
    objc_super v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      objc_super v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = self;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Could not enter edit mode because editing preview (%@) is not allowed. #PreviewController", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_exitEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isEditing = 0;
  BOOL v5 = [(AVEditBehavior *)self->_editBehavior behaviorContext];
  [v5 endEditing];

  id v6 = [(QLMovieItemViewController *)self playerViewController];
  int v7 = [v6 player];
  uint64_t v8 = [v7 currentItem];
  uint64_t v9 = v8;
  if (v8) {
    [v8 reversePlaybackEndTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  int v11 = [(QLMovieItemViewController *)self playerViewController];
  id v12 = [v11 player];
  uint64_t v13 = [v12 currentItem];
  uint64_t v14 = v13;
  if (v13) {
    [v13 forwardPlaybackEndTime];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  [(QLMovieItemViewController *)self _updateEditsTrimmingValuesWithTrimStartTime:Seconds trimEndTime:CMTimeGetSeconds(&v21)];

  [(QLMovieItemViewController *)self _updateEditMode];
  if (_os_feature_enabled_impl()) {
    [(AVPlayerViewController *)self->_playerViewController setShowsPlaybackControls:1];
  }
  [(QLMovieEdits *)self->_editsSinceLastSave trimmed];
  if (v3)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke;
    v18[3] = &unk_2642F6C20;
    objc_copyWeak(&v19, &location);
    [(QLMovieItemViewController *)self _saveMovieIfEdited:1 forceSaving:1 withCompletionHandler:v18];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(*MEMORY[0x263F629F8] * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke_3;
    block[3] = &unk_2642F5AF8;
    objc_copyWeak(&v17, &location);
    dispatch_after(v15, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    [(QLMovieItemViewController *)self _updateInterfaceAfterExitingEditMode];
    [(QLMovieItemViewController *)self _resetTrimmingValues];
  }
}

void __43__QLMovieItemViewController__exitEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      [WeakRetained _showFailedToSaveChangesAlertWithError:v6];
    }
    else
    {
      objc_super v10 = [WeakRetained delegate];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __43__QLMovieItemViewController__exitEditMode___block_invoke_2;
      v11[3] = &unk_2642F5AF8;
      objc_copyWeak(&v12, v7);
      [v10 previewItemViewControllerDidEditCopyOfPreviewItem:v9 editedCopy:v5 completionHandler:v11];

      objc_destroyWeak(&v12);
    }
  }
}

void __43__QLMovieItemViewController__exitEditMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v2 = [WeakRetained delegate];
    [v2 previewItemViewControllerWantsToDismissQuickLook:v3];

    id WeakRetained = v3;
  }
}

void __43__QLMovieItemViewController__exitEditMode___block_invoke_3(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isSavingEdits];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _updateInterfaceAfterExitingEditMode];
  }
}

- (void)_updateEditsTrimmingValuesWithTrimStartTime:(double)a3 trimEndTime:(double)a4
{
  -[QLMovieEdits setTrimStartTime:](self->_editsSinceLastSave, "setTrimStartTime:");
  [(QLMovieEdits *)self->_editsSinceLastSave setTrimEndTime:a4];
  [(QLMovieEdits *)self->_edits setTrimStartTime:a3];
  edits = self->_edits;

  [(QLMovieEdits *)edits setTrimEndTime:a4];
}

- (void)_updateInterfaceAfterExitingEditMode
{
  if (_os_feature_enabled_impl())
  {
    int v3 = [(QLMovieItemViewController *)self playerViewController];
    [v3 flashPlaybackControlsWithDuration:10.0];
  }
  else
  {
    [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  }
  id v4 = [(QLItemViewController *)self delegate];
  [v4 previewItemViewController:self wantsFullScreen:0];
}

- (void)_resetTrimmingValues
{
  [(QLMovieEdits *)self->_editsSinceLastSave resetTrimmingValues];
  edits = self->_edits;

  [(QLMovieEdits *)edits resetTrimmingValues];
}

- (void)_updateEditMode
{
  BOOL v3 = [(QLMovieEdits *)self->_editsSinceLastSave hasEdits];
  id v4 = [(QLItemViewController *)self delegate];
  [v4 previewItemViewController:self hasUnsavedEdits:v3];

  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewController:self didEnableEditMode:v3];
}

- (id)editProgressIndicatorMessage
{
  return (id)QLLocalizedString();
}

- (void)updateInterfaceForSavingEdits
{
  [(QLMediaItemBaseViewController *)self pause];
  [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  BOOL v3 = [(QLMovieItemViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    scrubberContainer = self->_scrubberContainer;
    [(UIView *)scrubberContainer setUserInteractionEnabled:0];
  }
}

- (void)updateInterfaceAfterSavingEdits
{
  [(QLMovieItemViewController *)self _updatePlayButtonVisibility];
  BOOL v3 = [(QLMovieItemViewController *)self view];
  [v3 setUserInteractionEnabled:1];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    scrubberContainer = self->_scrubberContainer;
    [(UIView *)scrubberContainer setUserInteractionEnabled:1];
  }
}

- (void)_rotateIfPossible
{
  if ([(QLItemViewController *)self isSavingEdits])
  {
    BOOL v3 = (NSObject **)MEMORY[0x263F62940];
    id v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "Ignored request to rotate right because changes are being saved. #ItemViewController", v5, 2u);
    }
  }
  else
  {
    [(QLMovieItemViewController *)self _rotateMovieRight];
    [(QLMovieItemViewController *)self _updateEditMode];
  }
}

- (void)_rotateMovieRight
{
  [(QLMovieEdits *)self->_editsSinceLastSave incrementRightRotationsCount];
  [(QLMovieEdits *)self->_edits incrementRightRotationsCount];
  id v3 = [(AVEditBehavior *)self->_editBehavior behaviorContext];
  [v3 rotateClockwise];
}

- (void)_saveMovieIfEdited:(BOOL)a3 withCompletionHandler:(id)a4
{
}

- (void)_saveMovieIfEdited:(BOOL)a3 forceSaving:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  if ([(QLMovieEdits *)self->_editsSinceLastSave hasEdits] || a4)
  {
    objc_initWeak(buf, self);
    int v11 = [(QLItemViewController *)self context];
    id v12 = [v11 item];
    uint64_t v13 = [v12 previewItemContentType];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x263F1D920];
      dispatch_time_t v15 = [(QLItemViewController *)self context];
      long long v16 = [v15 item];
      id v17 = [v16 previewItemContentType];
      uint64_t v18 = [v14 typeWithIdentifier:v17];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __82__QLMovieItemViewController__saveMovieIfEdited_forceSaving_withCompletionHandler___block_invoke;
      v19[3] = &unk_2642F6608;
      id v20 = v8;
      objc_copyWeak(&v21, buf);
      BOOL v22 = a3;
      [(QLItemViewController *)self editedCopyToSaveChangesWithOutputType:v18 completionHandler:v19];
      objc_destroyWeak(&v21);
    }
    else
    {
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62938] code:0 userInfo:0];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v18);
    }

    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v9 = (NSObject **)MEMORY[0x263F62940];
    objc_super v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      objc_super v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_DEBUG, "Not saving new video because it was not edited (was already saved or no changed were made). #AnyItemViewController", (uint8_t *)buf, 2u);
    }
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __82__QLMovieItemViewController__saveMovieIfEdited_forceSaving_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = (NSObject **)MEMORY[0x263F62940];
    objc_super v10 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      objc_super v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Could not create edited movie because could not generate a URL to save the file. #AnyItemViewController", v11, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _saveMovieIfEditedWithEditedCopy:v5 shouldDismissAfterSaving:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 32)];
  }
}

- (void)_saveMovieIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v8 = a5;
  BOOL v75 = [(QLMovieEdits *)self->_edits rotated];
  BOOL v9 = [(QLMovieEdits *)self->_edits trimmed];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke;
  aBlock[3] = &unk_2642F6C48;
  objc_copyWeak(&v93, &location);
  id v76 = v8;
  id v92 = v76;
  v77 = _Block_copy(aBlock);
  [(QLItemViewController *)self showSaveEditsProgressIndicatorAfterDelay];
  self->_isSavingEditsBeforeDismissing = a4;
  [(QLItemViewController *)self didStartSavingEdits];
  if (v9)
  {
    long long v89 = 0uLL;
    CMTimeEpoch v90 = 0;
    objc_super v10 = [(QLMovieItemViewController *)self playerViewController];
    int v11 = [v10 player];
    id v12 = [v11 currentItem];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 reversePlaybackEndTime];
    }
    else
    {
      long long v89 = 0uLL;
      CMTimeEpoch v90 = 0;
    }

    long long v87 = 0uLL;
    CMTimeEpoch v88 = 0;
    v34 = [(QLMovieItemViewController *)self playerViewController];
    uint64_t v35 = [v34 player];
    v36 = [v35 currentItem];
    v37 = v36;
    if (v36)
    {
      [v36 forwardPlaybackEndTime];
    }
    else
    {
      long long v87 = 0uLL;
      CMTimeEpoch v88 = 0;
    }

    memset(&v86, 0, sizeof(v86));
    *(_OWORD *)&buf.start.value = v87;
    buf.start.epoch = v88;
    *(_OWORD *)&rhs.start.value = v89;
    rhs.start.epoch = v90;
    CMTimeSubtract(&v86, &buf.start, &rhs.start);
    buf.start = v86;
    *(_OWORD *)&rhs.start.value = *MEMORY[0x263F01090];
    rhs.start.epoch = *(void *)(MEMORY[0x263F01090] + 16);
    int32_t v38 = CMTimeCompare(&buf.start, &rhs.start);
    v39 = (CMTime *)MEMORY[0x263F010E0];
    if (v38)
    {
      buf.start = v86;
      *(_OWORD *)&rhs.start.value = *MEMORY[0x263F010E0];
      rhs.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
      BOOL v40 = CMTimeCompare(&buf.start, &rhs.start) == 0;
    }
    else
    {
      BOOL v40 = 1;
    }
    [(QLMovieEdits *)self->_edits trimStartTime];
    double v42 = v41;
    [(QLMovieEdits *)self->_edits trimEndTime];
    int v44 = v42 > v43 || v40;
    v45 = (NSObject **)MEMORY[0x263F62940];
    v46 = *MEMORY[0x263F62940];
    if (v44 == 1)
    {
      if (!v46)
      {
        QLSInitLogging();
        v46 = *v45;
      }
      v47 = v46;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = [v78 url];
        [(QLMovieEdits *)self->_edits trimStartTime];
        uint64_t v50 = v49;
        [(QLMovieEdits *)self->_edits trimEndTime];
        LODWORD(buf.start.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v48;
        LOWORD(buf.start.flags) = 2048;
        *(void *)((char *)&buf.start.flags + 2) = v50;
        HIWORD(buf.start.epoch) = 2048;
        buf.duration.value = v51;
        _os_log_impl(&dword_217F61000, v47, OS_LOG_TYPE_ERROR, "Could not create edited movie for trimmed movie at URL: %@ because of invalid trim values (startTime: %f endTime: %f). #Media", (uint8_t *)&buf, 0x20u);
      }
      [v78 removeFromDisk:0];
      (*((void (**)(void *, void, void))v77 + 2))(v77, 0, 0);
      id v26 = 0;
      id v29 = 0;
      goto LABEL_70;
    }
    if (!v46)
    {
      QLSInitLogging();
      v46 = *v45;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_217F61000, v46, OS_LOG_TYPE_INFO, "Creating AVMutableMovie for new trimmed movie. %@ #Media", (uint8_t *)&buf, 0xCu);
    }
    id v29 = objc_alloc_init(MEMORY[0x263EFA798]);
    id v52 = objc_alloc(MEMORY[0x263EFA720]);
    v53 = [v78 url];
    v54 = (void *)[v52 initWithURL:v53 options:0];
    [v29 setDefaultMediaDataStorage:v54];

    memset(&buf, 0, sizeof(buf));
    *(_OWORD *)&rhs.start.value = v89;
    rhs.start.epoch = v90;
    CMTime duration = v86;
    CMTimeRangeMake(&buf, &rhs.start, &duration);
    v55 = [(QLMediaItemBaseViewController *)self mediaAsset];
    id v84 = 0;
    CMTimeRange rhs = buf;
    CMTime duration = *v39;
    int v56 = [v29 insertTimeRange:&rhs ofAsset:v55 atTime:&duration copySampleData:1 error:&v84];
    id v26 = v84;
    if (v26) {
      int v56 = 0;
    }

    if (v56) {
      goto LABEL_42;
    }
    v63 = *v45;
    if (!*v45)
    {
      QLSInitLogging();
      v63 = *v45;
    }
    v64 = v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v65 = [v78 url];
      LODWORD(rhs.start.value) = 138412546;
      *(CMTimeValue *)((char *)&rhs.start.value + 4) = (CMTimeValue)v65;
      LOWORD(rhs.start.flags) = 2112;
      *(void *)((char *)&rhs.start.flags + 2) = v26;
      _os_log_impl(&dword_217F61000, v64, OS_LOG_TYPE_ERROR, "Could not write contents for trimmed movie at URL: %@. Error: %@ #Media", (uint8_t *)&rhs, 0x16u);
    }
    [v78 removeFromDisk:0];
    (*((void (**)(void *, void, id))v77 + 2))(v77, 0, v26);
  }
  else
  {
    uint64_t v14 = (NSObject **)MEMORY[0x263F62940];
    dispatch_time_t v15 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      dispatch_time_t v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)self;
      _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_INFO, "Creating AVMutableMovie for new rotated movie. %@ #Media", (uint8_t *)&buf, 0xCu);
    }
    long long v16 = [MEMORY[0x263F08850] defaultManager];
    id v17 = [v78 url];
    uint64_t v18 = [v17 path];
    int v19 = [v16 fileExistsAtPath:v18];

    if (v19) {
      [v78 removeFromDisk:0];
    }
    id v20 = [MEMORY[0x263F08850] defaultManager];
    id v21 = [(QLItemViewController *)self context];
    BOOL v22 = [v21 item];
    double v23 = [v22 saveURL];
    double v24 = [v78 url];
    id v83 = 0;
    char v25 = [v20 copyItemAtURL:v23 toURL:v24 error:&v83];
    id v26 = v83;
    if (v26) {
      char v25 = 0;
    }

    if (v25)
    {
      objc_super v27 = (void *)MEMORY[0x263EFA798];
      v28 = [v78 url];
      id v29 = [v27 movieWithURL:v28 options:0];

LABEL_42:
      if (v75)
      {
        v57 = (void **)MEMORY[0x263F62940];
        v58 = (void *)*MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          v58 = *v57;
        }
        v59 = v58;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          CMTimeValue v60 = [(QLMovieEdits *)self->_edits rightRotationsCount];
          LODWORD(buf.start.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = v60;
          LOWORD(buf.start.flags) = 2112;
          *(void *)((char *)&buf.start.flags + 2) = self;
          _os_log_impl(&dword_217F61000, v59, OS_LOG_TYPE_INFO, "Setting preferred transform of rotated movie with rotations count: %lu. %@ #Media", (uint8_t *)&buf, 0x16u);
        }

        v61 = [v29 tracksWithMediaType:*MEMORY[0x263EF9D48]];
        v62 = [v61 firstObject];

        if (v62) {
          [v62 preferredTransform];
        }
        else {
          memset(&t1, 0, sizeof(t1));
        }
        CGAffineTransformMakeRotation(&t2, (double)[(QLMovieEdits *)self->_edits rightRotationsCount] * 1.57079633);
        CGAffineTransformConcat(&v82, &t1, &t2);
        [v62 setPreferredTransform:&v82];
      }
      v66 = [v78 url];
      v67 = [(QLItemViewController *)self context];
      v68 = [v67 contentType];
      id v79 = 0;
      char v69 = [v29 writeMovieHeaderToURL:v66 fileType:v68 options:0 error:&v79];
      id v26 = v79;
      if (v26) {
        char v70 = 0;
      }
      else {
        char v70 = v69;
      }

      v71 = (NSObject **)MEMORY[0x263F62940];
      v72 = *MEMORY[0x263F62940];
      if (v70)
      {
        if (!v72)
        {
          QLSInitLogging();
          v72 = *v71;
        }
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v78;
          LOWORD(buf.start.flags) = 2112;
          *(void *)((char *)&buf.start.flags + 2) = self;
          _os_log_impl(&dword_217F61000, v72, OS_LOG_TYPE_INFO, "Successfully wrote new header of edited movie to URL of edited copy: %@. %@ #Media", (uint8_t *)&buf, 0x16u);
        }
        [(QLMovieEdits *)self->_editsSinceLastSave resetEditingValues];
        [(QLMovieItemViewController *)self _updateEditMode];
        [v78 bumpVersion];
        [v78 markAsPurgeable];
        (*((void (**)(void *, id, void))v77 + 2))(v77, v78, 0);
        id v26 = 0;
      }
      else
      {
        if (!v72)
        {
          QLSInitLogging();
          v72 = *v71;
        }
        v73 = v72;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = [v78 url];
          LODWORD(buf.start.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v74;
          LOWORD(buf.start.flags) = 2112;
          *(void *)((char *)&buf.start.flags + 2) = v26;
          _os_log_impl(&dword_217F61000, v73, OS_LOG_TYPE_ERROR, "Could not write header for trimmed movie at URL of edited copy: %@. Error: %@ #Media", (uint8_t *)&buf, 0x16u);
        }
        [v78 removeFromDisk:0];
        (*((void (**)(void *, void, id))v77 + 2))(v77, 0, v26);
      }
      goto LABEL_70;
    }
    char v30 = (void **)MEMORY[0x263F62940];
    v31 = (void *)*MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v31 = *v30;
    }
    v32 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = [v78 url];
      LODWORD(buf.start.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v33;
      LOWORD(buf.start.flags) = 2112;
      *(void *)((char *)&buf.start.flags + 2) = v26;
      _os_log_impl(&dword_217F61000, v32, OS_LOG_TYPE_ERROR, "Could not copy original movie to save rotated version at URL: %@. Error: %@ #Media", (uint8_t *)&buf, 0x16u);
    }
    [v78 removeFromDisk:0];
    (*((void (**)(void *, void, id))v77 + 2))(v77, 0, v26);
    id v29 = 0;
  }
LABEL_70:

  objc_destroyWeak(&v93);
  objc_destroyWeak(&location);
}

void __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v10);
}

void __105__QLMovieItemViewController__saveMovieIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[1393] = 0;
    [WeakRetained hideSaveEditProgressIndicator];
    [WeakRetained didFinishSavingEdits];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(QLMovieItemViewController *)self shouldAllowEditingContents])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72__QLMovieItemViewController_savePreviewEditedCopyWithCompletionHandler___block_invoke;
    v5[3] = &unk_2642F65E0;
    id v6 = v4;
    [(QLMovieItemViewController *)self _saveMovieIfEdited:1 withCompletionHandler:v5];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __72__QLMovieItemViewController_savePreviewEditedCopyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imageAnalysisToolbarButton
{
  id v3 = [(QLMovieItemViewController *)self lookupAction];
  id v4 = v3;
  if (v3 && ([v3 attributes] & 5) == 0)
  {
    if (!self->_imageAnalysisToolbarButton)
    {
      id v6 = (QLToolbarButton *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLMediaLookupButtonIdentifier"];
      imageAnalysisToolbarButton = self->_imageAnalysisToolbarButton;
      self->_imageAnalysisToolbarButton = v6;

      [(QLToolbarButton *)self->_imageAnalysisToolbarButton setPlacement:0];
      [(QLToolbarButton *)self->_imageAnalysisToolbarButton setAccessibilityIdentifier:@"QLOverlayImageAnalysisButtonAccessibilityIdentifier"];
    }
    if ([v4 state] == 1) {
      id v8 = @"info.circle.and.sparkles.fill";
    }
    else {
      id v8 = @"info.circle.and.sparkles";
    }
    [(QLToolbarButton *)self->_imageAnalysisToolbarButton setSymbolImageName:v8];
    [(QLToolbarButton *)self->_imageAnalysisToolbarButton setUseInternalSymbolImage:1];
    id v5 = self->_imageAnalysisToolbarButton;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)lookupAction
{
  id v3 = [(QLMovieItemViewController *)self playerViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLMovieItemViewController *)self playerViewController];
    id v6 = [v5 toggleLookupAction];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_lookupButtonTapped
{
  id v3 = [(QLMovieItemViewController *)self lookupAction];
  if (v3)
  {
    id v4 = v3;
    [v3 performWithSender:self target:0];
    id v3 = v4;
  }
}

- (void)_showFailedToSaveChangesAlertWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = QLLocalizedStringFromTable();
  id v7 = [v4 localizedDescription];
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x263F82400];
  id v10 = QLLocalizedStringWithDefaultValue();
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __68__QLMovieItemViewController__showFailedToSaveChangesAlertWithError___block_invoke;
  dispatch_time_t v15 = &unk_2642F6C70;
  objc_copyWeak(&v16, &location);
  int v11 = [v9 actionWithTitle:v10 style:0 handler:&v12];

  objc_msgSend(v8, "addAction:", v11, v12, v13, v14, v15);
  [(QLMovieItemViewController *)self presentViewController:v8 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __68__QLMovieItemViewController__showFailedToSaveChangesAlertWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateInterfaceAfterExitingEditMode];
}

- (id)editBehaviorAlertActionsForDoneButtonTap:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(QLItemViewController *)self context];
  id v6 = [v5 item];
  [v6 editingMode];

  id v7 = QLLocalizedString();
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x263F82400];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __70__QLMovieItemViewController_editBehaviorAlertActionsForDoneButtonTap___block_invoke;
  dispatch_time_t v15 = &unk_2642F6C70;
  objc_copyWeak(&v16, &location);
  id v9 = [v8 actionWithTitle:v7 style:0 handler:&v12];
  v18[0] = v9;
  id v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __70__QLMovieItemViewController_editBehaviorAlertActionsForDoneButtonTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exitEditMode:1];
}

- (void)editBehaviorDidCancel:(id)a3
{
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return (a3 >> 1) & 1 | [(QLMovieItemViewController *)self shouldAllowEditingContents] & (a3 >> 2);
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    [(QLMovieItemViewController *)self play];
  }
  else if ((a3 & 4) != 0)
  {
    [(QLMovieItemViewController *)self _enterEditMode];
  }
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)QLMovieItemViewController;
  id v4 = [(QLMediaItemBaseViewController *)&v12 toolbarButtonsForTraitCollection:a3];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(QLMovieItemViewController *)self imageAnalysisToolbarButton];
  if (v6) {
    [v5 addObject:v6];
  }
  if ([(QLMovieItemViewController *)self shouldAllowEditingContents])
  {
    if (v5)
    {
      if (self->_assetCanBeRotated)
      {
        id v7 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLMediaRotateRightButtonIdentifier"];
        [v7 setSymbolImageName:@"rotate.right"];
        [v7 setForceToNavBar:_UIBarsDesktopNavigationBarEnabled() ^ 1];
        [v7 setPlacement:2];
        [v7 setAccessibilityIdentifier:@"QLMediaItemViewControllerBarRotateRightButtonAccessibilityIdentifier"];
        [v5 addObject:v7];
      }
      id v8 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLMediaTrimButtonIdentifier"];
      if (_os_feature_enabled_impl()) {
        id v9 = @"timeline.selection";
      }
      else {
        id v9 = @"selection.pin.in.out";
      }
      [v8 setSymbolImageName:v9];
      [v8 setForceToNavBar:_UIBarsDesktopNavigationBarEnabled() ^ 1];
      [v8 setPlacement:2];
      [v8 setAccessibilityIdentifier:@"QLMediaItemViewControllerBarTrimButtonAccessibilityIdentifier"];
      [v5 addObject:v8];
      id v10 = v5;
    }
    else
    {
      id v10 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 isEqualToString:@"QLMediaTrimButtonIdentifier"])
  {
    [(QLMovieItemViewController *)self editButtonTapped];
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"QLMediaRotateRightButtonIdentifier"])
  {
    [(QLMovieItemViewController *)self _rotateRightButtonTapped];
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"QLMediaLookupButtonIdentifier"])
  {
    [(QLMovieItemViewController *)self _lookupButtonTapped];
    if (v7) {
LABEL_9:
    }
      v7[2](v7);
  }
  else if ([v6 isEqualToString:@"QLActionButtonIdentifier"])
  {
    v9.receiver = self;
    v9.super_class = (Class)QLMovieItemViewController;
    [(QLMediaItemBaseViewController *)&v9 buttonPressedWithIdentifier:v6 completionHandler:v7];
    [(QLMediaItemBaseViewController *)self pause];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)QLMovieItemViewController;
    [(QLMediaItemBaseViewController *)&v8 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
LABEL_10:
}

- (id)registeredKeyCommands
{
  id v3 = objc_opt_new();
  if ([(QLMovieItemViewController *)self shouldAllowEditingContents] && !self->_isEditing)
  {
    id v4 = [MEMORY[0x263F82890] keyCommandWithInput:@"t" modifierFlags:1179648 action:sel__enterEditModeIfPossible];
    id v5 = QLLocalizedString();
    [v4 setDiscoverabilityTitle:v5];

    id v6 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v4 identifier:6];
    [v3 addObject:v6];

    id v7 = [MEMORY[0x263F82890] keyCommandWithInput:@"r" modifierFlags:0x100000 action:sel__rotateIfPossible];
    objc_super v8 = QLLocalizedString();
    [v7 setDiscoverabilityTitle:v8];

    objc_super v9 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v7 identifier:7];
    [v3 addObject:v9];
  }
  v13.receiver = self;
  v13.super_class = (Class)QLMovieItemViewController;
  id v10 = [(QLMediaItemViewController *)&v13 registeredKeyCommands];
  int v11 = [v10 arrayByAddingObjectsFromArray:v3];

  return v11;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyCommandIdentifier];
  if (v5 == 4)
  {
    if (_os_feature_enabled_impl()) {
      goto LABEL_8;
    }
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)QLMovieItemViewController;
    [(QLMediaItemViewController *)&v6 handlePerformedKeyCommandIfNeeded:v4];
    goto LABEL_8;
  }
  if (v5 == 7)
  {
    [(QLMovieItemViewController *)self _rotateIfPossible];
    goto LABEL_8;
  }
  if (v5 != 6) {
    goto LABEL_6;
  }
  [(QLMovieItemViewController *)self _enterEditModeIfPossible];
LABEL_8:
}

- (PHPlaceholderView)airPlayPlaceholderView
{
  airPlayPlaceholderView = self->_airPlayPlaceholderView;
  if (!airPlayPlaceholderView)
  {
    gotLoadHelper_x8__OBJC_CLASS___PHPlaceholderView(v2);
    objc_super v6 = (PHPlaceholderView *)[objc_alloc(*(Class *)(v5 + 928)) initWithType:0];
    id v7 = self->_airPlayPlaceholderView;
    self->_airPlayPlaceholderView = v6;

    airPlayPlaceholderView = self->_airPlayPlaceholderView;
  }

  return airPlayPlaceholderView;
}

- (void)_updatePlaceHolderView
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = [(QLMovieItemViewController *)self airPlayPlaceholderView];
  id v4 = [v3 superview];

  if (!v4)
  {
    uint64_t v5 = [(QLMovieItemViewController *)self view];
    [v5 addSubview:self->_airPlayPlaceholderView];

    [(PHPlaceholderView *)self->_airPlayPlaceholderView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v6 = [(QLMovieItemViewController *)self view];
    id v7 = (void *)MEMORY[0x263F08938];
    airPlayPlaceholderView = self->_airPlayPlaceholderView;
    char v25 = @"placeHolderView";
    v26[0] = airPlayPlaceholderView;
    objc_super v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v10 = [v7 constraintsWithVisualFormat:@"H:|-0-[placeHolderView]-0-|" options:0 metrics:0 views:v9];
    [v6 addConstraints:v10];

    int v11 = [(QLMovieItemViewController *)self view];
    objc_super v12 = (void *)MEMORY[0x263F08938];
    objc_super v13 = self->_airPlayPlaceholderView;
    double v23 = @"placeHolderView";
    double v24 = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    dispatch_time_t v15 = [v12 constraintsWithVisualFormat:@"V:|-0-[placeHolderView]-0-|" options:0 metrics:0 views:v14];
    [v11 addConstraints:v15];
  }
  id v16 = [(QLMediaItemBaseViewController *)self player];
  int v17 = [v16 isExternalPlaybackActive];

  if (v17)
  {
    uint64_t v18 = [(QLItemViewController *)self delegate];
    [v18 previewItemViewController:self wantsFullScreen:1];
  }
  int v19 = [(QLMediaItemBaseViewController *)self player];
  char v20 = [v19 isExternalPlaybackActive] ^ 1;

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__QLMovieItemViewController__updatePlaceHolderView__block_invoke;
  v21[3] = &unk_2642F55E0;
  v21[4] = self;
  char v22 = v20;
  [MEMORY[0x263F82E00] animateWithDuration:v21 animations:0.2];
}

void __51__QLMovieItemViewController__updatePlaceHolderView__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) airPlayPlaceholderView];
  [v2 setAlpha:v1];
}

- (void)_showBadge
{
  id v3 = [(QLMovieItemViewController *)self assetIsHDR];
  if ([v3 BOOLValue])
  {
  }
  else
  {
    id v4 = [(QLMovieItemViewController *)self assetIsProRes];
    int v5 = [v4 BOOLValue];

    if (!v5) {
      return;
    }
  }
  id v6 = [(QLMovieItemViewController *)self assetBadgeView];
  [(QLMovieItemViewController *)self _showAssetBadgeView:v6];
}

- (void)_showAssetBadgeViewIfNeeded
{
  if ((_os_feature_enabled_impl() & 1) == 0
    && ![(QLMediaItemBaseViewController *)self isFullScreen]
    && [(QLMediaItemBaseViewController *)self playingStatus] != 1)
  {
    id v3 = [(QLMovieItemViewController *)self assetIsHDR];
    if ([v3 BOOLValue])
    {
    }
    else
    {
      id v4 = [(QLMovieItemViewController *)self assetIsProRes];
      int v5 = [v4 BOOLValue];

      if (!v5) {
        return;
      }
    }
    id v6 = [(QLMovieItemViewController *)self assetBadgeView];
    if (([v6 isHidden] & 1) == 0)
    {
      if (v6)
      {
        [v6 badgeInfo];
        if ((void)v7)
        {
LABEL_13:

          return;
        }
      }
      else
      {
        long long v7 = 0u;
        long long v8 = 0u;
      }
    }
    -[QLMovieItemViewController _showAssetBadgeView:](self, "_showAssetBadgeView:", v6, v7, v8);
    goto LABEL_13;
  }
}

- (void)_showAssetBadgeView:(id)a3
{
  id v4 = a3;
  [(QLMovieItemViewController *)self _addAssetBadgeViewToHierarchyIfNeeded:v4];
  [(QLMovieItemViewController *)self _displayAssetBadgeView:v4];
}

- (void)_addAssetBadgeViewToHierarchyIfNeeded:(id)a3
{
  id v16 = a3;
  id v4 = [v16 superview];

  if (!v4)
  {
    int v5 = [(QLMovieItemViewController *)self view];
    [v5 addSubview:v16];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [v16 topAnchor];
    long long v7 = [(QLMovieItemViewController *)self view];
    long long v8 = [v7 safeAreaLayoutGuide];
    objc_super v9 = [v8 topAnchor];
    id v10 = [v6 constraintEqualToAnchor:v9 constant:6.0];
    [v10 setActive:1];

    int v11 = [v16 leadingAnchor];
    objc_super v12 = [(QLMovieItemViewController *)self view];
    objc_super v13 = [v12 safeAreaLayoutGuide];
    uint64_t v14 = [v13 leadingAnchor];
    dispatch_time_t v15 = [v11 constraintEqualToAnchor:v14 constant:6.0];
    [v15 setActive:1];
  }
}

- (void)_displayAssetBadgeView:(id)a3
{
  id v4 = a3;
  int v5 = [(QLMovieItemViewController *)self assetIsProRes];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    long long v7 = [(QLMovieItemViewController *)self assetIsHDR];
    [v7 BOOLValue];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  PXAssetBadgeInfoCreateWithBadges_delayInitStub(0.0);
  uint64_t v8 = _os_feature_enabled_impl();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__QLMovieItemViewController__displayAssetBadgeView___block_invoke;
  v10[3] = &unk_2642F6C98;
  id v9 = v4;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  long long v13 = v16;
  long long v14 = v17;
  [v9 performChanges:v10 animated:v8];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

uint64_t __52__QLMovieItemViewController__displayAssetBadgeView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStyle:3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained view];
  [v3 bounds];
  [*(id *)(a1 + 32) setContentWidth:v4];

  long long v5 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v5;
  return [*(id *)(a1 + 32) setBadgeInfo:v7];
}

- (void)_hideAssetBadgeViewAfterDelayIfNeeded:(double)a3
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__QLMovieItemViewController__hideAssetBadgeViewAfterDelayIfNeeded___block_invoke;
    v6[3] = &unk_2642F5AF8;
    objc_copyWeak(&v7, &location);
    dispatch_after(v5, MEMORY[0x263EF83A0], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __67__QLMovieItemViewController__hideAssetBadgeViewAfterDelayIfNeeded___block_invoke(uint64_t a1)
{
  double v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained playingStatus];

  if (v3 == 1)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _hideAssetBadgeViewIfVisible];
  }
}

- (void)_hideAssetBadgeViewIfVisible
{
  objc_initWeak(&location, self);
  assetBadgeView = self->_assetBadgeView;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__QLMovieItemViewController__hideAssetBadgeViewIfVisible__block_invoke;
  v4[3] = &unk_2642F5AF8;
  objc_copyWeak(&v5, &location);
  [(PXUIAssetBadgeView *)assetBadgeView performChanges:v4 animated:1];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__QLMovieItemViewController__hideAssetBadgeViewIfVisible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    gotLoadHelper_x8__PXAssetBadgeInfoNull(v2);
    id v4 = *(_OWORD **)(v3 + 504);
    long long v5 = v4[1];
    v7[0] = *v4;
    v7[1] = v5;
    [v6 setBadgeInfo:v7];
  }
}

- (void)_updateAssetBadgeViewVisibilityWithNewPlayingStatus:(int64_t)a3
{
  if (a3 == 1) {
    [(QLMovieItemViewController *)self _hideAssetBadgeViewAfterDelayIfNeeded:2.5];
  }
  else {
    [(QLMovieItemViewController *)self _showAssetBadgeViewIfNeeded];
  }
}

- (void)_updateAssetBadgeViewVisibilityForFullscreenMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (v3)
    {
      [(QLMovieItemViewController *)self _hideAssetBadgeViewIfVisible];
    }
    else
    {
      [(QLMovieItemViewController *)self _showAssetBadgeViewIfNeeded];
    }
  }
}

- (PXUIAssetBadgeView)assetBadgeView
{
  assetBadgeView = self->_assetBadgeView;
  if (!assetBadgeView)
  {
    gotLoadHelper_x8__OBJC_CLASS___PXUIAssetBadgeView(v2);
    id v6 = objc_alloc(*(Class *)(v5 + 464));
    id v7 = (PXUIAssetBadgeView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v8 = self->_assetBadgeView;
    self->_assetBadgeView = v7;

    assetBadgeView = self->_assetBadgeView;
  }

  return assetBadgeView;
}

- (void)loadAssetMetadata
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = (NSObject **)MEMORY[0x263F62940];
  id v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CMTimeRange buf = 138412290;
    long long v13 = self;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "Loading metadata for current asset. %@ #Media", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v5 = [(QLMediaItemBaseViewController *)self mediaAsset];
  if (v5)
  {
    gotLoadHelper_x8__OBJC_CLASS___PFMetadata(v6);
    uint64_t v8 = *(void **)(v7 + 3872);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__QLMovieItemViewController_loadAssetMetadata__block_invoke;
    v9[3] = &unk_2642F6CC0;
    id v10 = v5;
    objc_copyWeak(&v11, (id *)buf);
    [v8 metadataForAsset:v10 completionHandler:v9];
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak((id *)buf);
}

void __46__QLMovieItemViewController_loadAssetMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v25[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = (NSObject **)MEMORY[0x263F62940];
  if (!v5 || v6)
  {
    id v9 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)CMTimeRange buf = 138412546;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      *(void *)char v25 = v7;
      _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_ERROR, "Failed to get metadata for asset %@ finished loading: %@ #Media", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v12 = [v5 isProRes];
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [NSNumber numberWithBool:v12];
    uint64_t v14 = (void *)WeakRetained[185];
    WeakRetained[185] = v13;

    if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v15 = [v5 isHDR];
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = [NSNumber numberWithBool:v15];
    long long v17 = (void *)WeakRetained[184];
    WeakRetained[184] = v16;

    uint64_t v18 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      uint64_t v18 = *v8;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)CMTimeRange buf = 138412802;
      uint64_t v23 = v19;
      __int16 v24 = 1024;
      *(_DWORD *)char v25 = v12;
      v25[2] = 1024;
      *(_DWORD *)&v25[3] = v15;
      _os_log_impl(&dword_217F61000, v18, OS_LOG_TYPE_INFO, "Updated badge info with metadata for asset %@. isProRes: %d. isHDR: %d. #Media", buf, 0x18u);
    }
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__QLMovieItemViewController_loadAssetMetadata__block_invoke_202;
      block[3] = &unk_2642F5AF8;
      objc_copyWeak(&v21, (id *)(a1 + 40));
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v21);
    }
  }
}

void __46__QLMovieItemViewController_loadAssetMetadata__block_invoke_202(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "_updateAssetBadgeViewVisibilityWithNewPlayingStatus:", objc_msgSend(v1, "playingStatus"));
}

- (void)playerViewControllerWillPerformAnalysisCalloutAction:(id)a3
{
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "Will perform analysis callout action #ItemViewController", v8, 2u);
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v7 = [(QLItemViewController *)self delegate];
    [v7 previewItemViewController:self wantsFullScreen:1];
  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  char v10 = _os_feature_enabled_impl();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v15[3] = &unk_2642F57E0;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v11[3] = &unk_2642F6CE8;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a4;
  char v14 = v10;
  [v9 addCoordinatedAnimations:v15 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained delegate];
    [v3 previewItemViewController:v4 wantsFullScreen:0];

    id WeakRetained = v4;
  }
}

void __120__QLMovieItemViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2 && !*(unsigned char *)(a1 + 40))
  {
    id v6 = WeakRetained;
    id v5 = [WeakRetained delegate];
    [v5 previewItemViewController:v6 wantsFullScreen:1];

    [v6 _hideBadge];
    goto LABEL_9;
  }
  if (a2 && *(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    id v6 = WeakRetained;
    [WeakRetained _showBadge];
LABEL_9:
    id WeakRetained = v6;
  }
}

- (BOOL)shouldDisplayPlayButtonInNavigationBar
{
  return _os_feature_enabled_impl() ^ 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (QLOverlayPlayButton)playButton
{
  return (QLOverlayPlayButton *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setPlayButton:(id)a3
{
}

- (QLVideoScrubberView)scrubber
{
  return (QLVideoScrubberView *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setScrubber:(id)a3
{
}

- (NSLayoutConstraint)bottomScrubberConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setBottomScrubberConstraint:(id)a3
{
}

- (UIView)scrubberContainer
{
  return (UIView *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setScrubberContainer:(id)a3
{
}

- (UIScrollView)scrubberContainerScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setScrubberContainerScrollView:(id)a3
{
}

- (double)scrubberVerticalOffset
{
  return self->_scrubberVerticalOffset;
}

- (void)setScrubberVerticalOffset:(double)a3
{
  self->_scrubberVerticalOffset = a3;
}

- (UIView)playerViewContainer
{
  return self->_playerViewContainer;
}

- (void)setPlayerViewContainer:(id)a3
{
}

- (UIScrollView)playerViewControllerScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewControllerScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setPlayerViewControllerScrollView:(id)a3
{
}

- (NSNumber)assetIsHDR
{
  return self->_assetIsHDR;
}

- (void)setAssetIsHDR:(id)a3
{
}

- (NSNumber)assetIsProRes
{
  return self->_assetIsProRes;
}

- (void)setAssetIsProRes:(id)a3
{
}

- (void)setAssetBadgeView:(id)a3
{
}

- (AVEditBehavior)editBehavior
{
  return self->_editBehavior;
}

- (void)setEditBehavior:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (QLMovieEdits)edits
{
  return self->_edits;
}

- (void)setEdits:(id)a3
{
}

- (QLMovieEdits)editsSinceLastSave
{
  return self->_editsSinceLastSave;
}

- (void)setEditsSinceLastSave:(id)a3
{
}

- (BOOL)isSavingEditsBeforeDismissing
{
  return self->_isSavingEditsBeforeDismissing;
}

- (void)setIsSavingEditsBeforeDismissing:(BOOL)a3
{
  self->_isSavingEditsBeforeDismissing = a3;
}

- (BOOL)assetCanBeRotated
{
  return self->_assetCanBeRotated;
}

- (void)setAssetCanBeRotated:(BOOL)a3
{
  self->_assetCanBeRotated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editsSinceLastSave, 0);
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_editBehavior, 0);
  objc_storeStrong((id *)&self->_assetBadgeView, 0);
  objc_storeStrong((id *)&self->_assetIsProRes, 0);
  objc_storeStrong((id *)&self->_assetIsHDR, 0);
  objc_destroyWeak((id *)&self->_playerViewControllerScrollView);
  objc_storeStrong((id *)&self->_playerViewContainer, 0);
  objc_storeStrong((id *)&self->_scrubberContainerScrollView, 0);
  objc_storeStrong((id *)&self->_scrubberContainer, 0);
  objc_storeStrong((id *)&self->_bottomScrubberConstraint, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_imageAnalysisToolbarButton, 0);

  objc_storeStrong((id *)&self->_airPlayPlaceholderView, 0);
}

@end