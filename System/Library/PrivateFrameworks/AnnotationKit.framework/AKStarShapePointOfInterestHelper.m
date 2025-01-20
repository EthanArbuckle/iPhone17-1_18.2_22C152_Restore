@interface AKStarShapePointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (unint64_t)maxPolygonPoints;
+ (unint64_t)minPolygonPoints;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKStarShapePointOfInterestHelper

+ (unint64_t)maxPolygonPoints
{
  return 20;
}

+ (unint64_t)minPolygonPoints
{
  return 3;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v50 = 0;
  v51[0] = 0;
  v49.receiver = a1;
  v49.super_class = (Class)&OBJC_METACLASS___AKStarShapePointOfInterestHelper;
  id v7 = a6;
  id v8 = a5;
  objc_msgSendSuper2(&v49, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, v51, &v50, v8, v7);
  id v9 = v51[0];
  id v10 = v50;
  [v8 rectangle];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v8 rotationAngle];
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v12, v14, v16, v18, v19);
  v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);
  v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
  v22 = +[AKStarAnnotationRenderer innerStarPoints:v8];
  v23 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v8, "pointCount") - 1);
  [v23 akPointValue];
  double v25 = v24;
  double v27 = v26;

  [v8 rectangle];
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat width = v52.size.width;
  CGFloat height = v52.size.height;
  double MidX = CGRectGetMidX(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v53);
  uint64_t v34 = [v8 originalExifOrientation];

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:v34], v25, v27, MidX, MidY);
  float64x2_t v46 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v35), (float64x2_t)0, v36));
  v37 = [v7 geometryHelper];

  [v37 screenPixelAlignedPointForPoint:*(_OWORD *)&v46];
  double v39 = v38;
  double v41 = v40;

  v42 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v39, v41);
  [v20 addObject:v42];

  v43 = [NSNumber numberWithInteger:1];
  [v21 addObject:v43];

  [v20 addObjectsFromArray:v9];
  [v21 addObjectsFromArray:v10];
  id v44 = v20;
  *a3 = v44;
  id v45 = v21;
  *a4 = v45;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (!a3) {
    return 16;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarShapePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

@end