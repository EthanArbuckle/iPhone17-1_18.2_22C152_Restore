@interface HKFillStyle
- (id)copyWithZone:(_NSZone *)a3;
- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6;
@end

@implementation HKFillStyle

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextSetAlpha(a4, a6);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v9 CGColor]);

  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

@end