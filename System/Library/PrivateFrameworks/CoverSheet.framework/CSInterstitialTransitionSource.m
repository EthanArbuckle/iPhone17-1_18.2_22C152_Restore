@interface CSInterstitialTransitionSource
- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext;
- (BOOL)isTransitioning;
- (CSHomeAffordanceComponent)homeAffordance;
- (CSInterstitialTransitionDelegate)transitioningDelegate;
- (CSStatusBarComponent)statusBar;
- (NSSet)components;
- (NSString)coverSheetIdentifier;
- (_UILegibilitySettings)legibilitySettings;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (int64_t)transitionType;
- (unint64_t)restrictedCapabilities;
- (void)cancelTransition;
- (void)cleanupPresentation;
- (void)prepareForPresentation;
- (void)setHomeAffordance:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setTransitionType:(int64_t)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)updatePresentationWithProgress:(double)a3;
@end

@implementation CSInterstitialTransitionSource

- (void)prepareForPresentation
{
  self->_transitionType = 2;
  long long v22 = 0u;
  uint64_t v23 = 0x3FF0000000000000;
  BYTE8(v22) = 1;
  uint64_t v24 = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v22, 3, (uint64_t)&v25);
  long long v3 = v26;
  *(_OWORD *)&self->_transitionContext.value = v25;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v3;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v27;
  v4 = [(CSInterstitialTransitionSource *)self transitioningDelegate];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  v5 = [v4 coverSheetView];
  [v5 bounds];
  CSComponentTransitionInputsMake(0, (uint64_t)&v25, 0.0, 0.0, v6 / -6.0, 0.0, 0.0);

  v7 = objc_opt_new();
  v8 = [(CSInterstitialTransitionSource *)self appearanceIdentifier];
  v9 = [v7 identifier:v8];
  v10 = [v9 transitionModifiers:8];
  v21[0] = v25;
  v21[1] = v26;
  v21[2] = v27;
  v11 = [v10 transitionInputs:v21];
  v12 = [v11 suppressTeachableMomentsAnimation:1];
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = v12;

  uint64_t v14 = SBFEffectiveArtworkSubtype();
  if (v14 <= 2795)
  {
    if (v14 != 2556 && v14 != 2622) {
      goto LABEL_8;
    }
LABEL_7:
    v15 = objc_opt_new();
    v16 = [(CSInterstitialTransitionSource *)self appearanceIdentifier];
    v17 = [v15 identifier:v16];
    v18 = [v17 priority:60];
    v19 = [v18 hidden:1];
    statusBar = self->_statusBar;
    self->_statusBar = v19;

    goto LABEL_8;
  }
  if (v14 == 2868 || v14 == 2796) {
    goto LABEL_7;
  }
LABEL_8:
  [v4 transitionSource:self willBeginWithType:self->_transitionType];
  [(CSInterstitialTransitionSource *)self updatePresentationWithProgress:0.0];
}

- (void)updatePresentationWithProgress:(double)a3
{
  long long v7 = 0u;
  uint64_t v8 = 0x3FF0000000000000;
  BYTE8(v7) = 1;
  uint64_t v9 = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v7, 3, (uint64_t)&v10);
  long long v4 = v11;
  *(_OWORD *)&self->_transitionContext.value = v10;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v4;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v12;
  v5 = [(CSInterstitialTransitionSource *)self transitioningDelegate];
  long long v6 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  long long v10 = *(_OWORD *)&self->_transitionContext.value;
  long long v11 = v6;
  long long v12 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [v5 transitionSource:self didUpdateTransitionWithContext:&v10];
}

- (void)cleanupPresentation
{
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = 0;

  self->_transitionType = 0;
  long long v4 = [(CSInterstitialTransitionSource *)self transitioningDelegate];
  long long v5 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v6[0] = *(_OWORD *)&self->_transitionContext.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [v4 transitionSource:self didEndWithContext:v6];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(CSInterstitialTransitionSource *)self isTransitioning]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSSet)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v4 = v3;
  if (self->_homeAffordance) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_statusBar) {
    objc_msgSend(v4, "addObject:");
  }
  long long v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  return (NSSet *)v5;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 3;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  if ([(CSInterstitialTransitionSource *)self isTransitioning]) {
    return 4096;
  }
  else {
    return 0;
  }
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_transitionType != 0;
}

- (void)cancelTransition
{
  [(CSInterstitialTransitionSource *)self updatePresentationWithProgress:0.0];

  [(CSInterstitialTransitionSource *)self cleanupPresentation];
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext
{
  long long v3 = *(_OWORD *)&self[1].var1.var0.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  *(_OWORD *)&retstr->var1.var1.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  return self;
}

- (CSInterstitialTransitionDelegate)transitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningDelegate);

  return (CSInterstitialTransitionDelegate *)WeakRetained;
}

- (void)setTransitioningDelegate:(id)a3
{
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (CSHomeAffordanceComponent)homeAffordance
{
  return self->_homeAffordance;
}

- (void)setHomeAffordance:(id)a3
{
}

- (CSStatusBarComponent)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);

  objc_destroyWeak((id *)&self->_transitioningDelegate);
}

@end