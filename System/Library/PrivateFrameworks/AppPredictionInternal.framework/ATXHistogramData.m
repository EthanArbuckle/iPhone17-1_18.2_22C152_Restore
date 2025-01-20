@interface ATXHistogramData
+ (BOOL)supportsSecureCoding;
- (ATXHistogramData)init;
- (ATXHistogramData)initWithCategoricalHistogram:(id)a3;
- (ATXHistogramData)initWithCoder:(id)a3;
- (ATXHistogramData)initWithTimeHistogram:(id)a3;
- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (float)lookupSmoothedWithBucketCount:(unsigned __int16)a3 distanceScale:(float)a4 a:(unsigned __int16)a5 b:(unsigned __int16)a6;
- (float)lookupUnsmoothedA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (id).cxx_construct;
- (id)aSet;
- (id)bSet;
- (int)countWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (void)add:(float)a3 a:(unsigned __int16)a4 b:(unsigned __int16)a5;
- (void)applyPermutationToA:(id)a3;
- (void)clear;
- (void)decayByFactor:(float)a3;
- (void)decayWithHalfLifeInDays:(float)a3;
- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerate:(id)a3;
@end

@implementation ATXHistogramData

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  [v8 encodeInt32:*(unsigned int *)(*(void *)value + 24) forKey:@"count"];
  v5 = *(void **)value;
  if (*(void *)(*(void *)value + 24))
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:**(void **)value length:4 * *(void *)(*(void *)value + 24)];
    [v8 encodeObject:v6 forKey:@"scores"];

    v5 = *(void **)value;
  }
  if (v5[7])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)(*(void *)value + 32) length:4 * *(void *)(*(void *)value + 56)];
    [v8 encodeObject:v7 forKey:@"abs"];
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHistogramData)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXHistogramData;
  v2 = [(ATXHistogramData *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v5 = v2 + 8;
    v4 = (void *)*((void *)v2 + 1);
    if (v4)
    {
      *((void *)v3 + 2) = v4;
      free(v4);
      void *v5 = 0;
      *((void *)v3 + 2) = 0;
      *((void *)v3 + 3) = 0;
    }
    v7 = v3 + 40;
    v6 = (void *)*((void *)v3 + 5);
    long long v8 = 0uLL;
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    if (v6)
    {
      *((void *)v3 + 6) = v6;
      free(v6);
      long long v8 = 0uLL;
      void *v7 = 0;
      *((void *)v3 + 6) = 0;
      *((void *)v3 + 7) = 0;
    }
    v3[72] = 0;
    *(_OWORD *)v7 = v8;
    *(_OWORD *)(v3 + 56) = v8;
    operator new();
  }
  return 0;
}

- (void)clear
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(unsigned char *)(*(void *)value + 64))
  {
    __break(1u);
  }
  else
  {
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(void *)value, 0);
    _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(void *)value + 32, 0);
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (void)add:(float)a3 a:(unsigned __int16)a4 b:(unsigned __int16)a5
{
  if (fabsf(a3) != INFINITY)
  {
    int v6 = a5;
    int v7 = a4;
    value = (char *)self->_guardedData.__ptr_.__value_;
    v9 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    objc_super v10 = *(void **)value;
    if (*(unsigned char *)(*(void *)value + 64))
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = v10[7];
      if (v11)
      {
        uint64_t v12 = 0;
        while (*(_DWORD *)(v10[4] + 4 * v12) != (v6 | (v7 << 16)))
        {
          if (v11 == ++v12) {
            goto LABEL_7;
          }
        }
        *(float *)(*v10 + 4 * v12) = fmaxf(*(float *)(*v10 + 4 * v12) + a3, 0.0);
      }
      else
      {
LABEL_7:
        if (a3 >= 0.0)
        {
          uint64_t v13 = v10[3];
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(*(void *)value, v13 + 1);
          *(float *)(*v10 + 4 * v13) = fmaxf(a3, 0.0);
          v14 = (void *)(*(void *)value + 32);
          uint64_t v15 = *(void *)(*(void *)value + 56);
          _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)v14, v15 + 1);
          *(_DWORD *)(*v14 + 4 * v15) = v6 | (v7 << 16);
        }
      }
      pthread_mutex_unlock(v9);
    }
  }
}

- (float)lookupUnsmoothedA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  int v7 = **(int8x16_t ***)value;
  uint64_t v8 = *(void *)(*(void *)value + 8) - (void)v7;
  if (v8)
  {
    unint64_t v9 = v8 >> 5;
    objc_super v10 = *(int16x8_t **)(*(void *)value + 32);
    int16x8_t v11 = (int16x8_t)vdupq_n_s32(v4 | (v5 << 16));
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    float32x4_t v12 = 0uLL;
    v13.i64[0] = -1;
    v13.i64[1] = -1;
    int16x8_t v14 = vceqq_s16(v11, v13);
    int8x8_t v15 = vmovn_s16(v14);
    float32x4_t v16 = 0uLL;
    do
    {
      int16x8_t v18 = *v10;
      int16x8_t v17 = v10[1];
      v10 += 2;
      int16x8_t v19 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v17, v11), (int8x16_t)v14);
      int16x8_t v20 = vcltzq_s16(vshlq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(v18, v11)), v15)), 0xFuLL));
      int8x16_t v22 = *v7;
      int8x16_t v21 = v7[1];
      v7 += 2;
      float32x4_t v16 = vaddq_f32(v16, (float32x4_t)vandq_s8(vandq_s8(v21, (int8x16_t)v19), (int8x16_t)vrev32q_s16(v19)));
      float32x4_t v12 = vaddq_f32(v12, (float32x4_t)vandq_s8(vandq_s8(v22, (int8x16_t)v20), (int8x16_t)vrev32q_s16(v20)));
      --v9;
    }
    while (v9);
  }
  else
  {
    float32x4_t v12 = 0uLL;
    float32x4_t v16 = 0uLL;
  }
  float32x4_t v25 = v16;
  float32x4_t v26 = v12;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  int8x16_t v23 = (int8x16_t)vaddq_f32(v26, v25);
  float result = vaddv_f32(vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL)));
  if (fabsf(result) == INFINITY) {
    return 0.0;
  }
  return result;
}

- (float)lookupSmoothedWithBucketCount:(unsigned __int16)a3 distanceScale:(float)a4 a:(unsigned __int16)a5 b:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  int v7 = a5;
  unsigned int v8 = a3;
  if (a6 == 0xFFFF)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 329, @"Invalid parameter not satisfying: %@", @"b != SUMALL" object file lineNumber description];
  }
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v11 = **(void **)value;
  uint64_t v12 = *(void *)(*(void *)value + 8);
  uint64_t v13 = v12 - v11;
  if (v12 == v11)
  {
    float32x4_t v19 = 0uLL;
    float32x4_t v30 = 0uLL;
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v15 = v13 >> 5;
    int16x8_t v16 = (int16x8_t)vdupq_n_s32((v7 << 16) | 0xFFFFu);
    int32x4_t v17 = vdupq_n_s32(v6);
    int32x4_t v18 = vdupq_n_s32(v8);
    float32x4_t v19 = 0uLL;
    v20.i64[0] = -1;
    v20.i64[1] = -1;
    int16x8_t v21 = vceqq_s16(v16, v20);
    int8x8_t v22 = vmovn_s16(v21);
    v23.i64[0] = 0xFF000000FFLL;
    v23.i64[1] = 0xFF000000FFLL;
    __asm { FMOV            V6.4S, #1.0 }
    float32x4_t v29 = (float32x4_t)vdupq_n_s32(0x3F36DB6Eu);
    float32x4_t v30 = 0uLL;
    do
    {
      uint64_t v31 = *(void *)(*(void *)value + 32) + 32 * v14;
      int8x16_t v32 = *(int8x16_t *)v31;
      int16x8_t v33 = *(int16x8_t *)(v31 + 16);
      int16x8_t v34 = (int16x8_t)vmovl_u8((uint8x8_t)vorr_s8(vmovn_s16(vceqq_s16(*(int16x8_t *)v31, v16)), v22));
      int16x8_t v35 = (int16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v33, v16), (int8x16_t)v21);
      v36 = (int8x16_t *)(v11 + 32 * v14);
      int32x4_t v37 = vabdq_s32((int32x4_t)vandq_s8(v32, v23), v17);
      int16x8_t v38 = vcltzq_s16(vshlq_n_s16(v34, 0xFuLL));
      int32x4_t v39 = vabdq_s32((int32x4_t)vandq_s8((int8x16_t)v33, v23), v17);
      float32x4_t v40 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v39), v39)), a4);
      float32x4_t v41 = vmulq_n_f32(vcvtq_f32_s32(vminq_s32(vsubq_s32(v18, v37), v37)), a4);
      float32x4_t v42 = vmlaq_f32(_Q6, v41, v41);
      float32x4_t v43 = vmulq_f32(vmlaq_f32(_Q6, v40, v40), v29);
      float32x4_t v44 = vmulq_f32(v42, v29);
      float32x4_t v45 = vrecpeq_f32(v44);
      float32x4_t v46 = vmulq_f32(v45, vrecpsq_f32(v44, v45));
      float32x4_t v47 = vrecpeq_f32(v43);
      float32x4_t v30 = vaddq_f32(v30, vmulq_f32(vmulq_f32(v47, vrecpsq_f32(v43, v47)), (float32x4_t)vandq_s8(vandq_s8(v36[1], (int8x16_t)v35), (int8x16_t)vrev32q_s16(v35))));
      float32x4_t v19 = vaddq_f32(v19, vmulq_f32(v46, (float32x4_t)vandq_s8(vandq_s8(*v36, (int8x16_t)v38), (int8x16_t)vrev32q_s16(v38))));
      ++v14;
    }
    while (v15 > v14);
  }
  float32x4_t v52 = v30;
  float32x4_t v54 = v19;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  int8x16_t v48 = (int8x16_t)vaddq_f32(v54, v52);
  float result = vaddv_f32(vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)));
  if (fabsf(result) == INFINITY) {
    return 0.0;
  }
  return result;
}

- (float)entropyWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v5 = a3;
  value = (uint64_t **)self->_guardedData.__ptr_.__value_;
  unsigned int v6 = (pthread_mutex_t *)(value + 1);
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  float v7 = entropy(&value, v5, v4);
  pthread_mutex_unlock(v6);
  return v7;
}

- (void)enumerate:(id)a3
{
  id v11 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  char v6 = *(unsigned char *)(*(void *)value + 64);
  *(unsigned char *)(v5 + 64) = 1;
  if (*(void *)(v5 + 56))
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      if (*(float *)(*(void *)v5 + 4 * v7) > 0.0)
      {
        unsigned int v9 = *(_DWORD *)(*(void *)(v5 + 32) + 4 * v7);
        (*((void (**)(id, void, void))v11 + 2))(v11, HIWORD(v9), (unsigned __int16)v9);
        uint64_t v5 = *(void *)value;
      }
      uint64_t v7 = v8;
    }
    while (*(void *)(v5 + 56) > (unint64_t)v8++);
  }
  *(unsigned char *)(v5 + 64) = v6;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

- (int)countWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  if ((a4 & a3) == 0xFFFF)
  {
    value = (char *)self->_guardedData.__ptr_.__value_;
    uint64_t v7 = (pthread_mutex_t *)(value + 8);
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    int v5 = *(_DWORD *)(*(void *)value + 24);
    pthread_mutex_unlock(v7);
    return v5;
  }
  if (a3 == 0xFFFF)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__ATXHistogramData_countWhereA_b___block_invoke;
    v11[3] = &unk_1E68B2660;
    unsigned __int16 v12 = a4;
    v11[4] = &v13;
    [(ATXHistogramData *)self enumerate:v11];
LABEL_8:
    int v5 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);
    return v5;
  }
  if (a4 == 0xFFFF)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__ATXHistogramData_countWhereA_b___block_invoke_2;
    v9[3] = &unk_1E68B2660;
    unsigned __int16 v10 = a3;
    v9[4] = &v13;
    [(ATXHistogramData *)self enumerate:v9];
    goto LABEL_8;
  }
  -[ATXHistogramData lookupUnsmoothedA:b:](self, "lookupUnsmoothedA:b:");
  return v4 > 0.0;
}

uint64_t __34__ATXHistogramData_countWhereA_b___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(result + 40) == a3) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t __34__ATXHistogramData_countWhereA_b___block_invoke_2(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 40) == a2) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

- (void)deleteWhereA:(unsigned __int16)a3 b:(unsigned __int16)a4
{
  if ((a4 & a3) == 0xFFFF)
  {
    [(ATXHistogramData *)self clear];
  }
  else
  {
    int v4 = a4;
    int v5 = a3;
    value = (char *)self->_guardedData.__ptr_.__value_;
    pthread_mutex_lock((pthread_mutex_t *)(value + 8));
    uint64_t v7 = *(void **)value;
    if (*(unsigned char *)(*(void *)value + 64))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = v7[3];
      if (v8)
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        uint64_t v11 = v7[4];
        do
        {
          unsigned int v12 = *(_DWORD *)(v11 + 4 * v9);
          BOOL v14 = v4 == 0xFFFF || v4 == (unsigned __int16)*(_DWORD *)(v11 + 4 * v9);
          BOOL v15 = HIWORD(v12) == v5 || v5 == 0xFFFF;
          if (!v15 || !v14)
          {
            *(_DWORD *)(v11 + 4 * v10) = v12;
            *(_DWORD *)(*v7 + 4 * v10++) = *(_DWORD *)(*v7 + 4 * v9);
          }
          ++v9;
        }
        while (v8 != v9);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)v7, v10);
        _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(*(void *)value + 32, v10);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
    }
  }
}

- (void)decayByFactor:(float)a3
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if (*(unsigned char *)(*(void *)value + 64))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = **(void **)value;
    if (*(void *)(*(void *)value + 8) != v4)
    {
      unint64_t v5 = 0;
      do
      {
        char v6 = (float32x4_t *)(v4 + 32 * v5);
        float32x4_t v7 = vmulq_n_f32(v6[1], a3);
        float32x4_t *v6 = vmulq_n_f32(*v6, a3);
        v6[1] = v7;
        ++v5;
        uint64_t v4 = **(void **)value;
      }
      while (v5 < (*(void *)(*(void *)value + 8) - v4) >> 5);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  }
}

- (void)decayWithHalfLifeInDays:(float)a3
{
  long double v4 = exp2(-1.0 / a3);
  *(float *)&long double v4 = v4;
  [(ATXHistogramData *)self decayByFactor:(double)v4];
}

- (id)aSet
{
  v3 = objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  if (*(void *)(*(void *)value + 56))
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v3 addIndex:*(unsigned __int16 *)(*(void *)(v5 + 32) + 4 * v6 + 2)];
      uint64_t v6 = v7;
      uint64_t v5 = *(void *)value;
    }
    while (*(void *)(*(void *)value + 56) > (unint64_t)v7++);
  }
  id v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (id)bSet
{
  v3 = objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v5 = *(void *)value;
  if (*(void *)(*(void *)value + 56))
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v3 addIndex:*(unsigned __int16 *)(*(void *)(v5 + 32) + 4 * v6)];
      uint64_t v6 = v7;
      uint64_t v5 = *(void *)value;
    }
    while (*(void *)(*(void *)value + 56) > (unint64_t)v7++);
  }
  id v9 = v3;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (ATXHistogramData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXHistogramData *)self init];
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v6 = MEMORY[0x1D25F6CC0]();
  value = (void ***)v5->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 1));
  int v8 = [v4 decodeInt32ForKey:@"count"];
  context = (void *)v6;
  if (!v8) {
    goto LABEL_15;
  }
  unint64_t v9 = v8;
  _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm((uint64_t)*value, v8);
  _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm((uint64_t)(*value + 4), v9);
  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scores"];
  uint64_t v11 = [v10 length];
  if (v11 == 4 * v9)
  {
    if (v10)
    {
      unsigned int v12 = **value;
      id v13 = v10;
      memcpy(v12, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }
    BOOL v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abs"];

    if ([v14 length] == v11)
    {
      if (v14)
      {
        BOOL v15 = (*value)[4];
        id v16 = v14;
        memcpy(v15, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
      }
      unint64_t v17 = (unint64_t)(*value)[3];
      if (v17)
      {
        uint64_t v18 = 0;
        float32x4_t v19 = **value;
        do
        {
          if (fabsf(*(float *)&v19[v18]) == INFINITY) {
            v19[v18] = 0;
          }
          ++v18;
        }
        while (v17 > v18);
      }

LABEL_15:
      char v20 = 1;
      goto LABEL_22;
    }
    int16x8_t v21 = __atxlog_handle_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ATXHistogramData initWithCoder:](v21);
    }
    unint64_t v10 = v14;
  }
  else
  {
    int16x8_t v21 = __atxlog_handle_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ATXHistogramData initWithCoder:](v21);
    }
  }

  char v20 = 0;
LABEL_22:
  pthread_mutex_unlock((pthread_mutex_t *)(value + 1));
  if ((v20 & 1) == 0)
  {
    int8x8_t v22 = 0;
    goto LABEL_25;
  }
LABEL_23:
  int8x8_t v22 = v5;
LABEL_25:

  return v22;
}

- (ATXHistogramData)initWithTimeHistogram:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 592, @"Invalid parameter not satisfying: %@", @"histogram" object file lineNumber description];
  }
  uint64_t v6 = [(ATXHistogramData *)self init];
  unsigned int v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__ATXHistogramData_initWithTimeHistogram___block_invoke;
    v10[3] = &unk_1E68B2688;
    uint64_t v11 = v6;
    [v5 enumerate:v10];
  }
  return v7;
}

uint64_t __42__ATXHistogramData_initWithTimeHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(float *)&a4 = a4;
  return [*(id *)(a1 + 32) add:a2 a:a3 b:a4];
}

- (ATXHistogramData)initWithCategoricalHistogram:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 603, @"Invalid parameter not satisfying: %@", @"histogram" object file lineNumber description];
  }
  uint64_t v6 = [(ATXHistogramData *)self init];
  unsigned int v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__ATXHistogramData_initWithCategoricalHistogram___block_invoke;
    v10[3] = &unk_1E68B2688;
    uint64_t v11 = v6;
    [v5 enumerate:v10];
  }
  return v7;
}

uint64_t __49__ATXHistogramData_initWithCategoricalHistogram___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(float *)&a4 = a4;
  return [*(id *)(a1 + 32) add:a2 a:a3 b:a4];
}

- (void)applyPermutationToA:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    unint64_t v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXHistogramData applyPermutationToA:](v17);
    }

    goto LABEL_15;
  }
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  unsigned int v8 = [v6 length];
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  uint64_t v10 = *(void *)value;
  if (!*(unsigned char *)(*(void *)value + 64))
  {
    if (*(void *)(v10 + 56))
    {
      uint64_t v11 = 0;
      unsigned int v12 = 1;
      do
      {
        uint64_t v13 = *(void *)(v10 + 32);
        unint64_t v14 = (unint64_t)*(unsigned int *)(v13 + 4 * v11) >> 16;
        if (HIWORD(*(_DWORD *)(v13 + 4 * v11)) >= (unsigned __int16)(v8 >> 1))
        {
          BOOL v15 = __atxlog_handle_default();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            int v19 = v14;
            __int16 v20 = 1024;
            int v21 = (unsigned __int16)(v8 >> 1);
            _os_log_error_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_ERROR, "%u not found in permutation of length %u", buf, 0xEu);
          }

          uint64_t v10 = *(void *)value;
        }
        else
        {
          *(_DWORD *)(v13 + 4 * v11) = (unsigned __int16)*(_DWORD *)(v13 + 4 * v11) | (*(unsigned __int16 *)(v7 + 2 * v14) << 16);
        }
        uint64_t v11 = v12;
      }
      while (*(void *)(v10 + 56) > (unint64_t)v12++);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
LABEL_15:

    return;
  }
  __break(1u);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->_anon_8[32];
  if (v3)
  {
    *(void *)&self->_anon_8[40] = v3;
    free(v3);
  }
  id v4 = *(void **)self->_anon_8;
  if (v4)
  {
    *(void *)&self->_anon_8[8] = v4;
    free(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((void *)self + 10) = 0;
  return self;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "invalid input for abs in initWithCoder", v1, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "invalid input for scores in initWithCoder", v1, 2u);
}

- (void)applyPermutationToA:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "invalid input for applyPermutationToA: %@", (uint8_t *)&v1, 0xCu);
}

@end