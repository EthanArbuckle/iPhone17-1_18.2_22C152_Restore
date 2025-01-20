@interface CAMFreeResourcesInstructionLabel
- (BOOL)_wantsPrefixActivityIndicatorView;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAMFreeResourcesInstructionLabel)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_textInsets;
- (double)_backgroundAlpha;
- (id)_symbolSuffixName;
- (id)_textColor;
- (unint64_t)freeResourceInstructionState;
- (void)_updateText;
- (void)setFreeResourceInstructionState:(unint64_t)a3;
@end

@implementation CAMFreeResourcesInstructionLabel

- (CAMFreeResourcesInstructionLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFreeResourcesInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMFreeResourcesInstructionLabel *)v3 _updateText];
  }
  return v4;
}

- (void)setFreeResourceInstructionState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_freeResourceInstructionState != a3)
  {
    self->_freeResourceInstructionState = a3;
    [(CAMFreeResourcesInstructionLabel *)self _updateText];
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 4) {
        objc_super v6 = &stru_26BD78BA0;
      }
      else {
        objc_super v6 = off_263FA0D70[a3];
      }
      v7 = [(CAMInstructionLabel *)self text];
      int v8 = 138543618;
      v9 = v6;
      __int16 v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "FreeResourcesInstructionState: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
    [(CAMFreeResourcesInstructionLabel *)self setNeedsLayout];
    [(CAMFreeResourcesInstructionLabel *)self layoutIfNeeded];
  }
}

- (void)_updateText
{
  unint64_t v3 = [(CAMFreeResourcesInstructionLabel *)self freeResourceInstructionState];
  if (v3 > 4)
  {
    v4 = &stru_26BD78BA0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_263FA0D98[v3], 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  [(CAMInstructionLabel *)self setText:v4];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CAMFreeResourcesInstructionLabel *)self bounds];
  CGRect v11 = CGRectInset(v10, -11.0, -11.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (UIEdgeInsets)_textInsets
{
  double v2 = CAMPixelWidthForView(self);
  double v3 = v2 * 2.0 + 2.0;
  double v4 = 5.0;
  double v5 = 5.0;
  double v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (id)_textColor
{
  double v3 = [MEMORY[0x263F825C8] whiteColor];
  unint64_t v4 = [(CAMFreeResourcesInstructionLabel *)self freeResourceInstructionState];
  if (v4 == 3 || !v4)
  {
    uint64_t v5 = [MEMORY[0x263F825C8] systemYellowColor];

    double v3 = (void *)v5;
  }
  return v3;
}

- (double)_backgroundAlpha
{
  unint64_t v2 = [(CAMFreeResourcesInstructionLabel *)self freeResourceInstructionState];
  double result = 0.5;
  if (v2 == 2) {
    return 1.0;
  }
  return result;
}

- (id)_symbolSuffixName
{
  unint64_t v2 = [(CAMFreeResourcesInstructionLabel *)self freeResourceInstructionState];
  if (v2 > 3) {
    return &stru_26BD78BA0;
  }
  else {
    return off_263FA0DC0[v2];
  }
}

- (BOOL)_wantsPrefixActivityIndicatorView
{
  unint64_t v2 = [(CAMFreeResourcesInstructionLabel *)self freeResourceInstructionState];
  return (v2 < 5) & (0x16u >> v2);
}

- (unint64_t)freeResourceInstructionState
{
  return self->_freeResourceInstructionState;
}

@end