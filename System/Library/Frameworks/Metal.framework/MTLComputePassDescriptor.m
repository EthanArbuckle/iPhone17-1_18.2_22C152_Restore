@interface MTLComputePassDescriptor
+ (MTLComputePassDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLComputePassDescriptor)computePassDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLComputePassDescriptor

+ (MTLComputePassDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLComputePassDescriptor *)+[MTLComputePassDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLComputePassDescriptor;
    return (MTLComputePassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLComputePassDescriptor)computePassDescriptor
{
  v2 = objc_alloc_init(MTLComputePassDescriptorInternal);

  return (MTLComputePassDescriptor *)v2;
}

@end