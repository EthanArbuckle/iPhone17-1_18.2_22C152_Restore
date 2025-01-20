@interface QLLivePhotoItemViewController
- (BOOL)_isPointInNonImageSubjectItems:(CGPoint)a3;
- (BOOL)_wasJustPlaying;
- (BOOL)canEnterFullScreen;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)canToggleFullScreen;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldDetectMachineReadableCode;
- (CGSize)imageSize;
- (NSDictionary)clientPreviewOptions;
- (UIImage)imageForAnalysis;
- (UIView)imageAnalysisView;
- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)_setupAndStartImageAnalysisIfNeeded;
- (void)_updateAnalysisButtonsContainerConstraints;
- (void)_updateImageAnalysisInteractionAnimated:(BOOL)a3;
- (void)_updateLivePhotoBadgeAnimated:(BOOL)a3;
- (void)adjustImageInteractionForScrollEvent:(id)a3;
- (void)animateToPreferredDynamicRange;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)didEndZoomingAtScale:(double)a3;
- (void)imageAnalysisInteractionDidDismissVisualSearchController;
- (void)imageAnalysisInteractionWillPresentVisualSearchController;
- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)previewWillFinishAppearing;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)updatePreferredDynamicRangeForced:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginZooming;
@end

@implementation QLLivePhotoItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = v6;
  [v8 size];
  if (v8)
  {
    id v10 = v8;
    id v11 = v7;
    QLRunInMainThread();
  }
  else if (v7)
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.livePhotoItemViewController" code:1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

uint64_t __93__QLLivePhotoItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, double a2)
{
  v61[1] = *MEMORY[0x263EF8340];
  gotLoadHelper_x23__OBJC_CLASS___PHLivePhotoView(a2);
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1160);
  *(void *)(v5 + 1160) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1160) setLivePhoto:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1160) setAccessibilityIdentifier:@"QLLivePhotoViewControllerLivePhotoViewAccessibilityIdentifier"];
  id v7 = *(unsigned char **)(a1 + 32);
  if (v7[1205]) {
    [v7 animateToPreferredDynamicRange];
  }
  else {
    [v7 updatePreferredDynamicRangeForced:0];
  }
  id v8 = (void *)(*(void *)(a1 + 32) + 1144);
  v9 = [*(id *)(a1 + 40) image];
  [v9 size];
  *id v8 = v10;
  v8[1] = v11;

  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(*(void *)(a1 + 32) + 1144), *(double *)(*(void *)(a1 + 32) + 1152));
  [*(id *)(a1 + 32) setContentView:*(void *)(*(void *)(a1 + 32) + 1160)];
  v12 = [*(id *)(*(void *)(a1 + 32) + 1160) playbackGestureRecognizer];
  v13 = [v12 view];
  v14 = [*(id *)(*(void *)(a1 + 32) + 1160) playbackGestureRecognizer];
  [v13 removeGestureRecognizer:v14];

  v15 = [*(id *)(a1 + 32) view];
  v16 = [*(id *)(*(void *)(a1 + 32) + 1160) playbackGestureRecognizer];
  [v15 addGestureRecognizer:v16];

  uint64_t v17 = *(void *)(a1 + 32);
  v18 = [*(id *)(v17 + 1160) playbackGestureRecognizer];
  [v18 setDelegate:v17];

  id v19 = objc_alloc_init(MEMORY[0x263F82828]);
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 1168);
  *(void *)(v20 + 1168) = v19;

  [*(id *)(*(void *)(a1 + 32) + 1168) setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [*(id *)(v2 + 520) livePhotoBadgeImageWithOptions:1];
  [*(id *)(*(void *)(a1 + 32) + 1168) setImage:v22];

  [*(id *)(*(void *)(a1 + 32) + 1168) setAccessibilityIdentifier:@"QLLivePhotoViewControllerLivePhotoBadgeAccessibilityIdentifier"];
  v23 = [*(id *)(a1 + 32) view];
  [v23 addSubview:*(void *)(*(void *)(a1 + 32) + 1168)];

  v24 = [*(id *)(*(void *)(a1 + 32) + 1168) image];
  [v24 size];
  double v26 = v25;
  double v28 = v27;

  v29 = [*(id *)(a1 + 32) view];
  v30 = (void *)MEMORY[0x263F08938];
  v60 = @"width";
  v31 = [NSNumber numberWithDouble:v26];
  v61[0] = v31;
  v32 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
  v33 = _NSDictionaryOfVariableBindings(&cfstr_Livephotobadge.isa, *(id *)(*(void *)(a1 + 32) + 1168), 0);
  v34 = [v30 constraintsWithVisualFormat:@"H:[_livePhotoBadge(width)]" options:0 metrics:v32 views:v33];
  [v29 addConstraints:v34];

  v35 = [*(id *)(a1 + 32) view];
  v36 = (void *)MEMORY[0x263F08938];
  v58 = @"height";
  v37 = [NSNumber numberWithDouble:v28];
  v59 = v37;
  v38 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v39 = _NSDictionaryOfVariableBindings(&cfstr_Livephotobadge.isa, *(id *)(*(void *)(a1 + 32) + 1168), 0);
  v40 = [v36 constraintsWithVisualFormat:@"V:[_livePhotoBadge(height)]" options:0 metrics:v38 views:v39];
  [v35 addConstraints:v40];

  v41 = (void *)MEMORY[0x263F08938];
  v42 = *(void **)(a1 + 32);
  uint64_t v43 = v42[146];
  v44 = [v42 view];
  v45 = [v41 constraintWithItem:v43 attribute:1 relatedBy:0 toItem:v44 attribute:1 multiplier:1.0 constant:0.0];
  uint64_t v46 = objc_msgSend(v45, "ql_activatedConstraint");
  uint64_t v47 = *(void *)(a1 + 32);
  v48 = *(void **)(v47 + 1176);
  *(void *)(v47 + 1176) = v46;

  v49 = (void *)MEMORY[0x263F08938];
  v50 = *(void **)(a1 + 32);
  uint64_t v51 = v50[146];
  v52 = [v50 view];
  v53 = [v49 constraintWithItem:v51 attribute:3 relatedBy:0 toItem:v52 attribute:3 multiplier:1.0 constant:0.0];
  uint64_t v54 = objc_msgSend(v53, "ql_activatedConstraint");
  uint64_t v55 = *(void *)(a1 + 32);
  v56 = *(void **)(v55 + 1184);
  *(void *)(v55 + 1184) = v54;

  *(unsigned char *)(*(void *)(a1 + 32) + 1216) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 1203) = 1;
  [*(id *)(a1 + 32) _updateLivePhotoBadgeAnimated:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_updateLivePhotoBadgeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  livePhotoView = self->_livePhotoView;
  id v6 = [(QLLivePhotoItemViewController *)self view];
  -[PHLivePhotoView convertPoint:toView:](livePhotoView, "convertPoint:toView:", v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [(QLItemViewController *)self appearance];
  [v11 topInset];
  double v13 = v12;

  [(NSLayoutConstraint *)self->_livePhotoBadgeLeftConstraint setConstant:v8 + 5.0];
  double v14 = v13 + 5.0;
  if (v10 + 5.0 >= v13 + 5.0) {
    double v14 = v10 + 5.0;
  }
  [(NSLayoutConstraint *)self->_livePhotoBadgeTopConstraint setConstant:v14];
  if (!self->_fullyZoomedOut || self->_isFullScreen || self->_isPlaying || self->_transitionInProgress)
  {
    BOOL v15 = 0;
  }
  else
  {
    uint64_t v20 = [(QLItemViewController *)self appearance];
    BOOL v15 = [v20 presentationMode] != 4;
  }
  self->_livePhotoBadgeVisible = v15;
  v16 = [(QLLivePhotoItemViewController *)self view];
  [v16 setNeedsLayout];

  uint64_t v17 = [(QLLivePhotoItemViewController *)self view];
  [v17 layoutIfNeeded];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__QLLivePhotoItemViewController__updateLivePhotoBadgeAnimated___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  v18 = _Block_copy(aBlock);
  id v19 = v18;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:v18 animations:0.2];
  }
  else {
    (*((void (**)(void *))v18 + 2))(v18);
  }
}

uint64_t __63__QLLivePhotoItemViewController__updateLivePhotoBadgeAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(v1 + 1201)) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 1168) setAlpha:v2];
}

- (BOOL)_wasJustPlaying
{
  if (!self->_didEndPlayingTimestamp) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_didEndPlayingTimestamp];
  double v5 = v4;

  return v5 < 0.25;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)QLLivePhotoItemViewController;
  id v7 = a4;
  -[QLScrollableContentItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__QLLivePhotoItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_2642F54A8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __84__QLLivePhotoItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLivePhotoBadgeAnimated:1];
}

- (void)previewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  [(QLScrollableContentItemViewController *)&v4 previewWillAppear:a3];
  [(PHLivePhotoView *)self->_livePhotoView stopPlayback];
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:0];
  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:0];
}

- (void)previewWillFinishAppearing
{
  v2.receiver = self;
  v2.super_class = (Class)QLLivePhotoItemViewController;
  [(QLItemViewController *)&v2 previewWillFinishAppearing];
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    double v5 = [(QLItemViewController *)self appearance];
    BOOL v6 = +[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", [v5 presentationMode]);

    if (v6) {
      [(QLLivePhotoItemViewController *)self _setupAndStartImageAnalysisIfNeeded];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)QLLivePhotoItemViewController;
  [(QLScrollableContentItemViewController *)&v11 previewDidAppear:v3];
  id v7 = [(QLItemViewController *)self appearance];
  uint64_t v8 = [v7 presentationMode];

  if (v8 == 4)
  {
    if (!self->_isPlaying) {
      [(PHLivePhotoView *)self->_livePhotoView startPlaybackWithStyle:1];
    }
  }
  else if (self->_isPlaying)
  {
    objc_super v9 = [(QLItemViewController *)self appearance];
    uint64_t v10 = [v9 presentationMode];

    if (v10 != 4) {
      [(PHLivePhotoView *)self->_livePhotoView stopPlayback];
    }
  }
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:1];
}

- (void)previewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  [(QLItemViewController *)&v4 previewWillDisappear:a3];
  [(QLImageAnalysisManager *)self->_imageAnalysisManager shouldHideInteraction:1 animated:0];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLItemViewController *)self appearance];
  v16.receiver = self;
  v16.super_class = (Class)QLLivePhotoItemViewController;
  [(QLScrollableContentItemViewController *)&v16 setAppearance:v6 animated:v4];

  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:v4];
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = [v7 presentationMode];
    objc_super v9 = [(QLItemViewController *)self appearance];
    uint64_t v10 = [v9 presentationMode];

    if (v8 != v10)
    {
      if (+[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:v10]&& ([(QLItemViewController *)self didAppearOnce]|| [(QLImageAnalysisManager *)self->_imageAnalysisManager hasAnalysis]))
      {
        [(QLLivePhotoItemViewController *)self _setupAndStartImageAnalysisIfNeeded];
      }
      else
      {
        [(QLLivePhotoItemViewController *)self _updateAnalysisButtonsContainerConstraints];
      }
    }
  }
  uint64_t v11 = [v7 presentationMode];
  double v12 = [(QLItemViewController *)self appearance];
  uint64_t v13 = [v12 presentationMode];

  if (v11 != v13)
  {
    double v14 = [(QLItemViewController *)self appearance];
    if ([v14 presentationMode] == 4)
    {
      BOOL isPlaying = self->_isPlaying;

      if (!isPlaying) {
        [(PHLivePhotoView *)self->_livePhotoView startPlaybackWithStyle:1];
      }
    }
    else
    {
    }
    [(QLLivePhotoItemViewController *)self updatePreferredDynamicRangeForced:0];
  }
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(QLImageAnalysisManager *)self->_imageAnalysisManager stopImageAnalysis];
  v5.receiver = self;
  v5.super_class = (Class)QLLivePhotoItemViewController;
  [(QLScrollableContentItemViewController *)&v5 previewDidDisappear:v3];
  self->_shouldPlayHint = 1;
  self->_BOOL isPlaying = 0;
  [(PHLivePhotoView *)self->_livePhotoView stopPlayback];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_isFullScreen = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLLivePhotoItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
  [(QLImageAnalysisManager *)self->_imageAnalysisManager updateForFullScreen:v5 animated:v4];
  [(QLLivePhotoItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)transitionDidStart:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  [(QLItemViewController *)&v4 transitionDidStart:a3];
  self->_transitionInProgress = 1;
  self->_HDRTransitionInProgress = 1;
  if (self->_livePhotoView) {
    [(QLLivePhotoItemViewController *)self animateToPreferredDynamicRange];
  }
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:1];
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)QLLivePhotoItemViewController;
  [(QLScrollableContentItemViewController *)&v5 transitionWillFinish:a3 didComplete:a4];
  self->_transitionInProgress = 0;
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:1];
}

- (void)didEndZoomingAtScale:(double)a3
{
  objc_super v4 = [(QLScrollableContentItemViewController *)self scrollView];
  [v4 zoomScale];
  double v6 = v5;
  objc_super v7 = [(QLScrollableContentItemViewController *)self scrollView];
  [v7 minZoomScale];
  self->_fullyZoomedOut = v6 == v8;

  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
}

- (void)willBeginZooming
{
  self->_fullyZoomedOut = 0;
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)canEnterFullScreen
{
  BOOL v3 = [(PHLivePhotoView *)self->_livePhotoView playbackGestureRecognizer];
  if ([v3 state] == 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(PHLivePhotoView *)self->_livePhotoView playbackGestureRecognizer];
    BOOL v4 = [v5 state] != 2 && !self->_isPlaying;
  }
  return v4;
}

- (BOOL)canToggleFullScreen
{
  if ([(QLLivePhotoItemViewController *)self _wasJustPlaying]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewController;
  return [(QLItemViewController *)&v4 canToggleFullScreen];
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLLivePhotoItemViewController;
  objc_super v4 = [(QLItemViewController *)&v8 toolbarButtonsForTraitCollection:a3];
  double v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    double v5 = [MEMORY[0x263EFF980] array];
  }
  if (_os_feature_enabled_impl()
    && [(QLImageAnalysisManager *)self->_imageAnalysisManager isInteractionActive]
    && [(QLImageAnalysisManager *)self->_imageAnalysisManager hasResultsForVisualSearch])
  {
    double v6 = [(QLImageAnalysisManager *)self->_imageAnalysisManager imageAnalysisToolbarButton];
    [v5 addObject:v6];
  }

  return v5;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(void))a4;
  int v8 = _os_feature_enabled_impl();
  if ([v6 isEqualToString:@"QLVisualSearchButton"]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLLivePhotoItemViewController;
    [(QLItemViewController *)&v10 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
  else
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager infoButtonTapped];
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  self->_BOOL isPlaying = 1;
  -[QLLivePhotoItemViewController _updateLivePhotoBadgeAnimated:](self, "_updateLivePhotoBadgeAnimated:", 1, a4);

  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:1];
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  objc_msgSend(MEMORY[0x263EFF910], "date", a3, a4);
  double v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  didEndPlayingTimestamp = self->_didEndPlayingTimestamp;
  self->_didEndPlayingTimestamp = v5;

  self->_BOOL isPlaying = 0;
  [(QLLivePhotoItemViewController *)self _updateLivePhotoBadgeAnimated:1];

  [(QLLivePhotoItemViewController *)self _updateImageAnalysisInteractionAnimated:1];
}

- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4
{
  double v5 = [a3 playbackGestureRecognizer];
  id v6 = [(QLLivePhotoItemViewController *)self imageAnalysisView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  return !-[QLLivePhotoItemViewController _isPointInNonImageSubjectItems:](self, "_isPointInNonImageSubjectItems:", v8, v10);
}

- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5
{
  id v6 = a4;
  double v7 = [(QLLivePhotoItemViewController *)self imageAnalysisView];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  if (-[QLImageAnalysisManager imageSubjectExistsAtPoint:](self->_imageAnalysisManager, "imageSubjectExistsAtPoint:", v9, v11)&& !-[QLLivePhotoItemViewController _isPointInNonImageSubjectItems:](self, "_isPointInNonImageSubjectItems:", v9, v11))
  {
    return 0.4;
  }
  else
  {
    return 0.0;
  }
}

- (UIImage)imageForAnalysis
{
  objc_super v2 = [(PHLivePhotoView *)self->_livePhotoView livePhoto];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIView)imageAnalysisView
{
  return (UIView *)self->_livePhotoView;
}

- (NSDictionary)clientPreviewOptions
{
  objc_super v2 = [(QLItemViewController *)self context];
  BOOL v3 = [v2 clientPreviewOptions];

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewControllerWantsUpdateOverlay:self animated:v3];
}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  BOOL v3 = [NSNumber numberWithBool:self->_isFullScreen];
  savedFullScreenState = self->_savedFullScreenState;
  self->_savedFullScreenState = v3;

  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewController:self wantsFullScreen:1];
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  savedFullScreenState = self->_savedFullScreenState;
  if (savedFullScreenState)
  {
    uint64_t v4 = [(NSNumber *)savedFullScreenState BOOLValue];
    id v5 = self->_savedFullScreenState;
    self->_savedFullScreenState = 0;

    id v6 = [(QLItemViewController *)self delegate];
    id v9 = v6;
    double v7 = self;
    uint64_t v8 = v4;
  }
  else
  {
    id v6 = [(QLItemViewController *)self delegate];
    id v9 = v6;
    double v7 = self;
    uint64_t v8 = 0;
  }
  [v6 previewItemViewController:v7 wantsFullScreen:v8];
}

- (BOOL)shouldDetectMachineReadableCode
{
  objc_super v2 = [(QLItemViewController *)self context];
  char v3 = [v2 shouldPreventMachineReadableCodeDetection] ^ 1;

  return v3;
}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  imageAnalysisManager = self->_imageAnalysisManager;
  if (!imageAnalysisManager)
  {
LABEL_8:
    double v7 = [QLImageAnalysisManager alloc];
    uint64_t v8 = [(QLLivePhotoItemViewController *)self view];
    id v9 = [(QLImageAnalysisManager *)v7 initWithDelegate:self presentingView:v8];
    double v10 = self->_imageAnalysisManager;
    self->_imageAnalysisManager = v9;

    goto LABEL_9;
  }
  BOOL v4 = [(QLImageAnalysisManager *)imageAnalysisManager hasAnalysis];
  id v5 = self->_imageAnalysisManager;
  if (!v4)
  {
    if (v5)
    {
      if ([(QLImageAnalysisManager *)v5 isAnalysisOngoing]) {
        return;
      }
      id v6 = self->_imageAnalysisManager;
      if (v6) {
        [(QLImageAnalysisManager *)v6 stopImageAnalysis];
      }
    }
    goto LABEL_8;
  }
  [(QLImageAnalysisManager *)v5 addInteractionIfNeeded];
  [(QLImageAnalysisManager *)self->_imageAnalysisManager setupAnalysisButtonsContainer];
LABEL_9:

  [(QLLivePhotoItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  livePhotoView = self->_livePhotoView;
  if (livePhotoView)
  {
    imageAnalysisManager = self->_imageAnalysisManager;
    id v5 = livePhotoView;
    id v6 = [(QLLivePhotoItemViewController *)self view];
    [(QLImageAnalysisManager *)imageAnalysisManager updateBottomRightContainerPositionForImageView:v5 view:v6];
  }
}

- (void)viewDidLoad
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLLivePhotoItemViewController;
  [(QLLivePhotoItemViewController *)&v8 viewDidLoad];
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  char v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__QLLivePhotoItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_2642F5408;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(QLLivePhotoItemViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__QLLivePhotoItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAnalysisButtonsContainerConstraints];
}

- (void)adjustImageInteractionForScrollEvent:(id)a3
{
  [(QLImageAnalysisManager *)self->_imageAnalysisManager adjustImageInteractionForScrollView:a3];

  [(QLLivePhotoItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)_updateImageAnalysisInteractionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isPlaying || self->_transitionInProgress)
  {
    BOOL v5 = 1;
  }
  else
  {
    double v7 = [(QLItemViewController *)self appearance];
    BOOL v5 = [v7 presentationMode] == 4;
  }
  imageAnalysisManager = self->_imageAnalysisManager;

  [(QLImageAnalysisManager *)imageAnalysisManager shouldHideInteraction:v5 animated:v3];
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLLivePhotoItemViewController;
  unsigned __int8 v4 = -[QLItemViewController canPerformFirstTimeAppearanceActions:](&v7, sel_canPerformFirstTimeAppearanceActions_);
  BOOL v5 = (v3 & 0x28) != 0;
  if (v4) {
    BOOL v5 = 1;
  }
  return (v3 & 0x10) != 0 || v5;
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldHighlightTextAndDDAfterNextAnalysis:1];
  }
  else if ((a3 & 0x10) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldEnterVisualSearchAfterNextAnalysis:1];
  }
  else if ((a3 & 0x20) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldUpliftSubjectAfterNextAnalysis:1];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || [v4 numberOfTapsRequired] != 2;

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  livePhotoView = self->_livePhotoView;
  id v5 = a3;
  id v6 = [(PHLivePhotoView *)livePhotoView playbackGestureRecognizer];

  if (v6 != v5) {
    return 1;
  }
  objc_super v8 = self->_livePhotoView;

  return [(QLLivePhotoItemViewController *)self livePhotoView:v8 canBeginPlaybackWithStyle:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHLivePhotoView *)self->_livePhotoView playbackGestureRecognizer];
  if (v8 == v6)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      [(QLLivePhotoItemViewController *)self livePhotoView:self->_livePhotoView extraMinimumTouchDurationForTouch:v7 withStyle:1];
      objc_msgSend(v6, "setExtraMinimumTouchDuration:");
    }
  }
  else
  {
  }
  return 1;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QLLivePhotoItemViewController;
  id v7 = a3;
  unsigned int v8 = [(QLItemViewController *)&v16 shouldAcceptTouch:v7 ofGestureRecognizer:v6];
  char v9 = [(QLLivePhotoItemViewController *)self imageAnalysisView];
  [v7 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  LODWORD(v9) = [v7 _isPointerTouch];
  if (v9)
  {
    if ([(QLImageAnalysisManager *)self->_imageAnalysisManager isTextSelectionEnabled])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 &= !-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v11, v13);
      }
    }
  }
  if (-[QLImageAnalysisManager visualSearchExistsAtPoint:](self->_imageAnalysisManager, "visualSearchExistsAtPoint:", v11, v13))
  {
    objc_opt_class();
    v8 &= ~objc_opt_isKindOfClass();
  }
  unsigned int v14 = v8 & ~[(QLImageAnalysisManager *)self->_imageAnalysisManager hasActiveTextSelection];

  return v14;
}

- (BOOL)_isPointInNonImageSubjectItems:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:")
    || -[QLImageAnalysisManager dataDetectorExistsAtPoint:](self->_imageAnalysisManager, "dataDetectorExistsAtPoint:", x, y))
  {
    return 1;
  }
  imageAnalysisManager = self->_imageAnalysisManager;

  return -[QLImageAnalysisManager actionInfoItemExistsAtPoint:](imageAnalysisManager, "actionInfoItemExistsAtPoint:", x, y);
}

- (void)updatePreferredDynamicRangeForced:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (!self->_HDRTransitionInProgress || v3)
    {
      id v6 = [(QLItemViewController *)self appearance];
      uint64_t v7 = [v6 presentationMode];

      livePhotoView = self->_livePhotoView;
      if (v7 == 2) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      [(PHLivePhotoView *)livePhotoView setPreferredImageDynamicRange:v9];
    }
  }
}

- (void)animateToPreferredDynamicRange
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke;
  v3[3] = &unk_2642F5430;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke_2;
  v2[3] = &unk_2642F5458;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:v2 completion:2.0];
}

uint64_t __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1160) setPreferredImageDynamicRange:2];
}

uint64_t __63__QLLivePhotoItemViewController_animateToPreferredDynamicRange__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1205) = 0;
  return [*(id *)(a1 + 32) updatePreferredDynamicRangeForced:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisButtonContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_savedFullScreenState, 0);
  objc_storeStrong((id *)&self->_didEndPlayingTimestamp, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeTopConstraint, 0);
  objc_storeStrong((id *)&self->_livePhotoBadgeLeftConstraint, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);

  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

@end