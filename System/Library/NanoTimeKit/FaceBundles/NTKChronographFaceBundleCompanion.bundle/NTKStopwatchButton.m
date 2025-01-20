@interface NTKStopwatchButton
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NTKStopwatchButton)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (UIColor)glyphBackgroundColor;
- (UIColor)glyphColor;
- (UIEdgeInsets)touchEdgeInsets;
- (void)layoutSubviews;
- (void)setGlyphBackgroundColor:(id)a3;
- (void)setGlyphColor:(id)a3;
- (void)setTouchEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation NTKStopwatchButton

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKStopwatchButton;
  BOOL v5 = [(NTKStopwatchButton *)&v9 beginTrackingWithTouch:a3 withEvent:a4];
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_B870;
    v8[3] = &unk_1C7B0;
    v8[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_B8C4;
    v7[3] = &unk_1C8A8;
    v7[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v8 options:v7 animations:0.2 completion:0.0];
  }
  return v5;
}

- (NTKStopwatchButton)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NTKStopwatchButton;
  v11 = -[NTKStopwatchButton initWithFrame:](&v23, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    v13 = (UIView *)objc_alloc_init((Class)UIView);
    innerView = v12->_innerView;
    v12->_innerView = v13;

    [(UIView *)v12->_innerView setUserInteractionEnabled:0];
    v15 = v12->_innerView;
    v16 = +[UIColor colorWithWhite:0.149019608 alpha:1.0];
    [(UIView *)v15 setBackgroundColor:v16];

    [(NTKStopwatchButton *)v12 addSubview:v12->_innerView];
    v17 = +[UIImage systemImageNamed:@"stopwatch.fill"];
    v18 = [v17 _imageThatSuppressesAccessibilityHairlineThickening];
    v19 = (CLKUIColoringImageView *)[objc_alloc((Class)CLKUIColoringImageView) initWithImage:v18];
    glyphView = v12->_glyphView;
    v12->_glyphView = v19;

    v21 = +[UIColor colorWithWhite:0.541176471 alpha:1.0];
    [(CLKUIColoringImageView *)v12->_glyphView setColor:v21];

    [(UIView *)v12->_innerView addSubview:v12->_glyphView];
  }

  return v12;
}

- (void)setGlyphColor:(id)a3
{
  p_glyphColor = &self->_glyphColor;
  id v6 = a3;
  if (([v6 isEqual:*p_glyphColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphColor, a3);
    [(CLKUIColoringImageView *)self->_glyphView setColor:*p_glyphColor];
  }
}

- (void)setGlyphBackgroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_glyphBackgroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphBackgroundColor, a3);
    [(UIView *)self->_innerView setBackgroundColor:v5];
  }
}

- (void)layoutSubviews
{
  [(NTKStopwatchButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CLKRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  [(CLKDevice *)self->_device screenScale];
  -[UIView setCenter:](self->_innerView, "setCenter:", v12, v14);
  -[UIView setBounds:](self->_innerView, "setBounds:", v4, v6, v8, v10);
  v15 = [(UIView *)self->_innerView layer];
  [v15 setCornerRadius:v10 * 0.5];

  [(CLKUIColoringImageView *)self->_glyphView sizeToFit];
  [(CLKUIColoringImageView *)self->_glyphView frame];
  CLKRectCenteredIntegralRectForDevice();
  glyphView = self->_glyphView;

  -[CLKUIColoringImageView setFrame:](glyphView, "setFrame:");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKStopwatchButton *)self bounds];
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchEdgeInsets.right);
  double v16 = v15 - (top + self->_touchEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top = self->_touchEdgeInsets.top;
  double left = self->_touchEdgeInsets.left;
  double bottom = self->_touchEdgeInsets.bottom;
  double right = self->_touchEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_innerView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end