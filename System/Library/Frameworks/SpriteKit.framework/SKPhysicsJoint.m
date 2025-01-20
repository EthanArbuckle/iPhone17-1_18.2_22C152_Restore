@interface SKPhysicsJoint
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsJoint)allocWithZone:(_NSZone *)a3;
- (BOOL)_implicit;
- (CGFloat)reactionTorque;
- (CGVector)reactionForce;
- (SKPhysicsBody)bodyA;
- (SKPhysicsBody)bodyB;
- (SKPhysicsJoint)initWithCoder:(id)a3;
- (void)setBodyA:(SKPhysicsBody *)bodyA;
- (void)setBodyB:(SKPhysicsBody *)bodyB;
- (void)set_implicit:(BOOL)a3;
@end

@implementation SKPhysicsJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPhysicsJoint)initWithCoder:(id)a3
{
  return 0;
}

+ (SKPhysicsJoint)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsJoint *)[MEMORY[0x263F5E560] allocWithZone:a3];
}

- (SKPhysicsBody)bodyA
{
  return self->bodyA;
}

- (void)setBodyA:(SKPhysicsBody *)bodyA
{
}

- (SKPhysicsBody)bodyB
{
  return self->bodyB;
}

- (void)setBodyB:(SKPhysicsBody *)bodyB
{
}

- (CGVector)reactionForce
{
  double dx = self->reactionForce.dx;
  double dy = self->reactionForce.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (CGFloat)reactionTorque
{
  return self->reactionTorque;
}

- (BOOL)_implicit
{
  return self->__implicit;
}

- (void)set_implicit:(BOOL)a3
{
  self->__implicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bodyB, 0);

  objc_storeStrong((id *)&self->bodyA, 0);
}

@end