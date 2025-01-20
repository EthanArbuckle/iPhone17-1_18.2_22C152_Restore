@interface MDLAnimatedVector4
- (NSUInteger)getDouble4Array:(vector_double4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat4Array:(vector_float4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)double4AtTime:(double)a3@<D0>;
- (unint64_t)precision;
- (vector_float4)float4AtTime:(NSTimeInterval)time;
- (void)resetWithDouble4Array:(const vector_double4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloat4Array:(const vector_float4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble4:atTime:;
- (void)setFloat4:(vector_float4)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedVector4

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector4;
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
  if (sub_20B112C64((uint64_t)v5) & 1) != 0 || (sub_20B169784((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B1697BC((uint64_t)v5);
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
  v3 = v2;
  v5[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ == begin)
  {
LABEL_9:
    v3[1] = 0;
    goto LABEL_10;
  }
  v5[0] = 0;
  v5[1] = 0;
  sub_20B0A592C(v5, (void *)begin + 1);
  if (!sub_20B169784((uint64_t)v5))
  {
    if (sub_20B112C64((uint64_t)v5))
    {
      v3[1] = (char *)&off_26BF50758 + 2;
      operator new();
    }
    if (sub_20B1697BC((uint64_t)v5))
    {
      v3[1] = (char *)&off_26BF506A0 + 2;
      operator new();
    }
    self = (MDLAnimatedVector4 *)sub_20B06A698((uint64_t)v5);
    goto LABEL_9;
  }
  void *v3 = 0;
  v3[1] = (char *)&off_26BF50810 + 3;
  self = (MDLAnimatedVector4 *)sub_20B06A698((uint64_t)v5);
LABEL_10:
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
  if ((sub_20B169784((uint64_t)v10) & 1) != 0
    || (sub_20B112C64((uint64_t)v10) & 1) != 0
    || sub_20B1697BC((uint64_t)v10))
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
  if ((sub_20B169784((uint64_t)v10) & 1) != 0
    || (sub_20B112C64((uint64_t)v10) & 1) != 0
    || sub_20B1697BC((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat4:(vector_float4)value atTime:(NSTimeInterval)time
{
}

- (void)setDouble4:atTime:
{
}

- (vector_float4)float4AtTime:(NSTimeInterval)time
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v17 = 0.0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  double v14 = 0.0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v17, (uint64_t)&v14, time);
  vector_float4 v13 = 0u;
  if (v19)
  {
    if ((sub_20B112C64((uint64_t)&v18) & 1) != 0 || (v5 = sub_20B16A174((uint64_t)&v18), sub_20B120EA0(&v18, v5), v19))
    {
      v6 = (float32x4_t *)sub_20B112E30(&v18);
      float32x4_t v7 = *v6;
      if (!self->super._interpolation)
      {
LABEL_11:
        vector_float4 v13 = (vector_float4)v7;
        goto LABEL_12;
      }
      float32x4_t v12 = *v6;
      if (v16)
      {
        if (v17 == v14)
        {
          float32x4_t v7 = *v6;
          goto LABEL_11;
        }
        if ((sub_20B112C64((uint64_t)&v15) & 1) != 0
          || (double v8 = sub_20B16A174((uint64_t)&v15), sub_20B120EA0(&v15, v8), v16))
        {
          v9 = (float32x4_t *)sub_20B112E30(&v15);
          float v10 = fmax(fmin((time - v17) / (v14 - v17), 1.0), 0.0);
          float32x4_t v7 = vmlaq_n_f32(vmulq_n_f32(*v9, v10), v12, 1.0 - v10);
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:
  sub_20B06A698((uint64_t)&v15);
  sub_20B06A698((uint64_t)&v18);
  return v13;
}

- (uint64_t)double4AtTime:(double)a3@<D0>
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v19 = 0.0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  double v16 = 0.0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  sub_20B161000((double **)(a1 + 8), (uint64_t)&v19, (uint64_t)&v16, a3);
  if (!v21) {
    goto LABEL_12;
  }
  if ((sub_20B1697BC((uint64_t)&v20) & 1) == 0)
  {
    v6 = sub_20B16A3E8((uint64_t)&v20);
    sub_20B120EA0(&v20, v6);
    if (!v21) {
      goto LABEL_12;
    }
  }
  float32x4_t v7 = (float64x2_t *)sub_20B16A474(&v20);
  float64x2_t v8 = *v7;
  float64x2_t v15 = *v7;
  float64x2_t v9 = v7[1];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_13;
  }
  if (!v18) {
    goto LABEL_12;
  }
  float64x2_t v14 = v7[1];
  if (v19 != v16)
  {
    if ((sub_20B1697BC((uint64_t)&v17) & 1) != 0 || (float v10 = sub_20B16A3E8((uint64_t)&v17), sub_20B120EA0(&v17, v10), v18))
    {
      v11 = (float64x2_t *)sub_20B16A474(&v17);
      double v12 = fmax(fmin((a3 - v19) / (v16 - v19), 1.0), 0.0);
      float64x2_t v9 = vmlaq_n_f64(vmulq_n_f64(v11[1], v12), v14, 1.0 - v12);
      float64x2_t v8 = vmlaq_n_f64(vmulq_n_f64(*v11, v12), v15, 1.0 - v12);
      goto LABEL_13;
    }
LABEL_12:
    float64x2_t v8 = 0uLL;
    float64x2_t v9 = 0uLL;
    goto LABEL_13;
  }
  float64x2_t v9 = v7[1];
LABEL_13:
  *a2 = v8;
  a2[1] = v9;
  sub_20B06A698((uint64_t)&v17);
  return sub_20B06A698((uint64_t)&v20);
}

- (void)resetWithFloat4Array:(const vector_float4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
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

- (void)resetWithDouble4Array:(const vector_double4 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
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

- (NSUInteger)getFloat4Array:(vector_float4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v12[2] = *MEMORY[0x263EF8340];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount) {
    unint64_t v4 = maxCount;
  }
  else {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  }
  if (v4)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v4;
    do
    {
      v12[0] = 0;
      v12[1] = 0;
      sub_20B0A592C(v12, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      char v9 = sub_20B112C64((uint64_t)v12);
      float v10 = (std::type_info *)v12;
      if ((v9 & 1) == 0) {
        float v10 = sub_20B16A174((uint64_t)v12);
      }
      *valuesArray++ = *(vector_float4 *)sub_20B112E30(v10);
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble4Array:(vector_double4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v14[2] = *MEMORY[0x263EF8340];
  if (0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3) >= maxCount) {
    unint64_t v4 = maxCount;
  }
  else {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((self->super._timeSampledData.__end_ - self->super._timeSampledData.__begin_) >> 3);
  }
  if (v4)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v4;
    do
    {
      v14[0] = 0;
      v14[1] = 0;
      sub_20B0A592C(v14, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      char v9 = sub_20B1697BC((uint64_t)v14);
      float v10 = (std::type_info *)v14;
      if ((v9 & 1) == 0) {
        float v10 = sub_20B16A3E8((uint64_t)v14);
      }
      v11 = (_OWORD *)sub_20B16A474(v10);
      long long v12 = v11[1];
      *(_OWORD *)valuesArray->f64 = *v11;
      *(_OWORD *)&valuesArray->f64[2] = v12;
      ++valuesArray;
      sub_20B06A698((uint64_t)v14);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end