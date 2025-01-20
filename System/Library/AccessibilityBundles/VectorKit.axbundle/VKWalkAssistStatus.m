@interface VKWalkAssistStatus
- (BOOL)isFacingStartLocation;
- (BOOL)isStationary;
- (NSString)startRouteRoadName;
- (VKWalkAssistStatus)initWithArrivalRadius:(double)a3 delegate:(id)a4;
- (VKWalkAssistStatusDelegate)delegate;
- (double)arrivalRadius;
- (double)currentDistance;
- (double)lastCurrentDistance;
- (void)_makeStatusAnnouncement;
- (void)dealloc;
- (void)setArrivalRadius:(double)a3;
- (void)setCurrentDistance:(double)a3;
- (void)setIsFacingStartLocation:(BOOL)a3;
- (void)setIsStationary:(BOOL)a3;
- (void)setLastCurrentDistance:(double)a3;
- (void)setStartRouteRoadName:(id)a3;
- (void)updateAssistStatusWithCurrentDistance:(double)a3 startRouteRoadName:(id)a4 isFacingStartLocation:(BOOL)a5 isStationary:(BOOL)a6;
@end

@implementation VKWalkAssistStatus

- (VKWalkAssistStatus)initWithArrivalRadius:(double)a3 delegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKWalkAssistStatus;
  v7 = [(VKWalkAssistStatus *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_lastCurrentDistance = 0.0;
    v7->_arrivalRadius = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKWalkAssistStatus;
  [(VKWalkAssistStatus *)&v4 dealloc];
}

- (void)updateAssistStatusWithCurrentDistance:(double)a3 startRouteRoadName:(id)a4 isFacingStartLocation:(BOOL)a5 isStationary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a4;
  [(VKWalkAssistStatus *)self setCurrentDistance:a3];
  double lastCurrentDistance = self->_lastCurrentDistance;
  if (lastCurrentDistance == 0.0) {
    double lastCurrentDistance = a3;
  }
  [(VKWalkAssistStatus *)self setLastCurrentDistance:lastCurrentDistance];
  [(VKWalkAssistStatus *)self setIsFacingStartLocation:v7];
  [(VKWalkAssistStatus *)self setIsStationary:v6];
  [(VKWalkAssistStatus *)self setStartRouteRoadName:v11];
  [(VKWalkAssistStatus *)self _makeStatusAnnouncement];
}

- (void)_makeStatusAnnouncement
{
  [(VKWalkAssistStatus *)self currentDistance];
  double v4 = v3;
  [(VKWalkAssistStatus *)self lastCurrentDistance];
  double v6 = v5;
  BOOL v7 = [(VKWalkAssistStatus *)self startRouteRoadName];
  if (v7) {
    [(VKWalkAssistStatus *)self startRouteRoadName];
  }
  else {
    AXVectorKitLocString(@"START_OF_ROUTE");
  }
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v8 = [(VKWalkAssistStatus *)self isFacingStartLocation];
  BOOL v9 = [(VKWalkAssistStatus *)self isStationary];
  if (v4 <= self->_arrivalRadius)
  {
    v20 = [(VKWalkAssistStatus *)self delegate];
    [v20 didArrive:1];
  }
  else
  {
    if (vabdd_f64(v6, v4) <= 6.0) {
      goto LABEL_18;
    }
    BOOL v10 = v9;
    [(VKWalkAssistStatus *)self setLastCurrentDistance:v4];
    id v11 = [MEMORY[0x263EFF960] currentLocale];
    char v12 = objc_msgSend(v11, "_navigation_distanceUsesMetricSystem");

    if (v8)
    {
      v13 = @"APPROACHING_LOCATION_METERS";
      if (v10) {
        v13 = @"FACING_LOCATION_METERS";
      }
      v14 = v13;
      if ((v12 & 1) == 0)
      {
        v15 = @"APPROACHING_LOCATION_FEET";
        if (v10) {
          v15 = @"FACING_LOCATION_FEET";
        }
        v16 = v15;

        v14 = v16;
      }
      v17 = NSString;
      v18 = AXVectorKitLocString(v14);
      v19 = AXFormatInteger();
      v20 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v23, v19);
    }
    else
    {
      v21 = NSString;
      AXVectorKitLocString(@"MOVING_AWAY");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "localizedStringWithFormat:", v14, v23);
    }

    v22 = [(VKWalkAssistStatus *)self delegate];
    [v22 didUpdateStatusWithAnnouncement:v20];
  }
LABEL_18:
}

- (VKWalkAssistStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VKWalkAssistStatusDelegate *)WeakRetained;
}

- (NSString)startRouteRoadName
{
  return self->_startRouteRoadName;
}

- (void)setStartRouteRoadName:(id)a3
{
}

- (double)currentDistance
{
  return self->_currentDistance;
}

- (void)setCurrentDistance:(double)a3
{
  self->_currentDistance = a3;
}

- (double)lastCurrentDistance
{
  return self->_lastCurrentDistance;
}

- (void)setLastCurrentDistance:(double)a3
{
  self->_double lastCurrentDistance = a3;
}

- (BOOL)isFacingStartLocation
{
  return self->_isFacingStartLocation;
}

- (void)setIsFacingStartLocation:(BOOL)a3
{
  self->_isFacingStartLocation = a3;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationary = a3;
}

- (double)arrivalRadius
{
  return self->_arrivalRadius;
}

- (void)setArrivalRadius:(double)a3
{
  self->_arrivalRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startRouteRoadName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end