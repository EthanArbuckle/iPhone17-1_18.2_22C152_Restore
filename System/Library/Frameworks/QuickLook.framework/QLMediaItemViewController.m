@interface QLMediaItemViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldHandleRegisteringForCommandCenterHandlers;
- (QLMediaScrubberGesture)scrubGesture;
- (UITapGestureRecognizer)tapToPlayGesture;
- (id)_playingInfoWithPlaybackDuration:(double)a3 elapsedTime:(double)a4;
- (id)labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5;
- (id)registeredKeyCommands;
- (id)stringFromTimeInterval:(double)a3;
- (id)timeLabelScrollView;
- (int64_t)playbackTimeFormat;
- (int64_t)togglePlaybackFromControlCenter:(id)a3;
- (int64_t)userScrubbedInControlCenter:(id)a3;
- (int64_t)userTappedPauseInControlCenter:(id)a3;
- (int64_t)userTappedPlayInControlCenter:(id)a3;
- (void)_registerForCommandCenterHandlers;
- (void)_unregisterForCommandCenterHandlers;
- (void)_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation;
- (void)dealloc;
- (void)handlePerformedKeyCommandIfNeeded:(id)a3;
- (void)hideTimeLabel;
- (void)hideTimeLabelAfterDelay;
- (void)hideTimeLabelAnimated:(BOOL)a3;
- (void)hostApplicationDidEnterBackground:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observePlayingTime:(id *)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewIsAppearingWithProgress:(double)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)removeTimeLabel;
- (void)scrubber:(id)a3 didChangeValue:(float)a4;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setScrubGesture:(id)a3;
- (void)setTapToPlayGesture:(id)a3;
- (void)setTimeLabelNeedsUpdate;
- (void)setUpTimeLabelIfNeeded;
- (void)showTimeLabel;
- (void)showTimeLabelIfNeeded;
- (void)tapToPlayGestureChanged:(id)a3;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
@end

@implementation QLMediaItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v11[3] = &unk_2642F7260;
  v11[4] = self;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)QLMediaItemViewController;
  id v9 = v8;
  [(QLMediaItemBaseViewController *)&v10 loadPreviewControllerWithContents:a3 context:a4 completionHandler:v11];
}

uint64_t __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!a2) {
    return QLRunInMainThread();
  }
  return result;
}

void __89__QLMediaItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [QLMediaScrubberGesture alloc];
  v3 = [*(id *)(a1 + 32) player];
  uint64_t v4 = [(QLMediaScrubberGesture *)v2 initWithPlayer:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 1352);
  *(void *)(v5 + 1352) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1352), "setDelegate:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1352), "setScrubberDelegate:");
  LODWORD(v7) = 1.0;
  [*(id *)(*(void *)(a1 + 32) + 1352) setMaximumValue:v7];
  [*(id *)(*(void *)(a1 + 32) + 1352) setMinimumValue:0.0];
  uint64_t v8 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:*(void *)(a1 + 32) action:sel_tapToPlayGestureChanged_];
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 1360);
  *(void *)(v9 + 1360) = v8;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1360), "setDelegate:");
  v11 = [*(id *)(a1 + 32) view];
  [v11 addGestureRecognizer:*(void *)(*(void *)(a1 + 32) + 1352)];

  id v12 = [*(id *)(a1 + 32) view];
  [v12 addGestureRecognizer:*(void *)(*(void *)(a1 + 32) + 1360)];
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLMediaItemBaseViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  uint64_t v5 = [(QLItemViewController *)self accessoryView];
  [v5 setAlpha:a3];
}

- (void)previewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v5 previewDidAppear:a3];
  [(QLMediaItemViewController *)self showTimeLabelIfNeeded];
  uint64_t v4 = [(QLItemViewController *)self accessoryView];
  [v4 setAlpha:1.0];

  [(UIView *)self->_timeLabelBackground setHidden:0];
  if ([(QLMediaItemViewController *)self shouldHandleRegisteringForCommandCenterHandlers])
  {
    [(QLMediaItemViewController *)self _registerForCommandCenterHandlers];
    [(QLMediaItemViewController *)self _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation];
  }
}

- (void)previewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMediaItemViewController;
  [(QLItemViewController *)&v4 previewWillDisappear:a3];
  [(UIView *)self->_timeLabelBackground setHidden:1];
}

- (void)previewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v6 previewDidDisappear:a3];
  [(QLMediaItemViewController *)self removeTimeLabel];
  if ([(QLMediaItemViewController *)self shouldHandleRegisteringForCommandCenterHandlers])
  {
    objc_super v4 = [MEMORY[0x263F12118] defaultCenter];
    [v4 setNowPlayingInfo:0];

    objc_super v5 = [MEMORY[0x263F12118] defaultCenter];
    [v5 setRepresentedApplicationBundleIdentifier:0];

    [(QLMediaItemViewController *)self _unregisterForCommandCenterHandlers];
  }
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v6 previewBecameFullScreen:a3 animated:a4];
  if (v4) {
    [(QLMediaItemViewController *)self hideTimeLabelAnimated:0];
  }
  else {
    [(QLMediaItemViewController *)self showTimeLabelIfNeeded];
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemViewController;
  -[QLItemViewController transitionDidFinish:didComplete:](&v6, sel_transitionDidFinish_didComplete_, a3);
  if (!a4) {
    [(UIView *)self->_timeLabelBackground setHidden:0];
  }
}

- (void)dealloc
{
  [(UIScrollView *)self->_scrubberScrollView removeObserver:self forKeyPath:@"contentOffset"];
  v3.receiver = self;
  v3.super_class = (Class)QLMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_scrubberScrollView == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", @"contentOffset", a4, a5))
    {
      [(QLMediaItemViewController *)self setTimeLabelNeedsUpdate];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLMediaItemViewController;
    -[QLMediaItemBaseViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  if (([a3 BOOLValue] & 1) == 0)
  {
    [(QLMediaItemViewController *)self _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation];
  }
}

- (BOOL)shouldHandleRegisteringForCommandCenterHandlers
{
  return 1;
}

- (void)observePlayingTime:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLMediaItemViewController;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(QLMediaItemBaseViewController *)&v5 observePlayingTime:&v4];
  [(QLMediaItemViewController *)self setTimeLabelNeedsUpdate];
}

- (id)timeLabelScrollView
{
  return 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(QLItemViewController *)self appearance];
  v17.receiver = self;
  v17.super_class = (Class)QLMediaItemViewController;
  [(QLMediaItemBaseViewController *)&v17 setAppearance:v6 animated:v4];
  [(QLMediaItemViewController *)self setTimeLabelNeedsUpdate];
  -[QLMediaScrubberGesture setEnabled:](self->_scrubGesture, "setEnabled:", [v6 presentationMode] == 5);
  -[UITapGestureRecognizer setEnabled:](self->_tapToPlayGesture, "setEnabled:", [v6 presentationMode] == 5);
  uint64_t v8 = [v6 presentationMode];

  BOOL v9 = v8 != 5;
  objc_super v10 = [(QLScrollableContentItemViewController *)self scrollView];
  v11 = [v10 pinchGestureRecognizer];
  [v11 setEnabled:v9];

  uint64_t v12 = [v7 presentationMode];
  v13 = [(QLItemViewController *)self appearance];
  uint64_t v14 = [v13 presentationMode];

  if (v12 != v14)
  {
    v15 = [(QLItemViewController *)self appearance];
    uint64_t v16 = [v15 presentationMode];

    if (v16 == 4) {
      [(QLMediaItemViewController *)self hideTimeLabelAnimated:0];
    }
    else {
      [(QLMediaItemViewController *)self showTimeLabelIfNeeded];
    }
  }
}

- (void)setUpTimeLabelIfNeeded
{
  v57[1] = *MEMORY[0x263EF8340];
  if (!self->_timeLabelBackground)
  {
    v48 = [(QLMediaItemViewController *)self timeLabelScrollView];
    objc_super v3 = (UIView *)objc_opt_new();
    timeLabelBackground = self->_timeLabelBackground;
    self->_timeLabelBackground = v3;

    objc_super v5 = [(UIView *)self->_timeLabelBackground layer];
    [v5 setCornerRadius:2.0];

    id v6 = self->_timeLabelBackground;
    objc_super v7 = (void *)MEMORY[0x263F825C8];
    uint64_t v8 = QLFrameworkBundle();
    BOOL v9 = [v7 colorNamed:@"QLSquaredLabelBackgroundColor" inBundle:v8 compatibleWithTraitCollection:0];
    [(UIView *)v6 setBackgroundColor:v9];

    [(UIView *)self->_timeLabelBackground setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_timeLabelBackground setAlpha:0.0];
    objc_super v10 = [(QLMediaItemViewController *)self view];
    [v10 addSubview:self->_timeLabelBackground];

    v11 = (void *)MEMORY[0x263F08938];
    uint64_t v12 = self->_timeLabelBackground;
    v13 = [(QLMediaItemViewController *)self view];
    uint64_t v14 = [v11 constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];
    timeLabelConstraintX = self->_timeLabelConstraintX;
    self->_timeLabelConstraintX = v14;

    uint64_t v16 = [(QLMediaItemViewController *)self view];
    [v16 addConstraint:self->_timeLabelConstraintX];

    objc_super v17 = (void *)MEMORY[0x263F08938];
    v18 = self->_timeLabelBackground;
    v19 = [(QLMediaItemViewController *)self view];
    v20 = [v17 constraintWithItem:v18 attribute:4 relatedBy:0 toItem:v19 attribute:4 multiplier:1.0 constant:0.0];
    objc_msgSend(v20, "ql_activatedConstraint");
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    timeLabelConstraintY = self->_timeLabelConstraintY;
    self->_timeLabelConstraintY = v21;

    v23 = [MEMORY[0x263F81708] defaultFontForTextStyle:*MEMORY[0x263F83590]];
    v24 = [v23 fontDescriptor];
    uint64_t v56 = *MEMORY[0x263F81748];
    uint64_t v25 = *MEMORY[0x263F817B0];
    v53[0] = *MEMORY[0x263F817B8];
    v53[1] = v25;
    v54[0] = &unk_26C9132B8;
    v54[1] = &unk_26C9132D0;
    v26 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    v55 = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
    v57[0] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
    v29 = [v24 fontDescriptorByAddingAttributes:v28];

    v30 = (void *)MEMORY[0x263F81708];
    [v23 pointSize];
    v31 = objc_msgSend(v30, "fontWithDescriptor:size:", v29);

    v32 = (UILabel *)objc_opt_new();
    timeLabel = self->_timeLabel;
    self->_timeLabel = v32;

    [(UILabel *)self->_timeLabel setFont:v31];
    [(UILabel *)self->_timeLabel setTextAlignment:1];
    [(UILabel *)self->_timeLabel setNumberOfLines:1];
    v34 = self->_timeLabel;
    v35 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v34 setBackgroundColor:v35];

    [(UILabel *)self->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_timeLabelBackground addSubview:self->_timeLabel];
    v36 = self->_timeLabelBackground;
    v37 = (void *)MEMORY[0x263F08938];
    v38 = self->_timeLabel;
    v51 = @"label";
    v52 = v38;
    v39 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    v40 = [v37 constraintsWithVisualFormat:@"V:|-(2)-[label]-(2)-|" options:0 metrics:0 views:v39];
    [(UIView *)v36 addConstraints:v40];

    v41 = self->_timeLabelBackground;
    v42 = (void *)MEMORY[0x263F08938];
    v49 = @"label";
    v50 = self->_timeLabel;
    v43 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v44 = [v42 constraintsWithVisualFormat:@"H:|-(8)-[label]-(8)-|" options:0 metrics:0 views:v43];
    [(UIView *)v41 addConstraints:v44];

    scrubberScrollView = self->_scrubberScrollView;
    if (scrubberScrollView)
    {
      if (scrubberScrollView != v48) {
        [(UIScrollView *)scrubberScrollView removeObserver:self forKeyPath:@"contentOffset"];
      }
    }
    v46 = self->_scrubberScrollView;
    self->_scrubberScrollView = v48;
    v47 = v48;

    [(UIScrollView *)self->_scrubberScrollView addObserver:self forKeyPath:@"contentOffset" options:1 context:self->_scrubberScrollView];
    [(QLMediaItemViewController *)self setTimeLabelNeedsUpdate];
  }
}

- (void)removeTimeLabel
{
  [(UIView *)self->_timeLabelBackground removeFromSuperview];
  timeLabelBackground = self->_timeLabelBackground;
  self->_timeLabelBackground = 0;

  [(UILabel *)self->_timeLabel removeFromSuperview];
  timeLabel = self->_timeLabel;
  self->_timeLabel = 0;

  [(UIScrollView *)self->_scrubberScrollView removeObserver:self forKeyPath:@"contentOffset"];
  scrubberScrollView = self->_scrubberScrollView;
  self->_scrubberScrollView = 0;
}

- (int64_t)playbackTimeFormat
{
  if ([(QLMediaItemBaseViewController *)self playingStatus] == 2)
  {
    [(QLMediaItemBaseViewController *)self remainingTime];
    if (v3 > 1.0) {
      return 2;
    }
  }
  if ([(QLMediaItemBaseViewController *)self playingStatus] != 1) {
    return 1;
  }
  [(QLMediaItemBaseViewController *)self elapsedTime];
  if (v5 < 5.0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)setTimeLabelNeedsUpdate
{
  self->_int64_t playbackTimeFormat = [(QLMediaItemViewController *)self playbackTimeFormat];
  if ([(UIScrollView *)self->_scrubberScrollView isDragging]
    || [(UIScrollView *)self->_scrubberScrollView isDecelerating]
    || [(QLMediaScrubberGesture *)self->_scrubGesture state] == 1
    || [(QLMediaScrubberGesture *)self->_scrubGesture state] == 2)
  {
    self->_int64_t playbackTimeFormat = 1;
    [(QLMediaItemViewController *)self showTimeLabelIfNeeded];
    [(QLMediaItemViewController *)self hideTimeLabelAfterDelay];
    [(UIScrollView *)self->_scrubberScrollView contentOffset];
    double v4 = v3;
    [(UIScrollView *)self->_scrubberScrollView contentSize];
    double v6 = v5;
    [(UIScrollView *)self->_scrubberScrollView contentInset];
    double v8 = v7;
    [(UIScrollView *)self->_scrubberScrollView contentInset];
    if (v4 >= -v9)
    {
      double v11 = 0.0;
      if (v4 <= v6 - v8)
      {
LABEL_10:
        [(NSLayoutConstraint *)self->_timeLabelConstraintX setConstant:v11];
        goto LABEL_11;
      }
      double v10 = v4 - (v6 - v8);
    }
    else
    {
      double v10 = v4 + v9;
    }
    double v11 = -v10;
    goto LABEL_10;
  }
LABEL_11:
  timeLabel = self->_timeLabel;
  int64_t playbackTimeFormat = self->_playbackTimeFormat;
  [(QLMediaItemBaseViewController *)self elapsedTime];
  double v15 = v14;
  [(QLMediaItemBaseViewController *)self remainingTime];
  objc_super v17 = [(QLMediaItemViewController *)self labelTextWithFormat:playbackTimeFormat elapsedInterval:v15 remainingInterval:v16];
  [(UILabel *)timeLabel setText:v17];

  [(UILabel *)self->_timeLabel sizeToFit];
  v18 = [(QLItemViewController *)self appearance];
  [v18 bottomInset];
  double v20 = -(v19 + 5.0);

  [(NSLayoutConstraint *)self->_timeLabelConstraintY constant];
  if (v21 != v20)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__QLMediaItemViewController_setTimeLabelNeedsUpdate__block_invoke;
    v22[3] = &unk_2642F55B8;
    v22[4] = self;
    *(double *)&v22[5] = v20;
    [MEMORY[0x263F82E00] animateWithDuration:v22 animations:0.2];
  }
  [(QLMediaItemViewController *)self _updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation];
}

uint64_t __52__QLMediaItemViewController_setTimeLabelNeedsUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1312) setConstant:*(double *)(a1 + 40)];
}

- (void)showTimeLabelIfNeeded
{
  if ([(QLMediaItemBaseViewController *)self isFullScreen]) {
    return;
  }
  id v6 = [(QLItemViewController *)self appearance];
  if ([v6 presentationMode] == 4) {
    goto LABEL_6;
  }
  double v3 = [(QLItemViewController *)self appearance];
  if ([v3 presentationMode] == 3)
  {

LABEL_6:

    return;
  }
  double v4 = [(QLItemViewController *)self appearance];
  uint64_t v5 = [v4 presentationMode];

  if (v5)
  {
    [(QLMediaItemViewController *)self showTimeLabel];
    [(QLMediaItemViewController *)self hideTimeLabelAfterDelay];
  }
}

- (void)showTimeLabel
{
  [(QLMediaItemViewController *)self setUpTimeLabelIfNeeded];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__QLMediaItemViewController_showTimeLabel__block_invoke;
  v3[3] = &unk_2642F5430;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:0.5];
}

uint64_t __42__QLMediaItemViewController_showTimeLabel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1280) setAlpha:1.0];
}

- (void)hideTimeLabelAfterDelay
{
  playbackTimeHiddenTimer = self->_playbackTimeHiddenTimer;
  if (playbackTimeHiddenTimer)
  {
    [(NSTimer *)playbackTimeHiddenTimer invalidate];
    double v4 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = 0;
  }
  [(UIView *)self->_timeLabelBackground alpha];
  if (v5 == 1.0)
  {
    id v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_hideTimeLabel selector:0 userInfo:0 repeats:2.0];
    double v7 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = v6;
    MEMORY[0x270F9A758](v6, v7);
  }
}

- (void)hideTimeLabel
{
}

- (void)hideTimeLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__QLMediaItemViewController_hideTimeLabelAnimated___block_invoke;
  aBlock[3] = &unk_2642F5430;
  aBlock[4] = self;
  double v5 = _Block_copy(aBlock);
  id v6 = v5;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:v5 animations:0.4];
  }
  else {
    (*((void (**)(void *))v5 + 2))(v5);
  }
  playbackTimeHiddenTimer = self->_playbackTimeHiddenTimer;
  if (playbackTimeHiddenTimer)
  {
    [(NSTimer *)playbackTimeHiddenTimer invalidate];
    double v8 = self->_playbackTimeHiddenTimer;
    self->_playbackTimeHiddenTimer = 0;
  }
}

uint64_t __51__QLMediaItemViewController_hideTimeLabelAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1280) setAlpha:0.0];
}

- (id)labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5
{
  switch(a3)
  {
    case 3:
      double v9 = NSString;
      double v8 = [(QLMediaItemViewController *)self stringFromTimeInterval:a4];
      double v10 = [(QLMediaItemViewController *)self stringFromTimeInterval:a5];
      double v11 = [v9 stringWithFormat:@"%@ / -%@", v8, v10];

LABEL_8:
      goto LABEL_10;
    case 2:
      uint64_t v12 = NSString;
      double v8 = [(QLMediaItemViewController *)self stringFromTimeInterval:a5];
      [v12 stringWithFormat:@"-%@", v8];
      goto LABEL_7;
    case 1:
      double v7 = NSString;
      double v8 = [(QLMediaItemViewController *)self stringFromTimeInterval:a4];
      [v7 stringWithFormat:@" %@", v8];
      double v11 = LABEL_7:;
      goto LABEL_8;
  }
  double v11 = 0;
LABEL_10:

  return v11;
}

- (id)stringFromTimeInterval:(double)a3
{
  if (stringFromTimeInterval__onceToken_0 != -1) {
    dispatch_once(&stringFromTimeInterval__onceToken_0, &__block_literal_global_16);
  }
  double v4 = &stringFromTimeInterval__hourMinuteSecondFormatter;
  if (a3 < 3600.0) {
    double v4 = &stringFromTimeInterval__minuteSecondFormatter_0;
  }
  double v5 = (void *)*v4;

  return (id)[v5 stringFromTimeInterval:a3];
}

uint64_t __52__QLMediaItemViewController_stringFromTimeInterval___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)stringFromTimeInterval__minuteSecondFormatter_0;
  stringFromTimeInterval__minuteSecondFormatter_0 = (uint64_t)v0;

  [(id)stringFromTimeInterval__minuteSecondFormatter_0 setAllowedUnits:192];
  [(id)stringFromTimeInterval__minuteSecondFormatter_0 setUnitsStyle:0];
  [(id)stringFromTimeInterval__minuteSecondFormatter_0 setZeroFormattingBehavior:0x10000];
  id v2 = objc_alloc_init(MEMORY[0x263F08780]);
  BOOL v3 = (void *)stringFromTimeInterval__hourMinuteSecondFormatter;
  stringFromTimeInterval__hourMinuteSecondFormatter = (uint64_t)v2;

  [(id)stringFromTimeInterval__hourMinuteSecondFormatter setAllowedUnits:224];
  [(id)stringFromTimeInterval__hourMinuteSecondFormatter setUnitsStyle:0];
  double v4 = (void *)stringFromTimeInterval__hourMinuteSecondFormatter;

  return [v4 setZeroFormattingBehavior:0x10000];
}

- (id)_playingInfoWithPlaybackDuration:(double)a3 elapsedTime:(double)a4
{
  if (!self->_playingInfo)
  {
    double v7 = (void *)MEMORY[0x263F11E08];
    double v8 = [(QLMediaItemBaseViewController *)self mediaAsset];
    double v9 = [(QLItemViewController *)self context];
    double v10 = [v9 previewTitle];
    double v11 = [v7 playingInfoFromAsset:v8 withDefaultTitle:v10];
    uint64_t v12 = (NSMutableDictionary *)[v11 mutableCopy];
    playingInfo = self->_playingInfo;
    self->_playingInfo = v12;
  }
  double v14 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_playingInfo setObject:v14 forKeyedSubscript:*MEMORY[0x263F11380]];

  double v15 = [NSNumber numberWithDouble:a4];
  [(NSMutableDictionary *)self->_playingInfo setObject:v15 forKeyedSubscript:*MEMORY[0x263F11C18]];

  double v16 = self->_playingInfo;

  return v16;
}

- (void)_registerForCommandCenterHandlers
{
  id v7 = [MEMORY[0x263F121B0] sharedCommandCenter];
  BOOL v3 = [v7 playCommand];
  [v3 addTarget:self action:sel_userTappedPlayInControlCenter_];

  double v4 = [v7 pauseCommand];
  [v4 addTarget:self action:sel_userTappedPauseInControlCenter_];

  double v5 = [v7 changePlaybackPositionCommand];
  [v5 addTarget:self action:sel_userScrubbedInControlCenter_];

  id v6 = [v7 togglePlayPauseCommand];
  [v6 addTarget:self action:sel_togglePlaybackFromControlCenter_];
}

- (void)_unregisterForCommandCenterHandlers
{
  id v7 = [MEMORY[0x263F121B0] sharedCommandCenter];
  BOOL v3 = [v7 pauseCommand];
  [v3 removeTarget:self];

  double v4 = [v7 playCommand];
  [v4 removeTarget:self];

  double v5 = [v7 changePlaybackPositionCommand];
  [v5 removeTarget:self];

  id v6 = [v7 togglePlayPauseCommand];
  [v6 removeTarget:self];
}

- (int64_t)userTappedPlayInControlCenter:(id)a3
{
  if ([(QLMediaItemBaseViewController *)self play]) {
    return 0;
  }
  else {
    return 200;
  }
}

- (int64_t)userTappedPauseInControlCenter:(id)a3
{
  if ([(QLMediaItemBaseViewController *)self pause]) {
    return 0;
  }
  else {
    return 200;
  }
}

- (int64_t)userScrubbedInControlCenter:(id)a3
{
  memset(&v14, 0, sizeof(v14));
  [a3 positionTime];
  Float64 v5 = v4;
  id v6 = [(QLMediaItemBaseViewController *)self player];
  id v7 = v6;
  if (v6)
  {
    [v6 currentTime];
    LODWORD(v6) = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  CMTimeMakeWithSeconds(&v14, v5, (int32_t)v6);

  double v8 = [(QLMediaItemBaseViewController *)self player];
  CMTime v10 = v14;
  [v8 seekToTime:&v10];

  return 0;
}

- (int64_t)togglePlaybackFromControlCenter:(id)a3
{
  if ([(QLMediaItemBaseViewController *)self togglePlayback]) {
    return 0;
  }
  else {
    return 200;
  }
}

- (void)_updateCommandCenterPlayingInfoWithCurrentPlaybackTimeInformation
{
  if ([(QLMediaItemBaseViewController *)self isVisible]
    && [(QLMediaItemViewController *)self shouldHandleRegisteringForCommandCenterHandlers])
  {
    BOOL v3 = [MEMORY[0x263F12118] defaultCenter];
    [(QLMediaItemBaseViewController *)self mediaDuration];
    double v5 = v4;
    [(QLMediaItemBaseViewController *)self elapsedTime];
    id v7 = [(QLMediaItemViewController *)self _playingInfoWithPlaybackDuration:v5 elapsedTime:v6];
    [v3 setNowPlayingInfo:v7];

    id v10 = [MEMORY[0x263F12118] defaultCenter];
    double v8 = [(QLItemViewController *)self presentingDelegate];
    double v9 = [v8 parentApplicationDisplayIdentifier];
    [v10 setRepresentedApplicationBundleIdentifier:v9];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_scrubGesture != a3) {
    return self->_tapToPlayGesture == a3;
  }
  double v4 = [(QLMediaItemBaseViewController *)self player];
  [v4 rate];
  BOOL v3 = v5 != 0.0;

  return v3;
}

- (void)tapToPlayGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    [(QLMediaItemBaseViewController *)self togglePlayback];
  }
}

- (id)registeredKeyCommands
{
  v11[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F82890] keyCommandWithInput:@" " modifierFlags:0 action:sel_togglePlayback];
  double v4 = QLLocalizedString();
  [v3 setDiscoverabilityTitle:v4];

  float v5 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v3 identifier:4];
  v11[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  v10.receiver = self;
  v10.super_class = (Class)QLMediaItemViewController;
  id v7 = [(QLItemViewController *)&v10 registeredKeyCommands];
  double v8 = [v7 arrayByAddingObjectsFromArray:v6];

  return v8;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4 = a3;
  if ([v4 keyCommandIdentifier] == 4)
  {
    [(QLMediaItemBaseViewController *)self togglePlayback];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLMediaItemViewController;
    [(QLItemViewController *)&v5 handlePerformedKeyCommandIfNeeded:v4];
  }
}

- (void)scrubber:(id)a3 didChangeValue:(float)a4
{
  id v6 = a3;
  id v7 = self->_isSeeking;
  objc_sync_enter(v7);
  BOOL v8 = [(NSNumber *)self->_isSeeking BOOLValue];
  objc_sync_exit(v7);

  if (!v8)
  {
    [(QLMediaItemViewController *)self showTimeLabel];
    memset(&v25, 0, sizeof(v25));
    double v9 = [(QLMediaItemBaseViewController *)self player];
    objc_super v10 = [v9 currentItem];
    uint64_t v11 = [v10 asset];
    uint64_t v12 = v11;
    if (v11) {
      [v11 duration];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }

    memset(&v24, 0, sizeof(v24));
    CMTime time = v25;
    CMTimeMultiplyByFloat64(&v24, &time, a4);
    uint64_t v13 = self->_isSeeking;
    objc_sync_enter(v13);
    isSeeking = self->_isSeeking;
    self->_isSeeking = (NSNumber *)MEMORY[0x263EFFA88];

    objc_sync_exit(v13);
    objc_initWeak(&location, self);
    double v15 = [(QLMediaItemBaseViewController *)self player];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__QLMediaItemViewController_scrubber_didChangeValue___block_invoke;
    v20[3] = &unk_2642F6BC8;
    objc_copyWeak(&v21, &location);
    CMTime time = v24;
    long long v18 = *MEMORY[0x263F010E0];
    uint64_t v19 = *(void *)(MEMORY[0x263F010E0] + 16);
    long long v16 = v18;
    uint64_t v17 = v19;
    [v15 seekToTime:&time toleranceBefore:&v18 toleranceAfter:&v16 completionHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __53__QLMediaItemViewController_scrubber_didChangeValue___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = WeakRetained[168];
    objc_sync_enter(v2);
    id v3 = v4[168];
    v4[168] = (id)MEMORY[0x263EFFA80];

    objc_sync_exit(v2);
    WeakRetained = v4;
  }
}

- (QLMediaScrubberGesture)scrubGesture
{
  return self->_scrubGesture;
}

- (void)setScrubGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapToPlayGesture
{
  return self->_tapToPlayGesture;
}

- (void)setTapToPlayGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToPlayGesture, 0);
  objc_storeStrong((id *)&self->_scrubGesture, 0);
  objc_storeStrong((id *)&self->_isSeeking, 0);
  objc_storeStrong((id *)&self->_playbackTimeHiddenTimer, 0);
  objc_storeStrong((id *)&self->_timeLabelConstraintY, 0);
  objc_storeStrong((id *)&self->_timeLabelConstraintX, 0);
  objc_storeStrong((id *)&self->_scrubberScrollView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_timeLabelBackground, 0);

  objc_storeStrong((id *)&self->_playingInfo, 0);
}

@end