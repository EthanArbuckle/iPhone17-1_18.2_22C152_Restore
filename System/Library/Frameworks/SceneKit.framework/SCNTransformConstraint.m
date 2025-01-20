@interface SCNTransformConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNTransformConstraint)orientationConstraintInWorldSpace:(BOOL)world withBlock:(void *)block;
+ (SCNTransformConstraint)positionConstraintInWorldSpace:(BOOL)world withBlock:(void *)block;
+ (SCNTransformConstraint)transformConstraintInWorldSpace:(BOOL)world withBlock:(void *)block;
- (SCNTransformConstraint)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4;
- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4;
- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4;
@end

@implementation SCNTransformConstraint

- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = [(SCNConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__SCNTransformConstraint_initTransformInWorld_withBlock___block_invoke;
    v8[3] = &unk_26400B288;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, @"transform");
  }
  return v6;
}

void *__57__SCNTransformConstraint_initTransformInWorld_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  void (*v10)(SCNMatrix4 *__return_ptr);
  void *result;
  float32x4_t *Parent;
  simd_float4x4 *v13;
  float32x4_t *TargetAddress;
  float32x4_t *v15;
  const void *Target;
  size_t v17;
  SCNMatrix4 v18;
  SCNMatrix4 a;
  SCNMatrix4 v20;
  SCNMatrix4 v21;

  memset(&v21, 0, sizeof(v21));
  if (*(unsigned char *)(a1 + 40))
  {
    WorldMatrix = C3DNodeGetWorldMatrix(a4);
  }
  else
  {
    memset(&v20, 0, sizeof(v20));
    C3DNodeGetMatrix((uint64_t)a4, (uint64_t)&v20);
    WorldMatrix = (float32x4_t *)&v20;
  }
  +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a4, C3DMatrix4x4ToSCNMatrix4((uint64_t)WorldMatrix, &v21).n128_f64[0]);
  memset(&v20, 0, sizeof(v20));
  objc_super v10 = *(void (**)(SCNMatrix4 *__return_ptr))(*(void *)(a1 + 32) + 16);
  a = v21;
  v10(&v20);
  a = v21;
  v18 = v20;
  result = (void *)SCNMatrix4EqualToMatrix4(&a, &v18);
  if ((result & 1) == 0)
  {
    memset(&a, 0, sizeof(a));
    C3DMatrix4x4FromSCNMatrix4(&a, (uint64_t)&v20);
    if (*(unsigned char *)(a1 + 40))
    {
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v18, 0, sizeof(v18));
        v13 = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(v13, (simd_float4x4 *)&v18);
        C3DMatrix4x4Mult((uint64_t)&a, (float32x4_t *)&v18, &a);
      }
    }
    TargetAddress = (float32x4_t *)C3DModelTargetGetTargetAddress(a5);
    v15 = TargetAddress;
    if (a2 != 1.0) {
      C3DMatrix4x4Interpolate(TargetAddress, (float32x4_t *)&a, (float32x4_t *)&a, a2);
    }
    Target = (const void *)C3DModelTargetGetTarget(a5);
    v17 = C3DSizeOfBaseType(11);
    return C3DSetValue(Target, v15, &a, v17, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = [(SCNConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__SCNTransformConstraint_initPositionInWorld_withBlock___block_invoke;
    v8[3] = &unk_26400B288;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, @"translation");
  }
  return v6;
}

void *__56__SCNTransformConstraint_initPositionInWorld_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  if (*(unsigned char *)(a1 + 40))
  {
    WorldMatrix = (__n128 *)C3DNodeGetWorldMatrix(a4);
    v30.columns[0].i32[2] = 0;
    v30.columns[0].i64[0] = 0;
    C3DMatrix4x4GetTranslation(WorldMatrix, (__n128 *)&v30);
    double b = *(double *)v30.columns[0].i64;
    float v9 = v30.columns[0].f32[2];
  }
  else
  {
    double b = C3DNodeGetPosition((__n128 *)a4);
    float v9 = v10;
  }
  +[SCNNode nodeWithNodeRef:a4];
  *(double *)v11.i64 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  float32x4_t v26 = v11;
  __int32 v23 = v12;
  __int32 v24 = v13;
  *(double *)&v32.x = b;
  v32.z = v9;
  result = (void *)SCNVector3EqualToVector3(*(SCNVector3 *)v11.f32, v32);
  if ((result & 1) == 0)
  {
    float32x4_t v15 = v26;
    v15.i32[1] = v23;
    v15.i32[2] = v24;
    float32x4_t v27 = v15;
    float32x4_t v31 = v15;
    if (*(unsigned char *)(a1 + 40))
    {
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v30, 0, sizeof(v30));
        v17 = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(v17, &v30);
        v29[0] = (float32x4_t)v30.columns[0];
        v29[1] = (float32x4_t)v30.columns[1];
        v29[2] = (float32x4_t)v30.columns[2];
        v29[3] = (float32x4_t)v30.columns[3];
        *(double *)v18.i64 = C3DVector3MultMatrix4x4(v29, v27);
        float32x4_t v27 = v18;
        float32x4_t v31 = v18;
      }
    }
    if (a2 != 1.0)
    {
      *(double *)v19.i64 = C3DNodeGetPosition((__n128 *)a4);
      float32x4_t v31 = vmlaq_n_f32(v19, vsubq_f32(v27, v19), a2);
    }
    Target = (const void *)C3DModelTargetGetTarget(a5);
    TargetAddress = (void *)C3DModelTargetGetTargetAddress(a5);
    size_t v22 = C3DSizeOfBaseType(9);
    return C3DSetValue(Target, TargetAddress, &v31, v22, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = [(SCNConstraint *)&v10 init];
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__SCNTransformConstraint_initOrientationInWorldSpace_withBlock___block_invoke;
    v8[3] = &unk_26400B288;
    BOOL v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, @"quaternion");
  }
  return v6;
}

void *__64__SCNTransformConstraint_initOrientationInWorldSpace_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v56.columns[0] = 0uLL;
    C3DNodeGetWorldOrientation(a4, &v56);
    simd_float4 v8 = v56.columns[0];
  }
  else
  {
    C3DNodeGetQuaternion((uint64_t)a4);
  }
  SCNVector4 ba = (SCNVector4)v8;
  +[SCNNode nodeWithNodeRef:a4];
  *(double *)&v9.x = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  SCNVector4 v49 = v9;
  float v44 = v10;
  float v45 = v11;
  __int32 v46 = v12;
  result = (void *)SCNVector4EqualToVector4(v9, ba);
  if ((result & 1) == 0)
  {
    SCNVector4 v14 = v49;
    v14.y = v44;
    v14.z = v45;
    float32x4_t v15 = (float32x4_t)v14;
    v15.i32[3] = v46;
    float32x4_t v57 = v15;
    SCNVector4 b = (SCNVector4)v15;
    if (*(unsigned char *)(a1 + 40))
    {
      int32x4_t v50 = (int32x4_t)v14;
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v56, 0, sizeof(v56));
        WorldMatrix = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(WorldMatrix, &v56);
        v55[0] = (float32x4_t)v56.columns[0];
        v55[1] = (float32x4_t)v56.columns[1];
        v55[2] = (float32x4_t)v56.columns[2];
        v55[3] = (float32x4_t)v56.columns[3];
        *(double *)v18.i64 = C3DMatrix4x4GetRotation(v55);
        float32x4_t v19 = v18;
        v19.i32[3] = v18.i32[0];
        int32x4_t v20 = v50;
        float32x4_t v21 = (float32x4_t)vzip1q_s32(v20, v20);
        v21.i32[0] = v50.i32[2];
        float32x4_t v22 = (float32x4_t)vuzp1q_s32(v20, v20);
        v22.i32[0] = v50.i32[1];
        float32x4_t v57 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v19, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)b, 3), (int8x16_t)b, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), (float32x4_t)b, v18, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v18, (int8x16_t)v18, 0xCuLL), (int8x16_t)v18, 8uLL), v21)), v22, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL));
        SCNVector4 b = (SCNVector4)v57;
      }
    }
    TargetAddress = (float32x4_t *)C3DModelTargetGetTargetAddress(a5);
    v25 = TargetAddress;
    float v26 = a2;
    if (a2 != 1.0)
    {
      _Q6 = *TargetAddress;
      _Q0 = vmulq_f32(*TargetAddress, (float32x4_t)b);
      _S1 = b.z;
      __asm { FMLA            S0, S1, V6.S[2] }
      _Q2.i32[0] = LODWORD(b.w);
      float v33 = -(float)(_Q0.f32[0] + (float)(COERCE_FLOAT(HIDWORD(*(unsigned long long *)TargetAddress)) * b.w));
      __asm { FMLA            S0, S2, V6.S[3] }
      _Q2.i64[0] = 0;
      float32x4_t v35 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(_Q2, _Q0), 0), (int8x16_t)vnegq_f32((float32x4_t)b), (int8x16_t)b);
      if (_Q0.f32[0] < 0.0) {
        _Q0.f32[0] = v33;
      }
      if (1.0 - _Q0.f32[0] <= 0.00100000005)
      {
        float v41 = 1.0 - a2;
      }
      else
      {
        float32x4_t v51 = v35;
        bSCNVector4 b = (SCNVector4)*TargetAddress;
        float v36 = acosf(_Q0.f32[0]);
        float v37 = sinf(v36);
        float v38 = sinf((float)(1.0 - a2) * v36);
        float v39 = v36 * a2;
        float v48 = v38 / v37;
        float v40 = sinf(v39);
        float v41 = v48;
        float32x4_t v35 = v51;
        _Q6 = (float32x4_t)bb;
        float v26 = v40 / v37;
      }
      float32x4_t v57 = vmlaq_n_f32(vmulq_n_f32(v35, v26), _Q6, v41);
    }
    Target = (const void *)C3DModelTargetGetTarget(a5);
    size_t v43 = C3DSizeOfBaseType(10);
    return C3DSetValue(Target, v25, &v57, v43, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

+ (SCNTransformConstraint)transformConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  id v4 = [[SCNTransformConstraint alloc] initTransformInWorld:world withBlock:block];

  return (SCNTransformConstraint *)v4;
}

+ (SCNTransformConstraint)positionConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  id v4 = [[SCNTransformConstraint alloc] initPositionInWorld:world withBlock:block];

  return (SCNTransformConstraint *)v4;
}

+ (SCNTransformConstraint)orientationConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  id v4 = [[SCNTransformConstraint alloc] initOrientationInWorldSpace:world withBlock:block];

  return (SCNTransformConstraint *)v4;
}

- (SCNTransformConstraint)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNTransformConstraint;
  id v4 = [(SCNConstraint *)&v6 init];
  if (v4)
  {
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(&__block_literal_global_131, @"transform");
    [(SCNConstraint *)v4 finalizeDecodeConstraint:a3];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  Copy = C3DConstraintProceduralCreateCopy((uint64_t)self->super._constraintRef);
  [v4 setConstraintRef:Copy];
  CFRelease(Copy);
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end