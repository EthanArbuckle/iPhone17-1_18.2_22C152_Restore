@interface SCATGridView
- (BOOL)isCenterPointVisible;
- (BOOL)shouldIncludeCenterPoint;
- (BOOL)shouldShowGridBorder;
- (BOOL)showsBottomBorder;
- (BOOL)showsLeftBorder;
- (BOOL)showsRightBorder;
- (BOOL)showsTopBorder;
- (CGSize)shadowOffset;
- (SCATGridDelegate)delegate;
- (SCATGridView)initWithFrame:(CGRect)a3;
- (UIColor)lineColor;
- (UIColor)shadowColor;
- (double)_adjustOriginValue:(double)a3 forDistance:(double)a4 maximumEndPosition:(double)a5;
- (double)lineThickness;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_drawLinesInContext:(CGContext *)a3 forRows:(BOOL)a4;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCenterPointVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setLineThickness:(double)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShouldIncludeCenterPoint:(BOOL)a3;
- (void)setShouldShowGridBorder:(BOOL)a3;
- (void)setShowsBottomBorder:(BOOL)a3;
- (void)setShowsLeftBorder:(BOOL)a3;
- (void)setShowsRightBorder:(BOOL)a3;
- (void)setShowsTopBorder:(BOOL)a3;
@end

@implementation SCATGridView

- (SCATGridView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCATGridView;
  v3 = -[SCATGridView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SCATGridView *)v3 setShouldIncludeCenterPoint:1];
    [(SCATGridView *)v4 setOpaque:0];
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    centerPoint = v4->_centerPoint;
    v4->_centerPoint = v5;

    [(SCATGridView *)v4 addSubview:v4->_centerPoint];
    [(UIImageView *)v4->_centerPoint setHidden:1];
    v4->_showsRightBorder = 1;
    v4->_showsLeftBorder = 1;
    v4->_showsBottomBorder = 1;
    v4->_showsTopBorder = 1;
  }
  return v4;
}

- (void)setShouldIncludeCenterPoint:(BOOL)a3
{
  if (self->_shouldIncludeCenterPoint != a3)
  {
    self->_shouldIncludeCenterPoint = a3;
    if (a3 && self->_centerPoint) {
      [(SCATGridView *)self addSubview:self->_centerPoint];
    }
    else {
      [(UIImageView *)self->_centerPoint removeFromSuperview];
    }
  }
}

- (double)_adjustOriginValue:(double)a3 forDistance:(double)a4 maximumEndPosition:(double)a5
{
  double result = 0.0;
  if (a3 >= 0.0)
  {
    double result = a3;
    if (a3 + a4 > a5) {
      return a5 - a4;
    }
  }
  return result;
}

- (void)layoutSubviews
{
  if ([(SCATGridView *)self shouldIncludeCenterPoint])
  {
    [(SCATGridView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(SCATGridView *)self delegate];
    v12 = [v11 centerPointImageForGrid:self];
    [(UIImageView *)self->_centerPoint setImage:v12];

    [(UIImageView *)self->_centerPoint sizeToFit];
    [(UIImageView *)self->_centerPoint frame];
    double v14 = floor(v4 + (v8 - v13) * 0.5);
    centerPoint = self->_centerPoint;
    double v17 = floor(v6 + (v10 - v15) * 0.5);
    -[UIImageView setFrame:](centerPoint, "setFrame:", v14, v17);
  }
}

- (void)setShowsTopBorder:(BOOL)a3
{
  if (self->_showsTopBorder != a3)
  {
    self->_showsTopBorder = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setShowsBottomBorder:(BOOL)a3
{
  if (self->_showsBottomBorder != a3)
  {
    self->_showsBottomBorder = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setShowsLeftBorder:(BOOL)a3
{
  if (self->_showsLeftBorder != a3)
  {
    self->_showsLeftBorder = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setShowsRightBorder:(BOOL)a3
{
  if (self->_showsRightBorder != a3)
  {
    self->_showsRightBorder = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfRows:(unint64_t)a3
{
  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setLineThickness:(double)a3
{
  if (self->_lineThickness != a3)
  {
    self->_lineThickness = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setLineColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_lineColor = &self->_lineColor;
  if (self->_lineColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_lineColor, a3);
    p_lineColor = (UIColor **)[(SCATGridView *)self setNeedsDisplay];
    double v5 = v7;
  }

  _objc_release_x1(p_lineColor, v5);
}

- (void)setShadowColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_shadowColor = &self->_shadowColor;
  if (self->_shadowColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_shadowColor, a3);
    p_shadowColor = (UIColor **)[(SCATGridView *)self setNeedsDisplay];
    double v5 = v7;
  }

  _objc_release_x1(p_shadowColor, v5);
}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    [(SCATGridView *)self setNeedsDisplay];
  }
}

- (void)setCenterPointVisible:(BOOL)a3
{
  if (self->_centerPointVisible != a3)
  {
    self->_centerPointVisible = a3;
    [(UIImageView *)self->_centerPoint setHidden:!a3];
  }
}

- (void)_drawLinesInContext:(CGContext *)a3 forRows:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    unint64_t v6 = [(SCATGridView *)self numberOfRows];
    [(SCATGridView *)self bounds];
    double v8 = v7;
  }
  else
  {
    unint64_t v6 = [(SCATGridView *)self numberOfColumns];
    [(SCATGridView *)self bounds];
    double v8 = v9;
  }
  [(SCATGridView *)self lineThickness];
  double v11 = v10;
  [(SCATGridView *)self bounds];
  double v31 = v12;
  [(SCATGridView *)self bounds];
  double v30 = v13;
  [(SCATGridView *)self bounds];
  double v15 = v14;
  [(SCATGridView *)self bounds];
  if (v6 != -1)
  {
    unint64_t v17 = 0;
    double v32 = v8 / (double)v6;
    double v18 = v11 * -0.5;
    double v19 = v31 + v15;
    double v20 = v30 + v16;
    do
    {
      if (v4)
      {
        unsigned int v21 = [(SCATGridView *)self showsTopBorder];
        if (!v17 && !v21 || ![(SCATGridView *)self showsBottomBorder] && v6 == v17) {
          goto LABEL_18;
        }
        double v22 = v31;
        double v23 = floor(v18 + (double)v17 * v32);
        double v24 = 0.0;
        double v25 = v11;
      }
      else
      {
        unsigned int v26 = [(SCATGridView *)self showsLeftBorder];
        if (!v17 && !v26 || ![(SCATGridView *)self showsRightBorder] && v6 == v17) {
          goto LABEL_18;
        }
        double v24 = floor(v18 + (double)v17 * v32);
        double v23 = 0.0;
        double v22 = v11;
        double v25 = v30;
      }
      [(SCATGridView *)self _adjustOriginValue:v24 forDistance:v22 maximumEndPosition:v19];
      CGFloat v28 = v27;
      [(SCATGridView *)self _adjustOriginValue:v23 forDistance:v25 maximumEndPosition:v20];
      v33.origin.y = v29;
      v33.origin.x = v28;
      v33.size.width = v22;
      v33.size.height = v25;
      UIRectFill(v33);
LABEL_18:
      ++v17;
    }
    while (v6 + 1 != v17);
  }
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  double v5 = [(SCATGridView *)self lineColor];
  [v5 set];

  [(SCATGridView *)self shadowOffset];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = [(SCATGridView *)self shadowColor];
  double v11 = (CGColor *)[v10 CGColor];
  v13.width = v7;
  v13.height = v9;
  CGContextSetShadowWithColor(CurrentContext, v13, 0.0, v11);

  CGContextBeginTransparencyLayer(CurrentContext, 0);
  [(SCATGridView *)self _drawLinesInContext:CurrentContext forRows:1];
  [(SCATGridView *)self _drawLinesInContext:CurrentContext forRows:0];

  CGContextEndTransparencyLayer(CurrentContext);
}

- (SCATGridDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATGridDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)lineThickness
{
  return self->_lineThickness;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)showsTopBorder
{
  return self->_showsTopBorder;
}

- (BOOL)showsLeftBorder
{
  return self->_showsLeftBorder;
}

- (BOOL)showsBottomBorder
{
  return self->_showsBottomBorder;
}

- (BOOL)showsRightBorder
{
  return self->_showsRightBorder;
}

- (BOOL)isCenterPointVisible
{
  return self->_centerPointVisible;
}

- (BOOL)shouldIncludeCenterPoint
{
  return self->_shouldIncludeCenterPoint;
}

- (BOOL)shouldShowGridBorder
{
  return self->_shouldShowGridBorder;
}

- (void)setShouldShowGridBorder:(BOOL)a3
{
  self->_shouldShowGridBorder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_centerPoint, 0);
}

@end