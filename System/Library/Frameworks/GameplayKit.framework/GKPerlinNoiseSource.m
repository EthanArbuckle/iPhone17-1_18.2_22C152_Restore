@interface GKPerlinNoiseSource
+ (GKPerlinNoiseSource)perlinNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed;
- (GKPerlinNoiseSource)init;
- (GKPerlinNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed;
- (double)persistence;
- (double)valueAt:(GKPerlinNoiseSource *)self;
- (id)cloneModule;
- (void)setPersistence:(double)persistence;
@end

@implementation GKPerlinNoiseSource

+ (GKPerlinNoiseSource)perlinNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:octaveCount octaveCount:*(void *)&seed persistence:frequency lacunarity:persistence seed:lacunarity];

  return (GKPerlinNoiseSource *)v7;
}

- (GKPerlinNoiseSource)init
{
  return [(GKPerlinNoiseSource *)self initWithFrequency:6 octaveCount:0 persistence:1.0 lacunarity:0.5 seed:2.0];
}

- (GKPerlinNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v7 = *(void *)&seed;
  v15.receiver = self;
  v15.super_class = (Class)GKPerlinNoiseSource;
  v12 = [(GKPerlinNoiseSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(GKCoherentNoiseSource *)v12 setFrequency:frequency];
    [(GKCoherentNoiseSource *)v13 setOctaveCount:octaveCount];
    [(GKPerlinNoiseSource *)v13 setPersistence:persistence];
    [(GKCoherentNoiseSource *)v13 setLacunarity:lacunarity];
    [(GKCoherentNoiseSource *)v13 setSeed:v7];
  }
  return v13;
}

- (double)valueAt:(GKPerlinNoiseSource *)self
{
  float64x2_t v13 = *v2;
  float64x2_t v15 = v2[1];
  [(GKCoherentNoiseSource *)self frequency];
  float64x2_t v12 = v4;
  if ([(GKCoherentNoiseSource *)self octaveCount] < 1) {
    return 0.0;
  }
  NSInteger v5 = 0;
  float64x2_t v14 = vmulq_n_f64(v13, v12.f64[0]);
  float64x2_t v16 = vmulq_f64(v12, v15);
  double v6 = 0.0;
  double v7 = 1.0;
  do
  {
    __int16 v8 = [(GKCoherentNoiseSource *)self seed];
    v17[0] = v14;
    v17[1] = v16;
    double v6 = v6 + getGradientCoherentNoise((double *)v17, (unsigned __int16)v5 + v8) * v7;
    [(GKCoherentNoiseSource *)self lacunarity];
    float64x2_t v14 = vmulq_n_f64(v14, v9.f64[0]);
    float64x2_t v16 = vmulq_f64(v9, v16);
    [(GKPerlinNoiseSource *)self persistence];
    double v7 = v10 * v7;
    ++v5;
  }
  while ([(GKCoherentNoiseSource *)self octaveCount] > v5);
  return v6;
}

- (id)cloneModule
{
  [(GKCoherentNoiseSource *)self frequency];
  double v4 = v3;
  NSInteger v5 = [(GKCoherentNoiseSource *)self octaveCount];
  [(GKPerlinNoiseSource *)self persistence];
  double v7 = v6;
  [(GKCoherentNoiseSource *)self lacunarity];
  double v9 = v8;
  uint64_t v10 = [(GKCoherentNoiseSource *)self seed];

  return +[GKPerlinNoiseSource perlinNoiseSourceWithFrequency:v5 octaveCount:v10 persistence:v4 lacunarity:v7 seed:v9];
}

- (double)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(double)persistence
{
  self->_persistence = persistence;
}

@end