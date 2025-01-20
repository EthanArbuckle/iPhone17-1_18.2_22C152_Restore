@interface BWAFResonanceCalibrationAnalyticsPayload
- (BWAFResonanceCalibrationAnalyticsPayload)init;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (int)afAxisDampingCoefficient;
- (int)afAxisResonantFreq;
- (int)afGelModelD1Coefficient;
- (int)afGelModelD2Coefficient;
- (int)afGelModelP1Coefficient;
- (int)afGelModelP2Coefficient;
- (int)afLoopGain;
- (int)deltaAFAxisDampingCoefficient;
- (int)deltaAFAxisResonantFreq;
- (int64_t)magneticFieldMagnitude;
- (unsigned)calibrationStatus;
- (void)dealloc;
- (void)reset;
- (void)setAfAxisDampingCoefficient:(int)a3;
- (void)setAfAxisResonantFreq:(int)a3;
- (void)setAfGelModelD1Coefficient:(int)a3;
- (void)setAfGelModelD2Coefficient:(int)a3;
- (void)setAfGelModelP1Coefficient:(int)a3;
- (void)setAfGelModelP2Coefficient:(int)a3;
- (void)setAfLoopGain:(int)a3;
- (void)setCalibrationStatus:(unsigned int)a3;
- (void)setDeltaAFAxisDampingCoefficient:(int)a3;
- (void)setDeltaAFAxisResonantFreq:(int)a3;
- (void)setMagneticFieldMagnitude:(int64_t)a3;
- (void)setPortType:(id)a3;
@end

@implementation BWAFResonanceCalibrationAnalyticsPayload

- (BWAFResonanceCalibrationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWAFResonanceCalibrationAnalyticsPayload;
  v2 = [(BWAFResonanceCalibrationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWAFResonanceCalibrationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAFResonanceCalibrationAnalyticsPayload;
  [(BWAFResonanceCalibrationAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_magneticFieldMagnitude = -1;

  *(void *)&self->_afGelModelP1Coefficient = -1;
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaAFAxisDampingCoefficient = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.AFResonanceCalibration";
}

- (id)eventDictionary
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_magneticFieldMagnitude), @"magneticFieldMagnitude");
  [v3 setObject:self->_portType forKeyedSubscript:@"portType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_calibrationStatus), @"status");
  if (!self->_calibrationStatus)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afAxisResonantFreq), @"resonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaAFAxisResonantFreq), @"deltaResonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afAxisDampingCoefficient), @"dampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaAFAxisDampingCoefficient), @"deltaDampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afLoopGain), @"loopGain");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afGelModelD1Coefficient), @"gelModelD1Coefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afGelModelD2Coefficient), @"gelModelD2Coefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afGelModelP1Coefficient), @"gelModelP1Coefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_afGelModelP2Coefficient), @"gelModelP2Coefficient");
  }
  return v3;
}

- (int64_t)magneticFieldMagnitude
{
  return self->_magneticFieldMagnitude;
}

- (void)setMagneticFieldMagnitude:(int64_t)a3
{
  self->_magneticFieldMagnitude = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (unsigned)calibrationStatus
{
  return self->_calibrationStatus;
}

- (void)setCalibrationStatus:(unsigned int)a3
{
  self->_calibrationStatus = a3;
}

- (int)afAxisResonantFreq
{
  return self->_afAxisResonantFreq;
}

- (void)setAfAxisResonantFreq:(int)a3
{
  self->_afAxisResonantFreq = a3;
}

- (int)deltaAFAxisResonantFreq
{
  return self->_deltaAFAxisResonantFreq;
}

- (void)setDeltaAFAxisResonantFreq:(int)a3
{
  self->_deltaAFAxisResonantFreq = a3;
}

- (int)afAxisDampingCoefficient
{
  return self->_afAxisDampingCoefficient;
}

- (void)setAfAxisDampingCoefficient:(int)a3
{
  self->_afAxisDampingCoefficient = a3;
}

- (int)deltaAFAxisDampingCoefficient
{
  return self->_deltaAFAxisDampingCoefficient;
}

- (void)setDeltaAFAxisDampingCoefficient:(int)a3
{
  self->_deltaAFAxisDampingCoefficient = a3;
}

- (int)afLoopGain
{
  return self->_afLoopGain;
}

- (void)setAfLoopGain:(int)a3
{
  self->_afLoopGain = a3;
}

- (int)afGelModelD1Coefficient
{
  return self->_afGelModelD1Coefficient;
}

- (void)setAfGelModelD1Coefficient:(int)a3
{
  self->_afGelModelD1Coefficient = a3;
}

- (int)afGelModelD2Coefficient
{
  return self->_afGelModelD2Coefficient;
}

- (void)setAfGelModelD2Coefficient:(int)a3
{
  self->_afGelModelD2Coefficient = a3;
}

- (int)afGelModelP1Coefficient
{
  return self->_afGelModelP1Coefficient;
}

- (void)setAfGelModelP1Coefficient:(int)a3
{
  self->_afGelModelP1Coefficient = a3;
}

- (int)afGelModelP2Coefficient
{
  return self->_afGelModelP2Coefficient;
}

- (void)setAfGelModelP2Coefficient:(int)a3
{
  self->_afGelModelP2Coefficient = a3;
}

@end