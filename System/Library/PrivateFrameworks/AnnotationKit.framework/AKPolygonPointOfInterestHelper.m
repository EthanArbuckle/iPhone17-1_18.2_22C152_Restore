@interface AKPolygonPointOfInterestHelper
+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (CGPoint)_pointForPointsControlOfPolygonWithNumberOfPoints:(unint64_t)a3 inAnnotation:(id)a4 onPageController:(id)a5;
+ (double)_degreesBetweenPointsForPointsControl;
+ (double)_degreesForPointsControlGivenPolygonWithNumberOfPoints:(unint64_t)a3;
+ (double)pointsControlPointDistanceFactor;
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (unint64_t)maxPolygonPoints;
+ (unint64_t)minPolygonPoints;
+ (unint64_t)numberOfPolygonPointsForControlPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKPolygonPointOfInterestHelper

+ (unint64_t)maxPolygonPoints
{
  return 12;
}

+ (unint64_t)minPolygonPoints
{
  return 3;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v40 = 0;
  id v41 = 0;
  v39.receiver = a1;
  v39.super_class = (Class)&OBJC_METACLASS___AKPolygonPointOfInterestHelper;
  id v10 = a6;
  id v11 = a5;
  objc_msgSendSuper2(&v39, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v41, &v40, v11, v10);
  id v12 = v41;
  id v13 = v40;
  v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count") + 1);
  objc_msgSend(a1, "_pointForPointsControlOfPolygonWithNumberOfPoints:inAnnotation:onPageController:", objc_msgSend(v11, "pointCount"), v11, v10);
  double v37 = v17;
  double v38 = v16;
  [v11 rectangle];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v11 rotationAngle];
  double v27 = v26;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v19, v21, v23, v25, v27);
  v28 = [v10 geometryHelper];

  objc_msgSend(v28, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v37), (float64x2_t)0, v38)));
  double v30 = v29;
  double v32 = v31;

  v33 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v30, v32);
  [v14 addObject:v33];

  v34 = [NSNumber numberWithInteger:1];
  [v15 addObject:v34];

  [v14 addObjectsFromArray:v12];
  [v15 addObjectsFromArray:v13];
  id v35 = v14;
  *a3 = v35;
  id v36 = v15;
  *a4 = v36;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (!a3) {
    return 17;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKPolygonPointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 17)
  {
    unint64_t v13 = objc_msgSend(a1, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v11, v12, x, y);
    unint64_t v14 = [a1 minPolygonPoints];
    unint64_t v15 = [a1 maxPolygonPoints];
    if (v13 >= v15) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = v13;
    }
    if (v13 >= v14) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v18 = [v11 pointCount];
    if (v18 == [a1 minPolygonPoints] && v17 != objc_msgSend(a1, "minPolygonPoints") + 1)
    {
      uint64_t v20 = [a1 minPolygonPoints];
    }
    else
    {
      uint64_t v19 = [v11 pointCount];
      if (v19 != [a1 maxPolygonPoints] || v17 == objc_msgSend(a1, "maxPolygonPoints") - 1) {
        goto LABEL_15;
      }
      uint64_t v20 = [a1 maxPolygonPoints];
    }
    unint64_t v17 = v20;
LABEL_15:
    [a1 _pointForPointsControlOfPolygonWithNumberOfPoints:v17 inAnnotation:v11 onPageController:v12];
    double x = v21;
    double y = v22;
  }

  double v23 = x;
  double v24 = y;
  result.double y = v24;
  result.double x = v23;
  return result;
}

+ (double)pointsControlPointDistanceFactor
{
  return 0.707106781;
}

+ (unint64_t)numberOfPolygonPointsForControlPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a5;
  id v8 = a4;
  [v8 rectangle];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  LODWORD(a4) = [v8 verticallyFlipped];

  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v7, v10, v12, v14, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v7, x, y, v10, v12, v14, v16);
  long long v43 = v26;
  double v45 = v25;

  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v18, v20, v22, v24);
  float64x2_t v27 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, *(double *)&v43), (float64x2_t)0, v45));
  long double v28 = v27.f64[1];
  if (a4)
  {
    double v46 = v27.f64[0];
    +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v18, v20, v22, v24);
    +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v46, (double)v28, -v29, -v29, v29 + v29, v29 + v29);
    v27.f64[0] = v30;
    long double v28 = v31;
  }
  double v32 = atan2(v28, v27.f64[0]) * 180.0 / 3.14159265;
  if (v32 <= 90.0) {
    double v33 = v32 + -90.0;
  }
  else {
    double v33 = v32 + -90.0 + -360.0;
  }
  double v34 = fabs(v33);
  if (v34 >= 359.0) {
    double v35 = 0.0;
  }
  else {
    double v35 = v34;
  }
  objc_msgSend(a1, "_degreesBetweenPointsForPointsControl", v43);
  unint64_t v37 = vcvtad_u64_f64(v35 / v36) + 3;
  unint64_t v38 = [a1 minPolygonPoints];
  unint64_t v39 = [a1 maxPolygonPoints];
  if (v37 >= v39) {
    unint64_t v40 = v39;
  }
  else {
    unint64_t v40 = v37;
  }
  if (v37 >= v38) {
    return v40;
  }
  else {
    return v38;
  }
}

+ (double)_degreesBetweenPointsForPointsControl
{
  return 360.0 / (double)(unint64_t)([a1 maxPolygonPoints] - 2);
}

+ (double)_degreesForPointsControlGivenPolygonWithNumberOfPoints:(unint64_t)a3
{
  [a1 _degreesBetweenPointsForPointsControl];
  return 90.0 - ((double)a3 + -3.0) * v4;
}

+ (CGPoint)_pointForPointsControlOfPolygonWithNumberOfPoints:(unint64_t)a3 inAnnotation:(id)a4 onPageController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 rectangle];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  LODWORD(a4) = [v9 verticallyFlipped];

  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v8, v11, v13, v15, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [a1 pointsControlPointDistanceFactor];
  double v27 = v26;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v19, v21, v23, v25);
  double v29 = v27 * v28;
  [a1 _degreesForPointsControlGivenPolygonWithNumberOfPoints:a3];
  __double2 v32 = __sincos_stret(v30 * 3.14159265 / 180.0);
  double v33 = v29 * v32.__sinval;
  if (a4)
  {
    +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v29 * v32.__cosval, v33, -v29, -v29, v29 + v29, v29 + v29);
    double v42 = v34;
  }
  else
  {
    double v42 = v29 * v32.__cosval;
  }
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v19, v21, v23, v25, *(void *)&v33, v31);
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v8, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v41), (float64x2_t)0, v42)), v19, v21, v23, v25);
  double v36 = v35;
  double v38 = v37;

  double v39 = v36;
  double v40 = v38;
  result.double y = v40;
  result.double x = v39;
  return result;
}

@end