@interface VKMapViewTourGuideManager
+ (BOOL)shouldSuppressLocationUpdates;
+ (id)_descriptionForDetailLevel;
+ (int64_t)detailLevel;
+ (void)decreaseDetailLevel;
+ (void)increaseDetailLevel;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_center;
- (BOOL)_elementIntersectsElement:(id)a3 point:(CGPoint)a4 radius:(double)a5;
- (BOOL)_elementValidForCurrentDetailLevel:(id)a3;
- (BOOL)_elementsInvalidForCenter:(id)a3;
- (BOOL)_elementsInvalidForOrientation:(int64_t)a3;
- (BOOL)_setZoomLevelForUserSpeed:(double)a3;
- (BOOL)isRunning;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (NSString)lastTourStatusAnnouncement;
- (VKFeatureAccessibilityElement)lastCurrentTourLocation;
- (VKMapView)mapView;
- (VKMapViewAccessibilityElementManager)elementManager;
- (VKMapViewTourGuideManager)initWithMapView:(id)a3 elementManager:(id)a4;
- (VKMapViewTourStatus)tourStatus;
- (double)_normalizedThetaFromTheta:(double)result;
- (double)_yaw;
- (id)_descriptionForOrientation:(int64_t)a3;
- (id)_elements;
- (id)_tourLocationForUserPoint:(CGPoint)a3 radius:(double)a4 ignoreLocation:(id)a5;
- (id)_tourPOIForUserPoint:(CGPoint)a3 radius:(double)a4 futureUserTheta:(double)a5 thetaFromCourse:(double *)a6 shouldFilterIfBehind:(BOOL)a7;
- (id)tourStatusForMapView:(id)a3;
- (int64_t)_orientation;
- (int64_t)detailLevel;
- (int64_t)secondsSinceZoomRequest;
- (unint64_t)_tourPOISideFromTheta:(double)a3;
- (void)_queueTourStatusAnnouncement:(id)a3;
- (void)_startObservingUpdates;
- (void)_stopObservingUpdates;
- (void)_updateElements;
- (void)_updateElementsComplete:(id)a3;
- (void)_updateTourStatusWithCenter:(id)a3 location:(id)a4 orientation:(int64_t)a5;
- (void)dealloc;
- (void)locationManagerUpdatedHeading:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setElementManager:(id)a3;
- (void)setLastCurrentTourLocation:(id)a3;
- (void)setLastTourStatusAnnouncement:(id)a3;
- (void)setMapView:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSecondsSinceZoomRequest:(int64_t)a3;
- (void)setTourStatus:(id)a3;
- (void)startTour;
- (void)stopTour;
@end

@implementation VKMapViewTourGuideManager

- (BOOL)_elementsInvalidForCenter:(id)a3
{
  v3 = [(VKMapViewTourGuideManager *)self mapView];
  [v3 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double v8 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  if (v8 >= CGRectGetHeight(v11))
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    CGRectGetHeight(v13);
  }
  else
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGRectGetWidth(v12);
  }

  return 1;
}

- (BOOL)_elementsInvalidForOrientation:(int64_t)a3
{
  return [(VKMapViewTourGuideManager *)self _orientation] != a3;
}

- (BOOL)_elementValidForCurrentDetailLevel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = [(VKMapViewTourGuideManager *)self detailLevel] > 0
    || ([(VKMapViewTourGuideManager *)self detailLevel] & 0x8000000000000000) == 0
    && ([v6 isPOI] & 1) != 0
    || -[VKMapViewTourGuideManager detailLevel](self, "detailLevel") >= -1 && ([v6 isRoad] & 1) != 0;

  return v7;
}

- (BOOL)_elementIntersectsElement:(id)a3 point:(CGPoint)a4 radius:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  CGRect v11 = [v10 hitTestPaths];

  if (!v11)
  {
    CGRect v12 = [MEMORY[0x263EFF980] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    CGRect v13 = [v10 paths];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v13);
          }
          CGPathRef CopyByStrokingPath = CGPathCreateCopyByStrokingPath(*(CGPathRef *)(*((void *)&v27 + 1) + 8 * i), 0, a5, kCGLineCapRound, kCGLineJoinRound, 0.0);
          [v12 addObject:CopyByStrokingPath];
          if (CopyByStrokingPath) {
            CFRelease(CopyByStrokingPath);
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v14);
    }

    [v10 setHitTestPaths:v12];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = objc_msgSend(v10, "hitTestPaths", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        v34.CGFloat x = x;
        v34.CGFloat y = y;
        if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v23 + 1) + 8 * j), 0, v34, 0))
        {
          LOBYTE(v19) = 1;
          goto LABEL_25;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v19;
}

- (id)_tourPOIForUserPoint:(CGPoint)a3 radius:(double)a4 futureUserTheta:(double)a5 thetaFromCourse:(double *)a6 shouldFilterIfBehind:(BOOL)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__2;
  long long v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v14 = [(VKMapViewTourGuideManager *)self _elements];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __110__VKMapViewTourGuideManager__tourPOIForUserPoint_radius_futureUserTheta_thetaFromCourse_shouldFilterIfBehind___block_invoke;
  v17[3] = &unk_265162E08;
  *(CGFloat *)&v17[8] = x;
  *(CGFloat *)&v17[9] = y;
  v17[4] = self;
  v17[5] = v29;
  *(double *)&v17[10] = a4;
  *(double *)&v17[11] = a5;
  BOOL v18 = a7;
  v17[6] = &v23;
  v17[7] = &v19;
  [v14 enumerateObjectsUsingBlock:v17];

  if (a6) {
    *a6 = v20[3];
  }
  id v15 = (id)v24[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v29, 8);

  return v15;
}

void __110__VKMapViewTourGuideManager__tourPOIForUserPoint_radius_futureUserTheta_thetaFromCourse_shouldFilterIfBehind___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [*(id *)(a1 + 32) _elementValidForCurrentDetailLevel:v17])
  {
    id v4 = v17;
    [v4 location];
    VKLocationCoordinate2DForVKPoint();
    double v6 = v5;
    double v8 = v7;
    v9 = [v4 accessibilityContainer];
    objc_msgSend(v9, "accessibilityConvertCoordinateToWindow:", v6, v8);
    double v11 = v10;
    double v13 = v12;

    v19.CGFloat x = v11;
    v19.CGFloat y = v13;
    double DistanceBetweenPoints = AXVKMathGetDistanceBetweenPoints(*(CGPoint *)(a1 + 64), v19);
    if (DistanceBetweenPoints < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
      && DistanceBetweenPoints < *(double *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "_normalizedThetaFromTheta:", (double)(atan2(v13 - *(double *)(a1 + 72), v11 - *(double *)(a1 + 64)) + 1.57079633 - *(double *)(a1 + 88)));
      double v16 = v15;
      if (!*(unsigned char *)(a1 + 96) || v15 <= 1.3962634 && v15 >= -1.3962634)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = DistanceBetweenPoints;
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
      }
    }
  }
}

- (id)_tourLocationForUserPoint:(CGPoint)a3 radius:(double)a4 ignoreLocation:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  double v10 = [(VKMapViewTourGuideManager *)self _elements];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__VKMapViewTourGuideManager__tourLocationForUserPoint_radius_ignoreLocation___block_invoke;
  v14[3] = &unk_265162E30;
  id v11 = v9;
  id v15 = v11;
  double v16 = self;
  CGFloat v18 = x;
  CGFloat v19 = y;
  double v20 = a4;
  id v17 = &v21;
  [v10 enumerateObjectsUsingBlock:v14];

  id v12 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __77__VKMapViewTourGuideManager__tourLocationForUserPoint_radius_ignoreLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = v7;
  id v12 = v7;
  if (!*(void *)(a1 + 32) || (v9 = objc_msgSend(v7, "isEqual:"), double v8 = v12, (v9 & 1) == 0))
  {
    int v10 = objc_msgSend(*(id *)(a1 + 40), "_elementIntersectsElement:point:radius:", v8, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    double v8 = v12;
    if (v10)
    {
      int v11 = [*(id *)(a1 + 40) _elementValidForCurrentDetailLevel:v12];
      double v8 = v12;
      if (v11)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        double v8 = v12;
        *a4 = 1;
      }
    }
  }
}

- (void)_queueTourStatusAnnouncement:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(VKMapViewTourGuideManager *)self lastTourStatusAnnouncement];
    char v5 = [v4 isEqualToString:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = +[VKMapViewOutputManager sharedOutputManager];
      [v6 clearOutputQueue];

      id v7 = +[VKMapViewOutputManager sharedOutputManager];
      [v7 queueOutput:v8];
    }
  }
  [(VKMapViewTourGuideManager *)self setLastTourStatusAnnouncement:v8];
}

- (BOOL)_setZoomLevelForUserSpeed:(double)a3
{
  id v4 = [(VKMapViewTourGuideManager *)self mapView];
  [v4 accessibilityZoomLevel];
  float v6 = v5;

  time_t v7 = time(0);
  if (v7 > [(VKMapViewTourGuideManager *)self secondsSinceZoomRequest])
  {
    float v8 = floorf(v6);
    if (v8 <= 16.0)
    {
      if (v8 >= 16.0)
      {
LABEL_7:
        AXPerformBlockOnMainThreadAfterDelay();
        return fabsf(v6 + -16.0) < 0.1;
      }
      char v9 = [(VKMapViewTourGuideManager *)self mapView];
      int v10 = [(VKMapViewTourGuideManager *)self mapView];
      [v10 bounds];
      double MidX = CGRectGetMidX(v17);
      id v12 = [(VKMapViewTourGuideManager *)self mapView];
      [v12 bounds];
      objc_msgSend(v9, "accessibilityZoomInAtPoint:", MidX, CGRectGetMidY(v18));
    }
    else
    {
      char v9 = [(VKMapViewTourGuideManager *)self mapView];
      int v10 = [(VKMapViewTourGuideManager *)self mapView];
      [v10 bounds];
      double v11 = CGRectGetMidX(v15);
      id v12 = [(VKMapViewTourGuideManager *)self mapView];
      [v12 bounds];
      objc_msgSend(v9, "accessibilityZoomOutAtPoint:", v11, CGRectGetMidY(v16));
    }

    [(VKMapViewTourGuideManager *)self setSecondsSinceZoomRequest:time(0)];
    goto LABEL_7;
  }
  return fabsf(v6 + -16.0) < 0.1;
}

void __55__VKMapViewTourGuideManager__setZoomLevelForUserSpeed___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v2 = *(float *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) mapView];
  [v3 accessibilityZoomLevel];
  float v5 = v4;

  if (v2 != v5)
  {
    float v6 = [MEMORY[0x263F22970] sharedInstance];
    char v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      float v8 = [MEMORY[0x263F22970] identifier];
      char v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        double v11 = AXColorizeFormatLog();
        id v12 = [*(id *)(a1 + 32) mapView];
        [v12 accessibilityZoomLevel];
        double v15 = v13;
        double v16 = *(float *)(a1 + 40);
        uint64_t v14 = _AXStringForArgs();

        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          CGRect v18 = v14;
          _os_log_impl(&dword_2426A3000, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateElements", *(void *)&v15, *(void *)&v16);
  }
}

- (double)_normalizedThetaFromTheta:(double)result
{
  for (; result > 3.14159265; result = result + -6.28318531)
    ;
  for (; result < -3.14159265; result = result + 6.28318531)
    ;
  return result;
}

- (unint64_t)_tourPOISideFromTheta:(double)a3
{
  if (a3 <= 0.523598776) {
    return a3 < -0.523598776;
  }
  else {
    return 2;
  }
}

- (void)_updateTourStatusWithCenter:(id)a3 location:(id)a4 orientation:(int64_t)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v56 = a4;
  v55 = [(VKMapViewTourGuideManager *)self mapView];
  float v8 = [v55 accessibilityContainer];
  objc_msgSend(v55, "convertCoordinate:toPointToLayer:", v55, var0, var1);
  UIAccessibilityPointForPoint();
  double v59 = v10;
  double v60 = v9;

  [(VKMapViewTourGuideManager *)self _yaw];
  double v12 = v11;
  [v56 speed];
  double v58 = v13;
  uint64_t v14 = -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", 0, v60, v59, 15.0);
  if (!v14)
  {
    uint64_t v14 = -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", 0, v60, v59, 30.0);
    if (!v14)
    {
      uint64_t v14 = [(VKMapViewTourGuideManager *)self lastCurrentTourLocation];
    }
  }
  if (v58 > 0.35)
  {
    objc_msgSend(v56, "course", v58);
    double v18 = (v19 - v12) * 3.14159265 / 180.0;
    double v61 = 0.0;
    double v16 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    double v15 = -[VKMapViewTourGuideManager _tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:](self, "_tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:", &v61, 1, v60, v59, 50.0, v18);
  }
  else
  {
    double v15 = 0;
    double v61 = 0.0;
    double v16 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    double v18 = 0.0;
  }
  float v20 = v18;
  __float2 v21 = __sincosf_stret(v20);
  uint64_t v22 = 0;
  double sinval = v21.__sinval;
  for (unsigned int i = 15; i <= 0x41; i += 5)
  {
    if (v22 && v15) {
      break;
    }
    double v25 = (double)(int)(i + 5) * v21.__cosval;
    double v26 = v59 - v25;
    if (!v22)
    {
      -[VKMapViewTourGuideManager _tourLocationForUserPoint:radius:ignoreLocation:](self, "_tourLocationForUserPoint:radius:ignoreLocation:", v14, v60 + (double)(int)(i + 5) * sinval, v59 - v25, (double)(int)(i + 5) / 3.0);
      double v16 = v60 + (double)(int)(i + 5) * sinval;
      uint64_t v22 = v17 = v26;
    }
    if (v58 <= 0.35 && v15 == 0)
    {
      double v15 = -[VKMapViewTourGuideManager _tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:](self, "_tourPOIForUserPoint:radius:futureUserTheta:thetaFromCourse:shouldFilterIfBehind:", &v61, 0, v60 + (double)(int)(i + 5) * sinval, v26, (double)(int)(i + 5) / 3.0, v18);
    }
  }
  double v28 = v58;
  if (v58 > 0.35) {
    unint64_t v29 = [(VKMapViewTourGuideManager *)self _tourPOISideFromTheta:v61];
  }
  else {
    unint64_t v29 = 0;
  }
  long long v30 = +[VKMapDebugView sharedInstance];
  if (v30 || [MEMORY[0x263F22970] willLogDebug])
  {
    v31 = NSString;
    [v56 coordinate];
    uint64_t v33 = v32;
    [v56 coordinate];
    uint64_t v35 = v34;
    [v56 speed];
    uint64_t v37 = v36;
    [v56 course];
    uint64_t v39 = v38;
    v40 = [v14 accessibilityLabel];
    v41 = [v22 accessibilityLabel];
    uint64_t v42 = [v15 accessibilityLabel];
    v43 = (void *)v42;
    v44 = @"Right";
    if (v29 == 1) {
      v44 = @"Left";
    }
    if (!v29) {
      v44 = @"None";
    }
    v45 = [v31 stringWithFormat:@"Location: %f,%f\nSpeed: %f\nCourse: %f\nYaw: %f\nFutureUserTheta: %f\nCurrent: %@\nFuture: %@\nPOI: %@\nPOIFromCourse: %f\nSide: %@", v33, v35, v37, v39, *(void *)&v12, v18 * 180.0 / 3.14159265, v40, v41, v42, v61 * 180.0 / 3.14159265, v44];

    [v30 setDebugMessage:v45];
    v46 = [MEMORY[0x263F22970] sharedInstance];
    char v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v48 = [MEMORY[0x263F22970] identifier];
      v49 = AXLoggerForFacility();

      os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v49, v50))
      {
        AXColorizeFormatLog();
        v57 = v54 = v45;
        v51 = _AXStringForArgs();
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 138543362;
          v63 = v51;
          _os_log_impl(&dword_2426A3000, v49, v50, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  objc_msgSend(v30, "setCurrentPoint:frontierPoint:", v60, v59, v16, v17, v54);
  v52 = [(VKMapViewTourGuideManager *)self tourStatus];
  objc_msgSend(v52, "updateTourStatusWithCurrentLocation:currentPoint:futureLocation:futurePoint:tourPOI:tourPOISide:isStationary:", v14, v22, v15, v29, v58 <= 0.35, v60, v59, v16, v17);
  [v56 speed];
  if (-[VKMapViewTourGuideManager _setZoomLevelForUserSpeed:](self, "_setZoomLevelForUserSpeed:"))
  {
    v53 = [v52 shortTourStatusAnnouncement];
    [(VKMapViewTourGuideManager *)self _queueTourStatusAnnouncement:v53];
  }
  [(VKMapViewTourGuideManager *)self setLastCurrentTourLocation:v14];
}

- (void)_startObservingUpdates
{
  id v5 = [MEMORY[0x263F10930] sharedLocationManager];
  [v5 startHeadingUpdateWithObserver:self];
  [v5 startLocationUpdateWithObserver:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  float v4 = [(VKMapViewTourGuideManager *)self elementManager];
  [v3 addObserver:self selector:sel__updateElementsComplete_ name:@"UpdateAccessibilityElementsComplete" object:v4];
}

- (void)_stopObservingUpdates
{
  id v5 = [MEMORY[0x263F10930] sharedLocationManager];
  [v5 stopHeadingUpdateWithObserver:self];
  [v5 stopLocationUpdateWithObserver:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  float v4 = [(VKMapViewTourGuideManager *)self elementManager];
  [v3 removeObserver:self name:@"UpdateAccessibilityElementsComplete" object:v4];
}

- (id)_elements
{
  v3 = [(VKMapViewTourGuideManager *)self elementManager];
  if (objc_opt_respondsToSelector())
  {
    float v4 = [(VKMapViewTourGuideManager *)self mapView];
    id v5 = [v3 accessibilityElementsForMapView:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_center
{
  v3 = [(VKMapViewTourGuideManager *)self elementManager];
  if (objc_opt_respondsToSelector())
  {
    float v4 = [(VKMapViewTourGuideManager *)self mapView];
    [v3 centerForMapView:v4];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    VKLocationCoordinate2DMake();
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.double var1 = v12;
  result.double var0 = v11;
  return result;
}

- (int64_t)_orientation
{
  v3 = [(VKMapViewTourGuideManager *)self elementManager];
  if (objc_opt_respondsToSelector())
  {
    float v4 = [(VKMapViewTourGuideManager *)self mapView];
    int64_t v5 = [v3 orientationForMapView:v4];
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (double)_yaw
{
  v3 = [(VKMapViewTourGuideManager *)self elementManager];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [(VKMapViewTourGuideManager *)self mapView];
    [v3 yawForMapView:v5];
    double v4 = v6;
  }
  return v4;
}

- (void)_updateElements
{
  id v4 = [(VKMapViewTourGuideManager *)self elementManager];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(VKMapViewTourGuideManager *)self mapView];
    [v4 updateAccessibilityElementsForMapView:v3];
  }
}

- (id)tourStatusForMapView:(id)a3
{
  id v4 = a3;
  id v5 = [(VKMapViewTourGuideManager *)self mapView];

  if (v5 == v4)
  {
    double v7 = [(VKMapViewTourGuideManager *)self tourStatus];
    double v6 = [v7 longTourStatusAnnouncement];
  }
  else
  {
    _AXLogWithFacility();
    double v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(VKMapViewTourGuideManager *)self _stopObservingUpdates];
  objc_storeWeak((id *)&self->_mapView, 0);
  self->_running = 0;
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewTourGuideManager;
  [(VKMapViewTourGuideManager *)&v3 dealloc];
}

- (VKMapViewTourGuideManager)initWithMapView:(id)a3 elementManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!v6 || !v7) {
    _AXAssert();
  }
  v14.receiver = self;
  v14.super_class = (Class)VKMapViewTourGuideManager;
  double v9 = [(VKMapViewTourGuideManager *)&v14 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_elementManager, a4);
    double v11 = objc_alloc_init(VKMapViewTourStatus);
    tourStatus = v10->_tourStatus;
    v10->_tourStatus = v11;

    objc_storeWeak((id *)&v10->_mapView, v6);
  }

  return v10;
}

- (void)_updateElementsComplete:(id)a3
{
  id v11 = +[VKMapDebugView sharedInstance];
  [v11 removePointsAndPaths];
  id v4 = [(VKMapViewTourGuideManager *)self _elements];
  uint64_t v5 = objc_opt_class();
  id v6 = AXVKAccessibilityPaths(v4, v5, 25);
  [v11 addBuildingPaths:v6];

  uint64_t v7 = objc_opt_class();
  double v8 = AXVKAccessibilityPaths(v4, v7, 0);
  [v11 addPOIPaths:v8];

  uint64_t v9 = objc_opt_class();
  double v10 = AXVKAccessibilityPaths(v4, v9, 1);
  [v11 addRoadPaths:v10];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (id)_descriptionForOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_265162E78[a3];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (CFAbsoluteTimeGetCurrent()
       - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::LastProcessTime >= 0.5)
    {
      -[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::LastProcessTime = CFAbsoluteTimeGetCurrent();
      uint64_t v5 = [(VKMapViewTourGuideManager *)self mapView];
      [v5 accessibilityCenter];
      double v7 = v6;
      double v9 = v8;

      if (-[VKMapViewTourGuideManager _elementsInvalidForCenter:](self, "_elementsInvalidForCenter:", v7, v9))
      {
        id v11 = [MEMORY[0x263F08AB0] processInfo];
        [v11 systemUptime];
        double v13 = v12;

        double v10 = v13 - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate;
        if (v13 - *(double *)&-[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate > 2.0)
        {
          -[VKMapViewTourGuideManager locationManagerUpdatedLocation:]::lastUpdate = *(void *)&v13;
          objc_super v14 = objc_msgSend(MEMORY[0x263F22970], "sharedInstance", v10);
          char v15 = [v14 ignoreLogging];

          if ((v15 & 1) == 0)
          {
            double v16 = [MEMORY[0x263F22970] identifier];
            double v17 = AXLoggerForFacility();

            os_log_type_t v18 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v17, v18))
            {
              double v19 = AXColorizeFormatLog();
              float v20 = _AXStringForArgs();
              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)buf = 138543362;
                double v26 = v20;
                _os_log_impl(&dword_2426A3000, v17, v18, "%{public}@", buf, 0xCu);
              }
            }
          }
          [(VKMapViewTourGuideManager *)self _updateElements];
        }
      }
      __float2 v21 = [(VKMapViewTourGuideManager *)self mapView];
      uint64_t v22 = [v21 accessibilityOrientation];

      if ([(VKMapViewTourGuideManager *)self _elementsInvalidForOrientation:v22]) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
      uint64_t v23 = [v4 lastLocation];
      long long v24 = (void *)[v23 copy];

      -[VKMapViewTourGuideManager _updateTourStatusWithCenter:location:orientation:](self, "_updateTourStatusWithCenter:location:orientation:", v24, v22, v7, v9);
    }
  }
  else
  {
    [(VKMapViewTourGuideManager *)self stopTour];
    _AXLogWithFacility();
  }
}

uint64_t __60__VKMapViewTourGuideManager_locationManagerUpdatedLocation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  float v2 = [MEMORY[0x263F22970] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F22970] identifier];
    uint64_t v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = AXColorizeFormatLog();
      double v10 = [*(id *)(a1 + 32) _descriptionForOrientation:*(void *)(a1 + 40)];
      double v8 = _AXStringForArgs();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        double v12 = v8;
        _os_log_impl(&dword_2426A3000, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateElements", v10);
}

- (void)locationManagerUpdatedHeading:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v5 = [(VKMapViewTourGuideManager *)self mapView];
    uint64_t v6 = [v5 accessibilityOrientation];

    if ([(VKMapViewTourGuideManager *)self _elementsInvalidForOrientation:v6]) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
    double v7 = [(VKMapViewTourGuideManager *)self mapView];
    [v7 accessibilityCenter];
    double v9 = v8;
    double v11 = v10;

    double v12 = [v4 lastLocation];
    uint64_t v13 = (void *)[v12 copy];

    -[VKMapViewTourGuideManager _updateTourStatusWithCenter:location:orientation:](self, "_updateTourStatusWithCenter:location:orientation:", v13, v6, v9, v11);
  }
  else
  {
    [(VKMapViewTourGuideManager *)self stopTour];
    _AXLogWithFacility();
  }
}

uint64_t __59__VKMapViewTourGuideManager_locationManagerUpdatedHeading___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  float v2 = [MEMORY[0x263F22970] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F22970] identifier];
    uint64_t v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = AXColorizeFormatLog();
      double v10 = [*(id *)(a1 + 32) _descriptionForOrientation:*(void *)(a1 + 40)];
      double v8 = _AXStringForArgs();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        double v12 = v8;
        _os_log_impl(&dword_2426A3000, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateElements", v10);
}

- (void)startTour
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    char v3 = +[VKMapDebugView sharedInstance];
    [v3 removePointsAndPaths];

    [(VKMapViewTourGuideManager *)self setRunning:1];
    [(VKMapViewTourGuideManager *)self setSecondsSinceZoomRequest:time(0)];
    [(VKMapViewTourGuideManager *)self setLastCurrentTourLocation:0];
    [(VKMapViewTourGuideManager *)self _startObservingUpdates];
    id v4 = [MEMORY[0x263F1C408] sharedApplication];
    [v4 setIdleTimerDisabled:1];
    [v4 _accessibilitySetIsTourGuideRunning:1];
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    _AXLogWithFacility();
  }
}

uint64_t __38__VKMapViewTourGuideManager_startTour__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  float v2 = [MEMORY[0x263F22970] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F22970] identifier];
    uint64_t v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = AXColorizeFormatLog();
      double v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v10 = 138543362;
        double v11 = v8;
        _os_log_impl(&dword_2426A3000, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  return [*(id *)(a1 + 32) _updateElements];
}

- (void)stopTour
{
  id v3 = +[VKMapDebugView sharedInstance];
  [v3 removePointsAndPaths];

  [(VKMapViewTourGuideManager *)self setRunning:0];
  [(VKMapViewTourGuideManager *)self _stopObservingUpdates];
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  [v4 setIdleTimerDisabled:0];
  [v4 _accessibilitySetIsTourGuideRunning:0];
}

+ (id)_descriptionForDetailLevel
{
  if ((unint64_t)(__tourGuideDetailLevel + 1) <= 2)
  {
    AXVectorKitLocString(off_265162EA0[__tourGuideDetailLevel + 1]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (int64_t)detailLevel
{
  return __tourGuideDetailLevel;
}

+ (int64_t)detailLevel
{
  return __tourGuideDetailLevel;
}

+ (BOOL)shouldSuppressLocationUpdates
{
  return __tourGuideDetailLevel < 1;
}

+ (void)increaseDetailLevel
{
  if (__tourGuideDetailLevel <= 0) {
    ++__tourGuideDetailLevel;
  }
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [a1 _descriptionForDetailLevel];
  UIAccessibilityPostNotification(v2, v3);
}

+ (void)decreaseDetailLevel
{
  if (([a1 detailLevel] & 0x8000000000000000) == 0) {
    --__tourGuideDetailLevel;
  }
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  id v4 = [a1 _descriptionForDetailLevel];
  UIAccessibilityPostNotification(v3, v4);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (VKMapViewAccessibilityElementManager)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
}

- (VKMapViewTourStatus)tourStatus
{
  return self->_tourStatus;
}

- (void)setTourStatus:(id)a3
{
}

- (NSString)lastTourStatusAnnouncement
{
  return self->_lastTourStatusAnnouncement;
}

- (void)setLastTourStatusAnnouncement:(id)a3
{
}

- (VKFeatureAccessibilityElement)lastCurrentTourLocation
{
  return self->_lastCurrentTourLocation;
}

- (void)setLastCurrentTourLocation:(id)a3
{
}

- (VKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (VKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (int64_t)secondsSinceZoomRequest
{
  return self->_secondsSinceZoomRequest;
}

- (void)setSecondsSinceZoomRequest:(int64_t)a3
{
  self->_secondsSinceZoomRequest = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_lastCurrentTourLocation, 0);
  objc_storeStrong((id *)&self->_lastTourStatusAnnouncement, 0);
  objc_storeStrong((id *)&self->_tourStatus, 0);

  objc_storeStrong((id *)&self->_elementManager, 0);
}

@end