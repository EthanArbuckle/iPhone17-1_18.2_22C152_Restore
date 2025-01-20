@interface BWSphereEndstopCalibrationAnalyticsPayload
- (BWSphereEndstopCalibrationAnalyticsPayload)init;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (int)deltaSphereXNegEndstop;
- (int)deltaSphereXPosEndstop;
- (int)deltaSphereYNegEndstop;
- (int)deltaSphereYPosEndstop;
- (int)sphereXNegEndstop;
- (int)sphereXPosEndstop;
- (int)sphereXStroke;
- (int)sphereYNegEndstop;
- (int)sphereYPosEndstop;
- (int)sphereYStroke;
- (int64_t)magneticFieldMagnitude;
- (unsigned)calibrationStatus;
- (void)dealloc;
- (void)reset;
- (void)setCalibrationStatus:(unsigned int)a3;
- (void)setDeltaSphereXNegEndstop:(int)a3;
- (void)setDeltaSphereXPosEndstop:(int)a3;
- (void)setDeltaSphereYNegEndstop:(int)a3;
- (void)setDeltaSphereYPosEndstop:(int)a3;
- (void)setMagneticFieldMagnitude:(int64_t)a3;
- (void)setPortType:(id)a3;
- (void)setSphereXNegEndstop:(int)a3;
- (void)setSphereXPosEndstop:(int)a3;
- (void)setSphereXStroke:(int)a3;
- (void)setSphereYNegEndstop:(int)a3;
- (void)setSphereYPosEndstop:(int)a3;
- (void)setSphereYStroke:(int)a3;
@end

@implementation BWSphereEndstopCalibrationAnalyticsPayload

- (BWSphereEndstopCalibrationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWSphereEndstopCalibrationAnalyticsPayload;
  v2 = [(BWSphereEndstopCalibrationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWSphereEndstopCalibrationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSphereEndstopCalibrationAnalyticsPayload;
  [(BWSphereEndstopCalibrationAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_magneticFieldMagnitude = -1;

  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)&self->_deltaSphereYPosEndstop = v3;
  *(_OWORD *)&self->_sphereYNegEndstop = v3;
  *(_OWORD *)&self->_calibrationStatus = v3;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.SphereEndstopCalibration";
}

- (id)eventDictionary
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_magneticFieldMagnitude), @"magneticFieldMagnitude");
  [v3 setObject:self->_portType forKeyedSubscript:@"portType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_calibrationStatus), @"status");
  if (!self->_calibrationStatus)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXPosEndstop), @"xPosEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXNegEndstop), @"xNegEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYPosEndstop), @"yPosEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYNegEndstop), @"yNegEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereXPosEndstop), @"deltaXPosEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereXNegEndstop), @"deltaXNegEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereYPosEndstop), @"deltaYPosEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_deltaSphereYNegEndstop), @"deltaYNegEndstop");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereXStroke), @"xStroke");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereYStroke), @"yStroke");
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

- (int)sphereXPosEndstop
{
  return self->_sphereXPosEndstop;
}

- (void)setSphereXPosEndstop:(int)a3
{
  self->_sphereXPosEndstop = a3;
}

- (int)sphereXNegEndstop
{
  return self->_sphereXNegEndstop;
}

- (void)setSphereXNegEndstop:(int)a3
{
  self->_sphereXNegEndstop = a3;
}

- (int)sphereYPosEndstop
{
  return self->_sphereYPosEndstop;
}

- (void)setSphereYPosEndstop:(int)a3
{
  self->_sphereYPosEndstop = a3;
}

- (int)sphereYNegEndstop
{
  return self->_sphereYNegEndstop;
}

- (void)setSphereYNegEndstop:(int)a3
{
  self->_sphereYNegEndstop = a3;
}

- (int)deltaSphereXPosEndstop
{
  return self->_deltaSphereXPosEndstop;
}

- (void)setDeltaSphereXPosEndstop:(int)a3
{
  self->_deltaSphereXPosEndstop = a3;
}

- (int)deltaSphereXNegEndstop
{
  return self->_deltaSphereXNegEndstop;
}

- (void)setDeltaSphereXNegEndstop:(int)a3
{
  self->_deltaSphereXNegEndstop = a3;
}

- (int)deltaSphereYPosEndstop
{
  return self->_deltaSphereYPosEndstop;
}

- (void)setDeltaSphereYPosEndstop:(int)a3
{
  self->_deltaSphereYPosEndstop = a3;
}

- (int)deltaSphereYNegEndstop
{
  return self->_deltaSphereYNegEndstop;
}

- (void)setDeltaSphereYNegEndstop:(int)a3
{
  self->_deltaSphereYNegEndstop = a3;
}

- (int)sphereXStroke
{
  return self->_sphereXStroke;
}

- (void)setSphereXStroke:(int)a3
{
  self->_sphereXStroke = a3;
}

- (int)sphereYStroke
{
  return self->_sphereYStroke;
}

- (void)setSphereYStroke:(int)a3
{
  self->_sphereYStroke = a3;
}

@end