@interface GKTurbulenceNoiseModifier
- (GKTurbulenceNoiseModifier)init;
- (GKTurbulenceNoiseModifier)initWithFrequency:(double)a3 power:(double)a4 roughness:(double)a5 seed:(int)a6;
- (GKTurbulenceNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKTurbulenceNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
- (void)dealloc;
@end

@implementation GKTurbulenceNoiseModifier

- (GKTurbulenceNoiseModifier)init
{
  return [(GKTurbulenceNoiseModifier *)self initWithFrequency:0 power:1.0 roughness:1.0 seed:1.0];
}

- (GKTurbulenceNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return [(GKTurbulenceNoiseModifier *)self initWithFrequency:0 power:1.0 roughness:1.0 seed:1.0];
}

- (GKTurbulenceNoiseModifier)initWithFrequency:(double)a3 power:(double)a4 roughness:(double)a5 seed:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v19.receiver = self;
  v19.super_class = (Class)GKTurbulenceNoiseModifier;
  v10 = [(GKNoiseModifier *)&v19 initWithInputModuleCount:1];
  v11 = v10;
  if (v10)
  {
    v10->_power = a4;
    v12 = [[GKPerlinNoiseSource alloc] initWithFrequency:(uint64_t)a5 octaveCount:v6 persistence:a3 lacunarity:0.5 seed:0.5];
    v13 = v11->_perlin[0];
    v11->_perlin[0] = v12;

    v14 = [[GKPerlinNoiseSource alloc] initWithFrequency:(uint64_t)a5 octaveCount:(v6 + 1) persistence:a3 lacunarity:0.5 seed:0.5];
    v15 = v11->_perlin[1];
    v11->_perlin[1] = v14;

    v16 = [[GKPerlinNoiseSource alloc] initWithFrequency:(uint64_t)a5 octaveCount:(v6 + 2) persistence:a3 lacunarity:0.5 seed:0.5];
    v17 = v11->_perlin[2];
    v11->_perlin[2] = v16;
  }
  return v11;
}

- (void)dealloc
{
  perlin = self->_perlin;
  v4 = self->_perlin[0];
  self->_perlin[0] = 0;

  v5 = perlin[1];
  perlin[1] = 0;

  uint64_t v6 = perlin[2];
  perlin[2] = 0;

  v7.receiver = self;
  v7.super_class = (Class)GKTurbulenceNoiseModifier;
  [(GKTurbulenceNoiseModifier *)&v7 dealloc];
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKTurbulenceNoiseModifier *)self
{
  float64x2_t v22 = *v2;
  float64x2_t v24 = v2[1];
  perlin = self->_perlin;
  uint64_t v6 = self->_perlin[0];
  v3.f64[0] = 0.8;
  v29[0] = vaddq_f64(*v2, (float64x2_t)xmmword_235F1F200);
  v29[1] = vaddq_f64(v24, v3);
  [(GKPerlinNoiseSource *)v6 valueAt:v29];
  float64_t v21 = v7;
  v8 = perlin[1];
  v9.f64[1] = v22.f64[1];
  v9.f64[0] = 0.15;
  v28[0] = vaddq_f64(v22, (float64x2_t)xmmword_235F1F210);
  v28[1] = vaddq_f64(v24, v9);
  [(GKPerlinNoiseSource *)v8 valueAt:v28];
  long long v20 = v10;
  v11 = perlin[2];
  v12.f64[1] = v22.f64[1];
  v12.f64[0] = 0.33;
  v27[0] = vaddq_f64(v22, (float64x2_t)xmmword_235F1F220);
  v27[1] = vaddq_f64(v24, v12);
  [(GKPerlinNoiseSource *)v11 valueAt:v27];
  v13.f64[1] = *((float64_t *)&v20 + 1);
  v14.f64[0] = v21;
  *(void *)&v14.f64[1] = v20;
  v13.f64[0] = self->_power;
  float64x2_t v23 = vmulq_f64(v13, v15);
  float64x2_t v25 = vmulq_n_f64(v14, v13.f64[0]);
  v16 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v26[0] = v25;
  v26[1] = v23;
  [v16 valueAt:v26];
  double v18 = v17;

  return v18;
}

- (id)cloneModule
{
  v2 = [[GKTurbulenceNoiseModifier alloc] initWithFrequency:self->_seed power:self->_frequency roughness:self->_power seed:self->_roughness];

  return v2;
}

- (void).cxx_destruct
{
  perlin = (id *)self->_perlin;
  objc_storeStrong((id *)&self->_perlin[2], 0);
  objc_storeStrong(perlin + 1, 0);

  objc_storeStrong(perlin, 0);
}

@end