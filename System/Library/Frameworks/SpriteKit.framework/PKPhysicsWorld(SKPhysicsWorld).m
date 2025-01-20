@interface PKPhysicsWorld(SKPhysicsWorld)
- (uint64_t)isKindOfClass:()SKPhysicsWorld;
@end

@implementation PKPhysicsWorld(SKPhysicsWorld)

- (uint64_t)isKindOfClass:()SKPhysicsWorld
{
  if (objc_opt_class() == a3) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&off_26BF235E8;
  return (uint64_t)objc_msgSendSuper2(&v6, sel_isKindOfClass_, a3);
}

@end