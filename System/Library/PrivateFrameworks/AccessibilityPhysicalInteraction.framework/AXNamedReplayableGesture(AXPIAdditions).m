@interface AXNamedReplayableGesture(AXPIAdditions)
+ (id)_pinchGestureWithCenter:()AXPIAdditions bounds:radiusDelta:angleDelta:startingWidth:;
+ (id)_tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:force:;
+ (id)flickGestureStartingAtPoint:()AXPIAdditions endingAtPoint:numberOfFingers:;
+ (id)forceTouchGestureAtPoint:()AXPIAdditions;
+ (id)holdGestureAtPoint:()AXPIAdditions withDuration:numberOfFingers:;
+ (id)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:initialHoldDuration:;
+ (id)scrollGestureFromPoint:()AXPIAdditions toPoint:duration:;
+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:;
+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:numberOfFingers:;
+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:;
+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:;
+ (uint64_t)longPressGestureAtPoint:()AXPIAdditions;
+ (uint64_t)pinchInGestureWithPoint:()AXPIAdditions bounds:;
+ (uint64_t)pinchOutGestureWithPoint:()AXPIAdditions bounds:;
+ (uint64_t)rotateLeftGestureWithPoint:()AXPIAdditions bounds:;
+ (uint64_t)rotateRightGestureWithPoint:()AXPIAdditions bounds:;
+ (uint64_t)tapGestureAtPoint:()AXPIAdditions;
+ (uint64_t)tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:;
+ (void)_addAllFingerPointsForPoint:()AXPIAdditions numberOfFingers:toReplayableGesture:atTime:;
+ (void)_addFingerPoints:()AXPIAdditions toReplayableGesture:atTime:;
@end

@implementation AXNamedReplayableGesture(AXPIAdditions)

+ (uint64_t)tapGestureAtPoint:()AXPIAdditions
{
  return objc_msgSend(a1, "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 0, 1);
}

+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:
{
  return objc_msgSend(a1, "flickGestureAtPoint:angle:numberOfFingers:", 1);
}

+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:
{
  return objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:", a3, 1);
}

+ (uint64_t)tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:
{
  return objc_msgSend(a1, "_tapGestureAtPoint:isDoubleTap:numberOfFingers:force:", a3, a4, 0.0);
}

+ (id)_tapGestureAtPoint:()AXPIAdditions isDoubleTap:numberOfFingers:force:
{
  v9 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:", a7);
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__AXNamedReplayableGesture_AXPIAdditions___tapGestureAtPoint_isDoubleTap_numberOfFingers_force___block_invoke;
  v16[3] = &unk_264D86750;
  id v12 = v10;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  double v19 = a3;
  [v9 enumerateObjectsUsingBlock:v16];
  id v14 = objc_alloc_init((Class)objc_opt_class());
  [v14 addPointsByFingerIdentifier:v12 forces:v13 atTime:0.0];
  [v14 addPointsByFingerIdentifier:MEMORY[0x263EFFA78] forces:MEMORY[0x263EFFA78] atTime:0.1];
  if (a6)
  {
    [v14 addPointsByFingerIdentifier:v12 forces:v13 atTime:0.15];
    [v14 addPointsByFingerIdentifier:MEMORY[0x263EFFA78] forces:MEMORY[0x263EFFA78] atTime:0.25];
  }

  return v14;
}

+ (uint64_t)longPressGestureAtPoint:()AXPIAdditions
{
  return objc_msgSend(a1, "holdGestureAtPoint:withDuration:numberOfFingers:", 1, a3, a4, 1.0);
}

+ (id)holdGestureAtPoint:()AXPIAdditions withDuration:numberOfFingers:
{
  v4 = +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:");
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __91__AXNamedReplayableGesture_AXPIAdditions__holdGestureAtPoint_withDuration_numberOfFingers___block_invoke;
  id v14 = &unk_264D86778;
  id v15 = v5;
  id v16 = v6;
  id v7 = v6;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:&v11];
  id v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "addPointsByFingerIdentifier:forces:atTime:", v8, v7, 0.0, v11, v12, v13, v14);
  [v9 addPointsByFingerIdentifier:MEMORY[0x263EFFA78] forces:MEMORY[0x263EFFA78] atTime:a3];

  return v9;
}

+ (uint64_t)flickGestureAtPoint:()AXPIAdditions angle:numberOfFingers:
{
  __double2 v10 = __sincos_stret(a4);
  return objc_msgSend(a1, "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:", a6, a2, a3, a2 + v10.__cosval * 100.0, a3 + v10.__sinval * 100.0);
}

+ (id)flickGestureStartingAtPoint:()AXPIAdditions endingAtPoint:numberOfFingers:
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v11 = NSStringFromCGPoint(*(CGPoint *)&a2);
  v16[0] = v11;
  v18.x = a4;
  v18.y = a5;
  uint64_t v12 = NSStringFromCGPoint(v18);
  v16[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v14 = [a1 lineGestureBetweenPoints:v13 duration:a7 numberOfFingers:0.1];

  return v14;
}

+ (uint64_t)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:
{
  return objc_msgSend(a1, "lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:", a3, 0.0);
}

+ (id)lineGestureBetweenPoints:()AXPIAdditions duration:numberOfFingers:initialHoldDuration:
{
  id v8 = a5;
  unint64_t v9 = [v8 count];
  double v10 = 0.0;
  if (v9 >= 2)
  {
    for (uint64_t i = 1; i != v9; ++i)
    {
      uint64_t v12 = [v8 objectAtIndex:i - 1];
      CGPointFromString(v12);

      id v13 = [v8 objectAtIndex:i];
      CGPointFromString(v13);

      AX_CGPointGetDistanceToPoint();
      double v10 = v10 + v14;
    }
  }
  double v15 = (double)(unint64_t)ceil(v10 / 20.0);
  if (vcvtpd_u64_f64(v10 / 20.0) && a2 / v15 > 0.05) {
    double v15 = (double)(unint64_t)ceil(a2 / 0.05);
  }
  id v16 = objc_alloc_init((Class)objc_opt_class());
  if (v9 >= 2)
  {
    uint64_t v17 = 1;
    double v18 = 0.0;
    double v35 = v10 / v15;
    double v36 = v10;
    do
    {
      double v40 = v18;
      double v19 = a3;
      if (v17 != 1) {
        double v19 = 0.0;
      }
      double v39 = v19;
      objc_msgSend(v8, "objectAtIndex:", v17 - 1, *(void *)&v35);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      CGPoint v21 = CGPointFromString(v20);

      v22 = [v8 objectAtIndex:v17];
      CGPointFromString(v22);

      AX_CGPointGetDistanceToPoint();
      unint64_t v24 = vcvtpd_u64_f64(v23 / v35);
      double v25 = v23 / v10 * a2;
      if (v24)
      {
        for (unint64_t j = 0; j != v24; ++j)
        {
          AX_CGPointGetOffsetAlongVectorWithDistance();
          double v28 = v21.x + v27;
          double v30 = v21.y + v29;
          double v31 = -0.0;
          if (j) {
            double v31 = v39;
          }
          objc_msgSend(a1, "_addAllFingerPointsForPoint:numberOfFingers:toReplayableGesture:atTime:", a6, v16, v28, v30, v31 + v40 + (double)j / (double)v24 * v25);
        }
      }
      double v18 = v40 + v39 + v25;
      ++v17;
      double v10 = v36;
    }
    while (v17 != v9);
  }
  v32 = [v8 lastObject];
  CGPoint v33 = CGPointFromString(v32);

  objc_msgSend(a1, "_addAllFingerPointsForPoint:numberOfFingers:toReplayableGesture:atTime:", a6, v16, v33.x, v33.y, a2 + a3);
  return v16;
}

+ (id)scrollGestureFromPoint:()AXPIAdditions toPoint:duration:
{
  BOOL v11 = a2 < a4;
  if (a3 != a5) {
    BOOL v11 = a3 < a5;
  }
  double v12 = -0.5;
  if (v11) {
    double v13 = 0.5;
  }
  else {
    double v13 = -0.5;
  }
  if (!v11) {
    double v12 = 0.5;
  }
  BOOL v14 = a3 == a5;
  if (a3 == a5) {
    double v15 = a4;
  }
  else {
    double v15 = a5;
  }
  double v16 = v15 + v13;
  if (v14) {
    double v17 = v16;
  }
  else {
    double v17 = a4 + 1.0;
  }
  if (v14) {
    double v18 = a5 + 1.0;
  }
  else {
    double v18 = v16;
  }
  double v19 = v15 + v12;
  if (v14) {
    double v20 = v19;
  }
  else {
    double v20 = a4 + -1.0;
  }
  if (v14) {
    double v21 = a5 + -1.0;
  }
  else {
    double v21 = v19;
  }
  v22 = [MEMORY[0x263EFF980] array];
  v32.x = a2;
  v32.y = a3;
  double v23 = NSStringFromPoint(v32);
  [v22 addObject:v23];

  v33.x = v17;
  v33.y = v18;
  unint64_t v24 = NSStringFromPoint(v33);
  [v22 addObject:v24];

  v34.x = v20;
  v34.y = v21;
  double v25 = NSStringFromPoint(v34);
  [v22 addObject:v25];

  v35.x = a4;
  v35.y = a5;
  v26 = NSStringFromPoint(v35);
  [v22 addObject:v26];

  v36.x = a4;
  v36.y = a5;
  double v27 = NSStringFromPoint(v36);
  [v22 addObject:v27];

  double v28 = [a1 lineGestureBetweenPoints:v22 duration:a6];

  return v28;
}

+ (id)forceTouchGestureAtPoint:()AXPIAdditions
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  AXForceTouchThreshold();
  double v6 = v5;
  double v18 = &unk_26EC8F100;
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a1, a2);
  v19[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  unint64_t v9 = (double *)MEMORY[0x263F225F8];
  double v10 = *MEMORY[0x263F225F8];
  if (*MEMORY[0x263F225F8] > 0.0)
  {
    double v11 = 0.0;
    double v12 = (double *)MEMORY[0x263F22600];
    do
    {
      double v16 = &unk_26EC8F100;
      double v13 = [NSNumber numberWithDouble:v6 * v11 / v10];
      double v17 = v13;
      BOOL v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

      [v4 addPointsByFingerIdentifier:v8 forces:v14 atTime:v11];
      double v11 = v11 + *v12;
      double v10 = *v9;
    }
    while (v11 < *v9);
  }
  [v4 addPointsByFingerIdentifier:MEMORY[0x263EFFA78] forces:MEMORY[0x263EFFA78] atTime:v10];

  return v4;
}

+ (uint64_t)pinchInGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, -25.0, 0.0, 0x4059000000000000);
}

+ (uint64_t)pinchOutGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 25.0, 0.0, 0x4049000000000000);
}

+ (uint64_t)rotateRightGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 0.0, 1.04719755, 0);
}

+ (uint64_t)rotateLeftGestureWithPoint:()AXPIAdditions bounds:
{
  return objc_msgSend(a1, "_pinchGestureWithCenter:bounds:radiusDelta:angleDelta:startingWidth:", a2, a3, a4, a5, a6, a7, 0.0, -1.04719755, 0);
}

+ (id)_pinchGestureWithCenter:()AXPIAdditions bounds:radiusDelta:angleDelta:startingWidth:
{
  v72[2] = *MEMORY[0x263EF8340];
  CGFloat rect = a4;
  double v21 = +[AXPIFingerUtilities defaultPinchLocationsAroundPoint:withinBounds:](AXPIFingerUtilities, "defaultPinchLocationsAroundPoint:withinBounds:");
  v22 = [v21 firstObject];
  CGPoint v23 = CGPointFromString(v22);

  memset(&rect_8, 0, sizeof(rect_8));
  unint64_t v24 = [v21 lastObject];
  CGPoint v25 = CGPointFromString(v24);

  if (a10 == 0.0)
  {
    AX_CGPointGetMidpointToPoint();
    double v27 = v26;
    double v29 = v28;
    AX_CGPointGetDistanceToPoint();
    double v31 = v30;
    v76.origin.x = rect;
    v76.origin.y = a5;
    v76.size.width = a6;
    v76.size.height = a7;
    double v32 = fmax(v27, v31 + CGRectGetMinX(v76));
    v77.origin.x = rect;
    v77.origin.y = a5;
    v77.size.width = a6;
    v77.size.height = a7;
    double v62 = fmin(v32, CGRectGetMaxX(v77) - v31);
    v78.origin.x = rect;
    v78.origin.y = a5;
    v78.size.width = a6;
    v78.size.height = a7;
    double v33 = fmax(v29, v31 + CGRectGetMinY(v78));
    v79.origin.x = rect;
    v79.origin.y = a5;
    v79.size.width = a6;
    v79.size.height = a7;
    double v34 = fmin(v33, CGRectGetMaxY(v79) - v31);
    double v35 = v23.x + v62 - v27;
    double v36 = v34 - v29;
    double v37 = v23.y + v36;
    rect_8.size.width = v35;
    rect_8.size.height = v23.y + v36;
    double v38 = v62 - v27 + v25.x;
    double v39 = v36 + v25.y;
    rect_8.origin.x = v38;
    rect_8.origin.y = v36 + v25.y;
    double v40 = a8;
  }
  else
  {
    double v35 = a2 - a10 * 0.5;
    rect_8.size.width = v35;
    rect_8.size.height = a3;
    double v38 = a2 + a10 * 0.5;
    rect_8.origin.x = v38;
    rect_8.origin.y = a3;
    double v40 = a8;
    double v63 = fmax(a8, 0.0);
    v80.size.height = a7;
    v80.origin.x = rect;
    v80.origin.y = a5;
    v80.size.width = a6;
    double v39 = a3;
    if (v35 - v63 < CGRectGetMinX(v80))
    {
      v81.size.height = a7;
      v81.origin.x = rect;
      v81.origin.y = a5;
      v81.size.width = a6;
      CGFloat v41 = CGRectGetMinX(v81) - (v35 - v63);
      double v35 = v35 + v41;
      rect_8.size.width = v35;
      double v38 = v41 + v38;
      rect_8.origin.x = v38;
    }
    v82.origin.x = rect;
    v82.origin.y = a5;
    v82.size.width = a6;
    v82.size.height = a7;
    if (v63 + v38 > CGRectGetMaxX(v82))
    {
      v83.origin.x = rect;
      v83.origin.y = a5;
      v83.size.width = a6;
      v83.size.height = a7;
      CGFloat v42 = CGRectGetMaxX(v83) - (v63 + v38);
      double v35 = v35 + v42;
      rect_8.size.width = v35;
      double v38 = v42 + v38;
      rect_8.origin.x = v38;
    }
    double v37 = a3;
  }
  objc_opt_class();
  v43 = objc_opt_new();
  v74.x = v35;
  v74.y = v37;
  v44 = NSStringFromCGPoint(v74);
  v72[0] = v44;
  v75.x = v38;
  v75.y = v39;
  v45 = NSStringFromCGPoint(v75);
  v72[1] = v45;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
  [a1 _addFingerPoints:v46 toReplayableGesture:v43 atTime:0.0];

  double v47 = -5.0;
  if (v40 >= 0.0) {
    double v47 = 0.0;
  }
  if (v40 > 0.0) {
    double v47 = 5.0;
  }
  double v48 = -0.0872664626;
  if (a9 >= 0.0) {
    double v48 = 0.0;
  }
  if (a9 > 0.0) {
    double v48 = 0.0872664626;
  }
  double v49 = (v40 - v47) / 18.0;
  double v50 = v47 / 6.0;
  double v51 = (a9 - v48) / 18.0;
  unint64_t v52 = 1;
  double v53 = v48 / 6.0;
  do
  {
    +[AXPIFingerUtilities updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:](AXPIFingerUtilities, "updateFirstLocation:secondLocation:forPinchWithRadiusDelta:angleDelta:", &rect_8.size, &rect_8, v49, v51, *(void *)&v62);
    v54 = NSStringFromCGPoint((CGPoint)rect_8.size);
    v71[0] = v54;
    v55 = NSStringFromCGPoint(rect_8.origin);
    v71[1] = v55;
    v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    [a1 _addFingerPoints:v56 toReplayableGesture:v43 atTime:(double)v52 * 0.0166666667];

    if (v52 == 18)
    {
      for (unint64_t i = 19; i != 25; ++i)
      {
        +[AXPIFingerUtilities updateFirstLocation:&rect_8.size secondLocation:&rect_8 forPinchWithRadiusDelta:v50 angleDelta:v53];
        v58 = NSStringFromCGPoint((CGPoint)rect_8.size);
        v70[0] = v58;
        v59 = NSStringFromCGPoint(rect_8.origin);
        v70[1] = v59;
        v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
        [a1 _addFingerPoints:v60 toReplayableGesture:v43 atTime:(double)i * 0.0166666667];
      }
    }
    ++v52;
  }
  while (v52 != 19);

  return v43;
}

+ (void)_addAllFingerPointsForPoint:()AXPIAdditions numberOfFingers:toReplayableGesture:atTime:
{
  id v12 = a7;
  +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:](AXPIFingerUtilities, "defaultLocationsForNumberOfFingers:aroundPoint:", a6, a2, a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _addFingerPoints:v13 toReplayableGesture:v12 atTime:a4];
}

+ (void)_addFingerPoints:()AXPIAdditions toReplayableGesture:atTime:
{
  id v17 = a4;
  id v7 = a5;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [v17 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      id v12 = [v17 objectAtIndex:i];
      id v13 = (void *)MEMORY[0x263F08D40];
      CGPoint v14 = CGPointFromString(v12);
      double v15 = objc_msgSend(v13, "valueWithCGPoint:", v14.x, v14.y);
      double v16 = [NSNumber numberWithUnsignedInteger:i];
      [v8 setObject:v15 forKeyedSubscript:v16];
    }
  }
  [v7 addPointsByFingerIdentifier:v8 forces:MEMORY[0x263EFFA78] atTime:a1];
}

@end