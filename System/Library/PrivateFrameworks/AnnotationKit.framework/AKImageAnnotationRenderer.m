@interface AKImageAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKImageAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 rotationAngle];
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v5, v7, v9, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if ([v3 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v14, v16, v18, v20);
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
  }
  v33.origin.CGFloat x = v14;
  v33.origin.CGFloat y = v16;
  v33.size.CGFloat width = v18;
  v33.size.CGFloat height = v20;
  CGRect v34 = CGRectInset(v33, -1.0, -1.0);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
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
  memset(&v40, 0, sizeof(v40));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v10 hasRotation:0];
  CGAffineTransform transform = v40;
  CGContextConcatCTM(a4, &transform);
  [v10 rectangle];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (([v10 horizontallyFlipped] & 1) != 0 || objc_msgSend(v10, "verticallyFlipped"))
  {
    v41.origin.CGFloat x = v14;
    v41.origin.CGFloat y = v16;
    v41.size.CGFloat width = v18;
    v41.size.CGFloat height = v20;
    double MidX = CGRectGetMidX(v41);
    v42.origin.CGFloat x = v14;
    v42.origin.CGFloat y = v16;
    v42.size.CGFloat width = v18;
    v42.size.CGFloat height = v20;
    double MidY = CGRectGetMidY(v42);
    CGAffineTransformMakeTranslation(&v38, MidX, MidY);
    CGContextConcatCTM(a4, &v38);
    if ([v10 horizontallyFlipped]) {
      double v22 = -1.0;
    }
    else {
      double v22 = 1.0;
    }
    if ([v10 verticallyFlipped]) {
      double v23 = -1.0;
    }
    else {
      double v23 = 1.0;
    }
    CGAffineTransformMakeScale(&v37, v22, v23);
    CGContextConcatCTM(a4, &v37);
    CGAffineTransformMakeTranslation(&v36, -MidX, -MidY);
    CGContextConcatCTM(a4, &v36);
  }
  CGAffineTransformMakeTranslation(&v35, v14, v16);
  CGContextConcatCTM(a4, &v35);
  double v24 = *MEMORY[0x263F00148];
  double v25 = *(double *)(MEMORY[0x263F00148] + 8);
  int64_t v26 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v10 originalExifOrientation]);
  memset(&transform, 0, sizeof(transform));
  +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", v26, v18, v20);
  CGAffineTransform v34 = transform;
  CGContextConcatCTM(a4, &v34);
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v26, v24, v25, v18, v20, v24, v25);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  double v31 = [v10 image];
  double v32 = (CGImage *)[v31 akCGImage];

  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  v43.origin.CGFloat x = v24;
  v43.origin.CGFloat y = v25;
  v43.size.CGFloat width = v28;
  v43.size.CGFloat height = v30;
  CGContextDrawImage(a4, v43, v32);
  CGContextRestoreGState(a4);
  if (v12) {
    +[AKAnnotationRendererUtilities endShadowInContext:a4];
  }
  CGContextRestoreGState(a4);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = a4;
  [v6 rectangle];
  BOOL v7 = CGPathCreateWithRect(v13, 0);
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:v6 hasRotation:0];

  CGAffineTransform v9 = m;
  CGAffineTransformInvert(&v10, &v9);
  CGAffineTransform m = v10;
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  LOBYTE(v6) = CGPathContainsPoint(v7, &m, v12, 0);
  CGPathRelease(v7);
  return (char)v6;
}

@end