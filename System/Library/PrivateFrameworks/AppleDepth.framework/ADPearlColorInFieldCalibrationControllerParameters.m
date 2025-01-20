@interface ADPearlColorInFieldCalibrationControllerParameters
- (ADPearlColorInFieldCalibrationControllerParameters)init;
- (float)minRotationBetweenFrames;
- (float)thresholdPrecOfValidDepth;
- (void)setMinRotationBetweenFrames:(float)a3;
- (void)setThresholdPrecOfValidDepth:(float)a3;
@end

@implementation ADPearlColorInFieldCalibrationControllerParameters

- (void)setThresholdPrecOfValidDepth:(float)a3
{
  self->_thresholdPrecOfValidDepth = a3;
}

- (float)thresholdPrecOfValidDepth
{
  return self->_thresholdPrecOfValidDepth;
}

- (void)setMinRotationBetweenFrames:(float)a3
{
  self->_minRotationBetweenFrames = a3;
}

- (float)minRotationBetweenFrames
{
  return self->_minRotationBetweenFrames;
}

- (ADPearlColorInFieldCalibrationControllerParameters)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADPearlColorInFieldCalibrationControllerParameters;
  v2 = [(ADPearlColorInFieldCalibrationControllerParameters *)&v5 init];
  if (v2)
  {
    +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyPearlColorInFieldMinRotationBetweenFrames];
    v2->_minRotationBetweenFrames = v3;
    v2->_thresholdPrecOfValidDepth = 0.5;
  }
  return v2;
}

@end