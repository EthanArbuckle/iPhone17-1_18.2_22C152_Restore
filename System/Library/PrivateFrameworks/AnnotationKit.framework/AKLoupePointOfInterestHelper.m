@interface AKLoupePointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKLoupePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  v9 = (void *)MEMORY[0x263EFF980];
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 arrayWithCapacity:2];
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  [v11 rectangle];
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v10);
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  double v18 = CGRectGetWidth(v55);
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  double v19 = CGRectGetHeight(v56);
  [v11 magnification];
  double v21 = v20;

  double v22 = (v21 + -1.5) / 3.5;
  double v23 = 1.57079633;
  if (v22 <= 1.0) {
    double v23 = v22 * 1.57079633;
  }
  if (v22 >= 0.0) {
    double v24 = v23;
  }
  else {
    double v24 = 0.0;
  }
  double v25 = v19 * 0.5;
  double v26 = v18 * 0.5;
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  double MidX = CGRectGetMidX(v57);
  __double2 v28 = __sincos_stret(v24);
  v58.origin.double x = x;
  v58.origin.double y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v10, MidX + v28.__sinval * v26, CGRectGetMidY(v58) + v28.__cosval * v25, x, y, width, height);
  double v30 = v29;
  double v32 = v31;
  v33 = [v10 geometryHelper];
  objc_msgSend(v33, "screenPixelAlignedPointForPoint:", v30, v32);
  double v35 = v34;
  double v37 = v36;

  v38 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v35, v37);
  [v12 addObject:v38];

  v39 = [NSNumber numberWithInteger:1];
  [v13 addObject:v39];

  v59.origin.double x = x;
  v59.origin.double y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  CGFloat v40 = CGRectGetMidX(v59) + v26 * 0.707106781;
  v60.origin.double x = x;
  v60.origin.double y = y;
  v60.size.double width = width;
  v60.size.double height = height;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v10, v40, CGRectGetMidY(v60) + v25 * -0.707106781, x, y, width, height);
  double v42 = v41;
  double v44 = v43;
  v45 = [v10 geometryHelper];

  objc_msgSend(v45, "screenPixelAlignedPointForPoint:", v42, v44);
  double v47 = v46;
  double v49 = v48;

  v50 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v47, v49);
  [v12 addObject:v50];

  v51 = [NSNumber numberWithInteger:0];
  [v13 addObject:v51];

  id v53 = v12;
  *a3 = v53;
  id v52 = v13;
  *a4 = v52;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  unint64_t v5 = 18;
  if (a3 != 1) {
    unint64_t v5 = 0;
  }
  if (a3) {
    return v5;
  }
  else {
    return 19;
  }
}

@end