@interface MDLAnimatedScalarArray
- (NSUInteger)elementCount;
- (NSUInteger)getDoubleArray:(double *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloatArray:(float *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithElementCount:(NSUInteger)arrayElementCount;
- (unint64_t)precision;
- (void)resetWithDoubleArray:(const double *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithFloatArray:(const float *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDoubleArray:(const double *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
- (void)setElementCount:(unint64_t)a3;
- (void)setFloatArray:(const float *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedScalarArray

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedScalarArray;
  v4 = [(MDLAnimatedValue *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_elementCount = arrayElementCount;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MDLAnimatedScalarArray;
  id result = [(MDLAnimatedValue *)&v5 copyWithZone:a3];
  *((void *)result + 5) = self->_elementCount;
  return result;
}

- (NSUInteger)elementCount
{
  return self->_elementCount;
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
  if (sub_20B0C7AC0((uint64_t)v5) & 1) != 0 || (sub_20B15FC18((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B15FC50((uint64_t)v5);
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
  v6[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  if (self->super._timeSampledData.__end_ != begin)
  {
    v6[0] = 0;
    v6[1] = 0;
    sub_20B0A592C(v6, (void *)begin + 1);
    if (sub_20B15FC18((uint64_t)v6))
    {
      sub_20B15FE3C((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF510B0;
      sub_20B0A6DA4();
    }
    if (sub_20B0C7AC0((uint64_t)v6))
    {
      sub_20B0C4EFC((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF51220;
      sub_20B0C9A64();
    }
    if (sub_20B15FC50((uint64_t)v6))
    {
      sub_20B0C6A04((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF51168;
      sub_20B0C9A64();
    }
    self = (MDLAnimatedScalarArray *)sub_20B06A698((uint64_t)v6);
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
  if ((sub_20B15FC18((uint64_t)v10) & 1) != 0
    || (sub_20B0C7AC0((uint64_t)v10) & 1) != 0
    || sub_20B15FC50((uint64_t)v10))
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
  if ((sub_20B15FC18((uint64_t)v10) & 1) != 0
    || (sub_20B0C7AC0((uint64_t)v10) & 1) != 0
    || sub_20B15FC50((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloatArray:(const float *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_20B0C4EFC((uint64_t)v10, count);
    if (count)
    {
      uint64_t v8 = 0;
      do
      {
        float v9 = array[v8];
        sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(float *)(v11 + 4 * v8++) = v9;
      }
      while (count != v8);
    }
    uint64_t v12 = 0;
    v13 = &off_26BF51220;
    sub_20B0C9A64();
  }
  NSLog(&cfstr_ArrayCountLuHa_1.isa, a2, array, time, count, elementCount);
}

- (void)setDoubleArray:(const double *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_20B0C6A04((uint64_t)v10, count);
    if (count)
    {
      uint64_t v8 = 0;
      do
      {
        double v9 = array[v8];
        sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(double *)(v11 + 8 * v8++) = v9;
      }
      while (count != v8);
    }
    uint64_t v12 = 0;
    v13 = &off_26BF51168;
    sub_20B0C9A64();
  }
  NSLog(&cfstr_ArrayCountLuHa_1.isa, a2, array, time, count, elementCount);
}

- (NSUInteger)getFloatArray:(float *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v31 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    double v28 = 0.0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    double v25 = 0.0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
    if (v30)
    {
      if ((sub_20B0C7AC0((uint64_t)&v29) & 1) != 0
        || (v10 = sub_20B161204((uint64_t)&v29), sub_20B120EA0(&v29, v10), v30))
      {
        uint64_t v11 = (long long *)sub_20B0C2AB8(&v29);
        sub_20B0B0DC8((uint64_t)v23, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v23[0] < v5) {
            NSUInteger v5 = *(void *)&v23[0];
          }
          if (v5)
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
              array[i] = *(float *)(v24 + 4 * i);
            }
          }
          goto LABEL_32;
        }
        if (v27)
        {
          if (v28 == v25)
          {
            if (*(void *)&v23[0] < v5) {
              NSUInteger v5 = *(void *)&v23[0];
            }
            if (v5)
            {
              for (uint64_t j = 0; j != v5; ++j)
              {
                sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[j] = *(float *)(v24 + 4 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_20B112C9C((uint64_t)&v26) & 1) != 0
            || (uint64_t v14 = sub_20B161204((uint64_t)&v26), sub_20B120EA0(&v26, v14), v27))
          {
            v15 = (long long *)sub_20B0C2AB8(&v26);
            sub_20B0B0DC8((uint64_t)v21, v15);
            NSUInteger v16 = *(void *)&v23[0];
            if (*(void *)&v21[0] < *(void *)&v23[0]) {
              NSUInteger v16 = *(void *)&v21[0];
            }
            if (v16 < v5) {
              NSUInteger v5 = v16;
            }
            if (v5)
            {
              uint64_t v17 = 0;
              float v18 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
              do
              {
                sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                float v19 = *(float *)(v24 + 4 * v17);
                sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v21);
                array[v17] = v19 + (float)((float)(*(float *)(v22 + 4 * v17) - v19) * v18);
                ++v17;
              }
              while (v5 != v17);
            }
            goto LABEL_32;
          }
        }
      }
    }
    NSUInteger v5 = 0;
LABEL_32:
    sub_20B06A6E8((uint64_t)v21);
    sub_20B06A6E8((uint64_t)v23);
    sub_20B06A698((uint64_t)&v26);
    sub_20B06A698((uint64_t)&v29);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_1.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDoubleArray:(double *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v31 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    double v28 = 0.0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    double v25 = 0.0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
    if (v30)
    {
      if ((sub_20B15FC50((uint64_t)&v29) & 1) != 0
        || (v10 = sub_20B161598((uint64_t)&v29), sub_20B120EA0(&v29, v10), v30))
      {
        uint64_t v11 = (long long *)sub_20B161624(&v29);
        sub_20B1616B8((uint64_t)v23, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v23[0] < v5) {
            NSUInteger v5 = *(void *)&v23[0];
          }
          if (v5)
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
              array[i] = *(double *)(v24 + 8 * i);
            }
          }
          goto LABEL_32;
        }
        if (v27)
        {
          if (v28 == v25)
          {
            if (*(void *)&v23[0] < v5) {
              NSUInteger v5 = *(void *)&v23[0];
            }
            if (v5)
            {
              for (uint64_t j = 0; j != v5; ++j)
              {
                sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[j] = *(double *)(v24 + 8 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_20B16176C((uint64_t)&v26) & 1) != 0
            || (uint64_t v14 = sub_20B161598((uint64_t)&v26), sub_20B120EA0(&v26, v14), v27))
          {
            v15 = (long long *)sub_20B161624(&v26);
            sub_20B1616B8((uint64_t)v21, v15);
            NSUInteger v16 = *(void *)&v23[0];
            if (*(void *)&v21[0] < *(void *)&v23[0]) {
              NSUInteger v16 = *(void *)&v21[0];
            }
            if (v16 < v5) {
              NSUInteger v5 = v16;
            }
            if (v5)
            {
              uint64_t v17 = 0;
              double v18 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
              do
              {
                sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                double v19 = *(double *)(v24 + 8 * v17);
                sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v21);
                array[v17] = v19 + (*(double *)(v22 + 8 * v17) - v19) * v18;
                ++v17;
              }
              while (v5 != v17);
            }
            goto LABEL_32;
          }
        }
      }
    }
    NSUInteger v5 = 0;
LABEL_32:
    sub_20B06A6E8((uint64_t)v21);
    sub_20B06A6E8((uint64_t)v23);
    sub_20B06A698((uint64_t)&v26);
    sub_20B06A698((uint64_t)&v29);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_1.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloatArray:(const float *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount * timesCount == valuesCount)
  {
    begin = self->super._timeSampledData.__begin_;
    end = self->super._timeSampledData.__end_;
    if (end != begin)
    {
      do
      {
        uint64_t v12 = (TimeSampledVtValue *)((char *)end - 24);
        sub_20B06A698((uint64_t)end - 16);
        end = v12;
      }
      while (v12 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    sub_20B0C4EFC((uint64_t)v16, elementCount);
    if (timesCount)
    {
      if (self->_elementCount)
      {
        unint64_t v13 = 0;
        do
        {
          float v14 = valuesArray[v13];
          sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v16);
          *(float *)(v17 + 4 * v13++) = v14;
        }
        while (v13 < self->_elementCount);
      }
      uint64_t v18 = *(void *)timesArray;
      double v19 = &off_26BF51220;
      sub_20B0C9A64();
    }
    sub_20B06A6E8((uint64_t)v16);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDoubleArray:(const double *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount * timesCount == valuesCount)
  {
    begin = self->super._timeSampledData.__begin_;
    end = self->super._timeSampledData.__end_;
    if (end != begin)
    {
      do
      {
        uint64_t v12 = (TimeSampledVtValue *)((char *)end - 24);
        sub_20B06A698((uint64_t)end - 16);
        end = v12;
      }
      while (v12 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
    sub_20B0C6A04((uint64_t)v16, elementCount);
    if (timesCount)
    {
      if (self->_elementCount)
      {
        unint64_t v13 = 0;
        do
        {
          double v14 = valuesArray[v13];
          sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v16);
          *(double *)(v17 + 8 * v13++) = v14;
        }
        while (v13 < self->_elementCount);
      }
      uint64_t v18 = *(void *)timesArray;
      double v19 = &off_26BF51168;
      sub_20B0C9A64();
    }
    sub_20B06A6E8((uint64_t)v16);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (NSUInteger)getFloatArray:(float *)valuesArray maxCount:(NSUInteger)maxCount
{
  v25[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  NSUInteger result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      }
      do
      {
        uint64_t v24 = 0;
        v25[0] = 0;
        v25[1] = 0;
        unint64_t v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        uint64_t v24 = *v13;
        sub_20B0A592C(v25, v13 + 1);
        if ((sub_20B0C7AC0((uint64_t)v25) & 1) == 0)
        {
          double v14 = sub_20B161204((uint64_t)v25);
          sub_20B120EA0(v25, v14);
        }
        if (sub_20B0C7AC0((uint64_t)v25))
        {
          uint64_t v23 = 0;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v15 = sub_20B0C2AB8(v25);
          long long v16 = *(_OWORD *)(v15 + 16);
          long long v21 = *(_OWORD *)v15;
          long long v22 = v16;
          uint64_t v17 = *(void *)(v15 + 32);
          uint64_t v23 = v17;
          if (v17)
          {
            uint64_t v18 = (atomic_ullong *)(v17 - 16);
            if (*((void *)&v22 + 1)) {
              uint64_t v18 = (atomic_ullong *)*((void *)&v22 + 1);
            }
            atomic_fetch_add_explicit(v18, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            unint64_t v19 = 0;
            do
            {
              sub_20B0B1548((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v21);
              valuesArray[v11 + v19] = *(float *)(v23 + 4 * v19);
              ++v19;
            }
            while (v19 < self->_elementCount);
            v11 += v19;
          }
          sub_20B06A6E8((uint64_t)&v21);
        }
        sub_20B06A698((uint64_t)v25);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v20;
    }
  }
  else
  {
    NSLog(&cfstr_ValuesarraySiz.isa, a2, valuesArray, maxCount, result);
    return 0;
  }
  return result;
}

- (NSUInteger)getDoubleArray:(double *)valuesArray maxCount:(NSUInteger)maxCount
{
  v25[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  NSUInteger result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      }
      do
      {
        uint64_t v24 = 0;
        v25[0] = 0;
        v25[1] = 0;
        unint64_t v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        uint64_t v24 = *v13;
        sub_20B0A592C(v25, v13 + 1);
        if ((sub_20B15FC50((uint64_t)v25) & 1) == 0)
        {
          double v14 = sub_20B161598((uint64_t)v25);
          sub_20B120EA0(v25, v14);
        }
        if (sub_20B15FC50((uint64_t)v25))
        {
          uint64_t v23 = 0;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v15 = sub_20B161624(v25);
          long long v16 = *(_OWORD *)(v15 + 16);
          long long v21 = *(_OWORD *)v15;
          long long v22 = v16;
          uint64_t v17 = *(void *)(v15 + 32);
          uint64_t v23 = v17;
          if (v17)
          {
            uint64_t v18 = (atomic_ullong *)(v17 - 16);
            if (*((void *)&v22 + 1)) {
              uint64_t v18 = (atomic_ullong *)*((void *)&v22 + 1);
            }
            atomic_fetch_add_explicit(v18, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            unint64_t v19 = 0;
            do
            {
              sub_20B0C9E0C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v21);
              valuesArray[v11 + v19] = *(double *)(v23 + 8 * v19);
              ++v19;
            }
            while (v19 < self->_elementCount);
            v11 += v19;
          }
          sub_20B06A6E8((uint64_t)&v21);
        }
        sub_20B06A698((uint64_t)v25);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v20;
    }
  }
  else
  {
    NSLog(&cfstr_ValuesarraySiz.isa, a2, valuesArray, maxCount, result);
    return 0;
  }
  return result;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_unint64_t elementCount = a3;
}

@end