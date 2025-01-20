@interface SKPhysicsJointSpring
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJointSpring)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsJointSpring)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB;
- (CGFloat)damping;
- (CGFloat)frequency;
- (void)setDamping:(CGFloat)damping;
- (void)setFrequency:(CGFloat)frequency;
@end

@implementation SKPhysicsJointSpring

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointSpring)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointSpring *)[MEMORY[0x263F5E568] allocWithZone:a3];
}

+ (SKPhysicsJointSpring)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB
{
  double y = anchorB.y;
  double x = anchorB.x;
  double v8 = anchorA.y;
  double v9 = anchorA.x;
  v11 = bodyA;
  v12 = bodyB;
  v13 = [(SKPhysicsBody *)v11 node];
  [v13 updatePhysicsPositionAndScaleFromSprite];

  v14 = [(SKPhysicsBody *)v12 node];
  [v14 updatePhysicsPositionAndScaleFromSprite];

  v15 = objc_msgSend(MEMORY[0x263F5E568], "jointWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

  return (SKPhysicsJointSpring *)v15;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setDamping:(CGFloat)damping
{
  self->_damping = damping;
}

- (CGFloat)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(CGFloat)frequency
{
  self->_frequencdouble y = frequency;
}

@end