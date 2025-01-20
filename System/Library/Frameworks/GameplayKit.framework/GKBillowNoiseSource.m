@interface GKBillowNoiseSource
+ (GKBillowNoiseSource)billowNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed;
- (GKBillowNoiseSource)init;
- (GKBillowNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed;
- (double)persistence;
- (double)valueAt:(GKBillowNoiseSource *)self;
- (id)cloneModule;
- (void)setPersistence:(double)persistence;
@end

@implementation GKBillowNoiseSource

+ (GKBillowNoiseSource)billowNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:octaveCount octaveCount:*(void *)&seed persistence:frequency lacunarity:persistence seed:lacunarity];

  return (GKBillowNoiseSource *)v7;
}

- (GKBillowNoiseSource)init
{
  return [(GKBillowNoiseSource *)self initWithFrequency:6 octaveCount:0 persistence:1.0 lacunarity:0.5 seed:2.0];
}

- (GKBillowNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount persistence:(double)persistence lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v7 = *(void *)&seed;
  v15.receiver = self;
  v15.super_class = (Class)GKBillowNoiseSource;
  v12 = [(GKBillowNoiseSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(GKCoherentNoiseSource *)v12 setFrequency:frequency];
    [(GKCoherentNoiseSource *)v13 setOctaveCount:octaveCount];
    [(GKBillowNoiseSource *)v13 setPersistence:persistence];
    [(GKCoherentNoiseSource *)v13 setLacunarity:lacunarity];
    [(GKCoherentNoiseSource *)v13 setSeed:v7];
  }
  return v13;
}

- (double)valueAt:(GKBillowNoiseSource *)self
{
  float64x2_t v14 = *v2;
  float64x2_t v16 = v2[1];
  [(GKCoherentNoiseSource *)self frequency];
  float64x2_t v13 = v4;
  if ([(GKCoherentNoiseSource *)self octaveCount] < 1) {
    return 0.5;
  }
  NSInteger v5 = 0;
  float64x2_t v15 = vmulq_n_f64(v14, v13.f64[0]);
  float64x2_t v17 = vmulq_f64(v13, v16);
  double v6 = 0.0;
  double v7 = 1.0;
  do
  {
    __int16 v8 = [(GKCoherentNoiseSource *)self seed];
    v18[0] = v15;
    v18[1] = v17;
    double v9 = fabs(getGradientCoherentNoise((double *)v18, (unsigned __int16)v5 + v8));
    double v6 = v6 - (v7 - (v9 + v9) * v7);
    [(GKCoherentNoiseSource *)self lacunarity];
    float64x2_t v15 = vmulq_n_f64(v15, v10.f64[0]);
    float64x2_t v17 = vmulq_f64(v10, v17);
    [(GKBillowNoiseSource *)self persistence];
    double v7 = v11 * v7;
    ++v5;
  }
  while ([(GKCoherentNoiseSource *)self octaveCount] > v5);
  return v6 + 0.5;
}

- (id)cloneModule
{
  [(GKCoherentNoiseSource *)self frequency];
  double v4 = v3;
  NSInteger v5 = [(GKCoherentNoiseSource *)self octaveCount];
  [(GKBillowNoiseSource *)self persistence];
  double v7 = v6;
  [(GKCoherentNoiseSource *)self lacunarity];
  double v9 = v8;
  uint64_t v10 = [(GKCoherentNoiseSource *)self seed];

  return +[GKBillowNoiseSource billowNoiseSourceWithFrequency:v5 octaveCount:v10 persistence:v4 lacunarity:v7 seed:v9];
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