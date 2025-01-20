@interface AKArrowAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4;
+ (CGPath)_newLinePathForArrow:(id)a3 withHeads:(BOOL)a4 fromBezierParameter:(double)a5 toBezierParameter:(double)a6 optionalPageController:(id)a7 optionalContext:(CGContext *)a8;
+ (CGPoint)_cubicBezierPointForParameter:(double)a3 start:(CGPoint)a4 controlPt1:(CGPoint)a5 controlPt2:(CGPoint)a6 end:(CGPoint)a7;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (CGSize)_concreteDraggingBoundsInsetsForAnnotation:(id)a3;
+ (double)_oneDimensionalCubicBezierValueForParameter:(double)a3 start:(double)a4 controlPt1:(double)a5 controlPt2:(double)a6 end:(double)a7;
+ (unint64_t)_drawableArrowHeads:(id)a3;
+ (void)_arrowHeadLineIntersection:(id)a3 outStartIntersection:(CGPoint *)a4 outBezierStartParameter:(double *)a5 outEndIntersection:(CGPoint *)a6 outBezierEndParameter:(double *)a7;
+ (void)_arrowHeadPathsForArrow:(id)a3 inOutStartArrowHead:(CGPath *)a4 outBezierStartParameter:(double *)a5 inOutEndArrowHead:(CGPath *)a6 outBezierEndParameter:(double *)a7;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
+ (void)_controlPointsForArrow:(id)a3 outControlPoint1:(CGPoint *)a4 outControlPoint2:(CGPoint *)a5;
+ (void)_drawPathForArrow:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)a5 pageControllerForPixelAlignmentOrNil:(id)a6 minimumGrabbableBorderThickness:(double)a7;
@end

@implementation AKArrowAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v4 = a3;
  Mutable = CGPathCreateMutable();
  [a1 _drawPathForArrow:v4 inContext:0 inPath:Mutable pageControllerForPixelAlignmentOrNil:0 minimumGrabbableBorderThickness:1.0];
  BoundingBoCGFloat x = CGPathGetBoundingBox(Mutable);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  CGPathRelease(Mutable);
  [v4 strokeWidth];
  CGFloat v11 = -v10;
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGRect v42 = CGRectInset(v41, v11, v11);
  double v12 = v42.origin.x;
  double v13 = v42.origin.y;
  double v14 = v42.size.width;
  double v15 = v42.size.height;
  if ([v4 hasShadow])
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v4, v12, v13, v14, v15);
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
  }
  v20 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v4];
  if ([v20 length]
    || ([v4 fillColor], v21 = objc_claimAutoreleasedReturnValue(), v21, v21))
  {
    objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v4, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v4 originalExifOrientation]))
    {
      CGFloat v30 = -1.0;
      CGFloat v31 = -5.0;
    }
    else
    {
      CGFloat v30 = -5.0;
      CGFloat v31 = -1.0;
    }
    v43.origin.CGFloat x = v23;
    v43.origin.CGFloat y = v25;
    v43.size.CGFloat width = v27;
    v43.size.CGFloat height = v29;
    CGRect v49 = CGRectInset(v43, v30, v31);
    v44.origin.CGFloat x = v12;
    v44.origin.CGFloat y = v13;
    v44.size.CGFloat width = v14;
    v44.size.CGFloat height = v15;
    CGRect v45 = CGRectUnion(v44, v49);
    double v12 = v45.origin.x;
    double v13 = v45.origin.y;
    double v14 = v45.size.width;
    double v15 = v45.size.height;
  }
  v46.origin.CGFloat x = v12;
  v46.origin.CGFloat y = v13;
  v46.size.CGFloat width = v14;
  v46.size.CGFloat height = v15;
  CGRect v47 = CGRectInset(v46, -1.0, -1.0);
  CGFloat v32 = v47.origin.x;
  CGFloat v33 = v47.origin.y;
  CGFloat v34 = v47.size.width;
  CGFloat v35 = v47.size.height;

  double v36 = v32;
  double v37 = v33;
  double v38 = v34;
  double v39 = v35;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
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

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v7];
    if (!v10)
    {
LABEL_8:
      double v17 = [v7 typingAttributes];
      id v18 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:@"fg" attributes:v17];

      id v14 = v18;
      id v10 = v14;
      goto LABEL_9;
    }
  }
  if (![v10 length]) {
    goto LABEL_8;
  }
  CGFloat v11 = [v10 string];
  double v12 = [v11 stringByTrimmingTrailingWhitespaceFromEachLine];

  double v13 = [v7 typingAttributes];
  id v14 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:v12 attributes:v13];

  if (![v14 length])
  {
    double v15 = [v7 typingAttributes];
    id v16 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithString:@"fg" attributes:v15];

    id v14 = v16;
  }

LABEL_9:
  [v7 originalModelBaseScaleFactor];
  id v19 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v10);

  [v7 originalModelBaseScaleFactor];
  id v20 = +[AKTextAnnotationAttributeHelper newTextStorage:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "newTextStorage:byApplyingScaleFactor:", v14);

  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:v19];
  double v22 = v21;
  +[AKTextAnnotationRenderHelper unconstrainedSizeForText:v20];
  double v24 = v23;
  double v26 = v25;
  double v116 = v22 - v23;
  [v7 strokeWidth];
  double v28 = v27 * -1.5 * 0.5;
  double v119 = v28 + -1.0;
  double v120 = v28 + -5.0;
  double v29 = v26 + (v28 + -1.0) * -2.0;
  if (v29 <= v24 + (v28 + -5.0) * -2.0) {
    double v30 = v24 + (v28 + -5.0) * -2.0;
  }
  else {
    double v30 = v26 + (v28 + -1.0) * -2.0;
  }
  uint64_t v31 = [v7 originalExifOrientation];
  int64_t v32 = +[AKGeometryHelper inverseExifOrientation:v31];
  BOOL v33 = +[AKGeometryHelper exifOrientationHasReversedAxes:v31];
  [v7 startPoint];
  double v36 = v34;
  double v37 = v35;
  if (v33) {
    double v38 = v30;
  }
  else {
    double v38 = v29;
  }
  if (v33) {
    double v39 = v29;
  }
  else {
    double v39 = v30;
  }
  double v114 = v35 - v38 * 0.5;
  double v115 = v34 - v39 * 0.5;
  double v117 = v39;
  double v118 = v38;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v31);
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  double v122 = 0.0;
  double v123 = 0.0;
  v121[0] = 0;
  v121[1] = 0;
  [a1 _controlPointsForArrow:v7 outControlPoint1:&v122 outControlPoint2:v121];
  double v108 = v36;
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v36 - v122, v37 - v123);
  double v112 = v49;
  double v113 = v48;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v31);
  +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:");
  if (v50 > 3.14159265) {
    double v50 = 6.28318531 - v50;
  }
  double v106 = v50;
  v124.origin.CGFloat x = v41;
  v124.origin.CGFloat y = v43;
  v124.size.CGFloat width = v45;
  v124.size.CGFloat height = v47;
  double MinX = CGRectGetMinX(v124);
  v125.origin.CGFloat x = v41;
  v125.origin.CGFloat y = v43;
  v125.size.CGFloat width = v45;
  v125.size.CGFloat height = v47;
  double v52 = MinX + CGRectGetHeight(v125) * 0.5;
  v126.origin.CGFloat x = v41;
  v126.origin.CGFloat y = v43;
  v126.size.CGFloat width = v45;
  v126.size.CGFloat height = v47;
  double MidY = CGRectGetMidY(v126);
  v127.origin.CGFloat x = v41;
  v127.origin.CGFloat y = v43;
  v127.size.CGFloat width = v45;
  v127.size.CGFloat height = v47;
  double MaxX = CGRectGetMaxX(v127);
  v128.origin.CGFloat x = v41;
  v128.origin.CGFloat y = v43;
  v128.size.CGFloat width = v45;
  v128.size.CGFloat height = v47;
  double v55 = MaxX - CGRectGetHeight(v128) * 0.5;
  v129.origin.CGFloat x = v41;
  v129.origin.CGFloat y = v43;
  v129.size.CGFloat width = v45;
  v129.size.CGFloat height = v47;
  CGFloat v56 = CGRectGetMidY(v129);
  double v109 = MidY;
  double v110 = v52;
  double v107 = v55;
  double v57 = v55 - v52;
  double v58 = v56 - MidY;
  double v59 = v56;
  double v60 = pow((v106 + -0.785398163) / 1.57079633 * 2.0 + -1.0, 7.0);
  double v61 = 1.0;
  if (v60 <= 1.0) {
    double v62 = v60;
  }
  else {
    double v62 = 1.0;
  }
  if (v60 >= -1.0) {
    double v63 = v62;
  }
  else {
    double v63 = -1.0;
  }
  if (v63 + 1.0 <= 1.0) {
    double v64 = v63 + 1.0;
  }
  else {
    double v64 = 1.0;
  }
  if (v63 + 1.0 >= 0.0) {
    double v65 = v64;
  }
  else {
    double v65 = 0.0;
  }
  if (1.0 - v63 <= 1.0) {
    double v61 = 1.0 - v63;
  }
  if (1.0 - v63 >= 0.0) {
    double v66 = v61;
  }
  else {
    double v66 = 0.0;
  }
  v67 = [v19 attribute:*MEMORY[0x263F1C268] atIndex:0 effectiveRange:0];
  if (!v67)
  {
    v67 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  uint64_t v68 = [v67 alignment];
  if (v63 <= 0.0) {
    double v69 = v63;
  }
  else {
    double v69 = 0.0;
  }
  double v70 = v59 + v69 * v58;
  double v71 = v108 + v63 * 0.5 * v57;
  if (v65 >= v66) {
    double v72 = v66;
  }
  else {
    double v72 = v65;
  }
  double v73 = v116 * (v72 * 0.5);
  double v74 = fmax(v63, 0.0);
  double v75 = v110 + v74 * v57;
  double v76 = v109 + v74 * v58;
  if (v68) {
    double v76 = v37 + v63 * 0.5 * v58;
  }
  else {
    double v71 = v75;
  }
  if (v68) {
    double v77 = v73;
  }
  else {
    double v77 = 0.0;
  }
  if (!v68) {
    double v73 = v116 * v66;
  }
  if (v68 == 2) {
    double v78 = v107 + v69 * v57;
  }
  else {
    double v78 = v71;
  }
  if (v68 == 2) {
    double v79 = v70;
  }
  else {
    double v79 = v76;
  }
  if (v68 == 2) {
    double v80 = v116 * v65;
  }
  else {
    double v80 = v77;
  }
  double v111 = fmax(v80, 0.0);
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v32, v78, v79, v108, v37, v71, v73, v76, v77);
  double v82 = v115 + v108 - v81;
  double v84 = v114 + v37 - v83;
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withRect:andRoundedCornerRadius:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withRect:andRoundedCornerRadius:", v108, v37, v108 - v113 * 1000000.0, v37 - v112 * 1000000.0, v82, v84, v117, v118, 0);
  long double v87 = hypot(v85 - v108, v86 - v37);
  CGFloat v88 = v82 + v87 * v113;
  CGFloat v89 = v84 + v87 * v112;
  v130.origin.CGFloat x = v88;
  v130.origin.CGFloat y = v89;
  v130.size.CGFloat width = v117;
  v130.size.CGFloat height = v118;
  double MidX = CGRectGetMidX(v130);
  v131.origin.CGFloat x = v88;
  v131.origin.CGFloat y = v89;
  v131.size.CGFloat width = v117;
  v131.size.CGFloat height = v118;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v31, v88, v89, v117, v118, MidX, CGRectGetMidY(v131));
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v32, v91 - v111);
  double v96 = v120;
  if (v33) {
    double v97 = v119;
  }
  else {
    double v97 = v120;
  }
  if (!v33) {
    double v96 = v119;
  }
  CGRect v132 = CGRectInset(*(CGRect *)&v92, -v97, -v96);
  CGFloat x = v132.origin.x;
  CGFloat y = v132.origin.y;
  CGFloat width = v132.size.width;
  CGFloat height = v132.size.height;

  double v102 = x;
  double v103 = y;
  double v104 = width;
  double v105 = height;
  result.size.CGFloat height = v105;
  result.size.CGFloat width = v104;
  result.origin.CGFloat y = v103;
  result.origin.CGFloat x = v102;
  return result;
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  BOOL v7 = a5;
  id v38 = a3;
  id v10 = a6;
  CGContextSaveGState(a4);
  [a1 _transformContextToModelCoordinates:a4 forAnnotation:v38 forDisplay:v7 pageControllerOrNil:v10];
  int v11 = [v38 hasShadow];
  if (v11) {
    +[AKAnnotationRendererUtilities beginShadowInContext:a4 forAnnotation:v38];
  }
  CGContextSaveGState(a4);
  double v12 = [v38 strokeColor];

  if (v12)
  {
    id v13 = [v38 strokeColor];
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v13 CGColor]);

    id v14 = [v38 strokeColor];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v14 CGColor]);

    [v38 strokeWidth];
    +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
    if ([v38 isDashed])
    {
      [v38 strokeWidth];
      +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
    }
    [a1 _drawPathForArrow:v38 inContext:a4 inPath:0 pageControllerForPixelAlignmentOrNil:v10 minimumGrabbableBorderThickness:1.0];
  }
  CGContextRestoreGState(a4);
  uint64_t v15 = [v38 fillColor];
  if (v15)
  {
    id v16 = (void *)v15;
    id v17 = [v38 fillColor];
    double Alpha = CGColorGetAlpha((CGColorRef)[v17 CGColor]);

    if (Alpha != 0.0)
    {
      objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", v38, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      if (+[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", [v38 originalExifOrientation]))
      {
        CGFloat v27 = -1.0;
        CGFloat v28 = -5.0;
      }
      else
      {
        CGFloat v27 = -5.0;
        CGFloat v28 = -1.0;
      }
      v40.origin.CGFloat x = v20;
      v40.origin.CGFloat y = v22;
      v40.size.CGFloat width = v24;
      v40.size.CGFloat height = v26;
      CGRect v41 = CGRectInset(v40, v27, v28);
      CGRect v42 = CGRectInset(v41, 1.0, 1.0);
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, a4, v38, v42.origin.x, v42.origin.y, v42.size.width, v42.size.height, 0.0);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      id v37 = [v38 fillColor];
      CGContextSetFillColorWithColor(a4, (CGColorRef)[v37 CGColor]);

      v43.origin.CGFloat x = v30;
      v43.origin.CGFloat y = v32;
      v43.size.CGFloat width = v34;
      v43.size.CGFloat height = v36;
      CGContextFillRect(a4, v43);
    }
  }
  +[AKTextAnnotationRenderHelper renderAnnotationText:v38 intoContext:a4 isForScreen:v7 pageControllerOrNil:v10];
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
  [a1 _drawPathForArrow:v9 inContext:0 inPath:Mutable pageControllerForPixelAlignmentOrNil:0 minimumGrabbableBorderThickness:a5];

  v12.CGFloat x = x;
  v12.CGFloat y = y;
  LOBYTE(a1) = CGPathContainsPoint(Mutable, 0, v12, 0);
  CGPathRelease(Mutable);
  return (char)a1;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_msgSend(a1, "_concreteTextBoundsOfAnnotation:withOptionalAnnotationRect:optionalText:", a4, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

+ (void)_drawPathForArrow:(id)a3 inContext:(CGContext *)a4 inPath:(CGPath *)a5 pageControllerForPixelAlignmentOrNil:(id)a6 minimumGrabbableBorderThickness:(double)a7
{
  id v12 = a3;
  id v13 = a6;
  [v12 strokeWidth];
  double v15 = v14;
  double v36 = 1.0;
  double v37 = 0.0;
  Mutable = CGPathCreateMutable();
  id v17 = CGPathCreateMutable();
  [a1 _arrowHeadPathsForArrow:v12 inOutStartArrowHead:Mutable outBezierStartParameter:&v37 inOutEndArrowHead:v17 outBezierEndParameter:&v36];
  if (!a4)
  {
    if (!a5
      || (CGPathAddPath(a5, 0, Mutable),
          CGPathAddPath(a5, 0, v17),
          (uint64_t v26 = [a1 _newLinePathForArrow:v12 withHeads:1 fromBezierParameter:v13 toBezierParameter:0 optionalPageController:v37 optionalContext:v36]) == 0))
    {
LABEL_21:
      if (!Mutable) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    CGFloat v27 = (const CGPath *)v26;
    if (v15 >= a7) {
      double v28 = v15;
    }
    else {
      double v28 = a7;
    }
    double v29 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v26, v28, *(void *)&v36, *(void *)&v37);
    if (v29)
    {
      CGFloat v30 = v29;
      CGPathAddPath(a5, 0, v29);
      CFRelease(v30);
    }
    double v31 = v27;
LABEL_20:
    CFRelease(v31);
    goto LABEL_21;
  }
  if (![v12 brushStyle])
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, Mutable);
    CGContextAddPath(a4, v17);
    CGContextFillPath(a4);
    CGContextStrokePath(a4);
  }
  if (!objc_msgSend(v12, "brushStyle", *(void *)&v36, *(void *)&v37))
  {
    uint64_t v32 = [a1 _newLinePathForArrow:v12 withHeads:1 fromBezierParameter:v13 toBezierParameter:a4 optionalPageController:v37 optionalContext:v36];
    if (!v32) {
      goto LABEL_21;
    }
    double v33 = (const CGPath *)v32;
    CGContextBeginPath(a4);
    CGContextAddPath(a4, v33);
    CGContextStrokePath(a4);
    double v31 = v33;
    goto LABEL_20;
  }
  uint64_t v18 = [a1 _newLinePathForArrow:v12 withHeads:0 fromBezierParameter:0 toBezierParameter:0 optionalPageController:v37 optionalContext:v36];
  if (!v18) {
    goto LABEL_21;
  }
  double v19 = (const CGPath *)v18;
  uint64_t v20 = [v12 brushStyle];
  double v21 = [v12 strokeColor];
  [v12 strokeWidth];
  CGFloat v22 = +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v20, v21);

  double v23 = +[AKTSDBezierPath bezierPathWithCGPath:v19];
  CGFloat v24 = objc_alloc_init(AKTSDShape);
  [(AKTSDShape *)v24 setStroke:v22];
  [(AKTSDShape *)v24 setPath:v23];
  if ([v12 arrowHeadStyle] == 1)
  {
    if (CGPathIsEmpty(Mutable)) {
      goto LABEL_35;
    }
    [(AKTSDShape *)v24 setHeadLineEnd:0];
    goto LABEL_9;
  }
  if ([v12 arrowHeadStyle] == 2)
  {
    if (CGPathIsEmpty(v17)) {
      goto LABEL_35;
    }
    CGFloat v34 = +[AKTSDLineEnd lineEndWithType:0];
    [(AKTSDShape *)v24 setHeadLineEnd:v34];
  }
  else
  {
    if ([v12 arrowHeadStyle] != 3) {
      goto LABEL_35;
    }
    if (CGPathIsEmpty(v17))
    {
      [(AKTSDShape *)v24 setHeadLineEnd:0];
    }
    else
    {
      double v35 = +[AKTSDLineEnd lineEndWithType:0];
      [(AKTSDShape *)v24 setHeadLineEnd:v35];
    }
    if (!CGPathIsEmpty(Mutable))
    {
LABEL_9:
      double v25 = +[AKTSDLineEnd lineEndWithType:0];
      [(AKTSDShape *)v24 setTailLineEnd:v25];

      goto LABEL_35;
    }
  }
  [(AKTSDShape *)v24 setTailLineEnd:0];
LABEL_35:
  [(AKTSDShape *)v24 drawInContext:a4];
  CGPathRelease(v19);

  if (Mutable) {
LABEL_22:
  }
    CFRelease(Mutable);
LABEL_23:
  if (v17) {
    CFRelease(v17);
  }
}

+ (unint64_t)_drawableArrowHeads:(id)a3
{
  id v3 = a3;
  [v3 strokeWidth];
  double v5 = v4 * 5.0;
  uint64_t v6 = ~[v3 arrowHeadStyle] & 3;
  char v7 = [v3 arrowHeadStyle];
  if (v6)
  {
    if (v7)
    {
      [v3 startPoint];
      double v24 = v23;
      [v3 endPoint];
      long double v26 = v24 - v25;
      [v3 startPoint];
      double v28 = v27;
      [v3 endPoint];
      unint64_t v8 = hypot(v26, v28 - v29) > v5;
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (([v3 arrowHeadStyle] & 2) != 0)
    {
      [v3 startPoint];
      double v31 = v30;
      [v3 endPoint];
      double v19 = v31 - v32;
      [v3 startPoint];
      double v21 = v33;
      [v3 endPoint];
LABEL_12:
      if (hypot(v19, v21 - v22) > v5) {
        v8 |= 2uLL;
      }
    }
  }
  else
  {
    if (v7)
    {
      [v3 startPoint];
      double v10 = v9;
      [v3 midPoint];
      long double v12 = v10 - v11;
      [v3 startPoint];
      double v14 = v13;
      [v3 midPoint];
      unint64_t v8 = hypot(v12, v14 - v15) > v5;
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (([v3 arrowHeadStyle] & 2) != 0)
    {
      [v3 endPoint];
      double v17 = v16;
      [v3 midPoint];
      double v19 = v17 - v18;
      [v3 endPoint];
      double v21 = v20;
      [v3 midPoint];
      goto LABEL_12;
    }
  }

  return v8;
}

+ (void)_arrowHeadPathsForArrow:(id)a3 inOutStartArrowHead:(CGPath *)a4 outBezierStartParameter:(double *)a5 inOutEndArrowHead:(CGPath *)a6 outBezierEndParameter:(double *)a7
{
  id v12 = a3;
  [v12 strokeWidth];
  double v14 = v13;
  [v12 endPoint];
  double v16 = v15;
  double v18 = v17;
  [v12 startPoint];
  if (v19 != v16 || v20 != v18)
  {
    double v22 = v19;
    double v23 = v20;
    double v42 = v14;
    int64x2_t v43 = vdupq_n_s64(0x43E0000000000000uLL);
    int64x2_t v44 = v43;
    [a1 _arrowHeadLineIntersection:v12 outStartIntersection:&v44 outBezierStartParameter:a5 outEndIntersection:&v43 outBezierEndParameter:a7];
    char v24 = [a1 _drawableArrowHeads:v12];
    char v25 = v24;
    if (a4)
    {
      if (v24)
      {
        double v27 = *(double *)&v44.i64[1];
        double v26 = *(double *)v44.i64;
        double v28 = v22 - *(double *)v44.i64;
        double v29 = v23 - *(double *)&v44.i64[1];
        double v30 = hypot(v22 - *(double *)v44.i64, v23 - *(double *)&v44.i64[1]);
        if (fabs(v30) >= 0.0005)
        {
          double v31 = v42 * v29 * 2.5 / v30;
          CGFloat v32 = v26 - v31;
          double v33 = v42 * v28 * 2.5 / v30;
          CGPathMoveToPoint(a4, 0, v32, v27 + v33);
          CGPathAddLineToPoint(a4, 0, v22, v23);
          CGPathAddLineToPoint(a4, 0, v31 + *(double *)v44.i64, *(double *)&v44.i64[1] - v33);
          CGPathCloseSubpath(a4);
        }
      }
    }
    if (a6)
    {
      if ((v25 & 2) != 0)
      {
        double v35 = *(double *)&v43.i64[1];
        double v34 = *(double *)v43.i64;
        double v36 = v16 - *(double *)v43.i64;
        double v37 = v18 - *(double *)&v43.i64[1];
        double v38 = hypot(v16 - *(double *)v43.i64, v18 - *(double *)&v43.i64[1]);
        if (fabs(v38) >= 0.0005)
        {
          double v39 = v42 * v37 * 2.5 / v38;
          CGFloat v40 = v34 - v39;
          double v41 = v42 * v36 * 2.5 / v38;
          CGPathMoveToPoint(a6, 0, v40, v35 + v41);
          CGPathAddLineToPoint(a6, 0, v16, v18);
          CGPathAddLineToPoint(a6, 0, v39 + *(double *)v43.i64, *(double *)&v43.i64[1] - v41);
          CGPathCloseSubpath(a6);
        }
      }
    }
  }
}

+ (void)_controlPointsForArrow:(id)a3 outControlPoint1:(CGPoint *)a4 outControlPoint2:(CGPoint *)a5
{
  id v7 = a3;
  [v7 endPoint];
  double v9 = v8;
  double v11 = v10;
  [v7 startPoint];
  double v13 = v12;
  double v15 = v14;
  [v7 midPoint];
  double v17 = v16;
  double v19 = v18;

  double v34 = hypot(v9 - v13, v11 - v15);
  +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", v9 - v13, v11 - v15);
  double v21 = v20;
  double v23 = v22;
  double v24 = (v9 + v13) * 0.5;
  double v25 = (v11 + v15) * 0.5;
  double v26 = v19 - v25;
  long double v27 = hypot(v17 - v24, v19 - v25);
  double v28 = v27 / 0.75;
  if (v27 == 0.0)
  {
    double v29 = 0.0;
    double v30 = 1.0;
  }
  else
  {
    +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", v17 - v24, v26);
  }
  double v31 = v24 + v28 * v30;
  double v32 = v25 + v28 * v29;
  double v33 = v34 * 0.166666667;
  if (a4)
  {
    a4->CGFloat x = v31 - v33 * v21;
    a4->CGFloat y = v32 - v33 * v23;
  }
  if (a5)
  {
    a5->CGFloat x = v31 + v33 * v21;
    a5->CGFloat y = v32 + v33 * v23;
  }
}

+ (double)_oneDimensionalCubicBezierValueForParameter:(double)a3 start:(double)a4 controlPt1:(double)a5 controlPt2:(double)a6 end:(double)a7
{
  double v7 = 1.0 - a3;
  return v7 * v7 * (a5 * 3.0) * a3 + a4 * (v7 * (v7 * v7)) + v7 * (a6 * 3.0) * (a3 * a3) + a7 * (a3 * a3 * a3);
}

+ (CGPoint)_cubicBezierPointForParameter:(double)a3 start:(CGPoint)a4 controlPt1:(CGPoint)a5 controlPt2:(CGPoint)a6 end:(CGPoint)a7
{
  double y = a6.y;
  double v8 = a5.y;
  double v9 = a4.y;
  [a1 _oneDimensionalCubicBezierValueForParameter:a3 start:a4.x controlPt1:a5.x controlPt2:a6.x end:a7.x];
  double v13 = v12;
  [a1 _oneDimensionalCubicBezierValueForParameter:a3 start:v9 controlPt1:v8 controlPt2:y end:a7.y];
  double v15 = v14;
  double v16 = v13;
  result.double y = v15;
  result.CGFloat x = v16;
  return result;
}

+ (void)_arrowHeadLineIntersection:(id)a3 outStartIntersection:(CGPoint *)a4 outBezierStartParameter:(double *)a5 outEndIntersection:(CGPoint *)a6 outBezierEndParameter:(double *)a7
{
  id v12 = a3;
  char v13 = [a1 _drawableArrowHeads:v12];
  [v12 startPoint];
  double v15 = v14;
  double v17 = v16;
  [v12 endPoint];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  [v12 strokeWidth];
  [v12 brushStyle];
  double v32 = 0.0;
  double v33 = 0.0;
  double v30 = 0.0;
  double v31 = 0.0;
  [a1 _controlPointsForArrow:v12 outControlPoint1:&v32 outControlPoint2:&v30];
  if ((v13 & 2) != 0)
  {
    [v12 endPoint];
    double v22 = 1.0;
    while (v22 > 0.0)
    {
      double v22 = v22 + -0.025;
      objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", v22, v15, v17, v32, v33, v30, v31, v19, v21);
      +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0);
      if (v23 != 9.22337204e18 && v24 != 9.22337204e18)
      {
        if (a6)
        {
          a6->CGFloat x = v23;
          a6->double y = v24;
        }
        if (a7) {
          *a7 = v22 + 0.025;
        }
        break;
      }
    }
  }
  if (v13)
  {
    [v12 startPoint];
    double v26 = 0.0;
    while (v26 < 1.0)
    {
      double v26 = v26 + 0.025;
      objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", v26, v15, v17, v32, v33, v30, v31, v19, v21);
      +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0);
      if (v27 != 9.22337204e18 && v28 != 9.22337204e18)
      {
        if (a4)
        {
          a4->CGFloat x = v27;
          a4->double y = v28;
        }
        if (a5) {
          *a5 = v26 + -0.025;
        }
        break;
      }
    }
  }
}

+ (CGPath)_newLinePathForArrow:(id)a3 withHeads:(BOOL)a4 fromBezierParameter:(double)a5 toBezierParameter:(double)a6 optionalPageController:(id)a7 optionalContext:(CGContext *)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  unint64_t v15 = (unint64_t)a7;
  CGFloat v70 = 0.0;
  CGFloat v71 = 0.0;
  CGFloat v68 = 0.0;
  CGFloat v69 = 0.0;
  [v14 endPoint];
  double v17 = v16;
  double v19 = v18;
  [v14 startPoint];
  CGFloat MinX = v21;
  CGFloat MinY = v20;
  if (v21 == v17 && v20 == v19)
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    double v27 = Mutable;
    CGFloat v28 = MinX;
    CGFloat v29 = MinY;
    goto LABEL_8;
  }
  [a1 _controlPointsForArrow:v14 outControlPoint1:&v70 outControlPoint2:&v68];
  if (v12) {
    uint64_t v25 = [a1 _drawableArrowHeads:v14] & 3;
  }
  else {
    uint64_t v25 = 0;
  }
  if (v15 | (unint64_t)a8)
  {
    if (vabdd_f64(MinX, v17) >= 0.0005 || vabdd_f64(v17, v70) >= 0.0005 || vabdd_f64(v70, v68) >= 0.0005)
    {
      if (vabdd_f64(MinY, v19) < 0.0005 && vabdd_f64(v19, v71) < 0.0005 && vabdd_f64(v71, v69) < 0.0005)
      {
        v77.size.double width = v17 - MinX;
        v77.size.double height = v19 - MinY;
        v77.origin.double x = MinX;
        v77.origin.double y = MinY;
        CGRect v78 = CGRectStandardize(v77);
        double x = v78.origin.x;
        double y = v78.origin.y;
        double width = v78.size.width;
        double height = v78.size.height;
        [v14 strokeWidth];
        +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v15, a8, v14, x, y, width, height, v48);
        CGFloat v53 = v49;
        CGFloat v54 = v50;
        CGFloat v55 = v51;
        if (MinX <= v17)
        {
          CGFloat v56 = v52;
          CGFloat MinX = CGRectGetMinX(*(CGRect *)&v49);
          v83.origin.double x = v53;
          v83.origin.double y = v54;
          v83.size.double width = v55;
          v83.size.double height = v56;
          CGFloat MinY = CGRectGetMinY(v83);
          v84.origin.double x = v53;
          v84.origin.double y = v54;
          v84.size.double width = v55;
          v84.size.double height = v56;
          double MaxX = CGRectGetMaxX(v84);
        }
        else
        {
          CGFloat v56 = v52;
          CGFloat MinX = CGRectGetMaxX(*(CGRect *)&v49);
          v79.origin.double x = v53;
          v79.origin.double y = v54;
          v79.size.double width = v55;
          v79.size.double height = v56;
          CGFloat MinY = CGRectGetMinY(v79);
          v80.origin.double x = v53;
          v80.origin.double y = v54;
          v80.size.double width = v55;
          v80.size.double height = v56;
          double MaxX = CGRectGetMinX(v80);
        }
        v85.size.double height = v56;
        double v17 = MaxX;
        v85.origin.double x = v53;
        v85.origin.double y = v54;
        v85.size.double width = v55;
        double v19 = CGRectGetMinY(v85);
        CGFloat v71 = MinY;
        CGFloat v69 = MinY;
        if (v25) {
          goto LABEL_24;
        }
LABEL_31:
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, MinX, MinY);
        CGPathAddCurveToPoint(Mutable, 0, v70, v71, v68, v69, v17, v19);
        goto LABEL_32;
      }
    }
    else
    {
      v72.size.double width = v17 - MinX;
      v72.size.double height = v19 - MinY;
      v72.origin.double x = MinX;
      v72.origin.double y = MinY;
      CGRect v73 = CGRectStandardize(v72);
      double v30 = v73.origin.x;
      double v31 = v73.origin.y;
      double v32 = v73.size.width;
      double v33 = v73.size.height;
      [v14 strokeWidth];
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v15, a8, v14, v30, v31, v32, v33, v34);
      CGFloat v35 = v74.origin.x;
      CGFloat v36 = v74.origin.y;
      CGFloat v37 = v74.size.height;
      CGFloat v67 = v74.size.width;
      CGFloat MinX = CGRectGetMinX(v74);
      CGFloat v38 = v35;
      CGFloat v39 = v36;
      CGFloat v40 = v67;
      CGFloat v41 = v37;
      if (MinY <= v19)
      {
        CGFloat MinY = CGRectGetMinY(*(CGRect *)&v38);
        v81.origin.double x = v35;
        v81.origin.double y = v36;
        v81.size.double width = v67;
        v81.size.double height = v37;
        CGFloat v58 = CGRectGetMinX(v81);
        v82.size.double height = v37;
        double v17 = v58;
        v82.origin.double x = v35;
        v82.origin.double y = v36;
        v82.size.double width = v67;
        double MaxY = CGRectGetMaxY(v82);
      }
      else
      {
        CGFloat MinY = CGRectGetMaxY(*(CGRect *)&v38);
        v75.origin.double x = v35;
        v75.origin.double y = v36;
        v75.size.double width = v67;
        v75.size.double height = v37;
        CGFloat v42 = CGRectGetMinX(v75);
        v76.size.double height = v37;
        double v17 = v42;
        v76.origin.double x = v35;
        v76.origin.double y = v36;
        v76.size.double width = v67;
        double MaxY = CGRectGetMinY(v76);
      }
      double v19 = MaxY;
      CGFloat v70 = MinX;
      CGFloat v68 = MinX;
    }
  }
  if (!v25) {
    goto LABEL_31;
  }
LABEL_24:
  objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", a5, MinX, MinY, v70, v71, v68, v69, *(void *)&v17, *(void *)&v19);
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v60, v62);
  double v63 = a6 + 0.025;
  if (v63 < a5) {
    goto LABEL_32;
  }
  while (a5 < 1.0)
  {
    objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", a5, MinX, MinY, v70, v71, v68, v69, *(void *)&v17, *(void *)&v19);
    CGPathAddLineToPoint(Mutable, 0, v64, v65);
    a5 = a5 + 0.025;
    if (a5 > v63) {
      goto LABEL_32;
    }
  }
  objc_msgSend(a1, "_cubicBezierPointForParameter:start:controlPt1:controlPt2:end:", 0.99, MinX, MinY, v70, v71, v68, v69, *(void *)&v17, *(void *)&v19);
  double v27 = Mutable;
LABEL_8:
  CGPathAddLineToPoint(v27, 0, v28, v29);
LABEL_32:

  return Mutable;
}

@end