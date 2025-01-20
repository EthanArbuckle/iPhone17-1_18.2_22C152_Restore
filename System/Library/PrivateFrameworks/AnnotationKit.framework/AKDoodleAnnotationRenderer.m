@interface AKDoodleAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKDoodleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double x = v4;
  double y = v6;
  double width = v8;
  double height = v10;
  if (([v3 pathIsPrestroked] & 1) == 0)
  {
    [v3 strokeWidth];
    CGFloat v13 = -v12;
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    CGRect v36 = CGRectInset(v35, v13, v13);
    double x = v36.origin.x;
    double y = v36.origin.y;
    double width = v36.size.width;
    double height = v36.size.height;
  }
  [v3 rotationAngle];
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v16, v18, v20, v22);
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
    double v22 = v26;
  }
  v37.origin.double x = v16;
  v37.origin.double y = v18;
  v37.size.double width = v20;
  v37.size.double height = v22;
  CGRect v38 = CGRectInset(v37, -1.0, -1.0);
  CGFloat v27 = v38.origin.x;
  CGFloat v28 = v38.origin.y;
  CGFloat v29 = v38.size.width;
  CGFloat v30 = v38.size.height;

  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
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
  memset(&v46[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  v46[0] = v46[1];
  CGContextConcatCTM(a4, v46);
  [v10 rectangle];
  CGContextTranslateCTM(a4, v13, v14);
  double v15 = [v10 path];

  if (v15)
  {
    double v16 = [v10 path];
    double v17 = (const CGPath *)[v16 newCGPathForPlatformBezierPath];

    if (v17)
    {
      double v18 = [v10 strokeColor];

      if (v18)
      {
        uint64_t v19 = [v10 originalExifOrientation];
        if (v19 != 1)
        {
          int64_t v20 = +[AKGeometryHelper inverseExifOrientation:v19];
          BoundingBoCGFloat x = CGPathGetBoundingBox(v17);
          CGFloat x = BoundingBox.origin.x;
          CGFloat y = BoundingBox.origin.y;
          CGFloat width = BoundingBox.size.width;
          CGFloat height = BoundingBox.size.height;
          double MidX = CGRectGetMidX(BoundingBox);
          v48.origin.CGFloat x = x;
          v48.origin.CGFloat y = y;
          v48.size.CGFloat width = width;
          v48.size.CGFloat height = height;
          double v26 = +[AKGeometryHelper newPathWithPath:applyingExifOrientation:aboutCenter:](AKGeometryHelper, "newPathWithPath:applyingExifOrientation:aboutCenter:", v17, v20, MidX, CGRectGetMidY(v48));
          CGPathRelease(v17);
          double v17 = v26;
        }
        CGRect v49 = CGPathGetBoundingBox(v17);
        double v27 = v49.origin.x;
        double v28 = v49.origin.y;
        double v29 = v49.size.width;
        double v30 = v49.size.height;
        [v10 rectangle];
        double v32 = v31 / fmax(v29, 0.0005);
        [v10 rectangle];
        double v34 = v33 / fmax(v30, 0.0005);
        if (v32 >= v34) {
          double v35 = v34;
        }
        else {
          double v35 = v32;
        }
        if (v35 < 0.0005)
        {
          double v35 = v32 >= v34 ? v32 : v34;
          if (v35 < 0.0005) {
            double v35 = 1.0;
          }
        }
        [v10 strokeWidth];
        double v37 = v36 / v35;
        int v38 = [v10 pathIsPrestroked];
        id v39 = [v10 strokeColor];
        v40 = (CGColor *)[v39 CGColor];
        if (v38)
        {
          CGContextSetFillColorWithColor(a4, v40);
        }
        else
        {
          CGContextSetStrokeColorWithColor(a4, v40);

          +[AKAnnotationRendererUtilities setStandardLineStateInContext:a4 forLineWidth:v37];
          if ([v10 isDashed]) {
            +[AKAnnotationRendererUtilities setStandardLineDashInContext:a4 forLineWidth:v37];
          }
        }
        CGContextScaleCTM(a4, v35, v35);
        CGContextTranslateCTM(a4, -v27, -v28);
        if (([v10 pathIsPrestroked] & 1) != 0 || !objc_msgSend(v10, "brushStyle"))
        {
          CGContextAddPath(a4, v17);
          if ([v10 pathIsPrestroked]) {
            CGContextFillPath(a4);
          }
          else {
            CGContextStrokePath(a4);
          }
        }
        else
        {
          uint64_t v41 = [v10 brushStyle];
          v42 = [v10 strokeColor];
          v43 = +[AKTSDBrushStroke strokeWithType:v41 color:v42 width:v37];

          v44 = +[AKTSDBezierPath bezierPathWithCGPath:v17];
          v45 = objc_alloc_init(AKTSDShape);
          [(AKTSDShape *)v45 setStroke:v43];
          [(AKTSDShape *)v45 setPath:v44];
          [(AKTSDShape *)v45 drawInContext:a4];
        }
      }
    }
    CGPathRelease(v17);
  }
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
  id v8 = a4;
  v9 = [v8 path];

  if (v9)
  {
    id v10 = [v8 path];
    id v11 = (const CGPath *)[v10 newCGPathForPlatformBezierPath];

    uint64_t v12 = [v8 originalExifOrientation];
    CGFloat v48 = x;
    CGFloat v13 = y;
    if (v12 != 1)
    {
      int64_t v15 = +[AKGeometryHelper inverseExifOrientation:v12];
      BoundingBoCGFloat x = CGPathGetBoundingBox(v11);
      CGFloat v16 = BoundingBox.origin.x;
      CGFloat v17 = BoundingBox.origin.y;
      CGFloat width = BoundingBox.size.width;
      CGFloat height = BoundingBox.size.height;
      double MidX = CGRectGetMidX(BoundingBox);
      v61.origin.CGFloat x = v16;
      v61.origin.CGFloat y = v17;
      v61.size.CGFloat width = width;
      v61.size.CGFloat height = height;
      double v21 = +[AKGeometryHelper newPathWithPath:applyingExifOrientation:aboutCenter:](AKGeometryHelper, "newPathWithPath:applyingExifOrientation:aboutCenter:", v11, v15, MidX, CGRectGetMidY(v61));
      CGPathRelease(v11);
      id v11 = v21;
    }
    CGRect v62 = CGPathGetBoundingBox(v11);
    double v22 = v62.origin.x;
    double v23 = v62.origin.y;
    double v24 = v62.size.width;
    double v25 = v62.size.height;
    [v8 rectangle];
    double v27 = v26 / fmax(v24, 0.0005);
    [v8 rectangle];
    double v29 = v28 / fmax(v25, 0.0005);
    if (v27 >= v29) {
      double v30 = v29;
    }
    else {
      double v30 = v27;
    }
    if (v30 < 0.0005)
    {
      double v30 = v27 >= v29 ? v27 : v29;
      if (v30 < 0.0005) {
        double v30 = 1.0;
      }
    }
    long long v51 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v58.a = *MEMORY[0x263F000D0];
    long long v50 = *(_OWORD *)&v58.a;
    *(_OWORD *)&v58.c = v51;
    *(_OWORD *)&v58.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v49 = *(_OWORD *)&v58.tx;
    CGAffineTransformMakeTranslation(&t2, -v22, -v23);
    *(_OWORD *)&t1.a = v50;
    *(_OWORD *)&t1.c = v51;
    *(_OWORD *)&t1.tCGFloat x = v49;
    CGAffineTransformConcat(&v58, &t1, &t2);
    CGAffineTransformMakeScale(&v55, v30, v30);
    CGAffineTransform v54 = v58;
    CGAffineTransformConcat(&t1, &v54, &v55);
    CGAffineTransform v58 = t1;
    [v8 rectangle];
    CGAffineTransformMakeTranslation(&v53, v31, v32);
    CGAffineTransform v54 = v58;
    CGAffineTransformConcat(&t1, &v54, &v53);
    CGAffineTransform v58 = t1;
    uint64_t v33 = MEMORY[0x237E1D700](v11, &v58);
    if (!v33)
    {
      BOOL v14 = 0;
LABEL_34:
      CGPathRelease(v11);
      goto LABEL_35;
    }
    double v34 = (const CGPath *)v33;
    memset(&t1, 0, sizeof(t1));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:v8 hasRotation:0];
    CGAffineTransform v52 = t1;
    CGAffineTransformInvert(&v54, &v52);
    CGAffineTransform t1 = v54;
    [v8 strokeWidth];
    if (v35 <= a5) {
      double v36 = a5;
    }
    else {
      double v36 = v35;
    }
    if ([v8 pathIsPrestroked])
    {
      v59.CGFloat x = v48;
      v59.CGFloat y = v13;
      if (CGPathContainsPoint(v34, &t1, v59, 0))
      {
        BOOL v14 = 1;
LABEL_33:
        CGPathRelease(v34);
        goto LABEL_34;
      }
      if ([v8 pathIsDot])
      {
        CGRect v63 = CGPathGetBoundingBox(v34);
        CGFloat v41 = v63.origin.x;
        CGFloat v42 = v63.origin.y;
        CGFloat v43 = v63.size.width;
        CGFloat v44 = v63.size.height;
        CGFloat v45 = CGRectGetWidth(v63);
        if (v45 > a5) {
          a5 = v45;
        }
        v64.origin.CGFloat x = v41;
        v64.origin.CGFloat y = v42;
        v64.size.CGFloat width = v43;
        v64.size.CGFloat height = v44;
        double v46 = CGRectGetMidX(v64);
        v65.origin.CGFloat x = v41;
        v65.origin.CGFloat y = v42;
        v65.size.CGFloat width = v43;
        v65.size.CGFloat height = v44;
        +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", a5, a5, v46, CGRectGetMidY(v65));
        double v37 = CGPathCreateWithEllipseInRect(v66, 0);
        goto LABEL_30;
      }
      double v37 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v34 withStrokeWidth:v36 * 0.5];
      if (v37)
      {
LABEL_30:
        id v39 = v37;
        CGFloat v38 = v48;
        CGFloat v40 = v13;
        goto LABEL_31;
      }
    }
    else
    {
      double v37 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v34 withStrokeWidth:v36];
      CGFloat v38 = v48;
      if (v37)
      {
        id v39 = v37;
        CGFloat v40 = v13;
LABEL_31:
        BOOL v14 = CGPathContainsPoint(v37, &t1, *(CGPoint *)&v38, 0);
        CGPathRelease(v39);
        goto LABEL_33;
      }
    }
    BOOL v14 = 0;
    goto LABEL_33;
  }
  BOOL v14 = 0;
LABEL_35:

  return v14;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end