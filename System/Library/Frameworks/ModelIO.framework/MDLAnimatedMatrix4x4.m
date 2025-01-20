@interface MDLAnimatedMatrix4x4
- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time;
- (uint64_t)double4x4AtTime:(double)a3@<D0>;
- (unint64_t)precision;
- (void)resetWithDouble4x4Array:(const matrix_double4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloat4x4Array:(const matrix_float4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble4x4:atTime:;
- (void)setFloat4x4:(matrix_float4x4)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedMatrix4x4

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedMatrix4x4;
  return [(MDLAnimatedValue *)&v4 copyWithZone:a3];
}

- (unint64_t)precision
{
  v5[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin) {
    return 0;
  }
  v5[0] = 0;
  v5[1] = 0;
  sub_20B0A592C(v5, (void *)begin + 1);
  if (sub_20B16C03C((uint64_t)v5) & 1) != 0 || (sub_20B16C03C((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B16C074((uint64_t)v5);
  sub_20B06A698((uint64_t)v5);
  if ((v4 & 1) == 0) {
    return 0;
  }
  else {
    return 2;
  }
}

- (VtValue)defaultVtValue
{
  uint64_t v3 = v2;
  v5[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v5[0] = 0;
    v5[1] = 0;
    sub_20B0A592C(v5, (void *)begin + 1);
    if (sub_20B16C03C((uint64_t)v5))
    {
      *(void *)(v3 + 8) = (char *)&off_26BF4FEB8 + 2;
      operator new();
    }
    if (sub_20B16C03C((uint64_t)v5))
    {
      *(void *)(v3 + 8) = (char *)&off_26BF4FEB8 + 2;
      operator new();
    }
    if (sub_20B16C074((uint64_t)v5))
    {
      *(void *)(v3 + 8) = (char *)&off_26BF4FE00 + 2;
      operator new();
    }
    self = (MDLAnimatedMatrix4x4 *)sub_20B06A698((uint64_t)v5);
  }
  *(void *)(v3 + 8) = 0;
  result._info._ptrAndBits = (_TypeInfo *)a2;
  result._storage = (type)self;
  return result;
}

- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTimeSamples();
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      v7 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v7;
    }
    while (v7 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  sub_20B160100((uint64_t *)&self->super._timeSampledData, 0);
  v10[0] = 0;
  v10[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_20B16C03C((uint64_t)v10) & 1) != 0
    || (sub_20B16C03C((uint64_t)v10) & 1) != 0
    || sub_20B16C074((uint64_t)v10))
  {
    uint64_t v8 = 0;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  v10[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_20B16C03C((uint64_t)v10) & 1) != 0
    || (sub_20B16C03C((uint64_t)v10) & 1) != 0
    || sub_20B16C074((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat4x4:(matrix_float4x4)value atTime:(NSTimeInterval)time
{
}

- (void)setDouble4x4:atTime:
{
}

- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v21 = 0.0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  double v18 = 0.0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v21, (uint64_t)&v18, time);
  if (!v23)
  {
    float32x4_t v16 = 0u;
    float32x4_t v17 = 0u;
    float32x4_t v14 = 0u;
    float32x4_t v15 = 0u;
    goto LABEL_12;
  }
  if ((sub_20B16C03C((uint64_t)&v22) & 1) == 0)
  {
    v5 = sub_20B16CB1C((uint64_t)&v22);
    sub_20B120EA0(&v22, v5);
    if (!v23) {
      goto LABEL_11;
    }
  }
  v6 = (float32x4_t *)sub_20B16CBA8(&v22);
  float32x4_t v16 = v6[1];
  float32x4_t v17 = *v6;
  float32x4_t v14 = v6[3];
  float32x4_t v15 = v6[2];
  if (self->super._interpolation)
  {
    if (!v20) {
      goto LABEL_11;
    }
    if (v21 != v18)
    {
      if ((sub_20B16C03C((uint64_t)&v19) & 1) != 0 || (v7 = sub_20B16CB1C((uint64_t)&v19), sub_20B120EA0(&v19, v7), v20))
      {
        double v8 = (float32x4_t *)sub_20B16CBA8(&v19);
        float v9 = fmax(fmin((time - v21) / (v18 - v21), 1.0), 0.0);
        float32x4_t v16 = vmlaq_n_f32(vmulq_n_f32(v8[1], v9), v16, 1.0 - v9);
        float32x4_t v17 = vmlaq_n_f32(vmulq_n_f32(*v8, v9), v17, 1.0 - v9);
        float32x4_t v14 = vmlaq_n_f32(vmulq_n_f32(v8[3], v9), v14, 1.0 - v9);
        float32x4_t v15 = vmlaq_n_f32(vmulq_n_f32(v8[2], v9), v15, 1.0 - v9);
        goto LABEL_12;
      }
LABEL_11:
      float32x4_t v16 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
      float32x4_t v17 = *(float32x4_t *)MEMORY[0x263EF89A8];
      float32x4_t v14 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
      float32x4_t v15 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    }
  }
LABEL_12:
  sub_20B06A698((uint64_t)&v19);
  sub_20B06A698((uint64_t)&v22);
  simd_float4 v11 = (simd_float4)v16;
  simd_float4 v10 = (simd_float4)v17;
  simd_float4 v13 = (simd_float4)v14;
  simd_float4 v12 = (simd_float4)v15;
  result.columns[3] = v13;
  result.columns[2] = v12;
  result.columns[1] = v11;
  result.columns[0] = v10;
  return result;
}

- (uint64_t)double4x4AtTime:(double)a3@<D0>
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  double v45 = 0.0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  double v42 = 0.0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  sub_20B161000((double **)(a1 + 8), (uint64_t)&v45, (uint64_t)&v42, a3);
  if (v47)
  {
    if ((sub_20B16C074((uint64_t)&v46) & 1) != 0 || (v6 = sub_20B16CF60((uint64_t)&v46), sub_20B120EA0(&v46, v6), v47))
    {
      v7 = (float64x2_t *)sub_20B16CFEC(&v46);
      float64x2_t v8 = v7[1];
      float64x2_t v9 = v7[2];
      float64x2_t v10 = v7[3];
      float64x2_t v11 = v7[4];
      float64x2_t v12 = v7[5];
      float64x2_t v13 = v7[6];
      float64x2_t v14 = v7[7];
      if (!*(void *)(a1 + 32))
      {
LABEL_9:
        *a2 = *v7;
        a2[1] = v8;
        a2[2] = v9;
        a2[3] = v10;
        a2[4] = v11;
        a2[5] = v12;
        a2[6] = v13;
        a2[7] = v14;
        goto LABEL_14;
      }
      float64x2_t v34 = *v7;
      float64x2_t v35 = v7[1];
      float64x2_t v36 = v7[3];
      float64x2_t v37 = v7[2];
      float64x2_t v38 = v7[4];
      float64x2_t v39 = v7[5];
      float64x2_t v40 = v7[6];
      float64x2_t v41 = v7[7];
      if (v44)
      {
        if (v45 == v42) {
          goto LABEL_9;
        }
        if ((sub_20B16C074((uint64_t)&v43) & 1) != 0
          || (float32x4_t v15 = sub_20B16CF60((uint64_t)&v43), sub_20B120EA0(&v43, v15), v44))
        {
          uint64_t v16 = sub_20B16CFEC(&v43);
          float64x2_t v17 = *(float64x2_t *)(v16 + 32);
          float64x2_t v18 = *(float64x2_t *)(v16 + 64);
          float64x2_t v19 = *(float64x2_t *)(v16 + 96);
          double v20 = fmax(fmin((a3 - v45) / (v42 - v45), 1.0), 0.0);
          float v21 = 1.0 - v20;
          double v22 = v21;
          *(float *)&double v20 = v20;
          double v23 = *(float *)&v20;
          float64x2_t v24 = vmulq_n_f64(*(float64x2_t *)(v16 + 16), v23);
          float64x2_t v25 = vmulq_n_f64(*(float64x2_t *)(v16 + 48), v23);
          float64x2_t v26 = vmulq_n_f64(*(float64x2_t *)(v16 + 80), v23);
          float64x2_t v27 = vmulq_n_f64(*(float64x2_t *)(v16 + 112), v23);
          *a2 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)v16, v23), v34, v22);
          a2[1] = vmlaq_n_f64(v24, v35, v22);
          a2[2] = vmlaq_n_f64(vmulq_n_f64(v17, v23), v37, v22);
          a2[3] = vmlaq_n_f64(v25, v36, v22);
          a2[4] = vmlaq_n_f64(vmulq_n_f64(v18, v23), v38, v22);
          a2[5] = vmlaq_n_f64(v26, v39, v22);
          a2[6] = vmlaq_n_f64(vmulq_n_f64(v19, v23), v40, v22);
          a2[7] = vmlaq_n_f64(v27, v41, v22);
          goto LABEL_14;
        }
      }
    }
    v28 = (float64x2_t *)MEMORY[0x263EF8990];
    float64x2_t v29 = *(float64x2_t *)(MEMORY[0x263EF8990] + 80);
    a2[4] = *(float64x2_t *)(MEMORY[0x263EF8990] + 64);
    a2[5] = v29;
    float64x2_t v30 = v28[7];
    a2[6] = v28[6];
    a2[7] = v30;
    float64x2_t v31 = v28[1];
    *a2 = *v28;
    a2[1] = v31;
    float64x2_t v32 = v28[3];
    a2[2] = v28[2];
    a2[3] = v32;
    goto LABEL_14;
  }
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  *a2 = 0u;
  a2[1] = 0u;
LABEL_14:
  sub_20B06A698((uint64_t)&v43);
  return sub_20B06A698((uint64_t)&v46);
}

- (void)resetWithFloat4x4Array:(const matrix_float4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      float64x2_t v9 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v9;
    }
    while (v9 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  if (count) {
    operator new();
  }
}

- (void)resetWithDouble4x4Array:(const matrix_double4x4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      float64x2_t v9 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v9;
    }
    while (v9 != begin);
  }
  self->super._timeSampledData.__end_ = begin;
  if (count) {
    operator new();
  }
}

- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v15[2] = *MEMORY[0x263EF8340];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount) {
    unint64_t v4 = maxCount;
  }
  else {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  }
  if (v4)
  {
    uint64_t v6 = 0;
    v7 = &valuesArray->columns[2];
    unint64_t v8 = v4;
    do
    {
      v15[0] = 0;
      v15[1] = 0;
      sub_20B0A592C(v15, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v6 + 8));
      if (sub_20B16C03C((uint64_t)v15))
      {
        float64x2_t v9 = (simd_float4 *)sub_20B16CBA8(v15);
      }
      else
      {
        float64x2_t v10 = sub_20B16CB1C((uint64_t)v15);
        float64x2_t v9 = (simd_float4 *)sub_20B16CBA8(v10);
      }
      simd_float4 v11 = v9[1];
      simd_float4 v12 = v9[2];
      simd_float4 v13 = v9[3];
      v7[-2] = *v9;
      v7[-1] = v11;
      simd_float4 *v7 = v12;
      v7[1] = v13;
      v7 += 4;
      sub_20B06A698((uint64_t)v15);
      v6 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v19[2] = *MEMORY[0x263EF8340];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount) {
    unint64_t v4 = maxCount;
  }
  else {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  }
  if (v4)
  {
    uint64_t v6 = 0;
    v7 = &valuesArray->columns[2];
    unint64_t v8 = v4;
    do
    {
      v19[0] = 0;
      v19[1] = 0;
      sub_20B0A592C(v19, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v6 + 8));
      if (sub_20B16C074((uint64_t)v19))
      {
        float64x2_t v9 = (_OWORD *)sub_20B16CFEC(v19);
      }
      else
      {
        float64x2_t v10 = sub_20B16CF60((uint64_t)v19);
        float64x2_t v9 = (_OWORD *)sub_20B16CFEC(v10);
      }
      long long v11 = v9[1];
      long long v12 = v9[2];
      long long v13 = v9[3];
      long long v14 = v9[4];
      long long v15 = v9[5];
      long long v16 = v9[6];
      long long v17 = v9[7];
      *(_OWORD *)v7[-2].f64 = *v9;
      *(_OWORD *)&v7[-2].f64[2] = v11;
      *(_OWORD *)v7[-1].f64 = v12;
      *(_OWORD *)&v7[-1].f64[2] = v13;
      *(_OWORD *)v7->f64 = v14;
      *(_OWORD *)&v7->f64[2] = v15;
      *(_OWORD *)v7[1].f64 = v16;
      *(_OWORD *)&v7[1].f64[2] = v17;
      sub_20B06A698((uint64_t)v19);
      v7 += 4;
      v6 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end