@interface _HKReferenceRangeDotViewDot
- (UIColor)dotColor;
- (_HKReferenceRangeDotViewDot)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setDotColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _HKReferenceRangeDotViewDot

- (_HKReferenceRangeDotViewDot)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKReferenceRangeDotViewDot;
  v3 = -[_HKReferenceRangeDotViewDot initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(_HKReferenceRangeDotViewDot *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setDotColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_dotColor = &self->_dotColor;
  if (self->_dotColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_dotColor, a3);
    p_dotColor = (UIColor **)[(_HKReferenceRangeDotViewDot *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_dotColor, v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_HKReferenceRangeDotViewDot;
  [(_HKReferenceRangeDotViewDot *)&v4 traitCollectionDidChange:a3];
  [(_HKReferenceRangeDotViewDot *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_HKReferenceRangeDotViewDot;
  -[_HKReferenceRangeDotViewDot drawRect:](&v7, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  dotColor = self->_dotColor;
  objc_super v6 = dotColor;
  if (!dotColor)
  {
    objc_super v6 = [MEMORY[0x1E4FB1618] blackColor];
  }
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);
  if (!dotColor) {

  }
  [(_HKReferenceRangeDotViewDot *)self bounds];
  CGRect v9 = CGRectInset(v8, 1.0, 1.0);
  CGContextFillEllipseInRect(CurrentContext, v9);
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void).cxx_destruct
{
}

@end