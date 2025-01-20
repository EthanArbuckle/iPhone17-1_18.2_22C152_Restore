@interface GKRidgedNoiseSource
+ (GKRidgedNoiseSource)ridgedNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed;
- (GKRidgedNoiseSource)init;
- (GKRidgedNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed;
- (double)valueAt:(GKRidgedNoiseSource *)self;
- (id)cloneModule;
@end

@implementation GKRidgedNoiseSource

+ (GKRidgedNoiseSource)ridgedNoiseSourceWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFrequency:octaveCount octaveCount:*(void *)&seed lacunarity:frequency seed:lacunarity];

  return (GKRidgedNoiseSource *)v6;
}

- (GKRidgedNoiseSource)init
{
  return [(GKRidgedNoiseSource *)self initWithFrequency:6 octaveCount:0 lacunarity:1.0 seed:2.0];
}

- (GKRidgedNoiseSource)initWithFrequency:(double)frequency octaveCount:(NSInteger)octaveCount lacunarity:(double)lacunarity seed:(int32_t)seed
{
  uint64_t v6 = *(void *)&seed;
  v52.receiver = self;
  v52.super_class = (Class)GKRidgedNoiseSource;
  v10 = [(GKRidgedNoiseSource *)&v52 init];
  v11 = v10;
  if (v10)
  {
    [(GKCoherentNoiseSource *)v10 setFrequency:frequency];
    [(GKCoherentNoiseSource *)v11 setOctaveCount:octaveCount];
    [(GKCoherentNoiseSource *)v11 setLacunarity:lacunarity];
    [(GKCoherentNoiseSource *)v11 setSeed:v6];
    v11->m_weights[0] = 1.0;
    v11->m_weights[1] = 1.0 / lacunarity;
    v11->m_weights[2] = 1.0 / (lacunarity * lacunarity);
    double v12 = lacunarity * lacunarity * lacunarity;
    double v13 = 1.0 / v12;
    double v14 = v12 * lacunarity;
    v11->m_weights[3] = v13;
    v11->m_weights[4] = 1.0 / v14;
    double v15 = v14 * lacunarity;
    double v16 = 1.0 / v15;
    double v17 = v15 * lacunarity;
    v11->m_weights[5] = v16;
    v11->m_weights[6] = 1.0 / v17;
    double v18 = v17 * lacunarity;
    double v19 = 1.0 / v18;
    double v20 = v18 * lacunarity;
    v11->m_weights[7] = v19;
    v11->m_weights[8] = 1.0 / v20;
    double v21 = v20 * lacunarity;
    double v22 = 1.0 / v21;
    double v23 = v21 * lacunarity;
    v11->m_weights[9] = v22;
    v11->m_weights[10] = 1.0 / v23;
    double v24 = v23 * lacunarity;
    double v25 = 1.0 / v24;
    double v26 = v24 * lacunarity;
    v11->m_weights[11] = v25;
    v11->m_weights[12] = 1.0 / v26;
    double v27 = v26 * lacunarity;
    double v28 = 1.0 / v27;
    double v29 = v27 * lacunarity;
    v11->m_weights[13] = v28;
    v11->m_weights[14] = 1.0 / v29;
    double v30 = v29 * lacunarity;
    double v31 = 1.0 / v30;
    double v32 = v30 * lacunarity;
    v11->m_weights[15] = v31;
    v11->m_weights[16] = 1.0 / v32;
    double v33 = v32 * lacunarity;
    double v34 = 1.0 / v33;
    double v35 = v33 * lacunarity;
    v11->m_weights[17] = v34;
    v11->m_weights[18] = 1.0 / v35;
    double v36 = v35 * lacunarity;
    double v37 = 1.0 / v36;
    double v38 = v36 * lacunarity;
    v11->m_weights[19] = v37;
    v11->m_weights[20] = 1.0 / v38;
    double v39 = v38 * lacunarity;
    double v40 = 1.0 / v39;
    double v41 = v39 * lacunarity;
    v11->m_weights[21] = v40;
    v11->m_weights[22] = 1.0 / v41;
    double v42 = v41 * lacunarity;
    double v43 = 1.0 / v42;
    double v44 = v42 * lacunarity;
    v11->m_weights[23] = v43;
    v11->m_weights[24] = 1.0 / v44;
    double v45 = v44 * lacunarity;
    double v46 = 1.0 / v45;
    double v47 = v45 * lacunarity;
    v11->m_weights[25] = v46;
    v11->m_weights[26] = 1.0 / v47;
    double v48 = v47 * lacunarity;
    double v49 = 1.0 / v48;
    double v50 = v48 * lacunarity;
    v11->m_weights[27] = v49;
    v11->m_weights[28] = 1.0 / v50;
    v11->m_weights[29] = 1.0 / (v50 * lacunarity);
  }
  return v11;
}

- (double)valueAt:(GKRidgedNoiseSource *)self
{
  float64x2_t v14 = *v2;
  float64x2_t v16 = v2[1];
  [(GKCoherentNoiseSource *)self frequency];
  float64x2_t v13 = v4;
  if ([(GKCoherentNoiseSource *)self octaveCount] < 1) {
    return -1.0;
  }
  NSInteger v5 = 0;
  float64x2_t v15 = vmulq_n_f64(v14, v13.f64[0]);
  float64x2_t v17 = vmulq_f64(v13, v16);
  double v6 = 1.0;
  double v7 = 0.0;
  do
  {
    __int16 v8 = [(GKCoherentNoiseSource *)self seed];
    v18[0] = v15;
    v18[1] = v17;
    double v9 = fabs(getGradientCoherentNoise((double *)v18, (unsigned __int16)v5 + v8));
    double v10 = (1.0 - v9) * (1.0 - v9) * v6;
    double v6 = fmax(fmin(v10 + v10, 1.0), 0.0);
    double v7 = v7 + v10 * self->m_weights[v5];
    [(GKCoherentNoiseSource *)self lacunarity];
    float64x2_t v15 = vmulq_n_f64(v15, v11.f64[0]);
    float64x2_t v17 = vmulq_f64(v11, v17);
    ++v5;
  }
  while ([(GKCoherentNoiseSource *)self octaveCount] > v5);
  return v7 * 1.25 + -1.0;
}

- (id)cloneModule
{
  [(GKCoherentNoiseSource *)self frequency];
  double v4 = v3;
  NSInteger v5 = [(GKCoherentNoiseSource *)self octaveCount];
  [(GKCoherentNoiseSource *)self lacunarity];
  double v7 = v6;
  uint64_t v8 = [(GKCoherentNoiseSource *)self seed];

  return +[GKRidgedNoiseSource ridgedNoiseSourceWithFrequency:v5 octaveCount:v8 lacunarity:v4 seed:v7];
}

@end