@interface PHASECardioidDirectivityModelSubbandParameters
- (PHASECardioidDirectivityModelSubbandParameters)init;
- (double)frequency;
- (double)pattern;
- (double)sharpness;
- (void)setFrequency:(double)frequency;
- (void)setPattern:(double)pattern;
- (void)setSharpness:(double)sharpness;
@end

@implementation PHASECardioidDirectivityModelSubbandParameters

- (PHASECardioidDirectivityModelSubbandParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASECardioidDirectivityModelSubbandParameters;
  result = [(PHASECardioidDirectivityModelSubbandParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_frequency = xmmword_2220E73B0;
    result->_sharpness = 1.0;
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

- (void)setPattern:(double)pattern
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_pattern = PHASEGetPropertyBounded<double>(v8, v7, pattern, 0.0, 1.0);
}

- (void)setSharpness:(double)sharpness
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_sharpness = PHASEGetPropertyBounded<double>(v8, v7, sharpness, 1.0, 1.79769313e308);
}

- (double)frequency
{
  return self->_frequency;
}

- (double)pattern
{
  return self->_pattern;
}

- (double)sharpness
{
  return self->_sharpness;
}

@end