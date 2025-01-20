@interface ADPearlColorInFieldCalibrationPipelineParameters
- (ADPearlColorInFieldCalibrationPipelineParameters)init;
- (ADPearlColorInFieldCalibrationPipelineParameters)initWithDeviceName:(id)a3;
- (DefaultsForFlow)getDefaultsForFlow:(int)a3;
- (float)coeffX;
- (float)coeffY;
- (float)coeffZ;
- (float)colorCameraNominalEfl;
- (float)getMaxStdForValidResultForFlow:(int)a3;
- (float)maxStdForValidResult;
- (unsigned)featuresVectorAggregationSize;
- (void)setFeaturesVectorAggregationSize:(unsigned int)a3;
@end

@implementation ADPearlColorInFieldCalibrationPipelineParameters

- (float)coeffZ
{
  return self->_coeffZ;
}

- (float)coeffY
{
  return self->_coeffY;
}

- (float)coeffX
{
  return self->_coeffX;
}

- (float)maxStdForValidResult
{
  return self->_maxStdForValidResult;
}

- (float)colorCameraNominalEfl
{
  return self->_colorCameraNominalEfl;
}

- (void)setFeaturesVectorAggregationSize:(unsigned int)a3
{
  self->_featuresVectorAggregationSize = a3;
}

- (unsigned)featuresVectorAggregationSize
{
  return self->_featuresVectorAggregationSize;
}

- (ADPearlColorInFieldCalibrationPipelineParameters)init
{
  v3 = +[ADDeviceConfiguration getDeviceName];
  v4 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self initWithDeviceName:v3];

  return v4;
}

- (ADPearlColorInFieldCalibrationPipelineParameters)initWithDeviceName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADPearlColorInFieldCalibrationPipelineParameters;
  v5 = [(ADPipelineParameters *)&v12 initForDevice:v4];
  if (v5)
  {
    id v6 = v4;
    if ([v6 hasPrefix:@"N301"])
    {

      v5->_coeffX = 1.0;
      v5->_coeffY = 1.0;
      v5->_coeffZ = 0.0;
      v5->_featuresVectorAggregationSize = 1;
      v5->_colorCameraNominalEfl = 344.8;
      float v7 = 1.25;
    }
    else
    {
      int v8 = [v6 hasPrefix:@"J7"];

      v5->_coeffX = 1.0;
      v5->_coeffY = 1.0;
      float v9 = 0.0;
      if (v8) {
        float v9 = 1.0;
      }
      v5->_coeffZ = v9;
      v5->_featuresVectorAggregationSize = 1;
      if (v8) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
      v5->_colorCameraNominalEfl = 563.05;
      [(ADPearlColorInFieldCalibrationPipelineParameters *)v5 getMaxStdForValidResultForFlow:v10];
    }
    v5->_maxStdForValidResult = v7;
  }

  return v5;
}

- (float)getMaxStdForValidResultForFlow:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyPearlColorStdThreshold_iOS];
  v6.var0 = v5;
  float v7 = (void *)kADDeviceConfigurationKeyPearlColorStdThresholdNoOverride;
  int v8 = objc_msgSend(NSNumber, "numberWithFloat:");
  LODWORD(v7) = [v7 isEqualToNumber:v8];

  if (v7)
  {
    float v9 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self getDefaultsForFlow:v3];
    if (v9) {
      v6.var0 = v9->var0;
    }
    else {
      v6.var0 = 0.0;
    }
  }
  return v6.var0;
}

- (DefaultsForFlow)getDefaultsForFlow:(int)a3
{
  if (a3 >= 4) {
    return 0;
  }
  else {
    return (DefaultsForFlow *)((char *)&-[ADPearlColorInFieldCalibrationPipelineParameters getDefaultsForFlow:]::defaultPerFlow
  }
                             + 4 * a3);
}

@end