@interface SKPhysicsJointPin
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJointPin)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsJointPin)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor;
- (BOOL)shouldEnableLimits;
- (CGFloat)frictionTorque;
- (CGFloat)lowerAngleLimit;
- (CGFloat)rotationSpeed;
- (CGFloat)upperAngleLimit;
- (CGPoint)anchor;
- (void)setFrictionTorque:(CGFloat)frictionTorque;
- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit;
- (void)setRotationSpeed:(CGFloat)rotationSpeed;
- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits;
- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit;
@end

@implementation SKPhysicsJointPin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointPin)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointPin *)[MEMORY[0x263F5E578] allocWithZone:a3];
}

+ (SKPhysicsJointPin)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor
{
  double y = anchor.y;
  double x = anchor.x;
  v8 = bodyA;
  v9 = bodyB;
  v10 = [(SKPhysicsBody *)v8 node];
  [v10 updatePhysicsPositionAndScaleFromSprite];

  v11 = [(SKPhysicsBody *)v9 node];
  [v11 updatePhysicsPositionAndScaleFromSprite];

  v12 = objc_msgSend(MEMORY[0x263F5E578], "jointWithBodyA:bodyB:anchor:", v8, v9, x, y);

  return (SKPhysicsJointPin *)v12;
}

- (BOOL)shouldEnableLimits
{
  return self->_shouldEnableLimits;
}

- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits
{
  self->_shouldEnableLimits = shouldEnableLimits;
}

- (CGFloat)lowerAngleLimit
{
  return self->_lowerAngleLimit;
}

- (void)setLowerAngleLimit:(CGFloat)lowerAngleLimit
{
  self->_lowerAngleLimit = lowerAngleLimit;
}

- (CGFloat)upperAngleLimit
{
  return self->_upperAngleLimit;
}

- (void)setUpperAngleLimit:(CGFloat)upperAngleLimit
{
  self->_upperAngleLimit = upperAngleLimit;
}

- (CGFloat)frictionTorque
{
  return self->_frictionTorque;
}

- (void)setFrictionTorque:(CGFloat)frictionTorque
{
  self->_frictionTorque = frictionTorque;
}

- (CGFloat)rotationSpeed
{
  return self->_rotationSpeed;
}

- (void)setRotationSpeed:(CGFloat)rotationSpeed
{
  self->_rotationSpeed = rotationSpeed;
}

- (CGPoint)anchor
{
  objc_copyStruct(v4, &self->_anchor, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

@end