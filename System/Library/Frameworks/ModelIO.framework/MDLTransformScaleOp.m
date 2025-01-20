@interface MDLTransformScaleOp
- (BOOL)IsInverseOp;
- (BOOL)inverse;
- (MDLAnimatedVector3)animatedValue;
- (MDLTransformScaleOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5;
- (NSString)name;
- (double)double4x4AtTime:(uint64_t)a3@<X2>;
- (double)float4x4AtTime:(uint64_t)a3;
- (void)setInverse:(BOOL)a3;
@end

@implementation MDLTransformScaleOp

- (MDLTransformScaleOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformScaleOp;
  v11 = [(MDLTransformScaleOp *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_animatedValue, a5);
    objc_storeStrong((id *)&v12->_name, a3);
    v12->_inverse = a4;
    v13 = v12;
  }

  return v12;
}

- (BOOL)IsInverseOp
{
  return self->_inverse;
}

- (double)float4x4AtTime:(uint64_t)a3
{
  objc_msgSend_float3AtTime_(*(void **)(a1 + 24), a2, a3);
  v4.columns[3] = v4.columns[0];
  v4.columns[0] = (simd_float4)v4.columns[0].u32[0];
  v4.columns[1].i32[0] = 0;
  v4.columns[1].i64[1] = 0;
  v4.columns[1].i32[1] = v4.columns[3].i32[1];
  v4.columns[2].i64[0] = 0;
  v4.columns[2].i32[3] = 0;
  v4.columns[2].i32[2] = v4.columns[3].i32[2];
  v4.columns[3] = (simd_float4)xmmword_20B1E75C0;
  if (*(unsigned char *)(a1 + 8)) {
    v4.columns[0].i64[0] = (unint64_t)__invert_f4(v4);
  }
  return *(double *)v4.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  id v10 = *(void **)(a1 + 24);
  *(void *)&long long v11 = 0;
  if (v10)
  {
    objc_msgSend_double3AtTime_(v10, a2, a3, a5, a6, a7, a8, 0.0);
    *(void *)&long long v11 = 0;
    int8x16_t v12 = v16;
    unint64_t v13 = vextq_s8(v12, v12, 8uLL).u64[0];
    *(void *)&long long v14 = v17;
  }
  else
  {
    v12.i64[0] = 0;
    unint64_t v13 = 0;
    *(void *)&long long v14 = 0;
  }
  v12.i64[1] = 0;
  *((void *)&v14 + 1) = 0;
  *((void *)&v11 + 1) = v13;
  if (*(unsigned char *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    *(int8x16_t *)a4 = v12;
    *(_OWORD *)(a4 + 16) = 0uLL;
    *(_OWORD *)(a4 + 32) = v11;
    *(_OWORD *)(a4 + 48) = 0uLL;
    *(_OWORD *)(a4 + 64) = 0uLL;
    *(_OWORD *)(a4 + 80) = v14;
    *(void *)(a4 + 96) = 0;
    *(void *)(a4 + 104) = 0;
    double result = 0.0;
    *(_OWORD *)(a4 + 112) = xmmword_20B1E7940;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedVector3)animatedValue
{
  return self->_animatedValue;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)a3
{
  self->_inverse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end