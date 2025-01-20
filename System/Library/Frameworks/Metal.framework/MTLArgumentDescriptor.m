@interface MTLArgumentDescriptor
+ (MTLArgumentDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLArgumentDescriptor)argumentDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLArgumentDescriptor

+ (MTLArgumentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLArgumentDescriptor *)+[MTLArgumentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLArgumentDescriptor;
    return (MTLArgumentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLArgumentDescriptor)argumentDescriptor
{
  v2 = objc_alloc_init(MTLArgumentDescriptorInternal);

  return (MTLArgumentDescriptor *)v2;
}

@end