@interface AKRectAnnotationRenderer
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

@implementation AKRectAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 strokeWidth];
  CGFloat v13 = v12 * -0.5;
  v39.origin.double x = v5;
  v39.origin.double y = v7;
  v39.size.double width = v9;
  v39.size.double height = v11;
  CGRect v40 = CGRectInset(v39, v13, v13);
  double x = v40.origin.x;
  double y = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;
  [v3 rotationAngle];
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v20, v22, v24, v26);
    double v20 = v27;
    double v22 = v28;
    double v24 = v29;
    double v26 = v30;
  }
  v41.origin.double x = v20;
  v41.origin.double y = v22;
  v41.size.double width = v24;
  v41.size.double height = v26;
  CGRect v42 = CGRectInset(v41, -1.0, -1.0);
  CGFloat v31 = v42.origin.x;
  CGFloat v32 = v42.origin.y;
  CGFloat v33 = v42.size.width;
  CGFloat v34 = v42.size.height;

  double v35 = v31;
  double v36 = v32;
  double v37 = v33;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v4;
  result.double width = v3;
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
  [v9 cornerRadius];
  if (v10 <= 0.0001)
  {
    MutableCopCGFloat y = 0;
  }
  else
  {
    [v9 strokeWidth];
    double v12 = v11 * 0.5;
    [v9 originalModelBaseScaleFactor];
    CGFloat v14 = v12 + v13 * 2.0;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v26 = CGRectInset(v25, v14, v14);
    double v15 = v26.origin.x;
    double v16 = v26.origin.y;
    double v17 = v26.size.width;
    double v18 = v26.size.height;
    Mutable = CGPathCreateMutable();
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v15, v16, v17, v18))
    {
      CGFloat v20 = (void *)[v9 copy];
      objc_msgSend(v20, "setRectangle:", v15, v16, v17, v18);
      [v20 cornerRadius];
      [v20 setCornerRadius:v21 - v12];
      double v22 = (const CGPath *)[a1 _newPathForAnnotation:v20 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
      CGPathAddPath(Mutable, 0, v22);
      CGPathRelease(v22);
    }
    MutableCopCGFloat y = CGPathCreateMutableCopy(Mutable);
    CGPathRelease(Mutable);
  }

  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
  int v12 = [v10 hasShadow];
  if (v12) {
    +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v10];
  }
  CGContextSaveGState(a4);
  memset(&v28[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  v28[0] = v28[1];
  CGContextConcatCTM(a4, v28);
  CGContextSaveGState(a4);
  uint64_t v13 = [v10 fillColor];
  if (v13)
  {
    CGFloat v14 = (void *)v13;
    id v15 = [v10 fillColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v15 CGColor]);

    if (Alpha != 0.0)
    {
      double v17 = (const CGPath *)[a1 _newPathForAnnotation:v10 axisAlignedForStroke:0 alignToScreenUsingPageController:v11 orAlignToContext:a4];
      id v18 = [v10 fillColor];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v18 CGColor]);

      CGContextAddPath(a4, v17);
      CGContextFillPath(a4);
      CGPathRelease(v17);
    }
  }
  CGFloat v19 = [v10 strokeColor];

  if (v19)
  {
    if ([v10 brushStyle])
    {
      CGFloat v20 = (const CGPath *)[a1 _newPathForAnnotation:v10 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
      uint64_t v21 = [v10 brushStyle];
      double v22 = [v10 strokeColor];
      [v10 strokeWidth];
      double v23 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v21, v22);

      double v24 = +[AKTSDBezierPath bezierPathWithCGPath:v20];
      CGRect v25 = objc_alloc_init(AKTSDShape);
      [(AKTSDShape *)v25 setStroke:v23];
      [(AKTSDShape *)v25 setPath:v24];
      [(AKTSDShape *)v25 drawInContext:a4];
      CGPathRelease(v20);
    }
    else
    {
      CGRect v26 = (const CGPath *)[a1 _newPathForAnnotation:v10 axisAlignedForStroke:1 alignToScreenUsingPageController:v11 orAlignToContext:a4];
      id v27 = [v10 strokeColor];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v27 CGColor]);

      [v10 strokeWidth];
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if ([v10 isDashed])
      {
        [v10 strokeWidth];
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, v26);
      CGContextStrokePath(a4);
      CGPathRelease(v26);
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
  CGContextRestoreGState(a4);
  if (v12) {
    +[AKAnnotationRendererUtilities endShadowInContext:a4];
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = (const CGPath *)[a1 _newPathForAnnotation:v9 axisAlignedForStroke:0 alignToScreenUsingPageController:0 orAlignToContext:0];
  [v9 strokeWidth];
  if (v11 <= a5) {
    double v11 = a5;
  }
  int v12 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v10 withStrokeWidth:v11];
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
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  [v9 rectangle];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (!+[AKGeometryHelper annotationHasRotation:v9 outAngle:0])
  {
    double v19 = 0.0;
    if (v8)
    {
      [v9 strokeWidth];
      double v19 = v20;
    }
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, a6, v9, v12, v14, v16, v18, v19);
    double v12 = v21;
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
  }
  [v9 cornerRadius];
  if (v25 <= 0.0)
  {
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v14;
    v33.size.CGFloat width = v16;
    v33.size.CGFloat height = v18;
    CGPathRef v29 = CGPathCreateWithRect(v33, 0);
  }
  else
  {
    [v9 cornerRadius];
    double v27 = v18 / 2.01;
    if (v16 / 2.01 < v18 / 2.01) {
      double v27 = v16 / 2.01;
    }
    if (v26 >= v27) {
      CGFloat v28 = v27;
    }
    else {
      CGFloat v28 = v26;
    }
    v32.origin.CGFloat x = v12;
    v32.origin.CGFloat y = v14;
    v32.size.CGFloat width = v16;
    v32.size.CGFloat height = v18;
    CGPathRef v29 = CGPathCreateWithRoundedRect(v32, v28, v28, 0);
  }
  double v30 = v29;

  return v30;
}

@end