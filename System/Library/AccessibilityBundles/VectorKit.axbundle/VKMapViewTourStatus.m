@interface VKMapViewTourStatus
- (BOOL)isStationary;
- (CGPoint)currentPoint;
- (CGPoint)futurePoint;
- (VKFeatureAccessibilityElement)currentLocation;
- (VKFeatureAccessibilityElement)futureLocation;
- (VKFeatureAccessibilityElement)lastCurrentLocation;
- (VKFeatureAccessibilityElement)lastFutureLocation;
- (VKPointFeatureAccessibilityElement)futurePOI;
- (VKPointFeatureAccessibilityElement)lastFuturePOI;
- (double)lastFutureDistance;
- (double)lastPOIDistance;
- (id)_stringForSide:(unint64_t)a3;
- (id)_tourStatusAnnouncementWithLength:(unint64_t)a3;
- (id)longTourStatusAnnouncement;
- (id)shortTourStatusAnnouncement;
- (unint64_t)futurePOISide;
- (unint64_t)lastFuturePOISide;
- (void)setCurrentLocation:(id)a3;
- (void)setCurrentPoint:(CGPoint)a3;
- (void)setFutureLocation:(id)a3;
- (void)setFuturePOI:(id)a3;
- (void)setFuturePOISide:(unint64_t)a3;
- (void)setFuturePoint:(CGPoint)a3;
- (void)setIsStationary:(BOOL)a3;
- (void)setLastCurrentLocation:(id)a3;
- (void)setLastFutureDistance:(double)a3;
- (void)setLastFutureLocation:(id)a3;
- (void)setLastFuturePOI:(id)a3;
- (void)setLastFuturePOISide:(unint64_t)a3;
- (void)setLastPOIDistance:(double)a3;
- (void)updateTourStatusWithCurrentLocation:(id)a3 currentPoint:(CGPoint)a4 futureLocation:(id)a5 futurePoint:(CGPoint)a6 tourPOI:(id)a7 tourPOISide:(unint64_t)a8 isStationary:(BOOL)a9;
@end

@implementation VKMapViewTourStatus

- (id)_tourStatusAnnouncementWithLength:(unint64_t)a3
{
  v75 = [(VKMapViewTourStatus *)self currentLocation];
  v73 = [(VKMapViewTourStatus *)self lastCurrentLocation];
  v76 = [(VKMapViewTourStatus *)self futureLocation];
  v74 = [(VKMapViewTourStatus *)self lastFutureLocation];
  v4 = [(VKMapViewTourStatus *)self futurePOI];
  v72 = [(VKMapViewTourStatus *)self lastFuturePOI];
  BOOL v5 = [(VKMapViewTourStatus *)self isStationary];
  if (!v76) {
    goto LABEL_20;
  }
  v6 = [MEMORY[0x263EFF960] currentLocale];
  int v7 = objc_msgSend(v6, "_navigation_distanceUsesMetricSystem");

  v8 = [v76 accessibilityContainer];
  [(VKMapViewTourStatus *)self currentPoint];
  double v10 = v9;
  double v12 = v11;
  [(VKMapViewTourStatus *)self futurePoint];
  objc_msgSend(v8, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v10, v12, v13, v14);
  float v16 = v15;
  double v17 = v15;

  if (v7)
  {
    if (v16 > 15.0 || ([(VKMapViewTourStatus *)self lastFutureDistance], v18 <= 15.0))
    {
      if (v16 <= 30.0)
      {
        [(VKMapViewTourStatus *)self lastFutureDistance];
        BOOL v20 = v19 <= 30.0;
        goto LABEL_13;
      }
LABEL_11:
      int v22 = 0;
      goto LABEL_16;
    }
LABEL_9:
    int v22 = 1;
    goto LABEL_16;
  }
  if (v17 <= 30.479999)
  {
    [(VKMapViewTourStatus *)self lastFutureDistance];
    if (v21 > 30.479999) {
      goto LABEL_9;
    }
  }
  if (v17 > 15.2399995) {
    goto LABEL_11;
  }
  [(VKMapViewTourStatus *)self lastFutureDistance];
  BOOL v20 = v23 <= 15.2399995;
LABEL_13:
  int v22 = !v20;
LABEL_16:
  if (([v76 isEqual:v74] ^ 1 | v22) == 1)
  {
    if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v24 = [v76 trueLabel];
    }
    else
    {
      uint64_t v24 = [v76 accessibilityLabel];
    }
    v26 = (void *)v24;
    [(VKMapViewTourStatus *)self setLastFutureDistance:v17];
    v27 = @"APPROACHING_LOCATION_METERS";
    if (v5) {
      v27 = @"FACING_LOCATION_METERS";
    }
    v28 = v27;
    if ((v7 & 1) == 0)
    {
      v29 = @"APPROACHING_LOCATION_FEET";
      if (v5) {
        v29 = @"FACING_LOCATION_FEET";
      }
      v30 = v29;

      v28 = v30;
    }
    v31 = NSString;
    v32 = AXVectorKitLocString(v28);
    v33 = AXFormatInteger();
    v25 = objc_msgSend(v31, "localizedStringWithFormat:", v32, v26, v33);

    if (!v4) {
      goto LABEL_60;
    }
    goto LABEL_30;
  }
LABEL_20:
  v25 = 0;
  if (!v4) {
    goto LABEL_60;
  }
LABEL_30:
  v34 = [MEMORY[0x263EFF960] currentLocale];
  int v35 = objc_msgSend(v34, "_navigation_distanceUsesMetricSystem");

  [v4 location];
  VKLocationCoordinate2DForVKPoint();
  double v37 = v36;
  double v39 = v38;
  v40 = [v4 accessibilityContainer];
  objc_msgSend(v40, "accessibilityConvertCoordinateToWindow:", v37, v39);

  v41 = [v4 accessibilityContainer];
  [(VKMapViewTourStatus *)self currentPoint];
  objc_msgSend(v41, "accessibilityRealDistanceBetweenPoint:screenPoint2:");
  float v43 = v42;

  if (v43 <= 15.0) {
    int v44 = v35;
  }
  else {
    int v44 = 0;
  }
  if (v44 == 1)
  {
    [(VKMapViewTourStatus *)self lastPOIDistance];
    BOOL v46 = v45 > 15.0;
  }
  else
  {
    BOOL v46 = 0;
  }
  if ([v4 isEqual:v72])
  {
    if ([(VKMapViewTourStatus *)self futurePOISide])
    {
      unint64_t v47 = [(VKMapViewTourStatus *)self lastFuturePOISide];
      char v48 = v47 != [(VKMapViewTourStatus *)self futurePOISide] || v46;
      if ((v48 & 1) == 0) {
        goto LABEL_60;
      }
    }
    else if (!v46)
    {
      goto LABEL_60;
    }
  }
  if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v49 = [v4 trueLabel];
  }
  else
  {
    uint64_t v49 = [v4 accessibilityLabel];
  }
  v50 = (void *)v49;
  [(VKMapViewTourStatus *)self setLastPOIDistance:v43];
  v51 = @"APPROACHING_LOCATION_METERS";
  if (v5) {
    v51 = @"FACING_LOCATION_METERS";
  }
  v52 = v51;
  if ((v35 & 1) == 0)
  {
    v53 = @"APPROACHING_LOCATION_FEET";
    if (v5) {
      v53 = @"FACING_LOCATION_FEET";
    }
    v54 = v53;

    v52 = v54;
  }
  v55 = NSString;
  v56 = AXVectorKitLocString(v52);
  v57 = AXFormatInteger();
  v68 = objc_msgSend(v55, "localizedStringWithFormat:", v56, v50, v57);
  v58 = __UIAXStringForVariables();

  if ([(VKMapViewTourStatus *)self futurePOISide])
  {
    if ([(VKMapViewTourStatus *)self futurePOISide] == 1) {
      AXVectorKitLocString(@"APPROACHING_LEFT");
    }
    else {
    v67 = AXVectorKitLocString(@"APPROACHING_RIGHT");
    }
    v70 = @"__AXStringForVariablesSentinel";
    uint64_t v59 = __UIAXStringForVariables();

    v58 = (void *)v59;
  }

  v25 = v58;
LABEL_60:
  if (v75 && ([v75 isEqual:v73] & 1) == 0)
  {
    if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v60 = [v75 trueLabel];
    }
    else
    {
      uint64_t v60 = objc_msgSend(v75, "accessibilityLabel", v67, v70);
    }
    v61 = (void *)v60;
    v62 = NSString;
    if (objc_msgSend(v75, "isRoad", v67)) {
      v63 = @"ON_ROAD";
    }
    else {
      v63 = @"AT_POI";
    }
    v64 = AXVectorKitLocString(v63);
    v69 = objc_msgSend(v62, "localizedStringWithFormat:", v64, v61);
    uint64_t v65 = __UIAXStringForVariables();

    v25 = (void *)v65;
  }

  return v25;
}

- (id)longTourStatusAnnouncement
{
  return [(VKMapViewTourStatus *)self _tourStatusAnnouncementWithLength:1];
}

- (id)shortTourStatusAnnouncement
{
  return [(VKMapViewTourStatus *)self _tourStatusAnnouncementWithLength:2];
}

- (id)_stringForSide:(unint64_t)a3
{
  v3 = @"Left";
  if (a3 == 2) {
    v3 = @"Right";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"None";
  }
}

- (void)updateTourStatusWithCurrentLocation:(id)a3 currentPoint:(CGPoint)a4 futureLocation:(id)a5 futurePoint:(CGPoint)a6 tourPOI:(id)a7 tourPOISide:(unint64_t)a8 isStationary:(BOOL)a9
{
  BOOL v9 = a9;
  double y = a6.y;
  double x = a6.x;
  double v15 = a4.y;
  double v16 = a4.x;
  id v32 = a3;
  id v18 = a5;
  id v19 = a7;
  [(VKMapViewTourStatus *)self setIsStationary:v9];
  BOOL v20 = [(VKMapViewTourStatus *)self currentLocation];
  [(VKMapViewTourStatus *)self setLastCurrentLocation:v20];

  [(VKMapViewTourStatus *)self setCurrentLocation:v32];
  -[VKMapViewTourStatus setCurrentPoint:](self, "setCurrentPoint:", v16, v15);
  [(VKMapViewTourStatus *)self futurePoint];
  *(float *)&double v21 = x - v21;
  *(float *)&double v22 = y - v22;
  if (sqrtf((float)(*(float *)&v21 * *(float *)&v21) + (float)(*(float *)&v22 * *(float *)&v22)) >= 4.0 || v9)
  {
    uint64_t v24 = [(VKMapViewTourStatus *)self futureLocation];

    if (v24 || v9)
    {
      v25 = [(VKMapViewTourStatus *)self futureLocation];
      [(VKMapViewTourStatus *)self setLastFutureLocation:v25];
    }
    [(VKMapViewTourStatus *)self setFutureLocation:v18];
    -[VKMapViewTourStatus setFuturePoint:](self, "setFuturePoint:", x, y);
  }
  if (v9
    || ([(VKMapViewTourStatus *)self futurePOI],
        v26 = objc_claimAutoreleasedReturnValue(),
        v26,
        v26))
  {
    v27 = [(VKMapViewTourStatus *)self lastFuturePOI];
    v28 = [(VKMapViewTourStatus *)self futurePOI];
    char v29 = [v27 isEqual:v28];

    v30 = [(VKMapViewTourStatus *)self futurePOI];
    [(VKMapViewTourStatus *)self setLastFuturePOI:v30];

    char v31 = [(VKMapViewTourStatus *)self futurePOISide] ? 0 : v29;
    if ((v31 & 1) == 0) {
      [(VKMapViewTourStatus *)self setLastFuturePOISide:[(VKMapViewTourStatus *)self futurePOISide]];
    }
  }
  [(VKMapViewTourStatus *)self setFuturePOI:v19];
  [(VKMapViewTourStatus *)self setFuturePOISide:a8];
}

- (VKFeatureAccessibilityElement)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (VKFeatureAccessibilityElement)lastCurrentLocation
{
  return self->_lastCurrentLocation;
}

- (void)setLastCurrentLocation:(id)a3
{
}

- (VKFeatureAccessibilityElement)futureLocation
{
  return self->_futureLocation;
}

- (void)setFutureLocation:(id)a3
{
}

- (VKFeatureAccessibilityElement)lastFutureLocation
{
  return self->_lastFutureLocation;
}

- (void)setLastFutureLocation:(id)a3
{
}

- (VKPointFeatureAccessibilityElement)futurePOI
{
  return self->_futurePOI;
}

- (void)setFuturePOI:(id)a3
{
}

- (VKPointFeatureAccessibilityElement)lastFuturePOI
{
  return self->_lastFuturePOI;
}

- (void)setLastFuturePOI:(id)a3
{
}

- (CGPoint)currentPoint
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPoint:(CGPoint)a3
{
  self->_currentPoint = a3;
}

- (CGPoint)futurePoint
{
  double x = self->_futurePoint.x;
  double y = self->_futurePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFuturePoint:(CGPoint)a3
{
  self->_futurePoint = a3;
}

- (double)lastFutureDistance
{
  return self->_lastFutureDistance;
}

- (void)setLastFutureDistance:(double)a3
{
  self->_lastFutureDistance = a3;
}

- (double)lastPOIDistance
{
  return self->_lastPOIDistance;
}

- (void)setLastPOIDistance:(double)a3
{
  self->_lastPOIDistance = a3;
}

- (unint64_t)futurePOISide
{
  return self->_futurePOISide;
}

- (void)setFuturePOISide:(unint64_t)a3
{
  self->_futurePOISide = a3;
}

- (unint64_t)lastFuturePOISide
{
  return self->_lastFuturePOISide;
}

- (void)setLastFuturePOISide:(unint64_t)a3
{
  self->_lastFuturePOISide = a3;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationardouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFuturePOI, 0);
  objc_storeStrong((id *)&self->_futurePOI, 0);
  objc_storeStrong((id *)&self->_lastFutureLocation, 0);
  objc_storeStrong((id *)&self->_futureLocation, 0);
  objc_storeStrong((id *)&self->_lastCurrentLocation, 0);

  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end