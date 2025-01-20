@interface AKAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (BOOL)annotationShouldAvoidRedrawDuringLiveResize:(id)a3;
+ (BOOL)pointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)pointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)newTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGRect)drawingBoundsOfAnnotation:(id)a3;
+ (CGRect)rectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)textBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (CGSize)draggingBoundsInsetsForAnnotation:(id)a3;
+ (Class)_rendererClassForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_testRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_transformContextToModelCoordinates:(CGContext *)a3 forAnnotation:(id)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)renderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKAnnotationRenderer

+ (CGRect)drawingBoundsOfAnnotation:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v4), "_concreteDrawingBoundsOfAnnotation:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (CGSize)draggingBoundsInsetsForAnnotation:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v4), "_concreteDraggingBoundsInsetsForAnnotation:", v4);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGRect)textBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  id v12 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v12), "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v12, v11, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (CGRect)rectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_concreteRectangleForAnnotation:withTextBounds:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

+ (CGPath)newTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = (CGPath *)objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_newConcreteTextExclusionPathForAnnotation:withOptionalAnnotationRect:", v9, x, y, width, height);

  return v10;
}

+ (void)renderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  double v12 = (void *)[a1 _rendererClassForAnnotation:v10];
  uint64_t v13 = [v10 appearanceOverride];
  if (v13 && (double v14 = (void *)v13, v15 = [v10 shouldUseAppearanceOverride], v14, v15))
  {
    CGContextSaveGState(a4);
    [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
    *(_OWORD *)sdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v56.a = *MEMORY[0x263F000D0];
    long long v46 = *(_OWORD *)&v56.a;
    *(_OWORD *)&v56.c = *(_OWORD *)sx;
    *(_OWORD *)&v56.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v45 = *(_OWORD *)&v56.tx;
    [v10 initialDrawingBoundsForAppearanceOverride];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [v10 drawingBounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    CGFloat v41 = v19;
    CGFloat v42 = v17;
    +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:", v17, v19, v21, v23);
    double v33 = v32;
    double v35 = v34;
    +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:", v25, v27, v29, v31);
    double v43 = v37;
    double v44 = v36;
    CGAffineTransformMakeTranslation(&t2, v36 - v33, v37 - v35);
    *(_OWORD *)&t1.a = v46;
    *(_OWORD *)&t1.c = *(_OWORD *)sx;
    *(_OWORD *)&t1.tdouble x = v45;
    CGAffineTransformConcat(&v56, &t1, &t2);
    if (([v10 editsDisableAppearanceOverride] & 1) == 0)
    {
      v57.origin.double x = v25;
      v57.origin.double y = v27;
      v57.size.double width = v29;
      v57.size.double height = v31;
      double sxa = CGRectGetWidth(v57);
      v58.origin.double x = v42;
      v58.origin.double y = v41;
      v58.size.double width = v21;
      v58.size.double height = v23;
      CGFloat sxb = sxa / CGRectGetWidth(v58);
      v59.origin.double x = v25;
      v59.origin.double y = v27;
      v59.size.double width = v29;
      v59.size.double height = v31;
      double Height = CGRectGetHeight(v59);
      v60.origin.double x = v42;
      v60.origin.double y = v41;
      v60.size.double width = v21;
      v60.size.double height = v23;
      CGFloat v39 = Height / CGRectGetHeight(v60);
      CGAffineTransformMakeTranslation(&v53, -v44, -v43);
      CGAffineTransform v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v53);
      CGAffineTransform v56 = t1;
      CGAffineTransformMakeScale(&v51, sxb, v39);
      CGAffineTransform v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v51);
      CGAffineTransform v56 = t1;
      CGAffineTransformMakeTranslation(&v50, v44, v43);
      CGAffineTransform v52 = v56;
      CGAffineTransformConcat(&t1, &v52, &v50);
      CGAffineTransform v56 = t1;
    }
    CGAffineTransform t1 = v56;
    CGContextConcatCTM(a4, &t1);
    v40 = [v10 appearanceOverride];
    ((void (**)(void, CGContext *))v40)[2](v40, a4);

    CGContextRestoreGState(a4);
  }
  else
  {
    [v12 _concreteRenderAnnotation:v10 intoContext:a4 forDisplay:v7 pageControllerOrNil:v11];
  }
}

+ (BOOL)pointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v9), "_concretePointIsOnBorder:ofAnnotation:minimumBorderThickness:", v9, x, y, a5);

  return (char)a1;
}

+ (BOOL)pointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_rendererClassForAnnotation:", v7), "_concretePointIsOnInside:ofAnnotation:", v7, x, y);

  return (char)a1;
}

+ (BOOL)annotationShouldAvoidRedrawDuringLiveResize:(id)a3
{
  return 0;
}

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", "+[AKAnnotationRenderer _concreteDrawingBoundsOfAnnotation:]");
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", "+[AKAnnotationRenderer _concreteDraggingBoundsInsetsForAnnotation:]");
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "+[AKAnnotationRenderer _concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:]");
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, "+[AKAnnotationRenderer _concreteRectangleForAnnotation:withTextBounds:]");
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

+ (void)_transformContextToModelCoordinates:(CGContext *)a3 forAnnotation:(id)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  sdouble x = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:a4 forDisplay:a5 pageControllerOrNil:a6 outScaleFactor:&sx];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  CGContextScaleCTM(a3, sx, sx);
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v8, v10, v12, v14))CGContextTranslateCTM(a3, -v8, -v10); {
}
  }

+ (void)_testRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  memset(&v49, 0, sizeof(v49));
  CGContextGetCTM(&v49, a4);
  CGFloat v12 = sqrt(v49.c * v49.c + v49.a * v49.a);
  double v13 = sqrt(v49.d * v49.d + v49.b * v49.b);
  [v10 drawingBounds];
  CGFloat v46 = v15;
  CGFloat v47 = v14;
  CGFloat v44 = v17;
  CGFloat v45 = v16;
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
  CGContextScaleCTM(a4, 1.0 / v12, 1.0 / v13);
  CGContextTranslateCTM(a4, 0.5, 0.5);
  CGContextScaleCTM(a4, v12, v13);
  double v48 = 0.0;
  +[AKGeometryHelper effectiveDrawingBoundsForAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11 outScaleFactor:&v48];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v42 = v48;
  double v26 = v12 * v48;
  CGContextSetLineWidth(a4, 1.0 / (v12 * v48));
  v50.origin.CGFloat x = v19;
  v50.origin.CGFloat y = v21;
  v50.size.CGFloat width = v23;
  v50.size.CGFloat height = v25;
  double MinX = CGRectGetMinX(v50);
  v51.origin.CGFloat x = v19;
  v51.origin.CGFloat y = v21;
  v51.size.CGFloat width = v23;
  v51.size.CGFloat height = v25;
  if (MinX < CGRectGetMaxX(v51))
  {
    double v28 = 3.0 / v26;
    do
    {
      v52.origin.CGFloat x = v19;
      v52.origin.CGFloat y = v21;
      v52.size.CGFloat width = v23;
      v52.size.CGFloat height = v25;
      CGFloat MinY = CGRectGetMinY(v52);
      CGContextMoveToPoint(a4, MinX, MinY);
      v53.origin.CGFloat x = v19;
      v53.origin.CGFloat y = v21;
      v53.size.CGFloat width = v23;
      v53.size.CGFloat height = v25;
      CGFloat MaxY = CGRectGetMaxY(v53);
      CGContextAddLineToPoint(a4, MinX, MaxY);
      double MinX = v28 + MinX;
      v54.origin.CGFloat x = v19;
      v54.origin.CGFloat y = v21;
      v54.size.CGFloat width = v23;
      v54.size.CGFloat height = v25;
    }
    while (MinX < CGRectGetMaxX(v54));
  }
  objc_msgSend(MEMORY[0x263F1C550], "blackColor", *(void *)&v42);
  id v31 = objc_claimAutoreleasedReturnValue();
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v31 CGColor]);

  CGContextStrokePath(a4);
  v55.origin.CGFloat x = v19;
  v55.origin.CGFloat y = v21;
  v55.size.CGFloat width = v23;
  v55.size.CGFloat height = v25;
  double v32 = CGRectGetMinY(v55);
  v56.origin.CGFloat x = v19;
  v56.origin.CGFloat y = v21;
  v56.size.CGFloat width = v23;
  v56.size.CGFloat height = v25;
  if (v32 < CGRectGetMaxY(v56))
  {
    do
    {
      v57.origin.CGFloat x = v19;
      v57.origin.CGFloat y = v21;
      v57.size.CGFloat width = v23;
      v57.size.CGFloat height = v25;
      CGFloat v33 = CGRectGetMinX(v57);
      CGContextMoveToPoint(a4, v33, v32);
      v58.origin.CGFloat x = v19;
      v58.origin.CGFloat y = v21;
      v58.size.CGFloat width = v23;
      v58.size.CGFloat height = v25;
      CGFloat MaxX = CGRectGetMaxX(v58);
      CGContextAddLineToPoint(a4, MaxX, v32);
      double v32 = 3.0 / (v13 * v43) + v32;
      v59.origin.CGFloat x = v19;
      v59.origin.CGFloat y = v21;
      v59.size.CGFloat width = v23;
      v59.size.CGFloat height = v25;
    }
    while (v32 < CGRectGetMaxY(v59));
  }
  id v35 = [MEMORY[0x263F1C550] blueColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v35 CGColor]);

  CGContextStrokePath(a4);
  id v36 = [MEMORY[0x263F1C550] redColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v36 CGColor]);

  v60.origin.CGFloat x = v47;
  v60.origin.CGFloat y = v46;
  v60.size.CGFloat width = v45;
  v60.size.CGFloat height = v44;
  CGContextStrokeRect(a4, v60);
  v61.origin.CGFloat x = v47;
  v61.origin.CGFloat y = v46;
  v61.size.CGFloat width = v45;
  v61.size.CGFloat height = v44;
  CGRect v62 = CGRectInset(v61, 5.0, 5.0);
  CGFloat x = v62.origin.x;
  CGFloat y = v62.origin.y;
  CGFloat width = v62.size.width;
  CGFloat height = v62.size.height;
  id v41 = [MEMORY[0x263F1C550] yellowColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v41 CGColor]);

  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  CGContextStrokeRect(a4, v63);
}

+ (Class)_rendererClassForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_10:
    double v4 = objc_opt_class();
  }
  else
  {
    double v4 = 0;
  }
  double v5 = v4;

  return v5;
}

@end