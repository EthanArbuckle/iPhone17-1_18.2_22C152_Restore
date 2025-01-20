@interface PKProgressAlertContentView
- (CGSize)intrinsicContentSize;
- (PKProgressAlertContentView)initWithFrame:(CGRect)a3;
- (double)progress;
- (id)_shapeLayerPathForProgress:(double)a3;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
@end

@implementation PKProgressAlertContentView

- (void)layoutSubviews
{
  [(PKProgressAlertContentView *)self bounds];
  UIRectCenteredIntegralRect();
  -[_PKAnimatableBorderCornerRadiusView setFrame:](self->_outerRingView, "setFrame:");
  UIRectCenteredIntegralRect();
  -[_PKPathView setFrame:](self->_innerPieView, "setFrame:");
  [(_PKAnimatableBorderCornerRadiusView *)self->_outerRingView setBorderWidth:4.0];
  [(_PKAnimatableBorderCornerRadiusView *)self->_outerRingView setCornerRadius:20.0];
  outerRingView = self->_outerRingView;
  v4 = [(PKProgressAlertContentView *)self tintColor];
  [(_PKAnimatableBorderCornerRadiusView *)outerRingView setBorderColor:v4];

  innerPieView = self->_innerPieView;
  id v6 = [(PKProgressAlertContentView *)self tintColor];
  [(_PKPathView *)innerPieView setFillColor:v6];
}

- (id)_shapeLayerPathForProgress:(double)a3
{
  v4 = [MEMORY[0x1E4FB14C0] bezierPath];
  objc_msgSend(v4, "moveToPoint:", 18.0, 18.0);
  objc_msgSend(v4, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 18.0, 18.0, 18.0, -1.57079633, a3 * 6.28318531 + -1.57079633);
  [v4 closePath];

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 105.0;
  double v3 = 105.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setProgress:(double)a3
{
  double progress = self->_progress;
  self->_double progress = a3;
  if (progress < 0.1) {
    double progress = 0.1;
  }
  if (a3 < 0.1) {
    a3 = 0.1;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PKProgressAlertContentView_setProgress___block_invoke;
  v4[3] = &unk_1E64C8850;
  *(double *)&v4[6] = progress;
  v4[7] = 0x3F847AE147AE147BLL;
  v4[4] = self;
  v4[5] = (uint64_t)fmax((a3 - progress) / 0.01, 1.0);
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v4, 0);
}

uint64_t __42__PKProgressAlertContentView_setProgress___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    do
    {
      double v5 = *(double *)(v2 + 48) + (double)v3 * *(double *)(v2 + 56);
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __42__PKProgressAlertContentView_setProgress___block_invoke_2;
      v6[3] = &unk_1E64C61E8;
      v6[4] = *(void *)(v2 + 32);
      *(double *)&v6[5] = v5;
      CGSize result = [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v6 relativeDuration:(double)v3++ / (double)v1 animations:1.0 / (double)v1];
      uint64_t v1 = *(void *)(v2 + 40);
    }
    while (v3 < v1);
  }
  return result;
}

void __42__PKProgressAlertContentView_setProgress___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 416);
  id v2 = [*(id *)(a1 + 32) _shapeLayerPathForProgress:*(double *)(a1 + 40)];
  [v1 setPath:v2];
}

- (PKProgressAlertContentView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKProgressAlertContentView;
  uint64_t v3 = -[PKProgressAlertContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = objc_alloc_init(_PKAnimatableBorderCornerRadiusView);
  outerRingView = v3->_outerRingView;
  v3->_outerRingView = v4;

  [(PKProgressAlertContentView *)v3 addSubview:v3->_outerRingView];
  id v6 = objc_alloc_init(_PKPathView);
  innerPieView = v3->_innerPieView;
  v3->_innerPieView = v6;

  [(PKProgressAlertContentView *)v3 addSubview:v3->_innerPieView];
  v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.455 alpha:1.0];
  [(PKProgressAlertContentView *)v3 setTintColor:v8];

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerPieView, 0);

  objc_storeStrong((id *)&self->_outerRingView, 0);
}

@end