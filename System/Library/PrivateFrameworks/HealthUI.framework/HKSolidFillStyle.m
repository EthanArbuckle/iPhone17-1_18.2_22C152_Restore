@interface HKSolidFillStyle
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6;
- (void)setColor:(id)a3;
@end

@implementation HKSolidFillStyle

- (void).cxx_destruct
{
}

- (void)setColor:(id)a3
{
}

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextSetAlpha(a4, a6);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  id v10 = [(HKSolidFillStyle *)self color];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v10 CGColor]);

  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKSolidFillStyle;
  v4 = [(HKFillStyle *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_color);
  return v4;
}

- (UIColor)color
{
  return self->_color;
}

@end