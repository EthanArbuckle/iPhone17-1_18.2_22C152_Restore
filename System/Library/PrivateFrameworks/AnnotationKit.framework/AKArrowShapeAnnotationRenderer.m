@interface AKArrowShapeAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_drawPathForArrowShape:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)Mutable;
@end

@implementation AKArrowShapeAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4 = a3;
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrowShape:v4 inContext:0 inPath:Mutable];
  BoundingBoCGFloat x = CGPathGetBoundingBox(Mutable);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  CGPathRelease(Mutable);
  [v4 strokeWidth];
  CGFloat v11 = v10 * -4.0;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRect v30 = CGRectInset(v29, v11, v11);
  double v12 = v30.origin.x;
  double v13 = v30.origin.y;
  double v14 = v30.size.width;
  double v15 = v30.size.height;
  if ([v4 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v4, v12, v13, v14, v15);
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
  }
  v31.origin.CGFloat x = v12;
  v31.origin.CGFloat y = v13;
  v31.size.CGFloat width = v14;
  v31.size.CGFloat height = v15;
  CGRect v32 = CGRectInset(v31, -1.0, -1.0);
  CGFloat v20 = v32.origin.x;
  CGFloat v21 = v32.origin.y;
  CGFloat v22 = v32.size.width;
  CGFloat v23 = v32.size.height;

  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
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

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  id v5 = a3;
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrowShape:v5 inContext:0 inPath:Mutable];

  v7 = CGPathCreateMutable();
  CGPathAddPath(v7, 0, Mutable);
  CGPathRelease(Mutable);
  MutableCopCGFloat y = CGPathCreateMutableCopy(v7);
  CGPathRelease(v7);
  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v25 = a3;
  id v10 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v25 forDisplay:v7 pageControllerOrNil:v10];
  int v11 = [v25 hasShadow];
  if (v11) {
    +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v25];
  }
  CGContextSaveGState(a4);
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrowShape:v25 inContext:0 inPath:Mutable];
  uint64_t v13 = [v25 fillColor];
  if (v13)
  {
    double v14 = (void *)v13;
    id v15 = [v25 fillColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v15 CGColor]);

    if (Alpha != 0.0)
    {
      id v17 = [v25 fillColor];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v17 CGColor]);

      CGContextAddPath(a4, Mutable);
      CGContextFillPath(a4);
    }
  }
  double v18 = [v25 strokeColor];

  if (v18)
  {
    if ([v25 brushStyle])
    {
      uint64_t v19 = [v25 brushStyle];
      CGFloat v20 = [v25 strokeColor];
      [v25 strokeWidth];
      CGFloat v21 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v19, v20);

      CGFloat v22 = +[AKTSDBezierPath bezierPathWithCGPath:Mutable];
      CGFloat v23 = objc_alloc_init(AKTSDShape);
      [(AKTSDShape *)v23 setStroke:v21];
      [(AKTSDShape *)v23 setPath:v22];
      [(AKTSDShape *)v23 drawInContext:a4];
    }
    else
    {
      id v24 = [v25 strokeColor];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v24 CGColor]);

      [v25 strokeWidth];
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if ([v25 isDashed])
      {
        [v25 strokeWidth];
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, Mutable);
      CGContextStrokePath(a4);
    }
  }
  CGPathRelease(Mutable);
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:v25 intoContext:a4 isForScreen:v7 pageControllerOrNil:v10];
  if (v11) {
    +[AKAnnotationRendererUtilities endShadowInContext:a4];
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrowShape:v9 inContext:0 inPath:Mutable];
  [v9 strokeWidth];
  double v12 = v11;

  if (v12 <= a5) {
    double v13 = a5;
  }
  else {
    double v13 = v12;
  }
  double v14 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:Mutable withStrokeWidth:v13];
  v17.CGFloat x = x;
  v17.CGFloat y = y;
  BOOL v15 = CGPathContainsPoint(v14, 0, v17, 0);
  CGPathRelease(v14);
  CGPathRelease(Mutable);
  return v15;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrowShape:v7 inContext:0 inPath:Mutable];

  v10.CGFloat x = x;
  v10.CGFloat y = y;
  LOBYTE(a1) = CGPathContainsPoint(Mutable, 0, v10, 0);
  CGPathRelease(Mutable);
  return (char)a1;
}

+ (void)_drawPathForArrowShape:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)Mutable
{
  id v40 = a3;
  [v40 startPoint];
  double v8 = v7;
  double v10 = v9;
  [v40 endPoint];
  double v12 = v11;
  double v14 = v13;
  [v40 arrowHeadLength];
  double v16 = v15;
  [v40 arrowHeadWidth];
  double v18 = v17;
  [v40 arrowLineWidth];
  double v20 = v19;
  double v38 = v18;
  if (Mutable) {
    CGPathRetain(Mutable);
  }
  else {
    Mutable = CGPathCreateMutable();
  }
  double v21 = v12 - v8;
  double v39 = v10;
  double v22 = v14 - v10;
  double v23 = hypot(v12 - v8, v14 - v10);
  if (v23 > 0.0)
  {
    double v24 = v23;
    if (([v40 arrowHeadStyle] & 2) != 0)
    {
      double v25 = v24 + -0.1;
      if (v24 >= v16) {
        double v25 = v16;
      }
      double v26 = v12 - v21 * v25 / v24;
      double v37 = v8;
      double v27 = v14 - v22 * v25 / v24;
      double v36 = v22 * (v20 * 0.5) / v24;
      double v28 = v21 * (v20 * 0.5) / v24;
      CGPathMoveToPoint(Mutable, 0, v26 - v36, v28 + v27);
      double v29 = v22 * (v38 * 0.5) / v24;
      double v30 = v21 * (v38 * 0.5) / v24;
      CGPathAddLineToPoint(Mutable, 0, v26 - v29, v30 + v27);
      CGPathAddLineToPoint(Mutable, 0, v12, v14);
      CGPathAddLineToPoint(Mutable, 0, v29 + v26, v27 - v30);
      CGPathAddLineToPoint(Mutable, 0, v36 + v26, v27 - v28);
      CGPathAddLineToPoint(Mutable, 0, v37 + v36, v39 - v28);
      CGPathAddLineToPoint(Mutable, 0, v37 - v36, v39 + v28);
      CGPathAddLineToPoint(Mutable, 0, v26 - v36, v28 + v27);
      if (a4)
      {
        uint64_t v31 = [v40 fillColor];
        if (v31)
        {
          CGRect v32 = (void *)v31;
          id v33 = [v40 fillColor];
          double Alpha = CGColorGetAlpha((CGColorRef)[v33 CGColor]);

          if (Alpha != 0.0)
          {
            CGContextAddPath(a4, Mutable);
            CGContextFillPath(a4);
          }
        }
        v35 = [v40 strokeColor];

        if (v35)
        {
          CGContextAddPath(a4, Mutable);
          CGContextStrokePath(a4);
        }
      }
    }
  }
  CGPathRelease(Mutable);
}

@end