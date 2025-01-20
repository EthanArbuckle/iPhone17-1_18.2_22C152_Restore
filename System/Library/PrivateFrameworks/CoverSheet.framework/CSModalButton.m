@interface CSModalButton
- (CSModalButton)initWithFrame:(CGRect)a3;
- (UIVisualEffect)visualEffect;
- (id)backgroundColor;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setVisualEffect:(id)a3;
@end

@implementation CSModalButton

- (CSModalButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSModalButton;
  v3 = -[CSModalButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] whiteColor];
    [(CSModalButton *)v3 setTitleColor:v4 forState:0];

    v5 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.5];
    [(CSModalButton *)v3 setTitleColor:v5 forState:1];

    [(CSModalButton *)v3 addTarget:v3 action:sel__buttonPressed_ forControlEvents:5];
    [(CSModalButton *)v3 addTarget:v3 action:sel__buttonReleased_ forControlEvents:456];
    v6 = [(CSModalButton *)v3 titleLabel];
    [v6 setNumberOfLines:1];
    [v6 setBaselineAdjustment:1];
    [v6 setLineBreakMode:0];
    [v6 setTextAlignment:1];
    [(CSModalButton *)v3 setBackgroundColor:0];
    -[CSModalButton setContentEdgeInsets:](v3, "setContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
    v7 = [(CSModalButton *)v3 layer];
    [v7 setHitTestsAsOpaque:1];
  }
  return v3;
}

- (UIVisualEffect)visualEffect
{
  return [(UIVisualEffectView *)self->_effectView effect];
}

- (void)setVisualEffect:(id)a3
{
  id v4 = a3;
  effectView = self->_effectView;
  if (v4)
  {
    id v11 = v4;
    if (!effectView)
    {
      v6 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v4];
      [(UIVisualEffectView *)v6 setAutoresizingMask:18];
      [(UIVisualEffectView *)v6 bs_setHitTestingDisabled:1];
      [(CSModalButton *)self _continuousCornerRadius];
      -[UIVisualEffectView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
      v7 = self->_backgroundColor;
      [(CSModalButton *)self setBackgroundColor:0];
      [(CSModalButton *)self addSubview:v6];
      v8 = self->_effectView;
      self->_effectView = v6;
      objc_super v9 = v6;

      [(CSModalButton *)self setBackgroundColor:v7];
      effectView = self->_effectView;
    }
    effectView = (UIVisualEffectView *)[(UIVisualEffectView *)effectView setEffect:v11];
  }
  else
  {
    if (!effectView) {
      goto LABEL_8;
    }
    id v11 = 0;
    [(UIVisualEffectView *)effectView removeFromSuperview];
    v10 = self->_effectView;
    self->_effectView = 0;
  }
  id v4 = v11;
LABEL_8:

  MEMORY[0x1F41817F8](effectView, v4);
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_isPressed)
  {
    v6 = (UIColor *)[v4 copy];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v6;
  }
  effectView = self->_effectView;
  if (effectView)
  {
    objc_super v9 = [(UIVisualEffectView *)effectView contentView];
    [v9 setBackgroundColor:v5];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CSModalButton;
    [(CSModalButton *)&v10 setBackgroundColor:v5];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSModalButton;
  -[CSModalButton _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIVisualEffectView *)self->_effectView _setContinuousCornerRadius:a3];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSModalButton;
  [(CSModalButton *)&v4 layoutSubviews];
  effectView = self->_effectView;
  [(CSModalButton *)self bounds];
  -[UIVisualEffectView setFrame:](effectView, "setFrame:");
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  [(UIColor *)self->_backgroundColor getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  self->_isPressed = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__CSModalButton__buttonPressed___block_invoke;
  v4[3] = &unk_1E6AD9720;
  v4[4] = self;
  v4[5] = v8;
  v4[6] = v7;
  v4[7] = v6;
  v4[8] = v5;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.2];
}

void __32__CSModalButton__buttonPressed___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F428B8] colorWithRed:*(double *)(a1 + 40) green:*(double *)(a1 + 48) blue:*(double *)(a1 + 56) alpha:*(double *)(a1 + 64) * 0.5];
  [v1 setBackgroundColor:v2];
}

- (void)_buttonReleased:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__CSModalButton__buttonReleased___block_invoke;
  v4[3] = &unk_1E6AD87F8;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CSModalButton__buttonReleased___block_invoke_2;
  v3[3] = &unk_1E6AD8A40;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3 completion:0.2];
}

uint64_t __33__CSModalButton__buttonReleased___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(*(void *)(a1 + 32) + 744)];
}

uint64_t __33__CSModalButton__buttonReleased___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 760) = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end