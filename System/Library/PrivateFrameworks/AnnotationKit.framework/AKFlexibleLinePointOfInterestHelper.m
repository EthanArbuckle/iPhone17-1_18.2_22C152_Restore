@interface AKFlexibleLinePointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKFlexibleLinePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v29 = 0;
  id v30 = 0;
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___AKFlexibleLinePointOfInterestHelper;
  id v9 = a6;
  id v10 = a5;
  objc_msgSendSuper2(&v28, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v30, &v29, v10, v9);
  id v11 = v30;
  id v12 = v29;
  v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count", v28.receiver, v28.super_class) + 1);
  v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  [v13 addObjectsFromArray:v11];
  [v14 addObjectsFromArray:v12];
  [v10 midPoint];
  double v16 = v15;
  double v18 = v17;

  v19 = [v9 geometryHelper];

  objc_msgSend(v19, "screenPixelAlignedPointForPoint:", v16, v18);
  double v21 = v20;
  double v23 = v22;

  v24 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v21, v23);
  [v13 addObject:v24];

  v25 = [NSNumber numberWithUnsignedInteger:1];
  [v14 addObject:v25];

  id v26 = v13;
  *a3 = v26;
  id v27 = v14;
  *a4 = v27;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 >= 2)
  {
    if (a3 == 2) {
      unint64_t v10 = 11;
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___AKFlexibleLinePointOfInterestHelper;
    unint64_t v10 = (unint64_t)objc_msgSendSuper2(&v12, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3, v8, v9);
  }

  return v10;
}

@end