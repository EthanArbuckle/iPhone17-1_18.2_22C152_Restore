@interface SCNPhysicsBallSocketJoint
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsBallSocketJoint)jointWithBody:(SCNPhysicsBody *)body anchor:(SCNVector3)anchor;
+ (SCNPhysicsBallSocketJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB anchorB:(SCNVector3)anchorB;
- (SCNPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:(SCNVector3)a4;
- (SCNPhysicsBallSocketJoint)initWithBodyA:(id)a3 anchorA:(SCNVector3)a4 bodyB:(id)a5 anchorB:(SCNVector3)a6;
- (SCNPhysicsBallSocketJoint)initWithCoder:(id)a3;
- (SCNPhysicsBody)bodyA;
- (SCNPhysicsBody)bodyB;
- (SCNVector3)anchorA;
- (SCNVector3)anchorB;
- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4;
- (void)_copyDefinition:(id *)a3;
- (void)_willRemoveFromPhysicsWorld:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorA:(SCNVector3)anchorA;
- (void)setAnchorB:(SCNVector3)anchorB;
@end

@implementation SCNPhysicsBallSocketJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  constraint = self->_constraint;
  if (constraint) {
    (*((void (**)(btPoint2PointConstraint *, SEL))constraint->var0 + 1))(constraint, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsBallSocketJoint;
  [(SCNPhysicsBallSocketJoint *)&v4 dealloc];
}

- (SCNPhysicsBallSocketJoint)initWithBodyA:(id)a3 anchorA:(SCNVector3)a4 bodyB:(id)a5 anchorB:(SCNVector3)a6
{
  float z = a6.z;
  float y = a6.y;
  float x = a6.x;
  float v10 = a4.z;
  float v11 = a4.y;
  float v12 = a4.x;
  v16.receiver = self;
  v16.super_class = (Class)SCNPhysicsBallSocketJoint;
  v14 = [(SCNPhysicsBallSocketJoint *)&v16 init];
  if (v14)
  {
    v14->_definition.bodyA = (SCNPhysicsBody *)a3;
    v14->_definition.anchorA.float x = v12;
    v14->_definition.anchorA.float y = v11;
    v14->_definition.anchorA.float z = v10;
    v14->_definition.bodyB = (SCNPhysicsBody *)a5;
    v14->_definition.anchorB.float x = x;
    v14->_definition.anchorB.float y = y;
    v14->_definition.anchorB.float z = z;
  }
  return v14;
}

- (SCNPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:(SCNVector3)a4
{
  float z = a4.z;
  float y = a4.y;
  float x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsBallSocketJoint;
  v8 = [(SCNPhysicsBallSocketJoint *)&v10 init];
  if (v8)
  {
    v8->_definition.bodyA = (SCNPhysicsBody *)a3;
    v8->_definition.anchorA.float x = x;
    v8->_definition.anchorA.float y = y;
    v8->_definition.anchorA.float z = z;
  }
  return v8;
}

+ (SCNPhysicsBallSocketJoint)jointWithBodyA:(SCNPhysicsBody *)bodyA anchorA:(SCNVector3)anchorA bodyB:(SCNPhysicsBody *)bodyB anchorB:(SCNVector3)anchorB
{
  float z = anchorB.z;
  float y = anchorB.y;
  float x = anchorB.x;
  float v10 = anchorA.z;
  float v11 = anchorA.y;
  float v12 = anchorA.x;
  id v14 = objc_alloc((Class)a1);
  *(float *)&double v15 = v12;
  *(float *)&double v16 = v11;
  *(float *)&double v17 = v10;
  *(float *)&double v18 = x;
  *(float *)&double v19 = y;
  *(float *)&double v20 = z;
  v21 = objc_msgSend(v14, "initWithBodyA:anchorA:bodyB:anchorB:", bodyA, bodyB, v15, v16, v17, v18, v19, v20);

  return (SCNPhysicsBallSocketJoint *)v21;
}

+ (SCNPhysicsBallSocketJoint)jointWithBody:(SCNPhysicsBody *)body anchor:(SCNVector3)anchor
{
  float z = anchor.z;
  float y = anchor.y;
  float x = anchor.x;
  id v8 = objc_alloc((Class)a1);
  *(float *)&double v9 = x;
  *(float *)&double v10 = y;
  *(float *)&double v11 = z;
  float v12 = objc_msgSend(v8, "initWithBody:anchor:", body, v9, v10, v11);

  return (SCNPhysicsBallSocketJoint *)v12;
}

- (SCNPhysicsBody)bodyA
{
  return self->_definition.bodyA;
}

- (SCNPhysicsBody)bodyB
{
  return self->_definition.bodyB;
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
  v4[2] = __40__SCNPhysicsBallSocketJoint_setAnchorA___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorA;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __40__SCNPhysicsBallSocketJoint_setAnchorA___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    *(void *)&long long v2 = *(void *)(a1 + 40);
    *((void *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 368) = v2;
  }
  return *(float *)&v2;
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
  v4[2] = __40__SCNPhysicsBallSocketJoint_setAnchorB___block_invoke;
  v4[3] = &unk_264005038;
  v4[4] = self;
  SCNVector3 v5 = anchorB;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

float __40__SCNPhysicsBallSocketJoint_setAnchorB___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    *(void *)&long long v2 = *(void *)(a1 + 40);
    *((void *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 384) = v2;
  }
  return *(float *)&v2;
}

- (void)_copyDefinition:(id *)a3
{
  uint64_t v3 = *(void *)&self->_definition.anchorB.y;
  long long v4 = *(_OWORD *)&self->_definition.anchorA.x;
  *(_OWORD *)a3->var0 = *(_OWORD *)&self->_definition.bodyA;
  *(_OWORD *)&a3->var0[16] = v4;
  *(void *)&a3->var0[32] = v3;
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
    double v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:](v9);
    }
  }
  self->_world = (SCNPhysicsWorld *)a3;
  long long v10 = *(_OWORD *)&a4->var0[16];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v10;
  uint64_t v13 = *(void *)&a4->var0[32];
  self->_constraint = _createConstraintFromDefinition((uint64_t)v12);
  uint64_t v11 = [a3 _handle];
  (*(void (**)(uint64_t, btPoint2PointConstraint *, void))(*(void *)v11 + 112))(v11, self->_constraint, 0);
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  if (self->_constraint)
  {
    uint64_t v4 = [a3 _handle];
    (*(void (**)(uint64_t, btPoint2PointConstraint *))(*(void *)v4 + 120))(v4, self->_constraint);
    constraint = self->_constraint;
    if (constraint) {
      (*((void (**)(btPoint2PointConstraint *))constraint->var0 + 1))(constraint);
    }
    self->_constraint = 0;
    self->_world = 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsBallSocketJoint;
  -[SCNPhysicsBehavior encodeWithCoder:](&v7, sel_encodeWithCoder_);
  p_definition = &self->_definition;
  if (p_definition->bodyA) {
    [a3 encodeObject:p_definition->bodyA forKey:@"bodyA"];
  }
  bodyB = p_definition->bodyB;
  if (bodyB) {
    [a3 encodeObject:bodyB forKey:@"bodyB"];
  }
  SCNEncodeVector3(a3, @"anchorA", p_definition->anchorA.x, p_definition->anchorA.y, p_definition->anchorA.z);
  SCNEncodeVector3(a3, @"anchorB", p_definition->anchorB.x, p_definition->anchorB.y, p_definition->anchorB.z);
}

- (SCNPhysicsBallSocketJoint)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCNPhysicsBallSocketJoint;
  uint64_t v4 = -[SCNPhysicsBehavior initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_definition.anchorA.float x = SCNDecodeVector3(a3, @"anchorA");
    v4->_definition.anchorA.float y = v6;
    v4->_definition.anchorA.float z = v7;
    v4->_definition.anchorB.float x = SCNDecodeVector3(a3, @"anchorB");
    v4->_definition.anchorB.float y = v8;
    v4->_definition.anchorB.float z = v9;
    v4->_definition.bodyA = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyA"];
    v4->_definition.bodyB = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bodyB"];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

@end