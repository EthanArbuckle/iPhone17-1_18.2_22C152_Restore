@interface AKArrowShapePointOfInterestHelper
+ (CGPoint)_arrowHeadInnerControlPoint:(id)a3;
+ (CGPoint)_arrowHeadOuterControlPoint:(id)a3;
+ (CGPoint)_centeredBaseControlPoint:(id)a3;
+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6;
+ (CGPoint)_normalizedDirectionVector:(id)a3;
+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5;
+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6;
@end

@implementation AKArrowShapePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v8 = a5;
  id v48 = 0;
  id v49 = 0;
  v47.receiver = a1;
  v47.super_class = (Class)&OBJC_METACLASS___AKArrowShapePointOfInterestHelper;
  id v9 = a6;
  objc_msgSendSuper2(&v47, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v49, &v48, v8, v9);
  id v10 = v49;
  id v11 = v48;
  if ([v8 conformsToAKTextAnnotationProtocol])
  {
    int v12 = [v8 textIsClipped];
    if (v12) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }
  }
  else
  {
    int v12 = 0;
    uint64_t v13 = 2;
  }
  v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count", a3) + v13);
  v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count") + v13);
  if (v12)
  {
    v16 = (void *)MEMORY[0x263F08D40];
    v17 = [v10 objectAtIndex:0];
    [v17 akPointValue];
    v18 = objc_msgSend(v16, "akValueWithPoint:");
    [v14 addObject:v18];

    v19 = [NSNumber numberWithInteger:2];
    [v15 addObject:v19];
  }
  [v14 addObjectsFromArray:v10];
  [v15 addObjectsFromArray:v11];
  [a1 _arrowHeadOuterControlPoint:v8];
  double v21 = v20;
  double v23 = v22;
  [a1 _arrowHeadInnerControlPoint:v8];
  double v25 = v24;
  double v27 = v26;
  v28 = [v9 geometryHelper];
  objc_msgSend(v28, "screenPixelAlignedPointForPoint:", v21, v23);
  double v30 = v29;
  double v32 = v31;

  v33 = [v9 geometryHelper];

  objc_msgSend(v33, "screenPixelAlignedPointForPoint:", v25, v27);
  double v35 = v34;
  double v37 = v36;

  v38 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v30, v32);
  [v14 addObject:v38];

  v39 = [NSNumber numberWithUnsignedInteger:1];
  [v15 addObject:v39];

  v40 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v35, v37);
  [v14 addObject:v40];

  v41 = [NSNumber numberWithUnsignedInteger:1];
  [v15 addObject:v41];

  id v42 = v14;
  void *v45 = v42;
  id v43 = v15;
  *a4 = v43;
}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 conformsToAKTextAnnotationProtocol]
    && [v8 textIsClipped])
  {
    if (!a3) {
      goto LABEL_12;
    }
    --a3;
  }
  if (a3 < 2)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___AKArrowShapePointOfInterestHelper;
    a3 = (unint64_t)objc_msgSendSuper2(&v12, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3, v8, v9);
  }
  else
  {
    unint64_t v10 = 12;
    if (a3 != 3) {
      unint64_t v10 = 0;
    }
    if (a3 == 2) {
      a3 = 13;
    }
    else {
      a3 = v10;
    }
  }
LABEL_12:

  return a3;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v10 = a5;
  id v11 = a6;
  id v12 = v10;
  uint64_t v13 = v12;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    [v12 startPoint];
    double v15 = v14;
    double v17 = v16;
    [v13 endPoint];
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", x, y, v15, v17, v18, v19);
    double v21 = v20;
    double v23 = v22;
    double v24 = x - v20;
    double v25 = y - v22;
    double v26 = hypot(x - v20, y - v22);
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v24, v25);
    double v28 = v27;
    double v107 = v29;
    [v13 startPoint];
    double v31 = v30;
    double v33 = v32;
    [v13 endPoint];
    BOOL v36 = +[AKGeometryHelper isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:", x, y, v31, v33, v34, v35);
    int v37 = v36 ^ +[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", [v13 originalExifOrientation]);
    double v108 = v28;
    if (a4 == 13)
    {
      if (!v37 || ([v13 arrowLineWidth], double v38 = v26, v26 + v26 < v59))
      {
        [v13 arrowLineWidth];
        goto LABEL_14;
      }
    }
    else
    {
      if (a4 != 12)
      {
        double v38 = v26;
        goto LABEL_16;
      }
      double v38 = 0.0;
      if (v37)
      {
        [v13 arrowHeadWidth];
        double v38 = v26;
        if (v26 + v26 > v39)
        {
          [v13 arrowHeadWidth];
LABEL_14:
          double v38 = v40 * 0.5;
        }
      }
    }
LABEL_16:
    [v13 endPoint];
    double v106 = v60;
    [v13 startPoint];
    double v105 = v61;
    [v13 endPoint];
    double v104 = v62;
    [v13 startPoint];
    double v103 = v63;
    [v13 startPoint];
    double v102 = v64;
    [v13 startPoint];
    double v66 = v65;
    [v13 startPoint];
    double v68 = v21 - v67;
    [v13 startPoint];
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v68, v23 - v69);
    [v13 endPoint];
    double v71 = v70;
    [v13 startPoint];
    double v73 = v71 - v72;
    [v13 endPoint];
    double v75 = v74;
    [v13 startPoint];
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v73, v75 - v76);
    +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:");
    if (v78 < 0.0 || v77 < 0.0)
    {
      [v13 startPoint];
    }
    else
    {
      double v79 = hypot(v21 - v102, v23 - v66);
      if (v79 <= hypot(v106 - v105, v104 - v103))
      {
LABEL_22:
        double x = v21 + v38 * v108;
        double y = v23 + v38 * v107;
        goto LABEL_23;
      }
      [v13 endPoint];
    }
    double v21 = v80;
    double v23 = v81;
    goto LABEL_22;
  }
  if (a4 == 10)
  {
    [v12 startPoint];
    long double v85 = x - v84;
    [v13 startPoint];
    double v87 = hypot(v85, y - v86);
    [v13 startPoint];
    double v89 = x - v88;
    [v13 startPoint];
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v89, y - v90);
    double v92 = v91;
    double v94 = v93;
    [v13 arrowHeadLength];
    if (v87 < v95)
    {
      [v13 startPoint];
      double v97 = v96;
      [v13 arrowHeadLength];
      double x = v97 + v98 * v92;
      [v13 startPoint];
      double v100 = v99;
      [v13 arrowHeadLength];
      double y = v100 + v101 * v94;
    }
  }
  else if (a4 == 9)
  {
    [v12 endPoint];
    long double v42 = v41 - x;
    [v13 endPoint];
    double v44 = hypot(v42, v43 - y);
    [v13 endPoint];
    double v46 = v45 - x;
    [v13 endPoint];
    +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v46, v47 - y);
    double v49 = v48;
    double v51 = v50;
    [v13 arrowHeadLength];
    if (v44 < v52)
    {
      [v13 endPoint];
      double v54 = v53;
      [v13 arrowHeadLength];
      double x = v54 - v55 * v49;
      [v13 endPoint];
      double v57 = v56;
      [v13 arrowHeadLength];
      double y = v57 - v58 * v51;
    }
  }
LABEL_23:

  double v82 = x;
  double v83 = y;
  result.double y = v83;
  result.double x = v82;
  return result;
}

+ (CGPoint)_normalizedDirectionVector:(id)a3
{
  id v3 = a3;
  [v3 endPoint];
  double v5 = v4;
  [v3 startPoint];
  double v7 = v5 - v6;
  [v3 endPoint];
  double v9 = v8;
  [v3 startPoint];
  double v11 = v10;

  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v7, v9 - v11);
  result.double y = v13;
  result.double x = v12;
  return result;
}

+ (CGPoint)_centeredBaseControlPoint:(id)a3
{
  id v3 = a3;
  [v3 arrowHeadLength];
  double v5 = v4;
  [v3 endPoint];
  double v7 = v6;
  double v9 = v8;
  [v3 startPoint];
  double v11 = v10 - v7;
  [v3 startPoint];
  double v13 = v12;

  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v11, v13 - v9);
  double v15 = v7 + v5 * v14;
  double v17 = v9 + v5 * v16;
  result.double y = v17;
  result.double x = v15;
  return result;
}

+ (CGPoint)_arrowHeadInnerControlPoint:(id)a3
{
  id v4 = a3;
  [a1 _centeredBaseControlPoint:v4];
  double v6 = v5;
  double v8 = v7;
  [a1 _normalizedDirectionVector:v4];
  double v10 = v9;
  double v12 = v11;
  if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", [v4 originalExifOrientation]))
  {
    double v13 = 1.0;
  }
  else
  {
    double v13 = -1.0;
  }
  [v4 arrowLineWidth];
  double v15 = v6 + v12 * v13 * (v14 * 0.5);
  [v4 arrowLineWidth];
  double v17 = v16;

  double v18 = v8 + -(v13 * v10) * (v17 * 0.5);
  double v19 = v15;
  result.double y = v18;
  result.double x = v19;
  return result;
}

+ (CGPoint)_arrowHeadOuterControlPoint:(id)a3
{
  id v4 = a3;
  [a1 _centeredBaseControlPoint:v4];
  double v6 = v5;
  double v8 = v7;
  [a1 _normalizedDirectionVector:v4];
  double v10 = v9;
  double v12 = v11;
  if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", [v4 originalExifOrientation]))
  {
    double v13 = 1.0;
  }
  else
  {
    double v13 = -1.0;
  }
  [v4 arrowHeadWidth];
  double v15 = v6 + v12 * v13 * (v14 * 0.5);
  [v4 arrowHeadWidth];
  double v17 = v16;

  double v18 = v8 + -(v13 * v10) * (v17 * 0.5);
  double v19 = v15;
  result.double y = v18;
  result.double x = v19;
  return result;
}

@end