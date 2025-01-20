@interface PHASEGeometricSpreadingDistanceModelParameters
- (PHASEGeometricSpreadingDistanceModelParameters)init;
- (double)rolloffFactor;
- (void)setRolloffFactor:(double)rolloffFactor;
@end

@implementation PHASEGeometricSpreadingDistanceModelParameters

- (PHASEGeometricSpreadingDistanceModelParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEGeometricSpreadingDistanceModelParameters;
  result = [(PHASEDistanceModelParameters *)&v3 initInternal];
  if (result) {
    result->_rolloffFactor = 1.0;
  }
  return result;
}

- (void)setRolloffFactor:(double)rolloffFactor
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_rolloffFactor = PHASEGetPropertyBounded<double>(v8, v7, rolloffFactor, 0.0, 1.79769313e308);
}

- (double)rolloffFactor
{
  return self->_rolloffFactor;
}

@end