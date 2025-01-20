@interface MRUTransportButton
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)isDimmed;
- (BOOL)isRunningSymbolEffect;
- (BOOL)scaleOnHighlight;
- (BOOL)showHighlightCircle;
- (BOOL)useColorFilter;
- (MRUCAPackageView)packageView;
- (MRUTransportButton)initWithFrame:(CGRect)a3;
- (MRUTransportControlItem)transportControlItem;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)identifier;
- (UIImage)pendingImage;
- (UIView)backgroundView;
- (double)cursorScale;
- (double)packageScale;
- (double)scale;
- (id)pointerStyleWithProposedEffect:(id)a3 proposedShape:(id)a4;
- (int64_t)pointerStyle;
- (unint64_t)packageState;
- (void)addSymbolEffectIfNeeded;
- (void)clearPackage;
- (void)didSelect:(id)a3;
- (void)layoutSubviews;
- (void)resetImageViewScale;
- (void)resetImageViewScaleWithSpeed:(double)a3;
- (void)scaleDownImageView;
- (void)scaleDownImageViewWithSpeed:(double)a3;
- (void)setAsset:(id)a3;
- (void)setAsset:(id)a3 animated:(BOOL)a4;
- (void)setCursorScale:(double)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5;
- (void)setIsRunningSymbolEffect:(BOOL)a3;
- (void)setPackageGlyphState:(id)a3;
- (void)setPackageScale:(double)a3;
- (void)setPackageState:(unint64_t)a3;
- (void)setPackageView:(id)a3;
- (void)setPendingImage:(id)a3;
- (void)setPointerStyle:(int64_t)a3;
- (void)setScale:(double)a3;
- (void)setScaleOnHighlight:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowHighlightCircle:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTransportControlItem:(id)a3;
- (void)setUseColorFilter:(BOOL)a3;
- (void)updateBackgroundView;
- (void)updateContentView;
- (void)updateHighlighted;
- (void)updateVisualStyling;
@end

@implementation MRUTransportButton

- (MRUTransportButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MRUTransportButton;
  v7 = -[MPButton initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(MRUTransportButton *)v7 setCursorScale:1.0];
    v9 = [(MRUTransportButton *)v8 imageView];
    [v9 setContentMode:4];

    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = (UIView *)v10;

    [(UIView *)v8->_backgroundView setUserInteractionEnabled:0];
    v12 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(UIView *)v8->_backgroundView setBackgroundColor:v12];

    [(MRUTransportButton *)v8 insertSubview:v8->_backgroundView atIndex:0];
    v13 = objc_alloc_init(MRUCAPackageView);
    packageView = v8->_packageView;
    v8->_packageView = v13;

    [(MRUTransportButton *)v8 addSubview:v8->_packageView];
    [(MRUTransportButton *)v8 setAdjustsImageWhenHighlighted:0];
    v8->_showHighlightCircle = 1;
    v8->_scaleOnHighlight = 1;
    v8->_isRunningSymbolEffect = 0;
    [(MRUTransportButton *)v8 setPointerInteractionEnabled:1];
    [(MRUTransportButton *)v8 setPointerStyleProvider:&__block_literal_global_6];
    [(MRUTransportButton *)v8 updateBackgroundView];
    [(MRUTransportButton *)v8 addTarget:v8 action:sel_didSelect_ forControlEvents:64];
  }
  return v8;
}

id __36__MRUTransportButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v2];
  int v4 = [v2 isSelected];
  v5 = (id *)0x1E4FB1AD0;
  if (!v4) {
    v5 = (id *)0x1E4FB1AB8;
  }
  v6 = [*v5 effectWithPreview:v3];
  v7 = (void *)MEMORY[0x1E4FB1AE0];
  v8 = (void *)MEMORY[0x1E4FB14C0];
  [v2 bounds];
  v9 = objc_msgSend(v8, "bezierPathWithOvalInRect:");
  uint64_t v10 = [v7 shapeWithPath:v9];

  v11 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v10];

  return v11;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MRUTransportButton;
  [(MPButton *)&v10 layoutSubviews];
  [(MRUTransportButton *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetHeight(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v12);
  UIRectGetCenter();
  -[UIView setCenter:](self->_backgroundView, "setCenter:");
  -[UIView setBounds:](self->_backgroundView, "setBounds:", 0.0, 0.0, v8, v7);
  [(MRUTransportButton *)self sendSubviewToBack:self->_backgroundView];
  UIRectGetCenter();
  -[MRUCAPackageView setCenter:](self->_packageView, "setCenter:");
  if (v7 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v9 * 0.5];
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    [(MRUTransportButton *)self updateVisualStyling];
  }
}

- (void)setStylingProvider:(id)a3
{
  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUTransportButton *)self updateVisualStyling];
    v5 = v7;
  }
}

- (void)setPackageScale:(double)a3
{
  self->_packageScale = a3;
  [(MRUTransportButton *)self updateContentView];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__MRUTransportButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E5F0D7F8;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v6 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__MRUTransportButton_setHighlighted___block_invoke_2;
    v5[3] = &unk_1E5F0D7F8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:2 delay:v5 options:0 mass:0.3175 stiffness:0.0 damping:1.0 initialVelocity:845.74 animations:58.1632 completion:0.0];
  }
}

uint64_t __37__MRUTransportButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHighlighted];
}

uint64_t __37__MRUTransportButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHighlighted];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setSelected:](&v6, sel_setSelected_);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__MRUTransportButton_setSelected___block_invoke;
    v5[3] = &unk_1E5F0D7F8;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v5 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    [(MRUTransportButton *)self updateBackgroundView];
  }
  [(MRUTransportButton *)self updateVisualStyling];
}

uint64_t __34__MRUTransportButton_setSelected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBackgroundView];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUTransportButton;
  [(MRUTransportButton *)&v4 setEnabled:a3];
  [(MRUTransportButton *)self updateVisualStyling];
}

- (void)setPackageState:(unint64_t)a3
{
  self->_packageState = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"State %ld", a3 + 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MRUTransportButton *)self setPackageGlyphState:v4];
}

- (void)setTransportControlItem:(id)a3
{
  objc_storeStrong((id *)&self->_transportControlItem, a3);
  id v5 = a3;
  objc_super v6 = [v5 asset];
  [(MRUTransportButton *)self setAsset:v6];

  uint64_t v7 = [v5 isEnabled];

  [(MRUTransportButton *)self setEnabled:v7];
}

- (void)setAsset:(id)a3
{
}

- (void)setAsset:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 packageAsset];

  if (v7)
  {
    [(MRUTransportButton *)self setImage:0 forState:0 animated:v4];
    double v8 = [(MRUTransportButton *)self packageView];
    double v9 = [v6 packageAsset];
    [v8 setAsset:v9];

    id v11 = [v6 accessibilityIdentifier];

    objc_super v10 = [(MRUTransportButton *)self packageView];
    [v10 setAccessibilityIdentifier:v11];
  }
  else
  {
    [(MRUTransportButton *)self clearPackage];
    id v11 = [v6 image];

    [(MRUTransportButton *)self setImage:v11 forState:0 animated:v4];
  }
}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v5) {
    goto LABEL_8;
  }
  id v9 = [(MRUTransportButton *)self currentImage];
  objc_super v10 = v9;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  int v11 = [v9 isEqual:v8];

  if (v11)
  {
LABEL_7:

    goto LABEL_8;
  }
  CGRect v12 = [(MRUTransportButton *)self currentImage];

  if (!v12)
  {
LABEL_8:
    [(MRUTransportButton *)self setImage:v8 forState:a4];
    goto LABEL_9;
  }
  v13 = [(MRUTransportButton *)self imageView];
  [v13 _removeAllAnimations:1];
  [(MRUTransportButton *)self setPendingImage:v8];
  v14 = (void *)MEMORY[0x1E4FB1EB0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke;
  v21[3] = &unk_1E5F0D8E8;
  v21[4] = self;
  id v22 = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke_2;
  v16[3] = &unk_1E5F0E088;
  v16[4] = self;
  unint64_t v19 = a4;
  uint64_t v20 = 6;
  id v17 = v8;
  id v18 = v22;
  id v15 = v22;
  [v14 _animateUsingSpringWithDuration:6 delay:v21 options:v16 mass:0.3175 stiffness:0.0 damping:1.0 initialVelocity:845.74 animations:58.1632 completion:0.0];

LABEL_9:
}

uint64_t __49__MRUTransportButton_setImage_forState_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) scaleDownImageView];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

void __49__MRUTransportButton_setImage_forState_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingImage];
  BOOL v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40) forState:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
  BOOL v4 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v5 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke_3;
  v6[3] = &unk_1E5F0D8E8;
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 _animateUsingSpringWithDuration:v5 delay:v6 options:0 mass:0.9975 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:30.0 completion:0.0];
}

uint64_t __49__MRUTransportButton_setImage_forState_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) resetImageViewScale];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:1.0];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  [(MRUTransportButton *)self setPendingImage:0];
  v7.receiver = self;
  v7.super_class = (Class)MRUTransportButton;
  [(MRUTransportButton *)&v7 setImage:v6 forState:a4];
}

- (BOOL)useColorFilter
{
  return [(MRUCAPackageView *)self->_packageView useColorFilter];
}

- (void)setUseColorFilter:(BOOL)a3
{
}

- (void)setPackageGlyphState:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUTransportButton *)self packageView];
  [v5 setGlyphState:v4];
}

- (void)clearPackage
{
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)addSymbolEffectIfNeeded
{
  if (![(MRUTransportButton *)self isRunningSymbolEffect])
  {
    BOOL v3 = [(MRUTransportButton *)self transportControlItem];
    id v4 = [v3 asset];

    id v5 = [v4 symbolEffect];
    id v6 = [v4 symbolEffectOptions];
    if (v5)
    {
      [(MRUTransportButton *)self setIsRunningSymbolEffect:1];
      objc_initWeak(&location, self);
      objc_super v7 = [(MRUTransportButton *)self imageView];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45__MRUTransportButton_addSymbolEffectIfNeeded__block_invoke;
      v8[3] = &unk_1E5F0E0B0;
      objc_copyWeak(&v9, &location);
      [v7 addSymbolEffect:v5 options:v6 animated:1 completion:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __45__MRUTransportButton_addSymbolEffectIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsRunningSymbolEffect:0];
}

- (void)didSelect:(id)a3
{
  id v4 = a3;
  id v8 = [(MRUTransportButton *)self transportControlItem];
  char v5 = [v4 isHolding];

  if ((v5 & 1) == 0)
  {
    id v6 = [v8 mainAction];

    if (v6)
    {
      [(MRUTransportButton *)self setPackageState:([(MRUTransportButton *)self packageState] + 1) & 3];
      [(MRUTransportButton *)self addSymbolEffectIfNeeded];
      objc_super v7 = [v8 mainAction];
      v7[2]();
    }
  }
}

- (id)pointerStyleWithProposedEffect:(id)a3 proposedShape:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t pointerStyle = self->_pointerStyle;
  if (pointerStyle == 1)
  {
    CGRect v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
    v13 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v12];
    v14 = (void *)MEMORY[0x1E4FB1AE0];
    id v15 = (void *)MEMORY[0x1E4FB14C0];
    [(MRUTransportButton *)self bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(MRUTransportButton *)self _continuousCornerRadius];
    v25 = objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v24);
    v26 = [v14 shapeWithPath:v25];

    id v4 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v13 shape:v26];
  }
  else
  {
    if (pointerStyle) {
      goto LABEL_6;
    }
    [(MRUTransportButton *)self bounds];
    CGRectGetWidth(v29);
    [(MRUTransportButton *)self bounds];
    CGRectGetHeight(v30);
    [(MRUTransportButton *)self bounds];
    UIRectCenteredRect();
    objc_super v10 = (void *)MEMORY[0x1E4FB1AE0];
    int v11 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:");
    CGRect v12 = [v10 shapeWithPath:v11];

    id v4 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v7 shape:v12];
  }

LABEL_6:

  return v4;
}

- (void)updateVisualStyling
{
  if ([(MRUTransportButton *)self isDimmed])
  {
    uint64_t v3 = 3;
  }
  else if ([(MRUTransportButton *)self isEnabled])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 2;
  }
  stylingProvider = self->_stylingProvider;
  char v5 = [(MRUTransportButton *)self imageView];
  [(MRUVisualStylingProvider *)stylingProvider applyStyle:v3 toView:v5];

  id v6 = self->_stylingProvider;
  id v7 = [(MRUTransportButton *)self packageView];
  [(MRUVisualStylingProvider *)v6 applyStyle:v3 toView:v7];

  id v9 = [(MRUVisualStylingProvider *)self->_stylingProvider colorForStyle:0];
  id v8 = [(MRUTransportButton *)self backgroundView];
  [v8 setBackgroundColor:v9];
}

- (void)updateBackgroundView
{
  [(UIView *)self->_backgroundView setHidden:[(MRUTransportButton *)self showHighlightCircle] ^ 1];
  if ([(MRUTransportButton *)self isHighlighted] && self->_scaleOnHighlight)
  {
    [(UIView *)self->_backgroundView setAlpha:0.1];
    CGAffineTransformMakeScale(&v12, 1.2, 1.2);
    backgroundView = self->_backgroundView;
    CGAffineTransform v11 = v12;
    id v4 = &v11;
  }
  else
  {
    int v5 = [(MRUTransportButton *)self isSelected];
    id v6 = self->_backgroundView;
    if (v5)
    {
      [(UIView *)v6 setAlpha:0.1];
      backgroundView = self->_backgroundView;
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v10[0] = *MEMORY[0x1E4F1DAB8];
      v10[1] = v7;
      v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      id v4 = (CGAffineTransform *)v10;
    }
    else
    {
      [(UIView *)v6 setAlpha:0.0];
      CGAffineTransformMakeScale(&v9, 1.4, 1.4);
      backgroundView = self->_backgroundView;
      CGAffineTransform v8 = v9;
      id v4 = &v8;
    }
  }
  -[UIView setTransform:](backgroundView, "setTransform:", v4, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)updateContentView
{
  if ([(MRUTransportButton *)self isHighlighted])
  {
    if (self->_scaleOnHighlight)
    {
      [(MRUTransportButton *)self packageScale];
      double v4 = 0.8 * v3;
      int v5 = [(MRUTransportButton *)self packageView];
      [v5 setScale:v4];

      [(MRUTransportButton *)self scaleDownImageViewWithSpeed:2.0];
    }
  }
  else if (self->_scaleOnHighlight)
  {
    [(MRUTransportButton *)self packageScale];
    double v7 = v6;
    CGAffineTransform v8 = [(MRUTransportButton *)self packageView];
    [v8 setScale:v7];

    [(MRUTransportButton *)self resetImageViewScaleWithSpeed:2.0];
  }
}

- (void)updateHighlighted
{
  [(MRUTransportButton *)self updateContentView];

  [(MRUTransportButton *)self updateBackgroundView];
}

- (void)scaleDownImageViewWithSpeed:(double)a3
{
  int v5 = [(MRUTransportButton *)self imageView];
  double v6 = [v5 image];

  if (v6)
  {
    double v7 = [(MRUTransportButton *)self imageView];
    CGAffineTransform v8 = [v7 image];
    int v9 = [v8 _isSymbolImage];

    if (v9)
    {
      id v13 = [(MRUTransportButton *)self imageView];
      objc_super v10 = [MEMORY[0x1E4F41A68] scaleDownEffect];
      CGAffineTransform v11 = [MEMORY[0x1E4F41A50] optionsWithSpeed:a3];
      [v13 addSymbolEffect:v10 options:v11 animated:1];
    }
    else
    {
      CGAffineTransformMakeScale(&v15, 0.8, 0.8);
      CGAffineTransform v12 = [(MRUTransportButton *)self imageView];
      CGAffineTransform v14 = v15;
      [v12 setTransform:&v14];
    }
  }
}

- (void)scaleDownImageView
{
}

- (void)resetImageViewScaleWithSpeed:(double)a3
{
  int v5 = [(MRUTransportButton *)self imageView];
  double v6 = [v5 image];

  if (v6)
  {
    double v7 = [(MRUTransportButton *)self imageView];
    CGAffineTransform v8 = [v7 image];
    int v9 = [v8 _isSymbolImage];

    objc_super v10 = [(MRUTransportButton *)self imageView];
    id v14 = v10;
    if (v9)
    {
      CGAffineTransform v11 = [MEMORY[0x1E4F41A68] scaleDownEffect];
      CGAffineTransform v12 = [MEMORY[0x1E4F41A50] optionsWithSpeed:a3];
      [v14 removeSymbolEffectOfType:v11 options:v12];
    }
    else
    {
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v15[0] = *MEMORY[0x1E4F1DAB8];
      v15[1] = v13;
      v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v10 setTransform:v15];
    }
  }
}

- (void)resetImageViewScale
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUTransportControlItem)transportControlItem
{
  return self->_transportControlItem;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)pointerStyle
{
  return self->_pointerStyle;
}

- (void)setPointerStyle:(int64_t)a3
{
  self->_int64_t pointerStyle = a3;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)showHighlightCircle
{
  return self->_showHighlightCircle;
}

- (void)setShowHighlightCircle:(BOOL)a3
{
  self->_showHighlightCircle = a3;
}

- (BOOL)scaleOnHighlight
{
  return self->_scaleOnHighlight;
}

- (void)setScaleOnHighlight:(BOOL)a3
{
  self->_scaleOnHighlight = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)cursorScale
{
  return self->_cursorScale;
}

- (void)setCursorScale:(double)a3
{
  self->_cursorScale = a3;
}

- (double)packageScale
{
  return self->_packageScale;
}

- (unint64_t)packageState
{
  return self->_packageState;
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (UIImage)pendingImage
{
  return self->_pendingImage;
}

- (void)setPendingImage:(id)a3
{
}

- (BOOL)isRunningSymbolEffect
{
  return self->_isRunningSymbolEffect;
}

- (void)setIsRunningSymbolEffect:(BOOL)a3
{
  self->_isRunningSymbolEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingImage, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_transportControlItem, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end