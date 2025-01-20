@interface AKHighlightAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_rectForQuad:(AKQuadrilateral *)a3 rotationAngle:(double *)a4;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (double)_highlightOutsetFactor;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_enumerateQuadPathsOfAnnotation:(id)a3 applyStyle:(BOOL)a4 handler:(id)a5;
@end

@implementation AKHighlightAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = (CGRect *)&v15;
  uint64_t v17 = 0x4010000000;
  v18 = &unk_2376FA1DD;
  long long v5 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v19 = *MEMORY[0x263F001A0];
  long long v20 = v5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_237699944;
  v14[3] = &unk_264CDB938;
  v14[4] = &v15;
  [a1 _enumerateQuadPathsOfAnnotation:v4 applyStyle:1 handler:v14];
  if (CGRectIsNull(v16[1]))
  {
    double width = 1.0;
    *(double *)&unint64_t v7 = -10000.0;
    *(double *)&unint64_t v8 = -10000.0;
    double height = 1.0;
  }
  else
  {
    unint64_t v7 = *(unint64_t *)&v16[1].origin.x;
    unint64_t v8 = *(unint64_t *)&v16[1].origin.y;
    double width = v16[1].size.width;
    double height = v16[1].size.height;
  }
  _Block_object_dispose(&v15, 8);

  double v10 = *(double *)&v7;
  double v11 = *(double *)&v8;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
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

  double v12 = [v10 color];

  if (v12)
  {
    id v13 = [v10 color];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v13 CGColor]);
  }
  CGContextSetBlendMode(a4, kCGBlendModeMultiply);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_237699AE0;
  v14[3] = &unk_264CDB958;
  v14[4] = a4;
  [a1 _enumerateQuadPathsOfAnnotation:v10 applyStyle:1 handler:v14];
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
  id v7 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_237699C14;
  v9[3] = &unk_264CDB980;
  v9[4] = &v10;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  [a1 _enumerateQuadPathsOfAnnotation:v7 applyStyle:0 handler:v9];
  LOBYTE(a1) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)a1;
}

+ (CGRect)_rectForQuad:(AKQuadrilateral *)a3 rotationAngle:(double *)a4
{
  if (a4) {
    *a4 = atan2(a3->var3.y - a3->var0.y, a3->var3.x - a3->var0.x);
  }
  double y = a3->var0.y;
  double v6 = sqrt((a3->var3.y - y) * (a3->var3.y - y) + (a3->var3.x - a3->var0.x) * (a3->var3.x - a3->var0.x));
  double v7 = sqrt((a3->var1.y - y) * (a3->var1.y - y) + (a3->var0.x - a3->var1.x) * (a3->var0.x - a3->var1.x));
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

+ (double)_highlightOutsetFactor
{
  return 0.1;
}

+ (void)_enumerateQuadPathsOfAnnotation:(id)a3 applyStyle:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = a5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v8 quadPoints];
  uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
        long long v45 = 0u;
        memset(&angle[1], 0, 48);
        if (v14) {
          [v14 quadrilateralValue];
        }
        angle[0] = 0.0;
        CGAffineTransform v42 = *(CGAffineTransform *)&angle[1];
        long long v43 = v45;
        [a1 _rectForQuad:&v42 rotationAngle:angle];
        CGFloat x = v15;
        CGFloat y = v17;
        CGFloat width = v19;
        CGFloat v22 = v21;
        if (!v6) {
          goto LABEL_18;
        }
        if ([v8 style] == 1)
        {
          v52.origin.CGFloat x = x;
          v52.origin.CGFloat y = y;
          v52.size.CGFloat width = width;
          v52.size.double height = v22;
          double Height = CGRectGetHeight(v52);
          [a1 _highlightOutsetFactor];
          CGFloat v25 = -(Height * v24);
          v53.origin.CGFloat x = x;
          v53.origin.CGFloat y = y;
          v53.size.CGFloat width = width;
          v53.size.double height = v22;
          CGRect v54 = CGRectInset(v53, v25, v25);
          CGFloat x = v54.origin.x;
          CGFloat y = v54.origin.y;
          CGFloat width = v54.size.width;
          double v26 = v54.size.height;
          goto LABEL_19;
        }
        if ([v8 style] == 2 || objc_msgSend(v8, "style") == 3)
        {
          v55.origin.CGFloat x = x;
          v55.origin.CGFloat y = y;
          v55.size.CGFloat width = width;
          v55.size.double height = v22;
          double v27 = CGRectGetHeight(v55) * 0.08;
          if (v27 >= 1.0) {
            double v26 = v27;
          }
          else {
            double v26 = 1.0;
          }
          uint64_t v28 = [v8 style];
          CGFloat v29 = x;
          CGFloat v30 = y;
          CGFloat v31 = width;
          CGFloat v32 = v22;
          if (v28 == 2)
          {
            CGFloat width = CGRectGetWidth(*(CGRect *)&v29);
          }
          else
          {
            CGFloat MidY = CGRectGetMidY(*(CGRect *)&v29);
            v57.origin.CGFloat x = x;
            v57.origin.CGFloat y = y;
            v57.size.CGFloat width = width;
            v57.size.double height = v22;
            CGFloat width = CGRectGetWidth(v57);
            CGFloat y = MidY;
          }
        }
        else
        {
LABEL_18:
          double v26 = v22;
        }
LABEL_19:
        memset(&transform, 0, sizeof(transform));
        CGAffineTransformMakeTranslation(&v42, angle[1], angle[2]);
        CGAffineTransform transform = v42;
        CGAffineTransform v40 = v42;
        CGAffineTransformRotate(&v42, &v40, angle[0]);
        CGAffineTransform transform = v42;
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.double height = v26;
        CGPathRef v33 = CGPathCreateWithRect(v56, &transform);
        v34 = v33;
        if (v9)
        {
          v35 = (uint64_t (*)(void *, CGAffineTransform *, CGPathRef))v9[2];
          CGAffineTransform v42 = *(CGAffineTransform *)&angle[1];
          long long v43 = v45;
          char v36 = v35(v9, &v42, v33);
          if (!v34) {
            goto LABEL_22;
          }
LABEL_21:
          CGPathRelease(v34);
          goto LABEL_22;
        }
        char v36 = 0;
        if (v33) {
          goto LABEL_21;
        }
LABEL_22:
        if (v36) {
          goto LABEL_29;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v11 = v38;
    }
    while (v38);
  }
LABEL_29:
}

@end