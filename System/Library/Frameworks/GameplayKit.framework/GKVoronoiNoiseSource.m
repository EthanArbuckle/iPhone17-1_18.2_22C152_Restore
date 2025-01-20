@interface GKVoronoiNoiseSource
+ (GKVoronoiNoiseSource)voronoiNoiseWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed;
- (BOOL)isDistanceEnabled;
- (GKVoronoiNoiseSource)init;
- (GKVoronoiNoiseSource)initWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed;
- (double)displacement;
- (double)frequency;
- (double)valueAt:(GKVoronoiNoiseSource *)self;
- (id)cloneModule;
- (int32_t)seed;
- (void)setDisplacement:(double)displacement;
- (void)setDistanceEnabled:(BOOL)distanceEnabled;
- (void)setFrequency:(double)frequency;
- (void)setSeed:(int32_t)seed;
@end

@implementation GKVoronoiNoiseSource

+ (GKVoronoiNoiseSource)voronoiNoiseWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:distanceEnabled displacement:*(void *)&seed distanceEnabled:frequency seed:displacement];

  return (GKVoronoiNoiseSource *)v6;
}

- (GKVoronoiNoiseSource)init
{
  return [(GKVoronoiNoiseSource *)self initWithFrequency:0 displacement:0 distanceEnabled:1.0 seed:1.0];
}

- (GKVoronoiNoiseSource)initWithFrequency:(double)frequency displacement:(double)displacement distanceEnabled:(BOOL)distanceEnabled seed:(int32_t)seed
{
  uint64_t v6 = *(void *)&seed;
  BOOL v7 = distanceEnabled;
  v13.receiver = self;
  v13.super_class = (Class)GKVoronoiNoiseSource;
  v10 = [(GKVoronoiNoiseSource *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(GKVoronoiNoiseSource *)v10 setFrequency:frequency];
    [(GKVoronoiNoiseSource *)v11 setDisplacement:displacement];
    [(GKVoronoiNoiseSource *)v11 setDistanceEnabled:v7];
    [(GKVoronoiNoiseSource *)v11 setSeed:v6];
  }
  return v11;
}

- (double)valueAt:(GKVoronoiNoiseSource *)self
{
  *(float32x2_t *)v3.f32 = vcvt_f32_f64(*v2);
  float32_t v5 = v2[1].f64[0];
  v3.f32[2] = v5;
  float32x4_t v14 = v3;
  [(GKVoronoiNoiseSource *)self frequency];
  float32_t v7 = v6;
  [(GKVoronoiNoiseSource *)self displacement];
  float v9 = v8;
  char v10 = [(GKVoronoiNoiseSource *)self isDistanceEnabled];
  unsigned int v11 = [(GKVoronoiNoiseSource *)self seed];
  v12.f32[0] = v7;
  return __voronoiNoise(v10, v11, v14, v12, v9);
}

- (id)cloneModule
{
  [(GKVoronoiNoiseSource *)self frequency];
  double v4 = v3;
  [(GKVoronoiNoiseSource *)self displacement];
  double v6 = v5;
  BOOL v7 = [(GKVoronoiNoiseSource *)self isDistanceEnabled];
  uint64_t v8 = [(GKVoronoiNoiseSource *)self seed];

  return +[GKVoronoiNoiseSource voronoiNoiseWithFrequency:v7 displacement:v8 distanceEnabled:v4 seed:v6];
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

- (double)displacement
{
  return self->_displacement;
}

- (void)setDisplacement:(double)displacement
{
  self->_displacement = displacement;
}

- (BOOL)isDistanceEnabled
{
  return self->_distanceEnabled;
}

- (void)setDistanceEnabled:(BOOL)distanceEnabled
{
  self->_distanceEnabled = distanceEnabled;
}

- (int32_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int32_t)seed
{
  self->_seed = seed;
}

@end