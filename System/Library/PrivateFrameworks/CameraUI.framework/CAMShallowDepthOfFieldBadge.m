@interface CAMShallowDepthOfFieldBadge
- (CAMShallowDepthOfFieldBadge)initWithFrame:(CGRect)a3;
- (CEKBadgeTextView)_disabledTextView;
- (CEKBadgeTextView)_enabledTextView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (int64_t)shallowDepthOfFieldStatus;
- (void)_updateForShallowDepthOfFieldStatusAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMShallowDepthOfFieldBadge

- (CAMShallowDepthOfFieldBadge)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CAMShallowDepthOfFieldBadge;
  v3 = -[CAMShallowDepthOfFieldBadge initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMShallowDepthOfFieldBadge *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = CAMLocalizedFrameworkString(@"PORTRAIT_MODE_BADGE", &stru_26BD78BA0);
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F30690]), "initWithFrame:", v6, v8, v10, v12);
    enabledTextView = v4->__enabledTextView;
    v4->__enabledTextView = (CEKBadgeTextView *)v14;

    [(CEKBadgeTextView *)v4->__enabledTextView _setText:v13];
    v16 = v4->__enabledTextView;
    v17 = [MEMORY[0x263F825C8] systemYellowColor];
    [(CEKBadgeTextView *)v16 _setFillColor:v17];

    v18 = v4->__enabledTextView;
    v19 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [(CEKBadgeTextView *)v18 _setContentColor:v19];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F30690]), "initWithFrame:", v6, v8, v10, v12);
    disabledTextView = v4->__disabledTextView;
    v4->__disabledTextView = (CEKBadgeTextView *)v20;

    [(CEKBadgeTextView *)v4->__disabledTextView _setText:v13];
    v22 = v4->__disabledTextView;
    v23 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
    [(CEKBadgeTextView *)v22 _setFillColor:v23];

    v24 = v4->__disabledTextView;
    v25 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
    [(CEKBadgeTextView *)v24 _setContentColor:v25];

    [(CEKBadgeTextView *)v4->__disabledTextView setAlpha:0.3];
    [(CAMShallowDepthOfFieldBadge *)v4 addSubview:v4->__enabledTextView];
    [(CAMShallowDepthOfFieldBadge *)v4 addSubview:v4->__disabledTextView];
    [(CAMShallowDepthOfFieldBadge *)v4 _updateForShallowDepthOfFieldStatusAnimated:0];
    v26 = v4;
  }
  return v4;
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    [(CAMShallowDepthOfFieldBadge *)self _updateForShallowDepthOfFieldStatusAnimated:a4];
  }
}

- (void)_updateForShallowDepthOfFieldStatusAnimated:(BOOL)a3
{
  double v5 = [(CAMShallowDepthOfFieldBadge *)self _enabledTextView];
  double v6 = [(CAMShallowDepthOfFieldBadge *)self _disabledTextView];
  unint64_t v7 = [(CAMShallowDepthOfFieldBadge *)self shallowDepthOfFieldStatus];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CAMShallowDepthOfFieldBadge__updateForShallowDepthOfFieldStatusAnimated___block_invoke;
  aBlock[3] = &unk_263FA4118;
  char v15 = (v7 < 0xF) & (0x6202u >> v7);
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  double v10 = _Block_copy(aBlock);
  double v11 = v10;
  if (a3) {
    [MEMORY[0x263F82E00] animateWithDuration:6 delay:v10 options:0 animations:0.17 completion:0.0];
  }
  else {
    (*((void (**)(void *))v10 + 2))(v10);
  }
}

uint64_t __75__CAMShallowDepthOfFieldBadge__updateForShallowDepthOfFieldStatusAnimated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  double v4 = 1.0;
  if (v2)
  {
    double v5 = 0.0;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.3;
  }
  [v3 setAlpha:v4];
  double v6 = *(void **)(a1 + 40);
  return [v6 setAlpha:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CEKBadgeTextView sizeThatFits:](self->__disabledTextView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(CEKBadgeTextView *)self->__disabledTextView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CAMShallowDepthOfFieldBadge;
  [(CAMShallowDepthOfFieldBadge *)&v11 layoutSubviews];
  [(CAMShallowDepthOfFieldBadge *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CEKBadgeTextView setFrame:](self->__disabledTextView, "setFrame:");
  -[CEKBadgeTextView setFrame:](self->__enabledTextView, "setFrame:", v4, v6, v8, v10);
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CEKBadgeTextView)_enabledTextView
{
  return self->__enabledTextView;
}

- (CEKBadgeTextView)_disabledTextView
{
  return self->__disabledTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__disabledTextView, 0);
  objc_storeStrong((id *)&self->__enabledTextView, 0);
}

@end