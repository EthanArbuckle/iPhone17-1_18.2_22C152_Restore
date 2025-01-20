@interface MTLIndirectArgumentDescriptor
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)indirectArgumentDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLIndirectArgumentDescriptor

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[MTLIndirectArgumentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLIndirectArgumentDescriptor;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)indirectArgumentDescriptor
{
  v2 = objc_alloc_init(MTLIndirectArgumentDescriptorInternal);

  return v2;
}

@end