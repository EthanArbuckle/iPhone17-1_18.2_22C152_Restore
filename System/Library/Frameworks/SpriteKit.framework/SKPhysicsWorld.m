@interface SKPhysicsWorld
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsWorld)allocWithZone:(_NSZone *)a3;
- (BOOL)hasBodies;
- (BOOL)hasFields;
- (BOOL)stepWithTime:(double)a3 velocityIterations:(unint64_t)a4 positionIterations:(unint64_t)a5;
- (CGFloat)speed;
- (CGVector)gravity;
- (SKPhysicsBody)bodyAlongRayStart:(CGPoint)start end:(CGPoint)end;
- (SKPhysicsBody)bodyAtPoint:(CGPoint)point;
- (SKPhysicsBody)bodyInRect:(CGRect)rect;
- (SKPhysicsWorld)initWithCoder:(id)a3;
- (double)sampleFields:;
- (id)bodies;
- (id)contactDelegate;
- (id)fields;
- (vector_float3)sampleFieldsAt:(vector_float3)position;
- (void)setContactDelegate:(id)contactDelegate;
- (void)setGravity:(CGVector)gravity;
- (void)setSpeed:(CGFloat)speed;
@end

@implementation SKPhysicsWorld

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPhysicsWorld)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)stepWithTime:(double)a3 velocityIterations:(unint64_t)a4 positionIterations:(unint64_t)a5
{
  return 0;
}

- (BOOL)hasBodies
{
  return 0;
}

- (id)bodies
{
  return 0;
}

- (id)fields
{
  return 0;
}

- (BOOL)hasFields
{
  return 0;
}

- (SKPhysicsBody)bodyAtPoint:(CGPoint)point
{
  return 0;
}

- (SKPhysicsBody)bodyInRect:(CGRect)rect
{
  return 0;
}

- (SKPhysicsBody)bodyAlongRayStart:(CGPoint)start end:(CGPoint)end
{
  return 0;
}

+ (SKPhysicsWorld)allocWithZone:(_NSZone *)a3
{
  return (SKPhysicsWorld *)[MEMORY[0x263F5E590] allocWithZone:a3];
}

- (double)sampleFields:
{
  return 0.0;
}

- (vector_float3)sampleFieldsAt:(vector_float3)position
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (CGFloat)speed
{
  return self->speed;
}

- (void)setSpeed:(CGFloat)speed
{
  self->speed = speed;
}

- (CGVector)gravity
{
  double dx = self->_gravity.dx;
  double dy = self->_gravity.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (void)setGravity:(CGVector)gravity
{
  self->_gravity = gravity;
}

- (id)contactDelegate
{
  return self->_contactDelegate;
}

- (void)setContactDelegate:(id)contactDelegate
{
  self->_contactDelegate = (SKPhysicsContactDelegate *)contactDelegate;
}

@end