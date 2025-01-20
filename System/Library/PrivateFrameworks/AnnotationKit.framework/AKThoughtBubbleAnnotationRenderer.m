@interface AKThoughtBubbleAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newCloudPathScaledToModelSpaceForAnnotation:(id)a3;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)_newLargestBubblePathScaledToModelSpaceForAnnotation:(id)a3;
+ (CGPath)_newPathTransformedFromUnitToModelSpace:(CGPath *)a3 forAnnotation:(id)a4;
+ (CGPath)_newSmallBubblePathForAnnotation:(id)a3 atCenter:(CGPoint)a4 withSize:(CGSize)a5;
+ (CGPath)_newSmallestBubblePathScaledToModelSpaceForAnnotation:(id)a3;
+ (CGPoint)_templatePointyPointToCircleIntersect;
+ (CGPoint)_unitAnnotationPointyPointForAnnotation:(id)a3;
+ (CGPoint)_unitCloudCenter;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (double)_templateToUnitPointyPointScaleForAnnotation:(id)a3;
+ (double)_unitCloudRadius;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_fillAndStrokePath:(CGPath *)a3 forAnnotation:(id)a4 inContext:(CGContext *)a5;
@end

@implementation AKThoughtBubbleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 pointyBitPoint];
  CGFloat v13 = v12;
  [v3 pointyBitPoint];
  v53.origin.CGFloat y = v14;
  v53.size.CGFloat width = 0.0;
  v53.size.CGFloat height = 0.0;
  v46.origin.CGFloat x = v5;
  v46.origin.CGFloat y = v7;
  v46.size.CGFloat width = v9;
  v46.size.CGFloat height = v11;
  v53.origin.CGFloat x = v13;
  CGRect v47 = CGRectUnion(v46, v53);
  CGFloat x = v47.origin.x;
  CGFloat y = v47.origin.y;
  CGFloat width = v47.size.width;
  CGFloat height = v47.size.height;
  [v3 strokeWidth];
  CGFloat v20 = v19 * -4.0;
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  CGRect v49 = CGRectInset(v48, v20, v20);
  double v21 = v49.origin.x;
  double v22 = v49.origin.y;
  double v23 = v49.size.width;
  double v24 = v49.size.height;
  [v3 rotationAngle];
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v27, v29, v31, v33);
    double v27 = v34;
    double v29 = v35;
    double v31 = v36;
    double v33 = v37;
  }
  v50.origin.CGFloat x = v27;
  v50.origin.CGFloat y = v29;
  v50.size.CGFloat width = v31;
  v50.size.CGFloat height = v33;
  CGRect v51 = CGRectInset(v50, -1.0, -1.0);
  CGFloat v38 = v51.origin.x;
  CGFloat v39 = v51.origin.y;
  CGFloat v40 = v51.size.width;
  CGFloat v41 = v51.size.height;

  double v42 = v38;
  double v43 = v39;
  double v44 = v40;
  double v45 = v41;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.CGFloat y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
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
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGRect v39 = CGRectInset(v38, v13, v13);
  double v14 = v39.origin.x;
  double v15 = v39.origin.y;
  double v16 = v39.size.width;
  double v17 = v39.size.height;
  double v32 = CGRectGetWidth(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v18 = CGRectGetWidth(v40);
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v14, v15, v16, v17))
  {
    CGFloat v20 = v32 / v18;
    CGFloat v21 = (const CGPath *)[a1 _newCloudPathScaledToModelSpaceForAnnotation:v9];
    BoundingBoCGFloat x = CGPathGetBoundingBox(v21);
    CGFloat v22 = BoundingBox.origin.x;
    CGFloat v23 = BoundingBox.origin.y;
    CGFloat v24 = BoundingBox.size.width;
    CGFloat v25 = BoundingBox.size.height;
    memset(&m, 0, sizeof(m));
    CGFloat v26 = -CGRectGetMidX(BoundingBox);
    v42.origin.CGFloat x = v22;
    v42.origin.CGFloat y = v23;
    v42.size.CGFloat width = v24;
    v42.size.CGFloat height = v25;
    CGFloat MidY = CGRectGetMidY(v42);
    CGAffineTransformMakeTranslation(&m, v26, -MidY);
    CGAffineTransformMakeScale(&t2, v20, v20);
    CGAffineTransform t1 = m;
    CGAffineTransformConcat(&v36, &t1, &t2);
    CGAffineTransform m = v36;
    v43.origin.CGFloat x = v22;
    v43.origin.CGFloat y = v23;
    v43.size.CGFloat width = v24;
    v43.size.CGFloat height = v25;
    CGFloat MidX = CGRectGetMidX(v43);
    v44.origin.CGFloat x = v22;
    v44.origin.CGFloat y = v23;
    v44.size.CGFloat width = v24;
    v44.size.CGFloat height = v25;
    CGFloat v29 = CGRectGetMidY(v44);
    CGAffineTransformMakeTranslation(&v33, MidX, v29);
    CGAffineTransform t1 = m;
    CGAffineTransformConcat(&v36, &t1, &v33);
    CGAffineTransform m = v36;
    CGPathAddPath(Mutable, &m, v21);
    CGPathRelease(v21);
  }
  MutableCopCGFloat y = CGPathCreateMutableCopy(Mutable);
  CGPathRelease(Mutable);

  return MutableCopy;
}

+ (void)_fillAndStrokePath:(CGPath *)a3 forAnnotation:(id)a4 inContext:(CGContext *)a5
{
  id v21 = a4;
  CGContextSaveGState(a5);
  uint64_t v7 = [v21 fillColor];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v21 fillColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v9 CGColor]);

    if (Alpha != 0.0)
    {
      id v11 = [v21 fillColor];
      CGContextSetFillColorWithColor(a5, (CGColorRef)[v11 CGColor]);

      CGContextAddPath(a5, a3);
      CGContextFillPath(a5);
    }
  }
  double v12 = [v21 strokeColor];

  if (v12)
  {
    if ([v21 brushStyle])
    {
      uint64_t v13 = [v21 brushStyle];
      double v14 = [v21 strokeColor];
      [v21 strokeWidth];
      double v15 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v13, v14);

      double v16 = +[AKTSDBezierPath bezierPathWithCGPath:a3];
      double v17 = objc_alloc_init(AKTSDShape);
      [(AKTSDShape *)v17 setStroke:v15];
      [(AKTSDShape *)v17 setPath:v16];
      [(AKTSDShape *)v17 drawInContext:a5];
    }
    else
    {
      [v21 strokeWidth];
      double v19 = v18;
      id v20 = [v21 strokeColor];
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)[v20 CGColor]);

      +[AKAnnotationRendererUtilities setStandardLineStateInContext:a5 forLineWidth:v19];
      if ([v21 isDashed]) {
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:a5 forLineWidth:v19];
      }
      CGContextAddPath(a5, a3);
      CGContextStrokePath(a5);
    }
  }
  CGContextRestoreGState(a5);
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  double v12 = (const CGPath *)[a1 _newCloudPathScaledToModelSpaceForAnnotation:v10];
  uint64_t v13 = (const CGPath *)[a1 _newLargestBubblePathScaledToModelSpaceForAnnotation:v10];
  uint64_t v14 = [a1 _newSmallestBubblePathScaledToModelSpaceForAnnotation:v10];
  double v15 = (const CGPath *)v14;
  if (v12 && v13 && v14)
  {
    [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
    CGContextSaveGState(a4);
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
    v16[0] = v16[1];
    CGContextConcatCTM(a4, v16);
    CGContextSaveGState(a4);
    if ([v10 hasShadow])
    {
      +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v10];
      [a1 _fillAndStrokePath:v12 forAnnotation:v10 inContext:a4];
      [a1 _fillAndStrokePath:v13 forAnnotation:v10 inContext:a4];
      [a1 _fillAndStrokePath:v15 forAnnotation:v10 inContext:a4];
      CGContextRestoreGState(a4);
      +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
      CGContextRestoreGState(a4);
      +[AKAnnotationRendererUtilities endShadowInContext:a4];
    }
    else
    {
      [a1 _fillAndStrokePath:v12 forAnnotation:v10 inContext:a4];
      [a1 _fillAndStrokePath:v13 forAnnotation:v10 inContext:a4];
      [a1 _fillAndStrokePath:v15 forAnnotation:v10 inContext:a4];
      CGContextRestoreGState(a4);
      +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
      CGContextRestoreGState(a4);
    }
  }
  CGPathRelease(v12);
  CGPathRelease(v13);
  CGPathRelease(v15);
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  [v9 strokeWidth];
  if (v10 > a5) {
    a5 = v10;
  }
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v9 hasRotation:0];
  CGAffineTransform v27 = m;
  CGAffineTransformInvert(&v28, &v27);
  CGAffineTransform m = v28;
  uint64_t v11 = [a1 _newCloudPathScaledToModelSpaceForAnnotation:v9];
  if (v11)
  {
    double v12 = (const CGPath *)v11;
    uint64_t v13 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v11 withStrokeWidth:a5];
    if (v13)
    {
      uint64_t v14 = v13;
      v30.CGFloat x = x;
      v30.CGFloat y = y;
      BOOL v15 = CGPathContainsPoint(v13, &m, v30, 0);
      CGPathRelease(v14);
      CGPathRelease(v12);
      if (v15) {
        goto LABEL_11;
      }
    }
    else
    {
      CGPathRelease(v12);
    }
  }
  uint64_t v16 = [a1 _newLargestBubblePathScaledToModelSpaceForAnnotation:v9];
  if (v16)
  {
    double v17 = (const CGPath *)v16;
    double v18 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v16 withStrokeWidth:a5];
    if (v18)
    {
      double v19 = v18;
      v31.CGFloat x = x;
      v31.CGFloat y = y;
      BOOL v20 = CGPathContainsPoint(v18, &m, v31, 0);
      CGPathRelease(v19);
      CGPathRelease(v17);
      if (v20)
      {
LABEL_11:
        BOOL v21 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      CGPathRelease(v17);
    }
  }
  uint64_t v22 = [a1 _newSmallestBubblePathScaledToModelSpaceForAnnotation:v9];
  if (v22)
  {
    CGFloat v23 = (const CGPath *)v22;
    CGFloat v24 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v22 withStrokeWidth:a5];
    if (v24)
    {
      CGFloat v25 = v24;
      v32.CGFloat x = x;
      v32.CGFloat y = y;
      BOOL v21 = CGPathContainsPoint(v24, &m, v32, 0);
      CGPathRelease(v25);
    }
    else
    {
      BOOL v21 = 0;
    }
    CGPathRelease(v23);
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_19:

  return v21;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v7 hasRotation:0];
  CGAffineTransform v18 = m;
  CGAffineTransformInvert(&v19, &v18);
  CGAffineTransform m = v19;
  id v8 = (const CGPath *)[a1 _newCloudPathScaledToModelSpaceForAnnotation:v7];
  if (v8)
  {
    id v9 = v8;
    v21.CGFloat x = x;
    v21.CGFloat y = y;
    BOOL v10 = CGPathContainsPoint(v8, &m, v21, 0);
    CGPathRelease(v9);
    if (v10) {
      goto LABEL_5;
    }
  }
  uint64_t v11 = (const CGPath *)[a1 _newLargestBubblePathScaledToModelSpaceForAnnotation:v7];
  if (v11 && (double v12 = v11, v22.x = x, v22.y = y, v13 = CGPathContainsPoint(v11, &m, v22, 0), CGPathRelease(v12), v13))
  {
LABEL_5:
    BOOL v14 = 1;
  }
  else
  {
    BOOL v15 = (const CGPath *)[a1 _newSmallestBubblePathScaledToModelSpaceForAnnotation:v7];
    if (v15)
    {
      uint64_t v16 = v15;
      v23.CGFloat x = x;
      v23.CGFloat y = y;
      BOOL v14 = CGPathContainsPoint(v15, &m, v23, 0);
      CGPathRelease(v16);
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

+ (CGPoint)_unitAnnotationPointyPointForAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  long long v28 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v30 = *MEMORY[0x263F000D0];
  CGFloat v8 = *(double *)(MEMORY[0x263F000D0] + 32);
  CGFloat v9 = *(double *)(MEMORY[0x263F000D0] + 40);
  CGFloat v10 = -CGRectGetMinX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v38);
  CGAffineTransformMakeTranslation(&t2, v10, -MinY);
  *(_OWORD *)&t1.double a = v30;
  *(_OWORD *)&t1.double c = v28;
  t1.tCGFloat x = v8;
  t1.tCGFloat y = v9;
  CGAffineTransformConcat(&v35, &t1, &t2);
  long long v29 = *(_OWORD *)&v35.c;
  long long v31 = *(_OWORD *)&v35.a;
  tCGFloat x = v35.tx;
  tCGFloat y = v35.ty;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGFloat v14 = 1.0 / CGRectGetWidth(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v15 = CGRectGetHeight(v40);
  CGAffineTransformMakeScale(&v32, v14, 1.0 / v15);
  *(_OWORD *)&t1.double a = v31;
  *(_OWORD *)&t1.double c = v29;
  t1.tCGFloat x = tx;
  t1.tCGFloat y = ty;
  CGAffineTransformConcat(&v35, &t1, &v32);
  double a = v35.a;
  double b = v35.b;
  double c = v35.c;
  double d = v35.d;
  double v20 = v35.tx;
  double v21 = v35.ty;
  [v3 pointyBitPoint];
  double v23 = v22;
  double v25 = v24;

  double v26 = v20 + c * v25 + a * v23;
  double v27 = v21 + d * v25 + b * v23;
  result.CGFloat y = v27;
  result.CGFloat x = v26;
  return result;
}

+ (CGPoint)_unitCloudCenter
{
  double v2 = 0.5;
  double v3 = 0.5;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

+ (double)_unitCloudRadius
{
  return 0.5;
}

+ (CGPoint)_templatePointyPointToCircleIntersect
{
  [a1 _unitCloudCenter];
  double v4 = v3;
  double v6 = v5;
  [a1 _unitCloudRadius];
  double v8 = v7;
  double v9 = *MEMORY[0x263F00148];
  double v10 = *(double *)(MEMORY[0x263F00148] + 8);

  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, v9, v10, v4, v6, v4, v6, v8);
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

+ (double)_templateToUnitPointyPointScaleForAnnotation:(id)a3
{
  [a1 _unitAnnotationPointyPointForAnnotation:a3];
  double v5 = v4;
  double v7 = v6;
  [a1 _templatePointyPointToCircleIntersect];
  long double v9 = v8;
  long double v11 = v10;
  [a1 _unitCloudCenter];
  double v13 = v12;
  double v15 = v14;
  [a1 _unitCloudRadius];
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, v5, v7, v13, v15, v13, v15, v16);
  double v19 = v18;
  double result = 1.0;
  if (v19 != v5 && v17 != v7 && v9 != 0.0 && v11 != 0.0)
  {
    double v21 = hypot(v19 - v5, v17 - v7);
    return v21 / hypot(v9, v11);
  }
  return result;
}

+ (CGPath)_newSmallestBubblePathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4 = a3;
  [a1 _unitAnnotationPointyPointForAnnotation:v4];
  double v14 = v6;
  double v15 = v5;
  [a1 _unitCloudCenter];
  double v8 = v7;
  double v10 = v9;
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", -v7, -v9, v15 - v7, v14 - v9);
  +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v8, v10, -v11);
  double v12 = (CGPath *)objc_msgSend(a1, "_newSmallBubblePathForAnnotation:atCenter:withSize:", v4, vaddq_f64(vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v14), v16, v15)), (float64x2_t)vdupq_n_s64(0x3FA47AE147AE147BuLL)), 0.08, 0.08);

  return v12;
}

+ (CGPath)_newLargestBubblePathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4 = a3;
  [a1 _templateToUnitPointyPointScaleForAnnotation:v4];
  CGFloat v6 = v5;
  [a1 _templatePointyPointToCircleIntersect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v23 = *MEMORY[0x263F000D0];
  CGFloat v11 = *(double *)(MEMORY[0x263F000D0] + 32);
  CGFloat v12 = *(double *)(MEMORY[0x263F000D0] + 40);
  CGAffineTransformMakeTranslation(&t2, -v7, -v9);
  *(_OWORD *)&t1.double a = v23;
  *(_OWORD *)&t1.double c = v20;
  t1.tCGFloat x = v11;
  t1.tCGFloat y = v12;
  CGAffineTransformConcat(&v30, &t1, &t2);
  long long v21 = *(_OWORD *)&v30.c;
  long long v24 = *(_OWORD *)&v30.a;
  tCGFloat x = v30.tx;
  tCGFloat y = v30.ty;
  CGAffineTransformMakeScale(&v27, v6, v6);
  *(_OWORD *)&t1.double a = v24;
  *(_OWORD *)&t1.double c = v21;
  t1.tCGFloat x = tx;
  t1.tCGFloat y = ty;
  CGAffineTransformConcat(&v30, &t1, &v27);
  long long v22 = *(_OWORD *)&v30.c;
  long long v25 = *(_OWORD *)&v30.a;
  CGFloat v15 = v30.tx;
  CGFloat v16 = v30.ty;
  CGAffineTransformMakeTranslation(&v26, v8, v10);
  *(_OWORD *)&t1.double a = v25;
  *(_OWORD *)&t1.double c = v22;
  t1.tCGFloat x = v15;
  t1.tCGFloat y = v16;
  CGAffineTransformConcat(&v30, &t1, &v26);
  float64x2_t v17 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  float64x2_t v18 = (CGPath *)objc_msgSend(a1, "_newSmallBubblePathForAnnotation:atCenter:withSize:", v4, vaddq_f64(*(float64x2_t *)&v30.tx, vmlaq_f64(vmulq_f64(*(float64x2_t *)&v30.c, v17), v17, *(float64x2_t *)&v30.a)), 0.13, 0.11);

  return v18;
}

+ (CGPath)_newSmallBubblePathForAnnotation:(id)a3 atCenter:(CGPoint)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  [a1 _unitCloudCenter];
  double v12 = v11;
  double v14 = v13;
  [a1 _unitAnnotationPointyPointForAnnotation:v10];
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", -v12, -v14, v15 - v12, v16 - v14);
  +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v12, v14, v17);
  double v18 = y * 0.0 + 0.0 * x + 0.0;
  Mutable = CGPathCreateMutable();
  v22.origin.double x = v18 + width * -0.5;
  v22.origin.double y = v18 + height * -0.5;
  v22.size.double width = width;
  v22.size.double height = height;
  CGPathAddEllipseInRect(Mutable, 0, v22);
  long long v20 = (CGPath *)[a1 _newPathTransformedFromUnitToModelSpace:Mutable forAnnotation:v10];

  CGPathRelease(Mutable);
  return v20;
}

+ (CGPath)_newCloudPathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4 = a3;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.30244827, 0.01343505);
  CGPathAddCurveToPoint(Mutable, 0, 0.35887423, -0.00959289, 0.42427887, 0.00619094, 0.47937859, 0.04929641);
  CGPathAddCurveToPoint(Mutable, 0, 0.53032459, 0.00214956, 0.59395242, -0.01865431, 0.652297, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, 0.71073129, 0.01868303, 0.7508165, 0.07273387, 0.76546521, 0.14101983);
  CGPathAddCurveToPoint(Mutable, 0, 0.83514999, 0.13778761, 0.89767936, 0.16238721, 0.93065127, 0.21400945);
  CGPathAddCurveToPoint(Mutable, 0, 0.9636971, 0.26574732, 0.95984616, 0.33276261, 0.9270475, 0.39417562);
  CGPathAddCurveToPoint(Mutable, 0, 0.98279027, 0.436392, 1.0, 0.49515658, 1.0, 0.55554747);
  CGPathAddCurveToPoint(Mutable, 0, 0.99918663, 0.61594457, 0.95336502, 0.66440709, 0.88878699, 0.69017171);
  CGPathAddCurveToPoint(Mutable, 0, 0.90457535, 0.75805935, 0.89117571, 0.82360221, 0.84620553, 0.86454625);
  CGPathAddCurveToPoint(Mutable, 0, 0.80122828, 0.90549673, 0.7345451, 0.9130876, 0.66813488, 0.89126836);
  CGPathAddCurveToPoint(Mutable, 0, 0.63656157, 0.95307559, 0.5838518, 0.99421009, 0.5227851, 0.99653725);
  CGPathAddCurveToPoint(Mutable, 0, 0.46172753, 0.99886408, 0.40591285, 0.9615682, 0.36877061, 0.90239532);
  CGPathAddCurveToPoint(Mutable, 0, 0.3045019, 0.9293305, 0.23732643, 0.92697529, 0.18866412, 0.88952898);
  CGPathAddCurveToPoint(Mutable, 0, 0.14002093, 0.85209719, 0.12074766, 0.78785582, 0.13033697, 0.71889516);
  CGPathAddCurveToPoint(Mutable, 0, 0.06360102, 0.69813851, 0.01336473, 0.65341583, 0.0, 0.59381692);
  CGPathAddCurveToPoint(Mutable, 0, -0.01339382, 0.53408908, 0.01328839, 0.47315176, 0.06520553, 0.42680233);
  CGPathAddCurveToPoint(Mutable, 0, 0.02695239, 0.36813353, 0.01654879, 0.30199402, 0.04470275, 0.24796491);
  CGPathAddCurveToPoint(Mutable, 0, 0.07287601, 0.19389922, 0.13305774, 0.16448633, 0.20298753, 0.16251968);
  CGPathAddCurveToPoint(Mutable, 0, 0.2105341, 0.094648, 0.24368711, 0.04628048, 0.30244827, 0.01343505);
  CGPathCloseSubpath(Mutable);
  CGFloat v6 = (CGPath *)[a1 _newPathTransformedFromUnitToModelSpace:Mutable forAnnotation:v4];

  CGPathRelease(Mutable);
  return v6;
}

+ (CGPath)_newPathTransformedFromUnitToModelSpace:(CGPath *)a3 forAnnotation:(id)a4
{
  [a4 rectangle];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v21.double a = *MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)&v21.a;
  *(_OWORD *)&v21.double c = v16;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v14 = *(_OWORD *)&v21.tx;
  CGFloat v9 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v10 = CGRectGetHeight(v23);
  CGAffineTransformMakeScale(&t2, v9, v10);
  *(_OWORD *)&t1.double a = v15;
  *(_OWORD *)&t1.double c = v16;
  *(_OWORD *)&t1.tCGFloat x = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v25);
  CGAffineTransformMakeTranslation(&v18, MinX, MinY);
  CGAffineTransform v17 = v21;
  CGAffineTransformConcat(&t1, &v17, &v18);
  CGAffineTransform v21 = t1;
  return (CGPath *)MEMORY[0x237E1D700](a3, &v21);
}

@end