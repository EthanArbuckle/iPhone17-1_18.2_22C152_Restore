@interface AKTwoPointLinePointOfInterestHelper
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKTwoPointLinePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  v9 = (void *)MEMORY[0x263EFF980];
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 arrayWithCapacity:2];
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  [v11 startPoint];
  double v15 = v14;
  double v17 = v16;
  [v11 endPoint];
  double v19 = v18;
  double v21 = v20;

  v22 = [v10 geometryHelper];
  objc_msgSend(v22, "screenPixelAlignedPointForPoint:", v15, v17);
  double v24 = v23;
  double v26 = v25;

  v27 = [v10 geometryHelper];

  objc_msgSend(v27, "screenPixelAlignedPointForPoint:", v19, v21);
  double v29 = v28;
  double v31 = v30;

  v32 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v24, v26);
  [v12 addObject:v32];

  v33 = [NSNumber numberWithUnsignedInteger:0];
  [v13 addObject:v33];

  v34 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v29, v31);
  [v12 addObject:v34];

  v35 = [NSNumber numberWithUnsignedInteger:0];
  [v13 addObject:v35];

  id v37 = v12;
  *a3 = v37;
  id v36 = v13;
  *a4 = v36;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  unint64_t v5 = 10;
  if (a3 != 1) {
    unint64_t v5 = 0;
  }
  if (a3) {
    return v5;
  }
  else {
    return 9;
  }
}

@end