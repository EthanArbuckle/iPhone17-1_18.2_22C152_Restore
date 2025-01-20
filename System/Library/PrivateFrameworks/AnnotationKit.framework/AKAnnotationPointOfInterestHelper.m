@interface AKAnnotationPointOfInterestHelper
+ (BOOL)_point:(CGPoint)a3 isInCircleWithRadius:(double)a4 atPoint:(CGPoint)a5;
+ (BOOL)_point:(CGPoint)a3 isInRectWithSize:(double)a4 atPoint:(CGPoint)a5;
+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (CGPoint)pointForDraggableArea:(unint64_t)a3 onAnnotation:(id)a4 pageControllerForPixelAlignment:(id)a5;
+ (CGPoint)validatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (Class)_poiHelperClassForAnnotation:(id)a3;
+ (double)draggableAreaScaleFactorForScaleFactor:(double)a3;
+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6;
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (unint64_t)draggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
+ (void)pointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKAnnotationPointOfInterestHelper

+ (void)pointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v11), "_concretePointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", a3, a4, v11, v10);
}

+ (CGPoint)pointForDraggableArea:(unint64_t)a3 onAnnotation:(id)a4 pageControllerForPixelAlignment:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v29 = 0;
  id v30 = 0;
  [a1 pointsOfInterest:&v30 withVisualStyle:&v29 ofAnnotation:v8 pageControllerForPixelAlignment:v9];
  id v10 = v30;
  id v11 = v29;
  double v13 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "akPointValue", (void)v25);
        double v20 = v19;
        double v22 = v21;
        if (objc_msgSend(a1, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v8, v9) == a3)
        {
          double v12 = v22;
          double v13 = v20;
          goto LABEL_11;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v23 = v13;
  double v24 = v12;
  result.y = v24;
  result.x = v23;
  return result;
}

+ (unint64_t)draggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  id v12 = a4;
  unint64_t v13 = objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v12), "_concreteDraggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v12, v11, x, y, a5);

  return v13;
}

+ (double)draggableAreaScaleFactorForScaleFactor:(double)a3
{
  return a3 * 0.5;
}

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v11 = a4;
  id v12 = a6;
  [a1 draggableAreaScaleFactorForScaleFactor:a5];
  uint64_t v14 = v13;
  id v36 = 0;
  id v35 = 0;
  [a1 pointsOfInterest:&v36 withVisualStyle:&v35 ofAnnotation:v11 pageControllerForPixelAlignment:v12];
  id v15 = v36;
  id v16 = v35;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  double v23 = sub_2376CAC80;
  double v24 = &unk_264CDBC50;
  id v17 = v16;
  long long v26 = &v31;
  id v27 = a1;
  CGFloat v28 = x;
  CGFloat v29 = y;
  uint64_t v30 = v14;
  id v25 = v17;
  [v15 enumerateObjectsUsingBlock:&v21];
  if (v32[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v19 = objc_msgSend(a1, "_poiHelperClassForAnnotation:", v11, v21, v22, v23, v24);
    unint64_t v18 = [v19 _concreteDraggableAreaForPointOfInterestWithIndex:v32[3] ofAnnotation:v11 onPageController:v12];
  }

  _Block_object_dispose(&v31, 8);
  return v18;
}

+ (CGPoint)validatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  id v12 = a5;
  objc_msgSend((id)objc_msgSend(a1, "_poiHelperClassForAnnotation:", v12), "_concreteValidatePoint:ofDraggableArea:forAnnotation:onPageController:", a4, v12, v11, x, y);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  return 0;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"%s must be overriden by a subclass", a6, a3.x, a3.y, "+[AKAnnotationPointOfInterestHelper _concreteValidatePoint:ofDraggableArea:forAnnotation:onPageController:]");
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v7;
  result.double x = v6;
  return result;
}

+ (BOOL)_point:(CGPoint)a3 isInRectWithSize:(double)a4 atPoint:(CGPoint)a5
{
  v10.double y = a3.y;
  CGFloat x = a3.x;
  CGFloat v6 = a5.x - a4 * 0.5;
  CGFloat v7 = a5.y - a4 * 0.5;
  v10.CGFloat x = x;
  return CGRectContainsPoint(*(CGRect *)(&a4 - 2), v10);
}

+ (BOOL)_point:(CGPoint)a3 isInCircleWithRadius:(double)a4 atPoint:(CGPoint)a5
{
  return hypot(a5.x - a3.x, a5.y - a3.y) < a4;
}

+ (Class)_poiHelperClassForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_11:
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end