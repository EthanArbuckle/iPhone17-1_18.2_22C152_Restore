@interface SCATOutlineLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)outlineColor;
- (double)outlineThickness;
- (void)drawTextInRect:(CGRect)a3;
- (void)setOutlineColor:(id)a3;
- (void)setOutlineThickness:(double)a3;
@end

@implementation SCATOutlineLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v9 = [(SCATOutlineLabel *)self outlineColor];
  [v9 alphaComponent];
  CGContextSetAlpha(CurrentContext, v10);

  v11 = [(SCATOutlineLabel *)self outlineColor];
  v12 = [v11 colorWithAlphaComponent:1.0];

  CGContextBeginTransparencyLayer(CurrentContext, 0);
  CGContextSetTextDrawingMode(CurrentContext, kCGTextStroke);
  [(SCATOutlineLabel *)self outlineThickness];
  CGContextSetLineWidth(CurrentContext, v13 + v13);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  if ([(SCATOutlineLabel *)self isHighlighted])
  {
    v14 = [(SCATOutlineLabel *)self highlightedTextColor];
    [(SCATOutlineLabel *)self setHighlightedTextColor:v12];
  }
  else
  {
    v14 = [(SCATOutlineLabel *)self textColor];
    [(SCATOutlineLabel *)self setTextColor:v12];
  }
  v16.receiver = self;
  v16.super_class = (Class)SCATOutlineLabel;
  -[SCATOutlineLabel drawTextInRect:](&v16, "drawTextInRect:", x, y, width, height);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextRestoreGState(CurrentContext);
  if ([(SCATOutlineLabel *)self isHighlighted]) {
    [(SCATOutlineLabel *)self setHighlightedTextColor:v14];
  }
  else {
    [(SCATOutlineLabel *)self setTextColor:v14];
  }
  v15.receiver = self;
  v15.super_class = (Class)SCATOutlineLabel;
  -[SCATOutlineLabel drawTextInRect:](&v15, "drawTextInRect:", x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SCATOutlineLabel;
  -[SCATOutlineLabel sizeThatFits:](&v13, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(SCATOutlineLabel *)self outlineThickness];
  double v9 = v5 + v8 * 2.0;
  [(SCATOutlineLabel *)self outlineThickness];
  double v11 = v7 + v10 * 2.0 + -5.0;
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (void)setOutlineColor:(id)a3
{
}

- (double)outlineThickness
{
  return self->_outlineThickness;
}

- (void)setOutlineThickness:(double)a3
{
  self->_outlineThickness = a3;
}

- (void).cxx_destruct
{
}

@end