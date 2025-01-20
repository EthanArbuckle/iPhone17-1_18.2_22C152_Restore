@interface SCNPhysicsHingeJoint
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsHingeJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor;
+ (SCNPhysicsHingeJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB;
- (SCNPhysicsBody)bodyA;
- (SCNPhysicsBody)bodyB;
- (SCNPhysicsHingeJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5;
- (SCNPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8;
- (SCNPhysicsHingeJoint)initWithCoder:(id)a3;
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
@end

@implementation SCNPhysicsHingeJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  constraint = self->_constraint;
  if (constraint) {
    (*((void (**)(btHingeConstraint *, SEL))constraint->var0 + 1))(constraint, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsHingeJoint;
  [(SCNPhysicsHingeJoint *)&v4 dealloc];
}

- (SCNPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(SCNVector3)a4 anchorA:(SCNVector3)a5 bodyB:(id)a6 axisB:(SCNVector3)a7 anchorB:(SCNVector3)a8
{
  float z = a5.z;
  float y = a5.y;
  float x = a5.x;
  float v12 = a4.z;
  float v13 = a4.y;
  float v14 = a4.x;
  v18.receiver = self;
  v18.super_class = (Class)SCNPhysicsHingeJoint;
  v16 = [(SCNPhysicsHingeJoint *)&v18 init];
  if (v16)
  {
    v16->_definition.bodyA = (SCNPhysicsBody *)a3;
    v16->_definition.axisA.float x = v14;
    v16->_definition.axisA.float y = v13;
    v16->_definition.axisA.float z = v12;
    v16->_definition.anchorA.float x = x;
    v16->_definition.anchorA.float y = y;
    v16->_definition.anchorA.float z = z;
    v16->_definition.bodyB = (SCNPhysicsBody *)a6;
    v16->_definition.axisB = a7;
    v16->_definition.anchorB.float x = v19;
    v16->_definition.anchorB.float y = v20;
    v16->_definition.anchorB.float z = v21;
  }
  return v16;
}

- (SCNPhysicsHingeJoint)initWithBody:(id)a3 axis:(SCNVector3)a4 anchor:(SCNVector3)a5
{
  return -[SCNPhysicsHingeJoint initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:](self, "initWithBodyA:axisA:anchorA:bodyB:axisB:anchorB:", a3, 0, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z, *(double *)&a5.x, *(double *)&a5.y, *(double *)&a5.z, 0, 0, 0);
}

+ (SCNPhysicsHingeJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA axisA:(SCNVector3)axisA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB axisB:(SCNVector3)axisB anchorB:(SCNVector3)anchorB
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

  return (SCNPhysicsHingeJoint *)v23;
}

+ (SCNPhysicsHingeJoint)jointWithBody:(SCNPhysicsBody *)body axis:(SCNVector3)axis anchor:(SCNVector3)anchor
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

  return (SCNPhysicsHingeJoint *)v19;
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
  v4[2] = __33__SCNPhysicsHingeJoint_setAxisA___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = axisA;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

double __33__SCNPhysicsHingeJoint_setAxisA___block_invoke(uint64_t a1)
{
  v2 = *(btHingeConstraint **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    v4.i64[0] = *(void *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    *(void *)&double result = btHingeConstraint::setAxis(v2, &v4).u64[0];
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
  v4[2] = __33__SCNPhysicsHingeJoint_setAxisB___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = axisB;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

double __33__SCNPhysicsHingeJoint_setAxisB___block_invoke(uint64_t a1)
{
  v2 = *(btHingeConstraint **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    v4.i64[0] = *(void *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    *(void *)&double result = btHingeConstraint::setAxis(v2, &v4).u64[0];
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
  v4[2] = __35__SCNPhysicsHingeJoint_setAnchorA___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorA;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __35__SCNPhysicsHingeJoint_setAnchorA___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    btVector3 v3 = *(btVector3 *)(result + 672);
    v8.var0.var0[0] = *(btVector3 *)(result + 656);
    v8.var0.var0[1] = v3;
    btVector3 v4 = *(btVector3 *)(result + 688);
    btVector3 v5 = *(btVector3 *)(result + 736);
    v7.var0.var0[0] = *(btVector3 *)(result + 720);
    v7.var0.var0[1] = v5;
    btVector3 v6 = *(btVector3 *)(result + 768);
    v7.var0.var0[2] = *(btVector3 *)(result + 752);
    v7.var1 = v6;
    *(void *)v3.var0.var0 = *(void *)(a1 + 40);
    *(void *)&v3.var0.var0[2] = *(unsigned int *)(a1 + 48);
    v8.var0.var0[2] = v4;
    v8.var1 = v3;
    return btHingeConstraint::setFrames((btHingeConstraint *)result, &v8, &v7);
  }
  return result;
}

- (SCNVector3)anchorB
{
  float x = self->_definition.anchorB.x;
  float y = self->_definition.anchorB.y;
  float z = self->_definition.anchorB.z;
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
  v4[2] = __35__SCNPhysicsHingeJoint_setAnchorB___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorB;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

uint64_t __35__SCNPhysicsHingeJoint_setAnchorB___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    btVector3 v3 = *(btVector3 *)(result + 672);
    v7.var0.var0[0] = *(btVector3 *)(result + 656);
    v7.var0.var0[1] = v3;
    btVector3 v4 = *(btVector3 *)(result + 704);
    v7.var0.var0[2] = *(btVector3 *)(result + 688);
    v7.var1 = v4;
    btVector3 v5 = *(btVector3 *)(result + 736);
    v6.var0.var0[0] = *(btVector3 *)(result + 720);
    v6.var0.var0[1] = v5;
    *(void *)v5.var0.var0 = *(void *)(a1 + 40);
    *(void *)&v5.var0.var0[2] = *(unsigned int *)(a1 + 48);
    v6.var0.var0[2] = *(btVector3 *)(result + 752);
    v6.var1 = v5;
    return btHingeConstraint::setFrames((btHingeConstraint *)result, &v7, &v6);
  }
  return result;
}

- (void)_copyDefinition:(id *)a3
{
  long long v3 = *(_OWORD *)&self->_definition.axisA.z;
  long long v5 = *(_OWORD *)&self->_definition.bodyA;
  long long v4 = *(_OWORD *)&self->_definition.anchorA.x;
  *(_OWORD *)&a3->var0[32] = *(_OWORD *)&self->_definition.anchorB.y;
  *(_OWORD *)&a3->var0[48] = v3;
  *(_OWORD *)a3->var0 = v5;
  *(_OWORD *)&a3->var0[16] = v4;
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
  long long v10 = *(_OWORD *)&a4->var0[16];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v10;
  long long v11 = *(_OWORD *)&a4->var0[48];
  v13[2] = *(_OWORD *)&a4->var0[32];
  v13[3] = v11;
  self->_constraint = _createConstraintFromDefinition((uint64_t)v13);
  uint64_t v12 = [a3 _handle];
  (*(void (**)(uint64_t, btHingeConstraint *, void))(*(void *)v12 + 112))(v12, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  if (self->_constraint)
  {
    uint64_t v4 = [a3 _handle];
    (*(void (**)(uint64_t, btHingeConstraint *))(*(void *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint) {
      (*((void (**)(btHingeConstraint *))constraint->var0 + 1))(constraint);
    }
    self->_constraint = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsHingeJoint;
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
}

- (SCNPhysicsHingeJoint)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNPhysicsHingeJoint;
  uint64_t v4 = -[SCNPhysicsBehavior initWithCoder:](&v15, sel_initWithCoder_);
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
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

- (void)_addToPhysicsWorld:(os_log_t)log definition:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: didAddToPhysicsWorld - can't share a physics behavior to multiple world", v1, 2u);
}

@end