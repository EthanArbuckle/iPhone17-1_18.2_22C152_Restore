@interface EQKitBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)canContainBoxes;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGAffineTransform)transformFromDescendant:(SEL)a3;
- (CGColor)color;
- (CGRect)boundsWithRoot:(id)a3;
- (CGRect)erasableBounds;
- (double)depth;
- (double)height;
- (double)layoutDepth;
- (double)layoutHeight;
- (double)layoutVSize;
- (double)vsize;
- (double)width;
- (id)containedBoxes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)hitTest:(CGPoint)a3;
- (unint64_t)hash;
- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4;
@end

@implementation EQKitBox

- (BOOL)canContainBoxes
{
  return 0;
}

- (id)containedBoxes
{
  return 0;
}

- (CGRect)boundsWithRoot:(id)a3
{
  id v4 = a3;
  v5 = v4;
  memset(&v19[1], 0, sizeof(CGAffineTransform));
  if (v4) {
    [v4 transformFromDescendant:self];
  }
  [(EQKitBox *)self height];
  double v7 = v6;
  [(EQKitBox *)self width];
  CGFloat v9 = v8;
  [(EQKitBox *)self vsize];
  v20.size.CGFloat height = v10;
  v20.origin.CGFloat y = -v7;
  v19[0] = v19[1];
  v20.origin.CGFloat x = 0.0;
  v20.size.CGFloat width = v9;
  CGRect v21 = CGRectApplyAffineTransform(v20, v19);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  return 7;
}

- (CGColor)color
{
  return 0;
}

- (double)height
{
  return 0.0;
}

- (double)depth
{
  return 0.0;
}

- (double)width
{
  return 0.0;
}

- (double)vsize
{
  [(EQKitBox *)self height];
  double v4 = v3;
  [(EQKitBox *)self depth];
  return v4 + v5;
}

- (double)layoutHeight
{
  [(EQKitBox *)self height];
  return fmax(v2, 0.0);
}

- (double)layoutDepth
{
  [(EQKitBox *)self depth];
  return fmax(v2, 0.0);
}

- (double)layoutVSize
{
  [(EQKitBox *)self layoutHeight];
  double v4 = v3;
  [(EQKitBox *)self layoutDepth];
  return v4 + v5;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self height];
  double v4 = v3;
  [(EQKitBox *)self width];
  double v6 = v5;
  [(EQKitBox *)self vsize];
  if (v6 >= 0.0) {
    double v8 = v6;
  }
  else {
    double v8 = -v6;
  }
  if (v6 >= 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v6 + 0.0;
  }
  if (v7 >= 0.0) {
    double v10 = v7;
  }
  else {
    double v10 = -v7;
  }
  if (v7 >= 0.0) {
    double v7 = -0.0;
  }
  double v11 = v7 - v4;
  double v12 = v9;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v25 = a3;
  double v7 = (CGContext *)[v25 cgContext];
  if (v7)
  {
    [(EQKitBox *)self width];
    double v9 = v8;
    [(EQKitBox *)self vsize];
    if (v9 > 0.0)
    {
      double v11 = v10;
      if (v10 > 0.0)
      {
        [(EQKitBox *)self height];
        double v13 = v12;
        if (v9 >= 0.0) {
          double v14 = v9;
        }
        else {
          double v14 = -v9;
        }
        if (v9 >= 0.0) {
          double v15 = -0.0;
        }
        else {
          double v15 = v9;
        }
        if (v11 >= 0.0) {
          double v16 = v11;
        }
        else {
          double v16 = -v11;
        }
        if (v11 >= 0.0) {
          double v11 = -0.0;
        }
        double v17 = [v25 selection];
        int v18 = [v17 containsBox:self];
        double v19 = v11 + y - v13;

        if ((v18 & 1) != 0 || [v25 rendersDebugRects])
        {
          CGContextSaveGState(v7);
          if (v18)
          {
            CGRect v20 = (CGColor *)[v25 highlightColor];
            if (v20)
            {
              CGContextSetFillColorWithColor(v7, v20);
              v27.origin.double x = x + v15;
              v27.origin.double y = v19;
              v27.size.CGFloat width = v14;
              v27.size.CGFloat height = v16;
              CGContextFillRect(v7, v27);
            }
          }
          int v21 = 1;
        }
        else
        {
          int v21 = 0;
        }
        if ([v25 rendersDebugRects])
        {
          GenericRGB = CGColorCreateGenericRGB(1.0, 0.5, 0.5, 1.0);
          v23 = CGColorCreateGenericRGB(0.5, 0.5, 1.0, 1.0);
          CGFloat v24 = EQKitBox_ContextScale(v7);
          CGContextSetLineWidth(v7, 1.0 / v24);
          CGContextSetStrokeColorWithColor(v7, GenericRGB);
          CGContextBeginPath(v7);
          CGContextMoveToPoint(v7, x, y);
          CGContextAddLineToPoint(v7, x + v9, y);
          CGContextStrokePath(v7);
          CGContextSetStrokeColorWithColor(v7, v23);
          v28.origin.double x = x + v15;
          v28.origin.double y = v19;
          v28.size.CGFloat width = v14;
          v28.size.CGFloat height = v16;
          CGContextStrokeRect(v7, v28);
          CGColorRelease(v23);
          CGColorRelease(GenericRGB);
        }
        if (v21) {
          CGContextRestoreGState(v7);
        }
      }
    }
  }
}

- (CGAffineTransform)transformFromDescendant:(SEL)a3
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  return (CGAffineTransform *)-[EQKitBox p_getTransform:fromDescendant:](self, "p_getTransform:fromDescendant:");
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 1;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  if (a3.x < 0.0) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  [(EQKitBox *)self width];
  if (x > v7) {
    return 0;
  }
  [(EQKitBox *)self depth];
  if (y < -v8) {
    return 0;
  }
  [(EQKitBox *)self height];
  return y <= v9;
}

- (id)hitTest:(CGPoint)a3
{
  if (-[EQKitBox containsPoint:](self, "containsPoint:", a3.x, a3.y)) {
    double v4 = self;
  }
  else {
    double v4 = 0;
  }

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

@end