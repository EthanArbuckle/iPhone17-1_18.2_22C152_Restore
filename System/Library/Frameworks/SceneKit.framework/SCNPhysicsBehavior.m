@interface SCNPhysicsBehavior
+ (BOOL)supportsSecureCoding;
- (BOOL)hasReferenceToPhysicsBody:(id)a3;
- (SCNPhysicsBehavior)initWithCoder:(id)a3;
- (id)bodyA;
- (id)bodyB;
@end

@implementation SCNPhysicsBehavior

- (SCNPhysicsBehavior)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsBehavior;
  return [(SCNPhysicsBehavior *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)bodyA
{
  return 0;
}

- (id)bodyB
{
  return 0;
}

- (BOOL)hasReferenceToPhysicsBody:(id)a3
{
  return [(SCNPhysicsBehavior *)self bodyA] == a3 || [(SCNPhysicsBehavior *)self bodyB] == a3;
}

@end