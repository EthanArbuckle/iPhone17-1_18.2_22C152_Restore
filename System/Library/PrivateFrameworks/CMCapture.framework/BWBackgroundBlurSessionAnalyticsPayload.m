@interface BWBackgroundBlurSessionAnalyticsPayload
- (BWBackgroundBlurSessionAnalyticsPayload)init;
- (NSString)clientApplicationID;
- (double)averageProcessingTime;
- (double)maxProcessingTime;
- (id)eventDictionary;
- (id)eventName;
- (int)maxThermalSystemPressureLevel;
- (int)numberOfFrameDrops;
- (int64_t)effectQuality;
- (int64_t)numberOfFrames;
- (void)dealloc;
- (void)reset;
- (void)setAverageProcessingTime:(double)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setEffectQuality:(int64_t)a3;
- (void)setMaxProcessingTime:(double)a3;
- (void)setMaxThermalSystemPressureLevel:(int)a3;
- (void)setNumberOfFrameDrops:(int)a3;
- (void)setNumberOfFrames:(int64_t)a3;
@end

@implementation BWBackgroundBlurSessionAnalyticsPayload

- (BWBackgroundBlurSessionAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWBackgroundBlurSessionAnalyticsPayload;
  v2 = [(BWBackgroundBlurSessionAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWBackgroundBlurSessionAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWBackgroundBlurSessionAnalyticsPayload;
  [(BWBackgroundBlurSessionAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  *(_OWORD *)&self->_numberOfFrames = 0u;
  *(_OWORD *)&self->_averageProcessingTime = 0u;
  *(_OWORD *)&self->_clientApplicationID = 0u;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.BackgroundBlurSession";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  [v3 setObject:self->_clientApplicationID forKeyedSubscript:@"clientApplicationID"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->_effectQuality), @"averageQuality");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_averageProcessingTime), @"averageProcessingTime");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_maxProcessingTime), @"maxProcessingTime");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_numberOfFrames), @"numberOfFrames");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_numberOfFrameDrops), @"numberOfFrameDrops");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxThermalSystemPressureLevel), @"maxThermalSystemPressurelLevel");
  return v3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->_effectQuality = a3;
}

- (double)averageProcessingTime
{
  return self->_averageProcessingTime;
}

- (void)setAverageProcessingTime:(double)a3
{
  self->_averageProcessingTime = a3;
}

- (double)maxProcessingTime
{
  return self->_maxProcessingTime;
}

- (void)setMaxProcessingTime:(double)a3
{
  self->_maxProcessingTime = a3;
}

- (int64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (void)setNumberOfFrames:(int64_t)a3
{
  self->_numberOfFrames = a3;
}

- (int)numberOfFrameDrops
{
  return self->_numberOfFrameDrops;
}

- (void)setNumberOfFrameDrops:(int)a3
{
  self->_numberOfFrameDrops = a3;
}

- (int)maxThermalSystemPressureLevel
{
  return self->_maxThermalSystemPressureLevel;
}

- (void)setMaxThermalSystemPressureLevel:(int)a3
{
  self->_maxThermalSystemPressureLevel = a3;
}

@end