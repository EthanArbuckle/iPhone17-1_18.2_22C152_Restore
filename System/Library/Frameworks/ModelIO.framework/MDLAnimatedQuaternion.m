@interface MDLAnimatedQuaternion
- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id)copyWithZone:(_NSZone *)a3;
- (simd_quatd)doubleQuaternionAtTime:(NSTimeInterval)time;
- (simd_quatf)floatQuaternionAtTime:(NSTimeInterval)time;
- (unint64_t)precision;
- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4;
- (void)resetWithUsdAttribute:(const void *)a3 timeScale:(double)a4 time:(double)a5;
- (void)setDoubleQuaternion:atTime:;
- (void)setFloatQuaternion:(simd_quatf)value atTime:(NSTimeInterval)time;
@end

@implementation MDLAnimatedQuaternion

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDLAnimatedQuaternion;
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
  if (sub_20B164FD8((uint64_t)v5) & 1) != 0 || (sub_20B16AAE0((uint64_t)v5))
  {
    sub_20B06A698((uint64_t)v5);
    return 1;
  }
  char v4 = sub_20B16557C((uint64_t)v5);
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
  if (!sub_20B16AAE0((uint64_t)v5))
  {
    if (sub_20B164FD8((uint64_t)v5))
    {
      *(void *)(v3 + 8) = &off_26BF500E0;
      operator new();
    }
    if (sub_20B16557C((uint64_t)v5))
    {
      *(void *)(v3 + 8) = &off_26BF50028;
      operator new();
    }
    self = (MDLAnimatedQuaternion *)sub_20B06A698((uint64_t)v5);
    goto LABEL_9;
  }
  *(void *)(v3 + 8) = (char *)&off_26BF50198 + 1;
  self = (MDLAnimatedQuaternion *)sub_20B06A698((uint64_t)v5);
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
  if ((sub_20B16AAE0((uint64_t)v10) & 1) != 0
    || (sub_20B164FD8((uint64_t)v10) & 1) != 0
    || sub_20B16557C((uint64_t)v10))
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
  if ((sub_20B16AAE0((uint64_t)v10) & 1) != 0
    || (sub_20B164FD8((uint64_t)v10) & 1) != 0
    || sub_20B16557C((uint64_t)v10))
  {
    double v8 = a5 * a4;
    sub_20B0A592C(v9, v10);
    sub_20B1601A4((uint64_t *)&self->super._timeSampledData, &v8);
    sub_20B06A698((uint64_t)v9);
  }
  sub_20B06A698((uint64_t)v10);
}

- (void)setFloatQuaternion:(simd_quatf)value atTime:(NSTimeInterval)time
{
}

- (void)setDoubleQuaternion:atTime:
{
}

- (simd_quatf)floatQuaternionAtTime:(NSTimeInterval)time
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  double v50 = 0.0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  double v47 = 0.0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v50, (uint64_t)&v47, time);
  simd_quatf v45 = (simd_quatf)0;
  if (v52
    && ((sub_20B16AAE0((uint64_t)&v51) & 1) != 0
     || (sub_20B164FD8((uint64_t)&v51) & 1) != 0
     || (sub_20B16557C((uint64_t)&v51) & 1) != 0))
  {
    char v5 = sub_20B164FD8((uint64_t)&v51);
    v6 = (std::type_info *)&v51;
    if ((v5 & 1) == 0) {
      v6 = sub_20B16B690((uint64_t)&v51);
    }
    v7 = (float32x4_t *)sub_20B16B5FC(v6);
    float32x4_t v8 = *v7;
    if (!self->super._interpolation) {
      goto LABEL_25;
    }
    float32x4_t v43 = *v7;
    if (v49)
    {
      if (v50 != v47
        && ((v9 = (std::type_info *)&v48, (sub_20B16AAE0((uint64_t)&v48) & 1) != 0)
         || (sub_20B164FD8((uint64_t)&v48) & 1) != 0
         || sub_20B16557C((uint64_t)&v48)))
      {
        if ((sub_20B164FD8((uint64_t)&v48) & 1) == 0) {
          v9 = sub_20B16B690((uint64_t)&v48);
        }
        v10 = (float32x4_t *)sub_20B16B5FC(v9);
        float v11 = fmax(fmin((time - v50) / (v47 - v50), 1.0), 0.0);
        float32x4_t v12 = vmulq_f32(*v10, v43);
        float32x4_t v13 = (float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL);
        *(float32x2_t *)v12.f32 = vadd_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v13.f32);
        v12.f32[0] = vaddv_f32(*(float32x2_t *)v12.f32);
        v13.i64[0] = 0;
        float32x4_t v14 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v12, v13)), 0), (int8x16_t)vnegq_f32(*v10), *(int8x16_t *)v10);
        float v15 = 1.0;
        float v16 = 1.0 - v11;
        float32x4_t v17 = vsubq_f32(v43, v14);
        int8x16_t v18 = (int8x16_t)vmulq_f32(v17, v17);
        float32x4_t v46 = v14;
        float32x4_t v19 = vaddq_f32(v14, v43);
        int8x16_t v20 = (int8x16_t)vmulq_f32(v19, v19);
        float v21 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)))));
        float v22 = v21 + v21;
        BOOL v23 = (float)(v21 + v21) == 0.0;
        float v24 = 1.0;
        if (!v23) {
          float v24 = sinf(v22) / v22;
        }
        uint64_t v25 = LODWORD(v24);
        float32x2_t v26 = vrecpe_f32((float32x2_t)LODWORD(v24));
        float32x2_t v27 = vmul_f32(vrecps_f32((float32x2_t)v25, v26), v26);
        LODWORD(v28) = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
        if ((float)(v16 * v22) != 0.0)
        {
          float v41 = v28;
          float v29 = sinf(v16 * v22);
          float v28 = v41;
          float v15 = v29 / (float)(v16 * v22);
        }
        float32x4_t v30 = vmulq_n_f32(v43, (float)(v28 * v16) * v15);
        float v31 = v22 * v11;
        float v32 = 1.0;
        if (v31 != 0.0)
        {
          float v42 = v28;
          float32x4_t v44 = v30;
          float v33 = sinf(v31);
          float v28 = v42;
          float32x4_t v30 = v44;
          float v32 = v33 / v31;
        }
        float32x4_t v34 = vmlaq_n_f32(v30, v46, (float)(v28 * v11) * v32);
        int8x16_t v35 = (int8x16_t)vmulq_f32(v34, v34);
        float32x2_t v36 = vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
        if (vaddv_f32(v36) == 0.0)
        {
          float32x4_t v8 = (float32x4_t)xmmword_20B1E75C0;
        }
        else
        {
          unsigned __int32 v37 = vadd_f32(v36, (float32x2_t)vdup_lane_s32((int32x2_t)v36, 1)).u32[0];
          float32x2_t v38 = vrsqrte_f32((float32x2_t)v37);
          float32x2_t v39 = vmul_f32(vrsqrts_f32((float32x2_t)v37, vmul_f32(v38, v38)), v38);
          float32x4_t v8 = vmulq_n_f32(v34, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37, vmul_f32(v39, v39))).f32[0]);
        }
      }
      else
      {
        float32x4_t v8 = v43;
      }
LABEL_25:
      simd_quatf v45 = (simd_quatf)v8;
    }
  }
  sub_20B06A698((uint64_t)&v48);
  sub_20B06A698((uint64_t)&v51);
  return v45;
}

- (simd_quatd)doubleQuaternionAtTime:(NSTimeInterval)time
{
  uint64_t v6 = v3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v28 = 0.0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  double v25 = 0.0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  sub_20B161000((double **)&self->super._timeSampledData, (uint64_t)&v28, (uint64_t)&v25, time);
  if (!v30
    || (sub_20B16AAE0((uint64_t)&v29) & 1) == 0
    && (sub_20B164FD8((uint64_t)&v29) & 1) == 0
    && (sub_20B16557C((uint64_t)&v29) & 1) == 0)
  {
    goto LABEL_12;
  }
  char v7 = sub_20B16557C((uint64_t)&v29);
  float32x4_t v8 = (std::type_info *)&v29;
  if ((v7 & 1) == 0) {
    float32x4_t v8 = sub_20B16B9C8((uint64_t)&v29);
  }
  v9 = (float64x2_t *)sub_20B16B934(v8);
  float64x2_t v10 = *v9;
  float64x2_t v11 = v9[1];
  if (!self->super._interpolation) {
    goto LABEL_11;
  }
  float64x2_t v21 = *v9;
  float64x2_t v22 = v9[1];
  if (!v27)
  {
LABEL_12:
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    goto LABEL_13;
  }
  if (v28 == v25
    || (float v16 = (std::type_info *)&v26, (sub_20B16AAE0((uint64_t)&v26) & 1) == 0)
    && (sub_20B164FD8((uint64_t)&v26) & 1) == 0
    && (sub_20B16557C((uint64_t)&v26) & 1) == 0)
  {
    float64x2_t v10 = v21;
    float64x2_t v11 = v22;
LABEL_11:
    *(float64x2_t *)uint64_t v6 = v10;
    *(float64x2_t *)(v6 + 16) = v11;
    goto LABEL_13;
  }
  if ((sub_20B16557C((uint64_t)&v26) & 1) == 0) {
    float v16 = sub_20B16B9C8((uint64_t)&v26);
  }
  float32x4_t v17 = (float64x2_t *)sub_20B16B934(v16);
  float64x2_t v18 = *v17;
  float64x2_t v19 = v17[1];
  float v20 = fmax(fmin((time - v28) / (v25 - v28), 1.0), 0.0);
  v24[0] = v21;
  v24[1] = v22;
  v23[0] = v18;
  v23[1] = v19;
  sub_20B1655B4(v24, v23, (float64x2_t *)v6, v20);
LABEL_13:
  sub_20B06A698((uint64_t)&v26);
  sub_20B06A698((uint64_t)&v29);
  result.vector.f64[3] = v15;
  result.vector.f64[2] = v14;
  result.vector.f64[1] = v13;
  result.vector.f64[0] = v12;
  return result;
}

- (void)resetWithFloatQuaternionArray:(const simd_quatf *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      v9 = (TimeSampledVtValue *)((char *)end - 24);
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

- (void)resetWithDoubleQuaternionArray:(const simd_quatd *)valuesArray atTimes:(const NSTimeInterval *)timesArray count:(NSUInteger)count
{
  begin = self->super._timeSampledData.__begin_;
  end = self->super._timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      v9 = (TimeSampledVtValue *)((char *)end - 24);
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

- (NSUInteger)getFloatQuaternionArray:(simd_quatf *)valuesArray maxCount:(NSUInteger)maxCount
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
      if (sub_20B164FD8((uint64_t)v12))
      {
        v9 = (simd_quatf *)sub_20B16B5FC(v12);
      }
      else
      {
        float64x2_t v10 = sub_20B16B690((uint64_t)v12);
        v9 = (simd_quatf *)sub_20B16B5FC(v10);
      }
      *valuesArray++ = *v9;
      sub_20B06A698((uint64_t)v12);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

- (NSUInteger)getDoubleQuaternionArray:(simd_quatd *)valuesArray maxCount:(NSUInteger)maxCount
{
  v13[2] = *MEMORY[0x263EF8340];
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
      v13[0] = 0;
      v13[1] = 0;
      sub_20B0A592C(v13, (TimeSampledVtValue *)((char *)self->super._timeSampledData.__begin_ + v7 + 8));
      if (sub_20B16557C((uint64_t)v13))
      {
        v9 = (_OWORD *)sub_20B16B934(v13);
      }
      else
      {
        float64x2_t v10 = sub_20B16B9C8((uint64_t)v13);
        v9 = (_OWORD *)sub_20B16B934(v10);
      }
      long long v11 = v9[1];
      *(_OWORD *)valuesArray->vector.f64 = *v9;
      *(_OWORD *)&valuesArray->vector.f64[2] = v11;
      ++valuesArray;
      sub_20B06A698((uint64_t)v13);
      v7 += 24;
      --v8;
    }
    while (v8);
  }
  return v4;
}

@end