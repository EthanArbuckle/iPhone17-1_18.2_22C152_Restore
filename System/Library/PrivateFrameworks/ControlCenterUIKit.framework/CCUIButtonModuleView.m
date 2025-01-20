@interface CCUIButtonModuleView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CCUIButtonModuleGlyph)glyphView;
- (CCUIButtonModuleView)initWithFrame:(CGRect)a3;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUIModuleContentMetrics)contentMetrics;
- (NSDirectionalEdgeInsets)contentEdgeInsets;
- (NSString)glyphState;
- (UIColor)glyphColor;
- (UIColor)selectedGlyphColor;
- (UIImage)glyphImage;
- (UIImage)selectedGlyphImage;
- (UIImageView)glyphImageView;
- (double)_continuousCornerRadius;
- (double)_effectiveGlyphAlpha;
- (double)disabledContentAlpha;
- (double)glyphAlpha;
- (double)glyphScale;
- (id)_tintColorForSelectedState:(BOOL)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setGlyphAlpha:(double)a3;
- (void)_setGlyphPackageDescription:(id)a3;
- (void)_setGlyphState:(id)a3;
- (void)_updateForComponentStateChange:(unint64_t)a3;
- (void)_updateGlyphImage;
- (void)_updateGlyphImageViewVisualStyling;
- (void)_updateGlyphScale;
- (void)_updateGlyphViewMetrics;
- (void)_updateGlyphViewTinting;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setContentMetrics:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphAlpha:(double)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setGlyphView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedGlyphColor:(id)a3;
- (void)setSelectedGlyphImage:(id)a3;
@end

@implementation CCUIButtonModuleView

- (void)_updateGlyphImageViewVisualStyling
{
  [(UIImageView *)self->_glyphImageView mt_removeAllVisualStyling];
  uint64_t v3 = [(CCUIButtonModuleView *)self _tintColorForSelectedState:[(CCUIButtonModuleView *)self isSelected]];
  id v4 = (id)v3;
  if (v3) {
    [(UIImageView *)self->_glyphImageView setTintColor:v3];
  }
  else {
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_glyphImageView withStyle:0];
  }
}

- (id)_tintColorForSelectedState:(BOOL)a3
{
  if (!a3 || (glyphColor = self->_selectedGlyphColor) == 0) {
    glyphColor = self->_glyphColor;
  }
  return glyphColor;
}

uint64_t __55__CCUIButtonModuleView__updateForComponentStateChange___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateGlyphImage];
  int v2 = [*(id *)(a1 + 32) isSelected];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = (void *)v3[57];
    char v5 = [v3 isEnabled];
    double v6 = 1.0;
    if ((v5 & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 32), "disabledContentAlpha", 1.0);
    }
    v7 = v4;
  }
  else
  {
    int v8 = [v3 isHighlighted];
    v7 = *(void **)(*(void *)(a1 + 32) + 456);
    if (v8) {
      double v6 = 0.25;
    }
    else {
      double v6 = 0.0;
    }
  }
  [v7 setAlpha:v6];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 == 1)
  {
    [*(id *)(a1 + 32) contentStateDidChange];
  }
  else if (v9 == 2)
  {
    [*(id *)(a1 + 32) selectionDidChange];
  }
  [*(id *)(a1 + 32) _updateGlyphImageViewVisualStyling];
  [*(id *)(a1 + 32) _updateGlyphViewTinting];
  v10 = *(void **)(a1 + 32);
  [v10 _effectiveGlyphAlpha];
  return objc_msgSend(v10, "_setGlyphAlpha:");
}

- (double)disabledContentAlpha
{
  return 0.5;
}

- (void)_updateGlyphViewTinting
{
  id v3 = [(CCUIButtonModuleView *)self _tintColorForSelectedState:[(CCUIButtonModuleView *)self isSelected]];
  [(CCUIButtonModuleGlyph *)self->_glyphView applyGlyphTintColor:v3];
}

- (void)_updateGlyphImage
{
  v22 = self->_contentMetrics;
  if (![(CCUIButtonModuleView *)self isSelected]
    || (glyphImage = self->_selectedGlyphImage) == 0)
  {
    glyphImage = self->_glyphImage;
  }
  id v4 = glyphImage;
  if (v22) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && [(UIImage *)v4 isSymbolImage])
  {
    double v6 = [(CCUIModuleContentMetrics *)v22 symbolConfiguration];
    uint64_t v7 = [(UIImage *)v4 imageByApplyingSymbolConfiguration:v6];

    id v4 = (UIImage *)v7;
  }
  glyphImageView = self->_glyphImageView;
  if (glyphImageView) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v4 == 0;
  }
  if (!v9)
  {
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v11 = self->_glyphImageView;
    self->_glyphImageView = v10;

    [(CCUIButtonModuleView *)self addSubview:self->_glyphImageView];
    v12 = self->_glyphImageView;
    [(CCUIButtonModuleView *)self _effectiveGlyphAlpha];
    -[UIImageView setAlpha:](v12, "setAlpha:");
    [(CCUIButtonModuleView *)self _updateGlyphImageViewVisualStyling];
    [(UIImageView *)self->_glyphImageView setAutoresizingMask:18];
    [(UIImageView *)self->_glyphImageView setTintAdjustmentMode:1];
    [(CCUIButtonModuleView *)self setNeedsLayout];
    glyphImageView = self->_glyphImageView;
  }
  v13 = [(UIImageView *)glyphImageView image];
  v14 = [(UIImage *)v4 symbolConfiguration];
  v15 = [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
  v16 = [v14 configurationByApplyingConfiguration:v15];
  int v17 = [v14 isEqualToConfiguration:v16];

  if (v17) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 2;
  }
  v19 = self->_glyphImageView;
  uint64_t v20 = [(UIImage *)v4 imageWithRenderingMode:v18];
  [(UIImageView *)v19 setImage:v20];

  v21 = [(UIImageView *)self->_glyphImageView image];
  LOBYTE(v20) = BSEqualObjects();

  if ((v20 & 1) == 0) {
    [(CCUIButtonModuleView *)self setNeedsLayout];
  }
  [(CCUIButtonModuleView *)self _updateGlyphScale];
}

- (void)_updateGlyphScale
{
  double glyphScale = self->_glyphScale;
  id v4 = self->_contentMetrics;
  BOOL v5 = v4;
  if (v4
    && ([(CCUIModuleContentMetrics *)v4 symbolScaleFactor], double v7 = v6, (BSFloatIsOne() & 1) == 0))
  {
    double v8 = glyphScale * v7;
    BOOL v9 = [(UIImageView *)self->_glyphImageView image];
    int v10 = [v9 isSymbolImage];

    if (!v10) {
      double glyphScale = v8;
    }
  }
  else
  {
    double v8 = glyphScale;
  }
  [(CCUICAPackageView *)self->_glyphPackageView setScale:v8];
  glyphImageView = self->_glyphImageView;
  if (glyphImageView)
  {
    memset(&v14, 0, sizeof(v14));
    if (fabs(glyphScale + -1.0) >= 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v14, glyphScale, glyphScale);
    }
    else
    {
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v14.c = v12;
      *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    CGAffineTransform v13 = v14;
    [(UIImageView *)glyphImageView setTransform:&v13];
  }
}

- (double)_effectiveGlyphAlpha
{
  if ([(CCUIButtonModuleView *)self isEnabled])
  {
    [(CCUIButtonModuleView *)self glyphAlpha];
  }
  else
  {
    [(CCUIButtonModuleView *)self disabledContentAlpha];
  }
  return result;
}

- (void)_setGlyphAlpha:(double)a3
{
  -[CCUICAPackageView setAlpha:](self->_glyphPackageView, "setAlpha:");
  [(UIImageView *)self->_glyphImageView setAlpha:a3];
  glyphView = self->_glyphView;
  [(CCUIButtonModuleGlyph *)glyphView setAlpha:a3];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIButtonModuleView;
  unsigned int v5 = [(CCUIButtonModuleView *)&v7 isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleView;
  [(CCUIButtonModuleView *)&v6 setEnabled:v3];
  if (v5 != v3) {
    [(CCUIButtonModuleView *)self _updateForComponentStateChange:1];
  }
}

- (void)_updateForComponentStateChange:(unint64_t)a3
{
  unsigned int v5 = [(CCUIButtonModuleView *)self window];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CCUIButtonModuleView__updateForComponentStateChange___block_invoke;
  v6[3] = &unk_1E6AD4638;
  v6[4] = self;
  v6[5] = a3;
  +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:v5 actions:v6];
}

uint64_t __55__CCUIButtonModuleView__updateForComponentStateChange___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__CCUIButtonModuleView__updateForComponentStateChange___block_invoke_2;
  v3[3] = &unk_1E6AD4638;
  uint64_t v1 = *(void *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  v3[5] = v1;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v3 options:0 animations:0.25 completion:0.0];
}

- (CCUIButtonModuleView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CCUIButtonModuleView;
  BOOL v3 = -[CCUIButtonModuleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_glyphAlpha = 1.0;
    v3->_double glyphScale = 1.0;
    uint64_t v5 = +[CCUIControlCenterMaterialView _lightFillView];
    highlightedBackgroundView = v4->_highlightedBackgroundView;
    v4->_highlightedBackgroundView = (UIView *)v5;

    objc_super v7 = v4->_highlightedBackgroundView;
    [(CCUIButtonModuleView *)v4 bounds];
    -[UIView setFrame:](v7, "setFrame:");
    [(UIView *)v4->_highlightedBackgroundView setAutoresizingMask:18];
    [(UIView *)v4->_highlightedBackgroundView setAlpha:0.0];
    [(CCUIButtonModuleView *)v4 addSubview:v4->_highlightedBackgroundView];
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel__handlePressGesture_];
    [v8 setDelegate:v4];
    [v8 setMinimumPressDuration:0.0];
    [v8 setCancelsTouchesInView:0];
    [v8 setDelaysTouchesBegan:0];
    [v8 setDelaysTouchesEnded:0];
    [(CCUIButtonModuleView *)v4 addGestureRecognizer:v8];
  }
  return v4;
}

- (void)setGlyphView:(id)a3
{
  uint64_t v5 = (CCUIButtonModuleGlyph *)a3;
  p_glyphView = &self->_glyphView;
  glyphView = self->_glyphView;
  BOOL v9 = v5;
  if (glyphView != v5)
  {
    [(CCUIButtonModuleGlyph *)glyphView removeFromSuperview];
    objc_storeStrong((id *)&self->_glyphView, a3);
    if (*p_glyphView)
    {
      -[CCUIButtonModuleView addSubview:](self, "addSubview:");
      double v8 = *p_glyphView;
      [(CCUIButtonModuleView *)self _effectiveGlyphAlpha];
      -[CCUIButtonModuleGlyph setAlpha:](v8, "setAlpha:");
      [(CCUIButtonModuleView *)self _updateGlyphViewMetrics];
      [(CCUIButtonModuleView *)self _updateGlyphViewTinting];
      [(CCUIButtonModuleView *)self setNeedsLayout];
    }
  }
}

- (void)setGlyphImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_glyphImage = &self->_glyphImage;
  if (self->_glyphImage != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_glyphImage, a3);
    p_glyphImage = (UIImage **)[(CCUIButtonModuleView *)self _updateGlyphImage];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_glyphImage, v5);
}

- (void)setSelectedGlyphImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_selectedGlyphImage = &self->_selectedGlyphImage;
  if (self->_selectedGlyphImage != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_selectedGlyphImage, a3);
    p_selectedGlyphImage = (UIImage **)[(CCUIButtonModuleView *)self _updateGlyphImage];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_selectedGlyphImage, v5);
}

- (void)setGlyphPackageDescription:(id)a3
{
  uint64_t v5 = (CCUICAPackageDescription *)a3;
  if (self->_glyphPackageDescription != v5)
  {
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    [(CCUIButtonModuleView *)self _setGlyphPackageDescription:v5];
    [(CCUIButtonModuleView *)self _setGlyphState:self->_glyphState];
    [(CCUIButtonModuleView *)self _updateGlyphScale];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIButtonModuleView;
  unsigned int v5 = [(CCUIButtonModuleView *)&v7 isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleView;
  [(CCUIButtonModuleView *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(CCUIButtonModuleView *)self _updateForComponentStateChange:0];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CCUIButtonModuleView;
  unsigned int v5 = [(CCUIButtonModuleView *)&v7 isSelected];
  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleView;
  [(CCUIButtonModuleView *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(CCUIButtonModuleView *)self _updateForComponentStateChange:2];
  }
}

- (void)setGlyphState:(id)a3
{
  unsigned int v5 = (NSString *)a3;
  if (self->_glyphState != v5)
  {
    objc_storeStrong((id *)&self->_glyphState, a3);
    [(CCUIButtonModuleView *)self _setGlyphState:v5];
  }
}

- (void)setGlyphAlpha:(double)a3
{
  if (self->_glyphAlpha != a3)
  {
    self->_glyphAlpha = a3;
    [(CCUIButtonModuleView *)self _updateForComponentStateChange:1];
  }
}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_double glyphScale = a3;
    [(CCUIButtonModuleView *)self _updateGlyphScale];
  }
}

- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_contentEdgeInsets.leading != a3.leading
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.trailing != a3.trailing
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(CCUIButtonModuleView *)self setNeedsLayout];
  }
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setContentMetrics:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    [(CCUIButtonModuleView *)self _updateGlyphViewMetrics];
    [(CCUIButtonModuleView *)self _updateGlyphImage];
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CCUIButtonModuleView;
  [(CCUIButtonModuleView *)&v27 layoutSubviews];
  BOOL v3 = [(CCUIButtonModuleView *)self traitCollection];
  [v3 displayScale];

  [(CCUIButtonModuleView *)self glyphContentFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CCUIButtonModuleView *)self _shouldReverseLayoutDirection];
  uint64_t v12 = [(UIImageView *)self->_glyphImageView image];
  CGAffineTransform v13 = (void *)v12;
  BOOL v15 = self->_contentEdgeInsets.leading == *(double *)(MEMORY[0x1E4FB12A8] + 8)
     && self->_contentEdgeInsets.top == *MEMORY[0x1E4FB12A8]
     && self->_contentEdgeInsets.trailing == *(double *)(MEMORY[0x1E4FB12A8] + 24);
  if (v15
    && (v12 ? (BOOL v16 = self->_contentEdgeInsets.bottom == *(double *)(MEMORY[0x1E4FB12A8] + 16)) : (BOOL v16 = 0), v16))
  {
    [(UIImageView *)self->_glyphImageView setContentMode:9];
    [v13 size];
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    [(UIImageView *)self->_glyphImageView setContentMode:4];
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    CGRectGetMinX(v28);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    CGRectGetMinY(v29);
    v30.origin.x = v5;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    CGRectGetWidth(v30);
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    CGRectGetHeight(v31);
    UIRectIntegralWithScale();
  }
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  if (!CGRectIsEmpty(*(CGRect *)&v17))
  {
    v32.origin.x = v21;
    v32.origin.y = v22;
    v32.size.width = v23;
    v32.size.height = v24;
    if (!CGRectIsInfinite(v32))
    {
      -[CCUIButtonModuleGlyph setFrame:](self->_glyphView, "setFrame:", v21, v22, v23, v24);
      glyphImageView = self->_glyphImageView;
      BSRectWithSize();
      -[UIImageView setBounds:](glyphImageView, "setBounds:");
      v26 = self->_glyphImageView;
      UIRectGetCenter();
      -[UIImageView setCenter:](v26, "setCenter:");
      -[CCUICAPackageView setFrame:](self->_glyphPackageView, "setFrame:", v21, v22, v23, v24);
    }
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleView;
  [(CCUIButtonModuleView *)&v6 didMoveToWindow];
  BOOL v3 = [(CCUIButtonModuleView *)self window];

  if (v3)
  {
    double v4 = [(CCUIButtonModuleView *)self visualStylingProviderForCategory:1];
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_glyphImageView];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(CCUIButtonModuleView *)self _updateGlyphImageViewVisualStyling];
    }
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (double)_continuousCornerRadius
{
  [(UIView *)self->_highlightedBackgroundView _continuousCornerRadius];
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handlePressGesture:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 state];
  if (v4 == 1 || [v5 state] == 3 || objc_msgSend(v5, "state") == 4) {
    [(CCUIButtonModuleView *)self setHighlighted:v4 == 1];
  }
}

- (void)_setGlyphPackageDescription:(id)a3
{
  id v4 = a3;
  glyphPackageView = self->_glyphPackageView;
  if (!glyphPackageView)
  {
    objc_super v6 = objc_alloc_init(CCUICAPackageView);
    CGFloat v7 = self->_glyphPackageView;
    self->_glyphPackageView = v6;

    double v8 = self->_glyphPackageView;
    [(CCUIButtonModuleView *)self _effectiveGlyphAlpha];
    -[CCUICAPackageView setAlpha:](v8, "setAlpha:");
    CGFloat v9 = self->_glyphPackageView;
    double v10 = [(CCUIButtonModuleView *)self glyphState];
    [(CCUICAPackageView *)v9 setStateName:v10];

    [(CCUICAPackageView *)self->_glyphPackageView setAutoresizingMask:18];
    if ([(CCUIButtonModuleView *)self _shouldReverseLayoutDirection]
      && [v4 flipsForRightToLeftLayoutDirection])
    {
      CGFloat v11 = self->_glyphPackageView;
      CGAffineTransformMakeScale(&v12, -1.0, 1.0);
      [(CCUICAPackageView *)v11 setTransform:&v12];
    }
    [(CCUIButtonModuleView *)self addSubview:self->_glyphPackageView];
    glyphPackageView = self->_glyphPackageView;
  }
  [(CCUICAPackageView *)glyphPackageView setPackageDescription:self->_glyphPackageDescription];
}

- (void)_setGlyphState:(id)a3
{
}

- (void)_updateGlyphViewMetrics
{
}

- (CCUIButtonModuleGlyph)glyphView
{
  return self->_glyphView;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
}

- (UIImage)selectedGlyphImage
{
  return self->_selectedGlyphImage;
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedGlyphColor:(id)a3
{
}

- (double)glyphAlpha
{
  return self->_glyphAlpha;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (NSDirectionalEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double leading = self->_contentEdgeInsets.leading;
  double bottom = self->_contentEdgeInsets.bottom;
  double trailing = self->_contentEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphImage, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
}

@end