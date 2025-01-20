@interface MDLAnimatedQuaternionArray
- (NSUInteger)elementCount;
- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time;
- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithElementCount:(NSUInteger)arrayElementCount;
- (unint64_t)precision;
- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDoubleQuaternionArray:(const simd_quatd *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
- (void)setElementCount:(unint64_t)a3;
- (void)setFloatQuaternionArray:(const simd_quatf *)array count:(NSUInteger)count atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedQuaternionArray

- (id)initWithElementCount:(NSUInteger)arrayElementCount
{
  v8.receiver = self;
  v8.super_class = (Class)MDLAnimatedQuaternionArray;
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
  v5.super_class = (Class)MDLAnimatedQuaternionArray;
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
  if (sub_20B163F98((uint64_t)v5) & 1) != 0 || (sub_20B163FD0((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B164008((uint64_t)v5);
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
    if (sub_20B163FD0((uint64_t)v6))
    {
      sub_20B1641F4((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50C60;
      sub_20B0A6DA4();
    }
    if (sub_20B163F98((uint64_t)v6))
    {
      sub_20B164264((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50BA8;
      sub_20B0A6DA4();
    }
    if (sub_20B164008((uint64_t)v6))
    {
      sub_20B1642D4((uint64_t)v5, 0);
      *(void *)(v3 + 8) = &off_26BF50AF0;
      sub_20B0A6DA4();
    }
    self = (MDLAnimatedQuaternionArray *)sub_20B06A698((uint64_t)v6);
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
  if ((sub_20B163FD0((uint64_t)v10) & 1) != 0
    || (sub_20B163F98((uint64_t)v10) & 1) != 0
    || sub_20B164008((uint64_t)v10))
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
  if ((sub_20B163FD0((uint64_t)v10) & 1) != 0
    || (sub_20B163F98((uint64_t)v10) & 1) != 0
    || sub_20B164008((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloatQuaternionArray:(const simd_quatf *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_20B164264((uint64_t)v10, count);
    if (count)
    {
      uint64_t v8 = 0;
      do
      {
        simd_quatf v9 = array[v8];
        sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(simd_quatf *)(v11 + 16 * v8++) = v9;
      }
      while (count != v8);
    }
    uint64_t v12 = 0;
    v13 = &off_26BF50BA8;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa_2.isa, a2, array, time, count, elementCount);
}

- (void)setDoubleQuaternionArray:(const simd_quatd *)array count:(NSUInteger)count atTime:(NSTimeInterval)time
{
  NSUInteger v5 = count;
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_20B1642D4((uint64_t)v12, count);
    if (v5)
    {
      uint64_t v8 = 0;
      do
      {
        long long v10 = *(_OWORD *)array[v8].vector.f64;
        long long v11 = *(_OWORD *)&array[v8].vector.f64[2];
        sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v12);
        simd_quatf v9 = (_OWORD *)(v13 + v8 * 32);
        *simd_quatf v9 = v10;
        v9[1] = v11;
        ++v8;
        --v5;
      }
      while (v5);
    }
    uint64_t v14 = 0;
    v15 = &off_26BF50AF0;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa_2.isa, a2, array, time, count, elementCount);
}

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v33 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    double v30 = 0.0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    double v27 = 0.0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v30, (uint64_t)&v27, time);
    if (v32)
    {
      if ((sub_20B163F98((uint64_t)&v31) & 1) != 0
        || (long long v10 = sub_20B164E04((uint64_t)&v31), sub_20B120EA0(&v31, v10), v32))
      {
        long long v11 = (long long *)sub_20B164E90(&v31);
        sub_20B164F24((uint64_t)v25, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v25[0] < v5) {
            NSUInteger v5 = *(void *)&v25[0];
          }
          if (v5)
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
              array[i] = *(simd_quatf *)(v26 + 16 * i);
            }
          }
          goto LABEL_32;
        }
        if (v29)
        {
          if (v30 == v27)
          {
            if (*(void *)&v25[0] < v5) {
              NSUInteger v5 = *(void *)&v25[0];
            }
            if (v5)
            {
              for (uint64_t j = 0; j != v5; ++j)
              {
                sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
                array[j] = *(simd_quatf *)(v26 + 16 * j);
              }
            }
            goto LABEL_32;
          }
          if ((sub_20B164FD8((uint64_t)&v28) & 1) != 0
            || (uint64_t v14 = sub_20B164E04((uint64_t)&v28), sub_20B120EA0(&v28, v14), v29))
          {
            v15 = (long long *)sub_20B164E90(&v28);
            sub_20B164F24((uint64_t)v23, v15);
            NSUInteger v16 = *(void *)&v25[0];
            if (*(void *)&v23[0] < *(void *)&v25[0]) {
              NSUInteger v16 = *(void *)&v23[0];
            }
            if (v16 < v5) {
              NSUInteger v5 = v16;
            }
            if (v5)
            {
              uint64_t v17 = 0;
              double v18 = fmax(fmin((time - v30) / (v27 - v30), 1.0), 0.0);
              *(float *)&double v18 = v18;
              float32x4_t v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v18, 0);
              float v21 = 1.0 - *(float *)&v18;
              do
              {
                sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v25);
                float32x4_t v22 = *(float32x4_t *)(v26 + 16 * v17);
                sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
                array[v17] = (simd_quatf)vmlaq_f32(vmulq_n_f32(v22, v21), v20, *(float32x4_t *)(v24 + 16 * v17));
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
    sub_20B06A6E8((uint64_t)v23);
    sub_20B06A6E8((uint64_t)v25);
    sub_20B06A698((uint64_t)&v28);
    sub_20B06A698((uint64_t)&v31);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_2.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)array maxCount:(NSUInteger)maxCount atTime:(NSTimeInterval)time
{
  NSUInteger v5 = maxCount;
  uint64_t v48 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    double v45 = 0.0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    double v42 = 0.0;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v41 = 0;
    memset(v40, 0, sizeof(v40));
    uint64_t v39 = 0;
    memset(v38, 0, sizeof(v38));
    sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v45, (uint64_t)&v42, time);
    if (v47)
    {
      if ((sub_20B164008((uint64_t)&v46) & 1) != 0
        || (long long v10 = sub_20B1653A8((uint64_t)&v46), sub_20B120EA0(&v46, v10), v47))
      {
        long long v11 = (long long *)sub_20B165434(&v46);
        sub_20B1654C8((uint64_t)v40, v11);
        if (!self->super._interpolation)
        {
          if (*(void *)&v40[0] < v5) {
            NSUInteger v5 = *(void *)&v40[0];
          }
          if (v5)
          {
            uint64_t v16 = 0;
            NSUInteger v17 = v5;
            do
            {
              sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
              long long v18 = *(_OWORD *)(v41 + v16 * 32 + 16);
              v19 = &array[v16];
              *(_OWORD *)v19->vector.f64 = *(_OWORD *)(v41 + v16 * 32);
              *(_OWORD *)&v19->vector.f64[2] = v18;
              ++v16;
              --v17;
            }
            while (v17);
          }
          goto LABEL_32;
        }
        if (v44)
        {
          if (v45 == v42)
          {
            if (*(void *)&v40[0] < v5) {
              NSUInteger v5 = *(void *)&v40[0];
            }
            if (v5)
            {
              uint64_t v12 = 0;
              NSUInteger v13 = v5;
              do
              {
                sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
                long long v14 = *(_OWORD *)(v41 + v12 * 32 + 16);
                v15 = &array[v12];
                *(_OWORD *)v15->vector.f64 = *(_OWORD *)(v41 + v12 * 32);
                *(_OWORD *)&v15->vector.f64[2] = v14;
                ++v12;
                --v13;
              }
              while (v13);
            }
            goto LABEL_32;
          }
          if ((sub_20B16557C((uint64_t)&v43) & 1) != 0
            || (float32x4_t v20 = sub_20B1653A8((uint64_t)&v43), sub_20B120EA0(&v43, v20), v44))
          {
            float v21 = (long long *)sub_20B165434(&v43);
            sub_20B1654C8((uint64_t)v38, v21);
            NSUInteger v22 = *(void *)&v40[0];
            if (*(void *)&v38[0] < *(void *)&v40[0]) {
              NSUInteger v22 = *(void *)&v38[0];
            }
            if (v22 < v5) {
              NSUInteger v5 = v22;
            }
            if (v5)
            {
              unint64_t v23 = 0;
              double v24 = fmax(fmin((time - v45) / (v42 - v45), 1.0), 0.0);
              NSUInteger v25 = v5;
              do
              {
                sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
                float64_t v34 = *(double *)(v41 + v23);
                float64_t v32 = *(double *)(v41 + v23 + 8);
                float64x2_t v33 = *(float64x2_t *)(v41 + v23 + 16);
                sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v38);
                v26.f64[0] = v34;
                v26.f64[1] = v32;
                float64x2_t v27 = *(float64x2_t *)(v39 + v23);
                float64x2_t v28 = *(float64x2_t *)(v39 + v23 + 16);
                v36[0] = v26;
                v36[1] = v33;
                v35[0] = v27;
                v35[1] = v28;
                sub_20B1655B4(v36, v35, v37, v24);
                uint64_t v29 = &array[v23 / 0x20];
                float64x2_t v30 = v37[1];
                *(float64x2_t *)v29->vector.f64 = v37[0];
                *(float64x2_t *)&v29->vector.f64[2] = v30;
                v23 += 32;
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
    sub_20B06A6E8((uint64_t)v38);
    sub_20B06A6E8((uint64_t)v40);
    sub_20B06A698((uint64_t)&v43);
    sub_20B06A698((uint64_t)&v46);
    return v5;
  }
  NSLog(&cfstr_ArrayCountLuHa_2.isa, a2, array, time, maxCount, elementCount);
  return 0;
}

- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
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
    sub_20B164264((uint64_t)v16, elementCount);
    if (timesCount)
    {
      if (self->_elementCount)
      {
        unint64_t v13 = 0;
        do
        {
          simd_quatf v15 = valuesArray[v13];
          sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v16);
          *(simd_quatf *)(v17 + 16 * v13++) = v15;
        }
        while (v13 < self->_elementCount);
      }
      uint64_t v18 = *(void *)timesArray;
      v19 = &off_26BF50BA8;
      sub_20B0A6DA4();
    }
    sub_20B06A6E8((uint64_t)v16);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray count:(NSUInteger)valuesCount atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)timesCount
{
  uint64_t v23 = *MEMORY[0x263EF8340];
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
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    sub_20B1642D4((uint64_t)v19, elementCount);
    if (timesCount)
    {
      if (self->_elementCount)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          long long v17 = *(_OWORD *)valuesArray[v12].vector.f64;
          long long v18 = *(_OWORD *)&valuesArray[v12].vector.f64[2];
          sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v19);
          long long v14 = (_OWORD *)(v20 + v12 * 32);
          *long long v14 = v17;
          v14[1] = v18;
          ++v13;
          ++v12;
        }
        while (v13 < self->_elementCount);
      }
      uint64_t v21 = *(void *)timesArray;
      NSUInteger v22 = &off_26BF50AF0;
      sub_20B0A6DA4();
    }
    sub_20B06A6E8((uint64_t)v19);
  }
  else
  {
    NSLog(&cfstr_ValueArrayCoun.isa, a2, timesCount, elementCount, elementCount * timesCount, valuesCount);
  }
}

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount
{
  _OWORD v25[2] = *MEMORY[0x263EF8340];
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
        if ((sub_20B163F98((uint64_t)v25) & 1) == 0)
        {
          long long v14 = sub_20B164E04((uint64_t)v25);
          sub_20B120EA0(v25, v14);
        }
        if (sub_20B163F98((uint64_t)v25))
        {
          uint64_t v23 = 0;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v15 = sub_20B164E90(v25);
          long long v16 = *(_OWORD *)(v15 + 16);
          long long v21 = *(_OWORD *)v15;
          long long v22 = v16;
          uint64_t v17 = *(void *)(v15 + 32);
          uint64_t v23 = v17;
          if (v17)
          {
            long long v18 = (atomic_ullong *)(v17 - 16);
            if (*((void *)&v22 + 1)) {
              long long v18 = (atomic_ullong *)*((void *)&v22 + 1);
            }
            atomic_fetch_add_explicit(v18, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            unint64_t v19 = 0;
            do
            {
              sub_20B170A6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v21);
              valuesArray[v11 + v19] = *(simd_quatf *)(v23 + 16 * v19);
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

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount
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
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      if (v7 <= 1) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      }
      do
      {
        uint64_t v27 = 0;
        v28[0] = 0;
        v28[1] = 0;
        unint64_t v13 = (uint64_t *)((char *)self->super._timeSampledData.__begin_ + 24 * v10);
        uint64_t v27 = *v13;
        sub_20B0A592C(v28, v13 + 1);
        if ((sub_20B164008((uint64_t)v28) & 1) == 0)
        {
          long long v14 = sub_20B1653A8((uint64_t)v28);
          sub_20B120EA0(v28, v14);
        }
        if (sub_20B164008((uint64_t)v28))
        {
          uint64_t v26 = 0;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v15 = sub_20B165434(v28);
          long long v16 = *(_OWORD *)(v15 + 16);
          long long v24 = *(_OWORD *)v15;
          long long v25 = v16;
          uint64_t v17 = *(void *)(v15 + 32);
          uint64_t v26 = v17;
          if (v17)
          {
            long long v18 = (atomic_ullong *)(v17 - 16);
            if (*((void *)&v25 + 1)) {
              long long v18 = (atomic_ullong *)*((void *)&v25 + 1);
            }
            atomic_fetch_add_explicit(v18, 1uLL, memory_order_relaxed);
          }
          if (self->_elementCount)
          {
            unint64_t v19 = 0;
            do
            {
              sub_20B170B04((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v24);
              unint64_t v20 = (long long *)(v26 + 32 * v19);
              long long v21 = *v20;
              long long v22 = v20[1];
              uint64_t v23 = &valuesArray[v11];
              *(_OWORD *)v23->vector.f64 = v21;
              *(_OWORD *)&v23->vector.f64[2] = v22;
              ++v11;
              ++v19;
            }
            while (v19 < self->_elementCount);
          }
          sub_20B06A6E8((uint64_t)&v24);
        }
        sub_20B06A698((uint64_t)v28);
        ++v10;
      }
      while (v10 != v12);
      return self->_elementCount * v7;
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