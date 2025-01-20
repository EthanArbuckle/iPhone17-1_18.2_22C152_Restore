@interface SCNPhysicsNoiseField
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsDirection;
- (BOOL)supportsOffset;
- (SCNPhysicsNoiseField)init;
- (SCNPhysicsNoiseField)initWithCoder:(id)a3;
- (c3dPhysicsField)_createField;
- (double)animationSpeed;
- (double)smoothness;
- (id)valueForUndefinedKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationSpeed:(double)a3;
- (void)setSmoothness:(double)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation SCNPhysicsNoiseField

- (SCNPhysicsNoiseField)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsNoiseField;
  result = [(SCNPhysicsField *)&v3 init];
  if (result)
  {
    result->_smoothness = 0.0;
    result->_animationSpeed = 1.0;
  }
  return result;
}

- (c3dPhysicsField)_createField
{
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setSmoothness:(double)a3
{
  self->_smoothness = a3;
  v5 = objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsNoiseField_setSmoothness___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [v5 _postCommandWithBlock:v6];
}

float __38__SCNPhysicsNoiseField_setSmoothness___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 240) = result;
  }
  return result;
}

- (double)animationSpeed
{
  return self->_animationSpeed;
}

- (void)setAnimationSpeed:(double)a3
{
  self->_animationSpeed = a3;
  v5 = objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SCNPhysicsNoiseField_setAnimationSpeed___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [v5 _postCommandWithBlock:v6];
}

float __42__SCNPhysicsNoiseField_setAnimationSpeed___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 244) = result;
  }
  return result;
}

- (BOOL)supportsOffset
{
  return 0;
}

- (BOOL)supportsDirection
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"smoothness"])
  {
    v5 = NSNumber;
    uint64_t v6 = 128;
  }
  else
  {
    if (![a3 isEqualToString:@"animationSpeed"])
    {
      v9.receiver = self;
      v9.super_class = (Class)SCNPhysicsNoiseField;
      return [(SCNPhysicsNoiseField *)&v9 valueForUndefinedKey:a3];
    }
    v5 = NSNumber;
    uint64_t v6 = 136;
  }
  double v7 = *(double *)((char *)&self->super.super.isa + v6);

  return (id)[v5 numberWithDouble:v7];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 isEqualToString:@"smoothness"])
  {
    [a3 doubleValue];
    -[SCNPhysicsNoiseField setSmoothness:](self, "setSmoothness:");
  }
  else if ([a4 isEqualToString:@"animationSpeed"])
  {
    [a3 doubleValue];
    -[SCNPhysicsNoiseField setAnimationSpeed:](self, "setAnimationSpeed:");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNPhysicsNoiseField;
    [(SCNPhysicsNoiseField *)&v7 setValue:a3 forUndefinedKey:a4];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsNoiseField;
  -[SCNPhysicsField encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeDouble:@"smoothness" forKey:self->_smoothness];
  [a3 encodeDouble:@"animationSpeed" forKey:self->_animationSpeed];
}

- (SCNPhysicsNoiseField)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsNoiseField;
  v4 = -[SCNPhysicsField initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"smoothness"];
    -[SCNPhysicsNoiseField setSmoothness:](v4, "setSmoothness:");
    [a3 decodeDoubleForKey:@"animationSpeed"];
    -[SCNPhysicsNoiseField setAnimationSpeed:](v4, "setAnimationSpeed:");
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end