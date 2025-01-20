@interface GKNoiseMap
+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise;
+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless;
- (BOOL)isSeamless;
- (GKNoiseMap)init;
- (GKNoiseMap)initWithNoise:(GKNoise *)noise;
- (GKNoiseMap)initWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless;
- (NSDictionary)gradientColors;
- (float)interpolatedValueAtPosition:(vector_float2)position;
- (float)valueAtPosition:(vector_int2)position;
- (id)__colorData;
- (int)mapIndexX:(int)a3 y:(int)a4;
- (vector_double2)origin;
- (vector_double2)size;
- (vector_int2)sampleCount;
- (void)dealloc;
- (void)setGradientColors:(id)a3;
- (void)setValue:(float)value atPosition:(vector_int2)position;
@end

@implementation GKNoiseMap

- (int)mapIndexX:(int)a3 y:(int)a4
{
  return a3 + *(void *)&self->_sampleCount[7] * a4;
}

- (GKNoiseMap)init
{
  v3 = objc_opt_new();
  v4 = +[GKNoise noiseWithNoiseSource:v3];

  v5 = [(GKNoiseMap *)self initWithNoise:v4];
  return v5;
}

+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise
{
  v3 = noise;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNoise:v3];

  return (GKNoiseMap *)v4;
}

+ (GKNoiseMap)noiseMapWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless
{
  BOOL v7 = seamless;
  double v12 = size.f64[0];
  double v13 = origin.f64[0];
  v9 = noise;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNoise:v9 size:v7 origin:v12 sampleCount:v13 seamless:*(double *)&sampleCount];

  return (GKNoiseMap *)v10;
}

- (GKNoiseMap)initWithNoise:(GKNoise *)noise
{
  __asm { FMOV            V0.2D, #1.0 }
  return [(GKNoiseMap *)self initWithNoise:noise size:0 origin:*(double *)&_Q0 sampleCount:0.0 seamless:COERCE_DOUBLE(0x6400000064)];
}

- (GKNoiseMap)initWithNoise:(GKNoise *)noise size:(vector_double2)size origin:(vector_double2)origin sampleCount:(vector_int2)sampleCount seamless:(BOOL)seamless
{
  v10 = noise;
  v19.receiver = self;
  v19.super_class = (Class)GKNoiseMap;
  v11 = [(GKNoiseMap *)&v19 init];
  double v12 = v11;
  if (v11)
  {
    *(vector_double2 *)v11->_size = size;
    *(vector_double2 *)v11->_origin = origin;
    *(vector_int2 *)&v11->_sampleCount[7] = sampleCount;
    v11->_seamless = seamless;
    uint64_t v13 = [(GKNoise *)v10 gradientColors];
    gradientColors = v12->_gradientColors;
    v12->_gradientColors = (NSDictionary *)v13;

    v15 = [(GKNoise *)v10 __modules];
    [v15 lastObject];
    objc_claimAutoreleasedReturnValue();

    operator new[]();
  }

  return 0;
}

- (void)dealloc
{
  map = self->_map;
  if (map) {
    MEMORY[0x237DF7C80](map, 0x1000C8052888210);
  }
  self->_map = 0;
  v4.receiver = self;
  v4.super_class = (Class)GKNoiseMap;
  [(GKNoiseMap *)&v4 dealloc];
}

- (id)__colorData
{
}

uint64_t __25__GKNoiseMap___colorData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 >= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (float)valueAtPosition:(vector_int2)position
{
  int v4 = position.i32[0];
  int v5 = HIDWORD(*(void *)&self->_sampleCount[7]);
  if (position.i32[0] >= (int)(*(void *)&self->_sampleCount[7] - 1)) {
    int v4 = *(void *)&self->_sampleCount[7] - 1;
  }
  if (position.i32[1] >= v5 - 1) {
    int v6 = v5 - 1;
  }
  else {
    int v6 = position.i32[1];
  }
  int v7 = [(GKNoiseMap *)self mapIndexX:v4 & ~(v4 >> 31) y:v6 & ~(v6 >> 31)];
  float v8 = self->_map[v7];
  float result = -1.0;
  if (v8 >= -1.0)
  {
    float result = self->_map[v7];
    if (v8 > 1.0) {
      return 1.0;
    }
  }
  return result;
}

- (float)interpolatedValueAtPosition:(vector_float2)position
{
  int32x2_t v4 = vadd_s32(*(int32x2_t *)&self->_sampleCount[7], (int32x2_t)-1);
  v5.i64[0] = v4.i32[0];
  v5.i64[1] = v4.i32[1];
  float32x2_t v6 = vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32((float32x2_t)position), vcvtq_f64_s64(v5)), (float64x2_t)0));
  float32x2_t v7 = vrnda_f32(v6);
  int32x2_t v8 = vcge_f32(vabd_f32(v6, v7), (float32x2_t)0x3400000034000000);
  if (((v8.i32[0] | v8.i32[1]) & 1) == 0)
  {
    float v21 = self->_map[[(GKNoiseMap *)self mapIndexX:(int)v7.f32[0] y:(int)v7.f32[1]]];
    return fmax(fmin(v21, 1.0), -1.0);
  }
  if ((v8.i8[0] & 1) == 0)
  {
    uint64_t v22 = (int)v7.f32[0];
    uint64_t v23 = ((int)v6.f32[1] + 1);
    float v24 = truncf(v6.f32[1]);
    float v25 = v6.f32[1] - v24;
    float v26 = (float)(int)v23 - v24;
    int v27 = -[GKNoiseMap mapIndexX:y:](self, "mapIndexX:y:", v22);
    int v28 = [(GKNoiseMap *)self mapIndexX:v22 y:v23];
    map = self->_map;
    float v30 = map[v27];
LABEL_8:
    float v21 = (float)((float)((float)(map[v28] - v30) * v25) / v26) + v30;
    return fmax(fmin(v21, 1.0), -1.0);
  }
  uint64_t v9 = (int)v6.f32[0];
  uint64_t v10 = (v9 + 1);
  if ((v8.i8[4] & 1) == 0)
  {
    uint64_t v31 = (int)v7.f32[1];
    float v25 = v6.f32[0] - (float)(int)v9;
    float v26 = (float)(int)v10 - (float)(int)v9;
    int v32 = [(GKNoiseMap *)self mapIndexX:v9 y:v31];
    int v28 = [(GKNoiseMap *)self mapIndexX:v10 y:v31];
    map = self->_map;
    float v30 = map[v32];
    goto LABEL_8;
  }
  float v11 = v6.f32[1];
  uint64_t v12 = (int)v6.f32[1];
  uint64_t v13 = (v12 + 1);
  float v14 = (float)(v6.f32[0] - (float)(int)v9) / (float)((float)(int)v10 - (float)(int)v9);
  int v15 = [(GKNoiseMap *)self mapIndexX:v9 y:v12];
  LODWORD(v12) = [(GKNoiseMap *)self mapIndexX:(v9 + 1) y:v12];
  int v16 = [(GKNoiseMap *)self mapIndexX:v9 y:v13];
  int v17 = [(GKNoiseMap *)self mapIndexX:v10 y:v13];
  v18 = self->_map;
  float v19 = (float)(v18[v15] * (float)(1.0 - v14)) + (float)(v18[(int)v12] * v14);
  float v20 = truncf(v11);
  float v21 = (float)((float)((float)((float)(v18[v17] * v14) - (float)(v19 - (float)(v18[v16] * (float)(1.0 - v14))))
                      * (float)(v11 - v20))
              / (float)((float)(int)v13 - v20))
      + v19;
  return fmax(fmin(v21, 1.0), -1.0);
}

- (void)setValue:(float)value atPosition:(vector_int2)position
{
  int v4 = position.i32[0];
  int v5 = HIDWORD(*(void *)&self->_sampleCount[7]);
  if (position.i32[0] >= (int)(*(void *)&self->_sampleCount[7] - 1)) {
    int v4 = *(void *)&self->_sampleCount[7] - 1;
  }
  if (position.i32[1] >= v5 - 1) {
    int v6 = v5 - 1;
  }
  else {
    int v6 = position.i32[1];
  }
  self->_map[[(GKNoiseMap *)self mapIndexX:v4 & ~(v4 >> 31) y:v6 & ~(v6 >> 31)]] = value;
}

- (vector_double2)size
{
  return *(vector_double2 *)self->_size;
}

- (vector_double2)origin
{
  return *(vector_double2 *)self->_origin;
}

- (vector_int2)sampleCount
{
  return *(vector_int2 *)&self->_sampleCount[7];
}

- (BOOL)isSeamless
{
  return self->_seamless;
}

- (NSDictionary)gradientColors
{
  return self->_gradientColors;
}

- (void)setGradientColors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end