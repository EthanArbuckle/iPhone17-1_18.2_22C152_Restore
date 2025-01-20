@interface ADJasperColorInFieldCalibrationControllerParameters
- (ADJasperColorInFieldCalibrationControllerParameters)init;
- (ADJasperColorInFieldCalibrationControllerParameters)initWithFlowType:(int)a3;
- (float)allowedDriftFromSymmetricCrop;
- (float)minRotationBetweenFrames;
- (float)sceneDiversityMinDepthDiff;
- (float)thresholdAngularVelocity;
- (float)thresholdDepthValue;
- (float)thresholdPrecOfValidDepth;
- (unsigned)numberOfMinimalRangeSpots;
- (unsigned)numberOfValidSpotsForValidFrame;
- (unsigned)sceneDiversityMinChangedSpots;
- (void)setAllowedDriftFromSymmetricCrop:(float)a3;
- (void)setMinRotationBetweenFrames:(float)a3;
- (void)setNumberOfMinimalRangeSpots:(unsigned int)a3;
- (void)setNumberOfValidSpotsForValidFrame:(unsigned int)a3;
- (void)setSceneDiversityMinChangedSpots:(unsigned __int16)a3;
- (void)setSceneDiversityMinDepthDiff:(float)a3;
- (void)setThresholdAngularVelocity:(float)a3;
- (void)setThresholdDepthValue:(float)a3;
- (void)setThresholdPrecOfValidDepth:(float)a3;
@end

@implementation ADJasperColorInFieldCalibrationControllerParameters

- (void)setThresholdAngularVelocity:(float)a3
{
  self->_thresholdAngularVelocity = a3;
}

- (float)thresholdAngularVelocity
{
  return self->_thresholdAngularVelocity;
}

- (void)setAllowedDriftFromSymmetricCrop:(float)a3
{
  self->_allowedDriftFromSymmetricCrop = a3;
}

- (float)allowedDriftFromSymmetricCrop
{
  return self->_allowedDriftFromSymmetricCrop;
}

- (void)setSceneDiversityMinChangedSpots:(unsigned __int16)a3
{
  self->_sceneDiversityMinChangedSpots = a3;
}

- (unsigned)sceneDiversityMinChangedSpots
{
  return self->_sceneDiversityMinChangedSpots;
}

- (void)setSceneDiversityMinDepthDiff:(float)a3
{
  self->_sceneDiversityMinDepthDiff = a3;
}

- (float)sceneDiversityMinDepthDiff
{
  return self->_sceneDiversityMinDepthDiff;
}

- (void)setMinRotationBetweenFrames:(float)a3
{
  self->_minRotationBetweenFrames = a3;
}

- (float)minRotationBetweenFrames
{
  return self->_minRotationBetweenFrames;
}

- (void)setThresholdPrecOfValidDepth:(float)a3
{
  self->_thresholdPrecOfValidDepth = a3;
}

- (float)thresholdPrecOfValidDepth
{
  return self->_thresholdPrecOfValidDepth;
}

- (void)setThresholdDepthValue:(float)a3
{
  self->_thresholdDepthValue = a3;
}

- (float)thresholdDepthValue
{
  return self->_thresholdDepthValue;
}

- (void)setNumberOfMinimalRangeSpots:(unsigned int)a3
{
  self->_numberOfMinimalRangeSpots = a3;
}

- (unsigned)numberOfMinimalRangeSpots
{
  return self->_numberOfMinimalRangeSpots;
}

- (void)setNumberOfValidSpotsForValidFrame:(unsigned int)a3
{
  self->_numberOfValidSpotsForValidFrame = a3;
}

- (unsigned)numberOfValidSpotsForValidFrame
{
  return self->_numberOfValidSpotsForValidFrame;
}

- (ADJasperColorInFieldCalibrationControllerParameters)initWithFlowType:(int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorInFieldCalibrationControllerParameters;
  v4 = [(ADJasperColorInFieldCalibrationControllerParameters *)&v14 init];
  v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 20) = 0x3F00000043FA0000;
    *((_DWORD *)v4 + 10) = 0;
    +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames];
    *((_DWORD *)v5 + 7) = v6;
    *((_DWORD *)v5 + 9) = 985963430;
    if (a3)
    {
      if (a3 != 1)
      {
        v12 = 0;
        goto LABEL_9;
      }
      *((_DWORD *)v5 + 7) = 0;
      +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyJasperColorInFieldAngularVelocityThreshold];
      *((_DWORD *)v5 + 10) = v7;
      uint64_t v8 = 0x3200000032;
      __int16 v9 = 30;
      int v10 = 1140457472;
    }
    else
    {
      +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyJasperColorInFieldMinRotationBetweenFrames];
      __int16 v9 = 0;
      *((_DWORD *)v5 + 7) = v11;
      uint64_t v8 = 0x1C00000090;
      int v10 = 0;
    }
    *(void *)(v5 + 12) = v8;
    *((_DWORD *)v5 + 8) = v10;
    *((_WORD *)v5 + 4) = v9;
  }
  v12 = v5;
LABEL_9:

  return v12;
}

- (ADJasperColorInFieldCalibrationControllerParameters)init
{
  return [(ADJasperColorInFieldCalibrationControllerParameters *)self initWithFlowType:0];
}

@end