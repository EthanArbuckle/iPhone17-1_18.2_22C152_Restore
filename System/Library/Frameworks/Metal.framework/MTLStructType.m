@interface MTLStructType
+ (MTLStructType)allocWithZone:(_NSZone *)a3;
- (MTLStructMember)memberByName:(NSString *)name;
@end

@implementation MTLStructType

+ (MTLStructType)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLStructType *)+[MTLStructType allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLStructType;
    return (MTLStructType *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLStructMember)memberByName:(NSString *)name
{
  return 0;
}

@end