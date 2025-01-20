@interface AKCropAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)_newRectanglePathForAnnotation:(id)a3 withPageController:(id)a4 outLineWidth:(double *)a5;
+ (CGPath)cropHandle:(int64_t)a3 forAnnotation:(id)a4 withPageController:(id)a5;
+ (CGPath)newBottomEdgePathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newBottomLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newBottomRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newLeftEdgePathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newRightEdgePathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newTopEdgePathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newTopLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGPath)newTopRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_pixelAlignedBaseRect:(CGRect *)a3 interiorRect:(CGRect *)a4 scaleFactor:(double *)a5 forAnnotation:(id)a6 withPageController:(id)a7;
@end

@implementation AKCropAnnotationRenderer

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
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (([v10 hidden] & 1) == 0)
  {
    CGContextSaveGState(a4);
    [a1 _transformContextToModelCoordinates:a4 forAnnotation:v10 forDisplay:v7 pageControllerOrNil:v11];
    double v23 = 1.0;
    [a1 _pixelAlignedBaseRect:0 interiorRect:0 scaleFactor:&v23 forAnnotation:v10 withPageController:v11];
    [v10 rectangle];
    if (CGRectIsInfinite(v40))
    {
      v12 = [v11 controller];
      v13 = [v12 undoController];
      v14 = [v13 undoManager];

      int v15 = [v14 isUndoRegistrationEnabled];
      if (v15) {
        [v14 disableUndoRegistration];
      }
      [v11 maxPageRect];
      objc_msgSend(v10, "setRectangle:");
      if (v15) {
        [v14 enableUndoRegistration];
      }
    }
    v16 = (const CGPath *)[a1 _newClipMaskEOPathForAnnotation:v10 withPageController:v11];
    id v17 = [MEMORY[0x263F1C550] akColorWithWhite:0.2 alpha:0.8];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v17 CGColor]);

    CGContextAddPath(a4, v16);
    CGContextEOFillPath(a4);
    CGPathRelease(v16);
    if ([v10 isDraggingHandle])
    {
      [v10 rectangle];
      points.x = v19;
      points.double y = v20 + v18 / 3.0;
      double v25 = v19 + v21;
      double y = points.y;
      double v27 = v19;
      double v28 = v20 + (v18 + v18) / 3.0;
      double v29 = v19 + v21;
      double v30 = v28;
      double v31 = v19 + v21 / 3.0;
      double v32 = v20 + v18;
      double v33 = v31;
      double v34 = v20;
      double v35 = v19 + (v21 + v21) / 3.0;
      double v36 = v20 + v18;
      double v37 = v35;
      double v38 = v20;
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v10 color]);
      CGContextSetLineWidth(a4, 1.0 / v23);
      CGContextStrokeLineSegments(a4, &points, 8uLL);
    }
    if ([v10 cropApplied] && (objc_msgSend(v10, "showHandles") & 1) == 0)
    {
      points.x = 1.0;
      v22 = (const CGPath *)[a1 _newRectanglePathForAnnotation:v10 withPageController:v11 outLineWidth:&points];
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v10 color]);
      CGContextSetLineWidth(a4, points.x);
      CGContextSetLineJoin(a4, kCGLineJoinMiter);
      CGContextAddPath(a4, v22);
      CGContextStrokePath(a4);
      CGPathRelease(v22);
    }
    CGContextRestoreGState(a4);
  }
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 1;
}

+ (CGPath)cropHandle:(int64_t)a3 forAnnotation:(id)a4 withPageController:(id)a5
{
  double v80 = 1.0;
  long long v8 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v78 = *MEMORY[0x263F001A8];
  *(_OWORD *)v79 = v8;
  id v9 = a5;
  [a1 _pixelAlignedBaseRect:&v78 interiorRect:0 scaleFactor:&v80 forAnnotation:a4 withPageController:v9];
  long long v10 = v78;
  double v11 = *((double *)&v78 + 1) + v79[1];
  double v12 = *(double *)&v78 + v79[0];
  [v9 convertPointFromModelToOverlay:v78];
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", *(double *)&v10, v11);
  CGFloat v18 = v17;
  double v20 = v19;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", v12, *((double *)&v10 + 1));
  double v22 = v21;
  double v24 = v23;
  objc_msgSend(v9, "convertPointFromModelToOverlay:", v12, v11);
  CGFloat v26 = v25;
  double v28 = v27;

  Mutable = CGPathCreateMutable();
  double v30 = Mutable;
  double v31 = 19.0 / v80;
  double v32 = 3.0 / v80;
  switch(a3)
  {
    case 0:
      double v33 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18, v20 - v31);
      double v34 = v16 + v33;
      double v35 = v30;
      double v36 = v14;
      goto LABEL_12;
    case 1:
      double v37 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v26, v28 - v31);
      double v34 = v24 + v37;
      double v35 = v30;
      double v36 = v22;
      goto LABEL_12;
    case 2:
      double v38 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18 + v31, v20);
      double v36 = v26 - v38;
      double v35 = v30;
      double v34 = v28;
      goto LABEL_12;
    case 3:
      CGFloat v39 = v16;
      double v40 = 19.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v14 + v31, v39);
      double v36 = v22 - v40;
      double v35 = v30;
      double v34 = v24;
      goto LABEL_12;
    case 4:
      CGFloat v41 = v18 + v32;
      CGFloat v42 = v20 - v32;
      double v43 = 3.0 / v80;
      double v44 = 19.0 / v80;
      double v45 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v18 + v32, v42);
      CGFloat v46 = v42 - v44;
      CGPathAddLineToPoint(v30, 0, v41, v46);
      CGFloat v47 = v41 - v43;
      CGPathAddLineToPoint(v30, 0, v47, v46);
      CGFloat v48 = v45 + v46;
      CGPathAddLineToPoint(v30, 0, v47, v48);
      CGFloat v49 = v45 + v47;
      CGPathAddLineToPoint(v30, 0, v49, v48);
      double v50 = v48 - v43;
      CGPathAddLineToPoint(v30, 0, v49, v50);
      double v36 = v49 - v44;
      goto LABEL_11;
    case 5:
      CGFloat v51 = v26 - v32;
      double v52 = v28 - v32;
      double v53 = 3.0 / v80;
      double v54 = 19.0 / v80;
      double v55 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v26 - v32, v28 - v32);
      CGFloat v56 = v52 - v54;
      CGPathAddLineToPoint(v30, 0, v51, v56);
      CGFloat v57 = v53 + v51;
      CGPathAddLineToPoint(v30, 0, v57, v56);
      CGFloat v58 = v55 + v56;
      CGPathAddLineToPoint(v30, 0, v57, v58);
      double v59 = v57 - v55;
      CGPathAddLineToPoint(v30, 0, v59, v58);
      double v50 = v58 - v53;
      goto LABEL_10;
    case 6:
      CGFloat v60 = v14 + v32;
      CGFloat v61 = v16 + v32;
      double v62 = 3.0 / v80;
      double v63 = 19.0 / v80;
      double v64 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v60, v61);
      CGFloat v65 = v63 + v61;
      CGPathAddLineToPoint(v30, 0, v60, v65);
      CGFloat v66 = v60 - v62;
      CGPathAddLineToPoint(v30, 0, v66, v65);
      CGFloat v67 = v65 - v64;
      CGPathAddLineToPoint(v30, 0, v66, v67);
      CGFloat v68 = v64 + v66;
      CGPathAddLineToPoint(v30, 0, v68, v67);
      CGFloat v69 = v62 + v67;
      CGPathAddLineToPoint(v30, 0, v68, v69);
      double v36 = v68 - v63;
      double v35 = v30;
      double v34 = v69;
      goto LABEL_12;
    case 7:
      CGFloat v70 = v22 - v32;
      CGFloat v71 = v24 + v32;
      double v72 = 3.0 / v80;
      double v54 = 19.0 / v80;
      double v73 = 22.0 / v80;
      CGPathMoveToPoint(Mutable, 0, v70, v71);
      CGFloat v74 = v54 + v71;
      CGPathAddLineToPoint(v30, 0, v70, v74);
      CGFloat v75 = v72 + v70;
      CGPathAddLineToPoint(v30, 0, v75, v74);
      CGFloat v76 = v74 - v73;
      CGPathAddLineToPoint(v30, 0, v75, v76);
      double v59 = v75 - v73;
      CGPathAddLineToPoint(v30, 0, v59, v76);
      double v50 = v72 + v76;
LABEL_10:
      CGPathAddLineToPoint(v30, 0, v59, v50);
      double v36 = v54 + v59;
LABEL_11:
      double v35 = v30;
      double v34 = v50;
LABEL_12:
      CGPathAddLineToPoint(v35, 0, v36, v34);
      break;
    default:
      return v30;
  }
  return v30;
}

+ (CGPath)newLeftEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  *(double *)&uint64_t v14 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v13.origin = (CGPoint)*MEMORY[0x263F001A8];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  [a1 _pixelAlignedBaseRect:&v13 interiorRect:&v12 scaleFactor:&v14 forAnnotation:a3 withPageController:a4];
  double v5 = *(double *)&v14;
  double v6 = 20.0 / v5 + 20.0 / v5;
  double v7 = CGRectGetHeight(v12) + -20.0;
  if (v6 > v7) {
    double v6 = v7;
  }
  if (v6 <= 0.0) {
    return 0;
  }
  CGFloat v8 = 4.0 / v5;
  CGFloat MinX = CGRectGetMinX(v13);
  CGFloat v10 = CGRectGetMidY(v13) + v6 * -0.5;
  CGRect v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = MinX;
  v16.origin.double y = v10;
  v16.size.width = v8;
  v16.size.height = v6;
  CGRect v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newRightEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  uint64_t v14 = 0x3FF0000000000000;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v13.origin = (CGPoint)*MEMORY[0x263F001A8];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  [a1 _pixelAlignedBaseRect:&v13 interiorRect:&v12 scaleFactor:&v14 forAnnotation:a3 withPageController:a4];
  double v5 = *(double *)&v14;
  double v6 = 20.0 / v5 + 20.0 / v5;
  double v7 = CGRectGetHeight(v12) + -20.0;
  if (v6 > v7) {
    double v6 = v7;
  }
  if (v6 <= 0.0) {
    return 0;
  }
  CGFloat v8 = 4.0 / v5;
  CGFloat v9 = CGRectGetMaxX(v13) - v8;
  CGFloat v10 = CGRectGetMidY(v13) + v6 * -0.5;
  CGRect v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.double y = v10;
  v16.size.width = v8;
  v16.size.height = v6;
  CGRect v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newBottomEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  *(double *)&uint64_t v14 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v13.origin = (CGPoint)*MEMORY[0x263F001A8];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  [a1 _pixelAlignedBaseRect:&v13 interiorRect:&v12 scaleFactor:&v14 forAnnotation:a3 withPageController:a4];
  double v5 = *(double *)&v14;
  double v6 = 20.0 / v5 + 20.0 / v5;
  double v7 = CGRectGetWidth(v12) + -20.0;
  if (v6 > v7) {
    double v6 = v7;
  }
  if (v6 <= 0.0) {
    return 0;
  }
  CGFloat v8 = 4.0 / v5;
  CGFloat v9 = CGRectGetMidX(v13) + v6 * -0.5;
  CGFloat MinY = CGRectGetMinY(v13);
  CGRect v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.double y = MinY;
  v16.size.width = v6;
  v16.size.height = v8;
  CGRect v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newTopEdgePathForAnnotation:(id)a3 withPageController:(id)a4
{
  uint64_t v14 = 0x3FF0000000000000;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v13.origin = (CGPoint)*MEMORY[0x263F001A8];
  v13.size = v4;
  v12.origin = v13.origin;
  v12.size = v4;
  [a1 _pixelAlignedBaseRect:&v13 interiorRect:&v12 scaleFactor:&v14 forAnnotation:a3 withPageController:a4];
  double v5 = *(double *)&v14;
  double v6 = 20.0 / v5 + 20.0 / v5;
  double v7 = CGRectGetWidth(v12) + -20.0;
  if (v6 > v7) {
    double v6 = v7;
  }
  if (v6 <= 0.0) {
    return 0;
  }
  CGFloat v8 = 4.0 / v5;
  CGFloat v9 = CGRectGetMidX(v13) + v6 * -0.5;
  CGFloat v10 = CGRectGetMaxY(v13) - v8;
  CGRect v13 = CGRectInset(v13, -v8, -v8);
  v16.origin.x = v9;
  v16.origin.double y = v10;
  v16.size.width = v6;
  v16.size.height = v8;
  CGRect v15 = CGRectIntersection(v13, v16);
  return CGPathCreateWithRect(v15, 0);
}

+ (CGPath)newTopLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  double v26 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v25.origin = (CGPoint)*MEMORY[0x263F001A8];
  v25.size = v4;
  v24.origin = v25.origin;
  v24.size = v4;
  [a1 _pixelAlignedBaseRect:&v25 interiorRect:&v24 scaleFactor:&v26 forAnnotation:a3 withPageController:a4];
  CGFloat v5 = 4.0 / v26;
  CGFloat MinX = CGRectGetMinX(v25);
  CGFloat v7 = CGRectGetMaxY(v25) - v5;
  double v8 = CGRectGetMinX(v24);
  CGFloat v9 = v8 - CGRectGetMinX(v25);
  CGFloat v10 = CGRectGetMinX(v25);
  CGFloat MaxY = CGRectGetMaxY(v24);
  double v12 = CGRectGetMaxY(v25);
  CGFloat v13 = v12 - CGRectGetMaxY(v24);
  v31.origin.CGFloat x = MinX;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v5;
  CGRect v27 = CGRectIntersection(v25, v31);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  v32.origin.CGFloat x = v10;
  v32.origin.CGFloat y = MaxY;
  v32.size.CGFloat width = v5;
  v32.size.CGFloat height = v13;
  CGRect v28 = CGRectIntersection(v25, v32);
  CGFloat v18 = v28.origin.x;
  CGFloat v19 = v28.origin.y;
  CGFloat v20 = v28.size.width;
  CGFloat v21 = v28.size.height;
  Mutable = CGPathCreateMutable();
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v29);
  v30.origin.CGFloat x = v18;
  v30.origin.CGFloat y = v19;
  v30.size.CGFloat width = v20;
  v30.size.CGFloat height = v21;
  CGPathAddRect(Mutable, 0, v30);
  return Mutable;
}

+ (CGPath)newTopRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  double v26 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v25.origin = (CGPoint)*MEMORY[0x263F001A8];
  v25.size = v4;
  v24.origin = v25.origin;
  v24.size = v4;
  [a1 _pixelAlignedBaseRect:&v25 interiorRect:&v24 scaleFactor:&v26 forAnnotation:a3 withPageController:a4];
  CGFloat v5 = 4.0 / v26;
  CGFloat MaxX = CGRectGetMaxX(v24);
  CGFloat v7 = CGRectGetMaxY(v25) - v5;
  double v8 = CGRectGetMaxX(v25);
  CGFloat v9 = v8 - CGRectGetMaxX(v24);
  CGFloat v10 = CGRectGetMaxX(v25) - v5;
  CGFloat MaxY = CGRectGetMaxY(v24);
  double v12 = CGRectGetMaxY(v25);
  CGFloat v13 = v12 - CGRectGetMaxY(v24);
  v31.origin.CGFloat x = MaxX;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v5;
  CGRect v27 = CGRectIntersection(v25, v31);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  v32.origin.CGFloat x = v10;
  v32.origin.CGFloat y = MaxY;
  v32.size.CGFloat width = v5;
  v32.size.CGFloat height = v13;
  CGRect v28 = CGRectIntersection(v25, v32);
  CGFloat v18 = v28.origin.x;
  CGFloat v19 = v28.origin.y;
  CGFloat v20 = v28.size.width;
  CGFloat v21 = v28.size.height;
  Mutable = CGPathCreateMutable();
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v29);
  v30.origin.CGFloat x = v18;
  v30.origin.CGFloat y = v19;
  v30.size.CGFloat width = v20;
  v30.size.CGFloat height = v21;
  CGPathAddRect(Mutable, 0, v30);
  return Mutable;
}

+ (CGPath)newBottomLeftCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  double v24 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v23.origin = (CGPoint)*MEMORY[0x263F001A8];
  v23.size = v4;
  v22.origin = v23.origin;
  v22.size = v4;
  [a1 _pixelAlignedBaseRect:&v23 interiorRect:&v22 scaleFactor:&v24 forAnnotation:a3 withPageController:a4];
  CGFloat v5 = 4.0 / v24;
  double MinX = CGRectGetMinX(v23);
  CGFloat MinY = CGRectGetMinY(v23);
  CGFloat v8 = CGRectGetMinX(v22) - MinX;
  CGFloat v9 = CGRectGetMinX(v23);
  double v10 = CGRectGetMinY(v23);
  CGFloat v11 = CGRectGetMinY(v22) - v10;
  v29.origin.CGFloat x = MinX;
  v29.origin.CGFloat y = MinY;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v5;
  CGRect v25 = CGRectIntersection(v23, v29);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  v30.origin.CGFloat x = v9;
  v30.origin.CGFloat y = v10;
  v30.size.CGFloat width = v5;
  v30.size.CGFloat height = v11;
  CGRect v26 = CGRectIntersection(v23, v30);
  CGFloat v16 = v26.origin.x;
  CGFloat v17 = v26.origin.y;
  CGFloat v18 = v26.size.width;
  CGFloat v19 = v26.size.height;
  Mutable = CGPathCreateMutable();
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v27);
  v28.origin.CGFloat x = v16;
  v28.origin.CGFloat y = v17;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v19;
  CGPathAddRect(Mutable, 0, v28);
  return Mutable;
}

+ (CGPath)newBottomRightCornerPathForAnnotation:(id)a3 withPageController:(id)a4
{
  double v24 = 1.0;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v23.origin = (CGPoint)*MEMORY[0x263F001A8];
  v23.size = v4;
  v22.origin = v23.origin;
  v22.size = v4;
  [a1 _pixelAlignedBaseRect:&v23 interiorRect:&v22 scaleFactor:&v24 forAnnotation:a3 withPageController:a4];
  CGFloat v5 = 4.0 / v24;
  double MaxX = CGRectGetMaxX(v22);
  CGFloat MinY = CGRectGetMinY(v23);
  CGFloat v8 = CGRectGetMaxX(v23) - MaxX;
  CGFloat v9 = CGRectGetMaxX(v23) - v5;
  double v10 = CGRectGetMinY(v23);
  CGFloat v11 = CGRectGetMinY(v22) - v10;
  v29.origin.CGFloat x = MaxX;
  v29.origin.CGFloat y = MinY;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v5;
  CGRect v25 = CGRectIntersection(v23, v29);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  v30.origin.CGFloat x = v9;
  v30.origin.CGFloat y = v10;
  v30.size.CGFloat width = v5;
  v30.size.CGFloat height = v11;
  CGRect v26 = CGRectIntersection(v23, v30);
  CGFloat v16 = v26.origin.x;
  CGFloat v17 = v26.origin.y;
  CGFloat v18 = v26.size.width;
  CGFloat v19 = v26.size.height;
  Mutable = CGPathCreateMutable();
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v27);
  v28.origin.CGFloat x = v16;
  v28.origin.CGFloat y = v17;
  v28.size.CGFloat width = v18;
  v28.size.CGFloat height = v19;
  CGPathAddRect(Mutable, 0, v28);
  return Mutable;
}

+ (CGPath)_newClipMaskEOPathForAnnotation:(id)a3 withPageController:(id)a4
{
  uint64_t v19 = 0x3FF0000000000000;
  CGSize v6 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v18.origin = (CGPoint)*MEMORY[0x263F001A8];
  v18.size = v6;
  id v7 = a4;
  [a1 _pixelAlignedBaseRect:&v18 interiorRect:0 scaleFactor:&v19 forAnnotation:a3 withPageController:v7];
  [v7 maxPageRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  Mutable = CGPathCreateMutable();
  v20.origin.CGFloat x = v9;
  v20.origin.CGFloat y = v11;
  v20.size.CGFloat width = v13;
  v20.size.CGFloat height = v15;
  CGPathAddRect(Mutable, 0, v20);
  CGPathAddRect(Mutable, 0, v18);
  return Mutable;
}

+ (CGPath)_newRectanglePathForAnnotation:(id)a3 withPageController:(id)a4 outLineWidth:(double *)a5
{
  double v10 = 1.0;
  CGSize v6 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v9.origin = (CGPoint)*MEMORY[0x263F001A8];
  v9.size = v6;
  [a1 _pixelAlignedBaseRect:&v9 interiorRect:0 scaleFactor:&v10 forAnnotation:a3 withPageController:a4];
  double v7 = 1.0 / v10;
  CGRect v9 = CGRectInset(v9, 1.0 / v10 * -0.5, 1.0 / v10 * -0.5);
  CGSize result = CGPathCreateWithRect(v9, 0);
  *a5 = v7;
  return result;
}

+ (void)_pixelAlignedBaseRect:(CGRect *)a3 interiorRect:(CGRect *)a4 scaleFactor:(double *)a5 forAnnotation:(id)a6 withPageController:(id)a7
{
  id v11 = a7;
  [a6 rectangle];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  CGRect v20 = [v11 geometryHelper];
  objc_msgSend(v20, "screenPixelAlignedRectForRect:", v13, v15, v17, v19);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  [v11 currentModelToScreenScaleFactor];
  double v30 = v29;

  if (a4)
  {
    v37.origin.CGFloat x = v22;
    v37.origin.CGFloat y = v24;
    v37.size.CGFloat width = v26;
    v37.size.CGFloat height = v28;
    double v31 = v30 * CGRectGetWidth(v37);
    v38.origin.CGFloat x = v22;
    v38.origin.CGFloat y = v24;
    v38.size.CGFloat width = v26;
    v38.size.CGFloat height = v28;
    double v32 = v30 * CGRectGetHeight(v38);
    double v33 = fmax((v31 + -10.0) * 0.5, 4.0);
    if (v31 + -40.0 >= 10.0) {
      double v33 = 20.0;
    }
    double v34 = v32 + -40.0;
    double v35 = fmax((v32 + -10.0) * 0.5, 4.0);
    if (v34 >= 10.0) {
      double v35 = 20.0;
    }
    CGFloat v36 = v35 / v30;
    v39.origin.CGFloat x = v22;
    v39.origin.CGFloat y = v24;
    v39.size.CGFloat width = v26;
    v39.size.CGFloat height = v28;
    CGRect v40 = CGRectInset(v39, v33 / v30, v36);
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    v40.size.CGFloat height = 0.0;
    v40.size.CGFloat width = 0.0;
    v40.origin.CGFloat y = 0.0;
    v40.origin.CGFloat x = 0.0;
    if (a3)
    {
LABEL_7:
      a3->origin.CGFloat x = v22;
      a3->origin.CGFloat y = v24;
      a3->size.CGFloat width = v26;
      a3->size.CGFloat height = v28;
    }
  }
  if (a4) {
    *a4 = v40;
  }
  if (a5) {
    *a5 = v30;
  }
}

@end