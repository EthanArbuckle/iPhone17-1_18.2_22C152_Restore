@interface CSHomeAffordanceView
- (BOOL)isSystemPointerInteractionEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (CGRect)extendedFrameForPointerAnimationSuppression;
- (CGSize)suggestedSizeForContentWidth:(double)a3;
- (CSAlwaysOnHomeAffordancePillView)alwaysOnHomeAffordancePillView;
- (CSCoverSheetContextProviding)coverSheetContext;
- (CSHomeAffordanceView)initWithCoverSheetContext:(id)a3;
- (MTLumaDodgePillView)lumaDodgePillView;
- (MTStaticColorPillView)staticColorPillView;
- (SBFHomeAffordanceView)homeAffordanceView;
- (UIColor)overrideColor;
- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)suggestedEdgeSpacing;
- (id)_newAlwaysOnHomeAffordancePillView;
- (id)_newHomeAffordanceView;
- (id)_newLumaDodgePillView;
- (id)_newStaticColorPillView;
- (id)_viewForStyle:(unint64_t)a3;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (unint64_t)_effectiveHomeAffordanceViewHintStyle;
- (unint64_t)style;
- (void)_transitionToStyle:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateForLegibility;
- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performHintAnimationWithCompletionHandler:(id)a3;
- (void)setAlwaysOnHomeAffordancePillView:(id)a3;
- (void)setHomeAffordanceView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLumaDodgePillView:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setStaticColorPillView:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSystemPointerInteractionEnabled:(BOOL)a3;
@end

@implementation CSHomeAffordanceView

- (CSHomeAffordanceView)initWithCoverSheetContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSHomeAffordanceView;
  v6 = -[CSHomeAffordanceView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    uint64_t v8 = [MEMORY[0x1E4FA5F28] rootSettings];
    settings = v7->_settings;
    v7->_settings = (SBFHomeGrabberSettings *)v8;

    id v10 = [(CSHomeAffordanceView *)v7 _newStaticColorPillView];
    id v11 = [(CSHomeAffordanceView *)v7 _newLumaDodgePillView];
    id v12 = [(CSHomeAffordanceView *)v7 _newAlwaysOnHomeAffordancePillView];
    id v13 = [(CSHomeAffordanceView *)v7 _newHomeAffordanceView];
    [v13 addContentView:v12];
    [v13 addContentView:v11];
    [v13 addContentView:v10];
    [(CSHomeAffordanceView *)v7 addSubview:v13];
    objc_storeWeak((id *)&v7->_staticColorPillView, v10);
    objc_storeWeak((id *)&v7->_lumaDodgePillView, v11);
    objc_storeWeak((id *)&v7->_alwaysOnHomeAffordancePillView, v12);
    objc_storeWeak((id *)&v7->_homeAffordanceView, v13);
    v7->_style = 0;
    v14 = [MEMORY[0x1E4F42D90] mainScreen];
    [v14 bounds];
    [(CSHomeAffordanceView *)v7 suggestedSizeForContentWidth:v15];

    BSRectWithSize();
    -[CSHomeAffordanceView setFrame:](v7, "setFrame:");
    v16 = [(CSCoverSheetContextProviding *)v7->_coverSheetContext assistantController];
    [v16 addAssistantControllerObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(CSCoverSheetContextProviding *)self->_coverSheetContext assistantController];
  [v3 removeAssistantControllerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSHomeAffordanceView;
  [(CSHomeAffordanceView *)&v4 dealloc];
}

- (id)_newHomeAffordanceView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA5F20]);
  objc_super v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v4, "setHintStyle:", -[CSHomeAffordanceView _effectiveHomeAffordanceViewHintStyle](self, "_effectiveHomeAffordanceViewHintStyle"));
  return v4;
}

- (id)_newStaticColorPillView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F743D8]);
  [v2 setAlpha:0.0];
  [v2 setHidden:1];
  return v2;
}

- (id)_newLumaDodgePillView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F743C0]);
  [v2 setAlpha:0.0];
  [v2 setHidden:1];
  return v2;
}

- (id)_newAlwaysOnHomeAffordancePillView
{
  id v2 = objc_alloc_init(CSAlwaysOnHomeAffordancePillView);
  [(CSAlwaysOnHomeAffordancePillView *)v2 setAlpha:0.0];
  [(CSAlwaysOnHomeAffordancePillView *)v2 setHidden:1];
  return v2;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CSHomeAffordanceView *)self bounds];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  [WeakRetained suggestedSizeForContentWidth:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)suggestedEdgeSpacing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  [WeakRetained suggestedEdgeSpacing];
  double v4 = v3;

  return v4;
}

- (CGRect)extendedFrameForPointerAnimationSuppression
{
  [(SBFHomeGrabberSettings *)self->_settings coverSheetSuppressAnimationForPointerInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CSHomeAffordanceView *)self frame];
  double v12 = v6 + v11;
  double v14 = v4 + v13;
  double v16 = v15 - (v6 + v10);
  double v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)performHintAnimationWithCompletionHandler:(id)a3
{
  p_homeAffordanceView = &self->_homeAffordanceView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeAffordanceView);
  [WeakRetained performHintAnimationWithCompletionHandler:v4];
}

- (void)setSystemPointerInteractionEnabled:(BOOL)a3
{
  if (self->_systemPointerInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_systemPointerInteractionEnabled = a3;
    double v5 = [(CSCoverSheetContextProviding *)self->_coverSheetContext systemPointerInteractionManager];
    id v6 = v5;
    if (v3) {
      [v5 registerView:self delegate:self];
    }
    else {
      [v5 unregisterView:self];
    }
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3) {
    -[CSHomeAffordanceView _transitionToStyle:animated:](self, "_transitionToStyle:animated:");
  }
}

- (void)setOverrideColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_overrideColor = &self->_overrideColor;
  if (self->_overrideColor != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_overrideColor, a3);
    double v7 = [(CSHomeAffordanceView *)self staticColorPillView];
    [v7 setPillColor:*p_overrideColor];

    double v5 = v8;
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSHomeAffordanceView *)self _updateForLegibility];
  }
}

- (void)_updateForLegibility
{
  BOOL v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(CSHomeAffordanceView *)self setOverrideColor:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  if ([(_UILegibilitySettings *)self->_legibilitySettings style] == 2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 4;
  }
  [WeakRetained setStyle:v4];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSHomeAffordanceView;
  [(CSHomeAffordanceView *)&v4 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceView);
  [(CSHomeAffordanceView *)self bounds];
  objc_msgSend(WeakRetained, "setFrame:");
}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceView);
  objc_msgSend(WeakRetained, "setHintStyle:", -[CSHomeAffordanceView _effectiveHomeAffordanceViewHintStyle](self, "_effectiveHomeAffordanceViewHintStyle"));
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetSides];
  double v5 = v4;
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetTop];
  double v7 = -v6;
  double v8 = -v5;
  double v9 = v7;
  double v10 = -v5;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  if ((objc_msgSend(a3, "_isPencilInitiated", a4.x, a4.y) & 1) != 0
    || ([(CSHomeAffordanceView *)self isHiddenOrHasHiddenAncestor] & 1) != 0
    || ![(CSHomeAffordanceView *)self _isInAWindow])
  {
    return 0;
  }

  return [(CSHomeAffordanceView *)self isSystemPointerInteractionEnabled];
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  double v6 = [MEMORY[0x1E4F42C90] effectWithPreview:v5];
  [(SBFHomeGrabberSettings *)self->_settings coverSheetHomeAffordanceCursorEdgeInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(CSHomeAffordanceView *)self frame];
  v19 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", v10 + v15, v8 + v16, v17 - (v10 + v14), v18 - (v8 + v12), (v17 - (v10 + v14)) * 0.5);
  v20 = [MEMORY[0x1E4F42CC0] styleWithEffect:v6 shape:v19];

  return v20;
}

- (void)_transitionToStyle:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t style = self->_style;
  self->_unint64_t style = a3;
  double v8 = [(CSHomeAffordanceView *)self _viewForStyle:style];
  double v9 = [(CSHomeAffordanceView *)self _viewForStyle:self->_style];
  if (v9 != v8)
  {
    double v10 = [(CSHomeAffordanceView *)self homeAffordanceView];
    [v9 setHidden:0];
    if (v4) {
      double v11 = 0.6;
    }
    else {
      double v11 = 0.0;
    }
    double v12 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke;
    v17[3] = &unk_1E6AD8740;
    unint64_t v21 = a3;
    id v18 = v10;
    id v19 = v8;
    id v20 = v9;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke_2;
    v14[3] = &unk_1E6AD8768;
    v14[4] = self;
    id v15 = v20;
    id v16 = v19;
    id v13 = v10;
    [v12 animateWithDuration:v17 animations:v14 completion:v11];
  }
  [(CSHomeAffordanceView *)self _updateForLegibility];
}

uint64_t __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 3) {
    [*(id *)(a1 + 32) cancelHintAnimation];
  }
  [*(id *)(a1 + 40) setAlpha:0.0];
  id v2 = *(void **)(a1 + 48);

  return [v2 setAlpha:1.0];
}

void __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _viewForStyle:*(void *)(*(void *)(a1 + 32) + 432)];
  BOOL v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    BOOL v4 = *(void **)(a1 + 48);
    [v4 setHidden:1];
  }
}

- (id)_viewForStyle:(unint64_t)a3
{
  if (a3 - 1 > 2)
  {
    id WeakRetained = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *off_1E6AD8788[a3 - 1]));
  }
  return WeakRetained;
}

- (unint64_t)_effectiveHomeAffordanceViewHintStyle
{
  id v2 = [(CSCoverSheetContextProviding *)self->_coverSheetContext assistantController];
  int v3 = [v2 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (v3) {
    return *MEMORY[0x1E4FA6100];
  }
  else {
    return 0;
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)style
{
  return self->_style;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (BOOL)isSystemPointerInteractionEnabled
{
  return self->_systemPointerInteractionEnabled;
}

- (SBFHomeAffordanceView)homeAffordanceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceView);

  return (SBFHomeAffordanceView *)WeakRetained;
}

- (void)setHomeAffordanceView:(id)a3
{
}

- (MTStaticColorPillView)staticColorPillView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_staticColorPillView);

  return (MTStaticColorPillView *)WeakRetained;
}

- (void)setStaticColorPillView:(id)a3
{
}

- (MTLumaDodgePillView)lumaDodgePillView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);

  return (MTLumaDodgePillView *)WeakRetained;
}

- (void)setLumaDodgePillView:(id)a3
{
}

- (CSAlwaysOnHomeAffordancePillView)alwaysOnHomeAffordancePillView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alwaysOnHomeAffordancePillView);

  return (CSAlwaysOnHomeAffordancePillView *)WeakRetained;
}

- (void)setAlwaysOnHomeAffordancePillView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alwaysOnHomeAffordancePillView);
  objc_destroyWeak((id *)&self->_lumaDodgePillView);
  objc_destroyWeak((id *)&self->_staticColorPillView);
  objc_destroyWeak((id *)&self->_homeAffordanceView);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end