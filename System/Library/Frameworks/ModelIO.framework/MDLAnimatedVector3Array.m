@interface MDLAnimatedVector3Array
- (NSUInteger)elementCount;
- (NSUInteger)getDouble3Array:(vector_double3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat3Array:(vector_float3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithElementCount:(NSUInteger)arrayElementCount;
- (unint64_t)precision;
- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDouble3Array:(const vector_double3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
- (void)setElementCount:(unint64_t)a3;
- (void)setFloat3Array:(const vector_float3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedVector3Array

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedVector3Array;
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
  v5.super_class = (Class)MDLAnimatedVector3Array;
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
  if (sub_20B0A6414((uint64_t)v5) & 1) != 0 || (sub_20B162148((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B162180((uint64_t)v5);
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
    if (sub_20B162148((uint64_t)v6))
    {
      sub_20B16236C((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50F40;
      sub_20B0A6DA4();
    }
    if (sub_20B0A6414((uint64_t)v6))
    {
      sub_20B0A4CAC((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50E88;
      sub_20B0A6DA4();
    }
    if (sub_20B162180((uint64_t)v6))
    {
      sub_20B1623E4((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50DD0;
      sub_20B0A6DA4();
    }
    self = (MDLAnimatedVector3Array *)sub_20B06A698((uint64_t)v6);
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
  if ((sub_20B162148((uint64_t)v10) & 1) != 0
    || (sub_20B0A6414((uint64_t)v10) & 1) != 0
    || sub_20B162180((uint64_t)v10))
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
  if ((sub_20B162148((uint64_t)v10) & 1) != 0
    || (sub_20B0A6414((uint64_t)v10) & 1) != 0
    || sub_20B162180((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloat3Array:(const vector_float3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5 = count;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_20B0A4CAC((uint64_t)v13, count);
    if (v5)
    {
      uint64_t v8 = 0;
      v9 = &array->i64[1];
      do
      {
        uint64_t v10 = *(v9 - 1);
        int v11 = *(_DWORD *)v9;
        sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v13);
        uint64_t v12 = v14 + v8;
        *(void *)uint64_t v12 = v10;
        *(_DWORD *)(v12 + 8) = v11;
        v9 += 2;
        v8 += 12;
        --v5;
      }
      while (v5);
    }
    uint64_t v15 = 0;
    v16 = &off_26BF50E88;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, array, time, count, elementCount);
}

- (void)setDouble3Array:(const vector_double3 *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5 = count;
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    v7 = array;
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_20B1623E4((uint64_t)v12, count);
    if (v5)
    {
      uint64_t v8 = 0;
      do
      {
        long long v10 = *(_OWORD *)v7->f64;
        long long v11 = *(_OWORD *)&v7->f64[2];
        sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v12);
        uint64_t v9 = v13 + v8;
        *(_OWORD *)uint64_t v9 = v10;
        *(void *)(v9 + 16) = v11;
        ++v7;
        v8 += 24;
        --v5;
      }
      while (v5);
    }
    uint64_t v14 = 0;
    uint64_t v15 = &off_26BF50DD0;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, array, time, count, elementCount);
}

- (NSUInteger)getFloat3Array:(vector_float3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v42 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    uint64_t v8 = array;
    double v39 = 0.0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    double v36 = 0.0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v35 = 0;
    memset(v34, 0, sizeof(v34));
    uint64_t v33 = 0;
    memset(v32, 0, sizeof(v32));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v39, (uint64_t)&v36, time);
    if (v41)
    {
      if ((sub_20B0A6414((uint64_t)&v40) & 1) != 0
        || (long long v10 = sub_20B162F70((uint64_t)&v40), sub_20B120EA0(&v40, v10), v41))
      {
        long long v11 = (long long *)sub_20B0A3578(&v40);
        sub_20B0B08B0((uint64_t)v34, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v34[0] < v5) {
            NSUInteger v5 = *(void *)&v34[0];
          }
          if (v5)
          {
            uint64_t v15 = 0;
            NSUInteger v16 = v5;
            do
            {
              sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
              v17.i64[0] = *(void *)(v35 + v15);
              v17.i32[2] = *(_DWORD *)(v35 + v15 + 8);
              *v8++ = v17;
              v15 += 12;
              --v16;
            }
            while (v16);
          }
          goto LABEL_32;
        }
        if (v38)
        {
          if (v39 == v36)
          {
            if (*(void *)&v34[0] < v5) {
              NSUInteger v5 = *(void *)&v34[0];
            }
            if (v5)
            {
              uint64_t v12 = 0;
              NSUInteger v13 = v5;
              do
              {
                sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
                v14.i64[0] = *(void *)(v35 + v12);
                v14.i32[2] = *(_DWORD *)(v35 + v12 + 8);
                *v8++ = v14;
                v12 += 12;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_20B112C2C((uint64_t)&v37) & 1) != 0
            || (v18 = sub_20B162F70((uint64_t)&v37), sub_20B120EA0(&v37, v18), v38))
          {
            v19 = (long long *)sub_20B0A3578(&v37);
            sub_20B0B08B0((uint64_t)v32, v19);
            NSUInteger v21 = *(void *)&v34[0];
            if (*(void *)&v32[0] < *(void *)&v34[0]) {
              NSUInteger v21 = *(void *)&v32[0];
            }
            if (v21 < v5) {
              NSUInteger v5 = v21;
            }
            if (v5)
            {
              uint64_t v22 = 0;
              *(double *)&long long v20 = fmax(fmin((time - v39) / (v36 - v39), 1.0), 0.0);
              *(float *)&unsigned int v23 = *(double *)&v20;
              *(float *)&long long v20 = 1.0 - *(float *)&v23;
              long long v30 = v20;
              float v31 = *(float *)&v23;
              float32x2_t v24 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
              NSUInteger v25 = v5;
              do
              {
                sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v34);
                float32x2_t v26 = *(float32x2_t *)(v35 + v22);
                float v27 = *(float *)(v35 + v22 + 8);
                sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v32);
                v28.i32[3] = HIDWORD(v30);
                *(float32x2_t *)v28.f32 = vmla_f32(vmul_n_f32(v26, *(float *)&v30), v24, *(float32x2_t *)(v33 + v22));
                v28.f32[2] = (float)(v27 * *(float *)&v30) + (float)(*(float *)(v33 + v22 + 8) * v31);
                *v8++ = v28;
                v22 += 12;
                --v25;
              }
              while (v25);
            }
            goto LABEL_32;
          }
        }
      }
    }
    NSUInteger v5 = 0;
LABEL_32:
    sub_20B06A6E8((uint64_t)v32);
    sub_20B06A6E8((uint64_t)v34);
    sub_20B06A698((uint64_t)&v37);
    sub_20B06A698((uint64_t)&v40);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v41 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    uint64_t v8 = array;
    double v38 = 0.0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    double v35 = 0.0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
    uint64_t v32 = 0;
    memset(v31, 0, sizeof(v31));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v38, (uint64_t)&v35, time);
    if (v40)
    {
      if ((sub_20B162180((uint64_t)&v39) & 1) != 0
        || (long long v10 = sub_20B163374((uint64_t)&v39), sub_20B120EA0(&v39, v10), v40))
      {
        long long v11 = (long long *)sub_20B163400(&v39);
        sub_20B163494((uint64_t)v33, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v33[0] < v5) {
            NSUInteger v5 = *(void *)&v33[0];
          }
          if (v5)
          {
            uint64_t v15 = 0;
            NSUInteger v16 = v5;
            do
            {
              sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
              *(void *)&long long v17 = *(void *)(v34 + v15 + 16);
              *(_OWORD *)v8->f64 = *(_OWORD *)(v34 + v15);
              *(_OWORD *)&v8->f64[2] = v17;
              ++v8;
              v15 += 24;
              --v16;
            }
            while (v16);
          }
          goto LABEL_32;
        }
        if (v37)
        {
          if (v38 == v35)
          {
            if (*(void *)&v33[0] < v5) {
              NSUInteger v5 = *(void *)&v33[0];
            }
            if (v5)
            {
              uint64_t v12 = 0;
              NSUInteger v13 = v5;
              do
              {
                sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
                *(void *)&long long v14 = *(void *)(v34 + v12 + 16);
                *(_OWORD *)v8->f64 = *(_OWORD *)(v34 + v12);
                *(_OWORD *)&v8->f64[2] = v14;
                ++v8;
                v12 += 24;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_20B163548((uint64_t)&v36) & 1) != 0
            || (v18 = sub_20B163374((uint64_t)&v36), sub_20B120EA0(&v36, v18), v37))
          {
            v19 = (long long *)sub_20B163400(&v36);
            sub_20B163494((uint64_t)v31, v19);
            NSUInteger v20 = *(void *)&v33[0];
            if (*(void *)&v31[0] < *(void *)&v33[0]) {
              NSUInteger v20 = *(void *)&v31[0];
            }
            if (v20 < v5) {
              NSUInteger v5 = v20;
            }
            if (v5)
            {
              uint64_t v21 = 0;
              double v22 = fmax(fmin((time - v38) / (v35 - v38), 1.0), 0.0);
              double v23 = 1.0 - v22;
              NSUInteger v24 = v5;
              do
              {
                sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v33);
                double v25 = *(double *)(v34 + v21);
                double v26 = *(double *)(v34 + v21 + 8);
                double v27 = *(double *)(v34 + v21 + 16);
                sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v31);
                *(double *)&long long v28 = v25 * v23 + *(double *)(v32 + v21) * v22;
                *((double *)&v28 + 1) = v26 * v23 + *(double *)(v32 + v21 + 8) * v22;
                *(double *)&long long v29 = v27 * v23 + *(double *)(v32 + v21 + 16) * v22;
                *(_OWORD *)v8->f64 = v28;
                *(_OWORD *)&v8->f64[2] = v29;
                ++v8;
                v21 += 24;
                --v24;
              }
              while (v24);
            }
            goto LABEL_32;
          }
        }
      }
    }
    NSUInteger v5 = 0;
LABEL_32:
    sub_20B06A6E8((uint64_t)v31);
    sub_20B06A6E8((uint64_t)v33);
    sub_20B06A698((uint64_t)&v36);
    sub_20B06A698((uint64_t)&v39);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloat3Array:(const vector_float3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  uint64_t v25 = *MEMORY[0x263EF8340];
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
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_20B0A4CAC((uint64_t)v21, elementCount);
    if (timesCount)
    {
      v19 = &valuesArray->i64[1];
      if (self->_elementCount)
      {
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        uint64_t v15 = v19;
        do
        {
          uint64_t v16 = *(v15 - 1);
          int v17 = *(_DWORD *)v15;
          sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v21);
          uint64_t v18 = v22 + v13;
          *(void *)uint64_t v18 = v16;
          *(_DWORD *)(v18 + 8) = v17;
          ++v14;
          v15 += 2;
          v13 += 12;
        }
        while (v14 < self->_elementCount);
      }
      uint64_t v23 = *(void *)timesArray;
      NSUInteger v24 = &off_26BF50E88;
      sub_20B0A6DA4();
    }
    sub_20B06A6E8((uint64_t)v21);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, valuesArray, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDouble3Array:(const vector_double3 *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount * timesCount == valuesCount)
  {
    begin = self->super._timeSampledData.__begin_;
    end = self->super._timeSampledData.__end_;
    if (end != begin)
    {
      do
      {
        long long v11 = (TimeSampledVtValue *)((char *)end - 24);
        sub_20B06A698((uint64_t)end - 16);
        end = v11;
      }
      while (v11 != begin);
      LODWORD(elementCount) = self->_elementCount;
    }
    self->super._timeSampledData.__end_ = begin;
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_20B1623E4((uint64_t)v20, elementCount);
    if (timesCount)
    {
      if (self->_elementCount)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          unint64_t v14 = &valuesArray[v13];
          long long v18 = *(_OWORD *)v14->f64;
          long long v19 = *(_OWORD *)&v14->f64[2];
          sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v20);
          uint64_t v15 = v21 + v12;
          *(_OWORD *)uint64_t v15 = v18;
          *(void *)(v15 + 16) = v19;
          ++v13;
          v12 += 24;
        }
        while (v13 < self->_elementCount);
      }
      uint64_t v22 = *(void *)timesArray;
      uint64_t v23 = &off_26BF50DD0;
      sub_20B0A6DA4();
    }
    sub_20B06A6E8((uint64_t)v20);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (NSUInteger)getFloat3Array:(vector_float3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v27[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  NSUInteger result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      }
      do
      {
        uint64_t v26 = 0;
        v27[0] = 0;
        v27[1] = 0;
        uint64_t v12 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v9);
        uint64_t v26 = *v12;
        sub_20B0A592C(v27, v12 + 1);
        if ((sub_20B0A6414((uint64_t)v27) & 1) == 0)
        {
          unint64_t v13 = sub_20B162F70((uint64_t)v27);
          sub_20B120EA0(v27, v13);
        }
        if (sub_20B0A6414((uint64_t)v27))
        {
          uint64_t v25 = 0;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v14 = sub_20B0A3578(v27);
          long long v15 = *(_OWORD *)(v14 + 16);
          long long v23 = *(_OWORD *)v14;
          long long v24 = v15;
          uint64_t v16 = *(void *)(v14 + 32);
          uint64_t v25 = v16;
          if (v16)
          {
            int v17 = (atomic_ullong *)(v16 - 16);
            if (*((void *)&v24 + 1)) {
              int v17 = (atomic_ullong *)*((void *)&v24 + 1);
            }
            atomic_fetch_add_explicit(v17, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            uint64_t v18 = 0;
            unint64_t v19 = 0;
            do
            {
              sub_20B06C094((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v23);
              v20.i64[0] = *(void *)(v25 + v18);
              v20.i32[2] = *(_DWORD *)(v25 + v18 + 8);
              valuesArray[v10 + v19++] = v20;
              v18 += 12;
            }
            while (v19 < self->_elementCount);
            v10 += v19;
          }
          sub_20B06A6E8((uint64_t)&v23);
        }
        sub_20B06A698((uint64_t)v27);
        ++v9;
      }
      while (v9 != v11);
      return self->_elementCount * v21;
    }
  }
  else
  {
    NSLog(&cfstr_ValuesarraySiz.isa, a2, maxCount, result);
    return 0;
  }
  return result;
}

- (NSUInteger)getDouble3Array:(vector_double3 *)valuesArray maxCount:(NSUInteger)maxCount
{
  v28[2] = *MEMORY[0x263EF8340];
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  NSUInteger result = v7 * self->_elementCount;
  if (result <= maxCount)
  {
    if (end != begin)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      if (v7 <= 1) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      }
      do
      {
        uint64_t v27 = 0;
        v28[0] = 0;
        v28[1] = 0;
        uint64_t v12 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v9);
        uint64_t v27 = *v12;
        sub_20B0A592C(v28, v12 + 1);
        if ((sub_20B162180((uint64_t)v28) & 1) == 0)
        {
          unint64_t v13 = sub_20B163374((uint64_t)v28);
          sub_20B120EA0(v28, v13);
        }
        if (sub_20B162180((uint64_t)v28))
        {
          uint64_t v26 = 0;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v14 = sub_20B163400(v28);
          long long v15 = *(_OWORD *)(v14 + 16);
          long long v24 = *(_OWORD *)v14;
          long long v25 = v15;
          uint64_t v16 = *(void *)(v14 + 32);
          uint64_t v26 = v16;
          if (v16)
          {
            int v17 = (atomic_ullong *)(v16 - 16);
            if (*((void *)&v25 + 1)) {
              int v17 = (atomic_ullong *)*((void *)&v25 + 1);
            }
            atomic_fetch_add_explicit(v17, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            uint64_t v18 = 0;
            unint64_t v19 = 0;
            do
            {
              sub_20B16F364((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v24);
              *(void *)&long long v20 = *(void *)(v26 + v18 + 16);
              unint64_t v21 = &valuesArray[v10 + v19];
              *(_OWORD *)v21->f64 = *(_OWORD *)(v26 + v18);
              *(_OWORD *)&v21->f64[2] = v20;
              ++v19;
              v18 += 24;
            }
            while (v19 < self->_elementCount);
            v10 += v19;
          }
          sub_20B06A6E8((uint64_t)&v24);
        }
        sub_20B06A698((uint64_t)v28);
        ++v9;
      }
      while (v9 != v11);
      return self->_elementCount * v22;
    }
  }
  else
  {
    NSLog(&cfstr_ValuesarraySiz.isa, a2, maxCount, result);
    return 0;
  }
  return result;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_unint64_t elementCount = a3;
}

@end