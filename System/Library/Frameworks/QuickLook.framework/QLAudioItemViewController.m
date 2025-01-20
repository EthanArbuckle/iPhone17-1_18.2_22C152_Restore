@interface QLAudioItemViewController
- (BOOL)canEnterFullScreen;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)scrubbing;
- (BOOL)supportsChromeless;
- (BOOL)usesScrubber;
- (NSLayoutConstraint)topScrubber;
- (UIView)scrubberContainer;
- (double)maximumWaveformDimension;
- (double)scrubberVerticalOffset;
- (double)waveformImageDimension;
- (id)accessoryView;
- (id)iconImageWithConfiguration:(id)a3;
- (id)imageAccessibilityIdentifier;
- (id)timeLabelScrollView;
- (void)addScrubberWithDeferral;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didChangePlayingStatus;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setScrubberContainer:(id)a3;
- (void)setScrubberVerticalOffset:(double)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setTopScrubber:(id)a3;
- (void)setupConstraints;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
@end

@implementation QLAudioItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__QLAudioItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v13[3] = &unk_2642F66A8;
  v15 = self;
  id v16 = v9;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)QLAudioItemViewController;
  id v10 = v9;
  id v11 = v8;
  [(QLMediaItemViewController *)&v12 loadPreviewControllerWithContents:a3 context:v11 completionHandler:v13];
}

void __89__QLAudioItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (NSObject **)MEMORY[0x263F62940];
    v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      id v8 = [v6 previewTitle];
      int v31 = 138412546;
      v32 = v8;
      __int16 v33 = 2112;
      id v34 = v3;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Error while loading preview controller with preview item with name: %@: %@ #Generic", (uint8_t *)&v31, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) scrollView];
    id v11 = [v10 pinchGestureRecognizer];
    [v11 setEnabled:0];

    objc_super v12 = [*(id *)(a1 + 40) scrollView];
    v13 = [v12 panGestureRecognizer];
    [v13 setEnabled:0];

    id v14 = (void *)MEMORY[0x263F82818];
    [*(id *)(a1 + 40) waveformImageDimension];
    v15 = objc_msgSend(v14, "configurationWithPointSize:weight:scale:", 3, -1);
    id v16 = [*(id *)(a1 + 40) iconImageWithConfiguration:v15];
    v17 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v16];
    v18 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v17 setTintColor:v18];

    v19 = [*(id *)(a1 + 40) imageAccessibilityIdentifier];
    [v17 setAccessibilityIdentifier:v19];

    v20 = [*(id *)(a1 + 40) view];
    [v20 addSubview:v17];

    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1368), v17);
    v21 = objc_alloc_init(QLOverlayPlayButton);
    uint64_t v22 = *(void *)(a1 + 40);
    v23 = *(void **)(v22 + 1376);
    *(void *)(v22 + 1376) = v21;

    [*(id *)(*(void *)(a1 + 40) + 1376) setTarget:*(void *)(a1 + 40) action:sel_play];
    [*(id *)(*(void *)(a1 + 40) + 1376) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 40) + 1376) setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [*(id *)(a1 + 40) view];
    [v24 addSubview:*(void *)(*(void *)(a1 + 40) + 1376)];

    [*(id *)(a1 + 40) setupConstraints];
    v25 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:*(void *)(a1 + 40) action:sel__tapRecognized_];
    v26 = [*(id *)(a1 + 40) view];
    [v26 addGestureRecognizer:v25];

    if ([*(id *)(a1 + 40) usesScrubber])
    {
      v27 = objc_alloc_init(_QLAudioScrubberViewContainer);
      uint64_t v28 = *(void *)(a1 + 40);
      v29 = *(void **)(v28 + 1384);
      *(void *)(v28 + 1384) = v27;

      [*(id *)(*(void *)(a1 + 40) + 1384) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(*(void *)(a1 + 40) + 1384) setUserInteractionEnabled:1];
      [*(id *)(*(void *)(a1 + 40) + 1384) setAlpha:1.0];
      [*(id *)(a1 + 40) addScrubberWithDeferral];
    }
    uint64_t v30 = *(void *)(a1 + 48);
    if (v30) {
      (*(void (**)(uint64_t, void))(v30 + 16))(v30, 0);
    }
  }
}

- (void)dealloc
{
  [(QLVideoScrubberView *)self->_scrubber removeObserver:self forKeyPath:@"userInteractingWithScrubber" context:0];
  v3.receiver = self;
  v3.super_class = (Class)QLAudioItemViewController;
  [(QLMediaItemViewController *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_scrubber == a4)
  {
    if ([a3 isEqualToString:@"userInteractingWithScrubber"])
    {
      if ([(QLVideoScrubberView *)self->_scrubber isUserInteractingWithScrubber]) {
        [(QLMediaItemViewController *)self showTimeLabelIfNeeded];
      }
      else {
        [(QLMediaItemViewController *)self hideTimeLabelAfterDelay];
      }
      [(QLAudioItemViewController *)self didChangePlayingStatus];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLAudioItemViewController;
    -[QLMediaItemViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3);
  }
}

- (void)addScrubberWithDeferral
{
  if (!self->_scrubber)
  {
    if (self->_scrubberContainer)
    {
      dispatch_time_t v3 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke;
      block[3] = &unk_2642F5430;
      block[4] = self;
      dispatch_after(v3, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke(uint64_t result)
{
  v47[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 1400))
  {
    if (*(unsigned char *)(v1 + 1416))
    {
      uint64_t v2 = result;
      uint64_t v3 = objc_opt_new();
      uint64_t v4 = *(void *)(v2 + 32);
      v5 = *(void **)(v4 + 1392);
      *(void *)(v4 + 1392) = v3;

      [*(id *)(*(void *)(v2 + 32) + 1392) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(*(void *)(v2 + 32) + 1392) setShowsHorizontalScrollIndicator:0];
      [*(id *)(*(void *)(v2 + 32) + 1392) setBounces:0];
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(v2 + 32);
      id v8 = *(void **)(v7 + 1400);
      *(void *)(v7 + 1400) = v6;

      uint64_t v9 = objc_alloc_init(QLWaveformScrubberViewProvider);
      uint64_t v10 = *(void *)(v2 + 32);
      id v11 = *(void **)(v10 + 1408);
      *(void *)(v10 + 1408) = v9;

      objc_super v12 = [*(id *)(v2 + 32) player];
      v13 = [*(id *)(*(void *)(v2 + 32) + 1400) photosScrubber];
      [v13 setPlayer:v12];

      uint64_t v14 = *(void *)(v2 + 32);
      uint64_t v15 = *(void *)(v14 + 1408);
      id v16 = [*(id *)(v14 + 1400) photosScrubber];
      [v16 setFilmstripViewProvider:v15];

      [*(id *)(*(void *)(v2 + 32) + 1400) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(v2 + 32) mediaDuration];
      double v18 = v17;
      v19 = [*(id *)(*(void *)(v2 + 32) + 1400) photosScrubber];
      [v19 setEstimatedDuration:v18];

      [*(id *)(*(void *)(v2 + 32) + 1400) addObserver:*(void *)(v2 + 32) forKeyPath:@"userInteractingWithScrubber" options:1 context:0];
      v20 = [*(id *)(*(void *)(v2 + 32) + 1400) scrollView];
      [v20 setContentInsetAdjustmentBehavior:2];

      [*(id *)(*(void *)(v2 + 32) + 1400) setAlpha:0.0];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke_2;
      v43[3] = &unk_2642F5430;
      v43[4] = *(void *)(v2 + 32);
      [MEMORY[0x263F82E00] animateWithDuration:v43 animations:0.2];
      [*(id *)(*(void *)(v2 + 32) + 1392) addSubview:*(void *)(*(void *)(v2 + 32) + 1400)];
      [*(id *)(*(void *)(v2 + 32) + 1384) addSubview:*(void *)(*(void *)(v2 + 32) + 1392)];
      v21 = [*(id *)(*(void *)(v2 + 32) + 1384) leadingAnchor];
      uint64_t v22 = [*(id *)(*(void *)(v2 + 32) + 1400) leadingAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v23 setActive:1];

      v24 = [*(id *)(*(void *)(v2 + 32) + 1384) trailingAnchor];
      v25 = [*(id *)(*(void *)(v2 + 32) + 1400) trailingAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      [v26 setActive:1];

      v27 = [*(id *)(*(void *)(v2 + 32) + 1384) topAnchor];
      uint64_t v28 = [*(id *)(*(void *)(v2 + 32) + 1400) topAnchor];
      v29 = [v27 constraintEqualToAnchor:v28];
      [v29 setActive:1];

      uint64_t v30 = [*(id *)(*(void *)(v2 + 32) + 1384) bottomAnchor];
      int v31 = [*(id *)(*(void *)(v2 + 32) + 1400) bottomAnchor];
      v32 = [v30 constraintEqualToAnchor:v31];
      [v32 setActive:1];

      uint64_t v33 = *(void *)(v2 + 32);
      id v34 = *(void **)(v33 + 1384);
      uint64_t v35 = (void *)MEMORY[0x263F08938];
      v46 = @"scrubberContainerScrollView";
      v47[0] = *(void *)(v33 + 1392);
      v36 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      v37 = [v35 constraintsWithVisualFormat:@"H:|[scrubberContainerScrollView]|" options:0 metrics:0 views:v36];
      [v34 addConstraints:v37];

      uint64_t v38 = *(void *)(v2 + 32);
      v39 = *(void **)(v38 + 1384);
      v40 = (void *)MEMORY[0x263F08938];
      v44 = @"scrubberContainerScrollView";
      uint64_t v45 = *(void *)(v38 + 1392);
      v41 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v42 = [v40 constraintsWithVisualFormat:@"V:|[scrubberContainerScrollView]|" options:0 metrics:0 views:v41];
      [v39 addConstraints:v42];

      return [*(id *)(v2 + 32) showTimeLabelIfNeeded];
    }
  }
  return result;
}

uint64_t __52__QLAudioItemViewController_addScrubberWithDeferral__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1400) setAlpha:1.0];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLAudioItemViewController;
  [(QLMediaItemViewController *)&v4 previewDidAppear:a3];
  self->_previewIsVisisble = 1;
  [(QLAudioItemViewController *)self addScrubberWithDeferral];
}

- (void)previewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLAudioItemViewController;
  [(QLMediaItemViewController *)&v4 previewDidDisappear:a3];
  self->_previewIsVisisble = 0;
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return a3 & 1;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"QLDoneButtonIdentifier"]) {
    [(QLMediaItemBaseViewController *)self stop];
  }
  v8.receiver = self;
  v8.super_class = (Class)QLAudioItemViewController;
  [(QLMediaItemBaseViewController *)&v8 buttonPressedWithIdentifier:v6 completionHandler:v7];
}

- (void)setPlayControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(QLOverlayPlayButton *)self->_playButton alpha];
  if (v7 == (double)v5)
  {
    if (v4)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __60__QLAudioItemViewController_setPlayControlsHidden_animated___block_invoke;
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

uint64_t __60__QLAudioItemViewController_setPlayControlsHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1376) setAlpha:v1];
}

- (void)didChangePlayingStatus
{
  int64_t v3 = [(QLMediaItemBaseViewController *)self playingStatus];
  BOOL v4 = [(QLVideoScrubberView *)self->_scrubber isUserInteractingWithScrubber];
  uint64_t v5 = 1;
  if (!v4 && v3 != 1) {
    uint64_t v5 = [(QLMediaItemBaseViewController *)self playable] ^ 1;
  }

  [(QLAudioItemViewController *)self setPlayControlsHidden:v5 animated:0];
}

- (id)accessoryView
{
  return self->_scrubberContainer;
}

- (id)timeLabelScrollView
{
  return [(QLVideoScrubberView *)self->_scrubber scrollView];
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)transitionDidStart:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 || [(QLMediaItemBaseViewController *)self playingStatus] != 1)
  {
    [(QLAudioItemViewController *)self setPlayControlsHidden:!v3 animated:1];
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  if (!a4 && [(QLMediaItemBaseViewController *)self playingStatus] != 1)
  {
    [(QLAudioItemViewController *)self setPlayControlsHidden:0 animated:1];
  }
}

- (void)setupConstraints
{
  if (self->_backgroundIconImageView)
  {
    [(QLAudioItemViewController *)self waveformImageDimension];
    double v4 = v3;
    [(QLAudioItemViewController *)self maximumWaveformDimension];
    double v6 = v4 / v5 * 13.0;
    double v7 = [(QLAudioItemViewController *)self view];
    objc_super v8 = (void *)MEMORY[0x263F08938];
    uint64_t v9 = [(QLAudioItemViewController *)self view];
    BOOL v10 = [v8 constraintWithItem:v9 attribute:10 relatedBy:0 toItem:self->_backgroundIconImageView attribute:10 multiplier:1.0 constant:v6];
    [v7 addConstraint:v10];

    id v11 = [(QLAudioItemViewController *)self view];
    objc_super v12 = (void *)MEMORY[0x263F08938];
    v13 = [(QLAudioItemViewController *)self view];
    uint64_t v14 = [v12 constraintWithItem:v13 attribute:9 relatedBy:0 toItem:self->_backgroundIconImageView attribute:9 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v14];
  }
  if (self->_playButton)
  {
    uint64_t v15 = [(QLAudioItemViewController *)self view];
    id v16 = (void *)MEMORY[0x263F08938];
    double v17 = [(QLAudioItemViewController *)self view];
    double v18 = [v16 constraintWithItem:v17 attribute:9 relatedBy:0 toItem:self->_playButton attribute:9 multiplier:1.0 constant:0.0];
    [v15 addConstraint:v18];

    id v22 = [(QLAudioItemViewController *)self view];
    v19 = (void *)MEMORY[0x263F08938];
    v20 = [(QLAudioItemViewController *)self view];
    v21 = [v19 constraintWithItem:v20 attribute:10 relatedBy:0 toItem:self->_playButton attribute:10 multiplier:1.0 constant:0.0];
    [v22 addConstraint:v21];
  }
}

- (double)waveformImageDimension
{
  double v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 bounds];
  double v8 = v7;

  if (v5 >= v8) {
    double v5 = v8;
  }
  [(QLAudioItemViewController *)self maximumWaveformDimension];
  double v10 = v5 - v9;
  [(QLAudioItemViewController *)self maximumWaveformDimension];
  if (v10 < result) {
    return v10;
  }
  return result;
}

- (id)iconImageWithConfiguration:(id)a3
{
  return (id)[MEMORY[0x263F827E8] systemImageNamed:@"waveform.path" withConfiguration:a3];
}

- (id)imageAccessibilityIdentifier
{
  return @"QLAudioItemViewControllerQuickTimeImageViewAccessibilityIdentifier";
}

- (BOOL)usesScrubber
{
  return 1;
}

- (double)maximumWaveformDimension
{
  return 200.0;
}

- (BOOL)supportsChromeless
{
  return 0;
}

- (NSLayoutConstraint)topScrubber
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setTopScrubber:(id)a3
{
}

- (UIView)scrubberContainer
{
  return (UIView *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setScrubberContainer:(id)a3
{
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (double)scrubberVerticalOffset
{
  return self->_scrubberVerticalOffset;
}

- (void)setScrubberVerticalOffset:(double)a3
{
  self->_scrubberVerticalOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topScrubber, 0);
  objc_storeStrong((id *)&self->_scrubberViewProvider, 0);
  objc_storeStrong((id *)&self->_scrubber, 0);
  objc_storeStrong((id *)&self->_scrubberContainerScrollView, 0);
  objc_storeStrong((id *)&self->_scrubberContainer, 0);
  objc_storeStrong((id *)&self->_playButton, 0);

  objc_storeStrong((id *)&self->_backgroundIconImageView, 0);
}

@end