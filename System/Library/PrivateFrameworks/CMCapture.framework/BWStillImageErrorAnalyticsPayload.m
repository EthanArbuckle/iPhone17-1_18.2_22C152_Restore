@interface BWStillImageErrorAnalyticsPayload
- (BWStillImageErrorAnalyticsPayload)init;
- (float)digitalZoomRatioFromSource;
- (id)eventDictionary;
- (id)eventName;
- (int)error;
- (void)reset;
- (void)setDigitalZoomRatioFromSource:(float)a3;
- (void)setError:(int)a3;
@end

@implementation BWStillImageErrorAnalyticsPayload

- (BWStillImageErrorAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  v2 = [(BWStillImageAnalyticsPayloadCommon *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStillImageErrorAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  [(BWStillImageAnalyticsPayloadCommon *)&v3 reset];
  *(&self->super._depthAFStatus + 1) = 0;
  self->_error = 2139095039;
}

- (id)eventName
{
  if ([(BWStillImageAnalyticsPayloadCommon *)self deferred]) {
    return @"com.apple.coremedia.camera.DeferredPhotoCapture";
  }
  else {
    return @"com.apple.coremedia.camera.PhotoCapture";
  }
}

- (id)eventDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageErrorAnalyticsPayload;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[BWStillImageAnalyticsPayloadCommon eventDictionary](&v5, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(&self->super._depthAFStatus + 1)), @"error");
  if (*(float *)&self->_error != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"digitalZoomRatioFromSource");
  }
  return v3;
}

- (int)error
{
  return *(&self->super._depthAFStatus + 1);
}

- (void)setError:(int)a3
{
  *(&self->super._depthAFStatus + 1) = a3;
}

- (float)digitalZoomRatioFromSource
{
  return *(float *)&self->_error;
}

- (void)setDigitalZoomRatioFromSource:(float)a3
{
  *(float *)&self->_error = a3;
}

@end