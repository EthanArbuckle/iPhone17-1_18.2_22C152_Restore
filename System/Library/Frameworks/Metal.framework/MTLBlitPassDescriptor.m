@interface MTLBlitPassDescriptor
+ (MTLBlitPassDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLBlitPassDescriptor)blitPassDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLBlitPassDescriptor

+ (MTLBlitPassDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLBlitPassDescriptor *)+[MTLBlitPassDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLBlitPassDescriptor;
    return (MTLBlitPassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLBlitPassDescriptor)blitPassDescriptor
{
  v2 = objc_alloc_init(MTLBlitPassDescriptorInternal);

  return (MTLBlitPassDescriptor *)v2;
}

@end