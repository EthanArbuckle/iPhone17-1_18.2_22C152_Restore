@interface BLSHLocalOnlyServiceConfiguration
+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4;
+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6;
- (BLSHLocalOnlyServiceConfiguration)init;
- (BLSHLocalOnlyServiceConfiguration)initWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6;
- (double)dimmingDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (float)dimmedFactor;
@end

@implementation BLSHLocalOnlyServiceConfiguration

+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6
{
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a6;
  v12 = (void *)[v10 initWithFadeInDuration:a3 fadeOutDuration:a4 dimmingDuration:a5 dimmedFactor:v11];

  return v12;
}

+ (id)configurationWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4
{
  id v6 = objc_alloc((Class)a1);
  LODWORD(v7) = 1.0;
  v8 = (void *)[v6 initWithFadeInDuration:a3 fadeOutDuration:a4 dimmingDuration:0.1 dimmedFactor:v7];

  return v8;
}

- (BLSHLocalOnlyServiceConfiguration)initWithFadeInDuration:(double)a3 fadeOutDuration:(double)a4 dimmingDuration:(double)a5 dimmedFactor:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)BLSHLocalOnlyServiceConfiguration;
  result = [(BLSHLocalOnlyServiceConfiguration *)&v11 init];
  if (result)
  {
    result->_fadeInDuration = a3;
    result->_fadeOutDuration = a4;
    result->_dimmingDuration = a5;
    result->_dimmedFactor = a6;
  }
  return result;
}

- (BLSHLocalOnlyServiceConfiguration)init
{
  LODWORD(v2) = 1.0;
  return [(BLSHLocalOnlyServiceConfiguration *)self initWithFadeInDuration:0.1 fadeOutDuration:0.1 dimmingDuration:0.1 dimmedFactor:v2];
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (double)dimmingDuration
{
  return self->_dimmingDuration;
}

- (float)dimmedFactor
{
  return self->_dimmedFactor;
}

@end