@interface MTLStructMember
+ (MTLStructMember)allocWithZone:(_NSZone *)a3;
- (MTLArrayType)arrayType;
- (MTLPointerType)pointerType;
- (MTLStructType)structType;
- (MTLTextureReferenceType)textureReferenceType;
- (id)indirectArgumentType;
@end

@implementation MTLStructMember

+ (MTLStructMember)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLStructMember *)+[MTLStructMember allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLStructMember;
    return (MTLStructMember *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLStructType)structType
{
  return 0;
}

- (MTLArrayType)arrayType
{
  return 0;
}

- (MTLTextureReferenceType)textureReferenceType
{
  return 0;
}

- (MTLPointerType)pointerType
{
  return 0;
}

- (id)indirectArgumentType
{
  return 0;
}

@end