@interface ADInFieldCalibrationMetadata
- (float)sensorTemperature;
- (void)setSensorTemperature:(float)a3;
@end

@implementation ADInFieldCalibrationMetadata

- (void)setSensorTemperature:(float)a3
{
  self->_sensorTemperature = a3;
}

- (float)sensorTemperature
{
  return self->_sensorTemperature;
}

@end