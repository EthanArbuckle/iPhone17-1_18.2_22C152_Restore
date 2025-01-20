@interface BCUIRingView
+ (Class)layerClass;
- (BCUIRingView)initWithFrame:(CGRect)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineWidth;
- (double)ringEnd;
- (double)ringStart;
- (void)_invalidatePath;
- (void)layoutSubviews;
- (void)mt_applyVisualStyling:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setFractionComplete:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLineWidth:(double)a3;
- (void)setRingEnd:(double)a3;
- (void)setRingStart:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation BCUIRingView

- (void)setRingStart:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (v3 != self->_ringStart)
  {
    self->_ringStart = v3;
    [(BCUIRingView *)self setNeedsLayout];
  }
}

- (void)setRingEnd:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (v3 != self->_ringEnd)
  {
    self->_ringEnd = v3;
    [(BCUIRingView *)self setNeedsLayout];
  }
}

- (void)setStrokeColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_strokeColor = &self->_strokeColor;
  if (self->_strokeColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_strokeColor, a3);
    p_strokeColor = (UIColor **)[(BCUIRingView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_strokeColor, v5);
}

- (void)setFillColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_fillColor = &self->_fillColor;
  if (self->_fillColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_fillColor, a3);
    p_fillColor = (UIColor **)[(BCUIRingView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_fillColor, v5);
}

- (void)setFractionComplete:(double)a3
{
  [(BCUIRingView *)self setRingStart:0.0];

  [(BCUIRingView *)self setRingEnd:a3];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BCUIRingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BCUIRingView;
  double v3 = -[BCUIRingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 6.0;
    [(BCUIRingView *)v3 setNeedsLayout];
    v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__BCUIRingView_initWithFrame___block_invoke;
    v7[3] = &unk_1E6BE0AC0;
    v8 = v4;
    [v5 performWithoutAnimation:v7];
  }
  return v4;
}

uint64_t __30__BCUIRingView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)layoutSubviews
{
  double v3 = [(BCUIRingView *)self _shapeLayer];
  v4 = v3;
  id v32 = v3;
  if (self->_ringEnd > self->_ringStart)
  {
    uint64_t v5 = [v3 path];
    v4 = v32;
    if (!v5)
    {
      [(BCUIRingView *)self bounds];
      double v7 = v6;
      double v9 = v8;
      v10 = [(BCUIRingView *)self window];
      if (v10)
      {
        v11 = [(BCUIRingView *)self window];
        v12 = [v11 screen];
        [v12 scale];
        uint64_t v14 = v13;
      }
      else
      {
        v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v11 scale];
        uint64_t v14 = v15;
      }

      -[BCUIRingView sizeThatFits:](self, "sizeThatFits:", v7, v9);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      Mutable = CGPathCreateMutable();
      UIRectGetCenter();
      UIPointRoundToScale();
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      v34.origin.x = v17;
      v34.origin.y = v19;
      v34.size.width = v21;
      v34.size.height = v23;
      CGRectGetWidth(v34);
      UIRoundToScale();
      CGPathAddArc(Mutable, 0, v26, v28, v29, 4.71238898, 10.9955743, 0);
      objc_msgSend(v32, "setPath:", Mutable, v14);
      CGPathRelease(Mutable);
      [v32 setLineCap:@"round"];
      v4 = v32;
    }
  }
  [v4 setLineWidth:self->_lineWidth];
  fillColor = self->_fillColor;
  if (fillColor)
  {
    objc_msgSend(v32, "setFillColor:", -[UIColor CGColor](fillColor, "CGColor"));
  }
  else
  {
    id v31 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v32, "setFillColor:", objc_msgSend(v31, "CGColor"));
  }
  objc_msgSend(v32, "setStrokeColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  [v32 setStrokeStart:self->_ringStart];
  [v32 setStrokeEnd:self->_ringEnd];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BCUIRingView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)BCUIRingView;
  -[BCUIRingView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(BCUIRingView *)self frame];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22)) {
    [(BCUIRingView *)self _invalidatePath];
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.width > result.height) {
    result.double width = result.height;
  }
  double width = result.width;
  result.double height = width;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"strokeStart"] & 1) != 0
    || ([v4 isEqualToString:@"strokeEnd"] & 1) != 0
    || ([v4 isEqualToString:@"strokeColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCUIRingView;
    BOOL v5 = [(BCUIRingView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_invalidatePath
{
  double v3 = [(BCUIRingView *)self _shapeLayer];
  [v3 setPath:0];

  [(BCUIRingView *)self setNeedsLayout];
}

- (double)ringStart
{
  return self->_ringStart;
}

- (double)ringEnd
{
  return self->_ringEnd;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_strokeColor, 0);
}

- (void)mt_applyVisualStyling:(id)a3
{
}

@end