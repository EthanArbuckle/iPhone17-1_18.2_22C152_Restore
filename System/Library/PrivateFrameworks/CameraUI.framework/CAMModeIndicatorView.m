@interface CAMModeIndicatorView
- (CAMModeDialItem)_modeTextView;
- (CAMModeIndicatorView)initWithFrame:(CGRect)a3;
- (CGSize)_symbolSize;
- (UIImageView)_symbolView;
- (int64_t)selectedMode;
- (void)_updateModeIndicatorAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setSelectedMode:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMModeIndicatorView

- (CAMModeIndicatorView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CAMModeIndicatorView;
  v3 = -[CAMModeIndicatorView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemYellowColor];
    [(CAMModeIndicatorView *)v3 setTintColor:v4];

    [(CAMModeIndicatorView *)v3 setClipsToBounds:1];
    v5 = [CAMModeDialItem alloc];
    uint64_t v6 = -[CAMModeDialItem initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    modeTextView = v3->__modeTextView;
    v3->__modeTextView = (CAMModeDialItem *)v6;

    v8 = (void *)MEMORY[0x263F827E8];
    v9 = CAMCameraUIFrameworkBundle();
    v10 = [v8 imageNamed:@"CAMModeIndicator" inBundle:v9];
    v11 = [v10 imageWithRenderingMode:2];

    uint64_t v12 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v11];
    symbolView = v3->__symbolView;
    v3->__symbolView = (UIImageView *)v12;

    [(CAMModeIndicatorView *)v3 addSubview:v3->__modeTextView];
    [(CAMModeIndicatorView *)v3 addSubview:v3->__symbolView];
    v14 = v3;
  }
  return v3;
}

- (void)layoutSubviews
{
  *(void *)&recta.origin.y = self;
  *(void *)&recta.size.width = CAMModeIndicatorView;
  [(CGFloat *)(objc_super *)&recta.origin.y layoutSubviews];
  [(CAMModeIndicatorView *)self bounds];
  CGFloat v4 = v3;
  recta.origin.x = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  v11 = [(CAMModeIndicatorView *)self _modeTextView];
  uint64_t v12 = [(CAMModeIndicatorView *)self _symbolView];
  objc_msgSend(v11, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v14 = v13;
  double v16 = v15;
  double v17 = v10 - v15;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  objc_msgSend(v11, "setCenter:", CGRectGetMidX(v26), v17);
  double v18 = *MEMORY[0x263F00148];
  double v19 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v11, "setBounds:", *MEMORY[0x263F00148], v19, v14, v16);
  [(CAMModeIndicatorView *)self _symbolSize];
  double v21 = v20;
  double v23 = v22;
  [v11 frame];
  CGFloat v24 = CGRectGetMinY(v27) - v23;
  v28.origin.x = recta.origin.x;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  objc_msgSend(v12, "setCenter:", CGRectGetMidX(v28), v24);
  objc_msgSend(v12, "setBounds:", v18, v19, v21, v23);
  [(CAMModeIndicatorView *)self _updateModeIndicatorAnimated:0];
}

- (void)setSelectedMode:(int64_t)a3
{
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectedMode != a3)
  {
    self->_selectedMode = a3;
    [(CAMModeIndicatorView *)self _updateModeIndicatorAnimated:a4];
    if (!a4)
    {
      [(CAMModeIndicatorView *)self setNeedsLayout];
    }
  }
}

- (CGSize)_symbolSize
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateModeIndicatorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CAMModeIndicatorView *)self _modeTextView];
  CGFloat v6 = [(CAMModeIndicatorView *)self _symbolView];
  double v7 = objc_msgSend(NSString, "cam_localizedTitleForMode:wantsCompactTitle:", -[CAMModeIndicatorView selectedMode](self, "selectedMode"), 0);
  [v5 setTitle:v7];

  [v5 setSelected:1];
  [v5 setShouldShadowTitleText:1];
  if (v3)
  {
    [(CAMModeIndicatorView *)self bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v26 = v16;
    double v18 = v17;
    [(CAMModeIndicatorView *)self _symbolSize];
    double v20 = v19;
    v34.origin.x = v9;
    v34.origin.y = v11;
    v34.size.width = v13;
    v34.size.height = v15;
    double MidX = CGRectGetMidX(v34);
    [v5 frame];
    CGFloat v27 = CGRectGetMinY(v35) - v20;
    v36.origin.x = v9;
    v36.origin.y = v11;
    v36.size.width = v13;
    v36.size.height = v15;
    double v22 = CGRectGetMidX(v36);
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    CGFloat v23 = CGRectGetMidX(v37);
    objc_msgSend(v5, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v26, v18);
    objc_msgSend(v5, "setCenter:", MidX, v15 - v18);
    objc_msgSend(v6, "setCenter:", v22, v15);
    [v5 setAlpha:0.0];
    [v6 setAlpha:0.0];
    CGFloat v24 = (void *)MEMORY[0x263F82E00];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke;
    v30[3] = &unk_263FA2BC8;
    id v31 = v6;
    CGFloat v32 = v23;
    CGFloat v33 = v27;
    [v24 animateWithDuration:0x20000 delay:v30 options:0 animations:0.5 completion:0.0];
    v25 = (void *)MEMORY[0x263F82E00];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke_2;
    v28[3] = &unk_263FA0208;
    id v29 = v5;
    [v25 animateWithDuration:0x20000 delay:v28 options:0 animations:0.5 completion:0.2];
  }
}

uint64_t __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:1.0];
}

uint64_t __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (CAMModeDialItem)_modeTextView
{
  return self->__modeTextView;
}

- (UIImageView)_symbolView
{
  return self->__symbolView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__symbolView, 0);
  objc_storeStrong((id *)&self->__modeTextView, 0);
}

@end