@interface BWMultitaskingSessionAnalyticsPayload
- (BOOL)pipEnabled;
- (BOOL)windowed;
- (BWMultitaskingSessionAnalyticsPayload)init;
- (NSString)clientApplicationID;
- (id)eventDictionary;
- (id)eventName;
- (void)dealloc;
- (void)reset;
- (void)setClientApplicationID:(id)a3;
- (void)setPipEnabled:(BOOL)a3;
- (void)setWindowed:(BOOL)a3;
@end

@implementation BWMultitaskingSessionAnalyticsPayload

- (BOOL)windowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (void)setPipEnabled:(BOOL)a3
{
  self->_pipEnabled = a3;
}

- (BOOL)pipEnabled
{
  return self->_pipEnabled;
}

- (BWMultitaskingSessionAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWMultitaskingSessionAnalyticsPayload;
  v2 = [(BWMultitaskingSessionAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWMultitaskingSessionAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_clientApplicationID = 0;
  *(_WORD *)&self->_windowed = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMultitaskingSessionAnalyticsPayload;
  [(BWMultitaskingSessionAnalyticsPayload *)&v3 dealloc];
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.MultitaskingSession";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_windowed), @"windowed");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_pipEnabled), @"pipEnabled");
  return v3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

@end