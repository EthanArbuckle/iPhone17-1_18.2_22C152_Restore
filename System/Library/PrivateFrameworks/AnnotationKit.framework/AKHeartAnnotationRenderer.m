@interface AKHeartAnnotationRenderer
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

@implementation AKHeartAnnotationRenderer

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
  double x = v67.origin.x;
  double y = v67.origin.y;
  double width = v67.size.width;
  double height = v67.size.height;
  double MidX = CGRectGetMidX(v67);
  v68.origin.double x = x;
  v68.origin.double y = y;
  v68.size.double width = width;
  v68.size.double height = height;
  double MidY = CGRectGetMidY(v68);
  int64_t v10 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v3 originalExifOrientation]);
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v10, x, y, width, height, MidX, MidY);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  Mutable = CGPathCreateMutable();
  if (Mutable)
  {
    v69.origin.double x = v12;
    v69.origin.double y = v14;
    v69.size.double width = v16;
    v69.size.double height = v18;
    CGFloat v20 = CGRectGetMidX(v69);
    v70.origin.double x = v12;
    v70.origin.double y = v14;
    v70.size.double width = v16;
    v70.size.double height = v18;
    CGFloat MinY = CGRectGetMinY(v70);
    CGPathMoveToPoint(Mutable, 0, v20, MinY);
    v71.origin.double x = v12;
    v71.origin.double y = v14;
    v71.size.double width = v16;
    v71.size.double height = v18;
    CGFloat MinX = CGRectGetMinX(v71);
    v72.origin.double x = v12;
    v72.origin.double y = v14;
    v72.size.double width = v16;
    v72.size.double height = v18;
    double v23 = CGRectGetMinY(v72);
    v73.origin.double x = v12;
    v73.origin.double y = v14;
    v73.size.double width = v16;
    v73.size.double height = v18;
    uint64_t v59 = 0x3FD6666666666666;
    CGFloat v24 = v23 + CGRectGetHeight(v73) * 0.35;
    v74.origin.double x = v12;
    v74.origin.double y = v14;
    v74.size.double width = v16;
    v74.size.double height = v18;
    double v61 = MidX;
    CGFloat v25 = CGRectGetMinX(v74);
    v75.origin.double x = v12;
    v75.origin.double y = v14;
    v75.size.double width = v16;
    v75.size.double height = v18;
    double v60 = MidY;
    double v26 = CGRectGetMinY(v75);
    v76.origin.double x = v12;
    v76.origin.double y = v14;
    v76.size.double width = v16;
    v76.size.double height = v18;
    CGFloat v27 = CGRectGetHeight(v76);
    CGPathAddQuadCurveToPoint(Mutable, 0, MinX, v24, v25, v26 + v27 * 0.7);
    v77.origin.double x = v12;
    v77.origin.double y = v14;
    v77.size.double width = v16;
    v77.size.double height = v18;
    double v28 = CGRectGetMinX(v77);
    v78.origin.double x = v12;
    v78.origin.double y = v14;
    v78.size.double width = v16;
    v78.size.double height = v18;
    CGFloat v29 = v28 + CGRectGetWidth(v78) * 0.01;
    v79.origin.double x = v12;
    v79.origin.double y = v14;
    v79.size.double width = v16;
    v79.size.double height = v18;
    CGFloat MaxY = CGRectGetMaxY(v79);
    v80.origin.double x = v12;
    v80.origin.double y = v14;
    v80.size.double width = v16;
    v80.size.double height = v18;
    double v31 = CGRectGetMinX(v80);
    v81.origin.double x = v12;
    v81.origin.double y = v14;
    v81.size.double width = v16;
    v81.size.double height = v18;
    CGFloat v32 = v31 + CGRectGetWidth(v81) * 0.25;
    v82.origin.double x = v12;
    v82.origin.double y = v14;
    v82.size.double width = v16;
    v82.size.double height = v18;
    CGFloat v33 = CGRectGetMaxY(v82);
    CGPathAddQuadCurveToPoint(Mutable, 0, v29, MaxY, v32, v33);
    v83.origin.double x = v12;
    v83.origin.double y = v14;
    v83.size.double width = v16;
    v83.size.double height = v18;
    CGFloat v34 = CGRectGetMidX(v83);
    v84.origin.double x = v12;
    v84.origin.double y = v14;
    v84.size.double width = v16;
    v84.size.double height = v18;
    CGFloat v35 = CGRectGetMaxY(v84);
    v85.origin.double x = v12;
    v85.origin.double y = v14;
    v85.size.double width = v16;
    v85.size.double height = v18;
    CGFloat v36 = CGRectGetMidX(v85);
    v86.origin.double x = v12;
    v86.origin.double y = v14;
    v86.size.double width = v16;
    v86.size.double height = v18;
    double v37 = CGRectGetMinY(v86);
    v87.origin.double x = v12;
    v87.origin.double y = v14;
    v87.size.double width = v16;
    v87.size.double height = v18;
    CGFloat v38 = CGRectGetHeight(v87);
    CGPathAddQuadCurveToPoint(Mutable, 0, v34, v35, v36, v37 + v38 * 0.7);
    v88.origin.double x = v12;
    v88.origin.double y = v14;
    v88.size.double width = v16;
    v88.size.double height = v18;
    CGFloat v39 = CGRectGetMidX(v88);
    v89.origin.double x = v12;
    v89.origin.double y = v14;
    v89.size.double width = v16;
    v89.size.double height = v18;
    CGFloat v40 = CGRectGetMaxY(v89);
    v90.origin.double x = v12;
    v90.origin.double y = v14;
    v90.size.double width = v16;
    v90.size.double height = v18;
    double v41 = CGRectGetMinX(v90);
    v91.origin.double x = v12;
    v91.origin.double y = v14;
    v91.size.double width = v16;
    v91.size.double height = v18;
    CGFloat v42 = v41 + CGRectGetWidth(v91) * 0.75;
    v92.origin.double x = v12;
    v92.origin.double y = v14;
    v92.size.double width = v16;
    v92.size.double height = v18;
    CGFloat v43 = CGRectGetMaxY(v92);
    CGPathAddQuadCurveToPoint(Mutable, 0, v39, v40, v42, v43);
    v93.origin.double x = v12;
    v93.origin.double y = v14;
    v93.size.double width = v16;
    v93.size.double height = v18;
    CGFloat MaxX = CGRectGetMaxX(v93);
    v94.origin.double x = v12;
    v94.origin.double y = v14;
    v94.size.double width = v16;
    v94.size.double height = v18;
    CGFloat v45 = CGRectGetMaxY(v94);
    v95.origin.double x = v12;
    v95.origin.double y = v14;
    v95.size.double width = v16;
    v95.size.double height = v18;
    CGFloat v46 = CGRectGetMaxX(v95);
    v96.origin.double x = v12;
    v96.origin.double y = v14;
    v96.size.double width = v16;
    v96.size.double height = v18;
    double v47 = CGRectGetMinY(v96);
    v97.origin.double x = v12;
    v97.origin.double y = v14;
    v97.size.double width = v16;
    v97.size.double height = v18;
    CGFloat v48 = CGRectGetHeight(v97);
    CGPathAddQuadCurveToPoint(Mutable, 0, MaxX, v45, v46, v47 + v48 * 0.7);
    v98.origin.double x = v12;
    v98.origin.double y = v14;
    v98.size.double width = v16;
    v98.size.double height = v18;
    CGFloat v49 = CGRectGetMaxX(v98);
    v99.origin.double x = v12;
    v99.origin.double y = v14;
    v99.size.double width = v16;
    v99.size.double height = v18;
    double v50 = CGRectGetMinY(v99);
    v100.origin.double x = v12;
    v100.origin.double y = v14;
    v100.size.double width = v16;
    v100.size.double height = v18;
    CGFloat v51 = v50 + CGRectGetHeight(v100) * 0.35;
    v101.origin.double x = v12;
    v101.origin.double y = v14;
    v101.size.double width = v16;
    v101.size.double height = v18;
    CGFloat v52 = CGRectGetMidX(v101);
    v102.origin.double x = v12;
    v102.origin.double y = v14;
    v102.size.double width = v16;
    v102.size.double height = v18;
    CGFloat v53 = CGRectGetMinY(v102);
    CGFloat v54 = v49;
    CGFloat v55 = v51;
    double MidY = v60;
    double MidX = v61;
    CGPathAddQuadCurveToPoint(Mutable, 0, v54, v55, v52, v53);
    CGPathCloseSubpath(Mutable);
  }
  long long v56 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v66.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v66.c = v56;
  *(_OWORD *)&v66.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (objc_msgSend(v3, "verticallyFlipped", v59))
  {
    [v3 rectangle];
    +[AKGeometryHelper verticalFlipTransformForRect:](AKGeometryHelper, "verticalFlipTransformForRect:");
    CGAffineTransform t1 = v66;
    CGAffineTransformConcat(&v66, &t1, &t2);
  }
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v10, MidX, MidY);
  CGAffineTransform v62 = v66;
  CGAffineTransformConcat(&t1, &v62, &v63);
  CGAffineTransform v66 = t1;
  if (Mutable)
  {
    v57 = (CGPath *)MEMORY[0x237E1D700](Mutable, &v66);
    CGPathRelease(Mutable);
  }
  else
  {
    v57 = 0;
  }

  return v57;
}

@end