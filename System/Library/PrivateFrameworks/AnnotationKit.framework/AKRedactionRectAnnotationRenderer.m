@interface AKRedactionRectAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)_newPathForAnnotation:(id)a3 axisAlignedForStroke:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKRedactionRectAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 rotationAngle];
  double v13 = v12;

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v5, v7, v9, v11, v13);

  return CGRectInset(*(CGRect *)&v14, -1.0, -1.0);
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 strokeWidth];
  double v11 = v10;
  [v9 originalModelBaseScaleFactor];
  double v13 = v12;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (CGRectIsEmpty(v26))
  {
    [v9 rectangle];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRect v28 = CGRectInset(v27, v11 * 0.5 + v13 * 2.0, v11 * 0.5 + v13 * 2.0);
  CGFloat v18 = v28.origin.x;
  CGFloat v19 = v28.origin.y;
  CGFloat v20 = v28.size.width;
  CGFloat v21 = v28.size.height;

  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  [v8 strokeWidth];
  double v10 = v9 * 0.5;
  [v8 originalModelBaseScaleFactor];
  double v12 = v11;

  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;

  return CGRectInset(*(CGRect *)&v13, -(v10 + v12 * 2.0), -(v10 + v12 * 2.0));
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 strokeWidth];
  double v11 = v10 * 0.5;
  [v9 originalModelBaseScaleFactor];
  CGFloat v13 = v11 + v12 * 2.0;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v24 = CGRectInset(v23, v13, v13);
  double v14 = v24.origin.x;
  double v15 = v24.origin.y;
  double v16 = v24.size.width;
  double v17 = v24.size.height;
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v14, v15, v16, v17))
  {
    CGFloat v19 = (void *)[v9 copy];
    objc_msgSend(v19, "setRectangle:", v14, v15, v16, v17);
    CGFloat v20 = (const CGPath *)[a1 _newPathForAnnotation:v19 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
    CGPathAddPath(Mutable, 0, v20);
    CGPathRelease(v20);
  }
  MutableCopCGFloat y = CGPathCreateMutableCopy(Mutable);
  CGPathRelease(Mutable);

  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(a4, &transform);
  double v12 = (const CGPath *)[a1 _newPathForAnnotation:v10 axisAlignedForStroke:0 alignToScreenUsingPageController:v11 orAlignToContext:a4];

  BoundingBoCGFloat x = CGPathGetBoundingBox(v12);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if ([v10 isHighlighted])
  {
    CGContextSetRGBStrokeColor(a4, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(a4, 1.0);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGContextStrokeRect(a4, v38);
  }
  else
  {
    if ([v10 isOpaque]) {
      double v17 = 1.0;
    }
    else {
      double v17 = 0.65;
    }
    CGFloat v18 = [MEMORY[0x263F1C550] blackColor];
    CGFloat v19 = [v18 colorWithAlphaComponent:v17];

    id v20 = v19;
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v20 CGColor]);
    CGContextAddPath(a4, v12);
    CGContextFillPath(a4);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGContextClipToRect(a4, v39);
    CGFloat v21 = [MEMORY[0x263F1C550] darkGrayColor];
    double v22 = [v21 colorWithAlphaComponent:v17];

    id v23 = v22;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v23 CGColor]);
    if (ColorSpace)
    {
      CGContextSetStrokeColorSpace(a4, ColorSpace);
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v23 CGColor]);
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v40);
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v41);
      transform.a = MinX;
      transform.b = MinY;
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v42);
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v43);
      transform.c = MaxX;
      transform.d = MaxY;
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      CGFloat v29 = CGRectGetMinX(v44);
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      CGFloat v30 = CGRectGetMaxY(v45);
      transform.tCGFloat x = v29;
      transform.tCGFloat y = v30;
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      CGFloat v31 = CGRectGetMaxX(v46);
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      CGFloat v32 = CGRectGetMinY(v47);
      CGFloat v34 = v31;
      CGFloat v35 = v32;
      CGContextSetLineWidth(a4, 1.0);
      CGContextStrokeLineSegments(a4, (const CGPoint *)&transform, 4uLL);
    }
  }
  CGPathRelease(v12);
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = (const CGPath *)[a1 _newPathForAnnotation:v9 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
  double v11 = 0.0;
  if (a5 >= 0.0) {
    double v11 = a5;
  }
  double v12 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v10 withStrokeWidth:v11];
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v9 hasRotation:0];

  CGAffineTransform v15 = m;
  CGAffineTransformInvert(&v16, &v15);
  CGAffineTransform m = v16;
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  BOOL v13 = CGPathContainsPoint(v12, &m, v18, 0);
  CGPathRelease(v12);
  CGPathRelease(v10);
  return v13;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  id v8 = (const CGPath *)[a1 _newPathForAnnotation:v7 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v7 hasRotation:0];

  CGAffineTransform v10 = m;
  CGAffineTransformInvert(&v11, &v10);
  CGAffineTransform m = v11;
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  LOBYTE(v7) = CGPathContainsPoint(v8, &m, v13, 0);
  CGPathRelease(v8);
  return (char)v7;
}

+ (CGPath)_newPathForAnnotation:(id)a3 axisAlignedForStroke:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6
{
  id v8 = a3;
  id v9 = a5;
  [v8 rectangle];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (!+[AKGeometryHelper annotationHasRotation:v8 outAngle:0])
  {
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v9, a6, v8, v11, v13, v15, v17, 0.0);
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
    double v17 = v21;
  }
  v24.origin.CGFloat x = v11;
  v24.origin.CGFloat y = v13;
  v24.size.CGFloat width = v15;
  v24.size.CGFloat height = v17;
  double v22 = CGPathCreateWithRect(v24, 0);

  return v22;
}

@end