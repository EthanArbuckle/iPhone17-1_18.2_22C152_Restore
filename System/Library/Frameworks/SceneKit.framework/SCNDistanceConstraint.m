@interface SCNDistanceConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNDistanceConstraint)distanceConstraintWithTarget:(SCNNode *)target;
+ (id)distanceConstraint;
- (BOOL)keepTargetDirection;
- (CGFloat)maximumDistance;
- (CGFloat)minimumDistance;
- (SCNDistanceConstraint)init;
- (SCNDistanceConstraint)initWithCoder:(id)a3;
- (SCNNode)target;
- (SCNVector3)targetDirection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_customDecodingOfSCNDistanceConstraint:(id)a3;
- (void)_customEncodingOfSCNDistanceConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setKeepTargetDirection:(BOOL)a3;
- (void)setMaximumDistance:(CGFloat)maximumDistance;
- (void)setMinimumDistance:(CGFloat)minimumDistance;
- (void)setTarget:(SCNNode *)target;
- (void)setTargetDirection:(SCNVector3)a3;
@end

@implementation SCNDistanceConstraint

- (SCNDistanceConstraint)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCNDistanceConstraint;
  v2 = [(SCNConstraint *)&v8 init];
  if (v2)
  {
    uint64_t Distance = C3DConstraintCreateDistance();
    v2->_maximumuint64_t Distance = 3.4028e38;
    v2->_minimumuint64_t Distance = 0.0;
    v2->_maximumDirectionAngle = 360.0;
    v2->super._constraintRef = (__C3DConstraint *)Distance;
    +[SCNNode localFront];
    v2->_targetDirection.x = v4;
    v2->_targetDirection.y = v5;
    v2->_targetDirection.z = v6;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNDistanceConstraint;
  [(SCNConstraint *)&v3 dealloc];
}

+ (id)distanceConstraint
{
  v2 = objc_alloc_init(SCNDistanceConstraint);

  return v2;
}

+ (SCNDistanceConstraint)distanceConstraintWithTarget:(SCNNode *)target
{
  float v4 = objc_alloc_init(SCNDistanceConstraint);
  [(SCNDistanceConstraint *)v4 setTarget:target];
  return v4;
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setTarget:(SCNNode *)target
{
  float v5 = target;
  self->_target = v5;
  if (v5) {
    uint64_t v6 = [(SCNNode *)v5 nodeRef];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SCNDistanceConstraint_setTarget___block_invoke;
  v8[3] = &unk_264004FC0;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

CFTypeRef __35__SCNDistanceConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(void *)(*(void *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNVector3)targetDirection
{
  float x = self->_targetDirection.x;
  float y = self->_targetDirection.y;
  float z = self->_targetDirection.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setTargetDirection:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  self->_targetDirection = a3;
  v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SCNDistanceConstraint_setTargetDirection___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"targetDirection" applyBlock:v8];
}

void __44__SCNDistanceConstraint_setTargetDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintDistanceSetTargetDirection(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (BOOL)keepTargetDirection
{
  return self->_keepTargetDirection;
}

- (void)setKeepTargetDirection:(BOOL)a3
{
  self->_keepTargetDirection = a3;
  float v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SCNDistanceConstraint_setKeepTargetDirection___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __48__SCNDistanceConstraint_setKeepTargetDirection___block_invoke(uint64_t a1)
{
}

- (CGFloat)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(CGFloat)minimumDistance
{
  float v5 = minimumDistance;
  self->_minimumuint64_t Distance = v5;
  uint64_t v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SCNDistanceConstraint_setMinimumDistance___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = minimumDistance;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"minimumDistance" applyBlock:v7];
}

float __44__SCNDistanceConstraint_setMinimumDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMinimumDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(CGFloat)maximumDistance
{
  float v5 = maximumDistance;
  self->_maximumuint64_t Distance = v5;
  uint64_t v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SCNDistanceConstraint_setMaximumDistance___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = maximumDistance;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"maximumDistance" applyBlock:v7];
}

float __44__SCNDistanceConstraint_setMaximumDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintDistanceSetMaximumDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNDistanceConstraint target](self, "target"));
  [(SCNDistanceConstraint *)self maximumDistance];
  objc_msgSend(v4, "setMaximumDistance:");
  [(SCNDistanceConstraint *)self minimumDistance];
  objc_msgSend(v4, "setMinimumDistance:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (void)_customEncodingOfSCNDistanceConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    [a3 encodeObject:target forKey:@"target"];
  }
}

- (void)_customDecodingOfSCNDistanceConstraint:(id)a3
{
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateDistance();
  -[SCNDistanceConstraint setTarget:](self, "setTarget:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"target"]);

  [(SCNConstraint *)self finalizeDecodeConstraint:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNDistanceConstraint;
  -[SCNConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [(SCNDistanceConstraint *)self _customEncodingOfSCNDistanceConstraint:a3];
  *(float *)&double v5 = self->_minimumDistance;
  [a3 encodeFloat:@"minimumDistance" forKey:v5];
  *(float *)&double v6 = self->_maximumDistance;
  [a3 encodeFloat:@"maximumDistance" forKey:v6];
}

- (SCNDistanceConstraint)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNDistanceConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNDistanceConstraint *)v4 _customDecodingOfSCNDistanceConstraint:a3];
    [a3 decodeFloatForKey:@"minimumDistance"];
    [(SCNDistanceConstraint *)v4 setMinimumDistance:v6];
    [a3 decodeFloatForKey:@"maximumDistance"];
    [(SCNDistanceConstraint *)v4 setMaximumDistance:v7];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end