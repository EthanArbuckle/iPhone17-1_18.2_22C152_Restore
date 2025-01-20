@interface ETTranscriptDetailCanvasViewController
- (BOOL)_canLoopMessageDuringPlayback:(id)a3;
- (BOOL)_canShowCompositionControls;
- (BOOL)_gestureInstructionViewIsShown;
- (BOOL)_isRecognizer:(id)a3 closeToButton:(id)a4;
- (BOOL)_shouldAutoSend;
- (BOOL)_shouldDimColorPicker;
- (BOOL)_shouldRestrictOrientation;
- (BOOL)_shouldShowCancelButton;
- (BOOL)_shouldShowOnButton;
- (BOOL)_shouldShowSendButton;
- (BOOL)_showingSendInProgress;
- (BOOL)_tapRecognizerShouldBegin:(id)a3;
- (BOOL)canExpireMessages;
- (BOOL)canShowReplayButton;
- (BOOL)shouldAutorotate;
- (BOOL)usesCompactKeyboardLayout;
- (ETTranscriptDetailCanvasViewController)init;
- (ETTranscriptDetailCanvasViewControllerPresentationDelegate)presentationDelegate;
- (double)_topMarginForColorPicker;
- (double)elapsedTimeSinceStartOfMessage:(id)a3;
- (id)_largeVideoOnButton;
- (id)_smallVideoOnButton;
- (id)_videoProgressTimeString:(unint64_t)a3;
- (id)colorPicker;
- (unint64_t)supportedInterfaceOrientations;
- (void)_backToPreviewButtonTapped;
- (void)_cameraFlipButtonTapped;
- (void)_cancelButtonTapped;
- (void)_clearPhotoSendMessageTimer;
- (void)_composingOnlyIntroMessageType:(BOOL)a3;
- (void)_dismissColorWheel;
- (void)_endIntroMessage;
- (void)_endMediaMessageComposition;
- (void)_endPhotoMessageComposition;
- (void)_expandColorPickerButtonTapped;
- (void)_expandToCameraButtonTapped;
- (void)_gestureInstructionButtonTapped;
- (void)_hideVideoController;
- (void)_moveComposedMessagesIntoMediaMessage;
- (void)_photoCaptureButtonTapped;
- (void)_photoSendMessageTimerFired;
- (void)_sendButtonTapped;
- (void)_setCameraEnabled:(BOOL)a3;
- (void)_setEntryViewHidden:(BOOL)a3;
- (void)_setShowingCompositionControls:(BOOL)a3 animated:(BOOL)a4;
- (void)_setShowingGestureInstructionView:(BOOL)a3;
- (void)_setShowingVideoProgress:(BOOL)a3;
- (void)_setVideoZoomEnabled:(BOOL)a3;
- (void)_showCompositionControlsTimerFired;
- (void)_showWriteErrorAlertForMediaType:(unint64_t)a3 outOfSpaceError:(BOOL)a4 completion:(id)a5;
- (void)_startCameraPreview;
- (void)_startPhotoSendMessageTimer;
- (void)_startShowCompositionControlsTimer;
- (void)_updateBackToPreviewButton;
- (void)_updateCompositionControls;
- (void)_updateCompositionControlsCenter;
- (void)_updateGestureInstructionButton;
- (void)_updateGestureInstructionViewFrame;
- (void)_updateLandscapeTrap;
- (void)_updateMediaInstructionView;
- (void)_updateSendButton;
- (void)_updateSkipButtonFrame;
- (void)_updateVideoOnButtonForHorizontalSizeClass:(int64_t)a3;
- (void)_updateVideoOnButtonOpacity;
- (void)_updateVideoPreviewFrame;
- (void)_updateVideoProgressFrame;
- (void)_updateVideoRecorderTime:(unint64_t)a3;
- (void)_videoRecordButtonTapped;
- (void)_videoZoomGestureRecognized:(id)a3;
- (void)canvasView:(id)a3 didUpdateComposingMessageType:(unsigned __int16)a4;
- (void)colorPicker:(id)a3 requestsPresentColorWheel:(id)a4;
- (void)dataSource:(id)a3 startPlaybackWithCompletion:(id)a4;
- (void)dataSourceStopPlayback:(id)a3;
- (void)didBeginComposingMessage;
- (void)didChangeColorPickerColor;
- (void)didEndComposingMessage;
- (void)expandUI;
- (void)loadView;
- (void)setPlayingMessages:(BOOL)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateVideoUI;
- (void)videoControllerDidEndPhotoCapture:(id)a3 photoImage:(id)a4;
- (void)videoControllerDidEndPreview:(id)a3;
- (void)videoControllerDidEndRecording:(id)a3 mediaURL:(id)a4 withError:(id)a5;
- (void)videoControllerDidInterruptPreview:(id)a3 withInterruptionReason:(int64_t)a4;
- (void)videoControllerDidStartPreview:(id)a3;
- (void)videoControllerDidStartRecording:(id)a3;
- (void)videoControllerDidStopPreview:(id)a3;
- (void)videoControllerWillBeginPhotoCapture:(id)a3;
- (void)videoControllerWillCancelRecording:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidTransitionToCompactPresentation;
- (void)viewDidTransitionToExpandedPresentation;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ETTranscriptDetailCanvasViewController

- (ETTranscriptDetailCanvasViewController)init
{
  v62.receiver = self;
  v62.super_class = (Class)ETTranscriptDetailCanvasViewController;
  v2 = [(ETTranscriptDetailCanvasViewController *)&v62 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = +[UIButton buttonWithType:1];
    expandToCameraButton = v2->_expandToCameraButton;
    v2->_expandToCameraButton = (UIButton *)v4;

    [(UIButton *)v2->_expandToCameraButton addTarget:v2 action:"_expandToCameraButtonTapped" forControlEvents:64];
    v6 = v2->_expandToCameraButton;
    v7 = +[UIImage imageNamed:@"ExpandToCamera" inBundle:v3];
    [(UIButton *)v6 setImage:v7 forState:0];

    v8 = v2->_expandToCameraButton;
    v9 = +[UIColor whiteColor];
    [(UIButton *)v8 setTintColor:v9];

    v10 = v2->_expandToCameraButton;
    v11 = +[UIColor colorWithWhite:0.4 alpha:1.0];
    [(UIButton *)v10 setBackgroundColor:v11];

    v12 = [(UIButton *)v2->_expandToCameraButton layer];
    [v12 setCornerRadius:20.0];

    -[UIButton setFrame:](v2->_expandToCameraButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    [(UIButton *)v2->_expandToCameraButton setAlpha:0.0];
    uint64_t v13 = +[UIButton buttonWithType:1];
    expandColorPickerButton = v2->_expandColorPickerButton;
    v2->_expandColorPickerButton = (UIButton *)v13;

    [(UIButton *)v2->_expandColorPickerButton addTarget:v2 action:"_expandColorPickerButtonTapped" forControlEvents:64];
    v15 = v2->_expandColorPickerButton;
    v16 = +[UIColor clearColor];
    [(UIButton *)v15 setBackgroundColor:v16];

    v17 = [(UIButton *)v2->_expandColorPickerButton layer];
    [v17 setCornerRadius:20.0];

    v18 = [(UIButton *)v2->_expandColorPickerButton layer];
    id v19 = +[UIColor redColor];
    objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

    v20 = [(UIButton *)v2->_expandColorPickerButton layer];
    [v20 setBorderWidth:13.0];

    -[UIButton setFrame:](v2->_expandColorPickerButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    [(UIButton *)v2->_expandColorPickerButton setAlpha:0.0];
    uint64_t v21 = +[UIButton buttonWithType:1];
    sendButton = v2->_sendButton;
    v2->_sendButton = (UIButton *)v21;

    [(UIButton *)v2->_sendButton addTarget:v2 action:"_sendButtonTapped" forControlEvents:64];
    v23 = v2->_sendButton;
    v24 = +[UIImage imageNamed:@"Send" inBundle:v3];
    [(UIButton *)v23 setBackgroundImage:v24 forState:0];

    [(UIButton *)v2->_sendButton sizeToFit];
    [(UIButton *)v2->_sendButton setAlpha:0.0];
    LODWORD(v25) = -1093874483;
    [(UIButton *)v2->_sendButton setCharge:v25];
    uint64_t v26 = +[UIButton buttonWithType:1];
    cameraFlipButton = v2->_cameraFlipButton;
    v2->_cameraFlipButton = (UIButton *)v26;

    [(UIButton *)v2->_cameraFlipButton addTarget:v2 action:"_cameraFlipButtonTapped" forControlEvents:64];
    v28 = v2->_cameraFlipButton;
    v29 = +[UIImage imageNamed:@"CameraFlip" inBundle:v3];
    [(UIButton *)v28 setBackgroundImage:v29 forState:0];

    [(UIButton *)v2->_cameraFlipButton sizeToFit];
    [(UIButton *)v2->_cameraFlipButton setAlpha:0.0];
    LODWORD(v30) = -1093874483;
    [(UIButton *)v2->_cameraFlipButton setCharge:v30];
    uint64_t v31 = +[UIButton buttonWithType:1];
    backToPreviewButton = v2->_backToPreviewButton;
    v2->_backToPreviewButton = (UIButton *)v31;

    [(UIButton *)v2->_backToPreviewButton addTarget:v2 action:"_backToPreviewButtonTapped" forControlEvents:64];
    v33 = v2->_backToPreviewButton;
    v34 = +[UIImage imageNamed:@"BackToPreview" inBundle:v3];
    [(UIButton *)v33 setBackgroundImage:v34 forState:0];

    [(UIButton *)v2->_backToPreviewButton sizeToFit];
    [(UIButton *)v2->_backToPreviewButton setAlpha:0.0];
    LODWORD(v35) = -1093874483;
    [(UIButton *)v2->_backToPreviewButton setCharge:v35];
    uint64_t v36 = +[UIButton buttonWithType:1];
    gestureInstructionButton = v2->_gestureInstructionButton;
    v2->_gestureInstructionButton = (UIButton *)v36;

    [(UIButton *)v2->_gestureInstructionButton addTarget:v2 action:"_gestureInstructionButtonTapped" forControlEvents:64];
    v38 = v2->_gestureInstructionButton;
    v39 = +[UIImage imageNamed:@"GestureInstructionButton" inBundle:v3];
    [(UIButton *)v38 setBackgroundImage:v39 forState:0];

    [(UIButton *)v2->_gestureInstructionButton sizeToFit];
    [(UIButton *)v2->_gestureInstructionButton setAlpha:0.0];
    LODWORD(v40) = -1093874483;
    [(UIButton *)v2->_gestureInstructionButton setCharge:v40];
    v41 = +[ETVideoRecordButton recordingRedColorDimmed:0];
    v42 = (UIView *)objc_alloc_init((Class)UIView);
    videoProgressBar = v2->_videoProgressBar;
    v2->_videoProgressBar = v42;

    [(UIView *)v2->_videoProgressBar setBackgroundColor:v41];
    [(UIView *)v2->_videoProgressBar setAlpha:0.0];
    v44 = (UIView *)objc_alloc_init((Class)UIView);
    videoProgressDot = v2->_videoProgressDot;
    v2->_videoProgressDot = v44;

    [(UIView *)v2->_videoProgressDot setBackgroundColor:v41];
    v46 = [(UIView *)v2->_videoProgressDot layer];
    [v46 setCornerRadius:2.5];

    [(UIView *)v2->_videoProgressDot setAlpha:0.0];
    v47 = (UILabel *)objc_alloc_init((Class)UILabel);
    videoProgressTimeLabel = v2->_videoProgressTimeLabel;
    v2->_videoProgressTimeLabel = v47;

    v49 = v2->_videoProgressTimeLabel;
    v50 = +[UIColor whiteColor];
    [(UILabel *)v49 setTextColor:v50];

    [(UILabel *)v2->_videoProgressTimeLabel setTextAlignment:0];
    v51 = v2->_videoProgressTimeLabel;
    v52 = +[UIFont systemFontOfSize:16.0];
    [(UILabel *)v51 setFont:v52];

    v53 = v2->_videoProgressTimeLabel;
    v54 = [(ETTranscriptDetailCanvasViewController *)v2 _videoProgressTimeString:(unint64_t)10.0];
    [(UILabel *)v53 setText:v54];

    [(UILabel *)v2->_videoProgressTimeLabel setAlpha:0.0];
    v55 = +[UIScreen mainScreen];
    v56 = [v55 traitCollection];
    -[ETTranscriptDetailCanvasViewController _updateVideoOnButtonForHorizontalSizeClass:](v2, "_updateVideoOnButtonForHorizontalSizeClass:", [v56 horizontalSizeClass]);

    v57 = objc_alloc_init(ETLandscapeTrapView);
    landscapeTrapView = v2->_landscapeTrapView;
    v2->_landscapeTrapView = v57;

    v59 = [(ETTranscriptDetailCanvasViewController *)v2 canvasView];
    [v59 setTimeSource:v2];

    v60 = v2;
  }

  return v2;
}

- (void)loadView
{
  uint64_t v4 = objc_alloc_init(ETGestureIgnoringView);
  v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [(ETGestureIgnoringView *)v4 ignoreGesturesInView:v3];

  [(ETTranscriptDetailCanvasViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v6 viewDidLoad];
  v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 addSubview:self->_videoOnButton];
  [v3 addSubview:self->_sendButton];
  uint64_t v4 = [(ETTranscriptDetailCanvasViewController *)self _replayButton];
  [v3 addSubview:v4];

  [v3 addSubview:self->_cameraFlipButton];
  [v3 addSubview:self->_backToPreviewButton];
  [v3 addSubview:self->_videoProgressBar];
  [v3 addSubview:self->_videoProgressDot];
  [v3 addSubview:self->_videoProgressTimeLabel];
  [v3 addSubview:self->_expandToCameraButton];
  [v3 addSubview:self->_expandColorPickerButton];
  v5 = [(ETHorizontalColorPicker *)self->_expandedColorPicker colorWheel];
  [v3 addSubview:v5];

  [v3 addSubview:self->_gestureInstructionButton];
}

- (BOOL)usesCompactKeyboardLayout
{
  v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0;
  }
  objc_super v6 = [(ETTranscriptDetailCanvasViewController *)self presentationDelegate];
  unsigned __int8 v7 = [v6 canvasViewControllerUsesCompactKeyboardLayout:self];

  return v7;
}

- (id)colorPicker
{
  expandedColorPicker = self->_expandedColorPicker;
  if (!expandedColorPicker)
  {
    unint64_t v4 = -[ETHorizontalColorPicker initWithFrame:]([ETHorizontalColorPicker alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_expandedColorPicker;
    self->_expandedColorPicker = v4;

    [(ETHorizontalColorPicker *)self->_expandedColorPicker setPresentationDelegate:self];
    expandedColorPicker = self->_expandedColorPicker;
  }

  return expandedColorPicker;
}

- (void)viewDidTransitionToExpandedPresentation
{
  self->_requestedExpansion = 0;
  v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 setNeedsLayout];

  [(ETTranscriptDetailCanvasViewController *)self setPlaybackEnabled:1];
  [(ETTranscriptDetailCanvasViewController *)self startMessagePlaybackLoop];
  if (self->_expandToCameraPreview)
  {
    [(ETTranscriptDetailCanvasViewController *)self _startCameraPreview];
  }
  else if (self->_expandToGestureInstructionView)
  {
    [(ETTranscriptDetailCanvasViewController *)self _setShowingGestureInstructionView:1];
    self->_expandToGestureInstructionView = 0;
  }
  id v4 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
  [v4 setAlpha:1.0];
}

- (void)viewDidTransitionToCompactPresentation
{
  self->_requestedExpansion = 0;
  v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
  [v4 setAlpha:1.0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v5 viewDidDisappear:a3];
  if (([(ETTranscriptDetailCanvasViewController *)self ignoreAppearanceCallbacks] & 1) == 0)
  {
    if (self->_mediaMessage) {
      [(ETVideoController *)self->_videoController deleteWrittenAssets];
    }
    [(ETTranscriptDetailCanvasViewController *)self _endMediaMessageComposition];
    [(ETTranscriptDetailCanvasViewController *)self _updateColorPickerEnabled];
    id v4 = [(ETTranscriptDetailCanvasViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v4 viewWillAppear:a3];
  [(ETTranscriptDetailCanvasViewController *)self ignoreAppearanceCallbacks];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v4 viewDidAppear:a3];
  [(ETTranscriptDetailCanvasViewController *)self ignoreAppearanceCallbacks];
}

- (void)_gestureInstructionButtonTapped
{
}

- (void)_setShowingGestureInstructionView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown] != a3)
  {
    gestureInstructionView = self->_gestureInstructionView;
    if (v3)
    {
      if (!gestureInstructionView)
      {
        objc_super v6 = objc_alloc_init(GestureInstructionView);
        unsigned __int8 v7 = self->_gestureInstructionView;
        self->_gestureInstructionView = v6;

        v8 = [(ETTranscriptDetailCanvasViewController *)self view];
        v9 = self->_gestureInstructionView;
        v10 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
        [v8 insertSubview:v9 aboveSubview:v10];

        gestureInstructionView = self->_gestureInstructionView;
      }
      double v11 = 1.0;
    }
    else
    {
      double v11 = 0.0;
    }
    [(GestureInstructionView *)gestureInstructionView setAlpha:v11];
    [(ETTranscriptDetailCanvasViewController *)self _updateColorPickerEnabled];
    [(ETTranscriptDetailCanvasViewController *)self setComposeDisabled:v3];
    [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
    [(ETTranscriptDetailCanvasViewController *)self _updateVideoOnButtonOpacity];
    [(ETTranscriptDetailCanvasViewController *)self _updateGestureInstructionButton];
  }
}

- (void)_showCompositionControlsTimerFired
{
  showCompositionControlsTimer = self->_showCompositionControlsTimer;
  self->_showCompositionControlsTimer = 0;

  BOOL v4 = [(ETTranscriptDetailCanvasViewController *)self _canShowCompositionControls];

  [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:v4 animated:1];
}

- (void)_startShowCompositionControlsTimer
{
  [(NSTimer *)self->_showCompositionControlsTimer invalidate];
  self->_showCompositionControlsTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_showCompositionControlsTimerFired" selector:0 userInfo:0 repeats:3.0];

  _objc_release_x1();
}

- (void)_expandColorPickerButtonTapped
{
  [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:0 animated:1];

  [(ETTranscriptDetailCanvasViewController *)self _startShowCompositionControlsTimer];
}

- (void)_expandToCameraButtonTapped
{
  self->_expandToCameraPreview = 1;
  [(ETTranscriptDetailCanvasViewController *)self expandUI];
}

- (void)_setShowingCompositionControls:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingCompositionControls != a3)
  {
    BOOL v4 = a4;
    self->_showingCompositionControls = a3;
    unsigned __int8 v7 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
    v8 = v7;
    BOOL v9 = self->_expansionState != 1;
    if (!a3) {
      [v7 setAlpha:0.0];
    }
    self->_animatingCompositionControls = v4;
    if (v4) {
      double v10 = 0.25;
    }
    else {
      double v10 = 0.0;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_5538;
    v13[3] = &unk_24808;
    BOOL v15 = a3;
    v13[4] = self;
    id v14 = v8;
    BOOL v16 = !a3;
    BOOL v17 = v9;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_565C;
    v12[3] = &unk_24830;
    v12[4] = self;
    id v11 = v8;
    +[UIView animateWithDuration:v13 animations:v12 completion:v10];
  }
}

- (BOOL)_canShowCompositionControls
{
  if (![(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout]) {
    return 0;
  }
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  BOOL v4 = ([v3 isComposingSketch] & 1) == 0 && self->_expansionState != 1;

  return v4;
}

- (void)_updateCompositionControlsCenter
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat rect = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  double MidY = CGRectGetMidY(v27);
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  -[UIButton setCenter:](self->_expandColorPickerButton, "setCenter:", CGRectGetMinX(v28) * 0.5, MidY);
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v20;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.x = rect;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  double v23 = MaxX + (CGRectGetMaxX(v30) - MaxX) * 0.5;
  expandToCameraButton = self->_expandToCameraButton;

  -[UIButton setCenter:](expandToCameraButton, "setCenter:", v23, MidY);
}

- (void)_updateCompositionControls
{
  [(ETTranscriptDetailCanvasViewController *)self _updateCompositionControlsCenter];
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
  id v4 = [v3 selectedColor];
  id v5 = [v4 CGColor];

  double v6 = [(UIButton *)self->_expandColorPickerButton layer];
  [v6 setBorderColor:v5];

  BOOL v7 = [(ETTranscriptDetailCanvasViewController *)self _canShowCompositionControls];

  [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:v7 animated:0];
}

- (void)didChangeColorPickerColor
{
  BOOL v3 = [(UIButton *)self->_expandColorPickerButton layer];
  id v4 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
  id v5 = [v4 selectedColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  if ([(ETTranscriptDetailCanvasViewController *)self _canShowCompositionControls])
  {
    [(ETTranscriptDetailCanvasViewController *)self _startShowCompositionControlsTimer];
  }
}

- (void)didBeginComposingMessage
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self _canShowCompositionControls];

  [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:v3 animated:1];
}

- (void)didEndComposingMessage
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self _canShowCompositionControls];

  [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:v3 animated:1];
}

- (BOOL)_canLoopMessageDuringPlayback:(id)a3
{
  return 1;
}

- (void)_updateLandscapeTrap
{
  BOOL v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    id v5 = [(ETTranscriptDetailCanvasViewController *)self view];
    landscapeTrapView = self->_landscapeTrapView;
    id v13 = v5;
    [v5 bounds];
    -[ETLandscapeTrapView setFrame:](landscapeTrapView, "setFrame:");
    BOOL v7 = [(ETTranscriptDetailCanvasViewController *)self view];
    double v8 = [v7 window];
    CGFloat v9 = [v8 windowScene];
    double v10 = (char *)[v9 interfaceOrientation];
    BOOL v11 = v10 != (unsigned char *)&dword_0 + 1;

    if (self->_showingLandscapeTrap != v11)
    {
      self->_showingLandscapeTrap = v11;
      if (v10 == (unsigned char *)&dword_0 + 1) {
        [(ETLandscapeTrapView *)self->_landscapeTrapView removeFromSuperview];
      }
      else {
        [v13 addSubview:self->_landscapeTrapView];
      }
      double v12 = 0.0;
      if (self->_showingLandscapeTrap) {
        double v12 = 1.0;
      }
      [(ETLandscapeTrapView *)self->_landscapeTrapView setAlpha:v12];
    }
  }
}

- (double)_topMarginForColorPicker
{
  [(ETHorizontalColorPicker *)self->_expandedColorPicker minimumRowHeight];
  return v2 + 28.0 + 19.0;
}

- (void)viewWillLayoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v69 viewWillLayoutSubviews];
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [(ETTranscriptDetailCanvasViewController *)self _updateLandscapeTrap];
  if (!self->_showingLandscapeTrap)
  {
    CGFloat v9 = [(ETTranscriptDetailCanvasViewController *)self presentationDelegate];
    [v9 canvasViewControllerPercentExpanded:self];
    double v11 = v10;

    double v12 = +[UIDevice currentDevice];
    unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || !self->_requestedExpansion && (v11 <= 0.0 || v11 >= 1.0 || self->_expansionState == 1))
    {
      if (v11 == 0.0 && self->_expansionState)
      {
        self->_expansionState = 0;
      }
      else if (v11 == 1.0 && self->_expansionState != 2)
      {
        self->_expansionState = 2;
        double v15 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
        [v15 setAlpha:1.0];
      }
    }
    else
    {
      self->_expansionState = 1;
      CGFloat v14 = [(ETTranscriptDetailCanvasViewController *)self colorPicker];
      [v14 setAlpha:0.0];

      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_61B8;
      v68[3] = &unk_24858;
      v68[4] = self;
      +[UIView performWithoutAnimation:v68];
      [(ETTranscriptDetailCanvasViewController *)self _dismissColorWheel];
      [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:0 animated:0];
      [(ETTranscriptDetailCanvasViewController *)self _setShowingGestureInstructionView:0];
      [(ETTranscriptDetailCanvasViewController *)self setPlaybackEnabled:0];
    }
    unsigned int v16 = [(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout];
    if (v16) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 0;
    }
    [(ETHorizontalColorPicker *)self->_expandedColorPicker setColorCircleSize:v17];
    [(ETHorizontalColorPicker *)self->_expandedColorPicker sizeThatFitsColumns:2];
    double v20 = v19;
    double v21 = 80.0;
    if (v16)
    {
      double v22 = v20;
    }
    else
    {
      double v21 = 0.0;
      double v22 = 0.0;
    }
    double v23 = v5 + -16.0 - v21 - v22;
    if (v23 * 1.25 <= v7 + -48.0) {
      double v24 = v23 * 1.25;
    }
    else {
      double v24 = v7 + -48.0;
    }
    if (v23 * 1.25 <= v7 + -48.0) {
      double v25 = v23;
    }
    else {
      double v25 = (v7 + -48.0) / 1.25;
    }
    if (v16)
    {
      double v63 = v7;
      double v26 = (v5 - v25) * 0.5;
      double v27 = v18;
      [(ETHorizontalColorPicker *)self->_expandedColorPicker setShouldCompressSpacingBetweenColumns:v20 > v26 + -8.0 + -14.0];
      unsigned int v28 = [(ETHorizontalColorPicker *)self->_expandedColorPicker shouldCompressSpacingBetweenColumns];
      double v29 = (v26 + -8.0 - v20) * 0.5;
      if (v28) {
        double v29 = 8.0;
      }
      CGFloat v65 = v29;
      CGFloat v66 = v27;
      double v30 = (v7 - v27) * 0.5;
      -[ETTranscriptDetailCanvasViewController _setShowingGestureInstructionView:](self, "_setShowingGestureInstructionView:", 0, *(void *)&v63);
    }
    else
    {
      [(ETTranscriptDetailCanvasViewController *)self _topMarginForColorPicker];
      double v32 = v7 - v31;
      double v33 = (v7 - v31) / 1.25;
      if (v24 > v32)
      {
        double v24 = v32;
        double v25 = v33;
      }
      [(ETHorizontalColorPicker *)self->_expandedColorPicker minimumRowHeight];
      if (v7 - v24 + -14.0 < v34) {
        double v25 = (v32 + -14.0 - v34) / 1.25;
      }
      [(ETHorizontalColorPicker *)self->_expandedColorPicker sizeThatFits:v25];
      double v20 = v35;
      CGFloat v37 = v36;
      CGFloat v38 = (v5 - v35) * 0.5;
      [(ETTranscriptDetailCanvasViewController *)self _topMarginForColorPicker];
      double v30 = v39 * 0.5;
      CGFloat v65 = v38;
      CGFloat v66 = v37;
      v70.origin.x = v38;
      v70.origin.y = v30;
      v70.size.width = v20;
      v70.size.height = v37;
      CGRectGetMidY(v70);
      [(ETTranscriptDetailCanvasViewController *)self _setShowingCompositionControls:0 animated:0];
    }
    double v40 = +[UIScreen mainScreen];
    [v40 scale];
    uint64_t v42 = v41;

    UIRectIntegralWithScale();
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v64 = v49;
    objc_msgSend(v8, "setFrame:");
    UIRoundToViewScale();
    double v51 = v50;
    v52 = [v8 layer];
    [v52 setCornerRadius:v51];

    [(ETTranscriptDetailCanvasViewController *)self _updateCompositionControlsCenter];
    if (self->_showingCompositionControls)
    {
      expandedColorPicker = self->_expandedColorPicker;
      [(UIButton *)self->_expandColorPickerButton center];
      -[ETHorizontalColorPicker setCenter:](expandedColorPicker, "setCenter:");
    }
    else if (!self->_animatingCompositionControls)
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_61F4;
      v67[3] = &unk_24880;
      v67[4] = self;
      *(CGFloat *)&v67[5] = v65;
      *(double *)&v67[6] = v30;
      *(double *)&v67[7] = v20;
      *(CGFloat *)&v67[8] = v66;
      v67[9] = v42;
      +[UIView performWithoutAnimation:v67];
      [(ETTranscriptDetailCanvasViewController *)self _updateCompositionControls];
    }
    v71.origin.x = v65;
    v71.origin.y = v30;
    v71.size.width = v20;
    v71.size.height = v66;
    CGFloat MidX = CGRectGetMidX(v71);
    v72.origin.x = v65;
    v72.origin.y = v30;
    v72.size.width = v20;
    v72.size.height = v66;
    CGFloat MidY = CGRectGetMidY(v72);
    self->_expandedColorPickerCenter.x = MidX;
    self->_expandedColorPickerCenter.y = MidY;
    v56 = [(ETHorizontalColorPicker *)self->_expandedColorPicker colorWheel];
    objc_msgSend(v56, "setFrame:", v64, v44, v46, v48);

    [(ETTranscriptDetailCanvasViewController *)self _updateGestureInstructionViewFrame];
    [(ETTranscriptDetailCanvasViewController *)self _updateVideoOnButtonOpacity];
    [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
    v57 = [(ETTranscriptDetailCanvasViewController *)self _cancelButton];
    [v57 center];
    double v59 = v58;
    double v61 = v60;

    objc_super v62 = [(ETTranscriptDetailCanvasViewController *)self _replayButton];
    objc_msgSend(v62, "setCenter:", v59, v61);

    [(ETTranscriptDetailCanvasViewController *)self _updateBackToPreviewButton];
    [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
    [(ETTranscriptDetailCanvasViewController *)self _updateVideoProgressFrame];
  }
}

- (BOOL)canExpireMessages
{
  return 1;
}

- (BOOL)canShowReplayButton
{
  if ([(ETVideoController *)self->_videoController videoState]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewController;
  return [(ETTranscriptDetailCanvasViewController *)&v4 canShowReplayButton];
}

- (BOOL)_shouldAutoSend
{
  if ([(ETTranscriptDetailCanvasViewController *)self isComposingCompositeMessage])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_super v4 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    unsigned int v3 = [v4 isComposingSketch] ^ 1;
  }
  return v3;
}

- (void)colorPicker:(id)a3 requestsPresentColorWheel:(id)a4
{
  id v5 = a4;
  double v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v6 setPaused:1];

  double v7 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v5, "setFrame:", v9, v11, v13, v15);
  [v5 presentAnimatedWithDuration:0 completion:0.2];

  [(ETHorizontalColorPicker *)self->_expandedColorPicker selectedCircle];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6444;
  v17[3] = &unk_248A8;
  v17[4] = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v18;
  +[UIView animateWithDuration:v17 animations:0.2];
}

- (void)_dismissColorWheel
{
  unsigned int v3 = [(ETHorizontalColorPicker *)self->_expandedColorPicker colorWheel];
  if ([v3 isPresented])
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_66E4;
    v12[3] = &unk_248D0;
    objc_copyWeak(&v13, &location);
    objc_super v4 = objc_retainBlock(v12);
    [v3 dismissAnimatedWithDuration:v4 completion:0.3];
    id v5 = [(ETHorizontalColorPicker *)self->_expandedColorPicker longPressRecognizer];
    [v5 setEnabled:1];

    [(ETHorizontalColorPicker *)self->_expandedColorPicker selectedCircle];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6770;
    v10[3] = &unk_248A8;
    v10[4] = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_6800;
    v8[3] = &unk_248F8;
    double v7 = v4;
    id v9 = v7;
    +[UIView animateWithDuration:v10 animations:v8 completion:0.3];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)setPlayingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewController;
  -[ETTranscriptDetailCanvasViewController setPlayingMessages:](&v5, "setPlayingMessages:");
  objc_super v4 = +[UIApplication sharedApplication];
  [v4 setIdleTimerDisabled:v3];
}

- (void)expandUI
{
  self->_requestedExpansion = 1;
  id v3 = [(ETTranscriptDetailCanvasViewController *)self presentationDelegate];
  [v3 canvasViewController:self requestsPresentationStyleExpanded:1];
}

- (BOOL)_showingSendInProgress
{
  [(UIButton *)self->_sendButton alpha];
  if (v3 == 0.0) {
    return 0;
  }
  else {
    return [(UIButton *)self->_sendButton isEnabled] ^ 1;
  }
}

- (BOOL)_shouldShowCancelButton
{
  if (self->_expandToCameraPreview) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)ETTranscriptDetailCanvasViewController;
  if (![(ETTranscriptDetailCanvasViewController *)&v10 _shouldShowCancelButton])
  {
LABEL_7:
    unsigned int v6 = 0;
    goto LABEL_9;
  }
  videoController = self->_videoController;
  if (videoController)
  {
    if ((char *)[(ETVideoController *)videoController videoState] == (char *)&dword_0 + 1)
    {
      objc_super v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
      unsigned int v6 = [v5 isComposing] ^ 1;

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  unsigned int v6 = 1;
LABEL_9:
  double v7 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  if ([v7 usesMediaAppearance])
  {
    unsigned int v8 = 0;
  }
  else
  {
    id v9 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    unsigned int v8 = [v9 isComposingSketch];
  }
  if ([(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown]) {
    return 1;
  }
  if ((v8 | v6) != 1) {
    return 0;
  }
  return ![(ETTranscriptDetailCanvasViewController *)self _showingSendInProgress];
}

- (BOOL)_shouldShowOnButton
{
  if (([(ETTranscriptDetailCanvasViewController *)self isPlayingCompositeMessage] & 1) != 0|| ([(ETTranscriptDetailCanvasViewController *)self isPlayingMessages] & 1) != 0|| [(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout])
  {
    return 0;
  }
  objc_super v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  BOOL v3 = ([v5 isComposing] & 1) == 0
    && ![(ETVideoController *)self->_videoController videoState]
    && !self->_expandToCameraPreview
    && !self->_expandToGestureInstructionView
    && ![(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown]
    && self->_expansionState != 1;

  return v3;
}

- (void)_updateVideoPreviewFrame
{
  id v4 = [(ETVideoController *)self->_videoController view];
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v3 frame];
  objc_msgSend(v4, "setFrame:", 0.0, 0.0);
}

- (void)updateVideoUI
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v12 bounds];

  if ([(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout]
    || self->_expansionState == 1)
  {
    [(ETTranscriptDetailCanvasViewController *)self _setCameraEnabled:0];
  }
  [(ETTranscriptDetailCanvasViewController *)self _updateVideoPreviewFrame];
  unint64_t v13 = [(ETVideoController *)self->_videoController videoState];
  if (v13 - 1 <= 1)
  {
    videoRecordButton = self->_videoRecordButton;
    if (!videoRecordButton)
    {
      double v15 = objc_alloc_init(ETVideoRecordButton);
      id v16 = self->_videoRecordButton;
      self->_videoRecordButton = v15;

      [(ETVideoRecordButton *)self->_videoRecordButton setAlpha:0.0];
      [(ETVideoRecordButton *)self->_videoRecordButton addTarget:self action:"_videoRecordButtonTapped" forControlEvents:64];
      LODWORD(v17) = -1093874483;
      [(ETVideoRecordButton *)self->_videoRecordButton setCharge:v17];
      id v18 = [(ETTranscriptDetailCanvasViewController *)self view];
      [v18 insertSubview:self->_videoRecordButton above:v3];

      videoRecordButton = self->_videoRecordButton;
    }
    [v3 center];
    double v20 = v19 + -27.0;
    v45.origin.x = v5;
    v45.origin.y = v7;
    v45.size.width = v9;
    v45.size.height = v11;
    -[ETVideoRecordButton setFrame:](videoRecordButton, "setFrame:", v20, CGRectGetMaxY(v45) + 7.0, 54.0, 54.0);
  }
  [(ETVideoRecordButton *)self->_videoRecordButton alpha];
  if (v13 - 1 < 2 == (v21 == 0.0))
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_70C4;
    v43[3] = &unk_24920;
    v43[4] = self;
    BOOL v44 = v13 - 1 < 2;
    +[UIView animateWithDuration:v43 animations:0.25];
  }
  [(ETVideoRecordButton *)self->_videoRecordButton setVideoState:v13];
  BOOL v22 = v13 == 4 || v13 == 1;
  if (v13 == 1 || v13 == 4)
  {
    photoCaptureButton = self->_photoCaptureButton;
    if (!photoCaptureButton)
    {
      double v25 = objc_alloc_init(ETVideoRecordButton);
      double v26 = self->_photoCaptureButton;
      self->_photoCaptureButton = v25;

      double v27 = self->_photoCaptureButton;
      unsigned int v28 = +[UIColor whiteColor];
      [(ETVideoRecordButton *)v27 setInnerColor:v28];

      [(ETVideoRecordButton *)self->_photoCaptureButton setAlpha:0.0];
      [(ETVideoRecordButton *)self->_photoCaptureButton addTarget:self action:"_photoCaptureButtonTapped" forControlEvents:64];
      LODWORD(v29) = -1093874483;
      [(ETVideoRecordButton *)self->_photoCaptureButton setCharge:v29];
      double v30 = [(ETTranscriptDetailCanvasViewController *)self view];
      [v30 insertSubview:self->_photoCaptureButton above:v3];

      photoCaptureButton = self->_photoCaptureButton;
    }
    v46.origin.x = v5;
    v46.origin.y = v7;
    v46.size.width = v9;
    v46.size.height = v11;
    double MinX = CGRectGetMinX(v46);
    [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
    double v33 = MinX + v32;
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    -[ETVideoRecordButton setFrame:](photoCaptureButton, "setFrame:", v33, CGRectGetMaxY(v47) + 7.0 + 5.0, 44.0, 44.0);
  }
  [(ETVideoRecordButton *)self->_photoCaptureButton alpha];
  if (((v22 ^ (v34 == 0.0)) & 1) == 0)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_70F0;
    v41[3] = &unk_24920;
    v41[4] = self;
    BOOL v42 = v22;
    +[UIView animateWithDuration:v41 animations:0.25];
  }
  [(ETTranscriptDetailCanvasViewController *)self _updateSendButton];
  [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
  [(ETTranscriptDetailCanvasViewController *)self _updateBackToPreviewButton];
  double v35 = [(ETTranscriptDetailCanvasViewController *)self traitCollection];
  -[ETTranscriptDetailCanvasViewController _updateVideoOnButtonForHorizontalSizeClass:](self, "_updateVideoOnButtonForHorizontalSizeClass:", [v35 horizontalSizeClass]);

  [(ETTranscriptDetailCanvasViewController *)self _updateGestureInstructionButton];
  v48.origin.x = v5;
  v48.origin.y = v7;
  v48.size.width = v9;
  v48.size.height = v11;
  CGRectGetMaxX(v48);
  [(UIButton *)self->_cameraFlipButton frame];
  [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
  [(ETVideoRecordButton *)self->_videoRecordButton center];
  cameraFlipButton = self->_cameraFlipButton;
  CGFloat v37 = [(ETTranscriptDetailCanvasViewController *)self view];
  UIPointRoundToViewScale();
  -[UIButton setCenter:](cameraFlipButton, "setCenter:");

  [(UIButton *)self->_cameraFlipButton alpha];
  if ((v13 == 1) == (v38 == 0.0))
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_711C;
    v39[3] = &unk_24920;
    v39[4] = self;
    BOOL v40 = v13 == 1;
    +[UIView animateWithDuration:v39 animations:0.25];
  }
  [(ETTranscriptDetailCanvasViewController *)self _setShowingVideoProgress:v13 == 2];
  [(ETTranscriptDetailCanvasViewController *)self _updateMediaInstructionView];
}

- (void)_updateBackToPreviewButton
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  double v4 = 0.0;
  if ([v3 usesMediaAppearance])
  {
    videoController = self->_videoController;
    if (videoController)
    {
      if ((char *)[(ETVideoController *)videoController videoState] == (char *)&dword_0 + 1)
      {
        double v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
        if ([v6 isComposing]) {
          double v4 = (double)([(ETTranscriptDetailCanvasViewController *)self _showingSendInProgress] ^ 1);
        }
      }
      else
      {
        double v4 = (double)([(ETTranscriptDetailCanvasViewController *)self _showingSendInProgress] ^ 1);
      }
    }
  }

  [(UIButton *)self->_backToPreviewButton setAlpha:v4];
  backToPreviewButton = self->_backToPreviewButton;
  id v8 = [(ETTranscriptDetailCanvasViewController *)self _cancelButton];
  [v8 center];
  -[UIButton setCenter:](backToPreviewButton, "setCenter:");
}

- (BOOL)_shouldShowSendButton
{
  unint64_t v3 = [(ETVideoController *)self->_videoController videoState];
  if ([(ETTranscriptDetailCanvasViewController *)self _shouldAutoSend]) {
    return 0;
  }
  if (v3 - 5 < 2) {
    return 1;
  }
  if ([(ETTranscriptDetailCanvasViewController *)self isComposingCompositeMessage])return 0; {
  CGFloat v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  }
  unsigned __int8 v6 = [v5 isComposingSketch];

  return v6;
}

- (void)_updateGestureInstructionButton
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self _shouldShowOnButton];
  [(UIButton *)self->_gestureInstructionButton setEnabled:v3];
  double v4 = [(ETTranscriptDetailCanvasViewController *)self view];
  CGFloat v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  CGRectGetMaxX(v19);
  [(UIButton *)self->_gestureInstructionButton frame];
  [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
  UIRoundToViewScale();
  double v15 = v14;
  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  CGRectGetMaxY(v20);
  [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
  [(UIButton *)self->_videoOnButton frame];
  UIRoundToViewScale();
  -[UIButton setCenter:](self->_gestureInstructionButton, "setCenter:", v15, v16);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_7468;
  v17[3] = &unk_24920;
  v17[4] = self;
  BOOL v18 = v3;
  +[UIView animateWithDuration:v17 animations:0.25];
}

- (void)_updateSendButton
{
  unsigned int v3 = [(ETTranscriptDetailCanvasViewController *)self _shouldShowSendButton];
  [(UIButton *)self->_sendButton alpha];
  if (((v3 ^ (v4 == 0.0)) & 1) == 0)
  {
    double v5 = 0.0;
    uint64_t v28 = 3221225472;
    double v27 = _NSConcreteStackBlock;
    double v29 = sub_769C;
    double v30 = &unk_24920;
    if (v3) {
      double v5 = 0.25;
    }
    double v31 = self;
    char v32 = v3;
    +[UIView animateWithDuration:&v27 animations:v5];
  }
  double v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  if ([(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout])
  {
    double v15 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    [v15 frame];
    double MaxX = CGRectGetMaxX(v33);

    double v17 = [(ETTranscriptDetailCanvasViewController *)self view];
    [v17 bounds];
    double v19 = MaxX + (v18 - MaxX) * 0.5;

    v34.origin.x = v8;
    v34.origin.y = v10;
    v34.size.width = v12;
    v34.size.height = v14;
    -[UIButton setCenter:](self->_sendButton, "setCenter:", v19, CGRectGetMidY(v34));
  }
  else
  {
    sendButton = self->_sendButton;
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.width = v12;
    v35.size.height = v14;
    double v21 = CGRectGetMaxX(v35);
    [(UIButton *)self->_sendButton frame];
    double v23 = v21 + v22 * -0.5;
    [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
    double v25 = v23 - v24;
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    -[UIButton setCenter:](sendButton, "setCenter:", v25, CGRectGetMaxY(v36) + 7.0 + 27.0);
    if (self->_videoController) {
      unsigned int v26 = 0;
    }
    else {
      unsigned int v26 = v3;
    }
    if (v26 == 1) {
      [(ETTranscriptDetailCanvasViewController *)self _setEntryViewHidden:1];
    }
  }
}

- (void)_updateSkipButtonFrame
{
  id v4 = [(ETTranscriptDetailCanvasViewController *)self _skipButton];
  unsigned int v3 = [(ETTranscriptDetailCanvasViewController *)self _cancelButton];
  [v3 frame];
  objc_msgSend(v4, "setFrame:");
}

- (void)_setEntryViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ETTranscriptDetailCanvasViewController *)self presentationDelegate];
  id v6 = v5;
  if (v3) {
    [v5 canvasViewControllerHideEntryView:self];
  }
  else {
    [v5 canvasViewControllerShowEntryView:self];
  }
}

- (void)_endPhotoMessageComposition
{
  [(ETTranscriptDetailCanvasViewController *)self _moveComposedMessagesIntoMediaMessage];
  mediaMessage = self->_mediaMessage;
  self->_mediaMessage = 0;

  [(UIButton *)self->_sendButton setEnabled:0];
  [(UIButton *)self->_sendButton setAlpha:0.25];
  [(ETTranscriptDetailCanvasViewController *)self _endMediaMessageComposition];
  [(ETTranscriptDetailCanvasViewController *)self _updateSendButton];
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];

  [(ETTranscriptDetailCanvasViewController *)self _clearPhotoSendMessageTimer];
}

- (void)_sendButtonTapped
{
  if ([(UIButton *)self->_sendButton isEnabled])
  {
    unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self usesCompactKeyboardLayout];
    [(UIButton *)self->_sendButton setEnabled:0];
    [(UIButton *)self->_sendButton setAlpha:0.25];
    mediaMessage = self->_mediaMessage;
    if (mediaMessage)
    {
      double v5 = mediaMessage;
      if ([(ETVideoMessage *)self->_mediaMessage mediaType] == (char *)&dword_0 + 1)
      {
        [(ETTranscriptDetailCanvasViewController *)self _stopPlaybackAnimated:1];
        [(ETTranscriptDetailCanvasViewController *)self _endMediaMessageComposition];
        [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
        [(ETTranscriptDetailCanvasViewController *)self _updateColorPickerEnabled];
      }
      else if ([(ETVideoMessage *)self->_mediaMessage mediaType] == (char *)&dword_0 + 2)
      {
        [(ETTranscriptDetailCanvasViewController *)self _endPhotoMessageComposition];
      }
      [(ETTranscriptDetailCanvasViewController *)self _updateBackToPreviewButton];
      +[MediaInstructionView disallowInstruction];
      if (v3) {
        goto LABEL_13;
      }
    }
    else
    {
      id v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
      double v7 = v6;
      if (v3)
      {
        [v6 sendCurrentMessage];

        double v5 = 0;
LABEL_13:

        return;
      }
      double v5 = [v6 composedSketchMessage];

      CGFloat v8 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
      [v8 clearCanvasAnimated:1];

      [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_7A2C;
    v11[3] = &unk_24858;
    v11[4] = self;
    +[UIView performWithoutAnimation:v11];
    double v9 = [(ETTranscriptDetailCanvasViewController *)self sendDelegate];
    [v9 canvasViewController:self sendMessage:v5];

    CGFloat v10 = [(ETTranscriptDetailCanvasViewController *)self presentationDelegate];
    [v10 canvasViewController:self requestsPresentationStyleExpanded:0];

    goto LABEL_13;
  }
}

- (void)_startCameraPreview
{
  unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v3 endMessageComposition];

  id v4 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v4 clearCanvasAnimated:0];

  [(ETTranscriptDetailCanvasViewController *)self _setCameraEnabled:1];
  [(ETTranscriptDetailCanvasViewController *)self setComposingCompositeMessage:1];
  [(ETTranscriptDetailCanvasViewController *)self _setVideoZoomEnabled:1];

  [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
}

- (void)_backToPreviewButtonTapped
{
  unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  if ([v3 isComposing] && (videoController = self->_videoController) != 0)
  {
    double v5 = [(ETVideoController *)videoController videoState];

    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      id v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
      [v6 clearCanvasAnimated:1];

      [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
      goto LABEL_9;
    }
  }
  else
  {
  }
  unint64_t v7 = [(ETVideoController *)self->_videoController videoState];
  CGFloat v8 = self->_videoController;
  if (v7 == 2)
  {
    [(ETVideoController *)v8 cancelRecording];
  }
  else
  {
    [(ETVideoController *)v8 deleteWrittenAssets];
    [(ETTranscriptDetailCanvasViewController *)self _endMediaMessageComposition];
    [(ETTranscriptDetailCanvasViewController *)self _stopPlaybackAnimated:1];
    [(ETTranscriptDetailCanvasViewController *)self _setCameraEnabled:1];
    [(ETTranscriptDetailCanvasViewController *)self setComposingCompositeMessage:1];
  }
LABEL_9:
  [(ETTranscriptDetailCanvasViewController *)self _setVideoZoomEnabled:1];

  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
}

- (void)_endMediaMessageComposition
{
  [(ETTranscriptDetailCanvasViewController *)self setComposingCompositeMessage:0];

  [(ETTranscriptDetailCanvasViewController *)self _setCameraEnabled:0];
}

- (void)_cancelButtonTapped
{
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v4 _cancelButtonTapped];
  if ([(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown])
  {
    [(ETTranscriptDetailCanvasViewController *)self _setShowingGestureInstructionView:0];
  }
  else if (self->_mediaMessage)
  {
    [(ETVideoController *)self->_videoController deleteWrittenAssets];
    [(ETTranscriptDetailCanvasViewController *)self _endMediaMessageComposition];
  }
  else
  {
    unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    [v3 setCanComposeHeartbeat:1];
    [v3 setCanComposeTap:1];
    [v3 setCanComposeKiss:1];
    [v3 setCanComposeAnger:1];
    [(ETTranscriptDetailCanvasViewController *)self _setEntryViewHidden:0];
  }
  [(ETTranscriptDetailCanvasViewController *)self _updateColorPickerEnabled];
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
}

- (void)_endIntroMessage
{
  unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v3 endMessageComposition];

  [(ETTranscriptDetailCanvasViewController *)self _setVideoZoomEnabled:0];
  id v7 = [(ETTranscriptDetailCanvasViewController *)self deferredMessages];
  if ([v7 count])
  {
    objc_super v4 = [v7 objectAtIndexedSubscript:0];
    double v5 = [v4 strokes];
    id v6 = [v5 count];

    if (v6)
    {
      [(ETVideoMessage *)self->_mediaMessage setIntroMessage:v4];
      [v4 setDelayWisp:1];
      [v4 setHideComet:1];
    }
    [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
  }
  [(ETTranscriptDetailCanvasViewController *)self _composingOnlyIntroMessageType:0];
}

- (void)_moveComposedMessagesIntoMediaMessage
{
  unsigned __int8 v3 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v3 endMessageComposition];

  mediaMessage = self->_mediaMessage;
  double v5 = [(ETTranscriptDetailCanvasViewController *)self deferredMessages];
  [(ETVideoMessage *)mediaMessage setPlayingMessages:v5];

  [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
}

- (void)_videoRecordButtonTapped
{
  if (([(ETVideoRecordButton *)self->_photoCaptureButton isTracking] & 1) == 0)
  {
    if ((char *)[(ETVideoRecordButton *)self->_videoRecordButton videoState] == (char *)&dword_0 + 1)
    {
      [(ETTranscriptDetailCanvasViewController *)self _endIntroMessage];
      videoController = self->_videoController;
      [(ETVideoController *)videoController startRecording];
    }
    else if ((char *)[(ETVideoRecordButton *)self->_videoRecordButton videoState] == (char *)&dword_0 + 2)
    {
      objc_super v4 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
      [v4 endMessageComposition];

      double v5 = self->_videoController;
      [(ETVideoController *)v5 finishRecording];
    }
  }
}

- (void)_photoCaptureButtonTapped
{
  if (([(ETVideoRecordButton *)self->_videoRecordButton isTracking] & 1) == 0)
  {
    videoController = self->_videoController;
    [(ETVideoController *)videoController capturePhoto];
  }
}

- (void)_startPhotoSendMessageTimer
{
  [(NSTimer *)self->_photoSendMessageTimer invalidate];
  self->_photoSendMessageTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_photoSendMessageTimerFired" selector:0 userInfo:0 repeats:30.0];

  _objc_release_x1();
}

- (void)_photoSendMessageTimerFired
{
  photoSendMessageTimer = self->_photoSendMessageTimer;
  self->_photoSendMessageTimer = 0;

  objc_super v4 = self->_mediaMessage;
  [(ETTranscriptDetailCanvasViewController *)self _endPhotoMessageComposition];
  id v5 = [(ETTranscriptDetailCanvasViewController *)self sendDelegate];
  [v5 canvasViewController:self sendMessage:v4];
}

- (void)_clearPhotoSendMessageTimer
{
  [(NSTimer *)self->_photoSendMessageTimer invalidate];
  photoSendMessageTimer = self->_photoSendMessageTimer;
  self->_photoSendMessageTimer = 0;
}

- (void)_cameraFlipButtonTapped
{
  self->_videoZoomScale = 0.0;
  self->_lastVideoZoomGestureScale = 0.0;
}

- (void)_setCameraEnabled:(BOOL)a3
{
  if ((((self->_videoController == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    id v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    id v17 = v5;
    if (v3)
    {
      [v5 sendCurrentMessage];
      id v6 = (ETVideoMessage *)objc_alloc_init((Class)ETVideoMessage);
      mediaMessage = self->_mediaMessage;
      self->_mediaMessage = v6;

      CGFloat v8 = [ETVideoController alloc];
      double v9 = [(ETVideoMessage *)self->_mediaMessage identifier];
      CGFloat v10 = [(ETVideoController *)v8 initWithMessageIdentifier:v9];
      videoController = self->_videoController;
      self->_videoController = v10;

      [(ETVideoController *)self->_videoController setDelegate:self];
      [(ETTranscriptDetailCanvasViewController *)self addChildViewController:self->_videoController];
      CGFloat v12 = [(ETVideoController *)self->_videoController view];
      [v17 insertSubview:v12 atIndex:0];

      [(ETVideoController *)self->_videoController didMoveToParentViewController:self];
      [(ETTranscriptDetailCanvasViewController *)self _updateVideoPreviewFrame];
      [(ETVideoController *)self->_videoController startPreview];
    }
    else
    {
      [v5 clearCanvasAnimated:0];
      double v13 = [(ETTranscriptDetailCanvasViewController *)self playingMessage];
      [v13 stopPlaying];

      CGFloat v14 = self->_mediaMessage;
      self->_mediaMessage = 0;

      [(ETVideoController *)self->_videoController setDelegate:0];
      [(ETVideoController *)self->_videoController stopPreview];
      double v15 = [(ETVideoController *)self->_videoController view];
      [v15 removeFromSuperview];

      [(ETVideoController *)self->_videoController removeFromParentViewController];
      double v16 = self->_videoController;
      self->_videoController = 0;

      [(ETTranscriptDetailCanvasViewController *)self setComposingCompositeMessage:0];
      [(ETTranscriptDetailCanvasViewController *)self _updateCanvasInteractionEnabled];
      self->_videoZoomScale = 0.0;
      self->_lastVideoZoomGestureScale = 0.0;
      [(ETTranscriptDetailCanvasViewController *)self _relinquishAudio];
      [(ETTranscriptDetailCanvasViewController *)self _clearPhotoSendMessageTimer];
      [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
      self->_expandToCameraPreview = 0;
    }
    [(ETTranscriptDetailCanvasViewController *)self _setEntryViewHidden:v3];
    [(ETTranscriptDetailCanvasViewController *)self setDeferMessageSend:v3];
    [(ETTranscriptDetailCanvasViewController *)self _composingOnlyIntroMessageType:v3];
    [v17 setUsesMediaAppearance:v3];
    [v17 setParentMessage:self->_mediaMessage];
  }
}

- (void)_updateVideoProgressFrame
{
  BOOL v3 = [(ETTranscriptDetailCanvasViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  videoProgressBar = self->_videoProgressBar;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  CGFloat v13 = CGRectGetMaxY(v27) + -2.0;
  [(UIView *)self->_videoProgressBar frame];
  -[UIView setFrame:](videoProgressBar, "setFrame:", 0.0, v13);
  [(UILabel *)self->_videoProgressTimeLabel sizeToFit];
  -[UIView setFrame:](self->_videoProgressDot, "setFrame:", 0.0, 0.0, 5.0, 5.0);
  CGFloat v14 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v14 frame];
  double v16 = v15;

  videoProgressDot = self->_videoProgressDot;
  [(ETVideoRecordButton *)self->_videoRecordButton center];
  [(UIView *)videoProgressDot setCenter:v16 + 4.5];
  [(UILabel *)self->_videoProgressTimeLabel frame];
  double v19 = v18;
  double v21 = v20;
  videoProgressTimeLabel = self->_videoProgressTimeLabel;
  [(UIView *)self->_videoProgressDot frame];
  double v23 = CGRectGetMaxX(v28) + 4.0;
  [(ETVideoRecordButton *)self->_videoRecordButton center];
  double v25 = v24 + v21 * -0.5;

  -[UILabel setFrame:](videoProgressTimeLabel, "setFrame:", v23, v25, v19 + 4.0, v21);
}

- (id)_videoProgressTimeString:(unint64_t)a3
{
  if (!self->_videoProgressTimeFormatter)
  {
    CGFloat v5 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    videoProgressTimeFormatter = self->_videoProgressTimeFormatter;
    self->_videoProgressTimeFormatter = v5;

    [(NSDateFormatter *)self->_videoProgressTimeFormatter setDateFormat:@"mm:ss"];
  }
  id v7 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)a3];
  double v8 = [(NSDateFormatter *)self->_videoProgressTimeFormatter stringFromDate:v7];

  return v8;
}

- (void)_setShowingVideoProgress:(BOOL)a3
{
  if (self->_showingVideoProgress != a3)
  {
    BOOL v3 = a3;
    self->_showingVideoProgress = a3;
    if (!a3)
    {
      videoProgressTimeLabel = self->_videoProgressTimeLabel;
      double v6 = [(ETTranscriptDetailCanvasViewController *)self _videoProgressTimeString:(unint64_t)10.0];
      [(UILabel *)videoProgressTimeLabel setText:v6];

      id v7 = [(UIView *)self->_videoProgressDot layer];
      [v7 removeAllAnimations];

      double v8 = [(UIView *)self->_videoProgressBar layer];
      [v8 removeAllAnimations];

      CGFloat v9 = [(UILabel *)self->_videoProgressTimeLabel layer];
      [v9 removeAllAnimations];

      videoProgressBar = self->_videoProgressBar;
      CGFloat v11 = [(ETTranscriptDetailCanvasViewController *)self view];
      [v11 bounds];
      -[UIView setFrame:](videoProgressBar, "setFrame:", 0.0, CGRectGetMaxY(v13) + -2.0, 0.0, 2.0);
    }
    [(UIView *)self->_videoProgressBar setAlpha:(double)v3];
    [(UIView *)self->_videoProgressDot setAlpha:(double)v3];
    [(UILabel *)self->_videoProgressTimeLabel setAlpha:(double)v3];
    [(ETTranscriptDetailCanvasViewController *)self _updateVideoProgressFrame];
    if (v3)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_87F0;
      v12[3] = &unk_24858;
      void v12[4] = self;
      +[UIView animateWithDuration:196612 delay:v12 options:0 animations:10.0 completion:0.0];
      [(ETTranscriptDetailCanvasViewController *)self _updateVideoRecorderTime:(unint64_t)10.0];
    }
  }
}

- (void)_updateVideoRecorderTime:(unint64_t)a3
{
  videoProgressDot = self->_videoProgressDot;
  double v6 = 0.0;
  if ((a3 & 1) == 0) {
    double v6 = 1.0;
  }
  [(UIView *)videoProgressDot setAlpha:v6];
  videoProgressTimeLabel = self->_videoProgressTimeLabel;
  double v8 = [(ETTranscriptDetailCanvasViewController *)self _videoProgressTimeString:a3];
  [(UILabel *)videoProgressTimeLabel setText:v8];

  if (a3)
  {
    if (self->_showingVideoProgress)
    {
      dispatch_time_t v9 = dispatch_time(0, 1000000000);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_898C;
      v10[3] = &unk_24948;
      v10[4] = self;
      void v10[5] = a3;
      dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }
}

- (BOOL)_shouldDimColorPicker
{
  if ((char *)[(ETVideoController *)self->_videoController videoState] == (char *)&dword_4 + 2
    || self->_expandToGestureInstructionView
    || [(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)ETTranscriptDetailCanvasViewController;
  return [(ETTranscriptDetailCanvasViewController *)&v4 _shouldDimColorPicker];
}

- (BOOL)_isRecognizer:(id)a3 closeToButton:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 superview];
  [v6 locationInView:v7];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  [v5 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  CGRect v25 = CGRectInset(v24, -44.0, -44.0);
  uint64_t v20 = v9;
  uint64_t v21 = v11;

  return CGRectContainsPoint(v25, *(CGPoint *)&v20);
}

- (BOOL)_tapRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 104;
  [(UIButton *)self->_videoOnButton alpha];
  if (v6 == 0.0)
  {
    id v7 = [(ETTranscriptDetailCanvasViewController *)self _replayButton];
    [v7 alpha];
    double v9 = v8;

    if (v9 == 0.0)
    {
      uint64_t v11 = [(ETTranscriptDetailCanvasViewController *)self _cancelButton];
      [v11 alpha];
      double v13 = v12;

      if (v13 == 0.0)
      {
        uint64_t v5 = 120;
        [(UIButton *)self->_backToPreviewButton alpha];
        if (v17 != 0.0) {
          goto LABEL_2;
        }
LABEL_11:
        BOOL v16 = 1;
        goto LABEL_12;
      }
      uint64_t v10 = [(ETTranscriptDetailCanvasViewController *)self _cancelButton];
    }
    else
    {
      uint64_t v10 = [(ETTranscriptDetailCanvasViewController *)self _replayButton];
    }
    double v14 = (void *)v10;
    unsigned __int8 v15 = [(ETTranscriptDetailCanvasViewController *)self _isRecognizer:v4 closeToButton:v10];

    if (v15) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
LABEL_2:
  if (![(ETTranscriptDetailCanvasViewController *)self _isRecognizer:v4 closeToButton:*(void *)&self->DTSCanvasViewController_opaque[v5]])goto LABEL_11; {
LABEL_9:
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)_updateGestureInstructionViewFrame
{
  id v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v6 frame];
  -[GestureInstructionView setFrame:](self->_gestureInstructionView, "setFrame:");
  gestureInstructionView = self->_gestureInstructionView;
  [v6 center];
  -[GestureInstructionView setCenter:](gestureInstructionView, "setCenter:");
  id v4 = [(GestureInstructionView *)self->_gestureInstructionView layer];
  uint64_t v5 = [v6 layer];
  [v5 cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");
}

- (BOOL)_gestureInstructionViewIsShown
{
  [(GestureInstructionView *)self->_gestureInstructionView alpha];
  return v2 == 1.0;
}

- (void)_updateMediaInstructionView
{
  id v19 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  if (!self->_videoController
    || ([(ETTranscriptDetailCanvasViewController *)self isPlayingCompositeMessage] & 1) != 0|| ([(ETTranscriptDetailCanvasViewController *)self isPlayingMessages] & 1) != 0|| !+[MediaInstructionView isInstructionAllowed])
  {
    [(MediaInstructionView *)self->_mediaInstructionView removeFromSuperview];
    mediaInstructionView = self->_mediaInstructionView;
    self->_mediaInstructionView = 0;
  }
  else
  {
    if (!self->_mediaInstructionView)
    {
      BOOL v3 = objc_alloc_init(MediaInstructionView);
      id v4 = self->_mediaInstructionView;
      self->_mediaInstructionView = v3;

      [v19 addSubview:self->_mediaInstructionView];
    }
    [v19 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = +[UIApplication sharedApplication];
    double v14 = [v13 preferredContentSizeCategory];
    int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    if (IsAccessibilityContentSizeCategory)
    {
      -[MediaInstructionView sizeThatFits:](self->_mediaInstructionView, "sizeThatFits:", v10, v12);
      double v17 = v16;
    }
    else
    {
      double v17 = 64.0;
    }
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    -[MediaInstructionView setFrame:](self->_mediaInstructionView, "setFrame:", 0.0, CGRectGetMaxY(v21) - v17, v10, v17);
    [(MediaInstructionView *)self->_mediaInstructionView updateForVideoState:[(ETVideoController *)self->_videoController videoState]];
  }
}

- (void)videoControllerDidStartPreview:(id)a3
{
  self->_expandToCameraPreview = 0;
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
  [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];

  [(ETTranscriptDetailCanvasViewController *)self _composingOnlyIntroMessageType:1];
}

- (void)videoControllerDidEndPreview:(id)a3
{
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];

  [(ETTranscriptDetailCanvasViewController *)self _updatePlaybackControls];
}

- (void)videoControllerWillCancelRecording:(id)a3
{
  id v4 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  [v4 clearCanvasAnimated:1];

  [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
  mediaMessage = self->_mediaMessage;

  [(ETVideoMessage *)mediaMessage setIntroMessage:0];
}

- (void)videoControllerDidStartRecording:(id)a3
{
  videoController = self->_videoController;
  if (videoController) {
    [(ETVideoController *)videoController writeStartTime];
  }
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
}

- (void)videoControllerDidEndRecording:(id)a3 mediaURL:(id)a4 withError:(id)a5
{
  if (a5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_91A0;
    v7[3] = &unk_24858;
    v7[4] = self;
    -[ETTranscriptDetailCanvasViewController _showWriteErrorAlertForMediaType:outOfSpaceError:completion:](self, "_showWriteErrorAlertForMediaType:outOfSpaceError:completion:", 1, objc_msgSend(a5, "code", a3, a4) == (id)-11807, v7);
  }
  else
  {
    [(ETVideoMessage *)self->_mediaMessage setMediaURL:a4];
    CGFloat v6 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    [(ETTranscriptDetailCanvasViewController *)self _moveComposedMessagesIntoMediaMessage];
    [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
    [(ETTranscriptDetailCanvasViewController *)self setPlayingCompositeMessage:1];
    [(ETTranscriptDetailCanvasViewController *)self _updateColorPickerEnabled];
    [(ETTranscriptDetailCanvasViewController *)self _updateCanvasInteractionEnabled];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_9130;
    v8[3] = &unk_24858;
    void v8[4] = self;
    [v6 wispVisibleSketchViewsWithCompletion:v8];
  }
  [(ETTranscriptDetailCanvasViewController *)self clearDeferredMessages];
}

- (void)_showWriteErrorAlertForMediaType:(unint64_t)a3 outOfSpaceError:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v19 = a5;
  CGFloat v8 = +[NSBundle bundleForClass:objc_opt_class()];
  double v9 = v8;
  if (a3 == 1) {
    CFStringRef v10 = @"MEDIA_CANNOT_CREATE_TITLE_VIDEO";
  }
  else {
    CFStringRef v10 = @"MEDIA_CANNOT_CREATE_TITLE_PHOTO";
  }
  double v11 = [v8 localizedStringForKey:v10 value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
  if (v5)
  {
    if (a3 == 1) {
      CFStringRef v12 = @"MEDIA_OUT_OF_SPACE_MESSAGE_VIDEO";
    }
    else {
      CFStringRef v12 = @"MEDIA_OUT_OF_SPACE_MESSAGE_PHOTO";
    }
    double v13 = [v9 localizedStringForKey:v12 value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
  }
  else
  {
    double v13 = 0;
  }
  double v14 = +[UIAlertController alertControllerWithTitle:v11 message:v13 preferredStyle:1];
  unsigned __int8 v15 = [v9 localizedStringForKey:@"MEDIA_ALERT_DONE" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
  double v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:0];

  [v14 addAction:v16];
  if (v5)
  {
    double v17 = [v9 localizedStringForKey:@"MEDIA_ALERT_SETTINGS" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    double v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:&stru_24988];

    [v14 addAction:v18];
  }
  [(ETTranscriptDetailCanvasViewController *)self presentViewController:v14 animated:1 completion:v19];
}

- (void)_hideVideoController
{
  [(ETVideoController *)self->_videoController view];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9550;
  v9[3] = &unk_24858;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  CGFloat v6 = sub_955C;
  double v7 = &unk_24830;
  id v8 = v10;
  id v3 = v10;
  +[UIView animateWithDuration:v9 animations:&v4 completion:0.25];
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
}

- (void)videoControllerDidStopPreview:(id)a3
{
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];

  [(ETTranscriptDetailCanvasViewController *)self _updateCanvasInteractionEnabled];
}

- (void)videoControllerWillBeginPhotoCapture:(id)a3
{
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];

  [(ETTranscriptDetailCanvasViewController *)self _updateCanvasInteractionEnabled];
}

- (void)videoControllerDidEndPhotoCapture:(id)a3 photoImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ETTranscriptDetailCanvasViewController *)self _endIntroMessage];
  [(ETVideoMessage *)self->_mediaMessage setMediaType:2];
  [(ETVideoMessage *)self->_mediaMessage setStillImage:v7];
  [(ETTranscriptDetailCanvasViewController *)self updateVideoUI];
  [(ETTranscriptDetailCanvasViewController *)self _updateCanvasInteractionEnabled];
  id v8 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  double v9 = [(ETVideoMessage *)self->_mediaMessage stillImage];
  [v8 showPhotoForImage:v9];

  [(ETTranscriptDetailCanvasViewController *)self _startPhotoSendMessageTimer];
  id v10 = self->_mediaMessage;
  objc_initWeak(&location, self);
  double v11 = self->_videoController;
  videoController = self->_videoController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_97C8;
  v15[3] = &unk_249B0;
  double v13 = v10;
  double v16 = v13;
  objc_copyWeak(&v18, &location);
  double v14 = v11;
  double v17 = v14;
  [(ETVideoController *)videoController writePhotoDataWithCompletion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)videoControllerDidInterruptPreview:(id)a3 withInterruptionReason:(int64_t)a4
{
  if (a4 == 4
    && ([(ETVideoController *)self->_videoController timeSinceStartOfPreview], v5 < 0.5))
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"MEDIA_CANNOT_START_CAMERA_ALERT_TITLE" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    id v8 = [v6 localizedStringForKey:@"MEDIA_CANNOT_START_CAMERA_ALERT_DESCRIPTION" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    double v9 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    id v10 = [v6 localizedStringForKey:@"MEDIA_ALERT_DONE" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_9ADC;
    v12[3] = &unk_249D8;
    void v12[4] = self;
    double v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v12];
    [v9 addAction:v11];
    [(ETTranscriptDetailCanvasViewController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [(ETTranscriptDetailCanvasViewController *)self _setCameraEnabled:0];
  }
}

- (void)_composingOnlyIntroMessageType:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
  BOOL v4 = !v3;
  [v5 setCanComposeHeartbeat:v4];
  [v5 setCanComposeTap:v4];
  [v5 setCanComposeKiss:v4];
  [v5 setCanComposeAnger:v4];
}

- (void)_videoZoomGestureRecognized:(id)a3
{
  id v4 = a3;
  [v4 scale];
  double v6 = v5;
  id v7 = (char *)[v4 state];

  if (v7 == (unsigned char *)&dword_0 + 2)
  {
    id v8 = [(ETVideoController *)self->_videoController videoDevice];
    double v9 = fmax(self->_lastVideoZoomGestureScale, 0.001);
    self->_lastVideoZoomGestureScale = v9;
    self->_double videoZoomScale = fmax(self->_videoZoomScale * (v6 / v9), 1.0);
    id v10 = [v8 activeFormat];
    [v10 videoMaxZoomFactor];
    double v12 = v11;

    double videoZoomScale = self->_videoZoomScale;
    if (v12 < videoZoomScale) {
      double videoZoomScale = v12;
    }
    self->_double videoZoomScale = videoZoomScale;
    id v15 = 0;
    [v8 lockForConfiguration:&v15];
    id v14 = v15;
    if (!v14)
    {
      [v8 setVideoZoomFactor:self->_videoZoomScale];
      [v8 unlockForConfiguration];
    }
    self->_lastVideoZoomGestureScale = v6;
  }
  else if (v7 == (unsigned char *)&dword_0 + 1)
  {
    self->_lastVideoZoomGestureScale = v6;
  }
}

- (void)_setVideoZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && !self->_videoZoomGestureRecognizer)
  {
    double v5 = (UIPinchGestureRecognizer *)[objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:self action:"_videoZoomGestureRecognized:"];
    videoZoomGestureRecognizer = self->_videoZoomGestureRecognizer;
    self->_videoZoomGestureRecognizer = v5;

    id v7 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    [v7 addGestureRecognizer:self->_videoZoomGestureRecognizer];
  }
  id v8 = self->_videoZoomGestureRecognizer;

  [(UIPinchGestureRecognizer *)v8 setEnabled:v3];
}

- (void)canvasView:(id)a3 didUpdateComposingMessageType:(unsigned __int16)a4
{
  if ([a3 isComposing])
  {
    [(ETTranscriptDetailCanvasViewController *)self _setVideoZoomEnabled:0];
  }
}

- (double)elapsedTimeSinceStartOfMessage:(id)a3
{
  id v4 = a3;
  [(ETVideoController *)self->_videoController currentFrameIntervalSinceFirstFrame];
  double v6 = v5;
  if ([(ETVideoMessage *)self->_mediaMessage canCompressTime])
  {
    [(ETVideoMessage *)self->_mediaMessage compressTimeSinceStartOfMessage:v6];
    double v6 = v7;
    -[ETVideoMessage setPauseTimeCompression:](self->_mediaMessage, "setPauseTimeCompression:", [v4 messageType] != 1);
  }

  return v6;
}

- (BOOL)_shouldRestrictOrientation
{
  return (char *)[(ETVideoController *)self->_videoController videoState] == (char *)&dword_0 + 2;
}

- (BOOL)shouldAutorotate
{
  if (self->_showingLandscapeTrap) {
    return 1;
  }
  else {
    return ![(ETTranscriptDetailCanvasViewController *)self _shouldRestrictOrientation];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(ETTranscriptDetailCanvasViewController *)self _shouldRestrictOrientation]) {
    return 2;
  }
  else {
    return 30;
  }
}

- (id)_smallVideoOnButton
{
  smallVideoOnButton = self->_smallVideoOnButton;
  if (smallVideoOnButton)
  {
    BOOL v3 = smallVideoOnButton;
  }
  else
  {
    double v5 = +[NSBundle bundleForClass:objc_opt_class()];
    double v6 = +[UIButton buttonWithType:1];
    double v7 = self->_smallVideoOnButton;
    self->_smallVideoOnButton = v6;

    [(UIButton *)self->_smallVideoOnButton addTarget:self action:"_videoOnButtonTapped" forControlEvents:64];
    id v8 = self->_smallVideoOnButton;
    double v9 = +[UIImage imageNamed:@"VideoOn" inBundle:v5];
    [(UIButton *)v8 setBackgroundImage:v9 forState:0];

    [(UIButton *)self->_smallVideoOnButton sizeToFit];
    [(UIButton *)self->_smallVideoOnButton setAlpha:0.0];
    LODWORD(v10) = -1088841318;
    [(UIButton *)self->_smallVideoOnButton setCharge:v10];
    BOOL v3 = self->_smallVideoOnButton;
  }

  return v3;
}

- (id)_largeVideoOnButton
{
  largeVideoOnButton = self->_largeVideoOnButton;
  if (largeVideoOnButton)
  {
    BOOL v3 = largeVideoOnButton;
  }
  else
  {
    double v5 = +[NSBundle bundleForClass:objc_opt_class()];
    double v6 = +[UIButton buttonWithType:1];
    double v7 = self->_largeVideoOnButton;
    self->_largeVideoOnButton = v6;

    [(UIButton *)self->_largeVideoOnButton addTarget:self action:"_videoOnButtonTapped" forControlEvents:64];
    id v8 = self->_largeVideoOnButton;
    double v9 = +[UIImage imageNamed:@"ExpandToCamera" inBundle:v5];
    [(UIButton *)v8 setImage:v9 forState:0];

    double v10 = self->_largeVideoOnButton;
    double v11 = +[UIColor whiteColor];
    [(UIButton *)v10 setTintColor:v11];

    double v12 = self->_largeVideoOnButton;
    double v13 = +[UIColor colorWithWhite:0.4 alpha:1.0];
    [(UIButton *)v12 setBackgroundColor:v13];

    id v14 = [(UIButton *)self->_largeVideoOnButton layer];
    [v14 setCornerRadius:25.0];

    -[UIButton setFrame:](self->_largeVideoOnButton, "setFrame:", 0.0, 0.0, 50.0, 50.0);
    [(UIButton *)self->_largeVideoOnButton setAlpha:0.0];
    BOOL v3 = self->_largeVideoOnButton;
  }

  return v3;
}

- (void)_updateVideoOnButtonOpacity
{
  if (self->_largeVideoOnButton) {
    unsigned int v3 = [(ETTranscriptDetailCanvasViewController *)self _gestureInstructionViewIsShown];
  }
  else {
    unsigned int v3 = 0;
  }
  [(UIButton *)self->_videoOnButton setEnabled:v3 ^ 1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A234;
  v4[3] = &unk_24920;
  v4[4] = self;
  char v5 = v3;
  +[UIView animateWithDuration:v4 animations:0.25];
}

- (void)_updateVideoOnButtonForHorizontalSizeClass:(int64_t)a3
{
  if (a3 == 2
    && (+[UIDevice currentDevice],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom],
        v4,
        (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    uint64_t v6 = [(ETTranscriptDetailCanvasViewController *)self _largeVideoOnButton];
  }
  else
  {
    uint64_t v6 = [(ETTranscriptDetailCanvasViewController *)self _smallVideoOnButton];
  }
  double v7 = (UIButton *)v6;
  p_videoOnButton = &self->_videoOnButton;
  videoOnButton = self->_videoOnButton;
  obj = v7;
  if (videoOnButton != v7)
  {
    [(UIButton *)videoOnButton setAlpha:0.0];
    objc_storeStrong((id *)&self->_videoOnButton, obj);
  }
  if ([(ETTranscriptDetailCanvasViewController *)self isViewLoaded])
  {
    double v10 = [(ETTranscriptDetailCanvasViewController *)self view];
    double v11 = [(UIButton *)*p_videoOnButton superview];

    if (!v11) {
      [v10 addSubview:*p_videoOnButton];
    }
    double v12 = [(ETTranscriptDetailCanvasViewController *)self canvasView];
    [v12 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    CGFloat v21 = v14;
    CGFloat v22 = v16;
    CGFloat v23 = v18;
    CGFloat v24 = v20;
    if (*p_videoOnButton == self->_smallVideoOnButton)
    {
      CGRectGetMinX(*(CGRect *)&v21);
      [(UIButton *)*p_videoOnButton frame];
      [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
      UIRoundToViewScale();
      double v29 = v31;
      v37.origin.x = v14;
      v37.origin.y = v16;
      v37.size.width = v18;
      v37.size.height = v20;
      CGRectGetMaxY(v37);
      [(ETTranscriptDetailCanvasViewController *)self _cornerButtonInset];
      [(UIButton *)*p_videoOnButton frame];
      UIRoundToViewScale();
      double MidY = v32;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
      unsigned int v26 = [(ETTranscriptDetailCanvasViewController *)self view];
      [v26 bounds];
      double v28 = v27;
      v35.origin.x = v14;
      v35.origin.y = v16;
      v35.size.width = v18;
      v35.size.height = v20;
      double v29 = MaxX + (v28 - CGRectGetMaxX(v35)) * 0.5;
      v36.origin.x = v14;
      v36.origin.y = v16;
      v36.size.width = v18;
      v36.size.height = v20;
      double MidY = CGRectGetMidY(v36);
    }
    -[UIButton setCenter:](*p_videoOnButton, "setCenter:", v29, MidY);
    [(ETTranscriptDetailCanvasViewController *)self _updateVideoOnButtonOpacity];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ETTranscriptDetailCanvasViewController;
  [(ETTranscriptDetailCanvasViewController *)&v5 traitCollectionDidChange:a3];
  id v4 = [(ETTranscriptDetailCanvasViewController *)self traitCollection];
  -[ETTranscriptDetailCanvasViewController _updateVideoOnButtonForHorizontalSizeClass:](self, "_updateVideoOnButtonForHorizontalSizeClass:", [v4 horizontalSizeClass]);

  [(ETTranscriptDetailCanvasViewController *)self _updateGestureInstructionButton];
}

- (void)dataSourceStopPlayback:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "dataSourceStopPlayback: Data source is calling transcript methods on full-screen instance.", v5, 2u);
    }
  }
}

- (void)dataSource:(id)a3 startPlaybackWithCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "dataSource:startPlaybackWithCompletion: Data source is calling transcript methods on full-screen instance.", v8, 2u);
    }
  }
}

- (ETTranscriptDetailCanvasViewControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (ETTranscriptDetailCanvasViewControllerPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_gestureInstructionButton, 0);
  objc_storeStrong((id *)&self->_gestureInstructionView, 0);
  objc_storeStrong((id *)&self->_mediaInstructionView, 0);
  objc_storeStrong((id *)&self->_landscapeTrapView, 0);
  objc_storeStrong((id *)&self->_videoZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cameraFlipButton, 0);
  objc_storeStrong((id *)&self->_videoProgressTimeFormatter, 0);
  objc_storeStrong((id *)&self->_videoProgressTimeLabel, 0);
  objc_storeStrong((id *)&self->_videoProgressDot, 0);
  objc_storeStrong((id *)&self->_videoProgressBar, 0);
  objc_storeStrong((id *)&self->_photoSendMessageTimer, 0);
  objc_storeStrong((id *)&self->_photoCaptureButton, 0);
  objc_storeStrong((id *)&self->_videoRecordButton, 0);
  objc_storeStrong((id *)&self->_backToPreviewButton, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_videoOnButton, 0);
  objc_storeStrong((id *)&self->_largeVideoOnButton, 0);
  objc_storeStrong((id *)&self->_smallVideoOnButton, 0);
  objc_storeStrong((id *)&self->_mediaMessage, 0);
  objc_storeStrong((id *)&self->_videoController, 0);
  objc_storeStrong((id *)&self->_expandColorPickerButton, 0);
  objc_storeStrong((id *)&self->_expandToCameraButton, 0);
  objc_storeStrong((id *)&self->_showCompositionControlsTimer, 0);

  objc_storeStrong((id *)&self->_expandedColorPicker, 0);
}

@end