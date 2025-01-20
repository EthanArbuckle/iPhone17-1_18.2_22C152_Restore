@interface BWCinematicFramingSessionAnalyticsPayload
- (BWCinematicFramingSessionAnalyticsPayload)init;
- (NSString)cinematicFramingROIHeatMap;
- (NSString)clientApplicationID;
- (id)eventDictionary;
- (id)eventName;
- (unsigned)cinematicFramingControlMode;
- (unsigned)cinematicFramingMaxPeopleDetected;
- (void)dealloc;
- (void)reset;
- (void)setCinematicFramingControlMode:(unsigned int)a3;
- (void)setCinematicFramingMaxPeopleDetected:(unsigned int)a3;
- (void)setCinematicFramingROIHeatMap:(id)a3;
- (void)setClientApplicationID:(id)a3;
@end

@implementation BWCinematicFramingSessionAnalyticsPayload

- (BWCinematicFramingSessionAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWCinematicFramingSessionAnalyticsPayload;
  v2 = [(BWCinematicFramingSessionAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWCinematicFramingSessionAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingSessionAnalyticsPayload;
  [(BWCinematicFramingSessionAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_cinematicFramingMaxPeopleDetected = 0;

  self->_cinematicFramingROIHeatMap = 0;
  self->_clientApplicationID = 0;
  self->_cinematicFramingControlMode = -1;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.CinematicFramingSession";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicFramingMaxPeopleDetected), @"cinematicFramingMaxPeopleDetected");
  [v3 setObject:self->_cinematicFramingROIHeatMap forKeyedSubscript:@"cinematicFramingROIHeatMap"];
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cinematicFramingControlMode), @"cinematicFramingControlMode");
  return v3;
}

- (unsigned)cinematicFramingMaxPeopleDetected
{
  return self->_cinematicFramingMaxPeopleDetected;
}

- (void)setCinematicFramingMaxPeopleDetected:(unsigned int)a3
{
  self->_cinematicFramingMaxPeopleDetected = a3;
}

- (NSString)cinematicFramingROIHeatMap
{
  return self->_cinematicFramingROIHeatMap;
}

- (void)setCinematicFramingROIHeatMap:(id)a3
{
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

@end