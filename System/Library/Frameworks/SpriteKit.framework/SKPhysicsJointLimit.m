@interface SKPhysicsJointLimit
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJointLimit)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsJointLimit)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB;
- (CGFloat)maxLength;
- (void)setMaxLength:(CGFloat)maxLength;
@end

@implementation SKPhysicsJointLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointLimit)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointLimit *)[MEMORY[0x263F5E580] allocWithZone:a3];
}

+ (SKPhysicsJointLimit)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchorA:(CGPoint)anchorA anchorB:(CGPoint)anchorB
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

  v15 = objc_msgSend(MEMORY[0x263F5E580], "jointWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

  return (SKPhysicsJointLimit *)v15;
}

- (CGFloat)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(CGFloat)maxLength
{
  self->_maxLength = maxLength;
}

@end