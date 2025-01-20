@interface SCNAccelerationConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNAccelerationConstraint)accelerationConstraint;
- (CGFloat)damping;
- (CGFloat)decelerationDistance;
- (CGFloat)maximumLinearAcceleration;
- (CGFloat)maximumLinearVelocity;
- (SCNAccelerationConstraint)init;
- (SCNAccelerationConstraint)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDamping:(CGFloat)damping;
- (void)setDecelerationDistance:(CGFloat)decelerationDistance;
- (void)setMaximumLinearAcceleration:(CGFloat)maximumLinearAcceleration;
- (void)setMaximumLinearVelocity:(CGFloat)maximumLinearVelocity;
@end

@implementation SCNAccelerationConstraint

- (SCNAccelerationConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNAccelerationConstraint;
  v2 = [(SCNConstraint *)&v5 init];
  if (v2)
  {
    uint64_t Acceleration = C3DConstraintCreateAcceleration();
    v2->_maximumLinearuint64_t Acceleration = 3.4028e38;
    v2->_maximumLinearVelocity = 3.4028e38;
    v2->super._constraintRef = (__C3DConstraint *)Acceleration;
    v2->_damping = 0.1;
  }
  return v2;
}

+ (SCNAccelerationConstraint)accelerationConstraint
{
  v2 = objc_alloc_init(SCNAccelerationConstraint);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SCNAccelerationConstraint *)self maximumLinearVelocity];
  objc_msgSend(v4, "setMaximumLinearVelocity:");
  [(SCNAccelerationConstraint *)self maximumLinearAcceleration];
  objc_msgSend(v4, "setMaximumLinearAcceleration:");
  [(SCNAccelerationConstraint *)self decelerationDistance];
  objc_msgSend(v4, "setDecelerationDistance:");
  [(SCNAccelerationConstraint *)self damping];
  objc_msgSend(v4, "setDamping:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (CGFloat)maximumLinearVelocity
{
  return self->_maximumLinearVelocity;
}

- (void)setMaximumLinearVelocity:(CGFloat)maximumLinearVelocity
{
  float v5 = maximumLinearVelocity;
  self->_maximumLinearVelocity = v5;
  v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCNAccelerationConstraint_setMaximumLinearVelocity___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumLinearVelocity;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"maximumLinearVelocity" applyBlock:v7];
}

float __54__SCNAccelerationConstraint_setMaximumLinearVelocity___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintAccelerationSetMaximumPositionVelocity(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)maximumLinearAcceleration
{
  return self->_maximumLinearAcceleration;
}

- (void)setMaximumLinearAcceleration:(CGFloat)maximumLinearAcceleration
{
  float v5 = maximumLinearAcceleration;
  self->_maximumLinearuint64_t Acceleration = v5;
  v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SCNAccelerationConstraint_setMaximumLinearAcceleration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumLinearAcceleration;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"maximumLinearAcceleration" applyBlock:v7];
}

float __58__SCNAccelerationConstraint_setMaximumLinearAcceleration___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintAccelerationSetMaximumPositionAcceleration(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setDecelerationDistance:(CGFloat)decelerationDistance
{
  float v5 = decelerationDistance;
  self->_decelerationDistance = v5;
  v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SCNAccelerationConstraint_setDecelerationDistance___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = decelerationDistance;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"decelerationDistance" applyBlock:v7];
}

float __53__SCNAccelerationConstraint_setDecelerationDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMinimumDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)decelerationDistance
{
  return self->_decelerationDistance;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setDamping:(CGFloat)damping
{
  float v5 = damping;
  self->_damping = v5;
  v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SCNAccelerationConstraint_setDamping___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = damping;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"damping" applyBlock:v7];
}

float __40__SCNAccelerationConstraint_setDamping___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMaximumDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNAccelerationConstraint;
  -[SCNConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  *(float *)&double v5 = self->_maximumLinearVelocity;
  [a3 encodeFloat:@"maximumLinearVelocity" forKey:v5];
  *(float *)&double v6 = self->_maximumLinearAcceleration;
  [a3 encodeFloat:@"maximumLinearAcceleration" forKey:v6];
  *(float *)&double v7 = self->_decelerationDistance;
  [a3 encodeFloat:@"decelerationDistance" forKey:v7];
  *(float *)&double v8 = self->_damping;
  [a3 encodeFloat:@"damping" forKey:v8];
}

- (SCNAccelerationConstraint)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCNAccelerationConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateAcceleration();
    [(SCNConstraint *)v4 finalizeDecodeConstraint:a3];
    [a3 decodeFloatForKey:@"maximumLinearVelocity"];
    [(SCNAccelerationConstraint *)v4 setMaximumLinearVelocity:v6];
    [a3 decodeFloatForKey:@"maximumLinearAcceleration"];
    [(SCNAccelerationConstraint *)v4 setMaximumLinearAcceleration:v7];
    [a3 decodeFloatForKey:@"decelerationDistance"];
    [(SCNAccelerationConstraint *)v4 setDecelerationDistance:v8];
    [a3 decodeFloatForKey:@"damping"];
    [(SCNAccelerationConstraint *)v4 setDamping:v9];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end