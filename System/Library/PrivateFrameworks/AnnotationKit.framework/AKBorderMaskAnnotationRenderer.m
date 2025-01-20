@interface AKBorderMaskAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKBorderMaskAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F00190];
  double v4 = *(double *)(MEMORY[0x263F00190] + 8);
  double v5 = *(double *)(MEMORY[0x263F00190] + 16);
  double v6 = *(double *)(MEMORY[0x263F00190] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v47 = a3;
  id v10 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v47 forDisplay:v7 pageControllerOrNil:v10];
  [v47 rectangle];
  if (v10 && CGRectIsInfinite(*(CGRect *)&v11))
  {
    v15 = [v10 controller];
    v16 = [v15 undoController];
    v17 = [v16 undoManager];

    int v18 = [v17 isUndoRegistrationEnabled];
    if (v18) {
      [v17 disableUndoRegistration];
    }
    [v10 maxPageRect];
    CGFloat x = v19;
    CGFloat y = v21;
    CGFloat width = v23;
    CGFloat height = v25;
    v27 = [v10 pageModelController];
    v28 = [v27 cropAnnotation];

    if (v28)
    {
      [v28 rectangle];
      v56.origin.CGFloat x = v29;
      v56.origin.CGFloat y = v30;
      v56.size.CGFloat width = v31;
      v56.size.CGFloat height = v32;
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      CGRect v50 = CGRectIntersection(v49, v56);
      CGFloat x = v50.origin.x;
      CGFloat y = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat height = v50.size.height;
    }
    [v47 originalModelBaseScaleFactor];
    double v34 = v33 * 50.0;
    [v47 originalModelBaseScaleFactor];
    double v36 = v35 * 10.0;
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double v37 = CGRectGetWidth(v51) * 0.5 - v36;
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    double v38 = CGRectGetHeight(v52) * 0.5 - v36;
    if (v34 >= v37) {
      CGFloat v39 = v37;
    }
    else {
      CGFloat v39 = v34;
    }
    if (v34 >= v38) {
      CGFloat v40 = v38;
    }
    else {
      CGFloat v40 = v34;
    }
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGRect v54 = CGRectInset(v53, v39, v40);
    CGRect v55 = CGRectStandardize(v54);
    objc_msgSend(v47, "setRectangle:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
    if (v18) {
      [v17 enableUndoRegistration];
    }
  }
  v41 = (const CGPath *)[a1 _newClipMaskEOPathForAnnotation:v47];
  v42 = [v47 fillColor];
  v43 = v42;
  if (!v42 || ([v42 akAlphaComponent], v44 < 0.01))
  {
    uint64_t v45 = [MEMORY[0x263F1C550] akColorWithWhite:0.0 alpha:0.33];

    v43 = (void *)v45;
  }
  id v46 = v43;
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v46 CGColor]);
  CGContextAddPath(a4, v41);
  CGContextEOFillPath(a4);
  CGPathRelease(v41);
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
  [a4 rectangle];
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return !CGRectContainsPoint(v8, v7);
}

+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3
{
  [a3 rectangle];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGRect v14 = CGRectInset(v13, -100000000.0, -100000000.0);
  CGFloat v7 = v14.origin.x;
  CGFloat v8 = v14.origin.y;
  CGFloat v9 = v14.size.width;
  CGFloat v10 = v14.size.height;
  Mutable = CGPathCreateMutable();
  v15.origin.CGFloat x = v7;
  v15.origin.CGFloat y = v8;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v10;
  CGPathAddRect(Mutable, 0, v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v16);
  return Mutable;
}

@end