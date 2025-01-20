@interface HUQuickControlRingSliderHandleView
- (CAShapeLayer)circleLayer;
- (HUQuickControlRingSliderHandleView)initWithFrame:(CGRect)a3 style:(unint64_t)a4;
- (UIView)lineView;
- (double)outerRadius;
- (unint64_t)handleViewStyle;
- (void)_setColor:(id)a3;
- (void)_updateCircleLayer;
- (void)layoutSubviews;
- (void)setCircleLayer:(id)a3;
- (void)setHandleViewStyle:(unint64_t)a3;
- (void)setLineView:(id)a3;
@end

@implementation HUQuickControlRingSliderHandleView

- (HUQuickControlRingSliderHandleView)initWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlRingSliderHandleView;
  v5 = -[HUQuickControlRingSliderHandleView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(HUQuickControlRingSliderHandleView *)v5 setClipsToBounds:0];
    v7 = [(HUQuickControlRingSliderHandleView *)v6 layer];
    [v7 setMasksToBounds:0];

    v6->_handleViewStyle = a4;
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 4.0, 19.0);
    lineView = v6->_lineView;
    v6->_lineView = (UIView *)v8;

    v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v6->_lineView setBackgroundColor:v10];

    v11 = [(UIView *)v6->_lineView layer];
    [v11 setCornerRadius:2.0];

    v12 = [(UIView *)v6->_lineView layer];
    [v12 setMasksToBounds:1];

    [(HUQuickControlRingSliderHandleView *)v6 addSubview:v6->_lineView];
    v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    circleLayer = v6->_circleLayer;
    v6->_circleLayer = v13;

    id v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    -[CAShapeLayer setStrokeColor:](v6->_circleLayer, "setStrokeColor:", [v15 CGColor]);

    id v16 = [MEMORY[0x1E4F428B8] systemGrayTintColor];
    -[CAShapeLayer setFillColor:](v6->_circleLayer, "setFillColor:", [v16 CGColor]);

    v17 = [(HUQuickControlRingSliderHandleView *)v6 layer];
    [v17 addSublayer:v6->_circleLayer];

    [(HUQuickControlRingSliderHandleView *)v6 _updateCircleLayer];
  }
  return v6;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlRingSliderHandleView;
  [(HUQuickControlRingSliderHandleView *)&v10 layoutSubviews];
  v3 = [(HUQuickControlRingSliderHandleView *)self lineView];
  objc_msgSend(v3, "setHidden:", -[HUQuickControlRingSliderHandleView handleViewStyle](self, "handleViewStyle") != 2);

  v4 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  objc_msgSend(v4, "setHidden:", -[HUQuickControlRingSliderHandleView handleViewStyle](self, "handleViewStyle") != 1);

  [(HUQuickControlRingSliderHandleView *)self _updateCircleLayer];
  [(HUQuickControlRingSliderHandleView *)self bounds];
  double v6 = v5 * 0.5;
  [(HUQuickControlRingSliderHandleView *)self bounds];
  double v8 = v7 * 0.5;
  v9 = [(HUQuickControlRingSliderHandleView *)self lineView];
  objc_msgSend(v9, "setCenter:", v6, v8);
}

- (void)_setColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v5 setFillColor:v4];
}

- (double)outerRadius
{
  [(HUQuickControlRingSliderHandleView *)self frame];
  double v4 = v3;
  [(HUQuickControlRingSliderHandleView *)self frame];
  if (v4 >= v5) {
    double v4 = v5;
  }
  unint64_t v6 = [(HUQuickControlRingSliderHandleView *)self handleViewStyle];
  if (!v6) {
    return 0.0;
  }
  double result = v4 * 0.5;
  if (v6 == 1) {
    return result + result / 3.0 * 0.5;
  }
  return result;
}

- (void)_updateCircleLayer
{
  [(HUQuickControlRingSliderHandleView *)self frame];
  double v4 = v3;
  [(HUQuickControlRingSliderHandleView *)self frame];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  [(HUQuickControlRingSliderHandleView *)self frame];
  double v9 = v8 * 0.5;
  [(HUQuickControlRingSliderHandleView *)self frame];
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v10 * 0.5, v7, 0.0, 6.28318531);
  id v23 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v23 CGPath];
  v12 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v12 setPath:v11];

  v13 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v13 setLineWidth:v7 / 5.0];

  v14 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  uint64_t v15 = [v14 fillColor];
  id v16 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v16 setStrokeColor:v15];

  v17 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v17 setShadowRadius:v7 * 0.5];

  v18 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  LODWORD(v19) = 1053609165;
  [v18 setShadowOpacity:v19];

  id v20 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
  uint64_t v21 = [v20 CGColor];
  v22 = [(HUQuickControlRingSliderHandleView *)self circleLayer];
  [v22 setShadowColor:v21];
}

- (unint64_t)handleViewStyle
{
  return self->_handleViewStyle;
}

- (void)setHandleViewStyle:(unint64_t)a3
{
  self->_handleViewStyle = a3;
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);

  objc_storeStrong((id *)&self->_lineView, 0);
}

@end