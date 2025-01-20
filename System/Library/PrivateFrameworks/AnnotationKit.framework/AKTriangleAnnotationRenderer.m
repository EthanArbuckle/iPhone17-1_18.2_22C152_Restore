@interface AKTriangleAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)_newPathScaledToModelSpaceForAnnotation:(id)a3;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKTriangleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 strokeWidth];
  CGFloat v13 = v12 * -4.0;
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
    CGFloat v21 = (const CGPath *)[a1 _newPathScaledToModelSpaceForAnnotation:v9];
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

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  uint64_t v12 = [a1 _newPathScaledToModelSpaceForAnnotation:v10];
  if (v12)
  {
    CGFloat v13 = (const CGPath *)v12;
    [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
    int v14 = [v10 hasShadow];
    if (v14) {
      +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v10];
    }
    CGContextSaveGState(a4);
    memset(&v29[1], 0, sizeof(CGAffineTransform));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
    v29[0] = v29[1];
    CGContextConcatCTM(a4, v29);
    CGContextSaveGState(a4);
    uint64_t v15 = [v10 fillColor];
    if (v15)
    {
      double v16 = (void *)v15;
      id v17 = [v10 fillColor];
      double Alpha = CGColorGetAlpha((CGColorRef)[v17 CGColor]);

      if (Alpha != 0.0)
      {
        id v19 = [v10 fillColor];
        CGContextSetFillColorWithColor(a4, (CGColorRef)[v19 CGColor]);

        CGContextAddPath(a4, v13);
        CGContextFillPath(a4);
      }
    }
    CGFloat v20 = [v10 strokeColor];

    if (v20)
    {
      if ([v10 brushStyle])
      {
        uint64_t v21 = [v10 brushStyle];
        CGFloat v22 = [v10 strokeColor];
        [v10 strokeWidth];
        CGFloat v23 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v21, v22);

        CGFloat v24 = +[AKTSDBezierPath bezierPathWithCGPath:v13];
        CGFloat v25 = objc_alloc_init(AKTSDShape);
        [(AKTSDShape *)v25 setStroke:v23];
        [(AKTSDShape *)v25 setPath:v24];
        [(AKTSDShape *)v25 drawInContext:a4];
      }
      else
      {
        [v10 strokeWidth];
        double v27 = v26;
        id v28 = [v10 strokeColor];
        CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v28 CGColor]);

        +[AKAnnotationRendererUtilities setStandardLineStateInContext:a4 forLineWidth:v27];
        if ([v10 isDashed]) {
          +[AKAnnotationRendererUtilities setStandardLineDashInContext:a4 forLineWidth:v27];
        }
        CGContextAddPath(a4, v13);
        CGContextStrokePath(a4);
      }
    }
    CGContextRestoreGState(a4);
    +[AKTextAnnotationRenderHelper renderAnnotationText:v10 intoContext:a4 isForScreen:v7 pageControllerOrNil:v11];
    CGContextRestoreGState(a4);
    if (v14) {
      +[AKAnnotationRendererUtilities endShadowInContext:a4];
    }
    CGPathRelease(v13);
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = (const CGPath *)[a1 _newPathScaledToModelSpaceForAnnotation:v9];
  [v9 strokeWidth];
  if (v11 <= a5) {
    double v11 = a5;
  }
  uint64_t v12 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:v10 withStrokeWidth:v11];
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
  id v8 = (const CGPath *)[a1 _newPathScaledToModelSpaceForAnnotation:v7];
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

+ (CGPath)_newPathScaledToModelSpaceForAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double v4 = v55.origin.x;
  double v5 = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  double MidX = CGRectGetMidX(v55);
  v56.origin.CGFloat x = v4;
  v56.origin.CGFloat y = v5;
  v56.size.double width = width;
  v56.size.double height = height;
  double MidY = CGRectGetMidY(v56);
  int64_t v10 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v3 originalExifOrientation]);
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v10, v4, v5, width, height, MidX, MidY);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [v3 path];

  CGFloat v20 = (_OWORD *)MEMORY[0x263F000D0];
  if (v19)
  {
    uint64_t v21 = [v3 path];
    CGFloat v22 = (const CGPath *)[v21 newCGPathForPlatformBezierPath];

    BoundingBoCGFloat x = CGPathGetBoundingBox(v22);
    CGFloat v23 = v16 / fmax(BoundingBox.size.width, 0.0005);
    *(_OWORD *)xb = v20[1];
    *(_OWORD *)&v54.a = *v20;
    *(_OWORD *)yb = *(_OWORD *)&v54.a;
    *(_OWORD *)&v54.c = *(_OWORD *)xb;
    CGFloat v24 = v18 / fmax(BoundingBox.size.height, 0.0005);
    *(_OWORD *)&v54.tCGFloat x = v20[2];
    *(_OWORD *)CGFloat v34 = *(_OWORD *)&v54.tx;
    CGAffineTransformMakeTranslation(&t2, -BoundingBox.origin.x, -BoundingBox.origin.y);
    *(_OWORD *)&t1.a = *(_OWORD *)yb;
    *(_OWORD *)&t1.c = *(_OWORD *)xb;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)v34;
    CGAffineTransformConcat(&v54, &t1, &t2);
    CGAffineTransformMakeScale(&v51, v23, v24);
    CGAffineTransform v50 = v54;
    CGAffineTransformConcat(&t1, &v50, &v51);
    CGAffineTransform v54 = t1;
    CGAffineTransformMakeTranslation(&v49, v12, v14);
    CGAffineTransform v50 = v54;
    CGAffineTransformConcat(&t1, &v50, &v49);
    CGAffineTransform v54 = t1;
    CGFloat v25 = (CGPath *)MEMORY[0x237E1D700](v22, &v54);
    CGPathRelease(v22);
  }
  else
  {
    v58.origin.CGFloat x = v12;
    v58.origin.CGFloat y = v14;
    v58.size.double width = v16;
    v58.size.double height = v18;
    CGFloat x = CGRectGetMinX(v58);
    v59.origin.CGFloat x = v12;
    v59.origin.CGFloat y = v14;
    v59.size.double width = v16;
    v59.size.double height = v18;
    CGFloat y = CGRectGetMinY(v59);
    v60.origin.CGFloat x = v12;
    v60.origin.CGFloat y = v14;
    v60.size.double width = v16;
    v60.size.double height = v18;
    CGFloat MaxX = CGRectGetMaxX(v60);
    v61.origin.CGFloat x = v12;
    v61.origin.CGFloat y = v14;
    v61.size.double width = v16;
    v61.size.double height = v18;
    CGFloat MinY = CGRectGetMinY(v61);
    v62.origin.CGFloat x = v12;
    v62.origin.CGFloat y = v14;
    v62.size.double width = v16;
    v62.size.double height = v18;
    CGFloat v27 = CGRectGetMidX(v62);
    v63.origin.CGFloat x = v12;
    v63.origin.CGFloat y = v14;
    v63.size.double width = v16;
    v63.size.double height = v18;
    CGFloat MaxY = CGRectGetMaxY(v63);
    Mutable = CGPathCreateMutable();
    CGFloat v25 = Mutable;
    if (Mutable)
    {
      CGPathMoveToPoint(Mutable, 0, x, y);
      CGPathAddLineToPoint(v25, 0, MaxX, MinY);
      CGPathAddLineToPoint(v25, 0, v27, MaxY);
      CGPathCloseSubpath(v25);
    }
  }
  *(_OWORD *)ya = v20[1];
  *(_OWORD *)xa = *v20;
  *(_OWORD *)&v54.a = *v20;
  *(_OWORD *)&v54.c = *(_OWORD *)ya;
  *(_OWORD *)&v54.tCGFloat x = v20[2];
  v36[1] = v54.ty;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v10, MidX, MidY, *(void *)&v54.tx);
  CGAffineTransform t1 = v54;
  CGAffineTransformConcat(&v54, &t1, &v48);
  if (([v3 horizontallyFlipped] & 1) != 0 || objc_msgSend(v3, "verticallyFlipped"))
  {
    *(_OWORD *)&t1.a = *(_OWORD *)xa;
    *(_OWORD *)&t1.c = *(_OWORD *)ya;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)v36;
    CGAffineTransformMakeTranslation(&v47, -MidX, -MidY);
    *(_OWORD *)&v50.a = *(_OWORD *)xa;
    *(_OWORD *)&v50.c = *(_OWORD *)ya;
    *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)v36;
    CGAffineTransformConcat(&t1, &v50, &v47);
    if ([v3 horizontallyFlipped]) {
      double v30 = -1.0;
    }
    else {
      double v30 = 1.0;
    }
    if ([v3 verticallyFlipped]) {
      double v31 = -1.0;
    }
    else {
      double v31 = 1.0;
    }
    CGAffineTransformMakeScale(&v46, v30, v31);
    CGAffineTransform v45 = t1;
    CGAffineTransformConcat(&v50, &v45, &v46);
    CGAffineTransform t1 = v50;
    CGAffineTransformMakeTranslation(&v44, MidX, MidY);
    CGAffineTransform v45 = t1;
    CGAffineTransformConcat(&v50, &v45, &v44);
    CGAffineTransform t1 = v50;
    CGAffineTransform v45 = v54;
    CGAffineTransform v43 = v50;
    CGAffineTransformConcat(&v50, &v45, &v43);
    CGAffineTransform v54 = v50;
  }
  if (v25)
  {
    double v32 = (CGPath *)MEMORY[0x237E1D700](v25, &v54);
    CGPathRelease(v25);
  }
  else
  {
    double v32 = 0;
  }

  return v32;
}

@end