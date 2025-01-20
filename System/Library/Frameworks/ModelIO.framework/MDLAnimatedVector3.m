@interface MDLAnimatedVector3
- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)double3AtTime:(double)a3@<D0>;
- (unint64_t)precision;
- (vector_float3)float3AtTime:(NSTimeInterval)time;
- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble3:atTime:;
- (void)setFloat3:(vector_float3)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedVector3

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector3;
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
  if (sub_20B112C2C((uint64_t)v5) & 1) != 0 || (sub_20B1683FC((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B163548((uint64_t)v5);
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
  if (self->super._timeSampledData.__end_ == begin)
  {
LABEL_9:
    *(void *)(v3 + 8) = 0;
    goto LABEL_10;
  }
  v5[0] = 0;
  v5[1] = 0;
  sub_20B0A592C(v5, (void *)begin + 1);
  if (!sub_20B1683FC((uint64_t)v5))
  {
    if (sub_20B112C2C((uint64_t)v5))
    {
      *(void *)(v3 + 8) = (char *)&off_26BF50530 + 2;
      operator new();
    }
    if (sub_20B163548((uint64_t)v5))
    {
      *(void *)(v3 + 8) = (char *)&off_26BF50478 + 2;
      operator new();
    }
    self = (MDLAnimatedVector3 *)sub_20B06A698((uint64_t)v5);
    goto LABEL_9;
  }
  *(_WORD *)(v3 + 4) = 0;
  *(_DWORD *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = (char *)&off_26BF505E8 + 3;
  self = (MDLAnimatedVector3 *)sub_20B06A698((uint64_t)v5);
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
  if ((sub_20B1683FC((uint64_t)v10) & 1) != 0
    || (sub_20B112C2C((uint64_t)v10) & 1) != 0
    || sub_20B163548((uint64_t)v10))
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
  if ((sub_20B1683FC((uint64_t)v10) & 1) != 0
    || (sub_20B112C2C((uint64_t)v10) & 1) != 0
    || sub_20B163548((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat3:(vector_float3)value atTime:(NSTimeInterval)time
{
}

- (void)setDouble3:atTime:
{
}

- (vector_float3)float3AtTime:(NSTimeInterval)time
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v11 = 0.0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  double v8 = 0.0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v11, (uint64_t)&v8, time);
  if (v13)
  {
    if ((sub_20B112C2C((uint64_t)&v12) & 1) != 0 || (char v4 = sub_20B168DD8((uint64_t)&v12), sub_20B120EA0(&v12, v4), v13))
    {
      sub_20B112EC4(&v12);
      if (self->super._interpolation)
      {
        if (v10)
        {
          if (v11 != v8)
          {
            if ((sub_20B112C2C((uint64_t)&v9) & 1) != 0
              || (v5 = sub_20B168DD8((uint64_t)&v9), sub_20B120EA0(&v9, v5), v10))
            {
              sub_20B112EC4(&v9);
            }
          }
        }
      }
    }
  }
  sub_20B06A698((uint64_t)&v9);
  uint64_t v6 = sub_20B06A698((uint64_t)&v12);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (uint64_t)double3AtTime:(double)a3@<D0>
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v26 = 0.0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  double v23 = 0.0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  sub_20B161000((double **)(a1 + 8), (uint64_t)&v26, (uint64_t)&v23, a3);
  if (!v28) {
    goto LABEL_11;
  }
  if ((sub_20B163548((uint64_t)&v27) & 1) == 0)
  {
    uint64_t v7 = sub_20B169074((uint64_t)&v27);
    sub_20B120EA0(&v27, v7);
    if (!v28) {
      goto LABEL_11;
    }
  }
  uint64_t v8 = sub_20B169100(&v27);
  int8x16_t v9 = *(int8x16_t *)v8;
  v6.f64[0] = *(float64_t *)(v8 + 16);
  float64x2_t v19 = v6;
  float64_t v21 = *(double *)v8;
  unint64_t v18 = vextq_s8(v9, v9, 8uLL).u64[0];
  if (*(void *)(a1 + 32))
  {
    if (v25)
    {
      if (v26 == v23) {
        goto LABEL_7;
      }
      if ((sub_20B163548((uint64_t)&v24) & 1) != 0
        || (double v11 = sub_20B169074((uint64_t)&v24), sub_20B120EA0(&v24, v11), v25))
      {
        uint64_t v12 = (float64x2_t *)sub_20B169100(&v24);
        v13.f64[0] = v12[1].f64[0];
        v14.f64[0] = fmax(fmin((a3 - v26) / (v23 - v26), 1.0), 0.0);
        v15.f64[0] = 1.0 - v14.f64[0];
        v16.f64[0] = v21;
        *(void *)&v16.f64[1] = v18;
        int8x16_t v9 = (int8x16_t)vmlaq_n_f64(vmulq_n_f64(*v12, v14.f64[0]), v16, 1.0 - v14.f64[0]);
        unint64_t v10 = vextq_s8(v9, v9, 8uLL).u64[0];
        float64x2_t v6 = vmlaq_f64(vmulq_f64(v14, v13), v19, v15);
        goto LABEL_12;
      }
    }
LABEL_11:
    v9.i64[0] = 0;
    unint64_t v10 = 0;
    v6.f64[0] = 0.0;
    goto LABEL_12;
  }
LABEL_7:
  unint64_t v10 = v18;
LABEL_12:
  *(float64_t *)(a2 + 16) = v6.f64[0];
  v9.i64[1] = v10;
  float64x2_t v20 = v6;
  int8x16_t v22 = v9;
  *(int8x16_t *)a2 = v9;
  sub_20B06A698((uint64_t)&v24);
  uint64_t result = sub_20B06A698((uint64_t)&v27);
  *(int8x16_t *)a2 = v22;
  *(float64x2_t *)(a2 + 16) = v20;
  return result;
}

- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      int8x16_t v9 = (TimeSampledVtValue *)((char *)end - 24);
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

- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      int8x16_t v9 = (TimeSampledVtValue *)((char *)end - 24);
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

- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B112C2C((uint64_t)v14);
      unint64_t v10 = (std::type_info *)v14;
      if ((v9 & 1) == 0) {
        unint64_t v10 = sub_20B168DD8((uint64_t)v14);
      }
      uint64_t v11 = sub_20B112EC4(v10);
      v12.i64[0] = *(void *)v11;
      v12.i32[2] = *(_DWORD *)(v11 + 8);
      *valuesArray++ = v12;
      sub_20B06A698((uint64_t)v14);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B163548((uint64_t)v14);
      unint64_t v10 = (std::type_info *)v14;
      if ((v9 & 1) == 0) {
        unint64_t v10 = sub_20B169074((uint64_t)v14);
      }
      uint64_t v11 = sub_20B169100(v10);
      *(void *)&long long v12 = *(void *)(v11 + 16);
      *(_OWORD *)valuesArray->f64 = *(_OWORD *)v11;
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