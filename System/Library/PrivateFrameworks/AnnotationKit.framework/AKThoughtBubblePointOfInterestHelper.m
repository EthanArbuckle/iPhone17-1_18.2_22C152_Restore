@interface AKThoughtBubblePointOfInterestHelper
+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (CGPoint)_constrainPointyPointToOutset:(CGPoint)a3 forAnnotation:(id)a4 outsetIsMin:(BOOL)a5;
+ (double)maxOutset;
+ (double)minOutset;
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKThoughtBubblePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v39 = 0;
  id v40 = 0;
  v38.receiver = a1;
  v38.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
  id v9 = a6;
  id v10 = a5;
  objc_msgSendSuper2(&v38, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v40, &v39, v10, v9);
  id v11 = v40;
  id v12 = v39;
  v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
  v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  [v10 pointyBitPoint];
  double v36 = v16;
  double v37 = v15;
  [v10 rectangle];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [v10 rotationAngle];
  double v26 = v25;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v18, v20, v22, v24, v26);
  v27 = [v9 geometryHelper];

  objc_msgSend(v27, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v36), (float64x2_t)0, v37)));
  double v29 = v28;
  double v31 = v30;

  v32 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v29, v31);
  [v13 addObject:v32];

  v33 = [NSNumber numberWithInteger:1];
  [v14 addObject:v33];

  [v13 addObjectsFromArray:v11];
  [v14 addObjectsFromArray:v12];
  id v34 = v13;
  *a3 = v34;
  id v35 = v14;
  *a4 = v35;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (!a3) {
    return 14;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (double)minOutset
{
  return 30.0;
}

+ (double)maxOutset
{
  return 125.0;
}

+ (CGPoint)_constrainPointyPointToOutset:(CGPoint)a3 forAnnotation:(id)a4 outsetIsMin:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (v5) {
    [a1 minOutset];
  }
  else {
    [a1 maxOutset];
  }
  double v11 = v10;
  if (v10 < 1.79769313e308)
  {
    [v9 originalModelBaseScaleFactor];
    double v13 = v12;
    [v9 rectangle];
    CGRect v47 = CGRectInset(v46, -(v11 * v13), -(v11 * v13));
    CGFloat v14 = v47.origin.x;
    CGFloat v15 = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    double MidX = CGRectGetMidX(v47);
    v48.origin.double x = v14;
    v48.origin.double y = v15;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v48);
    v49.origin.double x = v14;
    v49.origin.double y = v15;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    double v38 = x;
    CGFloat v20 = CGRectGetHeight(v49) * 0.5;
    memset(&v44, 0, sizeof(v44));
    CGFloat v36 = MidY;
    CGFloat v37 = MidX;
    CGFloat v21 = -MidX;
    CGFloat v22 = height;
    CGAffineTransformMakeTranslation(&v44, v21, -MidY);
    double v23 = v20;
    v50.origin.double x = v14;
    v50.origin.double y = v15;
    v50.size.CGFloat width = width;
    CGFloat rect = v22;
    v50.size.CGFloat height = v22;
    CGFloat v24 = CGRectGetWidth(v50);
    double v35 = v20 + v20;
    CGAffineTransformMakeScale(&t2, (v20 + v20) / v24, 1.0);
    CGAffineTransform t1 = v44;
    CGAffineTransformConcat(&v43, &t1, &t2);
    CGAffineTransform v44 = v43;
    CGFloat v25 = v43.tx + y * v43.c + v43.a * v38;
    double x = v38;
    CGFloat v26 = v43.ty + y * v43.d + v43.b * v38;
    double v27 = hypot(v25, v26);
    BOOL v28 = v27 <= v23;
    if (!v5) {
      BOOL v28 = v27 >= v23;
    }
    if (v28)
    {
      double v29 = v23 * (v25 / v27);
      double v30 = v23 * (v26 / v27);
      memset(&v43, 0, sizeof(v43));
      v51.origin.double x = v14;
      v51.origin.double y = v15;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = rect;
      CGFloat v31 = CGRectGetWidth(v51);
      CGAffineTransformMakeScale(&v43, v31 / v35, 1.0);
      CGAffineTransformMakeTranslation(&v40, v37, v36);
      CGAffineTransform v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v40);
      CGAffineTransform v43 = t1;
      double x = t1.tx + v30 * t1.c + t1.a * v29;
      double y = t1.ty + v30 * t1.d + t1.b * v29;
    }
  }

  double v32 = x;
  double v33 = y;
  result.double y = v33;
  result.double x = v32;
  return result;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  if (a4 == 14)
  {
    id v10 = a5;
    objc_msgSend(a1, "_constrainPointyPointToOutset:forAnnotation:outsetIsMin:", v10, 0, x, y);
    objc_msgSend(a1, "_constrainPointyPointToOutset:forAnnotation:outsetIsMin:", v10, 1);
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___AKThoughtBubblePointOfInterestHelper;
    objc_msgSendSuper2(&v17, sel__concreteValidatePoint_ofDraggableArea_forAnnotation_onPageController_, a4, a5, a6, a3.x, a3.y);
  }
  double v13 = v11;
  double v14 = v12;

  double v15 = v13;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

@end