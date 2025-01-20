@interface EKTravelEngineOriginalEvent
- (BOOL)automaticGeocodingAllowed;
- (BOOL)hasPredictedLocation;
- (BOOL)isEqualToOriginalEvent:(id)a3;
- (BOOL)isOnSharedCalendar;
- (BOOL)locationIsAConferenceRoom;
- (CLLocation)geoLocation;
- (NSData)locationMapKitHandle;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventExternalURL;
- (NSString)locationString;
- (NSString)locationStringWithoutPrediction;
- (id)description;
- (int)transportTypeOverride;
- (void)setAutomaticGeocodingAllowed:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setEventExternalURL:(id)a3;
- (void)setGeoLocation:(id)a3;
- (void)setHasPredictedLocation:(BOOL)a3;
- (void)setIsOnSharedCalendar:(BOOL)a3;
- (void)setLocationIsAConferenceRoom:(BOOL)a3;
- (void)setLocationMapKitHandle:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setLocationStringWithoutPrediction:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTransportTypeOverride:(int)a3;
@end

@implementation EKTravelEngineOriginalEvent

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F30018]);
  v12.receiver = self;
  v12.super_class = (Class)EKTravelEngineOriginalEvent;
  v4 = [(EKTravelEngineOriginalEvent *)&v12 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  v6 = [(EKTravelEngineOriginalEvent *)self eventExternalURL];
  [v5 setKey:@"eventExternalURL" withString:v6];

  v7 = [(EKTravelEngineOriginalEvent *)self startDate];
  [v5 setKey:@"startDate" withDate:v7];

  v8 = [(EKTravelEngineOriginalEvent *)self endDate];
  [v5 setKey:@"endDate" withDate:v8];

  v9 = [(EKTravelEngineOriginalEvent *)self locationString];
  [v5 setKey:@"locationString" withString:v9];

  v10 = [v5 build];

  return v10;
}

- (BOOL)isEqualToOriginalEvent:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_25;
  }
  v5 = [(EKTravelEngineOriginalEvent *)self geoLocation];
  v6 = [v4 geoLocation];
  BOOL v7 = __54__EKTravelEngineOriginalEvent_isEqualToOriginalEvent___block_invoke_3((uint64_t)v6, v5, v6);

  if (v7) {
    goto LABEL_25;
  }
  int v8 = [(EKTravelEngineOriginalEvent *)self transportTypeOverride];
  if (v8 != [v4 transportTypeOverride]) {
    goto LABEL_25;
  }
  v9 = [(EKTravelEngineOriginalEvent *)self endDate];
  v10 = [v4 endDate];
  v11 = v10;
  if (v9)
  {
    char v12 = [v9 isEqualToDate:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_25;
    }
  }
  v13 = [(EKTravelEngineOriginalEvent *)self locationString];
  v14 = [v4 locationString];
  v15 = v14;
  if (v13)
  {
    char v16 = [v13 isEqualToString:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_25;
    }
  }
  v17 = [(EKTravelEngineOriginalEvent *)self locationMapKitHandle];
  v18 = [v4 locationMapKitHandle];
  v19 = v18;
  if (v17)
  {
    char v20 = [v17 isEqualToData:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v19) {
      goto LABEL_25;
    }
  }
  v21 = [(EKTravelEngineOriginalEvent *)self startDate];
  v22 = [v4 startDate];
  v23 = v22;
  if (v21)
  {
    char v24 = [v21 isEqualToDate:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v23) {
      goto LABEL_25;
    }
  }
  int v25 = [(EKTravelEngineOriginalEvent *)self locationIsAConferenceRoom];
  if (v25 != [v4 locationIsAConferenceRoom]) {
    goto LABEL_25;
  }
  v26 = [(EKTravelEngineOriginalEvent *)self eventExternalURL];
  v27 = [v4 eventExternalURL];
  v28 = v27;
  if (!v26)
  {

    if (!v28) {
      goto LABEL_23;
    }
LABEL_25:
    LOBYTE(v31) = 0;
    goto LABEL_26;
  }
  char v29 = [v26 isEqualToString:v27];

  if ((v29 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_23:
  BOOL v30 = [(EKTravelEngineOriginalEvent *)self automaticGeocodingAllowed];
  int v31 = v30 ^ [v4 automaticGeocodingAllowed] ^ 1;
LABEL_26:

  return v31;
}

BOOL __54__EKTravelEngineOriginalEvent_isEqualToOriginalEvent___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = v5;
  if (v4 || !v5)
  {
    if (v4) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    BOOL v7 = v8;
    if (v5 && v4)
    {
      [v5 distanceFromLocation:v4];
      if (v9 >= 0.5)
      {
        [v4 altitude];
        double v11 = v10;
        [v6 altitude];
        BOOL v7 = vabdd_f64(v11, v12) >= 0.5;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSString)eventExternalURL
{
  return self->_eventExternalURL;
}

- (void)setEventExternalURL:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int)transportTypeOverride
{
  return self->_transportTypeOverride;
}

- (void)setTransportTypeOverride:(int)a3
{
  self->_transportTypeOverride = a3;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setGeoLocation:(id)a3
{
}

- (NSData)locationMapKitHandle
{
  return self->_locationMapKitHandle;
}

- (void)setLocationMapKitHandle:(id)a3
{
}

- (BOOL)locationIsAConferenceRoom
{
  return self->_locationIsAConferenceRoom;
}

- (void)setLocationIsAConferenceRoom:(BOOL)a3
{
  self->_locationIsAConferenceRoom = a3;
}

- (BOOL)automaticGeocodingAllowed
{
  return self->_automaticGeocodingAllowed;
}

- (void)setAutomaticGeocodingAllowed:(BOOL)a3
{
  self->_automaticGeocodingAllowed = a3;
}

- (BOOL)hasPredictedLocation
{
  return self->_hasPredictedLocation;
}

- (void)setHasPredictedLocation:(BOOL)a3
{
  self->_hasPredictedLocation = a3;
}

- (BOOL)isOnSharedCalendar
{
  return self->_isOnSharedCalendar;
}

- (void)setIsOnSharedCalendar:(BOOL)a3
{
  self->_isOnSharedCalendar = a3;
}

- (NSString)locationStringWithoutPrediction
{
  return self->_locationStringWithoutPrediction;
}

- (void)setLocationStringWithoutPrediction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStringWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_locationMapKitHandle, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventExternalURL, 0);
}

@end