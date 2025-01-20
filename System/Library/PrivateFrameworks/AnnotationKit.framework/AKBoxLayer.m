@interface AKBoxLayer
- (AKBoxLayer)initWithBorderWidth:(double)a3 cornerRadius:(double)a4;
- (double)borderWidthScale;
- (double)boxCornerRadius;
- (double)nominalBorderWidth;
- (void)_updateBoxPath;
- (void)setBorderWidthScale:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBoxCornerRadius:(double)a3;
- (void)setNominalBorderWidth:(double)a3;
@end

@implementation AKBoxLayer

- (AKBoxLayer)initWithBorderWidth:(double)a3 cornerRadius:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AKBoxLayer;
  v6 = [(AKBoxLayer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    -[AKBoxLayer setAnchorPoint:](v6, "setAnchorPoint:", 0.5, 0.5);
    [(AKBoxLayer *)v7 setLineWidth:a3];
    id v8 = [MEMORY[0x263F1C550] akBoxBorderColor];
    -[AKBoxLayer setStrokeColor:](v7, "setStrokeColor:", [v8 CGColor]);

    [(AKBoxLayer *)v7 setFillColor:0];
    v7->_borderWidthScale = 1.0;
    v7->_boxCornerRadius = a4;
    v7->_nominalBorderWidth = a3;
  }
  return v7;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKBoxLayer;
  -[AKBoxLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AKBoxLayer *)self _updateBoxPath];
}

- (double)borderWidthScale
{
  return self->_borderWidthScale;
}

- (void)setBorderWidthScale:(double)a3
{
  if (self->_borderWidthScale != a3)
  {
    self->_borderWidthScale = a3;
    [(AKBoxLayer *)self nominalBorderWidth];
    double v5 = v4;
    [(AKBoxLayer *)self borderWidthScale];
    [(AKBoxLayer *)self setLineWidth:v5 / v6];
    [(AKBoxLayer *)self _updateBoxPath];
  }
}

- (void)_updateBoxPath
{
  [(AKBoxLayer *)self bounds];
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    [(AKBoxLayer *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(AKBoxLayer *)self lineWidth];
    CGFloat v12 = v11 * 0.5;
    [(AKBoxLayer *)self lineWidth];
    CGFloat v14 = v13 * 0.5;
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    CGRect v19 = CGRectInset(v18, v12, v14);
    CGPathRef v15 = CGPathCreateWithRoundedRect(v19, self->_boxCornerRadius, self->_boxCornerRadius, 0);
    if (v15)
    {
      v16 = v15;
      [(AKBoxLayer *)self setPath:v15];
      CGPathRelease(v16);
    }
  }
}

- (double)boxCornerRadius
{
  return self->_boxCornerRadius;
}

- (void)setBoxCornerRadius:(double)a3
{
  self->_boxCornerRadius = a3;
}

- (double)nominalBorderWidth
{
  return self->_nominalBorderWidth;
}

- (void)setNominalBorderWidth:(double)a3
{
  self->_nominalBorderWidth = a3;
}

@end