@interface GKSpheresNoiseSource
+ (GKSpheresNoiseSource)spheresNoiseWithFrequency:(double)frequency;
- (GKSpheresNoiseSource)init;
- (GKSpheresNoiseSource)initWithFrequency:(double)frequency;
- (double)frequency;
- (double)valueAt:(GKSpheresNoiseSource *)self;
- (id)cloneModule;
- (void)setFrequency:(double)frequency;
@end

@implementation GKSpheresNoiseSource

+ (GKSpheresNoiseSource)spheresNoiseWithFrequency:(double)frequency
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:frequency];

  return (GKSpheresNoiseSource *)v3;
}

- (GKSpheresNoiseSource)init
{
  return [(GKSpheresNoiseSource *)self initWithFrequency:1.0];
}

- (GKSpheresNoiseSource)initWithFrequency:(double)frequency
{
  v7.receiver = self;
  v7.super_class = (Class)GKSpheresNoiseSource;
  v4 = [(GKSpheresNoiseSource *)&v7 init];
  v5 = v4;
  if (v4) {
    [(GKSpheresNoiseSource *)v4 setFrequency:frequency];
  }
  return v5;
}

- (double)valueAt:(GKSpheresNoiseSource *)self
{
  double v3 = sqrt(vaddvq_f64(vmulq_f64(*v2, *v2)) + v2[1].f64[0] * v2[1].f64[0]);
  [(GKSpheresNoiseSource *)self frequency];

  +[GKNoiseSourceUtils radialLerpValueForDistanceToOrigin:v3 frequency:v4];
  return result;
}

- (id)cloneModule
{
  [(GKSpheresNoiseSource *)self frequency];

  return +[GKSpheresNoiseSource spheresNoiseWithFrequency:](GKSpheresNoiseSource, "spheresNoiseWithFrequency:");
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

@end