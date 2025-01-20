@interface CCUIContinuousSliderView
- (CCUIContinuousSliderView)initWithFrame:(CGRect)a3;
- (CGPoint)glyphCenter;
- (UIView)valueIndicatorClippingView;
- (double)_length;
- (unint64_t)axis;
- (void)applyInoperativeAppearance:(BOOL)a3;
- (void)layoutElasticContentViews;
- (void)setAxis:(unint64_t)a3;
- (void)setContinuousSliderCornerRadius:(double)a3;
- (void)setValueVisible:(BOOL)a3;
@end

@implementation CCUIContinuousSliderView

- (CCUIContinuousSliderView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CCUIContinuousSliderView;
  v3 = -[CCUIBaseSliderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CCUIContinuousSliderView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = +[CCUIControlCenterMaterialView _lightFillMaterialView];
    backgroundFillView = v4->_backgroundFillView;
    v4->_backgroundFillView = (MTMaterialView *)v13;

    [(MTMaterialView *)v4->_backgroundFillView setUserInteractionEnabled:0];
    -[MTMaterialView setFrame:](v4->_backgroundFillView, "setFrame:", v6, v8, v10, v12);
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v8, v10, v12);
    valueIndicatorClippingView = v4->_valueIndicatorClippingView;
    v4->_valueIndicatorClippingView = (UIView *)v15;

    [(UIView *)v4->_valueIndicatorClippingView setUserInteractionEnabled:0];
    [(UIView *)v4->_valueIndicatorClippingView setClipsToBounds:1];
    [(UIView *)v4->_valueIndicatorClippingView addSubview:v4->_backgroundFillView];
    v17 = [(CCUIBaseSliderView *)v4 glyphContainerView];
    [v17 addSubview:v4->_valueIndicatorClippingView];

    v4->_axis = 2;
  }
  return v4;
}

- (void)setAxis:(unint64_t)a3
{
  unint64_t v3 = 2;
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL) {
    unint64_t v3 = a3;
  }
  if (v3 != self->_axis)
  {
    self->_axis = v3;
    [(CCUIContinuousSliderView *)self setNeedsLayout];
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView setContinuousSliderCornerRadius:](&v5, sel_setContinuousSliderCornerRadius_);
  [(MTMaterialView *)self->_backgroundFillView _setContinuousCornerRadius:a3];
}

- (void)setValueVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView setValueVisible:](&v6, sel_setValueVisible_);
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [(UIView *)self->_valueIndicatorClippingView setAlpha:v5];
}

- (void)applyInoperativeAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView applyInoperativeAppearance:](&v5, sel_applyInoperativeAppearance_);
  [(MTMaterialView *)self->_backgroundFillView setHasInoperativeAppearance:v3];
}

- (void)layoutElasticContentViews
{
  v19.receiver = self;
  v19.super_class = (Class)CCUIContinuousSliderView;
  [(CCUIBaseSliderView *)&v19 layoutElasticContentViews];
  [(CCUIBaseSliderView *)self presentationLayoutValue];
  double v4 = v3;
  objc_super v5 = [(CCUIBaseSliderView *)self elasticContentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  unint64_t v10 = [(CCUIContinuousSliderView *)self axis];
  if (v10 == 2) {
    double v11 = v9;
  }
  else {
    double v11 = v7;
  }
  double v12 = [(CCUIContinuousSliderView *)self traitCollection];
  [v12 displayScale];

  double v13 = v4 * v11;
  if ([(CCUIBaseSliderView *)self shouldIntegralizeValueLayout])
  {
    UIRoundToScale();
    double v13 = v14;
  }
  if (v10 == 2)
  {
    double v15 = 0.0;
    double v16 = -(v9 - v13);
    double v17 = 0.0;
  }
  else
  {
    uint64_t v18 = [(CCUIContinuousSliderView *)self effectiveUserInterfaceLayoutDirection];
    double v17 = v7 - v13;
    if (v18 == 1) {
      double v15 = -(v7 - v13);
    }
    else {
      double v15 = 0.0;
    }
    double v16 = 0.0;
    if (v18 != 1) {
      double v17 = 0.0;
    }
  }
  [(UIView *)self->_valueIndicatorClippingView setFrame:v17];
  -[MTMaterialView setFrame:](self->_backgroundFillView, "setFrame:", v15, v16, v7, v9);
}

- (CGPoint)glyphCenter
{
  double v3 = [(CCUIBaseSliderView *)self glyphContainerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(CCUIContinuousSliderView *)self axis] == 2)
  {
    double v8 = v5 * 0.5;
    double v9 = v7 - v8;
  }
  else
  {
    if ([(CCUIContinuousSliderView *)self effectiveUserInterfaceLayoutDirection] == 1)double v8 = v5 + v7 * -0.65; {
    else
    }
      double v8 = v7 * 0.65;
    double v9 = v7 * 0.5;
  }
  if ([(CCUIBaseSliderView *)self shouldIntegralizeContentLayout])
  {
    unint64_t v10 = [(CCUIContinuousSliderView *)self traitCollection];
    [v10 displayScale];
    UIPointRoundToScale();
    double v8 = v11;
    double v9 = v12;
  }
  double v13 = v8;
  double v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)_length
{
  [(CCUIContinuousSliderView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = [(CCUIContinuousSliderView *)self axis];
  uint64_t v12 = v4;
  uint64_t v13 = v6;
  uint64_t v14 = v8;
  uint64_t v15 = v10;
  if (v11 == 2)
  {
    return CGRectGetHeight(*(CGRect *)&v12);
  }
  else
  {
    return CGRectGetWidth(*(CGRect *)&v12);
  }
}

- (unint64_t)axis
{
  return self->_axis;
}

- (UIView)valueIndicatorClippingView
{
  return self->_valueIndicatorClippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueIndicatorClippingView, 0);
  objc_storeStrong((id *)&self->_backgroundFillView, 0);
}

@end