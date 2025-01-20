@interface MKViewWithHairline
- (BOOL)isBottomHairlineHidden;
- (BOOL)isTopHairlineHidden;
- (MKViewWithHairline)initWithFrame:(CGRect)a3;
- (UIColor)hairlineColor;
- (double)leftHairlineInset;
- (double)rightHairlineInset;
- (void)layoutSubviews;
- (void)setBottomHairlineHidden:(BOOL)a3;
- (void)setHairlineColor:(id)a3;
- (void)setLeftHairlineInset:(double)a3;
- (void)setRightHairlineInset:(double)a3;
- (void)setTopHairlineHidden:(BOOL)a3;
@end

@implementation MKViewWithHairline

- (MKViewWithHairline)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MKViewWithHairline;
  v3 = -[MKViewWithHairline initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MKHairlineView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[MKHairlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    bottomHairline = v3->_bottomHairline;
    v3->_bottomHairline = (MKHairlineView *)v9;

    [(MKHairlineView *)v3->_bottomHairline setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKViewWithHairline *)v3 addSubview:v3->_bottomHairline];
    v11 = -[MKHairlineView initWithFrame:]([MKHairlineView alloc], "initWithFrame:", v5, v6, v7, v8);
    topHairline = v3->_topHairline;
    v3->_topHairline = v11;

    [(MKHairlineView *)v3->_topHairline setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKHairlineView *)v3->_topHairline setHidden:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  if (![(MKHairlineView *)self->_topHairline isHidden]
    || ([(MKHairlineView *)self->_bottomHairline isHidden] & 1) == 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)MKViewWithHairline;
    [(MKViewWithHairline *)&v31 layoutSubviews];
    [(MKViewWithHairline *)self bounds];
    double v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    v11 = [(MKViewWithHairline *)self window];
    v12 = [v11 screen];
    v13 = v12;
    if (v12)
    {
      [v12 nativeScale];
      double v15 = v14;
    }
    else
    {
      v16 = [MEMORY[0x1E4F42D90] mainScreen];
      [v16 nativeScale];
      double v15 = v17;
    }
    double v18 = 1.0 / v15;
    if (([(MKHairlineView *)self->_bottomHairline isHidden] & 1) == 0)
    {
      [(MKViewWithHairline *)self leftHairlineInset];
      double v20 = v4 + v19;
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      CGFloat v21 = CGRectGetMaxY(v32) - v18;
      [(MKViewWithHairline *)self leftHairlineInset];
      double v23 = v8 - v22;
      [(MKViewWithHairline *)self rightHairlineInset];
      -[MKHairlineView setFrame:](self->_bottomHairline, "setFrame:", v20, v21, v23 - v24, v18);
    }
    if (([(MKHairlineView *)self->_topHairline isHidden] & 1) == 0)
    {
      [(MKViewWithHairline *)self leftHairlineInset];
      double v26 = v4 + v25;
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      double MinY = CGRectGetMinY(v33);
      [(MKViewWithHairline *)self leftHairlineInset];
      double v29 = v8 - v28;
      [(MKViewWithHairline *)self rightHairlineInset];
      -[MKHairlineView setFrame:](self->_topHairline, "setFrame:", v26, MinY, v29 - v30, v18);
    }
  }
}

- (double)leftHairlineInset
{
  return self->_leftHairlineInset;
}

- (double)rightHairlineInset
{
  return self->_rightHairlineInset;
}

- (void)setTopHairlineHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKHairlineView setHidden:](self->_topHairline, "setHidden:");
  topHairline = self->_topHairline;
  if (v3)
  {
    CGFloat v6 = self->_topHairline;
    [(MKHairlineView *)v6 removeFromSuperview];
  }
  else
  {
    [(MKViewWithHairline *)self addSubview:topHairline];
  }
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKHairlineView setHidden:](self->_bottomHairline, "setHidden:");
  bottomHairline = self->_bottomHairline;
  if (v3)
  {
    CGFloat v6 = self->_bottomHairline;
    [(MKHairlineView *)v6 removeFromSuperview];
  }
  else
  {
    [(MKViewWithHairline *)self addSubview:bottomHairline];
  }
}

- (void)setHairlineColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_hairlineColor = &self->_hairlineColor;
  if (self->_hairlineColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_hairlineColor, a3);
    [(MKHairlineView *)self->_topHairline setFillColor:*p_hairlineColor];
    [(MKHairlineView *)self->_bottomHairline setFillColor:*p_hairlineColor];
    double v5 = v7;
  }
}

- (void)setLeftHairlineInset:(double)a3
{
  if (self->_leftHairlineInset != a3)
  {
    self->_leftHairlineInset = a3;
    [(UIView *)self _mapkit_setNeedsLayout];
  }
}

- (void)setRightHairlineInset:(double)a3
{
  if (self->_rightHairlineInset != a3)
  {
    self->_rightHairlineInset = a3;
    [(UIView *)self _mapkit_setNeedsLayout];
  }
}

- (BOOL)isTopHairlineHidden
{
  return [(MKHairlineView *)self->_topHairline isHidden];
}

- (BOOL)isBottomHairlineHidden
{
  return [(MKHairlineView *)self->_bottomHairline isHidden];
}

- (UIColor)hairlineColor
{
  return self->_hairlineColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColor, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);

  objc_storeStrong((id *)&self->_bottomHairline, 0);
}

@end