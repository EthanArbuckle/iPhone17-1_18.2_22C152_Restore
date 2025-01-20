@interface MDLTransform
+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4;
+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4;
- (BOOL)resetsTransform;
- (CAAnimation)transformAnimation;
- (MDLTransform)init;
- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix;
- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix resetsTransform:(BOOL)resetsTransform;
- (MDLTransform)initWithTransformComponent:(id)component;
- (MDLTransform)initWithTransformComponent:(id)component resetsTransform:(BOOL)resetsTransform;
- (NSArray)keyTimes;
- (__n128)localTransformAtTime:(__n128 *)a1;
- (__n128)matrix;
- (double)maximumTime;
- (double)minimumTime;
- (double)setLocalTransform:(__n128)a3;
- (double)setMatrix:(__n128)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (matrix_float4x4)rotationMatrixAtTime:(NSTimeInterval)time;
- (vector_float3)rotation;
- (vector_float3)rotationAtTime:(NSTimeInterval)time;
- (vector_float3)scale;
- (vector_float3)scaleAtTime:(NSTimeInterval)time;
- (vector_float3)shear;
- (vector_float3)shearAtTime:(NSTimeInterval)time;
- (vector_float3)translation;
- (vector_float3)translationAtTime:(NSTimeInterval)time;
- (void)setIdentity;
- (void)setLocalTransform:(__n128)a3 forTime:(__n128)a4;
- (void)setMatrix:(matrix_float4x4)matrix forTime:(NSTimeInterval)time;
- (void)setResetsTransform:(BOOL)a3;
- (void)setRotation:(vector_float3)rotation;
- (void)setRotation:(vector_float3)rotation forTime:(NSTimeInterval)time;
- (void)setScale:(vector_float3)scale;
- (void)setScale:(vector_float3)scale forTime:(NSTimeInterval)time;
- (void)setShear:(vector_float3)shear;
- (void)setShear:(vector_float3)shear forTime:(NSTimeInterval)time;
- (void)setTranslation:(vector_float3)translation;
- (void)setTranslation:(vector_float3)translation forTime:(NSTimeInterval)time;
@end

@implementation MDLTransform

- (NSArray)keyTimes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  __p = 0;
  v14 = 0;
  uint64_t v15 = 0;
  sub_20B0CB678((long long **)&self->_transform, (uint64_t)&__p);
  v7 = (double *)__p;
  v6 = v14;
  if (v14 == __p)
  {
    v10 = objc_msgSend_numberWithDouble_(NSNumber, v4, v5, 0.0);
    objc_msgSend_addObject_(v3, v11, (uint64_t)v10);
  }
  else
  {
    do
    {
      v8 = objc_msgSend_numberWithDouble_(NSNumber, v4, v5, *v7);
      objc_msgSend_addObject_(v3, v9, (uint64_t)v8);

      ++v7;
    }
    while (v7 != v6);
  }
  if (__p)
  {
    v14 = (double *)__p;
    operator delete(__p);
  }

  return (NSArray *)v3;
}

- (double)minimumTime
{
  double result = self->_transform._startTime;
  if (result == 1.79769313e308) {
    return 0.0;
  }
  return result;
}

- (double)maximumTime
{
  double result = self->_transform._greatestTime;
  if (result == 1.79769313e308) {
    return 0.0;
  }
  return result;
}

- (__n128)matrix
{
  return a1[9];
}

- (double)setMatrix:(__n128)a3
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(void *)&double result = sub_20B0CAB60(a1 + 16, v6).n128_u64[0];
  return result;
}

- (vector_float3)translation
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setTranslation:(vector_float3)translation
{
  sub_20B148408((__n128 **)&self->_transform, v3);
}

- (vector_float3)shear
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setShear:(vector_float3)shear
{
  sub_20B1A70FC(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)scale
{
  if (self->_transform._keyedScale.__end_ == self->_transform._keyedScale.__begin_) {
    __asm { FMOV            V0.4S, #1.0 }
  }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setScale:(vector_float3)scale
{
  sub_20B1A7204(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)rotation
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (BOOL)resetsTransform
{
  return self->_transform._resetTransformStack;
}

- (void)setRotation:(vector_float3)rotation
{
  sub_20B1A7314(&self->_transform._keyedTranslation.__begin_, v3);
}

- (vector_float3)scaleAtTime:(NSTimeInterval)time
{
  sub_20B0CA784((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)shearAtTime:(NSTimeInterval)time
{
  sub_20B0CA6BC((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)translationAtTime:(NSTimeInterval)time
{
  sub_20B0CA5F4((float32x4_t **)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (vector_float3)rotationAtTime:(NSTimeInterval)time
{
  sub_20B0CA368((uint64_t)&self->_transform, time);
  result.i64[1] = v4;
  result.i64[0] = v3;
  return result;
}

- (void)setMatrix:(matrix_float4x4)matrix forTime:(NSTimeInterval)time
{
  matrix_float4x4 v4 = matrix;
  sub_20B0CAED0((uint64_t)&self->_transform, &v4, time);
}

- (void)setRotation:(vector_float3)rotation forTime:(NSTimeInterval)time
{
  sub_20B0CB1A4((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setShear:(vector_float3)shear forTime:(NSTimeInterval)time
{
  sub_20B0CB340((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setScale:(vector_float3)scale forTime:(NSTimeInterval)time
{
  sub_20B0CB4DC((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setTranslation:(vector_float3)translation forTime:(NSTimeInterval)time
{
  sub_20B0CB014((uint64_t)&self->_transform, *(__n128 *)&time, v4);
}

- (void)setResetsTransform:(BOOL)a3
{
  self->_transform._resetTransformStack = a3;
}

- (MDLTransform)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLTransform;
  id v2 = [(MDLTransform *)&v6 init];
  uint64_t v3 = (MDLTransform *)v2;
  if (v2)
  {
    sub_20B06C3BC((char **)v2 + 2);
    double v4 = v3;
  }

  return v3;
}

- (void)setIdentity
{
}

- (MDLTransform)initWithTransformComponent:(id)component
{
  id v4 = component;
  v9 = (MDLTransform *)objc_msgSend_init(self, v5, v6);
  if (v9)
  {
    objc_msgSend_localTransformAtTime_(v4, v7, v8, 0.0);
    v16[0] = v10;
    v16[1] = v11;
    v16[2] = v12;
    v16[3] = v13;
    sub_20B0CAB60((uint64_t)&v9->_transform, v16);
    v14 = v9;
  }

  return v9;
}

- (MDLTransform)initWithTransformComponent:(id)component resetsTransform:(BOOL)resetsTransform
{
  uint64_t v5 = (MDLTransform *)objc_msgSend_initWithTransformComponent_(self, a2, (uint64_t)component);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_transform._resetTransformStack = resetsTransform;
    v7 = v5;
  }

  return v6;
}

- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix
{
  uint64_t v4 = objc_msgSend_init(self, a2, v3, *(_OWORD *)matrix.columns, matrix.columns[1].i64[0], matrix.columns[1].i64[1], matrix.columns[2].i64[0], matrix.columns[2].i64[1], matrix.columns[3].i64[0], matrix.columns[3].i64[1]);
  uint64_t v5 = (MDLTransform *)v4;
  if (v4)
  {
    sub_20B0CAB60(v4 + 16, &v8);
    uint64_t v6 = v5;
  }

  return v5;
}

- (MDLTransform)initWithMatrix:(matrix_float4x4)matrix resetsTransform:(BOOL)resetsTransform
{
  uint64_t v5 = objc_msgSend_init(self, a2, resetsTransform, *(_OWORD *)matrix.columns, matrix.columns[1].i64[0], matrix.columns[1].i64[1], matrix.columns[2].i64[0], matrix.columns[2].i64[1], matrix.columns[3].i64[0], matrix.columns[3].i64[1]);
  uint64_t v6 = (MDLTransform *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 129) = resetsTransform;
    sub_20B0CAB60(v5 + 16, &v9);
    v7 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  long long v10 = objc_msgSend_init(v7, v8, v9);
  sub_20B1491D4((uint64_t)v10 + 16, (uint64_t)&self->_transform);
  return v10;
}

- (void)setLocalTransform:(__n128)a3 forTime:(__n128)a4
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  sub_20B0CAED0(a1 + 16, v6, a6);
}

- (double)setLocalTransform:(__n128)a3
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(void *)&double result = sub_20B0CAB60(a1 + 16, v6).n128_u64[0];
  return result;
}

- (__n128)localTransformAtTime:(__n128 *)a1
{
  return a1[9];
}

- (matrix_float4x4)rotationMatrixAtTime:(NSTimeInterval)time
{
  simd_float4 v3 = *(simd_float4 *)&self[1]._transform._identity;
  simd_float4 v4 = *(simd_float4 *)&self[2].super.isa;
  simd_float4 v5 = *(simd_float4 *)&self[2]._transform._keyedTranslation.__begin_;
  simd_float4 v6 = *(simd_float4 *)&self[2]._transform._keyedTranslation.__end_cap_.__value_;
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4
{
  simd_float4 v5 = objc_msgSend_componentConformingToProtocol_(a4, a3, (uint64_t)&unk_26BF61AF8);
  long long v8 = v5;
  if (v5)
  {
    objc_msgSend_localTransformAtTime_(v5, v6, v7, a1);
    long long v11 = v9;
  }
  else
  {
    long long v11 = *MEMORY[0x263EF89A8];
  }

  return (__n128)v11;
}

+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4
{
  id v5 = a4;
  long long v9 = objc_msgSend_parent(v5, v6, v7);
  if (v9)
  {
    do
    {
      long long v10 = objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_26BF61AF8);

      if (v10) {
        break;
      }
      uint64_t v12 = objc_msgSend_parent(v9, v8, v11);

      long long v9 = (void *)v12;
    }
    while (v12);
  }
  long long v13 = objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_26BF61AF8);
  if (objc_msgSend_resetsTransform(v13, v14, v15) || !v13)
  {
    objc_msgSend_localTransformWithObject_atTime_(MDLTransform, v16, (uint64_t)v5, a1);
    long long v33 = v27;
  }
  else
  {
    objc_msgSend_globalTransformWithObject_atTime_(MDLTransform, v16, (uint64_t)v9, a1);
    float32x4_t v31 = v18;
    float32x4_t v32 = v17;
    float32x4_t v29 = v20;
    float32x4_t v30 = v19;
    objc_msgSend_localTransformWithObject_atTime_(MDLTransform, v21, (uint64_t)v5, a1);
    uint64_t v22 = 0;
    v34[0] = v23;
    v34[1] = v24;
    v34[2] = v25;
    v34[3] = v26;
    memset(v35, 0, sizeof(v35));
    do
    {
      v35[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v34[v22])), v31, *(float32x2_t *)&v34[v22], 1), v30, (float32x4_t)v34[v22], 2), v29, (float32x4_t)v34[v22], 3);
      ++v22;
    }
    while (v22 != 4);
    long long v33 = v35[0];
  }

  return (__n128)v33;
}

- (CAAnimation)transformAnimation
{
  __p = 0;
  v44 = 0;
  uint64_t v45 = 0;
  sub_20B0CB678((long long **)&self->_transform, (uint64_t)&__p);
  simd_float4 v4 = v44;
  uint64_t v5 = (unsigned char *)v44 - (unsigned char *)__p;
  if (v44 != __p)
  {
    unint64_t v6 = v5 >> 3;
    uint64_t v7 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v3, v5 >> 3);
    uint64_t v11 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v8, v6);
    uint64_t v12 = 0;
    double v13 = *(double *)__p;
    double v14 = *((double *)v44 - 1) - *(double *)__p;
    if (v6 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v6;
    }
    do
    {
      double v16 = *((double *)__p + v12);
      float32x4_t v17 = objc_msgSend_numberWithDouble_(NSNumber, v9, v10, (v16 - v13) * (1.0 / v14));
      objc_msgSend_localTransformAtTime_(self, v18, v19, v16);
      v42[0] = vcvtq_f64_f32(*(float32x2_t *)v20.f32);
      v42[1] = vcvt_hight_f64_f32(v20);
      v42[2] = vcvtq_f64_f32(*(float32x2_t *)v21.f32);
      v42[3] = vcvt_hight_f64_f32(v21);
      v42[4] = vcvtq_f64_f32(*(float32x2_t *)v22.f32);
      v42[5] = vcvt_hight_f64_f32(v22);
      v42[6] = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
      v42[7] = vcvt_hight_f64_f32(v23);
      long long v25 = objc_msgSend_valueWithCATransform3D_(MEMORY[0x263F08D40], v24, (uint64_t)v42);
      objc_msgSend_addObject_(v7, v26, (uint64_t)v17);
      objc_msgSend_addObject_(v11, v27, (uint64_t)v25);

      ++v12;
    }
    while (v15 != v12);
    v28 = objc_msgSend_animation(MEMORY[0x263F157D8], v9, v10);
    objc_msgSend_setKeyPath_(v28, v29, @"transform");
    objc_msgSend_setValues_(v28, v30, (uint64_t)v11);
    objc_msgSend_setKeyTimes_(v28, v31, (uint64_t)v7);
    objc_msgSend_setBeginTime_(v28, v32, v33, v13);
    objc_msgSend_setDuration_(v28, v34, v35, v14);
    objc_msgSend_setAdditive_(v28, v36, 0);
    objc_msgSend_setRemovedOnCompletion_(v28, v37, 0);
    LODWORD(v38) = 2139095039;
    objc_msgSend_setRepeatCount_(v28, v39, v40, v38);

    simd_float4 v4 = __p;
    if (!__p) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v28 = 0;
  if (v44)
  {
LABEL_7:
    v44 = v4;
    operator delete(v4);
  }
LABEL_8:

  return (CAAnimation *)v28;
}

- (void).cxx_destruct
{
  begin = self->_transform._keyedScale.__begin_;
  if (begin)
  {
    self->_transform._keyedScale.__end_ = begin;
    operator delete(begin);
  }
  simd_float4 v4 = self->_transform._keyedShear.__begin_;
  if (v4)
  {
    self->_transform._keyedShear.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->_transform._keyedRotation.__begin_;
  if (v5)
  {
    self->_transform._keyedRotation.__end_ = v5;
    operator delete(v5);
  }
  unint64_t v6 = self->_transform._keyedTranslation.__begin_;
  if (v6)
  {
    self->_transform._keyedTranslation.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 129) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  return self;
}

@end