@interface BWStartupCalibrationAnalyticsPayload
- (BOOL)closedLoopEntry;
- (BOOL)confidenceErrorOccurred;
- (BOOL)convergeErrorOccurred;
- (BOOL)gcolEntry;
- (BOOL)headroomErrorOccurred;
- (BOOL)largeOffsetErrorOccurred;
- (BOOL)motionErrorOccurred;
- (BOOL)saturationErrorOccurred;
- (BOOL)success;
- (BWStartupCalibrationAnalyticsPayload)init;
- (NSString)portType;
- (float)accelStandardDeviation;
- (float)completionTime;
- (float)deltaAcceleration;
- (float)deltaOffset;
- (float)gravityX;
- (float)gravityY;
- (float)gravityZ;
- (float)gyroStandardDeviation;
- (float)maxAcceleration;
- (float)sessionOffset;
- (id)eventDictionary;
- (id)eventName;
- (int)apsVoltage;
- (void)dealloc;
- (void)reset;
- (void)setAccelStandardDeviation:(float)a3;
- (void)setApsVoltage:(int)a3;
- (void)setClosedLoopEntry:(BOOL)a3;
- (void)setCompletionTime:(float)a3;
- (void)setConfidenceErrorOccurred:(BOOL)a3;
- (void)setConvergeErrorOccurred:(BOOL)a3;
- (void)setDeltaAcceleration:(float)a3;
- (void)setDeltaOffset:(float)a3;
- (void)setGcolEntry:(BOOL)a3;
- (void)setGravityX:(float)a3;
- (void)setGravityY:(float)a3;
- (void)setGravityZ:(float)a3;
- (void)setGyroStandardDeviation:(float)a3;
- (void)setHeadroomErrorOccurred:(BOOL)a3;
- (void)setLargeOffsetErrorOccurred:(BOOL)a3;
- (void)setMaxAcceleration:(float)a3;
- (void)setMotionErrorOccurred:(BOOL)a3;
- (void)setPortType:(id)a3;
- (void)setSaturationErrorOccurred:(BOOL)a3;
- (void)setSessionOffset:(float)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation BWStartupCalibrationAnalyticsPayload

- (BWStartupCalibrationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStartupCalibrationAnalyticsPayload;
  v2 = [(BWStartupCalibrationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStartupCalibrationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStartupCalibrationAnalyticsPayload;
  [(BWStartupCalibrationAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  *(_OWORD *)((char *)&self->_maxAcceleration + 1) = 0u;
  *(_OWORD *)&self->_sessionOffset = 0u;
  *(_OWORD *)&self->_portType = 0u;
  *(void *)&self->_gravityX = 0;
  *(void *)&self->_gravityZ = 0;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.StartupCalibration";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_super v5 = v3;
  portType = self->_portType;
  if (portType) {
    [v3 setObject:portType forKeyedSubscript:@"portType"];
  }
  *(float *)&double v4 = self->_accelStandardDeviation;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"accelStd");
  *(float *)&double v7 = self->_gyroStandardDeviation;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"gyroStd");
  *(float *)&double v8 = self->_sessionOffset;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v8), @"sessionOffset");
  *(float *)&double v9 = self->_deltaOffset;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v9), @"deltaOffset");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_apsVoltage), @"apsVoltage");
  *(float *)&double v10 = self->_maxAcceleration;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v10), @"maxAccel");
  *(float *)&double v11 = self->_deltaAcceleration;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v11), @"deltaAccel");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_headroomErrorOccurred), @"headroomErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_convergeErrorOccurred), @"convergeErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_motionErrorOccurred), @"motionErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_confidenceErrorOccurred), @"confidenceErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_largeOffsetErrorOccurred), @"largeOffsetErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_saturationErrorOccurred), @"saturationErrorOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_success), @"successOccurred");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_gcolEntry), @"gcolEntry");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_closedLoopEntry), @"closedLoopEntry");
  *(float *)&double v12 = self->_gravityX;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v12), @"gravityX");
  *(float *)&double v13 = self->_gravityY;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v13), @"gravityY");
  *(float *)&double v14 = self->_gravityZ;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v14), @"gravityZ");
  *(float *)&double v15 = self->_completionTime;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v15), @"completionTime");
  return v5;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (float)accelStandardDeviation
{
  return self->_accelStandardDeviation;
}

- (void)setAccelStandardDeviation:(float)a3
{
  self->_accelStandardDeviation = a3;
}

- (float)gyroStandardDeviation
{
  return self->_gyroStandardDeviation;
}

- (void)setGyroStandardDeviation:(float)a3
{
  self->_gyroStandardDeviation = a3;
}

- (float)sessionOffset
{
  return self->_sessionOffset;
}

- (void)setSessionOffset:(float)a3
{
  self->_sessionOffset = a3;
}

- (float)deltaOffset
{
  return self->_deltaOffset;
}

- (void)setDeltaOffset:(float)a3
{
  self->_deltaOffset = a3;
}

- (int)apsVoltage
{
  return self->_apsVoltage;
}

- (void)setApsVoltage:(int)a3
{
  self->_apsVoltage = a3;
}

- (float)maxAcceleration
{
  return self->_maxAcceleration;
}

- (void)setMaxAcceleration:(float)a3
{
  self->_maxAcceleration = a3;
}

- (float)deltaAcceleration
{
  return self->_deltaAcceleration;
}

- (void)setDeltaAcceleration:(float)a3
{
  self->_deltaAcceleration = a3;
}

- (BOOL)headroomErrorOccurred
{
  return self->_headroomErrorOccurred;
}

- (void)setHeadroomErrorOccurred:(BOOL)a3
{
  self->_headroomErrorOccurred = a3;
}

- (BOOL)convergeErrorOccurred
{
  return self->_convergeErrorOccurred;
}

- (void)setConvergeErrorOccurred:(BOOL)a3
{
  self->_convergeErrorOccurred = a3;
}

- (BOOL)motionErrorOccurred
{
  return self->_motionErrorOccurred;
}

- (void)setMotionErrorOccurred:(BOOL)a3
{
  self->_motionErrorOccurred = a3;
}

- (BOOL)confidenceErrorOccurred
{
  return self->_confidenceErrorOccurred;
}

- (void)setConfidenceErrorOccurred:(BOOL)a3
{
  self->_confidenceErrorOccurred = a3;
}

- (BOOL)largeOffsetErrorOccurred
{
  return self->_largeOffsetErrorOccurred;
}

- (void)setLargeOffsetErrorOccurred:(BOOL)a3
{
  self->_largeOffsetErrorOccurred = a3;
}

- (BOOL)saturationErrorOccurred
{
  return self->_saturationErrorOccurred;
}

- (void)setSaturationErrorOccurred:(BOOL)a3
{
  self->_saturationErrorOccurred = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)gcolEntry
{
  return self->_gcolEntry;
}

- (void)setGcolEntry:(BOOL)a3
{
  self->_gcolEntry = a3;
}

- (BOOL)closedLoopEntry
{
  return self->_closedLoopEntry;
}

- (void)setClosedLoopEntry:(BOOL)a3
{
  self->_closedLoopEntry = a3;
}

- (float)gravityX
{
  return self->_gravityX;
}

- (void)setGravityX:(float)a3
{
  self->_gravityX = a3;
}

- (float)gravityY
{
  return self->_gravityY;
}

- (void)setGravityY:(float)a3
{
  self->_gravityY = a3;
}

- (float)gravityZ
{
  return self->_gravityZ;
}

- (void)setGravityZ:(float)a3
{
  self->_gravityZ = a3;
}

- (float)completionTime
{
  return self->_completionTime;
}

- (void)setCompletionTime:(float)a3
{
  self->_completionTime = a3;
}

@end