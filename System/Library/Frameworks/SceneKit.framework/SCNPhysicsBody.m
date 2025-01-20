@interface SCNPhysicsBody
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsBody)bodyWithType:(SCNPhysicsBodyType)type shape:(SCNPhysicsShape *)shape;
+ (SCNPhysicsBody)dynamicBody;
+ (SCNPhysicsBody)kinematicBody;
+ (SCNPhysicsBody)staticBody;
- (BOOL)allowsResting;
- (BOOL)isAffectedByGravity;
- (BOOL)isResting;
- (BOOL)respondsToCollision;
- (BOOL)usesDefaultMomentOfInertia;
- (CGFloat)angularDamping;
- (CGFloat)angularRestingThreshold;
- (CGFloat)charge;
- (CGFloat)continuousCollisionDetectionThreshold;
- (CGFloat)damping;
- (CGFloat)friction;
- (CGFloat)linearRestingThreshold;
- (CGFloat)mass;
- (CGFloat)restitution;
- (CGFloat)rollingFriction;
- (NSUInteger)categoryBitMask;
- (NSUInteger)collisionBitMask;
- (NSUInteger)contactTestBitMask;
- (SCNPhysicsBody)initWithCoder:(id)a3;
- (SCNPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4;
- (SCNPhysicsBodyType)type;
- (SCNPhysicsShape)physicsShape;
- (SCNVector3)angularVelocityFactor;
- (SCNVector3)centerOfMassOffset;
- (SCNVector3)momentOfInertia;
- (SCNVector3)velocity;
- (SCNVector3)velocityFactor;
- (SCNVector4)angularVelocity;
- (__C3DScene)sceneRef;
- (btCollisionShape)_shapeHandleWithShape:(id)a3 owner:(id)a4;
- (double)angularSleepingThreshold;
- (double)continuousCollisionDetection;
- (double)linearSleepingThreshold;
- (id)_owner;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_activate;
- (void)_createBody;
- (void)_didDecodeSCNPhysicsBody:(id)a3;
- (void)_handle;
- (void)_ownerWillDie;
- (void)_removeOwner;
- (void)_setOwner:(id)a3;
- (void)applyForce:(SCNVector3)direction atPosition:(SCNVector3)position impulse:(BOOL)impulse;
- (void)applyForce:(SCNVector3)direction impulse:(BOOL)impulse;
- (void)applyTorque:(SCNVector4)torque impulse:(BOOL)impulse;
- (void)clearAllForces;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)moveToPosition:(SCNVector3)a3;
- (void)moveToTransform:(SCNMatrix4 *)a3;
- (void)resetToTransform:(SCNMatrix4 *)a3;
- (void)resetTransform;
- (void)rotateToAxisAngle:(SCNVector4)a3;
- (void)setAffectedByGravity:(BOOL)affectedByGravity;
- (void)setAllowsResting:(BOOL)allowsResting;
- (void)setAngularDamping:(CGFloat)angularDamping;
- (void)setAngularRestingThreshold:(CGFloat)angularRestingThreshold;
- (void)setAngularVelocity:(SCNVector4)angularVelocity;
- (void)setAngularVelocityFactor:(SCNVector3)angularVelocityFactor;
- (void)setCategoryBitMask:(NSUInteger)categoryBitMask;
- (void)setCenterOfMassOffset:(SCNVector3)centerOfMassOffset;
- (void)setCharge:(CGFloat)charge;
- (void)setCollisionBitMask:(NSUInteger)collisionBitMask;
- (void)setContactTestBitMask:(NSUInteger)contactTestBitMask;
- (void)setContinuousCollisionDetectionThreshold:(CGFloat)continuousCollisionDetectionThreshold;
- (void)setDamping:(CGFloat)damping;
- (void)setFriction:(CGFloat)friction;
- (void)setLinearRestingThreshold:(CGFloat)linearRestingThreshold;
- (void)setMass:(CGFloat)mass;
- (void)setMomentOfInertia:(SCNVector3)momentOfInertia;
- (void)setPhysicsShape:(SCNPhysicsShape *)physicsShape;
- (void)setResting:(BOOL)resting;
- (void)setRestitution:(CGFloat)restitution;
- (void)setRollingFriction:(CGFloat)rollingFriction;
- (void)setType:(SCNPhysicsBodyType)type;
- (void)setUsesDefaultMomentOfInertia:(BOOL)usesDefaultMomentOfInertia;
- (void)setVelocity:(SCNVector3)velocity;
- (void)setVelocityFactor:(SCNVector3)velocityFactor;
- (void)updateGlobalScale:(double)a3;
@end

@implementation SCNPhysicsBody

- (SCNPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)SCNPhysicsBody;
  v6 = [(SCNPhysicsBody *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    v6->_physicsShape = (SCNPhysicsShape *)a4;
    double v8 = 0.0;
    if (a3 == 1) {
      double v8 = 1.0;
    }
    v7->_mass = v8;
    *(_OWORD *)&v7->_charge = xmmword_20B5EDC90;
    *(_OWORD *)&v7->_restitution = xmmword_20B5EDCA0;
    v7->_damping = 0.1;
    v7->_angularDamping = 0.1;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&v7->_velocityFactor.x = _Q0;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v7->_angularVelocityFactor.y = _Q0;
    *(int64x2_t *)&v7->_linearRestingThreshold = vdupq_n_s64(0x3FB999999999999AuLL);
    v7->_allowsResting = 1;
    v7->_ignoreGravity = 0;
    *(int32x2_t *)&_Q0 = vdup_n_s32(a3 == 0);
    v14.i64[0] = _Q0;
    v14.i64[1] = DWORD1(_Q0);
    *(int8x16_t *)&v7->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v14, 0x3FuLL)), (int8x16_t)xmmword_20B5EDCB0, (int8x16_t)xmmword_20B5CD040);
    v7->_contactTestBitMask = 0;
    v7->_body = [(SCNPhysicsBody *)v7 _createBody];
    v7->_isDefaultShape = a4 == 0;
  }
  return v7;
}

- (__C3DScene)sceneRef
{
  return [(SCNNode *)self->_node sceneRef];
}

- (void)_handle
{
  return self->_body;
}

- (void)dealloc
{
  body = self->_body;
  if (body)
  {
    uint64_t v4 = body[67];
    if (!v4 || ((*(void (**)(void, SEL))(*(void *)v4 + 8))(body[67], a2), (body = self->_body) != 0)) {
      (*(void (**)(void *, SEL))(*body + 16))(body, a2);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsBody;
  [(SCNPhysicsBody *)&v5 dealloc];
}

+ (SCNPhysicsBody)bodyWithType:(SCNPhysicsBodyType)type shape:(SCNPhysicsShape *)shape
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:type shape:shape];

  return (SCNPhysicsBody *)v4;
}

+ (SCNPhysicsBody)staticBody
{
  v2 = objc_opt_class();

  return (SCNPhysicsBody *)[v2 bodyWithType:0 shape:0];
}

+ (SCNPhysicsBody)dynamicBody
{
  v2 = objc_opt_class();

  return (SCNPhysicsBody *)[v2 bodyWithType:1 shape:0];
}

+ (SCNPhysicsBody)kinematicBody
{
  v2 = objc_opt_class();

  return (SCNPhysicsBody *)[v2 bodyWithType:2 shape:0];
}

- (void)setType:(SCNPhysicsBodyType)type
{
  self->_type = type;
  int32x2_t v5 = vdup_n_s32(type == SCNPhysicsBodyTypeStatic);
  v6.i64[0] = v5.u32[0];
  v6.i64[1] = v5.u32[1];
  *(int8x16_t *)&self->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v6, 0x3FuLL)), (int8x16_t)xmmword_20B5EDCB0, (int8x16_t)xmmword_20B5CD040);
  v7 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __26__SCNPhysicsBody_setType___block_invoke;
  v10[3] = &unk_264004FC0;
  v10[4] = self;
  v10[5] = type;
  +[SCNTransaction postCommandWithContext:v7 object:node applyBlock:v10];
  double v9 = 0.0;
  if (type == SCNPhysicsBodyTypeDynamic) {
    double v9 = 1.0;
  }
  [(SCNPhysicsBody *)self setMass:v9];
}

btCollisionObject *__26__SCNPhysicsBody_setType___block_invoke(uint64_t a1)
{
  result = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (result)
  {
    btCollisionObject::forceActivationState(result, 1);
    __modifyCollisionFlagsFromType(*(btRigidBody **)(*(void *)(a1 + 32) + 232), *(SCNPhysicsBodyType *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 224)) {
      int v4 = 1;
    }
    else {
      int v4 = 4;
    }
    btCollisionObject::setActivationState(*(btCollisionObject **)(v3 + 232), v4);
    int32x2_t v5 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
    return btCollisionObject::activate(v5, 0);
  }
  return result;
}

- (SCNPhysicsBodyType)type
{
  return self->_type;
}

- (void)setMass:(CGFloat)mass
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_mass = mass;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  *(void *)&long long v5 = *(void *)&self->_momentOfInertia.x;
  DWORD2(v5) = LODWORD(self->_momentOfInertia.z);
  long long v10 = v5;
  int64x2_t v6 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__SCNPhysicsBody_setMass___block_invoke;
  v8[3] = &unk_2640079B0;
  *(CGFloat *)&v8[6] = mass;
  v8[4] = self;
  v8[5] = v9;
  +[SCNTransaction postCommandWithContext:v6 object:node applyBlock:v8];
  _Block_object_dispose(v9, 8);
}

void __26__SCNPhysicsBody_setMass___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 232);
  if (v3)
  {
    if (*(unsigned char *)(v2 + 168)) {
      int v4 = (unsigned long long *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    }
    else {
      int v4 = 0;
    }
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(a1 + 48));
  }
}

- (CGFloat)mass
{
  return self->_mass;
}

- (BOOL)respondsToCollision
{
  return 1;
}

- (void)setMomentOfInertia:(SCNVector3)momentOfInertia
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  self->_momentOfInertia = momentOfInertia;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  float y = momentOfInertia.y;
  float z = momentOfInertia.z;
  long long v10 = *(_OWORD *)&momentOfInertia.x;
  int64x2_t v6 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SCNPhysicsBody_setMomentOfInertia___block_invoke;
  v8[3] = &unk_2640079D8;
  v8[4] = self;
  v8[5] = v9;
  +[SCNTransaction postCommandWithContext:v6 object:node applyBlock:v8];
  _Block_object_dispose(v9, 8);
}

void __37__SCNPhysicsBody_setMomentOfInertia___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 232);
  if (v3)
  {
    if (*(unsigned char *)(v2 + 168)) {
      int v4 = (unsigned long long *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    }
    else {
      int v4 = 0;
    }
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(v2 + 16));
  }
}

- (SCNVector3)momentOfInertia
{
  float x = self->_momentOfInertia.x;
  float y = self->_momentOfInertia.y;
  float z = self->_momentOfInertia.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setCenterOfMassOffset:(SCNVector3)centerOfMassOffset
{
  self->_centerOfMassOffset = centerOfMassOffset;
  float y = centerOfMassOffset.y;
  float z = centerOfMassOffset.z;
  long long v12 = *(_OWORD *)&centerOfMassOffset.x;
  double mass = self->_mass;
  *(void *)&centerOfMassOffset.float x = *(void *)&self->_momentOfInertia.x;
  float v7 = self->_momentOfInertia.z;
  long long v11 = *(_OWORD *)&centerOfMassOffset.x;
  BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
  double v9 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__SCNPhysicsBody_setCenterOfMassOffset___block_invoke;
  v13[3] = &unk_264007A00;
  objc_super v16 = self;
  double v17 = mass;
  BOOL v18 = explicitMomentOfInertia;
  long long v14 = v12;
  long long v15 = v11;
  +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v13];
}

void __40__SCNPhysicsBody_setCenterOfMassOffset___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 232);
  if (v1)
  {
    uint64_t v3 = *(_OWORD **)(v1 + 536);
    if (v3)
    {
      v3[3] = *(_OWORD *)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 232);
      *(void *)(v4 + 536) = v3;
      (*(void (**)(_OWORD *, uint64_t))(*(void *)v3 + 16))(v3, v4 + 16);
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 232);
      float v7 = *(btQuaternion **)(v6 + 208);
      double v8 = *(double *)(a1 + 72);
      if (*(unsigned char *)(a1 + 80)) {
        double v9 = (unsigned long long *)(a1 + 48);
      }
      else {
        double v9 = 0;
      }
      float v10 = *(float *)(a1 + 40);
      *(void *)&long long v11 = *(void *)(a1 + 32);
      *((void *)&v11 + 1) = LODWORD(v10);
      __setCollisionShape(v6, v7, v9, &v11, v8, v10, *(float *)&v11, v5);
    }
  }
}

- (SCNVector3)centerOfMassOffset
{
  float x = self->_centerOfMassOffset.x;
  float y = self->_centerOfMassOffset.y;
  float z = self->_centerOfMassOffset.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setUsesDefaultMomentOfInertia:(BOOL)usesDefaultMomentOfInertia
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  self->_BOOL explicitMomentOfInertia = !usesDefaultMomentOfInertia;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3020000000;
  *(void *)&long long v3 = *(void *)&self->_momentOfInertia.x;
  DWORD2(v3) = LODWORD(self->_momentOfInertia.z);
  long long v9 = v3;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SCNPhysicsBody_setUsesDefaultMomentOfInertia___block_invoke;
  v7[3] = &unk_2640079D8;
  v7[4] = self;
  v7[5] = v8;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
  _Block_object_dispose(v8, 8);
}

void __48__SCNPhysicsBody_setUsesDefaultMomentOfInertia___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 232);
  if (v3)
  {
    if (*(unsigned char *)(v2 + 168)) {
      uint64_t v4 = (unsigned long long *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    }
    else {
      uint64_t v4 = 0;
    }
    __updateMassAndLocalInertia((btRigidBody *)v3, *(_DWORD **)(v3 + 208), v4, *(double *)(v2 + 16));
  }
}

- (BOOL)usesDefaultMomentOfInertia
{
  return !self->_explicitMomentOfInertia;
}

- (void)setCharge:(CGFloat)charge
{
  self->_charge = charge;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__SCNPhysicsBody_setCharge___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = charge;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

float __28__SCNPhysicsBody_setCharge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 532) = result;
  }
  return result;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (BOOL)isResting
{
  bodfloat y = self->_body;
  if (!body) {
    return 0;
  }
  int v3 = body[61];
  return v3 == 2 || v3 == 5;
}

- (void)updateGlobalScale:(double)a3
{
  uint64_t v3 = *((void *)self->_body + 67);
  if (v3)
  {
    float v4 = a3;
    *(float *)(v3 + 64) = v4;
  }
}

- (BOOL)allowsResting
{
  return self->_allowsResting;
}

- (void)setAllowsResting:(BOOL)allowsResting
{
  self->_allowsResting = allowsResting;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SCNPhysicsBody_setAllowsResting___block_invoke;
  v7[3] = &unk_264004FE8;
  v7[4] = self;
  BOOL v8 = allowsResting;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

btCollisionObject *__35__SCNPhysicsBody_setAllowsResting___block_invoke(uint64_t a1)
{
  float result = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (result)
  {
    btCollisionObject::activate(result, 0);
    uint64_t v3 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
    if (*(unsigned char *)(a1 + 40)) {
      int v4 = 1;
    }
    else {
      int v4 = 4;
    }
    return btCollisionObject::setActivationState(v3, v4);
  }
  return result;
}

- (void)setFriction:(CGFloat)friction
{
  self->_friction = friction;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SCNPhysicsBody_setFriction___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = friction;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

float __30__SCNPhysicsBody_setFriction___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 252) = result;
  }
  return result;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (void)setRestitution:(CGFloat)restitution
{
  self->_restitution = restitution;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCNPhysicsBody_setRestitution___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = restitution;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

float __33__SCNPhysicsBody_setRestitution___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 256) = result;
  }
  return result;
}

- (CGFloat)restitution
{
  return self->_restitution;
}

- (void)setRollingFriction:(CGFloat)rollingFriction
{
  self->_rollingFriction = rollingFriction;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SCNPhysicsBody_setRollingFriction___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = rollingFriction;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

float __37__SCNPhysicsBody_setRollingFriction___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 260) = result;
  }
  return result;
}

- (CGFloat)rollingFriction
{
  return self->_rollingFriction;
}

- (void)setDamping:(CGFloat)damping
{
  self->_damping = damping;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__SCNPhysicsBody_setDamping___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = damping;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

int8x8_t __29__SCNPhysicsBody_setDamping___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(btRigidBody **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    double v3 = *(double *)(a1 + 40);
    *(float *)&double v3 = v3;
    return btRigidBody::setDamping(v2, *(float32x2_t *)&v3, *(float32_t *)&v3);
  }
  return result;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setAngularDamping:(CGFloat)angularDamping
{
  self->_angularDamping = angularDamping;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SCNPhysicsBody_setAngularDamping___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = angularDamping;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

int8x8_t __36__SCNPhysicsBody_setAngularDamping___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(btRigidBody **)(v2 + 232);
  if (v3)
  {
    double v4 = *(double *)(v2 + 80);
    *(float *)&double v4 = v4;
    float32_t v5 = *(double *)(a1 + 40);
    return btRigidBody::setDamping(v3, *(float32x2_t *)&v4, v5);
  }
  return result;
}

- (CGFloat)angularDamping
{
  return self->_angularDamping;
}

- (void)setLinearRestingThreshold:(CGFloat)linearRestingThreshold
{
  self->_linearRestingThreshold = linearRestingThreshold;
  double angularRestingThreshold = self->_angularRestingThreshold;
  uint64_t v6 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SCNPhysicsBody_setLinearRestingThreshold___block_invoke;
  v8[3] = &unk_264007A28;
  void v8[4] = self;
  *(CGFloat *)&v8[5] = linearRestingThreshold;
  *(double *)&void v8[6] = angularRestingThreshold;
  +[SCNTransaction postCommandWithContext:v6 object:node applyBlock:v8];
}

float32x2_t __44__SCNPhysicsBody_setLinearRestingThreshold___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float32x2_t result = vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
    *(float32x2_t *)(v1 + 524) = result;
  }
  return result;
}

- (CGFloat)linearRestingThreshold
{
  return self->_linearRestingThreshold;
}

- (void)setAngularRestingThreshold:(CGFloat)angularRestingThreshold
{
  self->_double angularRestingThreshold = angularRestingThreshold;
  double linearRestingThreshold = self->_linearRestingThreshold;
  uint64_t v6 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SCNPhysicsBody_setAngularRestingThreshold___block_invoke;
  v8[3] = &unk_264007A28;
  void v8[4] = self;
  *(double *)&v8[5] = linearRestingThreshold;
  *(CGFloat *)&void v8[6] = angularRestingThreshold;
  +[SCNTransaction postCommandWithContext:v6 object:node applyBlock:v8];
}

float32x2_t __45__SCNPhysicsBody_setAngularRestingThreshold___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    float32x2_t result = vcvt_f32_f64(*(float64x2_t *)(a1 + 40));
    *(float32x2_t *)(v1 + 524) = result;
  }
  return result;
}

- (CGFloat)angularRestingThreshold
{
  return self->_angularRestingThreshold;
}

- (double)linearSleepingThreshold
{
  return self->_linearRestingThreshold;
}

- (double)angularSleepingThreshold
{
  return self->_angularRestingThreshold;
}

- (btCollisionShape)_shapeHandleWithShape:(id)a3 owner:(id)a4
{
  if ([a3 referenceObject])
  {
    return (btCollisionShape *)[a3 _handle];
  }
  else
  {
    [a3 setReferenceObject:a4];
    float v7 = (btCollisionShape *)[a3 _handle];
    [a3 setReferenceObject:0];
    return v7;
  }
}

- (void)setPhysicsShape:(SCNPhysicsShape *)physicsShape
{
  double v3 = self->_physicsShape;
  if (v3 != physicsShape)
  {
    self->_isDefaultShape = 0;
    self->_physicsShape = physicsShape;
    double mass = self->_mass;
    *(void *)&long long v7 = *(void *)&self->_momentOfInertia.x;
    DWORD2(v7) = LODWORD(self->_momentOfInertia.z);
    long long v12 = v7;
    *(void *)&long long v7 = *(void *)&self->_centerOfMassOffset.x;
    BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
    *((void *)&v7 + 1) = LODWORD(self->_centerOfMassOffset.z);
    long long v11 = v7;
    long long v9 = [(SCNNode *)self->_node sceneRef];
    node = self->_node;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3321888768;
    v13[2] = __34__SCNPhysicsBody_setPhysicsShape___block_invoke;
    v13[3] = &unk_26BF6EEE0;
    objc_super v16 = self;
    double v17 = physicsShape;
    double v19 = mass;
    BOOL v20 = explicitMomentOfInertia;
    long long v14 = v12;
    long long v15 = v11;
    BOOL v18 = v3;
    +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v13];
  }
}

void __34__SCNPhysicsBody_setPhysicsShape___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 64);
  double v3 = *(void **)(a1 + 64);
  if (v3[29])
  {
    DefaultShapeForNode = (btCollisionShape *)objc_msgSend(v3, "_shapeHandleWithShape:owner:", *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 64), "_owner"));
    if (DefaultShapeForNode
      || (uint64_t v10 = *(void **)(*v2 + 8)) != 0
      && (DefaultShapeForNode = C3DPhysicsShapeGetDefaultShapeForNode((float32x4_t *)[v10 nodeRef])) != 0)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 232);
      double v8 = *(double *)(a1 + 88);
      if (*(unsigned char *)(a1 + 96)) {
        long long v9 = (unsigned long long *)(a1 + 32);
      }
      else {
        long long v9 = 0;
      }
      long long v12 = *(_OWORD *)(a1 + 48);
      __setCollisionShape(v7, (btQuaternion *)DefaultShapeForNode, v9, &v12, v8, *(float *)&v12, v5, v6);
    }
    else
    {
      long long v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __34__SCNPhysicsBody_setPhysicsShape___block_invoke_cold_1(v2, v11);
      }
    }
  }
}

- (SCNPhysicsShape)physicsShape
{
  return self->_physicsShape;
}

- (NSUInteger)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  self->_categoryBitMask = categoryBitMask;
  unint64_t collisionBitMask = self->_collisionBitMask;
  unint64_t contactTestBitMask = self->_contactTestBitMask;
  uint64_t v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = [(SCNNode *)self->_node sceneRef];
    node = self->_node;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__SCNPhysicsBody_setCategoryBitMask___block_invoke;
    v11[3] = &unk_264007A50;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = categoryBitMask;
    v11[7] = collisionBitMask;
    v11[8] = contactTestBitMask;
    +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v11];
  }
}

void __37__SCNPhysicsBody_setCategoryBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 200);
    if (v2)
    {
      if (*(void *)(v2 + 8) != *(void *)(a1 + 48))
      {
        double v4 = (btDynamicsWorld *)[*(id *)(a1 + 40) _handle];
        float v5 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 64);
        _recreateProxy(v4, v5, v6, v7, v8);
      }
    }
  }
}

- (NSUInteger)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(NSUInteger)collisionBitMask
{
  self->_unint64_t collisionBitMask = collisionBitMask;
  unint64_t categoryBitMask = self->_categoryBitMask;
  unint64_t contactTestBitMask = self->_contactTestBitMask;
  uint64_t v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = [(SCNNode *)self->_node sceneRef];
    node = self->_node;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__SCNPhysicsBody_setCollisionBitMask___block_invoke;
    v11[3] = &unk_264007A50;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = collisionBitMask;
    v11[7] = categoryBitMask;
    v11[8] = contactTestBitMask;
    +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v11];
  }
}

void __38__SCNPhysicsBody_setCollisionBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 200);
    if (v2)
    {
      if (*(void *)(v2 + 16) != *(void *)(a1 + 48))
      {
        double v4 = (btDynamicsWorld *)[*(id *)(a1 + 40) _handle];
        float v5 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 64);
        _recreateProxy(v4, v5, v6, v7, v8);
      }
    }
  }
}

- (NSUInteger)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(NSUInteger)contactTestBitMask
{
  self->_unint64_t contactTestBitMask = contactTestBitMask;
  unint64_t categoryBitMask = self->_categoryBitMask;
  unint64_t collisionBitMask = self->_collisionBitMask;
  uint64_t v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = [(SCNNode *)self->_node sceneRef];
    node = self->_node;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__SCNPhysicsBody_setContactTestBitMask___block_invoke;
    v11[3] = &unk_264007A50;
    v11[4] = self;
    v11[5] = v8;
    v11[6] = contactTestBitMask;
    v11[7] = collisionBitMask;
    v11[8] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v11];
  }
}

void __40__SCNPhysicsBody_setContactTestBitMask___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 200);
    if (v2)
    {
      if (*(void *)(v2 + 24) != *(void *)(a1 + 48))
      {
        double v4 = (btDynamicsWorld *)[*(id *)(a1 + 40) _handle];
        float v5 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
        uint64_t v6 = *(void *)(a1 + 56);
        uint64_t v7 = *(void *)(a1 + 64);
        uint64_t v8 = *(void *)(a1 + 48);
        _recreateProxy(v4, v5, v6, v7, v8);
      }
    }
  }
}

- (void)setContinuousCollisionDetectionThreshold:(CGFloat)continuousCollisionDetectionThreshold
{
  self->_continuousCollisionDetectionThreshold = continuousCollisionDetectionThreshold;
  float v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SCNPhysicsBody_setContinuousCollisionDetectionThreshold___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&void v7[5] = continuousCollisionDetectionThreshold;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

uint64_t __59__SCNPhysicsBody_setContinuousCollisionDetectionThreshold___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 232);
  if (v1)
  {
    float v2 = *(double *)(result + 40);
    *(float *)(v1 + 288) = v2;
    return __updateCCDRadiusIfNeeded(*(void *)(*(void *)(result + 32) + 232));
  }
  return result;
}

- (double)continuousCollisionDetection
{
  return self->_continuousCollisionDetectionThreshold;
}

- (void)setVelocity:(SCNVector3)velocity
{
  float z = velocity.z;
  float y = velocity.y;
  float x = velocity.x;
  self->_velocitfloat y = velocity;
  uint64_t v7 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__SCNPhysicsBody_setVelocity___block_invoke;
  v9[3] = &unk_264005038;
  void v9[4] = self;
  float v10 = x;
  float v11 = y;
  float v12 = z;
  +[SCNTransaction postCommandWithContext:v7 object:node applyBlock:v9];
}

float __30__SCNPhysicsBody_setVelocity___block_invoke(uint64_t a1)
{
  float v2 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    *(void *)&long long v3 = *(void *)(a1 + 40);
    *((void *)&v3 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 232) + 352) = v3;
  }
  return *(float *)&v3;
}

- (SCNVector3)velocity
{
  if (+[SCNTransaction immediateMode]
    && (bodfloat y = (char *)self->_body) != 0)
  {
    p_velocitfloat y = (SCNVector3 *)(body + 352);
    p_float y = (float *)(body + 356);
    p_float z = (float *)(body + 360);
  }
  else
  {
    p_velocitfloat y = &self->_velocity;
    p_float y = &self->_velocity.y;
    p_float z = &self->_velocity.z;
  }
  float v7 = *p_z;
  float v8 = *p_y;
  float x = p_velocity->x;
  result.float z = v7;
  result.float y = v8;
  result.float x = x;
  return result;
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  self->_ignoreGravitfloat y = !affectedByGravity;
  node = self->_node;
  if (node)
  {
    uint64_t v6 = objc_msgSend(-[SCNNode scene](node, "scene"), "_physicsWorldCreateIfNeeded:", 0);
    node = self->_node;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(SCNNode *)node sceneRef];
  float v8 = self->_node;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SCNPhysicsBody_setAffectedByGravity___block_invoke;
  v9[3] = &unk_264007A78;
  BOOL v10 = affectedByGravity;
  void v9[4] = self;
  void v9[5] = v6;
  +[SCNTransaction postCommandWithContext:v7 object:v8 applyBlock:v9];
}

double __39__SCNPhysicsBody_setAffectedByGravity___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)(v1 + 576) = *(unsigned char *)(a1 + 48) == 0;
    if (v3)
    {
      [*(id *)(a1 + 40) gravity];
      v13.i64[0] = v4;
      __int32 v12 = v5;
      __int32 v14 = v6;
      [*(id *)(a1 + 40) scale];
      *(float *)&double v7 = v7;
      float v8 = *(btRigidBody **)(*(void *)(a1 + 32) + 232);
      float32x4_t v9 = v13;
      v9.i32[1] = v12;
      v9.i32[2] = v14;
      btVector3 v10 = (btVector3)vmulq_n_f32(v9, 1.0 / *(float *)&v7);
      v10.var0.var0[3] = 0.0;
      btVector3 v15 = v10;
    }
    else
    {
      float v8 = *(btRigidBody **)(*(void *)(a1 + 32) + 232);
      btVector3 v15 = (btVector3)0;
    }
    *(void *)&double result = btRigidBody::setGravity(v8, (float32x4_t *)&v15).n128_u64[0];
  }
  return result;
}

- (BOOL)isAffectedByGravity
{
  return !self->_ignoreGravity;
}

- (void)setAngularVelocity:(SCNVector4)angularVelocity
{
  float w = angularVelocity.w;
  float z = angularVelocity.z;
  float y = angularVelocity.y;
  float x = angularVelocity.x;
  self->_angularVelocitfloat y = angularVelocity;
  float v8 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__SCNPhysicsBody_setAngularVelocity___block_invoke;
  v10[3] = &unk_264007A28;
  v10[4] = self;
  float v11 = x;
  float v12 = y;
  float v13 = z;
  float v14 = w;
  +[SCNTransaction postCommandWithContext:v8 object:node applyBlock:v10];
}

float32x4_t __37__SCNPhysicsBody_setAngularVelocity___block_invoke(uint64_t a1, float32x4_t result)
{
  float v2 = *(__n128 **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    result.i64[0] = *(void *)(a1 + 40);
    result.i32[2] = *(_DWORD *)(a1 + 48);
    double result = vmulq_n_f32(result, *(float *)(a1 + 52));
    result.i32[3] = 0;
    v2[23] = (__n128)result;
  }
  return result;
}

- (SCNVector4)angularVelocity
{
  if (+[SCNTransaction immediateMode]
    && (bodfloat y = (float32x4_t *)self->_body) != 0)
  {
    float32x4_t v4 = body[23];
    int8x16_t v5 = (int8x16_t)vmulq_f32(v4, v4);
    float w = sqrtf(vadd_f32(vpadd_f32(*(float32x2_t *)v5.i8, *(float32x2_t *)v5.i8), (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)).f32[0]);
    if (w <= 0.0)
    {
      v7.i64[0] = 0;
      float z = 0.0;
      float w = 0.0;
    }
    else
    {
      float32x4_t v7 = vmulq_n_f32(v4, 1.0 / w);
      float z = v7.f32[2];
    }
  }
  else
  {
    v7.i64[0] = *(void *)&self->_angularVelocity.x;
    float z = self->_angularVelocity.z;
    float w = self->_angularVelocity.w;
  }
  float v9 = v7.f32[1];
  result.float x = v7.f32[0];
  result.float w = w;
  result.float z = z;
  result.float y = v9;
  return result;
}

- (void)setVelocityFactor:(SCNVector3)velocityFactor
{
  float z = velocityFactor.z;
  float y = velocityFactor.y;
  float x = velocityFactor.x;
  self->_velocityFactor = velocityFactor;
  float32x4_t v7 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SCNPhysicsBody_setVelocityFactor___block_invoke;
  v9[3] = &unk_264005038;
  void v9[4] = self;
  float v10 = x;
  float v11 = y;
  float v12 = z;
  +[SCNTransaction postCommandWithContext:v7 object:node applyBlock:v9];
}

__n128 __36__SCNPhysicsBody_setVelocityFactor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    v2.i64[0] = *(void *)(a1 + 40);
    v2.i64[1] = *(unsigned int *)(a1 + 48);
    *(float32x4_t *)(v1 + 400) = v2;
    __n128 result = (__n128)vmulq_n_f32(v2, *(float *)(v1 + 384));
    result.n128_u32[3] = 0;
    *(__n128 *)(v1 + 640) = result;
  }
  return result;
}

- (SCNVector3)velocityFactor
{
  float x = self->_velocityFactor.x;
  float y = self->_velocityFactor.y;
  float z = self->_velocityFactor.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAngularVelocityFactor:(SCNVector3)angularVelocityFactor
{
  float z = angularVelocityFactor.z;
  float y = angularVelocityFactor.y;
  float x = angularVelocityFactor.x;
  self->_angularVelocityFactor = angularVelocityFactor;
  float32x4_t v7 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SCNPhysicsBody_setAngularVelocityFactor___block_invoke;
  v9[3] = &unk_264005038;
  void v9[4] = self;
  float v10 = x;
  float v11 = y;
  float v12 = z;
  +[SCNTransaction postCommandWithContext:v7 object:node applyBlock:v9];
}

float __43__SCNPhysicsBody_setAngularVelocityFactor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    *(void *)&long long v2 = *(void *)(a1 + 40);
    *((void *)&v2 + 1) = *(unsigned int *)(a1 + 48);
    *(_OWORD *)(v1 + 624) = v2;
  }
  return *(float *)&v2;
}

- (SCNVector3)angularVelocityFactor
{
  float x = self->_angularVelocityFactor.x;
  float y = self->_angularVelocityFactor.y;
  float z = self->_angularVelocityFactor.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)applyForce:(SCNVector3)direction impulse:(BOOL)impulse
{
  float z = direction.z;
  float y = direction.y;
  float x = direction.x;
  float v9 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__SCNPhysicsBody_applyForce_impulse___block_invoke;
  v11[3] = &unk_264007AA0;
  v11[4] = self;
  BOOL v15 = impulse;
  float v12 = x;
  float v13 = y;
  float v14 = z;
  +[SCNTransaction postCommandWithContext:v9 object:node applyBlock:v11];
}

float32x4_t __37__SCNPhysicsBody_applyForce_impulse___block_invoke(uint64_t a1)
{
  long long v2 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    int v3 = *(float32x4_t **)(*(void *)(a1 + 32) + 232);
    v4.i64[0] = *(void *)(a1 + 40);
    v4.i64[1] = *(unsigned int *)(a1 + 48);
    float32x4_t v5 = vmulq_f32(v4, v3[25]);
    if (*(unsigned char *)(a1 + 52))
    {
      float32x4_t v6 = vmulq_n_f32(v5, v3[24].f32[0]);
      v6.i32[3] = 0;
      float32x4_t result = vaddq_f32(v3[22], v6);
      v3[22] = result;
    }
    else
    {
      float32x4_t result = vaddq_f32(v3[29], v5);
      v3[29] = result;
    }
  }
  else
  {
    float v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
    }
  }
  return result;
}

- (void)applyForce:(SCNVector3)direction atPosition:(SCNVector3)position impulse:(BOOL)impulse
{
  float z = position.z;
  float y = position.y;
  float x = position.x;
  float v9 = direction.z;
  float v10 = direction.y;
  float v11 = direction.x;
  float v13 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__SCNPhysicsBody_applyForce_atPosition_impulse___block_invoke;
  v15[3] = &unk_264007AC8;
  v15[4] = self;
  BOOL v22 = impulse;
  float v16 = v11;
  float v17 = v10;
  float v18 = v9;
  float v19 = x;
  float v20 = y;
  float v21 = z;
  +[SCNTransaction postCommandWithContext:v13 object:node applyBlock:v15];
}

float32x4_t __48__SCNPhysicsBody_applyForce_atPosition_impulse___block_invoke(uint64_t a1)
{
  long long v2 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
    if (*(unsigned char *)(a1 + 64))
    {
      *(void *)v14.var0.var0 = *(void *)(a1 + 40);
      *(void *)&v14.var0.var0[2] = *(unsigned int *)(a1 + 48);
      v13.i64[0] = *(void *)(a1 + 52);
      v13.i64[1] = *(unsigned int *)(a1 + 60);
      result.i64[0] = btRigidBody::applyImpulse((btRigidBody *)v3, (float32x4_t *)&v14, &v13).u64[0];
    }
    else
    {
      v6.i64[0] = *(void *)(a1 + 40);
      v6.i64[1] = *(unsigned int *)(a1 + 48);
      v7.i64[0] = *(void *)(a1 + 52);
      v8.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
      v8.i32[1] = *(_DWORD *)(a1 + 60);
      v8.i64[1] = v7.i64[0];
      v7.i64[1] = v8.u32[1];
      float32x4_t v9 = vmulq_f32(v6, *(float32x4_t *)(v3 + 400));
      v10.i64[0] = vextq_s8((int8x16_t)v9, (int8x16_t)v9, 4uLL).u64[0];
      v10.i64[1] = v9.i64[0];
      int8x16_t v11 = (int8x16_t)vsubq_f32(vmulq_f32(v7, v10), vmulq_f32(v9, v8));
      v10.i64[0] = vextq_s8(v11, v11, 4uLL).u64[0];
      v10.i64[1] = v11.u32[0];
      float32x4_t result = vaddq_f32(*(float32x4_t *)(v3 + 464), v9);
      float32x4_t v12 = vaddq_f32(*(float32x4_t *)(v3 + 480), vmulq_f32(*(float32x4_t *)(v3 + 624), v10));
      *(float32x4_t *)(v3 + 464) = result;
      *(float32x4_t *)(v3 + 480) = v12;
    }
  }
  else
  {
    float32x4_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
    }
  }
  return result;
}

- (void)applyTorque:(SCNVector4)torque impulse:(BOOL)impulse
{
  float w = torque.w;
  float z = torque.z;
  float y = torque.y;
  float x = torque.x;
  float32x4_t v10 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__SCNPhysicsBody_applyTorque_impulse___block_invoke;
  v12[3] = &unk_264007AF0;
  v12[4] = self;
  float v13 = x;
  float v14 = y;
  float v15 = z;
  float v16 = w;
  BOOL v17 = impulse;
  +[SCNTransaction postCommandWithContext:v10 object:node applyBlock:v12];
}

float32x4_t __38__SCNPhysicsBody_applyTorque_impulse___block_invoke(uint64_t a1)
{
  long long v2 = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    btCollisionObject::activate(v2, 0);
    v3.i64[0] = *(void *)(a1 + 40);
    v3.i32[2] = *(_DWORD *)(a1 + 48);
    float32x4_t v4 = vmulq_n_f32(v3, *(float *)(a1 + 52));
    v4.i32[3] = 0;
    float32x4_t v5 = *(float32x4_t **)(*(void *)(a1 + 32) + 232);
    if (*(unsigned char *)(a1 + 56))
    {
      float32x4_t v6 = vmulq_f32(v5[19], v4);
      int8x16_t v7 = (int8x16_t)vmulq_f32(v5[20], v4);
      int8x16_t v8 = (int8x16_t)vmulq_f32(v5[21], v4);
      v8.i32[3] = 0;
      *(float32x2_t *)v6.f32 = vadd_f32(vpadd_f32(*(float32x2_t *)v6.f32, *(float32x2_t *)v7.i8), (float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)));
      *(float32x2_t *)&v6.u32[2] = vpadd_f32(vpadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)), 0);
      float32x4_t result = vaddq_f32(v5[23], vmulq_f32(v6, v5[39]));
      v5[23] = result;
    }
    else
    {
      float32x4_t result = vaddq_f32(v5[30], vmulq_f32(v5[39], v4));
      v5[30] = result;
    }
  }
  else
  {
    float32x4_t v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1();
    }
  }
  return result;
}

- (void)_activate
{
  bodfloat y = (btCollisionObject *)self->_body;
  if (body) {
    btCollisionObject::activate(body, 0);
  }
}

- (void)clearAllForces
{
  float32x4_t v3 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__SCNPhysicsBody_clearAllForces__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:node applyBlock:v5];
}

void __32__SCNPhysicsBody_clearAllForces__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v1)
  {
    *(_OWORD *)(v1 + 464) = 0u;
    *(_OWORD *)(v1 + 480) = 0u;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 232) + 352) = 0u;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 232) + 368) = 0u;
  }
  else
  {
    long long v2 = scn_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __32__SCNPhysicsBody_clearAllForces__block_invoke_cold_1();
    }
  }
}

- (void)setResting:(BOOL)resting
{
  float32x4_t v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__SCNPhysicsBody_setResting___block_invoke;
  v7[3] = &unk_264004FE8;
  v7[4] = self;
  BOOL v8 = resting;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v7];
}

btCollisionObject *__29__SCNPhysicsBody_setResting___block_invoke(uint64_t a1)
{
  float32x4_t result = *(btCollisionObject **)(*(void *)(a1 + 32) + 232);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      return btCollisionObject::setActivationState(result, 3);
    }
    else {
      return btCollisionObject::activate(result, 0);
    }
  }
  return result;
}

- (void)resetToTransform:(SCNMatrix4 *)a3
{
  float32x4_t v5 = [(SCNNode *)self->_node sceneRef];
  node = self->_node;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  long long v7 = *(_OWORD *)&a3->m21;
  long long v10 = *(_OWORD *)&a3->m11;
  long long v11 = v7;
  long long v8 = *(_OWORD *)&a3->m41;
  long long v12 = *(_OWORD *)&a3->m31;
  long long v13 = v8;
  v9[2] = __35__SCNPhysicsBody_resetToTransform___block_invoke;
  v9[3] = &unk_264007B18;
  void v9[4] = self;
  +[SCNTransaction postCommandWithContext:v5 object:node applyBlock:v9];
}

uint64_t __35__SCNPhysicsBody_resetToTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v2;
  long long v3 = *(_OWORD *)(a1 + 88);
  v5[2] = *(_OWORD *)(a1 + 72);
  v5[3] = v3;
  return [v1 moveToTransform:v5];
}

- (void)resetTransform
{
  node = self->_node;
  if (node)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    [(SCNNode *)node worldTransform];
    float32x4_t v4 = [(SCNNode *)self->_node sceneRef];
    float32x4_t v5 = self->_node;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    long long v7 = v11;
    long long v8 = v12;
    long long v9 = v13;
    long long v10 = v14;
    v6[2] = __32__SCNPhysicsBody_resetTransform__block_invoke;
    v6[3] = &unk_264007B18;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:v4 object:v5 applyBlock:v6];
  }
}

uint64_t __32__SCNPhysicsBody_resetTransform__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v2;
  long long v3 = *(_OWORD *)(a1 + 88);
  v5[2] = *(_OWORD *)(a1 + 72);
  v5[3] = v3;
  return [v1 moveToTransform:v5];
}

- (void)moveToPosition:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = [(SCNNode *)self->_node presentationNode];
  if (v7)
  {
    [(SCNNode *)v7 worldTransform];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  *(void *)&long long v12 = __PAIR64__(LODWORD(y), LODWORD(x));
  *((float *)&v12 + 2) = z;
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  [(SCNPhysicsBody *)self moveToTransform:v8];
}

- (void)rotateToAxisAngle:(SCNVector4)a3
{
  float w = a3.w;
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v17.i32[2] = 0;
  v17.i64[0] = 0;
  v16.i32[2] = 0;
  v16.i64[0] = 0;
  memset(&v15, 0, sizeof(v15));
  long long v8 = [(SCNNode *)self->_node presentationNode];
  if (v8) {
    [(SCNNode *)v8 worldTransform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  C3DMatrix4x4FromSCNMatrix4(v18, (uint64_t)&v15);
  C3DMatrix4x4GetAffineTransforms((uint64_t)v18, &v17, 0, &v16);
  memset(&a.m22, 0, 40);
  *(_OWORD *)&a.m12 = 0u;
  LODWORD(a.m11) = v16.i32[0];
  LODWORD(a.m22) = v16.i32[0];
  LODWORD(a.m33) = v16.i32[2];
  a.m44 = 1.0;
  SCNMatrix4MakeRotation(&b, w, x, y, z);
  SCNMatrix4Mult(&v13, &a, &b);
  v10.m11 = 1.0;
  *(void *)&v10.m14 = 0;
  *(void *)&v10.m12 = 0;
  v10.m22 = 1.0;
  *(void *)&v10.m23 = 0;
  *(void *)&v10.m31 = 0;
  *(void *)&v10.m33 = 1065353216;
  LODWORD(v10.m41) = v17.i32[0];
  *(int32x2_t *)&v10.m42 = vzip1_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
  v10.m44 = 1.0;
  SCNMatrix4Mult(&v14, &v13, &v10);
  SCNMatrix4 v15 = v14;
  SCNMatrix4 v9 = v14;
  [(SCNPhysicsBody *)self moveToTransform:&v9];
}

- (void)moveToTransform:(SCNMatrix4 *)a3
{
  if (self->_body)
  {
    C3DMatrix4x4FromSCNMatrix4(v13, (uint64_t)a3);
    v8.i32[2] = 0;
    v8.i64[0] = 0;
    C3DMatrix4x4GetScale(v13, &v8);
    float32x4_t v9 = v13[0];
    float32x4_t v10 = v13[1];
    float32x4_t v11 = v13[2];
    float32x4_t v12 = v13[3];
    C3DMatrix4x4ClearScale(&v9);
    bodfloat y = (btRigidBody *)self->_body;
    *(void *)v7.var0.var0[0].var0.var0 = __PAIR64__(v10.u32[0], v9.u32[0]);
    *(void *)&v7.var0.var0[0].var0.var0[2] = v11.u32[0];
    *(void *)v7.var0.var0[1].var0.var0 = __PAIR64__(v10.u32[1], v9.u32[1]);
    *(void *)&v7.var0.var0[1].var0.var0[2] = v11.u32[1];
    *(void *)v7.var0.var0[2].var0.var0 = __PAIR64__(v10.u32[2], v9.u32[2]);
    *(void *)&v7.var0.var0[2].var0.var0[2] = v11.u32[2];
    *(void *)v7.var1.var0.var0 = v12.i64[0];
    *(void *)&v7.var1.var0.var0[2] = v12.u32[2];
    btRigidBody::proceedToTransform(body, &v7);
    float32x4_t v5 = self->_body;
    float32x4_t v6 = (float32x4_t *)*((void *)v5 + 67);
    if (v6)
    {
      v6[1] = v8;
      float32x4_t v5 = self->_body;
    }
    __updateCCDRadiusIfNeeded((uint64_t)v5);
    btCollisionObject::activate((btCollisionObject *)self->_body, 1);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  float32x4_t v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:shape:", -[SCNPhysicsBody type](self, "type"), -[SCNPhysicsBody physicsShape](self, "physicsShape"));
  [(SCNPhysicsBody *)self mass];
  objc_msgSend(v4, "setMass:");
  [(SCNPhysicsBody *)self charge];
  objc_msgSend(v4, "setCharge:");
  [(SCNPhysicsBody *)self friction];
  objc_msgSend(v4, "setFriction:");
  [(SCNPhysicsBody *)self restitution];
  objc_msgSend(v4, "setRestitution:");
  [(SCNPhysicsBody *)self rollingFriction];
  objc_msgSend(v4, "setRollingFriction:");
  [(SCNPhysicsBody *)self damping];
  objc_msgSend(v4, "setDamping:");
  [(SCNPhysicsBody *)self angularVelocity];
  objc_msgSend(v4, "setAngularVelocity:");
  [(SCNPhysicsBody *)self angularDamping];
  objc_msgSend(v4, "setAngularDamping:");
  [(SCNPhysicsBody *)self linearRestingThreshold];
  objc_msgSend(v4, "setLinearRestingThreshold:");
  [(SCNPhysicsBody *)self angularRestingThreshold];
  objc_msgSend(v4, "setAngularRestingThreshold:");
  [(SCNPhysicsBody *)self velocityFactor];
  objc_msgSend(v4, "setVelocityFactor:");
  [(SCNPhysicsBody *)self angularVelocityFactor];
  objc_msgSend(v4, "setAngularVelocityFactor:");
  [(SCNPhysicsBody *)self velocity];
  objc_msgSend(v4, "setVelocity:");
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNPhysicsBody categoryBitMask](self, "categoryBitMask"));
  objc_msgSend(v4, "setCollisionBitMask:", -[SCNPhysicsBody collisionBitMask](self, "collisionBitMask"));
  objc_msgSend(v4, "setContactTestBitMask:", -[SCNPhysicsBody contactTestBitMask](self, "contactTestBitMask"));
  objc_msgSend(v4, "setAllowsResting:", -[SCNPhysicsBody allowsResting](self, "allowsResting"));
  [(SCNPhysicsBody *)self angularVelocity];
  objc_msgSend(v4, "setAngularVelocity:");
  objc_msgSend(v4, "setAffectedByGravity:", -[SCNPhysicsBody isAffectedByGravity](self, "isAffectedByGravity"));
  objc_msgSend(v4, "setUsesDefaultMomentOfInertia:", -[SCNPhysicsBody usesDefaultMomentOfInertia](self, "usesDefaultMomentOfInertia"));
  [(SCNPhysicsBody *)self momentOfInertia];
  objc_msgSend(v4, "setMomentOfInertia:");
  [(SCNPhysicsBody *)self centerOfMassOffset];
  objc_msgSend(v4, "setCenterOfMassOffset:");
  [(SCNPhysicsBody *)self continuousCollisionDetectionThreshold];
  objc_msgSend(v4, "setContinuousCollisionDetectionThreshold:");
  +[SCNTransaction commitImmediate];
  return v4;
}

- (id)copy
{
  return [(SCNPhysicsBody *)self copyWithZone:0];
}

- (void)_createBody
{
  float mass = self->_mass;
  float v14 = mass;
  uint64_t v15 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  char v27 = 0;
  long long v28 = xmmword_20B5CD030;
  long long v16 = xmmword_20B5CB820;
  long long v17 = xmmword_20B5CB7D0;
  long long v18 = xmmword_20B5CB520;
  uint64_t v19 = 0;
  float damping = self->_damping;
  float v24 = damping;
  v5.f64[0] = self->_angularDamping;
  float32x2_t v26 = vcvt_f32_f64(*(float64x2_t *)&self->_linearRestingThreshold);
  v5.f64[1] = self->_friction;
  float32x4_t v25 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), (float64x2_t)vextq_s8(*(int8x16_t *)&self->_restitution, *(int8x16_t *)&self->_restitution, 8uLL));
  uint64_t v6 = btAlignedAllocInternal(704, 16);
  btRigidBody::btRigidBody((btCollisionObject *)v6, (uint64_t)&v14);
  __modifyCollisionFlagsFromType((btRigidBody *)v6, (SCNPhysicsBodyType)self->_type);
  v7.i64[0] = *(void *)&self->_velocity.x;
  v7.i64[1] = LODWORD(self->_velocity.z);
  *(float32x4_t *)(v6 + 352) = v7;
  v7.i64[0] = *(void *)&self->_angularVelocity.x;
  v7.i64[1] = LODWORD(self->_angularVelocity.z);
  *(float32x4_t *)(v6 + 368) = v7;
  v7.i64[0] = *(void *)&self->_velocityFactor.x;
  v7.i32[2] = LODWORD(self->_velocityFactor.z);
  float32x4_t v8 = vmulq_n_f32(v7, *(float *)(v6 + 384));
  v7.i32[3] = 0;
  *(float32x4_t *)(v6 + 400) = v7;
  v8.i32[3] = 0;
  *(float32x4_t *)(v6 + 640) = v8;
  v7.i64[0] = *(void *)&self->_angularVelocityFactor.x;
  v7.i64[1] = LODWORD(self->_angularVelocityFactor.z);
  *(float32x4_t *)(v6 + 624) = v7;
  if (self->_allowsResting) {
    int v9 = 1;
  }
  else {
    int v9 = 4;
  }
  btCollisionObject::setActivationState((btCollisionObject *)v6, v9);
  float charge = self->_charge;
  *(float *)(v6 + 532) = charge;
  float continuousCollisionDetectionThreshold = self->_continuousCollisionDetectionThreshold;
  *(float *)(v6 + 288) = continuousCollisionDetectionThreshold;
  if (self->_ignoreGravity)
  {
    *(_DWORD *)(v6 + 576) = 1;
    float32x4_t v13 = 0uLL;
    btRigidBody::setGravity((btRigidBody *)v6, &v13);
  }
  return (void *)v6;
}

- (void)_ownerWillDie
{
  self->_node = 0;
}

- (void)_removeOwner
{
  node = self->_node;
  uint64_t v4 = objc_msgSend(-[SCNNode scene](node, "scene"), "physicsWorld");
  self->_node = 0;
  bodfloat y = self->_body;
  if (body)
  {
    uint64_t v6 = v4;
    uint64_t v7 = [(SCNNode *)node sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__SCNPhysicsBody__removeOwner__block_invoke;
    v8[3] = &unk_264007B40;
    _OWORD v8[4] = node;
    v8[5] = v6;
    void v8[6] = self;
    void v8[7] = body;
    +[SCNTransaction postCommandWithContext:v7 object:node applyBlock:v8];
  }
}

uint64_t __30__SCNPhysicsBody__removeOwner__block_invoke(uint64_t a1)
{
  C3DNodeSetHasPhysicsBody([*(id *)(a1 + 32) nodeRef], 0);
  long long v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v2 removePhysicsBody:v3 handle:v4];
}

- (void)_setOwner:(id)a3
{
  if (self->_node)
  {
    if (self->_body)
    {
      float64x2_t v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[SCNPhysicsBody _setOwner:](v5);
      }
    }
  }
  self->_node = (SCNNode *)a3;
  uint64_t v6 = [a3 nodeRef];
  bodfloat y = self->_body;
  NSUInteger v8 = [(SCNPhysicsBody *)self categoryBitMask];
  NSUInteger v9 = [(SCNPhysicsBody *)self collisionBitMask];
  NSUInteger v10 = [(SCNPhysicsBody *)self contactTestBitMask];
  if (self->_node)
  {
    NSUInteger v12 = v10;
    double mass = self->_mass;
    BOOL isDefaultShape = self->_isDefaultShape;
    *(void *)&long long v11 = *(void *)&self->_momentOfInertia.x;
    DWORD2(v11) = LODWORD(self->_momentOfInertia.z);
    long long v21 = v11;
    *(void *)&long long v14 = *(void *)&self->_centerOfMassOffset.x;
    BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
    *((void *)&v14 + 1) = LODWORD(self->_centerOfMassOffset.z);
    long long v20 = v14;
    physicsShape = self->_physicsShape;
    long long v17 = [(SCNPhysicsBody *)self sceneRef];
    node = self->_node;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3321888768;
    v23[2] = __28__SCNPhysicsBody__setOwner___block_invoke;
    v23[3] = &unk_26BF6EE10;
    uint64_t v29 = v6;
    v30 = body;
    BOOL v35 = isDefaultShape;
    id v26 = a3;
    char v27 = self;
    long long v28 = physicsShape;
    double v31 = mass;
    BOOL v36 = explicitMomentOfInertia;
    long long v24 = v21;
    long long v25 = v20;
    NSUInteger v32 = v8;
    NSUInteger v33 = v9;
    NSUInteger v34 = v12;
    +[SCNTransaction postCommandWithContext:v17 object:node applyBlock:v23];
  }
  else
  {
    uint64_t v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsBody _setOwner:]((uint64_t)self, v19);
    }
  }
}

uint64_t __28__SCNPhysicsBody__setOwner___block_invoke(uint64_t a1)
{
  long long v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "scene"), "physicsWorld");
  C3DNodeSetHasPhysicsBody(*(void *)(a1 + 88), 1);
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3 && !*(void *)(v3 + 208))
  {
    if (*(unsigned char *)(a1 + 136)) {
      DefaultShapeForNode = C3DPhysicsShapeGetDefaultShapeForNode(*(float32x4_t **)(a1 + 88));
    }
    else {
      DefaultShapeForNode = (btCollisionShape *)[*(id *)(a1 + 72) _shapeHandleWithShape:*(void *)(a1 + 80) owner:*(void *)(a1 + 64)];
    }
    uint64_t v7 = (btQuaternion *)DefaultShapeForNode;
    uint64_t v8 = *(void *)(a1 + 96);
    double v9 = *(double *)(a1 + 104);
    if (*(unsigned char *)(a1 + 137)) {
      NSUInteger v10 = (unsigned long long *)(a1 + 32);
    }
    else {
      NSUInteger v10 = 0;
    }
    long long v17 = *(_OWORD *)(a1 + 48);
    __setCollisionShape(v8, v7, v10, &v17, v9, *(float *)&v17, v5, v6);
  }
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v15 = *(void *)(a1 + 128);

  return [v2 addPhysicsBody:v11 nodeRef:v12 colGroup:v13 colMask:v14 colTest:v15];
}

- (id)_owner
{
  return self->_node;
}

- (void)_didDecodeSCNPhysicsBody:(id)a3
{
  self->_bodfloat y = [(SCNPhysicsBody *)self _createBody];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"mass" forKey:self->_mass];
  [a3 encodeDouble:@"charge" forKey:self->_charge];
  [a3 encodeDouble:@"friction" forKey:self->_friction];
  [a3 encodeDouble:@"restitution" forKey:self->_restitution];
  [a3 encodeDouble:@"rollingFriction" forKey:self->_rollingFriction];
  [a3 encodeDouble:@"ccdThreshold" forKey:self->_continuousCollisionDetectionThreshold];
  physicsShape = self->_physicsShape;
  if (physicsShape) {
    [a3 encodeObject:physicsShape forKey:@"physicsShape"];
  }
  [a3 encodeInteger:self->_type forKey:@"type"];
  [a3 encodeDouble:@"damping" forKey:self->_damping];
  SCNEncodeVector4(a3, @"angularVelocity", self->_angularVelocity.x, self->_angularVelocity.y, self->_angularVelocity.z, self->_angularVelocity.w);
  [a3 encodeDouble:@"angularDamping" forKey:self->_angularDamping];
  [a3 encodeDouble:@"linearRestingThreshold" forKey:self->_linearRestingThreshold];
  [a3 encodeDouble:@"angularRestingThreshold" forKey:self->_angularRestingThreshold];
  SCNEncodeVector3(a3, @"velocityFactor", self->_velocityFactor.x, self->_velocityFactor.y, self->_velocityFactor.z);
  SCNEncodeVector3(a3, @"angularVelocityFactor", self->_angularVelocityFactor.x, self->_angularVelocityFactor.y, self->_angularVelocityFactor.z);
  SCNEncodeVector3(a3, @"velocity", self->_velocity.x, self->_velocity.y, self->_velocity.z);
  [a3 encodeBool:self->_ignoreGravity forKey:@"ignoreGravity"];
  [a3 encodeBool:self->_explicitMomentOfInertia forKey:@"explicitMomentOfInertia"];
  SCNEncodeVector3(a3, @"momentOfInertia", self->_momentOfInertia.x, self->_momentOfInertia.y, self->_momentOfInertia.z);
  SCNEncodeVector3(a3, @"centerOfMassOffset", self->_centerOfMassOffset.x, self->_centerOfMassOffset.y, self->_centerOfMassOffset.z);
  [a3 encodeInteger:self->_categoryBitMask forKey:@"categoryBitMask"];
  [a3 encodeInteger:self->_collisionBitMask forKey:@"collisionBitMask"];
  [a3 encodeInteger:self->_contactTestBitMask forKey:@"contactTestBitMask"];
  [a3 encodeBool:self->_allowsResting forKey:@"allowsResting"];
  BOOL isDefaultShape = self->_isDefaultShape;

  [a3 encodeBool:isDefaultShape forKey:@"isDefaultShape"];
}

- (SCNPhysicsBody)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNPhysicsBody;
  uint64_t v4 = [(SCNPhysicsBody *)&v15 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"charge"];
    -[SCNPhysicsBody setCharge:](v4, "setCharge:");
    [a3 decodeDoubleForKey:@"friction"];
    -[SCNPhysicsBody setFriction:](v4, "setFriction:");
    [a3 decodeDoubleForKey:@"restitution"];
    -[SCNPhysicsBody setRestitution:](v4, "setRestitution:");
    [a3 decodeDoubleForKey:@"rollingFriction"];
    -[SCNPhysicsBody setRollingFriction:](v4, "setRollingFriction:");
    -[SCNPhysicsBody setPhysicsShape:](v4, "setPhysicsShape:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"physicsShape"));
    if ([a3 containsValueForKey:@"ccdThreshold"])
    {
      [a3 decodeDoubleForKey:@"ccdThreshold"];
      -[SCNPhysicsBody setContinuousCollisionDetectionThreshold:](v4, "setContinuousCollisionDetectionThreshold:");
    }
    -[SCNPhysicsBody setType:](v4, "setType:", [a3 decodeIntegerForKey:@"type"]);
    [a3 decodeDoubleForKey:@"mass"];
    -[SCNPhysicsBody setMass:](v4, "setMass:");
    [a3 decodeDoubleForKey:@"damping"];
    -[SCNPhysicsBody setDamping:](v4, "setDamping:");
    *(float *)&double v6 = SCNDecodeVector4(a3, @"angularVelocity");
    [(SCNPhysicsBody *)v4 setAngularVelocity:v6];
    [a3 decodeDoubleForKey:@"angularDamping"];
    -[SCNPhysicsBody setAngularDamping:](v4, "setAngularDamping:");
    uint64_t v7 = @"linearRestingThreshold";
    if (([a3 containsValueForKey:@"linearRestingThreshold"] & 1) != 0
      || (uint64_t v7 = @"linearSleepingThreshold",
          [a3 containsValueForKey:@"linearSleepingThreshold"]))
    {
      [a3 decodeDoubleForKey:v7];
      -[SCNPhysicsBody setLinearRestingThreshold:](v4, "setLinearRestingThreshold:");
    }
    uint64_t v8 = @"angularRestingThreshold";
    if (([a3 containsValueForKey:@"angularRestingThreshold"] & 1) != 0
      || (uint64_t v8 = @"angularSleepingThreshold",
          [a3 containsValueForKey:@"angularSleepingThreshold"]))
    {
      [a3 decodeDoubleForKey:v8];
      -[SCNPhysicsBody setAngularRestingThreshold:](v4, "setAngularRestingThreshold:");
    }
    *(float *)&double v9 = SCNDecodeVector3(a3, @"velocityFactor");
    [(SCNPhysicsBody *)v4 setVelocityFactor:v9];
    *(float *)&double v10 = SCNDecodeVector3(a3, @"angularVelocityFactor");
    [(SCNPhysicsBody *)v4 setAngularVelocityFactor:v10];
    *(float *)&double v11 = SCNDecodeVector3(a3, @"velocity");
    [(SCNPhysicsBody *)v4 setVelocity:v11];
    -[SCNPhysicsBody setAffectedByGravity:](v4, "setAffectedByGravity:", [a3 decodeBoolForKey:@"ignoreGravity"] ^ 1);
    -[SCNPhysicsBody setUsesDefaultMomentOfInertia:](v4, "setUsesDefaultMomentOfInertia:", [a3 decodeBoolForKey:@"explicitMomentOfInertia"] ^ 1);
    *(float *)&double v12 = SCNDecodeVector3(a3, @"momentOfInertia");
    [(SCNPhysicsBody *)v4 setMomentOfInertia:v12];
    *(float *)&double v13 = SCNDecodeVector3(a3, @"centerOfMassOffset");
    [(SCNPhysicsBody *)v4 setCenterOfMassOffset:v13];
    -[SCNPhysicsBody setCategoryBitMask:](v4, "setCategoryBitMask:", [a3 decodeIntegerForKey:@"categoryBitMask"]);
    -[SCNPhysicsBody setCollisionBitMask:](v4, "setCollisionBitMask:", [a3 decodeIntegerForKey:@"collisionBitMask"]);
    -[SCNPhysicsBody setContactTestBitMask:](v4, "setContactTestBitMask:", [a3 decodeIntegerForKey:@"contactTestBitMask"]);
    -[SCNPhysicsBody setAllowsResting:](v4, "setAllowsResting:", [a3 decodeBoolForKey:@"allowsResting"]);
    v4->_BOOL isDefaultShape = [a3 decodeBoolForKey:@"isDefaultShape"];
    [(SCNPhysicsBody *)v4 _didDecodeSCNPhysicsBody:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGFloat)continuousCollisionDetectionThreshold
{
  return self->_continuousCollisionDetectionThreshold;
}

void __34__SCNPhysicsBody_setPhysicsShape___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: unable to update the physics shape of %@", (uint8_t *)&v3, 0xCu);
}

void __37__SCNPhysicsBody_applyForce_impulse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot apply force on a body that is not attached to a SCNNode", v2, v3, v4, v5, v6);
}

void __32__SCNPhysicsBody_clearAllForces__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot clear forces on a body that is not attached to a SCNNode", v2, v3, v4, v5, v6);
}

- (void)_setOwner:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: cannot attach a body to a null node %p", (uint8_t *)&v2, 0xCu);
}

- (void)_setOwner:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "!_node || _body == 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. SCNPhysicsBody is already attached to a SCNNode", (uint8_t *)&v1, 0xCu);
}

@end