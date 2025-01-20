@interface DTSCanvasViewController
+ (id)audioToggleOffImage;
+ (id)audioToggleOnImage;
+ (id)replayButtonFont;
- (BOOL)_canComposeAfterMediaPlayback;
- (BOOL)_canLoopMessageDuringPlayback:(id)a3;
- (BOOL)_canStartMessagePlaybackLoop;
- (BOOL)_isVisible;
- (BOOL)_shouldAutoSend;
- (BOOL)_shouldDimColorPicker;
- (BOOL)_shouldShowCancelButton;
- (BOOL)_shouldShowSkipButton;
- (BOOL)_tapRecognizerShouldBegin:(id)a3;
- (BOOL)_usingDemoHook;
- (BOOL)canExpireMessages;
- (BOOL)canReplay;
- (BOOL)canShowReplayButton;
- (BOOL)canvasView:(id)a3 tapRecognizerShouldBegin:(id)a4;
- (BOOL)dataSource:(id)a3 addDemoHookToMessage:(id *)a4;
- (BOOL)dataSourceViewIsMostlyVisible:(id)a3;
- (BOOL)deferMessageSend;
- (BOOL)hasMessageForReplay;
- (BOOL)ignoreAppearanceCallbacks;
- (BOOL)isAutoPlayOnAppearanceDisabled;
- (BOOL)isComposeDisabled;
- (BOOL)isComposingCompositeMessage;
- (BOOL)isPaused;
- (BOOL)isPlaybackEnabled;
- (BOOL)isPlayingCompositeMessage;
- (BOOL)isPlayingMessages;
- (BOOL)overrideAudioDefaultToOff;
- (BOOL)shouldAutorotate;
- (BOOL)usesCompactKeyboardLayout;
- (DTSCanvasViewController)init;
- (DTSCanvasViewControllerSendDelegate)sendDelegate;
- (DTSColorPicker)colorPicker;
- (ETBalloonPluginDataSource)dataSource;
- (ETCanvasView)canvasView;
- (ETMessage)messageForReplay;
- (ETMessage)playingMessage;
- (NSArray)deferredMessages;
- (double)_cornerButtonInset;
- (double)_nonAnimatedMessagePlaybackDuration;
- (double)mediaMessagePlayTrackerTime;
- (id)_audioToggleButton;
- (id)_cancelButton;
- (id)_playingParentMessage;
- (id)_replayButton;
- (id)_skipButton;
- (id)balloonPlaybackCompletion;
- (int64_t)recentHeartRate;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)composingMessageType;
- (void)_applicationDidBecomeActive;
- (void)_applicationDidEnterBackground;
- (void)_applicationWillResignActive;
- (void)_audioToggleButtonTapped;
- (void)_cancelButtonTapped;
- (void)_clearComposeSessionEndTimer;
- (void)_composeSessionEndTimerFired;
- (void)_continueMessagePlaybackLoopWithDelay:(BOOL)a3;
- (void)_exportDemoHookMessage;
- (void)_hideVideoPlayer;
- (void)_playMessage:(id)a3;
- (void)_playNextMessage;
- (void)_relinquishAudio;
- (void)_reloadUnplayedMessages;
- (void)_schedulePlaybackOfCompositeMessageContent:(id)a3;
- (void)_sendAutosendingComposition;
- (void)_sendDemoHookMessage;
- (void)_setCachedMessageForReplay:(id)a3;
- (void)_setReplayButton:(id)a3;
- (void)_setShowingReplayButton:(BOOL)a3;
- (void)_showDemoHookAlertWithTitle:(id)a3 message:(id)a4;
- (void)_skipButtonTapped;
- (void)_startComposeSessionEndTimer;
- (void)_startVideoPlayerWithMessage:(id)a3;
- (void)_stopPlaybackAnimated:(BOOL)a3;
- (void)_updateAudioOnOffButton;
- (void)_updateAudioOnOffButtonImage;
- (void)_updateCanvasInteractionEnabled;
- (void)_updateColorPickerEnabled;
- (void)_updatePlaybackControls;
- (void)_updateSkipButtonFrame;
- (void)_updateVideoPlayerUI;
- (void)_videoMessageDidFinishPlaying:(id)a3;
- (void)addUnplayedMessage:(id)a3;
- (void)canvasView:(id)a3 angerUsesForceTouch:(BOOL)a4;
- (void)canvasView:(id)a3 didBeginComposingMessageType:(unsigned __int16)a4;
- (void)canvasView:(id)a3 didBeginPlayingMessage:(id)a4;
- (void)canvasView:(id)a3 didEndComposingMessageType:(unsigned __int16)a4;
- (void)canvasView:(id)a3 didEndPlayingMessage:(id)a4;
- (void)canvasView:(id)a3 sendMessage:(id)a4;
- (void)canvasView:(id)a3 willEndPlayingMessage:(id)a4;
- (void)canvasViewDidPause:(id)a3;
- (void)canvasViewDidUnpause:(id)a3;
- (void)canvasViewWillReachComposingSizeLimit:(id)a3;
- (void)clearDeferredMessages;
- (void)colorPickerSelectedColorDidChange:(id)a3;
- (void)colorPickerTapped:(id)a3;
- (void)dataSource:(id)a3 didReceiveSessionMessage:(id)a4;
- (void)dataSource:(id)a3 didUpdateAttachmentURL:(id)a4 forMessageWithIdentifier:(id)a5;
- (void)dataSource:(id)a3 startPlaybackWithCompletion:(id)a4;
- (void)dataSourceStopPlayback:(id)a3;
- (void)replay;
- (void)setAutoPlayOnAppearanceDisabled:(BOOL)a3;
- (void)setBalloonPlaybackCompletion:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setColorPicker:(id)a3;
- (void)setComposeDisabled:(BOOL)a3;
- (void)setComposingCompositeMessage:(BOOL)a3;
- (void)setComposingMessageType:(unsigned __int16)a3;
- (void)setDataSource:(id)a3;
- (void)setDeferMessageSend:(BOOL)a3;
- (void)setIgnoreAppearanceCallbacks:(BOOL)a3;
- (void)setMediaMessagePlayTrackerTime:(double)a3;
- (void)setMessageForReplay:(id)a3;
- (void)setOverrideAudioDefaultToOff:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaybackEnabled:(BOOL)a3;
- (void)setPlayingCompositeMessage:(BOOL)a3;
- (void)setPlayingMessage:(id)a3;
- (void)setPlayingMessages:(BOOL)a3;
- (void)setSendDelegate:(id)a3;
- (void)setUsesCompactKeyboardLayout:(BOOL)a3;
- (void)startMessagePlaybackLoop;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DTSCanvasViewController

+ (id)replayButtonFont
{
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:19.0];
}

+ (id)audioToggleOnImage
{
  if (audioToggleOnImage_onceToken != -1) {
    dispatch_once(&audioToggleOnImage_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)audioToggleOnImage_image;

  return v2;
}

void __45__DTSCanvasViewController_audioToggleOnImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 imageNamed:@"AudioOn" inBundle:v3];
  v2 = (void *)audioToggleOnImage_image;
  audioToggleOnImage_image = v1;
}

+ (id)audioToggleOffImage
{
  if (audioToggleOffImage_onceToken != -1) {
    dispatch_once(&audioToggleOffImage_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)audioToggleOffImage_image;

  return v2;
}

void __46__DTSCanvasViewController_audioToggleOffImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 imageNamed:@"AudioOff" inBundle:v3];
  v2 = (void *)audioToggleOffImage_image;
  audioToggleOffImage_image = v1;
}

- (DTSCanvasViewController)init
{
  v30.receiver = self;
  v30.super_class = (Class)DTSCanvasViewController;
  v2 = [(DTSCanvasViewController *)&v30 init];
  if (v2)
  {
    id v3 = objc_alloc_init(ETCanvasView);
    canvasView = v2->_canvasView;
    v2->_canvasView = v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    unplayedMessages = v2->_unplayedMessages;
    v2->_unplayedMessages = (NSMutableArray *)v5;

    [(DTSCanvasViewController *)v2 setComposingMessageType:0xFFFFLL];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [MEMORY[0x263F1C488] buttonWithType:1];
    replayButton = v2->_replayButton;
    v2->_replayButton = (UIButton *)v8;

    [(UIButton *)v2->_replayButton addTarget:v2 action:sel_replay forControlEvents:64];
    v10 = v2->_replayButton;
    v11 = [MEMORY[0x263F1C6B0] imageNamed:@"Replay" inBundle:v7];
    [(UIButton *)v10 setBackgroundImage:v11 forState:0];

    [(UIButton *)v2->_replayButton sizeToFit];
    [(UIButton *)v2->_replayButton setAlpha:0.0];
    LODWORD(v12) = -1093874483;
    [(UIButton *)v2->_replayButton setCharge:v12];
    uint64_t v13 = [MEMORY[0x263F1C488] buttonWithType:1];
    audioToggleButton = v2->_audioToggleButton;
    v2->_audioToggleButton = (UIButton *)v13;

    v15 = v2->_audioToggleButton;
    v16 = +[DTSCanvasViewController audioToggleOffImage];
    [(UIButton *)v15 setBackgroundImage:v16 forState:0];

    [(UIButton *)v2->_audioToggleButton addTarget:v2 action:sel__audioToggleButtonTapped forControlEvents:64];
    LODWORD(v17) = -1093874483;
    [(UIButton *)v2->_audioToggleButton setCharge:v17];
    [(UIButton *)v2->_audioToggleButton setAlpha:0.0];
    [(UIButton *)v2->_audioToggleButton sizeToFit];
    uint64_t v18 = [MEMORY[0x263F1C488] buttonWithType:1];
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIButton *)v18;

    [(UIButton *)v2->_cancelButton addTarget:v2 action:sel__cancelButtonTapped forControlEvents:64];
    v20 = v2->_cancelButton;
    v21 = [MEMORY[0x263F1C6B0] imageNamed:@"Cancel" inBundle:v7];
    [(UIButton *)v20 setBackgroundImage:v21 forState:0];

    [(UIButton *)v2->_cancelButton sizeToFit];
    [(UIButton *)v2->_cancelButton setAlpha:0.0];
    LODWORD(v22) = -1093874483;
    [(UIButton *)v2->_cancelButton setCharge:v22];
    uint64_t v23 = [MEMORY[0x263F1C488] buttonWithType:1];
    skipButton = v2->_skipButton;
    v2->_skipButton = (UIButton *)v23;

    [(UIButton *)v2->_skipButton addTarget:v2 action:sel__skipButtonTapped forControlEvents:64];
    v25 = v2->_skipButton;
    v26 = [MEMORY[0x263F1C6B0] imageNamed:@"Skip" inBundle:v7];
    [(UIButton *)v25 setBackgroundImage:v26 forState:0];

    [(UIButton *)v2->_skipButton sizeToFit];
    [(UIButton *)v2->_skipButton setAlpha:0.0];
    LODWORD(v27) = -1093874483;
    [(UIButton *)v2->_skipButton setCharge:v27];
    v28 = v2;
  }
  return v2;
}

- (void)setDataSource:(id)a3
{
  p_dataSource = &self->_dataSource;
  objc_storeWeak((id *)&self->_dataSource, a3);
  if (!a3)
  {
    [(DTSCanvasViewController *)self _sendAutosendingComposition];
    [(DTSCanvasViewController *)self setPlaybackEnabled:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  [WeakRetained setDelegate:self];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)DTSCanvasViewController;
  [(DTSCanvasViewController *)&v9 viewDidLoad];
  id v3 = [(DTSCanvasViewController *)self view];
  [v3 setAccessibilityIgnoresInvertColors:1];
  [v3 addSubview:self->_canvasView];
  [(ETCanvasView *)self->_canvasView setCanvasDelegate:self];
  v4 = [(DTSCanvasViewController *)self colorPicker];
  colorPicker = self->_colorPicker;
  self->_colorPicker = v4;

  v6 = self->_colorPicker;
  if (v6)
  {
    [(DTSColorPicker *)v6 setDelegate:self];
    [v3 addSubview:self->_colorPicker];
    canvasView = self->_canvasView;
    uint64_t v8 = [(DTSColorPicker *)self->_colorPicker selectedColor];
    [(ETCanvasView *)canvasView setDrawingColor:v8];
  }
  [v3 insertSubview:self->_audioToggleButton above:self->_canvasView];
  [v3 addSubview:self->_cancelButton];
  [v3 addSubview:self->_skipButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  if (!self->_ignoreAppearanceCallbacks)
  {
    v7.receiver = self;
    v7.super_class = (Class)DTSCanvasViewController;
    [(DTSCanvasViewController *)&v7 viewDidAppear:a3];
    if ([(DTSCanvasViewController *)self _canComposeAfterMediaPlayback])
    {
      v4 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v5 = [v4 applicationState];

      if (!v5) {
        +[ETGLSketchRenderer warmupShaders];
      }
    }
    [(DTSCanvasViewController *)self setComposingMessageType:0xFFFFLL];
    if (!self->_autoPlayOnAppearanceDisabled
      && ![(DTSCanvasViewController *)self usesCompactKeyboardLayout])
    {
      [(DTSCanvasViewController *)self setPlaybackEnabled:1];
      [(DTSCanvasViewController *)self startMessagePlaybackLoop];
    }
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__applicationWillResignActive name:*MEMORY[0x263F1D0D8] object:0];
    [v6 addObserver:self selector:sel__applicationDidBecomeActive name:*MEMORY[0x263F1D038] object:0];
    [v6 addObserver:self selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F1D050] object:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (!self->_ignoreAppearanceCallbacks)
  {
    v5.receiver = self;
    v5.super_class = (Class)DTSCanvasViewController;
    [(DTSCanvasViewController *)&v5 viewWillDisappear:a3];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self];

    [(DTSCanvasViewController *)self setPlaybackEnabled:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DTSCanvasViewController;
  [(DTSCanvasViewController *)&v4 viewDidDisappear:a3];
  [(DTSCanvasViewController *)self _sendAutosendingComposition];
  [(ETCanvasView *)self->_canvasView clearCanvasAnimated:0];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)DTSCanvasViewController;
  [(DTSCanvasViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(DTSCanvasViewController *)self canvasView];
  objc_super v4 = [(DTSCanvasViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DTSCanvasViewController;
  [(DTSCanvasViewController *)&v3 viewDidLayoutSubviews];
  [(DTSCanvasViewController *)self _updateVideoPlayerUI];
}

- (BOOL)canExpireMessages
{
  return 0;
}

- (void)_updateVideoPlayerUI
{
  [(DTSCanvasViewController *)self _updatePlaybackControls];

  [(DTSCanvasViewController *)self _updateAudioOnOffButton];
}

- (BOOL)_shouldShowSkipButton
{
  if (!self->_playingMessages || self->_composingCompositeMessage || self->_playingCompositeMessage) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v4 = [WeakRetained sessionHasMultipleMessages];

  return v4;
}

- (BOOL)_shouldShowCancelButton
{
  return [(ETCanvasView *)self->_canvasView usesMediaAppearance];
}

- (double)_cornerButtonInset
{
  v2 = [(ETCanvasView *)self->_canvasView layer];
  [v2 cornerRadius];
  double v4 = v3 * 0.5;

  return v4;
}

- (void)_updateSkipButtonFrame
{
  skipButton = self->_skipButton;
  double v4 = [(DTSCanvasViewController *)self _cancelButton];
  [v4 frame];
  -[UIButton setFrame:](skipButton, "setFrame:");

  objc_super v5 = self->_skipButton;
  [(DTSColorPicker *)self->_colorPicker center];

  -[UIButton setCenter:](v5, "setCenter:");
}

- (void)_updatePlaybackControls
{
  [(ETCanvasView *)self->_canvasView frame];
  double v4 = v3;
  double v6 = v5;
  id v18 = [(DTSCanvasViewController *)self _cancelButton];
  [v18 frame];
  double v8 = v7;
  double v10 = v9;
  [(DTSCanvasViewController *)self _cornerButtonInset];
  double v12 = v4 + v11;
  [(DTSCanvasViewController *)self _cornerButtonInset];
  objc_msgSend(v18, "setFrame:", v12, v6 + v13, v8, v10);
  BOOL v14 = [(DTSCanvasViewController *)self _shouldShowCancelButton];
  BOOL v15 = [(ETCanvasView *)self->_canvasView usesMediaAppearance];
  double v16 = 0.4;
  if (v15) {
    double v16 = 1.0;
  }
  if (!v14) {
    double v16 = 0.0;
  }
  [v18 setAlpha:v16];
  [(UIButton *)self->_skipButton setAlpha:(double)[(DTSCanvasViewController *)self _shouldShowSkipButton]];
  [(DTSCanvasViewController *)self _updateSkipButtonFrame];
  double v17 = [(DTSCanvasViewController *)self _replayButton];
  objc_msgSend(v17, "setEnabled:", -[DTSCanvasViewController canReplay](self, "canReplay"));

  [(DTSCanvasViewController *)self _setShowingReplayButton:[(DTSCanvasViewController *)self canShowReplayButton]];
}

- (id)_audioToggleButton
{
  return self->_audioToggleButton;
}

- (void)_updateAudioOnOffButton
{
  [(ETCanvasView *)self->_canvasView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIButton *)self->_audioToggleButton frame];
  double v12 = v11;
  double v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGFloat v15 = CGRectGetMaxX(v24) - v12;
  [(DTSCanvasViewController *)self _rightButtonInset];
  CGFloat v17 = v15 - v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  double MinY = CGRectGetMinY(v25);
  [(DTSCanvasViewController *)self _cornerButtonInset];
  -[UIButton setFrame:](self->_audioToggleButton, "setFrame:", v17, MinY + v19, v12, v14);
  if (self->_composingCompositeMessage || !self->_videoPlayer)
  {
    int v20 = 0;
  }
  else
  {
    [(DTSCanvasViewController *)self _updateAudioOnOffButtonImage];
    int v20 = 1;
  }
  [(UIButton *)self->_audioToggleButton alpha];
  if (((v20 ^ (v21 == 0.0)) & 1) == 0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __50__DTSCanvasViewController__updateAudioOnOffButton__block_invoke;
    v22[3] = &unk_264DECEB8;
    v22[4] = self;
    char v23 = v20;
    [MEMORY[0x263F1CB60] animateWithDuration:v22 animations:0.25];
  }
}

uint64_t __50__DTSCanvasViewController__updateAudioOnOffButton__block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:v1];
}

- (void)_updateAudioOnOffButtonImage
{
  videoPlayer = self->_videoPlayer;
  if (videoPlayer && ![(AVPlayer *)videoPlayer isMuted])
  {
    uint64_t v4 = +[DTSCanvasViewController audioToggleOnImage];
  }
  else
  {
    uint64_t v4 = +[DTSCanvasViewController audioToggleOffImage];
  }
  id v5 = (id)v4;
  [(UIButton *)self->_audioToggleButton setBackgroundImage:v4 forState:0];
}

- (void)_relinquishAudio
{
  v2 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v2, &__block_literal_global_101);
}

void __43__DTSCanvasViewController__relinquishAudio__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EF93E0] sharedInstance];
  id v3 = 0;
  [v0 setActive:0 withOptions:1 error:&v3];
  id v1 = v3;

  if (v1 && IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_impl(&dword_23B55A000, v2, OS_LOG_TYPE_INFO, "Failed to deactivate audio and notify others of deactivation with error: %@", buf, 0xCu);
    }
  }
}

- (void)_audioToggleButtonTapped
{
  uint64_t v3 = [(AVPlayer *)self->_videoPlayer isMuted] ^ 1;
  [(AVPlayer *)self->_videoPlayer setMuted:v3];
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [NSNumber numberWithBool:v3];
  [v4 setValue:v5 forKey:@"ETVideoAudioOffPreference"];

  [(DTSCanvasViewController *)self _updateAudioOnOffButtonImage];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DTSCanvasViewController__audioToggleButtonTapped__block_invoke;
  block[3] = &unk_264DEC6D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__DTSCanvasViewController__audioToggleButtonTapped__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1024) isMuted];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _relinquishAudio];
  }
  return result;
}

- (void)_applicationWillResignActive
{
  [(DTSCanvasViewController *)self _sendAutosendingComposition];
  canvasView = self->_canvasView;

  [(ETCanvasView *)canvasView setPaused:1];
}

- (void)_sendAutosendingComposition
{
  if ([(ETCanvasView *)self->_canvasView isComposing]
    && [(DTSCanvasViewController *)self _shouldAutoSend])
  {
    canvasView = self->_canvasView;
    [(ETCanvasView *)canvasView sendCurrentMessage];
  }
}

- (void)_applicationDidBecomeActive
{
  id v2 = [(DTSCanvasViewController *)self canvasView];
  [v2 setAlwaysPaused:0];
}

- (void)_applicationDidEnterBackground
{
  [(DTSCanvasViewController *)self setPlaybackEnabled:0];
  [(ETCanvasView *)self->_canvasView setAlwaysPaused:1];
  [(ETCanvasView *)self->_canvasView setPaused:1];
  [(DTSCanvasViewController *)self _sendAutosendingComposition];
  canvasView = self->_canvasView;

  [(ETCanvasView *)canvasView clearCanvasAnimated:0];
}

- (void)addUnplayedMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [v4 identifier];
        uint64_t v8 = [(NSMutableArray *)self->_unplayedMessages count];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = v8;
        _os_log_impl(&dword_23B55A000, v6, OS_LOG_TYPE_INFO, "Adding to session unplayed message ID: %@, total count: %lu", (uint8_t *)&v10, 0x16u);
      }
    }
    [(NSMutableArray *)self->_unplayedMessages addObject:v4];
    [(DTSCanvasViewController *)self startMessagePlaybackLoop];
  }
  else if (v5)
  {
    double v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_23B55A000, v9, OS_LOG_TYPE_INFO, "Not adding nil message", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)replay
{
  if (self->_playingCompositeMessage)
  {
    messageForReplay = self->_messageForReplay;
    [(DTSCanvasViewController *)self setPlayingMessage:messageForReplay];
  }
  else
  {
    [(DTSCanvasViewController *)self _reloadUnplayedMessages];
    [(DTSCanvasViewController *)self startMessagePlaybackLoop];
  }
}

- (BOOL)canReplay
{
  if (self->_messageForReplay && !self->_isPlayingMessage)
  {
    id v4 = [(DTSCanvasViewController *)self canvasView];
    if ([v4 isComposing]) {
      LOBYTE(v3) = 0;
    }
    else {
      BOOL v3 = ![(DTSCanvasViewController *)self isPlayingMessages];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasMessageForReplay
{
  return self->_messageForReplay != 0;
}

- (void)_setCachedMessageForReplay:(id)a3
{
  id v4 = (ETMessage *)a3;
  [(ETMessage *)self->_messageForReplay wispChildren];
  messageForReplay = self->_messageForReplay;
  self->_messageForReplay = v4;

  [(DTSCanvasViewController *)self _updatePlaybackControls];
}

- (void)setComposingCompositeMessage:(BOOL)a3
{
  if (self->_composingCompositeMessage != a3)
  {
    self->_composingCompositeMessage = a3;
    if (!a3)
    {
      id v4 = [(DTSCanvasViewController *)self canvasView];
      [v4 endMessageComposition];
      [v4 clearCanvasAnimated:0];
      [(NSMutableArray *)self->_unplayedMessages removeAllObjects];
      [(ETMessage *)self->_playingMessage stopPlaying];
      [(DTSCanvasViewController *)self _hideVideoPlayer];
      [(ETCanvasView *)self->_canvasView hidePhoto];
      [(DTSCanvasViewController *)self _updateColorPickerEnabled];
      [(DTSCanvasViewController *)self _updatePlaybackControls];
      [(DTSCanvasViewController *)self updateVideoUI];
      [(DTSCanvasViewController *)self _setCachedMessageForReplay:0];
    }
  }
}

- (void)setPlayingMessage:(id)a3
{
  id v4 = a3;
  [v4 setMissedDuringPlayback:0];
  [(DTSCanvasViewController *)self _setCachedMessageForReplay:v4];
  if (!v4 || [v4 messageType] != 8)
  {
    [(DTSCanvasViewController *)self _hideVideoPlayer];
    uint64_t v5 = 0;
LABEL_8:
    [(ETCanvasView *)self->_canvasView hidePhoto];
    goto LABEL_9;
  }
  if ([v4 mediaType] != 1) {
    [(DTSCanvasViewController *)self _hideVideoPlayer];
  }
  uint64_t v5 = 1;
  if ([v4 mediaType] != 2) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v6 = [(DTSCanvasViewController *)self canvasView];
  [v6 setUsesMediaAppearance:v5];
  if (v5) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }
  [v6 setParentMessage:v7];
  if (v4) {
    [(DTSCanvasViewController *)self _playMessage:v4];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__DTSCanvasViewController_setPlayingMessage___block_invoke;
  v8[3] = &unk_264DEC6D0;
  v8[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v8];
}

uint64_t __45__DTSCanvasViewController_setPlayingMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaybackControls];
}

- (void)_playMessage:(id)a3
{
  uint64_t v5 = (ETMessage *)a3;
  p_playingMessage = &self->_playingMessage;
  if (self->_playingMessage != v5
    && self->_playbackEnabled
    && [(DTSCanvasViewController *)self _isVisible])
  {
    [(ETMessage *)v5 setMissedDuringPlayback:0];
    if ([(ETMessage *)v5 messageType] == 8)
    {
      [(DTSCanvasViewController *)self setPlayingCompositeMessage:1];
      [(DTSCanvasViewController *)self _setCachedMessageForReplay:v5];
    }
    objc_storeStrong((id *)&self->_playingMessage, a3);
    if (*p_playingMessage)
    {
      if ([(DTSCanvasViewController *)self _isVisible])
      {
        if (!self->_isPlayingMessage
          || (messageForReplay = self->_messageForReplay,
              [(ETMessage *)v5 parentMessage],
              uint64_t v8 = (ETMessage *)objc_claimAutoreleasedReturnValue(),
              v8,
              messageForReplay == v8))
        {
          if ([(ETMessage *)v5 messageType] == 8)
          {
            [(ETCanvasView *)self->_canvasView setUsesMediaAppearance:1];
            double v9 = v5;
            if ([(ETMessage *)v9 mediaType] == 1)
            {
              [(DTSCanvasViewController *)self _startVideoPlayerWithMessage:v9];
            }
            else if ([(ETMessage *)v9 mediaType] == 2)
            {
              canvasView = self->_canvasView;
              id v11 = [(ETMessage *)v9 stillImage];
              [(ETCanvasView *)canvasView showPhotoForImage:v11];

              [(DTSCanvasViewController *)self _schedulePlaybackOfCompositeMessageContent:v9];
            }
          }
          self->_isPlayingMessage = 1;
          [(DTSCanvasViewController *)self _updateColorPickerEnabled];
          [(ETCanvasView *)self->_canvasView playMessage:*p_playingMessage];
          if (![(ETMessage *)v5 isAnimated])
          {
            __int16 v12 = *p_playingMessage;
            objc_initWeak(&location, self);
            [(DTSCanvasViewController *)self _nonAnimatedMessagePlaybackDuration];
            dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __40__DTSCanvasViewController__playMessage___block_invoke;
            block[3] = &unk_264DECEE0;
            objc_copyWeak(&v18, &location);
            CGFloat v17 = v12;
            CGFloat v15 = v12;
            dispatch_after(v14, MEMORY[0x263EF83A0], block);

            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
        }
      }
    }
    else if ([(NSMutableArray *)self->_unplayedMessages count])
    {
      [(DTSCanvasViewController *)self startMessagePlaybackLoop];
    }
  }
}

void __40__DTSCanvasViewController__playMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained messageForReplay];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 stopPlaying];
  }
}

- (void)setPlayingMessages:(BOOL)a3
{
  if (self->_playingMessages != a3)
  {
    self->_playingMessages = a3;
    [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
  }
}

- (void)_schedulePlaybackOfCompositeMessageContent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_mediaMessagePlayTrackerTime = Current;
  if ([v4 messageType] == 8)
  {
    uint64_t v6 = [v4 introMessage];
    if (v6)
    {
      dispatch_time_t v7 = dispatch_time(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke;
      block[3] = &unk_264DECA90;
      void block[4] = self;
      double v31 = Current;
      id v30 = v6;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
  }
  uint64_t v8 = (void *)MEMORY[0x263EFF980];
  double v9 = [v4 playingMessages];
  int v10 = [v8 arrayWithArray:v9];
  unplayedMessages = self->_unplayedMessages;
  self->_unplayedMessages = v10;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v22 = v4;
  __int16 v12 = [v4 playingMessages];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    double v16 = MEMORY[0x263EF83A0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v18 startDelay];
        dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_2;
        v24[3] = &unk_264DECA90;
        *(double *)&v24[6] = Current;
        v24[4] = self;
        v24[5] = v18;
        dispatch_after(v20, v16, v24);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v14);
  }

  dispatch_time_t v21 = dispatch_time(0, 0);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_3;
  v23[3] = &unk_264DECF08;
  v23[4] = self;
  *(double *)&v23[5] = Current;
  dispatch_after(v21, MEMORY[0x263EF83A0], v23);
}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke(uint64_t a1)
{
  uint64_t result = *(double **)(a1 + 32);
  if (result[135] == *(double *)(a1 + 48)) {
    return (double *)[result _playMessage:*(void *)(a1 + 40)];
  }
  return result;
}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(double **)(a1 + 32);
  if (result[135] == *(double *)(a1 + 48)) {
    return (double *)[result _playMessage:*(void *)(a1 + 40)];
  }
  return result;
}

double *__70__DTSCanvasViewController__schedulePlaybackOfCompositeMessageContent___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(double **)(a1 + 32);
  if (result[135] == *(double *)(a1 + 40)) {
    return (double *)[result willBeginSessionPlayback];
  }
  return result;
}

- (BOOL)_isVisible
{
  if (![(DTSCanvasViewController *)self isViewLoaded]) {
    return 0;
  }
  BOOL v3 = [(DTSCanvasViewController *)self view];
  id v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_shouldDimColorPicker
{
  if ([(DTSCanvasViewController *)self isPlayingCompositeMessage]
    || self->_isPlayingMessage)
  {
    return 1;
  }

  return [(DTSCanvasViewController *)self isPlayingMessages];
}

- (void)_updateColorPickerEnabled
{
  id v3 = [(DTSCanvasViewController *)self colorPicker];
  objc_msgSend(v3, "setDimmed:", -[DTSCanvasViewController _shouldDimColorPicker](self, "_shouldDimColorPicker"));
}

- (BOOL)_shouldAutoSend
{
  return !self->_composingCompositeMessage;
}

- (BOOL)usesCompactKeyboardLayout
{
  return 0;
}

- (void)setComposeDisabled:(BOOL)a3
{
  if (self->_composeDisabled != a3)
  {
    self->_composeDisabled = a3;
    [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
  }
}

- (void)colorPickerSelectedColorDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DTSCanvasViewController *)self canvasView];
  uint64_t v6 = [v4 selectedColor];

  [v5 setDrawingColor:v6];

  [(DTSCanvasViewController *)self didChangeColorPickerColor];
}

- (void)colorPickerTapped:(id)a3
{
  id v9 = a3;
  if ([(DTSCanvasViewController *)self _usingDemoHook])
  {
    id v4 = [v9 selectedCircle];
    BOOL v5 = [v9 paletteCircles];
    uint64_t v6 = [v5 firstObject];

    if (v6 == v4)
    {
      [(DTSCanvasViewController *)self _exportDemoHookMessage];
    }
    else
    {
      dispatch_time_t v7 = [v9 paletteCircles];
      uint64_t v8 = [v7 lastObject];

      if (v8 == v4) {
        [(DTSCanvasViewController *)self _sendDemoHookMessage];
      }
    }
  }
}

- (BOOL)_usingDemoHook
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 objectForKey:@"DigitalTouchDemoHook"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (void)_sendDemoHookMessage
{
  dispatch_time_t v7 = objc_alloc_init(ETHeartbeatMessage);
  id v3 = NSString;
  id v4 = [(ETMessage *)v7 identifier];
  BOOL v5 = [v3 stringWithFormat:@"%@%@", @"DemoHook-", v4];
  [(ETMessage *)v7 setIdentifier:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);
  [WeakRetained canvasViewController:self sendMessage:v7];
}

- (void)_exportDemoHookMessage
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"DigitalTouchDemoHookExportDirectory"];

  if (!v4)
  {
    id v9 = [NSString stringWithFormat:@"%@ preference isn't set", @"DigitalTouchDemoHookExportDirectory"];
    [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"Can't Export" message:v9];
LABEL_9:

    goto LABEL_10;
  }
  messageForReplay = self->_messageForReplay;
  if (messageForReplay)
  {
    uint64_t v6 = NSString;
    dispatch_time_t v7 = [(ETMessage *)messageForReplay identifier];
    uint64_t v8 = [v6 stringWithFormat:@"%@%@", @"DemoHook-", v7];
    id v9 = [v4 stringByAppendingPathComponent:v8];

    int v10 = [(ETMessage *)self->_messageForReplay archive];
    id v15 = 0;
    char v11 = [v10 writeToFile:v9 options:1 error:&v15];
    id v12 = v15;

    if (v11)
    {
      uint64_t v13 = [NSString stringWithFormat:@"Path: %@", v9];
      uint64_t v14 = @"Wrote Message";
    }
    else
    {
      uint64_t v13 = [NSString stringWithFormat:@"Error: %@, at path: %@", v12, v9];
      uint64_t v14 = @"Failed to write message";
    }
    [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:v14 message:v13];

    goto LABEL_9;
  }
  [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"No Replay Message" message:@"You can only export messages that have just played in full-screen."];
LABEL_10:
}

- (void)_showDemoHookAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  BOOL v5 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Done" style:0 handler:0];
  [v6 addAction:v5];
  [(DTSCanvasViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_updateCanvasInteractionEnabled
{
  id v3 = [(DTSCanvasViewController *)self canvasView];
  id v5 = v3;
  if (self->_composeDisabled)
  {
    uint64_t v4 = 0;
  }
  else
  {
    if ([(DTSCanvasViewController *)self isPlayingMessages]) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = [(DTSCanvasViewController *)self isPlayingCompositeMessage] ^ 1;
    }
    id v3 = v5;
  }
  [v3 setUserInteractionEnabled:v4];
}

- (void)canvasView:(id)a3 didBeginPlayingMessage:(id)a4
{
  [(DTSCanvasViewController *)self updateVideoUI];

  [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
}

- (void)canvasView:(id)a3 willEndPlayingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  unplayedMessages = self->_unplayedMessages;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  long long v26 = __60__DTSCanvasViewController_canvasView_willEndPlayingMessage___block_invoke;
  long long v27 = &unk_264DECF30;
  id v9 = v7;
  id v28 = v9;
  v29 = &v30;
  [(NSMutableArray *)unplayedMessages enumerateObjectsUsingBlock:&v24];
  uint64_t v10 = v31[3];
  char v11 = objc_msgSend(v9, "parentMessage", v24, v25, v26, v27);
  if ([v11 messageType] == 1)
  {
    id v12 = [v11 introMessage];
    BOOL v13 = v12 == v9;
  }
  else
  {
    BOOL v13 = 0;
  }
  int v14 = [v9 messageType];
  char v16 = v10 != 0x7FFFFFFFFFFFFFFFLL || v14 == 8 || v13;
  if (v16)
  {
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_unplayedMessages removeObjectAtIndex:v31[3]];
    }
    CGFloat v17 = [v9 parentMessage];
    if (v17
      && (uint64_t v18 = [(NSMutableArray *)self->_unplayedMessages count], v17, !v18)
      && ([(AVPlayer *)self->_videoPlayer rate], v19 == 0.0)
      || [v9 messageType] == 8)
    {
      dispatch_time_t v20 = [(DTSCanvasViewController *)self canvasView];
      [v20 wispVisibleSketchViewsWithCompletion:0];

      int v21 = 1;
    }
    else
    {
      int v21 = 0;
    }
    double v22 = [v9 parentMessage];
    if (v22) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = [(NSMutableArray *)self->_unplayedMessages count] == 0;
    }

    if ((v21 | v23) == 1)
    {
      -[DTSCanvasViewController willEndSessionPlaybackInterrupted:](self, "willEndSessionPlaybackInterrupted:", [v9 missedDuringPlayback]);
      [(ETMessage *)self->_messageForReplay wispChildren];
    }
  }

  _Block_object_dispose(&v30, 8);
}

void __60__DTSCanvasViewController_canvasView_willEndPlayingMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 identifier];
  uint64_t v10 = [v8 identifier];

  LODWORD(v8) = [v9 isEqualToString:v10];
  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)canvasView:(id)a3 didEndPlayingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_isPlayingMessage = 0;
  playingMessage = self->_playingMessage;
  self->_playingMessage = 0;

  uint64_t v9 = [(NSMutableArray *)self->_unplayedMessages count];
  if (v9)
  {
    [(DTSCanvasViewController *)self setPlayingMessages:self->_playbackEnabled];
    uint64_t v10 = [v7 parentMessage];
    [v10 childMessageDidCompleteWisp:v7];

    BOOL playbackEnabled = self->_playbackEnabled;
  }
  else
  {
    [(DTSCanvasViewController *)self setPlayingMessages:0];
    id v12 = [v7 parentMessage];
    [v12 childMessageDidCompleteWisp:v7];

    BOOL playbackEnabled = 0;
  }
  if ([(DTSCanvasViewController *)self _canLoopMessageDuringPlayback:v7]
    && [(ETMessage *)self->_messageForReplay shouldLoopDuringPlayback]
    && self->_playbackEnabled)
  {
    int v13 = [v7 missedDuringPlayback] ^ 1;
  }
  else
  {
    int v13 = 0;
  }
  BOOL v14 = [(ETMessage *)self->_messageForReplay hasWispingChildren];
  if (playbackEnabled)
  {
    if (!self->_playingCompositeMessage) {
      [(DTSCanvasViewController *)self _continueMessagePlaybackLoopWithDelay:1];
    }
  }
  else if (v13)
  {
    if ([(ETMessage *)self->_messageForReplay messageType] != 8
      || ![(ETMessage *)self->_messageForReplay hasWispingChildren]
      && ([(AVPlayer *)self->_videoPlayer rate], v15 == 0.0))
    {
      [(DTSCanvasViewController *)self replay];
    }
  }
  else if (v14)
  {
    [(ETMessage *)self->_messageForReplay wispChildren];
  }
  else
  {
    [(AVPlayer *)self->_videoPlayer rate];
    if (v16 == 0.0)
    {
      if (IMOSLoggingEnabled())
      {
        CGFloat v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)dispatch_time_t v20 = 0;
          _os_log_impl(&dword_23B55A000, v17, OS_LOG_TYPE_INFO, "Ending all playback", v20, 2u);
        }
      }
      BOOL v18 = [(DTSCanvasViewController *)self canExpireMessages];
      if (!v9 && v18 && ([v7 missedDuringPlayback] & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        [WeakRetained markAsPlayed];
      }
      [(DTSCanvasViewController *)self didEndSessionPlayback];
      [(DTSCanvasViewController *)self setPlayingCompositeMessage:0];
      [(DTSCanvasViewController *)self _hideVideoPlayer];
      [(ETCanvasView *)self->_canvasView hidePhoto];
      [(DTSCanvasViewController *)self _updateColorPickerEnabled];
      [(DTSCanvasViewController *)self _updatePlaybackControls];
      [(DTSCanvasViewController *)self updateVideoUI];
      [v7 setMissedDuringPlayback:0];
    }
  }
  [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
}

- (BOOL)_canLoopMessageDuringPlayback:(id)a3
{
  return 0;
}

- (void)_videoMessageDidFinishPlaying:(id)a3
{
  videoPlayer = self->_videoPlayer;
  id v5 = a3;
  id v9 = [(AVPlayer *)videoPlayer currentItem];
  id v6 = [v5 object];

  if (v9 == v6)
  {
    int v7 = [(ETMessage *)self->_messageForReplay messageType];

    if (v7 == 8)
    {
      messageForReplay = self->_messageForReplay;
      [(ETMessage *)messageForReplay stopPlaying];
    }
  }
  else
  {
  }
}

- (void)_startVideoPlayerWithMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 mediaURL];
  videoPlayer = self->_videoPlayer;
  if (videoPlayer)
  {
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    [(AVPlayer *)videoPlayer seekToTime:&buf];
  }
  else
  {
    int v7 = (AVPlayer *)[objc_alloc(MEMORY[0x263EFA7F0]) initWithURL:v5];
    id v8 = self->_videoPlayer;
    self->_videoPlayer = v7;

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = [(AVPlayer *)self->_videoPlayer currentItem];
    [v9 addObserver:self selector:sel__videoMessageDidFinishPlaying_ name:*MEMORY[0x263EFA050] object:v10];

    if (IMOSLoggingEnabled())
    {
      char v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v5;
        _os_log_impl(&dword_23B55A000, v11, OS_LOG_TYPE_INFO, "Setting video player URL: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!self->_composingCompositeMessage)
    {
      id v12 = self->_videoPlayer;
      if (self->_overrideAudioDefaultToOff)
      {
        [(AVPlayer *)self->_videoPlayer setMuted:1];
      }
      else
      {
        int v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
        BOOL v14 = [v13 valueForKey:@"ETVideoAudioOffPreference"];
        -[AVPlayer setMuted:](v12, "setMuted:", [v14 BOOLValue]);
      }
    }
    float v15 = self->_videoPlayer;
    objc_initWeak(&location, self);
    memset(&buf, 0, sizeof(buf));
    CMTimeMake(&buf, 1, 20);
    float v16 = self->_videoPlayer;
    CMTime v25 = buf;
    CGFloat v17 = [MEMORY[0x263F08D40] valueWithCMTime:&v25];
    long long v27 = v17;
    BOOL v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56__DTSCanvasViewController__startVideoPlayerWithMessage___block_invoke;
    v21[3] = &unk_264DECF58;
    objc_copyWeak(&v24, &location);
    id v22 = v4;
    float v19 = v15;
    BOOL v23 = v19;
    id v20 = [(AVPlayer *)v16 addBoundaryTimeObserverForTimes:v18 queue:0 usingBlock:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  [(AVPlayer *)self->_videoPlayer play];
}

void __56__DTSCanvasViewController__startVideoPlayerWithMessage___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained _playingParentMessage];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v9 = [v6 canvasView];

    [v9 setUsesMediaAppearance:1];
    [v9 showVideoForPlayer:*(void *)(a1 + 40)];
    id v7 = objc_loadWeakRetained(v2);
    [v7 _updateVideoPlayerUI];

    id v8 = objc_loadWeakRetained(v2);
    [v8 _schedulePlaybackOfCompositeMessageContent:*(void *)(a1 + 32)];
  }
}

- (void)_hideVideoPlayer
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFA050];
  id v5 = [(AVPlayer *)self->_videoPlayer currentItem];
  [v3 removeObserver:self name:v4 object:v5];

  [(ETCanvasView *)self->_canvasView hideVideo];
  [(AVPlayer *)self->_videoPlayer pause];
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = 0;

  [(DTSCanvasViewController *)self _relinquishAudio];
  [(DTSCanvasViewController *)self _updateAudioOnOffButton];
  if ([(DTSCanvasViewController *)self _canComposeAfterMediaPlayback])
  {
    canvasView = self->_canvasView;
    [(ETCanvasView *)canvasView setUsesMediaAppearance:0];
  }
}

- (BOOL)_canComposeAfterMediaPlayback
{
  return 1;
}

- (void)canvasView:(id)a3 didBeginComposingMessageType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(DTSCanvasViewController *)self didBeginComposingMessage];
  [(DTSCanvasViewController *)self setComposingMessageType:v4];
  [(DTSCanvasViewController *)self _setCachedMessageForReplay:0];
  [(DTSCanvasViewController *)self _updateColorPickerEnabled];
  [(DTSCanvasViewController *)self _updatePlaybackControls];

  [(DTSCanvasViewController *)self updateVideoUI];
}

- (void)canvasView:(id)a3 didEndComposingMessageType:(unsigned __int16)a4
{
  -[DTSCanvasViewController setComposingMessageType:](self, "setComposingMessageType:", 0xFFFFLL, a4);
  [(DTSCanvasViewController *)self _updateColorPickerEnabled];
  if ([(DTSCanvasViewController *)self _shouldAutoSend]) {
    [(DTSCanvasViewController *)self _startComposeSessionEndTimer];
  }

  [(DTSCanvasViewController *)self didEndComposingMessage];
}

- (void)canvasView:(id)a3 sendMessage:(id)a4
{
  id v8 = a4;
  if ([(DTSCanvasViewController *)self deferMessageSend])
  {
    if (!self->_deferredMessages)
    {
      id v5 = [MEMORY[0x263EFF980] array];
      deferredMessages = self->_deferredMessages;
      self->_deferredMessages = v5;
    }
    if (v8) {
      -[NSMutableArray addObject:](self->_deferredMessages, "addObject:");
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);
    [WeakRetained canvasViewController:self sendMessage:v8];

    [(DTSCanvasViewController *)self _updateSendButton];
  }

  MEMORY[0x270F9A790]();
}

- (void)canvasViewWillReachComposingSizeLimit:(id)a3
{
  id v3 = [(DTSCanvasViewController *)self colorPicker];
  [v3 setDimmed:1];
}

- (void)canvasViewDidPause:(id)a3
{
}

- (void)canvasViewDidUnpause:(id)a3
{
}

- (int64_t)recentHeartRate
{
  return 85;
}

- (void)clearDeferredMessages
{
  self->_deferredMessages = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)canvasView:(id)a3 tapRecognizerShouldBegin:(id)a4
{
  return [(DTSCanvasViewController *)self _tapRecognizerShouldBegin:a4];
}

- (BOOL)_tapRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)canvasView:(id)a3 angerUsesForceTouch:(BOOL)a4
{
}

- (BOOL)_canStartMessagePlaybackLoop
{
  if (!self->_playbackEnabled || ![(DTSCanvasViewController *)self _isVisible] || self->_isPlayingMessage) {
    return 0;
  }
  id v5 = [(DTSCanvasViewController *)self playingMessage];
  if (v5 || ![(NSMutableArray *)self->_unplayedMessages count])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v6 = [(DTSCanvasViewController *)self canvasView];
    if (([v6 isComposing] & 1) != 0 || self->_composeSessionEndTimer)
    {
      BOOL v3 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x263F1C408] sharedApplication];
      BOOL v3 = [v7 applicationState] == 0;
    }
  }

  return v3;
}

- (void)startMessagePlaybackLoop
{
  if ([(DTSCanvasViewController *)self _canStartMessagePlaybackLoop])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v4 = [WeakRetained mediaURL];

    if (!v4) {
      [(DTSCanvasViewController *)self willBeginSessionPlayback];
    }
    [(DTSCanvasViewController *)self setPlayingMessages:1];
    [(DTSCanvasViewController *)self _playNextMessage];
  }
}

- (void)_stopPlaybackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL isPlayingMessage = self->_isPlayingMessage;
  if (self->_isPlayingMessage) {
    [(DTSCanvasViewController *)self willEndSessionPlaybackInterrupted:1];
  }
  [(ETMessage *)self->_playingMessage setMissedDuringPlayback:1];
  [(ETMessage *)self->_playingMessage stopPlaying];
  [(ETCanvasView *)self->_canvasView clearCanvasAnimated:v3];
  playingMessage = self->_playingMessage;
  self->_playingMessage = 0;

  self->_BOOL isPlayingMessage = 0;
  messageForReplay = self->_messageForReplay;
  self->_messageForReplay = 0;

  [(DTSCanvasViewController *)self _hideVideoPlayer];
  [(ETCanvasView *)self->_canvasView hidePhoto];
  [(DTSCanvasViewController *)self setPlayingCompositeMessage:0];
  [(DTSCanvasViewController *)self setPlayingMessages:0];
  [(ETCanvasView *)self->_canvasView setParentMessage:0];
  if (isPlayingMessage)
  {
    [(DTSCanvasViewController *)self didEndSessionPlayback];
  }
}

- (void)_reloadUnplayedMessages
{
  BOOL v3 = (void *)MEMORY[0x263EFF980];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained createSessionMessages];
  id v5 = [v3 arrayWithArray:v4];
  unplayedMessages = self->_unplayedMessages;
  self->_unplayedMessages = v5;
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  if (self->_playbackEnabled != a3)
  {
    self->_BOOL playbackEnabled = a3;
    if (a3)
    {
      [(DTSCanvasViewController *)self _reloadUnplayedMessages];
    }
    else
    {
      [(DTSCanvasViewController *)self _setCachedMessageForReplay:0];
      [(NSMutableArray *)self->_unplayedMessages removeAllObjects];
      [(DTSCanvasViewController *)self _stopPlaybackAnimated:0];
      [(DTSCanvasViewController *)self _updatePlaybackControls];
    }
    [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
  }
}

- (void)setPlayingCompositeMessage:(BOOL)a3
{
  if (self->_playingCompositeMessage != a3)
  {
    self->_playingCompositeMessage = a3;
    if (!a3)
    {
      self->_mediaMessagePlayTrackerTime = 0.0;
      [(NSMutableArray *)self->_unplayedMessages removeAllObjects];
      uint64_t v4 = [(DTSCanvasViewController *)self canvasView];
      [v4 clearCanvasAnimated:0];

      [(ETMessage *)self->_playingMessage stopPlaying];
    }
    [(DTSCanvasViewController *)self _updateColorPickerEnabled];
    [(DTSCanvasViewController *)self _updateCanvasInteractionEnabled];
  }
}

- (void)_playNextMessage
{
  if (self->_playbackEnabled && [(NSMutableArray *)self->_unplayedMessages count])
  {
    BOOL v3 = [(DTSCanvasViewController *)self playingMessage];
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
      uint64_t v5 = [v4 applicationState];

      if (v5) {
        return;
      }
      id v6 = [(NSMutableArray *)self->_unplayedMessages objectAtIndex:0];
      [v6 setMissedDuringPlayback:0];
      if (self->_playingCompositeMessage) {
        [(DTSCanvasViewController *)self _playMessage:v6];
      }
      else {
        [(DTSCanvasViewController *)self setPlayingMessage:v6];
      }
      BOOL v3 = v6;
    }
  }
}

- (void)_continueMessagePlaybackLoopWithDelay:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__DTSCanvasViewController__continueMessagePlaybackLoopWithDelay___block_invoke;
  v7[3] = &unk_264DEC6D0;
  v7[4] = self;
  uint64_t v4 = MEMORY[0x23ECC8210](v7, a2);
  uint64_t v5 = (void *)v4;
  if (v3)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    dispatch_after(v6, MEMORY[0x263EF83A0], v5);
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

uint64_t __65__DTSCanvasViewController__continueMessagePlaybackLoopWithDelay___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isPlayingMessages];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _playNextMessage];
  }
  return result;
}

- (void)_startComposeSessionEndTimer
{
  [(NSTimer *)self->_composeSessionEndTimer invalidate];
  self->_composeSessionEndTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__composeSessionEndTimerFired selector:0 userInfo:0 repeats:5.0];

  MEMORY[0x270F9A758]();
}

- (void)_clearComposeSessionEndTimer
{
  [(NSTimer *)self->_composeSessionEndTimer invalidate];
  composeSessionEndTimer = self->_composeSessionEndTimer;
  self->_composeSessionEndTimer = 0;
}

- (void)_composeSessionEndTimerFired
{
  composeSessionEndTimer = self->_composeSessionEndTimer;
  self->_composeSessionEndTimer = 0;

  [(DTSCanvasViewController *)self startMessagePlaybackLoop];

  [(DTSCanvasViewController *)self updateVideoUI];
}

- (id)_cancelButton
{
  return self->_cancelButton;
}

- (id)_skipButton
{
  return self->_skipButton;
}

- (void)_skipButtonTapped
{
  playingMessage = self->_playingMessage;
  if (playingMessage)
  {
    uint64_t v4 = playingMessage;
    [(DTSCanvasViewController *)self _stopPlaybackAnimated:1];
    [(NSMutableArray *)self->_unplayedMessages removeObject:v4];
  }

  [(DTSCanvasViewController *)self startMessagePlaybackLoop];
}

- (void)_cancelButtonTapped
{
  [(DTSCanvasViewController *)self _stopPlaybackAnimated:1];

  [(DTSCanvasViewController *)self didEndComposingMessage];
}

- (id)_replayButton
{
  return self->_replayButton;
}

- (void)_setReplayButton:(id)a3
{
}

- (BOOL)canShowReplayButton
{
  if (self->_playingMessages
    || !self->_playbackEnabled
    || ![(DTSCanvasViewController *)self hasMessageForReplay]
    || [(DTSCanvasViewController *)self usesCompactKeyboardLayout]
    || [(ETCanvasView *)self->_canvasView usesMediaAppearance])
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    uint64_t v5 = [(DTSCanvasViewController *)self playingMessage];
    if (v5 || [(DTSCanvasViewController *)self _shouldShowSkipButton]) {
      LOBYTE(v2) = 0;
    }
    else {
      BOOL v2 = ![(DTSCanvasViewController *)self _shouldShowCancelButton];
    }
  }
  return v2;
}

- (void)_setShowingReplayButton:(BOOL)a3
{
  if (self->_showingReplayButton != a3)
  {
    self->_showingReplayButton = a3;
    if (a3)
    {
      [(UIButton *)self->_replayButton setAlpha:0.0];
      uint64_t v5 = [(DTSCanvasViewController *)self view];
      [v5 addSubview:self->_replayButton];
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__DTSCanvasViewController__setShowingReplayButton___block_invoke;
    v8[3] = &unk_264DECEB8;
    v8[4] = self;
    BOOL v9 = a3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__DTSCanvasViewController__setShowingReplayButton___block_invoke_2;
    v6[3] = &unk_264DECF80;
    BOOL v7 = a3;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v8 animations:v6 completion:0.25];
  }
}

uint64_t __51__DTSCanvasViewController__setShowingReplayButton___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __51__DTSCanvasViewController__setShowingReplayButton___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(*(void *)(result + 32) + 992) removeFromSuperview];
  }
  return result;
}

- (id)_playingParentMessage
{
  return self->_messageForReplay;
}

- (double)_nonAnimatedMessagePlaybackDuration
{
  return 10.0;
}

- (void)dataSource:(id)a3 didReceiveSessionMessage:(id)a4
{
}

- (void)dataSource:(id)a3 startPlaybackWithCompletion:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x23ECC8210](a4, a2, a3);
  id balloonPlaybackCompletion = self->_balloonPlaybackCompletion;
  self->_id balloonPlaybackCompletion = v5;

  [(DTSCanvasViewController *)self setAutoPlayOnAppearanceDisabled:0];
  if (self->_playingMessages
    && ([MEMORY[0x263F1C408] sharedApplication],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 applicationState],
        v7,
        !v8))
  {
    id v9 = [(DTSCanvasViewController *)self canvasView];
    [v9 setPaused:0];
  }
  else
  {
    [(DTSCanvasViewController *)self setPlaybackEnabled:1];
    [(DTSCanvasViewController *)self startMessagePlaybackLoop];
  }
}

- (BOOL)dataSource:(id)a3 addDemoHookToMessage:(id *)a4
{
  if ([(DTSCanvasViewController *)self _usingDemoHook])
  {
    dispatch_time_t v6 = [*a4 identifier];
    int v7 = [v6 hasPrefix:@"DemoHook-"];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v9 = [v8 objectForKey:@"DigitalTouchDemoHookMessageDataPath"];

      uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9];
      char v11 = (void *)v10;
      if (v9 && v10)
      {
        id v12 = +[ETMessage unarchive:v10];
        id v13 = v12;
        if (v12)
        {
          if ([v12 messageType] != 8)
          {
LABEL_10:
            id v13 = v13;
            *a4 = v13;
            BOOL v19 = 1;
LABEL_18:

            return v19;
          }
          BOOL v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
          float v15 = [v14 objectForKey:@"DigitalTouchDemoHookAssetPath"];

          if (v15)
          {
            float v16 = [MEMORY[0x263F08850] defaultManager];
            char v17 = [v16 fileExistsAtPath:v15];

            if (v17)
            {
              BOOL v18 = [NSURL fileURLWithPath:v15];
              [v13 setMediaURL:v18];

              goto LABEL_10;
            }
            int v21 = [NSString stringWithFormat:@"Couldn't find path: %@", v15];
            [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"Movie File Not Found" message:v21];
          }
          else
          {
            [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"Movie Path Not Specified" message:@"Please set DigitalTouchDemoHookAssetPath preference."];
          }
        }
        else
        {
          id v20 = [NSString stringWithFormat:@"Not changing incoming message to demo message. Data at path: %@", v9];
          [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"Couldn't Unarchive Demo Message" message:v20];
        }
      }
      else
      {
        id v13 = [NSString stringWithFormat:@"Invalid data at path %@. Not changing incoming message to demo message.", v9];
        [(DTSCanvasViewController *)self _showDemoHookAlertWithTitle:@"Missing Demo Message Data" message:v13];
      }
      BOOL v19 = 0;
      goto LABEL_18;
    }
  }
  return 0;
}

- (void)dataSourceStopPlayback:(id)a3
{
  if (self->_playingMessages)
  {
    uint64_t v4 = [(DTSCanvasViewController *)self canvasView];
    [v4 setPaused:1];
  }
  else
  {
    [(DTSCanvasViewController *)self setPlaybackEnabled:0];
  }

  [(DTSCanvasViewController *)self setAutoPlayOnAppearanceDisabled:1];
}

- (BOOL)dataSourceViewIsMostlyVisible:(id)a3
{
  if (![(DTSCanvasViewController *)self isViewLoaded]) {
    return 0;
  }
  uint64_t v4 = [(DTSCanvasViewController *)self view];
  uint64_t v5 = [v4 window];
  [v4 bounds];
  double v7 = v6;
  objc_msgSend(v4, "convertRect:toView:", v5);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v5 bounds];
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  CGRect v19 = CGRectIntersection(v18, v20);
  BOOL v16 = v19.size.height / v7 >= 0.5;

  return v16;
}

- (void)dataSource:(id)a3 didUpdateAttachmentURL:(id)a4 forMessageWithIdentifier:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(ETMessage *)self->_messageForReplay identifier];
  int v11 = [v10 isEqualToString:v9];

  if (v11) {
    double v12 = self->_messageForReplay;
  }
  else {
    double v12 = 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CGFloat v13 = self->_unplayedMessages;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        char v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CGRect v18 = [v17 identifier];
        int v19 = [v18 isEqualToString:v9];

        if (v19)
        {
          CGRect v20 = v17;

          double v12 = v20;
        }
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v14);
  }

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(ETMessage *)v12 setMediaURL:v8];
      if (IMOSLoggingEnabled())
      {
        int v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [MEMORY[0x263F08850] defaultManager];
          BOOL v23 = [v8 path];
          int v24 = [v22 fileExistsAtPath:v23];
          *(_DWORD *)CMTime buf = 138412546;
          id v31 = v8;
          __int16 v32 = 1024;
          int v33 = v24;
          _os_log_impl(&dword_23B55A000, v21, OS_LOG_TYPE_INFO, "Setting media URL: %@, URL exists on disk: %d", buf, 0x12u);
        }
      }
    }
  }
}

- (DTSCanvasViewControllerSendDelegate)sendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);

  return (DTSCanvasViewControllerSendDelegate *)WeakRetained;
}

- (void)setSendDelegate:(id)a3
{
}

- (unsigned)composingMessageType
{
  return self->_composingMessageType;
}

- (void)setComposingMessageType:(unsigned __int16)a3
{
  self->_composingMessageType = a3;
}

- (BOOL)isComposingCompositeMessage
{
  return self->_composingCompositeMessage;
}

- (BOOL)isPlayingCompositeMessage
{
  return self->_playingCompositeMessage;
}

- (double)mediaMessagePlayTrackerTime
{
  return self->_mediaMessagePlayTrackerTime;
}

- (void)setMediaMessagePlayTrackerTime:(double)a3
{
  self->_mediaMessagePlayTrackerTime = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isComposeDisabled
{
  return self->_composeDisabled;
}

- (BOOL)isAutoPlayOnAppearanceDisabled
{
  return self->_autoPlayOnAppearanceDisabled;
}

- (void)setAutoPlayOnAppearanceDisabled:(BOOL)a3
{
  self->_autoPlayOnAppearanceDisabled = a3;
}

- (BOOL)ignoreAppearanceCallbacks
{
  return self->_ignoreAppearanceCallbacks;
}

- (void)setIgnoreAppearanceCallbacks:(BOOL)a3
{
  self->_ignoreAppearanceCallbacks = a3;
}

- (ETCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (BOOL)isPlayingMessages
{
  return self->_playingMessages;
}

- (ETMessage)playingMessage
{
  return self->_playingMessage;
}

- (DTSColorPicker)colorPicker
{
  return self->_colorPicker;
}

- (void)setColorPicker:(id)a3
{
}

- (BOOL)deferMessageSend
{
  return self->_deferMessageSend;
}

- (void)setDeferMessageSend:(BOOL)a3
{
  self->_deferMessageSend = a3;
}

- (NSArray)deferredMessages
{
  return &self->_deferredMessages->super;
}

- (void)setUsesCompactKeyboardLayout:(BOOL)a3
{
  self->_usesCompactKeyboardLayout = a3;
}

- (BOOL)overrideAudioDefaultToOff
{
  return self->_overrideAudioDefaultToOff;
}

- (void)setOverrideAudioDefaultToOff:(BOOL)a3
{
  self->_overrideAudioDefaultToOff = a3;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (ETBalloonPluginDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (ETBalloonPluginDataSource *)WeakRetained;
}

- (id)balloonPlaybackCompletion
{
  return self->_balloonPlaybackCompletion;
}

- (void)setBalloonPlaybackCompletion:(id)a3
{
}

- (ETMessage)messageForReplay
{
  return self->_messageForReplay;
}

- (void)setMessageForReplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageForReplay, 0);
  objc_storeStrong(&self->_balloonPlaybackCompletion, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_colorPicker, 0);
  objc_storeStrong((id *)&self->_playingMessage, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak((id *)&self->_sendDelegate);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_audioToggleButton, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_deferredMessages, 0);
  objc_storeStrong((id *)&self->_composeSessionEndTimer, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);

  objc_storeStrong((id *)&self->_unplayedMessages, 0);
}

@end