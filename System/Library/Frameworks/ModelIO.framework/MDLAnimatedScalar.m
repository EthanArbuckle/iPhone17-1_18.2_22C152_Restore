@interface MDLAnimatedScalar
- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (double)doubleAtTime:(NSTimeInterval)time;
- (float)floatAtTime:(NSTimeInterval)time;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)precision;
- (void)resetWithDoubleArray:(const double *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloatArray:(const float *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble:(double)value atTime:(NSTimeInterval)time;
- (void)setFloat:(float)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedScalar

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedScalar;
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
  if (sub_20B112C9C((uint64_t)v5) & 1) != 0 || (sub_20B165F5C((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B16176C((uint64_t)v5);
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
  if (self->super._timeSampledData.__end_ == begin) {
    goto LABEL_10;
  }
  v5[0] = 0;
  v5[1] = 0;
  sub_20B0A592C(v5, (void *)begin + 1);
  if (!sub_20B165F5C((uint64_t)v5))
  {
    if (sub_20B112C9C((uint64_t)v5))
    {
      *(void *)(v3 + 8) = &unk_26BF517E3;
      *(_DWORD *)uint64_t v3 = 0;
      goto LABEL_8;
    }
    if (sub_20B16176C((uint64_t)v5))
    {
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = &unk_26BF5172B;
      goto LABEL_8;
    }
    self = (MDLAnimatedScalar *)sub_20B06A698((uint64_t)v5);
LABEL_10:
    *(void *)(v3 + 8) = 0;
    goto LABEL_11;
  }
  *(void *)(v3 + 8) = (char *)&off_26BF51500 + 3;
  *(_WORD *)uint64_t v3 = 0;
LABEL_8:
  self = (MDLAnimatedScalar *)sub_20B06A698((uint64_t)v5);
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
  if ((sub_20B165F5C((uint64_t)v10) & 1) != 0
    || (sub_20B112C9C((uint64_t)v10) & 1) != 0
    || sub_20B16176C((uint64_t)v10))
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
  if ((sub_20B165F5C((uint64_t)v10) & 1) != 0
    || (sub_20B112C9C((uint64_t)v10) & 1) != 0
    || sub_20B16176C((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat:(float)value atTime:(NSTimeInterval)time
{
  v15[2] = *MEMORY[0x263EF8340];
  v15[1] = &unk_26BF517E3;
  v15[0] = LODWORD(value);
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    NSTimeInterval v12 = 0.0;
    v13[0] = 0;
    sub_20B0A592C(&v12, (void *)begin + 1);
    if ((sub_20B112C9C((uint64_t)&v12) & 1) == 0)
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

- (void)setDouble:(double)value atTime:(NSTimeInterval)time
{
  v15[2] = *MEMORY[0x263EF8340];
  v15[1] = &unk_26BF5172B;
  *(double *)v15 = value;
  begin = self->super._timeSampledData.__begin_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (self->super._timeSampledData.__end_ != begin)
  {
    NSTimeInterval v12 = 0.0;
    v13[0] = 0;
    sub_20B0A592C(&v12, (void *)begin + 1);
    if ((sub_20B16176C((uint64_t)&v12) & 1) == 0)
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

- (float)floatAtTime:(NSTimeInterval)time
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v16 = 0.0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v13 = 0.0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v16, (uint64_t)&v13, time);
  float v5 = 0.0;
  if (v18)
  {
    if ((sub_20B112C9C((uint64_t)&v17) & 1) != 0 || (v6 = sub_20B16683C((uint64_t)&v17), sub_20B120EA0(&v17, v6), v18))
    {
      v7 = (float *)sub_20B112F58((uint64_t)&v17);
      float v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        float v5 = *v7;
        goto LABEL_8;
      }
      if (v15)
      {
        if (v16 == v13) {
          goto LABEL_7;
        }
        if ((sub_20B112C9C((uint64_t)&v14) & 1) != 0
          || (v10 = sub_20B16683C((uint64_t)&v14), sub_20B120EA0(&v14, v10), v15))
        {
          v11 = (float *)sub_20B112F58((uint64_t)&v14);
          float v12 = fmax(fmin((time - v16) / (v13 - v16), 1.0), 0.0);
          float v5 = v8 + (float)((float)(*v11 - v8) * v12);
        }
      }
    }
  }
LABEL_8:
  sub_20B06A698((uint64_t)&v14);
  sub_20B06A698((uint64_t)&v17);
  return v5;
}

- (double)doubleAtTime:(NSTimeInterval)time
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v15 = 0.0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  double v12 = 0.0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v15, (uint64_t)&v12, time);
  double v5 = 0.0;
  if (v17)
  {
    if ((sub_20B16176C((uint64_t)&v16) & 1) != 0 || (v6 = sub_20B166A68((uint64_t)&v16), sub_20B120EA0(&v16, v6), v17))
    {
      v7 = (double *)sub_20B166AF4((uint64_t)&v16);
      double v8 = *v7;
      if (!self->super._interpolation)
      {
LABEL_7:
        double v5 = *v7;
        goto LABEL_8;
      }
      if (v14)
      {
        if (v15 == v12) {
          goto LABEL_7;
        }
        if ((sub_20B16176C((uint64_t)&v13) & 1) != 0
          || (v10 = sub_20B166A68((uint64_t)&v13), sub_20B120EA0(&v13, v10), v14))
        {
          v11 = (double *)sub_20B166AF4((uint64_t)&v13);
          double v5 = v8 + fmax(fmin((time - v15) / (v12 - v15), 1.0), 0.0) * (*v11 - v8);
        }
      }
    }
  }
LABEL_8:
  sub_20B06A698((uint64_t)&v13);
  sub_20B06A698((uint64_t)&v16);
  return v5;
}

- (void)resetWithFloatArray:(const float *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (end != begin)
  {
    do
    {
      double v12 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v12;
    }
    while (v12 != begin);
  }
  for (self->super._timeSampledData.__end_ = begin; count; --count)
  {
    uint64_t v14 = *(void *)timesArray;
    int v13 = *(_DWORD *)valuesArray;
    uint64_t v16 = &unk_26BF517E3;
    int v15 = v13;
    sub_20B1601A4(p_timeSampledData, &v14);
    sub_20B06A698((uint64_t)&v15);
    ++valuesArray;
    ++timesArray;
  }
}

- (void)resetWithDoubleArray:(const double *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  v16[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  p_timeSampledData = (uint64_t *)&self->super._timeSampledData;
  if (end != begin)
  {
    do
    {
      double v12 = (TimeSampledVtValue *)((char *)end - 24);
      sub_20B06A698((uint64_t)end - 16);
      end = v12;
    }
    while (v12 != begin);
  }
  for (self->super._timeSampledData.__end_ = begin; count; --count)
  {
    uint64_t v13 = *(void *)timesArray;
    uint64_t v14 = *(void *)valuesArray;
    v16[1] = &unk_26BF5172B;
    uint64_t v15 = v13;
    v16[0] = v14;
    sub_20B1601A4(p_timeSampledData, &v15);
    sub_20B06A698((uint64_t)v16);
    ++valuesArray;
    ++timesArray;
  }
}

- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B112C9C((uint64_t)v12);
      v10 = (std::type_info *)v12;
      if ((v9 & 1) == 0) {
        v10 = sub_20B16683C((uint64_t)v12);
      }
      *valuesArray++ = *(float *)sub_20B112F58((uint64_t)v10);
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount
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
      char v9 = sub_20B16176C((uint64_t)v12);
      v10 = (std::type_info *)v12;
      if ((v9 & 1) == 0) {
        v10 = sub_20B166A68((uint64_t)v12);
      }
      *valuesArray++ = *(double *)sub_20B166AF4((uint64_t)v10);
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end