@interface AKTwoPointRectangularTextPointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKTwoPointRectangularTextPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v11 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  [v8 rectangle];
  double x = v65.origin.x;
  double y = v65.origin.y;
  double width = v65.size.width;
  double height = v65.size.height;
  double MidX = CGRectGetMidX(v65);
  v66.origin.double x = x;
  v66.origin.double y = y;
  v66.size.double width = width;
  v66.size.double height = height;
  double MidY = CGRectGetMidY(v66);
  uint64_t v18 = [v8 originalExifOrientation];
  int64_t v19 = +[AKGeometryHelper inverseExifOrientation:v18];
  v64[0] = 0.0;
  int v20 = +[AKGeometryHelper annotationHasRotation:v8 outAngle:v64];
  float64x2_t v21 = *(float64x2_t *)(MEMORY[0x263F000D0] + 16);
  v63[0] = *(float64x2_t *)MEMORY[0x263F000D0];
  v63[1] = v21;
  v63[2] = *(float64x2_t *)(MEMORY[0x263F000D0] + 32);
  if (v20) {
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, v64[0]);
  }
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, x, y, width, height, MidX, MidY);
  double v22 = CGRectGetMidY(v67);
  if (v20)
  {
    double v61 = v22;
  }
  else
  {
    +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v19, 0.0, v22, MidX, MidY);
    double v24 = v23;
    double v26 = v25;
    v27 = [v9 geometryHelper];
    objc_msgSend(v27, "screenPixelAlignedPointForPoint:", v24, v26);
    double v29 = v28;
    double v31 = v30;

    +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v18, v29, v31, MidX, MidY);
    double v61 = v32;
    [v8 strokeWidth];
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v9, 0, 0, x, y, width, height, v33);
    double x = v34;
    double y = v35;
    double width = v36;
    double height = v37;
  }
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:v8];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  v68.origin.double x = x;
  v68.origin.double y = y;
  v68.size.double width = width;
  v68.size.double height = height;
  CGRect v69 = CGRectInset(v68, v39, v41);
  double v42 = v69.origin.x;
  double v43 = v69.origin.y;
  double v44 = v69.size.width;
  double v45 = v69.size.height;
  if ((v20 & 1) == 0)
  {
    v46 = [v9 geometryHelper];
    objc_msgSend(v46, "screenPixelAlignedRectForRect:", v42, v43, v44, v45);
    double v42 = v47;
    double v43 = v48;
    double v44 = v49;
    double v45 = v50;
  }
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, v42, v43, v44, v45, MidX, MidY);
  CGFloat v51 = v70.origin.x;
  CGFloat v52 = v70.origin.y;
  CGFloat v53 = v70.size.width;
  CGFloat v54 = v70.size.height;
  double MinX = CGRectGetMinX(v70);
  v71.origin.double x = v51;
  v71.origin.double y = v52;
  v71.size.double width = v53;
  v71.size.double height = v54;
  double MaxX = CGRectGetMaxX(v71);
  if ([v8 conformsToAKTextAnnotationProtocol]
    && [v8 textIsClipped])
  {
    v72.origin.double x = v51;
    v72.origin.double y = v52;
    v72.size.double width = v53;
    v72.size.double height = v54;
    double v60 = CGRectGetMidX(v72);
    v73.origin.double x = v51;
    v73.origin.double y = v52;
    v73.size.double width = v53;
    v73.size.double height = v54;
    double MinY = CGRectGetMinY(v73);
    sub_23763D49C(2, v18, v9, v20, v63, v10, v11, v60, MinY, MidX, MidY);
  }
  sub_23763D49C(0, v18, v9, v20, v63, v10, v11, MaxX, v61, MidX, MidY);
  sub_23763D49C(0, v18, v9, v20, v63, v10, v11, MinX, v61, MidX, MidY);
  id v58 = v10;
  *a3 = v58;
  id v59 = v11;
  *a4 = v59;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (a3) {
    uint64_t v6 = 8 * (a3 == 1);
  }
  else {
    uint64_t v6 = 4;
  }
  id v7 = a5;
  uint64_t v8 = [a4 originalExifOrientation];
  uint64_t v9 = [v7 currentModelToScreenExifOrientation];

  unint64_t v10 = +[AKGeometryHelper draggableArea:v6 convertedForExif:v8];

  return +[AKGeometryHelper draggableArea:v10 convertedForExif:v9];
}

@end