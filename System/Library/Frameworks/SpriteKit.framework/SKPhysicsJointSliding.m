@interface SKPhysicsJointSliding
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJointSliding)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsJointSliding)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor axis:(CGVector)axis;
- (BOOL)shouldEnableLimits;
- (CGFloat)lowerDistanceLimit;
- (CGFloat)upperDistanceLimit;
- (void)setLowerDistanceLimit:(CGFloat)lowerDistanceLimit;
- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits;
- (void)setUpperDistanceLimit:(CGFloat)upperDistanceLimit;
@end

@implementation SKPhysicsJointSliding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKPhysicsJointSliding)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJointSliding *)[MEMORY[0x263F5E570] allocWithZone:a3];
}

+ (SKPhysicsJointSliding)jointWithBodyA:(SKPhysicsBody *)bodyA bodyB:(SKPhysicsBody *)bodyB anchor:(CGPoint)anchor axis:(CGVector)axis
{
  double dy = axis.dy;
  double dx = axis.dx;
  double y = anchor.y;
  double x = anchor.x;
  v11 = bodyA;
  v12 = bodyB;
  v13 = [(SKPhysicsBody *)v11 node];
  [v13 updatePhysicsPositionAndScaleFromSprite];

  v14 = [(SKPhysicsBody *)v12 node];
  [v14 updatePhysicsPositionAndScaleFromSprite];

  v15 = objc_msgSend(MEMORY[0x263F5E570], "jointWithBodyA:bodyB:anchor:axis:", v11, v12, x, y, dx, dy);

  return (SKPhysicsJointSliding *)v15;
}

- (BOOL)shouldEnableLimits
{
  return self->_shouldEnableLimits;
}

- (void)setShouldEnableLimits:(BOOL)shouldEnableLimits
{
  self->_shouldEnableLimits = shouldEnableLimits;
}

- (CGFloat)lowerDistanceLimit
{
  return self->_lowerDistanceLimit;
}

- (void)setLowerDistanceLimit:(CGFloat)lowerDistanceLimit
{
  self->_lowerDistanceLimit = lowerDistanceLimit;
}

- (CGFloat)upperDistanceLimit
{
  return self->_upperDistanceLimit;
}

- (void)setUpperDistanceLimit:(CGFloat)upperDistanceLimit
{
  self->_upperDistanceLimit = upperDistanceLimit;
}

@end