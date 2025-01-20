@interface PKPhysicsJoint(SKPhysicsJoint)
+ (uint64_t)supportsSecureCoding;
- (uint64_t)isKindOfClass:()SKPhysicsJoint;
@end

@implementation PKPhysicsJoint(SKPhysicsJoint)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (uint64_t)isKindOfClass:()SKPhysicsJoint
{
  if (objc_opt_class() == a3) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&off_26BF22E00;
  return (uint64_t)objc_msgSendSuper2(&v6, sel_isKindOfClass_, a3);
}

@end