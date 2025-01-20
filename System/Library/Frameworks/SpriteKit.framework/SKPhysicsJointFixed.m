@interface SKPhysicsJointFixed
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJointFixed)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsJointFixed)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor;
@end

@implementation SKPhysicsJointFixed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointFixed)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointFixed *)[MEMORY[0x263F5E588] allocWithZone:a3];
}

+ (SKPhysicsJointFixed)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor
{
  double y = anchor.y;
  double x = anchor.x;
  v8 = bodyA;
  v9 = bodyB;
  v10 = [(SKPhysicsBody *)v8 node];
  [v10 updatePhysicsPositionAndScaleFromSprite];

  v11 = [(SKPhysicsBody *)v9 node];
  [v11 updatePhysicsPositionAndScaleFromSprite];

  v12 = objc_msgSend(MEMORY[0x263F5E588], "jointWithBodyA:bodyB:anchor:", v8, v9, x, y);

  return (SKPhysicsJointFixed *)v12;
}

@end