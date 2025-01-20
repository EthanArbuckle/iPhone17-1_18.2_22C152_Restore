@interface ARCoachingOverlayView
- (ARCoachingGoal)goal;
- (ARCoachingOverlayView)initWithCoder:(id)a3;
- (ARCoachingOverlayView)initWithFrame:(CGRect)a3;
- (ARCoachingSessionCache)coachingSessionCache;
- (ARSession)session;
- (BOOL)activatesAutomatically;
- (BOOL)checkActivationHeuristics;
- (BOOL)checkDeactivationHeuristics;
- (BOOL)geoTrackingStateOverrideEnabled;
- (BOOL)geoTrackingStateReasonOverrideEnabled;
- (BOOL)hideCoachingMessageLabel;
- (BOOL)isActive;
- (BOOL)isRelocalizing;
- (BOOL)isUIAnimating;
- (BOOL)trackingStateNormalOverride;
- (BOOL)wasEverActivated;
- (CGSize)intrinsicContentSize;
- (NSObject)sessionProvider;
- (double)calcFadeDurationIn:(BOOL)a3 withButton:(BOOL)a4;
- (float)resetButtonLandscapeVerticalOffset;
- (float)resetButtonPortraitVerticalOffset;
- (id)delegate;
- (id)frameWithOverrides:(id)a3;
- (int64_t)currentDeviceOrientation;
- (int64_t)geoTrackingStateOverride;
- (int64_t)geoTrackingStateReasonOverride;
- (int64_t)trackingStateReasonOverride;
- (void)buttonPress:(id)a3;
- (void)createConstraintsForDeviceOrientation:(int64_t)a3;
- (void)crossFadeCoachingMessage:(int64_t)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)doStateAction:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fadeInWithButton:(BOOL)a3;
- (void)fadeOut;
- (void)finishAllUIAnimations;
- (void)generateHeuristicsForActive:(BOOL)a3;
- (void)killUIAnimations;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)orientationChanged;
- (void)resolveCoachingMessageWithFrame:(id)a3;
- (void)restartIfActive;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)setActivatesAutomatically:(BOOL)activatesAutomatically;
- (void)setActive:(BOOL)active animated:(BOOL)animated;
- (void)setCoachingMessage:(int64_t)a3 animationState:(int64_t)a4;
- (void)setDelegate:(id)delegate;
- (void)setGeoTrackingStateOverride:(int64_t)a3;
- (void)setGeoTrackingStateOverrideEnabled:(BOOL)a3;
- (void)setGeoTrackingStateReasonOverride:(int64_t)a3;
- (void)setGeoTrackingStateReasonOverrideEnabled:(BOOL)a3;
- (void)setGoal:(ARCoachingGoal)goal;
- (void)setHideCoachingMessageLabel:(BOOL)a3;
- (void)setResetButtonLandscapeVerticalOffset:(float)a3;
- (void)setResetButtonPortraitVerticalOffset:(float)a3;
- (void)setSession:(ARSession *)session;
- (void)setSessionProvider:(NSObject *)sessionProvider;
- (void)setTrackingStateNormalOverride:(BOOL)a3;
- (void)setTrackingStateReasonOverride:(int64_t)a3;
- (void)setupView;
- (void)startup;
- (void)swapState:(id)a3;
- (void)teardown;
- (void)updateCoachingMessagingWithMotionTracker:(BOOL)a3 frame:(id)a4;
- (void)updateConstraints;
- (void)updateFromDisplayLink;
- (void)updateUIAnimations;
- (void)updateWithFrame:(id)a3;
@end

@implementation ARCoachingOverlayView

- (ARCoachingOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingOverlayView;
  v3 = -[ARCoachingOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ARCoachingOverlayView *)v3 setupView];
  }
  return v4;
}

- (ARCoachingOverlayView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARCoachingOverlayView;
  v5 = [(ARCoachingOverlayView *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(ARCoachingOverlayView *)v5 setupView];
    if ([v4 containsValueForKey:@"goal"]) {
      -[ARCoachingOverlayView setGoal:](v6, "setGoal:", [v4 decodeIntegerForKey:@"goal"]);
    }
    if ([v4 containsValueForKey:@"activatesAutomatically"]) {
      -[ARCoachingOverlayView setActivatesAutomatically:](v6, "setActivatesAutomatically:", [v4 decodeBoolForKey:@"activatesAutomatically"]);
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARCoachingOverlayView;
  id v4 = a3;
  [(ARCoachingOverlayView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goal, @"goal", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_activatesAutomatically forKey:@"activatesAutomatically"];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = _ARLogCoaching_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deallocate the overlay", buf, 0x16u);
  }
  [(ARSession *)self->_session _removeObserver:self];
  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1D1B0] object:0];

  v7.receiver = self;
  v7.super_class = (Class)ARCoachingOverlayView;
  [(ARCoachingOverlayView *)&v7 dealloc];
}

- (void)setupView
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v3 = _ARLogCoaching_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v71 = v5;
    __int16 v72 = 2048;
    v73 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Set up the overlay", buf, 0x16u);
  }
  self->_goal = 0;
  self->_requestedGoal = 0;
  self->_activatesAutomatically = 1;
  objc_super v6 = objc_alloc_init(ARCoachingHeuristicCollection);
  heuristics = self->_heuristics;
  self->_heuristics = v6;

  objc_super v8 = objc_alloc_init(ARCoachingMotionTracker);
  motionTracker = self->_motionTracker;
  self->_motionTracker = v8;

  __int16 v10 = objc_alloc_init(ARCoachingSessionCache);
  coachingSessionCache = self->_coachingSessionCache;
  self->_coachingSessionCache = v10;

  uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uiAnimationQueue = self->_uiAnimationQueue;
  self->_uiAnimationQueue = v12;

  self->_currentConstraintDeviceOrientation = 0;
  self->_resetButtonLandscapeVerticalOffset = 80.0;
  self->_resetButtonPortraitVerticalOffset = 80.0;
  v14 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  background = self->_background;
  self->_background = v14;

  v16 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
  [(UIView *)self->_background setBackgroundColor:v16];

  [(UIView *)self->_background setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = objc_alloc_init(ARCoachingAnimationView);
  coachingAnimationView = self->_coachingAnimationView;
  self->_coachingAnimationView = v17;

  [(ARCoachingAnimationView *)self->_coachingAnimationView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  coachingText = self->_coachingText;
  self->_coachingText = v19;

  v21 = [MEMORY[0x263F1C550] whiteColor];
  [(UILabel *)self->_coachingText setTextColor:v21];

  v22 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  [(UILabel *)self->_coachingText setFont:v22];

  [(UILabel *)self->_coachingText setTextAlignment:1];
  [(UILabel *)self->_coachingText setNumberOfLines:0];
  [(UILabel *)self->_coachingText setLineBreakMode:0];
  [(UILabel *)self->_coachingText setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [ARCoachingPillButton alloc];
  v24 = ARKitCoreBundle();
  v25 = [v24 localizedStringForKey:@"Start Over" value:&stru_26BF5E748 table:@"Localizable_iOS"];
  v26 = [(ARCoachingRoundedButton *)v23 initWithTitle:v25 buttonStyle:0 textStyle:1 controlStyle:2 adjustsFontForContentSizeCategory:1];
  resetButton = self->_resetButton;
  self->_resetButton = v26;

  [(ARCoachingPillButton *)self->_resetButton setTranslatesAutoresizingMaskIntoConstraints:0];
  -[ARCoachingButton setContentEdgeInsets:](self->_resetButton, "setContentEdgeInsets:", 12.0, 20.0, 12.0, 20.0);
  [(ARCoachingButton *)self->_resetButton addTarget:self action:sel_buttonPress_ forControlEvents:64];
  [(ARCoachingOverlayView *)self addSubview:self->_background];
  [(ARCoachingOverlayView *)self addSubview:self->_coachingAnimationView];
  [(ARCoachingOverlayView *)self addSubview:self->_coachingText];
  [(ARCoachingOverlayView *)self addSubview:self->_resetButton];
  v28 = [(UILabel *)self->_coachingText leftAnchor];
  v29 = [(ARCoachingOverlayView *)self centerXAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:-154.0];
  coachingTextLeftAnchorConstraint = self->_coachingTextLeftAnchorConstraint;
  self->_coachingTextLeftAnchorConstraint = v30;

  v32 = [(UILabel *)self->_coachingText rightAnchor];
  v33 = [(ARCoachingOverlayView *)self centerXAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:154.0];
  coachingTextRightAnchorConstraint = self->_coachingTextRightAnchorConstraint;
  self->_coachingTextRightAnchorConstraint = v34;

  if (ARDeviceIsiPad()) {
    double v36 = 100.0;
  }
  else {
    double v36 = 75.0;
  }
  v57 = (void *)MEMORY[0x263F08938];
  v68 = [(UIView *)self->_background centerXAnchor];
  v67 = [(ARCoachingOverlayView *)self centerXAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v69[0] = v66;
  v65 = [(UIView *)self->_background centerYAnchor];
  v64 = [(ARCoachingOverlayView *)self centerYAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v69[1] = v63;
  v62 = [(ARCoachingAnimationView *)self->_coachingAnimationView leftAnchor];
  v61 = [(ARCoachingOverlayView *)self leftAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v69[2] = v60;
  v59 = [(ARCoachingAnimationView *)self->_coachingAnimationView topAnchor];
  v58 = [(ARCoachingOverlayView *)self topAnchor];
  v56 = [v59 constraintEqualToAnchor:v58];
  v69[3] = v56;
  v55 = [(ARCoachingAnimationView *)self->_coachingAnimationView rightAnchor];
  v54 = [(ARCoachingOverlayView *)self rightAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v69[4] = v53;
  v52 = [(ARCoachingAnimationView *)self->_coachingAnimationView bottomAnchor];
  v51 = [(ARCoachingOverlayView *)self bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v37 = self->_coachingTextLeftAnchorConstraint;
  v69[5] = v50;
  v69[6] = v37;
  v69[7] = self->_coachingTextRightAnchorConstraint;
  v49 = [(UILabel *)self->_coachingText topAnchor];
  v38 = [(ARCoachingOverlayView *)self centerYAnchor];
  v39 = [v49 constraintEqualToAnchor:v38 constant:v36];
  v69[8] = v39;
  v40 = [(ARCoachingPillButton *)self->_resetButton centerXAnchor];
  v41 = [(ARCoachingOverlayView *)self centerXAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v69[9] = v42;
  v43 = [(ARCoachingPillButton *)self->_resetButton topAnchor];
  v44 = [(UILabel *)self->_coachingText bottomAnchor];
  v45 = [v43 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v44 multiplier:1.0];
  v69[10] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:11];
  [v57 activateConstraints:v46];

  v47 = [MEMORY[0x263F08A00] defaultCenter];
  [v47 addObserver:self selector:sel_orientationChanged name:*MEMORY[0x263F1D1B0] object:0];

  v48 = [[ARCoachingStateHidden alloc] initWithView:self];
  [(ARCoachingOverlayView *)self swapState:v48];
}

- (void)setSessionProvider:(NSObject *)sessionProvider
{
  obj = sessionProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionProvider);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_sessionProvider);
    [v5 removeObserver:self forKeyPath:@"session" context:kARCoachingSessionProviderSessionContext];

    id v6 = objc_storeWeak((id *)&self->_sessionProvider, obj);
    [obj addObserver:self forKeyPath:@"session" options:4 context:kARCoachingSessionProviderSessionContext];
  }
}

- (void)setSession:(ARSession *)session
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = session;
  p_session = &self->_session;
  objc_super v7 = self->_session;
  if (v7 != v5)
  {
    [(ARSession *)v7 _removeObserver:self];
    objc_storeStrong((id *)&self->_session, session);
    [(ARSession *)*p_session _addObserver:self];
    [(ARCoachingSessionCache *)self->_coachingSessionCache sessionChanged];
    if (isSessionValidForCoaching((uint64_t)*p_session))
    {
      self->_goal = validateCoachingGoalForSession(self->_requestedGoal, *p_session);
      objc_super v8 = _ARLogCoaching_2();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (objc_class *)objc_opt_class();
        __int16 v10 = NSStringFromClass(v9);
        int v14 = 138543618;
        v15 = v10;
        __int16 v16 = 2048;
        v17 = self;
        _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching due to session change", (uint8_t *)&v14, 0x16u);
      }
      [(ARCoachingOverlayView *)self restartIfActive];
    }
    else
    {
      v11 = _ARLogCoaching_2();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v14 = 138543618;
        v15 = v13;
        __int16 v16 = 2048;
        v17 = self;
        _os_log_impl(&dword_20B202000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deactivating coaching due to invalid session", (uint8_t *)&v14, 0x16u);
      }
      [(ARCoachingOverlayView *)self setActive:0 animated:0];
    }
  }
}

- (void)setGoal:(ARCoachingGoal)goal
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int64_t v4 = self->_goal;
  self->_requestedGoal = goal;
  int64_t v5 = validateCoachingGoalForSession(goal, self->_session);
  self->_goal = v5;
  if (v4 != v5)
  {
    id v6 = _ARLogCoaching_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_super v7 = (objc_class *)objc_opt_class();
      objc_super v8 = NSStringFromClass(v7);
      int v9 = 138543618;
      __int16 v10 = v8;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl(&dword_20B202000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching due to goal change", (uint8_t *)&v9, 0x16u);
    }
    [(ARCoachingOverlayView *)self restartIfActive];
  }
}

- (BOOL)isActive
{
  return [(ARCoachingState *)self->_state isViewActiveForState];
}

- (void)setActive:(BOOL)active animated:(BOOL)animated
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (active)
  {
    if (isSessionValidForCoaching((uint64_t)self->_session))
    {
      if ([(ARCoachingOverlayView *)self isRelocalizing]) {
        uint64_t v6 = 5;
      }
      else {
        uint64_t v6 = 1;
      }
      [(ARCoachingOverlayView *)self doStateAction:v6];
      if (!animated)
      {
        [(ARCoachingOverlayView *)self doStateAction:6];
        [(ARCoachingOverlayView *)self finishAllUIAnimations];
      }
    }
    else
    {
      objc_super v8 = _ARLogCoaching_2();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = (objc_class *)objc_opt_class();
        __int16 v10 = NSStringFromClass(v9);
        int v11 = 138543618;
        uint64_t v12 = v10;
        __int16 v13 = 2048;
        int v14 = self;
        _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Coaching requires an AR session, and must be run on a supported device. Run a session with a valid configuration, and set session or sessionProvider before activation.", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    if (animated) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
    [(ARCoachingOverlayView *)self doStateAction:v7];
  }
}

- (CGSize)intrinsicContentSize
{
  [(ARCoachingAnimationView *)self->_coachingAnimationView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setResetButtonLandscapeVerticalOffset:(float)a3
{
  self->_resetButtonLandscapeVerticalOffset = a3;
  self->_currentConstraintDeviceOrientation = 0;
  [(ARCoachingOverlayView *)self setNeedsUpdateConstraints];
}

- (void)setResetButtonPortraitVerticalOffset:(float)a3
{
  self->_resetButtonPortraitVerticalOffset = a3;
  self->_currentConstraintDeviceOrientation = 0;
  [(ARCoachingOverlayView *)self setNeedsUpdateConstraints];
}

- (BOOL)isUIAnimating
{
  return [(NSMutableArray *)self->_uiAnimationQueue count] != 0;
}

- (BOOL)isRelocalizing
{
  if (self->_trackingStateReasonOverride == 4) {
    return 1;
  }
  int64_t v4 = [(ARSession *)self->_session currentFrame];
  int64_t v5 = v4;
  if (self->_isSessionRelocalizingMap || v4 == 0)
  {
    BOOL v2 = 0;
  }
  else
  {
    uint64_t v7 = [v4 camera];
    if ([v7 trackingState] == 1)
    {
      objc_super v8 = [v5 camera];
      BOOL v2 = [v8 trackingStateReason] == 4;
    }
    else
    {
      BOOL v2 = 0;
    }
  }
  return v2;
}

- (void)startup
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = _ARLogCoaching_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    int64_t v5 = NSStringFromClass(v4);
    int v14 = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Start rendering the overlay", (uint8_t *)&v14, 0x16u);
  }
  kdebug_trace();
  self->_wasEverActivated = 1;
  self->_isSessionRelocalizingMap = isSessionLoadingMap(self->_session);
  [(ARCoachingOverlayView *)self generateHeuristicsForActive:1];
  [(ARCoachingAnimationView *)self->_coachingAnimationView startCoachingAnimation:self->_goal];
  [(ARCoachingMotionTracker *)self->_motionTracker clear];
  [(ARCoachingSessionCache *)self->_coachingSessionCache clear];
  self->_nextCoachingMessageType = 0;
  uint64_t v6 = [(ARSession *)self->_session metrics];
  [v6 recordCoachingOverlayUsage:LODWORD(self->_goal)];

  uint64_t v7 = [ARCoachingFrame alloc];
  objc_super v8 = [(ARSession *)self->_session currentFrame];
  int v9 = [(ARCoachingFrame *)v7 initWithFrame:v8];

  [(ARCoachingHeuristicCollection *)self->_heuristics updateWithFrame:v9 cache:self->_coachingSessionCache];
  [(ARCoachingMotionTracker *)self->_motionTracker updateWithFrame:v9];
  [(ARCoachingOverlayView *)self updateCoachingMessagingWithMotionTracker:1 frame:v9];
  [(ARCoachingOverlayView *)self setNeedsUpdateConstraints];
  if (!self->_displayLink)
  {
    __int16 v10 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_updateFromDisplayLink];
    displayLink = self->_displayLink;
    self->_displayLink = v10;

    uint64_t v12 = self->_displayLink;
    __int16 v13 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v12 addToRunLoop:v13 forMode:*MEMORY[0x263EFF478]];
  }
}

- (void)didMoveToWindow
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)ARCoachingOverlayView;
  [(ARCoachingOverlayView *)&v11 didMoveToWindow];
  double v3 = [(ARCoachingOverlayView *)self window];

  if (v3)
  {
    if (self->_displayLink) {
      return;
    }
    int64_t v4 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_updateFromDisplayLink];
    displayLink = self->_displayLink;
    self->_displayLink = v4;

    uint64_t v6 = self->_displayLink;
    uint64_t v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF478]];
  }
  else
  {
    objc_super v8 = _ARLogCoaching_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = (objc_class *)objc_opt_class();
      __int16 v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tearing down because the view no longer has a window.", buf, 0x16u);
    }
    [(CADisplayLink *)self->_displayLink invalidate];
    uint64_t v7 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)teardown
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v3 = _ARLogCoaching_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t v4 = (objc_class *)objc_opt_class();
    int64_t v5 = NSStringFromClass(v4);
    int v10 = 138543618;
    objc_super v11 = v5;
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stop rendering the overlay", (uint8_t *)&v10, 0x16u);
  }
  kdebug_trace();
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  [(ARCoachingOverlayView *)self killUIAnimations];
  [(ARCoachingOverlayView *)self generateHeuristicsForActive:0];
  [(ARCoachingAnimationView *)self->_coachingAnimationView killCoachingAnimation];
  [(UIView *)self->_background setAlpha:0.0];
  [(UILabel *)self->_coachingText setAlpha:0.0];
  [(ARCoachingPillButton *)self->_resetButton setAlpha:0.0];
  [(ARCoachingPillButton *)self->_resetButton setHidden:1];
  self->_nextCoachingMessageType = 0;
  uint64_t v7 = [ARCoachingFrame alloc];
  objc_super v8 = [(ARSession *)self->_session currentFrame];
  int v9 = [(ARCoachingFrame *)v7 initWithFrame:v8];

  [(ARCoachingHeuristicCollection *)self->_heuristics updateWithFrame:v9 cache:self->_coachingSessionCache];
}

- (void)fadeInWithButton:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_goal == 4) {
    [(ARCoachingAnimationView *)self->_coachingAnimationView setAlpha:0.0];
  }
  [(ARCoachingOverlayView *)self calcFadeDurationIn:1 withButton:v3];
  double v6 = v5;
  id v7 = objc_alloc(MEMORY[0x263F1CB78]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke;
  v13[3] = &unk_264000B80;
  v13[4] = self;
  objc_super v8 = (void *)[v7 initWithDuration:2 curve:v13 animations:v6];
  int v9 = v8;
  if (v3)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_2;
    v12[3] = &unk_264000B80;
    v12[4] = self;
    [v8 addAnimations:v12];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_3;
    v11[3] = &unk_264000B80;
    v11[4] = self;
    [v8 addAnimations:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_4;
    v10[3] = &unk_264000C70;
    v10[4] = self;
    [v9 addCompletion:v10];
  }
  [(NSMutableArray *)self->_uiAnimationQueue addObject:v9];
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 600) == 4)
  {
    int64_t v4 = *(void **)(v3 + 536);
    return [v4 setAlpha:1.0];
  }
  return result;
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setHidden:0];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 424);

  return [v2 setAlpha:1.0];
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

uint64_t __42__ARCoachingOverlayView_fadeInWithButton___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setHidden:1];
}

- (void)fadeOut
{
  double v3 = CACurrentMediaTime();
  double lastCoachingUpdateTime = self->_lastCoachingUpdateTime;
  unint64_t v5 = [(ARCoachingAnimationView *)self->_coachingAnimationView animationState];
  BOOL v6 = v5 > 6 || ((1 << v5) & 0x52) == 0;
  double v7 = fmax(lastCoachingUpdateTime - v3 + 1.0, 0.0);
  if (v6) {
    double v8 = 0.3;
  }
  else {
    double v8 = v7;
  }
  -[ARCoachingAnimationView setAnimationState:](self->_coachingAnimationView, "setAnimationState:", 6, 0.3);
  int v9 = [(UIViewPropertyAnimator *)[ARCoachingDelayedAnimation alloc] initWithDuration:3 curve:&__block_literal_global_10 animations:0.0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_2;
  v16[3] = &unk_264000C70;
  v16[4] = self;
  [(UIViewPropertyAnimator *)v9 addCompletion:v16];
  [(ARCoachingDelayedAnimation *)v9 setCoachingDelayTime:v3 + v8];
  [(ARCoachingOverlayView *)self calcFadeDurationIn:0 withButton:0];
  double v11 = v10;
  id v12 = objc_alloc(MEMORY[0x263F1CB78]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_3;
  v15[3] = &unk_264000B80;
  v15[4] = self;
  __int16 v13 = (void *)[v12 initWithDuration:1 curve:v15 animations:v11];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __32__ARCoachingOverlayView_fadeOut__block_invoke_4;
  v14[3] = &unk_264000C70;
  v14[4] = self;
  [v13 addCompletion:v14];
  [(NSMutableArray *)self->_uiAnimationQueue addObject:v9];
  [(NSMutableArray *)self->_uiAnimationQueue addObject:v13];
}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setAnimationState:1];
}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 600) == 4)
  {
    int64_t v4 = *(void **)(v3 + 536);
    return [v4 setAlpha:0.0];
  }
  return result;
}

uint64_t __32__ARCoachingOverlayView_fadeOut__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setHidden:1];
}

- (BOOL)checkActivationHeuristics
{
  if (self->_activatesAutomatically) {
    return ![(ARCoachingHeuristic *)self->_heuristics satisfied];
  }
  else {
    return 0;
  }
}

- (BOOL)checkDeactivationHeuristics
{
  return self->_activatesAutomatically && [(ARCoachingHeuristic *)self->_heuristics satisfied];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  BOOL v6 = [[ARCoachingFrame alloc] initWithFrame:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__ARCoachingOverlayView_session_didUpdateFrame___block_invoke;
  v8[3] = &unk_264000BD0;
  v8[4] = self;
  int v9 = v6;
  double v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __48__ARCoachingOverlayView_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frameWithOverrides:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateWithFrame:v2];
}

- (id)frameWithOverrides:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_trackingStateNormalOverride)
  {
    id v5 = _ARLogCoaching_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      int v32 = 138543618;
      v33 = v7;
      __int16 v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame tracking state to be .normal", (uint8_t *)&v32, 0x16u);
    }
    double v8 = [v4 camera];
    [v8 setTrackingState:2];

    int v9 = [v4 camera];
    double v10 = v9;
    int64_t v11 = 0;
  }
  else
  {
    if (!self->_trackingStateReasonOverride)
    {
      if (!self->_geoTrackingStateOverrideEnabled && !self->_geoTrackingStateReasonOverrideEnabled) {
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    id v12 = _ARLogCoaching_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v32 = 138543618;
      v33 = v14;
      __int16 v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_20B202000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame tracking state to be .limited", (uint8_t *)&v32, 0x16u);
    }
    uint64_t v15 = [v4 camera];
    [v15 setTrackingState:1];

    int64_t trackingStateReasonOverride = self->_trackingStateReasonOverride;
    int v9 = [v4 camera];
    double v10 = v9;
    int64_t v11 = trackingStateReasonOverride;
  }
  [v9 setTrackingStateReason:v11];

LABEL_10:
  v17 = [v4 geoTrackingStatus];

  if (!v17)
  {
    uint64_t v18 = [MEMORY[0x263F20EB0] initialStatus];
    [v4 setGeoTrackingStatus:v18];
  }
  if (self->_geoTrackingStateOverrideEnabled)
  {
    v19 = _ARLogCoaching_2();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      int64_t geoTrackingStateOverride = self->_geoTrackingStateOverride;
      int v32 = 138543874;
      v33 = v21;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2048;
      int64_t v37 = geoTrackingStateOverride;
      _os_log_impl(&dword_20B202000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame geo tracking state to be state %ld", (uint8_t *)&v32, 0x20u);
    }
    int64_t v23 = self->_geoTrackingStateOverride;
    v24 = [v4 geoTrackingStatus];
    [v24 setState:v23];
  }
  if (self->_geoTrackingStateReasonOverrideEnabled)
  {
    v25 = _ARLogCoaching_2();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      int64_t geoTrackingStateReasonOverride = self->_geoTrackingStateReasonOverride;
      int v32 = 138543874;
      v33 = v27;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2048;
      int64_t v37 = geoTrackingStateReasonOverride;
      _os_log_impl(&dword_20B202000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding ARFrame geo tracking state reason to be state %ld", (uint8_t *)&v32, 0x20u);
    }
    int64_t v29 = self->_geoTrackingStateReasonOverride;
    v30 = [v4 geoTrackingStatus];
    [v30 setStateReason:v29];
  }
LABEL_20:

  return v4;
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ARCoachingOverlayView_session_willRunWithConfiguration___block_invoke;
  block[3] = &unk_264000B80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__ARCoachingOverlayView_session_willRunWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 600);
  uint64_t result = validateCoachingGoalForSession(*(void *)(v2 + 464), *(void **)(v2 + 592));
  *(void *)(*(void *)(a1 + 32) + 600) = result;
  if (v3 != *(void *)(*(void *)(a1 + 32) + 600))
  {
    id v5 = _ARLogCoaching_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      double v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Restarting coaching after configuration change resulted in goal change", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(a1 + 32) restartIfActive];
  }
  return result;
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = _ARLogCoaching_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = self;
    _os_log_impl(&dword_20B202000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching recieved session failure callback", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ARCoachingOverlayView_session_didFailWithError___block_invoke;
  v10[3] = &unk_264000BD0;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __50__ARCoachingOverlayView_session_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = _ARLogCoaching_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v28 = 138543874;
    int64_t v29 = v4;
    __int16 v30 = 2048;
    uint64_t v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_20B202000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Processing session failure for coaching\n%@", (uint8_t *)&v28, 0x20u);
  }
  *(void *)(*(void *)(a1 + 32) + 600) = validateCoachingGoalForSession(*(void *)(*(void *)(a1 + 32) + 464), *(void **)(*(void *)(a1 + 32) + 592));
  double v7 = [*(id *)(a1 + 32) delegate];
  char v8 = objc_opt_respondsToSelector();

  id v9 = _ARLogCoaching_2();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      uint64_t v13 = *(void *)(a1 + 32);
      int v28 = 138543618;
      int64_t v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate if we should show coaching session failure UI", (uint8_t *)&v28, 0x16u);
    }
    __int16 v14 = [*(id *)(a1 + 32) delegate];
    char v15 = [v14 coachingOverlayViewShouldShowSessionFailure:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];

    if (v15)
    {
      uint64_t v16 = _ARLogCoaching_2();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        uint64_t v19 = *(void *)(a1 + 32);
        int v28 = 138543618;
        int64_t v29 = v18;
        __int16 v30 = 2048;
        uint64_t v31 = v19;
        _os_log_impl(&dword_20B202000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Preparing to show coaching session failure UI", (uint8_t *)&v28, 0x16u);
      }
      return [*(id *)(a1 + 32) doStateAction:7];
    }
  }
  else
  {
    if (v10)
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      uint64_t v23 = *(void *)(a1 + 32);
      int v28 = 138543618;
      int64_t v29 = v22;
      __int16 v30 = 2048;
      uint64_t v31 = v23;
      _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching delegate does not implement coaching session UI callback", (uint8_t *)&v28, 0x16u);
    }
  }
  v24 = _ARLogCoaching_2();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = *(void *)(a1 + 32);
    int v28 = 138543618;
    int64_t v29 = v26;
    __int16 v30 = 2048;
    uint64_t v31 = v27;
    _os_log_impl(&dword_20B202000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deactivating coaching due to session failure", (uint8_t *)&v28, 0x16u);
  }
  return [*(id *)(a1 + 32) setActive:0 animated:0];
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ARCoachingOverlayView_session_didRemoveAnchors___block_invoke;
  v7[3] = &unk_264000BD0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __50__ARCoachingOverlayView_session_didRemoveAnchors___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) anchorsRemoved:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__ARCoachingOverlayView_session_didAddAnchors___block_invoke;
  v7[3] = &unk_264000BD0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __47__ARCoachingOverlayView_session_didAddAnchors___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 608) anchorsAdded:*(void *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kARCoachingSessionProviderSessionContext == a6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionProvider);
    double v7 = [WeakRetained session];
    [(ARCoachingOverlayView *)self setSession:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ARCoachingOverlayView;
    -[ARCoachingOverlayView observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)restartIfActive
{
  [(ARCoachingOverlayView *)self doStateAction:8];
  if ([(ARCoachingOverlayView *)self isActive])
  {
    [(ARCoachingOverlayView *)self startup];
  }
  else
  {
    [(ARCoachingOverlayView *)self generateHeuristicsForActive:0];
  }
}

- (void)resolveCoachingMessageWithFrame:(id)a3
{
  id v4 = a3;
  id v28 = v4;
  switch(self->_goal)
  {
    case 0:
    case 1:
      uint64_t v5 = 2;
      goto LABEL_6;
    case 2:
      uint64_t v5 = 3;
      goto LABEL_6;
    case 3:
      uint64_t v5 = 5;
      goto LABEL_6;
    case 4:
      uint64_t v19 = [v4 geoTrackingStatus];

      if (!v19)
      {
        uint64_t v16 = 6;
        goto LABEL_46;
      }
      v20 = [v28 geoTrackingStatus];
      uint64_t v21 = [v20 stateReason];

      if (v21 == 7)
      {
        uint64_t v16 = 8;
        goto LABEL_46;
      }
      v22 = [v28 geoTrackingStatus];
      if ([v22 stateReason] == 3)
      {
        uint64_t v23 = [v28 camera];
        if ([v23 trackingStateReason] == 1)
        {

LABEL_42:
          uint64_t v16 = 9;
          goto LABEL_46;
        }
        v24 = [v28 camera];
        uint64_t v25 = [v24 trackingStateReason];

        if (v25 == 2) {
          goto LABEL_42;
        }
      }
      else
      {
      }
      v26 = [v28 geoTrackingStatus];
      uint64_t v27 = [v26 stateReason];

      if (v27 == 8) {
        uint64_t v16 = 7;
      }
      else {
        uint64_t v16 = 6;
      }
LABEL_46:
      uint64_t v18 = self;
      uint64_t v17 = 7;
LABEL_30:
      [(ARCoachingOverlayView *)v18 setCoachingMessage:v16 animationState:v17];

      return;
    default:
      uint64_t v5 = 4;
LABEL_6:
      int64_t coachingRequirements = self->_coachingRequirements;
      uint64_t v7 = 2;
      uint64_t v8 = 3;
      uint64_t v9 = 4;
      uint64_t v10 = 1;
      if ((coachingRequirements & 0x20) != 0) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = v5;
      }
      if ((coachingRequirements & 0x20) != 0) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v9 = 2;
      }
      if ((coachingRequirements & 0x10) == 0)
      {
        uint64_t v5 = v11;
        uint64_t v8 = v10;
        uint64_t v7 = v9;
      }
      if ((coachingRequirements & 0x40) != 0) {
        uint64_t v12 = 6;
      }
      else {
        uint64_t v12 = v5;
      }
      if ((coachingRequirements & 0x40) != 0) {
        uint64_t v13 = 5;
      }
      else {
        uint64_t v13 = v8;
      }
      if ((coachingRequirements & 0x40) != 0) {
        uint64_t v14 = 5;
      }
      else {
        uint64_t v14 = v7;
      }
      BOOL v15 = [(ARCoachingMotionTracker *)self->_motionTracker isMoving];
      if (v15) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = v13;
      }
      if (v15) {
        uint64_t v17 = 4;
      }
      else {
        uint64_t v17 = v12;
      }
      uint64_t v18 = self;
      goto LABEL_30;
  }
}

- (void)setCoachingMessage:(int64_t)a3 animationState:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_coachingMessageType != a3
    || [(ARCoachingAnimationView *)self->_coachingAnimationView animationState] != a4)
  {
    CFTimeInterval v7 = CACurrentMediaTime();
    if ([(ARCoachingOverlayView *)self isHidden])
    {
      self->_coachingMessageType = a3;
      uint64_t v8 = getCoachingText(a3);
      [(UILabel *)self->_coachingText setText:v8];

      if ([(ARCoachingOverlayView *)self hideCoachingMessageLabel])
      {
        uint64_t v9 = [(ARCoachingOverlayView *)self delegate];
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          uint64_t v11 = _ARLogCoaching_2();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = (objc_class *)objc_opt_class();
            uint64_t v13 = NSStringFromClass(v12);
            int v23 = 138543618;
            v24 = v13;
            __int16 v25 = 2048;
            v26 = self;
            _os_log_impl(&dword_20B202000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate to display the coaching message", (uint8_t *)&v23, 0x16u);
          }
          uint64_t v14 = [(ARCoachingOverlayView *)self delegate];
          BOOL v15 = getCoachingText(a3);
          [v14 displayCoachingMessage:v15 forCoachingView:self];
        }
      }
    }
    else
    {
      if (v7 - self->_lastCoachingUpdateTime < 1.0)
      {
        self->_nextCoachingMessageType = a3;
        self->_nextCoachingAnimationState = a4;
        return;
      }
      [(ARCoachingOverlayView *)self crossFadeCoachingMessage:a3];
      if ([(ARCoachingOverlayView *)self hideCoachingMessageLabel])
      {
        uint64_t v16 = [(ARCoachingOverlayView *)self delegate];
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          uint64_t v18 = _ARLogCoaching_2();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v19);
            int v23 = 138543618;
            v24 = v20;
            __int16 v25 = 2048;
            v26 = self;
            _os_log_impl(&dword_20B202000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Asking delegate to display the coaching message", (uint8_t *)&v23, 0x16u);
          }
          uint64_t v21 = [(ARCoachingOverlayView *)self delegate];
          v22 = getCoachingText(a3);
          [v21 displayCoachingMessage:v22 forCoachingView:self];
        }
      }
    }
    [(ARCoachingAnimationView *)self->_coachingAnimationView setAnimationState:a4];
    self->_nextCoachingMessageType = 0;
    self->_double lastCoachingUpdateTime = v7;
  }
}

- (void)crossFadeCoachingMessage:(int64_t)a3
{
  if (self->_coachingMessageType != a3)
  {
    self->_coachingMessageType = a3;
    id v5 = objc_alloc(MEMORY[0x263F1CB78]);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke;
    v10[3] = &unk_264000B80;
    v10[4] = self;
    id v6 = (void *)[v5 initWithDuration:1 curve:v10 animations:0.15];
    id v7 = objc_alloc(MEMORY[0x263F1CB78]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke_2;
    v9[3] = &unk_264000C98;
    v9[4] = self;
    v9[5] = a3;
    uint64_t v8 = (void *)[v7 initWithDuration:2 curve:v9 animations:0.15];
    [(NSMutableArray *)self->_uiAnimationQueue addObject:v6];
    [(NSMutableArray *)self->_uiAnimationQueue addObject:v8];
  }
}

uint64_t __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

uint64_t __50__ARCoachingOverlayView_crossFadeCoachingMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = getCoachingText(*(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 416) setText:v2];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 416);

  return [v3 setAlpha:1.0];
}

- (void)doStateAction:(int64_t)a3
{
  id v4 = [(ARCoachingState *)self->_state doAction:a3];
  if (v4)
  {
    id v5 = v4;
    [(ARCoachingOverlayView *)self swapState:v4];
    id v4 = v5;
  }
}

- (void)swapState:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(ARCoachingState *)self->_state exit];
  id v6 = _ARLogCoaching_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (objc_class *)objc_opt_class();
    char v10 = NSStringFromClass(v9);
    int v16 = 138543874;
    char v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_20B202000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Exited coaching state %@", (uint8_t *)&v16, 0x20u);
  }
  objc_storeStrong((id *)&self->_state, a3);
  objc_opt_class();
  [(ARCoachingAnimationView *)self->_coachingAnimationView setIsDeactivating:objc_opt_isKindOfClass() & 1];
  [(ARCoachingState *)self->_state enter];
  uint64_t v11 = _ARLogCoaching_2();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    uint64_t v14 = (objc_class *)objc_opt_class();
    BOOL v15 = NSStringFromClass(v14);
    int v16 = 138543874;
    char v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_log_impl(&dword_20B202000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Entered coaching state %@", (uint8_t *)&v16, 0x20u);
  }
}

- (void)updateWithFrame:(id)a3
{
  id v4 = a3;
  -[ARCoachingHeuristicCollection updateWithFrame:cache:](self->_heuristics, "updateWithFrame:cache:");
  [(ARCoachingOverlayView *)self doStateAction:4];
  if ([(ARCoachingOverlayView *)self isActive])
  {
    [(ARCoachingAnimationView *)self->_coachingAnimationView updateWithFrame:v4 motionTracker:self->_motionTracker];
    [(ARCoachingMotionTracker *)self->_motionTracker updateWithFrame:v4];
    [(ARCoachingOverlayView *)self updateCoachingMessagingWithMotionTracker:1 frame:v4];
  }
}

- (void)updateFromDisplayLink
{
  if (self->_wasEverActivated)
  {
    [(ARCoachingOverlayView *)self doStateAction:3];
    uint64_t v3 = [ARCoachingFrame alloc];
    id v4 = [(ARSession *)self->_session currentFrame];
    id v6 = [(ARCoachingFrame *)v3 initWithFrame:v4];

    id v5 = [(ARCoachingOverlayView *)self frameWithOverrides:v6];
    [(ARCoachingOverlayView *)self updateCoachingMessagingWithMotionTracker:0 frame:v5];
    [(ARCoachingOverlayView *)self updateUIAnimations];
  }
}

- (void)updateCoachingMessagingWithMotionTracker:(BOOL)a3 frame:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  int64_t coachingRequirements = self->_coachingRequirements;
  int64_t v7 = [(ARCoachingState *)self->_state requirements];
  int64_t v8 = [(ARCoachingHeuristicCollection *)self->_heuristics requirements] | v7;
  self->_int64_t coachingRequirements = v8;
  if (v4
    && ([(ARCoachingMotionTracker *)self->_motionTracker didStartMoving]
     || [(ARCoachingMotionTracker *)self->_motionTracker didStopMoving])
    || v8 != coachingRequirements
    || self->_goal == 4)
  {
    [(ARCoachingOverlayView *)self resolveCoachingMessageWithFrame:v12];
  }
  int64_t nextCoachingMessageType = self->_nextCoachingMessageType;
  if (nextCoachingMessageType) {
    [(ARCoachingOverlayView *)self setCoachingMessage:nextCoachingMessageType animationState:self->_nextCoachingAnimationState];
  }
  if ([(ARCoachingOverlayView *)self hideCoachingMessageLabel])
  {
    p_coachingText = &self->_coachingText;
    if (![(UILabel *)self->_coachingText isHidden])
    {
      uint64_t v11 = 1;
      goto LABEL_15;
    }
  }
  if (![(ARCoachingOverlayView *)self hideCoachingMessageLabel])
  {
    p_coachingText = &self->_coachingText;
    if ([(UILabel *)self->_coachingText isHidden])
    {
      uint64_t v11 = 0;
LABEL_15:
      [(UILabel *)*p_coachingText setHidden:v11];
    }
  }
}

- (double)calcFadeDurationIn:(BOOL)a3 withButton:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(UIView *)self->_background alpha];
  if (v5)
  {
    double v8 = fmax(1.0 - v7, 0.0);
    [(UILabel *)self->_coachingText alpha];
    double v10 = fmax(v8, 1.0 - v9);
    if (v4)
    {
      [(ARCoachingPillButton *)self->_resetButton alpha];
      double v12 = 1.0 - v11;
      goto LABEL_6;
    }
  }
  else
  {
    double v13 = fmax(v7, 0.0);
    [(UILabel *)self->_coachingText alpha];
    double v10 = fmax(v13, v14);
  }
  [(ARCoachingPillButton *)self->_resetButton alpha];
LABEL_6:
  double v15 = fmax(v10, v12);
  double v16 = 0.3;
  if (!v5) {
    double v16 = 0.75;
  }
  return v16 * v15;
}

- (void)generateHeuristicsForActive:(BOOL)a3
{
  BOOL v3 = a3;
  [(ARCoachingHeuristicCollection *)self->_heuristics clear];
  if (v3)
  {
    heuristics = self->_heuristics;
    id v6 = [[ARCoachingHeuristicDelay alloc] initWithDuration:1.0];
    [(ARCoachingHeuristicCollection *)heuristics addHeuristic:v6];
  }
  switch(self->_goal)
  {
    case 0:
      double v7 = self->_heuristics;
      double v8 = ARCoachingHeuristicTracking;
      goto LABEL_9;
    case 1:
      double v9 = self->_heuristics;
      double v10 = objc_alloc_init(ARCoachingHeuristicTracking);
      [(ARCoachingHeuristicCollection *)v9 addHeuristic:v10];

      double v7 = self->_heuristics;
      double v8 = ARCoachingHeuristicHorizontalPlane;
      goto LABEL_9;
    case 2:
      double v11 = self->_heuristics;
      double v12 = objc_alloc_init(ARCoachingHeuristicTracking);
      [(ARCoachingHeuristicCollection *)v11 addHeuristic:v12];

      double v7 = self->_heuristics;
      double v8 = ARCoachingHeuristicVerticalPlane;
      goto LABEL_9;
    case 3:
      double v13 = self->_heuristics;
      double v14 = objc_alloc_init(ARCoachingHeuristicTracking);
      [(ARCoachingHeuristicCollection *)v13 addHeuristic:v14];

      double v7 = self->_heuristics;
      double v8 = ARCoachingHeuristicAnyPlane;
      goto LABEL_9;
    case 4:
      double v7 = self->_heuristics;
      double v8 = ARCoachingHeuristicGeoTracking;
LABEL_9:
      id v15 = objc_alloc_init(v8);
      -[ARCoachingHeuristicCollection addHeuristic:](v7, "addHeuristic:");

      break;
    default:
      return;
  }
}

- (void)buttonPress:(id)a3
{
  BOOL v4 = (ARCoachingPillButton *)a3;
  if (self->_resetButton == v4)
  {
    double v9 = v4;
    if (self->_activatesAutomatically) {
      [(ARCoachingOverlayView *)self setActive:0 animated:1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 coachingOverlayViewDidRequestSessionReset:self];
    }
    else
    {
      session = self->_session;
      double v7 = [(ARSession *)session configuration];
      [(ARSession *)session runWithConfiguration:v7 options:3];
    }

    BOOL v4 = v9;
  }
}

- (void)updateUIAnimations
{
  if ([(NSMutableArray *)self->_uiAnimationQueue count])
  {
    while (1)
    {
      id v7 = [(NSMutableArray *)self->_uiAnimationQueue objectAtIndexedSubscript:0];
      if ([v7 isRunning]) {
        break;
      }
      if (!self->_uiAnimationQueueRunning)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (id v3 = v7,
              double v4 = CACurrentMediaTime(),
              [v3 coachingDelayTime],
              double v6 = v5,
              v3,
              v6 <= v4))
        {
          [v7 startAnimation];
          self->_uiAnimationQueueRunning = 1;
        }
        break;
      }
      [(NSMutableArray *)self->_uiAnimationQueue removeObjectAtIndex:0];
      self->_uiAnimationQueueRunning = 0;

      if (![(NSMutableArray *)self->_uiAnimationQueue count]) {
        return;
      }
    }
  }
}

- (void)killUIAnimations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_uiAnimationQueue;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isRunning", (void)v9)) {
          [v8 stopAnimation:1];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_uiAnimationQueue removeAllObjects];
  self->_uiAnimationQueueRunning = 0;
}

- (void)finishAllUIAnimations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_uiAnimationQueue;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isRunning", (void)v9))
        {
          [v8 stopAnimation:1];
        }
        else
        {
          [v8 startAnimation];
          [v8 stopAnimation:0];
          [v8 finishAnimationAtPosition:0];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_uiAnimationQueue removeAllObjects];
  self->_uiAnimationQueueRunning = 0;
}

- (void)orientationChanged
{
  [(ARCoachingAnimationView *)self->_coachingAnimationView orientationChanged];

  [(ARCoachingOverlayView *)self setNeedsUpdateConstraints];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ARCoachingOverlayView;
  [(ARCoachingOverlayView *)&v7 layoutSubviews];
  [(ARCoachingOverlayView *)self setNeedsUpdateConstraints];
  [(ARCoachingOverlayView *)self bounds];
  double v4 = v3;
  [(ARCoachingOverlayView *)self bounds];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  -[UIView setBounds:](self->_background, "setBounds:", 0.0, 0.0, v6 * 1.25, v6 * 1.25);
}

- (int64_t)currentDeviceOrientation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t currentConstraintDeviceOrientation = [v3 orientation];

  if ((unint64_t)(currentConstraintDeviceOrientation - 1) >= 4)
  {
    uint64_t currentConstraintDeviceOrientation = self->_currentConstraintDeviceOrientation;
    if ((unint64_t)(currentConstraintDeviceOrientation - 1) >= 4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      double v5 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", 0);
      double v6 = [v5 connectedScenes];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
            if ([v11 isMemberOfClass:objc_opt_class()])
            {
              uint64_t v12 = [v11 interfaceOrientation];
              if ((unint64_t)(v12 - 1) < 4)
              {
                uint64_t currentConstraintDeviceOrientation = v12;
                goto LABEL_14;
              }
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      uint64_t currentConstraintDeviceOrientation = 1;
LABEL_14:
    }
  }
  return currentConstraintDeviceOrientation;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)ARCoachingOverlayView;
  [(ARCoachingOverlayView *)&v4 updateConstraints];
  int64_t v3 = [(ARCoachingOverlayView *)self currentDeviceOrientation];
  if (v3 != self->_currentConstraintDeviceOrientation) {
    [(ARCoachingOverlayView *)self createConstraintsForDeviceOrientation:v3];
  }
}

- (void)createConstraintsForDeviceOrientation:(int64_t)a3
{
  double v5 = [(ARCoachingOverlayView *)self safeAreaLayoutGuide];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  long long v14 = __63__ARCoachingOverlayView_createConstraintsForDeviceOrientation___block_invoke;
  long long v15 = &unk_264000C98;
  long long v16 = self;
  int8x8_t v17 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32((unint64_t)(a3 - 3) < 2), 0x1FuLL)), (int8x8_t)0x43670000C3670000, (int8x8_t)0x431A0000C31A0000);
  if ((unint64_t)(a3 - 3) >= 2) {
    double v6 = &OBJC_IVAR___ARCoachingOverlayView__resetButtonPortraitVerticalOffset;
  }
  else {
    double v6 = &OBJC_IVAR___ARCoachingOverlayView__resetButtonLandscapeVerticalOffset;
  }
  dispatch_async(MEMORY[0x263EF83A0], &v12);
  float v7 = *(float *)((char *)&self->super.super.super.isa + *v6);
  -[NSLayoutConstraint setActive:](self->_resetButtonBottomLayoutConstraint, "setActive:", 0, v12, v13, v14, v15, v16, *(void *)&v17);
  uint64_t v8 = [(ARCoachingPillButton *)self->_resetButton bottomAnchor];
  uint64_t v9 = [v5 bottomAnchor];
  uint64_t v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9 constant:(float)-v7];
  resetButtonBottomLayoutConstraint = self->_resetButtonBottomLayoutConstraint;
  self->_resetButtonBottomLayoutConstraint = v10;

  [(NSLayoutConstraint *)self->_resetButtonBottomLayoutConstraint setActive:1];
  self->_uint64_t currentConstraintDeviceOrientation = a3;
}

uint64_t __63__ARCoachingOverlayView_createConstraintsForDeviceOrientation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) setActive:0];
  [*(id *)(*(void *)(a1 + 32) + 528) setActive:0];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 416) leftAnchor];
  int64_t v3 = [*(id *)(a1 + 32) centerXAnchor];
  uint64_t v4 = [v2 constraintEqualToAnchor:v3 constant:*(float *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 520);
  *(void *)(v5 + 520) = v4;

  float v7 = [*(id *)(*(void *)(a1 + 32) + 416) rightAnchor];
  uint64_t v8 = [*(id *)(a1 + 32) centerXAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8 constant:*(float *)(a1 + 44)];
  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(void **)(v10 + 528);
  *(void *)(v10 + 528) = v9;

  [*(id *)(*(void *)(a1 + 32) + 520) setActive:1];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 528);

  return [v12 setActive:1];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSObject)sessionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionProvider);

  return WeakRetained;
}

- (ARSession)session
{
  return self->_session;
}

- (ARCoachingGoal)goal
{
  return self->_goal;
}

- (BOOL)activatesAutomatically
{
  return self->_activatesAutomatically;
}

- (void)setActivatesAutomatically:(BOOL)activatesAutomatically
{
  self->_activatesAutomatically = activatesAutomatically;
}

- (BOOL)wasEverActivated
{
  return self->_wasEverActivated;
}

- (ARCoachingSessionCache)coachingSessionCache
{
  return self->_coachingSessionCache;
}

- (int64_t)trackingStateReasonOverride
{
  return self->_trackingStateReasonOverride;
}

- (void)setTrackingStateReasonOverride:(int64_t)a3
{
  self->_int64_t trackingStateReasonOverride = a3;
}

- (BOOL)trackingStateNormalOverride
{
  return self->_trackingStateNormalOverride;
}

- (void)setTrackingStateNormalOverride:(BOOL)a3
{
  self->_trackingStateNormalOverride = a3;
}

- (BOOL)geoTrackingStateOverrideEnabled
{
  return self->_geoTrackingStateOverrideEnabled;
}

- (void)setGeoTrackingStateOverrideEnabled:(BOOL)a3
{
  self->_geoTrackingStateOverrideEnabled = a3;
}

- (int64_t)geoTrackingStateOverride
{
  return self->_geoTrackingStateOverride;
}

- (void)setGeoTrackingStateOverride:(int64_t)a3
{
  self->_int64_t geoTrackingStateOverride = a3;
}

- (BOOL)geoTrackingStateReasonOverrideEnabled
{
  return self->_geoTrackingStateReasonOverrideEnabled;
}

- (void)setGeoTrackingStateReasonOverrideEnabled:(BOOL)a3
{
  self->_geoTrackingStateReasonOverrideEnabled = a3;
}

- (int64_t)geoTrackingStateReasonOverride
{
  return self->_geoTrackingStateReasonOverride;
}

- (void)setGeoTrackingStateReasonOverride:(int64_t)a3
{
  self->_int64_t geoTrackingStateReasonOverride = a3;
}

- (float)resetButtonLandscapeVerticalOffset
{
  return self->_resetButtonLandscapeVerticalOffset;
}

- (float)resetButtonPortraitVerticalOffset
{
  return self->_resetButtonPortraitVerticalOffset;
}

- (BOOL)hideCoachingMessageLabel
{
  return self->_hideCoachingMessageLabel;
}

- (void)setHideCoachingMessageLabel:(BOOL)a3
{
  self->_hideCoachingMessageLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingSessionCache, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_sessionProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiAnimationQueue, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_coachingAnimationView, 0);
  objc_storeStrong((id *)&self->_coachingTextRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_coachingTextLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_resetButtonBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_motionTracker, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_coachingText, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end