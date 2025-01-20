@interface ARCoachingInstanceTransform
- (ARCoachingInstanceTransform)init:(__n128)a3;
- (__n128)localScale;
- (__n128)localTranslation;
- (__n128)recordedScale;
- (__n128)recordedTranslation;
- (__n128)transform;
- (void)doTransform;
- (void)setLocalScale:(ARCoachingInstanceTransform *)self;
- (void)setLocalTranslation:(ARCoachingInstanceTransform *)self;
- (void)setRecordedScale:(ARCoachingInstanceTransform *)self;
- (void)setRecordedTranslation:(ARCoachingInstanceTransform *)self;
@end

@implementation ARCoachingInstanceTransform

- (__n128)transform
{
  return a1[5];
}

- (__n128)localScale
{
  return a1[9];
}

- (void)setLocalScale:(ARCoachingInstanceTransform *)self
{
  *(_OWORD *)self->_localScale = v2;
  [(ARCoachingInstanceTransform *)self doTransform];
}

- (__n128)localTranslation
{
  return a1[10];
}

- (void)setLocalTranslation:(ARCoachingInstanceTransform *)self
{
  *(_OWORD *)self->_localTranslation = v2;
  [(ARCoachingInstanceTransform *)self doTransform];
}

- (ARCoachingInstanceTransform)init:(__n128)a3
{
  v17.receiver = a1;
  v17.super_class = (Class)ARCoachingInstanceTransform;
  v5 = [(ARCoachingInstanceTransform *)&v17 init];
  v6 = v5;
  if (v5)
  {
    *(__n128 *)v5->_anon_10 = a2;
    *(__n128 *)&v5->_anon_10[16] = a3;
    *(__n128 *)&v5->_anon_10[32] = a4;
    *(__n128 *)&v5->_anon_10[48] = a5;
    *(__n128 *)v5->_anon_50 = a2;
    *(__n128 *)&v5->_anon_50[16] = a3;
    *(__n128 *)&v5->_anon_50[32] = a4;
    *(__n128 *)&v5->_anon_50[48] = a5;
    *(_OWORD *)v5->_localScale = 0u;
    *(_OWORD *)v5->_localTranslation = 0u;
    __asm { FMOV            V0.4S, #1.0 }
    [(ARCoachingInstanceTransform *)v5 setRecordedScale:*(double *)&_Q0];
    [(ARCoachingInstanceTransform *)v6 setRecordedTranslation:0.0];
  }
  return v6;
}

- (void)doTransform
{
  [(ARCoachingInstanceTransform *)self localScale];
  +[ARCoachingTransformations scale:](ARCoachingTransformations, "scale:");
  float32x4_t v21 = v4;
  float32x4_t v22 = v3;
  float32x4_t v19 = v6;
  float32x4_t v20 = v5;
  [(ARCoachingInstanceTransform *)self localTranslation];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:");
  uint64_t v11 = 0;
  long long v12 = *(_OWORD *)&self->_anon_10[16];
  long long v13 = *(_OWORD *)&self->_anon_10[32];
  long long v14 = *(_OWORD *)&self->_anon_10[48];
  long long v23 = *(_OWORD *)self->_anon_10;
  long long v24 = v12;
  long long v25 = v13;
  long long v26 = v14;
  do
  {
    *(long long *)((char *)&v27 + v11) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(long long *)((char *)&v23 + v11))), v8, *(float32x2_t *)((char *)&v23 + v11), 1), v9, *(float32x4_t *)((char *)&v23 + v11), 2), v10, *(float32x4_t *)((char *)&v23 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  uint64_t v15 = 0;
  long long v23 = v27;
  long long v24 = v28;
  long long v25 = v29;
  long long v26 = v30;
  do
  {
    *(long long *)((char *)&v27 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(long long *)((char *)&v23 + v15))), v21, *(float32x2_t *)((char *)&v23 + v15), 1), v20, *(float32x4_t *)((char *)&v23 + v15), 2), v19, *(float32x4_t *)((char *)&v23 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  long long v16 = v28;
  long long v17 = v29;
  long long v18 = v30;
  *(_OWORD *)self->_anon_50 = v27;
  *(_OWORD *)&self->_anon_50[16] = v16;
  *(_OWORD *)&self->_anon_50[32] = v17;
  *(_OWORD *)&self->_anon_50[48] = v18;
}

- (__n128)recordedScale
{
  return a1[11];
}

- (void)setRecordedScale:(ARCoachingInstanceTransform *)self
{
  *(_OWORD *)self->_recordedScale = v2;
}

- (__n128)recordedTranslation
{
  return a1[12];
}

- (void)setRecordedTranslation:(ARCoachingInstanceTransform *)self
{
  *(_OWORD *)self->_recordedTranslation = v2;
}

@end