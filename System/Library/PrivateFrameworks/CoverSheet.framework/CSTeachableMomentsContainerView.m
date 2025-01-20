@interface CSTeachableMomentsContainerView
- (BOOL)adjustsControlCenterTutorsVisibilityForAvailableSpace;
- (BOOL)isStatusBarLayoutReady;
- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutors;
- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutorsY;
- (CABackdropLayer)controlCenterGrabberBackdropLayer;
- (CGPoint)_grabberCenterForContainerBounds:(CGRect)a3 grabberTop:(double)a4 grabberTopIsRelative:(BOOL)a5 grabberSize:(CGSize)a6 isSpaceConstrained:(BOOL *)a7;
- (CSPropertyAnimatingTouchPassThroughView)controlCenterGrabberContainerView;
- (CSTeachableMomentsContainerView)initWithFrame:(CGRect)a3;
- (SBLockScreenDefaults)lockScreenDefaults;
- (SBUILegibilityLabel)callToActionLabel;
- (UIImageView)controlCenterGlyphView;
- (UIStatusBar)statusBarToFollow;
- (UIView)callToActionLabelContainerView;
- (UIView)callToActionLabelPositionPlaceholderView;
- (UIView)controlCenterGlyphContainerView;
- (UIView)controlCenterGrabberPositionPlaceholderView;
- (UIView)controlCenterGrabberView;
- (UIView)controlCenterTutorsContainerView;
- (UIView)homeAffordanceContainerView;
- (UIView)homeAffordanceView;
- (_UILegibilitySettings)legibilitySettings;
- (id)_callToActionLabelFont;
- (id)createCallToActionLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)presentationRegions;
- (void)_addCallToActionLabel;
- (void)_addControlCenterTutors;
- (void)_layoutCallToActionLabel;
- (void)_layoutControlCenterGrabberAndGlyph;
- (void)_layoutHomeAffordanceContainer;
- (void)_preferredTextSizeChanged:(id)a3;
- (void)_updateViewsForLegibilitySettings;
- (void)layoutSubviews;
- (void)setCallToActionLabel:(id)a3;
- (void)setCallToActionLabelContainerView:(id)a3;
- (void)setCallToActionLabelPositionPlaceholderView:(id)a3;
- (void)setControlCenterGlyphContainerView:(id)a3;
- (void)setControlCenterGlyphView:(id)a3;
- (void)setControlCenterGrabberBackdropLayer:(id)a3;
- (void)setControlCenterGrabberContainerView:(id)a3;
- (void)setControlCenterGrabberPositionPlaceholderView:(id)a3;
- (void)setControlCenterGrabberView:(id)a3;
- (void)setControlCenterTutorsContainerView:(id)a3;
- (void)setHomeAffordanceContainerView:(id)a3;
- (void)setHomeAffordanceView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLockScreenDefaults:(id)a3;
- (void)setStatusBarToFollow:(id)a3;
- (void)statusBarManager:(id)a3 didUpdateAvoidanceFrameForStatusBar:(id)a4 withAnimationSettings:(id)a5;
@end

@implementation CSTeachableMomentsContainerView

- (void)statusBarManager:(id)a3 didUpdateAvoidanceFrameForStatusBar:(id)a4 withAnimationSettings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);

  if (WeakRetained == v8
    && [(CSTeachableMomentsContainerView *)self usesStatusBarRelativeLayoutForControlCenterTutors])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15[5] = 0;
      v15[6] = 0;
      id v11 = v7;
      [v11 stiffness];
      [v11 damping];

      convertTensionAndFrictionToDampingRatioAndResponse();
      [v10 setDampingRatio:0.0];
      [v10 setResponse:0.0];
    }
    v12 = [(CSTeachableMomentsContainerView *)self controlCenterGrabberContainerView];
    [v12 bounds];
    BOOL v13 = CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28]);

    if (v13) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 3;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __110__CSTeachableMomentsContainerView_statusBarManager_didUpdateAvoidanceFrameForStatusBar_withAnimationSettings___block_invoke;
    v15[3] = &unk_1E6AD87F8;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v10, v14, v15, 0);
  }
}

- (CSPropertyAnimatingTouchPassThroughView)controlCenterGrabberContainerView
{
  return self->_controlCenterGrabberContainerView;
}

- (UIView)controlCenterGlyphContainerView
{
  return self->_controlCenterGlyphContainerView;
}

- (UIView)callToActionLabelContainerView
{
  return self->_callToActionLabelContainerView;
}

- (CSTeachableMomentsContainerView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CSTeachableMomentsContainerView;
  v3 = -[CSTeachableMomentsContainerView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  [(CSTeachableMomentsContainerView *)v3 _addCallToActionLabel];
  [(CSTeachableMomentsContainerView *)v4 _addControlCenterTutors];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:v4 selector:sel__preferredTextSizeChanged_ name:*MEMORY[0x1E4F43788] object:0];

  v6 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B0]);
  lockScreenDefaults = v4->_lockScreenDefaults;
  v4->_lockScreenDefaults = v6;

  id v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFBLL;
  char v11 = 1;
  uint64_t v12 = SBFEffectiveArtworkSubtype();
  if (v12 > 2795)
  {
    if (v12 != 2796 && v12 != 2868) {
      goto LABEL_8;
    }
  }
  else if (v12 != 2556 && v12 != 2622)
  {
LABEL_8:
    char v11 = 0;
  }
  if (v10 == 1) {
    char v13 = 1;
  }
  else {
    char v13 = v11;
  }
  v4->_adjustsControlCenterTutorsVisibilityForAvailableSpace = v11;
  v4->_usesStatusBarRelativeLayoutForControlCenterTutors = v13;
  v4->_usesStatusBarRelativeLayoutForControlCenterTutorsY = v11;
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSTeachableMomentsContainerView;
  [(CSTeachableMomentsContainerView *)&v3 layoutSubviews];
  [(CSTeachableMomentsContainerView *)self _layoutHomeAffordanceContainer];
  [(CSTeachableMomentsContainerView *)self _layoutCallToActionLabel];
  [(CSTeachableMomentsContainerView *)self _layoutControlCenterGrabberAndGlyph];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CSTeachableMomentsContainerView;
  v5 = -[SBFTouchPassThroughView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self->_homeAffordanceView]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)presentationRegions
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[CSRegion regionForCoordinateSpace:self->_homeAffordanceView];
  v5 = [v4 role:1];

  [v3 addObject:v5];

  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSTeachableMomentsContainerView *)self _updateViewsForLegibilitySettings];
  }
}

- (void)_updateViewsForLegibilitySettings
{
  objc_super v3 = [(CSTeachableMomentsContainerView *)self callToActionLabel];
  [v3 setLegibilitySettings:self->_legibilitySettings];

  id v10 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  controlCenterGrabberView = self->_controlCenterGrabberView;
  id v5 = [v10 colorWithAlphaComponent:0.5];
  [(UIView *)controlCenterGrabberView setBackgroundColor:v5];

  [(UIImageView *)self->_controlCenterGlyphView setTintColor:v10];
  uint64_t v6 = [(_UILegibilitySettings *)self->_legibilitySettings style];
  id v7 = [(CSPropertyAnimatingTouchPassThroughView *)self->_controlCenterGrabberContainerView layer];
  objc_super v8 = (void *)MEMORY[0x1E4F3A2E0];
  if (v6 == 1) {
    objc_super v8 = (void *)MEMORY[0x1E4F3A2E8];
  }
  uint64_t v9 = [MEMORY[0x1E4F39BC0] filterWithType:*v8];
  [v7 setCompositingFilter:v9];
}

uint64_t __110__CSTeachableMomentsContainerView_statusBarManager_didUpdateAvoidanceFrameForStatusBar_withAnimationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)setStatusBarToFollow:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  if (WeakRetained != obj)
  {
    id v5 = [WeakRetained window];
    uint64_t v6 = [v5 windowScene];
    id v7 = [v6 statusBarManager];
    objc_msgSend(v7, "sbf_removeObserver:", self);

    objc_storeWeak((id *)&self->_statusBarToFollow, obj);
    objc_super v8 = [obj window];
    uint64_t v9 = [v8 windowScene];
    id v10 = [v9 statusBarManager];
    objc_msgSend(v10, "sbf_addObserver:", self);

    [(CSTeachableMomentsContainerView *)self setNeedsLayout];
  }
}

- (id)createCallToActionLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA7CA0]);
  v4 = [(CSTeachableMomentsContainerView *)self _callToActionLabelFont];
  [v3 setFont:v4];

  [v3 setNumberOfLines:0];
  [v3 setTextAlignment:1];
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  [v3 setStrength:0.3];
  [v3 setAccessibilityIdentifier:@"call-to-action-label"];

  return v3;
}

- (void)setCallToActionLabel:(id)a3
{
  id v5 = (SBUILegibilityLabel *)a3;
  callToActionLabel = self->_callToActionLabel;
  objc_super v8 = v5;
  if (callToActionLabel != v5)
  {
    [(SBUILegibilityLabel *)callToActionLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_callToActionLabel, a3);
    [(SBUILegibilityLabel *)self->_callToActionLabel setLegibilitySettings:self->_legibilitySettings];
    id v7 = [(CSTeachableMomentsContainerView *)self callToActionLabelContainerView];
    [v7 addSubview:v8];

    [(CSTeachableMomentsContainerView *)self setNeedsLayout];
  }
}

- (void)_addCallToActionLabel
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v4 setAlpha:0.0];
    [(CSTeachableMomentsContainerView *)self addSubview:v4];
    [(CSTeachableMomentsContainerView *)self setCallToActionLabelContainerView:v4];
    id v3 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(CSTeachableMomentsContainerView *)self addSubview:v3];
    [(CSTeachableMomentsContainerView *)self setCallToActionLabelPositionPlaceholderView:v3];
  }
}

- (void)_addControlCenterTutors
{
  if ([(SBLockScreenDefaults *)self->_lockScreenDefaults weDontNeedNoEducation]) {
    return;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  id v5 = [v22 layer];
  [v5 setAllowsGroupBlending:0];

  [(CSTeachableMomentsContainerView *)self addSubview:v22];
  [(CSTeachableMomentsContainerView *)self setControlCenterTutorsContainerView:v22];
  uint64_t v6 = objc_alloc_init(CSPropertyAnimatingTouchPassThroughView);
  [(CSPropertyAnimatingTouchPassThroughView *)v6 setAlpha:0.5];
  [v22 addSubview:v6];
  [(CSTeachableMomentsContainerView *)self setControlCenterGrabberContainerView:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(CSPropertyAnimatingTouchPassThroughView *)v6 addSubview:v7];
  [(CSTeachableMomentsContainerView *)self setControlCenterGrabberView:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v22 addSubview:v8];
  [(CSTeachableMomentsContainerView *)self setControlCenterGrabberPositionPlaceholderView:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v22 addSubview:v9];
  [(CSTeachableMomentsContainerView *)self setControlCenterGlyphContainerView:v9];
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (!v10)
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      uint64_t v12 = @"CC-affordance";
LABEL_18:

      goto LABEL_19;
    }
LABEL_8:
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v13 = __sb__runningInSpringBoard();
      char v14 = v13;
      if (v13)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        id v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      objc_super v15 = @"CC-affordance";
      if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
        objc_super v15 = @"CC-affordance-big-d33-n84";
      }
      uint64_t v12 = v15;
      if ((v14 & 1) == 0) {
    }
      }
    else
    {
      uint64_t v12 = @"CC-affordance";
    }
    if (v11) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_8;
  }
  uint64_t v12 = @"CC-affordance";
LABEL_19:
  v17 = (void *)MEMORY[0x1E4F42A80];
  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v19 = [v17 imageNamed:v12 inBundle:v18];
  v20 = [v19 imageWithRenderingMode:2];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v20];
  [v9 addSubview:v21];
  [(CSTeachableMomentsContainerView *)self setControlCenterGlyphView:v21];
}

- (void)_layoutHomeAffordanceContainer
{
  id v3 = [(CSTeachableMomentsContainerView *)self homeAffordanceContainerView];
  if (v3)
  {
    [(CSTeachableMomentsContainerView *)self bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (void)_layoutCallToActionLabel
{
  id v21 = [(CSTeachableMomentsContainerView *)self callToActionLabelContainerView];
  id v3 = [(CSTeachableMomentsContainerView *)self callToActionLabelPositionPlaceholderView];
  id v4 = [(CSTeachableMomentsContainerView *)self callToActionLabel];
  [(CSTeachableMomentsContainerView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(v21, "setFrame:");
  objc_msgSend(v4, "sizeThatFits:", 159.0, 1.79769313e308);
  double v10 = v9;
  BSRectWithSize();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = v6 * 0.5;
  double v20 = v8 - v10 * 0.5 + -11.0;
  objc_msgSend(v4, "setBounds:", v11, v13);
  objc_msgSend(v4, "setCenter:", v19, v20);
  objc_msgSend(v3, "setBounds:", v12, v14, v16, v18);
  objc_msgSend(v3, "setCenter:", v19, v20 + -33.0);
}

- (void)_layoutControlCenterGrabberAndGlyph
{
  v414 = self;
  [(CSTeachableMomentsContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CSTeachableMomentsContainerView *)self traitCollection];
  [v11 displayScale];

  v415[0] = 0;
  double v12 = [(CSTeachableMomentsContainerView *)self controlCenterTutorsContainerView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  double v13 = [(CSTeachableMomentsContainerView *)self controlCenterGrabberContainerView];
  double v14 = [(CSTeachableMomentsContainerView *)self controlCenterGrabberView];
  uint64_t v15 = [(CSTeachableMomentsContainerView *)self controlCenterGrabberPositionPlaceholderView];
  int v16 = __sb__runningInSpringBoard();
  unint64_t v17 = 0x1E4F42000uLL;
  id v408 = v14;
  id v409 = v13;
  *(void *)&v407[40] = v15;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unsigned int v18 = 0;
      int v19 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v343 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v343 userInterfaceIdiom] != 1)
    {
      unsigned int v18 = 0;
      int v19 = 1;
      goto LABEL_10;
    }
  }
  int v19 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v334 = [MEMORY[0x1E4F42D90] mainScreen];
      [v334 _referenceBounds];
    }
    unsigned int v18 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v42 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v41 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      unsigned int v412 = v20 ^ 1;
      int v413 = v19;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v383 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      uint64_t v391 = 0;
      uint64_t v395 = 0;
      uint64_t v399 = 0;
      uint64_t v403 = 0;
      memset(v407, 0, 40);
      unint64_t v411 = 0;
      int v410 = 0;
      double v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    unsigned int v18 = 0;
  }
LABEL_10:
  int v21 = __sb__runningInSpringBoard();
  unsigned int v412 = v18;
  int v413 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v22 = 0;
      unsigned int v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v342 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v342 userInterfaceIdiom] != 1)
    {
      int v22 = 0;
      unsigned int v23 = 1;
      goto LABEL_19;
    }
  }
  unsigned int v23 = v21 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v333 = [MEMORY[0x1E4F42D90] mainScreen];
      [v333 _referenceBounds];
    }
    int v22 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v410 = v20 ^ 1;
      unint64_t v411 = v23;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v383 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      uint64_t v391 = 0;
      uint64_t v395 = 0;
      uint64_t v399 = 0;
      uint64_t v403 = 0;
      memset(v407, 0, 40);
      double v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    int v22 = 0;
  }
LABEL_19:
  int v24 = __sb__runningInSpringBoard();
  int v410 = v22;
  LODWORD(v411) = v23;
  if (v24)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_DWORD *)&v407[8] = 0;
      int v25 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v341 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v341 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[8] = 0;
      int v25 = 1;
      goto LABEL_28;
    }
  }
  int v25 = v24 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v332 = [MEMORY[0x1E4F42D90] mainScreen];
      [v332 _referenceBounds];
    }
    *(_DWORD *)&v407[8] = v20 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v411) = v25;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v383 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      uint64_t v391 = 0;
      uint64_t v395 = 0;
      uint64_t v399 = 0;
      uint64_t v403 = 0;
      *(void *)v407 = 0;
      memset(&v407[12], 0, 28);
      double v38 = 61.0;
      goto LABEL_64;
    }
  }
  else
  {
    *(_DWORD *)&v407[8] = 0;
  }
LABEL_28:
  int v26 = __sb__runningInSpringBoard();
  HIDWORD(v411) = v25;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[32] = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v340 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v340 userInterfaceIdiom] != 1)
    {
      *(void *)&v407[32] = 0x100000000;
      goto LABEL_37;
    }
  }
  *(_DWORD *)&v407[36] = v26 ^ 1;
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v337 = [MEMORY[0x1E4F42D90] mainScreen];
    [v337 _referenceBounds];
  }
  *(_DWORD *)&v407[32] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v28 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v383 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    uint64_t v391 = 0;
    uint64_t v395 = 0;
    uint64_t v399 = 0;
    uint64_t v403 = 0;
    *(void *)v407 = 0;
    memset(&v407[12], 0, 20);
    double v38 = 61.0;
    goto LABEL_64;
  }
LABEL_37:
  int v29 = __sb__runningInSpringBoard();
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[24] = 0;
      goto LABEL_47;
    }
  }
  else
  {
    v339 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v339 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[24] = 0;
      *(_DWORD *)&v407[28] = 1;
      goto LABEL_47;
    }
  }
  *(_DWORD *)&v407[28] = v29 ^ 1;
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v335 = [MEMORY[0x1E4F42D90] mainScreen];
    [v335 _referenceBounds];
  }
  *(_DWORD *)&v407[24] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v383 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    uint64_t v391 = 0;
    uint64_t v395 = 0;
    uint64_t v399 = 0;
    uint64_t v403 = 0;
    *(void *)v407 = 0;
    *(void *)&v407[12] = 0;
    *(_DWORD *)&v407[20] = 0;
    double v38 = 61.0;
    goto LABEL_64;
  }
LABEL_47:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[16] = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v338 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v338 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[16] = 0;
      *(_DWORD *)&v407[20] = 1;
      goto LABEL_388;
    }
  }
  *(_DWORD *)&v407[20] = v40 ^ 1;
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v331 = [MEMORY[0x1E4F42D90] mainScreen];
    [v331 _referenceBounds];
  }
  *(_DWORD *)&v407[16] = v20 ^ 1;
  BSSizeRoundForScale();
  if (v96 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v383 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    uint64_t v391 = 0;
    uint64_t v395 = 0;
    uint64_t v399 = 0;
    uint64_t v403 = 0;
    *(void *)v407 = 0;
    *(_DWORD *)&v407[12] = 0;
    double v38 = 61.0;
    goto LABEL_64;
  }
LABEL_388:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_390;
    }
LABEL_396:
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v383 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    uint64_t v391 = 0;
    uint64_t v395 = 0;
    uint64_t v399 = 0;
    uint64_t v403 = 0;
    *(void *)v407 = 0;
    double v38 = 61.0;
    *(_DWORD *)&v407[12] = v20 ^ 1;
    goto LABEL_64;
  }
  v336 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v336 userInterfaceIdiom] == 1) {
    goto LABEL_396;
  }
LABEL_390:
  *(_DWORD *)&v407[12] = v20 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_394:
    *(void *)v407 = 0;
    goto LABEL_763;
  }
  int v97 = __sb__runningInSpringBoard();
  if (v97)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_394;
    }
  }
  else
  {
    v329 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v329 userInterfaceIdiom])
    {
      *(void *)v407 = 0x100000000;
      goto LABEL_763;
    }
  }
  *(_DWORD *)&v407[4] = v97 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v322 = [MEMORY[0x1E4F42D90] mainScreen];
      [v322 _referenceBounds];
    }
    *(_DWORD *)v407 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v151 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v383 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      uint64_t v391 = 0;
      uint64_t v395 = 0;
      uint64_t v399 = 0;
      uint64_t v403 = 0;
      double v38 = 60.0;
      goto LABEL_64;
    }
  }
  else
  {
    *(_DWORD *)v407 = 0;
  }
LABEL_763:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v399) = 0;
      HIDWORD(v403) = 0;
      goto LABEL_773;
    }
  }
  else
  {
    v330 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v330 userInterfaceIdiom])
    {
      HIDWORD(v399) = 0;
      HIDWORD(v403) = 1;
      goto LABEL_773;
    }
  }
  HIDWORD(v403) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v325 = [MEMORY[0x1E4F42D90] mainScreen];
      [v325 _referenceBounds];
    }
    HIDWORD(v399) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v147 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_777;
    }
  }
  else
  {
    HIDWORD(v399) = 0;
  }
LABEL_773:
  if (_SBF_Private_IsD94Like())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v383 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    uint64_t v391 = 0;
    uint64_t v395 = 0;
    LODWORD(v399) = 0;
    LODWORD(v403) = 0;
    double v38 = 60.0;
    goto LABEL_64;
  }
LABEL_777:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_781:
    LODWORD(v399) = 0;
    LODWORD(v403) = 0;
    goto LABEL_821;
  }
  int v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_781;
    }
  }
  else
  {
    v326 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v326 userInterfaceIdiom])
    {
      LODWORD(v399) = 0;
      LODWORD(v403) = 1;
      goto LABEL_821;
    }
  }
  LODWORD(v403) = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v317 = [MEMORY[0x1E4F42D90] mainScreen];
      [v317 _referenceBounds];
    }
    LODWORD(v399) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v163 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v383 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      uint64_t v391 = 0;
      uint64_t v395 = 0;
      double v38 = 60.0;
      goto LABEL_64;
    }
  }
  else
  {
    LODWORD(v399) = 0;
  }
LABEL_821:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v383) = 0;
      HIDWORD(v395) = 0;
      goto LABEL_831;
    }
  }
  else
  {
    v328 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v328 userInterfaceIdiom])
    {
      HIDWORD(v383) = 0;
      HIDWORD(v395) = 1;
      goto LABEL_831;
    }
  }
  HIDWORD(v395) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v321 = [MEMORY[0x1E4F42D90] mainScreen];
      [v321 _referenceBounds];
    }
    HIDWORD(v383) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v153 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_835;
    }
  }
  else
  {
    HIDWORD(v383) = 0;
  }
LABEL_831:
  if (_SBF_Private_IsD64Like())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v387 = 0;
    uint64_t v391 = 0;
    uint64_t v379 = 0;
    LODWORD(v383) = 0;
    LODWORD(v395) = 0;
    double v38 = 60.0;
    goto LABEL_64;
  }
LABEL_835:
  int v154 = __sb__runningInSpringBoard();
  if (v154)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v391) = 0;
      LODWORD(v395) = 0;
      goto LABEL_845;
    }
  }
  else
  {
    v327 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v327 userInterfaceIdiom])
    {
      HIDWORD(v391) = 0;
      LODWORD(v395) = 1;
      goto LABEL_845;
    }
  }
  LODWORD(v395) = v154 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v318 = [MEMORY[0x1E4F42D90] mainScreen];
      [v318 _referenceBounds];
    }
    HIDWORD(v391) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v159 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      uint64_t v387 = 0;
      uint64_t v379 = 0;
      LODWORD(v383) = 0;
      LODWORD(v391) = 0;
      double v38 = 53.3333;
      goto LABEL_1192;
    }
  }
  else
  {
    HIDWORD(v391) = 0;
  }
LABEL_845:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v383) = 0;
      LODWORD(v391) = 0;
      goto LABEL_914;
    }
  }
  else
  {
    v324 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v324 userInterfaceIdiom])
    {
      LODWORD(v383) = 0;
      LODWORD(v391) = 1;
      goto LABEL_914;
    }
  }
  LODWORD(v391) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v316 = [MEMORY[0x1E4F42D90] mainScreen];
      [v316 _referenceBounds];
    }
    LODWORD(v383) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v166 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_964;
    }
  }
  else
  {
    LODWORD(v383) = 0;
  }
LABEL_914:
  if (_SBF_Private_IsD54())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    uint64_t v387 = 0;
    uint64_t v379 = 0;
    double v38 = 53.3333;
LABEL_1192:
    unint64_t v17 = 0x1E4F42000;
    goto LABEL_64;
  }
LABEL_964:
  int v167 = __sb__runningInSpringBoard();
  if (v167)
  {
    unint64_t v17 = 0x1E4F42000uLL;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v379) = 0;
      HIDWORD(v387) = 0;
      goto LABEL_982;
    }
  }
  else
  {
    unint64_t v17 = 0x1E4F42000uLL;
    v323 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v323 userInterfaceIdiom])
    {
      HIDWORD(v379) = 0;
      HIDWORD(v387) = 1;
      goto LABEL_982;
    }
  }
  HIDWORD(v387) = v167 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v313 = [MEMORY[0x1E4F42D90] mainScreen];
      [v313 _referenceBounds];
    }
    uint64_t v20 = v170 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v379) = v20;
    if (v180 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      uint64_t v359 = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      uint64_t v375 = 0;
      LODWORD(v387) = 0;
      LODWORD(v379) = 0;
      double v38 = 52.0;
      goto LABEL_64;
    }
  }
  else
  {
    HIDWORD(v379) = 0;
  }
LABEL_982:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v387) = 0;
      LODWORD(v379) = 0;
      goto LABEL_1039;
    }
  }
  else
  {
    v320 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v320 userInterfaceIdiom])
    {
      LODWORD(v387) = 0;
      LODWORD(v379) = 1;
      goto LABEL_1039;
    }
  }
  LODWORD(v379) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v312 = [MEMORY[0x1E4F42D90] mainScreen];
      [v312 _referenceBounds];
    }
    LODWORD(v387) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v183 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1111;
    }
  }
  else
  {
    LODWORD(v387) = 0;
  }
LABEL_1039:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    uint64_t v359 = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    uint64_t v371 = 0;
    uint64_t v375 = 0;
    double v38 = 0.0;
    goto LABEL_64;
  }
LABEL_1111:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1115:
    HIDWORD(v359) = 0;
    LODWORD(v375) = 0;
    goto LABEL_1180;
  }
  int v184 = __sb__runningInSpringBoard();
  if (v184)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1115;
    }
  }
  else
  {
    v315 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v315 userInterfaceIdiom])
    {
      HIDWORD(v359) = 0;
      LODWORD(v375) = 1;
      goto LABEL_1180;
    }
  }
  LODWORD(v375) = v184 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v195 = __sb__runningInSpringBoard();
    if (v195)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v306 = [MEMORY[0x1E4F42D90] mainScreen];
      [v306 _referenceBounds];
    }
    uint64_t v20 = v195 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v359) = v20;
    if (v205 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      LODWORD(v359) = 0;
      uint64_t v363 = 0;
      uint64_t v367 = 0;
      uint64_t v371 = 0;
      HIDWORD(v375) = 0;
      double v38 = 55.0;
      goto LABEL_1192;
    }
  }
  else
  {
    HIDWORD(v359) = 0;
  }
LABEL_1180:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v371) = 0;
      HIDWORD(v375) = 0;
      goto LABEL_1190;
    }
  }
  else
  {
    v319 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v319 userInterfaceIdiom])
    {
      HIDWORD(v371) = 0;
      HIDWORD(v375) = 1;
      goto LABEL_1190;
    }
  }
  HIDWORD(v375) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v309 = [MEMORY[0x1E4F42D90] mainScreen];
      [v309 _referenceBounds];
    }
    HIDWORD(v371) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1195;
    }
  }
  else
  {
    HIDWORD(v371) = 0;
  }
LABEL_1190:
  if (_SBF_Private_IsD93Like())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    LODWORD(v359) = 0;
    uint64_t v363 = 0;
    uint64_t v367 = 0;
    LODWORD(v371) = 0;
    double v38 = 55.0;
    goto LABEL_1192;
  }
LABEL_1195:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1199:
    HIDWORD(v367) = 0;
    LODWORD(v371) = 0;
    goto LABEL_1270;
  }
  int v197 = __sb__runningInSpringBoard();
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1199;
    }
  }
  else
  {
    v310 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v310 userInterfaceIdiom])
    {
      HIDWORD(v367) = 0;
      LODWORD(v371) = 1;
      goto LABEL_1270;
    }
  }
  LODWORD(v371) = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v302 = [MEMORY[0x1E4F42D90] mainScreen];
      [v302 _referenceBounds];
    }
    HIDWORD(v367) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v225 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      LODWORD(v359) = 0;
      uint64_t v363 = 0;
      LODWORD(v367) = 0;
      double v38 = 55.0;
      goto LABEL_1192;
    }
  }
  else
  {
    HIDWORD(v367) = 0;
  }
LABEL_1270:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v363) = 0;
      LODWORD(v367) = 0;
      goto LABEL_1280;
    }
  }
  else
  {
    v314 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v314 userInterfaceIdiom])
    {
      HIDWORD(v363) = 0;
      LODWORD(v367) = 1;
      goto LABEL_1280;
    }
  }
  LODWORD(v367) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v305 = [MEMORY[0x1E4F42D90] mainScreen];
      [v305 _referenceBounds];
    }
    HIDWORD(v363) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v209 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1284;
    }
  }
  else
  {
    HIDWORD(v363) = 0;
  }
LABEL_1280:
  if (_SBF_Private_IsD63Like())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    uint64_t v355 = 0;
    LODWORD(v359) = 0;
    LODWORD(v363) = 0;
    double v38 = 55.0;
    goto LABEL_1192;
  }
LABEL_1284:
  int v210 = __sb__runningInSpringBoard();
  if (v210)
  {
    unint64_t v17 = 0x1E4F42000uLL;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v359) = 0;
      LODWORD(v363) = 0;
      goto LABEL_1294;
    }
  }
  else
  {
    unint64_t v17 = 0x1E4F42000uLL;
    v311 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v311 userInterfaceIdiom])
    {
      LODWORD(v359) = 0;
      LODWORD(v363) = 1;
      goto LABEL_1294;
    }
  }
  LODWORD(v363) = v210 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v211 = __sb__runningInSpringBoard();
    if (v211)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v303 = [MEMORY[0x1E4F42D90] mainScreen];
      [v303 _referenceBounds];
    }
    uint64_t v20 = v211 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v359) = v20;
    if (v217 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      uint64_t v351 = 0;
      uint64_t v355 = 0;
      *(double *)&uint64_t v218 = 52.0;
LABEL_1573:
      double v38 = *(double *)&v218;
      goto LABEL_64;
    }
  }
  else
  {
    LODWORD(v359) = 0;
  }
LABEL_1294:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v355 = 0;
      goto LABEL_1363;
    }
  }
  else
  {
    v308 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v308 userInterfaceIdiom])
    {
      uint64_t v355 = 0x100000000;
      goto LABEL_1363;
    }
  }
  HIDWORD(v355) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v301 = [MEMORY[0x1E4F42D90] mainScreen];
      [v301 _referenceBounds];
    }
    LODWORD(v355) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v228 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1413;
    }
  }
  else
  {
    LODWORD(v355) = 0;
  }
LABEL_1363:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v347 = 0;
    uint64_t v351 = 0;
    double v38 = 0.0;
    goto LABEL_64;
  }
LABEL_1413:
  int v229 = __sb__runningInSpringBoard();
  if (v229)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v351 = 0;
      goto LABEL_1431;
    }
  }
  else
  {
    v307 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v307 userInterfaceIdiom])
    {
      uint64_t v351 = 0x100000000;
      goto LABEL_1431;
    }
  }
  HIDWORD(v351) = v229 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v300 = [MEMORY[0x1E4F42D90] mainScreen];
      [v300 _referenceBounds];
    }
    LODWORD(v351) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v241 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v347 = 0;
      double v38 = 47.6666;
      goto LABEL_1192;
    }
  }
  else
  {
    LODWORD(v351) = 0;
  }
LABEL_1431:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v347 = 0;
      goto LABEL_1494;
    }
  }
  else
  {
    v304 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v304 userInterfaceIdiom])
    {
      uint64_t v347 = 0x100000000;
      goto LABEL_1494;
    }
  }
  HIDWORD(v347) = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v299 = [MEMORY[0x1E4F42D90] mainScreen];
      [v299 _referenceBounds];
    }
    LODWORD(v347) = v20 ^ 1;
    BSSizeRoundForScale();
    if (v246 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1564;
    }
  }
  else
  {
    LODWORD(v347) = 0;
  }
LABEL_1494:
  if (_SBF_Private_IsD53())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    double v38 = 47.6666;
    goto LABEL_1192;
  }
LABEL_1564:
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    double v38 = 53.0;
    goto LABEL_1192;
  }
  unint64_t v17 = 0x1E4F42000uLL;
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    double v38 = 53.0;
    goto LABEL_64;
  }
  if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    uint64_t v35 = 0;
    int v36 = 0;
    int v37 = 0;
    *(double *)&uint64_t v218 = 46.0;
    goto LABEL_1573;
  }
  int v258 = __sb__runningInSpringBoard();
  if (v258)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v36 = 0;
      int v37 = 0;
      goto LABEL_1682;
    }
  }
  else
  {
    v298 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v298 userInterfaceIdiom])
    {
      int v36 = 0;
      int v37 = 1;
      goto LABEL_1682;
    }
  }
  int v37 = v258 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v294 = [MEMORY[0x1E4F42D90] mainScreen];
      [v294 _referenceBounds];
    }
    int v36 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v274 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      uint64_t v35 = 0;
      double v38 = 46.0;
      goto LABEL_64;
    }
  }
  else
  {
    int v36 = 0;
  }
LABEL_1682:
  int v265 = __sb__runningInSpringBoard();
  if (v265)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v34 = 0;
      uint64_t v35 = 0;
      goto LABEL_1704;
    }
  }
  else
  {
    v297 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v297 userInterfaceIdiom])
    {
      int v34 = 0;
      uint64_t v35 = 1;
      goto LABEL_1704;
    }
  }
  uint64_t v35 = v265 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v20 = __sb__runningInSpringBoard();
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v293 = [MEMORY[0x1E4F42D90] mainScreen];
      [v293 _referenceBounds];
    }
    int v34 = v20 ^ 1;
    BSSizeRoundForScale();
    if (v276 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      double v38 = 0.0;
      goto LABEL_64;
    }
  }
  else
  {
    int v34 = 0;
  }
LABEL_1704:
  uint64_t v20 = __sb__runningInSpringBoard();
  if (!v20)
  {
    v296 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v296 userInterfaceIdiom])
    {
      int v32 = 0;
      int v33 = 1;
      goto LABEL_1724;
    }
LABEL_1720:
    int v33 = v20 ^ 1;
    int v269 = __sb__runningInSpringBoard();
    if (v269)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v295 = [MEMORY[0x1E4F42D90] mainScreen];
      [v295 _referenceBounds];
    }
    int v32 = v269 ^ 1;
    BSSizeRoundForScale();
    if (v270 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1727;
    }
    goto LABEL_1724;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1720;
  }
  int v32 = 0;
  int v33 = 0;
LABEL_1724:
  int v271 = __sb__runningInSpringBoard();
  if (v271)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1727:
      int v30 = 0;
      int v31 = 0;
      double v38 = 0.0;
      goto LABEL_1192;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v20 userInterfaceIdiom])
    {
      int v30 = 0;
      double v38 = 0.0;
      int v31 = 1;
      goto LABEL_1192;
    }
  }
  int v31 = v271 ^ 1;
  int v278 = __sb__runningInSpringBoard();
  if (v278)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v292 = [MEMORY[0x1E4F42D90] mainScreen];
    [v292 _referenceBounds];
  }
  int v30 = v278 ^ 1;
  BSSizeRoundForScale();
  double v38 = 0.0;
  unint64_t v17 = 0x1E4F42000;
  v27 = v292;
LABEL_64:
  if (v30) {

  }
  if (v31) {
  if (v32)
  }

  if (v33) {
  if (v34)
  }
  {

    if (!v35) {
      goto LABEL_74;
    }
  }
  else if (!v35)
  {
LABEL_74:
    if (v36) {
      goto LABEL_75;
    }
LABEL_79:
    if (!v37) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }

  if (!v36) {
    goto LABEL_79;
  }
LABEL_75:

  if (v37) {
LABEL_80:
  }

LABEL_81:
  if (v347) {

  }
  if (HIDWORD(v347)) {
  if (v351)
  }

  if (HIDWORD(v351)) {
  if (v355)
  }

  if (HIDWORD(v355)) {
  if (v359)
  }

  if (v363) {
  if (HIDWORD(v363))
  }

  if (v367) {
  if (HIDWORD(v367))
  }

  if (v371) {
  if (HIDWORD(v371))
  }

  if (HIDWORD(v375)) {
  if (HIDWORD(v359))
  }

  if (v375) {
  if (v387)
  }

  if (v379) {
  if (HIDWORD(v379))
  }

  if (HIDWORD(v387)) {
  if (v383)
  }

  if (v391) {
  if (HIDWORD(v391))
  }

  if (v395) {
  if (HIDWORD(v383))
  }

  if (HIDWORD(v395)) {
  if (v399)
  }

  if (v403) {
  if (HIDWORD(v399))
  }

  if (HIDWORD(v403)) {
  if (*(_DWORD *)v407)
  }

  if (*(_DWORD *)&v407[4]) {
  if (*(_DWORD *)&v407[12])
  }

  if (*(_DWORD *)&v407[16]) {
  if (*(_DWORD *)&v407[20])
  }

  if (*(_DWORD *)&v407[24]) {
  if (*(_DWORD *)&v407[28])
  }

  if (*(_DWORD *)&v407[32]) {
  if (*(_DWORD *)&v407[36])
  }

  if (*(_DWORD *)&v407[8])
  {

    if (!HIDWORD(v411)) {
      goto LABEL_161;
    }
  }
  else if (!HIDWORD(v411))
  {
LABEL_161:
    if (v410) {
      goto LABEL_162;
    }
    goto LABEL_168;
  }

  if (v410)
  {
LABEL_162:

    if (!v411) {
      goto LABEL_163;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v411)
  {
LABEL_163:
    if (v412) {
      goto LABEL_164;
    }
LABEL_170:
    if (!v413) {
      goto LABEL_172;
    }
    goto LABEL_171;
  }
LABEL_169:

  if (!v412) {
    goto LABEL_170;
  }
LABEL_164:

  if (v413) {
LABEL_171:
  }

LABEL_172:
  if (BSFloatGreaterThanFloat()) {
    double v45 = 2.33333333;
  }
  else {
    double v45 = 2.5;
  }
  int v46 = __sb__runningInSpringBoard();
  if (v46)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unsigned int v47 = 0;
      int v48 = 0;
      goto LABEL_184;
    }
  }
  else
  {
    v341 = [*(id *)(v17 + 2376) currentDevice];
    if ([v341 userInterfaceIdiom] != 1)
    {
      unsigned int v47 = 0;
      int v48 = 1;
      goto LABEL_184;
    }
  }
  int v48 = v46 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v342 = [MEMORY[0x1E4F42D90] mainScreen];
      [v342 _referenceBounds];
    }
    unsigned int v47 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v70 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v69 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      unsigned int v412 = v49 ^ 1;
      int v413 = v48;
      uint64_t v400 = 0;
      uint64_t v396 = 0;
      uint64_t v404 = 0;
      uint64_t v384 = 0;
      uint64_t v392 = 0;
      memset(v407, 0, 40);
      uint64_t v380 = 0;
      uint64_t v388 = 0;
      uint64_t v376 = 0;
      uint64_t v372 = 0;
      uint64_t v368 = 0;
      uint64_t v364 = 0;
      uint64_t v360 = 0;
      uint64_t v356 = 0;
      int v410 = 0;
      unint64_t v411 = 0;
      uint64_t v352 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 24.0;
      goto LABEL_238;
    }
  }
  else
  {
    unsigned int v47 = 0;
  }
LABEL_184:
  int v50 = __sb__runningInSpringBoard();
  unsigned int v412 = v47;
  int v413 = v48;
  if (v50)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unsigned int v51 = 0;
      int v52 = 0;
      goto LABEL_193;
    }
  }
  else
  {
    v340 = [*(id *)(v17 + 2376) currentDevice];
    if ([v340 userInterfaceIdiom] != 1)
    {
      unsigned int v51 = 0;
      int v52 = 1;
      goto LABEL_193;
    }
  }
  int v52 = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v332 = [MEMORY[0x1E4F42D90] mainScreen];
      [v332 _referenceBounds];
    }
    unsigned int v51 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      *(_DWORD *)&v407[32] = v49 ^ 1;
      *(_DWORD *)&v407[36] = v52;
      uint64_t v400 = 0;
      uint64_t v396 = 0;
      uint64_t v404 = 0;
      uint64_t v384 = 0;
      uint64_t v392 = 0;
      memset(v407, 0, 32);
      uint64_t v380 = 0;
      uint64_t v388 = 0;
      uint64_t v376 = 0;
      uint64_t v372 = 0;
      uint64_t v368 = 0;
      uint64_t v364 = 0;
      uint64_t v360 = 0;
      uint64_t v356 = 0;
      int v410 = 0;
      unint64_t v411 = 0;
      uint64_t v352 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 26.0;
      goto LABEL_238;
    }
  }
  else
  {
    unsigned int v51 = 0;
  }
LABEL_193:
  int v53 = __sb__runningInSpringBoard();
  *(void *)&v407[32] = __PAIR64__(v52, v51);
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unsigned int v54 = 0;
      int v55 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    v339 = [*(id *)(v17 + 2376) currentDevice];
    if ([v339 userInterfaceIdiom] != 1)
    {
      unsigned int v54 = 0;
      int v55 = 1;
      goto LABEL_202;
    }
  }
  int v55 = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v331 = [MEMORY[0x1E4F42D90] mainScreen];
      [v331 _referenceBounds];
    }
    unsigned int v54 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v411) = v49 ^ 1;
      HIDWORD(v411) = v55;
      uint64_t v400 = 0;
      uint64_t v396 = 0;
      uint64_t v404 = 0;
      uint64_t v384 = 0;
      uint64_t v392 = 0;
      memset(v407, 0, 32);
      uint64_t v380 = 0;
      uint64_t v388 = 0;
      uint64_t v376 = 0;
      uint64_t v372 = 0;
      uint64_t v368 = 0;
      uint64_t v364 = 0;
      uint64_t v360 = 0;
      uint64_t v356 = 0;
      int v410 = 0;
      uint64_t v348 = 0;
      uint64_t v352 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 26.0;
      goto LABEL_238;
    }
  }
  else
  {
    unsigned int v54 = 0;
  }
LABEL_202:
  int v56 = __sb__runningInSpringBoard();
  unint64_t v411 = __PAIR64__(v55, v54);
  if (v56)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_DWORD *)&v407[28] = 0;
      int v57 = 0;
      goto LABEL_211;
    }
  }
  else
  {
    v338 = [*(id *)(v17 + 2376) currentDevice];
    if ([v338 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[28] = 0;
      int v57 = 1;
      goto LABEL_211;
    }
  }
  int v57 = v56 ^ 1;
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v335 = [MEMORY[0x1E4F42D90] mainScreen];
    [v335 _referenceBounds];
  }
  *(_DWORD *)&v407[28] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v410 = v57;
    uint64_t v400 = 0;
    uint64_t v396 = 0;
    uint64_t v404 = 0;
    uint64_t v384 = 0;
    uint64_t v392 = 0;
    memset(v407, 0, 28);
    uint64_t v380 = 0;
    uint64_t v388 = 0;
    uint64_t v376 = 0;
    uint64_t v372 = 0;
    uint64_t v368 = 0;
    uint64_t v364 = 0;
    uint64_t v360 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 24.0;
    goto LABEL_238;
  }
LABEL_211:
  int v59 = __sb__runningInSpringBoard();
  int v410 = v57;
  if (v59)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[20] = 0;
      goto LABEL_221;
    }
  }
  else
  {
    v337 = [*(id *)(v17 + 2376) currentDevice];
    if ([v337 userInterfaceIdiom] != 1)
    {
      *(void *)&v407[20] = 0x100000000;
      goto LABEL_221;
    }
  }
  *(_DWORD *)&v407[24] = v59 ^ 1;
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v333 = [MEMORY[0x1E4F42D90] mainScreen];
    [v333 _referenceBounds];
  }
  *(_DWORD *)&v407[20] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    uint64_t v400 = 0;
    uint64_t v396 = 0;
    uint64_t v404 = 0;
    uint64_t v384 = 0;
    uint64_t v392 = 0;
    memset(v407, 0, 20);
    uint64_t v380 = 0;
    uint64_t v388 = 0;
    uint64_t v376 = 0;
    uint64_t v372 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v360 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 24.0;
    goto LABEL_238;
  }
LABEL_221:
  int v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[12] = 0;
      goto LABEL_400;
    }
  }
  else
  {
    v336 = [*(id *)(v17 + 2376) currentDevice];
    if ([v336 userInterfaceIdiom] != 1)
    {
      *(void *)&v407[12] = 0x100000000;
      goto LABEL_400;
    }
  }
  *(_DWORD *)&v407[16] = v68 ^ 1;
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v330 = [MEMORY[0x1E4F42D90] mainScreen];
    [v330 _referenceBounds];
  }
  *(_DWORD *)&v407[12] = v49 ^ 1;
  BSSizeRoundForScale();
  if (v98 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    uint64_t v400 = 0;
    uint64_t v396 = 0;
    uint64_t v404 = 0;
    uint64_t v384 = 0;
    uint64_t v392 = 0;
    *(void *)v407 = 0;
    uint64_t v380 = 0;
    uint64_t v388 = 0;
    *(_DWORD *)&v407[8] = 0;
    uint64_t v372 = 0;
    uint64_t v376 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 24.0;
    goto LABEL_238;
  }
LABEL_400:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_402;
    }
LABEL_408:
    uint64_t v400 = 0;
    uint64_t v396 = 0;
    uint64_t v404 = 0;
    uint64_t v384 = 0;
    uint64_t v392 = 0;
    *(void *)v407 = 0;
    uint64_t v380 = 0;
    uint64_t v388 = 0;
    uint64_t v372 = 0;
    uint64_t v376 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 24.0;
    *(_DWORD *)&v407[8] = v49 ^ 1;
    goto LABEL_238;
  }
  v334 = [*(id *)(v17 + 2376) currentDevice];
  if ([v334 userInterfaceIdiom] == 1) {
    goto LABEL_408;
  }
LABEL_402:
  uint64_t v35 = (uint64_t)&qword_1D8506000;
  *(_DWORD *)&v407[8] = v49 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_406:
    *(void *)v407 = 0;
    goto LABEL_788;
  }
  int v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_406;
    }
  }
  else
  {
    v328 = [*(id *)(v17 + 2376) currentDevice];
    if ([v328 userInterfaceIdiom])
    {
      *(void *)v407 = 0x100000000;
      goto LABEL_788;
    }
  }
  *(_DWORD *)&v407[4] = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v321 = [MEMORY[0x1E4F42D90] mainScreen];
      [v321 _referenceBounds];
    }
    *(_DWORD *)v407 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      uint64_t v400 = 0;
      uint64_t v396 = 0;
      uint64_t v404 = 0;
      uint64_t v384 = 0;
      uint64_t v388 = 0;
      uint64_t v392 = 0;
      uint64_t v376 = 0;
      uint64_t v380 = 0;
      uint64_t v360 = 0;
      uint64_t v364 = 0;
      uint64_t v368 = 0;
      uint64_t v372 = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    *(_DWORD *)v407 = 0;
  }
LABEL_788:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v400) = 0;
      HIDWORD(v404) = 0;
      goto LABEL_798;
    }
  }
  else
  {
    v329 = [*(id *)(v17 + 2376) currentDevice];
    if ([v329 userInterfaceIdiom])
    {
      HIDWORD(v400) = 0;
      HIDWORD(v404) = 1;
      goto LABEL_798;
    }
  }
  HIDWORD(v404) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v324 = [MEMORY[0x1E4F42D90] mainScreen];
      [v324 _referenceBounds];
    }
    HIDWORD(v400) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v149 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_802;
    }
  }
  else
  {
    HIDWORD(v400) = 0;
  }
LABEL_798:
  if (_SBF_Private_IsD94Like())
  {
    LODWORD(v400) = 0;
    uint64_t v396 = 0;
    LODWORD(v404) = 0;
    uint64_t v384 = 0;
    uint64_t v388 = 0;
    uint64_t v392 = 0;
    uint64_t v376 = 0;
    uint64_t v380 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v372 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_802:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_806:
    LODWORD(v400) = 0;
    LODWORD(v404) = 0;
    goto LABEL_855;
  }
  int v150 = __sb__runningInSpringBoard();
  if (v150)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_806;
    }
  }
  else
  {
    v325 = [*(id *)(v17 + 2376) currentDevice];
    if ([v325 userInterfaceIdiom])
    {
      LODWORD(v400) = 0;
      LODWORD(v404) = 1;
      goto LABEL_855;
    }
  }
  LODWORD(v404) = v150 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v316 = [MEMORY[0x1E4F42D90] mainScreen];
      [v316 _referenceBounds];
    }
    LODWORD(v400) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v164 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v396 = 0;
      uint64_t v384 = 0;
      uint64_t v388 = 0;
      uint64_t v392 = 0;
      uint64_t v376 = 0;
      uint64_t v380 = 0;
      uint64_t v360 = 0;
      uint64_t v364 = 0;
      uint64_t v368 = 0;
      uint64_t v372 = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v400) = 0;
  }
LABEL_855:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v396) = 0;
      HIDWORD(v384) = 0;
      goto LABEL_865;
    }
  }
  else
  {
    v327 = [*(id *)(v17 + 2376) currentDevice];
    if ([v327 userInterfaceIdiom])
    {
      HIDWORD(v384) = 0;
      HIDWORD(v396) = 1;
      goto LABEL_865;
    }
  }
  HIDWORD(v396) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v320 = [MEMORY[0x1E4F42D90] mainScreen];
      [v320 _referenceBounds];
    }
    HIDWORD(v384) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v155 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_869;
    }
  }
  else
  {
    HIDWORD(v384) = 0;
  }
LABEL_865:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v396) = 0;
    uint64_t v388 = 0;
    uint64_t v392 = 0;
    LODWORD(v384) = 0;
    uint64_t v376 = 0;
    uint64_t v380 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v372 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_869:
  int v156 = __sb__runningInSpringBoard();
  if (v156)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v396) = 0;
      HIDWORD(v392) = 0;
      goto LABEL_879;
    }
  }
  else
  {
    v326 = [*(id *)(v17 + 2376) currentDevice];
    if ([v326 userInterfaceIdiom])
    {
      HIDWORD(v392) = 0;
      LODWORD(v396) = 1;
      goto LABEL_879;
    }
  }
  LODWORD(v396) = v156 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v317 = [MEMORY[0x1E4F42D90] mainScreen];
      [v317 _referenceBounds];
    }
    HIDWORD(v392) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v160 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v392) = 0;
      LODWORD(v384) = 0;
      uint64_t v388 = 0;
      uint64_t v376 = 0;
      uint64_t v380 = 0;
      uint64_t v360 = 0;
      uint64_t v364 = 0;
      uint64_t v368 = 0;
      uint64_t v372 = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 38.6666;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v392) = 0;
  }
LABEL_879:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v392) = 0;
      LODWORD(v384) = 0;
      goto LABEL_920;
    }
  }
  else
  {
    v323 = [*(id *)(v17 + 2376) currentDevice];
    if ([v323 userInterfaceIdiom])
    {
      LODWORD(v384) = 0;
      LODWORD(v392) = 1;
      goto LABEL_920;
    }
  }
  LODWORD(v392) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v315 = [MEMORY[0x1E4F42D90] mainScreen];
      [v315 _referenceBounds];
    }
    LODWORD(v384) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v168 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_972;
    }
  }
  else
  {
    LODWORD(v384) = 0;
  }
LABEL_920:
  if (_SBF_Private_IsD54())
  {
    uint64_t v388 = 0;
    uint64_t v376 = 0;
    uint64_t v380 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v372 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 38.6666;
    goto LABEL_238;
  }
LABEL_972:
  int v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v388) = 0;
      HIDWORD(v380) = 0;
      goto LABEL_992;
    }
  }
  else
  {
    v322 = [*(id *)(v17 + 2376) currentDevice];
    if ([v322 userInterfaceIdiom])
    {
      HIDWORD(v380) = 0;
      HIDWORD(v388) = 1;
      goto LABEL_992;
    }
  }
  HIDWORD(v388) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v171 = __sb__runningInSpringBoard();
    if (v171)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v312 = [MEMORY[0x1E4F42D90] mainScreen];
      [v312 _referenceBounds];
    }
    uint64_t v49 = v171 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v380) = v49;
    if (v181 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v380) = 0;
      LODWORD(v388) = 0;
      uint64_t v372 = 0;
      uint64_t v376 = 0;
      uint64_t v360 = 0;
      uint64_t v364 = 0;
      uint64_t v368 = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v380) = 0;
  }
LABEL_992:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v380) = 0;
      LODWORD(v388) = 0;
      goto LABEL_1046;
    }
  }
  else
  {
    v319 = [*(id *)(v17 + 2376) currentDevice];
    if ([v319 userInterfaceIdiom])
    {
      LODWORD(v388) = 0;
      LODWORD(v380) = 1;
      goto LABEL_1046;
    }
  }
  LODWORD(v380) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v311 = [MEMORY[0x1E4F42D90] mainScreen];
      [v311 _referenceBounds];
    }
    LODWORD(v388) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v185 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1120;
    }
  }
  else
  {
    LODWORD(v388) = 0;
  }
LABEL_1046:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v372 = 0;
    uint64_t v376 = 0;
    uint64_t v360 = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 0.0;
    goto LABEL_238;
  }
LABEL_1120:
  uint64_t v35 = (uint64_t)&qword_1D8506000;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1124:
    LODWORD(v376) = 0;
    HIDWORD(v360) = 0;
    goto LABEL_1206;
  }
  int v186 = __sb__runningInSpringBoard();
  if (v186)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1124;
    }
  }
  else
  {
    v314 = [*(id *)(v17 + 2376) currentDevice];
    if ([v314 userInterfaceIdiom])
    {
      HIDWORD(v360) = 0;
      LODWORD(v376) = 1;
      goto LABEL_1206;
    }
  }
  LODWORD(v376) = v186 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v198 = __sb__runningInSpringBoard();
    if (v198)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v305 = [MEMORY[0x1E4F42D90] mainScreen];
      [v305 _referenceBounds];
    }
    uint64_t v49 = v198 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v360) = v49;
    if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      HIDWORD(v376) = 0;
      uint64_t v368 = 0;
      uint64_t v372 = 0;
      uint64_t v364 = 0;
      LODWORD(v360) = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v360) = 0;
  }
LABEL_1206:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v376) = 0;
      HIDWORD(v372) = 0;
      goto LABEL_1216;
    }
  }
  else
  {
    v318 = [*(id *)(v17 + 2376) currentDevice];
    if ([v318 userInterfaceIdiom])
    {
      HIDWORD(v372) = 0;
      HIDWORD(v376) = 1;
      goto LABEL_1216;
    }
  }
  HIDWORD(v376) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v308 = [MEMORY[0x1E4F42D90] mainScreen];
      [v308 _referenceBounds];
    }
    HIDWORD(v372) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v199 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1220;
    }
  }
  else
  {
    HIDWORD(v372) = 0;
  }
LABEL_1216:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v372) = 0;
    uint64_t v364 = 0;
    uint64_t v368 = 0;
    LODWORD(v360) = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1220:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1224:
    LODWORD(v372) = 0;
    HIDWORD(v368) = 0;
    goto LABEL_1304;
  }
  int v200 = __sb__runningInSpringBoard();
  if (v200)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1224;
    }
  }
  else
  {
    v309 = [*(id *)(v17 + 2376) currentDevice];
    if ([v309 userInterfaceIdiom])
    {
      HIDWORD(v368) = 0;
      LODWORD(v372) = 1;
      goto LABEL_1304;
    }
  }
  LODWORD(v372) = v200 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v301 = [MEMORY[0x1E4F42D90] mainScreen];
      [v301 _referenceBounds];
    }
    HIDWORD(v368) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v226 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v368) = 0;
      uint64_t v364 = 0;
      LODWORD(v360) = 0;
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    HIDWORD(v368) = 0;
  }
LABEL_1304:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v368) = 0;
      HIDWORD(v364) = 0;
      goto LABEL_1314;
    }
  }
  else
  {
    v313 = [*(id *)(v17 + 2376) currentDevice];
    if ([v313 userInterfaceIdiom])
    {
      HIDWORD(v364) = 0;
      LODWORD(v368) = 1;
      goto LABEL_1314;
    }
  }
  LODWORD(v368) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v304 = [MEMORY[0x1E4F42D90] mainScreen];
      [v304 _referenceBounds];
    }
    HIDWORD(v364) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v212 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1318;
    }
  }
  else
  {
    HIDWORD(v364) = 0;
  }
LABEL_1314:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v364) = 0;
    LODWORD(v360) = 0;
    uint64_t v352 = 0;
    uint64_t v356 = 0;
    uint64_t v348 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1318:
  int v213 = __sb__runningInSpringBoard();
  if (v213)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v364) = 0;
      LODWORD(v360) = 0;
      goto LABEL_1328;
    }
  }
  else
  {
    v310 = [*(id *)(v17 + 2376) currentDevice];
    if ([v310 userInterfaceIdiom])
    {
      LODWORD(v360) = 0;
      LODWORD(v364) = 1;
      goto LABEL_1328;
    }
  }
  LODWORD(v364) = v213 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v214 = __sb__runningInSpringBoard();
    if (v214)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v302 = [MEMORY[0x1E4F42D90] mainScreen];
      [v302 _referenceBounds];
    }
    uint64_t v49 = v214 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v360) = v49;
    if (v219 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v352 = 0;
      uint64_t v356 = 0;
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 36.0;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v360) = 0;
  }
LABEL_1328:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v356 = 0;
      goto LABEL_1369;
    }
  }
  else
  {
    v307 = [*(id *)(v17 + 2376) currentDevice];
    if ([v307 userInterfaceIdiom])
    {
      uint64_t v356 = 0x100000000;
      goto LABEL_1369;
    }
  }
  HIDWORD(v356) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v300 = [MEMORY[0x1E4F42D90] mainScreen];
      [v300 _referenceBounds];
    }
    LODWORD(v356) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v230 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1421;
    }
  }
  else
  {
    LODWORD(v356) = 0;
  }
LABEL_1369:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v348 = 0;
    uint64_t v352 = 0;
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 0.0;
    goto LABEL_238;
  }
LABEL_1421:
  int v231 = __sb__runningInSpringBoard();
  if (v231)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v352 = 0;
      goto LABEL_1441;
    }
  }
  else
  {
    v306 = [*(id *)(v17 + 2376) currentDevice];
    if ([v306 userInterfaceIdiom])
    {
      uint64_t v352 = 0x100000000;
      goto LABEL_1441;
    }
  }
  HIDWORD(v352) = v231 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v299 = [MEMORY[0x1E4F42D90] mainScreen];
      [v299 _referenceBounds];
    }
    LODWORD(v352) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v242 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      uint64_t v348 = 0;
      int v344 = 0;
      int v60 = 0;
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 39.0;
      goto LABEL_238;
    }
  }
  else
  {
    LODWORD(v352) = 0;
  }
LABEL_1441:
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v348 = 0;
      goto LABEL_1500;
    }
  }
  else
  {
    v303 = [*(id *)(v17 + 2376) currentDevice];
    if ([v303 userInterfaceIdiom])
    {
      uint64_t v348 = 0x100000000;
      goto LABEL_1500;
    }
  }
  HIDWORD(v348) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v298 = [MEMORY[0x1E4F42D90] mainScreen];
      [v298 _referenceBounds];
    }
    LODWORD(v348) = v49 ^ 1;
    BSSizeRoundForScale();
    if (v247 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1576;
    }
  }
  else
  {
    LODWORD(v348) = 0;
  }
LABEL_1500:
  if (_SBF_Private_IsD53())
  {
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 39.0;
    goto LABEL_238;
  }
LABEL_1576:
  uint64_t v49 = (uint64_t)&off_1D8504000;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    double v66 = 41.0;
    goto LABEL_238;
  }
  double v66 = 41.0;
  if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v344 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    goto LABEL_238;
  }
  uint64_t v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v344 = 0;
      int v60 = 0;
      goto LABEL_1692;
    }
  }
  else
  {
    v297 = [*(id *)(v17 + 2376) currentDevice];
    if ([v297 userInterfaceIdiom])
    {
      int v60 = 0;
      int v344 = 1;
      goto LABEL_1692;
    }
  }
  int v344 = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v294 = [MEMORY[0x1E4F42D90] mainScreen];
      [v294 _referenceBounds];
    }
    int v60 = v49 ^ 1;
    BSSizeRoundForScale();
    if (v275 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v61 = 0;
      int v62 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 36.0;
      goto LABEL_238;
    }
  }
  else
  {
    int v60 = 0;
  }
LABEL_1692:
  int v266 = __sb__runningInSpringBoard();
  if (v266)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v61 = 0;
      int v62 = 0;
      goto LABEL_1714;
    }
  }
  else
  {
    v296 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v296 userInterfaceIdiom])
    {
      int v62 = 0;
      int v61 = 1;
      goto LABEL_1714;
    }
  }
  int v61 = v266 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v267 = __sb__runningInSpringBoard();
    if (v267)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v293 = [MEMORY[0x1E4F42D90] mainScreen];
      [v293 _referenceBounds];
    }
    int v62 = v267 ^ 1;
    BSSizeRoundForScale();
    if (v277 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      double v66 = 0.0;
      goto LABEL_238;
    }
  }
  else
  {
    int v62 = 0;
  }
LABEL_1714:
  int v268 = __sb__runningInSpringBoard();
  if (!v268)
  {
    v295 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v295 userInterfaceIdiom])
    {
      int v64 = 0;
      int v63 = 1;
      goto LABEL_1734;
    }
LABEL_1730:
    int v63 = v268 ^ 1;
    uint64_t v35 = __sb__runningInSpringBoard();
    if (v35)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v49 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v49 _referenceBounds];
    }
    int v64 = v35 ^ 1;
    BSSizeRoundForScale();
    if (v272 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1737;
    }
    goto LABEL_1734;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1730;
  }
  int v63 = 0;
  int v64 = 0;
LABEL_1734:
  uint64_t v273 = __sb__runningInSpringBoard();
  if (v273)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1737:
      int v65 = 0;
      double v66 = 0.0;
      goto LABEL_238;
    }
  }
  else
  {
    uint64_t v35 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v35 userInterfaceIdiom])
    {
      double v66 = 0.0;
      int v65 = 1;
      goto LABEL_238;
    }
  }
  int v65 = v273 ^ 1;
  int v279 = __sb__runningInSpringBoard();
  if (v279)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v273 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v273 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v66 = 0.0;
  if (v279 != 1) {

  }
LABEL_238:
  if (v65) {

  }
  v73 = v414;
  if (v64) {

  }
  uint64_t v74 = v412;
  if (v63) {

  }
  uint64_t v75 = HIDWORD(v411);
  if (v62) {

  }
  if (v61) {
  if (v60)
  }

  if (v344) {
  if (v348)
  }

  if (HIDWORD(v348)) {
  if (v352)
  }

  if (HIDWORD(v352)) {
  if (v356)
  }

  if (HIDWORD(v356)) {
  if (v360)
  }

  if (v364) {
  if (HIDWORD(v364))
  }

  if (v368) {
  if (HIDWORD(v368))
  }

  if (v372) {
  if (HIDWORD(v372))
  }

  if (HIDWORD(v376)) {
  if (HIDWORD(v360))
  }

  if (v376) {
  if (v388)
  }

  if (v380) {
  if (HIDWORD(v380))
  }

  if (HIDWORD(v388)) {
  if (v384)
  }

  if (v392) {
  if (HIDWORD(v392))
  }

  if (v396) {
  if (HIDWORD(v384))
  }

  if (HIDWORD(v396)) {
  if (v400)
  }

  if (v404) {
  if (HIDWORD(v400))
  }

  if (HIDWORD(v404)) {
  if (*(_DWORD *)v407)
  }

  if (*(_DWORD *)&v407[4]) {
  if (*(_DWORD *)&v407[8])
  }

  if (*(_DWORD *)&v407[12]) {
  if (*(_DWORD *)&v407[16])
  }

  if (*(_DWORD *)&v407[20]) {
  if (*(_DWORD *)&v407[24])
  }

  if (*(_DWORD *)&v407[28])
  {

    if (!v410) {
      goto LABEL_328;
    }
  }
  else if (!v410)
  {
LABEL_328:
    if (v411) {
      goto LABEL_329;
    }
    goto LABEL_345;
  }

  if (v411)
  {
LABEL_329:

    if (!HIDWORD(v411)) {
      goto LABEL_330;
    }
    goto LABEL_346;
  }
LABEL_345:
  if (!HIDWORD(v411))
  {
LABEL_330:
    if (!*(_DWORD *)&v407[32]) {
      goto LABEL_332;
    }
    goto LABEL_331;
  }
LABEL_346:

  if (*(_DWORD *)&v407[32]) {
LABEL_331:
  }

LABEL_332:
  if (*(_DWORD *)&v407[36])
  {

    if (!v412) {
      goto LABEL_334;
    }
  }
  else if (!v412)
  {
LABEL_334:
    if (!v413) {
      goto LABEL_336;
    }
    goto LABEL_335;
  }

  if (v413) {
LABEL_335:
  }

LABEL_336:
  if (![(CSTeachableMomentsContainerView *)v414 usesStatusBarRelativeLayoutForControlCenterTutors])
  {
    int v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v84 = 0;
        uint64_t v85 = 0;
        goto LABEL_361;
      }
    }
    else
    {
      v340 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v340 userInterfaceIdiom] != 1)
      {
        uint64_t v85 = 0;
        int v84 = 1;
        goto LABEL_361;
      }
    }
    int v84 = v83 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v87 = __sb__runningInSpringBoard();
      if (v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v341 = [MEMORY[0x1E4F42D90] mainScreen];
        [v341 _referenceBounds];
      }
      uint64_t v85 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v110 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v109 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        unsigned int v412 = v87 ^ 1;
        int v413 = v84;
        unint64_t v411 = 0;
        int v410 = 0;
        memset(v407, 0, 40);
        uint64_t v397 = 0;
        uint64_t v389 = 0;
        uint64_t v393 = 0;
        uint64_t v405 = 0;
        uint64_t v401 = 0;
        uint64_t v381 = 0;
        uint64_t v385 = 0;
        uint64_t v373 = 0;
        uint64_t v377 = 0;
        uint64_t v365 = 0;
        uint64_t v369 = 0;
        uint64_t v357 = 0;
        uint64_t v361 = 0;
        unint64_t v349 = 0;
        uint64_t v353 = 0;
        int v345 = 0;
        LODWORD(v342) = 0;
        int v102 = 0;
        int v103 = 0;
        uint64_t v75 = 0;
        int v104 = 0;
        int v105 = 0;
        double v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      uint64_t v85 = 0;
    }
LABEL_361:
    int v88 = __sb__runningInSpringBoard();
    unsigned int v412 = v85;
    int v413 = v84;
    if (v88)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v89 = 0;
        unsigned int v90 = 0;
        goto LABEL_370;
      }
    }
    else
    {
      v339 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v339 userInterfaceIdiom] != 1)
      {
        unsigned int v90 = 0;
        int v89 = 1;
        goto LABEL_370;
      }
    }
    int v89 = v88 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v87 = __sb__runningInSpringBoard();
      if (v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v331 = [MEMORY[0x1E4F42D90] mainScreen];
        [v331 _referenceBounds];
      }
      unsigned int v90 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v111 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        LODWORD(v411) = v87 ^ 1;
        HIDWORD(v411) = v89;
        int v410 = 0;
        memset(v407, 0, 40);
        uint64_t v397 = 0;
        uint64_t v389 = 0;
        uint64_t v393 = 0;
        uint64_t v405 = 0;
        uint64_t v401 = 0;
        uint64_t v381 = 0;
        uint64_t v385 = 0;
        uint64_t v373 = 0;
        uint64_t v377 = 0;
        uint64_t v365 = 0;
        uint64_t v369 = 0;
        uint64_t v357 = 0;
        uint64_t v361 = 0;
        unint64_t v349 = 0;
        uint64_t v353 = 0;
        int v345 = 0;
        LODWORD(v342) = 0;
        int v102 = 0;
        int v103 = 0;
        uint64_t v75 = 0;
        int v104 = 0;
        int v105 = 0;
        double v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      unsigned int v90 = 0;
    }
LABEL_370:
    int v91 = __sb__runningInSpringBoard();
    unint64_t v411 = __PAIR64__(v89, v90);
    if (v91)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v92 = 0;
        int v93 = 0;
        goto LABEL_379;
      }
    }
    else
    {
      v338 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v338 userInterfaceIdiom] != 1)
      {
        int v93 = 0;
        int v92 = 1;
        goto LABEL_379;
      }
    }
    int v92 = v91 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v87 = __sb__runningInSpringBoard();
      if (v87)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v330 = [MEMORY[0x1E4F42D90] mainScreen];
        [v330 _referenceBounds];
      }
      int v93 = v87 ^ 1;
      BSSizeRoundForScale();
      if (v112 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        *(_DWORD *)&v407[36] = v87 ^ 1;
        int v410 = v92;
        memset(v407, 0, 36);
        uint64_t v397 = 0;
        uint64_t v389 = 0;
        uint64_t v393 = 0;
        uint64_t v405 = 0;
        uint64_t v401 = 0;
        uint64_t v381 = 0;
        uint64_t v385 = 0;
        uint64_t v373 = 0;
        uint64_t v377 = 0;
        uint64_t v365 = 0;
        uint64_t v369 = 0;
        uint64_t v357 = 0;
        uint64_t v361 = 0;
        unint64_t v349 = 0;
        uint64_t v353 = 0;
        int v345 = 0;
        LODWORD(v342) = 0;
        int v102 = 0;
        int v103 = 0;
        uint64_t v75 = 0;
        int v104 = 0;
        int v105 = 0;
        double v106 = 0.0;
        goto LABEL_441;
      }
    }
    else
    {
      int v93 = 0;
    }
LABEL_379:
    int v94 = __sb__runningInSpringBoard();
    int v410 = v92;
    *(_DWORD *)&v407[36] = v93;
    if (v94)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v95 = 0;
        uint64_t v74 = 0;
        goto LABEL_414;
      }
    }
    else
    {
      v337 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v337 userInterfaceIdiom] != 1)
      {
        uint64_t v74 = 0;
        int v95 = 1;
        goto LABEL_414;
      }
    }
    int v95 = v94 ^ 1;
    uint64_t v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v334 = [MEMORY[0x1E4F42D90] mainScreen];
      [v334 _referenceBounds];
    }
    uint64_t v74 = v87 ^ 1;
    BSSizeRoundForScale();
    if (v100 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      *(_DWORD *)&v407[28] = v87 ^ 1;
      *(_DWORD *)&v407[32] = v95;
      memset(v407, 0, 28);
      uint64_t v397 = 0;
      uint64_t v389 = 0;
      uint64_t v393 = 0;
      uint64_t v405 = 0;
      uint64_t v401 = 0;
      uint64_t v381 = 0;
      uint64_t v385 = 0;
      uint64_t v373 = 0;
      uint64_t v377 = 0;
      uint64_t v365 = 0;
      uint64_t v369 = 0;
      uint64_t v357 = 0;
      uint64_t v361 = 0;
      unint64_t v349 = 0;
      uint64_t v353 = 0;
      int v345 = 0;
      LODWORD(v342) = 0;
      int v102 = 0;
      int v103 = 0;
      uint64_t v75 = 0;
      int v104 = 0;
      int v105 = 0;
      double v106 = 0.0;
      goto LABEL_441;
    }
LABEL_414:
    int v101 = __sb__runningInSpringBoard();
    *(_DWORD *)&v407[28] = v74;
    *(_DWORD *)&v407[32] = v95;
    if (v101)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v407[20] = 0;
        goto LABEL_424;
      }
    }
    else
    {
      v336 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v336 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v407[20] = 0;
        *(_DWORD *)&v407[24] = 1;
        goto LABEL_424;
      }
    }
    *(_DWORD *)&v407[24] = v101 ^ 1;
    uint64_t v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v332 = [MEMORY[0x1E4F42D90] mainScreen];
      [v332 _referenceBounds];
    }
    *(_DWORD *)&v407[20] = v87 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      memset(v407, 0, 20);
      uint64_t v397 = 0;
      uint64_t v389 = 0;
      uint64_t v393 = 0;
      uint64_t v405 = 0;
      uint64_t v401 = 0;
      uint64_t v381 = 0;
      uint64_t v385 = 0;
      uint64_t v373 = 0;
      uint64_t v377 = 0;
      uint64_t v365 = 0;
      uint64_t v369 = 0;
      uint64_t v357 = 0;
      uint64_t v361 = 0;
      unint64_t v349 = 0;
      uint64_t v353 = 0;
      int v345 = 0;
      LODWORD(v342) = 0;
      int v102 = 0;
      int v103 = 0;
      uint64_t v75 = 0;
      int v104 = 0;
      int v105 = 0;
      double v106 = 0.0;
      goto LABEL_441;
    }
LABEL_424:
    int v108 = __sb__runningInSpringBoard();
    if (v108)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)&v407[12] = 0;
        goto LABEL_599;
      }
    }
    else
    {
      v335 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v335 userInterfaceIdiom] != 1)
      {
        *(_DWORD *)&v407[12] = 0;
        *(_DWORD *)&v407[16] = 1;
        goto LABEL_599;
      }
    }
    *(_DWORD *)&v407[16] = v108 ^ 1;
    uint64_t v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v329 = [MEMORY[0x1E4F42D90] mainScreen];
      [v329 _referenceBounds];
    }
    *(_DWORD *)&v407[12] = v87 ^ 1;
    BSSizeRoundForScale();
    if (v135 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      *(void *)&v407[4] = 0;
      *(_DWORD *)v407 = 0;
      uint64_t v397 = 0;
      uint64_t v389 = 0;
      uint64_t v393 = 0;
      uint64_t v405 = 0;
      uint64_t v401 = 0;
      uint64_t v381 = 0;
      uint64_t v385 = 0;
      uint64_t v373 = 0;
      uint64_t v377 = 0;
      uint64_t v365 = 0;
      uint64_t v369 = 0;
      uint64_t v357 = 0;
      uint64_t v361 = 0;
      unint64_t v349 = 0;
      uint64_t v353 = 0;
      int v345 = 0;
      LODWORD(v342) = 0;
      int v102 = 0;
      int v103 = 0;
      uint64_t v75 = 0;
      int v104 = 0;
      int v105 = 0;
      double v106 = 0.0;
      goto LABEL_441;
    }
LABEL_599:
    uint64_t v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_601;
      }
    }
    else
    {
      v333 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v333 userInterfaceIdiom] != 1)
      {
LABEL_601:
        *(_DWORD *)&v407[8] = v87 ^ 1;
        uint64_t v74 = (uint64_t)&qword_1D8506000;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_605:
          *(void *)v407 = 0;
          goto LABEL_889;
        }
        int v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_605;
          }
        }
        else
        {
          v327 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v327 userInterfaceIdiom])
          {
            *(_DWORD *)v407 = 0;
            *(_DWORD *)&v407[4] = 1;
            goto LABEL_889;
          }
        }
        *(_DWORD *)&v407[4] = v136 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v320 = [MEMORY[0x1E4F42D90] mainScreen];
            [v320 _referenceBounds];
          }
          *(_DWORD *)v407 = v87 ^ 1;
          BSSizeRoundForScale();
          if (v165 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            uint64_t v397 = 0;
            uint64_t v389 = 0;
            uint64_t v393 = 0;
            uint64_t v405 = 0;
            uint64_t v401 = 0;
            uint64_t v381 = 0;
            uint64_t v385 = 0;
            uint64_t v373 = 0;
            uint64_t v377 = 0;
            uint64_t v365 = 0;
            uint64_t v369 = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 48.666;
            goto LABEL_441;
          }
        }
        else
        {
          *(_DWORD *)v407 = 0;
        }
LABEL_889:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v397) = 0;
            LODWORD(v393) = 0;
            goto LABEL_899;
          }
        }
        else
        {
          v328 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v328 userInterfaceIdiom])
          {
            LODWORD(v393) = 0;
            LODWORD(v397) = 1;
            goto LABEL_899;
          }
        }
        LODWORD(v397) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v323 = [MEMORY[0x1E4F42D90] mainScreen];
            [v323 _referenceBounds];
          }
          LODWORD(v393) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v157 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_903;
          }
        }
        else
        {
          LODWORD(v393) = 0;
        }
LABEL_899:
        if (_SBF_Private_IsD94Like())
        {
          uint64_t v405 = 0;
          uint64_t v401 = 0;
          HIDWORD(v393) = 0;
          HIDWORD(v397) = 0;
          uint64_t v385 = 0;
          uint64_t v389 = 0;
          uint64_t v377 = 0;
          uint64_t v381 = 0;
          uint64_t v365 = 0;
          uint64_t v369 = 0;
          uint64_t v373 = 0;
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 48.666;
          goto LABEL_441;
        }
LABEL_903:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_907:
          uint64_t v405 = 0;
          goto LABEL_1005;
        }
        int v158 = __sb__runningInSpringBoard();
        if (v158)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_907;
          }
        }
        else
        {
          v324 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v324 userInterfaceIdiom])
          {
            uint64_t v405 = 0x100000000;
            goto LABEL_1005;
          }
        }
        HIDWORD(v405) = v158 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v315 = [MEMORY[0x1E4F42D90] mainScreen];
            [v315 _referenceBounds];
          }
          LODWORD(v405) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            uint64_t v401 = 0;
            HIDWORD(v393) = 0;
            HIDWORD(v397) = 0;
            uint64_t v385 = 0;
            uint64_t v389 = 0;
            uint64_t v377 = 0;
            uint64_t v381 = 0;
            uint64_t v365 = 0;
            uint64_t v369 = 0;
            uint64_t v373 = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 48.666;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v405) = 0;
        }
LABEL_1005:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v401) = 0;
            HIDWORD(v393) = 0;
            goto LABEL_1015;
          }
        }
        else
        {
          v326 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v326 userInterfaceIdiom])
          {
            HIDWORD(v393) = 0;
            LODWORD(v401) = 1;
            goto LABEL_1015;
          }
        }
        LODWORD(v401) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v319 = [MEMORY[0x1E4F42D90] mainScreen];
            [v319 _referenceBounds];
          }
          HIDWORD(v393) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v173 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_1019;
          }
        }
        else
        {
          HIDWORD(v393) = 0;
        }
LABEL_1015:
        if (_SBF_Private_IsD64Like())
        {
          HIDWORD(v401) = 0;
          HIDWORD(v397) = 0;
          uint64_t v385 = 0;
          uint64_t v389 = 0;
          uint64_t v377 = 0;
          uint64_t v381 = 0;
          uint64_t v365 = 0;
          uint64_t v369 = 0;
          uint64_t v373 = 0;
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 48.666;
          goto LABEL_441;
        }
LABEL_1019:
        int v174 = __sb__runningInSpringBoard();
        if (v174)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v74 = 0;
            HIDWORD(v397) = 0;
            goto LABEL_1029;
          }
        }
        else
        {
          v325 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v325 userInterfaceIdiom])
          {
            HIDWORD(v397) = 0;
            uint64_t v74 = 1;
            goto LABEL_1029;
          }
        }
        uint64_t v74 = v174 ^ 1u;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v175 = __sb__runningInSpringBoard();
          if (v175)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v316 = [MEMORY[0x1E4F42D90] mainScreen];
            [v316 _referenceBounds];
          }
          uint64_t v87 = v175 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v397) = v87;
          if (v179 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            HIDWORD(v401) = v74;
            uint64_t v385 = 0;
            uint64_t v389 = 0;
            uint64_t v377 = 0;
            uint64_t v381 = 0;
            uint64_t v365 = 0;
            uint64_t v369 = 0;
            uint64_t v373 = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 41.0;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v397) = 0;
        }
LABEL_1029:
        uint64_t v87 = __sb__runningInSpringBoard();
        HIDWORD(v401) = v74;
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v389 = 0;
            goto LABEL_1053;
          }
        }
        else
        {
          v322 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v322 userInterfaceIdiom])
          {
            uint64_t v389 = 0x100000000;
            goto LABEL_1053;
          }
        }
        HIDWORD(v389) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v314 = [MEMORY[0x1E4F42D90] mainScreen];
            [v314 _referenceBounds];
          }
          LODWORD(v389) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v187 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_1129;
          }
        }
        else
        {
          LODWORD(v389) = 0;
        }
LABEL_1053:
        if (_SBF_Private_IsD54())
        {
          uint64_t v381 = 0;
          uint64_t v385 = 0;
          uint64_t v373 = 0;
          uint64_t v377 = 0;
          uint64_t v365 = 0;
          uint64_t v369 = 0;
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 41.0;
          goto LABEL_441;
        }
LABEL_1129:
        int v188 = __sb__runningInSpringBoard();
        if (v188)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v385) = 0;
            LODWORD(v381) = 0;
            goto LABEL_1145;
          }
        }
        else
        {
          v321 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v321 userInterfaceIdiom])
          {
            LODWORD(v381) = 0;
            HIDWORD(v385) = 1;
            goto LABEL_1145;
          }
        }
        HIDWORD(v385) = v188 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v191 = __sb__runningInSpringBoard();
          if (v191)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v311 = [MEMORY[0x1E4F42D90] mainScreen];
            [v311 _referenceBounds];
          }
          uint64_t v87 = v191 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v381) = v87;
          if (v201 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            LODWORD(v385) = 0;
            HIDWORD(v381) = 0;
            uint64_t v373 = 0;
            uint64_t v377 = 0;
            uint64_t v365 = 0;
            uint64_t v369 = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 31.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v381) = 0;
        }
LABEL_1145:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v385) = 0;
            HIDWORD(v381) = 0;
            goto LABEL_1163;
          }
        }
        else
        {
          v318 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v318 userInterfaceIdiom])
          {
            HIDWORD(v381) = 0;
            LODWORD(v385) = 1;
            goto LABEL_1163;
          }
        }
        LODWORD(v385) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v310 = [MEMORY[0x1E4F42D90] mainScreen];
            [v310 _referenceBounds];
          }
          HIDWORD(v381) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v202 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1240;
          }
        }
        else
        {
          HIDWORD(v381) = 0;
        }
LABEL_1163:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          uint64_t v373 = 0;
          uint64_t v377 = 0;
          uint64_t v365 = 0;
          uint64_t v369 = 0;
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 0.0;
          goto LABEL_441;
        }
LABEL_1240:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_1244:
          HIDWORD(v377) = 0;
          HIDWORD(v365) = 0;
          goto LABEL_1338;
        }
        int v203 = __sb__runningInSpringBoard();
        if (v203)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1244;
          }
        }
        else
        {
          v313 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v313 userInterfaceIdiom])
          {
            HIDWORD(v365) = 0;
            HIDWORD(v377) = 1;
            goto LABEL_1338;
          }
        }
        HIDWORD(v377) = v203 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v304 = [MEMORY[0x1E4F42D90] mainScreen];
            [v304 _referenceBounds];
          }
          HIDWORD(v365) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v227 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            LODWORD(v377) = 0;
            uint64_t v369 = 0;
            uint64_t v373 = 0;
            LODWORD(v365) = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 40.0;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v365) = 0;
        }
LABEL_1338:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v377) = 0;
            HIDWORD(v373) = 0;
            goto LABEL_1348;
          }
        }
        else
        {
          v317 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v317 userInterfaceIdiom])
          {
            HIDWORD(v373) = 0;
            LODWORD(v377) = 1;
            goto LABEL_1348;
          }
        }
        LODWORD(v377) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v307 = [MEMORY[0x1E4F42D90] mainScreen];
            [v307 _referenceBounds];
          }
          HIDWORD(v373) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v215 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_1352;
          }
        }
        else
        {
          HIDWORD(v373) = 0;
        }
LABEL_1348:
        if (_SBF_Private_IsD93Like())
        {
          LODWORD(v373) = 0;
          uint64_t v369 = 0;
          LODWORD(v365) = 0;
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 40.0;
          goto LABEL_441;
        }
LABEL_1352:
        if (!_SBF_Private_IsD63Like())
        {
LABEL_1356:
          LODWORD(v373) = 0;
          HIDWORD(v369) = 0;
          goto LABEL_1454;
        }
        int v216 = __sb__runningInSpringBoard();
        if (v216)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_1356;
          }
        }
        else
        {
          v308 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v308 userInterfaceIdiom])
          {
            HIDWORD(v369) = 0;
            LODWORD(v373) = 1;
            goto LABEL_1454;
          }
        }
        LODWORD(v373) = v216 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v233 = __sb__runningInSpringBoard();
          if (v233)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v300 = [MEMORY[0x1E4F42D90] mainScreen];
            [v300 _referenceBounds];
          }
          uint64_t v87 = v233 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v369) = v87;
          if (v243 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v369) = 0;
            LODWORD(v365) = 0;
            uint64_t v357 = 0;
            uint64_t v361 = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 40.0;
            goto LABEL_441;
          }
        }
        else
        {
          HIDWORD(v369) = 0;
        }
LABEL_1454:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v369) = 0;
            LODWORD(v365) = 0;
            goto LABEL_1464;
          }
        }
        else
        {
          v312 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v312 userInterfaceIdiom])
          {
            LODWORD(v365) = 0;
            LODWORD(v369) = 1;
            goto LABEL_1464;
          }
        }
        LODWORD(v369) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v303 = [MEMORY[0x1E4F42D90] mainScreen];
            [v303 _referenceBounds];
          }
          LODWORD(v365) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v234 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1468;
          }
        }
        else
        {
          LODWORD(v365) = 0;
        }
LABEL_1464:
        if (_SBF_Private_IsD63Like())
        {
          uint64_t v357 = 0;
          uint64_t v361 = 0;
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 40.0;
          goto LABEL_441;
        }
LABEL_1468:
        int v235 = __sb__runningInSpringBoard();
        if (v235)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v361) = 0;
            LODWORD(v357) = 0;
            goto LABEL_1478;
          }
        }
        else
        {
          v309 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v309 userInterfaceIdiom])
          {
            LODWORD(v357) = 0;
            HIDWORD(v361) = 1;
            goto LABEL_1478;
          }
        }
        HIDWORD(v361) = v235 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v236 = __sb__runningInSpringBoard();
          if (v236)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v301 = [MEMORY[0x1E4F42D90] mainScreen];
            [v301 _referenceBounds];
          }
          uint64_t v87 = v236 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v357) = v87;
          if (v240 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            LODWORD(v361) = 0;
            HIDWORD(v357) = 0;
            unint64_t v349 = 0;
            uint64_t v353 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 34.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v357) = 0;
        }
LABEL_1478:
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v361) = 0;
            HIDWORD(v357) = 0;
            goto LABEL_1488;
          }
        }
        else
        {
          v306 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v306 userInterfaceIdiom])
          {
            HIDWORD(v357) = 0;
            LODWORD(v361) = 1;
            goto LABEL_1488;
          }
        }
        LODWORD(v361) = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v299 = [MEMORY[0x1E4F42D90] mainScreen];
            [v299 _referenceBounds];
          }
          HIDWORD(v357) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v244 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1556;
          }
        }
        else
        {
          HIDWORD(v357) = 0;
        }
LABEL_1488:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          unint64_t v349 = 0;
          uint64_t v353 = 0;
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 0.0;
          goto LABEL_441;
        }
LABEL_1556:
        int v245 = __sb__runningInSpringBoard();
        uint64_t v74 = (uint64_t)&qword_1D8506000;
        if (v245)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v353 = 0;
            goto LABEL_1594;
          }
        }
        else
        {
          v305 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v305 userInterfaceIdiom])
          {
            uint64_t v353 = 0x100000000;
            goto LABEL_1594;
          }
        }
        HIDWORD(v353) = v245 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v250 = __sb__runningInSpringBoard();
          if (v250)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v298 = [MEMORY[0x1E4F42D90] mainScreen];
            [v298 _referenceBounds];
          }
          uint64_t v87 = v250 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v353) = v87;
          if (v259 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            unint64_t v349 = 0;
            int v345 = 0;
            LODWORD(v342) = 0;
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 31.3333;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v353) = 0;
        }
LABEL_1594:
        int v251 = __sb__runningInSpringBoard();
        if (v251)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v252 = 0;
            uint64_t v87 = 0;
            goto LABEL_1612;
          }
        }
        else
        {
          v302 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v302 userInterfaceIdiom])
          {
            uint64_t v87 = 0;
            int v252 = 1;
            goto LABEL_1612;
          }
        }
        int v252 = v251 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v255 = __sb__runningInSpringBoard();
          if (v255)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v297 = [MEMORY[0x1E4F42D90] mainScreen];
            [v297 _referenceBounds];
          }
          uint64_t v87 = v255 ^ 1u;
          BSSizeRoundForScale();
          if (v261 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1643;
          }
        }
        else
        {
          uint64_t v87 = 0;
        }
LABEL_1612:
        if (_SBF_Private_IsD53())
        {
          unint64_t v349 = __PAIR64__(v252, v87);
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 31.3333;
          goto LABEL_441;
        }
LABEL_1643:
        unint64_t v349 = __PAIR64__(v252, v87);
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
        {
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          double v106 = 32.666;
          goto LABEL_441;
        }
        double v106 = 22.5;
        if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
        {
          int v345 = 0;
          LODWORD(v342) = 0;
          int v102 = 0;
          int v103 = 0;
          uint64_t v75 = 0;
          int v104 = 0;
          int v105 = 0;
          goto LABEL_441;
        }
        uint64_t v87 = __sb__runningInSpringBoard();
        if (v87)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v345 = 0;
            LODWORD(v342) = 0;
            goto LABEL_1765;
          }
        }
        else
        {
          v296 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v296 userInterfaceIdiom])
          {
            LODWORD(v342) = 0;
            int v345 = 1;
            goto LABEL_1765;
          }
        }
        int v345 = v87 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v87 = __sb__runningInSpringBoard();
          if (v87)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v294 = [MEMORY[0x1E4F42D90] mainScreen];
            [v294 _referenceBounds];
          }
          LODWORD(v342) = v87 ^ 1;
          BSSizeRoundForScale();
          if (v284 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v102 = 0;
            int v103 = 0;
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 27.0;
            goto LABEL_441;
          }
        }
        else
        {
          LODWORD(v342) = 0;
        }
LABEL_1765:
        int v280 = __sb__runningInSpringBoard();
        if (v280)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v102 = 0;
            int v103 = 0;
            goto LABEL_1775;
          }
        }
        else
        {
          v295 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v295 userInterfaceIdiom])
          {
            int v103 = 0;
            int v102 = 1;
            goto LABEL_1775;
          }
        }
        int v102 = v280 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v74 = __sb__runningInSpringBoard();
          if (v74)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v293 = [MEMORY[0x1E4F42D90] mainScreen];
            [v293 _referenceBounds];
          }
          int v103 = v74 ^ 1;
          BSSizeRoundForScale();
          if (v285 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            uint64_t v75 = 0;
            int v104 = 0;
            int v105 = 0;
            double v106 = 0.0;
            goto LABEL_441;
          }
        }
        else
        {
          int v103 = 0;
        }
LABEL_1775:
        uint64_t v74 = __sb__runningInSpringBoard();
        if (v74)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v75 = 0;
            int v104 = 0;
LABEL_1795:
            uint64_t v283 = __sb__runningInSpringBoard();
            if (v283)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
LABEL_1798:
                int v105 = 0;
                double v106 = 0.0;
                goto LABEL_441;
              }
            }
            else
            {
              uint64_t v74 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v74 userInterfaceIdiom])
              {
                double v106 = 0.0;
                int v105 = 1;
                goto LABEL_441;
              }
            }
            int v105 = v283 ^ 1;
            int v287 = __sb__runningInSpringBoard();
            if (v287)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v283 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v283 _referenceBounds];
            }
            BSSizeRoundForScale();
            double v106 = 0.0;
            if (v287 != 1) {

            }
LABEL_441:
            if (v105) {

            }
            v73 = v414;
            if (v104) {

            }
            uint64_t v74 = v411;
            if (v75) {

            }
            if (v103) {
            if (v102)
            }

            if (v342) {
            if (v345)
            }

            if (v349) {
            if (HIDWORD(v349))
            }

            if (v353) {
            if (HIDWORD(v353))
            }

            if (HIDWORD(v357)) {
            if (v361)
            }

            if (v357) {
            if (HIDWORD(v361))
            }

            if (v365) {
            if (v369)
            }

            if (HIDWORD(v369)) {
            if (v373)
            }

            if (HIDWORD(v373)) {
            if (v377)
            }

            if (HIDWORD(v365)) {
            if (HIDWORD(v377))
            }

            if (HIDWORD(v381)) {
            if (v385)
            }

            if (v381) {
            if (HIDWORD(v385))
            }

            if (v389) {
            if (HIDWORD(v389))
            }

            if (HIDWORD(v397)) {
            if (HIDWORD(v401))
            }

            if (HIDWORD(v393)) {
            if (v401)
            }

            if (v405) {
            if (HIDWORD(v405))
            }

            if (v393) {
            if (v397)
            }

            if (*(_DWORD *)v407) {
            if (*(_DWORD *)&v407[4])
            }

            if (*(_DWORD *)&v407[8]) {
            if (*(_DWORD *)&v407[12])
            }

            if (*(_DWORD *)&v407[16]) {
            if (*(_DWORD *)&v407[20])
            }

            if (*(_DWORD *)&v407[24]) {
            if (*(_DWORD *)&v407[28])
            }
            {

              if (!*(_DWORD *)&v407[32]) {
                goto LABEL_531;
              }
            }
            else if (!*(_DWORD *)&v407[32])
            {
LABEL_531:
              if (*(_DWORD *)&v407[36]) {
                goto LABEL_532;
              }
              goto LABEL_547;
            }

            if (*(_DWORD *)&v407[36])
            {
LABEL_532:

              if (!v410) {
                goto LABEL_533;
              }
              goto LABEL_548;
            }
LABEL_547:
            if (!v410)
            {
LABEL_533:
              if (!v411) {
                goto LABEL_535;
              }
              goto LABEL_534;
            }
LABEL_548:

            if (!v411)
            {
LABEL_535:
              if (HIDWORD(v411))
              {

                if (!v412) {
                  goto LABEL_537;
                }
              }
              else if (!v412)
              {
LABEL_537:
                if (!v413)
                {
LABEL_539:
                  uint64_t v113 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
                  v416.origin.x = 0.0;
                  v416.origin.y = 0.0;
                  v416.size.width = v38;
                  v416.size.height = v45;
                  CGFloat MidX = CGRectGetMidX(v416);
                  double v115 = v8 - MidX - v106;
                  double v116 = v106 + MidX;
                  if (v113 == 1) {
                    double v80 = v116;
                  }
                  else {
                    double v80 = v115;
                  }
                  double v86 = v45 * 0.5;
                  double v81 = v45 * 0.5 + v66;
                  goto LABEL_543;
                }
LABEL_538:

                goto LABEL_539;
              }

              if (!v413) {
                goto LABEL_539;
              }
              goto LABEL_538;
            }
LABEL_534:

            goto LABEL_535;
          }
        }
        else
        {
          uint64_t v87 = [MEMORY[0x1E4F42948] currentDevice];
          if ([(id)v87 userInterfaceIdiom])
          {
            int v104 = 0;
            uint64_t v75 = 1;
            goto LABEL_1795;
          }
        }
        uint64_t v75 = v74 ^ 1;
        uint64_t v74 = __sb__runningInSpringBoard();
        if (v74)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v85 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v85 _referenceBounds];
        }
        int v104 = v74 ^ 1;
        BSSizeRoundForScale();
        if (v282 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
          goto LABEL_1798;
        }
        goto LABEL_1795;
      }
    }
    *(void *)v407 = 0;
    uint64_t v397 = 0;
    uint64_t v389 = 0;
    uint64_t v393 = 0;
    uint64_t v405 = 0;
    uint64_t v401 = 0;
    uint64_t v381 = 0;
    uint64_t v385 = 0;
    uint64_t v373 = 0;
    uint64_t v377 = 0;
    uint64_t v365 = 0;
    uint64_t v369 = 0;
    uint64_t v357 = 0;
    uint64_t v361 = 0;
    unint64_t v349 = 0;
    uint64_t v353 = 0;
    int v345 = 0;
    LODWORD(v342) = 0;
    int v102 = 0;
    int v103 = 0;
    uint64_t v75 = 0;
    int v104 = 0;
    int v105 = 0;
    double v106 = 0.0;
    *(_DWORD *)&v407[8] = v87 ^ 1;
    goto LABEL_441;
  }
  uint64_t v76 = [(CSTeachableMomentsContainerView *)v414 usesStatusBarRelativeLayoutForControlCenterTutorsY];
  if (v76) {
    double v77 = 8.0;
  }
  else {
    double v77 = v66;
  }
  -[CSTeachableMomentsContainerView _grabberCenterForContainerBounds:grabberTop:grabberTopIsRelative:grabberSize:isSpaceConstrained:](v414, "_grabberCenterForContainerBounds:grabberTop:grabberTopIsRelative:grabberSize:isSpaceConstrained:", v76, v415, v4, v6, v8, v10, v77, v38, v45);
  double v80 = v79;
  double v81 = v78;
  if (v79 == *MEMORY[0x1E4F1DAD8] && v78 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {

    id v82 = v409;
    goto LABEL_733;
  }
  double v86 = v45 * 0.5;
LABEL_543:
  objc_msgSend(v409, "setBounds:", 0.0, 0.0, v38, v45);
  objc_msgSend(v409, "setCenter:", v80, v81);
  -[CABackdropLayer setBounds:](v73->_controlCenterGrabberBackdropLayer, "setBounds:", 0.0, 0.0, v38, v45);
  -[CABackdropLayer setPosition:](v73->_controlCenterGrabberBackdropLayer, "setPosition:", v80, v81);
  objc_msgSend(v408, "setFrame:", 0.0, 0.0, v38, v45);
  [v408 _setContinuousCornerRadius:v86];
  objc_msgSend(*(id *)&v407[40], "setBounds:", 0.0, 0.0, v38, v45);
  objc_msgSend(*(id *)&v407[40], "setCenter:", v80, v81 + 28.5);

  v117 = [(CSTeachableMomentsContainerView *)v73 controlCenterGlyphContainerView];
  [(CSTeachableMomentsContainerView *)v73 bounds];
  objc_msgSend(v117, "setFrame:");
  v118 = [(CSTeachableMomentsContainerView *)v73 controlCenterGlyphView];
  [v118 sizeToFit];
  if ([(CSTeachableMomentsContainerView *)v73 usesStatusBarRelativeLayoutForControlCenterTutorsY])
  {
    uint64_t v74 = [(CSTeachableMomentsContainerView *)v73 controlCenterGrabberContainerView];
    [(id)v74 frame];
    double MinY = CGRectGetMinY(v417);
LABEL_728:

    goto LABEL_729;
  }
  int v120 = __sb__runningInSpringBoard();
  if (v120)
  {
    unint64_t v121 = 0x1E4F42000;
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v122 = 0;
      unsigned int v123 = 0;
      goto LABEL_562;
    }
  }
  else
  {
    unint64_t v121 = 0x1E4F42000uLL;
    uint64_t v74 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v74 userInterfaceIdiom] != 1)
    {
      unsigned int v123 = 0;
      int v122 = 1;
      goto LABEL_562;
    }
  }
  int v122 = v120 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v342 = [MEMORY[0x1E4F42D90] mainScreen];
      [v342 _referenceBounds];
    }
    unsigned int v123 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v140 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v139 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      unsigned int v412 = v124 ^ 1;
      int v413 = v122;
      unint64_t v411 = 0;
      int v410 = 0;
      LODWORD(v409) = 0;
      LODWORD(v408) = 0;
      memset(v407, 0, 44);
      uint64_t v406 = 0;
      uint64_t v402 = 0;
      uint64_t v398 = 0;
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 27.0;
      goto LABEL_629;
    }
  }
  else
  {
    unsigned int v123 = 0;
  }
LABEL_562:
  int v125 = __sb__runningInSpringBoard();
  unsigned int v412 = v123;
  int v413 = v122;
  if (v125)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v75 = 0;
      unsigned int v126 = 0;
      goto LABEL_571;
    }
  }
  else
  {
    v341 = [*(id *)(v121 + 2376) currentDevice];
    if ([v341 userInterfaceIdiom] != 1)
    {
      unsigned int v126 = 0;
      uint64_t v75 = 1;
      goto LABEL_571;
    }
  }
  uint64_t v75 = v125 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v333 = [MEMORY[0x1E4F42D90] mainScreen];
      [v333 _referenceBounds];
    }
    unsigned int v126 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v411) = v124 ^ 1;
      HIDWORD(v411) = v75;
      int v410 = 0;
      LODWORD(v409) = 0;
      LODWORD(v408) = 0;
      memset(v407, 0, 44);
      uint64_t v406 = 0;
      uint64_t v402 = 0;
      uint64_t v398 = 0;
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 28.0;
      goto LABEL_629;
    }
  }
  else
  {
    unsigned int v126 = 0;
  }
LABEL_571:
  int v127 = __sb__runningInSpringBoard();
  unint64_t v411 = __PAIR64__(v75, v126);
  if (v127)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v128 = 0;
      LODWORD(v409) = 0;
      goto LABEL_580;
    }
  }
  else
  {
    v340 = [*(id *)(v121 + 2376) currentDevice];
    if ([v340 userInterfaceIdiom] != 1)
    {
      LODWORD(v409) = 0;
      int v128 = 1;
      goto LABEL_580;
    }
  }
  int v128 = v127 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v332 = [MEMORY[0x1E4F42D90] mainScreen];
      [v332 _referenceBounds];
    }
    LODWORD(v409) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v410 = v128;
      LODWORD(v408) = 0;
      memset(v407, 0, 44);
      uint64_t v406 = 0;
      uint64_t v402 = 0;
      uint64_t v398 = 0;
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 28.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v409) = 0;
  }
LABEL_580:
  int v129 = __sb__runningInSpringBoard();
  int v410 = v128;
  if (v129)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v408) = 0;
      *(_DWORD *)&v407[40] = 0;
      goto LABEL_589;
    }
  }
  else
  {
    v339 = [*(id *)(v121 + 2376) currentDevice];
    if ([v339 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[40] = 0;
      LODWORD(v408) = 1;
      goto LABEL_589;
    }
  }
  LODWORD(v408) = v129 ^ 1;
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v336 = [MEMORY[0x1E4F42D90] mainScreen];
    [v336 _referenceBounds];
  }
  *(_DWORD *)&v407[40] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    memset(v407, 0, 40);
    uint64_t v406 = 0;
    uint64_t v402 = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 27.0;
    goto LABEL_629;
  }
LABEL_589:
  int v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[32] = 0;
      goto LABEL_611;
    }
  }
  else
  {
    v338 = [*(id *)(v121 + 2376) currentDevice];
    if ([v338 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[32] = 0;
      *(_DWORD *)&v407[36] = 1;
      goto LABEL_611;
    }
  }
  *(_DWORD *)&v407[36] = v131 ^ 1;
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v334 = [MEMORY[0x1E4F42D90] mainScreen];
    [v334 _referenceBounds];
  }
  *(_DWORD *)&v407[32] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v137 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    memset(v407, 0, 32);
    uint64_t v406 = 0;
    uint64_t v402 = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 27.0;
    goto LABEL_629;
  }
LABEL_611:
  int v138 = __sb__runningInSpringBoard();
  if (v138)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v407[24] = 0;
      goto LABEL_747;
    }
  }
  else
  {
    v337 = [*(id *)(v121 + 2376) currentDevice];
    if ([v337 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v407[24] = 0;
      *(_DWORD *)&v407[28] = 1;
      goto LABEL_747;
    }
  }
  *(_DWORD *)&v407[28] = v138 ^ 1;
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v331 = [MEMORY[0x1E4F42D90] mainScreen];
    [v331 _referenceBounds];
  }
  *(_DWORD *)&v407[24] = v124 ^ 1;
  BSSizeRoundForScale();
  if (v145 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v407, 0, 24);
    uint64_t v406 = 0;
    uint64_t v402 = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 27.0;
    goto LABEL_629;
  }
LABEL_747:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_749;
    }
LABEL_755:
    memset(v407, 0, 20);
    uint64_t v406 = 0;
    uint64_t v402 = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 27.0;
    *(_DWORD *)&v407[20] = v124 ^ 1;
    goto LABEL_629;
  }
  v335 = [*(id *)(v121 + 2376) currentDevice];
  if ([v335 userInterfaceIdiom] == 1) {
    goto LABEL_755;
  }
LABEL_749:
  *(_DWORD *)&v407[20] = v124 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_753:
    *(void *)&v407[8] = 0;
    goto LABEL_932;
  }
  int v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_753;
    }
  }
  else
  {
    v329 = [*(id *)(v121 + 2376) currentDevice];
    if ([v329 userInterfaceIdiom])
    {
      *(void *)&v407[8] = 0x100000000;
      goto LABEL_932;
    }
  }
  *(_DWORD *)&v407[12] = v146 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v322 = [MEMORY[0x1E4F42D90] mainScreen];
      [v322 _referenceBounds];
    }
    *(_DWORD *)&v407[8] = v124 ^ 1;
    BSSizeRoundForScale();
    if (v172 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v407[16] = 0;
      *(void *)v407 = 0;
      uint64_t v406 = 0;
      uint64_t v402 = 0;
      uint64_t v398 = 0;
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    *(_DWORD *)&v407[8] = 0;
  }
LABEL_932:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v407[16] = 0;
      *(_DWORD *)&v407[4] = 0;
      goto LABEL_942;
    }
  }
  else
  {
    v330 = [*(id *)(v121 + 2376) currentDevice];
    if ([v330 userInterfaceIdiom])
    {
      *(_DWORD *)&v407[4] = 0;
      *(_DWORD *)&v407[16] = 1;
      goto LABEL_942;
    }
  }
  *(_DWORD *)&v407[16] = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v325 = [MEMORY[0x1E4F42D90] mainScreen];
      [v325 _referenceBounds];
    }
    *(_DWORD *)&v407[4] = v124 ^ 1;
    BSSizeRoundForScale();
    if (v161 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_946;
    }
  }
  else
  {
    *(_DWORD *)&v407[4] = 0;
  }
LABEL_942:
  if (_SBF_Private_IsD94Like())
  {
    *(_DWORD *)v407 = 0;
    uint64_t v406 = 0;
    uint64_t v402 = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_946:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_950:
    *(_DWORD *)v407 = 0;
    HIDWORD(v406) = 0;
    goto LABEL_1059;
  }
  int v162 = __sb__runningInSpringBoard();
  if (v162)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_950;
    }
  }
  else
  {
    v326 = [*(id *)(v121 + 2376) currentDevice];
    if ([v326 userInterfaceIdiom])
    {
      HIDWORD(v406) = 0;
      *(_DWORD *)v407 = 1;
      goto LABEL_1059;
    }
  }
  *(_DWORD *)v407 = v162 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v317 = [MEMORY[0x1E4F42D90] mainScreen];
      [v317 _referenceBounds];
    }
    HIDWORD(v406) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v190 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v406) = 0;
      uint64_t v402 = 0;
      uint64_t v398 = 0;
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v406) = 0;
  }
LABEL_1059:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v406) = 0;
      LODWORD(v402) = 0;
      goto LABEL_1069;
    }
  }
  else
  {
    v328 = [*(id *)(v121 + 2376) currentDevice];
    if ([v328 userInterfaceIdiom])
    {
      LODWORD(v402) = 0;
      LODWORD(v406) = 1;
      goto LABEL_1069;
    }
  }
  LODWORD(v406) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v321 = [MEMORY[0x1E4F42D90] mainScreen];
      [v321 _referenceBounds];
    }
    LODWORD(v402) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v176 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1073;
    }
  }
  else
  {
    LODWORD(v402) = 0;
  }
LABEL_1069:
  if (_SBF_Private_IsD64Like())
  {
    HIDWORD(v402) = 0;
    uint64_t v398 = 0;
    uint64_t v390 = 0;
    uint64_t v394 = 0;
    uint64_t v382 = 0;
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_1073:
  int v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v402) = 0;
      HIDWORD(v398) = 0;
      goto LABEL_1083;
    }
  }
  else
  {
    v327 = [*(id *)(v121 + 2376) currentDevice];
    if ([v327 userInterfaceIdiom])
    {
      HIDWORD(v398) = 0;
      HIDWORD(v402) = 1;
      goto LABEL_1083;
    }
  }
  HIDWORD(v402) = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v318 = [MEMORY[0x1E4F42D90] mainScreen];
      [v318 _referenceBounds];
    }
    uint64_t v124 = v178 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v398) = v124;
    if (v189 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v390 = 0;
      uint64_t v394 = 0;
      uint64_t v382 = 0;
      uint64_t v386 = 0;
      LODWORD(v398) = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 38.6666;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v398) = 0;
  }
LABEL_1083:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v394) = 0;
      LODWORD(v382) = 0;
      goto LABEL_1107;
    }
  }
  else
  {
    v324 = [*(id *)(v121 + 2376) currentDevice];
    if ([v324 userInterfaceIdiom])
    {
      LODWORD(v382) = 0;
      LODWORD(v394) = 1;
      goto LABEL_1107;
    }
  }
  LODWORD(v394) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v316 = [MEMORY[0x1E4F42D90] mainScreen];
      [v316 _referenceBounds];
    }
    LODWORD(v382) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v192 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_1153;
    }
  }
  else
  {
    LODWORD(v382) = 0;
  }
LABEL_1107:
  if (_SBF_Private_IsD54())
  {
    LODWORD(v398) = 0;
    HIDWORD(v394) = 0;
    uint64_t v386 = 0;
    uint64_t v390 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    HIDWORD(v382) = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 38.6666;
    goto LABEL_629;
  }
LABEL_1153:
  int v193 = __sb__runningInSpringBoard();
  if (v193)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v398) = 0;
      HIDWORD(v394) = 0;
      goto LABEL_1170;
    }
  }
  else
  {
    v323 = [*(id *)(v121 + 2376) currentDevice];
    if ([v323 userInterfaceIdiom])
    {
      HIDWORD(v394) = 0;
      LODWORD(v398) = 1;
      goto LABEL_1170;
    }
  }
  LODWORD(v398) = v193 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v313 = [MEMORY[0x1E4F42D90] mainScreen];
      [v313 _referenceBounds];
    }
    uint64_t v124 = v194 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v394) = v124;
    if (v204 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      uint64_t v386 = 0;
      uint64_t v390 = 0;
      uint64_t v374 = 0;
      uint64_t v378 = 0;
      HIDWORD(v382) = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 40.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v394) = 0;
  }
LABEL_1170:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v390 = 0;
      goto LABEL_1235;
    }
  }
  else
  {
    v320 = [*(id *)(v121 + 2376) currentDevice];
    if ([v320 userInterfaceIdiom])
    {
      uint64_t v390 = 0x100000000;
      goto LABEL_1235;
    }
  }
  HIDWORD(v390) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v312 = [MEMORY[0x1E4F42D90] mainScreen];
      [v312 _referenceBounds];
    }
    LODWORD(v390) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v207 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1259;
    }
  }
  else
  {
    LODWORD(v390) = 0;
  }
LABEL_1235:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v386 = 0;
    uint64_t v374 = 0;
    uint64_t v378 = 0;
    HIDWORD(v382) = 0;
    uint64_t v366 = 0;
    uint64_t v370 = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 0.0;
    goto LABEL_629;
  }
LABEL_1259:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_1263:
    HIDWORD(v386) = 0;
    HIDWORD(v378) = 0;
    goto LABEL_1381;
  }
  int v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1263;
    }
  }
  else
  {
    v315 = [*(id *)(v121 + 2376) currentDevice];
    if ([v315 userInterfaceIdiom])
    {
      HIDWORD(v378) = 0;
      HIDWORD(v386) = 1;
      goto LABEL_1381;
    }
  }
  HIDWORD(v386) = v208 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v220 = __sb__runningInSpringBoard();
    if (v220)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v306 = [MEMORY[0x1E4F42D90] mainScreen];
      [v306 _referenceBounds];
    }
    uint64_t v124 = v220 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v378) = v124;
    if (v232 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      LODWORD(v386) = 0;
      HIDWORD(v382) = 0;
      uint64_t v370 = 0;
      uint64_t v374 = 0;
      LODWORD(v378) = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      uint64_t v366 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v378) = 0;
  }
LABEL_1381:
  int v221 = __sb__runningInSpringBoard();
  if (v221)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v386) = 0;
      uint64_t v124 = 0;
      goto LABEL_1391;
    }
  }
  else
  {
    v319 = [*(id *)(v121 + 2376) currentDevice];
    if ([v319 userInterfaceIdiom])
    {
      uint64_t v124 = 0;
      LODWORD(v386) = 1;
      goto LABEL_1391;
    }
  }
  LODWORD(v386) = v221 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v222 = __sb__runningInSpringBoard();
    if (v222)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v309 = [MEMORY[0x1E4F42D90] mainScreen];
      [v309 _referenceBounds];
    }
    uint64_t v124 = v222 ^ 1u;
    BSSizeRoundForScale();
    if (v223 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_1395;
    }
  }
  else
  {
    uint64_t v124 = 0;
  }
LABEL_1391:
  if (_SBF_Private_IsD93Like())
  {
    HIDWORD(v382) = v124;
    uint64_t v370 = 0;
    uint64_t v374 = 0;
    LODWORD(v378) = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    uint64_t v366 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1395:
  HIDWORD(v382) = v124;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_1399:
    uint64_t v374 = 0;
    goto LABEL_1506;
  }
  int v224 = __sb__runningInSpringBoard();
  if (v224)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_1399;
    }
  }
  else
  {
    v310 = [*(id *)(v121 + 2376) currentDevice];
    if ([v310 userInterfaceIdiom])
    {
      uint64_t v374 = 0x100000000;
      goto LABEL_1506;
    }
  }
  HIDWORD(v374) = v224 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v302 = [MEMORY[0x1E4F42D90] mainScreen];
      [v302 _referenceBounds];
    }
    LODWORD(v374) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v249 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v378) = 0;
      uint64_t v366 = 0;
      uint64_t v370 = 0;
      uint64_t v354 = 0;
      uint64_t v358 = 0;
      uint64_t v362 = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v374) = 0;
  }
LABEL_1506:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v378) = 0;
      HIDWORD(v370) = 0;
      goto LABEL_1516;
    }
  }
  else
  {
    v314 = [*(id *)(v121 + 2376) currentDevice];
    if ([v314 userInterfaceIdiom])
    {
      HIDWORD(v370) = 0;
      LODWORD(v378) = 1;
      goto LABEL_1516;
    }
  }
  LODWORD(v378) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v305 = [MEMORY[0x1E4F42D90] mainScreen];
      [v305 _referenceBounds];
    }
    HIDWORD(v370) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v237 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1520;
    }
  }
  else
  {
    HIDWORD(v370) = 0;
  }
LABEL_1516:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v370) = 0;
    uint64_t v354 = 0;
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    uint64_t v366 = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1520:
  int v238 = __sb__runningInSpringBoard();
  if (v238)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v370) = 0;
      HIDWORD(v354) = 0;
      goto LABEL_1530;
    }
  }
  else
  {
    v311 = [*(id *)(v121 + 2376) currentDevice];
    if ([v311 userInterfaceIdiom])
    {
      HIDWORD(v354) = 0;
      LODWORD(v370) = 1;
      goto LABEL_1530;
    }
  }
  LODWORD(v370) = v238 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v303 = [MEMORY[0x1E4F42D90] mainScreen];
      [v303 _referenceBounds];
    }
    uint64_t v124 = v239 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v354) = v124;
    if (v248 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v362 = 0;
      uint64_t v366 = 0;
      uint64_t v358 = 0;
      LODWORD(v354) = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 37.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v354) = 0;
  }
LABEL_1530:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (v124)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v366 = 0;
      goto LABEL_1552;
    }
  }
  else
  {
    v308 = [*(id *)(v121 + 2376) currentDevice];
    if ([v308 userInterfaceIdiom])
    {
      uint64_t v366 = 0x100000000;
      goto LABEL_1552;
    }
  }
  HIDWORD(v366) = v124 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v301 = [MEMORY[0x1E4F42D90] mainScreen];
      [v301 _referenceBounds];
    }
    LODWORD(v366) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v253 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1602;
    }
  }
  else
  {
    LODWORD(v366) = 0;
  }
LABEL_1552:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v358 = 0;
    uint64_t v362 = 0;
    LODWORD(v354) = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 0.0;
    goto LABEL_629;
  }
LABEL_1602:
  int v254 = __sb__runningInSpringBoard();
  if (v254)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v362) = 0;
      LODWORD(v358) = 0;
      goto LABEL_1618;
    }
  }
  else
  {
    v307 = [*(id *)(v121 + 2376) currentDevice];
    if ([v307 userInterfaceIdiom])
    {
      LODWORD(v358) = 0;
      HIDWORD(v362) = 1;
      goto LABEL_1618;
    }
  }
  HIDWORD(v362) = v254 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v300 = [MEMORY[0x1E4F42D90] mainScreen];
      [v300 _referenceBounds];
    }
    LODWORD(v358) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v262 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v362) = 0;
      HIDWORD(v358) = 0;
      LODWORD(v354) = 0;
      int v346 = 0;
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 39.0;
      goto LABEL_629;
    }
  }
  else
  {
    LODWORD(v358) = 0;
  }
LABEL_1618:
  int v256 = __sb__runningInSpringBoard();
  if (v256)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v257 = 0;
      uint64_t v124 = 0;
      goto LABEL_1639;
    }
  }
  else
  {
    v304 = [*(id *)(v121 + 2376) currentDevice];
    if ([v304 userInterfaceIdiom])
    {
      uint64_t v124 = 0;
      int v257 = 1;
      goto LABEL_1639;
    }
  }
  int v257 = v256 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v260 = __sb__runningInSpringBoard();
    if (v260)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v299 = [MEMORY[0x1E4F42D90] mainScreen];
      [v299 _referenceBounds];
    }
    uint64_t v124 = v260 ^ 1u;
    BSSizeRoundForScale();
    if (v263 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1656;
    }
  }
  else
  {
    uint64_t v124 = 0;
  }
LABEL_1639:
  if (_SBF_Private_IsD53())
  {
    HIDWORD(v358) = v124;
    LODWORD(v362) = v257;
    LODWORD(v354) = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 39.0;
    goto LABEL_629;
  }
LABEL_1656:
  LODWORD(v362) = v257;
  HIDWORD(v358) = v124;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v354) = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    double MinY = 41.0;
    goto LABEL_629;
  }
  double MinY = 41.0;
  if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v354) = 0;
    int v346 = 0;
    uint64_t v350 = 0;
    int v132 = 0;
    int v133 = 0;
    int v134 = 0;
    goto LABEL_629;
  }
  int v264 = __sb__runningInSpringBoard();
  if (v264)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v354) = 0;
      int v346 = 0;
      goto LABEL_1785;
    }
  }
  else
  {
    v298 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v298 userInterfaceIdiom])
    {
      int v346 = 0;
      LODWORD(v354) = 1;
      goto LABEL_1785;
    }
  }
  LODWORD(v354) = v264 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v295 = [MEMORY[0x1E4F42D90] mainScreen];
      [v295 _referenceBounds];
    }
    int v346 = v124 ^ 1;
    BSSizeRoundForScale();
    if (v286 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      uint64_t v350 = 0;
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 36.0;
      goto LABEL_629;
    }
  }
  else
  {
    int v346 = 0;
  }
LABEL_1785:
  int v281 = __sb__runningInSpringBoard();
  if (v281)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v350 = 0;
      goto LABEL_1808;
    }
  }
  else
  {
    v297 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v297 userInterfaceIdiom])
    {
      uint64_t v350 = 1;
      goto LABEL_1808;
    }
  }
  LODWORD(v350) = v281 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v124 = __sb__runningInSpringBoard();
    if (v124)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v294 = [MEMORY[0x1E4F42D90] mainScreen];
      [v294 _referenceBounds];
    }
    HIDWORD(v350) = v124 ^ 1;
    BSSizeRoundForScale();
    if (v290 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v132 = 0;
      int v133 = 0;
      int v134 = 0;
      double MinY = 0.0;
      goto LABEL_629;
    }
  }
  else
  {
    HIDWORD(v350) = 0;
  }
LABEL_1808:
  uint64_t v124 = __sb__runningInSpringBoard();
  if (!v124)
  {
    v296 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v296 userInterfaceIdiom])
    {
      int v133 = 0;
      int v132 = 1;
      goto LABEL_1829;
    }
LABEL_1825:
    int v132 = v124 ^ 1;
    uint64_t v75 = __sb__runningInSpringBoard();
    if (v75)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v124 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v124 _referenceBounds];
    }
    int v133 = v75 ^ 1;
    BSSizeRoundForScale();
    if (v288 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1832;
    }
    goto LABEL_1829;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1825;
  }
  int v132 = 0;
  int v133 = 0;
LABEL_1829:
  uint64_t v289 = __sb__runningInSpringBoard();
  if (v289)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1832:
      int v134 = 0;
      double MinY = 0.0;
      goto LABEL_629;
    }
  }
  else
  {
    uint64_t v75 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v75 userInterfaceIdiom])
    {
      double MinY = 0.0;
      int v134 = 1;
      goto LABEL_629;
    }
  }
  int v134 = v289 ^ 1;
  int v291 = __sb__runningInSpringBoard();
  if (v291)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v289 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v289 _referenceBounds];
  }
  BSSizeRoundForScale();
  double MinY = 0.0;
  if (v291 != 1) {

  }
LABEL_629:
  if (v134) {

  }
  if (v133) {
  if (v132)
  }

  if (HIDWORD(v350)) {
  v73 = v414;
  }
  if (v350) {

  }
  if (v346) {
  if (v354)
  }

  if (HIDWORD(v358)) {
  if (v362)
  }

  if (v358) {
  if (HIDWORD(v362))
  }

  if (v366) {
  if (HIDWORD(v366))
  }

  if (HIDWORD(v354)) {
  if (v370)
  }

  if (HIDWORD(v370)) {
  if (v378)
  }

  if (v374) {
  if (HIDWORD(v374))
  }

  if (HIDWORD(v382)) {
  if (v386)
  }

  if (HIDWORD(v378)) {
  if (HIDWORD(v386))
  }

  if (v390) {
  if (HIDWORD(v390))
  }

  if (HIDWORD(v394)) {
  if (v398)
  }

  if (v382) {
  if (v394)
  }

  if (HIDWORD(v398)) {
  if (HIDWORD(v402))
  }

  if (v402) {
  if (v406)
  }

  if (HIDWORD(v406)) {
  if (*(_DWORD *)v407)
  }

  if (*(_DWORD *)&v407[4]) {
  if (*(_DWORD *)&v407[16])
  }

  if (*(_DWORD *)&v407[8]) {
  if (*(_DWORD *)&v407[12])
  }

  if (*(_DWORD *)&v407[20]) {
  if (*(_DWORD *)&v407[24])
  }

  if (*(_DWORD *)&v407[28]) {
  if (*(_DWORD *)&v407[32])
  }

  if (*(_DWORD *)&v407[36]) {
  if (*(_DWORD *)&v407[40])
  }

  if (v408) {
  if (v409)
  }
  {

    if (!v410) {
      goto LABEL_723;
    }
  }
  else if (!v410)
  {
LABEL_723:
    if (v411) {
      goto LABEL_724;
    }
    goto LABEL_737;
  }

  if (v411)
  {
LABEL_724:

    if (!HIDWORD(v411)) {
      goto LABEL_725;
    }
    goto LABEL_738;
  }
LABEL_737:
  if (!HIDWORD(v411))
  {
LABEL_725:
    if (!v412) {
      goto LABEL_727;
    }
    goto LABEL_726;
  }
LABEL_738:

  if (v412) {
LABEL_726:
  }

LABEL_727:
  if (v413) {
    goto LABEL_728;
  }
LABEL_729:
  [v118 bounds];
  objc_msgSend(v118, "setCenter:", v80, MinY + CGRectGetHeight(v418) * 0.5);

  if (![(CSTeachableMomentsContainerView *)v73 adjustsControlCenterTutorsVisibilityForAvailableSpace])return; {
  v143 = [(CSTeachableMomentsContainerView *)v73 controlCenterTutorsContainerView];
  }
  id v82 = v143;
  double v144 = 0.0;
  if (!v415[0]) {
    double v144 = 1.0;
  }
  [v143 setAlpha:v144];
LABEL_733:
}

- (CGPoint)_grabberCenterForContainerBounds:(CGRect)a3 grabberTop:(double)a4 grabberTopIsRelative:(BOOL)a5 grabberSize:(CGSize)a6 isSpaceConstrained:(BOOL *)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  BOOL v16 = a5;
  CGFloat v18 = a3.size.height;
  double v19 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  unsigned int v23 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_4;
  }
  CGFloat v517 = x;
  double v518 = height;
  double v516 = width;
  [WeakRetained frameForPartWithIdentifier:*MEMORY[0x1E4F441B0]];
  double v24 = v520.origin.x;
  CGFloat v25 = v520.origin.y;
  double v26 = v520.size.width;
  CGFloat v27 = v520.size.height;
  if (CGRectEqualToRect(v520, *MEMORY[0x1E4F1DB28])
    || (v521.origin.CGFloat x = v24,
        v521.origin.CGFloat y = v25,
        v521.size.CGFloat width = v26,
        v521.size.CGFloat height = v27,
        CGRectEqualToRect(v521, *MEMORY[0x1E4F1DB20])))
  {
LABEL_4:
    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    goto LABEL_5;
  }
  CGFloat v514 = v27;
  CGFloat v515 = v25;
  BOOL v510 = v16;
  v512 = a7;
  double v513 = v26;
  double v32 = v24;
  if (v26 != v19)
  {
    [v23 frame];
    double v32 = v19 - (v33 - v24);
  }
  v522.origin.CGFloat x = v32;
  v522.size.CGFloat height = v514;
  v522.origin.CGFloat y = v25;
  double v34 = v26;
  v522.size.CGFloat width = v26;
  double MidX = CGRectGetMidX(v522);
  int v36 = (void *)[(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  int v37 = __sb__runningInSpringBoard();
  int v38 = v37;
  double v511 = a4;
  CGFloat v509 = y;
  if (v36 == (void *)1)
  {
    if (v37)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v461 = 0;
        LODWORD(v454) = 0;
        goto LABEL_25;
      }
    }
    else
    {
      id v408 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v408 userInterfaceIdiom] != 1)
      {
        LODWORD(v454) = 0;
        int v461 = 1;
        goto LABEL_25;
      }
    }
    a7 = (BOOL *)(v38 ^ 1u);
    int v461 = v38 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v39 = __sb__runningInSpringBoard();
      if (v39)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v389 = [MEMORY[0x1E4F42D90] mainScreen];
        [v389 _referenceBounds];
      }
      a7 = (BOOL *)(v39 ^ 1u);
      BSSizeRoundForScale();
      LODWORD(v454) = v39 ^ 1;
      if (v77 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v76 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        LODWORD(v453) = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        int v60 = 0;
        double v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v454) = 0;
    }
LABEL_25:
    int v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v453) = 0;
        LODWORD(v447) = 0;
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v406 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v406 userInterfaceIdiom] != 1)
      {
        LODWORD(v447) = 0;
        LODWORD(v453) = 1;
        goto LABEL_43;
      }
    }
    LODWORD(v453) = v41 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v42 = __sb__runningInSpringBoard();
      if (v42)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v387 = [MEMORY[0x1E4F42D90] mainScreen];
        [v387 _referenceBounds];
      }
      BSSizeRoundForScale();
      LODWORD(v447) = v42 ^ 1;
      if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        int v60 = 0;
        double v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v447) = 0;
    }
LABEL_43:
    int v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v404 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v404 userInterfaceIdiom] != 1)
      {
        LODWORD(v459) = 0;
        LODWORD(v460) = 1;
        goto LABEL_61;
      }
    }
    LODWORD(v460) = v45 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v46 = __sb__runningInSpringBoard();
      if (v46)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v385 = [MEMORY[0x1E4F42D90] mainScreen];
        [v385 _referenceBounds];
      }
      LODWORD(v459) = v46 ^ 1;
      BSSizeRoundForScale();
      if (v82 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        int v60 = 0;
        double v61 = 0.0;
        goto LABEL_132;
      }
    }
    else
    {
      LODWORD(v459) = 0;
    }
LABEL_61:
    int v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v458) = 0;
        LODWORD(v457) = 0;
        goto LABEL_78;
      }
    }
    else
    {
      uint64_t v400 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v400 userInterfaceIdiom] != 1)
      {
        LODWORD(v457) = 0;
        LODWORD(v458) = 1;
        goto LABEL_78;
      }
    }
    LODWORD(v458) = v49 ^ 1;
    int v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v395 = [MEMORY[0x1E4F42D90] mainScreen];
      [v395 _referenceBounds];
    }
    LODWORD(v457) = v50 ^ 1;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      int v60 = 0;
      double v61 = 0.0;
      goto LABEL_132;
    }
LABEL_78:
    int v54 = __sb__runningInSpringBoard();
    if (v54)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        goto LABEL_98;
      }
    }
    else
    {
      int v36 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v36 userInterfaceIdiom] != 1)
      {
        LODWORD(v455) = 0;
        LODWORD(v456) = 1;
        goto LABEL_98;
      }
    }
    LODWORD(v456) = v54 ^ 1;
    int v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v7 = [MEMORY[0x1E4F42D90] mainScreen];
      [v7 _referenceBounds];
    }
    LODWORD(v455) = v55 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      id v409 = v7;
      int v410 = v36;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      int v60 = 0;
      double v61 = 0.0;
      goto LABEL_132;
    }
LABEL_98:
    int v71 = __sb__runningInSpringBoard();
    int v410 = v36;
    id v409 = v7;
    if (v71)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
LABEL_545:
        int v120 = __sb__runningInSpringBoard();
        uint64_t v402 = v8;
        uint64_t v401 = v9;
        if (v120)
        {
          if (SBFEffectiveDeviceClass() != 2) {
            goto LABEL_547;
          }
        }
        else
        {
          int v36 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v36 userInterfaceIdiom] != 1)
          {
LABEL_547:
            LODWORD(v450) = v120 ^ 1;
            uint64_t v398 = v36;
            if (!_SBF_Private_IsD94Like())
            {
LABEL_551:
              int v122 = 0;
              uint64_t v123 = 0;
              goto LABEL_640;
            }
            int v121 = __sb__runningInSpringBoard();
            if (v121)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                goto LABEL_551;
              }
            }
            else
            {
              double v7 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v7 userInterfaceIdiom])
              {
                uint64_t v378 = v7;
                uint64_t v123 = 0;
                int v122 = 1;
                goto LABEL_640;
              }
            }
            int v122 = v121 ^ 1;
            uint64_t v378 = v7;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v140 = __sb__runningInSpringBoard();
              if (v140)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                double v7 = [MEMORY[0x1E4F42D90] mainScreen];
                [v7 _referenceBounds];
              }
              uint64_t v369 = v7;
              uint64_t v123 = v140 ^ 1u;
              BSSizeRoundForScale();
              if (v155 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
              {
                LODWORD(v448) = v140 ^ 1;
                LODWORD(v449) = v122;
                LODWORD(v446) = 0;
                LODWORD(v443) = 0;
                LODWORD(v445) = 0;
                LODWORD(v444) = 0;
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                LODWORD(v441) = 0;
                LODWORD(v440) = 0;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              uint64_t v123 = 0;
            }
LABEL_640:
            int v141 = __sb__runningInSpringBoard();
            LODWORD(v449) = v122;
            LODWORD(v448) = v123;
            if (v141)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v446) = 0;
                LODWORD(v443) = 0;
                goto LABEL_650;
              }
            }
            else
            {
              double v10 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v10 userInterfaceIdiom])
              {
                LODWORD(v443) = 0;
                LODWORD(v446) = 1;
                goto LABEL_650;
              }
            }
            LODWORD(v446) = v141 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v142 = __sb__runningInSpringBoard();
              if (v142)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                double v8 = [MEMORY[0x1E4F42D90] mainScreen];
                [v8 _referenceBounds];
              }
              LODWORD(v443) = v142 ^ 1;
              BSSizeRoundForScale();
              if (v143 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
                goto LABEL_654;
              }
            }
            else
            {
              LODWORD(v443) = 0;
            }
LABEL_650:
            if (_SBF_Private_IsD94Like())
            {
              uint64_t v391 = v8;
              uint64_t v392 = v10;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = 0.0;
              goto LABEL_132;
            }
LABEL_654:
            uint64_t v392 = v10;
            uint64_t v391 = v8;
            if (!_SBF_Private_IsD64Like())
            {
LABEL_658:
              int v145 = 0;
              uint64_t v146 = 0;
              goto LABEL_726;
            }
            int v144 = __sb__runningInSpringBoard();
            if (v144)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                goto LABEL_658;
              }
            }
            else
            {
              uint64_t v123 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v123 userInterfaceIdiom])
              {
                uint64_t v372 = (void *)v123;
                uint64_t v146 = 0;
                int v145 = 1;
                goto LABEL_726;
              }
            }
            int v145 = v144 ^ 1;
            uint64_t v372 = (void *)v123;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v161 = __sb__runningInSpringBoard();
              if (v161)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                double v9 = [MEMORY[0x1E4F42D90] mainScreen];
                [v9 _referenceBounds];
              }
              uint64_t v146 = v161 ^ 1u;
              BSSizeRoundForScale();
              if (v185 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
              {
                uint64_t v382 = v9;
                LODWORD(v444) = v161 ^ 1;
                LODWORD(v445) = v145;
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                LODWORD(v441) = 0;
                LODWORD(v440) = 0;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = -1.0;
                goto LABEL_132;
              }
            }
            else
            {
              uint64_t v146 = 0;
            }
LABEL_726:
            int v162 = __sb__runningInSpringBoard();
            LODWORD(v445) = v145;
            LODWORD(v444) = v146;
            uint64_t v382 = v9;
            if (v162)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v442) = 0;
                LODWORD(v435) = 0;
                goto LABEL_736;
              }
            }
            else
            {
              double v11 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v11 userInterfaceIdiom])
              {
                LODWORD(v435) = 0;
                LODWORD(v442) = 1;
                goto LABEL_736;
              }
            }
            LODWORD(v442) = v162 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v163 = __sb__runningInSpringBoard();
              if (v163)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                double v10 = [MEMORY[0x1E4F42D90] mainScreen];
                [v10 _referenceBounds];
              }
              LODWORD(v435) = v163 ^ 1;
              BSSizeRoundForScale();
              if (v164 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                goto LABEL_740;
              }
            }
            else
            {
              LODWORD(v435) = 0;
            }
LABEL_736:
            if (_SBF_Private_IsD64Like())
            {
              uint64_t v380 = v10;
              uint64_t v381 = v11;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = -1.0;
              goto LABEL_132;
            }
LABEL_740:
            int v165 = __sb__runningInSpringBoard();
            uint64_t v381 = v11;
            uint64_t v380 = v10;
            if (v165)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v166 = 0;
                uint64_t v167 = 0;
                goto LABEL_750;
              }
            }
            else
            {
              uint64_t v146 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v146 userInterfaceIdiom])
              {
                uint64_t v373 = (void *)v146;
                uint64_t v167 = 0;
                int v166 = 1;
                goto LABEL_750;
              }
            }
            int v166 = v165 ^ 1;
            uint64_t v373 = (void *)v146;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v168 = __sb__runningInSpringBoard();
              if (v168)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v146 = [MEMORY[0x1E4F42D90] mainScreen];
                [(id)v146 _referenceBounds];
              }
              uint64_t v362 = (void *)v146;
              uint64_t v167 = v168 ^ 1u;
              BSSizeRoundForScale();
              if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
              {
                LODWORD(v440) = v168 ^ 1;
                LODWORD(v441) = v166;
                LODWORD(v439) = 0;
                LODWORD(v438) = 0;
                LODWORD(v437) = 0;
                LODWORD(v436) = 0;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              uint64_t v167 = 0;
            }
LABEL_750:
            int v169 = __sb__runningInSpringBoard();
            LODWORD(v441) = v166;
            LODWORD(v440) = v167;
            if (v169)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v170 = 0;
                uint64_t v171 = 0;
                goto LABEL_801;
              }
            }
            else
            {
              double v12 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v12 userInterfaceIdiom])
              {
                uint64_t v171 = 0;
                int v170 = 1;
                goto LABEL_801;
              }
            }
            int v170 = v169 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v180 = __sb__runningInSpringBoard();
              if (v180)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v167 = [MEMORY[0x1E4F42D90] mainScreen];
                [(id)v167 _referenceBounds];
              }
              uint64_t v171 = v180 ^ 1u;
              BSSizeRoundForScale();
              if (v189 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
                goto LABEL_836;
              }
            }
            else
            {
              uint64_t v171 = 0;
            }
LABEL_801:
            if (_SBF_Private_IsD54())
            {
              uint64_t v374 = (void *)v167;
              uint64_t v375 = v12;
              LODWORD(v438) = v171;
              LODWORD(v439) = v170;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = 0.0;
              goto LABEL_132;
            }
LABEL_836:
            int v190 = __sb__runningInSpringBoard();
            LODWORD(v439) = v170;
            LODWORD(v438) = v171;
            uint64_t v375 = v12;
            uint64_t v374 = (void *)v167;
            if (v190)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v191 = 0;
                int v192 = 0;
                goto LABEL_854;
              }
            }
            else
            {
              a7 = [MEMORY[0x1E4F42948] currentDevice];
              if ([a7 userInterfaceIdiom])
              {
                uint64_t v365 = a7;
                int v192 = 0;
                int v191 = 1;
                goto LABEL_854;
              }
            }
            int v191 = v190 ^ 1;
            uint64_t v365 = a7;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v195 = __sb__runningInSpringBoard();
              if (v195)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                a7 = [MEMORY[0x1E4F42D90] mainScreen];
                [a7 _referenceBounds];
              }
              int v192 = v195 ^ 1;
              BSSizeRoundForScale();
              if (v208 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
              {
                uint64_t v370 = a7;
                LODWORD(v436) = v195 ^ 1;
                LODWORD(v437) = v191;
                LODWORD(v434) = 0;
                LODWORD(v433) = 0;
                LODWORD(v432) = 0;
                LODWORD(v429) = 0;
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              int v192 = 0;
            }
LABEL_854:
            int v196 = __sb__runningInSpringBoard();
            LODWORD(v437) = v191;
            LODWORD(v436) = v192;
            uint64_t v370 = a7;
            if (v196)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v197 = 0;
                int v198 = 0;
                goto LABEL_874;
              }
            }
            else
            {
              double v11 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v11 userInterfaceIdiom])
              {
                uint64_t v364 = v11;
                int v198 = 0;
                int v197 = 1;
                goto LABEL_874;
              }
            }
            int v197 = v196 ^ 1;
            uint64_t v364 = v11;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v201 = __sb__runningInSpringBoard();
              if (v201)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                uint64_t v347 = [MEMORY[0x1E4F42D90] mainScreen];
                [v347 _referenceBounds];
              }
              int v198 = v201 ^ 1;
              BSSizeRoundForScale();
              if (v210 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
                goto LABEL_919;
              }
            }
            else
            {
              int v198 = 0;
            }
LABEL_874:
            if (_SBF_Private_IsD33OrSimilarDevice()
              && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
            {
              LODWORD(v433) = v198;
              LODWORD(v434) = v197;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = 0.0;
              goto LABEL_132;
            }
LABEL_919:
            LODWORD(v434) = v197;
            LODWORD(v433) = v198;
            if (!_SBF_Private_IsD93Like())
            {
LABEL_923:
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              goto LABEL_976;
            }
            int v211 = __sb__runningInSpringBoard();
            if (v211)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                goto LABEL_923;
              }
            }
            else
            {
              uint64_t v351 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v351 userInterfaceIdiom])
              {
                LODWORD(v429) = 0;
                LODWORD(v432) = 1;
                goto LABEL_976;
              }
            }
            LODWORD(v432) = v211 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v222 = __sb__runningInSpringBoard();
              if (v222)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v336 = [MEMORY[0x1E4F42D90] mainScreen];
                [v336 _referenceBounds];
              }
              LODWORD(v429) = v222 ^ 1;
              BSSizeRoundForScale();
              if (v235 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
              {
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                LODWORD(v427) = 0;
                LODWORD(v426) = 0;
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = 0.0;
                goto LABEL_132;
              }
            }
            else
            {
              LODWORD(v429) = 0;
            }
LABEL_976:
            int v223 = __sb__runningInSpringBoard();
            if (v223)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v431) = 0;
                LODWORD(v430) = 0;
                goto LABEL_986;
              }
            }
            else
            {
              uint64_t v356 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v356 userInterfaceIdiom])
              {
                LODWORD(v430) = 0;
                LODWORD(v431) = 1;
                goto LABEL_986;
              }
            }
            LODWORD(v431) = v223 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v224 = __sb__runningInSpringBoard();
              if (v224)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                a7 = [MEMORY[0x1E4F42D90] mainScreen];
                [a7 _referenceBounds];
              }
              LODWORD(v430) = v224 ^ 1;
              BSSizeRoundForScale();
              if (v225 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
                goto LABEL_990;
              }
            }
            else
            {
              LODWORD(v430) = 0;
            }
LABEL_986:
            if (_SBF_Private_IsD93Like())
            {
              uint64_t v363 = a7;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = 0.0;
              goto LABEL_132;
            }
LABEL_990:
            uint64_t v363 = a7;
            if (!_SBF_Private_IsD63Like())
            {
LABEL_994:
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              goto LABEL_1062;
            }
            int v226 = __sb__runningInSpringBoard();
            if (v226)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
                goto LABEL_994;
              }
            }
            else
            {
              uint64_t v171 = [MEMORY[0x1E4F42948] currentDevice];
              v343 = (void *)v171;
              if ([(id)v171 userInterfaceIdiom])
              {
                LODWORD(v426) = 0;
                LODWORD(v427) = 1;
                goto LABEL_1062;
              }
            }
            LODWORD(v427) = v226 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v240 = __sb__runningInSpringBoard();
              if (v240)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v328 = [MEMORY[0x1E4F42D90] mainScreen];
                [v328 _referenceBounds];
              }
              LODWORD(v426) = v240 ^ 1;
              BSSizeRoundForScale();
              if (v260 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
              {
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                LODWORD(v422) = 0;
                LODWORD(v420) = 0;
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = -1.0;
                goto LABEL_1163;
              }
              double v34 = v26;
            }
            else
            {
              LODWORD(v426) = 0;
            }
LABEL_1062:
            int v241 = __sb__runningInSpringBoard();
            if (v241)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v428) = 0;
                LODWORD(v425) = 0;
                goto LABEL_1072;
              }
            }
            else
            {
              uint64_t v171 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v171 userInterfaceIdiom])
              {
                LODWORD(v425) = 0;
                LODWORD(v428) = 1;
                goto LABEL_1072;
              }
            }
            LODWORD(v428) = v241 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              int v242 = __sb__runningInSpringBoard();
              if (v242)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v333 = [MEMORY[0x1E4F42D90] mainScreen];
                [v333 _referenceBounds];
              }
              LODWORD(v425) = v242 ^ 1;
              BSSizeRoundForScale();
              if (v243 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
              {
LABEL_1076:
                int v244 = __sb__runningInSpringBoard();
                uint64_t v357 = (void *)v171;
                if (v244)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  {
                    LODWORD(v422) = 0;
                    LODWORD(v420) = 0;
                    goto LABEL_1086;
                  }
                }
                else
                {
                  a7 = [MEMORY[0x1E4F42948] currentDevice];
                  int v344 = a7;
                  if ([a7 userInterfaceIdiom])
                  {
                    LODWORD(v420) = 0;
                    LODWORD(v422) = 1;
                    goto LABEL_1086;
                  }
                }
                LODWORD(v422) = v244 ^ 1;
                if (SBFEffectiveHomeButtonType() != 2)
                {
                  LODWORD(v420) = 0;
                  goto LABEL_1086;
                }
                int v245 = __sb__runningInSpringBoard();
                if (v245)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  v329 = [MEMORY[0x1E4F42D90] mainScreen];
                  [v329 _referenceBounds];
                }
                LODWORD(v420) = v245 ^ 1;
                BSSizeRoundForScale();
                if (v256 < *(double *)(MEMORY[0x1E4FA6E50] + 120))
                {
                  double v34 = v26;
LABEL_1086:
                  int v246 = __sb__runningInSpringBoard();
                  if (v246)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v424) = 0;
                      LODWORD(v423) = 0;
                      goto LABEL_1130;
                    }
                  }
                  else
                  {
                    a7 = [MEMORY[0x1E4F42948] currentDevice];
                    v339 = a7;
                    if ([a7 userInterfaceIdiom])
                    {
                      LODWORD(v423) = 0;
                      LODWORD(v424) = 1;
                      goto LABEL_1130;
                    }
                  }
                  LODWORD(v424) = v246 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    int v254 = __sb__runningInSpringBoard();
                    if (v254)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v325 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v325 _referenceBounds];
                    }
                    LODWORD(v423) = v254 ^ 1;
                    BSSizeRoundForScale();
                    double v34 = v26;
                    if (v262 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
                      goto LABEL_1168;
                    }
                  }
                  else
                  {
                    LODWORD(v423) = 0;
                  }
LABEL_1130:
                  if (_SBF_Private_IsD33OrSimilarDevice())
                  {
                    LODWORD(v421) = 0;
                    LODWORD(v417) = 0;
                    LODWORD(v419) = 0;
                    LODWORD(v418) = 0;
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    int v59 = 0;
                    int v60 = 0;
                    double v61 = 0.0;
                    goto LABEL_132;
                  }
LABEL_1168:
                  int v263 = __sb__runningInSpringBoard();
                  if (v263)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v421) = 0;
                      LODWORD(v417) = 0;
                      goto LABEL_1199;
                    }
                  }
                  else
                  {
                    v337 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v337 userInterfaceIdiom])
                    {
                      LODWORD(v417) = 0;
                      LODWORD(v421) = 1;
                      goto LABEL_1199;
                    }
                  }
                  LODWORD(v421) = v263 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    int v267 = __sb__runningInSpringBoard();
                    if (v267)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v323 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v323 _referenceBounds];
                    }
                    LODWORD(v417) = v267 ^ 1;
                    BSSizeRoundForScale();
                    if (v274 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
                    {
                      LODWORD(v419) = 0;
                      LODWORD(v418) = 0;
                      LODWORD(v416) = 0;
                      LODWORD(v413) = 0;
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      int v59 = 0;
                      int v60 = 0;
                      double v61 = 0.0;
LABEL_1247:
                      double v34 = v513;
                      goto LABEL_132;
                    }
                  }
                  else
                  {
                    LODWORD(v417) = 0;
                  }
LABEL_1199:
                  int v268 = __sb__runningInSpringBoard();
                  if (v268)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v419) = 0;
                      LODWORD(v418) = 0;
                      goto LABEL_1219;
                    }
                  }
                  else
                  {
                    v331 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v331 userInterfaceIdiom])
                    {
                      LODWORD(v418) = 0;
                      LODWORD(v419) = 1;
                      goto LABEL_1219;
                    }
                  }
                  LODWORD(v419) = v268 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    int v271 = __sb__runningInSpringBoard();
                    if (v271)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v321 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v321 _referenceBounds];
                    }
                    LODWORD(v418) = v271 ^ 1;
                    BSSizeRoundForScale();
                    if (v276 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
                      goto LABEL_1239;
                    }
                  }
                  else
                  {
                    LODWORD(v418) = 0;
                  }
LABEL_1219:
                  if (_SBF_Private_IsD53())
                  {
LABEL_1243:
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    int v59 = 0;
                    int v60 = 0;
                    double v61 = 0.0;
                    goto LABEL_1247;
                  }
LABEL_1239:
                  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
                    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
                  {
                    goto LABEL_1243;
                  }
                  double v61 = 0.0;
                  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
                    || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
                  {
                    LODWORD(v416) = 0;
                    LODWORD(v413) = 0;
                    LODWORD(v415) = 0;
                    LODWORD(v414) = 0;
                    LODWORD(v412) = 0;
                    LODWORD(v411) = 0;
                    int v59 = 0;
                    int v60 = 0;
                    goto LABEL_1247;
                  }
                  int v278 = __sb__runningInSpringBoard();
                  if (v278)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v416) = 0;
                      LODWORD(v413) = 0;
                      goto LABEL_1317;
                    }
                  }
                  else
                  {
                    v319 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v319 userInterfaceIdiom])
                    {
                      LODWORD(v413) = 0;
                      LODWORD(v416) = 1;
                      goto LABEL_1317;
                    }
                  }
                  LODWORD(v416) = v278 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    int v286 = __sb__runningInSpringBoard();
                    if (v286)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v308 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v308 _referenceBounds];
                    }
                    LODWORD(v413) = v286 ^ 1;
                    BSSizeRoundForScale();
                    if (v294 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
                    {
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      int v59 = 0;
                      int v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    LODWORD(v413) = 0;
                  }
LABEL_1317:
                  int v287 = __sb__runningInSpringBoard();
                  if (v287)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v415) = 0;
                      LODWORD(v414) = 0;
                      goto LABEL_1337;
                    }
                  }
                  else
                  {
                    v317 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v317 userInterfaceIdiom])
                    {
                      LODWORD(v414) = 0;
                      LODWORD(v415) = 1;
                      goto LABEL_1337;
                    }
                  }
                  LODWORD(v415) = v287 ^ 1;
                  if (SBFEffectiveHomeButtonType() == 2)
                  {
                    int v290 = __sb__runningInSpringBoard();
                    if (v290)
                    {
                      __sb__mainScreenReferenceBounds();
                    }
                    else
                    {
                      v306 = [MEMORY[0x1E4F42D90] mainScreen];
                      [v306 _referenceBounds];
                    }
                    LODWORD(v414) = v290 ^ 1;
                    BSSizeRoundForScale();
                    if (v302 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
                    {
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      int v59 = 0;
                      int v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    LODWORD(v414) = 0;
                  }
LABEL_1337:
                  int v291 = __sb__runningInSpringBoard();
                  if (v291)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
                      LODWORD(v412) = 0;
                      LODWORD(v411) = 0;
                      goto LABEL_1363;
                    }
                  }
                  else
                  {
                    v315 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v315 userInterfaceIdiom])
                    {
                      LODWORD(v411) = 0;
                      LODWORD(v412) = 1;
                      goto LABEL_1363;
                    }
                  }
                  LODWORD(v412) = v291 ^ 1;
                  int v296 = __sb__runningInSpringBoard();
                  if (v296)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    v311 = [MEMORY[0x1E4F42D90] mainScreen];
                    [v311 _referenceBounds];
                  }
                  LODWORD(v411) = v296 ^ 1;
                  BSSizeRoundForScale();
                  if (v297 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
                    goto LABEL_1366;
                  }
LABEL_1363:
                  int v298 = __sb__runningInSpringBoard();
                  if (v298)
                  {
                    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                    {
LABEL_1366:
                      int v59 = 0;
                      int v60 = 0;
                      goto LABEL_1247;
                    }
                  }
                  else
                  {
                    v313 = [MEMORY[0x1E4F42948] currentDevice];
                    if ([v313 userInterfaceIdiom])
                    {
                      int v60 = 0;
                      int v59 = 1;
                      goto LABEL_1247;
                    }
                  }
                  int v304 = __sb__runningInSpringBoard();
                  if (v304)
                  {
                    __sb__mainScreenReferenceBounds();
                  }
                  else
                  {
                    a7 = [MEMORY[0x1E4F42D90] mainScreen];
                    [a7 _referenceBounds];
                  }
                  BSSizeRoundForScale();
                  int v60 = v304 ^ 1;
                  double v34 = v513;
                  int v59 = v298 ^ 1;
                  goto LABEL_132;
                }
                LODWORD(v424) = 0;
                LODWORD(v423) = 0;
                LODWORD(v421) = 0;
                LODWORD(v417) = 0;
                LODWORD(v419) = 0;
                LODWORD(v418) = 0;
                LODWORD(v416) = 0;
                LODWORD(v413) = 0;
                LODWORD(v415) = 0;
                LODWORD(v414) = 0;
                LODWORD(v412) = 0;
                LODWORD(v411) = 0;
                int v59 = 0;
                int v60 = 0;
                double v61 = 0.0;
LABEL_1163:
                double v34 = v513;
                goto LABEL_132;
              }
            }
            else
            {
              LODWORD(v425) = 0;
            }
LABEL_1072:
            if (_SBF_Private_IsD63Like())
            {
              uint64_t v357 = (void *)v171;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v60 = 0;
              double v61 = -1.0;
              goto LABEL_132;
            }
            goto LABEL_1076;
          }
        }
        uint64_t v398 = v36;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        LODWORD(v442) = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        int v60 = 0;
        double v61 = 0.0;
        LODWORD(v450) = v120 ^ 1;
LABEL_132:
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v65 = 0;
        int v66 = 0;
        int v67 = 0;
        int v68 = 0;
        uint64_t v463 = 0;
        uint64_t v465 = 0;
        uint64_t v467 = 0;
        uint64_t v469 = 0;
        uint64_t v471 = 0;
        uint64_t v475 = 0;
        uint64_t v473 = 0;
        uint64_t v477 = 0;
        uint64_t v479 = 0;
        uint64_t v481 = 0;
        uint64_t v485 = 0;
        uint64_t v487 = 0;
        uint64_t v483 = 0;
        uint64_t v489 = 0;
        uint64_t v491 = 0;
        uint64_t v495 = 0;
        uint64_t v493 = 0;
        uint64_t v497 = 0;
        uint64_t v499 = 0;
        uint64_t v501 = 0;
        uint64_t v503 = 0;
        uint64_t v505 = 0;
        uint64_t v507 = 0;
        double v69 = -v61;
        goto LABEL_133;
      }
    }
    else
    {
      double v8 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v8 userInterfaceIdiom] != 1)
      {
        LODWORD(v451) = 0;
        LODWORD(v452) = 1;
        goto LABEL_545;
      }
    }
    LODWORD(v452) = v71 ^ 1;
    int v72 = __sb__runningInSpringBoard();
    if (v72)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v9 = [MEMORY[0x1E4F42D90] mainScreen];
      [v9 _referenceBounds];
    }
    LODWORD(v451) = v72 ^ 1;
    BSSizeRoundForScale();
    if (v119 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      uint64_t v401 = v9;
      uint64_t v402 = v8;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      LODWORD(v442) = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      int v60 = 0;
      double v61 = 0.0;
      goto LABEL_132;
    }
    goto LABEL_545;
  }
  if (v37)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v507 = 0;
      goto LABEL_34;
    }
  }
  else
  {
    v407 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v407 userInterfaceIdiom] != 1)
    {
      uint64_t v507 = 0x100000000;
      goto LABEL_34;
    }
  }
  a7 = (BOOL *)(v38 ^ 1u);
  HIDWORD(v507) = v38 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v388 = [MEMORY[0x1E4F42D90] mainScreen];
      [v388 _referenceBounds];
    }
    a7 = (BOOL *)(v40 ^ 1u);
    BSSizeRoundForScale();
    LODWORD(v507) = v40 ^ 1;
    if (v79 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v78 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      uint64_t v479 = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      uint64_t v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      uint64_t v487 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v483 = 0;
      uint64_t v489 = 0;
      uint64_t v491 = 0;
      uint64_t v495 = 0;
      uint64_t v493 = 0;
      uint64_t v497 = 0;
      uint64_t v499 = 0;
      uint64_t v501 = 0;
      uint64_t v503 = 0;
      uint64_t v505 = 0;
      double v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v507) = 0;
  }
LABEL_34:
  int v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v495) = 0;
      HIDWORD(v499) = 0;
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v405 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v405 userInterfaceIdiom] != 1)
    {
      LODWORD(v495) = 0;
      HIDWORD(v499) = 1;
      goto LABEL_52;
    }
  }
  a7 = (BOOL *)(v43 ^ 1u);
  HIDWORD(v499) = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v44 = __sb__runningInSpringBoard();
    if (v44)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v386 = [MEMORY[0x1E4F42D90] mainScreen];
      [v386 _referenceBounds];
    }
    a7 = (BOOL *)(v44 ^ 1u);
    BSSizeRoundForScale();
    LODWORD(v495) = v44 ^ 1;
    if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      uint64_t v479 = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      uint64_t v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      uint64_t v487 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v483 = 0;
      uint64_t v489 = 0;
      uint64_t v491 = 0;
      HIDWORD(v495) = 0;
      uint64_t v493 = 0;
      uint64_t v497 = 0;
      LODWORD(v499) = 0;
      uint64_t v501 = 0;
      uint64_t v503 = 0;
      uint64_t v505 = 0;
      double v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v495) = 0;
  }
LABEL_52:
  int v47 = __sb__runningInSpringBoard();
  if (v47)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v505 = 0;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v403 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v403 userInterfaceIdiom] != 1)
    {
      uint64_t v505 = 0x100000000;
      goto LABEL_69;
    }
  }
  HIDWORD(v505) = v47 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v48 = __sb__runningInSpringBoard();
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v384 = [MEMORY[0x1E4F42D90] mainScreen];
      [v384 _referenceBounds];
    }
    LODWORD(v505) = v48 ^ 1;
    BSSizeRoundForScale();
    if (v118 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      uint64_t v479 = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      uint64_t v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      uint64_t v487 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v483 = 0;
      uint64_t v489 = 0;
      uint64_t v491 = 0;
      HIDWORD(v495) = 0;
      uint64_t v493 = 0;
      uint64_t v497 = 0;
      LODWORD(v499) = 0;
      uint64_t v501 = 0;
      uint64_t v503 = 0;
      double v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v505) = 0;
  }
LABEL_69:
  int v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v503 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v399 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v399 userInterfaceIdiom] != 1)
    {
      uint64_t v503 = 0x100000000;
      goto LABEL_87;
    }
  }
  HIDWORD(v503) = v51 ^ 1;
  int v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v394 = [MEMORY[0x1E4F42D90] mainScreen];
    [v394 _referenceBounds];
  }
  LODWORD(v503) = v52 ^ 1;
  BSSizeRoundForScale();
  if (v56 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v62 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    int v461 = 0;
    int v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    int v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    int v67 = 0;
    LODWORD(v458) = 0;
    int v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    uint64_t v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    uint64_t v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    uint64_t v467 = 0;
    LODWORD(v442) = 0;
    uint64_t v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    uint64_t v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    uint64_t v475 = 0;
    LODWORD(v431) = 0;
    uint64_t v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    uint64_t v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    uint64_t v479 = 0;
    LODWORD(v419) = 0;
    uint64_t v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    uint64_t v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    uint64_t v487 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v483 = 0;
    uint64_t v489 = 0;
    uint64_t v491 = 0;
    HIDWORD(v495) = 0;
    uint64_t v493 = 0;
    uint64_t v497 = 0;
    LODWORD(v499) = 0;
    uint64_t v501 = 0;
    double v69 = 0.0;
    goto LABEL_133;
  }
LABEL_87:
  int v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v501 = 0;
      goto LABEL_107;
    }
  }
  else
  {
    uint64_t v397 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v397 userInterfaceIdiom] != 1)
    {
      uint64_t v501 = 0x100000000;
      goto LABEL_107;
    }
  }
  HIDWORD(v501) = v57 ^ 1;
  int v58 = __sb__runningInSpringBoard();
  if (v58)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v390 = [MEMORY[0x1E4F42D90] mainScreen];
    [v390 _referenceBounds];
  }
  LODWORD(v501) = v58 ^ 1;
  BSSizeRoundForScale();
  if (v73 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v62 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    int v461 = 0;
    int v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    int v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    int v67 = 0;
    LODWORD(v458) = 0;
    int v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    uint64_t v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    uint64_t v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    uint64_t v467 = 0;
    LODWORD(v442) = 0;
    uint64_t v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    uint64_t v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    uint64_t v475 = 0;
    LODWORD(v431) = 0;
    uint64_t v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    uint64_t v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    uint64_t v479 = 0;
    LODWORD(v419) = 0;
    uint64_t v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    uint64_t v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    uint64_t v487 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v483 = 0;
    uint64_t v489 = 0;
    uint64_t v491 = 0;
    HIDWORD(v495) = 0;
    uint64_t v493 = 0;
    uint64_t v497 = 0;
    LODWORD(v499) = 0;
    double v69 = 0.0;
    goto LABEL_133;
  }
LABEL_107:
  int v74 = __sb__runningInSpringBoard();
  if (v74)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v497) = 0;
      LODWORD(v499) = 0;
      goto LABEL_557;
    }
  }
  else
  {
    uint64_t v396 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v396 userInterfaceIdiom] != 1)
    {
      HIDWORD(v497) = 0;
      LODWORD(v499) = 1;
      goto LABEL_557;
    }
  }
  LODWORD(v499) = v74 ^ 1;
  int v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v383 = [MEMORY[0x1E4F42D90] mainScreen];
    [v383 _referenceBounds];
  }
  HIDWORD(v497) = v75 ^ 1;
  BSSizeRoundForScale();
  if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v62 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    int v461 = 0;
    int v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    int v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    int v67 = 0;
    LODWORD(v458) = 0;
    int v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    uint64_t v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    uint64_t v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    uint64_t v467 = 0;
    LODWORD(v442) = 0;
    uint64_t v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    uint64_t v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    uint64_t v475 = 0;
    LODWORD(v431) = 0;
    uint64_t v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    uint64_t v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    uint64_t v479 = 0;
    LODWORD(v419) = 0;
    uint64_t v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    uint64_t v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    uint64_t v487 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v483 = 0;
    uint64_t v489 = 0;
    uint64_t v491 = 0;
    HIDWORD(v495) = 0;
    uint64_t v493 = 0;
    LODWORD(v497) = 0;
    double v69 = 0.0;
    goto LABEL_133;
  }
LABEL_557:
  int v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_559;
    }
LABEL_565:
    int v62 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    int v461 = 0;
    int v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    int v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    int v67 = 0;
    LODWORD(v458) = 0;
    int v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    uint64_t v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    uint64_t v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    uint64_t v467 = 0;
    LODWORD(v442) = 0;
    uint64_t v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    uint64_t v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    uint64_t v475 = 0;
    LODWORD(v431) = 0;
    uint64_t v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    uint64_t v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    uint64_t v479 = 0;
    LODWORD(v419) = 0;
    uint64_t v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    uint64_t v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    uint64_t v487 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v483 = 0;
    uint64_t v489 = 0;
    uint64_t v491 = 0;
    HIDWORD(v495) = 0;
    uint64_t v493 = 0;
    double v69 = 0.0;
    LODWORD(v497) = v125 ^ 1;
    goto LABEL_133;
  }
  uint64_t v393 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v393 userInterfaceIdiom] == 1) {
    goto LABEL_565;
  }
LABEL_559:
  a7 = (BOOL *)(v125 ^ 1u);
  LODWORD(v497) = v125 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_563:
    uint64_t v493 = 0;
    goto LABEL_665;
  }
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_563;
    }
  }
  else
  {
    uint64_t v377 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v377 userInterfaceIdiom])
    {
      uint64_t v493 = 0x100000000;
      goto LABEL_665;
    }
  }
  HIDWORD(v493) = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v360 = [MEMORY[0x1E4F42D90] mainScreen];
      [v360 _referenceBounds];
    }
    LODWORD(v493) = v147 ^ 1;
    BSSizeRoundForScale();
    if (v156 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      uint64_t v479 = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      uint64_t v485 = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      uint64_t v487 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v483 = 0;
      uint64_t v489 = 0;
      uint64_t v491 = 0;
      HIDWORD(v495) = 0;
      double v69 = 0.0;
      goto LABEL_133;
    }
  }
  else
  {
    LODWORD(v493) = 0;
  }
LABEL_665:
  int v148 = __sb__runningInSpringBoard();
  if (v148)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v491) = 0;
      HIDWORD(v495) = 0;
      goto LABEL_675;
    }
  }
  else
  {
    uint64_t v379 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v379 userInterfaceIdiom])
    {
      HIDWORD(v491) = 0;
      HIDWORD(v495) = 1;
      goto LABEL_675;
    }
  }
  HIDWORD(v495) = v148 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v149 = __sb__runningInSpringBoard();
    if (v149)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v367 = [MEMORY[0x1E4F42D90] mainScreen];
      [v367 _referenceBounds];
    }
    HIDWORD(v491) = v149 ^ 1;
    BSSizeRoundForScale();
    if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_679;
    }
  }
  else
  {
    HIDWORD(v491) = 0;
  }
LABEL_675:
  if (_SBF_Private_IsD94Like())
  {
    int v62 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    int v461 = 0;
    int v65 = 0;
    LODWORD(v454) = 0;
    LODWORD(v453) = 0;
    int v66 = 0;
    LODWORD(v447) = 0;
    LODWORD(v460) = 0;
    LODWORD(v459) = 0;
    int v67 = 0;
    LODWORD(v458) = 0;
    int v68 = 0;
    LODWORD(v457) = 0;
    LODWORD(v456) = 0;
    LODWORD(v455) = 0;
    uint64_t v463 = 0;
    LODWORD(v452) = 0;
    LODWORD(v451) = 0;
    LODWORD(v450) = 0;
    LODWORD(v449) = 0;
    LODWORD(v448) = 0;
    uint64_t v465 = 0;
    LODWORD(v446) = 0;
    LODWORD(v443) = 0;
    LODWORD(v445) = 0;
    LODWORD(v444) = 0;
    uint64_t v467 = 0;
    LODWORD(v442) = 0;
    uint64_t v469 = 0;
    LODWORD(v435) = 0;
    LODWORD(v441) = 0;
    LODWORD(v440) = 0;
    LODWORD(v439) = 0;
    LODWORD(v438) = 0;
    LODWORD(v437) = 0;
    LODWORD(v436) = 0;
    uint64_t v471 = 0;
    LODWORD(v434) = 0;
    LODWORD(v433) = 0;
    LODWORD(v432) = 0;
    LODWORD(v429) = 0;
    uint64_t v475 = 0;
    LODWORD(v431) = 0;
    uint64_t v473 = 0;
    LODWORD(v430) = 0;
    LODWORD(v427) = 0;
    LODWORD(v426) = 0;
    LODWORD(v428) = 0;
    uint64_t v477 = 0;
    LODWORD(v425) = 0;
    LODWORD(v422) = 0;
    LODWORD(v420) = 0;
    LODWORD(v424) = 0;
    LODWORD(v423) = 0;
    LODWORD(v421) = 0;
    LODWORD(v417) = 0;
    uint64_t v479 = 0;
    LODWORD(v419) = 0;
    uint64_t v481 = 0;
    LODWORD(v418) = 0;
    LODWORD(v416) = 0;
    LODWORD(v413) = 0;
    LODWORD(v415) = 0;
    uint64_t v485 = 0;
    LODWORD(v414) = 0;
    LODWORD(v412) = 0;
    LODWORD(v411) = 0;
    uint64_t v487 = 0;
    int v59 = 0;
    int v60 = 0;
    uint64_t v483 = 0;
    uint64_t v489 = 0;
    LODWORD(v491) = 0;
    double v69 = 0.0;
    goto LABEL_133;
  }
LABEL_679:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_683:
    HIDWORD(v489) = 0;
    LODWORD(v491) = 0;
    goto LABEL_760;
  }
  int v151 = __sb__runningInSpringBoard();
  if (v151)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_683;
    }
  }
  else
  {
    uint64_t v368 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v368 userInterfaceIdiom])
    {
      HIDWORD(v489) = 0;
      LODWORD(v491) = 1;
      goto LABEL_760;
    }
  }
  LODWORD(v491) = v151 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    HIDWORD(v489) = 0;
    goto LABEL_760;
  }
  int v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v353 = [MEMORY[0x1E4F42D90] mainScreen];
    [v353 _referenceBounds];
  }
  HIDWORD(v489) = v172 ^ 1;
  BSSizeRoundForScale();
  if (v186 < *(double *)(MEMORY[0x1E4FA6E50] + 136))
  {
LABEL_760:
    int v173 = __sb__runningInSpringBoard();
    if (v173)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        LODWORD(v485) = 0;
        LODWORD(v489) = 0;
        goto LABEL_770;
      }
    }
    else
    {
      uint64_t v376 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v376 userInterfaceIdiom])
      {
        LODWORD(v485) = 0;
        LODWORD(v489) = 1;
        goto LABEL_770;
      }
    }
    LODWORD(v489) = v173 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v174 = __sb__runningInSpringBoard();
      if (v174)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v359 = [MEMORY[0x1E4F42D90] mainScreen];
        [v359 _referenceBounds];
      }
      LODWORD(v485) = v174 ^ 1;
      BSSizeRoundForScale();
      if (v175 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
        goto LABEL_774;
      }
    }
    else
    {
      LODWORD(v485) = 0;
    }
LABEL_770:
    if (_SBF_Private_IsD64Like())
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      uint64_t v479 = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      HIDWORD(v485) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      uint64_t v487 = 0;
      int v59 = 0;
      int v60 = 0;
      uint64_t v483 = 0;
      double v69 = -1.0;
      goto LABEL_133;
    }
LABEL_774:
    int v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v483) = 0;
        HIDWORD(v487) = 0;
        goto LABEL_784;
      }
    }
    else
    {
      uint64_t v371 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v371 userInterfaceIdiom])
      {
        HIDWORD(v483) = 0;
        HIDWORD(v487) = 1;
        goto LABEL_784;
      }
    }
    HIDWORD(v487) = v176 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v177 = __sb__runningInSpringBoard();
      if (v177)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v354 = [MEMORY[0x1E4F42D90] mainScreen];
        [v354 _referenceBounds];
      }
      BSSizeRoundForScale();
      HIDWORD(v483) = v177 ^ 1;
      if (v183 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
      {
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v461 = 0;
        int v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        int v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        int v67 = 0;
        LODWORD(v458) = 0;
        int v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        uint64_t v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        uint64_t v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        uint64_t v467 = 0;
        LODWORD(v442) = 0;
        uint64_t v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        uint64_t v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        uint64_t v475 = 0;
        LODWORD(v431) = 0;
        uint64_t v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        uint64_t v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        uint64_t v479 = 0;
        LODWORD(v419) = 0;
        uint64_t v481 = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        HIDWORD(v485) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        LODWORD(v487) = 0;
        int v59 = 0;
        LODWORD(v483) = 0;
        double v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v483) = 0;
    }
LABEL_784:
    int v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v479) = 0;
        LODWORD(v483) = 0;
        goto LABEL_807;
      }
    }
    else
    {
      uint64_t v366 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v366 userInterfaceIdiom])
      {
        HIDWORD(v479) = 0;
        LODWORD(v483) = 1;
        goto LABEL_807;
      }
    }
    LODWORD(v483) = v178 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v181 = __sb__runningInSpringBoard();
      if (v181)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v352 = [MEMORY[0x1E4F42D90] mainScreen];
        [v352 _referenceBounds];
      }
      HIDWORD(v479) = v181 ^ 1;
      BSSizeRoundForScale();
      if (v193 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
        goto LABEL_844;
      }
    }
    else
    {
      HIDWORD(v479) = 0;
    }
LABEL_807:
    if (_SBF_Private_IsD54())
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v479) = 0;
      LODWORD(v419) = 0;
      uint64_t v481 = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      HIDWORD(v485) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      LODWORD(v487) = 0;
      int v59 = 0;
      double v69 = 0.0;
      goto LABEL_135;
    }
LABEL_844:
    int v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v485) = 0;
        LODWORD(v487) = 0;
        goto LABEL_864;
      }
    }
    else
    {
      uint64_t v361 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v361 userInterfaceIdiom])
      {
        HIDWORD(v485) = 0;
        LODWORD(v487) = 1;
        goto LABEL_864;
      }
    }
    LODWORD(v487) = v194 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v199 = __sb__runningInSpringBoard();
      if (v199)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v348 = [MEMORY[0x1E4F42D90] mainScreen];
        [v348 _referenceBounds];
      }
      HIDWORD(v485) = v199 ^ 1;
      BSSizeRoundForScale();
      if (v209 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
      {
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v461 = 0;
        int v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        int v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        int v67 = 0;
        LODWORD(v458) = 0;
        int v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        uint64_t v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        uint64_t v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        uint64_t v467 = 0;
        LODWORD(v442) = 0;
        uint64_t v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        uint64_t v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        uint64_t v475 = 0;
        LODWORD(v431) = 0;
        uint64_t v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        uint64_t v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v479) = 0;
        LODWORD(v419) = 0;
        uint64_t v481 = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        double v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v485) = 0;
    }
LABEL_864:
    int v200 = __sb__runningInSpringBoard();
    if (v200)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        uint64_t v481 = 0;
        goto LABEL_881;
      }
    }
    else
    {
      uint64_t v358 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v358 userInterfaceIdiom])
      {
        uint64_t v481 = 0x100000000;
        goto LABEL_881;
      }
    }
    HIDWORD(v481) = v200 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v202 = __sb__runningInSpringBoard();
      if (v202)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        int v346 = [MEMORY[0x1E4F42D90] mainScreen];
        [v346 _referenceBounds];
      }
      LODWORD(v481) = v202 ^ 1;
      BSSizeRoundForScale();
      if (v212 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
        goto LABEL_928;
      }
    }
    else
    {
      LODWORD(v481) = 0;
    }
LABEL_881:
    if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      uint64_t v475 = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      uint64_t v477 = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v479) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      double v69 = 0.0;
      goto LABEL_135;
    }
LABEL_928:
    if (!_SBF_Private_IsD93Like())
    {
LABEL_932:
      HIDWORD(v475) = 0;
      LODWORD(v479) = 0;
      goto LABEL_1001;
    }
    int v213 = __sb__runningInSpringBoard();
    if (v213)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
        goto LABEL_932;
      }
    }
    else
    {
      uint64_t v350 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v350 userInterfaceIdiom])
      {
        HIDWORD(v475) = 0;
        LODWORD(v479) = 1;
        goto LABEL_1001;
      }
    }
    LODWORD(v479) = v213 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v227 = __sb__runningInSpringBoard();
      if (v227)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v335 = [MEMORY[0x1E4F42D90] mainScreen];
        [v335 _referenceBounds];
      }
      HIDWORD(v475) = v227 ^ 1;
      BSSizeRoundForScale();
      if (v236 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
      {
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v461 = 0;
        int v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        int v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        int v67 = 0;
        LODWORD(v458) = 0;
        int v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        uint64_t v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        uint64_t v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        uint64_t v467 = 0;
        LODWORD(v442) = 0;
        uint64_t v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        uint64_t v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v475) = 0;
        LODWORD(v431) = 0;
        uint64_t v473 = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        uint64_t v477 = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        double v69 = 0.0;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v475) = 0;
    }
LABEL_1001:
    int v228 = __sb__runningInSpringBoard();
    if (v228)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        uint64_t v477 = 0;
        goto LABEL_1011;
      }
    }
    else
    {
      uint64_t v355 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v355 userInterfaceIdiom])
      {
        uint64_t v477 = 0x100000000;
        goto LABEL_1011;
      }
    }
    HIDWORD(v477) = v228 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v229 = __sb__runningInSpringBoard();
      if (v229)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v341 = [MEMORY[0x1E4F42D90] mainScreen];
        [v341 _referenceBounds];
      }
      LODWORD(v477) = v229 ^ 1;
      BSSizeRoundForScale();
      if (v230 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
        goto LABEL_1015;
      }
    }
    else
    {
      LODWORD(v477) = 0;
    }
LABEL_1011:
    if (_SBF_Private_IsD93Like())
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      uint64_t v471 = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v475) = 0;
      LODWORD(v431) = 0;
      uint64_t v473 = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      double v69 = 0.0;
      goto LABEL_135;
    }
LABEL_1015:
    if (!_SBF_Private_IsD63Like())
    {
LABEL_1019:
      uint64_t v473 = 0;
      goto LABEL_1096;
    }
    int v231 = __sb__runningInSpringBoard();
    if (v231)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
        goto LABEL_1019;
      }
    }
    else
    {
      v342 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v342 userInterfaceIdiom])
      {
        uint64_t v473 = 0x100000000;
        goto LABEL_1096;
      }
    }
    HIDWORD(v473) = v231 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v247 = __sb__runningInSpringBoard();
      if (v247)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v327 = [MEMORY[0x1E4F42D90] mainScreen];
        [v327 _referenceBounds];
      }
      LODWORD(v473) = v247 ^ 1;
      BSSizeRoundForScale();
      if (v261 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
      {
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v461 = 0;
        int v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        int v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        int v67 = 0;
        LODWORD(v458) = 0;
        int v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        uint64_t v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        uint64_t v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        uint64_t v467 = 0;
        LODWORD(v442) = 0;
        uint64_t v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        uint64_t v471 = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v475) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        double v69 = -1.0;
        goto LABEL_1165;
      }
      double v34 = v26;
    }
    else
    {
      LODWORD(v473) = 0;
    }
LABEL_1096:
    int v248 = __sb__runningInSpringBoard();
    if (v248)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        HIDWORD(v471) = 0;
        LODWORD(v475) = 0;
        goto LABEL_1106;
      }
    }
    else
    {
      unint64_t v349 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v349 userInterfaceIdiom])
      {
        HIDWORD(v471) = 0;
        LODWORD(v475) = 1;
        goto LABEL_1106;
      }
    }
    LODWORD(v475) = v248 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v249 = __sb__runningInSpringBoard();
      if (v249)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v334 = [MEMORY[0x1E4F42D90] mainScreen];
        [v334 _referenceBounds];
      }
      HIDWORD(v471) = v249 ^ 1;
      BSSizeRoundForScale();
      if (v250 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
      {
LABEL_1110:
        int v251 = __sb__runningInSpringBoard();
        if (v251)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v467) = 0;
            LODWORD(v471) = 0;
            goto LABEL_1120;
          }
        }
        else
        {
          int v345 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v345 userInterfaceIdiom])
          {
            LODWORD(v467) = 0;
            LODWORD(v471) = 1;
            goto LABEL_1120;
          }
        }
        LODWORD(v471) = v251 ^ 1;
        if (SBFEffectiveHomeButtonType() != 2)
        {
          LODWORD(v467) = 0;
          goto LABEL_1120;
        }
        int v252 = __sb__runningInSpringBoard();
        if (v252)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          v330 = [MEMORY[0x1E4F42D90] mainScreen];
          [v330 _referenceBounds];
        }
        LODWORD(v467) = v252 ^ 1;
        BSSizeRoundForScale();
        if (v257 < *(double *)(MEMORY[0x1E4FA6E50] + 120))
        {
          double v34 = v26;
LABEL_1120:
          int v253 = __sb__runningInSpringBoard();
          if (v253)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              uint64_t v469 = 0;
              goto LABEL_1136;
            }
          }
          else
          {
            v340 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v340 userInterfaceIdiom])
            {
              uint64_t v469 = 0x100000000;
              goto LABEL_1136;
            }
          }
          HIDWORD(v469) = v253 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            int v255 = __sb__runningInSpringBoard();
            if (v255)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              v326 = [MEMORY[0x1E4F42D90] mainScreen];
              [v326 _referenceBounds];
            }
            LODWORD(v469) = v255 ^ 1;
            BSSizeRoundForScale();
            double v34 = v26;
            if (v264 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
              goto LABEL_1176;
            }
          }
          else
          {
            LODWORD(v469) = 0;
          }
LABEL_1136:
          if (_SBF_Private_IsD33OrSimilarDevice())
          {
            int v62 = 0;
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            int v461 = 0;
            int v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            int v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            int v67 = 0;
            LODWORD(v458) = 0;
            int v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            uint64_t v463 = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            uint64_t v465 = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            HIDWORD(v467) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            int v59 = 0;
            double v69 = 0.0;
            goto LABEL_135;
          }
LABEL_1176:
          int v265 = __sb__runningInSpringBoard();
          if (v265)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              HIDWORD(v465) = 0;
              HIDWORD(v467) = 0;
              goto LABEL_1209;
            }
          }
          else
          {
            v338 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v338 userInterfaceIdiom])
            {
              HIDWORD(v465) = 0;
              HIDWORD(v467) = 1;
              goto LABEL_1209;
            }
          }
          HIDWORD(v467) = v265 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            int v269 = __sb__runningInSpringBoard();
            if (v269)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              v324 = [MEMORY[0x1E4F42D90] mainScreen];
              [v324 _referenceBounds];
            }
            HIDWORD(v465) = v269 ^ 1;
            BSSizeRoundForScale();
            if (v275 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
            {
              int v62 = 0;
              uint64_t v63 = 0;
              uint64_t v64 = 0;
              int v461 = 0;
              int v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              int v66 = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              int v67 = 0;
              LODWORD(v458) = 0;
              int v68 = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              uint64_t v463 = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v465) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              double v69 = 0.0;
LABEL_1258:
              double v34 = v513;
              goto LABEL_135;
            }
          }
          else
          {
            HIDWORD(v465) = 0;
          }
LABEL_1209:
          int v270 = __sb__runningInSpringBoard();
          if (v270)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              HIDWORD(v463) = 0;
              LODWORD(v465) = 0;
              goto LABEL_1225;
            }
          }
          else
          {
            v332 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v332 userInterfaceIdiom])
            {
              HIDWORD(v463) = 0;
              LODWORD(v465) = 1;
              goto LABEL_1225;
            }
          }
          LODWORD(v465) = v270 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            int v272 = __sb__runningInSpringBoard();
            if (v272)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              v322 = [MEMORY[0x1E4F42D90] mainScreen];
              [v322 _referenceBounds];
            }
            HIDWORD(v463) = v272 ^ 1;
            BSSizeRoundForScale();
            if (v277 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
              goto LABEL_1250;
            }
          }
          else
          {
            HIDWORD(v463) = 0;
          }
LABEL_1225:
          if (_SBF_Private_IsD53())
          {
LABEL_1254:
            int v62 = 0;
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            int v461 = 0;
            int v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            int v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            int v67 = 0;
            LODWORD(v458) = 0;
            int v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            LODWORD(v463) = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            int v59 = 0;
            double v69 = 0.0;
            goto LABEL_1258;
          }
LABEL_1250:
          if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
            || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
          {
            goto LABEL_1254;
          }
          double v69 = 0.0;
          if (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice())
          {
            int v62 = 0;
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            int v461 = 0;
            int v65 = 0;
            LODWORD(v454) = 0;
            LODWORD(v453) = 0;
            int v66 = 0;
            LODWORD(v447) = 0;
            LODWORD(v460) = 0;
            LODWORD(v459) = 0;
            int v67 = 0;
            LODWORD(v458) = 0;
            int v68 = 0;
            LODWORD(v457) = 0;
            LODWORD(v456) = 0;
            LODWORD(v455) = 0;
            LODWORD(v463) = 0;
            LODWORD(v452) = 0;
            LODWORD(v451) = 0;
            LODWORD(v450) = 0;
            LODWORD(v449) = 0;
            LODWORD(v448) = 0;
            LODWORD(v446) = 0;
            LODWORD(v443) = 0;
            LODWORD(v445) = 0;
            LODWORD(v444) = 0;
            LODWORD(v442) = 0;
            LODWORD(v435) = 0;
            LODWORD(v441) = 0;
            LODWORD(v440) = 0;
            LODWORD(v439) = 0;
            LODWORD(v438) = 0;
            LODWORD(v437) = 0;
            LODWORD(v436) = 0;
            LODWORD(v434) = 0;
            LODWORD(v433) = 0;
            LODWORD(v432) = 0;
            LODWORD(v429) = 0;
            LODWORD(v431) = 0;
            LODWORD(v430) = 0;
            LODWORD(v427) = 0;
            LODWORD(v426) = 0;
            LODWORD(v428) = 0;
            LODWORD(v425) = 0;
            LODWORD(v422) = 0;
            LODWORD(v420) = 0;
            LODWORD(v424) = 0;
            LODWORD(v423) = 0;
            LODWORD(v421) = 0;
            LODWORD(v417) = 0;
            LODWORD(v419) = 0;
            LODWORD(v418) = 0;
            LODWORD(v416) = 0;
            LODWORD(v413) = 0;
            LODWORD(v415) = 0;
            LODWORD(v414) = 0;
            LODWORD(v412) = 0;
            LODWORD(v411) = 0;
            int v59 = 0;
            goto LABEL_1258;
          }
          int v279 = __sb__runningInSpringBoard();
          if (v279)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              int v68 = 0;
              LODWORD(v463) = 0;
              goto LABEL_1327;
            }
          }
          else
          {
            v320 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v320 userInterfaceIdiom])
            {
              int v68 = 0;
              LODWORD(v463) = 1;
              goto LABEL_1327;
            }
          }
          LODWORD(v463) = v279 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            int v288 = __sb__runningInSpringBoard();
            if (v288)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              v309 = [MEMORY[0x1E4F42D90] mainScreen];
              [v309 _referenceBounds];
            }
            int v68 = v288 ^ 1;
            BSSizeRoundForScale();
            if (v295 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
            {
              int v62 = 0;
              uint64_t v63 = 0;
              uint64_t v64 = 0;
              int v461 = 0;
              int v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              int v66 = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              int v67 = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            int v68 = 0;
          }
LABEL_1327:
          int v289 = __sb__runningInSpringBoard();
          if (v289)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              int v66 = 0;
              int v67 = 0;
              goto LABEL_1347;
            }
          }
          else
          {
            v318 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v318 userInterfaceIdiom])
            {
              int v66 = 0;
              int v67 = 1;
              goto LABEL_1347;
            }
          }
          int v67 = v289 ^ 1;
          if (SBFEffectiveHomeButtonType() == 2)
          {
            int v292 = __sb__runningInSpringBoard();
            if (v292)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              v307 = [MEMORY[0x1E4F42D90] mainScreen];
              [v307 _referenceBounds];
            }
            int v66 = v292 ^ 1;
            BSSizeRoundForScale();
            if (v303 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
            {
              int v62 = 0;
              uint64_t v63 = 0;
              uint64_t v64 = 0;
              int v461 = 0;
              int v65 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            int v66 = 0;
          }
LABEL_1347:
          int v293 = __sb__runningInSpringBoard();
          if (v293)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
              uint64_t v63 = 0;
              int v65 = 0;
              goto LABEL_1373;
            }
          }
          else
          {
            v316 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v316 userInterfaceIdiom])
            {
              uint64_t v63 = 0;
              int v65 = 1;
              goto LABEL_1373;
            }
          }
          int v65 = v293 ^ 1;
          int v299 = __sb__runningInSpringBoard();
          if (v299)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v312 = [MEMORY[0x1E4F42D90] mainScreen];
            [v312 _referenceBounds];
          }
          uint64_t v63 = v299 ^ 1u;
          BSSizeRoundForScale();
          if (v300 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
            goto LABEL_1376;
          }
LABEL_1373:
          int v301 = __sb__runningInSpringBoard();
          if (v301)
          {
            if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            {
LABEL_1376:
              int v62 = 0;
              uint64_t v64 = 0;
              int v461 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              goto LABEL_1258;
            }
          }
          else
          {
            v314 = [MEMORY[0x1E4F42948] currentDevice];
            if ([v314 userInterfaceIdiom])
            {
              uint64_t v64 = 0;
              int v461 = 0;
              LODWORD(v454) = 0;
              LODWORD(v453) = 0;
              LODWORD(v447) = 0;
              LODWORD(v460) = 0;
              LODWORD(v459) = 0;
              LODWORD(v458) = 0;
              LODWORD(v457) = 0;
              LODWORD(v456) = 0;
              LODWORD(v455) = 0;
              LODWORD(v452) = 0;
              LODWORD(v451) = 0;
              LODWORD(v450) = 0;
              LODWORD(v449) = 0;
              LODWORD(v448) = 0;
              LODWORD(v446) = 0;
              LODWORD(v443) = 0;
              LODWORD(v445) = 0;
              LODWORD(v444) = 0;
              LODWORD(v442) = 0;
              LODWORD(v435) = 0;
              LODWORD(v441) = 0;
              LODWORD(v440) = 0;
              LODWORD(v439) = 0;
              LODWORD(v438) = 0;
              LODWORD(v437) = 0;
              LODWORD(v436) = 0;
              LODWORD(v434) = 0;
              LODWORD(v433) = 0;
              LODWORD(v432) = 0;
              LODWORD(v429) = 0;
              LODWORD(v431) = 0;
              LODWORD(v430) = 0;
              LODWORD(v427) = 0;
              LODWORD(v426) = 0;
              LODWORD(v428) = 0;
              LODWORD(v425) = 0;
              LODWORD(v422) = 0;
              LODWORD(v420) = 0;
              LODWORD(v424) = 0;
              LODWORD(v423) = 0;
              LODWORD(v421) = 0;
              LODWORD(v417) = 0;
              LODWORD(v419) = 0;
              LODWORD(v418) = 0;
              LODWORD(v416) = 0;
              LODWORD(v413) = 0;
              LODWORD(v415) = 0;
              LODWORD(v414) = 0;
              LODWORD(v412) = 0;
              LODWORD(v411) = 0;
              int v59 = 0;
              int v62 = 1;
              goto LABEL_1258;
            }
          }
          int v62 = v301 ^ 1;
          int v305 = __sb__runningInSpringBoard();
          if (v305)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v310 = [MEMORY[0x1E4F42D90] mainScreen];
            [v310 _referenceBounds];
          }
          uint64_t v64 = v305 ^ 1u;
          BSSizeRoundForScale();
          int v461 = 0;
          LODWORD(v454) = 0;
          LODWORD(v453) = 0;
          LODWORD(v447) = 0;
          LODWORD(v460) = 0;
          LODWORD(v459) = 0;
          LODWORD(v458) = 0;
          LODWORD(v457) = 0;
          LODWORD(v456) = 0;
          LODWORD(v455) = 0;
          LODWORD(v452) = 0;
          LODWORD(v451) = 0;
          LODWORD(v450) = 0;
          LODWORD(v449) = 0;
          LODWORD(v448) = 0;
          LODWORD(v446) = 0;
          LODWORD(v443) = 0;
          LODWORD(v445) = 0;
          LODWORD(v444) = 0;
          LODWORD(v442) = 0;
          LODWORD(v435) = 0;
          LODWORD(v441) = 0;
          LODWORD(v440) = 0;
          LODWORD(v439) = 0;
          LODWORD(v438) = 0;
          LODWORD(v437) = 0;
          LODWORD(v436) = 0;
          LODWORD(v434) = 0;
          LODWORD(v433) = 0;
          LODWORD(v432) = 0;
          LODWORD(v429) = 0;
          LODWORD(v431) = 0;
          LODWORD(v430) = 0;
          LODWORD(v427) = 0;
          LODWORD(v426) = 0;
          LODWORD(v428) = 0;
          LODWORD(v425) = 0;
          LODWORD(v422) = 0;
          LODWORD(v420) = 0;
          LODWORD(v424) = 0;
          LODWORD(v423) = 0;
          LODWORD(v421) = 0;
          LODWORD(v417) = 0;
          LODWORD(v419) = 0;
          LODWORD(v418) = 0;
          LODWORD(v416) = 0;
          LODWORD(v413) = 0;
          LODWORD(v415) = 0;
          LODWORD(v414) = 0;
          LODWORD(v412) = 0;
          LODWORD(v411) = 0;
          int v59 = 0;
          goto LABEL_1258;
        }
        int v62 = 0;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        int v461 = 0;
        int v65 = 0;
        LODWORD(v454) = 0;
        LODWORD(v453) = 0;
        int v66 = 0;
        LODWORD(v447) = 0;
        LODWORD(v460) = 0;
        LODWORD(v459) = 0;
        int v67 = 0;
        LODWORD(v458) = 0;
        int v68 = 0;
        LODWORD(v457) = 0;
        LODWORD(v456) = 0;
        LODWORD(v455) = 0;
        uint64_t v463 = 0;
        LODWORD(v452) = 0;
        LODWORD(v451) = 0;
        LODWORD(v450) = 0;
        LODWORD(v449) = 0;
        LODWORD(v448) = 0;
        uint64_t v465 = 0;
        LODWORD(v446) = 0;
        LODWORD(v443) = 0;
        LODWORD(v445) = 0;
        LODWORD(v444) = 0;
        HIDWORD(v467) = 0;
        LODWORD(v442) = 0;
        uint64_t v469 = 0;
        LODWORD(v435) = 0;
        LODWORD(v441) = 0;
        LODWORD(v440) = 0;
        LODWORD(v439) = 0;
        LODWORD(v438) = 0;
        LODWORD(v437) = 0;
        LODWORD(v436) = 0;
        LODWORD(v434) = 0;
        LODWORD(v433) = 0;
        LODWORD(v432) = 0;
        LODWORD(v429) = 0;
        LODWORD(v431) = 0;
        LODWORD(v430) = 0;
        LODWORD(v427) = 0;
        LODWORD(v426) = 0;
        LODWORD(v428) = 0;
        LODWORD(v425) = 0;
        LODWORD(v422) = 0;
        LODWORD(v420) = 0;
        LODWORD(v424) = 0;
        LODWORD(v423) = 0;
        LODWORD(v421) = 0;
        LODWORD(v417) = 0;
        LODWORD(v419) = 0;
        LODWORD(v418) = 0;
        LODWORD(v416) = 0;
        LODWORD(v413) = 0;
        LODWORD(v415) = 0;
        LODWORD(v414) = 0;
        LODWORD(v412) = 0;
        LODWORD(v411) = 0;
        int v59 = 0;
        double v69 = 0.0;
LABEL_1165:
        double v34 = v513;
        goto LABEL_135;
      }
    }
    else
    {
      HIDWORD(v471) = 0;
    }
LABEL_1106:
    if (_SBF_Private_IsD63Like())
    {
      int v62 = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      int v461 = 0;
      int v65 = 0;
      LODWORD(v454) = 0;
      LODWORD(v453) = 0;
      int v66 = 0;
      LODWORD(v447) = 0;
      LODWORD(v460) = 0;
      LODWORD(v459) = 0;
      int v67 = 0;
      LODWORD(v458) = 0;
      int v68 = 0;
      LODWORD(v457) = 0;
      LODWORD(v456) = 0;
      LODWORD(v455) = 0;
      uint64_t v463 = 0;
      LODWORD(v452) = 0;
      LODWORD(v451) = 0;
      LODWORD(v450) = 0;
      LODWORD(v449) = 0;
      LODWORD(v448) = 0;
      uint64_t v465 = 0;
      LODWORD(v446) = 0;
      LODWORD(v443) = 0;
      LODWORD(v445) = 0;
      LODWORD(v444) = 0;
      uint64_t v467 = 0;
      LODWORD(v442) = 0;
      uint64_t v469 = 0;
      LODWORD(v435) = 0;
      LODWORD(v441) = 0;
      LODWORD(v440) = 0;
      LODWORD(v439) = 0;
      LODWORD(v438) = 0;
      LODWORD(v437) = 0;
      LODWORD(v436) = 0;
      LODWORD(v471) = 0;
      LODWORD(v434) = 0;
      LODWORD(v433) = 0;
      LODWORD(v432) = 0;
      LODWORD(v429) = 0;
      LODWORD(v431) = 0;
      LODWORD(v430) = 0;
      LODWORD(v427) = 0;
      LODWORD(v426) = 0;
      LODWORD(v428) = 0;
      LODWORD(v425) = 0;
      LODWORD(v422) = 0;
      LODWORD(v420) = 0;
      LODWORD(v424) = 0;
      LODWORD(v423) = 0;
      LODWORD(v421) = 0;
      LODWORD(v417) = 0;
      LODWORD(v419) = 0;
      LODWORD(v418) = 0;
      LODWORD(v416) = 0;
      LODWORD(v413) = 0;
      LODWORD(v415) = 0;
      LODWORD(v414) = 0;
      LODWORD(v412) = 0;
      LODWORD(v411) = 0;
      int v59 = 0;
      double v69 = -1.0;
      goto LABEL_135;
    }
    goto LABEL_1110;
  }
  int v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  int v461 = 0;
  int v65 = 0;
  LODWORD(v454) = 0;
  LODWORD(v453) = 0;
  int v66 = 0;
  LODWORD(v447) = 0;
  LODWORD(v460) = 0;
  LODWORD(v459) = 0;
  int v67 = 0;
  LODWORD(v458) = 0;
  int v68 = 0;
  LODWORD(v457) = 0;
  LODWORD(v456) = 0;
  LODWORD(v455) = 0;
  uint64_t v463 = 0;
  LODWORD(v452) = 0;
  LODWORD(v451) = 0;
  LODWORD(v450) = 0;
  LODWORD(v449) = 0;
  LODWORD(v448) = 0;
  uint64_t v465 = 0;
  LODWORD(v446) = 0;
  LODWORD(v443) = 0;
  LODWORD(v445) = 0;
  LODWORD(v444) = 0;
  uint64_t v467 = 0;
  LODWORD(v442) = 0;
  uint64_t v469 = 0;
  LODWORD(v435) = 0;
  LODWORD(v441) = 0;
  LODWORD(v440) = 0;
  LODWORD(v439) = 0;
  LODWORD(v438) = 0;
  LODWORD(v437) = 0;
  LODWORD(v436) = 0;
  uint64_t v471 = 0;
  LODWORD(v434) = 0;
  LODWORD(v433) = 0;
  LODWORD(v432) = 0;
  LODWORD(v429) = 0;
  uint64_t v475 = 0;
  LODWORD(v431) = 0;
  uint64_t v473 = 0;
  LODWORD(v430) = 0;
  LODWORD(v427) = 0;
  LODWORD(v426) = 0;
  LODWORD(v428) = 0;
  uint64_t v477 = 0;
  LODWORD(v425) = 0;
  LODWORD(v422) = 0;
  LODWORD(v420) = 0;
  LODWORD(v424) = 0;
  LODWORD(v423) = 0;
  LODWORD(v421) = 0;
  LODWORD(v417) = 0;
  uint64_t v479 = 0;
  LODWORD(v419) = 0;
  uint64_t v481 = 0;
  LODWORD(v418) = 0;
  LODWORD(v416) = 0;
  LODWORD(v413) = 0;
  LODWORD(v415) = 0;
  uint64_t v485 = 0;
  LODWORD(v414) = 0;
  LODWORD(v412) = 0;
  LODWORD(v411) = 0;
  uint64_t v487 = 0;
  int v59 = 0;
  int v60 = 0;
  uint64_t v483 = 0;
  LODWORD(v489) = 0;
  double v69 = -1.0;
LABEL_133:
  if (v60)
  {
    int v83 = v59;

    int v59 = v83;
  }
LABEL_135:
  if (v59) {

  }
  if (v411) {
  if (v412)
  }

  if (v414) {
  if (v415)
  }

  if (v413) {
  if (v416)
  }

  if (v418) {
  if (v419)
  }

  if (v417) {
  if (v421)
  }

  if (v423) {
  if (v424)
  }

  if (v420) {
  if (v422)
  }

  if (v425) {
  if (v428)
  }

  if (v426) {
  if (v427)
  }

  if (v430) {
  if (v431)
  }

  if (v429) {
  if (v432)
  }

  if (v433) {
  if (v434)
  }

  if (v436) {
  if (v437)
  }

  if (v438) {
  if (v439)
  }

  if (v440) {
  if (v441)
  }

  if (v435) {
  if (v442)
  }

  if (v444) {
  if (v445)
  }

  if (v443) {
  if (v446)
  }

  if (v448) {
  if (v449)
  }

  if (v450) {
  if (v451)
  }

  if (v452) {
  if (v455)
  }

  if (v456) {
  if (v457)
  }

  if (v458) {
  if (v459)
  }

  if (v460) {
  if (v447)
  }
  {

    if (!v453) {
      goto LABEL_233;
    }
  }
  else if (!v453)
  {
LABEL_233:
    if (!v454) {
      goto LABEL_235;
    }
    goto LABEL_234;
  }

  if (v454) {
LABEL_234:
  }

LABEL_235:
  if (v461)
  {

    if (!v64) {
      goto LABEL_237;
    }
  }
  else if (!v64)
  {
LABEL_237:
    if (v62) {
      goto LABEL_238;
    }
    goto LABEL_249;
  }

  if (v62)
  {
LABEL_238:

    if (!v63) {
      goto LABEL_239;
    }
    goto LABEL_250;
  }
LABEL_249:
  if (!v63)
  {
LABEL_239:
    if (v65) {
      goto LABEL_240;
    }
    goto LABEL_251;
  }
LABEL_250:

  if (v65)
  {
LABEL_240:

    if (!v66) {
      goto LABEL_241;
    }
    goto LABEL_252;
  }
LABEL_251:
  if (!v66)
  {
LABEL_241:
    if (v67) {
      goto LABEL_242;
    }
LABEL_253:
    if (!v68) {
      goto LABEL_255;
    }
    goto LABEL_254;
  }
LABEL_252:

  if (!v67) {
    goto LABEL_253;
  }
LABEL_242:

  if (v68) {
LABEL_254:
  }

LABEL_255:
  if (v463) {

  }
  if (HIDWORD(v463)) {
  if (v465)
  }

  if (HIDWORD(v465)) {
  if (HIDWORD(v467))
  }

  if (v469) {
  if (HIDWORD(v469))
  }

  if (v467) {
  if (v471)
  }

  if (HIDWORD(v471)) {
  if (v475)
  }

  if (v473) {
  if (HIDWORD(v473))
  }

  if (v477) {
  if (HIDWORD(v477))
  }

  if (HIDWORD(v475)) {
  if (v479)
  }

  if (v481) {
  if (HIDWORD(v481))
  }

  if (HIDWORD(v485)) {
  if (v487)
  }

  if (HIDWORD(v479)) {
  if (v483)
  }

  if (HIDWORD(v483)) {
  if (HIDWORD(v487))
  }

  if (v485) {
  if (v489)
  }

  if (HIDWORD(v489)) {
  if (v491)
  }

  if (HIDWORD(v491)) {
  if (HIDWORD(v495))
  }

  if (v493) {
  if (HIDWORD(v493))
  }

  if (v497) {
  if (HIDWORD(v497))
  }

  if (v499) {
  if (v501)
  }

  if (HIDWORD(v501)) {
  if (v503)
  }

  if (HIDWORD(v503)) {
  if (v505)
  }

  if (HIDWORD(v505)) {
  if (v495)
  }

  if (HIDWORD(v499))
  {

    if (!v507) {
      goto LABEL_343;
    }
  }
  else if (!v507)
  {
LABEL_343:
    if (!HIDWORD(v507)) {
      goto LABEL_345;
    }
    goto LABEL_344;
  }

  if (HIDWORD(v507)) {
LABEL_344:
  }

LABEL_345:
  int v84 = __sb__runningInSpringBoard();
  if (v84)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v508 = 0;
      goto LABEL_357;
    }
  }
  else
  {
    v459 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v459 userInterfaceIdiom] != 1)
    {
      uint64_t v508 = 0x100000000;
      goto LABEL_357;
    }
  }
  HIDWORD(v508) = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v85 = __sb__runningInSpringBoard();
    if (v85)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v450 = [MEMORY[0x1E4F42D90] mainScreen];
      [v450 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v508) = v85 ^ 1;
    if (v105 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v104 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      uint64_t v506 = 0;
      uint64_t v500 = 0;
      uint64_t v504 = 0;
      uint64_t v502 = 0;
      uint64_t v498 = 0;
      uint64_t v496 = 0;
      uint64_t v490 = 0;
      uint64_t v486 = 0;
      uint64_t v494 = 0;
      uint64_t v492 = 0;
      uint64_t v488 = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 7.5;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v508) = 0;
  }
LABEL_357:
  int v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v506) = 0;
      LODWORD(v500) = 0;
      goto LABEL_366;
    }
  }
  else
  {
    v458 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v458 userInterfaceIdiom] != 1)
    {
      LODWORD(v500) = 0;
      HIDWORD(v506) = 1;
      goto LABEL_366;
    }
  }
  HIDWORD(v506) = v86 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v87 = __sb__runningInSpringBoard();
    if (v87)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v460 = [MEMORY[0x1E4F42D90] mainScreen];
      [v460 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v500) = v87 ^ 1;
    if (v106 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      LODWORD(v506) = 0;
      uint64_t v504 = 0;
      uint64_t v502 = 0;
      HIDWORD(v500) = 0;
      uint64_t v498 = 0;
      uint64_t v496 = 0;
      uint64_t v490 = 0;
      uint64_t v486 = 0;
      uint64_t v494 = 0;
      uint64_t v492 = 0;
      uint64_t v488 = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 17.5;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v500) = 0;
  }
LABEL_366:
  int v88 = __sb__runningInSpringBoard();
  if (v88)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v506) = 0;
      HIDWORD(v504) = 0;
      goto LABEL_375;
    }
  }
  else
  {
    v457 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v457 userInterfaceIdiom] != 1)
    {
      HIDWORD(v504) = 0;
      LODWORD(v506) = 1;
      goto LABEL_375;
    }
  }
  LODWORD(v506) = v88 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v89 = __sb__runningInSpringBoard();
    if (v89)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v449 = [MEMORY[0x1E4F42D90] mainScreen];
      [v449 _referenceBounds];
    }
    HIDWORD(v504) = v89 ^ 1;
    BSSizeRoundForScale();
    if (v107 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v504) = 0;
      uint64_t v502 = 0;
      HIDWORD(v500) = 0;
      uint64_t v498 = 0;
      uint64_t v496 = 0;
      uint64_t v490 = 0;
      uint64_t v486 = 0;
      uint64_t v494 = 0;
      uint64_t v492 = 0;
      uint64_t v488 = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 17.5;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v504) = 0;
  }
LABEL_375:
  int v90 = __sb__runningInSpringBoard();
  if (v90)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v504) = 0;
      HIDWORD(v502) = 0;
      goto LABEL_384;
    }
  }
  else
  {
    v456 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v456 userInterfaceIdiom] != 1)
    {
      HIDWORD(v502) = 0;
      LODWORD(v504) = 1;
      goto LABEL_384;
    }
  }
  LODWORD(v504) = v90 ^ 1;
  int v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v453 = [MEMORY[0x1E4F42D90] mainScreen];
    [v453 _referenceBounds];
  }
  HIDWORD(v502) = v91 ^ 1;
  BSSizeRoundForScale();
  if (v92 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    LODWORD(v502) = 0;
    HIDWORD(v500) = 0;
    uint64_t v498 = 0;
    uint64_t v496 = 0;
    uint64_t v490 = 0;
    uint64_t v486 = 0;
    uint64_t v494 = 0;
    uint64_t v492 = 0;
    uint64_t v488 = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 7.5;
    goto LABEL_411;
  }
LABEL_384:
  int v93 = __sb__runningInSpringBoard();
  if (v93)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v502) = 0;
      HIDWORD(v500) = 0;
      goto LABEL_394;
    }
  }
  else
  {
    v455 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v455 userInterfaceIdiom] != 1)
    {
      HIDWORD(v500) = 0;
      LODWORD(v502) = 1;
      goto LABEL_394;
    }
  }
  LODWORD(v502) = v93 ^ 1;
  int v94 = __sb__runningInSpringBoard();
  if (v94)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v451 = [MEMORY[0x1E4F42D90] mainScreen];
    [v451 _referenceBounds];
  }
  HIDWORD(v500) = v94 ^ 1;
  BSSizeRoundForScale();
  if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    uint64_t v498 = 0;
    uint64_t v496 = 0;
    uint64_t v490 = 0;
    uint64_t v486 = 0;
    uint64_t v494 = 0;
    uint64_t v492 = 0;
    uint64_t v488 = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 7.5;
    goto LABEL_411;
  }
LABEL_394:
  int v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v498 = 0;
      goto LABEL_529;
    }
  }
  else
  {
    v454 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v454 userInterfaceIdiom] != 1)
    {
      uint64_t v498 = 0x100000000;
      goto LABEL_529;
    }
  }
  HIDWORD(v498) = v102 ^ 1;
  int v103 = __sb__runningInSpringBoard();
  if (v103)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v448 = [MEMORY[0x1E4F42D90] mainScreen];
    [v448 _referenceBounds];
  }
  BSSizeRoundForScale();
  LODWORD(v498) = v103 ^ 1;
  if (v115 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    uint64_t v496 = 0;
    uint64_t v490 = 0;
    uint64_t v486 = 0;
    uint64_t v494 = 0;
    uint64_t v492 = 0;
    uint64_t v488 = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 7.5;
    goto LABEL_411;
  }
LABEL_529:
  int v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_531;
    }
LABEL_537:
    uint64_t v490 = 0;
    uint64_t v486 = 0;
    uint64_t v494 = 0;
    uint64_t v492 = 0;
    uint64_t v488 = 0;
    LODWORD(v496) = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 7.5;
    HIDWORD(v496) = v116 ^ 1;
    goto LABEL_411;
  }
  v452 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v452 userInterfaceIdiom] == 1) {
    goto LABEL_537;
  }
LABEL_531:
  HIDWORD(v496) = v116 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_535:
    LODWORD(v490) = 0;
    HIDWORD(v486) = 0;
    goto LABEL_578;
  }
  int v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_535;
    }
  }
  else
  {
    v446 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v446 userInterfaceIdiom])
    {
      HIDWORD(v486) = 0;
      LODWORD(v490) = 1;
      goto LABEL_578;
    }
  }
  LODWORD(v490) = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v439 = [MEMORY[0x1E4F42D90] mainScreen];
      [v439 _referenceBounds];
    }
    HIDWORD(v486) = v127 ^ 1;
    BSSizeRoundForScale();
    if (v132 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      uint64_t v494 = 0;
      uint64_t v492 = 0;
      uint64_t v488 = 0;
      LODWORD(v496) = 0;
      HIDWORD(v490) = 0;
      LODWORD(v486) = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v486) = 0;
  }
LABEL_578:
  int v128 = __sb__runningInSpringBoard();
  if (v128)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v494) = 0;
      HIDWORD(v492) = 0;
      goto LABEL_588;
    }
  }
  else
  {
    v447 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v447 userInterfaceIdiom])
    {
      HIDWORD(v492) = 0;
      LODWORD(v494) = 1;
      goto LABEL_588;
    }
  }
  LODWORD(v494) = v128 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v129 = __sb__runningInSpringBoard();
    if (v129)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v442 = [MEMORY[0x1E4F42D90] mainScreen];
      [v442 _referenceBounds];
    }
    HIDWORD(v492) = v129 ^ 1;
    BSSizeRoundForScale();
    if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_592;
    }
  }
  else
  {
    HIDWORD(v492) = 0;
  }
LABEL_588:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v488 = 0;
    LODWORD(v496) = 0;
    LODWORD(v492) = 0;
    HIDWORD(v494) = 0;
    HIDWORD(v490) = 0;
    LODWORD(v486) = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_592:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_596:
    uint64_t v488 = 0;
    goto LABEL_606;
  }
  int v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_596;
    }
  }
  else
  {
    v443 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v443 userInterfaceIdiom])
    {
      uint64_t v488 = 0x100000000;
      goto LABEL_606;
    }
  }
  HIDWORD(v488) = v131 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v133 = __sb__runningInSpringBoard();
    if (v133)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v434 = [MEMORY[0x1E4F42D90] mainScreen];
      [v434 _referenceBounds];
    }
    LODWORD(v488) = v133 ^ 1;
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v496) = 0;
      LODWORD(v492) = 0;
      HIDWORD(v494) = 0;
      HIDWORD(v490) = 0;
      LODWORD(v486) = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v488) = 0;
  }
LABEL_606:
  int v134 = __sb__runningInSpringBoard();
  if (v134)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v496) = 0;
      LODWORD(v492) = 0;
      goto LABEL_616;
    }
  }
  else
  {
    v445 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v445 userInterfaceIdiom])
    {
      LODWORD(v492) = 0;
      LODWORD(v496) = 1;
      goto LABEL_616;
    }
  }
  LODWORD(v496) = v134 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v438 = [MEMORY[0x1E4F42D90] mainScreen];
      [v438 _referenceBounds];
    }
    LODWORD(v492) = v135 ^ 1;
    BSSizeRoundForScale();
    if (v136 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_620;
    }
  }
  else
  {
    LODWORD(v492) = 0;
  }
LABEL_616:
  if (_SBF_Private_IsD64Like())
  {
    HIDWORD(v494) = 0;
    HIDWORD(v490) = 0;
    LODWORD(v486) = 0;
    uint64_t v482 = 0;
    uint64_t v484 = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_620:
  int v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v494) = 0;
      HIDWORD(v490) = 0;
      goto LABEL_630;
    }
  }
  else
  {
    v444 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v444 userInterfaceIdiom])
    {
      HIDWORD(v490) = 0;
      HIDWORD(v494) = 1;
      goto LABEL_630;
    }
  }
  HIDWORD(v494) = v137 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v138 = __sb__runningInSpringBoard();
    if (v138)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v435 = [MEMORY[0x1E4F42D90] mainScreen];
      [v435 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v490) = v138 ^ 1;
    if (v153 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      LODWORD(v486) = 0;
      uint64_t v482 = 0;
      uint64_t v484 = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v490) = 0;
  }
LABEL_630:
  int v139 = __sb__runningInSpringBoard();
  if (v139)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v486) = 0;
      LODWORD(v482) = 0;
      goto LABEL_690;
    }
  }
  else
  {
    v441 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v441 userInterfaceIdiom])
    {
      LODWORD(v482) = 0;
      LODWORD(v486) = 1;
      goto LABEL_690;
    }
  }
  LODWORD(v486) = v139 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v152 = __sb__runningInSpringBoard();
    if (v152)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v433 = [MEMORY[0x1E4F42D90] mainScreen];
      [v433 _referenceBounds];
    }
    LODWORD(v482) = v152 ^ 1;
    BSSizeRoundForScale();
    if (v157 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_706;
    }
  }
  else
  {
    LODWORD(v482) = 0;
  }
LABEL_690:
  if (_SBF_Private_IsD54())
  {
    uint64_t v484 = 0;
    HIDWORD(v482) = 0;
    uint64_t v480 = 0;
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_706:
  int v158 = __sb__runningInSpringBoard();
  if (v158)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v484 = 0;
      goto LABEL_716;
    }
  }
  else
  {
    v440 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v440 userInterfaceIdiom])
    {
      uint64_t v484 = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v484) = v158 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v159 = __sb__runningInSpringBoard();
    if (v159)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v430 = [MEMORY[0x1E4F42D90] mainScreen];
      [v430 _referenceBounds];
    }
    LODWORD(v484) = v159 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      HIDWORD(v482) = 0;
      uint64_t v480 = 0;
      uint64_t v478 = 0;
      uint64_t v474 = 0;
      uint64_t v476 = 0;
      uint64_t v472 = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v484) = 0;
  }
LABEL_716:
  int v160 = __sb__runningInSpringBoard();
  if (v160)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v482) = 0;
      HIDWORD(v480) = 0;
      goto LABEL_794;
    }
  }
  else
  {
    v437 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v437 userInterfaceIdiom])
    {
      HIDWORD(v480) = 0;
      HIDWORD(v482) = 1;
      goto LABEL_794;
    }
  }
  HIDWORD(v482) = v160 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v179 = __sb__runningInSpringBoard();
    if (v179)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v429 = [MEMORY[0x1E4F42D90] mainScreen];
      [v429 _referenceBounds];
    }
    HIDWORD(v480) = v179 ^ 1;
    BSSizeRoundForScale();
    if (v187 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_827;
    }
  }
  else
  {
    HIDWORD(v480) = 0;
  }
LABEL_794:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    uint64_t v478 = 0;
    uint64_t v474 = 0;
    LODWORD(v480) = 0;
    uint64_t v476 = 0;
    uint64_t v472 = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_827:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_831:
    LODWORD(v478) = 0;
    HIDWORD(v474) = 0;
    goto LABEL_888;
  }
  int v188 = __sb__runningInSpringBoard();
  if (v188)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_831;
    }
  }
  else
  {
    v432 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v432 userInterfaceIdiom])
    {
      HIDWORD(v474) = 0;
      LODWORD(v478) = 1;
      goto LABEL_888;
    }
  }
  LODWORD(v478) = v188 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v203 = __sb__runningInSpringBoard();
    if (v203)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v423 = [MEMORY[0x1E4F42D90] mainScreen];
      [v423 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v474) = v203 ^ 1;
    if (v214 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      LODWORD(v480) = 0;
      uint64_t v476 = 0;
      LODWORD(v474) = 0;
      uint64_t v472 = 0;
      HIDWORD(v478) = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v474) = 0;
  }
LABEL_888:
  int v204 = __sb__runningInSpringBoard();
  if (v204)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v480) = 0;
      HIDWORD(v476) = 0;
      goto LABEL_898;
    }
  }
  else
  {
    v436 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v436 userInterfaceIdiom])
    {
      HIDWORD(v476) = 0;
      LODWORD(v480) = 1;
      goto LABEL_898;
    }
  }
  LODWORD(v480) = v204 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v205 = __sb__runningInSpringBoard();
    if (v205)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v426 = [MEMORY[0x1E4F42D90] mainScreen];
      [v426 _referenceBounds];
    }
    HIDWORD(v476) = v205 ^ 1;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_902;
    }
  }
  else
  {
    HIDWORD(v476) = 0;
  }
LABEL_898:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v474) = 0;
    uint64_t v472 = 0;
    HIDWORD(v478) = 0;
    LODWORD(v476) = 0;
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_902:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_906:
    LODWORD(v474) = 0;
    HIDWORD(v472) = 0;
    goto LABEL_942;
  }
  int v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_906;
    }
  }
  else
  {
    v427 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v427 userInterfaceIdiom])
    {
      HIDWORD(v472) = 0;
      LODWORD(v474) = 1;
      goto LABEL_942;
    }
  }
  LODWORD(v474) = v207 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v215 = __sb__runningInSpringBoard();
    if (v215)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v419 = [MEMORY[0x1E4F42D90] mainScreen];
      [v419 _referenceBounds];
    }
    HIDWORD(v472) = v215 ^ 1;
    BSSizeRoundForScale();
    if (v234 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      HIDWORD(v478) = 0;
      LODWORD(v476) = 0;
      uint64_t v470 = 0;
      uint64_t v468 = 0;
      LODWORD(v472) = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    HIDWORD(v472) = 0;
  }
LABEL_942:
  int v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v478) = 0;
      LODWORD(v476) = 0;
      goto LABEL_952;
    }
  }
  else
  {
    v431 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v431 userInterfaceIdiom])
    {
      LODWORD(v476) = 0;
      HIDWORD(v478) = 1;
      goto LABEL_952;
    }
  }
  HIDWORD(v478) = v216 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v217 = __sb__runningInSpringBoard();
    if (v217)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v422 = [MEMORY[0x1E4F42D90] mainScreen];
      [v422 _referenceBounds];
    }
    LODWORD(v476) = v217 ^ 1;
    BSSizeRoundForScale();
    if (v218 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_956;
    }
  }
  else
  {
    LODWORD(v476) = 0;
  }
LABEL_952:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v470 = 0;
    uint64_t v468 = 0;
    LODWORD(v472) = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_956:
  int v219 = __sb__runningInSpringBoard();
  if (v219)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v470) = 0;
      LODWORD(v468) = 0;
      goto LABEL_966;
    }
  }
  else
  {
    v428 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v428 userInterfaceIdiom])
    {
      LODWORD(v468) = 0;
      HIDWORD(v470) = 1;
      goto LABEL_966;
    }
  }
  HIDWORD(v470) = v219 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v220 = __sb__runningInSpringBoard();
    if (v220)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v420 = [MEMORY[0x1E4F42D90] mainScreen];
      [v420 _referenceBounds];
    }
    LODWORD(v468) = v220 ^ 1;
    BSSizeRoundForScale();
    if (v233 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      LODWORD(v472) = 0;
      LODWORD(v470) = 0;
      HIDWORD(v468) = 0;
      uint64_t v466 = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      double v100 = 0.0;
      goto LABEL_411;
    }
  }
  else
  {
    LODWORD(v468) = 0;
  }
LABEL_966:
  int v221 = __sb__runningInSpringBoard();
  if (v221)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v472) = 0;
      LODWORD(v470) = 0;
      goto LABEL_1026;
    }
  }
  else
  {
    v425 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v425 userInterfaceIdiom])
    {
      LODWORD(v470) = 0;
      LODWORD(v472) = 1;
      goto LABEL_1026;
    }
  }
  LODWORD(v472) = v221 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v232 = __sb__runningInSpringBoard();
    if (v232)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      CGRect v418 = [MEMORY[0x1E4F42D90] mainScreen];
      [v418 _referenceBounds];
    }
    LODWORD(v470) = v232 ^ 1;
    BSSizeRoundForScale();
    if (v237 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1042;
    }
  }
  else
  {
    LODWORD(v470) = 0;
  }
LABEL_1026:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    HIDWORD(v468) = 0;
    uint64_t v466 = 0;
    uint64_t v464 = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_1042:
  int v238 = __sb__runningInSpringBoard();
  if (v238)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v468) = 0;
      HIDWORD(v466) = 0;
      goto LABEL_1052;
    }
  }
  else
  {
    v424 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v424 userInterfaceIdiom])
    {
      HIDWORD(v466) = 0;
      HIDWORD(v468) = 1;
      goto LABEL_1052;
    }
  }
  HIDWORD(v468) = v238 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      CGRect v417 = [MEMORY[0x1E4F42D90] mainScreen];
      [v417 _referenceBounds];
    }
    HIDWORD(v466) = v239 ^ 1;
    BSSizeRoundForScale();
    if (v258 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      LODWORD(v466) = 0;
      uint64_t v464 = 0;
      int v462 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v259 = 0;
      double v100 = 0.0;
      goto LABEL_1193;
    }
    double v34 = v513;
  }
  else
  {
    HIDWORD(v466) = 0;
  }
LABEL_1052:
  uint64_t v239 = __sb__runningInSpringBoard();
  if (v239)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v466) = 0;
      HIDWORD(v464) = 0;
      goto LABEL_1142;
    }
  }
  else
  {
    v421 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v421 userInterfaceIdiom])
    {
      HIDWORD(v464) = 0;
      LODWORD(v466) = 1;
      goto LABEL_1142;
    }
  }
  LODWORD(v466) = v239 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      CGRect v416 = [MEMORY[0x1E4F42D90] mainScreen];
      [v416 _referenceBounds];
    }
    HIDWORD(v464) = v239 ^ 1;
    BSSizeRoundForScale();
    double v34 = v513;
    if (v266 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1184;
    }
  }
  else
  {
    HIDWORD(v464) = 0;
  }
LABEL_1142:
  if (_SBF_Private_IsD53())
  {
LABEL_1188:
    LODWORD(v464) = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    double v100 = 0.0;
    goto LABEL_411;
  }
LABEL_1184:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    goto LABEL_1188;
  }
  double v100 = 0.0;
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    LODWORD(v464) = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    goto LABEL_411;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    LODWORD(v464) = 0;
    int v462 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    int v98 = 0;
    int v99 = 0;
    int v259 = 0;
    goto LABEL_1193;
  }
  int v273 = __sb__runningInSpringBoard();
  if (v273)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v464) = 0;
      int v462 = 0;
      goto LABEL_1277;
    }
  }
  else
  {
    v415 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v415 userInterfaceIdiom])
    {
      int v462 = 0;
      LODWORD(v464) = 1;
      goto LABEL_1277;
    }
  }
  LODWORD(v464) = v273 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      unsigned int v412 = [MEMORY[0x1E4F42D90] mainScreen];
      [v412 _referenceBounds];
    }
    int v462 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v283 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    int v462 = 0;
  }
LABEL_1277:
  int v280 = __sb__runningInSpringBoard();
  if (v280)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v95 = 0;
      int v96 = 0;
      goto LABEL_1287;
    }
  }
  else
  {
    v414 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v414 userInterfaceIdiom])
    {
      int v96 = 0;
      int v95 = 1;
      goto LABEL_1287;
    }
  }
  int v95 = v280 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      unint64_t v411 = [MEMORY[0x1E4F42D90] mainScreen];
      [v411 _referenceBounds];
    }
    int v96 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v284 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v97 = 0;
      int v98 = 0;
      int v99 = 0;
      int v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    int v96 = 0;
  }
LABEL_1287:
  int v281 = __sb__runningInSpringBoard();
  if (!v281)
  {
    int v413 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v413 userInterfaceIdiom])
    {
      int v98 = 0;
      int v97 = 1;
      goto LABEL_1297;
    }
LABEL_1293:
    int v97 = v281 ^ 1;
    uint64_t v239 = __sb__runningInSpringBoard();
    if (v239)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v64 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v64 _referenceBounds];
    }
    int v98 = v239 ^ 1;
    BSSizeRoundForScale();
    if (v282 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
      goto LABEL_1300;
    }
    goto LABEL_1297;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_1293;
  }
  int v97 = 0;
  int v98 = 0;
LABEL_1297:
  uint64_t v239 = __sb__runningInSpringBoard();
  if (v239)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_1300:
      int v99 = 0;
      int v259 = 0;
      goto LABEL_1193;
    }
  }
  else
  {
    uint64_t v63 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v63 userInterfaceIdiom])
    {
      int v259 = 0;
      int v99 = 1;
      goto LABEL_1193;
    }
  }
  int v99 = v239 ^ 1;
  int v285 = __sb__runningInSpringBoard();
  if (v285)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v239 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v239 _referenceBounds];
  }
  int v259 = v285 ^ 1;
  BSSizeRoundForScale();
LABEL_1193:
  double v34 = v513;
  if (v259) {

  }
LABEL_411:
  if (v99) {

  }
  if (v98)
  {

    if (!v97) {
      goto LABEL_415;
    }
  }
  else if (!v97)
  {
LABEL_415:
    if (v96) {
      goto LABEL_416;
    }
    goto LABEL_420;
  }

  if (v96)
  {
LABEL_416:

    if (!v95) {
      goto LABEL_422;
    }
    goto LABEL_421;
  }
LABEL_420:
  if (v95) {
LABEL_421:
  }

LABEL_422:
  if (v462) {

  }
  if (v464) {
  if (HIDWORD(v464))
  }

  if (v466) {
  if (HIDWORD(v466))
  }

  if (HIDWORD(v468)) {
  if (v470)
  }

  if (v472) {
  if (v468)
  }

  if (HIDWORD(v470)) {
  if (v476)
  }

  if (HIDWORD(v478)) {
  if (HIDWORD(v472))
  }

  if (v474) {
  if (HIDWORD(v476))
  }

  if (v480) {
  if (HIDWORD(v474))
  }

  if (v478) {
  if (HIDWORD(v480))
  }

  if (HIDWORD(v482)) {
  if (v484)
  }

  if (HIDWORD(v484)) {
  if (v482)
  }

  if (v486) {
  if (HIDWORD(v490))
  }

  if (HIDWORD(v494)) {
  if (v492)
  }

  if (v496) {
  if (v488)
  }

  if (HIDWORD(v488)) {
  if (HIDWORD(v492))
  }

  if (v494) {
  if (HIDWORD(v486))
  }

  if (v490) {
  if (HIDWORD(v496))
  }

  if (v498) {
  if (HIDWORD(v498))
  }

  if (HIDWORD(v500)) {
  if (v502)
  }

  if (HIDWORD(v502)) {
  if (v504)
  }

  if (HIDWORD(v504)) {
  if (v506)
  }

  if (v500) {
  if (HIDWORD(v506))
  }

  if (v508) {
  double v108 = MidX + v69;
  }
  if (HIDWORD(v508)) {

  }
  int v109 = BSFloatLessThanFloat();
  double v110 = v100 - (v108 - v516 * 0.5);
  if (!v109) {
    double v110 = -0.0;
  }
  double v111 = v108 + v110;
  v523.origin.CGFloat x = v517;
  v523.origin.CGFloat y = v509;
  v523.size.CGFloat width = v19;
  v523.size.CGFloat height = v18;
  double v112 = CGRectGetMaxX(v523) - v100;
  if (BSFloatGreaterThanFloat()) {
    double v113 = v516 * 0.5 + v111 - v112;
  }
  else {
    double v113 = 0.0;
  }
  if (v510)
  {
    v524.origin.CGFloat x = v32;
    v524.size.CGFloat height = v514;
    v524.origin.CGFloat y = v515;
    v524.size.CGFloat width = v34;
    double v114 = CGRectGetMaxY(v524) + v511;
  }
  else
  {
    double v114 = v511;
  }
  double v28 = v111 - v113;
  double v29 = v518 * 0.5 + v114;
  if (v512) {
    BOOL *v512 = v34 < v516 + -15.0;
  }
LABEL_5:

  double v30 = v28;
  double v31 = v29;
  result.CGFloat y = v31;
  result.CGFloat x = v30;
  return result;
}

- (void)_preferredTextSizeChanged:(id)a3
{
  callToActionLabel = self->_callToActionLabel;
  id v4 = [(CSTeachableMomentsContainerView *)self _callToActionLabelFont];
  [(SBUILegibilityLabel *)callToActionLabel setFont:v4];
}

- (id)_callToActionLabelFont
{
  v2 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  double v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4F43870] hiFontStyle:12];

  return v3;
}

- (BOOL)isStatusBarLayoutReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);
  double v3 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained frameForPartWithIdentifier:*MEMORY[0x1E4F441B0]],
        CGFloat x = v10.origin.x,
        CGFloat y = v10.origin.y,
        CGFloat width = v10.size.width,
        CGFloat height = v10.size.height,
        !CGRectEqualToRect(v10, *MEMORY[0x1E4F1DB20])))
  {
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    BOOL v8 = !CGRectEqualToRect(v11, *MEMORY[0x1E4F1DB28]);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIView)controlCenterGrabberView
{
  return self->_controlCenterGrabberView;
}

- (void)setControlCenterGrabberView:(id)a3
{
}

- (void)setControlCenterGrabberContainerView:(id)a3
{
}

- (UIView)controlCenterGrabberPositionPlaceholderView
{
  return self->_controlCenterGrabberPositionPlaceholderView;
}

- (void)setControlCenterGrabberPositionPlaceholderView:(id)a3
{
}

- (UIImageView)controlCenterGlyphView
{
  return self->_controlCenterGlyphView;
}

- (void)setControlCenterGlyphView:(id)a3
{
}

- (SBUILegibilityLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (UIView)callToActionLabelPositionPlaceholderView
{
  return self->_callToActionLabelPositionPlaceholderView;
}

- (void)setCallToActionLabelPositionPlaceholderView:(id)a3
{
}

- (UIStatusBar)statusBarToFollow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarToFollow);

  return (UIStatusBar *)WeakRetained;
}

- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutors
{
  return self->_usesStatusBarRelativeLayoutForControlCenterTutors;
}

- (CABackdropLayer)controlCenterGrabberBackdropLayer
{
  return self->_controlCenterGrabberBackdropLayer;
}

- (void)setControlCenterGrabberBackdropLayer:(id)a3
{
}

- (SBLockScreenDefaults)lockScreenDefaults
{
  return self->_lockScreenDefaults;
}

- (void)setLockScreenDefaults:(id)a3
{
}

- (BOOL)usesStatusBarRelativeLayoutForControlCenterTutorsY
{
  return self->_usesStatusBarRelativeLayoutForControlCenterTutorsY;
}

- (BOOL)adjustsControlCenterTutorsVisibilityForAvailableSpace
{
  return self->_adjustsControlCenterTutorsVisibilityForAvailableSpace;
}

- (UIView)controlCenterTutorsContainerView
{
  return self->_controlCenterTutorsContainerView;
}

- (void)setControlCenterTutorsContainerView:(id)a3
{
}

- (void)setControlCenterGlyphContainerView:(id)a3
{
}

- (void)setCallToActionLabelContainerView:(id)a3
{
}

- (UIView)homeAffordanceContainerView
{
  return self->_homeAffordanceContainerView;
}

- (void)setHomeAffordanceContainerView:(id)a3
{
}

- (UIView)homeAffordanceView
{
  return self->_homeAffordanceView;
}

- (void)setHomeAffordanceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceContainerView, 0);
  objc_storeStrong((id *)&self->_callToActionLabelContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterGlyphContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterTutorsContainerView, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberBackdropLayer, 0);
  objc_destroyWeak((id *)&self->_statusBarToFollow);
  objc_storeStrong((id *)&self->_callToActionLabelPositionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_controlCenterGlyphView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberPositionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberContainerView, 0);
  objc_storeStrong((id *)&self->_controlCenterGrabberView, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end