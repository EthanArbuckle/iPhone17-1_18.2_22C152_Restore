@interface AKEightPointRectangularPointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKEightPointRectangularPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
  v12 = [MEMORY[0x263EFF980] arrayWithCapacity:9];
  [v9 rectangle];
  double x = v71.origin.x;
  double y = v71.origin.y;
  double width = v71.size.width;
  double height = v71.size.height;
  if (CGRectIsInfinite(v71))
  {
    [v10 maxPageRect];
    double x = v17;
    double y = v18;
    double width = v19;
    double height = v20;
  }
  double v70 = 0.0;
  int v21 = +[AKGeometryHelper annotationHasRotation:v9 outAngle:&v70];
  float64x2_t v22 = *(float64x2_t *)(MEMORY[0x263F000D0] + 16);
  v69[0] = *(float64x2_t *)MEMORY[0x263F000D0];
  v69[1] = v22;
  v69[2] = *(float64x2_t *)(MEMORY[0x263F000D0] + 32);
  if (v21) {
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, v70);
  }
  v72.origin.double x = x;
  v72.origin.double y = y;
  v72.size.double width = width;
  v72.size.double height = height;
  double MidX = CGRectGetMidX(v72);
  v73.origin.double x = x;
  v73.origin.double y = y;
  v73.size.double width = width;
  v73.size.double height = height;
  double MidY = CGRectGetMidY(v73);
  double v25 = MidY;
  if (v21)
  {
    double v67 = MidX;
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v9, *(void *)&MidY);
  }
  else
  {
    v28 = [v10 geometryHelper];
    objc_msgSend(v28, "screenPixelAlignedPointForPoint:", MidX, v25);
    double v30 = v29;
    uint64_t v32 = v31;

    objc_opt_class();
    double v67 = v30;
    if (objc_opt_isKindOfClass())
    {
      [v9 strokeWidth];
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, 0, 0, x, y, width, height, v33);
      double x = v34;
      double y = v35;
      double width = v36;
      double height = v37;
    }
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v9, v32);
  }
  CGFloat v38 = v26;
  CGFloat v39 = v27;
  v74.origin.double x = x;
  v74.origin.double y = y;
  v74.size.double width = width;
  v74.size.double height = height;
  CGRect v75 = CGRectInset(v74, v38, v39);
  double v40 = v75.origin.x;
  double v41 = v75.origin.y;
  double v42 = v75.size.width;
  double v43 = v75.size.height;
  if ((v21 & 1) == 0)
  {
    v44 = [v10 geometryHelper];
    objc_msgSend(v44, "screenPixelAlignedRectForRect:", v40, v41, v42, v43);
    double v40 = v45;
    double v41 = v46;
    double v42 = v47;
    double v43 = v48;
  }
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v10, v40, v41, v42, v43);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v10, v67, v65, v40, v41, v42, v43);
  double v66 = v58;
  double v68 = v57;
  v76.origin.double x = v50;
  v76.origin.double y = v52;
  v76.size.double width = v54;
  v76.size.double height = v56;
  double MinX = CGRectGetMinX(v76);
  v77.origin.double x = v50;
  v77.origin.double y = v52;
  v77.size.double width = v54;
  v77.size.double height = v56;
  double MaxX = CGRectGetMaxX(v77);
  v78.origin.double x = v50;
  v78.origin.double y = v52;
  v78.size.double width = v54;
  v78.size.double height = v56;
  double MinY = CGRectGetMinY(v78);
  v79.origin.double x = v50;
  v79.origin.double y = v52;
  v79.size.double width = v54;
  v79.size.double height = v56;
  double MaxY = CGRectGetMaxY(v79);
  if ([v9 conformsToAKTextAnnotationProtocol]
    && [v9 textIsClipped])
  {
    sub_23764BC18(2, v10, v21, v69, v11, v12, v68, MinY, v50, v52, v54, v56);
  }
  sub_23764BC18(0, v10, v21, v69, v11, v12, MaxX, MinY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, MaxX, MaxY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, MinX, MinY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, MinX, MaxY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, MinX, v66, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, v68, MinY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, v68, MaxY, v50, v52, v54, v56);
  sub_23764BC18(0, v10, v21, v69, v11, v12, MaxX, v66, v50, v52, v54, v56);
  id v63 = v11;
  *a3 = v63;
  id v64 = v12;
  *a4 = v64;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v6 = a4;
  if (![v6 conformsToAKTextAnnotationProtocol])
  {
    unint64_t v8 = a3;
LABEL_10:
    if (v8 > 7) {
      a3 = 0;
    }
    else {
      a3 = qword_2376F40A8[v8];
    }
    goto LABEL_13;
  }
  int v7 = [v6 textIsClipped];
  unint64_t v8 = a3 - 1;
  if (!a3) {
    unint64_t v8 = 0;
  }
  if (!v7) {
    unint64_t v8 = a3;
  }
  if (a3 || (v7 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_13:

  return a3;
}

@end