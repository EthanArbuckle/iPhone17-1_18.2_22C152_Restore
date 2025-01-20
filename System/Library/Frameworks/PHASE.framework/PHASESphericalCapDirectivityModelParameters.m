@interface PHASESphericalCapDirectivityModelParameters
- (PHASESphericalCapDirectivityModelParameters)init;
- (double)capOpeningAngle;
- (double)sphereRadius;
- (void)setCapOpeningAngle:(double)a3;
- (void)setSphereRadius:(double)a3;
@end

@implementation PHASESphericalCapDirectivityModelParameters

- (PHASESphericalCapDirectivityModelParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASESphericalCapDirectivityModelParameters;
  result = [(PHASEDirectivityModelParameters *)&v3 initInternal];
  if (result)
  {
    result->_sphereRadius = 0.3;
    result->_capOpeningAngle = 30.0;
  }
  return result;
}

- (void)setSphereRadius:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_sphereRadius = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.001, 10.0);
}

- (void)setCapOpeningAngle:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_capOpeningAngle = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.01, 360.0);
}

- (double)sphereRadius
{
  return self->_sphereRadius;
}

- (double)capOpeningAngle
{
  return self->_capOpeningAngle;
}

@end