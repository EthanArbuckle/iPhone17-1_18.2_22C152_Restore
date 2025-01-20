@interface AXPIFingerUtilities
+ (BOOL)laserEnabled;
+ (id)_points:(id)a3 adjustedForBounds:(CGRect)a4;
+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4;
+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4 withinBounds:(CGRect)a5;
+ (id)defaultPinchLocationsAroundPoint:(CGPoint)a3 withinBounds:(CGRect)a4;
+ (id)fingerModelsForPointStrings:(id)a3;
+ (id)pointStringsForFingerModels:(id)a3;
+ (id)pointerAnimationSettings;
+ (id)pointerFiltersForLuminanceLevel:(unint64_t)a3;
+ (unint64_t)fingerShapeForCorner:(unint64_t)a3;
+ (void)updateFirstLocation:(CGPoint *)a3 secondLocation:(CGPoint *)a4 forPinchWithRadiusDelta:(double)a5 angleDelta:(double)a6;
@end

@implementation AXPIFingerUtilities

+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4
{
  return (id)objc_msgSend(a1, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a3, a4.x, a4.y, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

+ (id)defaultLocationsForNumberOfFingers:(unint64_t)a3 aroundPoint:(CGPoint)a4 withinBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v13 = a4.y;
  double v14 = a4.x;
  v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  CGFloat v34 = width;
  CGFloat v35 = height;
  double v16 = 20.0;
  double v17 = 100.0;
  switch(a3)
  {
    case 2uLL:
      goto LABEL_12;
    case 3uLL:
      v37.double x = v10 + -100.0;
      v37.double y = v9 + 20.0;
      v18 = NSStringFromCGPoint(v37);
      [v15 addObject:v18];

      double v13 = v9 + -20.0;
      double v16 = 40.0;
      *(double *)&uint64_t v19 = 100.0;
      goto LABEL_11;
    case 4uLL:
      if (AXDeviceIsPad())
      {
        v38.double x = v10 + -100.0;
        v38.double y = v9 + 20.0;
        v20 = NSStringFromCGPoint(v38);
        [v15 addObject:v20];

        v39.double y = v9 + -40.0;
        v39.double x = v14;
        v21 = NSStringFromCGPoint(v39);
        [v15 addObject:v21];

        double v14 = v10 + 100.0;
        double v13 = v9 + -30.0;
        double v16 = 30.0;
        goto LABEL_7;
      }
      double v25 = v10 + -80.0;
      double v13 = v9 + 10.0;
      goto LABEL_10;
    case 5uLL:
      if (AXDeviceIsPad())
      {
        v40.double x = v10 + -120.0;
        v40.double y = v9 + 300.0;
        v22 = NSStringFromCGPoint(v40);
        [v15 addObject:v22];

        v41.double x = v10 + -100.0;
        v41.double y = v9 + 20.0;
        v23 = NSStringFromCGPoint(v41);
        [v15 addObject:v23];

        v42.double y = v9 + -20.0;
        v42.double x = v14;
        v24 = NSStringFromCGPoint(v42);
        [v15 addObject:v24];

        double v14 = v10 + 100.0;
        double v13 = v9 + 40.0;
        double v16 = 120.0;
LABEL_7:
        double v17 = 220.0;
      }
      else
      {
        v43.double y = v9 + 200.0;
        v43.double x = v10 + -80.0;
        v26 = NSStringFromCGPoint(v43);
        [v15 addObject:v26];

        double v13 = v9 + 10.0;
        double v25 = v10 + -80.0;
LABEL_10:
        double v27 = v13;
        v28 = NSStringFromCGPoint(*(CGPoint *)&v25);
        [v15 addObject:v28];

        v44.double y = v9 + -10.0;
        v44.double x = v14;
        v29 = NSStringFromCGPoint(v44);
        [v15 addObject:v29];

        double v14 = v10 + 80.0;
        double v16 = 50.0;
        *(double *)&uint64_t v19 = 160.0;
LABEL_11:
        double v17 = *(double *)&v19;
      }
LABEL_12:
      v45.double x = v14;
      v45.double y = v13;
      v30 = NSStringFromCGPoint(v45);
      [v15 addObject:v30];

      double v14 = v10 + v17;
      double v13 = v9 + v16;
      double v17 = v34;
      double v16 = v35;
LABEL_13:
      v46.double x = v14;
      v46.double y = v13;
      v31 = NSStringFromCGPoint(v46);
      [v15 addObject:v31];

      v32 = objc_msgSend(a1, "_points:adjustedForBounds:", v15, x, y, v17, v16);

      return v32;
    default:
      goto LABEL_13;
  }
}

+ (id)defaultPinchLocationsAroundPoint:(CGPoint)a3 withinBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v11 = [MEMORY[0x263EFF980] array];
  if (AXDeviceIsPad()) {
    double v12 = 75.0;
  }
  else {
    double v12 = 45.0;
  }
  double v13 = v9 - v12;
  if (AXDeviceIsPad()) {
    double v14 = 75.0;
  }
  else {
    double v14 = 45.0;
  }
  double v15 = v8 + v14;
  v24.double x = v13;
  v24.double y = v15;
  double v16 = NSStringFromCGPoint(v24);
  [v11 addObject:v16];

  if (AXDeviceIsPad()) {
    double v17 = 150.0;
  }
  else {
    double v17 = 90.0;
  }
  double v18 = v13 + v17;
  if (AXDeviceIsPad()) {
    double v19 = 150.0;
  }
  else {
    double v19 = 90.0;
  }
  v25.double y = v15 - v19;
  v25.double x = v18;
  v20 = NSStringFromCGPoint(v25);
  [v11 addObject:v20];

  v21 = objc_msgSend(a1, "_points:adjustedForBounds:", v11, x, y, width, height);

  return v21;
}

+ (void)updateFirstLocation:(CGPoint *)a3 secondLocation:(CGPoint *)a4 forPinchWithRadiusDelta:(double)a5 angleDelta:(double)a6
{
  double x = a3->x;
  double y = a3->y;
  AX_CGPointGetMidpointToPoint();
  double v13 = v12;
  double v15 = v14;
  AX_CGPointGetDistanceToPoint();
  double v17 = v16 + a5;
  double v18 = atan2(y - v15, x - v13) + a6;
  __double2 v19 = __sincos_stret(v18);
  __double2 v20 = __sincos_stret(v18 + 3.14159265);
  a3->double x = v13 + v17 * v19.__cosval;
  a3->double y = v15 + v17 * v19.__sinval;
  a4->double x = v13 + v17 * v20.__cosval;
  a4->double y = v15 + v17 * v20.__sinval;
}

+ (id)fingerModelsForPointStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        CGPoint v10 = CGPointFromString((NSString *)*(void *)(*((void *)&v13 + 1) + 8 * i));
        v11 = +[AXPIFingerModel fingerModelForLocation:](AXPIFingerModel, "fingerModelForLocation:", v10.x, v10.y, (void)v13);
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)pointStringsForFingerModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "location", (void)v12);
        CGPoint v10 = NSStringFromCGPoint(v19);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_points:(id)a3 adjustedForBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  CGFloat v35 = width;
  CGFloat v36 = height;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  if (!CGRectEqualToRect(v50, *MEMORY[0x263F001A8]))
  {
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    double v33 = v10;
    double v34 = v9;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          double v37 = v9;
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v11);
          }
          CGPoint v16 = CGPointFromString((NSString *)*(void *)(*((void *)&v42 + 1) + 8 * i));
          v51.origin.CGFloat x = x;
          v51.origin.CGFloat y = y;
          v51.size.CGFloat width = v35;
          v51.size.CGFloat height = v36;
          double MinX = CGRectGetMinX(v51);
          v52.origin.CGFloat x = x;
          v52.origin.CGFloat y = y;
          v52.size.CGFloat width = v35;
          v52.size.CGFloat height = v36;
          double MaxX = CGRectGetMaxX(v52);
          v53.origin.CGFloat x = x;
          v53.origin.CGFloat y = y;
          v53.size.CGFloat width = v35;
          v53.size.CGFloat height = v36;
          double MinY = CGRectGetMinY(v53);
          v54.origin.CGFloat x = x;
          v54.origin.CGFloat y = y;
          v54.size.CGFloat width = v35;
          v54.size.CGFloat height = v36;
          double MaxY = CGRectGetMaxY(v54);
          double v21 = MaxX - v16.x;
          if (v37 + v16.x <= MaxX) {
            double v21 = v37;
          }
          if (v37 + v16.x < MinX) {
            double v9 = MinX - v16.x;
          }
          else {
            double v9 = v21;
          }
          double v22 = v10 + v16.y;
          if (v10 + v16.y >= MinY)
          {
            if (v22 > MaxY) {
              double v10 = MaxY - v16.y;
            }
          }
          else
          {
            double v10 = MinY - v16.y;
          }
        }
        uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16, MaxY, v22);
      }
      while (v13);
    }

    if (v9 == v34 && v10 == v33)
    {
      id v8 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v24 = v11;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            CGPoint v29 = CGPointFromString((NSString *)*(void *)(*((void *)&v38 + 1) + 8 * j));
            v49.CGFloat x = v9 + v29.x;
            v49.CGFloat y = v10 + v29.y;
            v30 = NSStringFromCGPoint(v49);
            [v8 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v26);
      }
    }
  }
  id v31 = v8;

  return v31;
}

+ (unint64_t)fingerShapeForCorner:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return qword_239110ED0[a3 - 1];
  }
}

+ (BOOL)laserEnabled
{
  if (laserEnabled_onceToken != -1) {
    dispatch_once(&laserEnabled_onceToken, &__block_literal_global_1);
  }
  return laserEnabled__LaserEnabled;
}

void __35__AXPIFingerUtilities_laserEnabled__block_invoke()
{
  id v0 = [MEMORY[0x263F22940] sharedInstance];
  laserEnabled__LaserEnabled = [v0 laserEnabled];
}

+ (id)pointerFiltersForLuminanceLevel:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  v4 = PSPointerVibrantColorMatrixForLuminance();
  [v3 setValue:v4 forKey:*MEMORY[0x263F15C30]];
  v7[0] = v3;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v5;
}

+ (id)pointerAnimationSettings
{
  if (pointerAnimationSettings_onceToken != -1) {
    dispatch_once(&pointerAnimationSettings_onceToken, &__block_literal_global_271);
  }
  v2 = (void *)pointerAnimationSettings__PointerAnimationSettings;
  return v2;
}

uint64_t __47__AXPIFingerUtilities_pointerAnimationSettings__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F791A0]) initWithDefaultValues];
  v1 = (void *)pointerAnimationSettings__PointerAnimationSettings;
  pointerAnimationSettings__PointerAnimationSettings = v0;

  [(id)pointerAnimationSettings__PointerAnimationSettings setDampingRatio:1.0];
  v2 = (void *)pointerAnimationSettings__PointerAnimationSettings;
  return [v2 setResponse:0.15];
}

@end