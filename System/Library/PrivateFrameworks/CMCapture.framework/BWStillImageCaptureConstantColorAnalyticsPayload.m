@interface BWStillImageCaptureConstantColorAnalyticsPayload
- (BOOL)constantColorApplied;
- (BWStillImageCaptureConstantColorAnalyticsPayload)init;
- (float)constantColorCenterWeightedMeanConfidenceLevel;
- (float)constantColorStrobeWhitePointBGain;
- (float)constantColorStrobeWhitePointGGain;
- (float)constantColorStrobeWhitePointRGain;
- (id)eventDictionary;
- (id)eventName;
- (unsigned)constantColorAnalyticsVersion;
- (void)reset;
- (void)setConstantColorAnalyticsVersion:(unsigned int)a3;
- (void)setConstantColorApplied:(BOOL)a3;
- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3;
- (void)setConstantColorStrobeWhitePointBGain:(float)a3;
- (void)setConstantColorStrobeWhitePointGGain:(float)a3;
- (void)setConstantColorStrobeWhitePointRGain:(float)a3;
@end

@implementation BWStillImageCaptureConstantColorAnalyticsPayload

- (BWStillImageCaptureConstantColorAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  v2 = [(BWStillImageCaptureAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStillImageCaptureConstantColorAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  [(BWStillImageCaptureAnalyticsPayload *)&v3 reset];
  self->_constantColorApplied = 0;
  self->_constantColorCenterWeightedMeanConfidenceLevel = 0.0;
  self->_constantColorAnalyticsVersion = 0;
  self->_constantColorStrobeWhitePointRGain = 0.0;
  self->_constantColorStrobeWhitePointGGain = 0.0;
  self->_constantColorStrobeWhitePointBGain = 0.0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.StillImageCaptureConstantColor";
}

- (id)eventDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageCaptureConstantColorAnalyticsPayload;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[BWStillImageCaptureAnalyticsPayload eventDictionary](&v9, sel_eventDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_constantColorApplied), @"constantColorApplied");
  if (self->_constantColorApplied)
  {
    *(float *)&double v4 = self->_constantColorCenterWeightedMeanConfidenceLevel;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"constantColorCenterWeightedMeanConfidenceLevel");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_constantColorAnalyticsVersion), @"constantColorAnalyticsVersion");
    *(float *)&double v5 = self->_constantColorStrobeWhitePointRGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"constantColorStrobeWhitePointRGain");
    *(float *)&double v6 = self->_constantColorStrobeWhitePointGGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"constantColorStrobeWhitePointGGain");
    *(float *)&double v7 = self->_constantColorStrobeWhitePointBGain;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"constantColorStrobeWhitePointBGain");
  }
  return v3;
}

- (BOOL)constantColorApplied
{
  return self->_constantColorApplied;
}

- (void)setConstantColorApplied:(BOOL)a3
{
  self->_constantColorApplied = a3;
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_constantColorCenterWeightedMeanConfidenceLevel;
}

- (void)setConstantColorCenterWeightedMeanConfidenceLevel:(float)a3
{
  self->_constantColorCenterWeightedMeanConfidenceLevel = a3;
}

- (unsigned)constantColorAnalyticsVersion
{
  return self->_constantColorAnalyticsVersion;
}

- (void)setConstantColorAnalyticsVersion:(unsigned int)a3
{
  self->_constantColorAnalyticsVersion = a3;
}

- (float)constantColorStrobeWhitePointRGain
{
  return self->_constantColorStrobeWhitePointRGain;
}

- (void)setConstantColorStrobeWhitePointRGain:(float)a3
{
  self->_constantColorStrobeWhitePointRGain = a3;
}

- (float)constantColorStrobeWhitePointGGain
{
  return self->_constantColorStrobeWhitePointGGain;
}

- (void)setConstantColorStrobeWhitePointGGain:(float)a3
{
  self->_constantColorStrobeWhitePointGGain = a3;
}

- (float)constantColorStrobeWhitePointBGain
{
  return self->_constantColorStrobeWhitePointBGain;
}

- (void)setConstantColorStrobeWhitePointBGain:(float)a3
{
  self->_constantColorStrobeWhitePointBGain = a3;
}

@end