@interface ASCGradientBackgroundView
+ (double)gradientPercentageOfBounds;
- (ASCGradientBackgroundView)initWithCoder:(id)a3;
- (ASCGradientBackgroundView)initWithFrame:(CGRect)a3;
- (CAGradientLayer)gradientLayer;
- (UIView)gradientOverlayView;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation ASCGradientBackgroundView

+ (double)gradientPercentageOfBounds
{
  return 0.65;
}

- (ASCGradientBackgroundView)initWithFrame:(CGRect)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)ASCGradientBackgroundView;
  v3 = -[ASCGradientBackgroundView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCGradientBackgroundView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(ASCGradientBackgroundView *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    gradientOverlayView = v4->_gradientOverlayView;
    v4->_gradientOverlayView = (UIView *)v7;

    uint64_t v9 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v9;

    v21 = [MEMORY[0x1E4FB1618] blackColor];
    id v11 = [v21 colorWithAlphaComponent:0.0];
    v23[0] = [v11 CGColor];
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    id v13 = [v12 colorWithAlphaComponent:0.63];
    v23[1] = [v13 CGColor];
    v14 = [MEMORY[0x1E4FB1618] blackColor];
    id v15 = [v14 colorWithAlphaComponent:0.75];
    v23[2] = [v15 CGColor];
    v16 = [MEMORY[0x1E4FB1618] blackColor];
    id v17 = [v16 colorWithAlphaComponent:0.75];
    v23[3] = [v17 CGColor];
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [(CAGradientLayer *)v4->_gradientLayer setColors:v18];

    [(CAGradientLayer *)v4->_gradientLayer setLocations:&unk_1F1E15C70];
    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.0, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 0.0, 1.0);
    v19 = [(UIView *)v4->_gradientOverlayView layer];
    [v19 addSublayer:v4->_gradientLayer];

    [(ASCGradientBackgroundView *)v4 addSubview:v4->_gradientOverlayView];
  }
  return v4;
}

- (ASCGradientBackgroundView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)ASCGradientBackgroundView;
  [(ASCGradientBackgroundView *)&v21 layoutSubviews];
  [(ASCGradientBackgroundView *)self bounds];
  double v4 = v3;
  +[ASCGradientBackgroundView gradientPercentageOfBounds];
  double v6 = v4 * v5;
  [(ASCGradientBackgroundView *)self bounds];
  CGFloat v7 = CGRectGetMaxY(v22) - v6;
  [(ASCGradientBackgroundView *)self bounds];
  double v9 = v8;
  v10 = [(ASCGradientBackgroundView *)self gradientOverlayView];
  objc_msgSend(v10, "setFrame:", 0.0, v7, v9, v6);

  id v11 = [(ASCGradientBackgroundView *)self gradientOverlayView];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(ASCGradientBackgroundView *)self gradientLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (UIView)gradientOverlayView
{
  return self->_gradientOverlayView;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);

  objc_storeStrong((id *)&self->_gradientOverlayView, 0);
}

@end