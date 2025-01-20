@interface SCNPhysicsConeTwistJoint
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsConeTwistJoint)jointWithBody:(SCNPhysicsBody *)body frame:(SCNMatrix4 *)frame;
+ (SCNPhysicsConeTwistJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA frameA:(SCNMatrix4 *)frameA bodyB:(SCNPhysicsBody *)bodyB frameB:(SCNMatrix4 *)frameB;
- (CGFloat)maximumAngularLimit1;
- (CGFloat)maximumAngularLimit2;
- (CGFloat)maximumTwistAngle;
- (SCNMatrix4)frameA;
- (SCNMatrix4)frameB;
- (SCNPhysicsBody)bodyA;
- (SCNPhysicsBody)bodyB;
- (SCNPhysicsConeTwistJoint)initWithBody:(id)a3 frame:(SCNMatrix4 *)a4;
- (SCNPhysicsConeTwistJoint)initWithBodyA:(id)a3 frameA:(SCNMatrix4 *)a4 bodyB:(id)a5 frameB:(SCNMatrix4 *)a6;
- (SCNPhysicsConeTwistJoint)initWithCoder:(id)a3;
- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4;
- (void)_copyDefinition:(id *)a3;
- (void)_willRemoveFromPhysicsWorld:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFrameA:(SCNMatrix4 *)frameA;
- (void)setFrameB:(SCNMatrix4 *)frameB;
- (void)setMaximumAngularLimit1:(CGFloat)maximumAngularLimit1;
- (void)setMaximumAngularLimit2:(CGFloat)maximumAngularLimit2;
- (void)setMaximumTwistAngle:(CGFloat)maximumTwistAngle;
@end

@implementation SCNPhysicsConeTwistJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  constraint = self->_constraint;
  if (constraint) {
    (*((void (**)(btConeTwistConstraint *, SEL))constraint->var0 + 1))(constraint, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsConeTwistJoint;
  [(SCNPhysicsConeTwistJoint *)&v4 dealloc];
}

- (SCNPhysicsConeTwistJoint)initWithBodyA:(id)a3 frameA:(SCNMatrix4 *)a4 bodyB:(id)a5 frameB:(SCNMatrix4 *)a6
{
  v18.receiver = self;
  v18.super_class = (Class)SCNPhysicsConeTwistJoint;
  v10 = [(SCNPhysicsConeTwistJoint *)&v18 init];
  if (v10)
  {
    *((void *)v10 + 1) = a3;
    long long v11 = *(_OWORD *)&a4->m11;
    long long v12 = *(_OWORD *)&a4->m21;
    long long v13 = *(_OWORD *)&a4->m31;
    *((_OWORD *)v10 + 4) = *(_OWORD *)&a4->m41;
    *((_OWORD *)v10 + 3) = v13;
    *((_OWORD *)v10 + 2) = v12;
    *((_OWORD *)v10 + 1) = v11;
    *((void *)v10 + 10) = a5;
    long long v14 = *(_OWORD *)&a6->m41;
    long long v16 = *(_OWORD *)&a6->m11;
    long long v15 = *(_OWORD *)&a6->m21;
    *(_OWORD *)(v10 + 120) = *(_OWORD *)&a6->m31;
    *(_OWORD *)(v10 + 136) = v14;
    *(_OWORD *)(v10 + 88) = v16;
    *(_OWORD *)(v10 + 104) = v15;
    *(int64x2_t *)(v10 + 152) = vdupq_n_s64(0x3FE921FB54442D18uLL);
    *((void *)v10 + 21) = 0x3FE921FB54442D18;
  }
  return (SCNPhysicsConeTwistJoint *)v10;
}

- (SCNPhysicsConeTwistJoint)initWithBody:(id)a3 frame:(SCNMatrix4 *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SCNPhysicsConeTwistJoint;
  v6 = [(SCNPhysicsConeTwistJoint *)&v11 init];
  if (v6)
  {
    v6->_definition.bodyA = (SCNPhysicsBody *)a3;
    long long v7 = *(_OWORD *)&a4->m11;
    long long v8 = *(_OWORD *)&a4->m21;
    long long v9 = *(_OWORD *)&a4->m31;
    *(_OWORD *)&v6->_definition.frameA.m41 = *(_OWORD *)&a4->m41;
    *(_OWORD *)&v6->_definition.frameA.m31 = v9;
    *(_OWORD *)&v6->_definition.frameA.m21 = v8;
    *(_OWORD *)&v6->_definition.frameA.m11 = v7;
  }
  return v6;
}

+ (SCNPhysicsConeTwistJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA frameA:(SCNMatrix4 *)frameA bodyB:(SCNPhysicsBody *)bodyB frameB:(SCNMatrix4 *)frameB
{
  id v10 = objc_alloc((Class)a1);
  long long v11 = *(_OWORD *)&frameA->m21;
  v17[0] = *(_OWORD *)&frameA->m11;
  v17[1] = v11;
  long long v12 = *(_OWORD *)&frameA->m41;
  v17[2] = *(_OWORD *)&frameA->m31;
  v17[3] = v12;
  long long v13 = *(_OWORD *)&frameB->m21;
  v16[0] = *(_OWORD *)&frameB->m11;
  v16[1] = v13;
  long long v14 = *(_OWORD *)&frameB->m41;
  v16[2] = *(_OWORD *)&frameB->m31;
  v16[3] = v14;
  return (SCNPhysicsConeTwistJoint *)(id)[v10 initWithBodyA:bodyA frameA:v17 bodyB:bodyB frameB:v16];
}

+ (SCNPhysicsConeTwistJoint)jointWithBody:(SCNPhysicsBody *)body frame:(SCNMatrix4 *)frame
{
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)&frame->m21;
  v10[0] = *(_OWORD *)&frame->m11;
  v10[1] = v7;
  long long v8 = *(_OWORD *)&frame->m41;
  v10[2] = *(_OWORD *)&frame->m31;
  v10[3] = v8;
  return (SCNPhysicsConeTwistJoint *)(id)[v6 initWithBody:body frame:v10];
}

- (SCNPhysicsBody)bodyA
{
  return self->_definition.bodyA;
}

- (SCNPhysicsBody)bodyB
{
  return self->_definition.bodyB;
}

- (SCNMatrix4)frameA
{
  long long v3 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m21 = v3;
  long long v4 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m41 = v4;
  return self;
}

- (void)setFrameA:(SCNMatrix4 *)frameA
{
  long long v3 = *(_OWORD *)&frameA->m31;
  long long v4 = *(_OWORD *)&frameA->m41;
  long long v5 = *(_OWORD *)&frameA->m21;
  *(_OWORD *)&self->_definition.frameA.m11 = *(_OWORD *)&frameA->m11;
  *(_OWORD *)&self->_definition.frameA.m41 = v4;
  *(_OWORD *)&self->_definition.frameA.m31 = v3;
  *(_OWORD *)&self->_definition.frameA.m21 = v5;
  world = self->_world;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__SCNPhysicsConeTwistJoint_setFrameA___block_invoke;
  v10[3] = &unk_264007B18;
  _OWORD v10[4] = self;
  long long v7 = *(_OWORD *)&frameA->m11;
  long long v8 = *(_OWORD *)&frameA->m21;
  long long v9 = *(_OWORD *)&frameA->m41;
  long long v13 = *(_OWORD *)&frameA->m31;
  long long v14 = v9;
  long long v11 = v7;
  long long v12 = v8;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v10];
}

uint64_t __38__SCNPhysicsConeTwistJoint_setFrameA___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 176))
  {
    int v2 = *(_DWORD *)(result + 44);
    int v3 = *(_DWORD *)(result + 48);
    int v4 = *(_DWORD *)(result + 56);
    int v5 = *(_DWORD *)(result + 60);
    int v6 = *(_DWORD *)(result + 64);
    int v7 = *(_DWORD *)(result + 72);
    int v8 = *(_DWORD *)(result + 76);
    int v9 = *(_DWORD *)(result + 80);
    int v10 = *(_DWORD *)(result + 96);
    v25[0] = *(_DWORD *)(result + 40);
    v25[1] = v4;
    v25[2] = v7;
    v25[3] = 0;
    v25[4] = v2;
    v25[5] = v5;
    v25[6] = v8;
    v25[7] = 0;
    v25[8] = v3;
    v25[9] = v6;
    v25[10] = v9;
    v25[11] = 0;
    uint64_t v26 = *(void *)(result + 88);
    int v27 = v10;
    int v28 = 0;
    int v11 = *(_DWORD *)(v1 + 92);
    int v12 = *(_DWORD *)(v1 + 96);
    int v13 = *(_DWORD *)(v1 + 104);
    int v14 = *(_DWORD *)(v1 + 108);
    int v15 = *(_DWORD *)(v1 + 112);
    int v16 = *(_DWORD *)(v1 + 120);
    int v17 = *(_DWORD *)(v1 + 124);
    int v18 = *(_DWORD *)(v1 + 128);
    int v19 = *(_DWORD *)(v1 + 144);
    uint64_t v20 = *(void *)(v1 + 136);
    v21[0] = *(_DWORD *)(v1 + 88);
    v21[1] = v13;
    v21[2] = v16;
    v21[3] = 0;
    v21[4] = v11;
    v21[5] = v14;
    v21[6] = v17;
    v21[7] = 0;
    v21[8] = v12;
    v21[9] = v15;
    v21[10] = v18;
    v21[11] = 0;
    uint64_t v22 = v20;
    int v23 = v19;
    int v24 = 0;
    return (*(uint64_t (**)(void, _DWORD *, _DWORD *))(**(void **)(v1 + 176) + 88))(*(void *)(v1 + 176), v25, v21);
  }
  return result;
}

- (SCNMatrix4)frameB
{
  long long v3 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m21 = v3;
  long long v4 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m41 = v4;
  return self;
}

- (void)setFrameB:(SCNMatrix4 *)frameB
{
  long long v3 = *(_OWORD *)&frameB->m41;
  long long v5 = *(_OWORD *)&frameB->m11;
  long long v4 = *(_OWORD *)&frameB->m21;
  *(_OWORD *)&self->_definition.frameB.m31 = *(_OWORD *)&frameB->m31;
  *(_OWORD *)&self->_definition.frameB.m41 = v3;
  *(_OWORD *)&self->_definition.frameB.m11 = v5;
  *(_OWORD *)&self->_definition.frameB.m21 = v4;
  world = self->_world;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__SCNPhysicsConeTwistJoint_setFrameB___block_invoke;
  v10[3] = &unk_264007B18;
  _OWORD v10[4] = self;
  long long v7 = *(_OWORD *)&frameB->m11;
  long long v8 = *(_OWORD *)&frameB->m21;
  long long v9 = *(_OWORD *)&frameB->m41;
  long long v13 = *(_OWORD *)&frameB->m31;
  long long v14 = v9;
  long long v11 = v7;
  long long v12 = v8;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v10];
}

uint64_t __38__SCNPhysicsConeTwistJoint_setFrameB___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 176))
  {
    int v2 = *(_DWORD *)(v1 + 20);
    int v3 = *(_DWORD *)(v1 + 24);
    int v4 = *(_DWORD *)(v1 + 32);
    int v5 = *(_DWORD *)(v1 + 36);
    int v6 = *(_DWORD *)(v1 + 40);
    int v7 = *(_DWORD *)(v1 + 48);
    int v8 = *(_DWORD *)(v1 + 52);
    int v9 = *(_DWORD *)(v1 + 56);
    int v10 = *(_DWORD *)(v1 + 72);
    uint64_t v11 = *(void *)(v1 + 64);
    v25[0] = *(_DWORD *)(v1 + 16);
    v25[1] = v4;
    v25[2] = v7;
    v25[3] = 0;
    v25[4] = v2;
    v25[5] = v5;
    v25[6] = v8;
    v25[7] = 0;
    v25[8] = v3;
    v25[9] = v6;
    v25[10] = v9;
    v25[11] = 0;
    uint64_t v26 = v11;
    int v27 = v10;
    int v28 = 0;
    int v12 = *(_DWORD *)(result + 44);
    int v13 = *(_DWORD *)(result + 48);
    int v14 = *(_DWORD *)(result + 56);
    int v15 = *(_DWORD *)(result + 60);
    int v16 = *(_DWORD *)(result + 64);
    int v17 = *(_DWORD *)(result + 72);
    int v18 = *(_DWORD *)(result + 76);
    int v19 = *(_DWORD *)(result + 80);
    int v20 = *(_DWORD *)(result + 96);
    v21[0] = *(_DWORD *)(result + 40);
    v21[1] = v14;
    v21[2] = v17;
    v21[3] = 0;
    v21[4] = v12;
    v21[5] = v15;
    v21[6] = v18;
    v21[7] = 0;
    v21[8] = v13;
    v21[9] = v16;
    v21[10] = v19;
    v21[11] = 0;
    uint64_t v22 = *(void *)(result + 88);
    int v23 = v20;
    int v24 = 0;
    return (*(uint64_t (**)(void, _DWORD *, _DWORD *))(**(void **)(v1 + 176) + 88))(*(void *)(v1 + 176), v25, v21);
  }
  return result;
}

- (CGFloat)maximumAngularLimit1
{
  return self->_definition.maximumAngularLimit1;
}

- (void)setMaximumAngularLimit1:(CGFloat)maximumAngularLimit1
{
  self->_definition.maximumAngularLimit1 = maximumAngularLimit1;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SCNPhysicsConeTwistJoint_setMaximumAngularLimit1___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&v4[5] = maximumAngularLimit1;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

double __52__SCNPhysicsConeTwistJoint_setMaximumAngularLimit1___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 176);
  if (v2)
  {
    float v3 = *(double *)(a1 + 40);
    *(float *)(v2 + 512) = v3;
    *(float32x2_t *)(v2 + 516) = vcvt_f32_f64(*(float64x2_t *)(v1 + 160));
    double result = 0.000000381469873;
    *(void *)(v2 + 496) = 0x3E99999A3F000000;
    *(_DWORD *)(v2 + 504) = 1065353216;
  }
  return result;
}

- (CGFloat)maximumAngularLimit2
{
  return self->_definition.maximumAngularLimit2;
}

- (void)setMaximumAngularLimit2:(CGFloat)maximumAngularLimit2
{
  self->_definition.maximumAngularLimit2 = maximumAngularLimit2;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SCNPhysicsConeTwistJoint_setMaximumAngularLimit2___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&v4[5] = maximumAngularLimit2;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

double __52__SCNPhysicsConeTwistJoint_setMaximumAngularLimit2___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 176);
  if (v2)
  {
    uint64_t v3 = v1 + 8;
    float v4 = *(double *)(v3 + 144);
    float v5 = *(double *)(a1 + 40);
    float v6 = *(double *)(v3 + 160);
    *(float *)(v2 + 512) = v4;
    *(float *)(v2 + 516) = v5;
    *(float *)(v2 + 520) = v6;
    double result = 0.000000381469873;
    *(void *)(v2 + 496) = 0x3E99999A3F000000;
    *(_DWORD *)(v2 + 504) = 1065353216;
  }
  return result;
}

- (CGFloat)maximumTwistAngle
{
  return self->_definition.maximumTwistAngle;
}

- (void)setMaximumTwistAngle:(CGFloat)maximumTwistAngle
{
  self->_definition.maximumTwistAngle = maximumTwistAngle;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SCNPhysicsConeTwistJoint_setMaximumTwistAngle___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&v4[5] = maximumTwistAngle;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

double __49__SCNPhysicsConeTwistJoint_setMaximumTwistAngle___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(float32x2_t **)(v1 + 176);
  if (v2)
  {
    float32_t v3 = *(double *)(a1 + 40);
    v2[64] = vcvt_f32_f64(*(float64x2_t *)(v1 + 152));
    v2[65].f32[0] = v3;
    double result = 0.000000381469873;
    v2[62] = (float32x2_t)0x3E99999A3F000000;
    v2[63].i32[0] = 1065353216;
  }
  return result;
}

- (void)_copyDefinition:(id *)a3
{
  long long v4 = *(_OWORD *)&self->_definition.frameA.m13;
  long long v3 = *(_OWORD *)&self->_definition.frameA.m23;
  *(_OWORD *)a3->var0 = *(_OWORD *)&self->_definition.bodyA;
  *(_OWORD *)&a3->var0[16] = v4;
  *(_OWORD *)&a3->var0[32] = v3;
  long long v5 = *(_OWORD *)&self->_definition.frameB.m21;
  long long v7 = *(_OWORD *)&self->_definition.frameA.m33;
  long long v6 = *(_OWORD *)&self->_definition.frameA.m43;
  *(_OWORD *)&a3->var0[80] = *(_OWORD *)&self->_definition.frameB.m11;
  *(_OWORD *)&a3->var0[96] = v5;
  *(_OWORD *)&a3->var0[48] = v7;
  *(_OWORD *)&a3->var0[64] = v6;
  long long v9 = *(_OWORD *)&self->_definition.frameB.m41;
  long long v8 = *(_OWORD *)&self->_definition.maximumAngularLimit1;
  long long v10 = *(_OWORD *)&self->_definition.frameB.m31;
  *(double *)&a3->var0[160] = self->_definition.maximumTwistAngle;
  *(_OWORD *)&a3->var0[128] = v9;
  *(_OWORD *)&a3->var0[144] = v8;
  *(_OWORD *)&a3->var0[112] = v10;
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  world = self->_world;
  if (world) {
    BOOL v8 = world == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    long long v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:](v9);
    }
  }
  self->_world = (SCNPhysicsWorld *)a3;
  long long v10 = *(_OWORD *)&a4->var0[144];
  v16[8] = *(_OWORD *)&a4->var0[128];
  v16[9] = v10;
  uint64_t v17 = *(void *)&a4->var0[160];
  long long v11 = *(_OWORD *)&a4->var0[80];
  _OWORD v16[4] = *(_OWORD *)&a4->var0[64];
  v16[5] = v11;
  long long v12 = *(_OWORD *)&a4->var0[112];
  v16[6] = *(_OWORD *)&a4->var0[96];
  v16[7] = v12;
  long long v13 = *(_OWORD *)&a4->var0[16];
  v16[0] = *(_OWORD *)a4->var0;
  v16[1] = v13;
  long long v14 = *(_OWORD *)&a4->var0[48];
  v16[2] = *(_OWORD *)&a4->var0[32];
  v16[3] = v14;
  self->_constraint = (btConeTwistConstraint *)_createConstraintFromDefinition((uint64_t)v16);
  uint64_t v15 = [a3 _handle];
  (*(void (**)(uint64_t, btConeTwistConstraint *, void))(*(void *)v15 + 112))(v15, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  if (self->_constraint)
  {
    uint64_t v4 = [a3 _handle];
    (*(void (**)(uint64_t, btConeTwistConstraint *))(*(void *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint) {
      (*((void (**)(btConeTwistConstraint *))constraint->var0 + 1))(constraint);
    }
    self->_constraint = 0;
    self->_world = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsConeTwistJoint;
  -[SCNPhysicsBehavior encodeWithCoder:](&v7, sel_encodeWithCoder_);
  p_definition = &self->_definition;
  if (p_definition->bodyA) {
    [a3 encodeObject:p_definition->bodyA forKey:@"bodyA"];
  }
  bodyB = p_definition->bodyB;
  if (bodyB) {
    [a3 encodeObject:bodyB forKey:@"bodyB"];
  }
}

- (SCNPhysicsConeTwistJoint)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsConeTwistJoint;
  uint64_t v4 = -[SCNPhysicsBehavior initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_definition.bodyA = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyA"];
    v4->_definition.bodyB = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyB"];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

@end