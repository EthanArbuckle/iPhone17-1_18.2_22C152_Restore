@interface CAMPanoramaLevelView
- (CAMPanoramaLevelView)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (UIView)lineView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation CAMPanoramaLevelView

- (CAMPanoramaLevelView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CAMPanoramaLevelView;
  v3 = -[CAMPanoramaLevelView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(CAMPanoramaLevelView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F825C8] systemYellowColor];
    v6 = [v5 colorWithAlphaComponent:0.75];

    id v7 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    lineView = v3->_lineView;
    v3->_lineView = (UIView *)v8;

    [(UIView *)v3->_lineView setBackgroundColor:v6];
    [(CAMPanoramaLevelView *)v3 addSubview:v3->_lineView];
    v10 = v3;
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CAMPanoramaLevelView;
  [(CAMPanoramaLevelView *)&v9 layoutSubviews];
  [(CAMPanoramaLevelView *)self bounds];
  double Width = CGRectGetWidth(v10);
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(CAMPanoramaLevelView *)self lineView];
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, 1.0);
  objc_msgSend(v8, "setCenter:", v5, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMPanoramaLevelView;
  -[CAMPanoramaLevelView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (CAMPanoramaLevelView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    double v5 = 0;
  }
  return v5;
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void).cxx_destruct
{
}

@end