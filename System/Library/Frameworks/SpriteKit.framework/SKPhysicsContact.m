@interface SKPhysicsContact
+ (SKPhysicsContact)allocWithZone:(_NSZone *)a3;
- (CGFloat)collisionImpulse;
- (CGPoint)contactPoint;
- (CGVector)contactNormal;
- (SKPhysicsBody)bodyA;
- (SKPhysicsBody)bodyB;
@end

@implementation SKPhysicsContact

+ (SKPhysicsContact)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsContact *)[MEMORY[0x263F5E4F8] allocWithZone:a3];
}

- (SKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (SKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (CGPoint)contactPoint
{
  double x = self->_contactPoint.x;
  double y = self->_contactPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGVector)contactNormal
{
  ddouble x = self->_contactNormal.dx;
  ddouble y = self->_contactNormal.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (CGFloat)collisionImpulse
{
  return self->_collisionImpulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);

  objc_storeStrong((id *)&self->_bodyA, 0);
}

@end