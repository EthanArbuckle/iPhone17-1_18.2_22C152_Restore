@interface AXSpeakOverlayViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (AXSpeakOverlayControlBar)bar;
- (AXSpeakOverlayViewController)init;
- (AXSpeakOverlayViewControllerDelegate)delegate;
- (BOOL)_axIsPointInForeheadRect:(CGPoint)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)ignoreNextNubbitPositionUpdate;
- (BOOL)isSpeaking;
- (CGPoint)_denormalizedNubbitOriginForViewSize:(CGSize)a3;
- (CGPoint)gestureMoveStartPosition;
- (CGPoint)nubbitMoveStartPosition;
- (CGRect)overlayFrame;
- (NSArray)currentUnmodifiedSentenceRects;
- (NSArray)highlightSelectionRects;
- (NSArray)sentenceHighlightSelectionRects;
- (QSSelectionHighlightView)highlightView;
- (QSSelectionHighlightView)sentenceHighlightView;
- (SpeakThisUIStateManager)stateManager;
- (UIColor)highlightColor;
- (UIColor)underlineColor;
- (double)idleOpacityForNubbit:(id)a3;
- (double)reachabilityOffset;
- (double)speakingRateAsMultiplier;
- (id)_sliceRects:(id)a3 withSentenceRects:(id)a4 wordRects:(id)a5;
- (id)highlightColorForColor:(id)a3;
- (id)sentenceHighlightColorForColor:(id)a3;
- (id)title;
- (unsigned)contextID;
- (void)_enqueueCollapseTimer;
- (void)_initializeContainingView;
- (void)_registerNubbit;
- (void)_saveNubbitPosition;
- (void)_unregisterNubbit;
- (void)_updateForTabModeUsingSpeakFingerButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateNubbitForTabModeChange;
- (void)_updateTabButtonToExpandCollapseButton;
- (void)_updateTabButtonToSpeakFingerButton;
- (void)_updateUI;
- (void)barDidReceiveFocus;
- (void)collapseNubbit;
- (void)controlBarDragged:(CGPoint)a3 gestureRecognizer:(id)a4;
- (void)currentSpeakingRateChanged;
- (void)dealloc;
- (void)didPause;
- (void)didResume;
- (void)didStop;
- (void)expandNubbit;
- (void)fastForwardButtonPressed;
- (void)finishLoading;
- (void)handleKBFrameWillUpdate:(id)a3;
- (void)handleReachabilityToggled:(double)a3;
- (void)headerTapped;
- (void)hideWithCompletion:(id)a3;
- (void)loadView;
- (void)moveBackInBounds;
- (void)nubbitDidUpdatePosition:(id)a3;
- (void)nubbitWillBeginDragging:(id)a3;
- (void)panToPosition:(CGPoint)a3;
- (void)pauseButtonPressed;
- (void)playButtonPressed;
- (void)resetUI;
- (void)rewindButtonPressed;
- (void)setBar:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setCurrentUnmodifiedSentenceRects:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureMoveStartPosition:(CGPoint)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightSelectionRects:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setIgnoreNextNubbitPositionUpdate:(BOOL)a3;
- (void)setNubbitMoveStartPosition:(CGPoint)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setSentenceHighlightSelectionRects:(id)a3;
- (void)setSentenceHighlightView:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setUnderlineColor:(id)a3;
- (void)showErrorMessage:(id)a3;
- (void)showUI;
- (void)showUIForApplication:(id)a3;
- (void)speakUnderFingerButtonPressed;
- (void)speedButtonPressed;
- (void)startNewReadAllFromGesture;
- (void)stopButtonPressed;
- (void)stopSpeakFingerButtonPressed;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)tabModeButtonPressed;
- (void)temporarilyHideUI;
- (void)uiStateChanged;
- (void)unregisterNubbit:(BOOL)a3;
- (void)updateBarWithAppTitleForApp:(id)a3;
- (void)updateGestureRecognizers;
- (void)updateSpeakUnderFingerState:(unint64_t)a3;
- (void)updateUIForDisplayChange;
- (void)updateUIForSpeakUnderFingerSettingsChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AXSpeakOverlayViewController

- (AXSpeakOverlayViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXSpeakOverlayViewController;
  v2 = [(AXSpeakOverlayViewController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[SpeakThisUIStateManager sharedInstance];
    stateManager = v2->_stateManager;
    v2->_stateManager = (SpeakThisUIStateManager *)v3;

    [(SpeakThisUIStateManager *)v2->_stateManager addObserver:v2];
    if (AXDeviceHasJindo())
    {
      v5 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
      layoutMonitor = v2->_layoutMonitor;
      v2->_layoutMonitor = v5;

      [(SBSSystemApertureLayoutMonitor *)v2->_layoutMonitor addObserver:v2];
      v2->_foreheadRect.origin = 0u;
      v2->_foreheadRect.size = 0u;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(SpeakThisUIStateManager *)self->_stateManager removeObserver:self];
  [(AXSpeakOverlayControlBar *)self->_bar setDelegate:0];
  [(AXSpeakOverlayViewController *)self _unregisterNubbit];
  v3.receiver = self;
  v3.super_class = (Class)AXSpeakOverlayViewController;
  [(AXSpeakOverlayViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v6 = objc_msgSend(v3, "initWithFrame:");

  [(AXSpeakOverlayViewController *)self setView:v6];
  v5 = [(AXSpeakOverlayViewController *)self view];
  [v5 setAccessibilityIgnoresInvertColors:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)title
{
  return AXSpeakThisLocString(@"SPEAK_SCREEN");
}

- (void)_initializeContainingView
{
  +[AXSpeakOverlayControlBar controlBarSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(AXSpeakOverlayViewController *)self view];
  [v7 frame];
  double v9 = v8 * 0.5 - v4 * 0.5;
  v10 = [(AXSpeakOverlayViewController *)self view];
  [v10 frame];
  double v12 = v11 * 0.5 - v6 * 0.5;

  v13 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithFrame:", v9, v12, v4, v6);
  containingView = self->_containingView;
  self->_containingView = v13;

  v15 = +[UIBlurEffect effectWithStyle:19];
  [(UIVisualEffectView *)self->_containingView setEffect:v15];

  [(UIVisualEffectView *)self->_containingView setUserInteractionEnabled:1];
  v16 = [(UIVisualEffectView *)self->_containingView layer];
  [v16 setMasksToBounds:1];

  v17 = [(UIVisualEffectView *)self->_containingView layer];
  [v17 setCornerRadius:15.0];

  v18 = [(AXSpeakOverlayViewController *)self view];
  [v18 addSubview:self->_containingView];

  v19 = [AXSpeakOverlayControlBar alloc];
  [(UIVisualEffectView *)self->_containingView bounds];
  v20 = -[AXSpeakOverlayControlBar initWithFrame:](v19, "initWithFrame:");
  bar = self->_bar;
  self->_bar = v20;

  [(AXSpeakOverlayControlBar *)self->_bar setAutoresizingMask:18];
  [(AXSpeakOverlayControlBar *)self->_bar setDelegate:self];
  [(AXSpeakOverlayControlBar *)self->_bar currentSpeakingRateChanged];
  v22 = [(UIVisualEffectView *)self->_containingView contentView];
  [v22 addSubview:self->_bar];

  [(UIVisualEffectView *)self->_containingView setAlpha:0.0];
  [(AXSpeakOverlayViewController *)self setReachabilityOffset:0.0];
  objc_initWeak(&location, self);
  v23 = +[AXSettings sharedInstance];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1426C;
  v25[3] = &unk_28AC0;
  v25[4] = self;
  objc_copyWeak(&v26, &location);
  id v24 = objc_loadWeakRetained(&location);
  [v23 registerUpdateBlock:v25 forRetrieveSelector:"speechControllerIdleOpacity" withListener:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)updateUIForDisplayChange
{
  [(AXSpeakOverlayViewController *)self showUI];
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  id v4 = [v3 currentState];

  if (v4)
  {
    double v5 = [(AXSpeakOverlayViewController *)self stateManager];
    double v6 = (char *)[v5 currentState];

    if (v6 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    AXSpeakThisLocString(@"NO_SPEAKABLE_CONTENT_EXISTS");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    -[AXSpeakOverlayViewController showErrorMessage:](self, "showErrorMessage:");
  }
  else
  {
    id v7 = +[AXSpeakFingerManager sharedInstance];
    -[AXSpeakOverlayViewController updateSpeakUnderFingerState:](self, "updateSpeakUnderFingerState:", [v7 speakFingerState]);
  }
}

- (void)showUI
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  id v4 = [v3 collapseTimer];
  [v4 cancel];

  if (!self->_containingView) {
    [(AXSpeakOverlayViewController *)self _initializeContainingView];
  }
  double v5 = [(AXSpeakOverlayViewController *)self stateManager];
  if (![v5 currentState])
  {

    goto LABEL_8;
  }
  double v6 = [(AXSpeakOverlayViewController *)self stateManager];
  id v7 = (char *)[v6 currentState];

  if (v7 == (unsigned char *)&dword_0 + 1)
  {
LABEL_8:
    [(AXSpeakOverlayControlBar *)self->_bar showSpeakFingerUI];
    goto LABEL_9;
  }
  double v8 = [(AXSpeakOverlayViewController *)self stateManager];
  double v9 = (char *)[v8 currentState];

  if (v9 == (unsigned char *)&dword_0 + 2) {
    [(AXSpeakOverlayViewController *)self finishLoading];
  }
LABEL_9:
  v10 = [(AXSpeakOverlayViewController *)self stateManager];
  [v10 setCurrentAppBundleIdentifier:0];

  [(AXSpeakOverlayViewController *)self _updateUI];
}

- (void)resetUI
{
  [(AXSpeakOverlayControlBar *)self->_bar showSpeakFingerUI];
  id v3 = [(AXSpeakOverlayViewController *)self stateManager];
  [v3 setCurrentAppBundleIdentifier:0];
}

- (void)_updateUI
{
  [(UIVisualEffectView *)self->_containingView alpha];
  if (v3 == 0.0)
  {
    [(AXSpeakOverlayViewController *)self _updateForTabModeUsingSpeakFingerButton:0 animated:0];
    containingView = self->_containingView;
    [(UIVisualEffectView *)containingView setAlpha:1.0];
  }
  else
  {
    [(AXSpeakOverlayViewController *)self _updateForTabModeUsingSpeakFingerButton:0 animated:1];
  }
}

- (void)expandNubbit
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  [v3 setInTabMode:0];

  [(AXSpeakOverlayViewController *)self _updateUI];
}

- (void)collapseNubbit
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  [v3 setInTabMode:1];

  [(AXSpeakOverlayViewController *)self _updateUI];
}

- (void)updateUIForSpeakUnderFingerSettingsChange
{
  double v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 showSpeechController];

  bar = self->_bar;
  if (v4) {
    [(AXSpeakOverlayControlBar *)bar hideStopButton];
  }
  else {
    [(AXSpeakOverlayControlBar *)bar showStopButton];
  }
  double v6 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned __int8 v7 = [v6 inTabMode];

  if ((v7 & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_14844;
    v8[3] = &unk_28710;
    v8[4] = self;
    +[UIView animateWithDuration:v8 animations:0.25];
  }
}

- (void)updateBarWithAppTitleForApp:(id)a3
{
  id v4 = a3;
  double v5 = [(AXSpeakOverlayViewController *)self stateManager];
  double v6 = [v4 bundleId];
  [v5 setCurrentAppBundleIdentifier:v6];

  id v9 = [v4 label];
  LODWORD(v5) = [v4 isSpringBoard];

  if (v5)
  {
    uint64_t v7 = AXSpeakThisLocString(@"HOME_SCREEN");

    id v9 = (id)v7;
  }
  double v8 = [(AXSpeakOverlayViewController *)self stateManager];
  [v8 setCurrentControllerTitle:v9];
}

- (void)showUIForApplication:(id)a3
{
  id v4 = a3;
  if (self->_containingView)
  {
    double v5 = [(AXSpeakOverlayViewController *)self stateManager];
    unsigned int v6 = [v5 inTabMode];

    if (v6) {
      [(AXSpeakOverlayViewController *)self tabModeButtonPressed];
    }
  }
  else
  {
    [(AXSpeakOverlayViewController *)self _initializeContainingView];
  }
  [(AXSpeakOverlayViewController *)self updateBarWithAppTitleForApp:v4];
  [(AXSpeakOverlayControlBar *)self->_bar showLoading];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"showUI" object:0];
  [(UIVisualEffectView *)self->_containingView alpha];
  if (v7 == 0.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_14B40;
    v8[3] = &unk_28710;
    v8[4] = self;
    +[UIView animateWithDuration:v8 animations:0.25];
  }
}

- (void)panToPosition:(CGPoint)a3
{
  containingView = self->_containingView;
  if (containingView)
  {
    [(UIVisualEffectView *)containingView frame];
    double v5 = self->_containingView;
    -[UIVisualEffectView setFrame:](v5, "setFrame:");
  }
}

- (void)moveBackInBounds
{
  containingView = self->_containingView;
  if (containingView)
  {
    [(UIVisualEffectView *)containingView frame];
    uint64_t v7 = v6;
    double v8 = v4;
    uint64_t v10 = v9;
    double v11 = v5;
    double v12 = 0.0;
    if (v4 >= 0.0)
    {
      double v13 = v4 + v5;
      v14 = [(AXSpeakOverlayViewController *)self view];
      [v14 bounds];
      double v16 = v15;

      BOOL v17 = v13 <= v16;
      double v12 = v8;
      if (!v17)
      {
        v18 = [(AXSpeakOverlayViewController *)self view];
        [v18 bounds];
        double v12 = v19 - v11;
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_14CE0;
    v20[3] = &unk_28AE8;
    v20[4] = self;
    v20[5] = v7;
    *(double *)&v20[6] = v8;
    v20[7] = v10;
    *(double *)&v20[8] = v11;
    *(double *)&v20[9] = v12;
    +[UIView animateWithDuration:v20 animations:0.25];
  }
}

- (void)finishLoading
{
  [(AXSpeakOverlayControlBar *)self->_bar showMainUI];
  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
  if ([(AXSpeakOverlayViewController *)self isSpeaking]) {
    [(AXSpeakOverlayViewController *)self didResume];
  }
  else {
    [(AXSpeakOverlayViewController *)self didPause];
  }
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  [v3 setCurrentState:2];

  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

- (id)highlightColorForColor:(id)a3
{
  id v3 = a3;
  UIAccessibilityNotifications v4 = +[AXSettings sharedInstance];
  id v5 = [v4 quickSpeakSentenceHighlightColor];

  double v6 = 0.2;
  if (v5) {
    double v6 = 0.5;
  }
  uint64_t v7 = [v3 colorWithAlphaComponent:v6];

  return v7;
}

- (id)sentenceHighlightColorForColor:(id)a3
{
  id v3 = a3;
  UIAccessibilityNotifications v4 = +[AXSettings sharedInstance];
  id v5 = [v4 quickSpeakSentenceHighlightColor];

  if (v5)
  {
    double v6 = +[AXSettings sharedInstance];
    [v6 quickSpeakSentenceHighlightColor];
    uint64_t v7 = +[UIColor colorWithCGColor:AXSpeakHighlightColor()];
    double v8 = [v7 colorWithAlphaComponent:0.5];
  }
  else
  {
    double v16 = 0.0;
    double v17 = 0.0;
    uint64_t v14 = 0;
    double v15 = 0.0;
    if ([v3 getRed:&v17 green:&v16 blue:&v15 alpha:&v14])
    {
      double v9 = v17 * 0.8;
      if (v17 * 0.8 < 0.0) {
        double v9 = 0.0;
      }
      double v10 = v16 * 0.8;
      if (v16 * 0.8 < 0.0) {
        double v10 = 0.0;
      }
      double v11 = v15 * 0.8;
      if (v15 * 0.8 < 0.0) {
        double v11 = 0.0;
      }
      id v12 = +[UIColor colorWithRed:v9 green:v10 blue:v11 alpha:0.2];
    }
    else
    {
      id v12 = v3;
    }
    double v8 = v12;
  }

  return v8;
}

- (UIColor)highlightColor
{
  highlightColor = self->_highlightColor;
  if (highlightColor)
  {
    id v3 = highlightColor;
  }
  else
  {
    id v3 = +[UIColor colorWithRed:0.0 green:0.33 blue:0.65 alpha:0.2];
  }

  return v3;
}

- (void)setHighlightColor:(id)a3
{
  id v9 = [(AXSpeakOverlayViewController *)self highlightColorForColor:a3];
  objc_storeStrong((id *)&self->_highlightColor, v9);
  UIAccessibilityNotifications v4 = [(AXSpeakOverlayViewController *)self highlightView];

  if (v4)
  {
    id v5 = [(AXSpeakOverlayViewController *)self highlightView];
    [v5 setSelectionColor:v9];
  }
  double v6 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];

  if (v6)
  {
    uint64_t v7 = [(AXSpeakOverlayViewController *)self sentenceHighlightColorForColor:v9];
    double v8 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
    [v8 setSelectionColor:v7];
  }
}

- (UIColor)underlineColor
{
  underlineColor = self->_underlineColor;
  if (underlineColor)
  {
    id v3 = underlineColor;
  }
  else
  {
    id v3 = +[UIColor labelColor];
  }

  return v3;
}

- (void)setUnderlineColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_underlineColor, a3);
  id v5 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];

  if (v5)
  {
    double v6 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
    [v6 setUnderlineColor:v7];
  }
}

- (void)setHighlightSelectionRects:(id)a3
{
  id v24 = a3;
  if ([v24 count])
  {
    id v5 = [(AXSpeakOverlayViewController *)self highlightView];

    if (!v5)
    {
      id v6 = objc_alloc((Class)QSSelectionHighlightView);
      id v7 = +[UIScreen mainScreen];
      [v7 bounds];
      id v8 = objc_msgSend(v6, "initWithFrame:");

      id v9 = [(AXSpeakOverlayViewController *)self highlightColor];
      [v8 setSelectionColor:v9];

      double v10 = [(AXSpeakOverlayViewController *)self view];
      [v10 insertSubview:v8 atIndex:0];

      [(AXSpeakOverlayViewController *)self setHighlightView:v8];
    }
  }
  uint64_t v11 = [(AXSpeakOverlayViewController *)self sentenceHighlightSelectionRects];
  if (v11
    && (id v12 = (void *)v11,
        +[AXSettings sharedInstance],
        double v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = (char *)[v13 quickSpeakSentenceHighlightOption],
        v13,
        v12,
        v14 == (unsigned char *)&dword_0 + 2))
  {
    double v15 = +[NSMutableArray array];
    double v16 = [(AXSpeakOverlayViewController *)self currentUnmodifiedSentenceRects];
    double v17 = [(AXSpeakOverlayViewController *)self _sliceRects:v15 withSentenceRects:v16 wordRects:v24];

    id v18 = [(NSArray *)v17 count];
    if (v18 < [v24 count])
    {
      double v19 = (NSArray *)v24;

      double v17 = v19;
    }
    v20 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
    [v20 setHighlightSelectionRects:v15];

    v21 = [(AXSpeakOverlayViewController *)self highlightView];
    [v21 setHighlightSelectionRects:v17];

    highlightSelectionRects = self->_highlightSelectionRects;
    self->_highlightSelectionRects = v17;
  }
  else
  {
    objc_storeStrong((id *)&self->_highlightSelectionRects, a3);
    double v15 = [(AXSpeakOverlayViewController *)self highlightView];
    [v15 setHighlightSelectionRects:v24];
  }

  v23 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
  [v23 updateVisualRects];
}

- (NSArray)sentenceHighlightSelectionRects
{
  v2 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
  id v3 = [v2 highlightSelectionRects];

  return (NSArray *)v3;
}

- (void)setSentenceHighlightSelectionRects:(id)a3
{
  id v24 = a3;
  if ([v24 count])
  {
    UIAccessibilityNotifications v4 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];

    if (!v4)
    {
      id v5 = objc_alloc((Class)QSSelectionHighlightView);
      id v6 = +[UIScreen mainScreen];
      [v6 bounds];
      id v7 = objc_msgSend(v5, "initWithFrame:");

      [v7 setSentenceHighlight:1];
      id v8 = [(AXSpeakOverlayViewController *)self highlightColor];
      id v9 = [(AXSpeakOverlayViewController *)self sentenceHighlightColorForColor:v8];
      [v7 setSelectionColor:v9];

      double v10 = [(AXSpeakOverlayViewController *)self underlineColor];
      [v7 setUnderlineColor:v10];

      uint64_t v11 = [(AXSpeakOverlayViewController *)self highlightView];

      id v12 = [(AXSpeakOverlayViewController *)self view];
      double v13 = v12;
      if (v11)
      {
        uint64_t v14 = [(AXSpeakOverlayViewController *)self highlightView];
        [v13 insertSubview:v7 belowSubview:v14];
      }
      else
      {
        [v12 insertSubview:v7 atIndex:0];
      }

      [(AXSpeakOverlayViewController *)self setSentenceHighlightView:v7];
    }
  }
  uint64_t v15 = [(AXSpeakOverlayViewController *)self highlightSelectionRects];
  if (v15
    && (double v16 = (void *)v15,
        +[AXSettings sharedInstance],
        double v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = (char *)[v17 quickSpeakSentenceHighlightOption],
        v17,
        v16,
        v18 == (unsigned char *)&dword_0 + 2))
  {
    double v19 = +[NSMutableArray array];
    v20 = [(AXSpeakOverlayViewController *)self highlightSelectionRects];
    v21 = [(AXSpeakOverlayViewController *)self _sliceRects:v19 withSentenceRects:v24 wordRects:v20];

    v22 = [(AXSpeakOverlayViewController *)self highlightView];
    [v22 setHighlightSelectionRects:v21];

    v23 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
    [v23 setHighlightSelectionRects:v19];
  }
  else
  {
    double v19 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
    [v19 setHighlightSelectionRects:v24];
  }

  [(AXSpeakOverlayViewController *)self setCurrentUnmodifiedSentenceRects:v24];
}

- (id)_sliceRects:(id)a3 withSentenceRects:(id)a4 wordRects:(id)a5
{
  id v72 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    +[NSMutableArray array];
    id v62 = v7;
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v7;
    id v73 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (!v73) {
      goto LABEL_48;
    }
    uint64_t v71 = *(void *)v79;
    while (1)
    {
      for (i = 0; i != v73; i = (char *)i + 1)
      {
        if (*(void *)v79 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        objc_msgSend(v11, "rectValue", v62);
        double v13 = v12;
        uint64_t v14 = +[NSMutableArray array];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v15 = v9;
        id v16 = [v15 countByEnumeratingWithState:&v74 objects:v82 count:16];
        if (!v16)
        {

LABEL_45:
          [v72 addObject:v11];
          goto LABEL_46;
        }
        id v17 = v16;
        id v18 = v9;
        char v19 = 0;
        float v20 = v13;
        float v70 = v20;
        uint64_t v21 = *(void *)v75;
        double v22 = 1.17549435e-38;
        double v23 = 3.40282347e38;
        double v24 = 3.40282347e38;
        double v25 = 1.17549435e-38;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v75 != v21) {
              objc_enumerationMutation(v15);
            }
            v27 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
            [v11 rectValue];
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            [v27 rectValue];
            AX_CGRectGetCenter();
            v85.x = v36;
            v85.y = v37;
            v86.origin.x = v29;
            v86.origin.y = v31;
            v86.size.width = v33;
            v86.size.height = v35;
            if (CGRectContainsPoint(v86, v85))
            {
              if ((v19 & 1) == 0) {
                [v14 addObject:v27];
              }
              [v27 rectValue];
              if (v23 >= v38) {
                double v23 = v38;
              }
              [v27 rectValue];
              double Width = CGRectGetWidth(v87);
              if (v25 < Width) {
                double v25 = Width;
              }
              [v27 rectValue];
              double MinY = CGRectGetMinY(v88);
              if (v24 >= MinY) {
                double v24 = MinY;
              }
              [v27 rectValue];
              double MaxY = CGRectGetMaxY(v89);
              if (v22 < MaxY) {
                double v22 = MaxY;
              }
              char v19 = 1;
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v74 objects:v82 count:16];
        }
        while (v17);

        id v9 = v18;
        if ((v19 & 1) == 0) {
          goto LABEL_45;
        }
        [v11 rectValue];
        float Height = CGRectGetHeight(v90);
        double v43 = Height;
        if (v22 - v24 >= Height) {
          double v44 = Height;
        }
        else {
          double v44 = v22 - v24;
        }
        if (v44 < 0.0) {
          double v44 = v43;
        }
        double v65 = v44;
        [v11 rectValue];
        float v46 = v45;
        double v47 = v46;
        if (v23 >= v46) {
          double v48 = v23;
        }
        else {
          double v48 = v46;
        }
        double v49 = v70;
        if (v24 <= v70) {
          double v50 = v70;
        }
        else {
          double v50 = v24;
        }
        double v66 = vabdd_f64(v47, v48);
        [v11 rectValue];
        double v51 = CGRectGetWidth(v91);
        v92.origin.x = v47;
        v92.origin.y = v70;
        v92.size.width = v66;
        v92.size.height = v43;
        double v67 = vabdd_f64(v51 - CGRectGetWidth(v92), v25);
        v93.origin.x = v48;
        v93.origin.y = v50;
        v93.size.width = v25;
        v93.size.height = v65;
        double v52 = CGRectGetMinY(v93) - v49;
        if (v52 < 0.0) {
          double v52 = 0.0;
        }
        double v68 = v52;
        v94.origin.x = v48;
        v94.origin.y = v50;
        v94.size.width = v25;
        v94.size.height = v65;
        double v69 = CGRectGetMaxY(v94);
        [v11 rectValue];
        double v53 = CGRectGetMaxY(v95);
        v96.origin.x = v48;
        v96.origin.y = v50;
        v96.size.width = v25;
        v96.size.height = v65;
        double v54 = v53 - CGRectGetMaxY(v96);
        if (v54 >= 0.0) {
          double v55 = v54;
        }
        else {
          double v55 = 0.0;
        }
        v56 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v47, v49, v66, v43);
        [v72 addObject:v56];

        v57 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v25 + v48, v49, v67, v43);
        [v72 addObject:v57];

        v58 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v48, v49, v25, v68);
        [v72 addObject:v58];

        v59 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v48, v69, v25, v55);
        [v72 addObject:v59];

        v60 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", v48, v50, v25, v65);
        [v63 addObject:v60];

LABEL_46:
      }
      id v73 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
      if (!v73)
      {
LABEL_48:

        id v7 = v62;
        goto LABEL_50;
      }
    }
  }
  id v63 = v8;
LABEL_50:

  return v63;
}

- (void)_enqueueCollapseTimer
{
  id v3 = [(AXSpeakOverlayViewController *)self stateManager];
  UIAccessibilityNotifications v4 = [v3 collapseTimer];
  [v4 cancel];

  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    objc_initWeak(&location, self);
    id v5 = [(AXSpeakOverlayViewController *)self stateManager];
    id v6 = [v5 collapseTimer];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_15CE0;
    v7[3] = &unk_286E8;
    objc_copyWeak(&v8, &location);
    [v6 afterDelay:v7 processBlock:8.0];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (CGPoint)_denormalizedNubbitOriginForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = +[AXSettings sharedInstance];
  [v5 quickSpeakNubbitNormalizedPosition];
  double v7 = v6;
  double v9 = v8;

  +[AXSpeakOverlayControlBar nubbitSize];
  double v12 = v10 * -0.5 + v7 * width;
  double v13 = v11 * -0.5 + v9 * height;
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  double v14 = width - v10;
  if (v12 <= v14) {
    double v14 = v12;
  }
  if (v13 < 0.0) {
    double v13 = 0.0;
  }
  double v15 = height - v11;
  if (v13 <= v15) {
    double v15 = v13;
  }
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_saveNubbitPosition
{
  id v13 = [(AXSpeakOverlayViewController *)self view];
  [(UIVisualEffectView *)self->_containingView frame];
  double v4 = v3;
  [(UIVisualEffectView *)self->_containingView frame];
  double MaxY = CGRectGetMaxY(v15);
  +[AXSpeakOverlayControlBar nubbitSize];
  double v7 = v4 + v6 * 0.5;
  +[AXSpeakOverlayControlBar nubbitSize];
  double v9 = MaxY - v8 * 0.5;
  [v13 frame];
  double v10 = v7 / CGRectGetWidth(v16);
  [v13 frame];
  double v11 = v9 / CGRectGetHeight(v17);
  double v12 = +[AXSettings sharedInstance];
  objc_msgSend(v12, "setQuickSpeakNubbitNormalizedPosition:", v10, v11);
}

- (void)_registerNubbit
{
  [(UIVisualEffectView *)self->_containingView alpha];
  double v4 = v3;
  [(UIVisualEffectView *)self->_containingView setAlpha:1.0];
  id v5 = +[AXUIDisplayManager sharedDisplayManager];
  [v5 registerNubbit:self->_containingView delegate:self];

  containingView = self->_containingView;

  [(UIVisualEffectView *)containingView setAlpha:v4];
}

- (void)_unregisterNubbit
{
}

- (void)unregisterNubbit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[AXUIDisplayManager sharedDisplayManager];
  [v5 unregisterNubbit:self->_containingView shouldUndoFade:v3];
}

- (void)_updateForTabModeUsingSpeakFingerButton:(BOOL)a3 animated:(BOOL)a4
{
  double v5 = 0.0;
  uint64_t v9 = 3221225472;
  double v8 = _NSConcreteStackBlock;
  double v10 = sub_16090;
  double v11 = &unk_28B10;
  if (a4) {
    double v5 = 0.25;
  }
  double v12 = self;
  BOOL v13 = a3;
  +[UIView animateWithDuration:&v8 animations:v5];
  double v6 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned __int8 v7 = [v6 inTabMode];

  if ((v7 & 1) == 0) {
    [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
  }
  [(AXSpeakOverlayControlBar *)self->_bar updateNubbitGestureRecognizers];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)_updateNubbitForTabModeChange
{
  BOOL v3 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v4 = [v3 inTabMode];

  if (v4)
  {
    [(AXSpeakOverlayViewController *)self _registerNubbit];
    if (self->_nubbitMovedOutsideOfTabMode)
    {
      id v5 = +[AXUIDisplayManager sharedDisplayManager];
      [v5 pinNubbitToEdge:self->_containingView];
    }
  }
  else
  {
    [(AXSpeakOverlayViewController *)self _unregisterNubbit];
    self->_nubbitMovedOutsideOfTabMode = 0;
  }
}

- (void)temporarilyHideUI
{
}

- (void)hideWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpeakOverlayViewController *)self stateManager];
  double v6 = [v5 collapseTimer];
  [v6 cancel];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16470;
  v10[3] = &unk_28710;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_16488;
  v8[3] = &unk_28B38;
  id v9 = v4;
  id v7 = v4;
  +[UIView animateWithDuration:v10 animations:v8 completion:0.25];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)showErrorMessage:(id)a3
{
  id v5 = a3;
  [(AXSpeakOverlayViewController *)self moveBackInBounds];
  id v4 = [(AXSpeakOverlayViewController *)self stateManager];
  [v4 setCurrentState:1];

  [(AXSpeakOverlayControlBar *)self->_bar showErrorMessage:v5];
}

- (void)didPause
{
}

- (void)didResume
{
}

- (void)didStop
{
  BOOL v3 = [(AXSpeakOverlayViewController *)self highlightView];
  [v3 setHighlightSelectionRects:0];

  id v4 = [(AXSpeakOverlayViewController *)self sentenceHighlightView];
  [v4 setHighlightSelectionRects:0];

  highlightSelectionRects = self->_highlightSelectionRects;
  self->_highlightSelectionRects = 0;
}

- (void)barDidReceiveFocus
{
  id v3 = +[AXUIDisplayManager sharedDisplayManager];
  [v3 cancelNubbitFade:self->_containingView];
}

- (BOOL)isSpeaking
{
  v2 = [(AXSpeakOverlayViewController *)self delegate];
  unsigned __int8 v3 = [v2 isSpeaking];

  return v3;
}

- (double)speakingRateAsMultiplier
{
  v2 = [(AXSpeakOverlayViewController *)self delegate];
  [v2 speakingRateAsMultiplier];
  double v4 = v3;

  return v4;
}

- (void)currentSpeakingRateChanged
{
}

- (CGRect)overlayFrame
{
  [(UIVisualEffectView *)self->_containingView frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_updateTabButtonToSpeakFingerButton
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v4 = [v3 inTabMode];

  if (v4)
  {
    bar = self->_bar;
    [(AXSpeakOverlayControlBar *)bar updateForTabModeChangeUsingSpeakFingerButton:1];
  }
  else
  {
    double v6 = [(AXSpeakOverlayViewController *)self stateManager];
    id v7 = [v6 collapseTimer];
    [v7 cancel];

    [(AXSpeakOverlayViewController *)self _updateForTabModeUsingSpeakFingerButton:1 animated:0];
  }
}

- (void)_updateTabButtonToExpandCollapseButton
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v4 = [v3 inTabMode];

  if (v4)
  {
    bar = self->_bar;
    [(AXSpeakOverlayControlBar *)bar updateForTabModeChangeUsingSpeakFingerButton:0];
  }
  else
  {
    double v6 = [(AXSpeakOverlayViewController *)self stateManager];
    id v7 = [v6 collapseTimer];
    [v7 cancel];

    [(AXSpeakOverlayViewController *)self _updateForTabModeUsingSpeakFingerButton:0 animated:0];
  }
}

- (void)updateSpeakUnderFingerState:(unint64_t)a3
{
  double v5 = +[AXUIDisplayManager sharedDisplayManager];
  [v5 cancelNubbitFade:self->_containingView];

  if (a3 == 4 || a3 == 1)
  {
    double v5 = [(AXSpeakOverlayViewController *)self stateManager];
    unsigned int v6 = [v5 inTabMode];
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (a3 == 4 || a3 == 1) {

  }
  if (v6)
  {
    [(AXSpeakOverlayViewController *)self _updateTabButtonToSpeakFingerButton];
  }
  else
  {
    id v7 = [(AXSpeakOverlayViewController *)self stateManager];
    unsigned int v8 = [v7 inTabMode];

    if (v8) {
      [(AXSpeakOverlayViewController *)self _updateTabButtonToExpandCollapseButton];
    }
  }
  bar = self->_bar;
  if (a3 == 2)
  {
    [(AXSpeakOverlayControlBar *)bar changeToResumeButton];
  }
  else
  {
    [(AXSpeakOverlayControlBar *)bar changeToStopButton];
  }
}

- (void)updateGestureRecognizers
{
}

- (void)fastForwardButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 fastForwardButtonPressed];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)rewindButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 rewindButtonPressed];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)startNewReadAllFromGesture
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 startNewReadAllFromGesture];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)playButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 playButtonPressedForBundleID:0 sceneID:0 rootAccessibilityElementIdentifier:0];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)stopButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 stopButtonPressed];

  unsigned int v4 = [(AXSpeakOverlayViewController *)self stateManager];
  [v4 setCurrentAppBundleIdentifier:0];

  double v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 showSpeechController];

  if (v6)
  {
    [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
  }
}

- (void)stopSpeakFingerButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 stopSpeakFingerButtonPressed];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)pauseButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 pauseButtonPressed];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)speedButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self delegate];
  [v3 speedButtonPressed];

  [(AXSpeakOverlayViewController *)self _enqueueCollapseTimer];
}

- (void)headerTapped
{
  id v5 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v4 = [v3 currentAppBundleIdentifier];
  [v5 openApplication:v4 withOptions:0 completion:0];
}

- (void)controlBarDragged:(CGPoint)a3 gestureRecognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v22 = a4;
  [(UIVisualEffectView *)self->_containingView frame];
  double v8 = v7;
  double v10 = v9;
  double v13 = y + v12;
  double v14 = fmax(x + v11, 2.0);
  double v15 = fmax(v13, 2.0);
  CGRect v16 = [(AXSpeakOverlayViewController *)self view];
  [v16 frame];
  double v18 = v17 - v8 + -2.0;

  if (v18 < v14) {
    double v14 = v18;
  }
  char v19 = [(AXSpeakOverlayViewController *)self view];
  [v19 frame];
  double v21 = v20 - v10 + -2.0;

  if (v21 < v15) {
    double v15 = v21;
  }
  if (-[AXSpeakOverlayViewController _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v14, v15))
  {
    [v22 setState:3];
  }
  else
  {
    -[UIVisualEffectView setFrame:](self->_containingView, "setFrame:", v14, v15, v8, v10);
    self->_nubbitMovedOutsideOfTabMode = 1;
    [(AXSpeakOverlayViewController *)self setIgnoreNextNubbitPositionUpdate:0];
    [(AXSpeakOverlayViewController *)self _saveNubbitPosition];
  }
}

- (void)speakUnderFingerButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  uint64_t v4 = [v3 collapseTimer];
  [(id)v4 cancel];

  id v5 = [(AXSpeakOverlayViewController *)self stateManager];
  LOBYTE(v4) = [v5 inTabMode];

  if (v4)
  {
    unsigned int v6 = [(AXSpeakOverlayViewController *)self stateManager];
    [v6 setCurrentState:0];

    [(AXSpeakOverlayViewController *)self showUI];
  }
  else
  {
    [(AXSpeakOverlayViewController *)self collapseNubbit];
  }
  id v7 = [(AXSpeakOverlayViewController *)self delegate];
  [v7 speakUnderFingerButtonPressed];
}

- (void)tabModeButtonPressed
{
  double v3 = [(AXSpeakOverlayViewController *)self stateManager];
  uint64_t v4 = [v3 collapseTimer];
  [v4 cancel];

  id v5 = [(AXSpeakOverlayViewController *)self stateManager];
  LODWORD(v4) = [v5 inTabMode];

  if (v4) {
    [(AXSpeakOverlayViewController *)self expandNubbit];
  }
  else {
    [(AXSpeakOverlayViewController *)self collapseNubbit];
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"showUI" object:0];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXSpeakOverlayViewController;
  -[AXSpeakOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v9 = [v8 inTabMode];

  if (v9) {
    [(AXSpeakOverlayViewController *)self unregisterNubbit:0];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_17060;
  v11[3] = &unk_28B60;
  v11[4] = self;
  *(double *)&v11[5] = width;
  *(double *)&v11[6] = height;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_17150;
  v10[3] = &unk_28B88;
  v10[4] = self;
  [v7 animateAlongsideTransition:v11 completion:v10];
}

- (void)nubbitDidUpdatePosition:(id)a3
{
  if (![(AXSpeakOverlayViewController *)self ignoreNextNubbitPositionUpdate])
  {
    [(AXSpeakOverlayViewController *)self _saveNubbitPosition];
  }
}

- (void)nubbitWillBeginDragging:(id)a3
{
}

- (double)idleOpacityForNubbit:(id)a3
{
  double v3 = +[AXSettings sharedInstance];
  [v3 speechControllerIdleOpacity];
  double v5 = v4;

  return v5;
}

- (void)handleReachabilityToggled:(double)a3
{
  double v5 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v6 = [v5 inTabMode];

  if (v6) {
    [(AXSpeakOverlayViewController *)self unregisterNubbit:0];
  }
  id v7 = +[UIScreen mainScreen];
  [v7 bounds];
  double v9 = v8;

  [(UIVisualEffectView *)self->_containingView frame];
  double v10 = CGRectGetMaxY(v33) + a3;
  if (v10 <= v9)
  {
    if (a3 == 0.0)
    {
      [(AXSpeakOverlayViewController *)self reachabilityOffset];
      if (v20 != 0.0)
      {
        [(UIVisualEffectView *)self->_containingView frame];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        [(AXSpeakOverlayViewController *)self reachabilityOffset];
        -[UIVisualEffectView setFrame:](self->_containingView, "setFrame:", v22, v24 - v29, v26, v28);
        [(AXSpeakOverlayViewController *)self _saveNubbitPosition];
        [(AXSpeakOverlayViewController *)self setReachabilityOffset:0.0];
      }
    }
  }
  else
  {
    [(AXSpeakOverlayViewController *)self setReachabilityOffset:v9 - v10];
    [(UIVisualEffectView *)self->_containingView frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(AXSpeakOverlayViewController *)self reachabilityOffset];
    -[UIVisualEffectView setFrame:](self->_containingView, "setFrame:", v12, v19 + v14, v16, v18);
    [(AXSpeakOverlayViewController *)self _saveNubbitPosition];
  }
  double v30 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v31 = [v30 inTabMode];

  if (v31)
  {
    [(AXSpeakOverlayViewController *)self _registerNubbit];
  }
}

- (void)handleKBFrameWillUpdate:(id)a3
{
  id v4 = a3;
  double v5 = [(AXSpeakOverlayViewController *)self stateManager];
  unsigned int v6 = [v5 inTabMode];

  if (v6) {
    [(AXSpeakOverlayViewController *)self unregisterNubbit:0];
  }
  id v7 = [v4 objectForKeyedSubscript:STSMessageKeyKBFrame];
  CGRect v22 = CGRectFromString(v7);
  CGFloat x = v22.origin.x;
  double y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;

  if (fabs(y) >= 2.22044605e-16)
  {
    double v14 = [v4 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
    [v14 floatValue];
    double v16 = v15;

    double v17 = [v4 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
    double v18 = (char *)[v17 unsignedIntegerValue];

    if ((unint64_t)(v18 - 1) >= 6) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = ((void)(v18 - 1) << 16) + 0x10000;
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_175FC;
    v21[3] = &unk_28BB0;
    v21[4] = self;
    *(CGFloat *)&v21[5] = x;
    *(double *)&v21[6] = y;
    *(CGFloat *)&v21[7] = width;
    *(CGFloat *)&v21[8] = height;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_17854;
    v20[3] = &unk_28968;
    v20[4] = self;
    +[UIView animateWithDuration:v19 delay:v21 options:v20 animations:v16 completion:0.0];
  }
  else
  {
    double v12 = [(AXSpeakOverlayViewController *)self stateManager];
    unsigned int v13 = [v12 inTabMode];

    if (v13) {
      [(AXSpeakOverlayViewController *)self _registerNubbit];
    }
  }
}

- (void)uiStateChanged
{
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v30 = a3;
  [(UIVisualEffectView *)self->_containingView frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([v30 count] == (char *)&dword_0 + 1)
  {
    double v12 = [v30 objectAtIndexedSubscript:0];
    [v12 CGRectValue];
    self->_foreheadRect.origin.CGFloat x = v13;
    self->_foreheadRect.origin.double y = v14;
    self->_foreheadRect.size.CGFloat width = v15;
    self->_foreheadRect.size.CGFloat height = v16;
  }
  else
  {
    if ([v30 count] != (char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    double v12 = [v30 objectAtIndexedSubscript:0];
    [v12 CGRectValue];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    double v25 = [v30 objectAtIndexedSubscript:1];
    [v25 CGRectValue];
    v33.origin.CGFloat x = v26;
    v33.origin.double y = v27;
    v33.size.CGFloat width = v28;
    v33.size.CGFloat height = v29;
    v32.origin.CGFloat x = v18;
    v32.origin.double y = v20;
    v32.size.CGFloat width = v22;
    v32.size.CGFloat height = v24;
    self->_foreheadRect = CGRectUnion(v32, v33);
  }
LABEL_6:
  if (-[AXSpeakOverlayViewController _axIsPointInForeheadRect:](self, "_axIsPointInForeheadRect:", v5, v7)) {
    -[UIVisualEffectView setFrame:](self->_containingView, "setFrame:", v5, self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0, v9, v11);
  }
}

- (BOOL)_axIsPointInForeheadRect:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [(AXSpeakOverlayViewController *)self view];
  double v6 = [v5 window];
  if ([v6 interfaceOrientation] == (char *)&dword_0 + 1
    && self->_foreheadRect.origin.y + self->_foreheadRect.size.height + 2.0 >= y)
  {
    char HasJindo = AXDeviceHasJindo();
  }
  else
  {
    char HasJindo = 0;
  }

  return HasJindo;
}

- (AXSpeakOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSpeakOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)highlightSelectionRects
{
  return self->_highlightSelectionRects;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (AXSpeakOverlayControlBar)bar
{
  return self->_bar;
}

- (void)setBar:(id)a3
{
}

- (QSSelectionHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (QSSelectionHighlightView)sentenceHighlightView
{
  return self->_sentenceHighlightView;
}

- (void)setSentenceHighlightView:(id)a3
{
}

- (CGPoint)nubbitMoveStartPosition
{
  double x = self->_nubbitMoveStartPosition.x;
  double y = self->_nubbitMoveStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNubbitMoveStartPosition:(CGPoint)a3
{
  self->_nubbitMoveStartPosition = a3;
}

- (CGPoint)gestureMoveStartPosition
{
  double x = self->_gestureMoveStartPosition.x;
  double y = self->_gestureMoveStartPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGestureMoveStartPosition:(CGPoint)a3
{
  self->_gestureMoveStartPosition = a3;
}

- (NSArray)currentUnmodifiedSentenceRects
{
  return self->_currentUnmodifiedSentenceRects;
}

- (void)setCurrentUnmodifiedSentenceRects:(id)a3
{
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (BOOL)ignoreNextNubbitPositionUpdate
{
  return self->_ignoreNextNubbitPositionUpdate;
}

- (void)setIgnoreNextNubbitPositionUpdate:(BOOL)a3
{
  self->_ignoreNextNubbitPositionUpdate = a3;
}

- (SpeakThisUIStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_currentUnmodifiedSentenceRects, 0);
  objc_storeStrong((id *)&self->_sentenceHighlightView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_bar, 0);
  objc_storeStrong((id *)&self->_highlightSelectionRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlineColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);

  objc_storeStrong((id *)&self->_containingView, 0);
}

@end