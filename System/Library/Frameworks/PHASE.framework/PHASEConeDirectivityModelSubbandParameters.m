@interface PHASEConeDirectivityModelSubbandParameters
- (PHASEConeDirectivityModelSubbandParameters)init;
- (double)frequency;
- (double)innerAngle;
- (double)outerAngle;
- (double)outerGain;
- (void)setFrequency:(double)frequency;
- (void)setInnerAngle:(double)innerAngle outerAngle:(double)outerAngle;
- (void)setOuterGain:(double)outerGain;
@end

@implementation PHASEConeDirectivityModelSubbandParameters

- (PHASEConeDirectivityModelSubbandParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEConeDirectivityModelSubbandParameters;
  result = [(PHASEConeDirectivityModelSubbandParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_frequency = xmmword_2220E73C0;
    *(_OWORD *)&result->_outerAngle = xmmword_2220E73D0;
  }
  return result;
}

- (void)setFrequency:(double)frequency
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_frequency = PHASEGetPropertyBounded<double>(v8, v7, frequency, 20.0, 20000.0);
}

- (void)setInnerAngle:(double)innerAngle outerAngle:(double)outerAngle
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (innerAngle <= outerAngle)
  {
    double v9 = innerAngle;
  }
  else
  {
    id v8 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    double v9 = outerAngle;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      v17 = "PHASEDirectivityModel.mm";
      __int16 v18 = 1024;
      int v19 = 91;
      __int16 v20 = 2048;
      double v21 = innerAngle;
      __int16 v22 = 2048;
      double v23 = outerAngle;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Warning: innerAngle %f is greater than outerAngle %f. Clamping innerAngle to outerAngle.", (uint8_t *)&v16, 0x26u);
      double v9 = outerAngle;
    }
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = NSStringFromSelector(a2);
  self->_innerAngle = PHASEGetPropertyBounded<double>(v11, v12, v9, 0.0, 360.0);

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = NSStringFromSelector(a2);
  self->_outerAngle = PHASEGetPropertyBounded<double>(v14, v15, outerAngle, 0.0, 360.0);
}

- (void)setOuterGain:(double)outerGain
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_outerGain = PHASEGetPropertyBounded<double>(v8, v7, outerGain, 0.0, 1.0);
}

- (double)frequency
{
  return self->_frequency;
}

- (double)innerAngle
{
  return self->_innerAngle;
}

- (double)outerAngle
{
  return self->_outerAngle;
}

- (double)outerGain
{
  return self->_outerGain;
}

@end