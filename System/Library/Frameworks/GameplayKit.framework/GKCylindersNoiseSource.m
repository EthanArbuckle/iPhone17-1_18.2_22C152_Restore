@interface GKCylindersNoiseSource
+ (GKCylindersNoiseSource)cylindersNoiseWithFrequency:(double)frequency;
- (GKCylindersNoiseSource)init;
- (GKCylindersNoiseSource)initWithFrequency:(double)frequency;
- (double)frequency;
- (double)valueAt:(GKCylindersNoiseSource *)self;
- (id)cloneModule;
- (void)setFrequency:(double)frequency;
@end

@implementation GKCylindersNoiseSource

+ (GKCylindersNoiseSource)cylindersNoiseWithFrequency:(double)frequency
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:frequency];

  return (GKCylindersNoiseSource *)v3;
}

- (GKCylindersNoiseSource)init
{
  return [(GKCylindersNoiseSource *)self initWithFrequency:1.0];
}

- (GKCylindersNoiseSource)initWithFrequency:(double)frequency
{
  v7.receiver = self;
  v7.super_class = (Class)GKCylindersNoiseSource;
  v4 = [(GKCylindersNoiseSource *)&v7 init];
  v5 = v4;
  if (v4) {
    [(GKCylindersNoiseSource *)v4 setFrequency:frequency];
  }
  return v5;
}

- (double)valueAt:(GKCylindersNoiseSource *)self
{
  double v3 = sqrt(v2[2] * v2[2] + *v2 * *v2);
  [(GKCylindersNoiseSource *)self frequency];

  +[GKNoiseSourceUtils radialLerpValueForDistanceToOrigin:v3 frequency:v4];
  return result;
}

- (id)cloneModule
{
  [(GKCylindersNoiseSource *)self frequency];

  return +[GKCylindersNoiseSource cylindersNoiseWithFrequency:](GKCylindersNoiseSource, "cylindersNoiseWithFrequency:");
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