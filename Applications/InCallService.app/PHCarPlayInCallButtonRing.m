@interface PHCarPlayInCallButtonRing
- (BOOL)dimmed;
- (BOOL)highlighted;
- (BOOL)selected;
- (BOOL)toggledOn;
- (CGSize)intrinsicContentSize;
- (UIColor)fillColor;
- (void)drawRect:(CGRect)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setFillColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setToggledOn:(BOOL)a3;
@end

@implementation PHCarPlayInCallButtonRing

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);

  [(PHCarPlayInCallButtonRing *)self setNeedsDisplay];
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    if (a3) {
      +[UIColor dynamicCarQuaternaryColor];
    }
    else {
    v4 = +[UIColor dynamicCarTertiaryColor];
    }
    [(PHCarPlayInCallButtonRing *)self setFillColor:v4];

    [(PHCarPlayInCallButtonRing *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(PHCarPlayInCallButtonRing *)self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  [(PHCarPlayInCallButtonRing *)self setNeedsDisplay];
}

- (void)setToggledOn:(BOOL)a3
{
  self->_toggledOn = a3;
  if (a3) {
    +[UIColor dynamicCarPrimaryColor];
  }
  else {
  v4 = +[UIColor dynamicCarTertiaryColor];
  }
  [(PHCarPlayInCallButtonRing *)self setFillColor:v4];

  [(PHCarPlayInCallButtonRing *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  v5 = +[UIColor whiteColor];
  [v5 setStroke];

  v6 = [(PHCarPlayInCallButtonRing *)self fillColor];

  unsigned int v7 = [(PHCarPlayInCallButtonRing *)self highlighted];
  unsigned int v8 = v7;
  if (v6)
  {
    v9 = [(PHCarPlayInCallButtonRing *)self fillColor];
    v10 = v9;
    if (v8)
    {
      v11 = [v9 colorWithAlphaComponent:0.5];
      [v11 set];
    }
    else
    {
      [v9 set];
    }

    if ([(PHCarPlayInCallButtonRing *)self selected])
    {
      CGContextSetLineWidth(CurrentContext, 0.0);
      v26.size.width = 42.0;
      v26.origin.x = 6.0;
      v26.origin.y = 6.0;
      v26.size.height = 42.0;
      CGContextFillEllipseInRect(CurrentContext, v26);
      v13 = +[UIColor clearColor];
      [v13 set];

      v14 = +[UIColor dynamicCarFocusedColor];
      [v14 setStroke];

      CGContextSetLineWidth(CurrentContext, 3.0);
      uint64_t v15 = 0x4048800000000000;
      double v16 = 2.5;
      double v17 = 2.5;
LABEL_19:
      uint64_t v24 = v15;
      CGContextStrokeEllipseInRect(CurrentContext, *(CGRect *)&v16);
      return;
    }
  }
  else
  {
    if (v7)
    {
      v12 = +[UIColor dynamicCarQuaternaryColor];
    }
    else
    {
      if (![(PHCarPlayInCallButtonRing *)self selected])
      {
        if ([(PHCarPlayInCallButtonRing *)self dimmed]) {
          +[UIColor lightGrayColor];
        }
        else {
        v23 = +[UIColor dynamicCarQuaternaryColor];
        }
        [v23 set];

        uint64_t v15 = 0x404A000000000000;
        double v16 = 1.0;
        double v17 = 1.0;
        goto LABEL_19;
      }
      v12 = +[UIColor dynamicCarFocusedColor];
    }
    v18 = v12;
    [v12 set];
  }
  uint64_t v19 = 0x404A000000000000;
  double v20 = 1.0;
  double v21 = 1.0;
  uint64_t v22 = 0x404A000000000000;

  CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v20);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 54.0;
  double v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)toggledOn
{
  return self->_toggledOn;
}

- (void).cxx_destruct
{
}

@end