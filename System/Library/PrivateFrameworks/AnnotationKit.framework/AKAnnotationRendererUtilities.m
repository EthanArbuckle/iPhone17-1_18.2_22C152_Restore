@interface AKAnnotationRendererUtilities
+ (CGPath)newStandardStrokedBorderPathWithPath:(CGPath *)a3 withStrokeWidth:(double)a4;
+ (CGPoint)_shadowDirectionForAnnotation:(id)a3;
+ (CGRect)outsetRectForShadow:(CGRect)a3 onAnnotation:(id)a4;
+ (void)beginShadowInContext:(CGContext *)a3 forAnnotation:(id)a4;
+ (void)endShadowInContext:(CGContext *)a3;
+ (void)setStandardLineDashInContext:(CGContext *)a3 forLineWidth:(double)a4;
+ (void)setStandardLineStateInContext:(CGContext *)a3 forLineWidth:(double)a4;
@end

@implementation AKAnnotationRendererUtilities

+ (CGPoint)_shadowDirectionForAnnotation:(id)a3
{
  int64_t v3 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [a3 originalExifOrientation]);
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v3, 0.0, -3.0, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

+ (CGRect)outsetRectForShadow:(CGRect)a3 onAnnotation:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 originalModelBaseScaleFactor];
  double v9 = v8 * -3.75;
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;

  return CGRectInset(*(CGRect *)&v10, v9, v9);
}

+ (void)beginShadowInContext:(CGContext *)a3 forAnnotation:(id)a4
{
  id v6 = a4;
  CGContextSaveGState(a3);
  [a1 _shadowDirectionForAnnotation:v6];
  double v8 = v7;
  double v10 = v9;
  [v6 originalModelBaseScaleFactor];
  double v12 = v11;

  id v13 = [MEMORY[0x263F1C550] akColorWithWhite:0.0 alpha:0.3];
  v14 = (CGColor *)[v13 CGColor];
  v16.CGFloat width = v8 * v12;
  v16.CGFloat height = v10 * v12;
  CGContextSetShadowWithColor(a3, v16, v12 * 3.0, v14);

  CGContextBeginTransparencyLayer(a3, 0);
}

+ (void)endShadowInContext:(CGContext *)a3
{
  CGContextEndTransparencyLayer(a3);

  CGContextRestoreGState(a3);
}

+ (void)setStandardLineStateInContext:(CGContext *)a3 forLineWidth:(double)a4
{
  CGContextSetLineWidth(a3, a4);
  CGContextSetLineCap(a3, kCGLineCapSquare);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);

  CGContextSetMiterLimit(a3, 10.0);
}

+ (void)setStandardLineDashInContext:(CGContext *)a3 forLineWidth:(double)a4
{
  lengths[2] = *(CGFloat *)MEMORY[0x263EF8340];
  lengths[0] = a4 + 7.0;
  lengths[1] = a4 * 3.0 + 4.0;
  CGContextSetLineDash(a3, 1.0, lengths, 2uLL);
}

+ (CGPath)newStandardStrokedBorderPathWithPath:(CGPath *)a3 withStrokeWidth:(double)a4
{
  return CGPathCreateCopyByStrokingPath(a3, 0, a4, kCGLineCapSquare, kCGLineJoinMiter, 10.0);
}

@end