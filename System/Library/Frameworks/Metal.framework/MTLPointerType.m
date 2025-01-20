@interface MTLPointerType
+ (MTLPointerType)allocWithZone:(_NSZone *)a3;
- (MTLArrayType)elementArrayType;
- (MTLStructType)elementStructType;
@end

@implementation MTLPointerType

+ (MTLPointerType)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLPointerType *)+[MTLPointerType allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLPointerType;
    return (MTLPointerType *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLStructType)elementStructType
{
  return 0;
}

- (MTLArrayType)elementArrayType
{
  return 0;
}

@end