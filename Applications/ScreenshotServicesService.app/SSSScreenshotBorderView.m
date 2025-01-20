@interface SSSScreenshotBorderView
- (CGRect)extent;
- (CGRect)unitRectForContent;
- (SSSScreenshotBorderView)initWithFrame:(CGRect)a3;
- (double)geometryMultiplier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)borderStyle;
- (void)layoutSubviews;
- (void)setBorderStyle:(int64_t)a3;
- (void)setGeometryMultiplier:(double)a3;
- (void)setUnitRectForContent:(CGRect)a3;
@end

@implementation SSSScreenshotBorderView

- (SSSScreenshotBorderView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SSSScreenshotBorderView;
  v3 = -[SSSScreenshotBorderView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3->_geometryMultiplier = 1.0;
  uint64_t v4 = objc_opt_new();
  outerHairlineView = v3->_outerHairlineView;
  v3->_outerHairlineView = (_SSSAnimatableBorderCornerRadiusView *)v4;

  uint64_t v6 = objc_opt_new();
  thickBorderView = v3->_thickBorderView;
  v3->_thickBorderView = (_SSSAnimatableBorderCornerRadiusView *)v6;

  uint64_t v8 = objc_opt_new();
  innerHairlineView = v3->_innerHairlineView;
  v3->_innerHairlineView = (_SSSAnimatableBorderCornerRadiusView *)v8;

  v3->_unitRectForContent.origin.x = 0.0;
  v3->_unitRectForContent.origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v3->_unitRectForContent.size = _Q0;
  [(SSSScreenshotBorderView *)v3 addSubview:v3->_outerHairlineView];
  [(SSSScreenshotBorderView *)v3 addSubview:v3->_thickBorderView];
  [(SSSScreenshotBorderView *)v3 addSubview:v3->_innerHairlineView];
  return v3;
}

- (void)layoutSubviews
{
  int64_t v3 = [(SSSScreenshotBorderView *)self borderStyle];
  [(SSSScreenshotBorderView *)self bounds];
  if (!CGRectIsEmpty(v43))
  {
    [(SSSScreenshotBorderView *)self geometryMultiplier];
    uint64_t v42 = 0;
    memset(v41, 0, sizeof(v41));
    uint64_t v4 = [(SSSScreenshotBorderView *)self traitCollection];
    sub_10000E15C(v4, (uint64_t)v41);

    [(SSSScreenshotBorderView *)self unitRectForContent];
    if (SSRectIsValid())
    {
      sub_10000E208();
      SSRoundRectToScale();
      uint64_t v33 = v6;
      uint64_t v34 = v5;
      SSRoundRectToScale();
      SSRoundRectToScale();
      UIRectCenteredIntegralRect();
      double v39 = v8;
      double v40 = v7;
      double v37 = v10;
      double v38 = v9;
      UIRectCenteredIntegralRect();
      double v12 = v11;
      double v14 = v13;
      double v35 = v16;
      double v36 = v15;
      UIRectCenteredIntegralRect();
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_outerHairlineView, "setFrame:", v40, v39, v38, v37);
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_thickBorderView, "setFrame:", v12, v14, v36, v35);
      -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_innerHairlineView, "setFrame:", v18, v20, v22, v24);
      if (v3 == 2) {
        double v25 = 0.0;
      }
      else {
        double v25 = 1.0;
      }
      -[_SSSAnimatableBorderCornerRadiusView setAlpha:](self->_outerHairlineView, "setAlpha:", v25, v33, v34);
      [(_SSSAnimatableBorderCornerRadiusView *)self->_thickBorderView setAlpha:v25];
      [(_SSSAnimatableBorderCornerRadiusView *)self->_innerHairlineView setAlpha:v25];
      v26 = +[UIColor colorWithWhite:0.82 alpha:1.0];
      if (v3 == 1) {
        +[UIColor sss_miniatureBorderColor];
      }
      else {
      v27 = +[UIColor clearColor];
      }
      v28 = +[UIColor colorWithWhite:0.65 alpha:1.0];
      [(_SSSAnimatableBorderCornerRadiusView *)self->_outerHairlineView setBackgroundColor:v26];
      [(_SSSAnimatableBorderCornerRadiusView *)self->_thickBorderView setBackgroundColor:v27];
      [(_SSSAnimatableBorderCornerRadiusView *)self->_innerHairlineView setBackgroundColor:v28];
      UIRoundToViewScale();
      double v30 = v29;
      UIRoundToViewScale();
      double v32 = v31;
      UIRoundToViewScale();
      -[_SSSAnimatableBorderCornerRadiusView setCornerRadius:](self->_outerHairlineView, "setCornerRadius:");
      [(_SSSAnimatableBorderCornerRadiusView *)self->_thickBorderView setCornerRadius:v32];
      [(_SSSAnimatableBorderCornerRadiusView *)self->_innerHairlineView setCornerRadius:v30];
    }
  }
}

- (CGRect)extent
{
  [(SSSScreenshotBorderView *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  thickBorderView = self->_thickBorderView;
  v31[0] = self->_outerHairlineView;
  v31[1] = thickBorderView;
  v31[2] = self->_innerHairlineView;
  +[NSArray arrayWithObjects:v31 count:3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v17 bounds];
        -[SSSScreenshotBorderView convertRect:fromView:](self, "convertRect:fromView:", v17);
        v35.origin.CGFloat x = v18;
        v35.origin.CGFloat y = v19;
        v35.size.CGFloat width = v20;
        v35.size.CGFloat height = v21;
        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        CGRect v33 = CGRectUnion(v32, v35);
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)setBorderStyle:(int64_t)a3
{
  if (self->_borderStyle != a3)
  {
    self->_borderStyle = a3;
    [(SSSScreenshotBorderView *)self setNeedsLayout];
    [(SSSScreenshotBorderView *)self layoutIfNeeded];
  }
}

- (void)setGeometryMultiplier:(double)a3
{
  if (self->_geometryMultiplier != a3)
  {
    self->_geometryMultiplier = a3;
    [(SSSScreenshotBorderView *)self setNeedsLayout];
    [(SSSScreenshotBorderView *)self layoutIfNeeded];
  }
}

- (void)setUnitRectForContent:(CGRect)a3
{
  self->_unitRectForContent = a3;
  [(SSSScreenshotBorderView *)self setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SSSScreenshotBorderView;
  -[SSSScreenshotBorderView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  double v5 = (SSSScreenshotBorderView *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (int64_t)borderStyle
{
  return self->_borderStyle;
}

- (double)geometryMultiplier
{
  return self->_geometryMultiplier;
}

- (CGRect)unitRectForContent
{
  double x = self->_unitRectForContent.origin.x;
  double y = self->_unitRectForContent.origin.y;
  double width = self->_unitRectForContent.size.width;
  double height = self->_unitRectForContent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerHairlineView, 0);
  objc_storeStrong((id *)&self->_thickBorderView, 0);

  objc_storeStrong((id *)&self->_outerHairlineView, 0);
}

@end