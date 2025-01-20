@interface AKFourPointRectangularPointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKFourPointRectangularPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9 = a6;
  v10 = (void *)MEMORY[0x263EFF980];
  id v11 = a5;
  v12 = [v10 arrayWithCapacity:4];
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  [v11 rectangle];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v47 = 0.0;
  int v22 = +[AKGeometryHelper annotationHasRotation:v11 outAngle:&v47];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v15, v17, v19, v21, v47, 0, 0, 0, 0, 0, 0);
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:v11];
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v48.origin.double x = v15;
  v48.origin.double y = v17;
  v48.size.double width = v19;
  v48.size.double height = v21;
  CGRect v49 = CGRectInset(v48, v24, v26);
  double x = v49.origin.x;
  double y = v49.origin.y;
  double width = v49.size.width;
  double height = v49.size.height;
  if ((v22 & 1) == 0)
  {
    v31 = [v9 geometryHelper];
    objc_msgSend(v31, "screenPixelAlignedRectForRect:", x, y, width, height);
    double x = v32;
    double y = v33;
    double width = v34;
    double height = v35;
  }
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v9, x, y, width, height);
  double v36 = v50.origin.x;
  double v37 = v50.origin.y;
  double v38 = v50.size.width;
  double v39 = v50.size.height;
  double MinX = CGRectGetMinX(v50);
  v51.origin.double x = v36;
  v51.origin.double y = v37;
  v51.size.double width = v38;
  v51.size.double height = v39;
  double MaxX = CGRectGetMaxX(v51);
  v52.origin.double x = v36;
  v52.origin.double y = v37;
  v52.size.double width = v38;
  v52.size.double height = v39;
  double MinY = CGRectGetMinY(v52);
  v53.origin.double x = v36;
  v53.origin.double y = v37;
  v53.size.double width = v38;
  v53.size.double height = v39;
  double MaxY = CGRectGetMaxY(v53);
  sub_2376CC164(v9, v22, &v46, v12, v13, MaxX, MinY, v36, v37, v38, v39);
  sub_2376CC164(v9, v22, &v46, v12, v13, MinX, MinY, v36, v37, v38, v39);
  sub_2376CC164(v9, v22, &v46, v12, v13, MaxX, MaxY, v36, v37, v38, v39);
  sub_2376CC164(v9, v22, &v46, v12, v13, MinX, MaxY, v36, v37, v38, v39);
  id v44 = v12;
  *a3 = v44;
  id v45 = v13;
  *a4 = v45;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return qword_2376F45E0[a3];
  }
}

@end