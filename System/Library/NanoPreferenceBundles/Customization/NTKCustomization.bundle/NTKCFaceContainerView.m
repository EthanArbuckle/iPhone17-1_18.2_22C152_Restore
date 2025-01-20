@interface NTKCFaceContainerView
+ (CGSize)faceSizeForSize:(CGSize)a3 style:(int64_t)a4;
+ (CGSize)sizeForFaceSize:(CGSize)a3 style:(int64_t)a4;
+ (double)_insetPaddingForStyle:(int64_t)a3;
- (BOOL)active;
- (CAShapeLayer)outline;
- (CGAffineTransform)_transformForFaceView;
- (CGSize)faceSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKCFaceContainerView)initWithFaceSize:(CGSize)a3 style:(int64_t)a4;
- (UIView)backgroundView;
- (UIView)faceContainer;
- (UIView)faceView;
- (UIView)highlightView;
- (double)_outlineLineWidth;
- (int64_t)style;
- (void)_updateOutlineColor;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setFaceContainer:(id)a3;
- (void)setFaceSize:(CGSize)a3;
- (void)setFaceView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOutline:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation NTKCFaceContainerView

+ (CGSize)faceSizeForSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [a1 _insetPaddingForStyle:a4];
  CGFloat v7 = v6;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v12 = CGRectInset(v11, v7, v7);
  double v8 = v12.size.width;
  double v9 = v12.size.height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

+ (double)_insetPaddingForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    sub_5F3C((uint64_t)v6);
    double v3 = *(double *)v6;
    double v4 = *(double *)&v6[1];
  }
  else if (a3 == 1)
  {
    sub_5F3C((uint64_t)v7);
    double v3 = v8;
    double v4 = v9;
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.0;
    if (!a3)
    {
      sub_5F3C((uint64_t)v10);
      double v3 = v11;
      double v4 = v12;
    }
  }
  return v3 + v4;
}

- (NTKCFaceContainerView)initWithFaceSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_msgSend((id)objc_opt_class(), "sizeForFaceSize:style:", a4, a3.width, a3.height);
  v30.receiver = self;
  v30.super_class = (Class)NTKCFaceContainerView;
  v10 = -[NTKCFaceContainerView initWithFrame:](&v30, "initWithFrame:", 0.0, 0.0, v8, v9);
  double v11 = v10;
  if (v10)
  {
    [(NTKCFaceContainerView *)v10 setStyle:a4];
    v11->_faceSize.CGFloat width = width;
    v11->_faceSize.CGFloat height = height;
    double v12 = objc_opt_new();
    [(NTKCFaceContainerView *)v11 setBackgroundView:v12];

    v13 = +[UIColor blackColor];
    [(UIView *)v11->_backgroundView setBackgroundColor:v13];

    [(NTKCFaceContainerView *)v11 addSubview:v11->_backgroundView];
    id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v11->_faceSize.width, v11->_faceSize.height);
    [(NTKCFaceContainerView *)v11 setFaceContainer:v14];

    [(NTKCFaceContainerView *)v11 addSubview:v11->_faceContainer];
    [(NTKCFaceContainerView *)v11 _outlineLineWidth];
    double v16 = v15;
    v17 = +[CAShapeLayer layer];
    [(NTKCFaceContainerView *)v11 setOutline:v17];

    CFStringRef v31 = @"strokeColor";
    v18 = +[NSNull null];
    v32 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [(CAShapeLayer *)v11->_outline setActions:v19];

    id v20 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](v11->_outline, "setFillColor:", [v20 CGColor]);

    [(CAShapeLayer *)v11->_outline setLineWidth:v16];
    v21 = [(NTKCFaceContainerView *)v11 layer];
    [v21 addSublayer:v11->_outline];

    [(NTKCFaceContainerView *)v11 _updateOutlineColor];
    v22 = objc_opt_new();
    [(NTKCFaceContainerView *)v11 setHighlightView:v22];

    v23 = +[UIColor labelColor];
    v24 = [v23 colorWithAlphaComponent:0.23];
    [(UIView *)v11->_highlightView setBackgroundColor:v24];

    [(UIView *)v11->_highlightView setAlpha:0.0];
    [(NTKCFaceContainerView *)v11 addSubview:v11->_highlightView];
    [(NTKCFaceContainerView *)v11 setUserInteractionEnabled:0];
    LODWORD(v25) = 1148846080;
    [(NTKCFaceContainerView *)v11 setContentCompressionResistancePriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(NTKCFaceContainerView *)v11 setContentCompressionResistancePriority:1 forAxis:v26];
    LODWORD(v27) = 1148846080;
    [(NTKCFaceContainerView *)v11 setContentHuggingPriority:0 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [(NTKCFaceContainerView *)v11 setContentHuggingPriority:1 forAxis:v28];
  }
  return v11;
}

- (void)setFaceView:(id)a3
{
  id v5 = a3;
  p_faceView = &self->_faceView;
  CGFloat v7 = [(UIView *)self->_faceView superview];
  unsigned int v8 = [v7 isEqual:self->_faceContainer];

  if (v8)
  {
    [(UIView *)*p_faceView removeFromSuperview];
    double v9 = *p_faceView;
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13[1] = v10;
    v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(UIView *)v9 setTransform:v13];
  }
  objc_storeStrong((id *)&self->_faceView, a3);
  if (*p_faceView)
  {
    [(NTKCFaceContainerView *)self _transformForFaceView];
    double v11 = *p_faceView;
    v12[0] = v12[3];
    v12[1] = v12[4];
    v12[2] = v12[5];
    [(UIView *)v11 setTransform:v12];
    [(UIView *)self->_faceContainer addSubview:*p_faceView];
    [(NTKCFaceContainerView *)self setNeedsLayout];
  }
}

- (void)setFaceSize:(CGSize)a3
{
  if (a3.width != self->_faceSize.width || a3.height != self->_faceSize.height)
  {
    self->_faceSize = a3;
    -[UIView setBounds:](self->_faceContainer, "setBounds:", 0.0, 0.0);
    [(NTKCFaceContainerView *)self _transformForFaceView];
    faceView = self->_faceView;
    v6[0] = v6[3];
    v6[1] = v6[4];
    v6[2] = v6[5];
    [(UIView *)faceView setTransform:v6];
    [(NTKCFaceContainerView *)self sizeToFit];
  }
}

- (CGAffineTransform)_transformForFaceView
{
  [(UIView *)self->_faceView bounds];
  CGFloat v6 = v5;
  CGFloat rect = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(UIView *)self->_faceContainer bounds];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double rect_8 = CGRectGetWidth(v26);
  v27.origin.CGFloat x = v6;
  v27.origin.CGFloat y = v8;
  v27.size.CGFloat width = v10;
  v27.size.CGFloat height = v12;
  double v17 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v18 = CGRectGetHeight(v28);
  v29.origin.CGFloat x = rect;
  v29.origin.CGFloat y = v8;
  v29.size.CGFloat width = v10;
  v29.size.CGFloat height = v12;
  double v19 = CGRectGetHeight(v29);
  double v20 = 1.0;
  if (rect_8 != 0.0 && v17 != 0.0 && v18 != 0.0 && v19 != 0.0)
  {
    double v20 = rect_8 / v17;
    double v21 = v18 / v19;
    if (rect_8 / v17 >= v21) {
      double v20 = v21;
    }
  }

  return CGAffineTransformMakeScale(retstr, v20, v20);
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    NTKCOutlineColor();
    id v4 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setStrokeColor:](self->_outline, "setStrokeColor:", [v4 CGColor]);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKCFaceContainerView;
  -[NTKCFaceContainerView setHighlighted:](&v8, "setHighlighted:");
  double v5 = 0.2;
  v6[1] = 3221225472;
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_142B4;
  v6[3] = &unk_24EF0;
  if (v3) {
    double v5 = 0.0;
  }
  v6[4] = self;
  BOOL v7 = v3;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v4 = objc_opt_class();
  int64_t style = self->_style;
  double width = self->_faceSize.width;
  double height = self->_faceSize.height;

  objc_msgSend(v4, "sizeForFaceSize:style:", style, width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[NTKCFaceContainerView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  [(NTKCFaceContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v11 = sub_5F3C((uint64_t)v35);
  double v12 = v36;
  double height = self->_faceSize.height;
  id v14 = +[CLKDevice currentDevice];
  [v14 screenBounds];
  double v15 = v12 * (height / CGRectGetHeight(v38));

  double v16 = +[CLKDevice currentDevice];
  [v16 screenBounds];
  double v32 = v12 / CGRectGetHeight(v39);

  [(NTKCFaceContainerView *)self _outlineLineWidth];
  CGFloat v18 = v17 * 0.5;
  double v19 = v4;
  v40.origin.double x = v4;
  double v33 = v6;
  v40.origin.double y = v6;
  double v34 = v8;
  v40.size.double width = v8;
  v40.size.double height = v10;
  CGRect v41 = CGRectInset(v40, v18, v18);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double v23 = v41.size.height;
  v24 = +[CLKDevice currentDevice];
  double v25 = (char *)[v24 deviceCategory];

  if ((unint64_t)(v25 - 3) >= 3)
  {
    if (v25 == (unsigned char *)&dword_0 + 2)
    {
      v43.origin.double x = x;
      v43.origin.double y = y;
      v43.size.double width = width;
      v43.size.double height = v23;
      double v12 = v32 * CGRectGetHeight(v43) * 1.25;
    }
  }
  else
  {
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = v23;
    double v12 = v15 + (CGRectGetHeight(v42) - self->_faceSize.height) * 0.5;
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, v23);
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v12];
  [(NTKCFaceContainerView *)self _setContinuousCornerRadius:v12];
  [(CAShapeLayer *)self->_outline frame];
  v47.origin.double x = v19;
  v47.origin.double y = v33;
  v47.size.double width = v34;
  v47.size.double height = v10;
  if (!CGRectEqualToRect(v44, v47))
  {
    CGRect v26 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, v23, v12);
    -[CAShapeLayer setFrame:](self->_outline, "setFrame:", v19, v33, v34, v10);
    id v27 = v26;
    -[CAShapeLayer setPath:](self->_outline, "setPath:", [v27 CGPath]);
  }
  [(UIView *)self->_faceContainer frame];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->_faceContainer setFrame:0];
  [(UIView *)self->_faceView frame];
  [(UIView *)self->_faceContainer bounds];
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->_faceView setFrame:0];
  -[UIView setFrame:](self->_highlightView, "setFrame:", v19, v33, v34, v10);
  CGRect v28 = +[CLKDevice currentDevice];
  CGRect v29 = (char *)[v28 deviceCategory];

  if ((unint64_t)(v29 - 3) >= 3)
  {
    double v30 = v12;
    if (v29 == (unsigned char *)&dword_0 + 2)
    {
      [(UIView *)self->_highlightView frame];
      double v30 = v32 * CGRectGetHeight(v46) * 1.25;
    }
  }
  else
  {
    [(UIView *)self->_highlightView frame];
    double v30 = v15 + (CGRectGetHeight(v45) - self->_faceSize.height) * 0.5;
  }
  highlightView = self->_highlightView;

  [(UIView *)highlightView _setContinuousCornerRadius:v30];
}

- (double)_outlineLineWidth
{
  int64_t style = self->_style;
  if (style == 2)
  {
    sub_5F3C((uint64_t)v4);
    return v5;
  }
  else if (style == 1)
  {
    sub_5F3C((uint64_t)v6);
    return v7;
  }
  else
  {
    double result = 0.0;
    if (!style)
    {
      sub_5F3C((uint64_t)v8);
      return v9;
    }
  }
  return result;
}

- (void)_updateOutlineColor
{
  NTKCOutlineColor();
  id v3 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setStrokeColor:](self->_outline, "setStrokeColor:", [v3 CGColor]);
}

+ (CGSize)sizeForFaceSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [a1 _insetPaddingForStyle:a4];
  CGFloat v7 = -v6;
  v11.origin.double x = 0.0;
  v11.origin.double y = 0.0;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRect v12 = CGRectInset(v11, v7, v7);
  double v8 = v12.size.width;
  double v9 = v12.size.height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)faceSize
{
  double width = self->_faceSize.width;
  double height = self->_faceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (UIView)faceView
{
  return self->_faceView;
}

- (BOOL)active
{
  return self->_active;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (CAShapeLayer)outline
{
  return self->_outline;
}

- (void)setOutline:(id)a3
{
}

- (UIView)faceContainer
{
  return self->_faceContainer;
}

- (void)setFaceContainer:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_faceContainer, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_faceView, 0);
}

@end