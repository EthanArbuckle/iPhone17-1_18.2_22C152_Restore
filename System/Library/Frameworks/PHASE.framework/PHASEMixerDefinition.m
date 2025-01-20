@interface PHASEMixerDefinition
+ (PHASEMixerDefinition)new;
- (PHASEMixerDefinition)init;
- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition;
- (double)gain;
- (id)initInternal;
- (void)setGain:(double)gain;
- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition;
@end

@implementation PHASEMixerDefinition

- (PHASEMixerDefinition)init
{
  return 0;
}

+ (PHASEMixerDefinition)new
{
  return 0;
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)PHASEMixerDefinition;
  v2 = [(PHASEDefinition *)&v7 initInternal];
  v3 = v2;
  if (v2)
  {
    v2[2] = 0x3FF0000000000000;
    v4 = (void *)v2[3];
    v2[3] = 0;

    id v5 = v3;
  }

  return v3;
}

- (void)setGain:(double)gain
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v7 = NSStringFromSelector(a2);
  self->_gain = PHASEGetPropertyBounded<double>(v8, v7, gain, 0.0, 1.0);
}

- (double)gain
{
  return self->_gain;
}

- (PHASENumberMetaParameterDefinition)gainMetaParameterDefinition
{
  return self->_gainMetaParameterDefinition;
}

- (void)setGainMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)gainMetaParameterDefinition
{
}

- (void).cxx_destruct
{
}

@end