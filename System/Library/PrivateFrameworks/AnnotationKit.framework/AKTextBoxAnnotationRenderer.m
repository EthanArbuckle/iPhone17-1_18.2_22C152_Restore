@interface AKTextBoxAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKTextBoxAnnotationRenderer

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
  id v3 = a3;
  double v4 = [v3 fillColor];
  if (v4)
  {

LABEL_3:
    double v6 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
    goto LABEL_12;
  }
  uint64_t v7 = [v3 strokeColor];
  if (v7)
  {
    double v8 = (void *)v7;
    [v3 strokeWidth];
    double v10 = v9;

    if (v10 > 0.0) {
      goto LABEL_3;
    }
  }
  BOOL v11 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v3 originalExifOrientation]);
  if (v11) {
    double v5 = -5.0;
  }
  else {
    double v5 = -1.0;
  }
  if (v11) {
    double v6 = -1.0;
  }
  else {
    double v6 = -5.0;
  }
LABEL_12:

  double v12 = v6;
  double v13 = v5;
  result.double height = v13;
  result.double width = v12;
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
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  if (CGRectIsEmpty(v29))
  {
    [v9 rectangle];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  double v16 = v11 * 0.5;
  [v9 originalModelBaseScaleFactor];
  CGFloat v18 = v11 * 0.5 + v17 * 2.0;
  [v9 originalModelBaseScaleFactor];
  CGFloat v20 = v16 + v19 * 2.0;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectInset(v30, v18, v20);
  CGFloat v21 = v31.origin.x;
  CGFloat v22 = v31.origin.y;
  CGFloat v23 = v31.size.width;
  CGFloat v24 = v31.size.height;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
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
  double v12 = -(v10 + v11 * 2.0);
  [v8 originalModelBaseScaleFactor];
  double v14 = v13;

  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = width;
  CGFloat v18 = height;

  return CGRectInset(*(CGRect *)&v15, v12, -(v10 + v14 * 2.0));
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
  int v12 = [v10 hasShadow];
  unint64_t v13 = 0x26B823000uLL;
  if (v12) {
    +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v10];
  }
  CGContextSaveGState(a4);
  v50[0] = 0;
  memset(&v49, 0, sizeof(v49));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:v50];
  CGAffineTransform transform = v49;
  CGContextConcatCTM(a4, &transform);
  CGContextSaveGState(a4);
  [v10 rectangle];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGFloat v22 = [v10 highlightColor];

  if (v22 && v7)
  {
    CGFloat v23 = [v10 highlightColor];
    if (v23) {
      goto LABEL_6;
    }
LABEL_12:
    id v24 = 0;
    goto LABEL_13;
  }
  id v24 = [v10 fillColor];

  if (!v24) {
    goto LABEL_13;
  }
  CGFloat v23 = [v10 fillColor];
  if (!v23) {
    goto LABEL_12;
  }
LABEL_6:
  id v24 = v23;
  if (CGColorGetAlpha((CGColorRef)[v24 CGColor]) != 0.0)
  {
    CGFloat v25 = v21;
    CGFloat v26 = v19;
    CGFloat v27 = v17;
    CGFloat v28 = v15;
    if (!v50[0])
    {
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v11, a4, v10, v15, v17, v19, v21, 0.0);
      CGFloat v28 = v29;
      CGFloat v27 = v30;
      CGFloat v26 = v31;
      CGFloat v25 = v32;
    }
    id v24 = v24;
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v24 CGColor]);
    v51.origin.CGFloat x = v28;
    v51.origin.CGFloat y = v27;
    v51.size.CGFloat width = v26;
    v51.size.CGFloat height = v25;
    CGContextFillRect(a4, v51);
  }
LABEL_13:
  [v10 strokeWidth];
  if (v33 > 0.0)
  {
    CGFloat v34 = [v10 strokeColor];

    if (v34)
    {
      if ([v10 brushStyle])
      {
        v52.origin.CGFloat x = v15;
        v52.origin.CGFloat y = v17;
        v52.size.CGFloat width = v19;
        v52.size.CGFloat height = v21;
        CGPathRef v35 = CGPathCreateWithRect(v52, 0);
        if (v35)
        {
          double v36 = v35;
          v47 = +[AKTSDBezierPath bezierPathWithCGPath:v35];
          uint64_t v37 = [v10 brushStyle];
          double v38 = [v10 strokeColor];
          [v10 strokeWidth];
          CGRect v39 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v37, v38);

          CGRect v40 = objc_alloc_init(AKTSDShape);
          [(AKTSDShape *)v40 setStroke:v39];
          [(AKTSDShape *)v40 setPath:v47];
          [(AKTSDShape *)v40 drawInContext:a4];
          CGPathRelease(v36);

          unint64_t v13 = 0x26B823000;
        }
      }
      else
      {
        if (!v50[0])
        {
          [v10 strokeWidth];
          +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v11, a4, v10, v15, v17, v19, v21, v41);
          double v15 = v42;
          double v17 = v43;
          double v19 = v44;
          double v21 = v45;
        }
        id v46 = [v10 strokeColor];
        CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v46 CGColor]);

        [v10 strokeWidth];
        +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
        if ([v10 isDashed])
        {
          [v10 strokeWidth];
          +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
        }
        v53.origin.CGFloat x = v15;
        v53.origin.CGFloat y = v17;
        v53.size.CGFloat width = v19;
        v53.size.CGFloat height = v21;
        CGContextStrokeRect(a4, v53);
      }
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
  CGContextRestoreGState(a4);
  if (v12) {
    [(id)(v13 + 3984) endShadowInContext:a4];
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  [v9 rectangle];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a1 _concreteDraggingBoundsInsetsForAnnotation:v9];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v40.origin.CGFloat x = v11;
  v40.origin.CGFloat y = v13;
  v40.size.CGFloat width = v15;
  v40.size.CGFloat height = v17;
  CGRect v41 = CGRectInset(v40, v19, v21);
  CGFloat v22 = v41.origin.x;
  CGFloat v23 = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  char v36 = 0;
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v9, &v36, 0, 0, 0, 0, 0, 0);
  if (v36)
  {
    v42.origin.CGFloat x = v22;
    v42.origin.CGFloat y = v23;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGFloat v26 = CGPathCreateWithRect(v42, &v35);
    v37.CGFloat x = x;
    v37.CGFloat y = y;
    if (CGPathContainsPoint(v26, 0, v37, 0))
    {
LABEL_3:
      BOOL v27 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v43.origin.CGFloat x = v22;
    v43.origin.CGFloat y = v23;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    v39.CGFloat x = x;
    v39.CGFloat y = y;
    CGFloat v26 = 0;
    if (CGRectContainsPoint(v43, v39)) {
      goto LABEL_3;
    }
  }
  [v9 strokeWidth];
  if (v28 <= 0.0
    || ([v9 strokeColor],
        double v29 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x263F1C550] clearColor],
        double v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v29 akIsEqualToColor:v30],
        v30,
        v29,
        (v31 & 1) != 0))
  {
    BOOL v27 = 0;
  }
  else
  {
    [v9 strokeWidth];
    if (v32 > a5) {
      a5 = v32;
    }
    if (!v26)
    {
      v44.origin.CGFloat x = v22;
      v44.origin.CGFloat y = v23;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      CGFloat v26 = CGPathCreateWithRect(v44, &v35);
    }
    double v33 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v26 withStrokeWidth:a5];
    v38.CGFloat x = x;
    v38.CGFloat y = y;
    BOOL v27 = CGPathContainsPoint(v33, 0, v38, 0);
    CGPathRelease(v33);
  }
LABEL_13:
  CGPathRelease(v26);

  return v27;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end