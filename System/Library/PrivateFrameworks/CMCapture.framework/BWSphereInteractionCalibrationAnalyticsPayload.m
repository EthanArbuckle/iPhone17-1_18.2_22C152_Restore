@interface BWSphereInteractionCalibrationAnalyticsPayload
- (BWSphereInteractionCalibrationAnalyticsPayload)init;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (int)sphereMacroPosition;
- (int)sphereMacroPositionError;
- (int)sphereNeutralPosition;
- (int)sphereNeutralPositionError;
- (int64_t)magneticFieldMagnitude;
- (unsigned)calibrationStatus;
- (void)dealloc;
- (void)reset;
- (void)setCalibrationStatus:(unsigned int)a3;
- (void)setMagneticFieldMagnitude:(int64_t)a3;
- (void)setPortType:(id)a3;
- (void)setSphereMacroPosition:(int)a3;
- (void)setSphereMacroPositionError:(int)a3;
- (void)setSphereNeutralPosition:(int)a3;
- (void)setSphereNeutralPositionError:(int)a3;
@end

@implementation BWSphereInteractionCalibrationAnalyticsPayload

- (BWSphereInteractionCalibrationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWSphereInteractionCalibrationAnalyticsPayload;
  v2 = [(BWSphereInteractionCalibrationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWSphereInteractionCalibrationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSphereInteractionCalibrationAnalyticsPayload;
  [(BWSphereInteractionCalibrationAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_magneticFieldMagnitude = -1;

  self->_sphereMacroPosition = -1;
  *(void *)&self->_calibrationStatus = -1;
  *(void *)&self->_sphereNeutralPosition = -1;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.SphereInteractionCalibration";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_magneticFieldMagnitude), @"magneticFieldMagnitude");
  [v3 setObject:self->_portType forKeyedSubscript:@"portType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_calibrationStatus), @"status");
  if (!self->_calibrationStatus)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereMacroPositionError), @"neutralPositionError");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereNeutralPosition), @"neutralPosition");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereMacroPositionError), @"macroPositionError");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sphereMacroPosition), @"macroPosition");
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

- (int)sphereNeutralPositionError
{
  return self->_sphereNeutralPositionError;
}

- (void)setSphereNeutralPositionError:(int)a3
{
  self->_sphereNeutralPositionError = a3;
}

- (int)sphereNeutralPosition
{
  return self->_sphereNeutralPosition;
}

- (void)setSphereNeutralPosition:(int)a3
{
  self->_sphereNeutralPosition = a3;
}

- (int)sphereMacroPositionError
{
  return self->_sphereMacroPositionError;
}

- (void)setSphereMacroPositionError:(int)a3
{
  self->_sphereMacroPositionError = a3;
}

- (int)sphereMacroPosition
{
  return self->_sphereMacroPosition;
}

- (void)setSphereMacroPosition:(int)a3
{
  self->_sphereMacroPosition = a3;
}

@end