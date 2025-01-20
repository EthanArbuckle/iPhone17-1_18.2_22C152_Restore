@interface MDLTransformTranslateOp
- (BOOL)IsInverseOp;
- (BOOL)inverse;
- (MDLAnimatedVector3)animatedValue;
- (MDLTransformTranslateOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5;
- (NSString)name;
- (double)float4x4AtTime:(uint64_t)a3;
- (void)double4x4AtTime:(uint64_t)a3@<X2>;
- (void)setInverse:(BOOL)a3;
@end

@implementation MDLTransformTranslateOp

- (MDLTransformTranslateOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformTranslateOp;
  v11 = [(MDLTransformTranslateOp *)&v15 init];
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
  v4.columns[0] = (simd_float4)*MEMORY[0x263EF89A8];
  v4.columns[3].i32[3] = 1.0;
  if (*(unsigned char *)(a1 + 8))
  {
    v4.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A8] + 16);
    v4.columns[2] = *(simd_float4 *)(MEMORY[0x263EF89A8] + 32);
    v4.columns[0].i64[0] = (unint64_t)__invert_f4(v4);
  }
  return *(double *)v4.columns[0].i64;
}

- (void)double4x4AtTime:(uint64_t)a3@<X2>
{
  result = *(void **)(a1 + 24);
  if (result)
  {
    result = objc_msgSend_double3AtTime_(result, a2, a3);
    int8x16_t v7 = v14;
    unint64_t v8 = vextq_s8(v7, v7, 8uLL).u64[0];
    *(void *)&long long v9 = vars0;
  }
  else
  {
    v7.i64[0] = 0;
    unint64_t v8 = 0;
    *(void *)&long long v9 = 0;
  }
  v7.i64[1] = v8;
  *((void *)&v9 + 1) = 1.0;
  if (*(unsigned char *)(a1 + 8)) {
    return (void *)__invert_d4();
  }
  id v10 = (_OWORD *)MEMORY[0x263EF8990];
  long long v11 = *(_OWORD *)(MEMORY[0x263EF8990] + 48);
  a4[2] = *(_OWORD *)(MEMORY[0x263EF8990] + 32);
  a4[3] = v11;
  long long v12 = v10[5];
  a4[4] = v10[4];
  a4[5] = v12;
  long long v13 = v10[1];
  *a4 = *v10;
  a4[1] = v13;
  a4[6] = v7;
  a4[7] = v9;
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