@interface MDLAnimatedVector2
- (NSUInteger)getDouble2Array:(vector_double2 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat2Array:(vector_float2 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)precision;
- (vector_double2)double2AtTime:(NSTimeInterval)time;
- (vector_float2)float2AtTime:(NSTimeInterval)time;
- (void)resetWithDouble2Array:(const vector_double2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloat2Array:(const vector_float2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble2:(vector_double2)value atTime:(NSTimeInterval)time;
- (void)setFloat2:(vector_float2)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedVector2

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedVector2;
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
  if (sub_20B1670D0((uint64_t)v5) & 1) != 0 || (sub_20B167108((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B167140((uint64_t)v5);
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
  if (self->super._timeSampledData.__end_ == begin) {
    goto LABEL_10;
  }
  v5[0] = 0;
  v5[1] = 0;
  sub_20B0A592C(v5, (void *)begin + 1);
  if (!sub_20B167108((uint64_t)v5))
  {
    if (sub_20B1670D0((uint64_t)v5))
    {
      void *v3 = 0;
      v3[1] = (char *)&off_26BF50308 + 3;
      goto LABEL_8;
    }
    if (sub_20B167140((uint64_t)v5))
    {
      v3[1] = (char *)&off_26BF50250 + 2;
      operator new();
    }
    self = (MDLAnimatedVector2 *)sub_20B06A698((uint64_t)v5);
LABEL_10:
    v3[1] = 0;
    goto LABEL_11;
  }
  v3[1] = (char *)&off_26BF503C0 + 3;
  *(_DWORD *)v3 = 0;
LABEL_8:
  self = (MDLAnimatedVector2 *)sub_20B06A698((uint64_t)v5);
LABEL_11:
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
  if ((sub_20B167108((uint64_t)v10) & 1) != 0
    || (sub_20B1670D0((uint64_t)v10) & 1) != 0
    || sub_20B167140((uint64_t)v10))
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
  if ((sub_20B167108((uint64_t)v10) & 1) != 0
    || (sub_20B1670D0((uint64_t)v10) & 1) != 0
    || sub_20B167140((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat2:(vector_float2)value atTime:(NSTimeInterval)time
{
  v15[2] = *MEMORY[0x263EF8340];
  v15[1] = (char *)&off_26BF50308 + 3;
  v15[0] = value;
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    NSTimeInterval v12 = 0.0;
    v13[0] = 0;
    sub_20B0A592C(&v12, (void *)begin + 1);
    if ((sub_20B1670D0((uint64_t)&v12) & 1) == 0)
    {
      objc_msgSend_defaultVtValue(self, v8, v9);
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v14);
      v11 = sub_20B16D61C((pxrInternal__aapl__pxrReserved__::VtValue *)v15, Typeid);
      sub_20B120EA0(v15, v11);
      sub_20B06A698((uint64_t)v14);
    }
    sub_20B06A698((uint64_t)&v12);
  }
  NSTimeInterval v12 = time;
  sub_20B0A592C(v13, v15);
  sub_20B1605C8(p_timeSampledData, &v12);
  sub_20B06A698((uint64_t)v13);
  sub_20B06A698((uint64_t)v15);
}

- (void)setDouble2:(vector_double2)value atTime:(NSTimeInterval)time
{
}

- (vector_float2)float2AtTime:(NSTimeInterval)time
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v16 = 0.0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v13 = 0.0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v16, (uint64_t)&v13, time);
  vector_float2 v5 = 0;
  if (v18)
  {
    if ((sub_20B1670D0((uint64_t)&v17) & 1) != 0 || (v6 = sub_20B167A8C((uint64_t)&v17), sub_20B120EA0(&v17, v6), v18))
    {
      v7 = (float32x2_t *)sub_20B167B18((uint64_t)&v17);
      float32x2_t v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        vector_float2 v5 = (vector_float2)*v7;
        goto LABEL_8;
      }
      if (v15)
      {
        if (v16 == v13) {
          goto LABEL_7;
        }
        if ((sub_20B1670D0((uint64_t)&v14) & 1) != 0
          || (v10 = sub_20B167A8C((uint64_t)&v14), sub_20B120EA0(&v14, v10), v15))
        {
          v11 = (float32x2_t *)sub_20B167B18((uint64_t)&v14);
          float v12 = fmax(fmin((time - v16) / (v13 - v16), 1.0), 0.0);
          vector_float2 v5 = (vector_float2)vmla_n_f32(vmul_n_f32(*v11, v12), v8, 1.0 - v12);
        }
      }
    }
  }
LABEL_8:
  sub_20B06A698((uint64_t)&v14);
  sub_20B06A698((uint64_t)&v17);
  return v5;
}

- (vector_double2)double2AtTime:(NSTimeInterval)time
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v17 = 0.0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  double v14 = 0.0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v17, (uint64_t)&v14, time);
  vector_double2 v13 = 0u;
  if (v19)
  {
    if ((sub_20B167140((uint64_t)&v18) & 1) != 0 || (vector_float2 v5 = sub_20B167D58((uint64_t)&v18), sub_20B120EA0(&v18, v5), v19))
    {
      v6 = (float64x2_t *)sub_20B167DE4(&v18);
      float64x2_t v7 = *v6;
      if (!self->super._interpolation)
      {
LABEL_11:
        vector_double2 v13 = (vector_double2)v7;
        goto LABEL_12;
      }
      float64x2_t v12 = *v6;
      if (v16)
      {
        if (v17 == v14)
        {
          float64x2_t v7 = *v6;
          goto LABEL_11;
        }
        if ((sub_20B167140((uint64_t)&v15) & 1) != 0
          || (float32x2_t v8 = sub_20B167D58((uint64_t)&v15), sub_20B120EA0(&v15, v8), v16))
        {
          uint64_t v9 = (float64x2_t *)sub_20B167DE4(&v15);
          double v10 = fmax(fmin((time - v17) / (v14 - v17), 1.0), 0.0);
          float64x2_t v7 = vmlaq_n_f64(vmulq_n_f64(*v9, v10), v12, 1.0 - v10);
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

- (void)resetWithFloat2Array:(const vector_float2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  v16[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (end != begin)
  {
    do
    {
      float64x2_t v12 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v12;
    }
    while (v12 != begin);
  }
  for (self->super._timeSampledData.__end_ = begin; count; --count)
  {
    uint64_t v13 = *(void *)timesArray;
    vector_float2 v14 = *valuesArray;
    v16[1] = (char *)&off_26BF50308 + 3;
    uint64_t v15 = v13;
    v16[0] = v14;
    sub_20B1601A4(p_timeSampledData, &v15);
    sub_20B06A698((uint64_t)v16);
    ++valuesArray;
    ++timesArray;
  }
}

- (void)resetWithDouble2Array:(const vector_double2 *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      uint64_t v9 = (TimeSampledVtValue *)((char *)end - 24);
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

- (NSUInteger)getFloat2Array:(vector_float2 *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B1670D0((uint64_t)v12);
      double v10 = (std::type_info *)v12;
      if ((v9 & 1) == 0) {
        double v10 = sub_20B167A8C((uint64_t)v12);
      }
      *valuesArray++ = *(vector_float2 *)sub_20B167B18((uint64_t)v10);
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDouble2Array:(vector_double2 *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B167140((uint64_t)v12);
      double v10 = (std::type_info *)v12;
      if ((v9 & 1) == 0) {
        double v10 = sub_20B167D58((uint64_t)v12);
      }
      *valuesArray++ = *(vector_double2 *)sub_20B167DE4(v10);
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end