@interface BWSphereResonanceCalibrationAnalyticsPayload
- (BWSphereResonanceCalibrationAnalyticsPayload)init;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (int)deltaSphereXAxisDampingCoefficient;
- (int)deltaSphereXAxisResonantFrequency;
- (int)deltaSphereYAxisDampingCoefficient;
- (int)deltaSphereYAxisResonantFrequency;
- (int)sphereXAxisDampingCoefficient;
- (int)sphereXAxisLoopGain;
- (int)sphereXAxisResonantFrequency;
- (int)sphereYAxisDampingCoefficient;
- (int)sphereYAxisLoopGain;
- (int)sphereYAxisResonantFrequency;
- (int64_t)magneticFieldMagnitude;
- (unsigned)calibrationStatus;
- (void)dealloc;
- (void)reset;
- (void)setCalibrationStatus:(unsigned int)a3;
- (void)setDeltaSphereXAxisDampingCoefficient:(int)a3;
- (void)setDeltaSphereXAxisResonantFrequency:(int)a3;
- (void)setDeltaSphereYAxisDampingCoefficient:(int)a3;
- (void)setDeltaSphereYAxisResonantFrequency:(int)a3;
- (void)setMagneticFieldMagnitude:(int64_t)a3;
- (void)setPortType:(id)a3;
- (void)setSphereXAxisDampingCoefficient:(int)a3;
- (void)setSphereXAxisLoopGain:(int)a3;
- (void)setSphereXAxisResonantFrequency:(int)a3;
- (void)setSphereYAxisDampingCoefficient:(int)a3;
- (void)setSphereYAxisLoopGain:(int)a3;
- (void)setSphereYAxisResonantFrequency:(int)a3;
@end

@implementation BWSphereResonanceCalibrationAnalyticsPayload

- (BWSphereResonanceCalibrationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWSphereResonanceCalibrationAnalyticsPayload;
  v2 = [(BWSphereResonanceCalibrationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWSphereResonanceCalibrationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSphereResonanceCalibrationAnalyticsPayload;
  [(BWSphereResonanceCalibrationAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_magneticFieldMagnitude = -1;

  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaSphereXAxisDampingCoefficient = v3;
  *(_OWORD *)&self->_deltaSphereYAxisResonantFrequency = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.SphereResonanceCalibration";
}

- (id)eventDictionary
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_magneticFieldMagnitude), @"magneticFieldMagnitude");
  [v3 setObject:self->_portType forKeyedSubscript:@"portType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_calibrationStatus), @"status");
  if (!self->_calibrationStatus)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXAxisResonantFrequency), @"xAxisResonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYAxisResonantFrequency), @"yAxisResonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereXAxisResonantFrequency), @"deltaXAxisResonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereYAxisResonantFrequency), @"deltaYAxisResonantFrequency");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXAxisDampingCoefficient), @"xAxisDampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYAxisDampingCoefficient), @"yAxisDampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereXAxisDampingCoefficient), @"deltaXAxisDampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereYAxisDampingCoefficient), @"deltaYAxisDampingCoefficient");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXAxisLoopGain), @"xAxisLoopGain");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYAxisLoopGain), @"yAxisLoopGain");
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

- (int)sphereXAxisResonantFrequency
{
  return self->_sphereXAxisResonantFrequency;
}

- (void)setSphereXAxisResonantFrequency:(int)a3
{
  self->_sphereXAxisResonantFrequency = a3;
}

- (int)sphereYAxisResonantFrequency
{
  return self->_sphereYAxisResonantFrequency;
}

- (void)setSphereYAxisResonantFrequency:(int)a3
{
  self->_sphereYAxisResonantFrequency = a3;
}

- (int)deltaSphereXAxisResonantFrequency
{
  return self->_deltaSphereXAxisResonantFrequency;
}

- (void)setDeltaSphereXAxisResonantFrequency:(int)a3
{
  self->_deltaSphereXAxisResonantFrequency = a3;
}

- (int)deltaSphereYAxisResonantFrequency
{
  return self->_deltaSphereYAxisResonantFrequency;
}

- (void)setDeltaSphereYAxisResonantFrequency:(int)a3
{
  self->_deltaSphereYAxisResonantFrequency = a3;
}

- (int)sphereXAxisDampingCoefficient
{
  return self->_sphereXAxisDampingCoefficient;
}

- (void)setSphereXAxisDampingCoefficient:(int)a3
{
  self->_sphereXAxisDampingCoefficient = a3;
}

- (int)sphereYAxisDampingCoefficient
{
  return self->_sphereYAxisDampingCoefficient;
}

- (void)setSphereYAxisDampingCoefficient:(int)a3
{
  self->_sphereYAxisDampingCoefficient = a3;
}

- (int)deltaSphereXAxisDampingCoefficient
{
  return self->_deltaSphereXAxisDampingCoefficient;
}

- (void)setDeltaSphereXAxisDampingCoefficient:(int)a3
{
  self->_deltaSphereXAxisDampingCoefficient = a3;
}

- (int)deltaSphereYAxisDampingCoefficient
{
  return self->_deltaSphereYAxisDampingCoefficient;
}

- (void)setDeltaSphereYAxisDampingCoefficient:(int)a3
{
  self->_deltaSphereYAxisDampingCoefficient = a3;
}

- (int)sphereXAxisLoopGain
{
  return self->_sphereXAxisLoopGain;
}

- (void)setSphereXAxisLoopGain:(int)a3
{
  self->_sphereXAxisLoopGain = a3;
}

- (int)sphereYAxisLoopGain
{
  return self->_sphereYAxisLoopGain;
}

- (void)setSphereYAxisLoopGain:(int)a3
{
  self->_sphereYAxisLoopGain = a3;
}

@end