@interface MDLTransformMatrixOp
- (BOOL)IsInverseOp;
- (BOOL)inverse;
- (MDLAnimatedMatrix4x4)animatedValue;
- (MDLTransformMatrixOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5;
- (NSString)name;
- (double)double4x4AtTime:(uint64_t)a3@<X2>;
- (double)float4x4AtTime:(uint64_t)a3;
- (void)setInverse:(BOOL)a3;
@end

@implementation MDLTransformMatrixOp

- (MDLTransformMatrixOp)initWithName:(id)a3 inverse:(BOOL)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MDLTransformMatrixOp;
  v11 = [(MDLTransformMatrixOp *)&v15 init];
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
  objc_msgSend_float4x4AtTime_(*(void **)(a1 + 24), a2, a3);
  if (*(unsigned char *)(a1 + 8)) {
    v4.columns[0].i64[0] = (unint64_t)__invert_f4(v4);
  }
  return *(double *)v4.columns[0].i64;
}

- (double)double4x4AtTime:(uint64_t)a3@<X2>
{
  long long vars0 = 0u;
  v6 = *(void **)(a1 + 24);
  if (v6) {
    objc_msgSend_double4x4AtTime_(v6, a2, a3);
  }
  if (*(unsigned char *)(a1 + 8))
  {
    __invert_d4();
  }
  else
  {
    a4[4] = 0u;
    a4[5] = 0u;
    a4[6] = 0u;
    a4[7] = 0u;
    *a4 = 0u;
    a4[1] = 0u;
    double result = 0.0;
    a4[2] = 0u;
    a4[3] = 0u;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedMatrix4x4)animatedValue
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