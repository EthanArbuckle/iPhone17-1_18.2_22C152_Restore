@interface MPUArtworkView
- (BOOL)_shouldShowHighlightView;
- (BOOL)automaticallyApplyAspectConstraints;
- (BOOL)dimsWhenHighlighted;
- (BOOL)forcesAnimatedUnhighlighting;
- (BOOL)isDisplayingPlaceholder;
- (BOOL)shouldDisplayPlaceholder;
- (MPUArtworkView)initWithFrame:(CGRect)a3;
- (MPUArtworkView)initWithImage:(id)a3;
- (UIImage)_externalImage;
- (UIImage)placeholderImage;
- (double)_aspectConstraintMultiplier;
- (void)_imageDidChange;
- (void)_setAspectConstraintMultiplier:(double)a3;
- (void)_setPlaceholderHidden:(BOOL)a3;
- (void)_updateHighlightViewAnimated:(BOOL)a3;
- (void)dealloc;
- (void)setAutomaticallyApplyAspectConstraints:(BOOL)a3;
- (void)setDimsWhenHighlighted:(BOOL)a3;
- (void)setDisplayingPlaceholder:(BOOL)a3;
- (void)setForcesAnimatedUnhighlighting:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightedAnimationImages:(id)a3;
- (void)setHighlightedImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateConstraints;
@end

@implementation MPUArtworkView

- (MPUArtworkView)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  v3 = [(MPUArtworkView *)&v6 initWithImage:a3];
  v4 = v3;
  if (v3)
  {
    [(MPUArtworkView *)v3 setContentMode:1];
    [(MPUArtworkView *)v4 setOpaque:1];
  }
  return v4;
}

- (MPUArtworkView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  v3 = -[MPUArtworkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MPUArtworkView *)v3 setContentMode:1];
    [(MPUArtworkView *)v4 setOpaque:1];
  }
  return v4;
}

- (void)dealloc
{
  self->_isDeallocating = 1;
  v2.receiver = self;
  v2.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v2 dealloc];
}

- (void)updateConstraints
{
  uint64_t v3 = [(MPUArtworkView *)self image];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(MPUArtworkView *)self automaticallyApplyAspectConstraints];

    if (v5)
    {
      objc_super v6 = [(MPUArtworkView *)self image];
      [v6 size];
      double v8 = v7;
      double v10 = v9;

      if (v10 > 0.0 && v8 > 0.0) {
        [(MPUArtworkView *)self _setAspectConstraintMultiplier:v10 / v8];
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v11 updateConstraints];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v6 setHighlighted:a3];
  if (self->_dimsWhenHighlighted) {
    [(MPUArtworkView *)self _updateHighlightViewAnimated:v4];
  }
}

- (void)setHighlightedImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v4 setHighlightedImage:a3];
  if (self->_dimsWhenHighlighted) {
    [(MPUArtworkView *)self _updateHighlightViewAnimated:0];
  }
}

- (void)setHighlightedAnimationImages:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v4 setHighlightedAnimationImages:a3];
  if (self->_dimsWhenHighlighted) {
    [(MPUArtworkView *)self _updateHighlightViewAnimated:0];
  }
}

- (void)setImage:(id)a3
{
  objc_super v4 = (UIImage *)a3;
  if ([(MPUArtworkView *)self isDisplayingPlaceholder]) {
    [(MPUArtworkView *)self _setPlaceholderHidden:1];
  }
  v6.receiver = self;
  v6.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v6 setImage:v4];
  externalImage = self->_externalImage;
  self->_externalImage = v4;

  if ([(MPUArtworkView *)self shouldDisplayPlaceholder]) {
    [(MPUArtworkView *)self _setPlaceholderHidden:0];
  }
  [(MPUArtworkView *)self _imageDidChange];
}

- (void)startAnimating
{
  v3.receiver = self;
  v3.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v3 startAnimating];
  if (self->_dimsWhenHighlighted) {
    [(MPUArtworkView *)self _updateHighlightViewAnimated:0];
  }
}

- (void)stopAnimating
{
  v3.receiver = self;
  v3.super_class = (Class)MPUArtworkView;
  [(MPUArtworkView *)&v3 stopAnimating];
  if (self->_dimsWhenHighlighted) {
    [(MPUArtworkView *)self _updateHighlightViewAnimated:0];
  }
}

- (void)setAutomaticallyApplyAspectConstraints:(BOOL)a3
{
  if (self->_automaticallyApplyAspectConstraints != a3)
  {
    self->_automaticallyApplyAspectConstraints = a3;
    if (a3)
    {
      [(MPUArtworkView *)self setNeedsUpdateConstraints];
    }
    else
    {
      [(MPUArtworkView *)self removeConstraint:self->_aspectConstraint];
      aspectConstraint = self->_aspectConstraint;
      self->_aspectConstraint = 0;
    }
  }
}

- (void)setDimsWhenHighlighted:(BOOL)a3
{
  if (self->_dimsWhenHighlighted != a3)
  {
    self->_dimsWhenHighlighted = a3;
    if (a3)
    {
      [(MPUArtworkView *)self _updateHighlightViewAnimated:1];
    }
    else
    {
      [(UIView *)self->_highlightView removeFromSuperview];
      highlightView = self->_highlightView;
      self->_highlightView = 0;
    }
  }
}

- (void)setPlaceholderImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    if ([(MPUArtworkView *)self isDisplayingPlaceholder])
    {
      placeholderImage = self->_placeholderImage;
      v7.receiver = self;
      v7.super_class = (Class)MPUArtworkView;
      [(MPUArtworkView *)&v7 setImage:placeholderImage];
      [(MPUArtworkView *)self _imageDidChange];
    }
    [(MPUArtworkView *)self _setPlaceholderHidden:[(MPUArtworkView *)self shouldDisplayPlaceholder] ^ 1];
  }
}

- (BOOL)shouldDisplayPlaceholder
{
  if ([(MPUArtworkView *)self isDisplayingPlaceholder]) {
    return 0;
  }
  objc_super v4 = [(MPUArtworkView *)self placeholderImage];
  if (v4) {
    BOOL v3 = self->_externalImage == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (double)_aspectConstraintMultiplier
{
  [(NSLayoutConstraint *)self->_aspectConstraint multiplier];
  return result;
}

- (void)_setAspectConstraintMultiplier:(double)a3
{
  [(NSLayoutConstraint *)self->_aspectConstraint multiplier];
  if (v5 != a3)
  {
    [(MPUArtworkView *)self removeConstraint:self->_aspectConstraint];
    objc_super v6 = [MEMORY[0x263F08938] constraintWithItem:self attribute:8 relatedBy:0 toItem:self attribute:7 multiplier:a3 constant:0.0];
    aspectConstraint = self->_aspectConstraint;
    self->_aspectConstraint = v6;

    double v8 = self->_aspectConstraint;
    [(MPUArtworkView *)self addConstraint:v8];
  }
}

- (void)_imageDidChange
{
  if ([(MPUArtworkView *)self automaticallyApplyAspectConstraints])
  {
    [(MPUArtworkView *)self setNeedsUpdateConstraints];
  }
}

- (void)_setPlaceholderHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    double v5 = [(MPUArtworkView *)self _externalImage];
    v8.receiver = self;
    v8.super_class = (Class)MPUArtworkView;
    [(MPUArtworkView *)&v8 setImage:v5];
  }
  else
  {
    placeholderImage = self->_placeholderImage;
    v7.receiver = self;
    v7.super_class = (Class)MPUArtworkView;
    [(MPUArtworkView *)&v7 setImage:placeholderImage];
  }
  [(MPUArtworkView *)self setDisplayingPlaceholder:!v3];
  [(MPUArtworkView *)self _imageDidChange];
}

- (BOOL)_shouldShowHighlightView
{
  if (![(MPUArtworkView *)self isHighlighted]) {
    return 0;
  }
  if ([(MPUArtworkView *)self isAnimating])
  {
    BOOL v3 = [(MPUArtworkView *)self highlightedAnimationImages];
    uint64_t v4 = [v3 count];
  }
  else
  {
    uint64_t v4 = [(MPUArtworkView *)self highlightedImage];
    BOOL v3 = (void *)v4;
  }
  BOOL v5 = v4 == 0;

  return v5;
}

- (void)_updateHighlightViewAnimated:(BOOL)a3
{
  if (self->_isDeallocating) {
    return;
  }
  BOOL v3 = a3;
  BOOL v5 = [(MPUArtworkView *)self _shouldShowHighlightView];
  BOOL v6 = [(UIView *)self->_highlightView isHidden];
  [(UIView *)self->_highlightView alpha];
  BOOL v8 = v7 < 1.0 || v6;
  if (!v5 || !v8)
  {
    BOOL v9 = v7 <= 0.0 && v6;
    if (v5 || v9) {
      return;
    }
  }
  double v10 = 0.0;
  if (v5) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  v12 = [(UIView *)self->_highlightView layer];
  v13 = [v12 presentationLayer];

  [v13 opacity];
  float v15 = v14;
  if (v3 || v5)
  {
    if (!v3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([(MPUArtworkView *)self forcesAnimatedUnhighlighting]) {
LABEL_18:
  }
    double v10 = vabdd_f64(v15, v11) * 0.2;
LABEL_19:
  if (v5)
  {
    highlightView = self->_highlightView;
    if (highlightView)
    {
      if ([(UIView *)highlightView isHidden]) {
        [(UIView *)self->_highlightView setHidden:0];
      }
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x263F1CB60]);
      [(MPUArtworkView *)self bounds];
      v18 = (UIView *)objc_msgSend(v17, "initWithFrame:");
      v19 = self->_highlightView;
      self->_highlightView = v18;

      [(UIView *)self->_highlightView setAutoresizingMask:18];
      v20 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
      [(UIView *)self->_highlightView setBackgroundColor:v20];

      [(UIView *)self->_highlightView setAlpha:0.0];
      [(MPUArtworkView *)self addSubview:self->_highlightView];
    }
    if (v10 <= 0.0)
    {
      [(UIView *)self->_highlightView setAlpha:1.0];
    }
    else
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke;
      v23[3] = &unk_2647C25E8;
      v23[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v23 animations:v10];
    }
  }
  else if (v10 <= 0.0)
  {
    [(UIView *)self->_highlightView setAlpha:0.0];
    [(UIView *)self->_highlightView setHidden:1];
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_2;
    v22[3] = &unk_2647C25E8;
    v22[4] = self;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_3;
    v21[3] = &unk_2647C2688;
    v21[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v22 animations:v21 completion:v10];
  }
}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:1.0];
}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:0.0];
}

uint64_t __47__MPUArtworkView__updateHighlightViewAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    double result = [*(id *)(result + 32) _shouldShowHighlightView];
    if ((result & 1) == 0)
    {
      BOOL v3 = *(void **)(*(void *)(v2 + 32) + 520);
      return [v3 setHidden:1];
    }
  }
  return result;
}

- (UIImage)_externalImage
{
  return self->_externalImage;
}

- (BOOL)automaticallyApplyAspectConstraints
{
  return self->_automaticallyApplyAspectConstraints;
}

- (BOOL)dimsWhenHighlighted
{
  return self->_dimsWhenHighlighted;
}

- (BOOL)forcesAnimatedUnhighlighting
{
  return self->_forcesAnimatedUnhighlighting;
}

- (void)setForcesAnimatedUnhighlighting:(BOOL)a3
{
  self->_forcesAnimatedUnhighlighting = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)isDisplayingPlaceholder
{
  return self->_displayingPlaceholder;
}

- (void)setDisplayingPlaceholder:(BOOL)a3
{
  self->_displayingPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_externalImage, 0);
  objc_storeStrong((id *)&self->_aspectConstraint, 0);
}

@end