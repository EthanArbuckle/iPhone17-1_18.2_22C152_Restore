@interface SCNPhysicsSliderJoint
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsSliderJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor;
+ (SCNPhysicsSliderJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB;
- (CGFloat)maximumAngularLimit;
- (CGFloat)maximumLinearLimit;
- (CGFloat)minimumAngularLimit;
- (CGFloat)minimumLinearLimit;
- (CGFloat)motorMaximumForce;
- (CGFloat)motorMaximumTorque;
- (CGFloat)motorTargetAngularVelocity;
- (CGFloat)motorTargetLinearVelocity;
- (SCNPhysicsBody)bodyA;
- (SCNPhysicsBody)bodyB;
- (SCNPhysicsSliderJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5;
- (SCNPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8;
- (SCNPhysicsSliderJoint)initWithCoder:(id)a3;
- (SCNVector3)anchorA;
- (SCNVector3)anchorB;
- (SCNVector3)axisA;
- (SCNVector3)axisB;
- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4;
- (void)_copyDefinition:(id *)a3;
- (void)_willRemoveFromPhysicsWorld:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorA:(SCNVector3)anchorA;
- (void)setAnchorB:(SCNVector3)anchorB;
- (void)setAxisA:(SCNVector3)axisA;
- (void)setAxisB:(SCNVector3)axisB;
- (void)setMaximumAngularLimit:(CGFloat)maximumAngularLimit;
- (void)setMaximumLinearLimit:(CGFloat)maximumLinearLimit;
- (void)setMinimumAngularLimit:(CGFloat)minimumAngularLimit;
- (void)setMinimumLinearLimit:(CGFloat)minimumLinearLimit;
- (void)setMotorMaximumForce:(CGFloat)motorMaximumForce;
- (void)setMotorMaximumTorque:(CGFloat)motorMaximumTorque;
- (void)setMotorTargetAngularVelocity:(CGFloat)motorTargetAngularVelocity;
- (void)setMotorTargetLinearVelocity:(CGFloat)motorTargetLinearVelocity;
@end

@implementation SCNPhysicsSliderJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  p_definition = &self->_definition;

  constraint = self->_constraint;
  if (constraint) {
    (*((void (**)(btSliderConstraint *))constraint->var0 + 1))(constraint);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsSliderJoint;
  [(SCNPhysicsSliderJoint *)&v5 dealloc];
}

- (SCNPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8
{
  float z = a5.z;
  float y = a5.y;
  float x = a5.x;
  float v12 = a4.z;
  float v13 = a4.y;
  float v14 = a4.x;
  v18.receiver = self;
  v18.super_class = (Class)SCNPhysicsSliderJoint;
  v16 = [(SCNPhysicsSliderJoint *)&v18 init];
  if (v16)
  {
    *((void *)v16 + 1) = a3;
    *((float *)v16 + 6) = v14;
    *((float *)v16 + 7) = v13;
    *((float *)v16 + 8) = v12;
    *((float *)v16 + 9) = x;
    *((float *)v16 + 10) = y;
    *((float *)v16 + 11) = z;
    *((void *)v16 + 2) = a6;
    *((SCNVector3 *)v16 + 4) = a7;
    *((_DWORD *)v16 + 15) = v19;
    *((_DWORD *)v16 + 16) = v20;
    *((_DWORD *)v16 + 17) = v21;
    *(_OWORD *)(v16 + 72) = xmmword_20B5EFB20;
    *(_OWORD *)(v16 + 88) = xmmword_20B5EFB30;
    *((void *)v16 + 16) = 0x3FF0000000000000;
    *((void *)v16 + 14) = 0x3FF0000000000000;
  }
  return (SCNPhysicsSliderJoint *)v16;
}

- (SCNPhysicsSliderJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5
{
  return -[SCNPhysicsSliderJoint initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:](self, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", a3, 0, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z, *(double *)&a5.x, *(double *)&a5.y, *(double *)&a5.z, 0, 0, 0);
}

+ (SCNPhysicsSliderJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB
{
  float z = anchorA.z;
  float y = anchorA.y;
  float x = anchorA.x;
  float v12 = axisA.z;
  float v13 = axisA.y;
  float v14 = axisA.x;
  id v16 = objc_alloc((Class)a1);
  HIDWORD(v25) = v28;
  *(void *)((char *)&v25 + 4) = v27;
  *(float *)&long long v25 = axisB.z;
  *(float *)&double v17 = v14;
  *(float *)&double v18 = v13;
  *(float *)&double v19 = v12;
  *(float *)&double v20 = x;
  *(float *)&double v21 = y;
  *(float *)&double v22 = z;
  v23 = objc_msgSend(v16, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", bodyA, bodyB, v17, v18, v19, v20, v21, v22, *(void *)&axisB.x, v25);

  return (SCNPhysicsSliderJoint *)v23;
}

+ (SCNPhysicsSliderJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor
{
  float z = anchor.z;
  float y = anchor.y;
  float x = anchor.x;
  float v8 = axis.z;
  float v9 = axis.y;
  float v10 = axis.x;
  id v12 = objc_alloc((Class)a1);
  *(float *)&double v13 = v10;
  *(float *)&double v14 = v9;
  *(float *)&double v15 = v8;
  *(float *)&double v16 = x;
  *(float *)&double v17 = y;
  *(float *)&double v18 = z;
  double v19 = objc_msgSend(v12, "initWithBody:axis:anchor:", body, v13, v14, v15, v16, v17, v18);

  return (SCNPhysicsSliderJoint *)v19;
}

- (SCNPhysicsBody)bodyA
{
  return self->_definition.bodyA;
}

- (SCNPhysicsBody)bodyB
{
  return self->_definition.bodyB;
}

- (SCNVector3)axisA
{
  float x = self->_definition.axisA.x;
  float y = self->_definition.axisA.y;
  float z = self->_definition.axisA.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAxisA:(SCNVector3)axisA
{
  self->_definition.axisA = axisA;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SCNPhysicsSliderJoint_setAxisA___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = axisA;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __34__SCNPhysicsSliderJoint_setAxisA___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 136);
  if (v1)
  {
    float v2 = *(float *)(result + 40);
    float v3 = *(float *)(result + 44);
    float v4 = *(float *)(result + 48);
    BOOL v5 = fabsf(v4) <= 0.70711;
    float v6 = (float)(v3 * v3) + (float)(v2 * v2);
    float v7 = 1.0 / sqrtf(v6);
    float v8 = -(float)(v3 * v7);
    float v9 = v2 * v7;
    float v10 = -(float)(v4 * (float)(v2 * v7));
    float v11 = v4 * v8;
    float v12 = v6 * v7;
    float v13 = 0.0;
    float v14 = (float)(v4 * v4) + (float)(v3 * v3);
    float v15 = 1.0 / sqrtf(v14);
    float v16 = -(float)(v4 * v15);
    float v17 = v3 * v15;
    float v18 = v14 * v15;
    float v19 = v2 * v16;
    if (v5)
    {
      float v18 = v10;
    }
    else
    {
      float v9 = v16;
      float v8 = 0.0;
      float v13 = v17;
      float v11 = -(float)(v2 * v17);
    }
    LODWORD(v20) = *(_DWORD *)(result + 40);
    *((float *)&v20 + 1) = v8;
    HIDWORD(v22) = 0;
    *((void *)&v20 + 1) = LODWORD(v18);
    LODWORD(v21) = *(_DWORD *)(result + 44);
    *((float *)&v21 + 1) = v9;
    *((void *)&v21 + 1) = LODWORD(v11);
    LODWORD(v22) = *(_DWORD *)(result + 48);
    if (v5) {
      float v23 = v12;
    }
    else {
      float v23 = v19;
    }
    *((float *)&v22 + 1) = v13;
    *((float *)&v22 + 2) = v23;
    *(_OWORD *)(v1 + 80) = v20;
    *(_OWORD *)(v1 + 96) = v21;
    *(_OWORD *)(v1 + 112) = v22;
    v24.n128_f64[0] = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(void *)(v1 + 40) + 16), (const btTransform *)(*(void *)(v1 + 48) + 16));
    long long v25 = *(uint64_t (**)(uint64_t, __n128))(*(void *)v1 + 16);
    return v25(v1, v24);
  }
  return result;
}

- (SCNVector3)axisB
{
  float x = self->_definition.axisB.x;
  float y = self->_definition.axisB.y;
  float z = self->_definition.axisB.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAxisB:(SCNVector3)axisB
{
  self->_definition.axisB = axisB;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SCNPhysicsSliderJoint_setAxisB___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = axisB;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __34__SCNPhysicsSliderJoint_setAxisB___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 136);
  if (v1)
  {
    float v2 = *(float *)(result + 40);
    float v3 = *(float *)(result + 44);
    float v4 = *(float *)(result + 48);
    BOOL v5 = fabsf(v4) <= 0.70711;
    float v6 = (float)(v3 * v3) + (float)(v2 * v2);
    float v7 = 1.0 / sqrtf(v6);
    float v8 = -(float)(v3 * v7);
    float v9 = v2 * v7;
    float v10 = -(float)(v4 * (float)(v2 * v7));
    float v11 = v4 * v8;
    float v12 = v6 * v7;
    float v13 = 0.0;
    float v14 = (float)(v4 * v4) + (float)(v3 * v3);
    float v15 = 1.0 / sqrtf(v14);
    float v16 = -(float)(v4 * v15);
    float v17 = v3 * v15;
    float v18 = v14 * v15;
    float v19 = v2 * v16;
    if (v5)
    {
      float v18 = v10;
    }
    else
    {
      float v9 = v16;
      float v8 = 0.0;
      float v13 = v17;
      float v11 = -(float)(v2 * v17);
    }
    LODWORD(v20) = *(_DWORD *)(result + 40);
    *((float *)&v20 + 1) = v8;
    HIDWORD(v22) = 0;
    *((void *)&v20 + 1) = LODWORD(v18);
    LODWORD(v21) = *(_DWORD *)(result + 44);
    *((float *)&v21 + 1) = v9;
    *((void *)&v21 + 1) = LODWORD(v11);
    LODWORD(v22) = *(_DWORD *)(result + 48);
    if (v5) {
      float v23 = v12;
    }
    else {
      float v23 = v19;
    }
    *((float *)&v22 + 1) = v13;
    *((float *)&v22 + 2) = v23;
    *(_OWORD *)(v1 + 144) = v20;
    *(_OWORD *)(v1 + 160) = v21;
    *(_OWORD *)(v1 + 176) = v22;
    v24.n128_f64[0] = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(void *)(v1 + 40) + 16), (const btTransform *)(*(void *)(v1 + 48) + 16));
    long long v25 = *(uint64_t (**)(uint64_t, __n128))(*(void *)v1 + 16);
    return v25(v1, v24);
  }
  return result;
}

- (SCNVector3)anchorA
{
  float x = self->_definition.anchorA.x;
  float y = self->_definition.anchorA.y;
  float z = self->_definition.anchorA.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAnchorA:(SCNVector3)anchorA
{
  self->_definition.anchorA = anchorA;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsSliderJoint_setAnchorA___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorA;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __36__SCNPhysicsSliderJoint_setAnchorA___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 136);
  if (v1)
  {
    *(void *)&long long v2 = *(void *)(result + 40);
    *((void *)&v2 + 1) = *(unsigned int *)(result + 48);
    *(_OWORD *)(v1 + 128) = v2;
    v3.n128_f64[0] = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(void *)(v1 + 40) + 16), (const btTransform *)(*(void *)(v1 + 48) + 16));
    float v4 = *(uint64_t (**)(uint64_t, __n128))(*(void *)v1 + 16);
    return v4(v1, v3);
  }
  return result;
}

- (SCNVector3)anchorB
{
  float x = self->_definition.axisB.x;
  float y = self->_definition.axisB.y;
  float z = self->_definition.axisB.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAnchorB:(SCNVector3)anchorB
{
  self->_definition.anchorB = anchorB;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsSliderJoint_setAnchorB___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorB;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __36__SCNPhysicsSliderJoint_setAnchorB___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 136);
  if (v1)
  {
    *(void *)&long long v2 = *(void *)(result + 40);
    *((void *)&v2 + 1) = *(unsigned int *)(result + 48);
    *(_OWORD *)(v1 + 192) = v2;
    v3.n128_f64[0] = btSliderConstraint::calculateTransforms((btSliderConstraint *)v1, (const btTransform *)(*(void *)(v1 + 40) + 16), (const btTransform *)(*(void *)(v1 + 48) + 16));
    float v4 = *(uint64_t (**)(uint64_t, __n128))(*(void *)v1 + 16);
    return v4(v1, v3);
  }
  return result;
}

- (CGFloat)minimumLinearLimit
{
  return self->_definition.minLinearLimit;
}

- (void)setMinimumLinearLimit:(CGFloat)minimumLinearLimit
{
  self->_definition.minLinearLimit = minimumLinearLimit;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMinimumLinearLimit___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = minimumLinearLimit;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __47__SCNPhysicsSliderJoint_setMinimumLinearLimit___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 212) = result;
  }
  return result;
}

- (CGFloat)maximumLinearLimit
{
  return self->_definition.maxLinearLimit;
}

- (void)setMaximumLinearLimit:(CGFloat)maximumLinearLimit
{
  self->_definition.maxLinearLimit = maximumLinearLimit;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMaximumLinearLimit___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = maximumLinearLimit;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __47__SCNPhysicsSliderJoint_setMaximumLinearLimit___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 216) = result;
  }
  return result;
}

- (CGFloat)minimumAngularLimit
{
  return self->_definition.minAngularLimit;
}

- (void)setMinimumAngularLimit:(CGFloat)minimumAngularLimit
{
  self->_definition.minAngularLimit = minimumAngularLimit;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SCNPhysicsSliderJoint_setMinimumAngularLimit___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = minimumAngularLimit;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

void __48__SCNPhysicsSliderJoint_setMinimumAngularLimit___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float v2 = *(double *)(a1 + 40);
    float v3 = fmodf(v2, 6.2832);
    if (v3 >= -3.1416)
    {
      if (v3 > 3.1416) {
        float v3 = v3 + -6.2832;
      }
    }
    else
    {
      float v3 = v3 + 6.2832;
    }
    *(float *)(v1 + 220) = v3;
  }
}

- (CGFloat)maximumAngularLimit
{
  return self->_definition.maxAngularLimit;
}

- (void)setMaximumAngularLimit:(CGFloat)maximumAngularLimit
{
  self->_definition.maxAngularLimit = maximumAngularLimit;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SCNPhysicsSliderJoint_setMaximumAngularLimit___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = maximumAngularLimit;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

void __48__SCNPhysicsSliderJoint_setMaximumAngularLimit___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float v2 = *(double *)(a1 + 40);
    float v3 = fmodf(v2, 6.2832);
    if (v3 >= -3.1416)
    {
      if (v3 > 3.1416) {
        float v3 = v3 + -6.2832;
      }
    }
    else
    {
      float v3 = v3 + 6.2832;
    }
    *(float *)(v1 + 224) = v3;
  }
}

- (CGFloat)motorTargetLinearVelocity
{
  return self->_definition.motorTargetLinearVelocity;
}

- (void)setMotorTargetLinearVelocity:(CGFloat)motorTargetLinearVelocity
{
  self->_definition.motorTargetLinearVelocitfloat y = motorTargetLinearVelocity;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCNPhysicsSliderJoint_setMotorTargetLinearVelocity___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = motorTargetLinearVelocity;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __54__SCNPhysicsSliderJoint_setMotorTargetLinearVelocity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    double v2 = *(double *)(a1 + 40);
    *(unsigned char *)(v1 + 1216) = v2 != 0.0;
    float result = v2;
    *(float *)(*(void *)(*(void *)(a1 + 32) + 136) + 1220) = result;
  }
  return result;
}

- (CGFloat)motorMaximumForce
{
  return self->_definition.motorMaximumForce;
}

- (void)setMotorMaximumForce:(CGFloat)motorMaximumForce
{
  self->_definition.motorMaximumForce = motorMaximumForce;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SCNPhysicsSliderJoint_setMotorMaximumForce___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = motorMaximumForce;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __46__SCNPhysicsSliderJoint_setMotorMaximumForce___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 1224) = result;
  }
  return result;
}

- (CGFloat)motorTargetAngularVelocity
{
  return self->_definition.motorTargetAngularVelocity;
}

- (void)setMotorTargetAngularVelocity:(CGFloat)motorTargetAngularVelocity
{
  self->_definition.motorTargetAngularVelocitfloat y = motorTargetAngularVelocity;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SCNPhysicsSliderJoint_setMotorTargetAngularVelocity___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = motorTargetAngularVelocity;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __55__SCNPhysicsSliderJoint_setMotorTargetAngularVelocity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    double v2 = *(double *)(a1 + 40);
    *(unsigned char *)(v1 + 1232) = v2 != 0.0;
    float result = v2;
    *(float *)(*(void *)(*(void *)(a1 + 32) + 136) + 1236) = result;
  }
  return result;
}

- (CGFloat)motorMaximumTorque
{
  return self->_definition.motorMaximumTorque;
}

- (void)setMotorMaximumTorque:(CGFloat)motorMaximumTorque
{
  self->_definition.motorMaximumTorque = motorMaximumTorque;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SCNPhysicsSliderJoint_setMotorMaximumTorque___block_invoke;
  v4[3] = &unk_264004FC0;
  v4[4] = self;
  *(CGFloat *)&void v4[5] = motorMaximumTorque;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __47__SCNPhysicsSliderJoint_setMotorMaximumTorque___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 1240) = result;
  }
  return result;
}

- (void)_copyDefinition:(id *)a3
{
  long long v3 = *(_OWORD *)&self->_definition.axisB.z;
  long long v5 = *(_OWORD *)&self->_definition.bodyA;
  long long v4 = *(_OWORD *)&self->_definition.axisA.x;
  *(_OWORD *)&a3->var0[32] = *(_OWORD *)&self->_definition.anchorA.y;
  *(_OWORD *)&a3->var0[48] = v3;
  *(_OWORD *)a3->var0 = v5;
  *(_OWORD *)&a3->var0[16] = v4;
  long long v6 = *(_OWORD *)&self->_definition.motorTargetAngularVelocity;
  long long v8 = *(_OWORD *)&self->_definition.minLinearLimit;
  long long v7 = *(_OWORD *)&self->_definition.minAngularLimit;
  *(_OWORD *)&a3->var0[96] = *(_OWORD *)&self->_definition.motorTargetLinearVelocity;
  *(_OWORD *)&a3->var0[112] = v6;
  *(_OWORD *)&a3->var0[64] = v8;
  *(_OWORD *)&a3->var0[80] = v7;
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
    float v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:](v9);
    }
  }
  self->_world = (SCNPhysicsWorld *)a3;
  long long v10 = *(_OWORD *)&a4->var0[80];
  v15[4] = *(_OWORD *)&a4->var0[64];
  v15[5] = v10;
  long long v11 = *(_OWORD *)&a4->var0[112];
  v15[6] = *(_OWORD *)&a4->var0[96];
  v15[7] = v11;
  long long v12 = *(_OWORD *)&a4->var0[16];
  v15[0] = *(_OWORD *)a4->var0;
  v15[1] = v12;
  long long v13 = *(_OWORD *)&a4->var0[48];
  v15[2] = *(_OWORD *)&a4->var0[32];
  v15[3] = v13;
  self->_constraint = (btSliderConstraint *)_createConstraintFromDefinition((uint64_t)v15);
  uint64_t v14 = [a3 _handle];
  (*(void (**)(uint64_t, btSliderConstraint *, void))(*(void *)v14 + 112))(v14, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  if (self->_constraint)
  {
    uint64_t v4 = [a3 _handle];
    (*(void (**)(uint64_t, btSliderConstraint *))(*(void *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint) {
      (*((void (**)(btSliderConstraint *))constraint->var0 + 1))(constraint);
    }
    self->_constraint = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsSliderJoint;
  -[SCNPhysicsBehavior encodeWithCoder:](&v7, sel_encodeWithCoder_);
  p_definition = &self->_definition;
  if (p_definition->bodyA) {
    [a3 encodeObject:p_definition->bodyA forKey:@"bodyA"];
  }
  bodyB = p_definition->bodyB;
  if (bodyB) {
    [a3 encodeObject:bodyB forKey:@"bodyB"];
  }
  SCNEncodeVector3(a3, @"axisA", p_definition->axisA.x, p_definition->axisA.y, p_definition->axisA.z);
  SCNEncodeVector3(a3, @"axisB", p_definition->axisB.x, p_definition->axisB.y, p_definition->axisB.z);
  SCNEncodeVector3(a3, @"anchorA", p_definition->anchorA.x, p_definition->anchorA.y, p_definition->anchorA.z);
  SCNEncodeVector3(a3, @"anchorB", p_definition->anchorB.x, p_definition->anchorB.y, p_definition->anchorB.z);
  [a3 encodeDouble:@"minLinearLimit" forKey:p_definition->minLinearLimit];
  [a3 encodeDouble:@"maxLinearLimit" forKey:p_definition->maxLinearLimit];
  [a3 encodeDouble:@"minAngularLimit" forKey:p_definition->minAngularLimit];
  [a3 encodeDouble:@"maxAngularLimit" forKey:p_definition->maxAngularLimit];
  [a3 encodeDouble:@"motorTargetLinearVelocity" forKey:p_definition->motorTargetLinearVelocity];
  [a3 encodeDouble:@"motorMaximumForce" forKey:p_definition->motorMaximumForce];
  [a3 encodeDouble:@"motorTargetAngularVelocity" forKey:p_definition->motorTargetAngularVelocity];
  [a3 encodeDouble:@"motorMaximumTorque" forKey:p_definition->motorMaximumTorque];
}

- (SCNPhysicsSliderJoint)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SCNPhysicsSliderJoint;
  uint64_t v4 = -[SCNPhysicsBehavior initWithCoder:](&v23, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_definition.axisA.float x = SCNDecodeVector3(a3, @"axisA");
    v4->_definition.axisA.float y = v6;
    v4->_definition.axisA.float z = v7;
    v4->_definition.axisB.float x = SCNDecodeVector3(a3, @"axisB");
    v4->_definition.axisB.float y = v8;
    v4->_definition.axisB.float z = v9;
    v4->_definition.anchorA.float x = SCNDecodeVector3(a3, @"anchorA");
    v4->_definition.anchorA.float y = v10;
    v4->_definition.anchorA.float z = v11;
    v4->_definition.anchorB.float x = SCNDecodeVector3(a3, @"anchorB");
    v4->_definition.anchorB.float y = v12;
    v4->_definition.anchorB.float z = v13;
    v4->_definition.bodyA = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyA"];
    v4->_definition.bodyB = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyB"];
    [a3 decodeDoubleForKey:@"minLinearLimit"];
    v4->_definition.minLinearLimit = v14;
    [a3 decodeDoubleForKey:@"maxLinearLimit"];
    v4->_definition.maxLinearLimit = v15;
    [a3 decodeDoubleForKey:@"minAngularLimit"];
    v4->_definition.minAngularLimit = v16;
    [a3 decodeDoubleForKey:@"maxAngularLimit"];
    v4->_definition.maxAngularLimit = v17;
    [a3 decodeDoubleForKey:@"motorTargetLinearVelocity"];
    v4->_definition.motorTargetLinearVelocitfloat y = v18;
    [a3 decodeDoubleForKey:@"motorMaximumForce"];
    v4->_definition.motorMaximumForce = v19;
    [a3 decodeDoubleForKey:@"motorTargetAngularVelocity"];
    v4->_definition.motorTargetAngularVelocitfloat y = v20;
    [a3 decodeDoubleForKey:@"motorMaximumTorque"];
    v4->_definition.motorMaximumTorque = v21;
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

@end