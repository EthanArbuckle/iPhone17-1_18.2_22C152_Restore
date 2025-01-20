@interface BWISPStartupAnalyticsPayload
- (BWISPStartupAnalyticsPayload)init;
- (id)eventDictionary;
- (id)eventName;
- (int)ispStartupTime;
- (void)dealloc;
- (void)reset;
- (void)setIspStartupTime:(int)a3;
@end

@implementation BWISPStartupAnalyticsPayload

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWISPStartupAnalyticsPayload;
  [(BWISPStartupAnalyticsPayload *)&v2 dealloc];
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.ISPStartup";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_ispStartupTime), @"ispStartupTime");
  return v3;
}

- (void)setIspStartupTime:(int)a3
{
  self->_ispStartupTime = a3;
}

- (BWISPStartupAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWISPStartupAnalyticsPayload;
  objc_super v2 = [(BWISPStartupAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWISPStartupAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_ispStartupTime = -1;
}

- (int)ispStartupTime
{
  return self->_ispStartupTime;
}

@end