@interface PKPhysicsBody(SKPhysicsBody)
- (__CFString)_descriptionClassName;
- (uint64_t)isKindOfClass:()SKPhysicsBody;
@end

@implementation PKPhysicsBody(SKPhysicsBody)

- (__CFString)_descriptionClassName
{
  return @"SKPhysicsBody";
}

- (uint64_t)isKindOfClass:()SKPhysicsBody
{
  if (objc_opt_class() == a3) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&off_26BF22918;
  return (uint64_t)objc_msgSendSuper2(&v6, sel_isKindOfClass_, a3);
}

@end