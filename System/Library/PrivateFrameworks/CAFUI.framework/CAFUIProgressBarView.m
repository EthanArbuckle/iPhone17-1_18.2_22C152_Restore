@interface CAFUIProgressBarView
- (CAFUIProgressBarView)initWithFrame:(CGRect)a3;
- (UIColor)barColor;
- (UIView)overallBarView;
- (UIView)progressBarView;
- (double)progress;
- (void)layoutSubviews;
- (void)setBarColor:(id)a3;
- (void)setOverallBarView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarView:(id)a3;
@end

@implementation CAFUIProgressBarView

- (CAFUIProgressBarView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CAFUIProgressBarView;
  v3 = -[CAFUIProgressBarView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    overallBarView = v3->_overallBarView;
    v3->_overallBarView = (UIView *)v9;

    v11 = v3->_overallBarView;
    v12 = [MEMORY[0x263F825C8] labelColor];
    [(UIView *)v11 setBackgroundColor:v12];

    [(CAFUIProgressBarView *)v3 addSubview:v3->_overallBarView];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v6, v7, v8);
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (UIView *)v13;

    v15 = v3->_progressBarView;
    v16 = [MEMORY[0x263F825C8] labelColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(CAFUIProgressBarView *)v3 addSubview:v3->_progressBarView];
    v17 = [MEMORY[0x263F825C8] labelColor];
    [(CAFUIProgressBarView *)v3 setBarColor:v17];

    [(CAFUIProgressBarView *)v3 setAccessibilityIdentifier:@"CAFUIProgressBarView"];
  }
  return v3;
}

- (UIColor)barColor
{
  return [(UIView *)self->_progressBarView backgroundColor];
}

- (void)setBarColor:(id)a3
{
  [(UIView *)self->_progressBarView setBackgroundColor:a3];

  [(CAFUIProgressBarView *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(CAFUIProgressBarView *)self bounds];
  CGFloat v5 = CGRectGetHeight(v18) * 0.5;
  double v6 = [(CAFUIProgressBarView *)self overallBarView];
  id v16 = [v6 layer];

  [v16 setCornerRadius:v5];
  LODWORD(v7) = 1036831949;
  [v16 setOpacity:v7];
  [(CAFUIProgressBarView *)self bounds];
  double Width = CGRectGetWidth(v19);
  [(CAFUIProgressBarView *)self bounds];
  double v10 = v9;
  [(CAFUIProgressBarView *)self bounds];
  double v11 = CGRectGetMidY(v20) - v5;
  v12 = [(CAFUIProgressBarView *)self progressBarView];
  uint64_t v13 = [v12 layer];

  [v13 setCornerRadius:v5];
  -[UIView setFrame:](self->_overallBarView, "setFrame:", 0.0, v11, Width, v10);
  [(CAFUIProgressBarView *)self progress];
  double v15 = Width - floor(Width * v14);
  if (v4 != 1) {
    double v15 = 0.0;
  }
  -[UIView setFrame:](self->_progressBarView, "setFrame:", v15, v11);
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  [(CAFUIProgressBarView *)self setNeedsLayout];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__CAFUIProgressBarView_setProgress___block_invoke;
  v4[3] = &unk_26525C5C8;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:196612 delay:v4 options:0 animations:0.100000001 completion:0.0];
}

uint64_t __36__CAFUIProgressBarView_setProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (UIView)overallBarView
{
  return self->_overallBarView;
}

- (void)setOverallBarView:(id)a3
{
}

- (UIView)progressBarView
{
  return self->_progressBarView;
}

- (void)setProgressBarView:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarView, 0);

  objc_storeStrong((id *)&self->_overallBarView, 0);
}

@end