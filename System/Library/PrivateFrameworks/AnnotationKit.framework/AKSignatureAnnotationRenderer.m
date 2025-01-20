@interface AKSignatureAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKSignatureAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  CGRect v16 = CGRectInset(v15, -1.0, -1.0);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  [v3 rotationAngle];
  double v9 = v8;

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v9);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = -5.0;
  double v4 = -5.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
  memset(&v95, 0, sizeof(v95));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  CGAffineTransform transform = v95;
  CGContextConcatCTM(a4, &transform);
  [v10 rectangle];
  CGContextTranslateCTM(a4, v12, v13);
  int64_t v14 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v10 originalExifOrientation]);
  memset(&transform, 0, sizeof(transform));
  [v10 rectangle];
  +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", v14, v15, v16);
  CGAffineTransform v93 = transform;
  CGContextConcatCTM(a4, &v93);
  v17 = [v10 signature];
  v18 = [v17 drawing];

  if (v11 && v7 && v18)
  {
    v19 = [MEMORY[0x263F08B88] currentThread];
    v20 = [v19 threadDictionary];

    v21 = [v20 objectForKey:@"AKAnnotationRendererIsFastPathRenderingOnCurrentThread"];
    int v22 = [v21 BOOLValue];

    if (v22)
    {
      v23 = [v10 signature];
      uint64_t v24 = [v23 path];

      if (v24)
      {

        goto LABEL_8;
      }
      if (qword_268925340 != -1) {
        dispatch_once(&qword_268925340, &unk_26EA57658);
      }
    }
  }
  else if (!v18)
  {
LABEL_8:
    v25 = [v10 signature];
    uint64_t v26 = [v25 path];

    if (v26)
    {
      v27 = [v10 strokeColor];

      if (v27) {
        [v10 strokeColor];
      }
      else {
      id v68 = [MEMORY[0x263F1C550] blackColor];
      }
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v68 CGColor]);

      v69 = [v10 signature];
      [v69 pathBounds];
      double v71 = v70;
      double v73 = v72;
      double v75 = v74;
      double v77 = v76;

      [v10 rectangle];
      +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v14);
      double v80 = v79 / v75;
      if (v79 / v75 >= v78 / v77) {
        double v80 = v78 / v77;
      }
      CGContextScaleCTM(a4, v80, v80);
      CGContextTranslateCTM(a4, -v71, -v73);
      v81 = [v10 signature];
      CGContextAddPath(a4, (CGPathRef)[v81 path]);

      CGContextFillPath(a4);
    }
    goto LABEL_42;
  }
  v28 = [v10 signature];
  v29 = [v28 drawing];

  v30 = [v10 strokeColor];
  if (v30)
  {
    int64_t v86 = v14;
    v31 = [MEMORY[0x263F1C550] blackColor];
    char v32 = [v30 isEqual:v31];

    if (v32)
    {
      v33 = v29;
    }
    else
    {
      id v83 = v11;
      id v84 = v10;
      v85 = a4;
      id v34 = objc_alloc(MEMORY[0x263EFF9D8]);
      v35 = [v29 strokes];
      v36 = (void *)[v34 initWithArray:v35];

      v82 = v29;
      v33 = (void *)[objc_alloc(MEMORY[0x263F14AE0]) initWithStrokes:v36 fromDrawing:v29];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v37 = [v33 strokes];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v89 objects:v96 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v90 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v89 + 1) + 8 * i);
            v43 = (void *)MEMORY[0x263F14B48];
            v44 = [v42 ink];
            v45 = [v43 inkFromInk:v44 color:v30];

            id v46 = (id)[v33 setStroke:v42 ink:v45];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v89 objects:v96 count:16];
        }
        while (v39);
      }

      id v10 = v84;
      a4 = v85;
      id v11 = v83;
    }
    int64_t v14 = v86;
  }
  else
  {
    v33 = v29;
  }
  [v33 bounds];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  [v10 rectangle];
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v14);
  double v57 = v56 / v52;
  if (v56 / v52 >= v55 / v54) {
    double v57 = v55 / v54;
  }
  CGContextScaleCTM(a4, v57, v57);
  double v87 = v48;
  CGContextTranslateCTM(a4, -v48, -v50);
  memset(&v93, 0, sizeof(v93));
  CGContextGetCTM(&v93, a4);
  CGAffineTransform v88 = v93;
  v98.origin.CGFloat x = 0.0;
  v98.origin.CGFloat y = 0.0;
  v98.size.CGFloat width = 1.0;
  v98.size.CGFloat height = 1.0;
  CGRect v99 = CGRectApplyAffineTransform(v98, &v88);
  CGFloat x = v99.origin.x;
  CGFloat y = v99.origin.y;
  CGFloat width = v99.size.width;
  CGFloat height = v99.size.height;
  double v62 = CGRectGetWidth(v99);
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  double v63 = CGRectGetHeight(v100);
  if (v62 >= v63) {
    double v64 = v62;
  }
  else {
    double v64 = v63;
  }
  int Type = CGContextGetType();
  if (Type == 6 || Type == 1) {
    double v64 = v64 + v64;
  }
  v66 = +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v33, v87, v50, v52, v54, v64);
  if (v66)
  {
    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
    v67 = (CGImage *)[v66 akCGImage];
    v101.origin.CGFloat x = v87;
    v101.origin.CGFloat y = v50;
    v101.size.CGFloat width = v52;
    v101.size.CGFloat height = v54;
    CGContextDrawImage(a4, v101, v67);
  }

LABEL_42:
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  [(id)objc_opt_class() _concreteDraggingBoundsInsetsForAnnotation:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v7 rectangle];
  CGRect v26 = CGRectInset(v25, v9, v11);
  CGFloat v12 = v26.origin.x;
  CGFloat v13 = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  char v22 = 0;
  memset(&v21, 0, sizeof(v21));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v7 hasRotation:&v22];

  if (v22)
  {
    CGAffineTransform v19 = v21;
    memset(&m, 0, sizeof(m));
    CGAffineTransformInvert(&m, &v19);
    v27.origin.CGFloat x = v12;
    v27.origin.CGFloat y = v13;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v16 = CGPathCreateWithRect(v27, 0);
    v23.CGFloat x = x;
    v23.CGFloat y = y;
    BOOL v17 = CGPathContainsPoint(v16, &m, v23, 0);
    CGPathRelease(v16);
  }
  else
  {
    v28.origin.CGFloat x = v12;
    v28.origin.CGFloat y = v13;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    v24.CGFloat x = x;
    v24.CGFloat y = y;
    return CGRectContainsPoint(v28, v24);
  }
  return v17;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end