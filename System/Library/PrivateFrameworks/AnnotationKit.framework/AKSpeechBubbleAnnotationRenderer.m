@interface AKSpeechBubbleAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)_newPathForAnnotation:(id)a3;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (double)pointyBitPointWidthAngleGivenControlBasePoint:(CGPoint)a3 forAnnotation:(id)a4;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)basePointsOfPointyBit:(id)a3 withUpdatedProperties:(id)a4 firstPoint:(CGPoint *)a5 secondPoint:(CGPoint *)a6;
@end

@implementation AKSpeechBubbleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 pointyBitPoint];
  +[AKGeometryHelper expandCGRect:toContainPoint:](AKGeometryHelper, "expandCGRect:toContainPoint:", v5, v7, v9, v11, v12, v13);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [v3 strokeWidth];
  CGFloat v23 = v22 * -4.0;
  v49.origin.double x = v15;
  v49.origin.double y = v17;
  v49.size.double width = v19;
  v49.size.double height = v21;
  CGRect v50 = CGRectInset(v49, v23, v23);
  double x = v50.origin.x;
  double y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  [v3 rotationAngle];
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v28);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v30, v32, v34, v36);
    double v30 = v37;
    double v32 = v38;
    double v34 = v39;
    double v36 = v40;
  }
  v51.origin.double x = v30;
  v51.origin.double y = v32;
  v51.size.double width = v34;
  v51.size.double height = v36;
  CGRect v52 = CGRectInset(v51, -1.0, -1.0);
  CGFloat v41 = v52.origin.x;
  CGFloat v42 = v52.origin.y;
  CGFloat v43 = v52.size.width;
  CGFloat v44 = v52.size.height;

  double v45 = v41;
  double v46 = v42;
  double v47 = v43;
  double v48 = v44;
  result.size.double height = v48;
  result.size.double width = v47;
  result.origin.double y = v46;
  result.origin.double x = v45;
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
  id v8 = a3;
  [v8 strokeWidth];
  double v10 = v9 * 0.5;
  [v8 originalModelBaseScaleFactor];
  double v12 = v11;

  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGRect v21 = CGRectInset(v20, v10 + v12 * 2.0, v10 + v12 * 2.0);
  double v13 = v21.origin.x;
  double v14 = v21.origin.y;
  double v15 = v21.size.width;
  double v16 = v21.size.height;
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v13, v14, v15, v16))
  {
    v22.origin.CGFloat x = v13;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = v15;
    v22.size.CGFloat height = v16;
    CGPathAddEllipseInRect(Mutable, 0, v22);
  }
  MutableCopCGFloat y = CGPathCreateMutableCopy(Mutable);
  CGPathRelease(Mutable);
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
  memset(&v26[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  v26[0] = v26[1];
  CGContextConcatCTM(a4, v26);
  CGContextSaveGState(a4);
  double v13 = (const CGPath *)[a1 _newPathForAnnotation:v10];
  uint64_t v14 = [v10 fillColor];
  if (v14)
  {
    double v15 = (void *)v14;
    id v16 = [v10 fillColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v16 CGColor]);

    if (Alpha != 0.0)
    {
      id v18 = [v10 fillColor];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v18 CGColor]);

      CGContextAddPath(a4, v13);
      CGContextFillPath(a4);
    }
  }
  CGFloat v19 = [v10 strokeColor];

  if (v19)
  {
    if ([v10 brushStyle])
    {
      uint64_t v20 = [v10 brushStyle];
      CGRect v21 = [v10 strokeColor];
      [v10 strokeWidth];
      CGRect v22 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v20, v21);

      double v23 = +[AKTSDBezierPath bezierPathWithCGPath:v13];
      double v24 = objc_alloc_init(AKTSDShape);
      [(AKTSDShape *)v24 setStroke:v22];
      [(AKTSDShape *)v24 setPath:v23];
      [(AKTSDShape *)v24 drawInContext:a4];
    }
    else
    {
      id v25 = [v10 strokeColor];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v25 CGColor]);

      [v10 strokeWidth];
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if ([v10 isDashed])
      {
        [v10 strokeWidth];
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, v13);
      CGContextStrokePath(a4);
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
  CGContextRestoreGState(a4);
  if (v12) {
    +[AKAnnotationRendererUtilities endShadowInContext:a4];
  }
  CGPathRelease(v13);
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = (const CGPath *)[a1 _newPathForAnnotation:v9];
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
  id v8 = (const CGPath *)[a1 _newPathForAnnotation:v7];
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

+ (double)pointyBitPointWidthAngleGivenControlBasePoint:(CGPoint)a3 forAnnotation:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v4 = a4;
  [v4 rectangle];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  double v14 = v13;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v6, v8, v10, v12);
  [v4 pointyBitPoint];
  double v21 = v16;
  double v22 = v15;

  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v21), (float64x2_t)0, v22)), *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v14);
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x)), v17, v18);
  return (v19 + v19) * 180.0 / 3.14159265;
}

+ (void)basePointsOfPointyBit:(id)a3 withUpdatedProperties:(id)a4 firstPoint:(CGPoint *)a5 secondPoint:(CGPoint *)a6
{
  id v9 = a3;
  id v10 = a4;
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    [v9 rectangle];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v9 pointyBitBaseWidthAngle];
    double v20 = v19;
    if (v10)
    {
      double v21 = [v10 objectForKey:@"pointyBitBaseWidthAngle"];

      if (v21)
      {
        double v22 = [v10 objectForKey:@"pointyBitBaseWidthAngle"];
        [v22 doubleValue];
        double v20 = v23;
      }
    }
    +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v12, v14, v16, v18);
    +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v12, v14, v16, v18);
    double v25 = v24;
    [v9 pointyBitPoint];
    double v43 = v12;
    double v44 = v16;
    double v29 = *MEMORY[0x263F00148];
    double v28 = *(double *)(MEMORY[0x263F00148] + 8);
    +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v26), (float64x2_t)0, v27)), *MEMORY[0x263F00148], v28, *MEMORY[0x263F00148], v28, v25);
    +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:");
    double v30 = v20 * 3.14159265 / 180.0;
    double v31 = v18;
    double v32 = v14;
    double v34 = v33 + v30 * 0.5;
    +[AKGeometryHelper pointAtAngle:inCircleWithCenter:andRadius:](AKGeometryHelper, "pointAtAngle:inCircleWithCenter:andRadius:", v33 + v30 * -0.5, v29, v28, v25);
    double v36 = v35;
    double v38 = v37;
    +[AKGeometryHelper pointAtAngle:inCircleWithCenter:andRadius:](AKGeometryHelper, "pointAtAngle:inCircleWithCenter:andRadius:", v34, v29, v28, v25);
    double v40 = v39;
    double v42 = v41;
    +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v43, v32, v44, v31);
    if (a5)
    {
      a5->double x = v38 * 0.0 + 0.0 * v36 + 0.0;
      a5->double y = v38 * 0.0 + 0.0 * v36 + 0.0;
    }
    if (a6)
    {
      a6->double x = v42 * 0.0 + 0.0 * v40 + 0.0;
      a6->double y = v42 * 0.0 + 0.0 * v40 + 0.0;
    }
  }
}

+ (CGPath)_newPathForAnnotation:(id)a3
{
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  double v23 = 0.0;
  double v24 = 0.0;
  double v21 = 0.0;
  double v22 = 0.0;
  +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:v3 withUpdatedProperties:0 firstPoint:&v23 secondPoint:&v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  [v3 rectangle];
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:");
  objc_msgSend(v3, "rectangle", 0, 0, 0, 0, 0, 0);
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:");
  CGFloat v5 = v21;
  CGFloat v6 = v22;
  long double v7 = 0.0 * v22 + 0.0 * v21 + 0.0;
  double v8 = atan2(v24 * 0.0 + 0.0 * v23 + 0.0, v24 * 0.0 + 0.0 * v23 + 0.0);
  double v9 = atan2(v7, v7);
  CGPathMoveToPoint(Mutable, 0, v5, v6);
  if (vabdd_f64(v8, v9) >= 0.0005) {
    double v10 = v8;
  }
  else {
    double v10 = v9 + -0.0005;
  }
  [v3 rectangle];
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  CGPathAddArc(Mutable, &v17, 0.0, 0.0, v11, v9, v10, 0);
  [v3 pointyBitPoint];
  CGFloat v13 = v12;
  [v3 pointyBitPoint];
  CGFloat v15 = v14;

  CGPathAddLineToPoint(Mutable, 0, v13, v15);
  CGPathAddLineToPoint(Mutable, 0, v21, v22);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end