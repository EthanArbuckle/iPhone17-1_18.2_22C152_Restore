@interface SBHorizontalScrollFailureTriangleView
- (SBHorizontalScrollFailureTriangleView)initWithStyle:(int)a3 recognizer:(id)a4 forPoint:(CGPoint)a5 withMaxVerticalOffset:(double)a6 inView:(id)a7 pointingRight:(BOOL)a8;
- (UIColor)contentColor;
- (void)drawRect:(CGRect)a3;
- (void)setContentColor:(id)a3;
@end

@implementation SBHorizontalScrollFailureTriangleView

- (SBHorizontalScrollFailureTriangleView)initWithStyle:(int)a3 recognizer:(id)a4 forPoint:(CGPoint)a5 withMaxVerticalOffset:(double)a6 inView:(id)a7 pointingRight:(BOOL)a8
{
  double y = a5.y;
  double x = a5.x;
  id v15 = a4;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)SBHorizontalScrollFailureTriangleView;
  v17 = -[SBHorizontalScrollFailureTriangleView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v18 = v17;
  if (v17)
  {
    v17->_style = a3;
    v17->_pointingRight = a8;
    [v16 bounds];
    if (v18->_pointingRight) {
      double v20 = v19 - x;
    }
    else {
      double v20 = x;
    }
    double v21 = 0.0;
    if (!v18->_pointingRight) {
      double v21 = x;
    }
    double v22 = x - v21;
    if (v18->_style)
    {
      [v15 _effectiveBottomAngle];
      double v24 = v20 * tan(v23 * 0.0174532925);
      double v25 = y + a6;
    }
    else
    {
      [v15 _effectiveTopAngle];
      double v24 = v20 * tan(v26 * 0.0174532925);
      double v25 = y - a6 - v24;
    }
    -[SBHorizontalScrollFailureTriangleView setFrame:](v18, "setFrame:", v22, v25, v20, v24);
    v27 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBHorizontalScrollFailureTriangleView *)v18 setBackgroundColor:v27];

    v28 = [MEMORY[0x1E4F428B8] yellowColor];
    [(SBHorizontalScrollFailureTriangleView *)v18 setContentColor:v28];
  }
  return v18;
}

- (void)drawRect:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL pointingRight = self->_pointingRight;
  id v20 = v4;
  if (self->_style)
  {
    if (self->_pointingRight)
    {
      double v6 = 0.0;
LABEL_6:
      objc_msgSend(v4, "moveToPoint:", 0.0, v6);
      [(SBHorizontalScrollFailureTriangleView *)self bounds];
      double v10 = v9;
      [(SBHorizontalScrollFailureTriangleView *)self bounds];
      objc_msgSend(v20, "addLineToPoint:", v10, v11);
      [(SBHorizontalScrollFailureTriangleView *)self bounds];
      double v13 = v12;
      goto LABEL_10;
    }
    [(SBHorizontalScrollFailureTriangleView *)self bounds];
    double v13 = 0.0;
    objc_msgSend(v20, "moveToPoint:", v14, 0.0);
    [(SBHorizontalScrollFailureTriangleView *)self bounds];
    double v16 = v15;
  }
  else
  {
    [(SBHorizontalScrollFailureTriangleView *)self bounds];
    if (pointingRight)
    {
      v4 = v20;
      double v6 = v8;
      goto LABEL_6;
    }
    double v17 = v7;
    [(SBHorizontalScrollFailureTriangleView *)self bounds];
    objc_msgSend(v20, "moveToPoint:", v17, v18);
    [(SBHorizontalScrollFailureTriangleView *)self bounds];
    double v16 = v19;
    double v13 = 0.0;
  }
  objc_msgSend(v20, "addLineToPoint:", 0.0, v16);
LABEL_10:
  objc_msgSend(v20, "addLineToPoint:", v13, 0.0);
  [v20 closePath];
  [(UIColor *)self->_contentColor setFill];
  [v20 fill];
}

- (void)setContentColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_contentColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentColor, a3);
    [(SBHorizontalScrollFailureTriangleView *)self setNeedsDisplay];
  }
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void).cxx_destruct
{
}

@end