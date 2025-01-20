@interface AVBackgroundView
- (AVBackgroundView)initWithFrame:(CGRect)a3;
- (AVLayoutView)layoutView;
- (BOOL)_isContainedInOverlappingBackgroundView;
- (BOOL)automaticallyDrawsRoundedCorners;
- (BOOL)isCircular;
- (BOOL)prefersLowQualityEffects;
- (void)_ensureOrRemoveLayoutView;
- (void)_updateBackdropShape;
- (void)addSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAutomaticallyDrawsRoundedCorners:(BOOL)a3;
- (void)setCircular:(BOOL)a3;
- (void)setLayoutView:(id)a3;
- (void)setPrefersLowQualityEffects:(BOOL)a3;
@end

@implementation AVBackgroundView

- (void).cxx_destruct
{
}

- (void)setLayoutView:(id)a3
{
}

- (AVLayoutView)layoutView
{
  return self->_layoutView;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (BOOL)prefersLowQualityEffects
{
  return self->_prefersLowQualityEffects;
}

- (BOOL)automaticallyDrawsRoundedCorners
{
  return self->_automaticallyDrawsRoundedCorners;
}

- (BOOL)_isContainedInOverlappingBackgroundView
{
  uint64_t v2 = [(AVBackgroundView *)self superview];
  if (!v2) {
    return 0;
  }
  v3 = (void *)v2;
  do
  {
    v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v3;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    v3 = [v3 superview];

    BOOL v7 = v6 != 0;
  }
  while (v3 && !v6);

  return v7;
}

- (void)_ensureOrRemoveLayoutView
{
  BOOL v3 = [(AVBackgroundView *)self _isContainedInOverlappingBackgroundView];
  v4 = [(AVBackgroundView *)self layoutView];
  v5 = v4;
  if (v3)
  {
    [v4 removeFromSuperview];

    [(AVBackgroundView *)self setLayoutView:0];
  }
  else
  {

    if (!v5)
    {
      id v6 = [AVLayoutView alloc];
      [(AVBackgroundView *)self bounds];
      BOOL v7 = -[AVLayoutView initWithFrame:](v6, "initWithFrame:");
      [(AVBackgroundView *)self setLayoutView:v7];

      [(AVBackgroundView *)self _updateBackdropShape];
      v8 = [(AVBackgroundView *)self layoutView];
      objc_msgSend(v8, "setPrefersLowQualityEffects:", -[AVBackgroundView prefersLowQualityEffects](self, "prefersLowQualityEffects"));

      v9 = [(AVBackgroundView *)self layoutView];
      [(AVBackgroundView *)self insertSubview:v9 atIndex:0];
    }
    v10 = [(AVBackgroundView *)self layoutView];
    [(AVBackgroundView *)self sendSubviewToBack:v10];

    id v11 = [(AVBackgroundView *)self layoutView];
    [(AVBackgroundView *)self bounds];
    objc_msgSend(v11, "setFrame:");
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  [(AVBackgroundView *)&v3 didMoveToWindow];
  [(AVBackgroundView *)self _ensureOrRemoveLayoutView];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  [(AVBackgroundView *)&v3 didMoveToSuperview];
  [(AVBackgroundView *)self _ensureOrRemoveLayoutView];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  [(AVBackgroundView *)&v3 layoutSubviews];
  [(AVBackgroundView *)self _ensureOrRemoveLayoutView];
}

- (void)_updateBackdropShape
{
  if ([(AVBackgroundView *)self isCircular])
  {
    uint64_t v3 = 1;
  }
  else if ([(AVBackgroundView *)self automaticallyDrawsRoundedCorners])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 2;
  }
  id v4 = [(AVBackgroundView *)self layoutView];
  [v4 setShapeStyle:v3];
}

- (void)setPrefersLowQualityEffects:(BOOL)a3
{
  if (self->_prefersLowQualityEffects != a3)
  {
    BOOL v3 = a3;
    self->_prefersLowQualityEffects = a3;
    id v4 = [(AVBackgroundView *)self layoutView];
    [v4 setPrefersLowQualityEffects:v3];
  }
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    [(AVBackgroundView *)self _updateBackdropShape];
  }
}

- (void)setAutomaticallyDrawsRoundedCorners:(BOOL)a3
{
  if (self->_automaticallyDrawsRoundedCorners != a3)
  {
    self->_automaticallyDrawsRoundedCorners = a3;
    [(AVBackgroundView *)self _updateBackdropShape];
  }
}

- (void)addSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5
{
  id v8 = a3;
  if (v8)
  {
    id v12 = v8;
    [(AVBackgroundView *)self _ensureOrRemoveLayoutView];
    if (a5 == 1)
    {
      +[AVBackdropView applySecondaryGlyphTintToView:v12];
    }
    else if (!a5)
    {
      +[AVBackdropView applyPrimaryGlyphTintToView:v12];
    }
    [(AVBackgroundView *)self addSubview:v12];
    id v8 = v12;
    if (a4 == 1)
    {
      v9 = +[AVBackdropView secondaryMaterialOverlayView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(AVBackgroundView *)self addSubview:v9];
      v10 = (void *)MEMORY[0x1E4F28DC8];
      id v11 = objc_msgSend(v9, "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", v12);
      [v10 activateConstraints:v11];

      id v8 = v12;
    }
  }
}

- (AVBackgroundView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVBackgroundView;
  BOOL v3 = -[AVBackgroundView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_automaticallyDrawsRoundedCorners = 1;
    v5 = [(AVBackgroundView *)v3 layer];
    [v5 setAllowsGroupBlending:0];
  }
  return v4;
}

@end