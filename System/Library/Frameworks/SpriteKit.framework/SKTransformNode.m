@interface SKTransformNode
- (CGFloat)xRotation;
- (CGFloat)yRotation;
- (double)zRotation;
- (matrix_float3x3)rotationMatrix;
- (simd_quatf)quaternion;
- (vector_float3)eulerAngles;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)setEulerAngles:(vector_float3)euler;
- (void)setQuaternion:(simd_quatf)quaternion;
- (void)setRotationMatrix:(matrix_float3x3)rotationMatrix;
- (void)setXRotation:(CGFloat)xRotation;
- (void)setYRotation:(CGFloat)yRotation;
- (void)setZRotation:(double)a3;
@end

@implementation SKTransformNode

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKTransformNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skcTransformLayer = [(SKNode *)self _backingNode];
}

- (void)setXRotation:(CGFloat)xRotation
{
  *(float *)&double v3 = xRotation;
  HIDWORD(v3) = HIDWORD(*(void *)self->_euler);
  [(SKTransformNode *)self setEulerAngles:v3];
}

- (void)setYRotation:(CGFloat)yRotation
{
  float v3 = yRotation;
  long long v4 = *(_OWORD *)self->_euler;
  *((float *)&v4 + 1) = v3;
  [(SKTransformNode *)self setEulerAngles:*(double *)&v4];
}

- (void)setZRotation:(double)a3
{
}

- (void)setEulerAngles:(vector_float3)euler
{
  float32x4_t v11 = v3;
  *(float32x4_t *)self->_euler = v3;
  __float2 v5 = __sincosf_stret(0.5 * v3.f32[0]);
  __float2 v6 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)v11.f32, 1));
  __float2 v7 = __sincosf_stret(vmuls_lane_f32(0.5, v11, 2));
  v8.vector.f32[0] = (float)((float)(v7.__cosval * v5.__sinval) * v6.__cosval)
                   - (float)((float)(v7.__sinval * v5.__cosval) * v6.__sinval);
  v8.vector.f32[1] = (float)(v6.__cosval * (float)(v7.__sinval * v5.__sinval))
                   + (float)((float)(v7.__cosval * v5.__cosval) * v6.__sinval);
  v8.vector.f32[2] = (float)((float)(v7.__sinval * v5.__cosval) * v6.__cosval)
                   - (float)((float)(v7.__cosval * v5.__sinval) * v6.__sinval);
  v8.vector.f32[3] = (float)(v6.__sinval * (float)(v7.__sinval * v5.__sinval))
                   + (float)((float)(v7.__cosval * v5.__cosval) * v6.__cosval);
  skcTransformLayer = (SKCNode *)self->_skcTransformLayer;
  simd_quatf v10 = v8;

  SKCTransformNode::setQuaternion(skcTransformLayer, v10);
}

- (CGFloat)xRotation
{
  return *(float *)self->_euler;
}

- (CGFloat)yRotation
{
  return *(float *)&self->_euler[4];
}

- (double)zRotation
{
  return *(float *)&self->_euler[8];
}

- (vector_float3)eulerAngles
{
  __n128 Quaternion = SKCTransformNode::getQuaternion((__n128 *)self->_skcTransformLayer);
  _KR00_8 = *(uint64_t *)((char *)Quaternion.n128_i64 + 4);
  __asm { FMLA            S0, S2, V2.S[3] }
  float v8 = vmlas_n_f32(vmuls_lane_f32(Quaternion.n128_f32[1], (float32x2_t)Quaternion.n128_u64[0], 1), Quaternion.n128_f32[0], Quaternion.n128_f32[0])* -2.0+ 1.0;
  atan2f(_S0 + _S0, v8);
  _V1.S[3] = Quaternion.n128_u32[3];
  __asm { FMLA            S0, S8, V1.S[3] }
  float v11 = _S0 + _S0;
  if (v11 > 1.0) {
    float v11 = 1.0;
  }
  if (v11 < -1.0) {
    float v11 = -1.0;
  }
  asinf(v11);
  _V1.D[1] = Quaternion.n128_u64[1];
  __asm
  {
    FMLA            S0, S9, V1.S[3]
    FMLA            S10, S9, V1.S[2]
  }
  float v15 = _S10 * -2.0 + 1.0;
  atan2f(_S0 + _S0, v15);
  result.i64[1] = v17;
  result.i64[0] = v16;
  return result;
}

- (void)setRotationMatrix:(matrix_float3x3)rotationMatrix
{
  float v3 = rotationMatrix.columns[2].f32[2] + (float)(rotationMatrix.columns[0].f32[0] + rotationMatrix.columns[1].f32[1]);
  if (v3 >= 0.0)
  {
    float v9 = sqrtf(v3 + 1.0);
    float32_t v10 = v9 + v9;
    float32x2_t v11 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v9 + v9));
    float32x2_t v12 = vmul_f32(v11, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v9 + v9), v11));
    v12.i32[0] = vmul_f32(v12, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v9 + v9), v12)).u32[0];
    *(float32x2_t *)v23.vector.f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[1], (int8x16_t)rotationMatrix.columns[1], 8uLL), *(int32x2_t *)rotationMatrix.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)rotationMatrix.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[0], (int8x16_t)rotationMatrix.columns[0], 8uLL), 4uLL)), v12.f32[0]);
    v13.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)rotationMatrix.columns[0].f32, 1), *(float32x2_t *)rotationMatrix.columns[1].f32).u32[0];
    v13.f32[1] = v10;
    v12.i32[1] = 0.25;
    *(float32x2_t *)rotationMatrix.columns[0].f32 = vmul_f32(v13, v12);
  }
  else if (rotationMatrix.columns[0].f32[0] < rotationMatrix.columns[1].f32[1] {
         || rotationMatrix.columns[0].f32[0] < rotationMatrix.columns[2].f32[2])
  }
  {
    float v5 = 1.0 - rotationMatrix.columns[0].f32[0];
    if (rotationMatrix.columns[1].f32[1] >= rotationMatrix.columns[2].f32[2])
    {
      float v24 = sqrtf(rotationMatrix.columns[1].f32[1] + (float)(v5 - rotationMatrix.columns[2].f32[2]));
      *(float *)&unsigned int v25 = v24 + v24;
      float32x2_t v26 = vrecpe_f32((float32x2_t)v25);
      float32x2_t v27 = vmul_f32(v26, vrecps_f32((float32x2_t)v25, v26));
      v28.i32[0] = vmul_f32(v27, vrecps_f32((float32x2_t)v25, v27)).u32[0];
      v27.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)rotationMatrix.columns[0].f32, 1), *(float32x2_t *)rotationMatrix.columns[1].f32).u32[0];
      v27.i32[1] = v25;
      *(int32x2_t *)rotationMatrix.columns[2].f32 = vrev64_s32(*(int32x2_t *)rotationMatrix.columns[2].f32);
      rotationMatrix.columns[1].i32[0] = vadd_f32(*(float32x2_t *)rotationMatrix.columns[2].f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[1], (int8x16_t)rotationMatrix.columns[1], 8uLL)).u32[0];
      rotationMatrix.columns[1].i32[1] = vsub_f32(*(float32x2_t *)(&rotationMatrix + 32), (float32x2_t)vdup_laneq_s32(*(int32x4_t *)&rotationMatrix, 2)).i32[1];
      *(float32x2_t *)rotationMatrix.columns[0].f32 = vmul_n_f32(*(float32x2_t *)rotationMatrix.columns[1].f32, v28.f32[0]);
      v28.i32[1] = 0.25;
      *(float32x2_t *)v23.vector.f32 = vmul_f32(v27, v28);
    }
    else
    {
      float32x2_t v6 = (float32x2_t)__PAIR64__(rotationMatrix.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(rotationMatrix.columns[2].f32[2] + (float)(v5- rotationMatrix.columns[1].f32[1]))));
      *(float32x2_t *)rotationMatrix.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[0], (int8x16_t)rotationMatrix.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[1], (int8x16_t)rotationMatrix.columns[1], 8uLL)), *(float32x2_t *)rotationMatrix.columns[2].f32);
      *(int32x2_t *)rotationMatrix.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)rotationMatrix.columns[1].f32, 0);
      *(float32x2_t *)rotationMatrix.columns[0].f32 = vsub_f32(*(float32x2_t *)rotationMatrix.columns[0].f32, *(float32x2_t *)rotationMatrix.columns[1].f32);
      rotationMatrix.columns[1].i32[0] = 2.0;
      rotationMatrix.columns[1].i32[0] = vmul_f32(v6, *(float32x2_t *)rotationMatrix.columns[1].f32).u32[0];
      rotationMatrix.columns[1].i32[1] = rotationMatrix.columns[0].i32[1];
      float32x2_t v7 = vrecpe_f32((float32x2_t)rotationMatrix.columns[1].u32[0]);
      float32x2_t v8 = vmul_f32(v7, vrecps_f32((float32x2_t)rotationMatrix.columns[1].u32[0], v7));
      rotationMatrix.columns[0].i32[0] = vmul_f32(v8, vrecps_f32((float32x2_t)rotationMatrix.columns[1].u32[0], v8)).u32[0];
      *(float32x2_t *)v23.vector.f32 = vmul_n_f32(*(float32x2_t *)rotationMatrix.columns[2].f32, rotationMatrix.columns[0].f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
      rotationMatrix.columns[2].i32[1] = rotationMatrix.columns[0].i32[0];
      *(float32x2_t *)rotationMatrix.columns[0].f32 = vmul_f32(*(float32x2_t *)rotationMatrix.columns[1].f32, *(float32x2_t *)rotationMatrix.columns[2].f32);
    }
  }
  else
  {
    float32x2_t v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)rotationMatrix.columns[1].f32, 0);
    float32x2_t v15 = vadd_f32(*(float32x2_t *)rotationMatrix.columns[0].f32, v14);
    v14.i32[0] = 2.0;
    v14.i32[0] = vmul_f32((float32x2_t)__PAIR64__(rotationMatrix.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(rotationMatrix.columns[0].f32[0]+ (float)((float)(1.0 - rotationMatrix.columns[1].f32[1])- rotationMatrix.columns[2].f32[2])))), v14).u32[0];
    v14.i32[1] = v15.i32[1];
    float32x2_t v16 = vrecpe_f32((float32x2_t)v14.u32[0]);
    float32x2_t v17 = vmul_f32(v16, vrecps_f32((float32x2_t)v14.u32[0], v16));
    LODWORD(v18) = vmul_f32(v17, vrecps_f32((float32x2_t)v14.u32[0], v17)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.f32[1] = v18;
    *(float32x2_t *)v23.vector.f32 = vmul_f32(v14, _D5);
    rotationMatrix.columns[0].i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)rotationMatrix.columns[0], (int8x16_t)rotationMatrix.columns[0], 8uLL), *(float32x2_t *)rotationMatrix.columns[2].f32).u32[0];
    rotationMatrix.columns[0].i32[1] = vsub_f32((float32x2_t)vdup_laneq_s32(*(int32x4_t *)(&rotationMatrix + 16), 2), *(float32x2_t *)(&rotationMatrix + 32)).i32[1];
    *(float32x2_t *)rotationMatrix.columns[0].f32 = vmul_n_f32(*(float32x2_t *)rotationMatrix.columns[0].f32, v18);
  }
  v23.vector.i64[1] = rotationMatrix.columns[0].i64[0];
  simd_quatf v29 = v23;
  SKCTransformNode::setQuaternion((SKCNode *)self->_skcTransformLayer, v29);
}

- (matrix_float3x3)rotationMatrix
{
  _Q0 = SKCTransformNode::getQuaternion((__n128 *)self->_skcTransformLayer);
  _S5 = _Q0.n128_f32[1] + _Q0.n128_f32[1];
  __asm { FMLS            S3, S5, V0.S[1] }
  _S7 = vmuls_lane_f32(-2.0, (float32x4_t)_Q0, 2);
  __asm { FMLA            S3, S7, V0.S[2] }
  _S16 = _Q0.n128_f32[0] + _Q0.n128_f32[0];
  __asm
  {
    FMLA            S18, S16, V0.S[1]
    FMLA            S19, S16, V0.S[2]
    FMLA            S1, S16, V0.S[1]
    FMLS            S6, S16, V0.S[0]
    FMLA            S4, S7, V0.S[2]
    FMLA            S7, S5, V0.S[2]
    FMLA            S2, S16, V0.S[2]
    FMLA            S16, S5, V0.S[2]
  }
  _Q3.i32[1] = _S18;
  _Q3.i32[2] = _S19;
  HIDWORD(_D1) = _S4;
  LODWORD(v19) = _S7;
  HIDWORD(_D2) = _S16;
  __asm { FMLS            S6, S5, V0.S[1] }
  LODWORD(v22) = _S6;
  simd_float3 v23 = _Q3;
  result.columns[0] = v23;
  result.columns[2].i64[1] = v22;
  result.columns[2].i64[0] = _D2;
  result.columns[1].i64[1] = v19;
  result.columns[1].i64[0] = _D1;
  return result;
}

- (void)setQuaternion:(simd_quatf)quaternion
{
}

- (simd_quatf)quaternion
{
  return (simd_quatf)SKCTransformNode::getQuaternion((__n128 *)self->_skcTransformLayer);
}

@end