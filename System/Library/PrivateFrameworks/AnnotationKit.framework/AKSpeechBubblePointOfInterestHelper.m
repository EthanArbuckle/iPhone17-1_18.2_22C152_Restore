@interface AKSpeechBubblePointOfInterestHelper
+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (CGPoint)_endPointOfBoundingLineSegmentFromPointyPointThroughtPoint:(CGPoint)a3 forAnnotation:(id)a4;
+ (double)maxOutset;
+ (double)minOutset;
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKSpeechBubblePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v46 = 0;
  v47[0] = 0;
  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  id v7 = a6;
  id v8 = a5;
  objc_msgSendSuper2(&v45, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, v47, &v46, v8, v7);
  id v38 = v47[0];
  id v37 = v46;
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v38, "count") + 1);
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v37, "count") + 1);
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:v8 withUpdatedProperties:0 firstPoint:&v43 secondPoint:&v41];
  BOOL v11 = +[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", [v7 currentModelToScreenExifOrientation]);
  if (v11) {
    v13 = &v42;
  }
  else {
    v13 = &v44;
  }
  uint64_t v14 = *v13;
  if (v11) {
    v15 = (double *)&v41;
  }
  else {
    v15 = (double *)&v43;
  }
  double v36 = *v15;
  objc_msgSend(v8, "rectangle", v14, v12);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v8 rotationAngle];
  double v25 = v24;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v17, v19, v21, v23, v25);
  v26 = [v7 geometryHelper];

  objc_msgSend(v26, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v35), (float64x2_t)0, v36)));
  double v28 = v27;
  double v30 = v29;

  v31 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v28, v30);
  [v9 addObject:v31];

  v32 = [NSNumber numberWithUnsignedInteger:1];
  [v10 addObject:v32];

  [v9 addObjectsFromArray:v38];
  [v10 addObjectsFromArray:v37];
  id v33 = v9;
  *a3 = v33;
  id v34 = v10;
  *a4 = v34;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (!a3) {
    return 15;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (double)minOutset
{
  return 30.0;
}

+ (double)maxOutset
{
  return 1.79769313e308;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  v52[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  if (a4 == 15)
  {
    double v49 = 0.0;
    double v50 = 0.0;
    id v12 = a6;
    [v11 rectangle];
    double v13 = v54.origin.x;
    double v14 = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
    double MidX = CGRectGetMidX(v54);
    v55.origin.double x = v13;
    v55.origin.double y = v14;
    v55.size.double width = width;
    v55.size.double height = height;
    double MidY = CGRectGetMidY(v55);
    double v45 = x;
    double v46 = y;
    +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", 0, MidX, MidY, x, y, v13, v14, width, height);
    double v20 = v19;
    double v22 = v21;
    +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v11);
    double v47 = v23;
    [v11 pointyBitPoint];
    BOOL v26 = +[AKGeometryHelper isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:", v20, v22, v24, v25, MidX, MidY);
    uint64_t v27 = [v12 currentModelToScreenExifOrientation];

    BOOL v28 = +[AKGeometryHelper exifOrientationHasFlip:v27];
    double v29 = 0.0;
    if (v28)
    {
      if (!v26)
      {
        double v47 = 720.0 - v47;
        goto LABEL_7;
      }
    }
    else if (v26)
    {
LABEL_7:
      double v35 = v47;
      if (v47 > 90.0)
      {
        [v11 pointyBitPoint];
        +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withEllipseOfRect:farthestResult:", 1, v45, v46, v36, v37, v13, v14, width, height);
        if (v39 != 9.22337204e18 && v38 != 9.22337204e18)
        {
          +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v11);
          double v35 = v40;
        }
      }
      if (v35 <= 90.0) {
        double v29 = v35;
      }
      else {
        double v29 = 90.0;
      }
    }
    v51 = @"pointyBitBaseWidthAngle";
    uint64_t v41 = [NSNumber numberWithDouble:v29];
    v52[0] = v41;
    uint64_t v42 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];

    +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:v11 withUpdatedProperties:v42 firstPoint:&v49 secondPoint:0];
    goto LABEL_15;
  }
  v48.receiver = a1;
  v48.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  id v30 = a6;
  objc_msgSendSuper2(&v48, sel__concreteValidatePoint_ofDraggableArea_forAnnotation_onPageController_, a4, v11, v30, x, y);
  double v32 = v31;
  double v34 = v33;

  double v49 = v32;
  double v50 = v34;
LABEL_15:

  double v43 = v49;
  double v44 = v50;
  result.double y = v44;
  result.double x = v43;
  return result;
}

+ (CGPoint)_endPointOfBoundingLineSegmentFromPointyPointThroughtPoint:(CGPoint)a3 forAnnotation:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  [v6 rectangle];
  double MidX = CGRectGetMidX(v29);
  [v6 rectangle];
  double MidY = CGRectGetMidY(v30);
  [v6 rectangle];
  double Width = CGRectGetWidth(v31);
  [v6 rectangle];
  double Height = CGRectGetHeight(v32);
  if (Width < Height) {
    double Width = Height;
  }
  [v6 pointyBitPoint];
  long double v12 = v11 - MidX;
  [v6 pointyBitPoint];
  long double v14 = Width + hypot(v12, v13 - MidY);
  [v6 pointyBitPoint];
  double v16 = x - v15;
  [v6 pointyBitPoint];
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v16, y - v17);
  double v19 = v18;
  double v21 = v20;
  [v6 pointyBitPoint];
  double v23 = v22 + v14 * v19;
  [v6 pointyBitPoint];
  double v25 = v24;

  double v26 = v25 + v14 * v21;
  double v27 = v23;
  result.double y = v26;
  result.double x = v27;
  return result;
}

@end