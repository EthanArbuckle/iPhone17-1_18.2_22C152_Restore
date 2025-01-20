@interface PHASEGeneratorNodeDefinition
+ (PHASEGeneratorNodeDefinition)new;
- (PHASECalibrationMode)calibrationMode;
- (PHASEGeneratorNodeDefinition)init;
- (PHASEGroup)group;
- (PHASEMixerDefinition)mixerDefinition;
- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition;
- (PHASENumberMetaParameterDefinition)rateMetaParameterDefinition;
- (double)gain;
- (double)level;
- (double)rate;
- (id)initInternal:(id)a3;
- (void)setCalibrationMode:(PHASECalibrationMode)calibrationMode level:(double)level;
- (void)setGain:(double)a3;
- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition;
- (void)setGroup:(PHASEGroup *)group;
- (void)setRate:(double)rate;
- (void)setRateMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)rateMetaParameterDefinition;
@end

@implementation PHASEGeneratorNodeDefinition

- (PHASEGeneratorNodeDefinition)init
{
  return 0;
}

+ (PHASEGeneratorNodeDefinition)new
{
  return 0;
}

- (id)initInternal:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)PHASEGeneratorNodeDefinition;
    v6 = [(PHASEDefinition *)&v12 initInternal];
    v7 = v6;
    if (v6)
    {
      v6[9] = (id)0x3FF0000000000000;
      v6[2] = 0;
      v6[3] = (id)0x3FF0000000000000;
      v6[4] = (id)0x3FF0000000000000;
      objc_storeWeak(v6 + 5, 0);
      id v8 = v7[6];
      v7[6] = 0;

      id v9 = v7[7];
      v7[7] = 0;

      objc_storeStrong(v7 + 8, a3);
    }
    self = v7;
    v10 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a generator with a nil mixerDefinition"];
    v10 = 0;
  }

  return v10;
}

- (void)setCalibrationMode:(PHASECalibrationMode)calibrationMode level:(double)level
{
  self->_calibrationMode = calibrationMode;
  if (calibrationMode == PHASECalibrationModeAbsoluteSpl)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = NSStringFromSelector(a2);
    double v9 = PHASEGetPropertyBounded<double>(v12, v8, level, 0.0, 120.0);
  }
  else if (calibrationMode == PHASECalibrationModeRelativeSpl)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = NSStringFromSelector(a2);
    double v9 = PHASEGetPropertyBounded<double>(v12, v8, level, -200.0, 12.0);
  }
  else
  {
    if (calibrationMode) {
      return;
    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = NSStringFromSelector(a2);
    double v9 = PHASEGetPropertyBounded<double>(v12, v8, level, 0.0, 1.0);
  }
  self->_level = v9;
}

- (void)setRate:(double)rate
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_rate = PHASEGetPropertyBounded<double>(v8, v7, rate, 0.25, 4.0);
}

- (PHASECalibrationMode)calibrationMode
{
  return self->_calibrationMode;
}

- (double)level
{
  return self->_level;
}

- (double)rate
{
  return self->_rate;
}

- (PHASEGroup)group
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_group);

  return (PHASEGroup *)WeakRetained;
}

- (void)setGroup:(PHASEGroup *)group
{
}

- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition
{
  return self->_gainMetaParameterDefinition;
}

- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition
{
}

- (PHASENumberMetaParameterDefinition)rateMetaParameterDefinition
{
  return self->_rateMetaParameterDefinition;
}

- (void)setRateMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)rateMetaParameterDefinition
{
}

- (PHASEMixerDefinition)mixerDefinition
{
  return self->_mixerDefinition;
}

- (double)gain
{
  return self->_gain;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixerDefinition, 0);
  objc_storeStrong((id *)&self->_rateMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, 0);

  objc_destroyWeak((id *)&self->_group);
}

@end