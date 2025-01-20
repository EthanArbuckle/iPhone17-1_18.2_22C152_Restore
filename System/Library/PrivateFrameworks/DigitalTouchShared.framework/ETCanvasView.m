@interface ETCanvasView
- (BOOL)_areRecognizersTrackingMultipleFingers;
- (BOOL)_canComposeExclusiveMessage;
- (BOOL)_isTapTooRecentAfterKissGesture;
- (BOOL)_sendMessageTimerFired;
- (BOOL)_sketchInProgress;
- (BOOL)_sketchesPaused;
- (BOOL)_tapsInProgress;
- (BOOL)angerUsesForceTouch;
- (BOOL)canComposeAnger;
- (BOOL)canComposeHeartbeat;
- (BOOL)canComposeKiss;
- (BOOL)canComposeTap;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isComposing;
- (BOOL)isComposingHeartbeat;
- (BOOL)isComposingSketch;
- (BOOL)isPaused;
- (BOOL)useFastVerticalWisp;
- (BOOL)usesMediaAppearance;
- (CGPoint)_normalizedGesturePoint:(id)a3;
- (CGPoint)_viewPointNormalizedInSceneSpace:(CGPoint)a3;
- (ETCanvasView)initWithFrame:(CGRect)a3;
- (ETCanvasViewDelegate)canvasDelegate;
- (ETMessage)parentMessage;
- (ETMessageTimeSource)timeSource;
- (UIColor)drawingColor;
- (double)_angleOfRotationBetweenTwoFingers:(id)a3;
- (id)composedSketchMessage;
- (void)_angerRecognized:(id)a3;
- (void)_animateOutSketchView:(id)a3 withCompletion:(id)a4;
- (void)_checkForIdle;
- (void)_clearDoodleViewForMessage:(id)a3;
- (void)_clearSendMessageTimer;
- (void)_configureAngerRecognizer;
- (void)_createSketchViewWithColor:(id)a3 time:(double)a4 message:(id)a5;
- (void)_doodleEndedWithTouches:(id)a3 cancelled:(BOOL)a4;
- (void)_endMessage:(id)a3 withSend:(BOOL)a4;
- (void)_fastTapAllowableMovementTimerFired;
- (void)_heartbeatRecognized:(id)a3;
- (void)_hideAnger;
- (void)_hideHeartbeat;
- (void)_hideHeartbeatTimerFired;
- (void)_kissRecognized:(id)a3;
- (void)_sendAnger;
- (void)_sendHeartbeat;
- (void)_sendKiss;
- (void)_sendSketch;
- (void)_sendTaps;
- (void)_setIsComposingMessageOfType:(unsigned __int16)a3;
- (void)_setSketchesPaused:(BOOL)a3;
- (void)_showAngerAtPoint:(CGPoint)a3;
- (void)_showHeartbeatAtNormalizedPoint:(CGPoint)a3 rotation:(double)a4;
- (void)_startCheckForIdleTimer;
- (void)_startDoodleMessageCompositionAtTime:(double)a3;
- (void)_startFastTapAllowableMovementTimer;
- (void)_startSendMessageTimer;
- (void)_stopCheckForIdleTimer;
- (void)_tapRecognized:(id)a3;
- (void)_updatePhotoViewFrame;
- (void)_updateRecognizersAtEndOfComposition;
- (void)_updateVideoViewFrame;
- (void)clearCanvasAnimated:(BOOL)a3;
- (void)dealloc;
- (void)handleDotAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7;
- (void)handlePanAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 state:(int64_t)a7 isRemote:(BOOL)a8;
- (void)handleTapAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7;
- (void)hidePhoto;
- (void)hideVideo;
- (void)layoutSubviews;
- (void)messageDidStopPlaying:(id)a3;
- (void)messageWillReachSizeLimit:(id)a3;
- (void)messageWillStopPlaying:(id)a3;
- (void)playMessage:(id)a3;
- (void)playTestStrokeWithColor:(id)a3 duration:(double)a4;
- (void)sendCurrentMessage;
- (void)setAlwaysPaused:(BOOL)a3;
- (void)setAngerUsesForceTouch:(BOOL)a3;
- (void)setCanComposeAnger:(BOOL)a3;
- (void)setCanComposeHeartbeat:(BOOL)a3;
- (void)setCanComposeKiss:(BOOL)a3;
- (void)setCanComposeTap:(BOOL)a3;
- (void)setCanvasDelegate:(id)a3;
- (void)setDrawingColor:(id)a3;
- (void)setForceTouchEnabled:(BOOL)a3;
- (void)setParentMessage:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTimeSource:(id)a3;
- (void)setUseFastVerticalWisp:(BOOL)a3;
- (void)setUsesMediaAppearance:(BOOL)a3;
- (void)showPhotoForImage:(id)a3;
- (void)showVideoForPlayer:(id)a3;
- (void)startDoodleMessageComposition;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCurrentMessageWithHeartRate:(unint64_t)a3;
- (void)updateIgnoredTouchesRectForStatusBarSize:(CGSize)a3;
- (void)willMoveToWindow:(id)a3;
- (void)wispVisibleSketchViewsWithCompletion:(id)a3;
@end

@implementation ETCanvasView

- (ETCanvasView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v39.receiver = self;
  v39.super_class = (Class)ETCanvasView;
  v5 = -[ETCanvasView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v6 = (void *)getSKSceneClass_softClass;
    uint64_t v44 = getSKSceneClass_softClass;
    if (!getSKSceneClass_softClass)
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __getSKSceneClass_block_invoke;
      v40[3] = &unk_264DEC848;
      v40[4] = &v41;
      __getSKSceneClass_block_invoke((uint64_t)v40);
      v6 = (void *)v42[3];
    }
    v7 = v6;
    _Block_object_dispose(&v41, 8);
    uint64_t v8 = objc_msgSend([v7 alloc], "initWithSize:", width, height);
    scene = v5->_scene;
    v5->_scene = (SKScene *)v8;

    v10 = v5->_scene;
    v11 = [MEMORY[0x263F1C550] blackColor];
    [(SKScene *)v10 setBackgroundColor:v11];

    -[SKScene setAnchorPoint:](v5->_scene, "setAnchorPoint:", 0.5, 0.5);
    v12 = -[DTSSceneView initWithSize:]([DTSSceneView alloc], "initWithSize:", width, height);
    sceneView = v5->_sceneView;
    v5->_sceneView = v12;

    [(DTSSceneView *)v5->_sceneView setShouldCullNonVisibleNodes:0];
    [(DTSSceneView *)v5->_sceneView setIgnoresSiblingOrder:1];
    [(DTSSceneView *)v5->_sceneView setAllowsTransparency:1];
    [(DTSSceneView *)v5->_sceneView presentScene:v5->_scene];
    [(DTSSceneView *)v5->_sceneView setPaused:1];
    [(DTSSceneView *)v5->_sceneView setPreferredFramesPerSecond:60];
    v14 = [(DTSSceneView *)v5->_sceneView options];
    [v14 setObject:MEMORY[0x263EFFA88] forKey:@"ignoreBackgroundNotifications"];

    [(DTSSceneView *)v5->_sceneView setUserInteractionEnabled:0];
    [(ETCanvasView *)v5 addSubview:v5->_sceneView];
    v15 = [MEMORY[0x263F1C550] blackColor];
    [(ETCanvasView *)v5 setBackgroundColor:v15];

    v16 = [(ETCanvasView *)v5 layer];
    [v16 setMasksToBounds:1];

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    messageIdentifierToDoodleView = v5->_messageIdentifierToDoodleView;
    v5->_messageIdentifierToDoodleView = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    playingMessages = v5->_playingMessages;
    v5->_playingMessages = (NSMutableSet *)v19;

    v5->_canComposeHeartbeat = 1;
    uint64_t v21 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v5 action:sel__heartbeatRecognized_];
    heartbeatRecognizer = v5->_heartbeatRecognizer;
    v5->_heartbeatRecognizer = (UILongPressGestureRecognizer *)v21;

    [(UILongPressGestureRecognizer *)v5->_heartbeatRecognizer setNumberOfTouchesRequired:2];
    [(UILongPressGestureRecognizer *)v5->_heartbeatRecognizer setMinimumPressDuration:0.2];
    [(ETCanvasView *)v5 addGestureRecognizer:v5->_heartbeatRecognizer];
    v5->_canComposeTap = 1;
    uint64_t v23 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v5 action:sel__tapRecognized_];
    tapRecognizer = v5->_tapRecognizer;
    v5->_tapRecognizer = (UITapGestureRecognizer *)v23;

    [(UITapGestureRecognizer *)v5->_tapRecognizer setDelaysTouchesBegan:1];
    [(UITapGestureRecognizer *)v5->_tapRecognizer setAllowableMovement:11.0];
    [(UITapGestureRecognizer *)v5->_tapRecognizer setDelegate:v5];
    [(ETCanvasView *)v5 addGestureRecognizer:v5->_tapRecognizer];
    v5->_canComposeKiss = 1;
    uint64_t v25 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v5 action:sel__kissRecognized_];
    kissRecognizer = v5->_kissRecognizer;
    v5->_kissRecognizer = (UITapGestureRecognizer *)v25;

    [(UITapGestureRecognizer *)v5->_kissRecognizer setNumberOfTouchesRequired:2];
    [(UITapGestureRecognizer *)v5->_kissRecognizer setDelegate:v5];
    [(ETCanvasView *)v5 addGestureRecognizer:v5->_kissRecognizer];
    v5->_canComposeAnger = 1;
    v27 = [MEMORY[0x263F1C920] mainScreen];
    v28 = [v27 traitCollection];
    -[ETCanvasView setForceTouchEnabled:](v5, "setForceTouchEnabled:", [v28 forceTouchCapability] == 2);

    [(ETCanvasView *)v5 _configureAngerRecognizer];
    [(ETCanvasView *)v5 setMultipleTouchEnabled:1];
    uint64_t v29 = [MEMORY[0x263EFF9C0] set];
    touchesDown = v5->_touchesDown;
    v5->_touchesDown = (NSMutableSet *)v29;

    uint64_t v31 = [MEMORY[0x263F1C550] whiteColor];
    drawingColor = v5->_drawingColor;
    v5->_drawingColor = (UIColor *)v31;

    v33 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v34 = [v33 persistentDomainForName:@"com.apple.ET"];
    v35 = [v34 objectForKey:@"ETWispDelay"];
    [v35 doubleValue];
    v5->_wispDelay = v36;

    [(ETCanvasView *)v5 setPaused:1];
    v5->_messageType = -1;
    v37 = v5;
  }

  return v5;
}

- (void)showPhotoForImage:(id)a3
{
  id v4 = a3;
  photoView = self->_photoView;
  id v9 = v4;
  if (!photoView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    v7 = self->_photoView;
    self->_photoView = v6;

    [(UIImageView *)self->_photoView setContentMode:2];
    uint64_t v8 = [(UIImageView *)self->_photoView layer];
    [v8 setMasksToBounds:1];

    [(ETCanvasView *)self insertSubview:self->_photoView atIndex:0];
    id v4 = v9;
    photoView = self->_photoView;
  }
  [(UIImageView *)photoView setImage:v4];
  [(ETCanvasView *)self _updatePhotoViewFrame];
}

- (void)hidePhoto
{
  [(UIImageView *)self->_photoView removeFromSuperview];
  photoView = self->_photoView;
  self->_photoView = 0;
}

- (void)showVideoForPlayer:(id)a3
{
  if (!self->_videoView)
  {
    id v4 = [MEMORY[0x263EFA838] playerLayerWithPlayer:a3];
    videoLayer = self->_videoLayer;
    self->_videoLayer = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    videoView = self->_videoView;
    self->_videoView = v6;

    id v8 = [(UIView *)self->_videoView layer];
    [v8 addSublayer:self->_videoLayer];
    [v8 setMasksToBounds:1];
    [(ETCanvasView *)self insertSubview:self->_videoView atIndex:0];
    [(ETCanvasView *)self _updateVideoViewFrame];
  }
}

- (void)hideVideo
{
  [(UIView *)self->_videoView removeFromSuperview];
  videoView = self->_videoView;
  self->_videoView = 0;

  [(AVPlayerLayer *)self->_videoLayer removeFromSuperlayer];
  videoLayer = self->_videoLayer;
  self->_videoLayer = 0;
}

- (void)_updateVideoViewFrame
{
  [(ETCanvasView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[AVPlayerLayer setFrame:](self->_videoLayer, "setFrame:", 0.0, 0.0);
  videoView = self->_videoView;

  -[UIView setFrame:](videoView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)_updatePhotoViewFrame
{
  [(ETCanvasView *)self bounds];
  photoView = self->_photoView;

  -[UIImageView setFrame:](photoView, "setFrame:", 0.0, 0.0);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)ETCanvasView;
  [(ETCanvasView *)&v12 layoutSubviews];
  [(ETCanvasView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[SKScene setSize:](self->_scene, "setSize:", v3, v5);
  -[DTSSceneView setSize:](self->_sceneView, "setSize:", v4, v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    currentSketchView = self->_currentSketchView;
    id v10 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    -[ETGLSketchView setUseFastVerticalWisp:](currentSketchView, "setUseFastVerticalWisp:", [v10 canvasViewShouldUseFastVerticalWisp:self]);
  }
  v11 = self->_currentSketchView;
  [(ETCanvasView *)self bounds];
  -[ETGLSketchView setFrame:](v11, "setFrame:");
  [(ETCanvasView *)self _updateVideoViewFrame];
  [(ETCanvasView *)self _updatePhotoViewFrame];
}

- (BOOL)_sketchInProgress
{
  return self->_currentSketchView || self->_messageType == 1;
}

- (BOOL)isComposingHeartbeat
{
  return self->_currentHeartbeat || self->_messageType == 2;
}

- (BOOL)isComposingSketch
{
  return self->_isComposing && [(ETCanvasView *)self _sketchInProgress];
}

- (BOOL)_tapsInProgress
{
  return self->_currentTaps || self->_messageType == 0;
}

- (void)_startDoodleMessageCompositionAtTime:(double)a3
{
  v7 = objc_alloc_init(ETSketchMessage);
  [(ETSketchMessage *)v7 setHasMultipleColors:1];
  double v5 = [(ETCanvasView *)self timeSource];
  [(ETMessage *)v7 setTimeSource:v5];

  [(ETSketchMessage *)v7 setParentMessage:self->_parentMessage];
  double v6 = [(ETCanvasView *)self drawingColor];
  [(ETCanvasView *)self _createSketchViewWithColor:v6 time:v7 message:a3];

  [(ETCanvasView *)self _setIsComposingMessageOfType:1];
}

- (void)startDoodleMessageComposition
{
  [(ETCanvasView *)self endMessageComposition];
  double Current = CFAbsoluteTimeGetCurrent();

  [(ETCanvasView *)self _startDoodleMessageCompositionAtTime:Current];
}

- (void)_setIsComposingMessageOfType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  self->_isComposing = 1;
  self->_messageType = a3;
  if (a3 == 1)
  {
    [(UITapGestureRecognizer *)self->_tapRecognizer setEnabled:0];
    if (!self->_parentMessage)
    {
      [(UITapGestureRecognizer *)self->_kissRecognizer setEnabled:0];
      [(UILongPressGestureRecognizer *)self->_heartbeatRecognizer setEnabled:0];
      [(UILongPressGestureRecognizer *)self->_angerRecognizer setEnabled:0];
    }
    double v5 = &OBJC_IVAR___ETCanvasView__currentSketchView;
  }
  else
  {
    double v5 = &OBJC_IVAR___ETCanvasView__sceneView;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v5) setPaused:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  [WeakRetained canvasView:self didBeginComposingMessageType:v3];

  [(ETCanvasView *)self _startCheckForIdleTimer];
}

- (void)_updateRecognizersAtEndOfComposition
{
  [(UITapGestureRecognizer *)self->_tapRecognizer setEnabled:self->_canComposeTap];
  if (!self->_parentMessage)
  {
    [(UITapGestureRecognizer *)self->_kissRecognizer setEnabled:self->_canComposeKiss];
    [(UILongPressGestureRecognizer *)self->_heartbeatRecognizer setEnabled:self->_canComposeHeartbeat];
    angerRecognizer = self->_angerRecognizer;
    BOOL canComposeAnger = self->_canComposeAnger;
    [(UILongPressGestureRecognizer *)angerRecognizer setEnabled:canComposeAnger];
  }
}

- (void)_endMessage:(id)a3 withSend:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 1024;
      BOOL v19 = v4;
      _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "Ending message: %@. Will send: %d", (uint8_t *)&v16, 0x12u);
    }
  }
  currentSketchView = self->_currentSketchView;
  messageIdentifierToDoodleView = self->_messageIdentifierToDoodleView;
  id v10 = [v6 identifier];
  v11 = [(NSMutableDictionary *)messageIdentifierToDoodleView objectForKey:v10];

  if (!v6 || (int messageType = self->_messageType, messageType == [v6 messageType]))
  {
    if (self->_messageType != 1 || currentSketchView == v11)
    {
      self->_isComposing = 0;
      self->_sketchDidReachSizeLimit = 0;
      self->_int messageType = -1;
    }
  }
  [(ETCanvasView *)self _updateRecognizersAtEndOfComposition];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  objc_msgSend(WeakRetained, "canvasView:didEndComposingMessageType:", self, objc_msgSend(v6, "messageType"));

  if (v4)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    [v15 canvasView:self sendMessage:v6];
  }
}

- (void)dealloc
{
  [(ETCanvasView *)self _stopCheckForIdleTimer];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ETCanvasView;
  [(ETCanvasView *)&v4 dealloc];
}

- (void)_setSketchesPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPaused:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_sketchesPaused
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView allValues];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isPaused])
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

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  self->_paused = a3;
  if (a3)
  {
    [(ETCanvasView *)self _clearSendMessageTimer];
  }
  else if ([(ETCanvasView *)self isComposing])
  {
    [(ETCanvasView *)self _startSendMessageTimer];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableSet *)self->_playingMessages allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) setMute:v3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(DTSSceneView *)self->_sceneView setPaused:v3];
  [(ETCanvasView *)self _setSketchesPaused:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  if (v3)
  {
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      return;
    }
    id v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    [v12 canvasViewDidPause:self];
  }
  else
  {
    int v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      return;
    }
    id v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    [v12 canvasViewDidUnpause:self];
  }
}

- (void)setAlwaysPaused:(BOOL)a3
{
  self->_setAlwaysPaused = a3;
  if (a3)
  {
    [(ETCanvasView *)self clearCanvasAnimated:0];
    [(ETCanvasView *)self setPaused:1];
    [(ETCanvasView *)self _stopCheckForIdleTimer];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v5 = [v4 applicationState];

    if (!v5)
    {
      [(ETCanvasView *)self setPaused:0];
      [(ETCanvasView *)self _startCheckForIdleTimer];
    }
  }
}

- (void)wispVisibleSketchViewsWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__ETCanvasView_wispVisibleSketchViewsWithCompletion___block_invoke;
  v16[3] = &unk_264DEC738;
  v16[4] = self;
  id v5 = v4;
  id v17 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x23ECC8210](v16);
  if ([(NSMutableDictionary *)self->_messageIdentifierToDoodleView count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(ETCanvasView *)self _animateOutSketchView:*(void *)(*((void *)&v12 + 1) + 8 * v11++) withCompletion:v6];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else if (v5)
  {
    v6[2](v6);
  }
}

uint64_t __53__ETCanvasView_wispVisibleSketchViewsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 600) count];
  if (!result)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      (*(void (**)(void))(result + 16))();
      BOOL v3 = *(void **)(a1 + 32);
      return [v3 _updateRecognizersAtEndOfComposition];
    }
  }
  return result;
}

- (void)_animateOutSketchView:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 messageData];
  char v9 = [v8 delayWisp];
  [v8 setDelayWisp:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__ETCanvasView__animateOutSketchView_withCompletion___block_invoke;
  v13[3] = &unk_264DECA40;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  char v17 = v9;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  [v12 animateOutWithCompletion:v13];
}

uint64_t __53__ETCanvasView__animateOutSketchView_withCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) messageData];
  [v2 _clearDoodleViewForMessage:v3];

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);

  return [v5 setDelayWisp:v6];
}

- (void)_clearDoodleViewForMessage:(id)a3
{
  id v5 = [a3 identifier];
  uint64_t v4 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView objectForKey:v5];
  [(ETGLSketchView *)v4 clear];
  [(ETGLSketchView *)v4 removeFromSuperview];
  if (v5) {
    [(NSMutableDictionary *)self->_messageIdentifierToDoodleView removeObjectForKey:v5];
  }
  if (self->_currentSketchView == v4)
  {
    self->_currentSketchView = 0;
  }
}

- (void)clearCanvasAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    [(ETCanvasView *)self bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v7 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v48 + 1) + 8 * i) snapshotViewAfterScreenUpdates:0];
          [v6 addSubview:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v9);
    }

    long long v13 = [(DTSSceneView *)self->_sceneView snapshotViewAfterScreenUpdates:0];
    [v6 addSubview:v13];

    [(ETCanvasView *)self addSubview:v6];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(NSTimer *)self->_sendMessageTimer invalidate];
  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v15 = [(NSMutableDictionary *)self->_messageIdentifierToDoodleView allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        [v20 clear];
        [v20 removeFromSuperview];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_messageIdentifierToDoodleView removeAllObjects];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v21 = [(NSMutableSet *)self->_playingMessages allObjects];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * k) setMute:1];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v23);
  }

  [(NSMutableSet *)self->_playingMessages removeAllObjects];
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = 0;

  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTouchMovedDistance = 0.0;
  currentTaps = self->_currentTaps;
  self->_currentTaps = 0;

  currentKissMessage = self->_currentKissMessage;
  self->_currentKissMessage = 0;

  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = 0;

  currentAnger = self->_currentAnger;
  self->_currentAnger = 0;

  self->_isComposing = 0;
  self->_int messageType = -1;
  self->_lastActivityTimestamp = 0.0;
  self->_ignoreTouchesUntilAllTouchesEnded = 0;
  self->_sketchDidReachSizeLimit = 0;
  [(SKScene *)self->_scene removeAllActions];
  [(SKScene *)self->_scene removeAllChildren];
  [(ETCanvasView *)self _startCheckForIdleTimer];
  if (v3)
  {
    v32 = (void *)MEMORY[0x263F1CB60];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __36__ETCanvasView_clearCanvasAnimated___block_invoke;
    v38[3] = &unk_264DEC6D0;
    id v39 = v6;
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __36__ETCanvasView_clearCanvasAnimated___block_invoke_2;
    double v36 = &unk_264DEC800;
    id v37 = v39;
    [v32 animateWithDuration:v38 animations:&v33 completion:0.25];
  }
  [(ETCanvasView *)self _updateRecognizersAtEndOfComposition];
}

uint64_t __36__ETCanvasView_clearCanvasAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __36__ETCanvasView_clearCanvasAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_startCheckForIdleTimer
{
  if (!self->_idleTimer && !self->_setAlwaysPaused)
  {
    self->_idleTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__checkForIdle selector:0 userInfo:1 repeats:1.0];
    MEMORY[0x270F9A758]();
  }
}

- (void)_stopCheckForIdleTimer
{
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    [(NSTimer *)idleTimer invalidate];
    uint64_t v4 = self->_idleTimer;
    self->_idleTimer = 0;
  }
}

- (void)_checkForIdle
{
  if (!self->_parentMessage && ([(SKScene *)self->_scene hasActions] & 1) == 0)
  {
    id v4 = [(SKScene *)self->_scene children];
    if ([v4 count] || -[NSMutableDictionary count](self->_messageIdentifierToDoodleView, "count"))
    {
    }
    else
    {
      BOOL isComposing = self->_isComposing;

      if (!isComposing)
      {
        [(ETCanvasView *)self setPaused:1];
        [(ETCanvasView *)self _stopCheckForIdleTimer];
      }
    }
  }
}

- (void)setDrawingColor:(id)a3
{
  objc_storeStrong((id *)&self->_drawingColor, a3);
  [(ETCanvasView *)self _clearSendMessageTimer];
  if ([(ETCanvasView *)self isComposing])
  {
    [(ETCanvasView *)self _startSendMessageTimer];
  }
}

- (BOOL)_canComposeExclusiveMessage
{
  return self->_parentMessage || !self->_isComposing;
}

- (BOOL)_isTapTooRecentAfterKissGesture
{
  return self->_currentKissMessage && CFAbsoluteTimeGetCurrent() - self->_lastActivityTimestamp < 1.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  id v5 = v4;
  if ((UILongPressGestureRecognizer *)self->_tapRecognizer == v4)
  {
    [(UILongPressGestureRecognizer *)v4 locationOfTouch:0 inView:self];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGRect v18 = CGRectInset(self->_ignoredTouchesRect, -15.0, -15.0);
    v17.x = v8;
    v17.y = v10;
    char v11 = CGRectContainsPoint(v18, v17);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      char v15 = [v14 canvasView:self tapRecognizerShouldBegin:v5];
    }
    else
    {
      char v15 = 1;
    }
    if ([(ETCanvasView *)self _isTapTooRecentAfterKissGesture]) {
      char v6 = 0;
    }
    else {
      char v6 = (self->_messageType != 1) & ~v11 & v15;
    }
  }
  else if (self->_angerRecognizer == v4 || self->_heartbeatRecognizer == v4)
  {
    char v6 = [(ETCanvasView *)self _canComposeExclusiveMessage];
  }
  else
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass() ^ 1;
  }

  return v6 & 1;
}

- (void)updateIgnoredTouchesRectForStatusBarSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  int v6 = [(ETCanvasView *)self _shouldReverseLayoutDirection];
  double v7 = 0.0;
  if (v6)
  {
    [(ETCanvasView *)self bounds];
    double v7 = CGRectGetWidth(v8) - width;
  }
  self->_ignoredTouchesRect.origin.x = v7;
  self->_ignoredTouchesRect.origin.y = 0.0;
  self->_ignoredTouchesRect.size.double width = width;
  self->_ignoredTouchesRect.size.CGFloat height = height;
}

- (void)_startFastTapAllowableMovementTimer
{
  [(NSTimer *)self->_fastTapAllowableMovementTimer invalidate];
  BOOL v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__fastTapAllowableMovementTimerFired selector:0 userInfo:0 repeats:1.0];
  fastTapAllowableMovementTimer = self->_fastTapAllowableMovementTimer;
  self->_fastTapAllowableMovementTimer = v3;

  tapRecognizer = self->_tapRecognizer;

  [(UITapGestureRecognizer *)tapRecognizer setAllowableMovement:30.0];
}

- (void)_fastTapAllowableMovementTimerFired
{
  fastTapAllowableMovementTimer = self->_fastTapAllowableMovementTimer;
  self->_fastTapAllowableMovementTimer = 0;

  if (CFAbsoluteTimeGetCurrent() - self->_lastFastTapTimestamp >= 1.0)
  {
    tapRecognizer = self->_tapRecognizer;
    [(UITapGestureRecognizer *)tapRecognizer setAllowableMovement:11.0];
  }
  else
  {
    [(ETCanvasView *)self _startFastTapAllowableMovementTimer];
  }
}

- (CGPoint)_normalizedGesturePoint:(id)a3
{
  id v4 = a3;
  [(ETCanvasView *)self bounds];
  double MidX = CGRectGetMidX(v16);
  [(ETCanvasView *)self bounds];
  double MidY = CGRectGetMidY(v17);
  if ([(ETMessage *)self->_parentMessage messageType] == 8 || self->_messageType == 10)
  {
    [v4 locationInView:self];
    double MidX = v7;
    double MidY = v8;
  }
  -[ETCanvasView _viewPointNormalizedInSceneSpace:](self, "_viewPointNormalizedInSceneSpace:", MidX, MidY);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_angerRecognized:(id)a3
{
  id v12 = a3;
  switch([v12 state])
  {
    case 1:
      if (!self->_parentMessage
        && [(ETCanvasView *)self _sketchInProgress]
        && self->_drawingTouchMovedDistance < 20.0)
      {
        id v5 = [(ETGLSketchView *)self->_currentSketchView messageData];
        [(ETCanvasView *)self _endMessage:v5 withSend:0];
      }
      if ([(ETCanvasView *)self _canComposeExclusiveMessage])
      {
        if (self->_currentAnger) {
          [(ETCanvasView *)self _sendAnger];
        }
        [(ETCanvasView *)self _setIsComposingMessageOfType:10];
        [(ETCanvasView *)self _normalizedGesturePoint:v12];
        -[ETCanvasView _showAngerAtPoint:](self, "_showAngerAtPoint:");
        self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
      }
      break;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [WeakRetained canvasView:self didUpdateComposingMessageType:self->_messageType];

      [(ETCanvasView *)self _normalizedGesturePoint:v12];
      double v8 = v7;
      double v10 = v9;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      -[ETAngerMessage setNormalizedPoint:atRelativeTime:inScene:](self->_currentAnger, "setNormalizedPoint:atRelativeTime:inScene:", self->_scene, v8, v10, Current - self->_lastActivityTimestamp);
      self->_lastActivityTimestamp = Current;
      break;
    case 3:
      [(ETCanvasView *)self _sendAnger];
      break;
    case 4:
    case 5:
      id v4 = self->_currentAnger;
      [(ETCanvasView *)self _hideAnger];
      [(ETCanvasView *)self _endMessage:v4 withSend:0];

      break;
    default:
      break;
  }
}

- (void)_sendAnger
{
  if (self->_currentAnger)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(ETMessage *)self->_currentAnger timeCreated];
    [(ETAngerMessage *)self->_currentAnger setDuration:fmax(Current - v4, 1.0)];
    id v5 = self->_currentAnger;
    [(ETCanvasView *)self _hideAnger];
    [(ETCanvasView *)self _endMessage:v5 withSend:1];
  }
}

- (void)_showAngerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = (ETAngerMessage *)objc_opt_new();
  currentAnger = self->_currentAnger;
  self->_currentAnger = v6;

  -[ETAngerMessage setNormalizedCenter:](self->_currentAnger, "setNormalizedCenter:", x, y);
  [(ETMessage *)self->_currentAnger setParentMessage:self->_parentMessage];
  double v8 = self->_currentAnger;
  double v9 = [(ETCanvasView *)self timeSource];
  [v9 elapsedTimeSinceStartOfMessage:self->_currentAnger];
  -[ETMessage setStartDelay:](v8, "setStartDelay:");

  [(ETAngerMessage *)self->_currentAnger displayInScene:self->_scene];
  self->_angerDurationLimitTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__angerDurationLimitTimerFired selector:0 userInfo:0 repeats:10.0];

  MEMORY[0x270F9A758]();
}

- (void)_hideAnger
{
  [(NSTimer *)self->_angerDurationLimitTimer invalidate];
  angerDurationLimitTimer = self->_angerDurationLimitTimer;
  self->_angerDurationLimitTimer = 0;

  [(ETAngerMessage *)self->_currentAnger stopPlaying];
  currentAnger = self->_currentAnger;
  self->_currentAnger = 0;
}

- (void)_kissRecognized:(id)a3
{
  id v4 = a3;
  currentKissMessage = self->_currentKissMessage;
  id v18 = v4;
  if (currentKissMessage)
  {
    BOOL v6 = [(ETKissMessage *)currentKissMessage reachedSizeLimit];
    id v4 = v18;
    if (v6)
    {
      [(ETCanvasView *)self _sendKiss];
      id v4 = v18;
    }
  }
  [v4 locationInView:self];
  -[ETCanvasView _viewPointNormalizedInSceneSpace:](self, "_viewPointNormalizedInSceneSpace:");
  double v8 = v7;
  double v10 = v9;
  self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
  if (!self->_currentKissMessage)
  {
    double v11 = objc_alloc_init(ETKissMessage);
    id v12 = self->_currentKissMessage;
    self->_currentKissMessage = v11;

    double v13 = self->_currentKissMessage;
    double v14 = [(ETCanvasView *)self timeSource];
    [(ETMessage *)v13 setTimeSource:v14];

    char v15 = self->_currentKissMessage;
    CGRect v16 = [(ETCanvasView *)self timeSource];
    [v16 elapsedTimeSinceStartOfMessage:self->_currentTaps];
    -[ETMessage setStartDelay:](v15, "setStartDelay:");

    [(ETMessage *)self->_currentKissMessage setDelayWisp:self->_parentMessage != 0];
    [(ETKissMessage *)self->_currentKissMessage setParentMessage:self->_parentMessage];
    [(ETCanvasView *)self _setIsComposingMessageOfType:9];
  }
  [(ETCanvasView *)self _angleOfRotationBetweenTwoFingers:v18];
  -[ETKissMessage addKissAtNormalizedPoint:angle:time:toScene:](self->_currentKissMessage, "addKissAtNormalizedPoint:angle:time:toScene:", self->_scene, v8, v10, v17, self->_lastActivityTimestamp);
  [(ETCanvasView *)self _startSendMessageTimer];
}

- (void)_tapRecognized:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 touches];
  BOOL v6 = [v5 objectAtIndex:0];
  [v6 locationInNode:self->_scene];
  double v8 = v7;
  double v10 = v9;

  self->_lastActivityTimestamp = CFAbsoluteTimeGetCurrent();
  if ([(ETCanvasView *)self _tapsInProgress])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    [WeakRetained canvasView:self didUpdateComposingMessageType:self->_messageType];
  }
  else
  {
    [(ETCanvasView *)self _setIsComposingMessageOfType:0];
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      double v13 = [MEMORY[0x263EFF910] date];
      double v14 = +[ETUtility dateFormatWithMilliseconds:v13];
      int v19 = 138412290;
      uint64_t v20 = v14;
      _os_log_impl(&dword_23B55A000, v12, OS_LOG_TYPE_INFO, "(%@) Got tap!", (uint8_t *)&v19, 0xCu);
    }
  }
  char v15 = [(ETCanvasView *)self drawingColor];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v17 = Current;
  *(float *)&CFAbsoluteTime Current = v8;
  *(float *)&double v18 = v10;
  [(ETCanvasView *)self handleTapAtX:v15 Y:0 color:Current time:v18 isRemote:v17];

  self->_lastFastTapTimestamp = CFAbsoluteTimeGetCurrent();
  if (!self->_fastTapAllowableMovementTimer) {
    [(ETCanvasView *)self _startFastTapAllowableMovementTimer];
  }
  [(ETCanvasView *)self _startSendMessageTimer];
}

- (BOOL)_areRecognizersTrackingMultipleFingers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ETCanvasView *)self gestureRecognizers];
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
        if ((unint64_t)[*(id *)(*((void *)&v7 + 1) + 8 * i) numberOfTouches] > 1)
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

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSMutableSet *)self->_touchesDown unionSet:v6];
  BOOL v8 = !self->_isComposing && (unint64_t)[(NSMutableSet *)self->_touchesDown count] > 1;
  self->_ignoreTouchesUntilAllTouchesEnded = v8;
  if (self->_drawingTouch
    || [(ETCanvasView *)self _areRecognizersTrackingMultipleFingers]
    || self->_ignoreTouchesUntilAllTouchesEnded)
  {
    long long v9 = [(UILongPressGestureRecognizer *)self->_heartbeatRecognizer touches];
    uint64_t v10 = [v9 count];

    if (v10 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [WeakRetained canvasView:self didUpdateComposingMessageType:2];
    }
  }
  else
  {
    uint64_t v12 = [v6 anyObject];
    drawingTouch = self->_drawingTouch;
    self->_drawingTouch = v12;

    self->_drawingTouchStartedStroke = 0;
    self->_drawingTouchMovedDistance = 0.0;
    [(ETCanvasView *)self _clearSendMessageTimer];
    if (IMOSLoggingEnabled())
    {
      double v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        char v15 = [MEMORY[0x263EFF910] date];
        CGRect v16 = +[ETUtility dateFormatWithMilliseconds:v15];
        int v21 = 138412290;
        uint64_t v22 = v16;
        _os_log_impl(&dword_23B55A000, v14, OS_LOG_TYPE_INFO, "(%@) UITouchPhaseBegan", (uint8_t *)&v21, 0xCu);
      }
    }
    self->_touchesBeganTimestamp = CFAbsoluteTimeGetCurrent();
    [(UITouch *)self->_drawingTouch locationInNode:self->_scene];
    self->_lastPt.double x = v17;
    self->_lastPt.double y = v18;
    [(UITouch *)self->_drawingTouch locationInView:self];
    v24.double x = v19;
    v24.double y = v20;
    self->_didIgnoreTouchesBegan = CGRectContainsPoint(self->_ignoredTouchesRect, v24);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch, a4)
    && !self->_ignoreTouchesUntilAllTouchesEnded)
  {
    if ([(ETCanvasView *)self _sketchInProgress])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [WeakRetained canvasView:self didUpdateComposingMessageType:self->_messageType];
    }
    [(UITouch *)self->_drawingTouch locationInNode:self->_scene];
    double v7 = v6;
    double v9 = v8;
    p_lastPt = &self->_lastPt;
    *(float *)&double v6 = self->_lastPt.x - v6;
    *(float *)&double v8 = self->_lastPt.y - v8;
    float v11 = hypotf(*(float *)&v6, *(float *)&v8);
    self->_drawingTouchMovedDistance = self->_drawingTouchMovedDistance + v11;
    if (self->_drawingTouchStartedStroke) {
      goto LABEL_6;
    }
    if (v11 >= 3.0)
    {
      [(UITouch *)self->_drawingTouch locationInView:self];
      v28.float x = v18;
      v28.float y = v19;
      if (!CGRectContainsPoint(self->_ignoredTouchesRect, v28))
      {
        if (self->_didIgnoreTouchesBegan)
        {
          p_lastPt->float x = v7;
          self->_lastPt.float y = v9;
          self->_touchesBeganTimestamp = CFAbsoluteTimeGetCurrent();
        }
        if (!self->_drawingTouchStartedStroke)
        {
          if ([(ETCanvasView *)self _tapsInProgress])
          {
            CGFloat v20 = self->_drawingTouch;
            [(ETCanvasView *)self _sendTaps];
            drawingTouch = self->_drawingTouch;
            self->_drawingTouch = v20;
          }
          if (!self->_parentMessage && self->_currentKissMessage) {
            [(ETCanvasView *)self _sendKiss];
          }
          self->_lastActivityTimestamp = self->_touchesBeganTimestamp;
          if (![(ETCanvasView *)self _sketchInProgress]
            && (self->_parentMessage || !self->_isComposing))
          {
            [(ETCanvasView *)self _startDoodleMessageCompositionAtTime:self->_touchesBeganTimestamp];
          }
          float x = p_lastPt->x;
          float y = self->_lastPt.y;
          CGPoint v24 = [(ETCanvasView *)self drawingColor];
          *(float *)&double v25 = x;
          *(float *)&double v26 = y;
          [(ETCanvasView *)self handlePanAtX:v24 Y:1 color:0 time:v25 state:v26 isRemote:self->_touchesBeganTimestamp];

          self->_drawingTouchStartedStroke = 1;
          id v27 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
          [v27 canvasViewDidBeginStroke:self];
        }
LABEL_6:
        double v14 = [(ETCanvasView *)self drawingColor];
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v16 = Current;
        float v12 = v7;
        *(float *)&CFAbsoluteTime Current = v12;
        float v13 = v9;
        *(float *)&double v17 = v13;
        [(ETCanvasView *)self handlePanAtX:v14 Y:2 color:0 time:Current state:v17 isRemote:v16];

        p_lastPt->float x = v7;
        self->_lastPt.float y = v9;
      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)_doodleEndedWithTouches:(id)a3 cancelled:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(NSMutableSet *)self->_touchesDown minusSet:v6];
  if (![v6 containsObject:self->_drawingTouch] || self->_sketchDidReachSizeLimit)
  {
    if ([(NSMutableSet *)self->_touchesDown count]) {
      BOOL v7 = !self->_ignoreTouchesUntilAllTouchesEnded;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v8 = !v7;
    self->_ignoreTouchesUntilAllTouchesEnded = v8;
    goto LABEL_10;
  }
  BOOL v9 = !self->_drawingTouchStartedStroke
    && [(ETCanvasView *)self _isTapTooRecentAfterKissGesture];
  if ([(ETCanvasView *)self isComposingHeartbeat]
    || ![(ETCanvasView *)self _sketchInProgress]
    || (self->_ignoreTouchesUntilAllTouchesEnded ? (char v10 = 1) : (char v10 = v9), (v10 & 1) != 0))
  {
    if (self->_drawingTouch) {
      [(ETCanvasView *)self _startSendMessageTimer];
    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      char v15 = [MEMORY[0x263EFF910] date];
      double v16 = +[ETUtility dateFormatWithMilliseconds:v15];
      int v28 = 138412290;
      uint64_t v29 = v16;
      _os_log_impl(&dword_23B55A000, v14, OS_LOG_TYPE_INFO, "(%@) UITouchPhaseEnded", (uint8_t *)&v28, 0xCu);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(UITouch *)self->_drawingTouch locationInNode:self->_scene];
  double v19 = v18;
  double v21 = v20;
  if (self->_drawingTouchStartedStroke)
  {
    uint64_t v22 = [(ETCanvasView *)self drawingColor];
    *(float *)&double v23 = v19;
    *(float *)&double v24 = v21;
    [(ETCanvasView *)self handlePanAtX:v22 Y:3 color:0 time:v23 state:v24 isRemote:Current];
LABEL_37:

    goto LABEL_38;
  }
  if (!a4)
  {
    uint64_t v22 = [(ETCanvasView *)self drawingColor];
    *(float *)&double v25 = v19;
    *(float *)&double v26 = v21;
    [(ETCanvasView *)self handleDotAtX:v22 Y:0 color:v25 time:v26 isRemote:Current];
    goto LABEL_37;
  }
LABEL_38:
  [(ETCanvasView *)self _startSendMessageTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  [WeakRetained canvasViewDidEndStroke:self];

LABEL_22:
  if ([(NSMutableSet *)self->_touchesDown count]) {
    BOOL v11 = !self->_ignoreTouchesUntilAllTouchesEnded;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  self->_ignoreTouchesUntilAllTouchesEnded = v12;
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

LABEL_10:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_isComposing)
  {
    [(ETCanvasView *)self clearCanvasAnimated:0];
    id v5 = v6;
  }
  [(ETCanvasView *)self _doodleEndedWithTouches:v5 cancelled:1];
}

- (void)_createSketchViewWithColor:(id)a3 time:(double)a4 message:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [ETGLSketchView alloc];
  [(ETCanvasView *)self bounds];
  char v10 = -[ETGLSketchView initWithFrame:](v9, "initWithFrame:");
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = v10;

  if (self->_currentSketchView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      double v14 = self->_currentSketchView;
      id v15 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      -[ETGLSketchView setUseFastVerticalWisp:](v14, "setUseFastVerticalWisp:", [v15 canvasViewShouldUseFastVerticalWisp:self]);
    }
    [(ETGLSketchView *)self->_currentSketchView setWispDelay:self->_wispDelay];
    [(ETGLSketchView *)self->_currentSketchView setMessageData:v8];
    [v8 setDelegate:self];
    [v8 setColor:v7];
    messageIdentifierToDoodleView = self->_messageIdentifierToDoodleView;
    double v17 = self->_currentSketchView;
    double v18 = [v8 identifier];
    [(NSMutableDictionary *)messageIdentifierToDoodleView setObject:v17 forKey:v18];

    double v19 = self->_currentSketchView;
    if (self->_usesMediaAppearance) {
      [(ETCanvasView *)self insertSubview:v19 belowSubview:self->_sceneView];
    }
    else {
      [(ETCanvasView *)self addSubview:v19];
    }
    [(ETGLSketchView *)self->_currentSketchView layoutIfNeeded];
  }
  else if (IMOSLoggingEnabled())
  {
    double v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_23B55A000, v20, OS_LOG_TYPE_INFO, "ERROR: Failed to allocate ETGLSketchView for message: %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)handleTapAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7
{
  id v12 = a5;
  if (!a7)
  {
    id v21 = v12;
    currentTaps = self->_currentTaps;
    if (!currentTaps) {
      goto LABEL_6;
    }
    if ([(ETTapMessage *)currentTaps reachedSizeLimit]) {
      [(ETCanvasView *)self sendCurrentMessage];
    }
    if (!self->_currentTaps)
    {
LABEL_6:
      double v14 = objc_alloc_init(ETTapMessage);
      id v15 = self->_currentTaps;
      self->_currentTaps = v14;

      [(ETMessage *)self->_currentTaps setDelegate:self];
      [(ETMessage *)self->_currentTaps setColor:v21];
      [(ETMessage *)self->_currentTaps setParentMessage:self->_parentMessage];
      [(ETTapMessage *)self->_currentTaps preVisualizeInScene:self->_scene];
      double v16 = self->_currentTaps;
      double v17 = [(ETCanvasView *)self timeSource];
      [v17 elapsedTimeSinceStartOfMessage:self->_currentTaps];
      -[ETMessage setStartDelay:](v16, "setStartDelay:");
    }
    self->_lastActivityTimestamp = a6;
    [(SKScene *)self->_scene size];
    double v19 = a3 / v18 + a3 / v18;
    [(SKScene *)self->_scene size];
    -[ETTapMessage addTapAtPoint:time:color:](self->_currentTaps, "addTapAtPoint:time:color:", v21, v19, a4 / v20 + a4 / v20, a6);
    id v12 = v21;
  }
}

- (void)handlePanAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 state:(int64_t)a7 isRemote:(BOOL)a8
{
  id v37 = a5;
  if (a7 == 1) {
    [(ETGLSketchView *)self->_currentSketchView beginStrokeWithColor:v37];
  }
  self->_lastActivityTimestamp = a6;
  [(SKScene *)self->_scene size];
  double v15 = v14;
  double v17 = v16;
  UIRoundToViewScale();
  double v19 = v18 * fmax(v15 / 156.0, 1.0);
  double v20 = v15 * 0.5 - v19;
  double v21 = -v20;
  if (v20 >= a3) {
    double v20 = a3;
  }
  if (v20 <= v21) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  double v23 = v17 * 0.5 - v19;
  double v24 = -v23;
  if (v23 >= a4) {
    double v23 = a4;
  }
  if (v23 <= v24) {
    double v25 = v24;
  }
  else {
    double v25 = v23;
  }
  unint64_t v26 = a7 - 5;
  if ((unint64_t)(a7 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    [(UITouch *)self->_drawingTouch locationInNode:self->_scene];
    *(float *)&double v27 = self->_lastPt.x - v27;
    *(float *)&double v28 = self->_lastPt.y - v28;
    if (hypotf(*(float *)&v27, *(float *)&v28) < 3.0)
    {
      p_currentSketchView = &self->_currentSketchView;
LABEL_19:
      [(ETGLSketchView *)*p_currentSketchView didCompleteStroke];
      goto LABEL_20;
    }
  }
  float v29 = v22;
  float v30 = v25;
  p_currentSketchView = &self->_currentSketchView;
  currentSketchView = self->_currentSketchView;
  double v33 = v29;
  [(SKScene *)self->_scene size];
  double v35 = v33 / v34 + v33 / v34;
  [(SKScene *)self->_scene size];
  -[ETGLSketchView handleSketchAtPosition:](currentSketchView, "handleSketchAtPosition:", v35, v30 / v36 + v30 / v36);
  if (v26 >= 0xFFFFFFFFFFFFFFFELL && !a8) {
    goto LABEL_19;
  }
LABEL_20:
}

- (void)handleDotAtX:(float)a3 Y:(float)a4 color:(id)a5 time:(double)a6 isRemote:(BOOL)a7
{
  if (!a7)
  {
    self->_lastActivityTimestamp = a6;
    [(ETGLSketchView *)self->_currentSketchView beginStrokeWithColor:a5];
    currentSketchView = self->_currentSketchView;
    [(SKScene *)self->_scene size];
    double v13 = a3 / v12 + a3 / v12;
    [(SKScene *)self->_scene size];
    double v15 = a4 / v14 + a4 / v14;
    -[ETGLSketchView handleTapAtPosition:](currentSketchView, "handleTapAtPosition:", v13, v15);
  }
}

- (void)_startSendMessageTimer
{
  uint64_t v3 = [(ETCanvasView *)self canvasDelegate];
  int v4 = [v3 canvasViewShouldSendWithTimer:self];

  if (v4)
  {
    [(NSTimer *)self->_sendMessageTimer invalidate];
    self->_sendMessageTimer = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__sendMessageTimerFired selector:0 userInfo:0 repeats:2.0];
    MEMORY[0x270F9A758]();
  }
}

- (void)_clearSendMessageTimer
{
  [(NSTimer *)self->_sendMessageTimer invalidate];
  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;
}

- (BOOL)_sendMessageTimerFired
{
  sendMessageTimer = self->_sendMessageTimer;
  self->_sendMessageTimer = 0;

  double v4 = CFAbsoluteTimeGetCurrent() - self->_lastActivityTimestamp;
  if (v4 > 2.0) {
    [(ETCanvasView *)self sendCurrentMessage];
  }
  return v4 > 2.0;
}

- (id)composedSketchMessage
{
  return [(ETGLSketchView *)self->_currentSketchView messageData];
}

- (void)_sendSketch
{
  uint64_t v3 = [(ETGLSketchView *)self->_currentSketchView messageData];
  [(ETCanvasView *)self _endMessage:v3 withSend:1];

  if ([(ETGLSketchView *)self->_currentSketchView isPaused])
  {
    double v4 = [(ETGLSketchView *)self->_currentSketchView messageData];
    [(ETCanvasView *)self _clearDoodleViewForMessage:v4];
  }
  else if (!self->_usesMediaAppearance)
  {
    [(ETCanvasView *)self _animateOutSketchView:self->_currentSketchView withCompletion:0];
  }
  currentSketchView = self->_currentSketchView;
  self->_currentSketchView = 0;

  self->_sketchDidReachSizeLimit = 0;
}

- (void)_sendTaps
{
  currentTaps = self->_currentTaps;
  if (currentTaps)
  {
    [(ETCanvasView *)self _endMessage:currentTaps withSend:1];
    double v4 = self->_currentTaps;
    self->_currentTaps = 0;
  }
}

- (void)sendCurrentMessage
{
  [(ETCanvasView *)self _clearSendMessageTimer];
  if (self->_currentHeartbeat) {
    [(ETCanvasView *)self _sendHeartbeat];
  }
  if (self->_currentTaps) {
    [(ETCanvasView *)self _sendTaps];
  }
  if (self->_currentSketchView) {
    [(ETCanvasView *)self _sendSketch];
  }
  if (self->_currentKissMessage) {
    [(ETCanvasView *)self _sendKiss];
  }
  if (self->_currentAnger) {
    [(ETCanvasView *)self _sendAnger];
  }
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_lastActivityTimestamp = 0.0;
}

- (void)setCanComposeTap:(BOOL)a3
{
  self->_canComposeTap = a3;
  -[UITapGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:");
}

- (void)setCanComposeKiss:(BOOL)a3
{
  self->_canComposeKiss = a3;
  -[UITapGestureRecognizer setEnabled:](self->_kissRecognizer, "setEnabled:");
}

- (void)setCanComposeAnger:(BOOL)a3
{
  self->_BOOL canComposeAnger = a3;
  -[UILongPressGestureRecognizer setEnabled:](self->_angerRecognizer, "setEnabled:");
}

- (void)setCanComposeHeartbeat:(BOOL)a3
{
  if (self->_canComposeHeartbeat != a3)
  {
    self->_canComposeHeartbeat = a3;
    -[UILongPressGestureRecognizer setEnabled:](self->_heartbeatRecognizer, "setEnabled:");
  }
}

- (double)_angleOfRotationBetweenTwoFingers:(id)a3
{
  id v4 = a3;
  [v4 locationOfTouch:0 inView:self];
  double v6 = v5;
  double v8 = v7;
  [v4 locationOfTouch:1 inView:self];
  double v10 = v9;
  double v12 = v11;

  if (v6 <= v10)
  {
    double v13 = v6;
    double v14 = v8;
    double v6 = v10;
    double v8 = v12;
  }
  else
  {
    double v13 = v10;
    double v14 = v12;
  }
  long double v15 = atan2(-(v14 - v8), v13 - v6);
  double result = fmod(v15, 6.28318531);
  double v17 = 3.14159265;
  if (result <= 3.14159265)
  {
    if (result >= 3.14159265) {
      return result;
    }
  }
  else
  {
    double v17 = -3.14159265;
  }
  return result + v17;
}

- (CGPoint)_viewPointNormalizedInSceneSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SKScene *)self->_scene size];
  double v7 = v6;
  double v9 = v8;
  -[SKScene convertPointFromView:](self->_scene, "convertPointFromView:", x, y);
  double v11 = v10 / v7;
  double v13 = v12 / v9;
  result.double y = v13;
  result.double x = v11;
  return result;
}

- (void)_heartbeatRecognized:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 1)
  {
    if (!self->_parentMessage)
    {
      if ([(ETCanvasView *)self _sketchInProgress] && self->_drawingTouchMovedDistance < 20.0)
      {
        id v4 = [(ETGLSketchView *)self->_currentSketchView messageData];
        [(ETCanvasView *)self _endMessage:v4 withSend:0];
      }
      if (!self->_parentMessage && self->_currentKissMessage) {
        [(ETCanvasView *)self _sendKiss];
      }
    }
    if ([(ETCanvasView *)self _canComposeExclusiveMessage])
    {
      if (self->_currentHeartbeat) {
        [(ETCanvasView *)self _sendHeartbeat];
      }
      [(ETCanvasView *)self _setIsComposingMessageOfType:2];
      [(ETCanvasView *)self _normalizedGesturePoint:v14];
      double v6 = v5;
      double v8 = v7;
      [(ETCanvasView *)self _angleOfRotationBetweenTwoFingers:v14];
      -[ETCanvasView _showHeartbeatAtNormalizedPoint:rotation:](self, "_showHeartbeatAtNormalizedPoint:rotation:", v6, v8, v9);
      [v14 locationInView:self];
      self->_heartbeatStartCenter.double x = v10;
      self->_heartbeatStartCenter.double y = v11;
    }
  }
  else if ([v14 state] == 2)
  {
    if ([(ETCanvasView *)self isComposingHeartbeat])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [WeakRetained canvasView:self didUpdateComposingMessageType:self->_messageType];

      if (![(ETHeartbeatMessage *)self->_currentHeartbeat isBroken])
      {
        [v14 locationInView:self];
        if (v13 - self->_heartbeatStartCenter.y > 20.0) {
          [(ETHeartbeatMessage *)self->_currentHeartbeat breakHeart];
        }
      }
    }
  }
  else if (([v14 state] == 3 || objc_msgSend(v14, "state") == 4) {
         && [(ETCanvasView *)self isComposingHeartbeat])
  }
  {
    [(ETCanvasView *)self _sendHeartbeat];
  }
}

- (void)_sendKiss
{
  currentKissMessage = self->_currentKissMessage;
  if (currentKissMessage)
  {
    [(ETKissMessage *)currentKissMessage stopPlaying];
    [(ETCanvasView *)self _endMessage:self->_currentKissMessage withSend:1];
    id v4 = self->_currentKissMessage;
    self->_currentKissMessage = 0;
  }
}

- (void)_sendHeartbeat
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(ETCanvasView *)self isComposingHeartbeat])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(ETMessage *)self->_currentHeartbeat timeCreated];
    double v5 = Current - v4;
    if (v5 > (double)10) {
      double v5 = (double)10;
    }
    if (v5 <= (double)1) {
      double v6 = (double)1;
    }
    else {
      double v6 = v5;
    }
    [(ETHeartbeatMessage *)self->_currentHeartbeat setDuration:(int)v6];
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        currentHeartbeat = self->_currentHeartbeat;
        int v10 = 138412546;
        CGFloat v11 = currentHeartbeat;
        __int16 v12 = 1024;
        BOOL v13 = v6 > 0.7;
        _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "Ending %@, will send: %d", (uint8_t *)&v10, 0x12u);
      }
    }
    double v9 = self->_currentHeartbeat;
    [(ETCanvasView *)self _hideHeartbeat];
    [(ETCanvasView *)self _endMessage:v9 withSend:v6 > 0.7];
  }
}

- (void)updateCurrentMessageWithHeartRate:(unint64_t)a3
{
  *(float *)&double v3 = (float)a3;
  [(ETHeartbeatMessage *)self->_currentHeartbeat setBeatsPerMinute:v3];
}

- (void)_showHeartbeatAtNormalizedPoint:(CGPoint)a3 rotation:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = (ETHeartbeatMessage *)objc_opt_new();
  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = v7;

  -[ETHeartbeatMessage setNormalizedCenter:](self->_currentHeartbeat, "setNormalizedCenter:", x, y);
  objc_initWeak(&location, self->_currentHeartbeat);
  double v9 = +[HeartRateStore sharedStore];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  double v16 = __57__ETCanvasView__showHeartbeatAtNormalizedPoint_rotation___block_invoke;
  double v17 = &unk_264DECA68;
  objc_copyWeak(&v18, &location);
  [v9 recentHeartRateWithCompletion:&v14];

  -[ETMessage setParentMessage:](self->_currentHeartbeat, "setParentMessage:", self->_parentMessage, v14, v15, v16, v17);
  [(ETHeartbeatMessage *)self->_currentHeartbeat startHeartbeat:self->_scene];
  int v10 = self->_currentHeartbeat;
  CGFloat v11 = [(ETCanvasView *)self timeSource];
  [v11 elapsedTimeSinceStartOfMessage:self->_currentHeartbeat];
  -[ETMessage setStartDelay:](v10, "setStartDelay:");

  __int16 v12 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__hideHeartbeatTimerFired selector:0 userInfo:0 repeats:(double)10];
  heartbeatDurationTimer = self->_heartbeatDurationTimer;
  self->_heartbeatDurationTimer = v12;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __57__ETCanvasView__showHeartbeatAtNormalizedPoint_rotation___block_invoke(uint64_t a1, unint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = (float)a2;
  [WeakRetained setBeatsPerMinute:v3];
}

- (void)_hideHeartbeat
{
  [(NSTimer *)self->_heartbeatDurationTimer invalidate];
  heartbeatDurationTimer = self->_heartbeatDurationTimer;
  self->_heartbeatDurationTimer = 0;

  [(ETHeartbeatMessage *)self->_currentHeartbeat stopPlaying];
  currentHeartbeat = self->_currentHeartbeat;
  self->_currentHeartbeat = 0;
}

- (void)_hideHeartbeatTimerFired
{
  if ([(ETCanvasView *)self isComposingHeartbeat])
  {
    [(ETCanvasView *)self _sendHeartbeat];
  }
}

- (void)playTestStrokeWithColor:(id)a3 duration:(double)a4
{
  id v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 0.3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke;
  block[3] = &unk_264DECA90;
  block[4] = self;
  id v8 = v6;
  id v23 = v8;
  double v24 = a4;
  double v9 = MEMORY[0x263EF83A0];
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 0.6 * 1000000000.0));
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_2;
  v20[3] = &unk_264DEC7B0;
  v20[4] = self;
  id v11 = v8;
  id v21 = v11;
  dispatch_after(v10, v9, v20);

  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a4 * 0.88 * 1000000000.0));
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_3;
  v18[3] = &unk_264DEC7B0;
  v18[4] = self;
  id v13 = v11;
  id v19 = v13;
  dispatch_after(v12, v9, v18);

  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_4;
  v16[3] = &unk_264DEC7B0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  dispatch_after(v14, v9, v16);
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 48);
  double v4 = Current + v3 * -0.300000012;
  LODWORD(v3) = -1035468800;
  [*(id *)(a1 + 32) handlePanAtX:*(void *)(a1 + 40) Y:1 color:0 time:v3 state:-0.300000014 isRemote:v4];
  double v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  LODWORD(v7) = -30.0;

  return [v5 handlePanAtX:v6 Y:2 color:0 time:0.0 state:v7 isRemote:Current];
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current;
  LODWORD(Current) = 1112014848;
  LODWORD(v5) = 1109393408;

  return [v1 handlePanAtX:v2 Y:3 color:0 time:Current state:v5 isRemote:v3];
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current;
  LODWORD(v4) = 1110704128;
  LODWORD(Current) = -25.0;

  return [v1 handleDotAtX:v2 Y:0 color:Current time:v4 isRemote:v3];
}

uint64_t __49__ETCanvasView_playTestStrokeWithColor_duration___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current;
  LODWORD(v4) = 1110704128;
  LODWORD(Current) = 25.0;

  return [v1 handleDotAtX:v2 Y:0 color:Current time:v4 isRemote:v3];
}

- (void)playMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      scene = self->_scene;
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      dispatch_time_t v12 = scene;
      _os_log_impl(&dword_23B55A000, v5, OS_LOG_TYPE_INFO, "Displaying message %@ in scene %@", (uint8_t *)&v9, 0x16u);
    }
  }
  if ([v4 messageType] == 1)
  {
    double v7 = [v4 color];
    [(ETCanvasView *)self _createSketchViewWithColor:v7 time:v4 message:0.0];

    [(ETGLSketchView *)self->_currentSketchView setPlaying:1];
  }
  else if ([v4 messageType] != 8)
  {
    [v4 displayInScene:self->_scene];
  }
  [v4 setDelegate:self];
  [(ETCanvasView *)self setPaused:self->_setAlwaysPaused];
  [(ETCanvasView *)self _startCheckForIdleTimer];
  [(NSMutableSet *)self->_playingMessages addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  [WeakRetained canvasView:self didBeginPlayingMessage:v4];
}

- (void)messageWillReachSizeLimit:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  [WeakRetained canvasViewWillReachComposingSizeLimit:self];

  self->_sketchDidReachSizeLimit = 1;
}

- (void)messageWillStopPlaying:(id)a3
{
  p_canvasDelegate = &self->_canvasDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_canvasDelegate);
  [WeakRetained canvasView:self willEndPlayingMessage:v5];
}

- (void)messageDidStopPlaying:(id)a3
{
  id v4 = a3;
  [(ETCanvasView *)self _clearDoodleViewForMessage:v4];
  [(NSMutableSet *)self->_playingMessages removeObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  [WeakRetained canvasView:self didEndPlayingMessage:v4];
}

- (void)setUsesMediaAppearance:(BOOL)a3
{
  if (self->_usesMediaAppearance != a3)
  {
    self->_BOOL usesMediaAppearance = a3;
    [(ETCanvasView *)self setPaused:0];
    sceneView = self->_sceneView;
    if (self->_usesMediaAppearance) {
      [MEMORY[0x263F1C550] clearColor];
    }
    else {
    id v5 = [MEMORY[0x263F1C550] blackColor];
    }
    [(DTSSceneView *)sceneView setBackgroundColor:v5];

    scene = self->_scene;
    if (self->_usesMediaAppearance) {
      [MEMORY[0x263F1C550] clearColor];
    }
    else {
    double v7 = [MEMORY[0x263F1C550] blackColor];
    }
    [(SKScene *)scene setBackgroundColor:v7];

    [(DTSSceneView *)self->_sceneView setAllowsTransparency:self->_usesMediaAppearance];
    [(DTSSceneView *)self->_sceneView setNeedsLayout];
    [(SKScene *)self->_scene _setNeedsUpdate];
    [(ETCanvasView *)self _startCheckForIdleTimer];
    BOOL usesMediaAppearance = self->_usesMediaAppearance;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    if (usesMediaAppearance)
    {
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0) {
        return;
      }
      id v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [v12 canvasViewDidStartMediaAppearance:self];
    }
    else
    {
      int v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        return;
      }
      id v12 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
      [v12 canvasViewDidEndMediaAppearance:self];
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  drawingTouch = self->_drawingTouch;
  self->_drawingTouch = 0;

  self->_drawingTouchStartedStroke = 0;
  [(NSMutableSet *)self->_touchesDown removeAllObjects];
  self->_sketchDidReachSizeLimit = 0;
}

- (void)setForceTouchEnabled:(BOOL)a3
{
  if (self->_angerUsesForceTouch != a3)
  {
    self->_angerUsesForceTouch = a3;
    [(ETCanvasView *)self _configureAngerRecognizer];
  }
}

- (void)_configureAngerRecognizer
{
  if (self->_angerRecognizer) {
    -[ETCanvasView removeGestureRecognizer:](self, "removeGestureRecognizer:");
  }
  if (self->_angerUsesForceTouch) {
    double v3 = (Class *)off_264DEC268;
  }
  else {
    double v3 = (Class *)0x263F1C7A0;
  }
  id v4 = (UILongPressGestureRecognizer *)[objc_alloc(*v3) initWithTarget:self action:sel__angerRecognized_];
  angerRecognizer = self->_angerRecognizer;
  self->_angerRecognizer = v4;

  [(UILongPressGestureRecognizer *)self->_angerRecognizer setNumberOfTouchesRequired:1];
  [(UILongPressGestureRecognizer *)self->_angerRecognizer setMinimumPressDuration:0.2];
  [(UILongPressGestureRecognizer *)self->_angerRecognizer setDelegate:self];
  [(ETCanvasView *)self addGestureRecognizer:self->_angerRecognizer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_canvasDelegate);
    [v8 canvasView:self angerUsesForceTouch:self->_angerUsesForceTouch];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 traitCollection];
  -[ETCanvasView setForceTouchEnabled:](self, "setForceTouchEnabled:", [v4 forceTouchCapability] == 2);
}

- (ETCanvasViewDelegate)canvasDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasDelegate);

  return (ETCanvasViewDelegate *)WeakRetained;
}

- (void)setCanvasDelegate:(id)a3
{
}

- (ETMessageTimeSource)timeSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeSource);

  return (ETMessageTimeSource *)WeakRetained;
}

- (void)setTimeSource:(id)a3
{
}

- (UIColor)drawingColor
{
  return self->_drawingColor;
}

- (BOOL)canComposeHeartbeat
{
  return self->_canComposeHeartbeat;
}

- (BOOL)canComposeTap
{
  return self->_canComposeTap;
}

- (BOOL)canComposeKiss
{
  return self->_canComposeKiss;
}

- (BOOL)canComposeAnger
{
  return self->_canComposeAnger;
}

- (BOOL)isComposing
{
  return self->_isComposing;
}

- (BOOL)usesMediaAppearance
{
  return self->_usesMediaAppearance;
}

- (ETMessage)parentMessage
{
  return self->_parentMessage;
}

- (void)setParentMessage:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- (BOOL)angerUsesForceTouch
{
  return self->_angerUsesForceTouch;
}

- (void)setAngerUsesForceTouch:(BOOL)a3
{
  self->_angerUsesForceTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMessage, 0);
  objc_storeStrong((id *)&self->_drawingColor, 0);
  objc_destroyWeak((id *)&self->_timeSource);
  objc_destroyWeak((id *)&self->_canvasDelegate);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_angerDurationLimitTimer, 0);
  objc_storeStrong((id *)&self->_currentAnger, 0);
  objc_storeStrong((id *)&self->_angerRecognizer, 0);
  objc_storeStrong((id *)&self->_currentKissMessage, 0);
  objc_storeStrong((id *)&self->_kissRecognizer, 0);
  objc_storeStrong((id *)&self->_fastTapAllowableMovementTimer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToDoodleView, 0);
  objc_storeStrong((id *)&self->_touchesDown, 0);
  objc_storeStrong((id *)&self->_drawingTouch, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_sendMessageTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatRecognizer, 0);
  objc_storeStrong((id *)&self->_heartbeatDurationTimer, 0);
  objc_storeStrong((id *)&self->_currentHeartbeat, 0);
  objc_storeStrong((id *)&self->_currentTaps, 0);
  objc_storeStrong((id *)&self->_currentSketchView, 0);

  objc_storeStrong((id *)&self->_playingMessages, 0);
}

@end